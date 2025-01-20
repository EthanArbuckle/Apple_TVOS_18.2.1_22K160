void sub_1000022C8(id a1)
{
  PREIdleSleepManager *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___PREIdleSleepManager);
  v2 = (void *)qword_100011FE0;
  qword_100011FE0 = (uint64_t)v1;
}

id sub_100002498(uint64_t a1, void *a2)
{
  id v3 = [a2 eventMask];
  v4 = *(void **)(a1 + 32);
  if (v3 == (id)1) {
    return [v4 dimDisplay];
  }
  else {
    return [v4 undimDisplay];
  }
}

id sub_100002600(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayDim:0];
}

void sub_100002754( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000027A4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___PRESystemIndicator);
  v2 = (void *)qword_100011FF0;
  qword_100011FF0 = (uint64_t)v1;
}

void sub_100002868(int a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
    id v8 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sil]);
    v5 = v4;
    v6 = &stru_10000C5C8;
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  if (a1 == 1)
  {
    id v8 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sil]);
    v5 = v4;
    v6 = &stru_10000C5A8;
    uint64_t v7 = 2LL;
LABEL_5:
    [v4 setState:v7 completion:v6];

    id v3 = v8;
  }
}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  BSSetMainThreadPriorityFixedForUI(1LL);
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:off_100011EB0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:off_100011EB8]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = (uint64_t)v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Reading boot count from %@",  buf,  0xCu);
  }

  int v27 = 0;
  id v10 = v9;
  v11 = fopen((const char *)[v10 UTF8String], "r");
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006694();
    }
    goto LABEL_17;
  }

  v12 = v11;
  int v13 = fscanf(v11, "%d", &v27);
  if (fclose(v12) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006748();
  }
  if (v13 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006708();
    }
    goto LABEL_17;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v27;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Boot count:%d", buf, 8u);
  }

  int v14 = v27;
  BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v14 < 5)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting PreBoard is not required.",  buf,  2u);
    }

LABEL_17:
    objc_autoreleasePoolPop(v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = 0x3FE0000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PreBoard continuing launch with intent to exit {delay=%.2fs}",  buf,  0xCu);
    }

    dispatch_time_t v16 = dispatch_time(0LL, 500000000LL);
    dispatch_after(v16, &_dispatch_main_q, &stru_10000C648);
    return UIApplicationMain(a1, a2, 0LL, 0LL);
  }

  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting PreBoard...",  buf,  2u);
  }

  objc_autoreleasePoolPop(v4);
  v19 = objc_autoreleasePoolPush();
  v20 = (objc_class *)objc_opt_class(&OBJC_CLASS___PREApplication);
  v21 = NSStringFromClass(v20);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (objc_class *)objc_opt_class(&OBJC_CLASS___PREAppDelegate);
  v24 = NSStringFromClass(v23);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = (id)FBSystemShellInitialize(&stru_10000C608);
  objc_autoreleasePoolPop(v19);
  uint64_t v17 = UIApplicationMain(a1, a2, v22, v25);

  return v17;
}

void sub_100002D44(id a1, FBMutableSystemShellInitializationOptions *a2)
{
  v2 = a2;
  -[FBMutableSystemShellInitializationOptions setShouldWaitForMigrator:](v2, "setShouldWaitForMigrator:", 0LL);
  -[FBMutableSystemShellInitializationOptions setRegisterAdditionalServicesBlock:]( v2,  "setRegisterAdditionalServicesBlock:",  &stru_10000C628);
}

void sub_100002D80(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  id v2 =  +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v1);
}

void sub_100002DE4(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PreBoard exiting successfully...",  v1,  2u);
  }

  exit(0);
}

void sub_100002E38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000315C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PREViewController viewController](&OBJC_CLASS___PREViewController, "viewController"));
  [*(id *)(*(void *)(a1 + 32) + 24) presentViewController:v2 animated:1 completion:0];
  +[PBSRecoveryModeReporter reportAction:]( &OBJC_CLASS___PBSRecoveryModeReporter,  "reportAction:",  PBSRecoveryModeActionTriggered);
}
}

void sub_1000037CC(double *a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](&OBJC_CLASS___FBDisplayManager, "mainConfiguration"));
  [v5 setDisplayConfiguration:v3];

  objc_msgSend(v5, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
  [v5 setLevel:0.0];
  [v5 setForeground:1];
  [v5 setInterfaceOrientation:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 ignoreOcclusionReasons]);
  [v4 addObject:@"SystemApp"];
}

void sub_10000388C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isUISubclass])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settings]);
    objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v3, "interfaceOrientation"));

    [v4 setStatusBarStyle:0];
  }
}

void sub_100004318(id a1, UIAlertAction *a2)
{
}

void sub_10000432C(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedStringForKey:@"PREDialogTitle" value:&stru_10000CBB8 table:0]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"PREResetAllSettingsConfirmationMessage" value:&stru_10000CBB8 table:0]);
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v2,  v4,  1LL));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"PREResetAllSettingsButton" value:&stru_10000CBB8 table:0]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  2LL,  &stru_10000C710));
  [v14 addAction:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"PRECancelButton" value:&stru_10000CBB8 table:0]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  &stru_10000C730));

  [v14 addAction:v10];
  [v14 setPreferredAction:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootViewController]);
  [v13 presentViewController:v14 animated:1 completion:0];
}

void sub_100004528(id a1, UIAlertAction *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  [v2 failedBootCountObliterate];
}

void sub_10000455C(id a1, UIAlertAction *a2)
{
}

void sub_100004570(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 rootViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PREViewController viewController](&OBJC_CLASS___PREViewController, "viewController"));
  [v2 presentViewController:v3 animated:1 completion:0];
}

void sub_1000045FC(id a1, UIAlertAction *a2)
{
}

void sub_100004610(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedStringForKey:@"PREDialogTitle" value:&stru_10000CBB8 table:0]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"PRERestoreConfirmationMessage" value:&stru_10000CBB8 table:0]);
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v2,  v4,  1LL));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"PRERestoreButton" value:&stru_10000CBB8 table:0]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  2LL,  &stru_10000C7B0));
  [v14 addAction:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"PRECancelButton" value:&stru_10000CBB8 table:0]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  &stru_10000C7D0));

  [v14 addAction:v10];
  [v14 setPreferredAction:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootViewController]);
  [v13 presentViewController:v14 animated:1 completion:0];
}

void sub_10000480C(id a1, UIAlertAction *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  [v2 failedBootCountRestore];
}

void sub_100004840(id a1, UIAlertAction *a2)
{
}

void sub_100004854(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 rootViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PREViewController viewController](&OBJC_CLASS___PREViewController, "viewController"));
  [v2 presentViewController:v3 animated:1 completion:0];
}

void sub_1000048E0(id a1, UIAlertAction *a2)
{
}

void sub_1000048F4(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  [v1 clearFailedBootCountAndRestart];
}

void sub_100004970(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PreBoard exiting successfully...",  v1,  2u);
  }

  exit(0);
}

void sub_100004BF4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100004C7C;
  v2[3] = &unk_10000C908;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(&_dispatch_main_q, v2);
}

void sub_100004C7C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) confirmationTitle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) confirmationMessage]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v2,  v3,  1LL));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"PRELAEnableButton" value:&stru_10000CBB8 table:0]);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  dispatch_time_t v16 = sub_100004E8C;
  uint64_t v17 = &unk_10000C8A0;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  0LL,  &v14));
  objc_msgSend(v4, "addAction:", v7, v14, v15, v16, v17);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"PRECancelButton" value:&stru_10000CBB8 table:0]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  &stru_10000C8C0));

  [v4 addAction:v10];
  [v4 setPreferredAction:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootViewController]);
  [v13 presentViewController:v4 animated:1 completion:0];
}

void sub_100004E8C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100004F00;
  v2[3] = &unk_10000C878;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enableCurrentUseCaseWithPasscode:&stru_10000CBB8 completion:v2];
}

void sub_100004F00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000068F8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [*(id *)(a1 + 32) exit];
}

void sub_100004F54(id a1, UIAlertAction *a2)
{
}

void sub_100004F68(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PREAppDelegate sharedAppDelegate](&OBJC_CLASS___PREAppDelegate, "sharedAppDelegate"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 rootViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRELAViewController viewController](&OBJC_CLASS___PRELAViewController, "viewController"));
  [v2 presentViewController:v3 animated:1 completion:0];
}

void sub_100004FF4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100005060;
  v2[3] = &unk_10000C878;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 terminateWithCompletion:v2];
}

void sub_100005060(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006968((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [*(id *)(a1 + 32) exit];
}

void sub_1000053C4(id a1, NSTimer *a2)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_10000C968);
}

void sub_100005400(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[PRESystemIndicator sharedInstance](&OBJC_CLASS___PRESystemIndicator, "sharedInstance"));
  [v1 flashMorseCodePattern:@"I"];
}

id sub_100005E18(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_100005E24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id *sub_100005E30(id *result)
{
  if (*((_BYTE *)result + 40)) {
    return (id *)[result[4] removeFromParentViewController];
  }
  return result;
}

id *sub_100005E44(id *result)
{
  if (*((_BYTE *)result + 48)) {
    return (id *)[result[4] didMoveToParentViewController:result[5]];
  }
  return result;
}

uint64_t sub_100005E60(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100005EAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100005EB8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100005F00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100005F0C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000065B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006624( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006694()
{
}

void sub_100006708()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to read a valid count",  v0,  2u);
  sub_100002E48();
}

void sub_100006748()
{
}

void sub_1000067BC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed boot count obliteration failed with error:0x%x",  (uint8_t *)v1,  8u);
}

void sub_100006838()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to trigger NeRD",  v0,  2u);
}

void sub_10000687C(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to clear boot count [%@]",  (uint8_t *)&v1,  0xCu);
}

void sub_1000068F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006968( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000069D8(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to build transformed configuration: %{public}@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_initWithMainDisplayContext_launchDisplayContext_deviceContext_persistedSceneIdentifiers_supportAppSceneRequests_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:");
}

id objc_msgSend_transitionFromViewController_toViewController_duration_options_animations_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}