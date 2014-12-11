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
  avg_daily_consumption: 300,
  avg_monthly_consumption_01: 9000 ,
  avg_monthly_consumption_02: 9000,
  avg_monthly_consumption_03: 9000,
  avg_monthly_consumption_04: 9000,
  avg_monthly_consumption_05: 9000,
  avg_monthly_consumption_06: 9000,
  avg_monthly_consumption_07: 9000,
  avg_monthly_consumption_08: 9000,
  avg_monthly_consumption_09: 9000,
  avg_monthly_consumption_10: 9000,
  avg_monthly_consumption_11: 9000,
  avg_monthly_consumption_12: 9000,
  avg_yearly_consumption: 11000,
  url: "devices/radiateur.png"
  )

DeviceType.create(
  name: "air conditionné",
  category: "climatisation" ,
  avg_daily_consumption: 300,
  avg_monthly_consumption_01: 9000,
  avg_monthly_consumption_02: 9000,
  avg_monthly_consumption_03: 9000,
  avg_monthly_consumption_04: 9000,
  avg_monthly_consumption_05: 9000,
  avg_monthly_consumption_06: 9000,
  avg_monthly_consumption_07: 9000,
  avg_monthly_consumption_08: 9000,
  avg_monthly_consumption_09: 9000,
  avg_monthly_consumption_10: 9000,
  avg_monthly_consumption_11: 9000,
  avg_monthly_consumption_12: 9000,
  avg_yearly_consumption: 11000,
  url: "devices/airco.png"
  )

# conso par metre carré

DeviceType.create(
  name: "chauffe-eau",
  category: "eau chaude sanitaire" ,
  avg_daily_consumption: 2500,
  avg_monthly_consumption_01: 75000,
  avg_monthly_consumption_02: 75000,
  avg_monthly_consumption_03: 75000,
  avg_monthly_consumption_04: 75000,
  avg_monthly_consumption_05: 75000,
  avg_monthly_consumption_06: 75000,
  avg_monthly_consumption_07: 75000,
  avg_monthly_consumption_08: 75000,
  avg_monthly_consumption_09: 75000,
  avg_monthly_consumption_10: 75000,
  avg_monthly_consumption_11: 75000,
  avg_monthly_consumption_12: 75000,
  avg_yearly_consumption: 1000000,
  url: "devices/chauffe_eau.png"
  )

# conso par personne

DeviceType.create(
  name: "four",
  category: "electro-ménager" ,
  avg_daily_consumption: 400,
  avg_monthly_consumption_01: 12000,
  avg_monthly_consumption_02: 12000,
  avg_monthly_consumption_03: 12000,
  avg_monthly_consumption_04: 12000,
  avg_monthly_consumption_05: 12000,
  avg_monthly_consumption_06: 12000,
  avg_monthly_consumption_07: 12000,
  avg_monthly_consumption_08: 12000,
  avg_monthly_consumption_09: 12000,
  avg_monthly_consumption_10: 12000,
  avg_monthly_consumption_11: 12000,
  avg_monthly_consumption_12: 12000,
  avg_yearly_consumption: 150000,
  url: "devices/four.png"
  )

DeviceType.create(
  name: "plaques à induction",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_monthly_consumption_01: 6000,
  avg_monthly_consumption_02: 6000,
  avg_monthly_consumption_03: 6000,
  avg_monthly_consumption_04: 6000,
  avg_monthly_consumption_05: 6000,
  avg_monthly_consumption_06: 6000,
  avg_monthly_consumption_07: 6000,
  avg_monthly_consumption_08: 6000,
  avg_monthly_consumption_09: 6000,
  avg_monthly_consumption_10: 6000,
  avg_monthly_consumption_11: 6000,
  avg_monthly_consumption_12: 6000,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_induction.png"
  )

# conso par personne


DeviceType.create(
  name: "plaques vitro-céramique",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_monthly_consumption_01: 6000,
  avg_monthly_consumption_02: 6000,
  avg_monthly_consumption_03: 6000,
  avg_monthly_consumption_04: 6000,
  avg_monthly_consumption_05: 6000,
  avg_monthly_consumption_06: 6000,
  avg_monthly_consumption_07: 6000,
  avg_monthly_consumption_08: 6000,
  avg_monthly_consumption_09: 6000,
  avg_monthly_consumption_10: 6000,
  avg_monthly_consumption_11: 6000,
  avg_monthly_consumption_12: 6000,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_vitro.png"
  )

DeviceType.create(
  name: "plaques à résistance",
  category: "electro-ménager" ,
  avg_daily_consumption: 200,
  avg_monthly_consumption_01: 6000,
  avg_monthly_consumption_02: 6000,
  avg_monthly_consumption_03: 6000,
  avg_monthly_consumption_04: 6000,
  avg_monthly_consumption_05: 6000,
  avg_monthly_consumption_06: 6000,
  avg_monthly_consumption_07: 6000,
  avg_monthly_consumption_08: 6000,
  avg_monthly_consumption_09: 6000,
  avg_monthly_consumption_10: 6000,
  avg_monthly_consumption_11: 6000,
  avg_monthly_consumption_12: 6000,
  avg_yearly_consumption: 75000,
  url: "devices/plaque_elec.png"
  )

DeviceType.create(
  name: "four à micro-ondes",
  category: "electro-ménager" ,
  avg_daily_consumption: 270,
  avg_monthly_consumption_01: 8000,
  avg_monthly_consumption_02: 8000,
  avg_monthly_consumption_03: 8000,
  avg_monthly_consumption_04: 8000,
  avg_monthly_consumption_05: 8000,
  avg_monthly_consumption_06: 8000,
  avg_monthly_consumption_07: 8000,
  avg_monthly_consumption_08: 8000,
  avg_monthly_consumption_09: 8000,
  avg_monthly_consumption_10: 8000,
  avg_monthly_consumption_11: 8000,
  avg_monthly_consumption_12: 8000,
  avg_yearly_consumption: 100000,
  url: "devices/micro_onde.png"
  )

# conso par personne

DeviceType.create(
  name: "machine à laver",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_monthly_consumption_01: 17000,
  avg_monthly_consumption_02: 17000,
  avg_monthly_consumption_03: 17000,
  avg_monthly_consumption_04: 17000,
  avg_monthly_consumption_05: 17000,
  avg_monthly_consumption_06: 17000,
  avg_monthly_consumption_07: 17000,
  avg_monthly_consumption_08: 17000,
  avg_monthly_consumption_09: 17000,
  avg_monthly_consumption_10: 17000,
  avg_monthly_consumption_11: 17000,
  avg_monthly_consumption_12: 17000,
  avg_yearly_consumption: 200000,
  url: "devices/lave_linge.png"
  )

DeviceType.create(
  name: "séche-linge",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_monthly_consumption_01: 17000,
  avg_monthly_consumption_02: 17000,
  avg_monthly_consumption_03: 17000,
  avg_monthly_consumption_04: 17000,
  avg_monthly_consumption_05: 17000,
  avg_monthly_consumption_06: 17000,
  avg_monthly_consumption_07: 17000,
  avg_monthly_consumption_08: 17000,
  avg_monthly_consumption_09: 17000,
  avg_monthly_consumption_10: 17000,
  avg_monthly_consumption_11: 17000,
  avg_monthly_consumption_12: 17000,
  avg_yearly_consumption: 200000,
  url: "devices/secheuse.png"
  )

DeviceType.create(
  name: "lave-vaisselle",
  category: "electro-ménager" ,
  avg_daily_consumption: 550,
  avg_monthly_consumption_01: 17000,
  avg_monthly_consumption_02: 17000,
  avg_monthly_consumption_03: 17000,
  avg_monthly_consumption_04: 17000,
  avg_monthly_consumption_05: 17000,
  avg_monthly_consumption_06: 17000,
  avg_monthly_consumption_07: 17000,
  avg_monthly_consumption_08: 17000,
  avg_monthly_consumption_09: 17000,
  avg_monthly_consumption_10: 17000,
  avg_monthly_consumption_11: 17000,
  avg_monthly_consumption_12: 17000,
  avg_yearly_consumption: 200000,
  url: "devices/lave_vaisselle.png"
  )


DeviceType.create(
  name: "lampe hallogène",
  category: "éclairage" ,
  avg_daily_consumption: 550,
  avg_monthly_consumption_01: 17000,
  avg_monthly_consumption_02: 17000,
  avg_monthly_consumption_03: 17000,
  avg_monthly_consumption_04: 17000,
  avg_monthly_consumption_05: 17000,
  avg_monthly_consumption_06: 17000,
  avg_monthly_consumption_07: 17000,
  avg_monthly_consumption_08: 17000,
  avg_monthly_consumption_09: 17000,
  avg_monthly_consumption_10: 17000,
  avg_monthly_consumption_11: 17000,
  avg_monthly_consumption_12: 17000,
  avg_yearly_consumption: 200000,
  url: "devices/hallogene.png"
  )
