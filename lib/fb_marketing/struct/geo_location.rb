module FbMarketing
	class Struct
		class GeoLocation < Struct
			register_attributes(
				custom: [
					:countries, # array of country codes
					:regions, # array of {key:ids}
					:cities, # array of hashes
					:zips
					#:custom_locations,
					#:geo_markets,
					#:location_types
				]
			)

			class Key < Struct
				register_attributes(
					raw: [:key]
				)
			end

			class City < Struct
				register_attributes(
					raw: [:key, :radius, :distance_unit]
				)
			end

			def initialize(attributes = {})
				if attributes.include?(:countries)
					self.countries = FbGraph2::Collection.new(attributes[:countries])
				end
				if attributes.include?(:regions)
					self.regions = FbGraph2::Collection.new(attributes[:regions]).collect! do |param|
						Key.new param
					end
				end
				if attributes.include?(:cities)
					self.cities = FbGraph2::Collection.new(attributes[:cities]).collect! do |param|
						City.new param
					end
				end
				if attributes.include?(:zips)
					self.zips = FbGraph2::Collection.new(attributes[:zips]).collect! do |param|
						Key.new param
					end
				end
			end

		end
	end
end