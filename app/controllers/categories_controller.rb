class CategoriesController < ApplicationController
  def index
  #  @categories = Category.paginate(page: params[:page], per_page: 5)
   @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render :action => :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render :action => :edit
    end
  end
  
  def show
    @category = Category.find(params[:id])
  #  @category_posts = @category.posts.paginate(page: params[:page], per_page: 5)
    @category_posts = @category.posts.all
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
