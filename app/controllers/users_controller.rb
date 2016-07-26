class UsersController < InheritedResources::Base

  def teacher
    render 'teachers/index'
  end

end
