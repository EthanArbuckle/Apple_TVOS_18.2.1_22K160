void sub_100003980(int a1)
{
  void block[4];
  int v2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = nullsub_2;
  block[3] = &unk_1000040F0;
  v2 = a1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_1000039DC(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v3 = 0LL;
  v4 = (id *)&unk_100008028;
  do
  {
    int v5 = dword_100003E88[v3];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v5, 0LL, v2);
    v7 = (void *)qword_100008068;
    qword_100008068 = (uint64_t)v6;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100003AEC;
    handler[3] = &unk_1000040F0;
    int v9 = v5;
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008068, handler);
    objc_storeStrong(v4, (id)qword_100008068);
    dispatch_resume((dispatch_object_t)qword_100008068);
    signal(v5, (void (__cdecl *)(int))1);
    ++v3;
    ++v4;
  }

  while (v3 != 7);
}

void sub_100003AEC(uint64_t a1)
{
}

uint64_t start()
{
  if (qword_100008060 != -1) {
    dispatch_once(&qword_100008060, &stru_100004130);
  }
  v0 = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("SLDCloudKitSync exterior", v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003C1C;
  block[3] = &unk_1000041B8;
  dispatch_queue_t v11 = v5;
  dispatch_source_t v6 = v5;
  dispatch_async(v6, block);
  id v7 = objc_alloc_init(&OBJC_CLASS___SocialLayerDaemon);
  [v7 setupListeners];

  objc_autoreleasePoolPop(v0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v8 run];

  return 0LL;
}

void sub_100003C1C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SLDCloudKitSyncReader sharedInstance](&OBJC_CLASS___SLDCloudKitSyncReader, "sharedInstance"));
  [v2 setChangeCallback:&stru_100004150];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", *(dispatch_queue_t *)(a1 + 32), &stru_100004190);
}

void sub_100003C7C(id a1)
{
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}