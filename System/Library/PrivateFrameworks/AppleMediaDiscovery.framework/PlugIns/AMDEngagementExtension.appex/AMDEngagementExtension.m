void sub_10000376C(id *a1)
{
  NSProcessInfo *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(void *, char);
  void *v7;
  id v8;
  id v9[3];
  v9[2] = a1;
  v9[1] = a1;
  v2 = +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo");
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100003864;
  v7 = &unk_100004080;
  v8 = a1[4];
  v9[0] = a1[5];
  -[NSProcessInfo performExpiringActivityWithReason:usingBlock:]( v2,  "performExpiringActivityWithReason:usingBlock:",  @"Calling AMD extension");

  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v8, 0LL);
}

void sub_100003864(void *a1, char a2)
{
  v13 = a1;
  char v12 = a2 & 1;
  v11[1] = a1;
  v11[0] = 0LL;
  id v10 = 0LL;
  if ((a2 & 1) != 0)
  {
    id location = &_os_log_default;
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v8;
      sub_1000039CC(v7);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Extension is being terminated", v7, 2u);
    }

    objc_storeStrong(&location, 0LL);
    +[AMDJSRequestHandler wrapUp](&OBJC_CLASS___AMDJSRequestHandler, "wrapUp");
    objc_storeStrong(&v10, &off_100004180);
    id v2 = +[AMDError allocError:withMessage:]( &OBJC_CLASS___AMDError,  "allocError:withMessage:",  29LL,  @"AMD is being killed");
    id v3 = v11[0];
    v11[0] = v2;

    (*(void (**)(void))(a1[5] + 16LL))();
  }

  else
  {
    +[AMDJSRequestHandler handlePayload:withCompletionHandler:]( &OBJC_CLASS___AMDJSRequestHandler,  "handlePayload:withCompletionHandler:",  a1[4],  a1[5]);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(v11, 0LL);
}

_BYTE *sub_1000039CC(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id objc_msgSend_wrapUp(void *a1, const char *a2, ...)
{
  return [a1 wrapUp];
}