# radavis.github.io

My blog.

## rack-jekyll and Heroku

Maintain a separate `drafts` branch that is deployed to Heroku and secured with
jekyll-auth

```
$ git checkout drafts
$ jekyll build --drafts
$ git push heroku HEAD:master
```

## Resources

* [GitHub Pages](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)
* [Jekyll Docs](http://jekyllrb.com/docs/home/)
* [Deploying Rails Applications with Puma](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server)
* [Jekyll on Heroku](https://blog.heroku.com/jekyll-on-heroku)
