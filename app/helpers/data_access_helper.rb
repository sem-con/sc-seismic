module DataAccessHelper
    def getData(params)
        location = true
        if ((params["lat"].to_s != "") &&
            (params["long"].to_s != "") &&
            (params["radius"].to_s != ""))
                lat = params["lat"].to_f
                long = params["long"].to_f
                radius = params["radius"].to_f
                Geokit::default_units = :kms
                Geokit::default_formula = :sphere
                home=Geokit::LatLng.new(lat, long)
        else
            location = false
        end
        if radius == 0.0
            radius = 1000
        end
        duration = params["duration"].to_i
        if duration == 0
            duration = 365
        end
        last = params["last"].to_i

        response = HTTParty.get('http://geoweb.zamg.ac.at/static/event/lastday.json')
        if response.code.to_s == "200"
            data = []
            # iterate over all elements
            response.parsed_response["features"].each do |item|
                time = item["properties"]["time"]
                id = item["id"].to_i
                if location
                    point = Geokit::LatLng.new(item["properties"]["lat"], 
                                               item["properties"]["lon"])
                    distance = home.distance_to(point)
                end
                if ((!location || (location && (distance <= radius))) &&
                    (Date.parse(time) >= Date.today-duration.days) &&
                    (id > last))
                        data << JSON({ "lat": item["properties"]["lat"],
                                  "long": item["properties"]["lon"],
                                  "alt": -1 * item["properties"]["depth"],
                                  "magnitude": item["properties"]["mag"].to_f,
                                  "magnitudeType": item["properties"]["magtype"], 
                                  "eventType": item["properties"]["evtype"],
                                  "auth": item["properties"]["auth"],
                                  "sourceId": item["properties"]["source_id"],
                                  "time": item["properties"]["time"],
                                  "lastUpdate": item["properties"]["lastupdate"] }.stringify_keys)
                end
            end

            data
         else
            []
        end
    end
end