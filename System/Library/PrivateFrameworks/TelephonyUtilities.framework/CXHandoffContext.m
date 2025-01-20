@interface CXHandoffContext
+ (id)providerIdentifierForHandoffActivityUserInfo:(id)a3;
- (NSDictionary)handoffActivityUserInfo;
- (id)initWithHandoffActivityUserInfo:(id)a3;
@end

@implementation CXHandoffContext

- (id)initWithHandoffActivityUserInfo:(id)a3
{
  uint64_t v4 = TUCallUserActivityProviderIdentifierKey;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    self = -[CXHandoffContext initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v5);
    v7 = v5;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TUCallUserActivityCTInfoKey"]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kCTCallDirection"]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kCTCallPhoneNumber"]);
    v10 = (void *)v9;
    if (v8
      && v9
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID")),
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]),
          self = -[CXHandoffContext initWithHandoffIdentifier:](self, "initWithHandoffIdentifier:", v12),
          v12,
          v11,
          self))
    {
      -[CXHandoffContext setOutgoing:]( self,  "setOutgoing:",  [v8 isEqualToString:@"kCTCallDirectionOutgoing"]);
      v13 = -[CXHandle initWithType:value:](objc_alloc(&OBJC_CLASS___CXHandle), "initWithType:value:", 2LL, v10);
      -[CXHandoffContext setRemoteHandle:](self, "setRemoteHandle:", v13);

      -[CXHandoffContext setContext:](self, "setContext:", v7);
    }

    else
    {

      self = 0LL;
    }
  }

  return self;
}

- (NSDictionary)handoffActivityUserInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandoffContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v4 = [v3 mutableCopy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandoffContext context](self, "context"));
  id v6 = [v5 mutableCopy];

  else {
    v7 = @"kCTCallDirectionIncoming";
  }
  [v6 setObject:v7 forKeyedSubscript:@"kCTCallDirection"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandoffContext remoteHandle](self, "remoteHandle"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
  [v6 setObject:v9 forKeyedSubscript:@"kCTCallPhoneNumber"];

  id v10 = [v6 copy];
  [v4 setObject:v10 forKeyedSubscript:@"TUCallUserActivityCTInfoKey"];

  [v4 setObject:&off_1003F1690 forKeyedSubscript:@"TUCallUserActivityServiceKey"];
  id v11 = [v4 copy];

  return (NSDictionary *)v11;
}

+ (id)providerIdentifierForHandoffActivityUserInfo:(id)a3
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:TUCallUserActivityProviderIdentifierKey]);
  id v4 = v3;
  if (!v3) {
    v3 = @"com.apple.coretelephony";
  }
  id v5 = v3;

  return v5;
}

@end