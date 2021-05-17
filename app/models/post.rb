class Post < ApplicationRecord

  ##Relationship##

  belongs_to :user

  ## Validations ##
  validates :title, :body, :presence => true

end
