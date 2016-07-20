class SectionsController < InheritedResources::Base

  private

    def section_params
      params.require(:section).permit(:section_name, :string)
    end
end

