require 'test_helper'

class ArticleDestroyTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "User can destroy an article" do
    @article = Article.new(title: "new title", body: "new body")
    @article.save
    @article2 = Article.new(title: "new title2", body: "new body2")
    @article2.save
    # assert_equal 4 due to the 2 fixtures that were automatically
    # created when test first ran
    assert_equal 2, Article.count

    visit article_path(@article)
    click_link_or_button "Delete"
    assert_equal 1, Article.count

    visit article_path(@article2)
    click_link_or_button "Delete"
    assert_equal 0, Article.count
  end
end
