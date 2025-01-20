@interface MSDS3SessionTaskInfo
- (NSDictionary)httpHeaders;
- (NSString)s3url;
- (id)getRequestForTimeout:(double)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setS3url:(id)a3;
@end

@implementation MSDS3SessionTaskInfo

- (id)getRequestForTimeout:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo s3url](self, "s3url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v6,  1LL,  a3));
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
    [v9 setHTTPMethod:@"PUT"];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
    if (v10)
    {
      id v11 = sub_10003A95C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received custom http headers to use.",  buf,  2u);
      }

      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
      id v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v14)
      {
        id v15 = v14;
        id v16 = 0LL;
        uint64_t v17 = *(void *)v32;
        do
        {
          v18 = 0LL;
          v19 = v16;
          do
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v13);
            }
            id v16 = *(id *)(*((void *)&v31 + 1) + 8LL * (void)v18);

            id v20 = sub_10003A95C();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
              v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v16]);
              *(_DWORD *)buf = 138412546;
              id v36 = v16;
              __int16 v37 = 2112;
              v38 = v26;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Http Header: %@, Value: %@",  buf,  0x16u);
            }

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDS3SessionTaskInfo httpHeaders](self, "httpHeaders"));
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v16]);
            [v22 setValue:v24 forHTTPHeaderField:v16];

            v18 = (char *)v18 + 1;
            v19 = v16;
          }

          while (v15 != v18);
          id v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }

        while (v15);
      }
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
      [v13 setValue:@"application/gzip" forHTTPHeaderField:@"Content-Type"];
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  }

  else
  {
    id v29 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10009694C();
    }

    v27 = 0LL;
  }

  return v27;
}

- (NSString)s3url
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setS3url:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setHttpHeaders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end