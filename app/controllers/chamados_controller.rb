class ChamadosController < ApplicationController
  # GET /chamados
  # GET /chamados.json
  def index
    @chamados = Chamado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chamados }
    end
  end

  #Metodo para tratamento da visualização de buscas por usuario
  def busca_usuario
    if params.has_key?("tipo") && params.has_key?("id")
      #Padroniza o tipo recebido
      tipo_padrao = params[:tipo].downcase
      tipo_padrao[0] = tipo_padrao[0].capitalize
      tipo = Chamado::CHAMADO_OPTIONS[tipo_padrao]

      @chamados = Chamado.find_all_by_idsolicitante_and_tipochamado(params[:id],tipo)

    elsif params.has_key?("id")
      @chamados = Chamado.find_all_by_idsolicitante(params[:id])
    elsif params.has_key?("tipo")

      #Padroniza o tipo recebido
      tipo_padrao = params[:tipo].downcase
      tipo_padrao[0] = tipo_padrao[0].capitalize
      tipo = Chamado::CHAMADO_OPTIONS[tipo_padrao]

      @chamados = Chamado.find_all_by_tipochamado(tipo)
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @chamados }
    end
  end

  # GET /chamados/1
  # GET /chamados/1.json
  def show
    @chamado = Chamado.find(params[:id])

    #Traduz o tipo do chamado e seu status para string
    tipo = Chamado::CHAMADO_OPTIONS.invert[@chamado.tipochamado]
    status = Chamado::STATUS_OPTIONS.invert[@chamado.status]

    #Serializa o chamado
    chamado = @chamado.as_json(:except => [:tipochamado, :status])
    dtipo = { :tipochamado => tipo, :status => status }.as_json
    chamado = dtipo.merge(chamado)

    #Encontra o historico do chamado
    @audits = Audit.find_all_by_idchamado(params[:id])
    #Transforma o historico em json
    historico = @audits.as_json(:except => [:updated_at, :idchamado, :id])
  

    #Converte os valores armazenados no banco para os correspondentes nomes em
    #linguagem humana
    @audits.each do |h|
      if h.mudancas.has_key?("status")
        h.mudancas["status"].map!{ |j| Chamado::STATUS_OPTIONS.invert[j] }
      elsif h.mudancas.has_key?("tipochamado")
        h.mudancas["tipochamado"].map!{ |j| Chamado::CHAMADO_OPTIONS.invert[j] }
      end

    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { :chamado => chamado, :alteracoes => historico}}
    end
  end

  # GET /chamados/new
  # GET /chamados/new.json
  def new
    @chamado = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chamado }
    end
  end

  # GET /chamados/1/edit
  def edit
    @chamado = Chamado.find(params[:id])
  end

  # POST /chamados
  # POST /chamados.json
  def create
    @chamado = Chamado.new(params[:chamado])

    respond_to do |format|
      if @chamado.save
        #fmt = '/chamados/%s.json'
        #response = fmt % [@chamado.id]
        format.html { redirect_to @chamado, notice: 'Chamado was successfully created.' }
        format.html { render json: @chamado, status: :created, location: @chamado }
      else
        format.html { render action: "new" }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.json
  def update
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      if @chamado.update_attributes(params[:chamado])
        #Cria historico
        Audit.create(:idchamado => @chamado.id, :tipousuario => 1, :mudancas => @chamado.tracked_changes)
        
        format.html { redirect_to @chamado, notice: 'Chamado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.json
  def destroy
    @chamado = Chamado.find(params[:id])
    @chamado.destroy

    #Deleta o historico
    @audits = Audit.find_all_by_idchamado(params[:id])

    @audits.each do |a|
      a.destroy
    end

    respond_to do |format|
      format.html { redirect_to chamados_url }
      format.json { head :no_content }
    end
  end
end
