blog_basic
=======

blog_basic is a fork of the rails plugin BlogKit (https://github.com/ryanstout/blog_kit)

It aims to be a gem which provides a simple and generic blogging service for people to run on their website.
It is made as easy as possible to deploy, and requires no external intregration to work.

Features
========

Blog_basic is a rails plugin to add a blog to your application.  The goal is to provide common blog
functionality that integrates into your existing app while keeping things simple.

BlogKitty has the following features.

+ Admin for Blog Articles
+ Search engine friendly urls
+ Comments
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

blog_basic has been written for Rails 3.2 and later.

Customization
=============

Be sure to edit config/blog_kit.yml, many common settings can be changed there.

Code Highlighting Example
=========================

To get code highlighted, place the following tag:

    <code lang="ruby">

    </code>

You can find a list of languages (syntaxes) under doc/SYNTAXES and a list of themes (colors) under
doc/THEMES


Copyright (c) 2010 Ryan Stout, released under the MIT license
Copyright (c) 2012 Arvid Boettiger, still released under the MIT license :)
