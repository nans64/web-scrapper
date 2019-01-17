require_relative '../lib/mairie'

describe "Mon programme de scrapping Crypto fonctionne-t-il ?" do
    it "Le programme doit me retourner un array" do
    expect(get_townhall_urls.is_a?Array).to eq(true)
     end

    it "Le tableau doit contenir à minima 100 Mairies" do
        expect(get_townhall_urls.length>100).to eq(true)
       end

    it "Le programme doit contenir la mairie ABLEIGES" do
        expect(get_townhall_urls.join.include?('ABLEIGES')).to eq(true)   
      end


  end
