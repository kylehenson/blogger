require 'test_helper'

class ArticleCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "User can create an article" do
    visit new_article_path
    fill_in "article[title]", with: "To Do"
    fill_in "article[body]", with: "Lots of stuff"
    click_link_or_button "Create Article"
    assert page.has_content?("To Do")
    assert page.has_content?("Lots of stuff")
  end

end
