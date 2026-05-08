# Coconauts Blog & Website

This is the Jekyll-powered website and blog for Coconauts.


## Cookbook

The `jekyll4` branch is setup to automatically deploy on every push using github pages.

Posts go in `/_posts`, assets for posts in `/images`.

Theme is set up in `_config.yml` and is customized, as per official instructions: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll


Running:

```bash
# Using Docker 
docker compose up

# Or locally with Jekyll
bundle install
bundle exec jekyll serve
```


## Migration from octoporess

Old coconauts blog was made with octopress, and migrated by javier to use Jekyll4. Process was:

- generate a fresh jekyll template as described here https://jekyllrb.com/docs/
- copy over the posts and assets, modify img tags, which were different
- add some customizations for the projects page and `<--more-->` tags
- set up the homepage to be the main company splash site, and the actuall blog to live in /blog


## Known issues

The migration was a bit hacky and some things do not work properly: for example, the css and favicon. This is due in part to idiosincrasies of the minima theme that have not been followed (saas structure is not the same as with regular jekyll themes, it would seem), and the fact the the blog does not live in the root (for example: the favicon works at the root, but not in /blog). Also when trying to change the theme via the _config.yml, other themes don't seem to work.

--------


The following was written by claude, take with a grain of salt:


## Structure

- 

## Site Structure

- **`index.html`** - The main landing page showcasing Coconauts services, team, expertise, and contact information. This is the homepage visitors see first.
- **`blog.markdown`** - The blog listing page that powers the Jekyll blog functionality and displays recent posts
- **`blog/_posts/`** - Directory containing all blog posts in Markdown format
- **Configuration**: Posts are configured via `_config.yml` with `collections_dir: blog` and excerpt support using `<!--more-->` tags
- **`blog/projects/`** - Directory containing individual project pages in Markdown format
- **`blog/_site`** - Local build of the static site

Assets & Media

- **`blog/assets/`** - Blog-specific stylesheets and images
- **`blog/images/posts/`** - Individual post images organized by date/topic
- **`blog/images/projects/`** - Project screenshots and media
- **`blog/images/carousel/`** - Featured project images


```
index.html              # Main company landing page
blog/
    blog.markdown       # Blog listing page (Jekyll template)
    _posts/            # All blog posts
    projects/          # Project pages
    assets/            # Stylesheets and assets
    images/            # All images (posts, projects, etc.)
_config.yml            # Jekyll configuration
```

## Technical Details

### Jekyll Configuration
- **Jekyll Version**: GitHub Pages compatible (Jekyll ~3.10)
- **Posts Location**: `blog/_posts/` (configured via `collections_dir: blog`)
- **Excerpt Support**: Uses `<!--more-->` tags for post previews via `excerpt_separator: "<!--more-->"`
- **Pagination**: Enabled for blog posts with `paginate: 10`
- **Permalink Structure**: `/blog/:year/:month/:day/:title/`

### Migration History
Successfully migrated from Octopress to Jekyll 4/GitHub Pages:
- Converted `{% img %}` Octopress tags to standard HTML `<img>` tags
- Cleaned up Octopress-specific front matter fields (`comments`, `sharing`, `keywords`)
- Converted `{% highlight %}` to markdown code fences
- Removed problematic `{% raw %}` tags
- Maintained existing URL structure and post organization
- Fixed SCSS compilation issues (removed unavailable theme imports)

### Key Configuration Files
- **`_config.yml`** - Jekyll configuration with blog-specific settings
- **`Gemfile`** - Ruby gem dependencies for GitHub Pages compatibility
- **`docker-compose.yml`** - Local development environment setup
- **`Dockerfile`** - Container configuration for Jekyll 4 development


## Development

### Local Development
```bash
# Using Docker (recommended)
docker-compose up

# Or locally with Jekyll
bundle install
bundle exec jekyll serve
```
### Deployment
- **GitHub Pages**: Automatically deploys from repository
- **Custom Domain**: Uses CNAME file for domain configuration
- **SSL**: Handled by GitHub Pages

## Content Guidelines

### Blog Posts
- Located in `blog/_posts/`
- Follow Jekyll naming convention: `YYYY-MM-DD-title.markdown`
- Use standard Jekyll front matter with `layout: post`
- Support categories, tags, and descriptions
- Images go in `blog/images/posts/[topic-or-date]/`
- Use `<!--more-->` for excerpt separation

### Projects
- Individual Markdown files in `blog/projects/`
- Each project can have its own image folder in `blog/images/projects/`
- Projects are manually curated and linked from the projects page
- Include screenshots, descriptions, and technology details
