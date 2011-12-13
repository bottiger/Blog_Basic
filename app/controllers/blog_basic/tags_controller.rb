module BlogBasic
  class TagsController < AppController

    def show
      @blog_posts = BlogPost.published.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
      render :template => 'blog_basic/blog_posts/index'
    end
   
  end
end
