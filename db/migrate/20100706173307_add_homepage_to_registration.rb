class AddHomepageToRegistration < ActiveRecord::Migration
  def self.up
    add_column "registrations", "homepage", :string
  end

  def self.down
    remove_column "registrations", "homepage"
  end
end
