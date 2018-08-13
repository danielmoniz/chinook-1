class Track < ApplicationRecord

  validates :composer, :name, presence: true
  validates :name, length: { minimum: 2 }
  validate :name_starts_with_capital_letter

  def name_starts_with_capital_letter
    # get first letter from self.name
    first_letter = self.name[0]
    # if first letter is not capitalized, add an error
    if first_letter == first_letter.downcase
      self.errors.add(:name, "must start with a capitalized first letter.")
    end
  end

  def self.short
    return self.less_than(180000)
    # return self.where("milliseconds <= ?", 180000)
  end

  def self.long
    return self.more_than(300000)
    # return self.where("milliseconds > ?", 300000)
  end

  def self.medium
    return self.more_than(180000).less_than(300000)
    # return self.where("milliseconds > ?", 180000).where("milliseconds <= ?", 300000)
  end

  def self.less_than(length)
    return self.all if length == nil
    # if length == nil
    #   return self.all
    # end
    return self.where("milliseconds <= ?", length)
  end

  def self.more_than(length)
    return self.where("milliseconds > ?", length)
  end

  # def self.compare_to(length, comparison)
  #   query = "milliseconds #{comparison} ?"
  #   return self.where(query, length)
  # end
end
