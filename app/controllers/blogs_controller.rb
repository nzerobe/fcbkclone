class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]

 
  def index
    @blogs = Blog.all
  end

  def show
      @blogs = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blogs = Blog.find(params[:id])
  end

  
   def create
    @blog = Blog.new(blog_params)
    @blog.image.retrieve_from_cache! params[:cache][:image] 
    # @blog.user_id = current_user.id
    
    if @blog.save
      # Switch to the list screen and display a message saying "You have created new blog!"
#       RobMailer.blog_mail(@blog).deliver
      redirect_to blogs_path, Notice: "You have created new blog!"
    else
      # Redraw the input form.
      render 'new'
    end
  end
  
  
  
  
  
  
  
  
  
  
  def confirm
    @blog = current_user.blogs.build(blog_params)
     render :new if @blog.invalid?
   end
  
  
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
  def set_blog
      @blog = Blog.find(params[:id])
  end

    
  def blog_params
      
      params.require(:blog).permit(:title, :content, :image).merge(user: current_user)
  end
  
end

