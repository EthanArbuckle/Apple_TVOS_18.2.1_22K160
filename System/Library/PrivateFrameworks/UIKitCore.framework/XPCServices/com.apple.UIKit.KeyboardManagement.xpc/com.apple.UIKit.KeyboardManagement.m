}

void sub_100001E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100001E5C(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

void sub_100001ED0(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 owner]);
  [v4 updateSceneClientSettings:v3];
}

void sub_1000020CC()
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  v0 = off_100008A10;
  v9 = off_100008A10;
  if (!off_100008A10)
  {
    v1 = sub_1000025C8();
    v0 = dlsym(v1, "_UIArbiterLog");
    v7[3] = (uint64_t)v0;
    off_100008A10 = v0;
  }

  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = ((uint64_t (*)(void))v0)();
    id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "os_log_t _Local_UIArbiterLog(void)"));
    objc_msgSend( v4,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"_UIKeyboardManagement.m",  16,  @"%s",  dlerror());

    __break(1u);
  }

void sub_1000021AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void *sub_1000025C8()
{
  id v4 = 0LL;
  if (!qword_100008A08)
  {
    __int128 v5 = off_100004220;
    uint64_t v6 = 0LL;
    qword_100008A08 = _sl_dlopen(&v5, &v4);
  }

  v0 = (void *)qword_100008A08;
  if (!qword_100008A08)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *KeyboardArbiterLibrary(void)"));
    objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"_UIKeyboardManagement.m",  15,  @"%s",  v4);

    __break(1u);
    goto LABEL_7;
  }

  v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t start()
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2050000000LL;
  v0 = (void *)qword_100008A20;
  uint64_t v21 = qword_100008A20;
  if (!qword_100008A20)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000028B4;
    v17[3] = &unk_100004268;
    v17[4] = &v18;
    sub_1000028B4((uint64_t)v17);
    v0 = (void *)v19[3];
  }

  v1 = v0;
  _Block_object_dispose(&v18, 8);
  id v2 = objc_alloc(v1);
  id v3 = objc_opt_new(&OBJC_CLASS___UIKeyboardManagementLink);
  id v4 = [v2 initWithLink:v3];

  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100002888;
  v15 = &unk_100004240;
  id v16 = v4;
  uint64_t v5 = qword_100008A30;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&qword_100008A30, &stru_1000042C0);
  }
  id v7 = [&v12 copy];
  uint64_t v8 = (void *)qword_100008A18;
  id v9 = objc_retainBlock(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 31LL, v12, v13, v14, v15));
  [v8 setObject:v9 forKey:v10];

  signal(31, (void (__cdecl *)(int))sub_100002A7C);
  [v6 resume];

  return 1LL;
}

void sub_100002870( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100002888(uint64_t a1)
{
}

Class sub_1000028B4(uint64_t a1)
{
  id v6 = 0LL;
  if (!qword_100008A28)
  {
    __int128 v7 = off_100004288;
    uint64_t v8 = 0LL;
    qword_100008A28 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_100008A28)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *KeyboardArbiterLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"main.m", 15, @"%s", v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("_UIKeyboardArbiter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class get_UIKeyboardArbiterClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"main.m",  16,  @"Unable to find class %s",  "_UIKeyboardArbiter");

LABEL_10:
    __break(1u);
  }

  qword_100008A20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100002A50(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v2 = (void *)qword_100008A18;
  qword_100008A18 = v1;
}

void sub_100002A7C(uint64_t a1)
{
  id v2 = (void *)qword_100008A18;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1));
  id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);

  if (v4) {
    v4[2]();
  }
  else {
    NSLog(@"Unexpected signal %i", a1);
  }
}

id objc_msgSend_updateSceneClientSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSceneClientSettings:");
}