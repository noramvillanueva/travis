#' Activate Travis CI
#'
#' @description
#' Activating Travis CI, and querying activity status.
#'
#' `travis_enable()` activates or deactivates Travis CI for a repo.
#'
#' @param active `[flag]`\cr
#'   Set to `FALSE` to deactivate instead of activating.
#' @template repo
#' @template remote
#' @template endpoint
#'
#' @export
travis_enable <- function(active = TRUE,
                          repo = github_info(remote = remote)$full_name,
                          remote = "origin",
                          endpoint = get_endpoint()) {

  if (active) {
    activate <- "activate"
  } else {
    activate <- "deactivate"
  }

  req <- travis(
    verb = "POST", path = sprintf("/repo/%s/%s", encode_slug(repo), activate),
    endpoint = endpoint
  )

  stop_for_status(req$response)

  cli::cli_alert_success(
    "{ifelse(active, 'Activating', 'Deactivating')} repo {.code {repo}} on
        Travis CI ({.code {endpoint}}).",
    wrap = TRUE
  )
  invisible(new_travis_repo(content(req$response)))
}

#' @description
#' `travis_is_enabled()` returns if Travis CI is active for a repo.
#' @export
#' @rdname travis_enable
travis_is_enabled <- function(repo = github_repo(),
                              endpoint = get_endpoint()) {

  if (is.null(endpoint)) {
    endpoint <- Sys.getenv("R_TRAVIS", unset = "ask") # nocov
  }

  info <- travis_repo_info(repo = repo, endpoint = endpoint)
  info[["active"]]
}
