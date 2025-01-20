@interface MSDDownloadIPARequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSString)appID;
- (NSString)currentUID;
- (NSString)fileHash;
- (NSString)originServer;
- (NSString)uid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getPostData;
- (id)getQueryItems;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setAppID:(id)a3;
- (void)setCurrentUID:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setOriginServer:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation MSDDownloadIPARequest

- (BOOL)isValid
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDDownloadIPARequest;
  if (!-[MSDCommandServerRequest isValid](&v8, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
      BOOL v6 = v5 != 0LL;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getQueryItems
{
  if (-[MSDDownloadIPARequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"AppID",  v4));

    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"UID",  v6));

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"FullIPAHash",  v8));

    [v3 addObject:v5];
    [v3 addObject:v7];
    [v3 addObject:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"CurrentUID",  v11));

      [v3 addObject:v12];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest originServer](self, "originServer"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest originServer](self, "originServer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"OriginServer",  v14));

      [v3 addObject:v15];
    }
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)getPostData
{
  if (-[MSDDownloadIPARequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  @"ApplicationID",  v4,  @"UID",  v5,  @"FullIPAHash",  0LL));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
    if (v7)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
      [v6 setObject:v8 forKey:@"CurrentUID"];
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 convertToNSData]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDDownloadIPAResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MSDDownloadIPARequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    v11 = 0LL;
  }

  else
  {
    id v24 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v24));
    id v12 = v24;

    if (v11)
    {
      id v13 = sub_10003A95C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
        *(_DWORD *)buf = 138543618;
        v27 = v15;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Details to download files are: %{public}@",  buf,  0x16u);
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 objectForKey:@"FileName"]);
      if (v16)
      {
        v17 = (void *)v16;
        [v9 setFileName:v16];
        v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"FileType"]);
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"OriginServer"]);
        [v9 setOriginServer:v20];
      }

      else
      {
        id v23 = v12;
        sub_100087610(&v23, 3727744512LL, (uint64_t)@"Unexpected server response.");
        v17 = v12;
        id v12 = v23;
      }
    }

    id v6 = v12;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v21) {
    [v9 setError:v6];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDDownloadIPARequest;
  id v4 = -[MSDCommandServerRequest copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setAppID:self->_appID];
  [v4 setFileHash:self->_fileHash];
  [v4 setUid:self->_uid];
  [v4 setCurrentUID:self->_currentUID];
  [v4 setOriginServer:self->_originServer];
  return v4;
}

- (NSString)appID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAppID:(id)a3
{
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFileHash:(id)a3
{
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setUid:(id)a3
{
}

- (NSString)currentUID
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCurrentUID:(id)a3
{
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end