require 'spec_helper'

vcr_options = { :cassette_name => 'profile', :record => :new_episodes }

RSpec.describe Halo::Services::Profile, :vcr => vcr_options do
  let(:client) { Halo::Client.new.profile }
  let(:gt) { 'xtovarisch' }

  describe '#emblem' do
    it 'fetches the emblem' do
      response = client.emblem(gt)
      img = 'https://image.halocdn.com/h5/emblems/161_21_30_57?width=128&hash=pz2n9Ji7Rbnk67UWyxG3TjqzT0WvdTxJE09046jaVJQ%3d'
      expect(response).to eq img
    end
  end

  describe '#spartan' do
    it 'fetches spartan info' do
      response = client.spartan(gt)
      img = 'https://image.halocdn.com/h5/spartans/1088_1_2010_3053_57_45?width=128&crop=Portrait&api-version=2016-01-26&hash=4G61ACryBa%2frQAtVkx163Dfg1rvjkEmwPcmL4RHw2SI%3d'
      expect(response).to eq img
    end
  end

  describe '#appearance' do
    it 'returns spartan info' do
      response = client.appearance(gt)
      expect(response['Gamertag']).to eq gt
      expect(response['Company']).not_to be_empty
      expect(response['Company']['Name']).to eq 'PH Spartans'
    end
  end
end

