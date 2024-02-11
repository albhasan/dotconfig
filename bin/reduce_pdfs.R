#!/usr/bin/env Rscript

# Reduce the size of the PDFs in the given directoty.

suppressMessages(library("optparse"))
suppressMessages(require(dplyr))

option_list <- list(make_option(c("-d", "--directory"),
                                type = "character",
                                default = NULL,
                                help = "Directory to PDF files",
                                metavar = "character"))
opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)

if (is.null(opt$dir)) {
    print_help(opt_parser)
    stop("At least one argument must be supplied (directory).", call. = FALSE)
}


if (!dir.exists(opt$dir)) {
    print_help(opt_parser)
    stop("Directory not found!", call. = FALSE)
}

in_dir  <- opt$dir

reduce_pdf <- function(in_file, out_file) {
    stopifnot(all(vapply(c(in_file, out_file), length, numeric(1)) == 1, TRUE))

    # Simplify in_file's name to deal with naming problems in ghostscript .
    tmp_in  <- tempfile(pattern = "in_",  fileext = ".pdf")
    tmp_out <- tempfile(pattern = "out_", fileext = ".pdf")

    # Copy input to temporal file
    if (!file.copy(from = in_file, to = tmp_in))
        return(NA)

    # Do the shrinking.
    if (system(command = sprintf("gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=%s %s", tmp_out, tmp_in)) != 0)
        return(NA)

    # Copy shrinked file to out_file.
    if (!file.copy(from = tmp_out, to = out_file))
        return(NA)

    return(out_file)
}

cat("This scipt will overwrite your PFD. Continue? [y/N] ")
answer <- readLines(file("stdin"), 1)
if (substr(answer, 1, 1) != "y")
    stop("Opeartion aborted by the user!")

files_tb <- in_dir %>%
    list.files(pattern = ".[.](pdf|PDF)$", full.name = TRUE) %>%
    ensurer::ensure_that(length(.) > 0, err_desc = "No files found!") %>%
    tibble::enframe(name = NULL) %>%
    dplyr::rename(in_file = value) %>%
    dplyr::mutate(out_file = in_file) %>%
    dplyr::mutate(res = purrr::map2(in_file, out_file, reduce_pdf))
