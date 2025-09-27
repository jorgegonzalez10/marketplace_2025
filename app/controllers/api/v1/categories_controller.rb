class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: serialized(@categories, CategorySerializer), status: 200 
  end
end
