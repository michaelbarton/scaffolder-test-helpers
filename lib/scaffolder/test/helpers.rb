require 'tempfile'
require 'bio'
require 'scaffolder'

require 'scaffolder/test/sequence'
require 'scaffolder/test/unresolved'
require 'scaffolder/test/annotation'

module Scaffolder::Test
  module Helpers

    def generate_scaffold_files(entries)
      [write_scaffold_file(entries),write_sequence_file(entries)]
    end

    def write_scaffold_file(entries,file = Tempfile.new("scaffold"))
      File.open(file.path,'w') do |tmp|
        tmp.print(YAML.dump(entries.map{|e| e.to_hash }))
      end
      file
    end

    def write_sequence_file(entries,file = Tempfile.new("sequence"))
      File.open(file.path,'w') do |tmp|
        entries.each do |entry|
          tmp.puts(entry.to_fasta) if entry.respond_to? :to_fasta
        end
      end
      file
    end

    def generate_gff3_file(records,file = Tempfile.new("gff"))
      gff = Bio::GFF::GFF3.new
      gff.records = records.map{|r| r.to_gff3_record}
      File.open(file.path,'w'){|out| out.print(gff) }
      file
    end

  end
end
