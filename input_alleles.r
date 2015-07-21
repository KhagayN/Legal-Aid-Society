input_alleles <- function(...) {
	l <- list(...)
	str <- ""

	for (i in seq_along(l)) {
		str <- paste(str, l[i], sep = ";")
	}

	str = paste0(strsplit(str, '')[[1]][-1], collapse = '')

	tmp <- suppressWarnings(as.numeric(unlist(strsplit(str, ";"))))
	tmp <- unique(tmp)
	tmp <- sort(tmp)

	ret <- paste(c(tmp), collapse = ";")
	print (ret)
	return (ret)
}