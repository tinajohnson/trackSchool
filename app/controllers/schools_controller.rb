class SchoolsController < InheritedResources::Base

  private

    def school_params
      params.require(:school).permit(:school_name, :string, :school_location, :school_contact, :school_admin)
    end
end

