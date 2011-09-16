[![Build Status](https://secure.travis-ci.org/spraints/validates-belongs-to.png)](http://travis-ci.org/spraints/validates-belongs-to)

Rails 3 validation to ensure that two ActiveModel associations are related to each other.

    class JobApplication
      belongs_to :resume
      belongs_to :user
      validates :resume, :belongs_to => :user
    end

The validation checks that `job_application.resume.user` is the same as `job_application.user`.

Installation:

    gem 'validates-belongs-to'
