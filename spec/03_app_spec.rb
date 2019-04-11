require "../lib/03_app"

describe "scrap get_deputy_email" do 
    it "should return something MDR" do
        expect(get_congress_urls).not_to be_nil
        expect(get_congres_email(congress_URL)).not_to be_nil
        expect(get_deputy_urls).not_to be_nil
    end
end