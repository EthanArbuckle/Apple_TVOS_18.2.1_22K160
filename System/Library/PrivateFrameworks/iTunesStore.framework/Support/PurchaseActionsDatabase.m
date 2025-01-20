@interface PurchaseActionsDatabase
+ (BOOL)_setupDatabase:(id)a3;
- (PurchaseActionsDatabase)init;
- (PurchaseActionsDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (void)deletePurchaseIntentsForApp:(id)a3;
- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4;
- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3;
- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4;
- (void)incrementPingbackRetryCountForApp:(id)a3;
- (void)insertInstallAttributionParams:(id)a3 completionHandler:(id)a4;
- (void)insertInstallAttributionPingback:(id)a3;
- (void)insertPurchaseIntent:(id)a3;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
- (void)removeInstallAttributionParamsBeforeDate:(id)a3;
- (void)removeInstallAttributionParamsForApp:(id)a3;
- (void)removeInstallAttributionPingbackForApp:(id)a3;
- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3;
- (void)resetTimestampsForApp:(id)a3;
- (void)setPingbackPendingForApp:(id)a3;
@end

@implementation PurchaseActionsDatabase

- (PurchaseActionsDatabase)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseActionsDatabaseSchema databasePath]( &OBJC_CLASS___PurchaseActionsDatabaseSchema,  "databasePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 0LL));

  v5 = -[PurchaseActionsDatabase initWithDatabaseURL:readOnly:](self, "initWithDatabaseURL:readOnly:", v4, 0LL);
  return v5;
}

- (PurchaseActionsDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PurchaseActionsDatabase;
  v7 = -[PurchaseActionsDatabase init](&v11, "init");
  if (v7)
  {
    v8 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:]( objc_alloc(&OBJC_CLASS___SSSQLiteDatabase),  "initWithDatabaseURL:readOnly:protectionType:",  v6,  v4,  NSFileProtectionCompleteUntilFirstUserAuthentication);
    database = v7->_database;
    v7->_database = v8;

    if (!v4) {
      -[SSSQLiteDatabase setSetupBlock:](v7->_database, "setSetupBlock:", &stru_10034D1B8);
    }
  }

  return v7;
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009C7E4;
  v7[3] = &unk_10034AD30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009C8CC;
  v7[3] = &unk_10034ACE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v7);
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009C954;
  v7[3] = &unk_10034AD30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);
}

- (void)deletePurchaseIntentsForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10009CA44;
    v6[3] = &unk_10034D208;
    id v7 = v5;
    -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v6);
  }
}

- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10009CC60;
    v8[3] = &unk_10034D280;
    id v9 = v6;
    id v10 = v7;
    -[PurchaseActionsDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v8);
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)insertPurchaseIntent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10009D05C;
    v6[3] = &unk_10034D208;
    id v7 = v4;
    -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v6);
  }
}

- (void)resetTimestampsForApp:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v5 timeIntervalSince1970];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", (uint64_t)v6));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009D450;
    v9[3] = &unk_10034D2F8;
    id v10 = v4;
    id v11 = v7;
    id v8 = v7;
    -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v9);
  }
}

- (void)insertInstallAttributionParams:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v6)
  {
    *(void *)&__int128 v18 = 0LL;
    *((void *)&v18 + 1) = &v18;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009DCC4;
    v15[3] = &unk_10034D320;
    id v16 = v6;
    v17 = &v18;
    -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v15);
    if (v7) {
      v7[2](v7, *(unsigned __int8 *)(*((void *)&v18 + 1) + 24LL));
    }

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      LODWORD(v18) = 138543362;
      *(void *)((char *)&v18 + 4) = objc_opt_class(self);
      id v12 = *(id *)((char *)&v18 + 4);
      v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: Trying to insert a nil install attribution param",  &v18,  12);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
        free(v13);
        SSFileLog(v8, @"%@");
      }
    }

    else
    {
    }
  }
}

- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class(self);
      id v12 = v18;
      v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: Trying to get install attribution param for a nil adamId",  &v17,  12);

      if (!v13)
      {
LABEL_15:

        v7[2](v7, 0LL);
        goto LABEL_16;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_15;
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009E104;
  v14[3] = &unk_10034D280;
  id v15 = v6;
  id v16 = v7;
  -[PurchaseActionsDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v14);

LABEL_16:
}

- (void)removeInstallAttributionParamsForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to remove install attribution param for a nil adamId",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009E6D8;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)removeInstallAttributionParamsBeforeDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to remove install attribution params before a nil date",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009E9F8;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)insertInstallAttributionPingback:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to insert a nil install attribution pingback",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009ED24;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class(self);
      id v12 = v18;
      id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: Trying to get install attribution pingback for a nil adamId",  &v17,  12);

      if (!v13)
      {
LABEL_15:

        v7[2](v7, 0LL);
        goto LABEL_16;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_15;
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009F1F0;
  v14[3] = &unk_10034D280;
  id v15 = v6;
  id v16 = v7;
  -[PurchaseActionsDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v14);

LABEL_16:
}

- (void)setPingbackPendingForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to set pending = 1 on install attribution pingback for a nil adamId",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009F7A8;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009F96C;
  v5[3] = &unk_10034D370;
  id v6 = a3;
  id v4 = v6;
  -[PurchaseActionsDatabase readAsyncUsingTransactionBlock:](self, "readAsyncUsingTransactionBlock:", v5);
}

- (void)removeInstallAttributionPingbackForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to remove install attribution pingbacks for a nil adamId",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009FF04;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to remove non pending install attribution pingbacks before a nil date",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A0224;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

- (void)incrementPingbackRetryCountForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class(self);
      id v10 = v15;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "[%{public}@]: Trying to increment install attribution pingback retry count on a nil adamId",  &v14,  12);

      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_15;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A0550;
  v12[3] = &unk_10034D208;
  id v13 = v4;
  -[PurchaseActionsDatabase modifyUsingTransactionBlock:](self, "modifyUsingTransactionBlock:", v12);
  id v6 = v13;
LABEL_15:
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A0758;
  v6[3] = &unk_10034D398;
  uint64_t v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performTransactionWithBlock:v6];
  char v4 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void).cxx_destruct
{
}

@end