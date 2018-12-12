require './app/services/video_validation'
# require 'pry'

namespace :video do
  desc 'Ensures the position attribute on Videos is not nil'
  task position_validation: :environment do
    log = ActiveSupport::Logger.new('log/video_position_validation.log')
    start_time = Time.now
    video_count = Video.count
    completed = 0
    
    log.info "Task started at #{start_time}"
    
    Video.find_each do |video|
      VideoValidation.new(video).validate
 
      completed += 1
      print("\r#{completed} of #{video_count} Videos Validated") 
      log.info "#{completed} of #{video_count} - #{video.title}"
    end
    print("\nValidation Complete")
    end_time = Time.now
    duration = ((start_time - end_time) / 1.minutes).round(4)
    log.info "Task finished at #{end_time} and lasted #{duration} minutes."
    log.close
  end
end