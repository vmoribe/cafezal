if Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-linux-amd64"
else
  # Linux (check your processor for Intel x86 or AMD x64)
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-i386"
  # OS X
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-0.9.9-OS-X.i386"            
  # Windows
  # wkhtmltopdf_path = 'C:\Program Files/wkhtmltopdf/wkhtmltopdf.exe'
end

WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path }