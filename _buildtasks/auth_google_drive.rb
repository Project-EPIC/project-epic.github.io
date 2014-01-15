require 'google_drive'
@session = GoogleDrive.login("cuprojectepic@gmail.com", "CrisisInformatics2014")

def session
	return @session
end