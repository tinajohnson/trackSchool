class TeachersController < InheritedResources::Base

  def index
    render 'teachers/index'
  end

end