@interface FinishDownloadsOperation
- (FinishDownloadsOperation)initWithFinishedDownloadPredicate:(id)a3;
- (SSSQLitePredicate)finishedDownloadPredicate;
- (void)dealloc;
- (void)run;
@end

@implementation FinishDownloadsOperation

- (FinishDownloadsOperation)initWithFinishedDownloadPredicate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FinishDownloadsOperation;
  v4 = -[FinishDownloadsOperation init](&v6, "init");
  if (v4) {
    v4->_predicate = (SSSQLitePredicate *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FinishDownloadsOperation;
  -[FinishDownloadsOperation dealloc](&v3, "dealloc");
}

- (SSSQLitePredicate)finishedDownloadPredicate
{
  return self->_predicate;
}

- (void)run
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009C21C;
  v19[3] = &unk_10034D170;
  v19[4] = self;
  v19[5] = v4;
  v19[6] = v3;
  [v5 readUsingTransactionBlock:v19];
  uint64_t v6 = (uint64_t)-[NSMutableArray count](v3, "count");
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    uint64_t v11 = objc_opt_class(self);
    *(_DWORD *)v20 = 138412546;
    *(void *)&v20[4] = v11;
    *(_WORD *)&v20[12] = 2048;
    *(void *)&v20[14] = v6;
    uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Finishing %ld downloads",  v20,  22);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v17 = v14;
      SSFileLog(v7, @"%@");
    }
  }

  if (v6 < 1)
  {
    BOOL v16 = 1LL;
  }

  else
  {
    uint64_t v15 = 0LL;
    LOBYTE(v16) = 1;
    do
    {
      *(void *)v20 = 0LL;
      *(void *)&v20[8] = v20;
      *(void *)&v20[16] = 0x2020000000LL;
      unsigned __int8 v21 = -[FinishDownloadsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  -[NSMutableArray objectAtIndex:](v3, "objectAtIndex:", v15, v17),  0LL);
      if (*(_BYTE *)(*(void *)&v20[8] + 24LL))
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10009C4D8;
        v18[3] = &unk_10034D198;
        v18[5] = v20;
        v18[6] = v15;
        v18[4] = v4;
        [v5 modifyUsingTransactionBlock:v18];
      }

      BOOL v16 = v16 && *(_BYTE *)(*(void *)&v20[8] + 24LL) != 0;
      _Block_object_dispose(v20, 8);
      ++v15;
    }

    while (v6 != v15);
  }

  -[FinishDownloadsOperation setSuccess:](self, "setSuccess:", v16, v17);
}

@end