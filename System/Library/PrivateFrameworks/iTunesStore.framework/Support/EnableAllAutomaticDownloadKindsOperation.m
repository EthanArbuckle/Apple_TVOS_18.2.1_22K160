@interface EnableAllAutomaticDownloadKindsOperation
- (void)run;
@end

@implementation EnableAllAutomaticDownloadKindsOperation

- (void)run
{
  uint64_t v18 = 0LL;
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v19 = 138412290;
    uint64_t v20 = objc_opt_class(self);
    uint64_t v8 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Enabling all download kinds",  &v19,  12);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v8, 4LL);
      free(v9);
      v17 = v10;
      *(void *)&double v7 = SSFileLog(v3, @"%@").n128_u64[0];
    }
  }

  v11 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL, v7, v17);
  id v12 = 0LL;
  if (-[EnableAllAutomaticDownloadKindsOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v11,  0LL)) {
    id v12 = +[ISURLBag copyAllowedAutomaticDownloadKindsInBagContext:]( &OBJC_CLASS___ISURLBag,  "copyAllowedAutomaticDownloadKindsInBagContext:",  v11);
  }
  if ([v12 count])
  {
    v13 = objc_alloc_init(&OBJC_CLASS___GetAutomaticDownloadKindsOperation);
    if (-[EnableAllAutomaticDownloadKindsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v13,  &v18))
    {
      v14 = -[GetAutomaticDownloadKindsOperation enabledDownloadKinds](v13, "enabledDownloadKinds");
      if (-[NSArray count](v14, "count"))
      {
        objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"),  "commitAutomaticDownloadKinds:markAsDirty:",  +[NSSet setWithArray:](NSSet, "setWithArray:", v14),  0);
        uint64_t v15 = 1LL;
      }

      else
      {
        v16 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:]( objc_alloc(&OBJC_CLASS___SetAutomaticDownloadKindsOperation),  "initWithDownloadKinds:",  v12);
        uint64_t v15 = (uint64_t)-[EnableAllAutomaticDownloadKindsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v16,  &v18);
        if ((_DWORD)v15) {
          objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"),  "commitAutomaticDownloadKinds:markAsDirty:",  v12,  0);
        }
      }
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  -[EnableAllAutomaticDownloadKindsOperation setError:](self, "setError:", v18);
  -[EnableAllAutomaticDownloadKindsOperation setSuccess:](self, "setSuccess:", v15);
}

@end