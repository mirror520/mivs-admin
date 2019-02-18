class Dvr < ApplicationRecord
    has_one :server, as: :serviceable

    delegate :name, :name=, to: :server
    delegate :address, :address=, to: :server
    delegate :port, :port=, to: :server
    delegate :cameras, :cameras=, to: :server
end
