require "../lib/02_app"

describe "scrap get_townhall should return something" do
    it "should return something lol" do
        expect(get_townhall_email(townhall_URL)).not_to be_nil  # mettre url mairie
        expect(get_townhall_urls).not_to be_nil
    end
end 


