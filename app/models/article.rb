class Article < ApplicationRecord
	has_one_attached :image
	has_many :tag_relationships, dependent: :destroy
	has_many :tags, through: :tag_relationships
	belongs_to :author
	validates :title, presence: true
	validates :name, presence: true
	validates :body, presence: true, length: { maximum: 500 }

	def save_tags(tag_lists)
		tag_lists.each do |tag_name|
			p 'デバック２'
			p tag_name.strip
			# tagsを指定することで、tagsテーブルにアクセスできる。
			self.tags.find_or_create_by(name: tag_name.strip)
		end
	end

	def update_tags(latest_tags)
		# すでに登録したタグがない
		if self.tags.empty?
			latest_tags.each do |latest_tag|
				self.tags.find_or_create_by(name: latest_tag.strip)																																
			end
		# 更新しているのに、タグがない
		elsif latest_tags.empty?
			self.tags.each do |tag|
 				self.tags.delete(tag)
			end
		# すでに登録したがあり、更新のタグもある場合
		else
			# 既存のタグと最新のタグの差分
			##  どのタグを追加し、どのタグを追加しなくてよいか見極める
			current_tags = self.tags.pluck(:name)
			# 新しくタグを追加しようとするが、もともとあったタグを調べる
			old_tags = current_tags - latest_tags
			# 新しくタグを追加するときに、もともとないタグ
			new_tags = latest_tags - current_tags

			#old_tagはタグの名前だけなので、タグのレコードも取得する
			old_tags.each do |old_tag|
				tag = self.tags.find_by(name: old_tag.strip)
			# 新しいタグと重複しないように、もともとあるタグを消す。
			# ただし、ある記事とタグを関連付け、特定の名前のタグを消す。
				self.tags.delete(tag) if tag.present?
			end

			# 新しいタグを追加する
			new_tags.each do |new_tag| 
				self.tags.find_or_create_by(name: new_tag.strip)
			end
		end
	end
end