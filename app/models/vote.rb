class Vote < ActiveRecord::Base
	belongs_to :article, counter_cache: true

	validates :from, uniqueness: {scope: :article,message: "You have already voted"}
end
