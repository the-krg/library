require 'rails_helper'

describe HomeHelper, type: :helper do
  describe '#days_remaining' do
    subject { helper.days_remaining(return_date) }
    let(:days_amount) { 3 }

    context 'when return date is in the past' do
      let(:return_date) { Date.today - days_amount.days }

      it { is_expected.to eq("#{days_amount} day(s) late") }
    end

    context 'when return date is in the present' do
      let(:return_date) { Date.today }

      it { is_expected.to eq('Returns today') }
    end
    
    context 'when return date is in the future' do
      let(:return_date) { Date.today + days_amount.days }

      it { is_expected.to eq("#{days_amount} day(s) until return") }
    end
  end

  describe '#rental_status' do
    subject { helper.rental_status(return_date) }

    context 'when rental is late' do
      let(:return_date) { Date.today - 3.days }

      it { is_expected.to eq('warning') }
    end

    context 'when rental returns today' do
      let(:return_date) { Date.today }

      it { is_expected.to eq('alert') }
    end
  end
end