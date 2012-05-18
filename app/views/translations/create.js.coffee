sid = '<%= "##{@translation.word.id}" %>'
id  = '<%= "#s#{@translation.word.id}"%>'

$(id).replaceWith '<%= render partial: 'words/word_row', object: @translation.word %>'
attach_events()
