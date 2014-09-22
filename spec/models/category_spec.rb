describe Category do
  let(:category) { create(:category) }

  describe '#path' do
    context 'with newly created object' do
      it { expect(category.path).to eq([category.id]) }
    end

    context 'with category parent' do
      let(:new_category) { create(:category, :parent => category) }
      it { expect(new_category.path).to eq([category.id, new_category.id]) }
    end
  end
end
