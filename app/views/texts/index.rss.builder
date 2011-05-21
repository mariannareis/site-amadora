xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do
   xml.title       "Páginas do amadora.ws"
   xml.link        url_for :only_path => false, :controller => 'pages'
   xml.description "Am(a²)dora... Fall in love!"

   @pages.each do |page|
     xml.item do
       xml.title       page.title
       xml.link        url_for :only_path => false, :controller => 'pages', :action => 'show', :id => page.id
       xml.description page.page_parts
       xml.guid        url_for :only_path => false, :controller => 'page', :action => 'show', :id => page.id
     end
   end

 end
end

