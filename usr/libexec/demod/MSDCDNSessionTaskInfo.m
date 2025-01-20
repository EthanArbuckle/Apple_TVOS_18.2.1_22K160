@interface MSDCDNSessionTaskInfo
- (BOOL)isValid;
- (NSDictionary)credentialHeaders;
- (NSString)fileHash;
- (NSString)serverType;
- (NSString)urlSchema;
- (id)getRequestForTimeout:(double)a3;
- (void)setCredentialHeaders:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setServerType:(id)a3;
- (void)setUrlSchema:(id)a3;
@end

@implementation MSDCDNSessionTaskInfo

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDCDNSessionTaskInfo;
  if (!-[MSDSessionTaskInfo isValid](&v9, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo serverType](self, "serverType"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
        BOOL v7 = v6 != 0LL;
      }

      else
      {
        BOOL v7 = 0;
      }
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)getRequestForTimeout:(double)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  if (!v5
    || (v6 = (void *)v5,
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema")),
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8),
        char isKindOfClass = objc_opt_isKindOfClass(v7, v9),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    id v50 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100096834();
    }
    goto LABEL_24;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
  if (!v11
    || (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders")),
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14),
        char v16 = objc_opt_isKindOfClass(v13, v15),
        v13,
        v12,
        (v16 & 1) == 0))
  {
    id v51 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100096860(v22, v52, v53);
    }
    goto LABEL_24;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v18 = (char *)[v17 rangeOfString:@"/<prefix-"];
  uint64_t v20 = v19;

  if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v57 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000968CC(self, v22);
    }
    goto LABEL_24;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 substringFromIndex:&v18[v20]]);

  id v23 = -[os_log_s integerValue](v22, "integerValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  id v25 = [v24 length];

  if (v25 <= v23)
  {
    id v58 = sub_10003A95C();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1000969DC(self);
    }

    goto LABEL_24;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 substringToIndex:v23]);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 substringToIndex:v18]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v29,  v27,  v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v32,  1LL,  a3));
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  if (!v34)
  {
    id v60 = sub_10003A95C();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_10009694C();
    }

LABEL_24:
    v49 = 0LL;
    goto LABEL_29;
  }

  v62 = v31;
  v63 = v27;
  v64 = v22;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v35 = self;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
  id v37 = [v36 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v66;
    while (2)
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v66 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"name"]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"value"]);
        if (!v42
          || (uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString, v43), (objc_opt_isKindOfClass(v42, v45) & 1) == 0)
          || !v44
          || (uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSString, v46), (objc_opt_isKindOfClass(v44, v47) & 1) == 0))
        {
          id v54 = sub_10003A95C();
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
            sub_100096978();
          }

          v49 = 0LL;
          goto LABEL_28;
        }

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](v35, "request"));
        [v48 addValue:v44 forHTTPHeaderField:v42];
      }

      id v38 = [v36 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](v35, "request"));
LABEL_28:
  v22 = v64;
LABEL_29:

  return v49;
}

- (NSDictionary)credentialHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCredentialHeaders:(id)a3
{
}

- (NSString)urlSchema
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setUrlSchema:(id)a3
{
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFileHash:(id)a3
{
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setServerType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end