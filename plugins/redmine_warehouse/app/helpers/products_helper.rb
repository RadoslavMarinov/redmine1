module ProductsHelper
    def strtime(time)
        time.strftime(l(:time)[:formats][:default])
    end

    def get_release_date(product)
        unless product.try(:release_date).nil?

            product.release_date.strftime('%Y-%m-%d')
        else  
            ""
        end
    end

    def get_issue_link(product)
        unless product.issue.nil? 
            link_to product.issue.subject, issue_path(product.issue)
        else 
            ""
        end
    end

    def toggle_sort_title
        if params.has_key?(:sort_title)
            new_sort_order = (params[:sort_title].upcase == "DESC" ? "ASC" : "DESC")
            return new_sort_order
        end
        "ASC"
    end
end
