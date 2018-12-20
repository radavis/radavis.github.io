# Skill Sharing via Slack

1. Create Slack custom Profile Field: `Tech Skills`
2. Ask Employees to fill out this field
3. Hubot Worker: Consume Slack API, build javascript object:
  {
    'skill name': ['slack-handle1', 'slack-handle2']
  }
4. Hubot Responder: "I need help with X." -> The following people could help you with that...


## Hubot Worker

- Setup task on cron job
  * Read Tech Skills from Slack Profiles for the team
  * Build JS skills object


## Hubot Responder

- Input: skill name
- Output: array of slack handles


## Notes

### Setup

Getting cowbot up and running requires setting a number of environment variables

```
# .hubot.env
export HUBOT_S3_BRAIN_ACCESS_KEY_ID=
export HUBOT_S3_BRAIN_SECRET_ACCESS_KEY=
export HUBOT_S3_BRAIN_BUCKET=
export HUBOT_SLACK_TOKEN=
```

## Docker Compose

[Get started with Docker Compose](https://docs.docker.com/compose/gettingstarted/)


## Node.js HTTPS library

[http.request](https://nodejs.org/docs/latest-v8.x/api/http.html#http_http_request_options_callback)


## Slack API

* [Authentication](https://api.slack.com/web#authentication)
* [Methods](https://api.slack.com/web#methods)
* [Apps](https://api.slack.com/apps)

Depending on the level of API access you want, you may need to create a Slack Application.


## Redis

[try.redis.io](https://try.redis.io/)

key-value store

Data points I would like to store:

* slack user id
* slack handle (or "display name")
* tech skills array
