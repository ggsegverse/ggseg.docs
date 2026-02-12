describe("template files", {
  it("ships the required inst/pkgdown files", {
    yml <- system.file("pkgdown", "_pkgdown.yml", package = "ggseg.docs")
    scss <- system.file("pkgdown", "extra.scss", package = "ggseg.docs")
    js <- system.file("pkgdown", "extra.js", package = "ggseg.docs")
    footer <- system.file("pkgdown", "templates", "footer.html", package = "ggseg.docs")
    head <- system.file("pkgdown", "templates", "head.html", package = "ggseg.docs")
    logo <- system.file("pkgdown", "assets", "ggsegverse-logo.png", package = "ggseg.docs")
    favicon <- system.file("pkgdown", "assets", "favicon.png", package = "ggseg.docs")

    expect_true(nzchar(yml))
    expect_true(nzchar(scss))
    expect_true(nzchar(js))
    expect_true(nzchar(footer))
    expect_true(nzchar(head))
    expect_true(nzchar(logo))
    expect_true(nzchar(favicon))
  })

  it("template yml sets bootstrap 5 and ggseg palette", {
    yml_path <- system.file("pkgdown", "_pkgdown.yml", package = "ggseg.docs")
    cfg <- yaml::read_yaml(yml_path)
    expect_equal(cfg$template$bootstrap, 5)
    expect_true(cfg$template$`light-switch`)
    expect_equal(cfg$template$bslib$primary, "#29393e")
    expect_equal(cfg$template$bslib$secondary, "#5e3c58")
  })
})
