sufix = "./95/wy-dit-joli-village.html"
repertoire = sufix.delete_prefix(".")

url = "http://annuaire-des-mairies.com" + repertoire

puts url