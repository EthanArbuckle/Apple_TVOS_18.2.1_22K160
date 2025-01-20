@interface Stock
- (Stock)initWithSiriStockObject:(id)a3;
@end

@implementation Stock

- (Stock)initWithSiriStockObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  if ([v5 length]) {
    [v4 setObject:v5 forKey:StockCompanyNameKey];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 symbol]);
  if ([v6 length]) {
    [v4 setObject:v6 forKey:StockSymbolKey];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 exchange]);
  if ([v7 length]) {
    [v4 setObject:v7 forKey:StockExchangeNameKey];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 marketCap]);
  v49 = v6;
  v50 = v5;
  if ([v8 length])
  {
    unsigned int v9 = objc_msgSend(v8, "characterAtIndex:", (char *)objc_msgSend(v8, "length") - 1) << 24;
    switch(v9)
    {
      case 0x42000000u:
        double v10 = 1000000000.0;
        break;
      case 0x54000000u:
        double v10 = 1.0e12;
        break;
      case 0x4D000000u:
        double v10 = 1000000.0;
        break;
      default:
LABEL_15:
        [v4 setObject:v8 forKey:StockMarketCapKey];
        goto LABEL_16;
    }

    [v8 doubleValue];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11 * v10));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 stringValue]);

    v8 = (void *)v13;
    goto LABEL_15;
  }

@end