# frozen_string_literal: true

namespace :populate_database do
  desc 'Create Default States'

  task users: :environment do
    User.create({ email: 'phganso@email.com', password: '12345678', name: 'Paulo Henrique Ganso' })
  end

  task categories: :environment do
    Category.find_or_create_by({ name: 'Exame de sangue' })
  end

  task dynamic_fields: :environment do
    category_id = Category.find_by(name: 'Exame de sangue')[:id]

    DynamicField.find_or_create_by({ name: 'Hemácias em milhões', category_id: category_id })
    DynamicField.find_or_create_by({ name: 'Hemoglobina', category_id: category_id })
    DynamicField.find_or_create_by({ name: 'Hematóclito', category_id: category_id })
  end

  task items: :environment do
    category_id = Category.find_by(name: 'Exame de sangue')[:id]

    Item.find_or_create_by(
      { 
        title: 'Primeiro exame de sangue', 
        category_id: category_id, 
        fields: {
          "Hemácias em milhões": "6.12", 
          "Hemoglobina": "15.1",
          "Hematóclito": "44,8"
        } 
      }
    )
  end
end