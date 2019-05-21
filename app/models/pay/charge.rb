module Pay
  require 'mongoid'
  class Charge
    include Mongoid::Document
    include Mongoid::Timestamps

    field :owner_id, type: Integer
    # t.integer "owner_id"

    field :processor, type: String, default: false
    # t.string "processor", null: false

    field :processor_id, type: String, default: false
    # t.string "processor_id", null: false

    field :amount, type: Integer, default: 0
    # t.integer "amount", null: false

    field :amount_refunded, type: Integer, default: nil
    # t.integer "amount_refunded"

    field :card_type, type: String, default: nil
    # t.string "card_type"

    field :card_last4, type: String, default: nil
    # t.string "card_last4"

    field :card_exp_month, type: String, default: nil
    # t.string "card_exp_month"

    field :card_exp_year, type: String, default: nil
    # t.string "card_exp_year"


    index({ owner_id: 1}, {name: 'index_pay_charges_on_owner_id'})
    # t.index ["owner_id"], name: "index_pay_charges_on_owner_id"

    field :table_name, type: String, default: Pay.chargeable_table

    # Associations
    belongs_to :owner, class_name: Pay.billable_class, foreign_key: :owner_id

    # Scopes
    scope :sorted, -> { order_by(created_at: :desc) }
    default_scope -> { sorted }

    # Validations
    validates_presence_of :amount
    validates_presence_of :processor
    validates_presence_of :processor_id
    validates_presence_of :card_type

    def processor_charge
      send("#{processor}_charge")
    end

    def refund!(refund_amount = nil)
      refund_amount ||= amount
      send("#{processor}_refund!", refund_amount)
    end

    def charged_to
      "#{card_type} (**** **** **** #{card_last4})"
    end
  end
end
