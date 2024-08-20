require_relative './composite_base'

class Species < CompositeBase
  composite_of(:classification)
end
