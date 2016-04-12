# https://www.interviewcake.com/question/python/stock-price


def get_max_profit_nsquared(prices):
    def max_profit(prices, buy_minute, buy_price):
        if buy_minute == len(prices) - 1:
            return 0
        else:
            return max(prices[buy_minute:]) - buy_price

    # for each element find max future value
    _max_profit = [max_profit(prices, i, price) for i, price in enumerate(prices)]
    # print _max_profit
    return max(_max_profit)


def get_max_profit(prices):
    lowest_buy = 999999999
    best_profit = 0

    for price in prices:
        if lowest_buy > price:  # can we buy lower
            lowest_buy = price
        if price - lowest_buy > best_profit:  # can we sell higher
            best_profit = price - lowest_buy

    return best_profit

# returns 6 (buying for $5 and selling for $11)
assert 6 == get_max_profit([10, 7, 5, 8, 11, 9])
assert 2 == get_max_profit([10, 11, 12])
assert 0 == get_max_profit([12, 11, 10])
assert 0 == get_max_profit([1])
assert 6 == get_max_profit([16, 7, 5, 8, 11, 9])
assert 10 == get_max_profit([5, 15, 1, 2])
assert 19 == get_max_profit([5, 15, 1, 20])
