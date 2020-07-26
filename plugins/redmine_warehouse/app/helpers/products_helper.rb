module ProductsHelper
    def strtime(time)
        time.strftime(l(:time)[:formats][:default])
    end

    def toggle_sort_title
        if params.has_key?(:sort_title)
            new_sort_order = (params[:sort_title].upcase == "DESC" ? "ASC" : "DESC")
            return new_sort_order
        end
        "ASC"
    end
end
