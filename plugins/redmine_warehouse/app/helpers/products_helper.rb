module ProductsHelper
    def strtime(time)
        time.strftime(l(:time)[:formats][:default])
    end
end
