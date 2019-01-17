
require_relative '../lib/trader'

describe "Mon programme de scrapping Crypto fonctionne-t-il ?" do
    it "Le programme doit me retourner un array" do
    expect(crypto_scrapper.is_a?Array).to eq(true)
     end

    it "Le tableau doit contenir à minima 100 valeurs" do
        expect(crypto_scrapper.length>100).to eq(true)
       end

    it "Le programme doit contenir à minima le Symbol BTC" do
        expect(crypto_scrapper.join.include?('BTC')).to eq(true)   
      end

    it "Le programme doit contenir à minima le Symbol BTC" do
        expect(crypto_scrapper[1]['BTC'].delete_prefix('$').to_i>3000).to eq(true)   
      end


  end

