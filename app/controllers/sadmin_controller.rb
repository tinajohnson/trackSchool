class SadminController < ApplicationController
  def index
    render template: "sadmin/index"
  end
end