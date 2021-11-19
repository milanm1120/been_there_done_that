class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end


#this file is used to let ApplicationRecord grab data from ActiveRecord::Base. Our other models will then grab from ApplicationRecord.
#This way only one file is pulling from ActiveRecord::Base (single source of truth)
