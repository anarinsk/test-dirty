my_packages <- c("gt", "showtext", "tidyverse")
librarian::shelf(my_packages)

# Showtext test

## Add fonts

font_add('bm_hana', "BMHANNA_11yrs_otf.otf")
#font_add_google("Schoolbell", "bell")

## Automatically use showtext to render text
showtext_auto()

set.seed(123)
hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
     main = "", xlab = "", ylab = "")
title("정규 분포 히스토그램", family = "bm_hana", cex.main = 2)
title(ylab = "Frequency", family = "bm_hana", cex.lab = 2)
text(2, 70, "샘플수 = 1000", family = "bm_hana", cex = 2.5)

p <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars)))

p + geom_text(family="bm_hana") -> p_hana

dplyr::tibble(
  text = "Here is a ggplot:",
  ggplot = NA
) |>
  gt() |>
  text_transform(
    locations = cells_body(columns = ggplot),
    fn = function(x) {
        p_hana |>
        ggplot_image(height = px(200))
    }
  )