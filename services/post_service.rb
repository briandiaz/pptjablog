module PostService
	class << self
		
		def get_data(file)
			JSON.parse(File.open(File.expand_path(file, __FILE__)).read)["posts"]
		end

		def get_posts
			data = get_data("../../data/posts.json")
			posts = data.map { |data| Post.new(data) }
		end

		def find(param, value)
			posts = []
			get_posts.each do |p|
				param_post = p.send(param)
				if param_post
					# Is a tag
					if param_post.include? ","
						posts << p if param_post.split(",").map(&:strip).include?(value)
					else
						posts << p if(p.send(param).downcase == value.downcase)
					end
				end
			end
			posts
		end
		
		def all_tags
			tags_hash = Hash.new(0)
			get_posts.each do |post|
				post.tags_list.each do |tag|
					tags_hash[tag] += 1
				end
			end
			tags_hash
		end

	end	
end