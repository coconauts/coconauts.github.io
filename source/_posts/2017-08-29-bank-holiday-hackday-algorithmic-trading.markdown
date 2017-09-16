---
layout: post
title: "Bank holiday hackday: algorithmic trading"
date: 2017-08-29 19:57:46 +0000
comments: true
categories: software
tags: bitcoin hackday
sharing: true
keywords: bitcoin,coinbase,algorithmic,trading,forex,python
description: "Experiments on automated stock investing"
author: Mar Bartolome
featured: true
published: true
---

As it is becoming tradition, we dedicated the last UK bank holiday to hacking activities.
In this occassion we wanted to something bitcoint-related, as it is lately all the rage.
We developed on the idea of an automated investing algorithm that would use an API to
buy/sell bitcoin automatically, trying to maximize earnings and minize losses.
Read on to find out our results!

<!-- more-->

### The idea

Algorithmic trading is not a novel idea. In fact it seems to be quite a researched topic,
and it's not difficult to find resources about it online. From stategies, to code
libraries, to people sharing algorithms on github.

In or case, we wanted to use it to invest on bitcoin or other cryptocurrencies.
To invest you need an exchange: a place that you let you buy and sell bitcoin
in exchange for "real money" (eg, dollars or euros). In the last years several of them
have surged and become stablished, most notably perhaps [Coinbase](https://www.coinbase.com/)
and [Kraken](https://www.kraken.com/).

And the best news: these exchanges offer a public API, that you can use in your
algorithms for automatic trading. Sweet!

### Simulate first

Playing with the exchanges themselves however would require investing real money.
Also, they charge a rate for every transaction, so before recklessly toying around
we should first find a decent algorithm while testing on a simulated environment.

And so, we set ourselves to the task. We made a little python script that would
simulate the interface with the stock exchange to buy or sell. You can feed a CSV file
to the script with the historical exchange rate, so that it can replay it.

You just need to search google to quickly find some historical data for stocks.
For bitcoin data a good source is the [Bitcoincharts API](https://bitcoincharts.com/about/markets-api/).

### The algorithms

On top of that toy environment we set to build a couple algorithms, and set them to compete
against each other:

- *simple algorithm*: keeps a constant amount invested in stock at all time.
  If the price goes up, it extracts the profit difference with the original amount.
  If the price goes down, it buys up new stock until it reaches the investment amount.
- *pirate algoritm*: based on (this algorithm that we found on github)[https://github.com/pirate/bitcoin-trader/]. It keeps track of
  the value at which you bought or sold a bit of stock. If the price goes further down that you bought it for, it will sell it to avoid loss. If it goes up it will rebuy it.
- *static algorithm*: buys full amount of funds and simply waits. No fuss investment!
  It will basically produce profit or loss depending on the longterm evolution of the market.
- *random algorithm*: it will randomly buy or sell a fixed amount.

These are not very sofisticated strategies, but they are a starting point. Now the next
step would be to simulate them running against the historical exchange rate data for
bitcoin, and see if they would have made us any money had we set the algorithm to run
some time ago in the past.

### Results

We simulated the run of these algorithms over the last year of bitcoin
historical data, over an investment amount of $1000. The resulting benefit
in USD was a follows:

| static     | simple    | pirate      | random (3-run average) |
|------------|-----------|-------------|------------------------|
| 252.244923 | 486.14863 | -999.957644 | 1204670.35464          |

Interestingly, it seems that the best strategy is by a huge margin the random
one! Our simple algorithm turned to be a slight improvement over the
static "invest and forget" strategy, yielding double the amount of benefits.
The pirate algorithm turned out a huge disappointment and made us loss
practically all of our investment amount. The surprising results come
from the random algorithm, which yielded a x1000 ROI.

Is our conclussion then that the best investment strategy for the stock
market is to buy and sell randomly? Well, let's not go that fast. Consider
that the shape of the exchange rate curve might have much to explain.

<img src="/images/posts/2017-08-29-bitcoin/DGAX.1y.png"/>

Notice how bitcoin has had an exponential growth during the last year.
Under this sort of conditions, no matter what you do, the market is going
to be on your favor. Under this kind of curve, constant mindless selling
and buying is of course what is going to make you right, rather than being
more conservative with your money.

Lets see what's the difference when running the same set of algorithms
over just the last month of June, in which there was a strong volatility
but not a noticeable diff in the exchange rate.

<img src="/images/posts/2017-08-29-bitcoin/GDAX.jun.png"/>

| static   | simple   | pirate   | random (3-run average) |
|----------|----------|----------|------------------------|
| -41.3003 | -31.1976 | -81.3840 | -18.3573               |

There was indeed a small loss in the value of bicoin, which is reflected by
the static strategy. Our simple algorithm was not a huge improvement here, it
managed to mitigate the loss a little bit but not in a significant way.
The pirate algorithm proves to be just as terrible, while the random
one now shows its limitations.


### Conclussions

Algorithmic trading is easy to implement, but difficult to come up with
a strategy that will make you rich. If there existed a way, be sure that
the best data scientists in the world would have already found it, and
everyone would be using it. Predicting when is the best time to sell and buy
is difficult even for expert human stock traders after all!

Even with one strategy, there's lots of fine tunning to do in terms of
amounts, timings and optimizations that we didn't try in our experiments.
Also not all stock shapes look the same, and different algorithms might
perfom differently depending on the characteristics of the stock type.
For example, some stocks might exhibit more volatility, others are more stable,
some have a higher price than others and might perform better if you algorithm
is willing to invest bigger rather than smaller amount.

Even having this into account, what is for sure going to make you money is
picking a market that goes up rather than down! It is unlikely that an
algorithm can create a profit when prices are going down. At most, it can
try to mitigate the losses, but picking a winning stock is the only way
to generating benefits.

And last but not least: in our setup we didn't consider the particularities
of the exchange services, namely, the fees. An exchange service will
charge fees normally per transaction, so having this into account is
fundamental when desiging your algorithm, or you might loose any earnings
simply paying for fees. The fees are different with every exchange service,
but normally they are expensive for small quantities and after a level they
even out. Exchanges that are friendlier and more accessible for beginners
(for instance [coinbase](https://www.coinbase.com/))
are also more expensive than others.

You can find our algorithms and the sandbox code in [our github](https://github.com/coconauts/algotrade).
