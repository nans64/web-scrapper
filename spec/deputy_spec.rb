require_relative '../lib/deputy'

describe "Mon programme de scrapping Crypto fonctionne-t-il ?" do
    it "Le programme doit me retourner un array" do
    expect(get_deputy_urls.is_a?Array).to eq(true)
     end
    it "Le tableau doit contenir à minima 100 Mairies" do
        expect(get_deputy_urls.length>100).to eq(true)
       end

    it "Le programme doit contenir la mairie Lassalle" do
        expect(get_deputy_urls.include?('Adam')).to eq(true)   
      end
  end
