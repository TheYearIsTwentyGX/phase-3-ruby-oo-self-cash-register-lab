class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction, :last_quantity
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = nil
        @last_quantity = nil
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            @items << title
        end
        self.last_transaction = price
        self.last_quantity = quantity
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end

        self.total -= (self.total * self.discount) / 100
        return "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        last_quantity.times do
            self.total -= self.last_transaction
            items.pop
        end
    end
end