class StandardsController < InheritedResources::Base

  private

    def standard_params
      params.require(:standard).permit(:name)
    end
end

