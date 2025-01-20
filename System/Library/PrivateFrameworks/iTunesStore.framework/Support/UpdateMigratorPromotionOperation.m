@interface UpdateMigratorPromotionOperation
- (UpdateMigratorPromotionOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4;
- (void)performMigration;
@end

@implementation UpdateMigratorPromotionOperation

- (UpdateMigratorPromotionOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UpdateMigratorPromotionOperation;
  v8 = -[UpdateMigratorPromotionOperation init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = v9;

    v11 = (NSDictionary *)[v7 copy];
    options = v8->_options;
    v8->_options = v11;
  }

  return v8;
}

- (void)performMigration
{
  bundleIDs = self->_bundleIDs;
  if (bundleIDs && -[NSArray count](bundleIDs, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v5 = [v4 shouldLog];
    else {
      LODWORD(v6) = v5;
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v6 = v6;
    }
    else {
      v6 &= 2u;
    }
    if (!(_DWORD)v6) {
      goto LABEL_25;
    }
    v8 = (void *)objc_opt_class(self);
    v9 = self->_bundleIDs;
    id v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v9, "componentsJoinedByString:", @", "));
    int v21 = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    v24 = v11;
    v12 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "[%@]: Restoring demoted applications with bundle identifiers: %@",  &v21,  22);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v4 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if (!(_DWORD)v14) {
      goto LABEL_25;
    }
    int v21 = 138412290;
    id v22 = (id)objc_opt_class(self);
    id v15 = v22;
    v12 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "[%@]: Restoring all demoted applications",  &v21,  12);
  }

  if (v12)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v4, @"%@");
LABEL_25:
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NetworkRequestQueue sharedNetworkRequestQueue]( &OBJC_CLASS___NetworkRequestQueue,  "sharedNetworkRequestQueue"));
  v17 = -[RestoreDemotedApplicationsOperation initWithBundleIdentifiers:options:]( objc_alloc(&OBJC_CLASS___RestoreDemotedApplicationsOperation),  "initWithBundleIdentifiers:options:",  self->_bundleIDs,  self->_options);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009428C;
  v19[3] = &unk_10034AC30;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
  v18 = v20;
  -[RestoreDemotedApplicationsOperation setCompletionBlock:](v17, "setCompletionBlock:", v19);
  [v16 addOperation:v17];
  dispatch_semaphore_wait(v18, 0x6FC23AC00uLL);
}

- (void).cxx_destruct
{
}

@end