@interface DialogPresenter
+ (void)_presentDialogRequest:(id)a3 completion:(id)a4;
+ (void)presentDialogRequest:(id)a3 completion:(id)a4;
+ (void)presentDialogWithTitle:(id)a3 body:(id)a4 buttons:(id)a5 completion:(id)a6;
+ (void)presentRequest:(id)a3;
@end

@implementation DialogPresenter

+ (void)presentDialogRequest:(id)a3 completion:(id)a4
{
}

+ (void)presentDialogWithTitle:(id)a3 body:(id)a4 buttons:(id)a5 completion:(id)a6
{
  id v19 = a1;
  id v21 = a3;
  id v20 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v9 count])
  {
    unint64_t v12 = 0LL;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v19));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:](&OBJC_CLASS___AMSDialogAction, "actionWithTitle:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
      [v14 setIdentifier:v16];

      -[NSMutableArray addObject:](v11, "addObject:", v14);
      ++v12;
    }

    while ((unint64_t)[v9 count] > v12);
  }

  id v17 = [[AMSDialogRequest alloc] initWithTitle:v21 message:v20];
  [v17 setButtonActions:v11];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000A078;
  v22[3] = &unk_1000307E0;
  id v23 = v10;
  id v18 = v10;
  [v19 presentDialogRequest:v17 completion:v22];
}

+ (void)presentRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizations]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizations]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 body]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](&OBJC_CLASS___Localizations, "stringWithKey:", @"ACTION_OK"));
  id v19 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class(a1);
    __int16 v17 = 2114;
    id v18 = v4;
    id v13 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Presenting request. Request: %{public}@",  buf,  0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A2C4;
  v14[3] = &unk_100030800;
  v14[4] = a1;
  [a1 presentDialogWithTitle:v6 body:v8 buttons:v10 completion:v14];
}

+ (void)_presentDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class(a1);
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Presenting dialog request. Request: %{public}@",  buf,  0x16u);
  }

  id v11 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v6];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 present]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A5C0;
  v14[3] = &unk_100030828;
  id v15 = v7;
  id v16 = a1;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

@end