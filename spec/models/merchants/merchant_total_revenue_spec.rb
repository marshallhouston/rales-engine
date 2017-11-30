require 'rails_helper'

RSpec.feature "merchant can output total revenue" do
  it "with no date" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)
    item = create(:item)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item, quantity: 4, unit_price: 500)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item: item, quantity: 6, unit_price: 700)
    invoice_item3 = create(:invoice_item, invoice: invoice3, item: item, quantity: 10, unit_price: 400)
    transaction1 = create(:transaction, invoice: invoice1, result: 'success')
    transaction2 = create(:transaction, invoice: invoice2, result: 'success')
    transaction3 = create(:transaction, invoice: invoice3, result: 'success', created_at: DateTime.now)

    total1 = invoice_item1.quantity * invoice_item1.unit_price
    total2 = invoice_item2.quantity * invoice_item2.unit_price
    total = total1 + total2
    proposed_total = Merchant.total_revenue(transaction1.created_at)

    expect(proposed_total).to eq(total)
  end
end  
