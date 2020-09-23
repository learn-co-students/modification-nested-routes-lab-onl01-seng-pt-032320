module SongsHelper
    def artist_select(song, nested = false)
        if song.artist.nil?
            if !nested
                select_tag "song[artist_id]", options_from_collection_for_select(Artist.all,:id, :name)
            else
                text_field_tag "song[artist_name]"
            end
        else
            hidden_field_tag "song[artist_id]", song.artist_id
            if nested
                text_field_tag "song[artist_name]", song.artist.name
            else
                select_tag "song[artist_id]", options_from_collection_for_select(Artist.all,:id, :name)
            end
        end
    end
end
