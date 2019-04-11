require_relative "../lib/03_app"

describe "scrap get_deputy_email" do 
    it "should return something MDR" do
        expect(get_congress_urls).not_to be_nil
        expect(get_congres_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719146")).not_to be_nil
    end
end