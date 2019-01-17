require_relative '../lib/deputy'

describe "Mon programme de scrapping des députés fonctionne-t-il ?" do
 
    it "Le programme doit me retourner un array" do
    expect(get_deputy_urls.is_a?Array).to eq(true)
     end
  end
