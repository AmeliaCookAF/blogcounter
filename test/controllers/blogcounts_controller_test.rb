require 'test_helper'

class BlogcountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blogcount = blogcounts(:one)
  end

  test "should get index" do
    get blogcounts_url
    assert_response :success
  end

  test "should get new" do
    get new_blogcount_url
    assert_response :success
  end

  test "should create blogcount" do
    assert_difference('Blogcount.count') do
      post blogcounts_url, params: { blogcount: { paragraphs: @blogcount.paragraphs, title: @blogcount.title, wordcount: @blogcount.wordcount } }
    end

    assert_redirected_to blogcount_url(Blogcount.last)
  end

  test "should show blogcount" do
    get blogcount_url(@blogcount)
    assert_response :success
  end

  test "should get edit" do
    get edit_blogcount_url(@blogcount)
    assert_response :success
  end

  test "should update blogcount" do
    patch blogcount_url(@blogcount), params: { blogcount: { paragraphs: @blogcount.paragraphs, title: @blogcount.title, wordcount: @blogcount.wordcount } }
    assert_redirected_to blogcount_url(@blogcount)
  end

  test "should destroy blogcount" do
    assert_difference('Blogcount.count', -1) do
      delete blogcount_url(@blogcount)
    end

    assert_redirected_to blogcounts_url
  end
end
