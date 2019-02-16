require 'array_tdd'

describe Array do

    describe "#my_uniq" do
        subject(:array) { [1, 2, 1, 3, 3] } 

        it "returns a new array without duplicates" do
            expect(array.my_uniq).to eq([1, 2, 3])
        end
    end

    describe "#two_sum" do
        subject(:array) { [-1, 0, 2, -2, 1] }

        it "returns indices of pairs that sum to zero" do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do
        subject(:array) do 
            [[0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]]
        end

        let (:return_arr) do
            [[0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]]
        end
        it "returns a new array with rows and columns switched" do
            expect(array.my_transpose).to eq(return_arr)
        end
    end

    describe "#stock_picker" do
        subject(:stock_prices) { [50,75,25,100] }

        it "returns an array indicating best day to buy and sell stock" do
            expect(stock_prices.stock_picker).to eq([2,3])
        end
    end

end
