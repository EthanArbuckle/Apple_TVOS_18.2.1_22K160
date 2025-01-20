@interface ExtensionManager
+ (id)sharedExtensionManager;
- (BOOL)_requestExtension:(id)a3 withItem:(id)a4 error:(id *)a5;
- (BOOL)checkDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4;
- (BOOL)notifyWithResult:(id)a3 error:(id *)a4;
- (id)_extensionPassingTest:(id)a3 error:(id *)a4;
- (id)_extensionToCheckDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4;
- (id)_extensionToNotifyWithResult:(id)a3 error:(id *)a4;
@end

@implementation ExtensionManager

+ (id)sharedExtensionManager
{
  if (qword_10003A998 != -1) {
    dispatch_once(&qword_10003A998, &stru_100030848);
  }
  return (id)qword_10003A9A0;
}

- (BOOL)checkDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[ExtensionManager _extensionToCheckDownloadQueueWithContentType:error:]( self,  "_extensionToCheckDownloadQueueWithContentType:error:",  a3));
  if (!v6) {
    goto LABEL_3;
  }
  v7 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  uint64_t v12 = APRequestExtensionContextUserInfoKeyCheckDownloadQueue;
  v13 = &__kCFBooleanTrue;
  BOOL v8 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  -[NSExtensionItem setUserInfo:](v7, "setUserInfo:", v9);

  unsigned __int8 v10 = -[ExtensionManager _requestExtension:withItem:error:](self, "_requestExtension:withItem:error:", v6, v7, a4);
  if ((v10 & 1) == 0) {
LABEL_3:
  }
    BOOL v8 = 0;

  return v8;
}

- (BOOL)notifyWithResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[ExtensionManager _extensionToNotifyWithResult:error:]( self,  "_extensionToNotifyWithResult:error:",  v6,  a4));
  if (!v7) {
    goto LABEL_3;
  }
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  uint64_t v14 = APRequestExtensionContextUserInfoKeyResult;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 compile]);
  v15 = v9;
  BOOL v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  -[NSExtensionItem setUserInfo:](v8, "setUserInfo:", v11);

  unsigned __int8 v12 = -[ExtensionManager _requestExtension:withItem:error:](self, "_requestExtension:withItem:error:", v7, v8, a4);
  if ((v12 & 1) == 0) {
LABEL_3:
  }
    BOOL v10 = 0;

  return v10;
}

- (id)_extensionToCheckDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000A9DC;
  v5[3] = &unk_100030868;
  v5[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue( -[ExtensionManager _extensionPassingTest:error:]( self,  "_extensionPassingTest:error:",  v5,  a4));
}

- (id)_extensionToNotifyWithResult:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000AB0C;
  v9[3] = &unk_100030890;
  id v10 = a3;
  id v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionManager _extensionPassingTest:error:](self, "_extensionPassingTest:error:", v9, a4));

  return v7;
}

- (id)_extensionPassingTest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = NSExtensionPointName;
  v25 = @"com.apple.askpermission-extension";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionsWithMatchingAttributes:error:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:error:",  v7,  a4));
  if (v8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000AE20;
    v20[3] = &unk_1000308B8;
    id v21 = v6;
    id v9 = [v8 indexOfObjectPassingTest:v20];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000AE68;
      v18[3] = &unk_1000308E0;
      v19 = @"com.apple.iTunesStoreUI.SUAskPermissionExtension";
      id v10 = [v8 indexOfObjectPassingTest:v18];
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
      {

        if (a4)
        {
          uint64_t v11 = APError(0LL, @"Extension Error", @"Could not find valid matching extension", 0LL);
          unsigned __int8 v12 = 0LL;
          *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
        }

        else
        {
          unsigned __int8 v12 = 0LL;
        }

        goto LABEL_13;
      }

      id v9 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v13) {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v23 = v15;
        id v16 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Found default extension",  buf,  0xCu);
      }
    }

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v9]);
LABEL_13:

    goto LABEL_14;
  }

  unsigned __int8 v12 = 0LL;
LABEL_14:

  return v12;
}

- (BOOL)_requestExtension:(id)a3 withItem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v23 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 beginExtensionRequestWithOptions:0 inputItems:v10 error:a5]);

  id v12 = v11;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    id v14 = v12;
  }
  else {
    id v14 = 0LL;
  }

  if (v14)
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000B0FC;
    v20[3] = &unk_100030908;
    objc_copyWeak(&v21, &location);
    [v8 setRequestCompletionBlock:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000B218;
    v18[3] = &unk_100030930;
    objc_copyWeak(&v19, &location);
    [v8 setRequestCancellationBlock:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000B334;
    v16[3] = &unk_100030958;
    objc_copyWeak(&v17, &location);
    [v8 setRequestInterruptionBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v14 != 0LL;
}

@end