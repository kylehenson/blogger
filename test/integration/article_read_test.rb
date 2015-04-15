require 'test_helper'

class ArticleDestroyTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "User can view all articles" do
    @article = Article.new(title: "New Title", body: "New Body")
    @article.save
    @article2 = Article.new(title: "New Title2", body: "New Body2")
    @article2.save

    visit articles_path
    assert page.has_content?("New Title")
    assert page.has_content?("New Title2")

    # assert_equal 4 due to the 2 fixtures that were automatically
    # created when test first ran
    assert_equal 2, Article.count
  end
end
