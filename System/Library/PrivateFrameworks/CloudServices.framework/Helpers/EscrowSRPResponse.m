@interface EscrowSRPResponse
- (NSData)srpData;
- (NSNumber)iterations;
- (NSString)bypassToken;
- (NSString)proto;
- (int64_t)clubTypeID;
@end

@implementation EscrowSRPResponse

- (NSData)srpData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"respBlob"]);

  if (v3) {
    v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NSString)bypassToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"phoneNumberToken"]);

  return (NSString *)v3;
}

- (int64_t)clubTypeID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"clubTypeID"]);

  if (v3) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = -1LL;
  }

  return v4;
}

- (NSString)proto
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"proto"]);

  return (NSString *)v3;
}

- (NSNumber)iterations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"iterations"]);

  return (NSNumber *)v3;
}

@end