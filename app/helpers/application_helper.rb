module ApplicationHelper
    def humanize_time(secs)
      [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].inject([]) do |s, (count, name)|
        if secs > 0
          secs, n = secs.divmod(count)
          if n > 0
            s.unshift "#{n.to_i} #{name}"
          end
        end

        s
      end.join(' ')
    end
end
