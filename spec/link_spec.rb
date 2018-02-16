require 'link'

describe Link do
  it 'has instance of Link class' do
    expect(described_class.all).to include Link
  end

  context 'user inputs invalid URL' do
    it 'raises error' do
      expect(described_class.valid_url?(345)).to eq nil
    end
  end

  describe '#::add' do
    it 'creates a new link' do
      described_class.add('https://www.instagram.com', 'instagram')
      expect(described_class.all.last.title).to eq 'instagram'
    end
  end
end
