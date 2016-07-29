class ClassMappingsController < ApplicationController
  before_action :set_class_mapping, only: [:show, :edit, :update, :destroy]

  # GET /class_mappings
  # GET /class_mappings.json
  def index
    s_id = Allotment.where(user_id: current_user.id).pluck(:school_id)
    @class_mappings = ClassMapping.includes(:standard, :section).where(school_id: s_id)
    class_mappings = @class_mappings.map  do |c|
      { id:c.id, standard: c.standard.name, section: c.section.name, school: s_id}
    end
    render component: 'ClassMappings', props: { class_mappings: class_mappings}
  end

  # GET /class_mappings/1
  # GET /class_mappings/1.json
  def show
  end

  # GET /class_mappings/new
  def new
    @class_mapping = ClassMapping.new
  end

  # GET /class_mappings/1/edit
  def edit
  end

  # POST /class_mappings
  # POST /class_mappings.json
  def create
    s_id = Allotment.where(user_id: current_user.id).pluck(:school_id).first
    standard_id = Standard.where(name: params[:class_mapping][:standard]).pluck(:id).first

    section_id = Section.where(name: params[:class_mapping][:section]).pluck(:id).first
    @classes = ClassMapping.new({:section_id => section_id, :standard_id => standard_id, :school_id => s_id})
    @saved_class = { id:@classes.id, standard: params[:class_mapping][:standard], section: params[:class_mapping][:section], school: s_id}
    if @classes.save
      render :json => @saved_class
    end
  end

  # PATCH/PUT /class_mappings/1
  # PATCH/PUT /class_mappings/1.json
  def update
    respond_to do |format|
      if @class_mapping.update(class_mapping_params)
        format.html { redirect_to @class_mapping, notice: 'Class mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_mapping }
      else
        format.html { render :edit }
        format.json { render json: @class_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_mappings/1
  # DELETE /class_mappings/1.json
  def destroy
    @class_mapping.destroy
    respond_to do |format|
      format.html { redirect_to class_mappings_url, notice: 'Class mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_mapping
      @class_mapping = ClassMapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def class_mapping_params
      params.require(:class_mapping).permit(:standard_id, :section_id, :school_id)
    end
end
