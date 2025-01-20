@interface EscrowUpdateMetadataRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowUpdateMetadataRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowUpdateMetadataResponse, a2);
}

- (id)command
{
  return @"UPDATE_RECORD";
}

- (id)bodyDictionary
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___EscrowUpdateMetadataRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v14, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest encodedMetadata](self, "encodedMetadata"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest encodedMetadata](self, "encodedMetadata"));
    [v4 setObject:v6 forKeyedSubscript:@"oldMetadata"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest metadata](self, "metadata"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest metadata](self, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringFromDict]);
    [v4 setObject:v9 forKeyedSubscript:@"newMetadata"];
  }

  BOOL v10 = -[EscrowGenericRequest duplicate](self, "duplicate");
  if (v10)
  {
    uint64_t v11 = CloudServicesLog(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100044BCC();
    }
  }

  return v4;
}

@end