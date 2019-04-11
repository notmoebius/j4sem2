require_relative "../lib/02_app"

describe "scrap get_townhall should return something" do
    it "should return something lol" do
        expect(get_townhall_email("http://annuaire-des-mairies.com/95/ambleville.html")).not_to be_nil  
        expect(get_townhall_urls).not_to be_nil
    end
end 


