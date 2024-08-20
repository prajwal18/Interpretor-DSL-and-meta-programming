require_relative './composite_base'

class Pine < CompositeBase
  member_of(:population)
  member_of(:classification)
end
