library(pyformr)

twitter <- ReturnSeries$read_csv("pyform/data/twitter_returns.csv")
spy <- ReturnSeries$read_csv("pyform/data/spy_returns.csv")

print(head(twitter$to_year()))

twitter$set_daterange(end="2014-12-31")
print(head(twitter$to_year()))

twitter$set_daterange(end="2020-12-31")
twitter$add_benchmark(spy)
twitter$get_corr()
twitter$get_corr(meta=TRUE)
