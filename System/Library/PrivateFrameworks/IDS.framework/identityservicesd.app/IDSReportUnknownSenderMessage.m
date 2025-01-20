@interface IDSReportUnknownSenderMessage
- (BOOL)isBlackholed;
- (BOOL)isJunked;
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportUnknownSenderMessage)init;
- (NSString)messageID;
- (NSString)responseMessage;
- (NSString)unknownSenderURI;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int)messageServerTimestamp;
- (void)handleResponseDictionary:(id)a3;
- (void)setIsBlackholed:(BOOL)a3;
- (void)setIsJunked:(BOOL)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageServerTimestamp:(int)a3;
- (void)setResponseMessage:(id)a3;
- (void)setUnknownSenderURI:(id)a3;
@end

@implementation IDSReportUnknownSenderMessage

- (IDSReportUnknownSenderMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSReportUnknownSenderMessage;
  v2 = -[IDSReportUnknownSenderMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSReportUnknownSenderMessage setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSReportUnknownSenderMessage;
  id v4 = -[IDSReportUnknownSenderMessage copyWithZone:](&v9, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportUnknownSenderMessage unknownSenderURI](self, "unknownSenderURI"));
  [v4 setUnknownSenderURI:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportUnknownSenderMessage messageID](self, "messageID"));
  [v4 setMessageID:v6];

  objc_msgSend(v4, "setIsBlackholed:", -[IDSReportUnknownSenderMessage isBlackholed](self, "isBlackholed"));
  objc_msgSend(v4, "setIsJunked:", -[IDSReportUnknownSenderMessage isJunked](self, "isJunked"));
  objc_msgSend( v4,  "setMessageServerTimestamp:",  -[IDSReportUnknownSenderMessage messageServerTimestamp](self, "messageServerTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportUnknownSenderMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v7];

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
  -[NSMutableArray addObject:](v2, "addObject:", @"message-id");
  -[NSMutableArray addObject:](v2, "addObject:", @"sender-uri");
  -[NSMutableArray addObject:](v2, "addObject:", @"time-of-message");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportUnknownSenderMessage messageID](self, "messageID"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"message-id", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB6D8();
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSReportUnknownSenderMessage isBlackholed](self, "isBlackholed")));
  if (v5) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"message-is-blackholed", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSReportUnknownSenderMessage isJunked](self, "isJunked")));
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"message-is-junked", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportUnknownSenderMessage unknownSenderURI](self, "unknownSenderURI"));
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"sender-uri", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB658();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[IDSReportUnknownSenderMessage messageServerTimestamp](self, "messageServerTimestamp")));
  if (v8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"time-of-message", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB5D8();
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Report Unknown Sender response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"Registration"))
  {
    id v9 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"Registration", @"Report Unknown Sender response: %@");
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSReportUnknownSenderMessage;
  -[IDSReportUnknownSenderMessage handleResponseDictionary:](&v10, "handleResponseDictionary:", v4, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"message"]);
  -[IDSReportUnknownSenderMessage setResponseMessage:](self, "setResponseMessage:", v8);
}

- (NSString)unknownSenderURI
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setUnknownSenderURI:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setMessageID:(id)a3
{
}

- (BOOL)isBlackholed
{
  return self->_isBlackholed;
}

- (void)setIsBlackholed:(BOOL)a3
{
  self->_isBlackholed = a3;
}

- (BOOL)isJunked
{
  return self->_isJunked;
}

- (void)setIsJunked:(BOOL)a3
{
  self->_isJunked = a3;
}

- (int)messageServerTimestamp
{
  return self->_messageServerTimestamp;
}

- (void)setMessageServerTimestamp:(int)a3
{
  self->_messageServerTimestamp = a3;
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end