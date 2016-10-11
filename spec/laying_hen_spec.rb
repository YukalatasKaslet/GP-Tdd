require 'laying_hen'

describe LayingHen do
  # LayingHen tests here
  let(:hen) { LayingHen.new }

  subject { hen }
  it { is_expected.to respond_to(:age) }
  it { is_expected.to respond_to(:eggs) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new LayingHen" do
        expect(hen).to be_an_instance_of LayingHen
      end
    end
  end

  describe "#age!" do
    it "increases age" do
      expect { hen.age! }.to change(hen, :age).from(0).to(1)
    end

    context "when is younger than 3 months" do
      before { 2.times { hen.age! } }
      it "eggs should be 0" do
        hen.eggs.should be(0)
      end
    end

    context "when is older than 3 months" do
      before { 4.times { hen.age! } }
      it "eggs should be 4" do
        hen.eggs.should be(4)
      end
    end
  end

  describe "#any_eggs?" do
    context "hen has laid any eggs" do
      before { 6.times { hen.age! } }
      it { hen.any_eggs?.should be true }
    end

    context "hen has not laid any eggs" do
      it { hen.any_eggs?.should be false }      
    end
  end

  describe "#pick_an_egg!" do
    context "hen has not laid any eggs" do
      it { expect { hen.pick_an_egg! }.to raise_error(NoEggsError) }
    end

    context "hen has laid any eggs" do
      before { 4.times { hen.age! } }
      it "decreases eggs" do
        expect { hen.pick_an_egg! }.to change(hen, :eggs).from(4).to(3)
      end

      it "return instance of Egg" do 
        hen.pick_an_egg!.should be_an_instance_of Egg
      end
    end
  end

  describe "#old?" do
    context "when hen is younger than 10 months" do
      it { hen.old?.should be false }
    end

    context "when hen is older than 10 months" do
      before { 10.times { hen.age! } }
      it { hen.old?.should be true }
    end    
  end

  describe "#increase_hatched_hour" do
    it { hen.increase_hatched_hour(3).should eq(3) }
  end

end# describe LayingHen

describe Egg do
  # Egg tests here
  let(:hatched_hours) { 4 }
  let(:egg) { Egg.new(hatched_hours) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Egg" do
        expect(Egg.new(hatched_hours)).to be_an_instance_of Egg
      end
    end

    context "with invalid input" do
      let(:egg) { Egg.new("a") }
      it "#rotten? raise error" do
        expect{egg.rotten?}.to raise_error(ArgumentError)
      end
    end
  end 

  describe "#rotten?" do
    context "hatched_hours are greater than 3 hours" do
      it { egg.rotten?.should be true}
    end

    context "hatched_hours are less than 3 hours" do
      let(:egg) { Egg.new(2) }
      it { egg.rotten?.should be false}
    end
  end 

end# describe Egg
