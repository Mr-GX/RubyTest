class Product < ApplicationRecord
	#商品按title排序
	#default_scope{where(:order=>'title')}
	#根据一个或多个条件验证一个或多个模型字段，:presence=>true核实每个已命名的字段都存在，并且其内容不为空
	validates :title,:image_url,:desc,:presence => true
	validates :title ,:uniqueness => true
	validates :image_url ,:format => {:with => %r(\.(gif|jpg|png)$)i,
																   	:message => 'must be a URL for GIF,JPG or PNG image',
																 		:multiline => true}
	validates :price ,:numericality => {:greater_than_or_equel_to => 0.01}
end