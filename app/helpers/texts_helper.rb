module TextsHelper
  def text_type type
    return 'text' if type == 'plain_text'
    type
  end
end
