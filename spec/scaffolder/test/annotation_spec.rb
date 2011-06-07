require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Scaffolder::Test::Annotation do

  describe "initialization" do

    context "with all parameters" do
      subject do
        described_class.new(
          :seqname => 'c1', :start => 4, :end     => 6,
          :strand  => '+',  :phase => 1, :feature => 'CDS')
      end

      its(:seqname){should == 'c1'}
      its(:start)  {should == 4}
      its(:end)    {should == 6}
      its(:strand) {should == '+'}
      its(:phase)  {should == 1}
      its(:feature){should == 'CDS'}
    end

    context "using default parameters" do
      subject do
        described_class.new
      end

      its(:seqname){should == 'record'}
      its(:start)  {should == 1}
      its(:end)    {should == 10}
      its(:strand) {should == '+'}
      its(:phase)  {should == 1}
      its(:feature){should == 'CDS'}
    end

  end

  describe "#to_gff3_record" do

      subject do
        described_class.new.to_gff3_record
      end

      it "should generate a Bio::GFF::GFF3::Record" do
        expected = Bio::GFF::GFF3::Record.new(
          subject.seqname, nil, subject.feature, subject.start,
          subject.end,     nil, subject.strand,  subject.phase)
        subject.should == expected
      end

  end

end
