require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(user_id: 1, title: "Why did the lifegaurd save the hippie?",
                     body: "Because he was too far out.")
  end

  test 'post is valid' do
    assert @post.valid?
  end

  test 'validates that title cannot be blank' do
    @post.title = "   "
    assert_not @post.valid?
  end

  # min length 3
  test 'validates that title is of a mimimum length' do
    @post.title = "a"
    assert_not @post.valid?
  end

  # max length 50
  test 'validates that title is under maximum length' do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test 'validates that body cannot be blank' do
    @post.body = "   "
    assert_not @post.valid?
  end

  # max length 300
  test 'validates that body is under maximum length' do
    @post.body = "a" * 301
    assert_not @post.valid?
  end

end
