@interface IDSReportGeneralUnknownSenderMessage
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportGeneralUnknownSenderMessage)init;
- (NSDictionary)unknownSenderInfo;
- (NSString)responseMessage;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setUnknownSenderInfo:(id)a3;
@end

@implementation IDSReportGeneralUnknownSenderMessage

- (IDSReportGeneralUnknownSenderMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSReportGeneralUnknownSenderMessage;
  v2 = -[IDSReportGeneralUnknownSenderMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSReportGeneralUnknownSenderMessage setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSReportGeneralUnknownSenderMessage;
  id v4 = -[IDSReportGeneralUnknownSenderMessage copyWithZone:](&v8, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralUnknownSenderMessage unknownSenderInfo](self, "unknownSenderInfo"));
  [v4 setUnknownSenderInfo:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralUnknownSenderMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v6];

  return v4;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (id)bagKey
{
  return @"id-report-unknown";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"unknown-sender-info");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralUnknownSenderMessage unknownSenderInfo](self, "unknownSenderInfo"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"unknown-sender-info", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A69FC();
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("Registration");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "General unknown sender response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"Registration"))
  {
    id v9 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"Registration", @"General unknown sender response: %@");
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSReportGeneralUnknownSenderMessage;
  -[IDSReportGeneralUnknownSenderMessage handleResponseDictionary:](&v10, "handleResponseDictionary:", v4, v9);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"message"]);
  -[IDSReportGeneralUnknownSenderMessage setResponseMessage:](self, "setResponseMessage:", v8);
}

- (NSDictionary)unknownSenderInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setUnknownSenderInfo:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end