@interface IDSReportClientEventMessage
- (BOOL)wantsIDSProtocolVersion;
- (IDSReportClientEventMessage)init;
- (NSDictionary)report;
- (NSDictionary)responseMessage;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)reportType;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseBody:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setReport:(id)a3;
- (void)setReportType:(id)a3;
- (void)setResponseMessage:(id)a3;
@end

@implementation IDSReportClientEventMessage

- (IDSReportClientEventMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSReportClientEventMessage;
  v2 = -[IDSReportClientEventMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSReportClientEventMessage setTimeout:](v2, "setTimeout:", 120.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSReportClientEventMessage;
  id v4 = -[IDSReportClientEventMessage copyWithZone:](&v9, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage report](self, "report"));
  [v4 setReport:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage reportType](self, "reportType"));
  [v4 setReportType:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v7];

  return v4;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)wantsIDSProtocolVersion
{
  return 1;
}

- (id)bagKey
{
  return @"id-client-report";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"report-type");
  -[NSMutableArray addObject:](v2, "addObject:", @"report");
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage reportType](self, "reportType"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"report-type", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006997F0();
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage report](self, "report"));
  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"report", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699770();
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage hardwareVersion](self, "hardwareVersion"));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"hardware-version", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSReportClientEventMessage osVersion](self, "osVersion"));
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"os-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  return v3;
}

- (void)handleResponseBody:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("Registration");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling client event response body", buf, 2u);
  }

  id v17 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v17));
  id v9 = v17;
  if (v9)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("Registration");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error parsing JSON response: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"Registration"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"Registration", @"Error parsing JSON response: %@");
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForIDSCategory("Registration");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Converted client event response: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"Registration"))
    {
      v16 = v8;
      _IDSLogV(0LL, @"IDSFoundation", @"Registration", @"Converted client event response: %@");
    }

    -[IDSReportClientEventMessage setResponseMessage:](self, "setResponseMessage:", v8, v16);
  }
}

- (NSDictionary)report
{
  return (NSDictionary *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setReport:(id)a3
{
}

- (NSString)reportType
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setReportType:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSDictionary)responseMessage
{
  return (NSDictionary *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end