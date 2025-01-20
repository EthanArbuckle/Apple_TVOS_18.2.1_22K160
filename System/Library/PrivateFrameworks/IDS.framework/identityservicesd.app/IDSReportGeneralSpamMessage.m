@interface IDSReportGeneralSpamMessage
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportGeneralSpamMessage)init;
- (NSDictionary)responseSpamMessage;
- (NSDictionary)spamMessage;
- (NSString)responseMessage;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseSpamMessage:(id)a3;
- (void)setSpamMessage:(id)a3;
@end

@implementation IDSReportGeneralSpamMessage

- (IDSReportGeneralSpamMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSReportGeneralSpamMessage;
  v2 = -[IDSReportGeneralSpamMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSReportGeneralSpamMessage setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSReportGeneralSpamMessage;
  id v4 = -[IDSReportGeneralSpamMessage copyWithZone:](&v9, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralSpamMessage spamMessage](self, "spamMessage"));
  [v4 setSpamMessage:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralSpamMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralSpamMessage responseSpamMessage](self, "responseSpamMessage"));
  [v4 setResponseSpamMessage:v7];

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
  return @"id-report-spam";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"spam-message");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportGeneralSpamMessage spamMessage](self, "spamMessage"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"spam-message", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696234();
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
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "General Report Spam response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"Registration"))
  {
    id v10 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"Registration", @"General Report Spam response: %@");
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSReportGeneralSpamMessage;
  -[IDSReportGeneralSpamMessage handleResponseDictionary:](&v11, "handleResponseDictionary:", v4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"message"]);
  -[IDSReportGeneralSpamMessage setResponseMessage:](self, "setResponseMessage:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"spam-messages"]);
  -[IDSReportGeneralSpamMessage setResponseSpamMessage:](self, "setResponseSpamMessage:", v9);
}

- (NSDictionary)spamMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setSpamMessage:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (NSDictionary)responseSpamMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setResponseSpamMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end