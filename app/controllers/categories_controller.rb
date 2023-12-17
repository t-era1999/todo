class CategoriesController < AuthController

  def new
    @category = current_user.categories.build
  end
  
end