void sub_10000427C(id a1)
{
  NotifierDelegate *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___NotifierDelegate);
  v2 = (void *)qword_10000D9F0;
  qword_10000D9F0 = (uint64_t)v1;
}

void sub_10000484C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientIdentifier]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000048F4;
  v4[3] = &unk_100008250;
  id v5 = *(id *)(a1 + 40);
  [v2 pendingNotificationsForClient:v3 withCompletion:v4];
}

uint64_t sub_1000048F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000049F4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NotificationController);
  v2 = (void *)qword_10000DA00;
  qword_10000DA00 = (uint64_t)v1;
}

id sub_100004C14(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004C6C;
  v3[3] = &unk_1000082C0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateObjectsUsingBlock:v3];
}

void sub_100004C6C(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 identifier]);
  [v2 tearDownNotificationWithIdentifier:v3];
}

void sub_100004DD8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"clientIdentifier == %@",  v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);

  uint64_t v9 = _FALogSystem(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notifications for %@: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100004FF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"relevanceDate",  0LL));
  uint64_t v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingDescriptors:v5]);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_11:
}

void sub_100005370(id a1, NSError *a2)
{
  v2 = a2;
  uint64_t v3 = _FALogSystem();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NotificationController: XPC Error from client delegate while trying to send an activation callback - %@",  (uint8_t *)&v5,  0xCu);
  }
}

LABEL_8:
}

void sub_10000558C(id a1, NSError *a2)
{
  v2 = a2;
  uint64_t v3 = _FALogSystem();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NotificationController: XPC Error from client delegate while trying to send an activation callback - %@",  (uint8_t *)&v5,  0xCu);
  }
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NotifierDelegate sharedInstance](&OBJC_CLASS___NotifierDelegate, "sharedInstance"));
  [v1 start];

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 0LL;
}

void sub_100005908(id a1, NSError *a2)
{
  v2 = a2;
  id v4 = v2;
  if (v2)
  {
    uint64_t v5 = _FALogSystem(v2, v3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005EDC((uint64_t)v4, v6);
    }
  }
}

void sub_100005EDC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error posting notification %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_xpcConnectionForClientWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnectionForClientWithMachServiceName:");
}