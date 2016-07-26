class StandardsController < InheritedResources::Base

  def index
    @standards = Standard.all
    render component: 'Standards', props: { standards: @standards }
  end

  private

    def standard_params
      params.require(:standard).permit(:standard_name, :string)
    end

end

