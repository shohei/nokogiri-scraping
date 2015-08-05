library(ggplot2)
#for japanese font
old = theme_set(theme_gray(base_family="HiraKakuProN-W3"))

df = read.csv("result.csv",header=T)
ggplot(df,aes(x=area,y=GDP))+stat_summary(geom="bar",fun.y=mean)
Sys.sleep(1000)
