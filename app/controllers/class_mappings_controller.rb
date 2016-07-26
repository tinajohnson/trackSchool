class ClassMappingsController < ApplicationController
  before_action :set_class_mapping, only: [:show, :edit, :update, :destroy]

  # GET /class_mappings
  # GET /class_mappings.json
  def index
    @class_mappings = ClassMapping.all
  end
  
   def find_mapping_id
         std = params["standard"]
         sec = params["section"]

         @mapping_id = 0

    std_id = Standard.find_by_standard_name(std)
    sec_id = Section.find_by_section_name(sec)


         c_map = ClassMapping.all
         c_map.each do |c_map|
             if (c_map.standard_id == std_id.id && c_map.section_id == sec_id.id)
                @mapping_id = c_map.id
             end
         end

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
    @class_mapping = ClassMapping.new(class_mapping_params)

    respond_to do |format|
      if @class_mapping.save
        format.html { redirect_to @class_mapping, notice: 'Class mapping was successfully created.' }
        format.json { render :show, status: :created, location: @class_mapping }
      else
        format.html { render :new }
        format.json { render json: @class_mapping.errors, status: :unprocessable_entity }
      end
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
