class SectionsController < InheritedResources::Base

  private

    def section_params
      params.require(:section).permit(:name)
    end
end

