  class Rectangle
      def initialize(l,b)
        @lenght=l
        @breath=b
      end

      def parameter
          2*(@lenght + @breath)
      end

      def area
         @lenght  * @breath
      end
  end


  rect = Rectangle.new(10,20)
  puts rect.area