class ActivityFeed

  def which_item(input)
    input.map do |hash|
      hash["sentence"].scan(/{(\w+)}/)
    end.flatten
  end

  def wanted_items(input)
    items_to_sub = []
    which_item(input).each do |item|
      input.each do |hash|
        items_to_sub << hash["objects"][item]["text"]
      end
    end
    items_to_sub
  end

  def put_together(input)
    input.map do |hash|
      hash["sentence"].gsub(which_item(input)[0], wanted_items(input)[0]).gsub(which_item(input)[1], wanted_items(input)[1]).gsub(which_item(input)[2], wanted_items(input)[2]).gsub('{', '').gsub('}', '')
    end.join
  end


end