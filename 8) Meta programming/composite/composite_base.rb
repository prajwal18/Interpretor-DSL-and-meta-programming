class CompositeBase
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.member_of(composite_name)
    code = %(
      attr_accessor :parent_#{composite_name}
    )
    class_eval(code)
  end

  def self.composite_of(composite_name)
    member_of composite_name

    code = %(
      def add_sub_#{composite_name}(child)
        return if sub_#{composite_name}s.include?(child)
        sub_#{composite_name}s << child
        child.parent_#{composite_name} = self
      end

      def remove_sub_#{composite_name}(child)
        return unless sub_#{composite_name}s.include?(child)
        @sub_#{composite_name}.delete(child)
        child.parent_#{composite_name} = nil
      end

      def sub_#{composite_name}s
        @sub_#{composite_name} ||= []
      end
    )
    class_eval(code)
  end
end
