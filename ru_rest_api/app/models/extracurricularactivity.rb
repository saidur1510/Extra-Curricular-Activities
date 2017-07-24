class Extracurricularactivity < ApplicationRecord
	validates_presence_of :name, :department, :interest
end
