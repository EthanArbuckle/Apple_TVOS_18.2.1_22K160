@interface MSDDownloadManifestRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)manifestInfo;
- (NSString)originServer;
- (id)getQueryItems;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setManifestInfo:(id)a3;
- (void)setOriginServer:(id)a3;
@end

@implementation MSDDownloadManifestRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDDownloadManifestRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getQueryItems
{
  if (-[MSDDownloadManifestRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
    id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        v7 = 0LL;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

          uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
          {
            uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 stringValue]);

            v10 = (void *)v13;
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v8,  v10));
          [v3 addObject:v14];

          v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v5);
    }
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDDownloadManifestResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MSDDownloadManifestRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v23, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    id v22 = v6;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v22));
    id v12 = v22;

    if (v11)
    {
      id v13 = sub_10003A95C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Details to download files are: %{public}@",  buf,  0x16u);
      }

      uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 objectForKey:@"FileName"]);
      if (v16)
      {
        __int128 v17 = (void *)v16;
        [v9 setFileName:v16];
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"OriginServer"]);
        [v9 setOriginServer:v18];
      }

      else
      {
        id v21 = v12;
        sub_100087610(&v21, 3727744512LL, (uint64_t)@"Unexpected server response.");
        __int128 v17 = v12;
        id v12 = v21;
      }
    }

    id v6 = v12;
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v19) {
    [v9 setError:v6];
  }

  return v9;
}

- (NSDictionary)manifestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setManifestInfo:(id)a3
{
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end