void sub_100004C64(id a1)
{
  CDServiceManager *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___CDServiceManager);
  v2 = (void *)qword_100022640;
  qword_100022640 = (uint64_t)v1;
}

void sub_100004E48(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      uint64_t v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100011540(v4);
      }
    }
  }
}

void sub_100004EB8(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      uint64_t v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000115CC(v4);
      }
    }
  }
}

void sub_100004F68( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004F78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_13:
  v13 = (CDPeopleDaemonConnection *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_100011658(v5, (os_log_s *)v13);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

void sub_10000720C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_100007254(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduet.people.maintainPrivacy",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  [WeakRetained maintainPrivacy];
  objc_autoreleasePoolPop(v2);
}

void sub_1000072E0(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduet.people.refreshPeopleSuggesterCaches",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v5);
  os_activity_scope_leave(&v5);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshPeopleSuggesterCaches];

  objc_autoreleasePoolPop(v2);
}

void sub_10000740C(_Unwind_Exception *a1)
{
}

void sub_100007428(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100007580;
    v14[3] = &unk_10001C628;
    objc_copyWeak(&v15, v7);
    v10 = v14;
    v11 = v9;
    v12 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CBE4;
    block[3] = &unk_10001C780;
    id v17 = v12;
    id v18 = v10;
    id v13 = v12;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
  }
}

void sub_10000756C(_Unwind_Exception *a1)
{
}

void sub_100007580(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained versionCheckAndUpgradeIfNecessaryAndPossible];

  id v3 = objc_loadWeakRetained(v1);
  [v3 populatePeopleSuggesterCaches];
}

void sub_1000076D0(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Populating caches", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ensembleModel]);
  [v3 populateCaches];

  [*(id *)(a1 + 32) populateAppSharesCache];
  [*(id *)(a1 + 32) populateAppUsageCache];
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished populating caches", v5, 2u);
  }
}
}

void sub_100007918(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%@\nDetected interaction database corruption. Deleting Storage",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 64) deleteStorage];
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Exiting process", (uint8_t *)&v5, 2u);
  }

  exit(1);
}

void sub_100007BA8(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000118B8();
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) queryVersionNumber];
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == (id)1)
  {
    if (v5) {
      sub_100011734(v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  else
  {
    if (v5) {
      sub_100011838((uint64_t)v3, v4);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) deleteStorage];
    +[_CDDiagnosticDataReporter addValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "addValue:forScalarKey:",  1LL,  @"com.apple.coreduet.deletedDB.people.versionMismatched");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000117CC(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) recordVersionNumber:1];
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000117A0();
    }

    [*(id *)(a1 + 32) requestInteractionRepopulation];
  }

LABEL_18:
      uint64_t v17 = (char *)v17 + 1;
    }

    while (v13 != v17);
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
    if (v13) {
      continue;
    }
    break;
  }

  v32 = 1;
LABEL_29:
  uint64_t v7 = v34;
  id v3 = v35;
LABEL_30:

  return v32;
}

void sub_100008838( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000885C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008AB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100008AD4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008D04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100008D28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100008F4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100008F70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_1000091F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100009224(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009448( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000946C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_1000096A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000096C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009900( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100009924(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009B5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100009B80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:",  v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleError:v6];
}

void sub_100009DD8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) suggester]);
  id v3 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "shareSheetInteractionsFromContext:maximumNumberOfSuggestions:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 48), "integerValue")));

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

id sub_10000BE90(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
  [v2 enterMaintenanceMode];

  [*(id *)(a1 + 32) _maintainPrivacy];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
  [v3 exitMaintenanceMode];

  [*(id *)(a1 + 32) populateAppSharesCache];
  return [*(id *)(a1 + 32) populateAppUsageCache];
}

id sub_10000C324()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100022670;
  uint64_t v7 = qword_100022670;
  if (!qword_100022670)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000CBF0;
    v3[3] = &unk_10001C740;
    v3[4] = &v4;
    sub_10000CBF0((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000C3C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10000CA7C(uint64_t a1)
{
  if (!qword_100022660)
  {
    __int128 v3 = off_10001C760;
    uint64_t v4 = 0LL;
    qword_100022660 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("_PSSuggesterConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100022658 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_10000CB30(uint64_t a1)
{
  if (!qword_100022660)
  {
    __int128 v3 = off_10001C760;
    uint64_t v4 = 0LL;
    qword_100022660 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("_PSEnsembleModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100022668 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_10000CBE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

Class sub_10000CBF0(uint64_t a1)
{
  if (!qword_100022660)
  {
    __int128 v3 = off_10001C760;
    uint64_t v4 = 0LL;
    qword_100022660 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("_PSAppUsageUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100022670 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000CCA4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000CCCC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000CCE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = (void *)os_transaction_create("coreduetd main");
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v2,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "coreduetdStartup",  " enableTelemetry=YES ",  buf,  2u);
  }

  __int128 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](&OBJC_CLASS____CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "main: creating CDDaemonManager...", v8, 2u);
  }

  id v4 = +[CDServiceManager sharedInstance](&OBJC_CLASS___CDServiceManager, "sharedInstance");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "coreduetdStartup",  (const char *)&unk_1000164A2,  v7,  2u);
  }

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 1LL;
}

LABEL_6:
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
  v6[2](v6, 0LL, v14);
LABEL_9:
}

void sub_10000D894(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___CDKnowledgeDaemon);
  uint64_t v2 = _DKMachServiceName;
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths knowledgeDatabaseDirectory](&OBJC_CLASS___CDDPaths, "knowledgeDatabaseDirectory"));
  id v4 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](v1, "initWithMachServiceName:storePath:", v2, v3);
  uint64_t v5 = (void *)qword_100022678;
  qword_100022678 = (uint64_t)v4;

  [(id)qword_100022678 registerARPHomeControlNotificationTask];
  [(id)qword_100022678 registerCloudFamilyPredictionTask];
  [(id)qword_100022678 registerContactsAutocompleteFeedbackProcessingTask];
  [(id)qword_100022678 registerDataCollectionTasks];
  [(id)qword_100022678 registerPeopleSuggesterTasks];
}

void sub_10000D96C(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___CDKnowledgeDaemon);
  uint64_t v2 = _DKUserLocalMachServiceName;
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue( +[CDDPaths userLocalKnowledgeDatabaseDirectory]( &OBJC_CLASS___CDDPaths,  "userLocalKnowledgeDatabaseDirectory"));
  id v4 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](v1, "initWithMachServiceName:storePath:", v2, v3);
  uint64_t v5 = (void *)qword_100022690;
  qword_100022690 = (uint64_t)v4;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100022690 storage]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storage]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 directory]);
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.coreduet.user.sync.coordinator.context:%@",  v8));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100022690 storage]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 storage]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 databaseName]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:v11]);

  id v13 = [[_DKSyncContext alloc] initWithName:v12];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100022690 storage]);
  [v13 setStorage:v14];

  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_DKSyncCoordinatorFactory syncCoordinatorWithContext:]( &OBJC_CLASS____DKSyncCoordinatorFactory,  "syncCoordinatorWithContext:",  v13));
  uint64_t v16 = (void *)qword_100022688;
  qword_100022688 = v15;

  [(id)qword_100022690 setSyncCoordinator:qword_100022688];
}

void sub_10000E190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000E1CC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  __int128 v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.maintainPrivacy",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);
  os_activity_scope_leave(&v7);

  id v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activity]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained maintainPrivacyWithActivity:v4];

  if (v4 && xpc_activity_should_defer(v4) && !xpc_activity_set_state(v4, 3LL))
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100011BE8(v6);
    }
  }

  objc_autoreleasePoolPop(v2);
}

LABEL_33:
        goto LABEL_34;
      }
    }

    else
    {
      v25 = objc_autoreleasePoolPush();
      v22 = v28;
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]( &OBJC_CLASS____DKPrivacyMaintainer,  "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMax Lifespan:activity:",  (&v28->super.super.isa)[v27],  v7,  v21,  4000LL,  100000LL,  0LL,  2419200.0);
      objc_autoreleasePoolPop(v25);
      uint64_t v5 = v29;
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10000EEBC;
    v34[3] = &unk_10001C678;
    v34[4] = v22;
    v23 = objc_retainBlock(v34);
    v23[2]();
    goto LABEL_33;
  }

  os_activity_scope_state_s v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Privacy maintenance deferred after standing queries.",  buf,  2u);
  }

LABEL_34:
}

void sub_10000EEBC(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v1 postNotificationName:_DKKnowledgeStorageDidAgeOutEventsNotification object:0];
}

void sub_10000F87C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10000F9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10000FB00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[_CDErrorUtilities transformErrorForNSSecureCoding:]( &OBJC_CLASS____CDErrorUtilities,  "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

id sub_10000FF28(void *a1)
{
  return [a1 invoke];
}

id sub_10000FF3C(void *a1)
{
  return [a1 invoke];
}

id sub_10000FF50(void *a1)
{
  return [a1 invoke];
}

id sub_10000FF64(void *a1)
{
  return [a1 invoke];
}

id sub_10000FF78(void *a1)
{
  return [a1 invoke];
}

id sub_10000FF8C(void *a1)
{
  return [a1 invoke];
}

id sub_10000FFA0(void *a1)
{
  return [a1 invoke];
}

id sub_10000FFB4(void *a1)
{
  return [a1 invoke];
}

id sub_10000FFC8(void *a1)
{
  return [a1 invoke];
}

id sub_10000FFDC(void *a1)
{
  return [a1 invoke];
}

id sub_10000FFF0(void *a1)
{
  return [a1 invoke];
}

id sub_100010004(void *a1)
{
  return [a1 invoke];
}

id sub_100010018(void *a1)
{
  return [a1 invoke];
}

id sub_10001002C(void *a1)
{
  return [a1 invoke];
}

id sub_100010040(void *a1)
{
  return [a1 invoke];
}

id sub_100010054(void *a1)
{
  return [a1 invoke];
}

id sub_100010068(void *a1)
{
  return [a1 invoke];
}

id sub_10001007C(void *a1)
{
  return [a1 invoke];
}

id sub_100010090(void *a1)
{
  return [a1 invoke];
}

id sub_1000100A4(void *a1)
{
  return [a1 invoke];
}

id sub_1000100B8(void *a1)
{
  return [a1 invoke];
}

id sub_1000100CC(void *a1)
{
  return [a1 invoke];
}

id sub_1000100E0(void *a1)
{
  return [a1 invoke];
}

id sub_1000100F4(void *a1)
{
  return [a1 invoke];
}

id sub_100010108(void *a1)
{
  return [a1 invoke];
}

id sub_10001011C(void *a1)
{
  return [a1 invoke];
}

id sub_100010130(void *a1)
{
  return [a1 invoke];
}

id sub_100010144(void *a1)
{
  return [a1 invoke];
}

id sub_100010158(void *a1)
{
  return [a1 invoke];
}

id sub_10001016C(void *a1)
{
  return [a1 invoke];
}

id sub_100010180(void *a1)
{
  return [a1 invoke];
}

id sub_100010194(void *a1)
{
  return [a1 invoke];
}

id sub_1000101A8(void *a1)
{
  return [a1 invoke];
}

id sub_1000101BC(void *a1)
{
  return [a1 invoke];
}

id sub_1000101D0(void *a1)
{
  return [a1 invoke];
}

id sub_1000101E4(void *a1)
{
  return [a1 invoke];
}

id sub_1000101F8(void *a1)
{
  return [a1 invoke];
}

id sub_10001020C(void *a1)
{
  return [a1 invoke];
}

id sub_100010220(void *a1)
{
  return [a1 invoke];
}

id sub_100010234(void *a1)
{
  return [a1 invoke];
}

id sub_100010248(void *a1)
{
  return [a1 invoke];
}

id sub_10001025C(void *a1)
{
  return [a1 invoke];
}

id sub_100010270(void *a1)
{
  return [a1 invoke];
}

id sub_100010284(void *a1)
{
  return [a1 invoke];
}

id sub_100010298(void *a1)
{
  return [a1 invoke];
}

id sub_1000102AC(void *a1)
{
  return [a1 invoke];
}

id sub_1000102C0(void *a1)
{
  return [a1 invoke];
}

id sub_1000102D4(void *a1)
{
  return [a1 invoke];
}

id sub_1000102E8(void *a1)
{
  return [a1 invoke];
}

id sub_1000102FC(void *a1)
{
  return [a1 invoke];
}

id sub_100010310(void *a1)
{
  return [a1 invoke];
}

void sub_100010324( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100010338( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000107C0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___CDDataMigrator);
  uint64_t v2 = (void *)qword_1000226A0;
  qword_1000226A0 = (uint64_t)v1;
}

void sub_1000108AC(id a1, int a2)
{
}

uint64_t sub_100010EBC(uint64_t a1, int a2, const char **a3, const char **a4)
{
  os_activity_scope_state_s v7 = objc_autoreleasePoolPush();
  if (a2 == 1 && !strcmp(*a4, "ZINTEGERID"))
  {
    int v9 = atoi(*a3);
    uint64_t v8 = 0LL;
    qword_1000226B0 = v9;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  objc_autoreleasePoolPop(v7);
  return v8;
}

uint64_t sub_100010F38(void *a1, int a2, const char **a3, const char **a4)
{
  uint64_t v8 = objc_autoreleasePoolPush();
  int v9 = v8;
  if (a2 < 1)
  {
    id v10 = 0LL;
    id v11 = 0LL;
    goto LABEL_24;
  }

  v25 = a1;
  v26 = v8;
  id v10 = 0LL;
  id v11 = 0LL;
  uint64_t v12 = a2;
  do
  {
    id v13 = *a4;
    if (!strcmp(*a4, "ZCREATIONDATE"))
    {
      double v16 = strtod(*a3, 0LL);
      if (v16 <= 0.0) {
        goto LABEL_9;
      }
      uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v16));
      uint64_t v15 = v10;
      id v10 = (id)v17;
    }

    else
    {
      if (strcmp(v13, "ZVALUE")) {
        goto LABEL_9;
      }
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *a3));
      uint64_t v15 = v11;
      id v11 = (id)v14;
    }

LABEL_9:
    ++a3;
    ++a4;
    --v12;
  }

  while (v12);
  if (v10)
  {
    int v9 = v26;
    if (v11)
    {
      id v18 = v25;
      id v11 = v11;
      id v10 = v10;
      uint64_t v19 = objc_autoreleasePoolPush();
      if (qword_1000226B8 != -1) {
        dispatch_once(&qword_1000226B8, &stru_10001CA28);
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:identifierStringValue:metadata:",  qword_1000226C0,  v10,  v10,  v11,  0LL));
      objc_autoreleasePoolPop(v19);

      [v18 addObject:v20];
      if ((unint64_t)[v18 count] >= 0x101)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
        id v27 = 0LL;
        [v21 saveObjects:v18 error:&v27];
        id v22 = v27;
        if (v22)
        {
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_100011FE0();
          }
        }

        else
        {
          [v18 removeAllObjects];
        }
      }
    }
  }

  else
  {
    int v9 = v26;
  }

LABEL_24:
  objc_autoreleasePoolPop(v9);
  return 0LL;
}

void sub_100011458(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier type](&OBJC_CLASS____DKAnyStringIdentifier, "type"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:valueType:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:valueType:",  @"com.apple.spotlightviewer.events",  v3));
  uint64_t v2 = (void *)qword_1000226C0;
  qword_1000226C0 = v1;
}

void sub_1000114C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000114D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011508( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011540(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  sub_100004F68( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Received notifyd xpc notification: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100004F88();
}

void sub_1000115CC(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  sub_100004F68( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Received distnoted xpc notification: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100004F88();
}

void sub_100011658(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Connection from PID %d rejected for lacking entitlement",  (uint8_t *)v3,  8u);
  sub_10000CCDC();
}

void sub_1000116DC()
{
}

void sub_100011708()
{
}

void sub_100011734( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000117A0()
{
}

void sub_1000117CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011838(uint64_t a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 1LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Interaction store version mismatch (current %ld != desired %ld). Deleting storage.",  (uint8_t *)&v2,  0x16u);
  sub_10000CCDC();
}

void sub_1000118B8()
{
}

void sub_1000118E4()
{
}

void sub_100011944()
{
}

void sub_1000119A4()
{
}

void sub_1000119D0()
{
}

void sub_1000119FC()
{
}

void sub_100011A28(id *a1)
{
}

void sub_100011AB4(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 dateOfOldestAllowedInteraction]);
  sub_10000CCF8();
  sub_10000CCA4( (void *)&_mh_execute_header,  v2,  v3,  "Deleted %lu Non first-party whitelisted interations older than %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000CD28();
}

void sub_100011B38(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds]);
  sub_10000CCF8();
  sub_10000CCA4( (void *)&_mh_execute_header,  v2,  v3,  "Deleted %lu first-party allowlisted interations older than %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000CD28();
}

void sub_100011BBC()
{
}

void sub_100011BE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to set defer state for privacy maintenance activity.",  v1,  2u);
}

void sub_100011C28()
{
}

void sub_100011C94(void *a1)
{
}

void sub_100011D00(void *a1)
{
}

void sub_100011D6C()
{
}

void sub_100011DCC()
{
}

void sub_100011E2C(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Notification registration failed for data migration with status %d.",  (uint8_t *)v1,  8u);
}

void sub_100011EA8()
{
}

void sub_100011F1C()
{
  __int16 v2 = 2112;
  uint64_t v3 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to remove file at path %@ with error %@",  v1,  0x16u);
  sub_10000CCDC();
}

void sub_100011F9C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Database migration was not successful.",  v0,  2u);
}

void sub_100011FE0()
{
}

id objc_msgSend_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:");
}

id objc_msgSend_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:");
}

id objc_msgSend_filterAndModifyInteractionsWithPolicies_enforceDataLimits_enforcePrivacy_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:");
}

id objc_msgSend_maintainPrivacyWithKnowledgeStorage_installedApps_installedAppExtensions_deleteMaxCount_objectMaxCount_objectMaxLifespan_activity_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:object MaxLifespan:activity:");
}

id objc_msgSend_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsForSiriNLWithPredictionContext:maxSuggestions:interactionId:");
}

id objc_msgSend_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:reply:");
}

id objc_msgSend_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:");
}

id objc_msgSend_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:");
}

id objc_msgSend_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:reply:");
}

id objc_msgSend_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_knowledgeStore_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:");
}

id objc_msgSend_zkwSuggestionsFromContext_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zkwSuggestionsFromContext:maxSuggestions:reply:");
}