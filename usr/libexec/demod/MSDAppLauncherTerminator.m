@interface MSDAppLauncherTerminator
+ (BOOL)launchApp:(id)a3 withOptions:(id)a4 outError:(id *)a5;
+ (BOOL)terminateApp:(id)a3 outError:(id *)a4;
@end

@implementation MSDAppLauncherTerminator

+ (BOOL)launchApp:(id)a3 withOptions:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_10002031C;
  v34 = sub_10002032C;
  id v35 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  uint64_t v42 = FBSOpenApplicationOptionKeyUnlockDevice;
  v43 = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

  if (v8) {
    [v13 addEntriesFromDictionary:v8];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v13));
  id v15 = sub_10003A95C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Launching app: %{public}@", buf, 0xCu);
  }

  id v17 = sub_10003A95C();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_1000935B4((uint64_t)v13, v18);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100020334;
  v25[3] = &unk_1000F9968;
  v28 = &v30;
  id v19 = v7;
  id v26 = v19;
  v29 = &v36;
  v20 = v9;
  v27 = v20;
  [v11 openApplication:v19 withOptions:v14 completion:v25];
  if (dispatch_semaphore_wait(v20, v10))
  {
    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100093574(v22);
    }
  }

  if (a5) {
    *a5 = (id) v31[5];
  }
  BOOL v23 = *((_BYTE *)v37 + 24) != 0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v23;
}

+ (BOOL)terminateApp:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v5));
  id v7 = [[RBSTerminateContext alloc] initWithExplanation:@"Terminated by demod"];
  id v8 = [[RBSTerminateRequest alloc] initWithPredicate:v6 context:v7];
  id v9 = sub_10003A95C();
  dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Terminating app: %{public}@", buf, 0xCu);
  }

  id v16 = 0LL;
  unsigned __int8 v11 = [v8 execute:&v16];
  id v12 = v16;
  if ((v11 & 1) != 0)
  {
    if (a4) {
LABEL_5:
    }
      *a4 = v12;
  }

  else
  {
    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000936BC((uint64_t)v5, v12);
    }

    if (a4) {
      goto LABEL_5;
    }
  }

  return v11;
}

@end