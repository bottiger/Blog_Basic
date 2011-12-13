module BlogBasic
  class TagsController < AppController
  layout 'application'

    def show
      @blog_posts = BlogPost.published.tagged_with(params[:id]).paginate(:page => params[:page], :per_page => 5)
      render :template => 'blog_basic/blog_posts/index', :layout => true
    end
   
  end
end
