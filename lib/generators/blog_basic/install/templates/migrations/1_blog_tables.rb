class BlogTables < ActiveRecord::Migration

  def up
    create_table "blog_basic_blog_comments", :force => true do |t|
      t.integer  "blog_post_id"
      t.integer  "user_id"
      t.string   "user_ip"
      t.string   "user_agent"
      t.string   "referrer"
      t.string   "name"
      t.string   "site_url"
      t.string   "email"
      t.text     "body"
      t.datetime "created_at"
    end

    add_index "blog_basic_blog_comments", ["blog_post_id"], :name => "index_blog_comments_on_blog_post_id"

    create_table "blog_basic_blog_contents", :force => true do |t|
      t.string   "title"
      t.text     "content"
      t.integer  "blog_post_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "blog_basic_blog_images", :force => true do |t|
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.integer  "blog_post_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "blog_basic_blog_images", ["blog_post_id"], :name => "index_blog_images_on_blog_post_id"

    create_table "blog_basic_blog_posts", :force => true do |t|
      t.string   "title",                       :null => false
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
      t.datetime "published_at"
      t.integer  "published",    :default => 0, :null => false
      t.integer  "parent_id"
    end

    create_table "blog_basic_sessions", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "taggings", :force => true do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.integer  "tagger_id"
      t.string   "tagger_type"
      t.string   "context"
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
    add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

    create_table "tags", :force => true do |t|
      t.string "name"
    end

  end

  def down
  end
end
