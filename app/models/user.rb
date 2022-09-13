class User < ApplicationRecord
	has_secure_password

	attr_accessor :jwt

	enum role: {user: 0, admin: 1}

	has_many :glasses
	has_many :shopping_baskets
end
