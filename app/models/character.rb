class Character < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true,  length: { maximum: 400 }
  validates :rarity, presence: true, numericality:  { only_integer: true, message: I18n.t("Characters.errors.number_presence") },
            inclusion: { in: 1..5, message: I18n.t("Characters.errors.number_between_1_5")   }
  validates :region, presence: { message: I18n.t("Characters.errors.choose_region") }
  enum :region, %w[ Liyue Fontaine Montstadt ].index_by(&:itself)

  def self.ransackable_associations(_auth_object = nil)
    %w[rarity region]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[rarity region]
  end
end
