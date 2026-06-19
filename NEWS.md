# ggseg.docs 1.0.1

- The ggsegverse logo in the navbar and footer now uses an absolute URL, so it
  resolves correctly on article and reference subpages (previously a bare
  relative path that only worked on the home page). This removes pkgdown's
  "Missing images" build warnings on downstream package sites and the
  `after_body` JavaScript workaround that rewrote the logo `src` at runtime.
