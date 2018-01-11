json.version 'https://jsonfeed.org/version/1'
json.title 'ACME Content'
json.feed_url 'https://www.acmecontent.net/feed.json'

  json.feed do |feed|
    byebug
    feed.title "Events"
  end

json.items @events do |event|
  byebug
  json.id event.id
  json.context_text event.title
  json.url post_url(post)
end

<%= auto_discovery_link_tag(:json, { controller: 'feeds/default', action: 'index' }, { title: 'Recent prompts', type: 'application/json' }) %>
