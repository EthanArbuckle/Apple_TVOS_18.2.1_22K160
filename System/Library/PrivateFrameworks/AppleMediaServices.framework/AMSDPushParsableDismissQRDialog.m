@interface AMSDPushParsableDismissQRDialog
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableDismissQRDialog

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedPushNotificationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedPushNotificationConfig"));
    if (!v8) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class(a1, v10);
      uint64_t v13 = AMSLogKey(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v26 = 138543618;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] No account passed in the payload to dismiss a QR dialog",  (uint8_t *)&v26,  0x16u);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PINCode"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
    id v18 = v15;
  }
  else {
    id v18 = 0LL;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"dialogId"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
  if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
    id v22 = v19;
  }
  else {
    id v22 = 0LL;
  }

  v23 = v18;
  if (v18 || (v23 = v22) != 0LL)
  {
    id v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDDismissQRDialogService sharedService]( &OBJC_CLASS___AMSDDismissQRDialogService,  "sharedService"));
    [v25 notifyDismissDialogWithIdentifier:v24];
  }

  else
  {
    id v24 = 0LL;
  }
}

@end