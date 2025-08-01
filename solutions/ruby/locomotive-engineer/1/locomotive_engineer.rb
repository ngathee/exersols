class LocomotiveEngineer
  def self.generate_list_of_wagons(*wargon_ids)
    wargon_ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    second_last, last , *rest = each_wagons_id 
    first, *remaining = rest 
    [first, *missing_wagons, *remaining, second_last, last]
  end

  def self.add_missing_stops(route, **stops_info)
    {**route, stops: stops_info.values }
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
