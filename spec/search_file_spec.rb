#  file_path      :string
#  file_extension :string

require_relative '../search_file'

RSpec.describe SearchFile do
  # RESPOND TO
  [:file_path, :file_extension].each do |attr|
    it "should respond to #{attr}" do
      @search_file = SearchFile.new(file_path: "#{Dir.pwd}/spec/fixtures/teste.txt")
      expect(@search_file).to respond_to attr
    end
  end

  # TESTING SET FILE EXTENSION
  ["txt", "rtf", "doc", "docx"].each do |file_extension|
    describe "when a search_file is created with a .#{file_extension} file" do
      before(:each) do
        @search_file = SearchFile.new(file_path: "#{Dir.pwd}/spec/fixtures/teste_#{file_extension}.#{file_extension}")
      end

      it 'should set the right file_extension' do
        expect(@search_file.file_extension).to eq(file_extension)
      end
    end
  end

  # TESTING GET SEARCHES
  describe 'when a search_file is uploaded' do
    it 'should set the right search_files' do
      expect{
        @search_file = SearchFile.new(file_path: "#{Dir.pwd}/spec/fixtures/teste.txt")
      }.to change {
        SearchFile.count
      }.by(1)
    end

    it 'should set the right booking_searches' do
      expect{
        @search_file = SearchFile.new(file_path: "#{Dir.pwd}/spec/fixtures/teste.txt")
      }.to change {
        BookingSearch.count
      }.by(3)
    end
  end
end
