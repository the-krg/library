require 'rails_helper'

describe HomeHelper, type: :helper do
  describe '#genre_name' do
    let(:book_genre) { create(:book_genre) }

    subject { helper.genre_name(genre_id) }

    context 'when genre id exists' do
      let(:genre_id) { book_genre.id }

      it { is_expected.to eq(book_genre.name) }
    end

    context 'when genre id does not exist' do
      let(:genre_id) { -1 }

      it { is_expected.to eq('No favorite genre') }
    end
  end
end