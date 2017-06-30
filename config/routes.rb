Rails.application.routes.draw do
  get 'most_relevants', to: 'tweets#most_relevants'
  get 'most_mentions', to: 'tweets#most_mentions'
end
