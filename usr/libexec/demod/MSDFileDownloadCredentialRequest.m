@interface MSDFileDownloadCredentialRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)manifestInfo;
- (id)getQueryItems;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setManifestInfo:(id)a3;
@end

@implementation MSDFileDownloadCredentialRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDFileDownloadCredentialRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getQueryItems
{
  if (-[MSDFileDownloadCredentialRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
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
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
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
  return (Class)objc_opt_class(&OBJC_CLASS___MSDFileDownloadCredentialResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MSDFileDownloadCredentialRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v16, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    id v12 = v6;
  }

  else
  {
    id v15 = v6;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v15));
    id v12 = v15;

    if (v11)
    {
      [v9 setCredential:v11];
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v13) {
    [v9 setError:v12];
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

- (void).cxx_destruct
{
}

@end