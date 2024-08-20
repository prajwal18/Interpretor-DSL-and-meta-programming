require_relative './composite_base'

class Jungle < CompositeBase
  composite_of(:population)
end
