void sub_100002054(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000021C4(_Unwind_Exception *a1)
{
}

void sub_100002508(_Unwind_Exception *a1)
{
}

void sub_10000274C(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 tokenID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 stringRepresentation]);
  [v4 updateForTokenID:v5 items:*(void *)(a1 + 40)];
}

void sub_1000027FC(id a1)
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v4[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v4[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v4[3] = objc_opt_class(&OBJC_CLASS___NSData);
  v4[4] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v4[5] = objc_opt_class(&OBJC_CLASS___NSDate);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 6LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_100024010;
  qword_100024010 = v2;
}
}

void sub_100003170( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_10000318C()
{
  if (qword_100024018 != -1) {
    dispatch_once(&qword_100024018, &stru_10001C658);
  }
  return (id)qword_100024020;
}

void sub_1000031CC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = sub_10000318C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Got SIGTERM, shutting down", v16, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokenServer]);
  [v5 stop];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slotWatcher]);
  [v6 stop];

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slotServer]);
  [v7 stop];

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = 0LL;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0LL;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = 0LL;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = 0LL;

  exit(0);
}

void sub_1000032B8(uint64_t a1)
{
  id v2 = sub_10000318C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100010370(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slotServer]);
  [v11 notifyDesktopUp];
}

void sub_100003314(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokenRegistry]);
  [v2 loadTokensFromStore:@"ctkd"];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokenRegistry]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokenServer]);
  [v3 setTokenRegistry:v4];
}

void sub_100003388(uint64_t a1)
{
  id v2 = sub_10000318C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000103A4(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained ensureSlotWatcherIsRunning];
}

void start(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  -[TKCtkdRunner run]( -[TKCtkdRunner initWithArgc:argv:](objc_alloc(&OBJC_CLASS___TKCtkdRunner), "initWithArgc:argv:", a1, a2),  "run");
  objc_autoreleasePoolPop(v4);
  dispatch_main();
}

void sub_1000034A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "ctkd");
  id v2 = (void *)qword_100024020;
  qword_100024020 = (uint64_t)v1;
}

void sub_1000034D8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100003CA0()
{
  if (qword_100024028 != -1) {
    dispatch_once(&qword_100024028, &stru_10001C6F0);
  }
  return (id)qword_100024030;
}

void sub_100004034(_Unwind_Exception *a1)
{
}

void sub_1000040D4(_Unwind_Exception *a1)
{
}

void sub_10000415C(_Unwind_Exception *a1)
{
}

void sub_1000041E8(_Unwind_Exception *a1)
{
}

void sub_100004298(_Unwind_Exception *a1)
{
}

void sub_100004638(_Unwind_Exception *a1)
{
}

void sub_1000046FC(_Unwind_Exception *a1)
{
}

void sub_100004908(_Unwind_Exception *a1)
{
}

void sub_1000049CC(_Unwind_Exception *a1)
{
}

void sub_100004C54(_Unwind_Exception *a1)
{
}

void sub_10000519C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, id location)
{
}

void sub_1000051C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003CA0();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000108B8();
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v50[0] = kSecClassCertificate;
  v50[1] = kSecClassKey;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
  id v28 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v42;
    location = (id *)(a1 + 32);
    id v27 = v3;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v6;
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * v6);
        v47[0] = kSecClass;
        v47[1] = kSecAttrAccessGroup;
        v48[0] = v7;
        v48[1] = kSecAttrAccessGroupToken;
        v47[2] = kSecReturnAttributes;
        v48[2] = &__kCFBooleanTrue;
        uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        v29 = (void *)v8;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "query:"));
        id v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v38;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v37 + 1) + 8 * (void)i) objectForKeyedSubscript:kSecAttrTokenID]);
              if (v14)
              {
                v15 = -[TKTokenID initWithTokenID:](objc_alloc(&OBJC_CLASS___TKTokenID), "initWithTokenID:", v14);
                id WeakRetained = objc_loadWeakRetained(location);
                v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained tokensByTokenID]);
                v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v15]);

                if (!v18) {
                  [v31 addObject:v15];
                }
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }

          while (v11);
        }

        uint64_t v6 = v30 + 1;
        id v3 = v27;
      }

      while ((id)(v30 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }

    while (v28);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v19 = v31;
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)j) stringRepresentation]);
        [v3 updateForTokenID:v24 items:0];
      }

      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }

    while (v21);
  }
}

void sub_100005BE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100005C38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 _plugIn]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void sub_100005CB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = sub_100003CA0();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100010928();
    }

    [*(id *)(a1 + 40) addObject:v5];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

void sub_100006080(_Unwind_Exception *a1)
{
}

void sub_100006908(_Unwind_Exception *a1)
{
}

void sub_100006C6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100007070(_Unwind_Exception *a1)
{
}

void sub_100007268(_Unwind_Exception *a1)
{
}

void sub_10000739C(_Unwind_Exception *a1)
{
}

void sub_1000074F8(_Unwind_Exception *a1)
{
}

void sub_100007630(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "tokenhost");
  id v2 = (void *)qword_100024030;
  qword_100024030 = (uint64_t)v1;
}

  ;
}

void sub_100007668( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100007678( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100007688( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_1000076B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_15:
  return v21;
}

void sub_100007C68(_Unwind_Exception *a1)
{
}

id sub_100008648()
{
  if (qword_100024038 != -1) {
    dispatch_once(&qword_100024038, &stru_10001C798);
  }
  return (id)qword_100024040;
}

id sub_1000088B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) tokenArrived];
}

id sub_1000088C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) tokenRemoved];
}

void sub_1000089FC(_Unwind_Exception *a1)
{
}

LABEL_12:
    ++v12;
  }

  v15 = strtol(__str, &__endptr, 16);
  if (v15 <= 255 && __endptr == &v19)
  {
    v16 = v15;
    [v8 appendBytes:&v16 length:1];
    v13 = 0;
    goto LABEL_12;
  }

  id v8 = 0LL;
LABEL_14:

  if (v8)
  {
LABEL_15:
    [v6 addObject:v8];
  }

LABEL_16:
}

    id v21 = (void *)v42[5];
    v18 = v21 != 0LL;
    if (v21)
    {
      *a5 = v21;
    }

    else
    {
      uint64_t v22 = sub_100008648();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
        sub_100010AFC(v24, (uint64_t)buf, v23);
      }
    }

    _Block_object_dispose(&v41, 8);
  }

  else
  {
    v18 = 1;
  }

  return v18;
}

void sub_100009024( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_100009058(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009068(uint64_t a1)
{
}

uint64_t sub_100009070(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void sub_1000095D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, os_activity_scope_state_s state)
{
}

void sub_1000097A0(_Unwind_Exception *a1)
{
}

void sub_100009B44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100009B70(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100008648();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100010C5C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_100009BC4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained(WeakRetained + 1);
  [v2 invalidate];

  objc_storeWeak(WeakRetained + 1, 0LL);
  id v3 = sub_100008648();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100010CC0(v4);
  }
}

void sub_100009E14(_Unwind_Exception *a1)
{
}

void sub_100009F1C(_Unwind_Exception *a1)
{
}

void sub_10000A0BC(_Unwind_Exception *a1)
{
}

void sub_10000A128(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "slotwtch");
  id v2 = (void *)qword_100024040;
  qword_100024040 = (uint64_t)v1;
}

void sub_10000A158(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_10000A220()
{
  if (qword_100024058 != -1) {
    dispatch_once(&qword_100024058, &stru_10001C828);
  }
  return (id)qword_100024060;
}

void sub_10000A460(uint64_t a1)
{
  if ([(id)objc_opt_class(*(void *)(a1 + 32)) isUnlocked])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v16 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operations]);
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v16);
  }

  else
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
    if (!v3)
    {
      id v4 = [&__NSArray0__struct mutableCopy];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v7 = os_transaction_create("waiting-for-unlock mkb-keychain-monitor");
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = v7;

      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = (int *)(v10 + 16);
      uint64_t v12 = *(dispatch_queue_s **)(v10 + 8);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000A600;
      handler[3] = &unk_10001C7C0;
      objc_copyWeak(&v18, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v11, v12, handler);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      id v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
    }

    id v13 = objc_retainBlock(*(id *)(a1 + 40));
    [v3 addObject:v13];

    id v14 = sub_10000A220();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100010DE8(v15);
    }
  }

void sub_10000A5E4(_Unwind_Exception *a1)
{
}

void sub_10000A600(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([(id)objc_opt_class(WeakRetained) isUnlocked])
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v2 = *((id *)WeakRetained + 3);
    id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v6);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operations", (void)v11));
          (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

          uint64_t v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v4);
    }

    uint64_t v9 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0LL;

    notify_cancel(*((_DWORD *)WeakRetained + 4));
    uint64_t v10 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = 0LL;

    *((_DWORD *)WeakRetained + 4) = 0;
  }
}

void sub_10000A7DC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___TKHostKeychainOperations);
  id v2 = (void *)qword_100024048;
  qword_100024048 = (uint64_t)v1;
}

void sub_10000A840(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "keychain");
  id v2 = (void *)qword_100024060;
  qword_100024060 = (uint64_t)v1;
}

id sub_10000AC90()
{
  if (qword_100024068 != -1) {
    dispatch_once(&qword_100024068, &stru_10001C8D0);
  }
  return (id)qword_100024070;
}

id sub_10000ACD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeSlotRegistration:");
}

id sub_10000AF10(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeClient:");
}

void sub_10000B1A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_6:
    [v7 resume];
    uint64_t v8 = 1;
    goto LABEL_7;
  }

  if (+[TKSlotRegistration handleConnection:server:]( &OBJC_CLASS___TKSlotRegistration,  "handleConnection:server:",  v7,  self))
  {
    goto LABEL_6;
  }

LABEL_4:
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

void sub_10000B630( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10000B6C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B714(id a1)
{
  os_log_t v1 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  id v2 = -[NSXPCConnection initWithMachServiceName:options:]( v1,  "initWithMachServiceName:options:",  TKClientTokenServerPortName,  0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKClientTokenServerProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v3);

  -[NSXPCConnection resume](v2, "resume");
  id v4 = sub_10000AC90();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100010FA4(v2);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000B85C;
  v11[3] = &unk_10001C890;
  uint64_t v6 = v2;
  __int128 v12 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](v6, "remoteObjectProxyWithErrorHandler:", v11));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000B8BC;
  v9[3] = &unk_10001C5E8;
  uint64_t v10 = v6;
  uint64_t v8 = v6;
  [v7 ensureSlotWatcherRunningWithReply:v9];
}

void sub_10000B85C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000AC90();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100011014(a1, (uint64_t)v3, v5);
  }
}

id sub_10000B8BC(uint64_t a1)
{
  id v2 = sub_10000AC90();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100011090(a1);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000BB1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000BDD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10000BDF8(uint64_t a1)
{
  id v1 = sub_10000AC90();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100011158(v2);
  }
}

void sub_10000BE94(_Unwind_Exception *a1)
{
}

void sub_10000BF00(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "smartcard");
  id v2 = (void *)qword_100024070;
  qword_100024070 = (uint64_t)v1;
}

void sub_10000BF30( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000BF68(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

id sub_10000BF78(uint64_t a1)
{
  return [*(id *)(a1 + 32) processIdentifier];
}

void sub_10000C06C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0LL;
}

void sub_10000C104(_Unwind_Exception *a1)
{
}

id sub_10000C30C()
{
  if (qword_100024078 != -1) {
    dispatch_once(&qword_100024078, &stru_10001C980);
  }
  return (id)qword_100024080;
}

void sub_10000C600(uint64_t a1)
{
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_10000C770;
  v13[4] = sub_10000C780;
  id v14 = 0LL;
  id v2 = *(void **)(a1 + 40);
  id obj = 0LL;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 connectionWithError:&obj]);
  objc_storeStrong(&v14, obj);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 16))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000C788;
    v7[3] = &unk_10001C8F8;
    v7[4] = v6;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    __int128 v11 = v13;
    id v10 = *(id *)(a1 + 56);
    _os_activity_initiate((void *)&_mh_execute_header, "evaluate token access request", OS_ACTIVITY_FLAG_DEFAULT, v7);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  _Block_object_dispose(v13, 8);
}

void sub_10000C758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10000C770(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C780(uint64_t a1)
{
}

void sub_10000C788(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v2 isCaller:v3 allowedForToken:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = a1[7];
  if ((v6 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) endpoint]);
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0LL);
  }

  else
  {
    (*(void (**)(void, void, void))(v7 + 16))(a1[7], 0LL, *(void *)(*(void *)(a1[8] + 8LL) + 40LL));
  }

void sub_10000C8F0(_Unwind_Exception *a1)
{
}

void sub_10000C9AC(_Unwind_Exception *a1)
{
}

void sub_10000CA48(_Unwind_Exception *a1)
{
}

void sub_10000D108(_Unwind_Exception *a1)
{
}

void sub_10000D4CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_10000D4F4(id a1)
{
  id v1 = sub_10000C30C();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100011278(v2, v3, v4);
  }
}

void sub_10000D6F0(_Unwind_Exception *a1)
{
}

void sub_10000D718(id a1)
{
  id v1 = sub_10000C30C();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000112AC(v2, v3, v4);
  }
}

void sub_10000DC20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000DCEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "tkserver");
  id v2 = (void *)qword_100024080;
  qword_100024080 = (uint64_t)v1;
}

void sub_10000DD1C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000DD68(id a1)
{
  v4[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v4[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_100024088;
  qword_100024088 = v2;
}

void sub_10000DF64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000DFD0();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000113FC(a1);
  }

  [*(id *)(a1 + 32) setError:v3];
}

id sub_10000DFD0()
{
  if (qword_100024098 != -1) {
    dispatch_once(&qword_100024098, &stru_10001CAC8);
  }
  return (id)qword_1000240A0;
}

void sub_10000E41C(_Unwind_Exception *a1)
{
}

LABEL_27:
  objc_sync_exit(v4);
  return v8;
}

void sub_10000EC80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location)
{
}

void sub_10000ECE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000DFD0();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000116E4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cache]);
    [v8 removeDriverWithClassID:*(void *)(a1 + 32)];
  }
}

void sub_10000ED78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000DFD0();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100011748();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cache]);
    [v8 removeDriverWithClassID:*(void *)(a1 + 32)];
  }
}

void sub_10000EEA4(_Unwind_Exception *a1)
{
}

void sub_10000F1AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000F1D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F1E0(uint64_t a1)
{
}

void sub_10000F1E8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setError:v7];
}

void sub_10000F550( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000F580(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;
  id v15 = a4;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  [*(id *)(a1 + 32) setError:v15];
}

void sub_10000F760( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000F778(uint64_t a1, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "setError:");
}

void sub_10000FBC0(_Unwind_Exception *a1)
{
}

void sub_10000FD44(_Unwind_Exception *a1)
{
}

void sub_1000100C4(_Unwind_Exception *a1)
{
}

void sub_100010194(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CryptoTokenKit", "tokenhost");
  uint64_t v2 = (void *)qword_1000240A0;
  qword_1000240A0 = (uint64_t)v1;
}

  ;
}

void sub_1000101D4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000101E8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_100010214(void *a1, os_log_s *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 tokenServer]);
  if (v4) {
    uint64_t v5 = "token";
  }
  else {
    uint64_t v5 = "";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 slotWatcher]);
  if (v6) {
    id v7 = "watcher";
  }
  else {
    id v7 = "";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 slotServer]);
  if (v8) {
    uint64_t v9 = "slot";
  }
  else {
    uint64_t v9 = "";
  }
  int v10 = 136447490;
  id v11 = v5;
  __int16 v12 = 2082;
  uint64_t v13 = v7;
  __int16 v14 = 2082;
  id v15 = v9;
  __int16 v16 = 1024;
  uid_t v17 = geteuid();
  __int16 v18 = 1024;
  uid_t v19 = getuid();
  __int16 v20 = 2114;
  id v21 = @"n/a";
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Hello from ctkd(%{public}s:%{public}s:%{public}s) euid=%u uid=%u session:%{public}@",  (uint8_t *)&v10,  0x36u);
}

void sub_100010370( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000103A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000103D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001043C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000104A0()
{
}

void sub_100010500()
{
}

void sub_100010560()
{
}

void sub_1000105C0()
{
}

void sub_100010620()
{
}

void sub_10001064C()
{
}

void sub_100010678()
{
}

void sub_1000106A4(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to get bundle identifier for pid %u",  (uint8_t *)v3,  8u);
  sub_100007660();
}

void sub_10001072C()
{
}

void sub_100010758()
{
}

void sub_100010784()
{
}

void sub_1000107E4(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 tokenID]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Read persistent token %{public}@", a1, 0xCu);
}

void sub_100010858()
{
}

void sub_1000108B8()
{
}

void sub_1000108E4(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Writing changes into tokenDB classes: %d extensions",  buf,  8u);
}

void sub_100010928()
{
}

void sub_100010988(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Refusing caller %{public}@, no extension found for classID=%{public}@",  (uint8_t *)&v4,  0x16u);
  sub_100007660();
}

void sub_100010A0C()
{
}

void sub_100010A38()
{
}

void sub_100010A98( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010AFC(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10000A158( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Card does not contain any application handled by extension %{public}@",  (uint8_t *)a2);
}

void sub_100010B48(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_10000A158((void *)&_mh_execute_header, a2, a3, "card inserted into slot: %{public}@", (uint8_t *)&v4);
  sub_100007660();
}

void sub_100010BB4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_10000A158((void *)&_mh_execute_header, a2, a3, "card removed from slot: %{public}@", (uint8_t *)&v4);
  sub_100007660();
}

void sub_100010C20(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_10000A158((void *)&_mh_execute_header, a3, (uint64_t)a3, "start watching %lu slots", (uint8_t *)a1);
}

void sub_100010C5C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010CC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "connection to slot registration server was interrupted",  v1,  2u);
}

void sub_100010D00(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "removing slot name=%{public}@: - remaining %lu slots",  buf,  0x16u);
}

void sub_100010D64(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "keychain query failed: %d (%@)",  (uint8_t *)v3,  0x12u);
}

void sub_100010DE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "queueing keychain operation, keybag is not unlocked",  v1,  2u);
}

void sub_100010E28(id *a1, uint64_t a2, os_log_s *a3)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  v6[0] = 67109634;
  v6[1] = [WeakRetained processIdentifier];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  int v10 = @"com.apple.private.ctk.slot-type";
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "refusing slot registration from pid=%d: slot type '%@' not allowed by entitlement '%@'",  (uint8_t *)v6,  0x1Cu);
}

void sub_100010EE4(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "ignoring multiple registration attempt for slot type '%@'",  (uint8_t *)&v3,  0xCu);
}

void sub_100010F5C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10000BF68((void *)&_mh_execute_header, a2, a3, "added registration for slot %{public}@", (uint8_t *)a2);
}

void sub_100010FA4(void *a1)
{
  sub_10000BF30( (void *)&_mh_execute_header,  v1,  v2,  "notify slotwatcher for uid=%d on connection %{public}@",  v3,  v4,  v5,  v6,  v7);
  sub_10000BF44();
}

void sub_100011014(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to notify ctkd agent in session uid=%d: %{public}@",  v4,  0x12u);
  sub_10000BF44();
}

void sub_100011090(uint64_t a1)
{
  sub_10000BF30( (void *)&_mh_execute_header,  v1,  v2,  "notified slotwatcher for uid=%d on connection %{public}@",  v3,  v4,  v5,  v6,  2u);
  sub_10000BF44();
}

void sub_100011110(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10000BF68((void *)&_mh_execute_header, a2, a3, "removing registration for slot %{public}@", (uint8_t *)a2);
}

void sub_100011158(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "addClient notification finished", v1, 2u);
}

void sub_100011198(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "refusing request for token with invalid tokenID %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_100007660();
}

void sub_100011208(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "refusing request for non-existing/missing tokenID %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_100007660();
}

void sub_100011278(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000DD1C((void *)&_mh_execute_header, a1, a3, "tokenInserted replied", v3);
  sub_100007698();
}

void sub_1000112AC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000DD1C((void *)&_mh_execute_header, a1, a3, "tokenRemoved replied", v3);
  sub_100007698();
}

void sub_1000112E0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000DD1C((void *)&_mh_execute_header, a1, a3, "setting token registry to TKTokenServer", v3);
  sub_100007698();
}

void sub_100011314(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000DD1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "received registry loaded signal", a1);
}

void sub_100011348(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000DD1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "waiting for the registry to be loaded", a1);
}

void sub_10001137C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "sending notification '%@' failed with status %u",  (uint8_t *)&v3,  0x12u);
  sub_100007660();
}

void sub_1000113FC(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) driver]);
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 extension]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  sub_1000076A0();
  sub_1000101D4( (void *)&_mh_execute_header,  v4,  v5,  "Failed to communicate with driver %{public}@, error: %{public}@",  v6,  v7,  v8,  v9,  v10);
}

void sub_1000114C0(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a2 extension]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  sub_1000101D4( (void *)&_mh_execute_header,  v3,  v4,  "Invalid or missing attribute '%{public}@' of extension %{public}@",  v5,  v6,  v7,  v8,  2u);

  sub_1000101C4();
}

void sub_100011564()
{
}

void sub_1000115C4()
{
}

void sub_100011624()
{
}

void sub_100011684()
{
}

void sub_1000116E4()
{
}

void sub_100011748()
{
}

void sub_1000117AC()
{
}

void sub_10001180C()
{
}

void sub_10001186C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000118D4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 extension]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  sub_1000076A0();
  sub_10000A158((void *)&_mh_execute_header, a2, v5, "acquiring token on driver %{public}@ through slot", v6);

  sub_1000101C4();
}

void sub_10001196C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 extension]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  sub_1000076A0();
  sub_10000A158((void *)&_mh_execute_header, a2, v5, "configuring extension %{public}@", v6);

  sub_1000101C4();
}

void sub_100011A04()
{
}

void sub_100011A64()
{
}

void sub_100011AC4()
{
}

void sub_100011B24()
{
}

void sub_100011B84()
{
}

void sub_100011BE4(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "terminating, force-invalidating %d drivers",  (uint8_t *)v3,  8u);
  sub_100007660();
}

id objc_msgSend_initLocalWithKeyType_keySize_accessControl_options_authContext_caller_forceSystemSession_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initLocalWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}