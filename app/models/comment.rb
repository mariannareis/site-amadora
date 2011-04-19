class Comment < ActiveRecord::Base
  belongs_to :text
  validates_presence_of :comment, :email, :name
end

