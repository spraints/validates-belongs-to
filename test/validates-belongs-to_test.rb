require 'test/unit'
require 'validates-belongs-to'

class ValidatesBelongsToTest < Test::Unit::TestCase
  module HelperClassMethods
    def belongs_to(*args)
      attr_accessor(*args)
    end
  end
  class TheModel
    include ActiveModel::Validations
    extend HelperClassMethods
    validates :thing1, :belongs_to => :thing2
    belongs_to :thing1, :thing2
  end
  class Thing1
    extend HelperClassMethods
    belongs_to :thing2
  end

  def setup
    @obj = TheModel.new
  end
  attr_reader :obj

  def test_everything_nil_is_ok
    assert obj.valid?, 'valid with no associated objects'
  end

  def test_thing2_nil_is_ok
    obj.thing1 = Thing1.new
    obj.thing1.thing2 = :thing2
    assert obj.valid?, 'valid with just a thing1'
  end

  def test_thing1_nil_is_ok
    obj.thing2 = :thing2
    assert obj.valid?, 'valid with just a thing2'
  end

  def test_valid
    obj.thing1 = Thing1.new
    obj.thing1.thing2 = :thing2
    obj.thing2 = :thing2
    assert obj.valid?, 'valid with matching related objects'
  end

  def test_invalid
    obj.thing1 = Thing1.new
    obj.thing1.thing2 = :thing2
    obj.thing2 = :other_thing
    assert !obj.valid?, 'not valid with non-matching related objects'
  end
end
