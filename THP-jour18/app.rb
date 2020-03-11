require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app/", __FILE__)
require 'scrapper'

scrap = Scrapper.new('https://www.annuaire-des-mairies.com/val-d-oise.html')
data = scrap.perform
# scrap.save_as_JSON("db/townhall.json", data)
# scrap.save_as_spreadsheet("1SZfNOQTY6IWlju0Y1QtpJs-3TDinkuP3_Xne2jJcPoQ", data)
scrap.save_as_csv("db/townhall.csv", data)
