library(pyformr)

# Initialize demo

# 1. from csv
twitter <- ReturnSeries$read_csv("pyformr/data/twitter_returns.csv")
spy <- ReturnSeries$read_csv("pyformr/data/spy_returns.csv")
qqq <- ReturnSeries$read_csv("pyformr/data/qqq_returns.csv")

# 2. from internet
libor <- CashSeries$read_fred_libor_1m()

# 2. from R dataframe
twitter_df <- read.csv("pyformr/data/twitter_returns.csv")
twitter_from_R <- ReturnSeries(twitter_df)

# to period feature
print(head(twitter$to_month()))
print(head(twitter$to_year()))

# subset date feature
twitter$set_daterange(end = "2014-12-31")
print(head(twitter$to_year()))

# You can reset to other date range that's available initially
# after you've set it to some date range
twitter$set_daterange(start = "2015-01-01", end = "2019-12-31")
print(head(twitter$to_year()))

# reset to initial data
twitter$reset()

# Add benchmarks
twitter$add_benchmark(spy, "S&P 500 ETF")
twitter$add_benchmark(qqq)


# common stats
twitter$get_corr()
twitter$get_corr(meta = TRUE)

twitter$get_total_return(meta = TRUE)
twitter$get_annualized_return(meta = TRUE)
twitter$get_annualized_volatility(meta = TRUE)

# sharpe ratio, cash handling
# 1. default to 0
twitter$get_sharpe_ratio(meta = TRUE)
# 2. a constant rf rate
twitter$get_sharpe_ratio(risk_free = 0.01, meta = TRUE)
# 3. use libor
twitter$add_risk_free(libor, "libor 1-month")
twitter$get_sharpe_ratio(risk_free = "libor 1-month", meta = TRUE)
spy$add_risk_free(libor, "libor 1-month")
spy$get_sharpe_ratio(risk_free = "libor 1-month", meta = TRUE)
