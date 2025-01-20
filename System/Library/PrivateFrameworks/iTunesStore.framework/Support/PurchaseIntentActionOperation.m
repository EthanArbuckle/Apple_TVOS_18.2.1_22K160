@interface PurchaseIntentActionOperation
- (PurchaseIntentActionOperation)initWithRequest:(id)a3;
- (void)run;
@end

@implementation PurchaseIntentActionOperation

- (PurchaseIntentActionOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PurchaseIntentActionOperation;
  v5 = -[PurchaseIntentActionOperation init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 appBundleId]);
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;

    v5->_action = (unint64_t)[v4 action];
  }

  return v5;
}

- (void)run
{
  unint64_t action = self->_action;
  if (action == 1)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"));
    [v7 deletePurchaseIntentsForApp:self->_appBundleId];
    goto LABEL_18;
  }

  if (action == 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"));
    [v4 resetTimestampsForApp:self->_appBundleId];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    appBundleId = self->_appBundleId;
    id v17 = 0LL;
    [v5 launchApplicationWithIdentifier:appBundleId options:0 error:&v17];
    id v7 = v17;

    if (!v7)
    {
LABEL_18:

      goto LABEL_19;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      v12 = (void *)objc_opt_class(self);
      v13 = self->_appBundleId;
      int v18 = 138543874;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      __int16 v22 = 2114;
      id v23 = v7;
      id v14 = v12;
      v15 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%{public}@]: FBSystemService failed to open application %{public}@ with error: %{public}@",  &v18,  32);

      if (!v15)
      {
LABEL_16:

        goto LABEL_18;
      }

      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      v16 = v11;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_16;
  }

- (void).cxx_destruct
{
}

@end