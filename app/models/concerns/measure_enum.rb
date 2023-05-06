module MeasureEnum
  OPTIONS = {
    package: { string: "package", value: "pkg" },
    bag: { string: "bag", value: "bag" },
    box: { string: "box", value: "box" },
    kilogram: { string: "kg", value: "kg" },
    gram: { string: "gram", value: "gram" },
    item: { string: "item", value: "item" },
    bottle: { string: "bottle", value: "bottle" },
  }
  class << self
    def options_as_input
      OPTIONS.map { |set| [set.second[:string], set.second[:value]] }
    end
  end
end
