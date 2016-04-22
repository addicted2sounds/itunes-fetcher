require 'rails_helper'

describe FetchArtistJob, type: :job do
  let(:artist_json) do
    File.read('spec/support/fixtures/itunes/artist_search.json')
  end

  let(:album_json) do
    File.read('spec/support/fixtures/itunes/album_search.json')
  end

  describe '.fetch_artists' do
    before :each do
      stub_request(:get, /.*itunes.apple.com.*/)
        .to_return(body: artist_json)
    end

    subject { FetchArtistJob.new.fetch_artists('elvis presley') }

    it 'parses fixture artists' do
      expect(Artist).to receive(:create).exactly(2).times
      subject
    end

    it 'saves fixture artists' do
      expect { subject }.to change(Artist, :count).by(2)
    end
  end

  describe '.fetch_albums' do
    let(:artist) { Artist.create name: 'unknown', itunes_id: '343433' }

    before :each do
      stub_request(:get, /.*itunes.apple.com.*/)
        .to_return(body: album_json)
    end

    subject { FetchArtistJob.new.fetch_albums artist }

    it 'parses fixture albums' do
      expect(Album).to receive(:create).exactly(2).times
      subject
    end
  end
end
