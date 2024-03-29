module BlogBasic
  class BlogPostsController < AppController
    unloadable

    helper :all #blog, shared

    layout :choose_layout

    before_filter :require_full_url, :only => [:show]
    before_filter :require_user, :except => [:index, :show]
    before_filter :require_admin, :except => [:index, :show]
    before_filter :setup_image_template, :only => [:new, :edit, :create, :update]

    def index
      @blog_posts = BlogPost.published.paginate(:page => params[:page], :per_page => 5)
      @index_title = BlogConf.data['blog_name'] || 'Blog'
      @ads = false

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @blog_posts }
        format.atom 
      end
    end

    def drafts
      @blog_posts = BlogPost.drafts.paginate(:page => params[:page], :order => 'updated_at DESC')

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @blog_posts }
      end
    end

    def show
      logger.debug "(Show)ing blog post id: " + params[:id].to_s
      @blog_post = BlogPost.find(params[:id])

      unless @blog_post.published == 1
        return unless require_admin
      end
      @blog_comment = @blog_post.blog_comments.new
      @blog_comments = @blog_post.blog_comments.paginate(:page => params[:page], :order => 'created_at DESC')
      @ads = true
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @blog_post }
      end
    end

    def new
      @blog_post = BlogPost.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @blog_post }
      end
    end

    def edit
      @blog_post = BlogPost.find(params[:id])
    end

    def create
      @blog_post = BlogPost.new(params[:blog_post])

      logger.debug "blog_post controller (create) - FIXME"
      @blog_post.user_id = 1 #current_user.id
      logger.debug "value: #{params[:blog_post][:published]}"
      @blog_post.published_at = Time.now if params[:blog_post][:published].to_i > 0 && @blog_post.published_at.nil?

      respond_to do |format|
        if @blog_post.save
          flash[:notice] = 'BlogPost was successfully created.'
          format.html { redirect_to(@blog_post) }
          format.xml  { render :xml => @blog_post, :status => :created, :location => @blog_post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @blog_post.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @blog_post = BlogPost.find(params[:id])

      blog_log = BlogContent.create()
      blog_log.title = @blog_post.title
      blog_log.content = @blog_post.body
      blog_log.blog_post_id = params[:id]
      blog_log.save

      respond_to do |format|
        @blog_post.published_at = Time.now if params[:blog_post][:published].to_i > 0 && @blog_post.published_at.nil?
        if @blog_post.update_attributes(params[:blog_post])
          flash[:notice] = 'BlogPost was successfully updated.'
          format.html { redirect_to(@blog_post) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @blog_post.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @blog_post = BlogPost.find(params[:id])
      #@blog_post.destroy

      flash[:notice] = 'The blog post has been deleted'

      respond_to do |format|
        format.html { redirect_to(blog_posts_url) }
        format.xml  { head :ok }
      end
    end

    private
    def require_full_url
      if params[:id].to_i.to_s == params[:id]
        redirect_to BlogPost.find(params[:id]), :status => 301
        return true
      end

      return false
    end

    def require_admin
      if !signed_in?
        flash[:notice] = 'You must be an admin to view this page'
        redirect_to blog_posts_path
        return false
      end

      return true
    end

    def choose_layout
      if ['new', 'edit', 'create', 'update'].include?(params[:action])
        BlogConf.data['admin_layout'] || 'application'
      else
        BlogConf.data['layout'] || 'application'
      end
    end

    def setup_image_template
      @empty_blog_post = BlogPost.new
      @empty_blog_post.blog_images.build
    end
  end
end
