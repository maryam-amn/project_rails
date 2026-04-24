ActiveAdmin.register Character do
  permit_params :name, :region, :rarity, :description

  filter :rarity
  filter :region, as: :select, collection: proc { Character.regions.keys }

  index do
    column :name
    column :region
    column :rarity
    column :description
    actions
  end
  form title: I18n.t("Characters.new.add") do |f|
    f.object.errors.full_messages
    inputs "Add a new character" do
      f.li    I18n.t("Characters.new.info"), style: "font-weight: 750;"
      f.input :name
      f.input :region, as: :select, required: true, collection: Character.regions.keys, style: "width: 50%;", label: "Region"
      f.input :rarity, as: :number, required: true, placeholder: I18n.t("Characters.errors.number_between_1_5")
      f.input :description, as: :text, required: true
    end
    actions
  end
end
