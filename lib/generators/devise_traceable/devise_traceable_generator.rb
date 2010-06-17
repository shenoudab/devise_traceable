require 'rails/generators/migration'

class DeviseTraceableGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  desc "Generates a model with the given NAME (if one does not exist) with devise " <<
    "configuration plus a migration file and devise routes."

  def self.source_root
    @_devise_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.orm_has_migration?
    Rails::Generators.options[:rails][:orm] == :active_record
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  class_option :orm
  class_option :migration, :type => :boolean, :default => orm_has_migration?

  def invoke_orm_model
    if model_exists?
      say "* Model already exists."
    elsif options[:orm].present?
      invoke "model", ["#{name}Tracing"], :migration => false, :orm => options[:orm]

      unless model_exists?
        abort "Tried to invoke the model generator for '#{options[:orm]}' but could not find it.\n" <<
          "Please create your model by hand before calling `rails g devise_traceable #{name}`."
      end
    else
      abort "Cannot create a devise model because config.generators.orm is blank.\n" <<
        "Please create your model by hand or configure your generators orm before calling `rails g devise_traceable #{name}`."
    end
  end

  def create_migration_file
    migration_template 'migration.rb', "db/migrate/devise_create_#{name.downcase}_tracings.rb"
  end

  protected

  def model_exists?
    File.exists?(File.join(destination_root, model_path))
  end

  def model_path
    @model_path ||= File.join("app", "models", "#{file_path}.rb")
  end
end
