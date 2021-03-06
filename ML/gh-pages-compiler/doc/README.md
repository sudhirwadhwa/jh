# Documentation


## Getting started

- **Create a `gh-pages` branch** on your repository (if it doesn't exist)

You can also use the Github automatic pages generator.

- **Write a `README.md`** at the root of your repository, in the master branch

Read [why and how](doc/why-readme.md) if you are lost.

- **[Install gh-pages-compiler](doc/install.md)**

- **Use gh-pages-compiler**

In gh-pages-compiler directory:

```sh
$ bin/gh-pages-compiler <repository-url>
```

Example:

```sh
$ bin/gh-pages-compiler https://github.com/mnapoli/gh-pages-compiler.git
```

You will need to type your Github username and password when git will try to *push* the modifications.

Github will then publish the website at something like http://username.github.com/projectname/.


## Links

Once you have written the home page in `README.md`,
you can start writing other pages in other `.md` files.

For example, with the following files:

    README.md
    doc/getting-started.md
    doc/faq.md

You can can create Markdown links as such and they will work on the website **and on Github**:

```md
[Home](index.md)
[Getting started guide](doc/getting-started.md)
[Frequently asked questions](doc/faq.md)
```

In your templates however, you need to link without the `.md` extension:

```html
<a href="doc/getting-started">Getting started guide</a>
```

However, you will need to set up the [HTML `base` tag](http://www.w3schools.com/tags/tag_base.asp)
in your template so that links are relative to the root of your website.

```html
<head>
    <base href="http://username.github.com/yourproject/">
</head>
```


## Template

You can create your own template to customize the generated website.

This is fairly simple, it should look like:

* `template-header.html`
* `template-footer.html`
* `public/` : directory containing static resources (css, js, images...). Its content will be copied to the `gh-pages` branch.

Your template must be in a `gh-pages-template/` directory at the root of your repository.

### Example

Here is a basic example to help you get started:

#### Header

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>My project</title>
    <meta name="description" content="This is my project">
    <base href="http://username.github.com/projectname/">
</head>
<body>
    <header>
        <h1>My brand new project</h1>
        <ul class="menu">
            <li><a href="index">Home</a></li>
            <li><a href="doc/index">Documentation</a></li>
        </ul>
    </header>
```

#### Footer

```html
    <footer>
        <p>
            Documentation generated by
            <a href="http://mnapoli.github.com/gh-pages-compiler/" target="_blank">gh-pages-compiler</a>.
        </p>
    </footer>
</body>
</html>
```
