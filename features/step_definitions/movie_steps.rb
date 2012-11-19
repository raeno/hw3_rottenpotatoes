# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(:title => movie[:title].strip, :rating => movie[:rating].strip, :release_date => movie[:release_date].strip)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

Given /I have added "(.*)" with rating "(.*)"/ do |title, rating|
  Given %Q{I am on the Create New Movie page}
  When %Q{I fill in "Title" with "#{title}"}
  And %Q{I select "#{rating}" from "Rating"}
  And %Q{I press "Save Changes"}
end

Then /I should see "(.*)" before "(.*)" on "(.*)"/ do |string1,string2,path|
  Given %Q{I am on #{path}}
  regexp = Regexp.new ".*#{string1}.*#{string2}"
  page.body.should =~ regexp
end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end
