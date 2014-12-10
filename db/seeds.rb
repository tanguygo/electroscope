u=User.create(email:"arnaud.laurenty@gmail.com",password:"a",last_name:'laurenty',first_name:'arnaud',\
  birthday: "06/04/1984".to_date,civility:"Monsieur")
b=Box.create(electroscope_id: "electroscope numéro 1",status:"active",token: "user1")
f=Flat.create(street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",number_of_occupants:3,surface:65.5,user:u, address_complement: "escalier A")
bs=BoxSession.create(box:b, status:'active',flat:f,start_date:"01/10/2014".to_date)
o=Offer.create(price:10,conditions:"offre 1")
order1=Order.create(creation_date:"06/04/1984".to_datetime, status:"delivered",counter_type:"electronique",\
  offer:o,box:b, user:u,street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",address:"17 rue Pierre Lescot 75001 Paris")

  # create_table "device_types", force: true do |t|
  #   t.string   "type"
  #   t.float    "avg_daily_consumption"
  #   t.float    "avg_monthly_consumption_01"
  #   t.float    "avg_yearly_consumption"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # create_table "devices", force: true do |t|
  #   t.string   "name"
  #   t.integer  "devicetype_id"
  #   t.integer  "flat_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # create_table "sponsorships", force: true do |t|
  #   t.integer  "giver_id"
  #   t.integer  "receiver_id"
  #   t.datetime "date"
  #   t.string   "status"
  #   t.integer  "box_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end
