shared_examples 'degradable' do
  let(:item) { described_class.new('Degradable Item', 5, described_class::MIN_QUALITY) }

  it 'decreases sell_in by 1' do
    expect { item.next_day }.to change { item.sell_in }.by(-1)
  end

  context 'quality is minimum' do
    it 'keeps quality >= minimum' do
      item.next_day
      expect(item.quality).to be >= described_class::MIN_QUALITY
    end
  end

  context 'quality is maximum' do
    let(:item) { described_class.new('Degradable Item', 5, described_class::MAX_QUALITY) }
    it 'keeps quality <= maximum' do
      item.next_day
      expect(item.quality).to be <= described_class::MAX_QUALITY
    end
  end

  context 'quality out of range' do
    it 'raises Error if quality less than minimum' do
      low_quality = described_class::MIN_QUALITY - 1
      expect { described_class.new('Degradable Item', 5, low_quality) }.to raise_error(ItemError)
    end

    it 'raises Error if quality more than maximum' do
      high_quality = described_class::MAX_QUALITY + 1
      expect { described_class.new('Degradable Item', 5, high_quality) }.to raise_error(ItemError)
    end
  end
end
