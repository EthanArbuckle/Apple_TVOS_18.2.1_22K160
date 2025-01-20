int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 activate];

  return 0;
}

id DSLogSessionAvailability()
{
  if (qword_100012D18 != -1) {
    dispatch_once(&qword_100012D18, &stru_10000C3B0);
  }
  return (id)qword_100012D10;
}

void sub_1000018C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.DiagnosticsSessionAvailability", "service");
  v2 = (void *)qword_100012D10;
  qword_100012D10 = (uint64_t)v1;
}

void sub_100001AD4(uint64_t a1)
{
  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x2020000000LL;
  char v59 = 0;
  v54[0] = 0LL;
  v54[1] = v54;
  v54[2] = 0x3032000000LL;
  v54[3] = sub_100001F8C;
  v54[4] = sub_100001F9C;
  id v55 = 0LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_100001F8C;
  v52 = sub_100001F9C;
  id v53 = 0LL;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(void **)(a1 + 32);
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472LL;
  v34 = sub_100001FA4;
  v35 = &unk_10000C400;
  v40 = &v44;
  v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v36 = v4;
  uint64_t v37 = v5;
  id v38 = v6;
  id v39 = *(id *)(a1 + 48);
  v41 = &v56;
  v42 = v54;
  v43 = &v48;
  [v3 _getHasActiveEnhancedLoggingSessionWithCompletionHandler:&v32];
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    objc_msgSend(v7, "doubleValue", v32, v33, v34, v35, v36, v37, v38);
    double v9 = v8;
  }

  else
  {
    double v9 = 30.0;
  }

  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(v9 * 1000000000.0));
  if (dispatch_group_wait(v4, v10))
  {
    id v11 = DSLogSessionAvailability();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100007270(v12, v9);
    }

    id v13 = DSLogSessionAvailability();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 67109120;
      int v61 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Returning timeout error to client PID %d",  buf,  8u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.DiagnosticsSessionAvailability",  0LL,  0LL));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    if (*((_BYTE *)v45 + 24))
    {
      id v17 = DSLogSessionAvailability();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v61 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Returning status activeEnhancedLogging to client PID %d",  buf,  8u);
      }

      uint64_t v20 = 0LL;
      uint64_t v21 = *(void *)(a1 + 56);
      v22 = &off_10000CF08;
    }

    else if (*((_BYTE *)v57 + 24))
    {
      unsigned int v23 = [*(id *)(a1 + 32) _getHasActiveDiagnosticsSession];
      id v24 = DSLogSessionAvailability();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v26)
        {
          int v27 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          int v61 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Returning session status activeDiagnostics to client PID %d",  buf,  8u);
        }

        uint64_t v20 = 0LL;
        uint64_t v21 = *(void *)(a1 + 56);
        v22 = &off_10000CF20;
      }

      else
      {
        if (v26)
        {
          int v31 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          int v61 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Returning session status available to client PID %d",  buf,  8u);
        }

        uint64_t v20 = 0LL;
        uint64_t v21 = *(void *)(a1 + 56);
        v22 = &off_10000CF38;
      }
    }

    else
    {
      id v28 = DSLogSessionAvailability();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v61 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Returning session status unavailable to client PID %d",  buf,  8u);
      }

      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v20 = v49[5];
      v22 = &off_10000CEF0;
    }

    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t))(v21 + 16))(v21, v22, v20);
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);
}

void sub_100001F3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100001F8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100001F9C(uint64_t a1)
{
}

void sub_100001FA4(uint64_t a1, int a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a2;
  if (a2)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000205C;
    v5[3] = &unk_10000C3D8;
    __int128 v7 = *(_OWORD *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 88);
    v4 = *(void **)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    [v4 _getASTSessionStatusForTicketNumber:v2 timeout:v3 completion:v5];
  }
}

void sub_10000205C(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000021EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 doubleValue];
    v4 = *(void **)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [v4 doubleValue];
  double v7 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000022AC;
  v8[3] = &unk_10000C450;
  id v9 = *(id *)(a1 + 48);
  +[ASTSession sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:]( &OBJC_CLASS___ASTSession,  "sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:",  v3,  v5,  0LL,  v8,  v7);
}

void sub_1000022AC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = DSLogSessionAvailability();
  dispatch_time_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AST sessionExists: %d, info: %@, error: %@",  (uint8_t *)v11,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100002564(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DSLogSessionAvailability();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = [v3 status];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ELS status: %lu", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [v3 status];
  id v7 = DSLogSessionAvailability();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 67109120;
    LODWORD(v10) = (unint64_t)v6 > 1;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Active Enhanced Logging session: %d",  (uint8_t *)&v9,  8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000027EC(uint64_t a1, void *a2)
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000029E4;
  v18[3] = &unk_10000C4C8;
  id v19 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v18];
  id v4 = DSLogSessionAvailability();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovery complete, found: %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = *(id *)(a1 + 32);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int16 v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ASTIdentity identityWithSerialNumber:]( &OBJC_CLASS___ASTIdentity,  "identityWithSerialNumber:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12),  (void)v14));
        [v7 addObject:v13];

        __int16 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000029E4(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v13 state]);
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 serialNumber]);
    if (!v6)
    {
LABEL_5:

      goto LABEL_6;
    }

    id v7 = (void *)v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serialNumber]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & 1) != 0)
    {
      __int16 v12 = *(void **)(a1 + 32);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      [v12 addObject:v5];
      goto LABEL_5;
    }
  }

LABEL_6:
}

void sub_100002CC0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002E54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100002E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = DiagnosticLogHandleForCategory(1LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New devices: %@", (uint8_t *)&v8, 0xCu);
  }

  [WeakRetained setDevices:v3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v7 observerDidChangeDevices:WeakRetained];
}

void sub_1000030B4(_Unwind_Exception *a1)
{
}

void sub_1000030D8(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDevices:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v5 observerDidChangeDevices:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100003678(_Unwind_Exception *a1)
{
}

void sub_1000037A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v3 = dispatch_group_create();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      int v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v8);
        dispatch_group_enter(v3);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        _DWORD v11[2] = sub_100003954;
        v11[3] = &unk_10000C568;
        id v12 = v2;
        id v13 = v3;
        [v9 oneshotWithHandler:v11];

        int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(void *)(v10 + 40) + 16LL))();
}

void sub_100003954(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  [v4 addObjectsFromArray:v5];

  objc_sync_exit(v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000039D4(_Unwind_Exception *a1)
{
}

void sub_100003F28(uint64_t a1)
{
  Class v2 = NSClassFromString(@"DADeviceLocal");
  if (v2)
  {
    uint64_t v3 = objc_opt_new(v2);
  }

  else
  {
    id v4 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
    uint64_t v7 = -[DADeviceRepresentation initWithSerialNumber:isLocal:attributes:]( objc_alloc(&OBJC_CLASS___DADeviceRepresentation),  "initWithSerialNumber:isLocal:attributes:",  v4,  1LL,  &__NSDictionary0__struct);

    uint64_t v3 = (uint64_t)v7;
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = (id)v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void sub_100005410( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000054C0(_Unwind_Exception *a1)
{
}

void sub_100005570(_Unwind_Exception *a1)
{
}

void sub_100005620(_Unwind_Exception *a1)
{
}

void sub_1000056D0(_Unwind_Exception *a1)
{
}

void sub_100005780(_Unwind_Exception *a1)
{
}

void sub_100005830(_Unwind_Exception *a1)
{
}

void sub_1000058C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100005970(_Unwind_Exception *a1)
{
}

void sub_100005A20(_Unwind_Exception *a1)
{
}

void sub_100005AD0(_Unwind_Exception *a1)
{
}

void sub_100005B80(_Unwind_Exception *a1)
{
}

void sub_100005DEC(_Unwind_Exception *a1)
{
}

void sub_100005EC0(_Unwind_Exception *a1)
{
}

void sub_10000610C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000063E0(uint64_t a1)
{
  Class v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"info";
  uint64_t v7 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

LABEL_12:
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fullscreenPromptsEnabled"]);
  if (v16)
  {
    __int128 v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      v6->_fullscreenPromptsEnabled = [v16 BOOLValue];
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allowCellularSizeThreshold"]);
  if (v18)
  {
    id v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      uint64_t v20 = [v18 integerValue];
      else {
        uint64_t v21 = (uint64_t)v20;
      }
      v6->_allowCellularSizeThreshold = v21;
    }
  }

LABEL_22:
  return v6;
}

void sub_100006EA4(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableString);
  id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)qword_100012D20;
  qword_100012D20 = v9;
}

void sub_1000071F0(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = @"com.apple.private.DiagnosticsSessionAvailability.client";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Rejecting connection due to missing entitlement %@",  (uint8_t *)&v1,  0xCu);
}

void sub_100007270(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Request timed out after %f seconds",  (uint8_t *)&v2,  0xCu);
  sub_100002CD0();
}

void sub_1000072E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007354( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000073C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007434(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Unhandled ELSStatus case: %lu",  (uint8_t *)&v2,  0xCu);
  sub_100002CD0();
}

id objc_msgSend_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}