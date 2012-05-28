blog_basic
=======

blog_basic is a fork of the rails plugin BlogKit (https://github.com/ryanstout/blog_kit)

blog_basic
========

Blog_basic is a rails plugin to add a blog to your application.  The goal is to provide common blog
functionality that integrates into your existing app while keeping things simple.

BlogKitty has the following features.

+ Admin for Blog Articles
+ Search engine friendly urls
+ Uses existing user model
+ Comments via existing user model
+ Uses your existing layouts
+ Easily customizable css
+ Akismet (spam filtering) Support
+ Markdown (default) or just plain html parsing
+ Image and Gravatar support
+ Anonymous Comments (optional)
+ Atom Feeds
+ Tags
+ Image upload (via paperclip, or something that adds has_attached_file to models)

Status
======

Blog_basic is currently fully working. However, it still needs to mature quite a bit. The testing is lacking, 
there is still a lot of code cleaning to do, configuration should be improved etc.

Futhermore I need to get some feedback from people actually using it. Currently I'm just scratching my own itch, but would love to
hear what other people want from a blogging system.

Install for Rails3
==================

Add blog_basic to your Gemfile

    gem 'blog_basic'

then run "bundle install" to make sure you are up to date. Install blog_basic my running the generator blog_basic:install

   rails g blog_basic:install

and migrate your database

   rake db:migrate

edit the following file, and add your github application keys

   config/initializers/blog_omniauth.rb

Now adjust config/routes.rb for your desired path and config/blog_basic.yml for the rest of the configuration

Assumptions
===========

Blog_basic makes the following assumptions

+ flash messages displaying is handled via the layout


Setup
=====

Blog_baisc tries to be as unintrusive as possible with regards to your current authentication system.

In the future it will integrate with your existing user model, but currently it only uses your github account to
authenticate thus eliminating the use of a User model, and makes the authentication process as simple as possible.

Requirements
============

Rails 3.x

- Will_Paginate

Optional:

- Ultraviolet (and its deps, for code highlighting)

    Install Oniguruma if 1.8.x
    http://www.geocities.jp/kosako3/oniguruma/
    
    source 'http://gems.github.com'
    gem "spox-ultraviolet", :require => false
    
- BlueCloth 2 (for markdown)

    gem 'bluecloth'

- Paperclip

    gem 'paperclip', :git => 'http://github.com/thoughtbot/paperclip.git', :branch => 'rails3'

Customization
=============

Be sure to edit config/blog_kit.yml, many common settings can be changed there.

** View Customization **

BlogKit is built as a rails engine plugin (for rails 2.3.x, not the previous engines plugin).  You can see
the models, views, and controllers in vendor/plugins/blog_kit/app/  You can change them by copying any of 
them into your apps /app directory.  Rails will look in /app before looking in vendor/plugins/blog_kit/app/
Once they are copied into /app, you can customize the appearance/behavior of the blog pages.

Troubleshooting
===============

Q. Creating a blog post does not work, it instead renders the index page.
A. Make sure you aren't using the old style default routes in rails (match '/:controller(/:action(/:id))')
   If you are using default routes, then simply copy the following into your routes.rb file before the default route

  	resources :blog_posts do
		resources :blog_comments
		resources :blog_images
		
		collection do
			get :drafts
		end
		
		member do
			get :tag
		end
	end

Tag List
========

By default, the layout does not display a list of all tags.  This can be easily added to any layout in the 
application by including this in the controller:

    helper :blog

Then in the view:

    <%= blog_tags_list %>
    
You can optionally pass in a limit on the number of tags to show.

Also keep in mind that you can specify a layout just for the blog kit pages.

Titles
======

You can have blog_kit set the page title, just create a method in application_helper like:

    def title(ttl)
        @page_title = ttl
    end

If anyone knows of a better convention for this, let me know.  This is what nifty_generators uses

Code Highlighting Example
=========================

To get code highlighted, place the following tag:

    <code lang="ruby">

    </code>

You can find a list of languages (syntaxes) under doc/SYNTAXES and a list of themes (colors) under
doc/THEMES


Copyright (c) 2010 Ryan Stout, released under the MIT license
