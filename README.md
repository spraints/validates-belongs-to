Rails 3 validation to ensure that two ActiveModel associations are related to each other.

    class JobApplication
      belongs_to :resume
      belongs_to :user
      validates :resume, :belongs_to => :user
    end

Installation:

    gem 'validates-belongs-to'
