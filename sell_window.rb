#!/usr/bin/env ruby

price = [4,5,4,3,4,5,6,6,7,8,7,6,5,4,3,2,1,2,3,4,3,4,5,6,5,5,4,5,6,7,8,9,8,7,6,5,4]

puts '—' * price.length
price.max.downto(price.min) do |y|
  price.each {|x| print y == x ? '•' : ' ' }
  puts
end
puts '—' * price.length

__END__

—————————————————————————————————————
                               •     
         •                    • •    
        • •                  •   •   
      ••   •           •    •     •  
 •   •      •         • •• •       • 
• • •        •     • •    •         •
   •          •   • •                
               • •                   
                •                    
—————————————————————————————————————
