# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)




puts "Seed Data here!"
#require 'open-uri'
#require 'active_record/fixtures'

#["Windows", "Linux", "Mac OS X"].each do |os|
#  OperationSystem.find_or_create_by_name(os)
#end

#Country.delete_all
#open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
#  countries.read.each_line do |country|
#    code, name = country.chomp.split("|")
#    Country.create!(:name => name, :code => code)
#  end
#end

@admin = User.create(:email => "charliechu@techbang.com.tw", :password => "123456", :created_at => "2011-06-17 01:59:27")
@admin.is_admin = true
@admin.save

@user = User.create(:email => "1949@cmh.com.tw", :password => "654321", :created_at => "2011-06-17 07:09:59", :is_admin => false )
@user.is_admin = false
@user.save
puts "User Create"
