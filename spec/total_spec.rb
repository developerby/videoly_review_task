# frozen_string_literal: true

require_relative '../main'

describe Supermarket do
  p_1 = Product.new(A)
  p_2 = Product.new(B)
  p_3 = Product.new(C)

  let(:rules) { [] }
  let(:instance) do
    Supermarket.new(rules)
  end

  describe "#total" do
    subject { instance.total }

    context "with empty basket" do
      specify { is_expected.to eq(0) }
    end

    context "with a_products" do
      before { 5.times { instance.add(p_1) } }

      specify { is_expected.to eq(500) }

      context "with rules" do
        let(:rules) { [RULE_1, RULE_2, RULE_3] }
        specify { is_expected.to eq(460) }
      end

      context "with all products" do
        before do
          5.times { instance.add(p_2) }
          2.times { instance.add(p_3) }
        end
        specify { is_expected.to eq(810) }

        context "with rules" do
          let(:rules) { [RULE_1, RULE_2, RULE_3] }
          specify { is_expected.to eq(666) }
        end

        context "with other order of rules" do
          let(:rules) { [RULE_3, RULE_2, RULE_1] }
          specify { is_expected.to eq(659) }
        end

        context "with total_off rule only" do
          let(:rules) { [RULE_3] }
          specify { is_expected.to eq(729) }
        end
      end
    end
  end
end
