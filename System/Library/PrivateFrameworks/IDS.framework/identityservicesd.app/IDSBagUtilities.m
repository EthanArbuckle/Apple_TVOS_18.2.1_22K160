@interface IDSBagUtilities
+ (double)timeToCacheNegativeResultsForService:(id)a3;
+ (double)timeToCacheResultsForIDStatus:(unsigned int)a3 forService:(id)a4;
+ (double)timeToCacheUnknownResultsForService:(id)a3;
@end

@implementation IDSBagUtilities

+ (double)timeToCacheNegativeResultsForService:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_3;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"md-peer-lookup-negative-cache-time-%@",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  [v6 doubleValue];
  double v8 = v7;

  if (v8 <= 0.0)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"md-peer-lookup-negative-cache-time"]);
    [v10 doubleValue];
    double v8 = v11;

    if (v8 <= 0.0) {
      double v8 = 120.0;
    }
  }

  return v8;
}

+ (double)timeToCacheUnknownResultsForService:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_3;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"md-peer-lookup-unknown-cache-time-%@",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  [v6 doubleValue];
  double v8 = v7;

  if (v8 <= 0.0)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"md-peer-lookup-unknown-cache-time"]);
    [v10 doubleValue];
    double v8 = v11;

    if (v8 <= 0.0) {
      double v8 = 60.0;
    }
  }

  return v8;
}

+ (double)timeToCacheResultsForIDStatus:(unsigned int)a3 forService:(id)a4
{
  id v6 = a4;
  if (a3 == 2) {
    [a1 timeToCacheNegativeResultsForService:v6];
  }
  else {
    [a1 timeToCacheUnknownResultsForService:v6];
  }
  double v8 = v7;

  return v8;
}

@end