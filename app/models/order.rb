class Order < ActiveRecord::Base
  belongs_to :offer
  belongs_to :box
  belongs_to :user
  after_create :push_order_to_trello

  def set_initial_values
    self.update(status: "ordered_no_payment", creation_date: Time.now)
  end

  def push_order_to_trello
    card = ::Trello::Card.new
    user = self.user
    card.name = user.email
    card.list_id = '54928ee8dc83efdd4eda8789'
    card.desc = <<-EOF
Numéro de commande : #{id}
Numéro de client : #{user.id}
Nom : #{user.first_name} #{user.last_name}
Adresse : #{street_number} #{route}
          #{postal_code} #{locality}
          #{country}
Complément d'adresse : #{address_complement}
Méthode de livraison : #{delivery_option}

EOF

    card.save
    checklist_json = JSON.parse(card.create_new_checklist("Etat"))
    checklist = ::Trello::Checklist.find(checklist_json["id"])
    checklist.add_item("Commande validée")
  end

end
