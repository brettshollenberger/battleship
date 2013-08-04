class Array
  def sorted?
    self.sort == self
  end

  def ordered_list?
    self.sorted? && self.by_ones?
  end

  def by_ones?
    self.map! { |num| num.to_i }
    (1..self.length - 1).each { |num| return false unless self.first == self[num] - num }
    return true
  end
end
