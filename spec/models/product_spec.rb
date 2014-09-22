describe Product do
  let(:product) { Product.new(attributes_for(:product)) }

  describe '#categories' do
    context 'when creating a product with no category' do
      let(:error_messages) { ['must have at least one category'] }

      before { product.valid? }

      it { expect(product.valid?).to be false }
      it { expect(product.errors.messages[:base]).to eq(error_messages) }
    end

    context 'when creating a product with categories' do
      let(:c1) { build(:category) }

      before do 
        product.categories << c1
        product.save!
      end

      it { expect(product.categories).to eq([c1]) }
    end
  end
end
