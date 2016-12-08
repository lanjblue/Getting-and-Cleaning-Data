library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("Quiz2",
  key = "a24369f7261bd60da300",
  secret = "4090ee0f41217858820dc91590992a0ca884affb")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
#gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
#stop_for_status(req)
#content(req)

# USE API:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)
