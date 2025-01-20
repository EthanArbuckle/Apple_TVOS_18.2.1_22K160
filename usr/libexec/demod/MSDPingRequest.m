@interface MSDPingRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)requestInfo;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setRequestInfo:(id)a3;
@end

@implementation MSDPingRequest

- (BOOL)isValid
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDPingRequest;
  if (!-[MSDCommandServerRequest isValid](&v10, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"UniqueDeviceID"]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)getPostData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 convertToNSData]);

  if (!v3)
  {
    uint64_t v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    id v5 = sub_10003A95C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Falling back to minimal request info dictionary.",  v10,  2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 udid]);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"UniqueDeviceID");

    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_100106300, @"InternalStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary convertToNSData](v4, "convertToNSData"));
  }

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDPingResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MSDPingRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v19, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"statusCode"]);
    [v9 setStatusCode:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 statusCode]);
    if (!v12)
    {
      id v15 = sub_10003A95C();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10009199C(self, v16);
      }

      id v18 = v6;
      sub_100087694(&v18, 3727744512LL, @"Unexpected server response.");
      id v17 = v18;

      id v6 = v17;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v13) {
    [v9 setError:v6];
  }

  return v9;
}

- (NSDictionary)requestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end