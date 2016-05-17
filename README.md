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

@comment.presenter.content
```
