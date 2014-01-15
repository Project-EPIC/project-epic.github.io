require 'google_drive'
@session = GoogleDrive.login("cuprojectepic@gmail.com", "password here")

def session
	return @session
end