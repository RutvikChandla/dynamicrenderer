class DynamicTemplatesController < ApplicationController
  before_action :set_dynamic_template, only: %i[ show edit update destroy ]

  # GET /dynamic_templates or /dynamic_templates.json
  def index
    @dynamic_templates = DynamicTemplate.all
  end

  # GET /dynamic_templates/1 or /dynamic_templates/1.json
  def show
  end

  # GET /dynamic_templates/new
  def new
    @dynamic_template = DynamicTemplate.new
  end

  # GET /dynamic_templates/1/edit
  def edit
  end

  # POST /dynamic_templates or /dynamic_templates.json
  def create
    @dynamic_template = DynamicTemplate.new(dynamic_template_params)

    respond_to do |format|
      if @dynamic_template.save
        format.html { redirect_to dynamic_template_url(@dynamic_template), notice: "Dynamic template was successfully created." }
        format.json { render :show, status: :created, location: @dynamic_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dynamic_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dynamic_templates/1 or /dynamic_templates/1.json
  def update
    respond_to do |format|
      if @dynamic_template.update(dynamic_template_params)
        format.html { redirect_to dynamic_template_url(@dynamic_template), notice: "Dynamic template was successfully updated." }
        format.json { render :show, status: :ok, location: @dynamic_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dynamic_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dynamic_templates/1 or /dynamic_templates/1.json
  def destroy
    @dynamic_template.destroy!

    respond_to do |format|
      format.html { redirect_to dynamic_templates_url, notice: "Dynamic template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dynamic_template
      @dynamic_template = DynamicTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dynamic_template_params
      params.require(:dynamic_template).permit(:body, :path, :format, :locale, :handler, :partial)
    end
end
