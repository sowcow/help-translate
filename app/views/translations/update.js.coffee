sid = '<%= "##{@translation.sentence.id}" %>'
id  = '<%= "#s#{@translation.sentence.id}" %>'

$(id).replaceWith '<%= render partial: 'documents/sentence_row', object: @translation.sentence %>'
attach_events()