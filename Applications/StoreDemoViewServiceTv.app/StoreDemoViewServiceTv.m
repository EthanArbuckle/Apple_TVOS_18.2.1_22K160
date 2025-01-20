id sub_100003834()
{
  if (qword_100012280 != -1) {
    dispatch_once(&qword_100012280, &stru_10000C340);
  }
  return (id)qword_100012278;
}

void sub_100003874(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  v2 = (void *)qword_100012278;
  qword_100012278 = (uint64_t)v1;
}

id sub_1000038A4()
{
  if (qword_100012290 != -1) {
    dispatch_once(&qword_100012290, &stru_10000C360);
  }
  return (id)qword_100012288;
}

void sub_1000038E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  v2 = (void *)qword_100012288;
  qword_100012288 = (uint64_t)v1;
}

id sub_100003914()
{
  if (qword_1000122A0 != -1) {
    dispatch_once(&qword_1000122A0, &stru_10000C380);
  }
  return (id)qword_100012298;
}

void sub_100003954(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  v2 = (void *)qword_100012298;
  qword_100012298 = (uint64_t)v1;
}

id sub_100003984()
{
  if (qword_1000122B0 != -1) {
    dispatch_once(&qword_1000122B0, &stru_10000C3A0);
  }
  return (id)qword_1000122A8;
}

void sub_1000039C4(id a1)
{
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }

  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }

  v3 = (void *)qword_1000122A8;
  qword_1000122A8 = (uint64_t)v1;
}

void sub_100003A20( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_100003ABC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLogModel);
  id v2 = (void *)qword_1000122B8;
  qword_1000122B8 = (uint64_t)v1;
}

void sub_100003C58(_Unwind_Exception *a1)
{
}

void sub_100003FE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100004000(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004010(uint64_t a1)
{
}

void sub_100004018(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1LL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }

  *a4 = 0;
}

void sub_1000042B4(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDViewServiceModel);
  id v2 = (void *)qword_1000122C8;
  qword_1000122C8 = (uint64_t)v1;
}
}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  v6 = NSStringFromClass(v5);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100006804(_Unwind_Exception *a1)
{
}

void sub_10000681C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 errorToReport]);

  id v4 = sub_100003834();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Operation failed...", v8, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained operationFailed:v3];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Operation completed...", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained quit];
  }
}

void sub_100006914(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateErrorState];
}

void sub_100006940(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](&OBJC_CLASS___MSDViewServiceModel, "sharedInstance"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v2 progress]);

  if (v8)
  {
    v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained progressBar]);
    [v5 setHidden:0];

    id v6 = objc_loadWeakRetained(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 progressBar]);
    [v8 floatValue];
    objc_msgSend(v7, "setProgress:animated:", 1);
  }
}

id sub_100006C68(uint64_t a1)
{
  return [*(id *)(a1 + 32) quit];
}

id sub_100006F7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) doCancelInstall];
}

id sub_100006F84(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeout:0];
}

void sub_100007250(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown key changed.", v1, 2u);
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}