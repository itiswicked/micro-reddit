require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(user_id: 1, post_id: 1, body: "Haha I crack me up")
  end

  test 'comment is valid' do
    assert @comment.valid?
  end

  test 'validates if body is present' do
    @comment.body = "   "
    assert_not @comment.valid?
  end

  # max length 100
  test 'validates that body does not exceed maximum length' do
    @comment.body = "a" * 101
    assert_not @comment.valid?
  end

end
