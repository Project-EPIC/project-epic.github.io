# Flickr Set Tag.
#
# Example:
#
#   {% flickr_set 72157625102245887 %}  Where 7215... is the id of the image set on flickr
#
# Original Author: Thomas Mango
# Site: http://thomasmango.com
# Plugin Source: http://github.com/tsmango/jekyll_flickr_set_tag
# Site Source: http://github.com/tsmango/thomasmango.com
# Plugin License: MIT

# This plugin is an example of a Liquid Filter plugin
# Originally modified by Jennings in Dec. 2013 to call in Tags, Descriptions, etc


require 'net/https'
require 'uri'
require 'json'

module Jekyll
  class FlickrSetTag < Liquid::Tag
    def initialize(tag_name, config, token)
      super

      @set  = config.strip

      @config = Jekyll.configuration({})['flickr_set'] || {}

      @config['gallery_tag']   ||= 'div'
      @config['gallery_class'] ||= 'gallery'
      @config['a_href']        ||= nil
      @config['a_target']      ||= '_blank'
      @config['image_rel']     ||= ''
      @config['thumbnail_size']||= 's'
      @config['api_key']       ||= '35803a3211f8a14f2365e0c275eb994a'
    end

    # This function actually renders the image set.
    def render(context)
      #html = "<#{@config['gallery_tag']} id=\"#{@set}\" class=\"flickr_photo_set\">"
      #html = "<#{@config['gallery_tag']} id=\"#{@set}\" class=\"jcarousel\">"
      html = "<ul id=\"#{@set}\" class=\"slider\">"

      photos.each do |photo|
        #This is for a carousel
        html << "<li class=\"flickr_photo_single_image\">"
        html << "<img src=\"#{photo.url('b')}\" " #b is the large size, original url is different.
        html << "title=\"#{photo.title}\" "
        html << "description=\"#{photo.desc}\" "
        html << "link=\"#{photo.link}\"/></li>"
      end

      html << "</ul>"

      return html
    end

    def photos
      @photos = Array.new
      JSON.parse(json)['photoset']['photo'].each do |item|
        @photos << FlickrPhoto.new(item['title'], item['id'], item['secret'], item['server'], item['farm'], item['tags'], item['description'], @config['thumnail_size'])
      end

      @photos.sort  #Returns the Sorted Photo Set (Sorted by title? -- this can be altered)
    end

    def json
      uri  = URI.parse("http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&photoset_id=#{@set}&api_key=#{@config['api_key']}&format=json&nojsoncallback=1&extras=tags,description")
      http = Net::HTTP.new(uri.host, uri.port)
      return http.request(Net::HTTP::Get.new(uri.request_uri)).body
    end
  end

  class FlickrPhoto
    attr_reader :title, :tag, :link

    def initialize(title, id, secret, server, farm, tags, description, thumbnail_size)
      @title          = title
      @url            = "http://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
      @thumbnail_url  = url.gsub(/\.jpg/i, "_#{thumbnail_size}.jpg")
      @tag = tags.split[0]
      @description = description
      @link = "http://www.google.com"
    end

    def desc
      return @description['_content']
    end

    def url(size_override = nil)
      return (size_override ? @thumbnail_url.gsub(/_#{@thumbnail_size}.jpg/i, "_#{size_override}.jpg") : @url)
    end

    def thumbnail_url
      return @thumbnail_url
    end

    def <=>(photo)
      @title <=> photo.title
    end
  end
end

Liquid::Template.register_tag('flickr_set', Jekyll::FlickrSetTag)

