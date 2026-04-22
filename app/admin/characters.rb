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
      f.input :rarity, as: :number, required: true, placeholder: I18n.t("Characters.errors.number_between_0_1")
      f.input :description, as: :text, required: true
    end
    actions
  end
  controller do
    def create
      @character = Character.new(permitted_params[:character])
      if @character.save
        flash[:notice] = I18n.t("Characters.new.created")
        redirect_to admin_characters_url
      else
        render :new, status: :unprocessable_content
      end
    end
  end
end
