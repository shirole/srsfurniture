###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

data.products.each do |p|
  proxy p.path + "/index.html", "product.html", :locals => { :product => p }, :ignore => true
end

# General configuration



###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  def snipcart_button (p, text)
    args = {
      :"class" => "snipcart-add-item button is-primary is-medium",
      :"data-item-id" => p.id,
      :"data-item-price" => p.price,
      :"data-item-name" => p.name,
      :"data-item-max-quantity" => p.max_quantity,
      :"data-item-url" => ENV["base-url"] + p.path,
      :"data-item-image" => p.image
    }

    content_tag :button, args do
      text
    end
  end
end


# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
