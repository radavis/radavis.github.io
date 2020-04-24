# PDF Generation in Rails

Generate PDFs via
[PDFKit](https://github.com/pdfkit/pdfkit),
which is dependent upon
[wkhtmltopdf](https://wkhtmltopdf.org).

To change how PDFKit operates, see `config/initializers/pdfkit.rb`.

```
# Aptfile
libssl1.0.0
```

```ruby
# Gemfile
gem 'pdfkit', '~> 0.8.4'

group :development, :test do
  gem 'wkhtmltopdf-binary-edge', '~> 0.12.4.0'
end

group :production do
  gem 'wkhtmltopdf-heroku', '~> 2.12.4.0'
end
```

```erb
<%# view %>
<%= link_to 'Download PDF', model_path(@model, format: :pdf) %>
```

```ruby
# mpp/config/initializers/pdfkit.rb

Rails.application.configure do
  # configuration options: https://wkhtmltopdf.org/usage/wkhtmltopdf.txt
  pdf_options = {
    print_media_type: true,
    margin_bottom: '10mm',
    margin_left: '10mm',
    margin_right: '10mm',
    margin_top: '10mm',
    # viewport_size: '1024x768',
    viewport_size: '1280x720',
    # disable_smart_shrinking: true,
    # page_size: 'letter',
    # dpi: 400,
    lowquality: true
  }

  config.middleware.use PDFKit::Middleware, pdf_options
end
```

## References

* [wkhtmltopdf options](https://wkhtmltopdf.org/usage/wkhtmltopdf.txt)
* [wkhtmltopdf page sizes](https://stackoverflow.com/questions/6394905/wkhtmltopdf-what-paper-sizes-are-valid)
* [Fix wkhtmltopdf small output on macOS](https://stackoverflow.com/a/42752934/2675670)
* [wkhtmltopdf on Heroku](https://razorjack.net/wkhtmltopdf-on-heroku-evaluating-different-installation-options/)
