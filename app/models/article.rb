class Article < ActiveRecord::Base
	has_many :votes
	has_many :comments

	validates :title, presence: {message: "What's it all about"}
	validates :body, presence: true
	validates :author, presence: true
	validates_format_of :url, with: URI.regexp, unless: Proc.new  {|url| url.blank? }
end
