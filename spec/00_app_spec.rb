require "../lib/00_app"

describe "crypto_scraper return array of hash" do
    it "should return array, and array is not nil" do
      expect(crypto_scraper).not_to be_nil
    end
    # vérifier si au mons 2/3 crypto_monnaies existent
    # test à ajouter
end