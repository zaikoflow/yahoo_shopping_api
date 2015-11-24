require 'spec_helper'

describe YSA::Response::Parser do
  describe 'initialize' do
    let(:xml) { fixture('item/get.xml').read }

    context 'with Non-XML argument' do
      subject{lambda{described_class.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end

    context 'with XML argument' do
      subject{lambda{described_class.new(xml)}}
      it { is_expected.not_to raise_error}
    end

    context 'with XML argument' do
      it "returns response body" do
        parser = described_class.new(xml)
        expect(parser.body).to eq xml
      end
    end
  end
end
