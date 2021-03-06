% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/github-auth.R
\name{github_helpers}
\alias{github_helpers}
\alias{auth_github}
\alias{get_owner}
\alias{get_user}
\alias{get_repo}
\alias{get_repo_slug}
\title{Github API helpers}
\usage{
auth_github()

get_owner(remote = "origin")

get_user()

get_repo(remote = "origin")

get_repo_slug(remote = "origin")
}
\arguments{
\item{remote}{\verb{[string]}\cr
The Github remote which should be used. Defaults to "origin".}
}
\description{
\itemize{
\item \code{auth_github()}: Creates a \code{GITHUB_TOKEN} and asks to store it in your
\code{.Renviron} file.
}

\itemize{
\item \code{get_owner()}: Returns the owner of a Github repo.
}

\itemize{
\item \code{get_repo()}: Returns the repo name of a Github repo for a given remote.
}

\itemize{
\item \code{get_repo_slug()}: Returns the repo slug of a Github repo
(\verb{<owner>/<repo>}).
}
}
\keyword{internal}
