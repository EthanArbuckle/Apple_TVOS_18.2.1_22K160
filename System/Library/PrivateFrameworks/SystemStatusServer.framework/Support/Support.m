id sub_100002A9C(void *a1)
{
  id v1;
  id v2;
  void v4[4];
  id v5;
  v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002B6C;
  v4[3] = &unk_1000041A8;
  v2 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v1 count]));
  v5 = v2;
  [v1 enumerateWithBlock:v4];

  return v2;
}

void sub_100002B6C(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
  [v2 addObject:v3];
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc_init(&OBJC_CLASS___STLocalStatusServer);
  v2 = -[STStatusServerTransactionManager initWithServer:]( objc_alloc(&OBJC_CLASS___STStatusServerTransactionManager),  "initWithServer:",  v1);
  id v3 = (void *)qword_1000082F0;
  qword_1000082F0 = (uint64_t)v2;

  id v4 = objc_alloc_init(&OBJC_CLASS___STLocalDynamicActivityAttributionManager);
  v5 = (void *)qword_1000082F8;
  qword_1000082F8 = (uint64_t)v4;

  id v6 = objc_alloc(&OBJC_CLASS___STDynamicActivityAttributionMonitor);
  id v7 = [v6 initWithServerHandle:qword_1000082F8];
  v8 = (void *)qword_100008300;
  qword_100008300 = (uint64_t)v7;

  id v9 = objc_alloc_init(&OBJC_CLASS___STLocationStatusDomainDisplayNameTransformerProvider);
  v10 = (void *)qword_100008308;
  qword_100008308 = (uint64_t)v9;

  id v11 = objc_alloc_init(&OBJC_CLASS___STMediaStatusDomainDisplayNameTransformerProvider);
  v12 = (void *)qword_100008310;
  qword_100008310 = (uint64_t)v11;

  -[STLocalStatusServer addClientDataTransformerProvider:forDomain:]( v1,  "addClientDataTransformerProvider:forDomain:",  qword_100008308,  5LL);
  -[STLocalStatusServer addClientDataTransformerProvider:forDomain:]( v1,  "addClientDataTransformerProvider:forDomain:",  qword_100008310,  6LL);
  id v13 = objc_alloc_init(&OBJC_CLASS___STBackgroundActivitiesStatusDomainVisualDescriptorTransformer);
  v14 = (void *)qword_100008318;
  qword_100008318 = (uint64_t)v13;

  -[STLocalStatusServer addDataTransformer:forDomain:](v1, "addDataTransformer:forDomain:", qword_100008318, 1LL);
  id v15 = objc_alloc_init(&OBJC_CLASS___STStatusItemsStatusDomainVisualDescriptorTransformer);
  v16 = (void *)qword_100008320;
  qword_100008320 = (uint64_t)v15;

  -[STLocalStatusServer addDataTransformer:forDomain:](v1, "addDataTransformer:forDomain:", qword_100008320, 13LL);
  if (_BSIsInternalInstall("int main(int, const char **)"))
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100002F2C;
    v39[3] = &unk_100004210;
    v17 = v1;
    v40 = v17;
    v18 = objc_retainBlock(v39);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100002F4C;
    v37[3] = &unk_100004210;
    v38 = v17;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100002F6C;
    v34[3] = &unk_100004258;
    id v35 = v18;
    v36 = objc_retainBlock(v37);
    v19 = v36;
    v20 = v18;
    v21 = objc_retainBlock(v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[STSystemStatusDefaults standardDefaults](&OBJC_CLASS___STSystemStatusDefaults, "standardDefaults"));
    id v23 =  [v22 observeDefault:@"shouldEnableUnknownBackgroundActivities" onQueue:&_dispatch_main_q withBlock:v20];
    id v24 =  [v22 observeDefault:@"shouldEnableUnknownStatusItems" onQueue:&_dispatch_main_q withBlock:v19];

    id v25 =  [v22 observeDefault:@"shouldEnableUnknownBundles" onQueue:&_dispatch_main_q withBlock:v21];
  }

  v26 = (void *)qword_100008300;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100002F9C;
  v32[3] = &unk_1000042A8;
  v33 = v1;
  v27 = v1;
  [v26 setHandler:v32];
  [(id)qword_100008300 activate];
  v28 = (void *)qword_100008310;
  v29 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100008300 currentAttributions]);
  [v28 setDynamicAttributions:v29];

  notify_post("com.apple.systemstatus.server-launch");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v30 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

id sub_100002F2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyDataTransformer:qword_100008318 forDomain:1 usingBlock:&stru_1000041E8];
}

id sub_100002F4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyDataTransformer:qword_100008320 forDomain:13 usingBlock:&stru_100004230];
}

uint64_t sub_100002F6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100002F9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = qword_100008310;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003028;
  v7[3] = &unk_100004280;
  id v8 = v3;
  id v6 = v3;
  [v4 modifyClientDataTransformerProvider:v5 forDomain:6 usingBlock:v7];
}

id sub_100003028(uint64_t a1)
{
  return [(id)qword_100008310 setDynamicAttributions:*(void *)(a1 + 32)];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}