module Shoppe
  class Vendor < ActiveRecord::Base

    EMAIL_REGEX = /\A\b[A-Z0-9\.\_\%\-\+]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,6}\b\z/i
    PHONE_REGEX = /\A[+?\d\ \-x\(\)]{7,}\z/

    self.table_name = "shoppe_vendors"

    # Vendor products
    has_many :products, dependent: :restrict_with_exception, class_name: 'Shoppe::Product'

    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX}
    validates :phone, presence: true, format: { with: PHONE_REGEX }

    # All vendors ordered by their ID desending
    scope :ordered, -> { order(id: :desc)}

    # The name of the vendor in the format of "Company (First Last)" or if they don't have
    # company specified, just "First Last".
    #
    # @return [String]
    def name
      company.blank? ? full_name : "#{company} (#{full_name})"
    end

    # The full name of the vendor created by concatinting the first & last name
    #
    # @return [String]
    def full_name
      "#{first_name} #{last_name}"
    end

    def self.ransackable_attributes(auth_object = nil)
      ["id", "first_name", "last_name", "company", "email", "phone", "mobile"] + _ransackers.keys
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end

  end
end
