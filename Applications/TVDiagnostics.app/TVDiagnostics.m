void sub_1000026BC(id a1)
{
  DANvramUtil *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___DANvramUtil);
  v2 = (void *)qword_10003A5E0;
  qword_10003A5E0 = (uint64_t)v1;
}

LABEL_9:
  -[DANvramUtil _clearNVRamVariable:](self, "_clearNVRamVariable:", v12);
LABEL_11:
}
}
}

void sub_100002CE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100002D04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = DiagnosticLogHandleForCategory(1LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New devices: %@", (uint8_t *)&v8, 0xCu);
  }

  [WeakRetained setDevices:v3];
  v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v7 observerDidChangeDevices:WeakRetained];
}

void sub_100002F40(_Unwind_Exception *a1)
{
}

void sub_100002F64(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDevices:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  [v5 observerDidChangeDevices:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100003504(_Unwind_Exception *a1)
{
}

void sub_100003634(uint64_t a1)
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
        v11[2] = sub_1000037E0;
        v11[3] = &unk_10002C7D0;
        id v12 = v2;
        v13 = v3;
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

void sub_1000037E0(uint64_t a1, void *a2)
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

void sub_100003860(_Unwind_Exception *a1)
{
}

id sub_10000446C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) original]);
  [v2 end];

  return [*(id *)(a1 + 32) _reset];
}

void sub_100004788( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1000047B4(uint64_t a1, int a2)
{
  id v4 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a2)
  {
    objc_msgSend(WeakRetained, "setIgnoreButtonEvents:", objc_msgSend(*(id *)(a1 + 32), "isHeadless"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:WeakRetained selector:"testViewPresented:" name:@"com.apple.Diagnostics.DKViewControllerPresented" object:0];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) buttonEventMonitor]);
    unsigned __int8 v8 = [v7 hasTarget:*(void *)(a1 + 40)];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 40) _startInterceptingButtonEvents];
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained original]);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100004970;
    v14[3] = &unk_10002C848;
    objc_copyWeak(&v16, v4);
    id v15 = *(id *)(a1 + 56);
    [v9 executeTestWithTestAttributes:v10 parameters:v11 completion:v14];

    objc_destroyWeak(&v16);
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DKErrorDomain,  -1003LL,  0LL));
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v13);

    [WeakRetained idle];
  }
}

void sub_10000495C(_Unwind_Exception *a1)
{
}

void sub_100004970(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _reset];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004B5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) original]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 suiteName]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004C38;
  v5[3] = &unk_10002C898;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  +[DAUserInterruptAlertFactory activateAlertForSuiteName:withHandler:]( &OBJC_CLASS___DAUserInterruptAlertFactory,  "activateAlertForSuiteName:withHandler:",  v4,  v5);

  objc_destroyWeak(&v6);
}

void sub_100004C24(_Unwind_Exception *a1)
{
}

void sub_100004C38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained diagnosticsManager]);
  [v1 cancelAllDiagnostics];
}

void sub_100004D20(_Unwind_Exception *a1)
{
}

void sub_100004D44(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained buttonEventMonitor]);
  id v3 = objc_loadWeakRetained(v1);
  [v2 addTarget:v3 action:"handleButtonEvent:" forButtonEvents:0xFFFFFFFFLL propagate:0];
}

void sub_100004E64(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buttonEventMonitor]);
  [v2 removeTarget:*(void *)(a1 + 32)];
}

void sub_100005090(uint64_t a1)
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

void sub_100006234(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40)) {
    double v2 = 115.0;
  }
  else {
    double v2 = 0.0;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceIdentifierHeightConstraint]);
  [v3 setConstant:v2];

  BOOL v4 = *(_BYTE *)(a1 + 40) == 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceIdentifier]);
  [v5 setHidden:v4];
}

void sub_100007960(_Unwind_Exception *a1)
{
}

id sub_100007974(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000799C(uint64_t a1)
{
}

void sub_1000079A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    uint64_t v10 = DiagnosticLogHandleForCategory(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    uint64_t v11 = "Lost reference to self when entering dispatch block for checkAvailabilityWithReply";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 2u);
    goto LABEL_13;
  }

  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v4 = DiagnosticLogHandleForCategory(0LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v6) {
      goto LABEL_13;
    }
    LOWORD(v12) = 0;
    uint64_t v11 = "No reply completion is present in dispatch block for checkAvailabilityWithReply";
    goto LABEL_12;
  }

  if (v6)
  {
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking for availability...",  (uint8_t *)&v12,  2u);
  }

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([WeakRetained getSessionID]);
  uint64_t v7 = DiagnosticLogHandleForCategory(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
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

uint64_t sub_100007BF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007CE4(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialNumbers]);
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
      id v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[ASTIdentity identityWithSerialNumber:]( &OBJC_CLASS___ASTIdentity,  "identityWithSerialNumber:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v8)));
        [v3 addObject:v9];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v6);
  }

  uint64_t v10 = DiagnosticLogHandleForCategory(0LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Checking for sessions with identities %@",  buf,  0xCu);
  }

  double v12 = *(double *)(a1 + 56);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100007F10;
  v15[3] = &unk_10002C988;
  id v16 = v4;
  uint64_t v13 = *(void *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  char v18 = *(_BYTE *)(a1 + 64);
  id v14 = v4;
  +[ASTSession sessionExistsForIdentities:ticketNumber:timeout:completion:]( &OBJC_CLASS___ASTSession,  "sessionExistsForIdentities:ticketNumber:timeout:completion:",  v3,  v13,  v15,  v12);
}

void sub_100007F10(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100018C84(a1, (uint64_t)v6, v8);
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

void sub_1000082A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000082D8(uint64_t a1, int a2)
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

void sub_1000083DC(id a1)
{
  byte_10003A5F0 = os_variant_has_internal_content("com.apple.Diagnostics");
}

void sub_1000085E0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008658;
  v4[3] = &unk_10002CA20;
  id v5 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008658(uint64_t a1, void *a2)
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 state]);
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

void sub_100008EC4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DAUserInterruptAlertFactory);
  double v2 = (void *)qword_10003A600;
  qword_10003A600 = (uint64_t)v1;
}

void sub_100009784(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diagnosticsManager]);
  [v2 cancelAllDiagnostics];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) reportManager]);
  [v3 cancelAllReports];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  [v4 end];
}

void sub_100009F40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

void sub_100009F80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v23 = v3;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 version]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ASTTestAttributes attributesWithTestId:version:]( &OBJC_CLASS___ASTTestAttributes,  "attributesWithTestId:version:",  v11,  v12));
          [v4 addObject:v13];
        }

        id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v7);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profile]);
    [v14 setTests:v4];

    id v3 = v23;
  }

  else
  {
    uint64_t v15 = DiagnosticLogHandleForCategory(1LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_100018D3C((os_log_s *)v4, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000A158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DiagnosticLogHandleForCategory(1LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: %@, Report: %@", (uint8_t *)&v19, 0x16u);
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    if (v5)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayForJSON]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profile]);
      [v10 setProperties:v9];
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) profile]);
      [v9 setProperties:&__NSArray0__struct];
    }
  }

  else
  {
    uint64_t v11 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_100018D6C((os_log_s *)v9, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000A5FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = DiagnosticLogHandleForCategory(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100018D9C(a1, v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000AF38(id a1)
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", &off_10002E8D8);
  id v1 = [[DKDiagnosticAllowList alloc] initWithIdentifiers:v3 contactMessage:@"Please reach out to Embedded Field Diagnostics for onboarding with new DiagnosticsKit extensions."];
  double v2 = (void *)qword_10003A610;
  qword_10003A610 = (uint64_t)v1;
}

void sub_10000B258( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C12C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000C1DC(_Unwind_Exception *a1)
{
}

void sub_10000C28C(_Unwind_Exception *a1)
{
}

void sub_10000C33C(_Unwind_Exception *a1)
{
}

void sub_10000C3EC(_Unwind_Exception *a1)
{
}

void sub_10000C49C(_Unwind_Exception *a1)
{
}

void sub_10000C54C(_Unwind_Exception *a1)
{
}

void sub_10000C5DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000C68C(_Unwind_Exception *a1)
{
}

void sub_10000C73C(_Unwind_Exception *a1)
{
}

void sub_10000C7EC(_Unwind_Exception *a1)
{
}

void sub_10000C89C(_Unwind_Exception *a1)
{
}

void sub_10000CB08(_Unwind_Exception *a1)
{
}

void sub_10000CBDC(_Unwind_Exception *a1)
{
}

void sub_10000CE28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10000D0FC(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"info";
  uint64_t v7 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVDAppDelegate);
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_10000DABC(_Unwind_Exception *a1)
{
}

void sub_10000DB7C(_Unwind_Exception *a1)
{
}

id sub_10000E3B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) length];
  uint64_t v3 = *(void **)(a1 + 32);
  if ((unint64_t)v2 < 3)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v3;
    id v6 = *(void **)(v7 + 8);
    *(void *)(v7 + _Block_object_dispose(va, 8) = v8;
  }

  else
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 substringToIndex:2]);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + _Block_object_dispose(va, 8) = v4;
  }

  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = v9[1];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifierLabel]);
  [v11 setText:v10];

  return [*(id *)(a1 + 40) setHeight];
}

id sub_10000E800(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateViewsIfSpaceAvailable];
}

void sub_10000EA08(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v3 = sub_1000182A4(@"DIAGNOSTICS");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1000182A4(@"TERMS_AND_CONDITIONS_TV");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v2 initWithTitle:v4 text:v6];

  id v8 = sub_1000182A4(@"CONTINUE");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_10000EB58;
  v13[3] = &unk_10002C820;
  v13[4] = *(void *)(a1 + 32);
  [v7 addButtonWithTitle:v9 type:0 handler:v13];

  id v10 = sub_1000182A4(@"CANCEL");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EB60;
  v12[3] = &unk_10002C820;
  v12[4] = *(void *)(a1 + 32);
  [v7 addButtonWithTitle:v11 type:2 handler:v12];

  [*(id *)(a1 + 32) presentViewController:v7 animated:0 completion:0];
}

id sub_10000EB58(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSecondaryConsent];
}

id sub_10000EB60(uint64_t a1)
{
  return [*(id *)(a1 + 32) didDisagreeToTerms];
}

id sub_10000ECF4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showButtonsAndApplicationTitle];

  return [*(id *)(a1 + 32) didAgreeToTerms];
}

id sub_10000ED2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentTermsAndConditions];
}

void sub_10000EF04(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  uint64_t v4 = v10;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"info"]);

    uint64_t v4 = v10;
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"info"]);

      uint64_t v9 = objc_opt_class(&OBJC_CLASS___DADeviceStateChangeNotificationInfo);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
        [*(id *)(a1 + 32) updateWithInfo:v8];
      }

      uint64_t v4 = v10;
    }
  }
}

LABEL_7:
  return v2;
}

  return v2;
}

id sub_10000F380(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showCloseButtonWithDone:0];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) noFreeSpaceView]);
  [v3 setHidden:0];

  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

void sub_10000F42C(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) noFreeSpaceView]);
  [v1 setHidden:1];
}

void sub_10000F50C(uint64_t a1, int a2)
{
  if (a2)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F5CC;
    block[3] = &unk_10002C820;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v4, block);
  }

  else
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000F634;
    v6[3] = &unk_10002C820;
    v6[4] = v5;
    [v5 _enqueueUIUpdateWithMinimumExecution:v6 block:0.0];
  }

id sub_10000F5CC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F62C;
  v2[3] = &unk_10002CC20;
  v2[4] = *(void *)(a1 + 32);
  return +[ASTLocalization prepareLocalizedStringsWithCompletionHandler:]( &OBJC_CLASS___ASTLocalization,  "prepareLocalizedStringsWithCompletionHandler:",  v2);
}

id sub_10000F62C(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentTermsAndConditions];
}

void sub_10000F634(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showCloseButtonWithDone:1];

  id v3 = *(void **)(a1 + 32);
  id v4 = sub_1000182A4(@"UNKNOWN_ERROR");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  [v3 showDiagosticsErrorWithReason:v5];
}

void sub_10000F98C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showCloseButtonWithDone:0];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  id v4 = sub_1000182A4(@"WAITING_FOR_TESTS");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 updateText:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v6 hideText:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v7 showActivityIndicator:1];
}

void sub_10000FAA4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 applicationState];

  id v4 = *(void **)(a1 + 32);
  if (v3 == (id)2)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v4 appDelegate]);
    [v12 exitApplication];
  }

  else
  {
    [v4 hideEverything];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
    [v5 showCloseButtonWithDone:1];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
    id v7 = sub_1000182A4(@"ALL_TESTS_COMPLETE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 updateText:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
    [v9 hideText:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 checkAnimationView]);
    [v11 playCheckAnimationWithCompletion:0];

    [*(id *)(a1 + 32) setCurrentViewControllerState:3];
    id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDelegate]);
    [v12 allowApplicationBackgrounding:0];
  }
}

void sub_10000FC84(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 updateText:*(void *)(a1 + 40)];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v3 hideText:0];
}

void sub_10000FD5C(uint64_t a1)
{
  unint64_t v2 = (unint64_t)[*(id *)(a1 + 32) integerValue];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mainView]);
  id v4 = v3;
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    [v3 hideProgressView:1];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mainView]);
    [v6 updateProgress:&off_10002E740];

    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mainView]);
    [v7 showActivityIndicator:1];
  }

  else
  {
    [v3 showActivityIndicator:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mainView]);
    [v5 hideProgressView:0];

    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mainView]);
    [v7 updateProgress:*(void *)(a1 + 32)];
  }
}

void sub_10000FEB0(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceIdentifier]);
  [v2 displayDeviceIdentifier:v3];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  objc_msgSend(v4, "setDeviceIdentifierVisible:", objc_msgSend(*(id *)(a1 + 40), "displayDeviceIdentifier"));
}

id sub_100010320(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showCloseButtonWithDone:1];

  return [*(id *)(a1 + 32) showDiagosticsErrorWithReason:*(void *)(a1 + 40)];
}

id sub_1000103C4(uint64_t a1)
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainView]);
  [v2 showCloseButtonWithDone:0];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkRequiredView]);
  [v3 setHidden:0];

  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

void sub_100010470(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkRequiredView]);
  [v1 setHidden:1];
}

void sub_1000104F8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) failureView]);
  [v1 setHidden:1];
}

void sub_1000106A8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) currentViewControllerState] == (id)3
    || [*(id *)(a1 + 32) currentViewControllerState] == (id)4)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDelegate]);
    [v2 exitApplication];
  }

  else
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDelegate]);
    [v2 handleCloseApplicationEvent];
  }
}

id sub_100010990(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100011278( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_1000112B4(id a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=GENERAL&path=USAGE/"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v1 openSensitiveURL:v2 withOptions:0];
}

void sub_100011318(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appDelegate]);
  [v1 exitApplication];
}

void sub_10001135C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openSettings];
}

void sub_1000115E0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001166C;
  block[3] = &unk_10002C8E8;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_10001166C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000122B8( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    uint64_t v18 = DiagnosticLogHandleForCategory(1LL);
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 reason]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v21;
      a16 = 2112;
      a17 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Exception raised while taking SHA256 of file: %@: %@ (%@)",  (uint8_t *)&buf,  0x20u);
    }

    objc_end_catch();
    JUMPOUT(0x100012278LL);
  }

  _Unwind_Resume(a1);
}

void sub_100012844(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_12:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fullscreenPromptsEnabled"]);
  if (v16)
  {
    id v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      v6->_fullscreenPromptsEnabled = [v16 BOOLValue];
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allowCellularSizeThreshold"]);
  if (v18)
  {
    int v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      id v20 = [v18 integerValue];
      else {
        __int16 v21 = (uint64_t)v20;
      }
      v6->_allowCellularSizeThreshold = v21;
    }
  }

LABEL_22:
  return v6;
}

void sub_100012C18(id a1)
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
  id v10 = (void *)qword_10003A628;
  qword_10003A628 = v9;
}

uint64_t sub_10001375C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100013A14(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
    [v12 setSuiteID:v14];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
    [v13 setDiagnosticEventID:v9];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100013F20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressForTest]);
  [v7 removeObjectForKey:*(void *)(a1 + 40)];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 48), "setTestDuration:");
  if (v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 statusCode]);
    [*(id *)(a1 + 48) setStatusCode:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
    [*(id *)(a1 + 48) setData:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 files]);
    if (v11)
    {
      v30 = v8;
      id v31 = v6;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 fileSandboxTokens]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[DKSandboxExtension consumeSandboxExtensionsWithTokens:]( &OBJC_CLASS___DKSandboxExtension,  "consumeSandboxExtensionsWithTokens:",  v12));

      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sandboxExtensionHandles]);
      v29 = (void *)v13;
      [v14 setObject:v13 forKey:*(void *)(a1 + 40)];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 files]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15 count]));

      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 files]);
      id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          id v20 = 0LL;
          do
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v20);
            id v22 = (void *)objc_opt_new(&OBJC_CLASS___ASTSealableFile);
            [v22 setFileURL:v21];
            [v11 addObject:v22];

            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }

        while (v18);
      }

      id v8 = v30;
      id v6 = v31;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 uploadStatus]);

    if (v23)
    {
      __int128 v24 = *(void **)(a1 + 48);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 uploadStatus]);
      [v24 setUploadStatusFromSource:@"DiagnosticsApp" withArray:v25];
    }

    [*(id *)(a1 + 48) setFiles:v11];
  }

  else if (v6)
  {
    switch((unint64_t)[v6 code])
    {
      case 0xFFFFFFFFFFFFFC11LL:
        __int128 v26 = *(void **)(a1 + 48);
        __int128 v27 = &off_10002E818;
        goto LABEL_21;
      case 0xFFFFFFFFFFFFFC12LL:
        __int128 v26 = *(void **)(a1 + 48);
        __int128 v27 = &off_10002E800;
        goto LABEL_21;
      case 0xFFFFFFFFFFFFFC13LL:
        __int128 v26 = *(void **)(a1 + 48);
        __int128 v27 = &off_10002E7E8;
        goto LABEL_21;
      case 0xFFFFFFFFFFFFFC15LL:
        __int128 v26 = *(void **)(a1 + 48);
        __int128 v27 = &off_10002E7D0;
        goto LABEL_21;
      case 0xFFFFFFFFFFFFFC18LL:
        __int128 v26 = *(void **)(a1 + 48);
        __int128 v27 = &off_10002E830;
LABEL_21:
        [v26 setStatusCode:v27];
        break;
      default:
        break;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) session]);
  [v28 sendTestResult:*(void *)(a1 + 48) error:0];
}

void sub_1000143F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32) && ([*(id *)(a1 + 40) isDisconnecting] & 1) == 0)
  {
    uint64_t v13 = DiagnosticLogHandleForCategory(1LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000191C4();
    }

    id v15 = [*v4 code];
    uint64_t v16 = 4LL;
    if (v15 == (id)-1001LL) {
      uint64_t v16 = 1LL;
    }
    BOOL v17 = v15 != (id)-1000LL && v15 != (id)-1001LL;
    if (v15 == (id)-1000LL) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = v16;
    }
    [v3 setPhase:v17];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*v4 userInfo]);
    [v3 addErrorCode:v18 userInfo:v9];
  }

  else
  {
    [v3 setErrors:&__NSArray0__struct];
    [v3 setPhase:1];
    id v6 = *(void **)(a1 + 48);
    id v5 = (void *)(a1 + 48);
    unint64_t v7 = (unint64_t)[v6 sessionEndReason];
    uint64_t v8 = v7;
    if (v7 > 4)
    {
      uint64_t v12 = DiagnosticLogHandleForCategory(1LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100019150(v5, v8, v9);
      }
    }

    else
    {
      id v9 = off_10002CCF8[v7];
      uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000190E8();
      }
    }
  }
}

void sub_1000146B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSuiteName:v3];
  [v4 setSuiteDescription:*(void *)(a1 + 40)];
}

void sub_100014B74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 suiteID]);
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = (void *)v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  char v11 = objc_opt_respondsToSelector(v10, "deviceConnection:didFinishTestSuite:withEntry:error:");

  if ((v11 & 1) != 0)
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 state]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 suiteID]);
    [v7 deviceConnection:v12 didFinishTestSuite:v14 withEntry:v5 error:v6];

LABEL_4:
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100014CD0;
  v17[3] = &unk_10002CDF0;
  id v18 = v5;
  id v16 = v5;
  [v15 transactionWithBlock:v17];
}

void sub_100014CD0(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 history]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:*(void *)(a1 + 32)]);
    [v5 setHistory:v4];
  }

  [v5 setSuiteID:0];
  [v5 setSuiteName:0];
  [v5 setDiagnosticEventID:0];
}

void sub_100014D60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100019230((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = -[DAHistoryEntry initWithTestSuiteName:skipped:results:]( objc_alloc(&OBJC_CLASS___DAHistoryEntry),  "initWithTestSuiteName:skipped:results:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48),  v5);
    (*(void (**)(uint64_t, DAHistoryEntry *, void))(v8 + 16))(v8, v9, 0LL);
  }
}

uint64_t sub_1000153BC(void *a1, uint64_t a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100015434;
  v5[3] = &unk_10002CE68;
  uint64_t v3 = (void *)a1[4];
  void v5[4] = a1[5];
  v5[5] = a2;
  [v3 enumerateObjectsUsingBlock:v5];
  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

void sub_100015434(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if ([v8 endpoint] == *(id *)(a1 + 40))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 suites]);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
    [v7 setSuitesAvailable:v6];

    *a4 = 1;
  }
}

id sub_100015808(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendProfileResult:a2 error:0];
}

void sub_1000162C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  if (a3)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ASTAuthInfoResult authInfoResultWithAttestation:certificate:type:error:]( &OBJC_CLASS___ASTAuthInfoResult,  "authInfoResultWithAttestation:certificate:type:error:",  a2,  a3,  a4,  a5));
    uint64_t v13 = *(void **)(a1 + 32);
    id v27 = v11;
    unsigned __int8 v14 = [v13 sendAuthInfoResult:v12 error:&v27];
    id v15 = v27;

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = DiagnosticLogHandleForCategory(1LL);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000192FC(v15, v17);
      }
    }
  }

  else
  {
    uint64_t v18 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100019294(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    [*(id *)(a1 + 32) sendAuthInfoResult:0 error:0];
    id v15 = v11;
  }
}

LABEL_16:
    -[DADeviceConnectionLocal _shutDownDeviceForReboot:](self, "_shutDownDeviceForReboot:", v5);
    goto LABEL_17;
  }

  uint64_t v16 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v1_Block_object_dispose(va, 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Starting entry into Shelf Life Mode.",  (uint8_t *)&v18,  2u);
  }

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 5.0);
  if (!-[DADeviceConnectionLocal _shutdownToShelfLifeMode](self, "_shutdownToShelfLifeMode")) {
    goto LABEL_16;
  }
LABEL_17:
}

void sub_100017364(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100017378( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000173F0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DAPlatform_tvOS);
  uint64_t v2 = (void *)qword_10003A638;
  qword_10003A638 = (uint64_t)v1;
}

void sub_100017B24(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DALauncherServiceManager);
  uint64_t v2 = (void *)qword_10003A648;
  qword_10003A648 = (uint64_t)v1;
}

void sub_100018064( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t sub_1000180B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000180C0(uint64_t a1)
{
}

void sub_1000180C8(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(8LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained(v5);
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Connection %@ broke with error %@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

id sub_1000182A4(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ASTLocalization localizedStringForKey:](&OBJC_CLASS___ASTLocalization, "localizedStringForKey:", v1));
  uint64_t v3 = DiagnosticLogHandleForCategory(4LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100019538((uint64_t)v1, (uint64_t)v2, v4);
  }

  if (!v2 || [v2 isEqualToString:v1])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v1 value:&stru_10002D180 table:0]);

    id v2 = (id)v6;
    if (!v6) {
      id v2 = v1;
    }
  }

  return v2;
}

NSString *sub_10001837C( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = sub_1000182A4(v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  unsigned __int8 v14 = (NSString *)v10;
  id v15 = v14;
  if (v13)
  {
    id v15 = v14;
    if (([v13 isEqualToString:v14] & 1) == 0)
    {
      v19[1] = &a9;
      uint64_t v16 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      v19[0] = 0LL;
      id v15 = -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:]( v16,  "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:",  v13,  v11,  v17,  &a9,  v19);
    }
  }

  if (!v15) {
    id v15 = v14;
  }

  return v15;
}

void sub_1000184A8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___DADeviceConnectionConfigurator);
  id v2 = (void *)qword_10003A658;
  qword_10003A658 = (uint64_t)v1;
}

uint64_t sub_100018C34()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for Logging()
{
  return objc_opt_self(&OBJC_CLASS____TtC13TVDiagnostics7Logging);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC13TVDiagnosticsP33_2DF99F73707042DB61ECCD3F5248EE6219ResourceBundleClass);
}

void sub_100018C84(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Session does not exist for serial numbers: %@, error: %@",  (uint8_t *)&v4,  0x16u);
}

void sub_100018D0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018D3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018D6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018D9C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error downloading asset: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_100018E14(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to check available disk space with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100018E88()
{
}

void sub_100018EB4()
{
}

void sub_100018EE0()
{
}

void sub_100018F0C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_100012844( (void *)&_mh_execute_header,  a2,  v4,  "Could not create file handle from file at path = %@.",  (uint8_t *)&v5);
}

void sub_100018F98()
{
}

void sub_100018FC4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "requestAttestationBlobWithOptions failed with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100019038(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_100012844( (void *)&_mh_execute_header,  a2,  a3,  "Failed to create device identification public key digest, %@",  (uint8_t *)&v4);
}

void sub_1000190A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to create CFUserNotificationRef!",  v1,  2u);
}

void sub_1000190E8()
{
}

void sub_100019150(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  sub_100017364( (void *)&_mh_execute_header,  a2,  a3,  "ASTSession %@ ended without error, with reason: %ld",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100017388();
}

void sub_1000191C4()
{
}

void sub_100019230( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019294( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000192FC(void *a1, os_log_s *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 code];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Send auth info result failed with error: (domain = %@, code = %ld)",  (uint8_t *)&v5,  0x16u);
}

void sub_1000193B0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019414()
{
}

void sub_100019440()
{
}

void sub_10001946C()
{
}

void sub_100019498()
{
}

void sub_1000194C4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Connection %@ not established because the process is not appropriately entitled.",  (uint8_t *)&v2,  0xCu);
}

void sub_100019538(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[Localization] [%@] => [%@]",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend_activateSimpleAlertWithTitle_message_defaultButtonName_cancelButtonName_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateSimpleAlertWithTitle:message:defaultButtonName:cancelButtonName:handler:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_writeValueFor_andValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeValueFor:andValue:");
}