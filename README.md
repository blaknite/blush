# Blush

Make your models fit for presentation. View Models for Rails.

## Installation

```ruby
gem 'blush'
```

## Usage

```ruby
class Comment < ActiveRecord::Base
  has_presenter
end

class CommentPresenter < Blush::Presenter
  def content
    h.simple_format(object.content)
  end
end

# explicitly call the presenter methods
@comment.presenter.content

# delegate to the model if method doesn't exist on presenter
@comment.present(:content)
```
