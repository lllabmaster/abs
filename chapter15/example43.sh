#!/bin/bash

# Download a stock quote.
# Example: bash example43.sh DOW

E_NOPARAMS=66

if [ -z "$1" ]
then 
    echo "Usage: `basename $0` stock-symbol"
    exit $E_NOPARAMS
fi

stock_symbol=$1
file_suffix=.html
URL='http://finance.yahoo.com/q?s='

wget -O ${stock_symbol}${file_suffix} "${URL}${stock_symbol}"

exit $?
