# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_24_121037) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'gender_id'
    t.index %w[gender_id], name: 'index_categories_on_gender_id'
  end

  create_table 'genders', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scraper_field_images', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scraper_field_links', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scraper_field_prices', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scraper_field_texts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scraper_fields', force: :cascade do |t|
    t.string 'name'
    t.string 'selector'
    t.string 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'scraper_id'
    t.index %w[scraper_id], name: 'index_scraper_fields_on_scraper_id'
  end

  create_table 'scrapers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'container_selector'
    t.integer 'website_id'
    t.index %w[website_id], name: 'index_scrapers_on_website_id'
  end

  create_table 'website_pages', force: :cascade do |t|
    t.string 'url_extension'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'website_id'
    t.integer 'category_id'
    t.index %w[category_id], name: 'index_website_pages_on_category_id'
    t.index %w[website_id], name: 'index_website_pages_on_website_id'
  end

  create_table 'websites', force: :cascade do |t|
    t.string 'name'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'query_string_key_page'
    t.string 'query_string_key_search'
  end
end
