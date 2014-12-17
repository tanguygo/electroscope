
u=User.create(email:"arnaud.laurenty@gmail.com",password:"aaaaaaaa",last_name:'laurenty',first_name:'arnaud',birthday: "06/04/1984".to_date,civility:"Monsieur",admin:"true")
u2=User.create(email:"charles@degaulle.com",password:"aaaaaaaa",last_name:'gaulle',first_name:'charles',birthday: "06/04/1984".to_date,civility:"Monsieur",admin:"false")
b=Box.create(internal_ref: "electroscope numéro 1",status:"OK",localization:"client",token: "user1")
b2=Box.create(internal_ref: "electroscope numéro 2",status:"OK",localization:"client",token: "user2")

f=Flat.create(street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",number_of_occupants:3,surface:65.5,user:u, address_complement: "escalier A")
f2=Flat.create(street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",number_of_occupants:3,surface:65.5,user:u2, address_complement: "escalier A")
bs=BoxSession.create(box:b, activated:true,connected:false,flat:f,start_date:"01/10/2014".to_date)
bs2=BoxSession.create(box:b2, activated:true,connected:false,flat:f2,start_date:"01/10/2014".to_date)
o=Offer.create(price:10,conditions:"offre 1")
order1=Order.create(creation_date:"06/04/1984".to_datetime, status:"delivered",counter_type:"electronique",\
  offer:o,box:b, user:u,street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",address:"17 rue Pierre Lescot 75001 Paris")
order2=Order.create(creation_date:"06/04/1984".to_datetime, status:"delivered",counter_type:"electronique",\
  offer:o,box:b2, user:u2,street_number:"17",route:"rue Pierre Lescot",locality:"Paris",administrative_area_level_1:"IDF",\
  postal_code: "75001",country:"France",address:"17 rue Pierre Lescot 75001 Paris")
# statement seeds (au préalable, passer la route de post en get pour créer les points avec le navigateur en get)
# localhost:3000/statements/create_from_box?token=user1&&pulse=643&&time_of_measure=2014-12-15T10:46:33.599&&power=55
# localhost:3000/statements/create_from_box?token=user1&&pulse=48&&time_of_measure=2014-12-15T10:51:07.186&&power=750
# localhost:3000/statements/create_from_box?token=user1&&pulse=48&&time_of_measure=2014-12-15T10:54:07.186&&power=750
# localhost:3000/statements/create_from_box?token=user1&&pulse=48&&time_of_measure=2014-12-15T10:58:07.186&&power=800
# localhost:3000/statements/create_from_box?token=user2&&pulse=643&&time_of_measure=2014-12-24T10:46:33.599&&power=55

  # create_table "device_types", force: true do |t|
  #   t.string   "type"
  #   t.float    "avg_daily_consumption"
  #   t.float
  #   t.float    "avg_yearly_consumption"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # create_table "devices", force: true do |t|
  #   t.string   "name"
  #   t.integer  "device_type_id"
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

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


DeviceType.create(
  name: "radiateur électrique",
  category: "chauffage",
  avg_daily_consumption: 2000,
  avg_yearly_consumption: 800000,
  url: "devices/radiateur.png"
  )

DeviceType.create(
  name: "air conditionné",
  category: "climatisation" ,
  avg_daily_consumption: 2500,
  avg_yearly_consumption: 1000000,
  url: "devices/airco.png"
  )

# conso par metre carré

DeviceType.create(
  name: "chauffe-eau",
  category: "eau chaude sanitaire" ,
  avg_daily_consumption: 2500,
  avg_yearly_consumption: 1000000,
  url: "devices/chauffe_eau.png"
  )

# conso par personne

DeviceType.create(
  name: "four",
  category: "electro-ménager" ,
  avg_daily_consumption: 400,
  avg_yearly_consumption: 150000,
  url: "devices/four.png"
  )

DeviceType.create(
  name: "plaques à induction",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_induction.png"
  )

# conso par personne


DeviceType.create(
  name: "plaques vitro-céramique",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_vitro.png"
  )

DeviceType.create(
  name: "plaques à résistance",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_elec.png"
  )

DeviceType.create(
  name: "four à micro-ondes",
  category: "electro-ménager" ,
  avg_daily_consumption: 270,
  avg_yearly_consumption: 100000,
  url: "devices/micro_onde.png"
  )

# conso par personne

DeviceType.create(
  name: "machine à laver",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_yearly_consumption: 200000,
  url: "devices/lave_linge.png"
  )

DeviceType.create(
  name: "séche-linge",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_yearly_consumption: 200000,
  url: "devices/secheuse.png"
  )

DeviceType.create(
  name: "lave-vaisselle",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_yearly_consumption: 200000,
  url: "devices/lave_vaisselle.png"
  )


DeviceType.create(
  name: "lampe hallogène",
  category: "éclairage" ,
  avg_daily_consumption: 550,
  avg_yearly_consumption: 200000,
  url: "devices/hallogene.png"
  )

