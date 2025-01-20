id sub_1000021AC()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  v4 = 0LL;
  v5 = &v4;
  v6 = 0x2050000000LL;
  v0 = (void *)qword_1000081C8;
  v7 = qword_1000081C8;
  if (!qword_1000081C8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000032A0;
    v3[3] = &unk_100004158;
    v3[4] = &v4;
    sub_1000032A0((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100002274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

id sub_10000228C()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_1000081D8;
  uint64_t v7 = qword_1000081D8;
  if (!qword_1000081D8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100003464;
    v3[3] = &unk_100004158;
    v3[4] = &v4;
    sub_100003464((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100002354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

LABEL_27:
  return v76;
}

void sub_1000032A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000081C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getW5ClientClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"WiFiDiagnosticsExtension.m",  19,  @"Unable to find class %s",  "W5Client");

    __break(1u);
  }
}

void sub_100003364()
{
  v3 = 0LL;
  if (!qword_1000081D0)
  {
    __int128 v4 = off_100004178;
    uint64_t v5 = 0LL;
    qword_1000081D0 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_1000081D0)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *WiFiVelocityLibrary(void)"));
    objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v2,  @"WiFiDiagnosticsExtension.m",  18,  @"%s",  v3);

    __break(1u);
    goto LABEL_7;
  }

  v0 = v3;
  if (v3) {
LABEL_7:
  }
    free(v0);
}

Class sub_100003464(uint64_t a1)
{
  Class result = objc_getClass("W5LogItemRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000081D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getW5LogItemRequestClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"WiFiDiagnosticsExtension.m",  21,  @"Unable to find class %s",  "W5LogItemRequest");

    __break(1u);
    return (Class)NSExtensionMain();
  }

  return result;
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}