require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Nathan", username: "itiswicked",
                     email: "nathanrbourke@gmail.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test 'assert user is valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = "   "
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test 'username should be present' do
    @user.username = "   "
    assert_not @user.valid?
  end

  test 'username should not be too long' do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test 'username should be unique' do
    User.create(name: "Justin", username: "itiswicked",
                email: "justingbourke@gmail.com",
                password: "foobar", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = "   "
    assert_not @user.valid?
  end

  test 'email validation should accept valid email addressess' do
    valid_addresses = %w{user@example.com USER@foo.com A_US-ER@foo.bar.com
                         first.last@foo.jp alice+bob@baz.cn}
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test 'email validation should reject valid email addressess' do
    invalid_addresses = %w{user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com}
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

end
