require 'test_helper'

class ArticleUpdateTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "User can edit an article" do
    @article = Article.new(title: "New Title", body: "New Body")
    @article.save

    visit article_path(@article)
    click_link_or_button "Edit"
    fill_in "article[title]", with: "To Do"
    fill_in "article[body]", with: "Lots of stuff"
    click_link_or_button "Update Article"
    assert page.has_content?("To Do")
    assert page.has_content?("Lots of stuff")
  end
end
