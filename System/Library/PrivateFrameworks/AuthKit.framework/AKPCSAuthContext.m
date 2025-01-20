@interface AKPCSAuthContext
+ (id)_contextFromSRPServerResponse:(id)a3 maxTTLInMins:(int64_t)a4;
+ (id)contextFromSRPServerResponse:(id)a3;
+ (id)contextFromSRPServerResponseWithShorterTTL:(id)a3;
+ (int64_t)_timeToLive:(int64_t)a3 maxTTLInMins:(int64_t)a4;
@end

@implementation AKPCSAuthContext

+ (id)contextFromSRPServerResponse:(id)a3
{
  return _[a1 _contextFromSRPServerResponse:a3 maxTTLInMins:-1];
}

+ (id)contextFromSRPServerResponseWithShorterTTL:(id)a3
{
  return _[a1 _contextFromSRPServerResponse:a3 maxTTLInMins:10];
}

+ (id)_contextFromSRPServerResponse:(id)a3 maxTTLInMins:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"srdwa"]);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wscUUID"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ts"]);
    [v9 doubleValue];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ttlMin"]);
    id v12 = [v11 integerValue];

    double v13 = (double)(60 * (uint64_t)[a1 _timeToLive:v12 maxTTLInMins:a4]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate ak_expiryDateFromServerDate:localDate:ttl:]( &OBJC_CLASS___NSDate,  "ak_expiryDateFromServerDate:localDate:ttl:",  v10,  v14,  v13));

    id v16 = [[AKPCSAuthContext alloc] initWithWebSessionIdentifier:v8 expiryDate:v15 userInfo:0];
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

+ (int64_t)_timeToLive:(int64_t)a3 maxTTLInMins:(int64_t)a4
{
  if (a3 <= a4 || a4 <= 0) {
    return a3;
  }
  else {
    return a4;
  }
}

@end