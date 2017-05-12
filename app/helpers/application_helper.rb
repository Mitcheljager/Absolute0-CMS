module ApplicationHelper
  def componentsList(url = "app/views/components/items/admin")
    a = Dir.entries(Rails.root.join(url))
    a -= ['.', '..']
    b = ["_",".html.erb"]
    a.each do |p|
      b.each {|x| p.slice!(x) }
    end
  end
end
