require 'rspec'
require_relative '../lib/index.rb'

RSpec.describe "CryptoScraper" do
  describe "#scrape_crypto_data" do
    it "returns a non-empty hash" do
      crypto_hash = scrape_crypto_data
      expect(crypto_hash.size).to be > 0
    end

    it "contains data for specific cryptocurrencies" do
      crypto_hash = scrape_crypto_data
      expect(crypto_hash).to include("BTCBitcoin")
      expect(crypto_hash).to include("ETHEthereum")
      expect(crypto_hash).to include("USDTTether USDt")
      # Ajoutez d'autres attentes selon vos besoins
    end
  end
end