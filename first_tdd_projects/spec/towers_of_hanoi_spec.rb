require 'towers_of_hanoi'

describe Tower do
    subject(:tower) { Tower.new }

    describe "#initialize" do
        it "creates an array for the 3 towers" do
            expect(tower.towers).to be_a(Array)
        end

        context "initializing without argument" do
            it "contains 4 discs in the first tower by default" do
                expect(subject.towers[0]).to eq([1,2,3,4])
            end
        end

        context "initializing with argument" do
            let(:tower6) { Tower.new(6) }
            it "contains 6 discs in the first tower" do
                expect(tower6.towers[0]).to eq([1,2,3,4,5,6])
            end
        end
    end

    describe "#move" do
        it "takes in 2 arguments" do
            expect{tower.move(1,2)}.to_not raise_error
            expect{tower.move}.to raise_error(ArgumentError)
        end

        it "raises an error if start_tower is empty" do
            expect{tower.move(2,3)}.to raise_error("Tower is empty!")
        end

        it "raises en error if start_tower or end_tower is not valid" do
            expect{tower.move(0,2)}.to raise_error("Tower selected is invalid!")
            expect{tower.move(1,4)}.to raise_error("Tower selected is invalid!")
        end

        let(:newtower) { Tower.new }
        it "moves a disk on top of a larger disk" do
            newtower.towers = [[1], [2,3,4], []]
            newtower.move(2,3)
            expect(newtower.towers).to eq([[1], [3,4], [2]])
        end

        it "cannot move a disk on top of a smaller disk" do
            newtower.towers = [[1], [2,3,4], []]
            expect{newtower.move(2,1)}.to raise_error("Cannot move to smaller disk!")
        end
    end

    describe "#won?" do
        it "checks if the game has been won" do
            tower.towers = [[], [], [1,2,3,4]]
            expect(tower.won?).to be true
        end

        it "checks if the game has not been won" do
            tower.towers = [[], [1], [2,3,4]]
            expect(tower.won?).to be false
        end

    end
    
end