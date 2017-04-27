class PlaylistsController < ApplicationController
	def index
		redirect_to	'/songs'
	end

	def create
		playlist = Playlist.new(playlist_params)
		playlist.user_id = session[:user_id]
		if playlist.save
			flash[:play_success] = "Successfully added to playlist"
		else
			flash[:play_error] = song.errors.full_messages
		end
		redirect_to '/songs'
	end

	def destroy
		playlist = playlist.where(playlist_params)
		playlist.last.destroy
		redirect_to '/songs'
	end

	private
		def playlist_params
			params.permit(:user_id, :song_id)
		end
end
