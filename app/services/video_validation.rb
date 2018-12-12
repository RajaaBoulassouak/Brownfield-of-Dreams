class VideoValidation
  attr_reader :video
  def initialize(video)
    @video = video
  end

  def validate
    max_pos = @video.tutorial.videos.maximum(:position)
    if video.position.nil?
      video.update_attributes(position: max_pos + 1)
    end
  end
end