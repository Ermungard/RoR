class HomeController < ApplicationController
	# Выведение карты сайта в корень проекта
	def sitemap
		respond_to do |format|
			format.xml { render file: 'public/sitemaps/sitemap.xml' }
			format.html { redirect_to root_url }
		end
	end
end
