require "csv"
5
class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @elements << element
    save_csv
    @next_id += 1
  end

  private

  def load_csv
    CSV.foreach(@csv_path, { headers: :first_row, header_converters: :symbol }) do |row|
      convert(row)
      @elements << create_instance(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb', headers: :first_row) do |csv|
      csv << headers
      @elements.each do |element|
        csv << save_element(element)
      end
    end
  end
end