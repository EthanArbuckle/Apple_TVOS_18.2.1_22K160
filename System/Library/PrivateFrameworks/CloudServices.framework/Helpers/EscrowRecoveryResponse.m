@interface EscrowRecoveryResponse
- (NSData)fmipRecoveryData;
- (NSData)recoveryData;
- (NSDictionary)metadata;
@end

@implementation EscrowRecoveryResponse

- (NSData)recoveryData
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

- (NSDictionary)metadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kEscrowServiceRecordMetadataKey]);

  if (v3)
  {
    v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
    if (v4) {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  0LL));
    }
    else {
      v5 = 0LL;
    }
  }

  else
  {
    v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (NSData)fmipRecoveryData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"fmipRecoveryData"]);

  if (v3) {
    v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

@end