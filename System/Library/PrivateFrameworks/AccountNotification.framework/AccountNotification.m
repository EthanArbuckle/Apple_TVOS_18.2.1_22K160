void sub_100004620(id a1)
{
  ANNotificationStore *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___ANNotificationStore);
  v2 = (void *)qword_100011580;
  qword_100011580 = (uint64_t)v1;
}

void sub_1000048FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004914(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004924(uint64_t a1)
{
}

void sub_10000492C(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8LL);
  id v17 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v2 error:&v17]);
  id v5 = v17;
  if (v5)
  {
    uint64_t v6 = _ANLogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007D34();
    }
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v7 = v4;
    id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  @"accountTypeID",  (void)v13));
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v12];
        }

        id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v9);
    }
  }
}

void sub_100004BEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004C04(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8LL);
  id v20 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v2 error:&v20]);
  id v5 = v20;
  if (v5)
  {
    uint64_t v6 = _ANLogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007DA8();
    }
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc(&OBJC_CLASS___ANAccountNotification);
        id v15 = objc_msgSend(v14, "initWithManagedObject:", v13, (void)v16);
        if (v15) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v15];
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v10);
  }
}

void sub_100004EAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004EC4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"AccountNotification"));
  [v2 setFetchLimit:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier = %@",  v3));
  [v2 setPredicate:v4];

  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) countForFetchRequest:v2 error:0];
  uint64_t v6 = _ANLogSystem();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007E90((id *)(a1 + 32), v8);
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ANNotificationStore saveNotification:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 164;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s (%d) Adding new notification to database.",  buf,  0x12u);
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"AccountNotification",  *(void *)(*(void *)(a1 + 40) + 8LL)));
    -[os_log_s takeValuesFromAccountNotification:](v8, "takeValuesFromAccountNotification:", *(void *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activateAction]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"NotificationAction",  *(void *)(*(void *)(a1 + 40) + 8LL)));
      [v10 takeValuesFromNotificationAction:v9];
      [v10 setNotificationToActivate:v8];
      -[os_log_s setActivateAction:](v8, "setActivateAction:", v10);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dismissAction]);
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"NotificationAction",  *(void *)(*(void *)(a1 + 40) + 8LL)));
      [v12 takeValuesFromNotificationAction:v11];
      [v12 setNotificationToDismiss:v8];
      -[os_log_s setDismissAction:](v8, "setDismissAction:", v12);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 40),  "_unsafe_commitChangesInManagedObjectContext");
  }
}

void sub_10000550C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

void sub_100005548(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8LL);
  id v8 = 0LL;
  id v4 = [v3 countForFetchRequest:v2 error:&v8];
  id v5 = v8;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v4;
  if (v5)
  {
    uint64_t v6 = _ANLogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007F38();
    }
  }
}

void sub_1000055D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v17 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v2 error:&v17]);
  id v5 = v17;
  if (v5)
  {
    uint64_t v6 = _ANLogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007FAC();
    }
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "deleteObject:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)i),  (void)v13);
        }

        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v10);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "_unsafe_commitChangesInManagedObjectContext");
  }
}

void sub_100005900( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005920(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v18 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v2 error:&v18]);
  id v5 = v18;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = _ANLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100008020();
    }
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "deleteObject:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v13),  (void)v14);
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v11);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "_unsafe_commitChangesInManagedObjectContext");
}

void sub_100005C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100005C84(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v13 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 executeFetchRequest:v2 error:&v13]);
  id v5 = v13;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    uint64_t v8 = _ANLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100008094();
    }
  }

  else if (v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) deleteObject:v6];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "_unsafe_commitChangesInManagedObjectContext");
  }

  else
  {
    uint64_t v10 = _ANLogSystem(v7);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      __int128 v15 = "-[ANNotificationStore removeNotificationWithIdentifier:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 283;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s (%d) Notification with ID %@ seems to be gone already.",  buf,  0x1Cu);
    }
  }
}

id sub_10000609C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 16)];
}

void sub_1000060E8(id a1)
{
  v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ANAccountNotification));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 pathForResource:@"AccountNotificationStore" ofType:@"momd"]);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  id v4 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v3);
  id v5 = (void *)qword_100011590;
  qword_100011590 = (uint64_t)v4;
}

void sub_10000626C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000064B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = _ANLogSystem(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100008300((uint64_t)v4, v6);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006B1C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___ANDaemon);
  uint64_t v2 = (void *)qword_1000115A0;
  qword_1000115A0 = (uint64_t)v1;
}

void sub_100006EBC(uint64_t a1)
{
  uint64_t v2 = _ANLogSystem(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100008490(a1, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_100006F04(uint64_t a1)
{
  uint64_t v2 = _ANLogSystem();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315650;
    uint64_t v6 = "-[ANDaemon listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 92;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s (%d) Connection from %@ was invalidated.",  (uint8_t *)&v5,  0x1Cu);
  }
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = _ANLogSystem(v0);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "main";
    __int16 v11 = 1024;
    int v12 = 17;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s (%d) and is starting up...",  (uint8_t *)&v9,  0x12u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ANDaemon sharedInstance](&OBJC_CLASS___ANDaemon, "sharedInstance"));
  [v3 start];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v4 run];

  uint64_t v6 = _ANLogSystem(v5);
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "main";
    __int16 v11 = 1024;
    int v12 = 22;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s (%d) and is shutting down...",  (uint8_t *)&v9,  0x12u);
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_10000735C(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"eventIdentifier == %@",  v3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);

  uint64_t v8 = _ANLogSystem(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    *(_DWORD *)buf = 136315906;
    id v13 = "-[ANNotificationController removeNotificationsWithEventID:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 61;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s (%d) Notifications for %@: %@",  buf,  0x26u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000074D8;
  v11[3] = &unk_10000C418;
  v11[4] = a1[5];
  [v6 enumerateObjectsUsingBlock:v11];
  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_1000074D8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 identifier]);
  [v2 removeNotificationWithIdentifier:v3];
}

void sub_10000765C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackMachService]);

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackMachService]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v3 _clientSideNotifierWithMachServiceName:v4]);

    [v9 notificationWasActivated:*(void *)(a1 + 32)];
LABEL_5:

    return;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activateAction]);

  if (v5)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activateAction]);
    [v9 perform];
    goto LABEL_5;
  }

  uint64_t v7 = _ANLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[ANNotificationController notificationProvider:didActivateNotification:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 84;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s (%d) No value for callbackMachService or activateAction. Ignoring bulletin's activation.",  buf,  0x12u);
  }
}

void sub_100007904(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackMachService]);

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackMachService]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v3 _clientSideNotifierWithMachServiceName:v4]);

    [v9 notificationWasDismissed:*(void *)(a1 + 32)];
LABEL_5:

    return;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dismissAction]);

  if (v5)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dismissAction]);
    [v9 perform];
    goto LABEL_5;
  }

  uint64_t v7 = _ANLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[ANNotificationController notificationProvider:didDismissNotification:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 99;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s (%d) No value for callbackMachService or dismissAction. Ignoring bulletin's dismissal.",  buf,  0x12u);
  }
}

void sub_100007C34(uint64_t a1)
{
  uint64_t v1 = _ANLogSystem(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10000851C();
  }
}

void sub_100007C7C(uint64_t a1)
{
  uint64_t v1 = _ANLogSystem(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000859C();
  }
}

void sub_100007CC4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _ANLogSystem(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100008628((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100007D34()
{
}

void sub_100007DA8()
{
}

void sub_100007E1C()
{
}

void sub_100007E90(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 identifier]);
  v4[0] = 136315650;
  sub_10000627C();
  sub_100006258();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s (%d) Duplicate notification found in DB for identifier: %@",  (uint8_t *)v4,  0x1Cu);
}

void sub_100007F38()
{
}

void sub_100007FAC()
{
}

void sub_100008020()
{
}

void sub_100008094()
{
}

void sub_100008108()
{
  v1[0] = 136315394;
  sub_10000627C();
  *(_DWORD *)((char *)&v1[3] + 2) = 302;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "%s (%d) Core Data save succeeded!",  (uint8_t *)v1,  0x12u);
}

void sub_100008190()
{
}

void sub_100008204()
{
  v1[0] = 136315394;
  sub_10000627C();
  *(_DWORD *)((char *)&v1[3] + 2) = 316;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s (%d) BIG PROBLEM: Failed to create NSPersistentStoreCoordinator! Good luck everyone.",  (uint8_t *)v1,  0x12u);
}

void sub_10000828C()
{
}

void sub_100008300(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[ANNotificationProvider postNotification:completion:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 75;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s (%d) Error posting notification %@",  (uint8_t *)&v2,  0x1Cu);
}

void sub_100008398()
{
}

void sub_100008414()
{
}

void sub_100008490( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000851C()
{
}

void sub_10000859C()
{
  int v1 = 136315650;
  uint64_t v2 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]_block_invoke";
  __int16 v3 = 1024;
  sub_100007D20();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "%s (%d) XPC connection to %@ was invalidated.",  (uint8_t *)&v1,  0x1Cu);
  sub_10000628C();
}

void sub_100008628( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}