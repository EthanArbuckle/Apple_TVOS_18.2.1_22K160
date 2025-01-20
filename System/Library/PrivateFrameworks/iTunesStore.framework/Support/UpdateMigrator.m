@interface UpdateMigrator
+ (id)sharedInstance;
- (BOOL)performMigration:(unint64_t)a3;
- (UpdateMigrator)init;
- (void)_loadBagAndPerformMigration;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_performMigration;
- (void)_queueMigration:(id)a3;
- (void)dealloc;
- (void)destroyInstance;
- (void)restoreDemotedBundleIdentifiers:(id)a3 options:(id)a4;
@end

@implementation UpdateMigrator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100092940;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3318 != -1) {
    dispatch_once(&qword_1003A3318, block);
  }
  return (id)qword_1003A3310;
}

- (UpdateMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UpdateMigrator;
  v2 = -[UpdateMigrator init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.UpdateMigrator", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = ISNetworkTypeChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UpdateMigrator;
  -[UpdateMigrator dealloc](&v6, "dealloc");
}

- (void)destroyInstance
{
  v2 = (void *)qword_1003A3310;
  qword_1003A3310 = 0LL;

  dispatch_queue_t v3 = (void *)qword_1003A3310;
  qword_1003A3310 = 0LL;
}

- (BOOL)performMigration:(unint64_t)a3
{
  self->_unint64_t updateType = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    int v37 = 138412290;
    id v38 = (id)objc_opt_class(self);
    id v8 = v38;
    v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "[%@]: Migrating iTunes data.",  &v37,  12);

    if (!v9) {
      goto LABEL_13;
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    v35 = v7;
    SSFileLog(v4, @"%@");
  }

LABEL_13:
  unint64_t updateType = self->_updateType;
  if ((updateType & 2) == 0)
  {
    if ((updateType & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = objc_msgSend(v11, "shouldLog", v35);
  else {
    LODWORD(v13) = v12;
  }
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    uint64_t v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if ((_DWORD)v13)
  {
    v15 = (void *)objc_opt_class(self);
    int v37 = 138412290;
    id v38 = v15;
    id v16 = v15;
    LODWORD(v36) = 12;
    v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  16LL,  "[%@]: Upgrade Migration",  &v37,  v36);

    if (!v17) {
      goto LABEL_29;
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    v35 = v14;
    SSFileLog(v11, @"%@");
  }

LABEL_29:
  v18 = -[UpdateMigratorPromotionOperation initWithBundleIdentifiers:options:]( objc_alloc(&OBJC_CLASS___UpdateMigratorPromotionOperation),  "initWithBundleIdentifiers:options:",  &__NSArray0__struct,  &__NSDictionary0__struct);
  -[UpdateMigrator _queueMigration:](self, "_queueMigration:", v18);
  v19 = objc_alloc_init(&OBJC_CLASS___UpdateMigratorAutoUpdateOperation);
  -[UpdateMigrator _queueMigration:](self, "_queueMigration:", v19);

  unint64_t updateType = self->_updateType;
  if ((updateType & 4) == 0)
  {
LABEL_15:
    if ((updateType & 8) == 0) {
      return 1;
    }
LABEL_43:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v35));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      v31 = (void *)objc_opt_class(self);
      int v37 = 138412290;
      id v38 = v31;
      id v32 = v31;
      LODWORD(v36) = 12;
      v33 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  1LL,  "[%@]: Migrate from Different Device Migration",  &v37,  v36);

      if (!v33)
      {
LABEL_55:

        return 1;
      }

      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
      free(v33);
      SSFileLog(v27, @"%@");
    }

    goto LABEL_55;
  }

- (void)restoreDemotedBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  unsigned int v12 = (void *)objc_opt_class(self);
  id v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
  int v17 = 138412546;
  v18 = v12;
  __int16 v19 = 2112;
  v20 = v14;
  v15 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  2LL,  "[%@]: Queued demoted app restore for bundleIDs: %@",  &v17,  22);

  if (v15)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  id v16 = -[UpdateMigratorPromotionOperation initWithBundleIdentifiers:options:]( objc_alloc(&OBJC_CLASS___UpdateMigratorPromotionOperation),  "initWithBundleIdentifiers:options:",  v6,  v7);
  -[UpdateMigrator _queueMigration:](self, "_queueMigration:", v16);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    int v15 = 138412290;
    id v16 = (id)objc_opt_class(self);
    id v8 = v16;
    unsigned int v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  2LL,  "[%@]: Network Changed",  &v15,  12);

    if (!v9) {
      goto LABEL_13;
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
  }

LABEL_13:
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
  id v11 = [v10 networkType];

  if (v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v13 = ISNetworkTypeChangedNotification;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
    [v12 removeObserver:self name:v13 object:v14];

    -[UpdateMigrator _loadBagAndPerformMigration](self, "_loadBagAndPerformMigration");
  }

- (void)_loadBagAndPerformMigration
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v16 = 138412290;
    id v17 = (id)objc_opt_class(self);
    id v7 = v17;
    id v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  2LL,  "[%@]: Loading Bag Prior to migration",  &v16,  12);

    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLBagForContext:v9]);

  if (v11)
  {
    -[UpdateMigrator _performMigration](self, "_performMigration");
  }

  else
  {
    unsigned int v12 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100093610;
    v15[3] = &unk_10034AC30;
    v15[4] = self;
    -[ISLoadURLBagOperation setCompletionBlock:](v12, "setCompletionBlock:", v15);
    loadURLBagOperation = self->_loadURLBagOperation;
    self->_loadURLBagOperation = v12;
    v14 = v12;

    -[ISLoadURLBagOperation start](self->_loadURLBagOperation, "start");
  }
}

- (void)_performMigration
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009384C;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_queueMigration:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000939D0;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
}

@end