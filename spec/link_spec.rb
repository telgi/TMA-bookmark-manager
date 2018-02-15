require 'link'

describe Link do

  describe '#::all' do
    it 'returns all links' do
      links = described_class.all
      expect(links).to include(['http://www.makersacademy.com'])
      expect(links).to include(['http://www.google.com'])
      expect(links).to include(['http://www.facebook.com'])
    end

    context 'user inputs invalid URL' do
      it 'raises error' do
        message = 'This is not a valid URL'
        expect { described_class.add(345) }.to raise_error(message)
      end
    end
  end

  describe '#::add' do
    it 'creates a new link' do
      described_class.add('https://www.instagram.com')
      expect(described_class.all).to include ['https://www.instagram.com']
    end
  end
end
