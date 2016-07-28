class SectionsController < InheritedResources::Base
  def index
    @sections = Section.all
    render component: 'Sections', props: { sections: @sections }
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      render :json => @section
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      render :json => @section
    end
  end


  def destroy
    Section.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

    def section_params
      params.require(:section).permit(:name)
    end
end

