@interface ExternalDownloadManifest
- (BOOL)_parsePropertyList:(id)a3;
- (ExternalDownloadManifest)init;
- (ExternalDownloadManifest)initWithPropertyList:(id)a3;
- (ExternalDownloadManifest)initWithValidDownloads:(id)a3 invalidDownloads:(id)a4;
- (NSArray)invalidDownloads;
- (NSArray)validDownloads;
- (void)dealloc;
@end

@implementation ExternalDownloadManifest

- (ExternalDownloadManifest)init
{
  return -[ExternalDownloadManifest initWithPropertyList:](self, "initWithPropertyList:", 0LL);
}

- (ExternalDownloadManifest)initWithPropertyList:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ExternalDownloadManifest;
  v4 = -[ExternalDownloadManifest init](&v7, "init");
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
      || !-[ExternalDownloadManifest _parsePropertyList:](v4, "_parsePropertyList:", a3))
    {

      return 0LL;
    }
  }

  return v4;
}

- (ExternalDownloadManifest)initWithValidDownloads:(id)a3 invalidDownloads:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ExternalDownloadManifest;
  v6 = -[ExternalDownloadManifest init](&v8, "init");
  if (v6)
  {
    v6->_invalidDownloads = (NSArray *)[a4 copy];
    v6->_validDownloads = (NSArray *)[a3 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ExternalDownloadManifest;
  -[ExternalDownloadManifest dealloc](&v3, "dealloc");
}

- (NSArray)invalidDownloads
{
  return self->_invalidDownloads;
}

- (NSArray)validDownloads
{
  return self->_validDownloads;
}

- (BOOL)_parsePropertyList:(id)a3
{
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = [a3 objectForKey:@"items"];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v41;
    objc_super v8 = @"metadata";
    v9 = @"bundle-identifier";
    uint64_t v39 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "objectForKey:", v8, v34);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = [v12 objectForKey:v9];
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            if (v14)
            {
              v16 = v8;
              v17 = v9;
              id v18 = v4;
              id v19 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v14);
              unsigned int v20 = [v19 isInstalled];
              unsigned int v21 = objc_msgSend(objc_msgSend(v19, "applicationType"), "isEqualToString:", @"User");
              unsigned int v22 = [v19 profileValidated];
              if (!v20 || (v21 & v22 & 1) != 0)
              {
                v31 = -[Download initWithExternalManifestDictionary:]( objc_alloc(&OBJC_CLASS___Download),  "initWithExternalManifestDictionary:",  v11);
                if (-[Download valueForProperty:](v31, "valueForProperty:", @"download_state.download_error")) {
                  v32 = v38;
                }
                else {
                  v32 = v37;
                }
                -[NSMutableArray addObject:](v32, "addObject:", v31);

                id v4 = v18;
                v9 = v17;
                objc_super v8 = v16;
                uint64_t v7 = v39;
              }

              else
              {
                id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                if (!v23) {
                  id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                }
                unsigned int v24 = [v23 shouldLog];
                else {
                  LODWORD(v25) = v24;
                }
                v26 = (os_log_s *)[v23 OSLogObject];
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                  uint64_t v25 = v25;
                }
                else {
                  v25 &= 2u;
                }
                id v4 = v18;
                v9 = v17;
                objc_super v8 = v16;
                uint64_t v7 = v39;
                if ((_DWORD)v25)
                {
                  uint64_t v27 = objc_opt_class(self);
                  int v44 = 138412546;
                  uint64_t v45 = v27;
                  __int16 v46 = 2112;
                  id v47 = v14;
                  LODWORD(v35) = 22;
                  uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  16LL,  "%@: Skipping download and install of: %@",  &v44,  v35);
                  if (v28)
                  {
                    v29 = (void *)v28;
                    v30 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL);
                    free(v29);
                    v34 = v30;
                    SSFileLog(v23, @"%@");
                  }
                }
              }
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v6);
  }

  self->_invalidDownloads = &v38->super;
  self->_validDownloads = &v37->super;
  return 1;
}

@end