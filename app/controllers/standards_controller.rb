class StandardsController < InheritedResources::Base

  def index
    @standards = Standard.all
    render component: 'Standards', props: { standards: @standards }
  end

  def create
    @standard = Standard.new(standard_params)
    if @standard.save
          render :json => @standard
    end
  end

  def update
    @standard = Standard.find(params[:id])
        if @standard.update(standard_params)
          render :json => @standard
        end
  end


  def destroy
    Standard.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

    def standard_params
      params.require(:standard).permit(:name, :id)
    end

end

