void sub_100001C58(id a1)
{
  id v1;
  v1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.DiagnosticsSessionAvailibility",  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 3LL, v1);
}

void sub_100001CB8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.DiagnosticsSessionAvailibility",  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 4LL, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v3, &stru_10000C410);
  dispatch_activate(v3);
  v4 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

void sub_100001E7C(id a1)
{
  uint64_t v1 = DiagnosticLogHandleForCategory(8LL);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Received SIGTERM, exiting the process",  v3,  2u);
  }

  exit(0);
}

void sub_100001FF4(_Unwind_Exception *a1)
{
}

id sub_100002008(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100002030(uint64_t a1)
{
}

void sub_100002038(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v10 = DiagnosticLogHandleForCategory(0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    v11 = "Lost reference to self when entering dispatch block for checkAvailabilityWithReply";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 2u);
    goto LABEL_13;
  }

  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v4 = DiagnosticLogHandleForCategory(0LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v6) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    v11 = "No reply completion is present in dispatch block for checkAvailabilityWithReply";
    goto LABEL_12;
  }

  if (v6)
  {
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking for availability...",  (uint8_t *)&v12,  2u);
  }

  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained getSessionID]);
  uint64_t v7 = DiagnosticLogHandleForCategory(0LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Session ID is %@, sending in reply to checkAvailabilityWithReply",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  xpc_transaction_exit_clean(v9);
LABEL_13:
}

uint64_t sub_10000228C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100002378(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialNumbers]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v2 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[ASTIdentity identityWithSerialNumber:]( &OBJC_CLASS___ASTIdentity,  "identityWithSerialNumber:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v8)));
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v6);
  }

  uint64_t v10 = DiagnosticLogHandleForCategory(0LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Checking for sessions with identities %@",  buf,  0xCu);
  }

  double v12 = *(double *)(a1 + 56);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000025A4;
  v15[3] = &unk_10000C488;
  id v16 = v4;
  uint64_t v13 = *(void *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  char v18 = *(_BYTE *)(a1 + 64);
  id v14 = v4;
  +[ASTSession sessionExistsForIdentities:ticketNumber:timeout:completion:]( &OBJC_CLASS___ASTSession,  "sessionExistsForIdentities:ticketNumber:timeout:completion:",  v3,  v13,  v15,  v12);
}

void sub_1000025A4(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(0LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000741C(a1, (uint64_t)v6, v8);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v9 = DiagnosticLogHandleForCategory(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(unsigned __int8 *)(a1 + 48);
    v13[0] = 67109120;
    v13[1] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Complete with check for session... exitWhenDone: %d",  (uint8_t *)v13,  8u);
  }

  if (*(_BYTE *)(a1 + 48)) {
    xpc_transaction_exit_clean(v12);
  }
}

void sub_100002938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000296C(uint64_t a1, int a2)
{
  uint64_t v4 = DiagnosticLogHandleForCategory(0LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "checkAvailabilityWithTicketNumber finished. Success: %d",  (uint8_t *)v7,  8u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100002A70(id a1)
{
  byte_100012D98 = os_variant_has_internal_content("com.apple.Diagnostics");
}

void sub_100002C74(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002CEC;
  v4[3] = &unk_10000C520;
  id v5 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002CEC(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v13 state]);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 serialNumber]);
    if (!v6)
    {
LABEL_5:

      goto LABEL_6;
    }

    uint64_t v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serialNumber]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      [v12 addObject:v5];
      goto LABEL_5;
    }
  }

LABEL_6:
}

void sub_100003DA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100003E54(_Unwind_Exception *a1)
{
}

void sub_100003F04(_Unwind_Exception *a1)
{
}

void sub_100003FB4(_Unwind_Exception *a1)
{
}

void sub_100004064(_Unwind_Exception *a1)
{
}

void sub_100004114(_Unwind_Exception *a1)
{
}

void sub_1000041C4(_Unwind_Exception *a1)
{
}

void sub_100004254( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100004304(_Unwind_Exception *a1)
{
}

void sub_1000043B4(_Unwind_Exception *a1)
{
}

void sub_100004464(_Unwind_Exception *a1)
{
}

void sub_100004514(_Unwind_Exception *a1)
{
}

void sub_100004780(_Unwind_Exception *a1)
{
}

void sub_100004854(_Unwind_Exception *a1)
{
}

void sub_100004AA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100004D74(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = @"info";
  uint64_t v7 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}
}

void sub_10000587C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000058A0(uint64_t a1, void *a2)
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v7 observerDidChangeDevices:WeakRetained];
}

void sub_100005ADC(_Unwind_Exception *a1)
{
}

void sub_100005B00(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDevices:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v5 observerDidChangeDevices:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000060A0(_Unwind_Exception *a1)
{
}

void sub_1000061D0(uint64_t a1)
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
        v11[2] = sub_10000637C;
        v11[3] = &unk_10000C548;
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

void sub_10000637C(uint64_t a1, void *a2)
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

void sub_1000063FC(_Unwind_Exception *a1)
{
}

void sub_100006950(uint64_t a1)
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

LABEL_12:
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fullscreenPromptsEnabled"]);
  if (v16)
  {
    __int128 v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      v6->_fullscreenPromptsEnabled = [v16 BOOLValue];
    }
  }

  char v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allowCellularSizeThreshold"]);
  if (v18)
  {
    __int128 v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      __int128 v20 = [v18 integerValue];
      else {
        __int128 v21 = (uint64_t)v20;
      }
      v6->_allowCellularSizeThreshold = v21;
    }
  }

LABEL_22:
  return v6;
}

void sub_1000070B4(id a1)
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
  uint64_t v10 = (void *)qword_100012DA8;
  qword_100012DA8 = v9;
}

void sub_1000073DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find entitlement", v1, 2u);
}

void sub_10000741C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Session does not exist for serial numbers: %@, error: %@",  (uint8_t *)&v4,  0x16u);
}

id objc_msgSend_updateWithDeviceState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithDeviceState:");
}