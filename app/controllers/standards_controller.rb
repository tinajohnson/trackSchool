class StandardsController < InheritedResources::Base

  private

    def standard_params
      params.require(:standard).permit(:standard_name, :string)
    end
end

