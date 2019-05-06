class AddressSearchService

  CSV_FILE = "#{Rails.root}/doc/KEN_ALL.CSV"

  attr_accessor :arr

  def initialize
    @arr = []
    get_address_by_csv
  end

  def all
    [].tap do |arr|
      @arr.each { |rec| arr << rec[:address] }
    end
  end

  def search(key_word)
    @arr ||= get_address_by_csv
    [].tap do |arr|
      @arr.each { |rec| arr << rec[:address] if match?(rec[:key_words], key_word) }
    end
  end

  private

  def get_address_by_csv
    require 'csv'

    data = CSV.read(CSV_FILE, encoding: 'CP932')
    data.each_slice(500) do |arr|
      arr.each do |(jis, upper_code, postal_code, prifecture_kana, city_kana, area_kana,
                    prifecture, city, area)|
        if postal_code.match(/0000\z/)
          rec = "'#{postal_code}','#{prifecture}','#{city}',''"
          key_words = split_key_word("#{prifecture}#{city}")
        else
          rec = "'#{postal_code},'#{prifecture}','#{city}','#{area}'"
          key_words = split_key_word("#{prifecture}#{city}#{area}")
        end
        @arr << { address: rec, key_words: key_words }
      end
    end
    @arr
  end

  def split_key_word(str)
    str.each_char.each_cons(2).map{|chars| chars.join }
  end

  def match?(key_words, word)
    (key_words & split_key_word(word)).count.positive?
  end
end
