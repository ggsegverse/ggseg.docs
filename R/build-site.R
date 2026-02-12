#' Build pkgdown site with ggsegverse branding
#'
#' Wraps [pkgdown::build_site()] and forces the ggseg.docs template,
#' Bootstrap 5 theme, and light-switch toggle. Any existing `bootswatch`
#' setting in the consumer package is removed.
#'
#' If the package has no logo at `man/figures/logo.png`, the ggsegverse
#' logo is copied in as a fallback.
#'
#' @param path Path to the package root. Defaults to `"."`.
#' @param ... Additional arguments passed to [pkgdown::build_site()].
#' @return Invisibly, the path to the built site (from [pkgdown::build_site()]).
#' @export
build_ggseg_docs <- function(path = ".", ...) {
  pkg <- pkgdown::as_pkgdown(path, override = ggseg_override(path))
  inject_logo(path)
  pkgdown::build_site(pkg, ...)
}

ggseg_override <- function(path = ".") {
  list(
    template = list(
      package = "ggseg.docs",
      bootstrap = 5,
      `light-switch` = TRUE,
      params = list(bootswatch = NULL),
      bootswatch = NULL
    ),
    development = list(mode = "release")
  )
}

inject_logo <- function(path) {
  logo_dest <- file.path(path, "man", "figures", "logo.png")
  if (file.exists(logo_dest)) return(invisible())

  logo_src <- system.file(
    "pkgdown", "assets", "ggsegverse-logo.png",
    package = "ggseg.docs"
  )
  if (!nzchar(logo_src)) return(invisible())

  dir.create(dirname(logo_dest), showWarnings = FALSE, recursive = TRUE)
  file.copy(logo_src, logo_dest)
  invisible()
}
