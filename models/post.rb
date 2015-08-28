class Post

	attr_accessor :id, :title, :tags, :description, :author

	def initialize(params = {})
		self.id = params["id"]
		self.title = params["title"]
		self.tags = params["tags"]
		self.description = params["description"]
		self.author = params["author"]
	end

	def tags_list
		self.tags.split(",").map(&:strip)
	end

	def short_description
		self.description.split(' ')[0..10].join(" ")
	end

	def self.by_id(id)
		PostService.find("id", id)
	end

	def self.by_author(author)
		PostService.find("author", author)
	end

	def self.by_tag(tag)
		PostService.find("tags", tag)
	end

	def self.all
		PostService.get_posts
	end


end

p = Post.new(
	{"id" => 1, "title" => 2}
)
puts p.send("id")