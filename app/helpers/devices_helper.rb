module DevicesHelper

  def occurences(array, ob)
    counts = {}
    # ob ? array? très mauvais nom de méthode on ne sait pas ce que c'est
    array.each do |o|
      if counts[o.device_type_id].nil?
        counts[o.device_type_id] = 1
      else
        counts[o.device_type_id] += 1
      end
    end
    return counts[ob.id]
  end

end

