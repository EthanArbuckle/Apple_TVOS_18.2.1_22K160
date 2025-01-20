@interface IDSReportApprovedTempUser
- (BOOL)wantsBodySignature;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsManagedRetries;
- (IDSReportApprovedTempUser)init;
- (NSString)responseMessage;
- (NSString)tempUserID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int64_t)reportAction;
- (void)handleResponseDictionary:(id)a3;
- (void)setReportAction:(int64_t)a3;
- (void)setResponseMessage:(id)a3;
- (void)setTempUserID:(id)a3;
@end

@implementation IDSReportApprovedTempUser

- (IDSReportApprovedTempUser)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSReportApprovedTempUser;
  v2 = -[IDSReportApprovedTempUser init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSReportApprovedTempUser setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSReportApprovedTempUser;
  id v4 = -[IDSReportApprovedTempUser copyWithZone:](&v8, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportApprovedTempUser tempUserID](self, "tempUserID"));
  [v4 setTempUserID:v5];

  objc_msgSend(v4, "setReportAction:", -[IDSReportApprovedTempUser reportAction](self, "reportAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportApprovedTempUser responseMessage](self, "responseMessage"));
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
  return @"id-report-web-approval-status";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"web-uri");
  -[NSMutableArray addObject:](v2, "addObject:", @"is-approved");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (id)-[IDSReportApprovedTempUser reportAction](self, "reportAction") == (id)1));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"is-approved", v4);
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_100693B54(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportApprovedTempUser tempUserID](self, "tempUserID"));
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"web-uri", v13);
  }

  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_100693AC8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("Registration");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
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
  v10.super_class = (Class)&OBJC_CLASS___IDSReportApprovedTempUser;
  -[IDSReportApprovedTempUser handleResponseDictionary:](&v10, "handleResponseDictionary:", v4, v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"message"]);
  -[IDSReportApprovedTempUser setResponseMessage:](self, "setResponseMessage:", v8);
}

- (NSString)tempUserID
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setTempUserID:(id)a3
{
}

- (int64_t)reportAction
{
  return self->_reportAction;
}

- (void)setReportAction:(int64_t)a3
{
  self->_reportAction = a3;
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end