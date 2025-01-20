int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  char *v4;
  dispatch_queue_attr_t v5;
  dispatch_queue_attr_s *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  os_log_s *v18;
  uint64_t v19;
  os_log_s *v20;
  uint64_t v21;
  os_log_s *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char v27[8];
  uint64_t v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  v3 = objc_autoreleasePoolPush();
  bzero(v27, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.SetStoreUpdateService") & 1) == 0)
  {
    v17 = __biome_log_for_category(0LL);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000038A0();
    }

    exit(1);
  }

  if (!confstr(65537, v27, 0x400uLL))
  {
    v19 = __biome_log_for_category(0LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000037B0();
    }

    exit(1);
  }

  v4 = realpath_DARWIN_EXTSN(v27, 0LL);
  if (!v4)
  {
    v21 = __biome_log_for_category(0LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100003828();
    }

    exit(1);
  }

  free(v4);
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("SetStoreUpdateService", v6);
  v8 = (void *)qword_100008040;
  qword_100008040 = (uint64_t)v7;

  v23 = 0LL;
  v24 = &v23;
  v25 = 0x2050000000LL;
  v9 = (void *)qword_100008058;
  v26 = qword_100008058;
  if (!qword_100008058)
  {
    *(void *)v27 = _NSConcreteStackBlock;
    v28 = 3221225472LL;
    v29 = sub_1000036B4;
    v30 = &unk_100004110;
    v31 = &v23;
    sub_1000036B4((uint64_t)v27);
    v9 = (void *)v24[3];
  }

  v10 = v9;
  _Block_object_dispose(&v23, 8);
  v11 = objc_alloc(v10);
  v12 = [v11 initWithQueue:qword_100008040];
  v13 = (void *)qword_100008050;
  qword_100008050 = (uint64_t)v12;

  v14 = objc_claimAutoreleasedReturnValue(+[BMXPCListener serviceListener](&OBJC_CLASS___BMXPCListener, "serviceListener"));
  v15 = (void *)qword_100008048;
  qword_100008048 = v14;

  [(id)qword_100008048 setDelegate:qword_100008050];
  [(id)qword_100008048 setQueue:qword_100008040];
  objc_autoreleasePoolPop(v3);
  [(id)qword_100008048 activate];
  return 1;
}

void sub_100003694(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

Class sub_1000036B4(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_100008060)
  {
    __int128 v4 = off_100004130;
    uint64_t v5 = 0LL;
    qword_100008060 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_100008060) {
    sub_100003914(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("CCSetStoreUpdateService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_100003990();
  }
  qword_100008058 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100003790( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000037B0()
{
}

void sub_100003828()
{
}

void sub_1000038A0()
{
}

void sub_100003914(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CascadeEngineLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"SetStoreUpdateService.m",  27,  @"%s",  *a1);

  __break(1u);
}

void sub_100003990()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCCSetStoreUpdateServiceClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"SetStoreUpdateService.m",  28,  @"Unable to find class %s",  "CCSetStoreUpdateService");

  __break(1u);
  _Block_object_dispose(v2, v3);
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}