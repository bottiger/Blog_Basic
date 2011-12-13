# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "blog_basic"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arvid Boettiger"]
  s.date = "2011-12-13"
  s.description = "Sets up a basic but functional blogging platform."
  s.email = "bottiger@gmail.com"
  s.extra_rdoc_files = ["README.md", "lib/akismetor.rb", "lib/blog_basic.rb", "lib/blog_basic/blog_basic_model_helper.rb", "lib/blog_basic/blog_conf.rb", "lib/blog_basic/engine.rb", "lib/blog_basic/engine.rb.backup", "lib/generators/blog_basic/create_assets/blog_assets_generator.rb", "lib/generators/blog_basic/create_assets/templates/blog_comments_migration.rb", "lib/generators/blog_basic/create_assets/templates/blog_images_migration.rb", "lib/generators/blog_basic/create_assets/templates/blog_posts_migration.rb", "lib/generators/blog_basic/create_assets/templates/config/blog_basic.yml", "lib/generators/blog_basic/create_assets/templates/syntax/active4d.css", "lib/generators/blog_basic/create_assets/templates/syntax/all_hallows_eve.css", "lib/generators/blog_basic/create_assets/templates/syntax/amy.css", "lib/generators/blog_basic/create_assets/templates/syntax/blackboard.css", "lib/generators/blog_basic/create_assets/templates/syntax/brilliance_black.css", "lib/generators/blog_basic/create_assets/templates/syntax/brilliance_dull.css", "lib/generators/blog_basic/create_assets/templates/syntax/cobalt.css", "lib/generators/blog_basic/create_assets/templates/syntax/dawn.css", "lib/generators/blog_basic/create_assets/templates/syntax/eiffel.css", "lib/generators/blog_basic/create_assets/templates/syntax/espresso_libre.css", "lib/generators/blog_basic/create_assets/templates/syntax/idle.css", "lib/generators/blog_basic/create_assets/templates/syntax/iplastic.css", "lib/generators/blog_basic/create_assets/templates/syntax/lazy.css", "lib/generators/blog_basic/create_assets/templates/syntax/mac_classic.css", "lib/generators/blog_basic/create_assets/templates/syntax/magicwb_amiga.css", "lib/generators/blog_basic/create_assets/templates/syntax/pastels_on_dark.css", "lib/generators/blog_basic/create_assets/templates/syntax/slush_poppies.css", "lib/generators/blog_basic/create_assets/templates/syntax/spacecadet.css", "lib/generators/blog_basic/create_assets/templates/syntax/sunburst.css", "lib/generators/blog_basic/create_assets/templates/syntax/twilight.css", "lib/generators/blog_basic/create_assets/templates/syntax/zenburnesque.css", "lib/generators/blog_basic/install/install_generator.rb", "lib/generators/blog_basic/install/templates/blog_basic.yml", "lib/generators/blog_basic/install/templates/blog_kit.css", "lib/generators/blog_basic/install/templates/migrations/1_blog_tables.rb", "lib/generators/blog_basic/install/templates/omniauth.rb.erb", "lib/tasks/blog_basic_tasks.rake", "lib/url_validator.rb"]
  s.files = ["Gemfile", "MIT-LICENSE", "Manifest", "README.md", "Rakefile", "app/controllers/blog_basic/app_controller.rb", "app/controllers/blog_basic/application_controller.rb", "app/controllers/blog_basic/blog_comments_controller.rb", "app/controllers/blog_basic/blog_posts_controller.rb", "app/controllers/blog_basic/sessions_controller.rb", "app/controllers/blog_basic/tags_controller.rb", "app/helpers/blog_basic/application_helper.rb", "app/helpers/blog_basic/blog_posts_helper.rb", "app/helpers/blog_basic/shared_helper.rb", "app/helpers/blog_basic/tags_helper.rb", "app/models/blog_basic/blog_comment.rb", "app/models/blog_basic/blog_content.rb", "app/models/blog_basic/blog_image.rb", "app/models/blog_basic/blog_post.rb", "app/models/blog_basic/session.rb", "app/models/blog_basic/user.rb", "app/views/blog_basic/blog_comments/_new_blog_comment.html.erb", "app/views/blog_basic/blog_posts/_admin_links.html.erb", "app/views/blog_basic/blog_posts/_blog_post.html.erb", "app/views/blog_basic/blog_posts/_comment.html.erb", "app/views/blog_basic/blog_posts/_comments.html.erb", "app/views/blog_basic/blog_posts/_form.html.erb", "app/views/blog_basic/blog_posts/_image.html.erb", "app/views/blog_basic/blog_posts/drafts.html.erb", "app/views/blog_basic/blog_posts/edit.html.erb", "app/views/blog_basic/blog_posts/index.atom.builder", "app/views/blog_basic/blog_posts/index.html.erb", "app/views/blog_basic/blog_posts/new.html.erb", "app/views/blog_basic/blog_posts/show.html.erb", "app/views/blog_basic/shared/_footer.html.erb", "app/views/blog_basic/shared/_index_top.html.erb", "app/views/blog_basic/shared/_topbar.html.erb", "app/views/layouts/application.html.erb", "blog_basic.gemspec", "config/routes.rb", "db/migrate/1_blog_tables.rb", "init.rb", "lib/akismetor.rb", "lib/blog_basic.rb", "lib/blog_basic/blog_basic_model_helper.rb", "lib/blog_basic/blog_conf.rb", "lib/blog_basic/engine.rb", "lib/blog_basic/engine.rb.backup", "lib/generators/blog_basic/create_assets/blog_assets_generator.rb", "lib/generators/blog_basic/create_assets/templates/blog_comments_migration.rb", "lib/generators/blog_basic/create_assets/templates/blog_images_migration.rb", "lib/generators/blog_basic/create_assets/templates/blog_posts_migration.rb", "lib/generators/blog_basic/create_assets/templates/config/blog_basic.yml", "lib/generators/blog_basic/create_assets/templates/syntax/active4d.css", "lib/generators/blog_basic/create_assets/templates/syntax/all_hallows_eve.css", "lib/generators/blog_basic/create_assets/templates/syntax/amy.css", "lib/generators/blog_basic/create_assets/templates/syntax/blackboard.css", "lib/generators/blog_basic/create_assets/templates/syntax/brilliance_black.css", "lib/generators/blog_basic/create_assets/templates/syntax/brilliance_dull.css", "lib/generators/blog_basic/create_assets/templates/syntax/cobalt.css", "lib/generators/blog_basic/create_assets/templates/syntax/dawn.css", "lib/generators/blog_basic/create_assets/templates/syntax/eiffel.css", "lib/generators/blog_basic/create_assets/templates/syntax/espresso_libre.css", "lib/generators/blog_basic/create_assets/templates/syntax/idle.css", "lib/generators/blog_basic/create_assets/templates/syntax/iplastic.css", "lib/generators/blog_basic/create_assets/templates/syntax/lazy.css", "lib/generators/blog_basic/create_assets/templates/syntax/mac_classic.css", "lib/generators/blog_basic/create_assets/templates/syntax/magicwb_amiga.css", "lib/generators/blog_basic/create_assets/templates/syntax/pastels_on_dark.css", "lib/generators/blog_basic/create_assets/templates/syntax/slush_poppies.css", "lib/generators/blog_basic/create_assets/templates/syntax/spacecadet.css", "lib/generators/blog_basic/create_assets/templates/syntax/sunburst.css", "lib/generators/blog_basic/create_assets/templates/syntax/twilight.css", "lib/generators/blog_basic/create_assets/templates/syntax/zenburnesque.css", "lib/generators/blog_basic/install/install_generator.rb", "lib/generators/blog_basic/install/templates/blog_basic.yml", "lib/generators/blog_basic/install/templates/blog_kit.css", "lib/generators/blog_basic/install/templates/migrations/1_blog_tables.rb", "lib/generators/blog_basic/install/templates/omniauth.rb.erb", "lib/tasks/blog_basic_tasks.rake", "lib/url_validator.rb", "test/database.yml", "test/functional/blog_assets_generator_test.rb", "test/functional/blog_comments_controller_test.rb", "test/functional/blog_posts_controller_test.rb", "test/schema.rb", "test/test_helper.rb", "uninstall.rb"]
  s.homepage = "http://bottiger.org/made/blog_basic"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Blog_basic", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "blog_basic"
  s.rubygems_version = "1.8.10"
  s.summary = "Sets up a basic but functional blogging platform."
  s.test_files = ["test/test_helper.rb", "test/functional/blog_posts_controller_test.rb", "test/functional/blog_assets_generator_test.rb", "test/functional/blog_comments_controller_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bluecloth>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 3.0.1"])
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3"])
      s.add_runtime_dependency(%q<activeadmin>, [">= 0"])
      s.add_runtime_dependency(%q<acts-as-taggable-on>, ["~> 2.1.1"])
      s.add_runtime_dependency(%q<omniauth>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<omniauth-openid>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<omniauth-github>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<bluecloth>, ["~> 2.2.0"])
      s.add_dependency(%q<will_paginate>, [">= 3.0.1"])
      s.add_dependency(%q<paperclip>, [">= 2.3"])
      s.add_dependency(%q<activeadmin>, [">= 0"])
      s.add_dependency(%q<acts-as-taggable-on>, ["~> 2.1.1"])
      s.add_dependency(%q<omniauth>, ["~> 1.0.0"])
      s.add_dependency(%q<omniauth-openid>, ["~> 1.0.0"])
      s.add_dependency(%q<omniauth-github>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<bluecloth>, ["~> 2.2.0"])
    s.add_dependency(%q<will_paginate>, [">= 3.0.1"])
    s.add_dependency(%q<paperclip>, [">= 2.3"])
    s.add_dependency(%q<activeadmin>, [">= 0"])
    s.add_dependency(%q<acts-as-taggable-on>, ["~> 2.1.1"])
    s.add_dependency(%q<omniauth>, ["~> 1.0.0"])
    s.add_dependency(%q<omniauth-openid>, ["~> 1.0.0"])
    s.add_dependency(%q<omniauth-github>, ["~> 1.0.0"])
  end
end
