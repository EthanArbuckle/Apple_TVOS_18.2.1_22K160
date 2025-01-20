uint64_t start()
{
  +[GameControllerConfigService run](&OBJC_CLASS___GameControllerConfigService, "run");
  return 0LL;
}

uint64_t sub_1000045D4()
{
  return MAIsQueryResultFailure() ^ 1;
}

uint64_t sub_1000045EC(unint64_t a1, _BYTE *a2)
{
  uint64_t result = 0LL;
  if (a1 <= 0xC && ((1LL << a1) & 0x125A) != 0)
  {
    uint64_t result = 1LL;
    if (a2) {
      *a2 = 1;
    }
  }

  return result;
}

uint64_t sub_100004620(uint64_t a1)
{
  unsigned int v2 = MAIsDownloadResultFailure() ^ 1;
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
    unsigned int v2 = 1;
  }
  if (a1 == 29) {
    return 1LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_100004658(unint64_t a1)
{
  return (a1 < 0x31) & (0x1001190000400uLL >> a1);
}

uint64_t sub_10000467C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 1LL;
  switch(v2)
  {
    case 0LL:
    case 1LL:
    case 7LL:
    case 8LL:
    case 12LL:
    case 23LL:
    case 50LL:
    case 51LL:
    case 52LL:
    case 53LL:
    case 54LL:
    case 55LL:
    case 56LL:
    case 59LL:
    case 60LL:
    case 61LL:
    case 63LL:
    case 64LL:
    case 66LL:
    case 67LL:
    case 68LL:
    case 69LL:
      if (a2) {
        *a2 = 1;
      }
      break;
    case 2LL:
    case 15LL:
    case 16LL:
    case 17LL:
    case 29LL:
    case 33LL:
    case 34LL:
    case 46LL:
    case 70LL:
      return result;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t sub_1000046B8(uint64_t a1)
{
  uint64_t v1 = a1 - 4;
  uint64_t result = 1LL;
  switch(v1)
  {
    case 0LL:
    case 1LL:
    case 2LL:
    case 3LL:
    case 7LL:
    case 8LL:
    case 15LL:
    case 16LL:
    case 17LL:
    case 18LL:
    case 19LL:
    case 21LL:
    case 22LL:
    case 23LL:
    case 29LL:
    case 34LL:
    case 35LL:
    case 36LL:
    case 39LL:
    case 40LL:
    case 42LL:
    case 45LL:
    case 46LL:
    case 54LL:
    case 55LL:
    case 59LL:
    case 62LL:
    case 68LL:
    case 69LL:
    case 71LL:
      return result;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

id sub_1000046EC()
{
  if (qword_100015700 != -1) {
    dispatch_once(&qword_100015700, &stru_100010320);
  }
  return (id)qword_1000156F8;
}

void sub_10000472C(id a1)
{
  dispatch_workloop_t v1 = dispatch_workloop_create("com.apple.gamecontroller.mobileasset");
  uint64_t v2 = (void *)qword_1000156F8;
  qword_1000156F8 = (uint64_t)v1;
}

void sub_100004938(_Unwind_Exception *a1)
{
}

void sub_10000494C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24)) {
    goto LABEL_2;
  }
  id v10 = 0LL;
  char v5 = sub_100004A74((dispatch_queue_t *)v4, &v10);
  id v6 = v10;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    [v3 failWithError:v6];
    goto LABEL_7;
  }

  if (!*(void *)(*(void *)(a1 + 32) + 24LL))
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    v12 = @"Did not find an installed configuration mobile asset.";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v8 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 0LL, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v3 failWithError:v9];

LABEL_7:
    goto LABEL_8;
  }

LABEL_2:
  objc_msgSend(v3, "succeedWithResult:");
LABEL_8:
}

  objc_msgSend(v3, "succeedWithResult:");
LABEL_8:
}

uint64_t sub_100004A74(dispatch_queue_t *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  v45 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Select Configuration Asset",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DETACHED);
  os_activity_scope_enter(v45, &state);
  dispatch_assert_queue_V2(a1[2]);
  id v4 = sub_100004F88(a1);
  id v46 = (id)objc_claimAutoreleasedReturnValue(v4);
  id v5 = [v46 waitUntilFinished];
  if (v5)
  {
    if (v5 == (id)1)
    {
      id v6 = v46;
      if (!a2)
      {
        uint64_t v7 = 0LL;
        goto LABEL_37;
      }

      uint64_t v7 = 0LL;
      *a2 = (id)objc_claimAutoreleasedReturnValue([v46 error]);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v46 result]);
      v42 = a1;
      v44 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
      id v9 = sub_10000B7B0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      v12 = v8;
      if (v11)
      {
        id v13 = sub_10000B7B0();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_10000B984();
        }

        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v15 = v44;
        id v16 = [v15 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v52;
          do
          {
            v18 = 0LL;
            do
            {
              if (*(void *)v52 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)v18);
              id v20 = sub_10000B7B0();
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v58 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
              }

              v18 = (char *)v18 + 1;
            }

            while (v16 != v18);
            id v8 = v12;
            id v16 = [v15 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }

          while (v16);
        }
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_1000103B0));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v44 filteredArrayUsingPredicate:v22]);

      v43 = (void *)objc_claimAutoreleasedReturnValue([v23 sortedArrayUsingSelector:"db_compareTo:"]);
      id v24 = sub_10000B7B0();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);

      if (v26)
      {
        id v27 = sub_10000B7B0();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10000B958();
        }

        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v29 = v43;
        id v30 = [v29 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v48;
          do
          {
            v32 = 0LL;
            do
            {
              if (*(void *)v48 != v31) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v32);
              id v34 = sub_10000B7B0();
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v58 = v33;
                _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
              }

              v32 = (char *)v32 + 1;
            }

            while (v30 != v32);
            id v8 = v12;
            id v30 = [v29 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }

          while (v30);
        }
      }

      uint64_t v36 = objc_claimAutoreleasedReturnValue([v43 lastObject]);
      id v37 = sub_10000B7B0();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v58 = v36;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Loaded configuration asset: %@", buf, 0xCu);
      }

      v39 = v42;
      objc_sync_enter(v39);
      dispatch_queue_t v40 = v39[3];
      v39[3] = (dispatch_queue_t)v36;

      objc_sync_exit(v39);
      uint64_t v7 = 1LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v6 = v46;
LABEL_37:

  os_activity_scope_leave(&state);
  return v7;
}

void sub_100004F1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, os_activity_scope_state_s state)
{
}

id sub_100004F7C(uint64_t a1, void *a2)
{
  return [a2 configurationBundleURLsForType:*(void *)(a1 + 32)];
}

id sub_100004F88(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Query Installed Assets",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v2, &v5);
    id v3 = sub_100007780((uint64_t)v1, 1LL, 1);
    id v1 = (id)objc_claimAutoreleasedReturnValue(v3);
    os_activity_scope_leave(&v5);
  }

  return v1;
}

void sub_100005004( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

BOOL sub_100005018(id a1, MAAsset *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v12 = 0LL;
  char v4 = sub_100008B04(v3, &v12);
  id v5 = v12;
  id v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if (![v7 isEqual:@"GCMobileAssetError"])
    {
LABEL_8:

      goto LABEL_9;
    }

    id v8 = [v6 code];

    if (v8 == (id)3)
    {
      if (-[MAAsset state](v3, "state") == (id)5 || -[MAAsset state](v3, "state") == (id)6)
      {
        id v9 = sub_10000B7B0();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
          sub_10000B9B0();
        }
      }

      else
      {
        id v11 = sub_10000B7B0();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "Installed asset has invalid format: %{public}@",  buf,  0xCu);
        }
      }

      goto LABEL_8;
    }
  }

LABEL_9:
  return v4;
}

id sub_1000051BC(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Query Available Assets",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v2, &v5);
    id v3 = sub_100007780((uint64_t)v1, 2LL, 0);
    id v1 = (id)objc_claimAutoreleasedReturnValue(v3);
    os_activity_scope_leave(&v5);
  }

  return v1;
}

void sub_100005238( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

NSArray *__cdecl sub_10000524C(id a1, MAAssetQuery *a2, BOOL *a3, id *a4)
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAAssetQuery results](a2, "results", a3, a4));
  os_activity_scope_state_s v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"db_compareTo:"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gc_reversedArray"));

  return (NSArray *)v6;
}

void sub_100005368(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24)) {
    goto LABEL_2;
  }
  id v10 = 0LL;
  char v5 = sub_100004A74((dispatch_queue_t *)v4, &v10);
  id v6 = v10;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    [v3 failWithError:v6];
    goto LABEL_7;
  }

  if (!*(void *)(*(void *)(a1 + 32) + 24LL))
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    id v12 = @"Did not find an installed configuration mobile asset.";
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v8 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 0LL, v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v3 failWithError:v9];

LABEL_7:
    goto LABEL_8;
  }

NSDate *__cdecl sub_1000054D0(id a1, MAAssetQuery *a2, BOOL *a3, id *a4)
{
  char v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MAAssetQuery valueForKey:](v5, "valueForKey:", @"_lastFetchDate"));
  if (!v6)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v11 = @"Could not determine catalog fetch date.";
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v8 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 0LL, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v8);

    id v6 = 0LL;
  }

  return (NSDate *)v6;
}

void sub_1000058C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_1000058F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005908(uint64_t a1)
{
}

void sub_100005910(uint64_t a1)
{
  uint64_t v2 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Cancel Check For Updates",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000059A8;
  block[3] = &unk_100010458;
  id v3 = *(dispatch_queue_s **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v3, block);
  os_activity_scope_leave(&state);
}

id sub_1000059A8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cancel];
}

void sub_1000059B8( uint64_t a1, void *a2, void *a3, int a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  if (v14)
  {
    id v17 = sub_10000B820();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 assetId]);
      id v20 = -[MAAsset contentVersion]_0(v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = -[MAAsset contentRevision]_0(v14);
      uint64_t v23 = MAStringForMAAssetState([v14 state]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v19;
      __int16 v49 = 2112;
      __int128 v50 = v21;
      __int16 v51 = 2048;
      __int128 v52 = v22;
      __int16 v53 = 2112;
      __int128 v54 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Loaded updated configuration asset: <%@ v%@-%zi state: %@>",  buf,  0x2Au);
    }

    id v25 = *(id *)(a1 + 32);
    objc_sync_enter(v25);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), a2);
    objc_sync_exit(v25);

    id v26 = sub_1000046EC();
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005D8C;
    block[3] = &unk_1000104A8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v27, block);

    goto LABEL_5;
  }

  if (!v16)
  {
LABEL_5:
    v28 = 0LL;
    goto LABEL_12;
  }

  id v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  @"Check for updates failed.",  NSLocalizedDescriptionKey);
  *(void *)buf = &a9;
  id v30 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v16, &a9);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v30,  NSLocalizedFailureReasonErrorKey);

  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v15, NSUnderlyingErrorKey);
  }
  if (a4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  @"Try again in a few minutes.",  NSLocalizedRecoverySuggestionErrorKey);
  }
  id v31 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 1LL, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v31);

LABEL_12:
  id v32 = *(id *)(a1 + 32);
  objc_sync_enter(v32);
  id v33 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v35 = *(void *)(a1 + 32);
  uint64_t v34 = a1 + 32;
  uint64_t v36 = *(void **)(v35 + 48);
  *(void *)(v35 + 48) = 0LL;

  id v37 = *(void **)(*(void *)v34 + 40LL);
  *(void *)(*(void *)v34 + 40LL) = 0LL;

  objc_sync_exit(v32);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v38 = v33;
  id v39 = [v38 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v43;
    do
    {
      v41 = 0LL;
      do
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(v38);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v42 + 1) + 8LL * (void)v41) + 16LL))(*(void *)(*((void *)&v42 + 1) + 8LL * (void)v41));
        v41 = (char *)v41 + 1;
      }

      while (v39 != v41);
      id v39 = [v38 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v39);
  }
}

void sub_100005D70(_Unwind_Exception *a1)
{
}

void sub_100005D8C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:GCConfigurationBundleSourceBundlesDidChangeNotification object:*(void *)(a1 + 32)];
}

void sub_100005DDC(uint64_t a1)
{
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1000060BC;
  v54[3] = &unk_1000104F8;
  id v55 = *(id *)(a1 + 48);
  id v2 = objc_retainBlock(v54);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100006178;
  v49[3] = &unk_100010548;
  uint64_t v3 = *(void *)(a1 + 32);
  char v53 = *(_BYTE *)(a1 + 64);
  char v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v49[4] = v3;
  uint64_t v52 = v4;
  id v50 = v5;
  id v6 = v2;
  id v51 = v6;
  uint64_t v7 = objc_retainBlock(v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10000658C;
  v45[3] = &unk_1000105B8;
  v45[4] = *(void *)(a1 + 32);
  id v46 = *(id *)(a1 + 48);
  id v8 = v6;
  id v47 = v8;
  id v9 = v7;
  id v48 = v9;
  NSErrorUserInfoKey v10 = objc_retainBlock(v45);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100006E48;
  v40[3] = &unk_100010608;
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = *(void **)(a1 + 40);
  v40[4] = *(void *)(a1 + 32);
  uint64_t v44 = v11;
  id v41 = v12;
  id v42 = *(id *)(a1 + 48);
  id v13 = v10;
  id v43 = v13;
  id v14 = objc_retainBlock(v40);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000070BC;
  v34[3] = &unk_100010658;
  char v39 = *(_BYTE *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = *(void **)(a1 + 40);
  v34[4] = *(void *)(a1 + 32);
  uint64_t v38 = v15;
  id v35 = v16;
  id v36 = *(id *)(a1 + 48);
  id v17 = v14;
  id v37 = v17;
  v18 = objc_retainBlock(v34);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000074BC;
  v29[3] = &unk_1000106A8;
  id v20 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  v29[4] = *(void *)(a1 + 32);
  uint64_t v33 = v19;
  id v30 = v20;
  id v31 = v13;
  v21 = v18;
  id v32 = v21;
  v22 = v13;
  uint64_t v23 = objc_retainBlock(v29);
  v28 = v23;
  if (*(_BYTE *)(a1 + 64)) {
    uint64_t v23 = v21;
  }
  ((void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))v23[2])(v23, v24, v25, v26, v27);
}

void sub_1000060BC(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = (unint64_t)[v8 state];
  if (v3 > 6 || ((1LL << v3) & 0x6C) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = MAStringForMAAssetState(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    (*(void (**)(uint64_t, void, void, void, const __CFString *))(v5 + 16))( v5,  0LL,  0LL,  0LL,  @"Downloaded asset has invalid state [%ld: %{public}@]: %@");
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100006178(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000B820();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000BA10();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  id v6 = sub_1000062B4(*(void *)(a1 + 32), v3, *(_BYTE *)(a1 + 64));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v7);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(v8 + 8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000063D0;
  v12[3] = &unk_100010520;
  v12[4] = v8;
  id v13 = v3;
  id v14 = v9;
  id v15 = *(id *)(a1 + 48);
  id v11 = v3;
  [v7 observeFinishOnQueue:v10 withBlock:v12];
}

id sub_1000062B4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (a1)
  {
    id v6 = -[GCOperation initOnQueue:withOptions:]( objc_alloc(&OBJC_CLASS___GCOperation),  "initOnQueue:withOptions:",  0LL,  4LL);
    [v6 setLabel:@"Download Asset"];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100007C04;
    v12[3] = &unk_100010770;
    char v14 = a3;
    id v7 = v5;
    id v13 = v7;
    [v6 setAsyncBlock:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100007E88;
    v10[3] = &unk_1000107D8;
    id v11 = v7;
    [v6 observeFinishWithOptions:0x10000 block:v10];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 startAsynchronously]);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_1000063D0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 40),  "setCompletedUnitCount:",  (char *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqual:@"com.apple.MobileAssetError.Download"])
    {
      int v9 = sub_10000467C((uint64_t)[v6 code], 0);

      if (v9)
      {
        id v10 = sub_10000B820();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10000BAF8(a1);
        }
LABEL_14:

        id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v12 = sub_10000B820();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000BB7C(a1);
    }
    goto LABEL_14;
  }

  if (!a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
LABEL_15:
    v7();
    goto LABEL_16;
  }

  if (([*(id *)(a1 + 40) refreshState] & 1) == 0)
  {
    id v13 = sub_10000B820();
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000BA74((id *)(a1 + 40), v14);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
    goto LABEL_15;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_16:
}

void sub_10000658C(void *a1, void *a2)
{
  id v3 = a2;
  v74 = a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 8LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 results]);
  id v5 = sub_10000B820();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  v75 = v4;
  if (v7)
  {
    id v8 = sub_10000B820();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10000BD68();
    }

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v91;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v91 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)i);
          id v16 = sub_10000B820();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v98 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }

      while (v12);
    }

    id v4 = v75;
  }

  if ([v4 count])
  {
    id v73 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_100010568));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v18]);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sortedArrayUsingSelector:"db_compareTo:"]);
    id v21 = sub_10000B820();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    LODWORD(v19) = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

    if ((_DWORD)v19)
    {
      id v23 = sub_10000B820();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10000BD3C();
      }

      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      uint64_t v25 = v20;
      id v26 = v20;
      id v27 = [v26 countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v87;
        do
        {
          for (j = 0LL; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v87 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)j);
            id v32 = sub_10000B820();
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v98 = v31;
              _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
            }
          }

          id v28 = [v26 countByEnumeratingWithState:&v86 objects:v96 count:16];
        }

        while (v28);
      }

      id v4 = v75;
      id v20 = v25;
    }

    if (![v20 count])
    {
      id v68 = sub_10000B820();
      v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_10000BC38(v4, v69);
      }

      uint64_t v70 = v74[5];
      [v4 count];
      (*(void (**)(uint64_t, void, void, void, const __CFString *))(v70 + 16))( v70,  0LL,  0LL,  0LL,  @"%zi available assets yielded no viable assets.");
      id v3 = v73;
      goto LABEL_65;
    }

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_100006E24;
    v84[3] = &unk_100010590;
    id v34 = (id)objc_claimAutoreleasedReturnValue([v20 lastObject]);
    id v85 = v34;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v84));
    v72 = v20;
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v20 filteredArrayUsingPredicate:v35]);

    id v37 = sub_10000B820();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);

    if (v39)
    {
      id v40 = sub_10000B820();
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_10000BCD8();
      }
      id v71 = v34;

      id v42 = sub_10000B820();
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_10000BCAC();
      }

      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      id v44 = v36;
      id v45 = [v44 countByEnumeratingWithState:&v80 objects:v95 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v81;
        do
        {
          for (k = 0LL; k != v46; k = (char *)k + 1)
          {
            if (*(void *)v81 != v47) {
              objc_enumerationMutation(v44);
            }
            __int16 v49 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)k);
            id v50 = sub_10000B820();
            id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v98 = v49;
              _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
            }
          }

          id v46 = [v44 countByEnumeratingWithState:&v80 objects:v95 count:16];
        }

        while (v46);
      }

      id v34 = v71;
    }

    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v52 = v36;
    id v53 = [v52 countByEnumeratingWithState:&v76 objects:v94 count:16];
    if (v53)
    {
      id v54 = v53;
      id v55 = 0LL;
      uint64_t v56 = *(void *)v77;
      do
      {
        for (m = 0LL; m != v54; m = (char *)m + 1)
        {
          if (*(void *)v77 != v56) {
            objc_enumerationMutation(v52);
          }
          uint64_t v58 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)m);
          unint64_t v59 = (unint64_t)[v58 state];
          if (v59 <= 6 && ((1LL << v59) & 0x6C) != 0)
          {
            id v61 = v58;

            id v55 = v61;
          }
        }

        id v54 = [v52 countByEnumeratingWithState:&v76 objects:v94 count:16];
      }

      while (v54);

      if (v55)
      {
        id v62 = sub_10000B820();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        id v3 = v73;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v98 = v55;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_INFO,  "Found a previously installed asset that matches the best asset: %{public}@",  buf,  0xCu);
        }

        (*(void (**)(void))(v74[6] + 16LL))();
LABEL_64:

        id v4 = v75;
        id v20 = v72;
LABEL_65:

        goto LABEL_66;
      }
    }

    else
    {
    }

    id v64 = sub_10000B820();
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    id v3 = v73;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v98 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_INFO,  "Local assets are out of date.  Downloading: %{public}@",  buf,  0xCu);
    }

    (*(void (**)(void))(v74[7] + 16LL))();
    goto LABEL_64;
  }

  id v66 = sub_10000B820();
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
    sub_10000BC00();
  }

  (*(void (**)(void))(v74[5] + 16LL))();
LABEL_66:
}

BOOL sub_100006D6C(id a1, MAAsset *a2, NSDictionary *a3)
{
  id v10 = 0LL;
  char v3 = sub_100008B04(a2, &v10);
  id v4 = v10;
  id v5 = v4;
  if ((v3 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if (![v6 isEqual:@"GCMobileAssetError"])
    {
LABEL_6:

      goto LABEL_7;
    }

    id v7 = [v5 code];

    if (v7 == (id)3)
    {
      id v8 = sub_10000B820();
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
        sub_10000BD94();
      }
      goto LABEL_6;
    }
  }

LABEL_7:
  return v3;
}

BOOL sub_100006E24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "db_compareIgnoringContentRevisionTo:", *(void *)(a1 + 32)) == 0;
}

void sub_100006E48(uint64_t a1)
{
  id v2 = sub_10000B820();
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000BDF4();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  id v4 = sub_1000051BC(*(id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v5);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100006F68;
  v8[3] = &unk_1000105E0;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v5 observeFinishOnQueue:v7 withBlock:v8];
}

void sub_100006F68(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend( *(id *)(a1 + 32),  "setCompletedUnitCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v10 isEqual:@"com.apple.MobileAssetError.Query"])
    {
      int v11 = sub_1000045EC((unint64_t)[v8 code], 0);

      if (v11)
      {
        id v12 = sub_10000B820();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10000BE20();
        }
LABEL_12:

        id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
        goto LABEL_13;
      }
    }

    else
    {
    }

    id v14 = sub_10000B820();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000BE80();
    }
    goto LABEL_12;
  }

  if (!a2)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_13:
    v9();
    goto LABEL_14;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_14:
}

void sub_1000070BC(uint64_t a1)
{
  id v2 = sub_10000B820();
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000BEE0();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  id v4 = sub_1000071E0(*(void **)(a1 + 32), *(_BYTE *)(a1 + 72));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v5);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007384;
  v8[3] = &unk_100010630;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v5 observeFinishOnQueue:v7 withBlock:v8];
}

id sub_1000071E0(void *a1, char a2)
{
  if (a1)
  {
    char v3 = a1;
    objc_sync_enter(v3);
    if (!v3[4])
    {
      id v4 = _os_activity_create( (void *)&_mh_execute_header,  "[Configuration Mobile Asset Manager] Download Catalog",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DETACHED);
      os_activity_scope_enter(v4, &state);
      objc_initWeak(&location, v3);
      id v5 = -[GCOperation initOnQueue:withOptions:]( objc_alloc(&OBJC_CLASS___GCOperation),  "initOnQueue:withOptions:",  0LL,  4LL);
      [v5 setLabel:@"Download Catalog"];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100007FE0;
      v10[3] = &unk_1000107F8;
      char v11 = a2;
      [v5 setAsyncBlock:v10];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100008274;
      v8[3] = &unk_100010848;
      objc_copyWeak(&v9, &location);
      [v5 observeFinishWithOptions:0x10000 block:v8];
      id v6 = v3[4];
      v3[4] = v5;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      os_activity_scope_leave(&state);
    }

    objc_sync_exit(v3);

    a1 = (void *)objc_claimAutoreleasedReturnValue([v3[4] startAsynchronously]);
  }

  return a1;
}

void sub_100007350( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100007384(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend( *(id *)(a1 + 32),  "setCompletedUnitCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqual:@"com.apple.MobileAssetError.Download"])
    {
      int v9 = sub_10000467C((uint64_t)[v6 code], 0);

      if (v9)
      {
        id v10 = sub_10000B820();
        char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10000BF0C();
        }
LABEL_12:

        uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
        goto LABEL_13;
      }
    }

    else
    {
    }

    id v12 = sub_10000B820();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000BF6C();
    }
    goto LABEL_12;
  }

  if (!a2)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_13:
    v7();
    goto LABEL_14;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_14:
}

void sub_1000074BC(uint64_t a1)
{
  id v2 = sub_10000B820();
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000BFCC();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
  id v4 = sub_1000051BC(*(id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v5);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(v6 + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000075E4;
  v9[3] = &unk_100010680;
  v9[4] = v6;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v5 observeFinishOnQueue:v8 withBlock:v9];
}

void sub_1000075E4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend( *(id *)(a1[4] + 40),  "setCompletedUnitCount:",  (char *)objc_msgSend(*(id *)(a1[4] + 40), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v10 isEqual:@"com.apple.MobileAssetError.Query"])
    {
      int v11 = sub_1000045EC((unint64_t)[v8 code], 0);

      if (v11)
      {
        id v12 = sub_10000B820();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10000BFF8();
        }
LABEL_14:

        int v9 = *(void (**)(void))(a1[5] + 16LL);
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v14 = sub_10000B820();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000C058();
    }
    goto LABEL_14;
  }

  if (!a2)
  {
    int v9 = *(void (**)(void))(a1[5] + 16LL);
LABEL_15:
    v9();
    goto LABEL_17;
  }

  else {
    (*(void (**)(void))(a1[7] + 16LL))();
  }
LABEL_17:
}

id sub_100007780(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    id v5 = sub_10000B7B0();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000C0B8(a2, v6);
    }

    id v7 = -[MAAssetQuery initWithType:]( objc_alloc(&OBJC_CLASS___MAAssetQuery),  "initWithType:",  @"com.apple.MobileAsset.GameController.DB1");
    -[MAAssetQuery returnTypes:](v7, "returnTypes:", a2);
    if (a3)
    {
      -[MAAssetQuery setDoNotBlockOnNetworkStatus:](v7, "setDoNotBlockOnNetworkStatus:", 1LL);
      -[MAAssetQuery setDoNotBlockBeforeFirstUnlock:](v7, "setDoNotBlockBeforeFirstUnlock:", 1LL);
    }

    id v8 = -[GCOperation initOnQueue:withOptions:]( objc_alloc(&OBJC_CLASS___GCOperation),  "initOnQueue:withOptions:",  0LL,  256LL);
    [v8 setLabel:@"Query Assets"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000078FC;
    v18[3] = &unk_1000106F8;
    int v9 = v7;
    uint64_t v19 = v9;
    [v8 setSyncBlock:v18];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    id v15 = sub_100007A24;
    id v16 = &unk_100010348;
    id v17 = v9;
    id v10 = v9;
    [v8 setAsyncBlock:&v13];
    int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activate", v13, v14, v15, v16));
  }

  else
  {
    int v11 = 0LL;
  }

  return v11;
}

id sub_1000078FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [*(id *)(a1 + 32) queryMetaDataSync];
  v13[0] = @"Assets query failed.";
  v12[0] = NSLocalizedDescriptionKey;
  v12[1] = NSLocalizedFailureReasonErrorKey;
  uint64_t v7 = MAStringForMAQueryResult(v5);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  int v9 = (void *)v8;
  id v10 = &stru_100010C88;
  if (v8) {
    id v10 = (const __CFString *)v8;
  }
  v13[1] = v10;
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAssetError.Query",  v5,  v11));

  return 0LL;
}

void sub_100007A24(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007AB4;
  v5[3] = &unk_100010720;
  id v6 = a2;
  char v3 = *(void **)(a1 + 32);
  id v7 = v3;
  id v4 = v6;
  [v3 queryMetaDataWithError:v5];
}

void sub_100007AB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = sub_1000045D4();
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [*(id *)(a1 + 32) succeedWithResult:*(void *)(a1 + 40)];
  }

  else if (v5)
  {
    [*(id *)(a1 + 32) failWithError:v5];
  }

  else
  {
    v15[0] = @"Assets query failed.";
    v14[0] = NSLocalizedDescriptionKey;
    v14[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v8 = MAStringForMAQueryResult(a2);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)v9;
    int v11 = &stru_100010C88;
    if (v9) {
      int v11 = (const __CFString *)v9;
    }
    v15[1] = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAssetError.Query",  a2,  v12));
    [v7 failWithError:v13];
  }
}

void sub_100007C04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___MADownloadOptions);
  id v5 = v4;
  if (*(_BYTE *)(a1 + 40))
  {
    [v4 setAllowsCellularAccess:1];
    [v5 setDiscretionary:0];
    [v5 setAllowsExpensiveAccess:1];
    [v5 setRequiresPowerPluggedIn:0];
  }

  int v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007CDC;
  v8[3] = &unk_100010748;
  id v9 = v3;
  id v7 = v3;
  [v6 startDownload:v5 completionWithError:v8];
}

void sub_100007CDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (sub_100004620(a2))
  {
    int v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    [v6 succeedWithResult:v7];
  }

  else
  {
    if (sub_1000046B8(a2))
    {
      id v8 = sub_10000B7B0();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10000C138(a2, (uint64_t)v5, v9);
      }
    }

    id v10 = *(void **)(a1 + 32);
    if (v5)
    {
      [v10 failWithError:v5];
    }

    else
    {
      v18[0] = @"Asset download failed.";
      v17[0] = NSLocalizedDescriptionKey;
      v17[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v11 = MAStringForMADownloadResult(a2);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = (void *)v12;
      uint64_t v14 = &stru_100010C88;
      if (v12) {
        uint64_t v14 = (const __CFString *)v12;
      }
      v18[1] = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAssetError.Download",  a2,  v15));
      [v10 failWithError:v16];
    }
  }
}

id *sub_100007E88(id *result, uint64_t a2)
{
  if (!a2)
  {
    id v2 = result;
    id v3 = sub_10000B7B0();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000C1CC();
    }

    return (id *)[v2[4] cancelDownload:&stru_1000107B0];
  }

  return result;
}

void sub_100007EE4(id a1, int64_t a2)
{
  id v3 = sub_10000B7B0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = MAStringForMACancelDownloadResult(a2);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 134218242;
      int64_t v9 = a2;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Asset download cancellation failed with error [%ld: %{public}@]",  (uint8_t *)&v8,  0x16u);
    }
  }

  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Asset download cancelled.", (uint8_t *)&v8, 2u);
  }
}

void sub_100007FE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___MADownloadOptions);
  BOOL v5 = v4;
  if (*(_BYTE *)(a1 + 32))
  {
    [v4 setAllowsCellularAccess:1];
    [v5 setDiscretionary:0];
    [v5 setAllowsExpensiveAccess:1];
    [v5 setRequiresPowerPluggedIn:0];
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000080C8;
  v7[3] = &unk_100010748;
  id v8 = v3;
  id v6 = v3;
  +[MAAsset startCatalogDownload:options:completionWithError:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:completionWithError:",  @"com.apple.MobileAsset.GameController.DB1",  v5,  v7);
}

void sub_1000080C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (sub_100004620(a2))
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    [v6 succeedWithResult:v7];
  }

  else
  {
    if (sub_1000046B8(a2))
    {
      id v8 = sub_10000B7B0();
      int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000C1F8(a2, (uint64_t)v5, v9);
      }
    }

    __int16 v10 = *(void **)(a1 + 32);
    if (v5)
    {
      [v10 failWithError:v5];
    }

    else
    {
      v18[0] = @"Asset catalog download failed.";
      v17[0] = NSLocalizedDescriptionKey;
      v17[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v11 = MAStringForMADownloadResult(a2);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = (void *)v12;
      uint64_t v14 = &stru_100010C88;
      if (v12) {
        uint64_t v14 = (const __CFString *)v12;
      }
      v18[1] = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAssetError.Download",  a2,  v15));
      [v10 failWithError:v16];
    }
  }
}

void sub_100008274(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    __int16 v10 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v11 = WeakRetained;
      objc_sync_enter(v11);
      uint64_t v12 = (void *)v11[4];
      v11[4] = 0LL;

      objc_sync_exit(v11);
    }
  }

  else
  {
    id v13 = sub_10000B7B0();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000C28C();
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_1000083AC;
    v15[3] = &unk_100010820;
    objc_copyWeak(&v16, (id *)(a1 + 32));
    +[MAAsset cancelCatalogDownload:then:]( &OBJC_CLASS___MAAsset,  "cancelCatalogDownload:then:",  @"com.apple.MobileAsset.GameController.DB1",  v15);
    objc_destroyWeak(&v16);
  }
}

void sub_100008398(_Unwind_Exception *a1)
{
}

void sub_1000083AC(uint64_t a1, uint64_t a2)
{
  id v4 = sub_10000B7B0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = MAStringForMACancelDownloadResult(a2);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      int v13 = 134218242;
      uint64_t v14 = a2;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Catalog download cancellation failed with error [%ld: %{public}@]",  (uint8_t *)&v13,  0x16u);
    }
  }

  else if (v6)
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Catalog download cancelled.", (uint8_t *)&v13, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained;
    objc_sync_enter(v11);
    uint64_t v12 = (void *)v11[4];
    v11[4] = 0LL;

    objc_sync_exit(v11);
  }
}

void sub_100008544( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008554( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008564(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000085C8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000085D4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000085E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_1000086E4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___GameControllerConfigService);
  id v2 = (void *)qword_100015708;
  qword_100015708 = (uint64_t)v1;
}

id sub_100008790(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)v1[2];
    if (!v2)
    {
      id v3 = -[_GCConfigurationMobileAssetManager initWithProvider:]( objc_alloc(&OBJC_CLASS____GCConfigurationMobileAssetManager),  "initWithProvider:",  v1);
      id v4 = (void *)v1[2];
      v1[2] = v3;

      id v2 = (void *)v1[2];
    }

    id v5 = v2;
    objc_sync_exit(v1);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_100008814(_Unwind_Exception *a1)
{
}

void sub_100008AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

uint64_t sub_100008B04(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    if (sub_100008E04(a1, a2))
    {
      id v29 = 0LL;
      id v4 = sub_100008F54((void *)v2, &v29);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      id v6 = v29;
      id v7 = v6;
      if (v5 || !v6)
      {
        if (v5)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GCVersion currentSourceVersion](&OBJC_CLASS___GCVersion, "currentSourceVersion"));
          unsigned int v9 = [v5 isGreaterThanSourceVersion:v8];

          if (v9)
          {
            if (a2)
            {
              v33[0] = @"Asset is incompatible with host.";
              v32[0] = NSLocalizedDescriptionKey;
              v32[1] = NSLocalizedFailureReasonErrorKey;
              __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset requires version '%@'.",  v5));
              v33[1] = v10;
              uint64_t v11 = v33;
              uint64_t v12 = v32;
LABEL_22:
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  2LL));
              id v23 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 6LL, v22);
              *a2 = (id)objc_claimAutoreleasedReturnValue(v23);

              goto LABEL_23;
            }

            goto LABEL_23;
          }
        }

        id v28 = 0LL;
        int v13 = sub_1000091F0((void *)v2, (GCVersion *)&v28);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        id v7 = v28;
        if (!v14
          || (v14,
              v7,
              id v27 = 0LL,
              __int16 v15 = sub_1000094E8((void *)v2, &v27),
              id v16 = v27,
              id v7 = v16,
              !v15)
          && v16)
        {
LABEL_27:
          if (a2)
          {
            uint64_t v2 = 0LL;
            *a2 = v7;
            goto LABEL_25;
          }

          goto LABEL_24;
        }

        id v26 = 0LL;
        id v17 = sub_100009708((void *)v2, &v26);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v18 = v26;
        id v7 = v18;
        if (v5 || !v18)
        {
          if (v5 && sub_100009AB8((uint64_t)&OBJC_CLASS___MAAsset, v5) < 0)
          {
            if (a2)
            {
              v30[0] = NSLocalizedDescriptionKey;
              v30[1] = NSLocalizedFailureReasonErrorKey;
              v31[0] = @"Asset is incompatible with host.";
              __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset does not support the current platform."));
              v31[1] = v10;
              uint64_t v11 = v31;
              uint64_t v12 = v30;
              goto LABEL_22;
            }

LABEL_23:
LABEL_24:
            uint64_t v2 = 0LL;
            goto LABEL_25;
          }

          id v25 = 0LL;
          id v19 = sub_100009B68((void *)v2, &v25);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          id v21 = v25;
          id v7 = v21;
          if (v20 || !v21)
          {

            uint64_t v2 = 1LL;
LABEL_25:

            return v2;
          }

          goto LABEL_27;
        }
      }

      if (a2) {
        *a2 = v7;
      }
      goto LABEL_23;
    }

    return 0LL;
  }

  return v2;
}

id sub_100008E04(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
  id v5 = [v4 isEqualToString:@"com.apple.MobileAsset.GameController.DB1"];

  if (a2 && (v5 & 1) == 0)
  {
    v11[0] = NSLocalizedDescriptionKey;
    v11[1] = NSLocalizedFailureReasonErrorKey;
    v12[0] = @"Invalid asset.";
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset has incorrect type '%@'.",  v6));
    v12[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
    id v9 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 2LL, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v5;
}

GCVersion *sub_100008F54(void *a1, void *a2)
{
  if (!a1) {
    return (GCVersion *)0LL;
  }
  id AssociatedObject = objc_getAssociatedObject(a1, off_100010898);
  id v5 = (GCVersion *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    if (sub_100008E04(a1, a2))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
      id v19 = 0LL;
      id v7 = objc_msgSend( v6,  "gc_requiredObjectForKey:ofClass:error:",  @"_CompatibilityVersion",  objc_opt_class(NSString),  &v19);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = v19;

      if (v8)
      {
        __int16 v10 = -[GCVersion initWithString:](objc_alloc(&OBJC_CLASS___GCVersion), "initWithString:", v8);
        if (v10)
        {
          id v5 = v10;
          objc_setAssociatedObject(a1, off_100010898, v10, (void *)0x303);
LABEL_7:

          return v5;
        }

        if (a2)
        {
          v22[0] = @"Invalid asset format.";
          v21[0] = NSLocalizedDescriptionKey;
          v21[1] = NSLocalizedFailureReasonErrorKey;
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' is not a valid version.",  v8));
          v22[1] = v15;
          v21[2] = @"FailingKeyPath";
          id v20 = @"_CompatibilityVersion";
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL));
          v22[2] = v16;
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
          id v18 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v17);
          *a2 = (id)objc_claimAutoreleasedReturnValue(v18);
        }
      }

      else if (a2)
      {
        v24[0] = @"Invalid asset format.";
        v23[0] = NSLocalizedDescriptionKey;
        v23[1] = NSLocalizedFailureReasonErrorKey;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
        v24[1] = v12;
        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
        id v14 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v13);
        *a2 = (id)objc_claimAutoreleasedReturnValue(v14);
      }

      id v5 = 0LL;
      goto LABEL_7;
    }

    return (GCVersion *)0LL;
  }

  return v5;
}

GCVersion *sub_1000091F0(void *a1, GCVersion *a2)
{
  if (!a1) {
    return (GCVersion *)0LL;
  }
  id AssociatedObject = objc_getAssociatedObject(a1, off_1000108A0);
  id v5 = (GCVersion *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    if (sub_100008E04(a1, a2))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
      id v23 = 0LL;
      id v7 = objc_msgSend( v6,  "gc_requiredObjectForKey:ofClass:error:",  @"_ContentVersion",  objc_opt_class(NSString),  &v23);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = v23;

      if (v8)
      {
        __int16 v10 = -[GCVersion initWithString:](objc_alloc(&OBJC_CLASS___GCVersion), "initWithString:", v8);
        if (v10)
        {
          id v5 = v10;
          objc_setAssociatedObject(a1, off_1000108A0, v10, (void *)0x303);
LABEL_7:

          return v5;
        }

        if (a2)
        {
          v26[0] = @"Invalid asset format.";
          v25[0] = NSLocalizedDescriptionKey;
          v25[1] = NSLocalizedFailureReasonErrorKey;
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' is not a valid version.",  v8));
          v26[1] = v14;
          v25[2] = @"FailingKeyPath";
          uint64_t v24 = @"_ContentVersion";
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
          v26[2] = v15;
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
          id v17 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v16);
          *(void *)a2 = (id)objc_claimAutoreleasedReturnValue(v17);
        }
      }

      else
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
        int v13 = v12;
        if (v12 == (void *)GC_NSCollectionErrorDomain)
        {
          id v18 = [v9 code];

          if (v18 == (id)3)
          {
            id v19 = sub_10000A0F4(a1, a2);
            id v5 = (GCVersion *)objc_claimAutoreleasedReturnValue(v19);
            goto LABEL_7;
          }
        }

        else
        {
        }

        if (a2)
        {
          v28[0] = @"Invalid asset format.";
          v27[0] = NSLocalizedDescriptionKey;
          v27[1] = NSLocalizedFailureReasonErrorKey;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
          v28[1] = v20;
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
          id v22 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v21);
          *(void *)a2 = (id)objc_claimAutoreleasedReturnValue(v22);
        }
      }

      id v5 = 0LL;
      goto LABEL_7;
    }

    return (GCVersion *)0LL;
  }

  return v5;
}

void *sub_1000094E8(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
  id v15 = 0LL;
  id v5 = objc_msgSend( v4,  "gc_requiredObjectForKey:ofClass:error:",  @"_ContentRevision",  objc_opt_class(NSNumber),  &v15);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v15;

  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0LL;
  }
  if (!v8)
  {
    if (!v2) {
      goto LABEL_13;
    }
    v19[0] = @"Invalid asset format.";
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedFailureReason]);
    v19[1] = v12;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
    id v14 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v13);
    *uint64_t v2 = (id)objc_claimAutoreleasedReturnValue(v14);

    goto LABEL_12;
  }

  if (((unint64_t)[v6 integerValue] & 0x8000000000000000) != 0)
  {
    if (v2)
    {
      v16[0] = NSLocalizedDescriptionKey;
      v16[1] = NSLocalizedFailureReasonErrorKey;
      v17[0] = @"Invalid asset format.";
      v17[1] = @"Negative values are not permitted.";
      v16[2] = @"FailingKeyPath";
      void v17[2] = @"_ContentRevision";
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
      id v10 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v9);
      *uint64_t v2 = (id)objc_claimAutoreleasedReturnValue(v10);

LABEL_12:
      uint64_t v2 = 0LL;
    }
  }

  else
  {
    uint64_t v2 = [v6 integerValue];
  }

LABEL_13:
  return v2;
}

id sub_100009708(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id AssociatedObject = objc_getAssociatedObject(a1, off_1000108A8);
  id v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    if (sub_100008E04(a1, a2))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
      id v31 = 0LL;
      id v7 = objc_msgSend( v6,  "gc_objectForKey:ofClass:error:",  @"Platforms",  objc_opt_class(NSDictionary),  &v31);
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = v31;

      if (!v8 && v9)
      {
        if (a2)
        {
          v35[0] = @"Invalid asset format.";
          v34[0] = NSLocalizedDescriptionKey;
          v34[1] = NSLocalizedFailureReasonErrorKey;
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
          v35[1] = v21;
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
          id v23 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v22);
          *a2 = (id)objc_claimAutoreleasedReturnValue(v23);
        }
      }

      else
      {
        if (!v8)
        {
LABEL_9:
          objc_setAssociatedObject(a1, off_1000108A8, v8, (void *)0x303);
          id v5 = v8;
LABEL_18:

          return v5;
        }

        v29[0] = 0LL;
        v29[1] = v29;
        v29[2] = 0x3032000000LL;
        v29[3] = sub_10000A508;
        v29[4] = sub_10000A518;
        id v30 = 0LL;
        uint64_t v25 = 0LL;
        id v26 = &v25;
        uint64_t v27 = 0x2020000000LL;
        uint64_t v28 = 0LL;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        void v24[2] = sub_10000A520;
        v24[3] = &unk_1000108C0;
        v24[4] = v29;
        v24[5] = &v25;
        objc_msgSend(v8, "gc_enumerateKeysAndObjectsUsingBlock:", v24);
        id v10 = (id)v26[3];
        if (v10 == [v8 count])
        {
          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(v29, 8);

          goto LABEL_9;
        }

        if (a2)
        {
          v33[0] = @"Invalid asset format.";
          v32[0] = NSLocalizedDescriptionKey;
          v32[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
          uint64_t v12 = (void *)v11;
          int v13 = &stru_100010C88;
          if (v11) {
            int v13 = (const __CFString *)v11;
          }
          v33[1] = v13;
          void v32[2] = @"FailingKeyPath";
          id v14 = sub_10000B8F4(v9);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          id v16 = v15;
          if (!v15) {
            id v15 = &__NSArray0__struct;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 arrayByAddingObject:@"Platforms"]);
          void v33[2] = v17;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
          id v19 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v18);
          *a2 = (id)objc_claimAutoreleasedReturnValue(v19);
        }

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(v29, 8);
      }

      id v5 = 0LL;
      goto LABEL_18;
    }

    return 0LL;
  }

  return v5;
}

void sub_100009A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"tvos"]);
    if (v4)
    {
      id v5 = v4;
      BOOL v6 = [v4 BOOLValue] == 0;
      uint64_t v7 = 3LL;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"embeddedos"]);
      id v5 = v9;
      if (!v9)
      {
        uint64_t v8 = -1LL;
LABEL_10:

        goto LABEL_11;
      }

      BOOL v6 = [v9 BOOLValue] == 0;
      uint64_t v7 = 2LL;
    }

    if (v6) {
      uint64_t v8 = -v7;
    }
    else {
      uint64_t v8 = v7;
    }
    goto LABEL_10;
  }

  uint64_t v8 = 0LL;
LABEL_11:

  return v8;
}

id sub_100009B68(void *a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id AssociatedObject = objc_getAssociatedObject(a1, &off_1000108B0);
  id v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    if (sub_100008E04(a1, a2))
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
      id v33 = 0LL;
      id v7 = objc_msgSend( v6,  "gc_objectForKey:ofClass:error:",  @"ConfigurationBundles",  objc_opt_class(NSDictionary),  &v33);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = v33;

      if (!v8 && v9)
      {
        if (a2)
        {
          v37[0] = @"Invalid asset format.";
          v36[0] = NSLocalizedDescriptionKey;
          v36[1] = NSLocalizedFailureReasonErrorKey;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedFailureReason]);
          v37[1] = v19;
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
          id v21 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v20);
          *a2 = (id)objc_claimAutoreleasedReturnValue(v21);
        }
      }

      else
      {
        if (!v8)
        {
LABEL_9:
          objc_setAssociatedObject(a1, &off_1000108B0, v8, (void *)0x303);
          id v5 = v8;
LABEL_16:

          return v5;
        }

        uint64_t v27 = 0LL;
        uint64_t v28 = &v27;
        uint64_t v29 = 0x3032000000LL;
        id v30 = sub_10000A508;
        id v31 = sub_10000A518;
        id v32 = 0LL;
        uint64_t v23 = 0LL;
        uint64_t v24 = &v23;
        uint64_t v25 = 0x2020000000LL;
        uint64_t v26 = 0LL;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10000A734;
        void v22[3] = &unk_100010910;
        v22[4] = &v27;
        v22[5] = &v23;
        objc_msgSend(v8, "gc_enumerateKeysAndObjectsUsingBlock:", v22);
        id v10 = (id)v24[3];
        if (v10 == [v8 count])
        {
          _Block_object_dispose(&v23, 8);
          _Block_object_dispose(&v27, 8);

          goto LABEL_9;
        }

        if (a2)
        {
          v35[0] = @"Invalid asset format.";
          v34[0] = NSLocalizedDescriptionKey;
          v34[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v28[5] localizedFailureReason]);
          v35[1] = v11;
          void v34[2] = @"FailingKeyPath";
          id v12 = sub_10000B8F4((void *)v28[5]);
          int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          id v14 = v13;
          if (!v13) {
            int v13 = &__NSArray0__struct;
          }
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:@"ConfigurationBundles"]);
          void v35[2] = v15;
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
          id v17 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v16);
          *a2 = (id)objc_claimAutoreleasedReturnValue(v17);
        }

        _Block_object_dispose(&v23, 8);
        _Block_object_dispose(&v27, 8);
      }

      id v5 = 0LL;
      goto LABEL_16;
    }

    return 0LL;
  }

  return v5;
}

void sub_100009EE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

GCVersion *sub_10000A0F4(void *a1, GCVersion *a2)
{
  if (!a1) {
    return (GCVersion *)0LL;
  }
  uint64_t v2 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 attributes]);
  id v13 = 0LL;
  id v5 = objc_msgSend( v4,  "gc_requiredObjectForKey:ofClass:error:",  @"_ContentVersion",  objc_opt_class(NSNumber),  &v13);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v13;

  if (!v6)
  {
    if (!v2) {
      goto LABEL_9;
    }
    v17[0] = @"Invalid asset format.";
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedFailureReason]);
    v17[1] = v8;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    id v12 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v11);
    *(void *)uint64_t v2 = (id)objc_claimAutoreleasedReturnValue(v12);

    goto LABEL_8;
  }

  if (((unint64_t)[v6 integerValue] & 0x8000000000000000) != 0)
  {
    if (!v2) {
      goto LABEL_9;
    }
    v14[0] = NSLocalizedDescriptionKey;
    v14[1] = NSLocalizedFailureReasonErrorKey;
    v15[0] = @"Invalid asset format.";
    v15[1] = @"Negative values are not permitted.";
    void v14[2] = @"FailingKeyPath";
    void v15[2] = @"_ContentVersion";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));
    id v9 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v8);
    *(void *)uint64_t v2 = (id)objc_claimAutoreleasedReturnValue(v9);
LABEL_8:

    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  uint64_t v2 = -[GCVersion initWithMajor:minor:patch:]( [GCVersion alloc],  "initWithMajor:minor:patch:",  [v6 unsignedIntegerValue],  0,  0);
  objc_setAssociatedObject(a1, off_1000108A0, v2, (void *)0x303);
LABEL_9:

  return v2;
}

uint64_t sub_10000A508(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A518(uint64_t a1)
{
}

void sub_10000A520(uint64_t a1, uint64_t (**a2)(void, void, void), void *a3, _BYTE *a4)
{
  id v7 = a3;
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((uint64_t (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v12)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v17 = *(id *)(v14 + 40);
    uint64_t v15 = v7[2](v7, v13, &v17);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_storeStrong((id *)(v14 + 40), v17);
    if (v16) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
    else {
      *a4 = 1;
    }
  }

  else
  {
    *a4 = 1;
  }
}

uint64_t sub_10000A63C(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v8 = 0LL;
  id v1 = sub_100009708(a1, &v8);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v8;
  id v4 = v3;
  if (!v2 && v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSException gc_exceptionWithName:error:]( &OBJC_CLASS___NSException,  "gc_exceptionWithName:error:",  NSInvalidArgumentException,  v3));
    objc_exception_throw(v7);
    return 0LL;
  }

  uint64_t v5 = sub_100009AB8((uint64_t)&OBJC_CLASS___MAAsset, v2);

  return v5;
}

void sub_10000A734(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  BOOL v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v40 = *(id *)(v9 + 40);
  uint64_t v10 = v6[2](v6, v8, &v40);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_storeStrong((id *)(v9 + 40), v40);
  if (v11)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = v7[2](v7, v12, &obj);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_storeStrong((id *)(v13 + 40), obj);
    if (v15)
    {
      uint64_t v33 = 0LL;
      id v34 = &v33;
      uint64_t v35 = 0x3032000000LL;
      id v36 = sub_10000A508;
      id v37 = sub_10000A518;
      id v38 = 0LL;
      uint64_t v29 = 0LL;
      id v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      uint64_t v32 = 0LL;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      void v28[2] = sub_10000AA50;
      v28[3] = &unk_1000108E8;
      v28[4] = &v33;
      v28[5] = &v29;
      objc_msgSend(v15, "gc_enumerateObjectsUsingBlock:", v28);
      id v16 = (id)v30[3];
      if (v16 == [v15 count])
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }

      else
      {
        v41[0] = NSLocalizedFailureReasonErrorKey;
        id v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v34[5] localizedFailureReason]);
        v41[1] = @"FailingKeyPath";
        v42[0] = v17;
        id v18 = sub_10000B8F4((void *)v34[5]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = v19;
        if (!v19) {
          id v19 = &__NSArray0__struct;
        }
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 arrayByAddingObject:v11]);
        v42[1] = v21;
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
        id v23 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v22);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        *a4 = 1;
      }

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v33, 8);
    }

    else
    {
      *a4 = 1;
    }
  }

  else
  {
    *a4 = 1;
  }
}

void sub_10000AA24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000AA50(uint64_t a1, uint64_t (**a2)(void, void, void), uint64_t a3, _BYTE *a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((uint64_t (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v12)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    v23[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) localizedFailureReason]);
    v23[1] = @"FailingKeyPath";
    v24[0] = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", a3));
    id v22 = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v24[1] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    id v17 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

void sub_10000ADE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) state]) {
    [*(id *)(a1 + 32) refreshState];
  }
  unint64_t v4 = (unint64_t)[*(id *)(a1 + 32) state];
  if (v4 > 6 || ((1LL << v4) & 0x6C) == 0)
  {
    unint64_t v21 = v4;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

    v59[0] = NSLocalizedDescriptionKey;
    v59[1] = NSLocalizedFailureReasonErrorKey;
    v60[0] = @"Fetch bundle URLS for configuration failed.";
    uint64_t v23 = MAStringForMAAssetState(v21);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset is not installed.  State [%li: %@].",  v21,  v24));
    v60[1] = v25;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
    id v27 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 4LL, v26);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v27);

    [v3 failWithError:v6];
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getLocalFileUrl]);
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v54 = 0LL;
      id v8 = sub_100009B68(v7, &v54);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = v54;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:*(void *)(a1 + 40)]);

      if (!v11 && v10)
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v37 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

        [v3 failWithError:v10];
      }

      else if ([v11 count])
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v48 = 0LL;
        __int16 v49 = &v48;
        uint64_t v50 = 0x3032000000LL;
        id v51 = sub_10000A508;
        id v52 = sub_10000A518;
        id v53 = 0LL;
        uint64_t v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        void v42[2] = sub_10000B38C;
        v42[3] = &unk_100010938;
        id v43 = v6;
        uint64_t v47 = &v48;
        id v14 = v12;
        uint64_t v15 = *(void *)(a1 + 32);
        id v44 = v14;
        uint64_t v45 = v15;
        id v16 = v13;
        id v46 = v16;
        [v11 enumerateObjectsUsingBlock:v42];
        if (-[NSMutableArray count](v16, "count") || (uint64_t v28 = (void *)v49[5]) == 0LL)
        {
          id v17 = -[NSMutableArray copy](v16, "copy");
          [v3 succeedWithResult:v17];
        }

        else
        {
          id v38 = [v28 code];
          v55[0] = NSLocalizedDescriptionKey;
          id v41 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)v49[5] localizedDescription]);
          uint64_t v29 = v41;
          if (!v41) {
            uint64_t v29 = &stru_100010C88;
          }
          v56[0] = v29;
          v55[1] = NSLocalizedFailureReasonErrorKey;
          id v40 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)v49[5] localizedFailureReason]);
          id v30 = v40;
          if (!v40) {
            id v30 = &stru_100010C88;
          }
          v56[1] = v30;
          v55[2] = @"FailingKeyPath";
          id v31 = sub_10000B8F4((void *)v49[5]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          uint64_t v33 = v32;
          if (!v32) {
            uint64_t v32 = &__NSArray0__struct;
          }
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v32 arrayByAddingObject:*(void *)(a1 + 40)]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v39 arrayByAddingObject:@"ConfigurationBundles"]);
          v56[2] = v34;
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
          id v36 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, (uint64_t)v38, v35);
          id v17 = (id)objc_claimAutoreleasedReturnValue(v36);

          [v3 failWithError:v17];
        }

        _Block_object_dispose(&v48, 8);
      }

      else
      {
        [v3 succeedWithResult:&__NSArray0__struct];
      }
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v18 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

      v57[0] = NSLocalizedDescriptionKey;
      v57[1] = NSLocalizedFailureReasonErrorKey;
      v58[0] = @"Fetch bundle URLS for configuration failed.";
      v58[1] = @"Asset data is missing.";
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));
      id v20 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 5LL, v19);
      id v10 = (id)objc_claimAutoreleasedReturnValue(v20);

      [v3 failWithError:v10];
    }
  }
}

void sub_10000B368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000B38C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URLByAppendingPathComponent:v5]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByStandardizingPath]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByStandardizingPath]);

  if (!v8 || ([v8 hasPrefix:v10] & 1) == 0)
  {
    v35[0] = @"Invalid asset format.";
    v34[0] = NSLocalizedDescriptionKey;
    v34[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid path '%@' -> '%@'.",  v5,  v8));
    v35[1] = v13;
    void v35[2] = v8;
    void v34[2] = NSFilePathErrorKey;
    void v34[3] = @"FailingKeyPath";
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%lu]", a3));
    uint64_t v33 = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    v34[4] = @"AssetDataPath";
    void v35[3] = v15;
    v35[4] = v10;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  5LL));
    id v17 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_6:
    goto LABEL_7;
  }

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  LOBYTE(v11) = [v11 fileExistsAtPath:v12];

  if ((v11 & 1) == 0)
  {
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 48)];

    v32[0] = @"Invalid asset format.";
    v31[0] = NSLocalizedDescriptionKey;
    v31[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No configuration bundle at path '%@' -> '%@'.",  v5,  v8));
    v32[1] = v13;
    void v31[2] = NSFilePathErrorKey;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    void v32[2] = v22;
    v31[3] = @"FailingKeyPath";
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[%lu]", a3));
    id v30 = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    v31[4] = @"AssetDataPath";
    void v32[3] = v24;
    v32[4] = v10;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  5LL));
    id v26 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 3LL, v25);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    goto LABEL_6;
  }

  [*(id *)(a1 + 56) addObject:v6];
LABEL_7:
}

os_log_t sub_10000B720(char *category)
{
  return os_log_create("com.apple.gamecontroller.mobileasset", category);
}

id sub_10000B740()
{
  if (qword_100015720 != -1) {
    dispatch_once(&qword_100015720, &stru_1000109B0);
  }
  return (id)qword_100015718;
}

void sub_10000B780(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.mobileasset", "Common");
  uint64_t v2 = (void *)qword_100015718;
  qword_100015718 = (uint64_t)v1;
}

id sub_10000B7B0()
{
  if (qword_100015730 != -1) {
    dispatch_once(&qword_100015730, &stru_1000109D0);
  }
  return (id)qword_100015728;
}

void sub_10000B7F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.mobileasset", "DB");
  uint64_t v2 = (void *)qword_100015728;
  qword_100015728 = (uint64_t)v1;
}

id sub_10000B820()
{
  if (qword_100015740 != -1) {
    dispatch_once(&qword_100015740, &stru_1000109F0);
  }
  return (id)qword_100015738;
}

void sub_10000B860(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.mobileasset", "DB.Update");
  uint64_t v2 = (void *)qword_100015738;
  qword_100015738 = (uint64_t)v1;
}

id sub_10000B890(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_self(a1);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"GCMobileAssetError",  a2,  v5));

  return v6;
}

id sub_10000B8F4(void *a1)
{
  if (a1)
  {
    os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 userInfo]);
    id v2 = objc_msgSend( v1,  "gc_objectForKey:ofClass:error:",  @"FailingKeyPath",  objc_opt_class(NSArray),  0);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_10000B958()
{
}

void sub_10000B984()
{
}

void sub_10000B9B0()
{
}

void sub_10000BA10()
{
}

void sub_10000BA74(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 assetId]);
  sub_100008570();
  sub_100008564((void *)&_mh_execute_header, a2, v4, "Failed to refresh state of downloaded asset '%{public}@'.", v5);

  sub_1000085BC();
}

void sub_10000BAF8(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
  sub_100008608();
  sub_1000085D4( (void *)&_mh_execute_header,  v2,  v3,  "Download asset '%{public}@' failed with a transient error: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100008620();
}

void sub_10000BB7C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetId]);
  sub_100008608();
  sub_1000085D4( (void *)&_mh_execute_header,  v2,  v3,  "Download asset '%{public}@' failed: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100008620();
}

void sub_10000BC00()
{
}

void sub_10000BC38(void *a1, os_log_s *a2)
{
}

void sub_10000BCAC()
{
}

void sub_10000BCD8()
{
}

void sub_10000BD3C()
{
}

void sub_10000BD68()
{
}

void sub_10000BD94()
{
}

void sub_10000BDF4()
{
}

void sub_10000BE20()
{
}

void sub_10000BE80()
{
}

void sub_10000BEE0()
{
}

void sub_10000BF0C()
{
}

void sub_10000BF6C()
{
}

void sub_10000BFCC()
{
}

void sub_10000BFF8()
{
}

void sub_10000C058()
{
}

void sub_10000C0B8(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = MAStringForMAQueryReturnTypes();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100008570();
  sub_1000085C8((void *)&_mh_execute_header, a2, v5, "Query assets - types:%{public}@", v6);

  sub_1000085BC();
}

void sub_10000C138(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = MAStringForMADownloadResult();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100008598();
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Asset download failed with an error that needs investigation [%ld: %{public}@] %@.",  v6,  0x20u);

  sub_1000085F8();
}

void sub_10000C1CC()
{
}

void sub_10000C1F8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = MAStringForMADownloadResult(a1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100008598();
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Asset catalog download failed with an error that needs investigation [%ld: %{public}@] %@.",  v6,  0x20u);

  sub_1000085F8();
}

void sub_10000C28C()
{
}

void sub_10000C2B8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = "com.apple.private.gamecontroller.config.client";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Rejecting connection %@.  Client is missing the '%{public}s' entitlement.",  (uint8_t *)&v2,  0x16u);
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}