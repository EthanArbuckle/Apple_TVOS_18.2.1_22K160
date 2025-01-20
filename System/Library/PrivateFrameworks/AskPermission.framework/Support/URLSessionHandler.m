@interface URLSessionHandler
+ (URLSessionHandler)sharedHandler;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
@end

@implementation URLSessionHandler

+ (URLSessionHandler)sharedHandler
{
  if (qword_10003A9E8 != -1) {
    dispatch_once(&qword_10003A9E8, &stru_100030B48);
  }
  return (URLSessionHandler *)(id)qword_10003A9F0;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = (id)objc_opt_class(self);
    __int16 v15 = 2114;
    id v16 = v8;
    id v12 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Handling dialog request: %{public}@",  (uint8_t *)&v13,  0x16u);
  }

  +[DialogPresenter presentDialogRequest:completion:]( &OBJC_CLASS___DialogPresenter,  "presentDialogRequest:completion:",  v8,  v9);
}

@end