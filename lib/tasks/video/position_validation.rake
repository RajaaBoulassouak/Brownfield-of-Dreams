namespace :video do
  desc 'Ensures the position attribute on Videos is not nil'
  task position_validation: :environment do
    log = ActiveSupport::Logger.new('log/video_position_validation.log')
    start_time = Time.now
    video_count = Video.count
    completed = 0.0
    
    log.info "Task started at #{start_time}"
    
    Video.find_each do |video|
      max_pos = video.tutorial.videos.maximum(:position)
      if video.position.nil?
        video.update_attributes(position: max_pos + 1)
      end
      completed += 1
      percentage = (completed/video_count) * 100
      print("\r#{percentage.to_i}% of Videos Validated") 
    end
    print("\nValidation Complete")
    end_time = Time.now
    duration = (start_time - end_time) / 1.minute
    log.info "Task finished at #{end_time} and last #{duration} minutes."
    log.close
  end
end