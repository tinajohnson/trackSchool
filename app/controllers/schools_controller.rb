class SchoolsController < InheritedResources::Base

  private

    def school_params
      params.require(:school).permit(:name, :string, :location, :contact, :admin)
    end

    def index
    end
end

