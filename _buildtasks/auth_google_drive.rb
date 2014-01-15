require 'google_drive'
@session = GoogleDrive.login("cuprojectepic@gmail.com", "password")

def session
	return @session
end