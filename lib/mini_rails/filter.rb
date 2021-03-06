module MiniRails
  module Filter
    extend ActiveSupport::Concern

    included do
      class_attribute :before_filters, :after_filters, :around_filters
      self.before_filters = []
      self.after_filters = []
      self.around_filters = []
    end

    module ClassMethods
      def before_filter(filter)
        self.before_filters << filter
      end

      def after_filter(filter)
        self.after_filters << filter
      end

      def around_filter(filter)
        self.around_filters << filter
      end

    end

    def filter
      run_block = lambda do
        before_filters.each { |bf| self.send bf}
        yield
        after_filters.each { |af| self.send af}
      end

      around_filters.reverse.each do |arf|
        pass_block = run_block
        run_block = lambda { self.send arf, &pass_block }
      end
      run_block.call
    end
  end
end

# active model callback 版

# module MiniRails
#   module Filter
#     extend ActiveSupport::Concern
# 
#     included do
#       # class_attribute :before_filters, :after_filters, :around_filters
#       # self.before_filters = []
#       # self.after_filters = []
#       # self.around_filters = []
#       include ActiveSupport::Callbacks
#        define_callbacks :filter
#     end
# 
#     module ClassMethods
#       def before_filter(filter)
#         set_callback :filter, :before, filter
#       end
# 
#       def after_filter(filter)
#         set_callback :filter, :after, filter
#       end
# 
#       def around_filter(filter)
#         set_callback :filter, :around, filter
#       end
# 
#     end
# 
#     def filter(&block)
#       run_callbacks :filter do
#         block.call
#       end
#     end
#   end
# end