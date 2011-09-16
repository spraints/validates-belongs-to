require 'active_model'

# Validation to ensure that two ActiveModel associations are related to each other.
#
#  class JobApplication
#    belongs_to :resume
#    belongs_to :user
#    validates :resume, :belongs_to => :user
#  end
class BelongsToValidator < ActiveModel::EachValidator
  def check_validity!
    unless options[:with]
      raise ArgumentError, "An association must be specified."
    end
  end
  def validate_each(record, attribute, value)
    if value
      if common_owner = record.send(options[:with])
        unless common_owner == value.send(options[:with])
          record.errors.add(attribute, :belongs_to, options.merge(:value => value))
        end
      end
    end
  end
end
