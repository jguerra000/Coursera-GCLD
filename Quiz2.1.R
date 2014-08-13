 
 ##Register an application with the Github API here https://github.com/settings/applications. 
# Access the API to get information on your instructors repositories 
# (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 
# Use this data to find the time that the datasharing repo was created.
# What time was it created? 
# This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
# You may also need to run the code in the base R package and not R studio.

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("myOauthAPP", key = "17601368c08ec426c177", secret = "9a9b4f8e69dc1f75cfb3744c9fe75bc90e52611d")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

#5 parse JSON
library(jsonlite)
content2 = content (req, as="parsed")
tidy_data <- fromJSON(toJSON(content2))
tidy_data$created_at[tidy_data$name == "datasharing"]
##Answer:
##"2013-11-07T13:25:07Z"

