## hugo setup
steps taken on first hugo deployment  
[hugo quickstart](http://gohugo.io/overview/quickstart/)

- [ ] Merlin small council blog
- [ ] BISS BI blog
	+ scot-challenge project
	+ blog

### short summary
1. `hugo new site <sitename>`
2. `hugo new post/<postname>.md`
3. `mkdir themes`
4. `git clone <theme-repo>`
5. `hugo server --theme=<theme-name> --buildDrafts`

### steps

	brew update && brew install hugo

ignore Pygments syntax highlighting for now

	hugo help						# got it?
	hugo version

let's get started. hugo creates the new directory

	hugo new site small-council

it's ***fast!***

	cd small-council; tree -a
		.
		├── archetypes				# custom front matter on `hugo new`
		├── config.toml				# `baseurl`, `title`, and other configs
		├── content					# subdirectory for each section like: blog, projects, about
		├── data					# config generator content
		├── layouts					# conversion standards
		├── public					# (the generated site is here, not created until hugo builds)
		└── static					# images, CSS, javascript

	hugo new post/small-council-2016-04-18.md
		post /.../... created

head matter is auto-generated according to config, currently written in TOML:

	+++
	date = "2016-04-08T17:12:48-07:00"
	draft = true
	title = "small council 2016 04 18"
	
	+++

i'll make some changes there later, but let's look at it.

	hugo server
	...
		Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
		Press Ctrl+C to stop

http://localhost:1313/ is blank, because its saved as a draft and I haven't specified a template yet. we can build the page as a draft

	hugo server --buildDrafts

still nothing, until a theme is loaded

#### themes
##### single theme load
	mkdir themes && cd themes
	git https://github.com/jaden/twentyfourteen.git
	hugo server --theme=twentyfourteen --buildDrafts

##### load all themes
	git clone --recursive https://github.com/spf13/hugoThemes.git themes
	hugo -t twentyfourteen

that loads the twentyfourteen theme, again drafts not rendered.

	hugo server --theme=twentyfourteen --buildDrafts

and it works!!

*I suggest saving the themes repo somewhere (500MB) and symlinking themes I'll use into the site folders*

### dialing it in
now that you have some content pages (not drafts), you can start the server with other themes

	hugo -t grid-side					# try a bunch

- [ ] there are tutorial notes about customizing with new images, etc. come back to that

### maintaining this blog
for the Merlin scmall council blog, i'll include a page on how to maintain the blog site.

	hugo new maintain-this-blog/readme.md



	
