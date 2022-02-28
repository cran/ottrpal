
<!-- badges: start -->

[![R-CMD-check](https://github.com/jhudsl/ottrpal/workflows/R-CMD-check/badge.svg)](https://github.com/jhudsl/ottrpal/actions)
<!-- badges: end -->

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Intro to ottrpal package

`ottrpal` converts an [OTTR course](https://github.com/jhudsl/OTTR_Template/wiki) (Open-source Tools for Training Resources) into a files ready for upload to Massive Open Online Courses (MOOCs): [Coursera](https://www.coursera.org/) and [Leanpub](https://leanpub.com/).

- Go to the [main OTTR guide](https://github.com/jhudsl/OTTR_Template/wiki) for how to start creating courses with OTTR.
- [Read the ottrpal package documentation here](https://jhudatascience.org/ottrpal/docs/index.html).

## Using the example repository:

If you'd like to use our example repository you can fork it on Github and clone it to your own computer
[Follow these instructions to fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository) and then you can clone it using a command like:  

```{sh}
git clone https://github.com/{organization}/OTTR_Quizzes.git
```
But replace `{organization}` with the location of your forked repository.

## Installing ottrpal:

You can install `ottrpal` from GitHub with:

You will need to use the remotes package (and will need to install it if you don't have it).
``` r
if (!("remotes" %in% installed.packages())) {
  install.packages("remotes")
}
remotes::install_github("jhudsl/ottrpal")
```

## Running ottrpal

The `ottrpal` package converts your files using one of these main functions:

```{r}
ottrpal::bookdown_to_embed_leanpub()
```

By default, `ottrpal` will re-run a `bookdown::render_book("index.Rmd")` rendering of your chapters first before converting the files to the Leanpub ready format.
However, if you wish to skip this step, you can set `render = FALSE` when running the `ottrpal::bookdown_to_embed_leanpub()` function.

## About the Book.txt file:

Leanpub requires a [`Book.txt`](https://leanpub.com/lfm/read#leanpub-auto-booktxt-sampletxt-and-manuscript-files) file to know what order the chapters/quizzes should be published.

By default, your `Book.txt` file will _not_ be autogenerated but `ottrpal` will look in your given directory for an existing `Book.txt` file which it will copy over to the output directory.

You can create a `Book.txt` file manually, or if your quizzes and chapters are numbered, `ottrpal` can create the `Book.txt` file based on the numbers going from low to high and quizzes following chapters of the same number.
(e.g. `quiz_03.md` will be placed after `03-some_chapter_file.Rmd`).

To have `ottrpal` attempt to autogenerate this file, set `make_book_txt` to `TRUE`.

```{r}
ottrpal::bookdown_to_embed_leanpub(make_book_txt = TRUE)
```

If no `Book.txt` file is found and `make_book_txt` is set to `FALSE` (this is the default setting), `ottrpal` will fail.

A ottrpal autogenerated `Book.txt` file might look something like this:
```
index.Rmd
01-chapter.Rmd
quiz_1.md
02-chapter.Rmd
quiz_2.md
about.Rmd
```
Also note that any `index.Rmd` will always be placed first and any `about.Rmd` file will be placed last.

## Setting up quizzes:

By default, ottrpal will look for a folder called `quizzes/` to find your quiz `.md` files.
If your quizzes are located somewhere else, you will need to use the `quiz_dir` argument to specify that:

```{r}
ottrpal::bookdown_to_embed_leanpub(quiz_dir = "some_directory")
```

## About the output files

Leanpub's Github writing mode will look for a directory called `manuscript` to publish from.
You should not edit the files in `manuscript/` by hand since a re-run of `ottrpal` will cause your changes to be overwritten.

## Adding footer text:

If there is text you would like added to the end of each chapter (like a link to a feedback survey for example), you can supply a character string to the `footer_text`argument in the main `ottrpal::bookdown_to_leanpub()` function.

```{r}
# Set up a character string
survey_link <- "Please provide any feedback you have in [this survey](www.some_link.org)"

# Supply the footer text in the main function
ottrpal::bookdown_to_embed_leanpub(footer_text = survey_link)
```