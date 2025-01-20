id sub_1000034D8(void *a1)
{
  id v1;
  void *v2;
  id v3;
  unsigned __int8 *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  void *v8;
  id v9;
  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v3 = v1;
  v4 = (unsigned __int8 *)[v3 bytes];
  v5 = (char *)[v3 length];
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = *v4++;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c",  a0123456789abcd[(unint64_t)v7 >> 4],  a0123456789abcd[v7 & 0xF]));
      [v2 appendString:v8];

      --v6;
    }

    while (v6);
  }

  v9 = [v2 copy];

  return v9;
}

id sub_1000035C0(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if ([v1 length])
  {
    unint64_t v3 = 0LL;
    do
    {
      unint64_t v4 = v3 + 1;
      unsigned __int8 v5 = [v1 characterAtIndex:v3];
      if (v5 > 0x24u || ((1LL << v5) & 0x1100000400LL) == 0)
      {
        char v7 = v5 - 48;
        if ((v5 - 48) >= 0xAu
          && (v5 - 65 > 0x25 || ((1LL << (v5 - 65)) & 0x3F0000003FLL) == 0))
        {

          v2 = 0LL;
          break;
        }

        if (v5 - 48 >= 0xA)
        {
          if (v5 - 97 > 5)
          {
            else {
              char v7 = v5 - 55;
            }
          }

          else
          {
            char v7 = v5 - 87;
          }
        }

        unint64_t v8 = v3 + 2;
        unsigned int v9 = [v1 characterAtIndex:v4];
        unsigned int v10 = v9 - 48;
        if (v9 - 65 <= 5) {
          char v11 = v9 - 55;
        }
        else {
          char v11 = 0;
        }
        if (v9 - 97 <= 5) {
          char v12 = v9 - 87;
        }
        else {
          char v12 = v11;
        }
        if (v10 > 9) {
          LOBYTE(v10) = v12;
        }
        char v15 = v10 | (16 * v7);
        [v2 appendBytes:&v15 length:1];
        unint64_t v4 = v8;
      }

      unint64_t v3 = v4;
    }

    while (v4 < (unint64_t)[v1 length]);
  }

  id v13 = [v2 copy];

  return v13;
}

void sub_100003D60(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "PING: Received payload for PING; creating PONG response. error=%{public}@",
      (uint8_t *)&buf,
      0xCu);
  }

  if (!v3)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v10 = 0x3032000000LL;
    char v11 = sub_100003F18;
    char v12 = sub_100003F28;
    id v13 = -[UAPingUserActivityInfo initFromPing:]( objc_alloc(&OBJC_CLASS___UAPingUserActivityInfo),  "initFromPing:",  *(void *)(a1 + 32));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100003F30;
    v8[3] = &unk_1000BCC08;
    v8[4] = *(void *)(a1 + 40);
    v8[5] = &buf;
    [*(id *)(*((void *)&buf + 1) + 40) setWasContinuedBlock:v8];
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pongItems]);
    [v6 addObject:*(void *)(*((void *)&buf + 1) + 40)];

    char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) manager]);
    [v7 scheduleUpdatingAdvertisableItems];

    _Block_object_dispose(&buf, 8);
  }
}

void sub_100003EF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100003F18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003F28(uint64_t a1)
{
}

void sub_100003F30(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) uuid]);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v10 = 138543619;
    char v11 = v5;
    __int16 v12 = 2113;
    uint64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "PING: Removing pong item %{public}@/%{private}@ because it was continued ",  (uint8_t *)&v10,  0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPongCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "pongCount") + 1);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pongItems]);
  [v7 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;
}

void sub_100004F5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

void sub_100005108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_t v5 = sub_100039584(0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    uint64_t v8 = (void *)IOPMCopyUserActivityLevelDescription(a3);
    unsigned int v9 = *(void **)(a1 + 32);
    id v10 = v8;
    unsigned int v11 = [v9 active];
    __int16 v12 = "";
    if (v11) {
      uint64_t v13 = "wasActive";
    }
    else {
      uint64_t v13 = "";
    }
    uint64_t v14 = *(void *)(a1 + 32);

    *(_DWORD *)__int128 buf = 138544386;
    v29 = v7;
    __int16 v30 = 2114;
    v31 = (const char *)v8;
    __int16 v32 = 2082;
    v33 = v13;
    __int16 v34 = 2082;
    v35 = v12;
    __int16 v36 = 2050;
    uint64_t v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "IdleTracker: %{public}@: mostSignificantLevel=%{public}@ %{public}s%{public}s weakSelf=%{public}p",  buf,  0x34u);
  }

  char v15 = *(void **)(a1 + 32);
  if (v15)
  {
    unsigned int v16 = [v15 active];
    [*(id *)(a1 + 32) setActive:a3 == 1];
    if ([*(id *)(a1 + 32) enabled])
    {
      if (([*(id *)(a1 + 32) firstTime] & 1) != 0
        || v16 != [*(id *)(a1 + 32) active])
      {
        os_log_t v17 = sub_100039584(0LL);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
          else {
            v20 = "-";
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startTime]);
          [v21 timeIntervalSinceNow];
          id v23 = sub_100075B60(-v22);
          v24 = (char *)objc_claimAutoreleasedReturnValue(v23);
          *(_DWORD *)__int128 buf = 138543874;
          v29 = v19;
          __int16 v30 = 2082;
          v31 = v20;
          __int16 v32 = 2114;
          v33 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "IdleTracker: %{public}@, callingBlock, %{public}s, interval=%{public}@",  buf,  0x20u);
        }

        [*(id *)(a1 + 32) setFirstTime:0];
        v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000543C;
        block[3] = &unk_1000BCC58;
        id v27 = *(id *)(a1 + 32);
        dispatch_async(v25, block);
      }
    }
  }
}

void sub_10000543C(uint64_t a1)
{
  os_log_t v2 = (void (**)(id, id))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) block]);
  v2[2](v2, [*(id *)(a1 + 32) active]);
}

void sub_1000054E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000055EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000056BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100005778( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100005B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005ED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

LABEL_25:
    v45 = objc_opt_class(&OBJC_CLASS___SFPeerDevice);
    v46 = sub_100006B98(v45, v86, v85, 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v47 = objc_alloc(&OBJC_CLASS___UASimulatorSuggestedItem);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorReceiver simulator](self, "simulator"));
    v49 = -[UASimulatorSuggestedItem initWithUserActivityInfo:peerDevice:simulator:]( v47,  "initWithUserActivityInfo:peerDevice:simulator:",  v13,  v83,  v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v88));
    -[UASimulatorSuggestedItem setWhen:](v49, "setWhen:", v50);

    v51 = sub_100039584(0LL);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](v49, "uuid"));
      v54 = (char *)objc_claimAutoreleasedReturnValue([v53 UUIDString]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 UUIDString]);
      *(_DWORD *)__int128 buf = 138543618;
      v92 = v54;
      v93 = 2114;
      v94 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Item %{public}@ seems to be different from %{public}@, so changing received item & updating lists.",  buf,  0x16u);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue([v13 teamIdentifier]);
      if (v58) {
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 teamIdentifier]);
      }
      else {
        v59 = &stru_1000BE738;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue([v13 activityType]);
      v84 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v59,  v60,  v83));

      if (v58) {
      v61 = sub_100039584(0LL);
      }
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138477827;
        v92 = v84;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Looking for %{private}@",  buf,  0xCu);
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v57 applicationForUserActivityType:v84]);
      if (v63
        || (v75 = (void *)objc_claimAutoreleasedReturnValue([v13 activityType]),
            v76 = [v75 isEqual:NSUserActivityTypeBrowsingWeb],
            v75,
            v76)
        && (v77 = sub_10005C524(), (v63 = (void *)objc_claimAutoreleasedReturnValue(v77)) != 0LL))
      {
        v64 = sub_100039584(0LL);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
          v67 = (char *)objc_claimAutoreleasedReturnValue([v66 UUIDString]);
          v68 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleIdentifier]);
          *(_DWORD *)__int128 buf = 138543875;
          v92 = v67;
          v93 = 2113;
          v94 = v13;
          v95 = 2113;
          v96 = v68;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Found bundle ID for item %{public}@/%{private}@, %{private}@",  buf,  0x20u);
        }

        v69 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleIdentifier]);
        -[UASimulatorSuggestedItem setBundleIdentifier:](v49, "setBundleIdentifier:", v69);
      }

      else
      {
        v78 = sub_100039584(0LL);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
        {
          v79 = (char *)objc_claimAutoreleasedReturnValue([v13 teamIdentifier]);
          v80 = (void *)objc_claimAutoreleasedReturnValue([v13 activityType]);
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](v49, "uuid"));
          v82 = (void *)objc_claimAutoreleasedReturnValue([v81 UUIDString]);
          *(_DWORD *)__int128 buf = 138478339;
          v92 = v79;
          v93 = 2113;
          v94 = v80;
          v95 = 2114;
          v96 = v82;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v63,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Unable to find application to handle typeIdentifier %{private}@:%{private}@ for item %{public}@",  buf,  0x20u);
        }
      }
    }

    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v49));

    goto LABEL_41;
  }

  return 0;
}

            [v15 setSupressUntil:0];
            goto LABEL_26;
          }

          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v15 lastInterestingTime]);
          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue([v15 lastInterestingTime]);
            __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v18 lastInterestingTime]);
            uint64_t v37 = sub_10005B958(v35, v36);

            if (v37)
            {
              v38 = sub_100039584(0LL);
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
                v63 = (void *)objc_claimAutoreleasedReturnValue([v62 UUIDString]);
                v61 = (void *)objc_claimAutoreleasedReturnValue([v15 lastInterestingTime]);
                v39 = sub_1000758E0(v61);
                v64 = (id)objc_claimAutoreleasedReturnValue(v39);
                v60 = (void *)objc_claimAutoreleasedReturnValue([v18 lastInterestingTime]);
                v40 = sub_1000758E0(v60);
                v41 = (id)objc_claimAutoreleasedReturnValue(v40);
                v42 = (void *)objc_claimAutoreleasedReturnValue([v15 lastInterestingTime]);
                v43 = (void *)objc_claimAutoreleasedReturnValue([v18 lastInterestingTime]);
                v44 = (void *)objc_claimAutoreleasedReturnValue([v18 when]);
                v45 = sub_1000758E0(v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
                *(_DWORD *)__int128 buf = v59;
                v74 = v63;
                v75 = 2114;
                v76 = v64;
                v77 = 2114;
                v78 = v41;
                v79 = 2114;
                v80 = v42;
                v81 = 2114;
                v82 = v43;
                v83 = 2114;
                v84 = v46;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Setting .supressedUntil for %{public}@ to nil, because the .lastInterestingTime is earlier th e last update for this item (%{public}@ vs %{public}@ (%{public}@ vs %{public}@), when=%{public}@).",  buf,  0x3Eu);
              }

              goto LABEL_25;
            }
          }
        }

  objc_sync_exit(v3);

  -[UAStreamHandler tryStop](self, "tryStop");
  return v22;
}
    }

    objc_sync_exit(v8);
    goto LABEL_27;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](v8, "currentAdvertisableActivity"));
  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](v8, "currentAdvertisableActivity"));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
    uint64_t v13 = [v12 isEqual:v4];

    if (v13)
    {
      currentAdvertisableActivity = v8->_currentAdvertisableActivity;
      v8->_currentAdvertisableActivity = 0LL;

      if (sub_10005C3C4((uint64_t)[v9 type])
        || ([v9 alwaysEligible] & 1) != 0)
      {
        LODWORD(v10) = 1;
      }

      else
      {
        LODWORD(v10) = [v9 alwaysEligible];
      }
    }

    else
    {
      LODWORD(v10) = 0;
    }
  }

  [v9 setClient:0];
  -[NSMutableDictionary removeObjectForKey:](v8->_userActivityAdvertisableItemsByUUID, "removeObjectForKey:", v4);

  objc_sync_exit(v8);
  if ((_DWORD)v10)
  {
    uint64_t v8 = (UAUserActivityClientProcess *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](v8, "manager"));
    -[UAUserActivityClientProcess scheduleUpdatingAdvertisableItems](v8, "scheduleUpdatingAdvertisableItems");
LABEL_27:
  }

  return v9 != 0LL;
}

void sub_1000068FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_100006B98(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v7 = a2;
  int v8 = a3;
  char v9 = a4;
  id v4 = sub_100006E78((uint64_t)&v7, a1, NSKeyedArchiveRootObjectKey);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100007098((uint64_t)&v7);
  return v5;
}

void sub_100006BF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100006C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100006E78(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_t v5 = a3;
  if (*(void *)a1 && *(_DWORD *)(a1 + 8))
  {
    uint64_t v6 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  *(void *)a1,  *(unsigned int *)(a1 + 8));
    uint64_t v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  0LL);
    int v8 = v7;
    if (v5) {
      char v9 = v5;
    }
    else {
      char v9 = NSKeyedArchiveRootObjectKey;
    }
    if (a2) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver decodeObjectOfClass:forKey:](v7, "decodeObjectOfClass:forKey:", a2, v9));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver decodeObjectForKey:](v7, "decodeObjectForKey:", v9));
    }
    unsigned int v11 = (void *)v10;
    -[NSKeyedUnarchiver finishDecoding](v8, "finishDecoding");
  }

  else
  {
    unsigned int v11 = 0LL;
  }

  return v11;
}

void sub_100006F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007098(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 12))
  {
    if (*(void *)a1)
    {
      vm_size_t v2 = *(unsigned int *)(a1 + 8);
      if ((_DWORD)v2) {
        vm_deallocate(mach_task_self_, *(void *)a1, v2);
      }
    }
  }

  return a1;
}

void sub_1000070E4(void *a1)
{
}

void sub_100007270(_Unwind_Exception *a1)
{
}

void sub_100007560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24)
{
  __int16 v30 = v28;

  _Unwind_Resume(a1);
}

void sub_100007AEC(uint64_t a1)
{
  vm_size_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) update];
  objc_autoreleasePoolPop(v2);
}

void sub_100007B1C(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removing bestAppSuggestion notifier %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  [v7 setConnection:0];
  int v8 = (void *)objc_claimAutoreleasedReturnValue([*v6 manager]);
  [v8 removeActivityNotifier:*v6];
}

void sub_100007C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007C44(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Invalidating bestAppSuggestion notifier",  v5,  2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100007D50( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100007DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000802C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000082E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

LABEL_31:
            goto LABEL_33;
          }
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue([v12 supressUntil]);
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v12 supressUntil]);
          v26 = sub_10005B958(v58, v25);

          if (v26)
          {
            id v27 = sub_100039584(0LL);
            os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue([v9 activityType]);
              v29 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
              __int16 v30 = (id)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
              v31 = (void *)objc_claimAutoreleasedReturnValue([v12 supressUntil]);
              __int16 v32 = sub_1000758E0(v31);
              v33 = (id)objc_claimAutoreleasedReturnValue(v32);
              __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v9 when]);
              v35 = sub_1000758E0(v34);
              __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
              *(_DWORD *)__int128 buf = 138478851;
              v67 = v28;
              v68 = 2114;
              v69 = v30;
              v70 = 2114;
              v71 = v33;
              v72 = 2114;
              v73 = v36;
              v74 = 2114;
              v75 = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "BESTAPP: -- Ignoring supressed item, %{private}@ %{public}@ (until %{public}@, item.when=%{public}@, now=%{public}@)",  buf,  0x34u);

              self = v55;
            }

            goto LABEL_31;
          }
        }
      }

      uint64_t v37 = sub_10005C3C4((uint64_t)[v9 type]);
      if (v59) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v9 when]);
        if (v39)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v9 when]);
          v41 = sub_10005B958(v40, v59);

          if (v41)
          {
            v42 = sub_100039584(0LL);
            os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v43 UUIDString]);
              v45 = (void *)objc_claimAutoreleasedReturnValue([v9 when]);
              *(_DWORD *)__int128 buf = 138544131;
              v67 = v44;
              v68 = 2113;
              v69 = v9;
              v70 = 2114;
              v71 = v45;
              v72 = 2114;
              v73 = v59;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Ignoring item %{public}@/%{private}@ %{public}@, because it is earlier than %{public}@",  buf,  0x2Au);
            }

            goto LABEL_31;
          }
        }
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      if ([v46 activityReceivingAllowed])
      {
      }

      else
      {
        v47 = sub_10005C3C4((uint64_t)[v9 type]);

        if (v47)
        {
          v48 = sub_100039584(0LL);
          os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
            v50 = (void *)objc_claimAutoreleasedReturnValue([v49 UUIDString]);
            *(_DWORD *)__int128 buf = 138543619;
            v67 = v50;
            v68 = 2113;
            v69 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "BESTAPP: -- Ignoring item %{public}@/%{private}@, because it is not a local action",  buf,  0x16u);
          }

          goto LABEL_31;
        }
      }

      [v56 addObject:v9];
LABEL_33:
    }

    uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
  }

  while (v7);
LABEL_35:

  [v56 sortUsingComparator:&stru_1000BCCE8];
  else {
    v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "subarrayWithRange:", 0, 15));
  }
  v52 = v51;

  return v52;
}

  if (objc_msgSend(v10, "count", (void)v25)) {
    id v23 = [v10 copy];
  }
  else {
    id v23 = 0LL;
  }

  return v23;
}
}

void sub_1000089E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
}

int64_t sub_100008BBC(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  id v4 = a2;
  os_log_t v5 = a3;
  if (!sub_10005C3C4((uint64_t)-[UAUserActivityInfo type](v4, "type"))
    && sub_10005C3C4((uint64_t)-[UAUserActivityInfo type](v5, "type"))
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v5, "dynamicActivityType"))) != 0LL
    && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v4, "dynamicActivityType")),
        v7,
        v6,
        !v7))
  {
    int64_t v11 = 1LL;
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](v5, "when"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](v4, "when"));
    BOOL v10 = sub_10005BA4C(v8, v9);

    if (v10) {
      int64_t v11 = 1LL;
    }
    else {
      int64_t v11 = -1LL;
    }
  }

  return v11;
}

void sub_100008CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000093A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, _Unwind_Exception *exception_object, void *a20)
{
  _Unwind_Resume(a1);
}

LABEL_26:
        v47 = (void *)objc_claimAutoreleasedReturnValue([v15 hardSupressUntil]);
        v48 = v47 == 0LL;

        if (!v48)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](v68, "scheduler"));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v15 hardSupressUntil]);
          [v49 scheduleAt:v50];
          goto LABEL_31;
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue([v15 supressUntil]);
        v52 = v51 == 0LL;

        if (!v52)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier scheduler](v68, "scheduler"));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v15 supressUntil]);
          [v49 scheduleAt:v50];
          goto LABEL_31;
        }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleIdentifier", context));
    -[SharingBTLESuggestedItem setBundleIdentifier:](self->fakeBTLEInjectedItem, "setBundleIdentifier:", v37);

    -[SharingBTLESuggestedItem setActivityType:](self->fakeBTLEInjectedItem, "setActivityType:", v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[SFPeerDevice testPeerForModel:](&OBJC_CLASS___SFPeerDevice, "testPeerForModel:", v50));
    -[SharingBTLESuggestedItem setPeerDevice:](self->fakeBTLEInjectedItem, "setPeerDevice:", v38);
    -[SharingBTLESuggestedItem setPayloadRequested:](self->fakeBTLEInjectedItem, "setPayloadRequested:", 1LL);
    -[SharingBTLESuggestedItem setPayloadAvailabilityDelay:]( self->fakeBTLEInjectedItem,  "setPayloadAvailabilityDelay:",  a11);
    v39 = sub_100039584(0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem activityType](self->fakeBTLEInjectedItem, "activityType"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self->fakeBTLEInjectedItem, "uuid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 UUIDString]);
      v44 = sub_1000034D8(v52);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      *(_DWORD *)__int128 buf = 138478595;
      v61 = v41;
      v62 = 2113;
      v63 = v51;
      v64 = 2113;
      v65 = v43;
      v66 = 2113;
      v67 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Injecting fake BTLE item, %{private}@ %{private}@ %{private}@ payload=%{private}@",  buf,  0x2Au);
    }

    v46 = dispatch_time(0LL, (uint64_t)(a11 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100073B30;
    block[3] = &unk_1000BD800;
    void block[4] = self;
    v57 = v51;
    v58 = v52;
    v59 = v49;
    dispatch_after(v46, &_dispatch_main_q, block);
    -[UACornerActionManager setDebugCornerItem:](self->manager, "setDebugCornerItem:", self->fakeBTLEInjectedItem);
    v47 = dispatch_time(0LL, (uint64_t)(a10 * 1000000000.0));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100073BD8;
    v54[3] = &unk_1000BCD38;
    v54[4] = self;
    v55 = v53;
    dispatch_after(v47, &_dispatch_main_q, v54);

    goto LABEL_29;
  }

  __int16 v30 = sub_100039584(0LL);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_DEBUG,  "Injecting nil BTLE item, so removing last item",  buf,  2u);
  }

LABEL_30:
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v68, "supressedUntil"));
        v50 = (void *)objc_claimAutoreleasedReturnValue([v15 itemUUID]);
        [v49 removeObjectForKey:v50];
LABEL_31:
      }

      __int16 v12 = [obj countByEnumeratingWithState:&v69 objects:v85 count:16];
    }

    while (v12);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier supressedUntil](v68, "supressedUntil"));
  v54 = [v53 count];
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier possibleItems](v68, "possibleItems"));
  v56 = v54 < [v55 count];

  if (v56)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier items](v68, "items"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionNotifier bestCornerItemsFromItems:](v68, "bestCornerItemsFromItems:", v57));
    -[UABestAppSuggestionNotifier notifyBestAppsChanged:atTime:](v68, "notifyBestAppsChanged:atTime:", v58, v66);
  }

  else
  {
    -[UABestAppSuggestionNotifier notifyBestAppsChanged:atTime:](v68, "notifyBestAppsChanged:atTime:", 0LL, v66);
  }

  objc_sync_exit(v68);
}

void sub_100009CF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100009F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A0C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A774( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A8B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10000A938( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000AD9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  objc_sync_exit(v12);
  _Unwind_Resume(a1);
}

LABEL_39:
                v47 = v58;
              }

              else
              {
                v49 = 0LL;
              }
            }

            else
            {
              v49 = 0LL;
            }

            v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
            [v57 postNotificationName:_UAUserActivityDidContinueToAppStoreNotification object:0 userInfo:v49];
          }
        }
      }
    }
  }
}

  objc_autoreleasePoolPop(v7);
}

void sub_10000B578( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B708(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"Diagnostic");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    int v9 = 138543619;
    BOOL v10 = v5;
    __int16 v11 = 2113;
    __int16 v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "-- Sumbitting metric info for %{public}@, %{private}@",  (uint8_t *)&v9,  0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
  [v7 submitUserActivityWasContinuedInfo:v8];
}

void sub_10000B83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BD08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BD64(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"signposts");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 32);
  if (v7 + 1 >= 2 && os_signpost_enabled(v5))
  {
    v8[0] = 67240192;
    v8[1] = v3 == 0LL;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "bestAppFetch",  "result=%{public}d enableTelemetry=YES ",  (uint8_t *)v8,  8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000BE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t start(int a1, const char **a2)
{
  context = objc_autoreleasePoolPush();
  os_log_t v4 = objc_alloc_init(&OBJC_CLASS___UACornerActionManager);
  signal(1, (void (__cdecl *)(int))nullsub_6);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (a1 >= 2)
  {
    uint64_t v6 = a2 + 1;
    uint64_t v7 = a1 - 1LL;
    do
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *v6,  4LL));
      [v5 addObject:v8];

      ++v6;
      --v7;
    }

    while (v7);
  }

  uint64_t v40 = 0LL;
  uint64_t v43 = 0LL;
  int v42 = 0;
  int v9 = 1;
  char v41 = 1;
  while (v5)
  {
    if (![v5 count]) {
      goto LABEL_40;
    }
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    else {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:1]);
    }
    if (![v10 caseInsensitiveCompare:@"-noDefaultHandlers"]
      || ![v10 caseInsensitiveCompare:@"-sharingAdvertiser"]
      || ![v10 caseInsensitiveCompare:@"-sharingScanner"]
      || ![v10 caseInsensitiveCompare:@"-activityReceiver"]
      || ![v10 caseInsensitiveCompare:@"-activityAdvertiser"])
    {
      int v9 = 0;
      goto LABEL_29;
    }

    if (![v10 caseInsensitiveCompare:@"-bestAppSuggestionNotifier"])
    {
      int v9 = 0;
      HIDWORD(v43) = 1;
      goto LABEL_29;
    }

    if (![v10 caseInsensitiveCompare:@"-userActivityClientProcessesController"])
    {
      int v9 = 0;
      int v42 = 1;
      goto LABEL_29;
    }

    if (![v10 caseInsensitiveCompare:@"-noSandbox"]) {
      goto LABEL_29;
    }
    if (![v10 caseInsensitiveCompare:@"-noTerminateOnSIGTERM"])
    {
      char v41 = 0;
      goto LABEL_29;
    }

    if (![v10 caseInsensitiveCompare:@"-loggingAdvertiser"])
    {
      BYTE4(v40) = 1;
      goto LABEL_29;
    }

    if ([v10 caseInsensitiveCompare:@"-loopback"]
      && [v10 caseInsensitiveCompare:@"-enableNetworkUserActivity"]
      && [v10 caseInsensitiveCompare:@"-enableCoreSimulator"])
    {
      if (![v10 caseInsensitiveCompare:@"-disableEntitlmentChecking"])
      {
        os_log_t v15 = sub_100039584(0LL);
        LOBYTE(v43) = 1;
        log = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          LOBYTE(v43) = 1;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "disableEntitlmentChecking=YES", buf, 2u);
        }

        uint64_t v14 = log;
        goto LABEL_37;
      }

      if ([v10 caseInsensitiveCompare:@"-disableReconnectionNotification"])
      {
        if (v11 && ![v10 caseInsensitiveCompare:@"-exitAfter"])
        {
          [v11 doubleValue];
          dispatch_time_t v34 = dispatch_time(0LL, (uint64_t)(v12 * 1000000000.0));
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
          loga = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10000C900;
          block[3] = &unk_1000BCCA8;
          v48 = v11;
          dispatch_after(v34, loga, block);

          [v5 removeObjectAtIndex:1];
          uint64_t v14 = v48;
LABEL_37:
        }
      }

      else
      {
        LOBYTE(v40) = 1;
      }
    }

LABEL_29:
    [v5 removeObjectAtIndex:0];
  }

  uint64_t v40 = 0LL;
  uint64_t v43 = 0LL;
  int v9 = 1;
  char v41 = 1;
  int v42 = 0;
LABEL_40:
  _set_user_dir_suffix("com.apple.useractivityd");
  os_log_t v16 = sub_100039584(0LL);
  os_log_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *a2;
    if (!*a2) {
      v18 = "-";
    }
    v35 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    if (a1 >= 2)
    {
      unint64_t v20 = 1LL;
      do
      {
        if (v20 <= 1) {
          v21 = &stru_1000BE738;
        }
        else {
          v21 = @" ";
        }
        [v19 appendFormat:@"%@%s", v21, a2[v20++]];
      }

      while (a1 != v20);
    }

    id v22 = [v19 copy];

    *(_DWORD *)__int128 buf = 136448002;
    v50 = v35;
    __int16 v51 = 2082;
    v52 = "";
    __int16 v53 = 2082;
    v54 = "Nov 10 2024";
    __int16 v55 = 2082;
    v56 = "02:00:54";
    __int16 v57 = 2048;
    uint64_t v58 = 0x4081380000000000LL;
    __int16 v59 = 2082;
    v60 = "Nov 10 2024";
    __int16 v61 = 2082;
    v62 = "02:00:54";
    __int16 v63 = 2114;
    id v64 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s: Starting up, %{public}s %{public}s %{public}s version %g built on %{public}s %{public}s.  args=%{public}@",  buf,  0x52u);
  }

  if ((v43 & 1) != 0)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debugManager](v4, "debugManager"));
    [v23 setDisableAdminEntitlmentChecking:1];
  }

  if ((v40 & 0x100000000LL) != 0)
  {
    v24 = -[UAAdvertiser initWithManager:name:]( objc_alloc(&OBJC_CLASS___UALoggingAdvertiser),  "initWithManager:name:",  v4,  @"Logger");
    -[UACornerActionManager addAdvertiser:](v4, "addAdvertiser:", v24);
  }

  if (((v9 | v42) & 1) != 0)
  {
    v25 = -[UAUserActivityClientProcessesController initWithManager:name:]( objc_alloc(&OBJC_CLASS___UAUserActivityClientProcessesController),  "initWithManager:name:",  v4,  @"AppsActivityCreator");
    -[UACornerActionManager addClient:](v4, "addClient:", v25);
  }

  if (((v9 | HIDWORD(v43)) & 1) != 0)
  {
    v26 = -[UABestAppSuggestionController initWithManager:name:]( objc_alloc(&OBJC_CLASS___UABestAppSuggestionController),  "initWithManager:name:",  v4,  @"BestAppController");
    -[UABestAppSuggestionController setDisableEntitlementsCheck:](v26, "setDisableEntitlementsCheck:", v43 & 1);
    -[UACornerActionManager addHandler:](v4, "addHandler:", v26);
  }

  else
  {
    v26 = 0LL;
  }

  id v27 = -[UAActivityNotifier initWithManager:name:]( objc_alloc(&OBJC_CLASS___UABestAppSuggestionDarwinNotifier),  "initWithManager:name:",  v4,  @"DarwinNotifier");
  -[UACornerActionManager addActivityNotifier:](v4, "addActivityNotifier:", v27);
  if ((v9 & 1) != 0)
  {
    v28 = -[UAPingController initWithManager:name:]( objc_alloc(&OBJC_CLASS___UAPingController),  "initWithManager:name:",  v4,  @"PingController");
    -[UACornerActionManager setPingController:](v4, "setPingController:", v28);
  }

  if ((v41 & 1) != 0)
  {
    v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](v4, "mainDispatchQ"));
    dispatch_source_t v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v29);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000C9A8;
    handler[3] = &unk_1000BCD38;
    v45 = v4;
    dispatch_source_t v46 = v30;
    v31 = v30;
    dispatch_source_set_event_handler(v31, handler);
    dispatch_source_set_cancel_handler(v31, &stru_1000BCD78);
    dispatch_resume(v31);
  }

  -[UACornerActionManager resume](v4, "resume");
  if ((v40 & 1) == 0) {
    notify_post("com.apple.coreservices.useractivity.reconnection");
  }

  objc_autoreleasePoolPop(context);
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v32 run];

  return 0LL;
}

      v28 = self;
      objc_sync_enter(v28);
      v29 = [v10 count];
      if (v29) {
        dispatch_source_t v30 = [v10 copy];
      }
      else {
        dispatch_source_t v30 = 0LL;
      }
      objc_storeStrong((id *)(&v28->super._shouldAdvertiseAutoPullActivityList + 1), v30);
      if (v29) {

      }
      objc_sync_exit(v28);
      v31 = sub_100039584(0LL);
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "ADVERTISING: Scheduling an update to check the advertisement, because we've changed the list of advertised items.",  buf,  2u);
      }

      -[UASharingAdvertiser scheduleAdvertisementUpdate](v28, "scheduleAdvertisementUpdate");
      goto LABEL_37;
    }
  }

  uint64_t v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = *(void **)(&v13->super._shouldAdvertiseAutoPullActivityList + 1);
  *(void *)(&v13->super._shouldAdvertiseAutoPullActivityList + 1) = 0LL;

  objc_sync_exit(v13);
  os_log_t v15 = sub_100039584(0LL);
  os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "--- Scheduling an update to check the advertisement, because we've cleared the list of advertisable items.",  buf,  2u);
  }

  -[UASharingAdvertiser scheduleAdvertisementUpdate](v13, "scheduleAdvertisementUpdate");
LABEL_38:
}

  objc_autoreleasePoolPop(context);
}

void sub_10000C7EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *a28)
{
  _Unwind_Resume(a1);
}

void sub_10000C900(uint64_t a1)
{
  os_log_t v2 = objc_autoreleasePoolPush();
  os_log_t v3 = sub_100039584(0LL);
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) doubleValue];
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "### Auto-exiting after %g seconds; likely crashed during a unit test and want to clean up.",
      (uint8_t *)&v6,
      0xCu);
  }

  exit(0);
}

void sub_10000C990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C9A8(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Received SIGTERM; terminating useractivityd.",
      v4,
      2u);
  }

  [*(id *)(a1 + 32) terminate];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_10000CA68(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardDataManager);
  os_log_t v2 = (void *)qword_1000DE250;
  qword_1000DE250 = (uint64_t)v1;
}

void sub_10000CC14(id a1)
{
  if (confstr(65537, v4, 0x400uLL))
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v4,  4LL));
    uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:@"shared-pasteboard/"]);
    os_log_t v3 = (void *)qword_1000DE260;
    qword_1000DE260 = v2;
  }

void sub_10000E0E0(_Unwind_Exception *a1)
{
}

void sub_10000E220(_Unwind_Exception *a1)
{
}

uint64_t sub_10000E434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_22:
}
}

              continue;
            }
          }
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 348 sharedDefaults]);
        if ([v26 activityReceivingAllowed])
        {
        }

        else
        {
          id v27 = sub_10005C3C4((uint64_t)[v14 type]);

          if (v27)
          {
            v28 = sub_100039584(0LL);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
              dispatch_source_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
              *(_DWORD *)__int128 buf = 138543619;
              uint64_t v40 = v30;
              char v41 = 2113;
              int v42 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "BESTAPP: -- Ignoring item %{public}@/%{private}@, because it is not a local action",  buf,  0x16u);
            }

            goto LABEL_22;
          }
        }

        [v34 addObject:v14];
      }

      __int16 v11 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    }

    while (v11);
  }

  [v34 sortUsingComparator:&stru_1000BDAE0];
  return v34;
}

    -[SharingBTLESuggestedItem setObject:forKey:]( v47,  "setObject:forKey:",  &__kCFBooleanTrue,  @"UAUserActivityAdvertiserHasMoreActivities",  v90);
    if ((a6 & 0x80) == 0)
    {
LABEL_16:
      if ((a6 & 0x20) == 0)
      {
LABEL_18:
        v99 = v18;
        self = v47;
        v48 = -[SharingBTLESuggestedItem copy](v47, "copy", v90);
        -[SharingBTLESuggestedItem setOptions:](v35, "setOptions:", v48);

        -[SharingBTLESuggestedItem setActivityType:](v35, "setActivityType:", v91);
        -[SharingBTLESuggestedItem setBundleIdentifier:](v35, "setBundleIdentifier:", v102);
        -[SharingBTLESuggestedItem setPeerDevice:](v35, "setPeerDevice:", v97);
        v93 = v19;
        if (v17)
        {
          int v42 = v17;
          v49 = [v17 copy];
          -[SharingBTLESuggestedItem setTeamIDs:](v35, "setTeamIDs:", v49);
        }

        else
        {
          int v42 = 0LL;
          -[SharingBTLESuggestedItem setTeamIDs:](v35, "setTeamIDs:", 0LL);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](v35, "advertisementPayload"));
        __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 time]);
        -[SharingBTLESuggestedItem setWhen:](v35, "setWhen:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[SharingBTLESuggestedItem setLastInterestingTime:](v35, "setLastInterestingTime:", v52);

        __int16 v53 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](v35, "advertisementPayload"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 currentUntil]);
        -[SharingBTLESuggestedItem setCurrentUntilDate:](v35, "setCurrentUntilDate:", v54);

        __int16 v55 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem currentUntilDate](v35, "currentUntilDate"));
        v56 = &OBJC_CLASS___NSDate;
        __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        uint64_t v58 = v57;
        if (v55)
        {
          [v57 cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires];
          v60 = v59;
          __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload validUntil](v35->_advertisementPayload, "validUntil"));
          v56 = (objc_class *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v61,  v60));
          -[SharingBTLESuggestedItem setRemoveAfter:](v35, "setRemoveAfter:", v56);
        }

        else
        {
          [v57 cornerActionItemMaximumTimeForBTLEItemToLive];
          __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
          -[SharingBTLESuggestedItem setRemoveAfter:](v35, "setRemoveAfter:", v61);
        }

        v62 = objc_alloc_init(&OBJC_CLASS___UAUserActivityAnalyticsInfo);
        -[SharingBTLESuggestedItem setWasContinuedInfo:](v35, "setWasContinuedInfo:", v62);

        __int16 v63 = [v97 isDefaultPairedDevice];
        id v64 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v64 setFromPairedDevice:v63];

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](v35, "bundleIdentifier"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v66 setBundleIdentifier:v65];

        v67 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem activityType](v35, "activityType"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v68 setActivityType:v67];

        v69 = -[SharingBTLESuggestedItem type](v35, "type");
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v70 setSuggestedActionType:v69];

        v71 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem activityType](v35, "activityType"));
        v72 = [v71 isEqual:@"NSUserActivityTypeBrowsingWeb"];
        if ((v72 & 1) != 0)
        {
          v73 = 1LL;
        }

        else
        {
          v56 = (objc_class *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem webpageURL](v35, "webpageURL"));
          v73 = v56 != 0LL;
        }

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v74 setBrowserFallback:v73];

        if ((v72 & 1) == 0) {
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem peerDevice](v35, "peerDevice"));
        }
        v76 = (void *)objc_claimAutoreleasedReturnValue([v75 modelIdentifier]);
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v77 setRemoteDeviceType:v76];

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](v35, "uuid"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
        [v79 setUuid:v78];

        v80 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem activityType](v35, "activityType"));
        LODWORD(v79) = [v80 isEqual:@"NSUserActivityTypeBrowsingWeb"];

        if ((_DWORD)v79)
        {
          v81 = sub_10005C524();
          v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue([v82 bundleIdentifier]);
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem bundleIdentifier](v35, "bundleIdentifier"));
          v85 = [v83 isEqual:v84];

          if ((v85 & 1) == 0)
          {
            v86 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
            [v86 setWebToNative:1];
          }
        }

        v87 = sub_100039584(@"Diagnostic");
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
        os_log_t v16 = v91;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem wasContinuedInfo](v35, "wasContinuedInfo"));
          *(_DWORD *)__int128 buf = 138477827;
          v105 = v88;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Created wasContinuedInfo for BTLEAd: %{private}@",  buf,  0xCu);
        }

        v19 = v93;
LABEL_41:

        os_log_t v17 = v42;
        v18 = v99;
        goto LABEL_42;
      }

void sub_10000EB6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = 0LL;
  [v4 removeItemAtURL:v3 error:&v13];

  id v5 = v13;
  os_log_t v6 = sub_100039584(@"pasteboard-server");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v15 = v5;
      int v9 = "Error deleting item: %{public}@";
      BOOL v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v12 = *(void **)(a1 + 32);
    *(_DWORD *)__int128 buf = 138543362;
    id v15 = v12;
    int v9 = "Deleted file for item: %{public}@";
    BOOL v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
}

void sub_10000F368(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    os_log_t v6 = *(void **)(a1 + 32);
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting file for item: %@", buf, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = 0LL;
  [v7 removeItemAtURL:v3 error:&v11];

  id v8 = v11;
  if (v8)
  {
    os_log_t v9 = sub_100039584(@"pasteboard-server");
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error deleting item: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10000F7F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v17 = 0LL;
  unsigned int v5 = [v4 removeItemAtURL:v3 error:&v17];

  id v6 = v17;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_log_t v9 = v8;
  if (v5)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    BOOL v10 = *(void **)(a1 + 32);
    *(_DWORD *)__int128 buf = 138477827;
    id v19 = v10;
    id v11 = "Deleted copied item: %{private}@";
    double v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
  }

  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    *(_DWORD *)__int128 buf = 138477827;
    id v19 = v14;
    id v11 = "Failed to delete item: %{private}@";
    double v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
  }

  _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0xCu);
LABEL_7:

  if (v6)
  {
    os_log_t v15 = sub_100039584(@"pasteboard-server");
    os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error deleting item: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10000FC48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, void *a23)
{
}

id sub_10000FFB0()
{
  if (qword_1000DE278 != -1) {
    dispatch_once(&qword_1000DE278, &stru_1000BCE28);
  }
  return (id)qword_1000DE270;
}

void sub_100010408(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  @"/System/Library/CoreServices/SystemVersion.plist"));
  [v3 open];
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v3,  0LL,  0LL,  0LL));
  if (v1)
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0) {
      objc_storeStrong((id *)&qword_1000DE270, v1);
    }
  }

  [v3 close];
}

void sub_10001069C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010A4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000111B4(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "Streams stalled, erroring out the paste operation.",  v12,  2u);
  }

  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -132LL,  0LL));
  unsigned int v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained receivedPasteboardInfo:0 withError:v4];

  id v7 = objc_loadWeakRetained(v5);
  [v7 completedReceivingPasteboardWithError:v4];

  id v8 = objc_loadWeakRetained(v5);
  [v8 sendCompletedWithError:v4];

  id v9 = objc_loadWeakRetained(v5);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 streamHandler]);
  [v10 stop];

  id v11 = objc_loadWeakRetained(v5);
  [v11 setState:8];
}

__CFString *sub_100011488(unint64_t a1)
{
  if (a1 >= 9) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ucStreamState:%d",  a1));
  }
  else {
    return *(&off_1000BCEE0 + a1);
  }
}

void sub_100011544(_Unwind_Exception *a1)
{
}

void sub_1000115C4(_Unwind_Exception *a1)
{
}

__CFString *sub_100011864(unint64_t a1)
{
  if (a1 >= 0xB) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"tag:%d",  a1));
  }
  else {
    return *(&off_1000BCF28 + a1);
  }
}

void sub_100011C54(_Unwind_Exception *a1)
{
}

LABEL_23:
}

    -[SharingBTLESuggestedItem setObject:forKey:]( v47,  "setObject:forKey:",  &__kCFBooleanTrue,  @"UAUserActivityItemIsNotActiveKey",  v90);
    -[SharingBTLESuggestedItem setActive:](v35, "setActive:", 0LL);
    if ((a6 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v40 = v96;
LABEL_42:

  return v35;
}

      v26 = (void *)_LSCreateHashedBytesForAdvertisingFromString(v23, v22);
LABEL_24:
      v29 = sub_100039584(0LL);
      dispatch_source_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = sub_1000034D8(v26);
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)__int128 buf = 134218499;
        *(void *)&uint8_t buf[4] = v23;
        v77 = 2113;
        v78 = v22;
        v79 = 2114;
        v80 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Calculated advertisingBytes for %ld / %{private}@, result=%{public}@",  buf,  0x20u);
      }

      v33 = [v26 copy];
      dispatch_time_t v34 = (void *)*((void *)v18 + 3);
      *((void *)v18 + 3) = 0LL;

      if (!v33) {
        goto LABEL_60;
      }
      if ([v33 length] != (id)7) {
        __assert_rtn( "-[SharingBTLEAdvertisementPayload initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:]",  "SharingAdvertisementPayload.mm",  217,  "[hashedActivityType length] == sizeof( _bytes.hashedAdvertisementBytes)");
      }
      v35 = (int *)[v33 bytes];
      __int16 v36 = *v35;
      *(_DWORD *)(v18 + 11) = *(int *)((char *)v35 + 3);
      *((_DWORD *)v18 + 2) = v36;
      v18[15] = 0;
      if (v21)
      {
        uint64_t v37 = v21;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 scheme]);
        v39 = v38 == 0LL;

        if (v39)
        {
        }

        else
        {
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v37 scheme]);
          if ([v40 compare:@"http" options:1])
          {

LABEL_34:
            v18[15] |= 1u;
            goto LABEL_35;
          }

          char v41 = (void *)objc_claimAutoreleasedReturnValue([v37 scheme]);
          int v42 = [v41 compare:@"https" options:1] == 0;

          if (!v42) {
            goto LABEL_34;
          }
        }
      }

void sub_10001241C(_Unwind_Exception *a1)
{
}

id sub_100012E84(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  [v2 releaseLockForItem:*(void *)(a1 + 32)];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuidItemMap]);
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
  [v3 setObject:0 forKeyedSubscript:v4];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuidItemMap]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  id v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) completedReceivingPasteboardWithError:0];
  }
  return [*(id *)(a1 + 40) removeObject:*(void *)(a1 + 48)];
}

void sub_100013D1C(_Unwind_Exception *a1)
{
}

void sub_100013F04(_Unwind_Exception *a1)
{
}

void sub_1000143FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    os_log_t v4 = sub_100039584(@"pasteboard-server");
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(_DWORD *)(a1 + 32);
      v7[0] = 67109378;
      v7[1] = v6;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error obtaining lock for item %d: %{public}@",  (uint8_t *)v7,  0x12u);
    }
  }
}

void sub_100014F88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, id a44)
{
}

void sub_10001500C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendHeartbeat];
}

void sub_100015038(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) state] == (id)8)
  {
    os_log_t v4 = sub_100039584(@"pasteboard-server");
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Don't do anything with archives after stream is marked done",  (uint8_t *)&v29,  2u);
    }
  }

  else if (a2 < 0)
  {
    os_log_t v26 = sub_100039584(@"pasteboard-server");
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = *(void **)(a1 + 40);
      int v29 = 138412290;
      dispatch_source_t v30 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[CODERV2] Error creating archive for file: %@",  (uint8_t *)&v29,  0xCu);
    }

    [*(id *)(a1 + 32) sendStopWithError:-122];
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readHandleForArchiveWithUUID:*(void *)(a1 + 48)]);

    __int16 v8 = -[UCFilePackager initWithFile:fileSize:packetSize:options:receiver:]( objc_alloc(&OBJC_CLASS___UCFilePackager),  "initWithFile:fileSize:packetSize:options:receiver:",  v7,  a2,  0x10000LL,  &__NSDictionary0__struct,  *(void *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
    -[UCFilePackager setUuid:](v8, "setUuid:", v9);

    -[UCFilePackager setTag:](v8, "setTag:", 8LL);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archiveQueue]);
    objc_sync_enter(v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archivePackagers]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
    [v11 setObject:v8 forKeyedSubscript:v12];

    objc_msgSend(*(id *)(a1 + 32), "setTotalSendSize:", (char *)objc_msgSend(*(id *)(a1 + 32), "totalSendSize") + a2);
    objc_sync_exit(v10);

    os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestedArchives]);
    objc_sync_enter(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestedArchives]);
    os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
    LODWORD(v12) = [v14 containsObject:v15];

    if ((_DWORD)v12)
    {
      -[UCFilePackager deliverNextPacket](v8, "deliverNextPacket");
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestedArchives]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
      [v16 removeObject:v17];
    }

    objc_sync_exit(v13);

    os_log_t v18 = sub_100039584(@"pasteboard-server");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
      int v29 = 138412290;
      dispatch_source_t v30 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[CODERV2] Created packager for archive: %@",  (uint8_t *)&v29,  0xCu);
    }

    if ((*(void *)(a1 + 64) & 0x8000000000000000LL) == 0) {
      sandbox_extension_release();
    }
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 56)];
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objects]);
    BOOL v22 = [v21 count] == 0;

    if (v22)
    {
      os_log_t v23 = sub_100039584(@"pasteboard-server");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) totalSendSize]));
        int v29 = 138412290;
        dispatch_source_t v30 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "[CODERV2] Done archiving all objects, total send size: %@",  (uint8_t *)&v29,  0xCu);
      }

      [*(id *)(a1 + 32) sendTotalSendSize];
    }
  }

void sub_100015444(_Unwind_Exception *a1)
{
}

void sub_100015608(_Unwind_Exception *a1)
{
}

void sub_100015980(_Unwind_Exception *a1)
{
}

void sub_100015BC8(_Unwind_Exception *a1)
{
}

id sub_1000162C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerWatchdog];
}

void sub_1000167CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_14:
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorAdvertiser advertisableItems](v10, "advertisableItems"));
  os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
  -[UASimulatorAdvertiser updateItem:](v10, "updateItem:", v23);

  objc_sync_exit(v10);
}

  sub_100037598((uint64_t)&v21);
  return v14;
}

  return 1;
}

  return v8;
}

    id v7 = (__CFString *)v6;
    goto LABEL_15;
  }

  id v7 = @"(nil)";
LABEL_15:

  return v7;
}

void sub_100016AD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100016BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016F00(_Unwind_Exception *a1)
{
  os_log_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000179B4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___UACornerActionManager);
  os_log_t v2 = (void *)qword_1000DE290;
  qword_1000DE290 = (uint64_t)v1;
}

void sub_100017F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *a28)
{
  _Unwind_Resume(a1);
}

id sub_10001804C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineWhenSystemGoesIdleThread];
}

id sub_100018054(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineItemToAdvertiseForHandoffThread];
}

id sub_10001805C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfBestApplicationChangedThread];
}

id sub_100018064(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateUserActiveState:a2];
}

LABEL_12:
  return (char)v3;
}

  objc_sync_exit(v2);
  return (char)v4;
}

    objc_sync_exit(v5);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

  return v3;
}

  return v3;
}
  }

  return (char)v4;
}

  return -[UASharingAdvertiser pboardBitToAdvertise](self, "pboardBitToAdvertise");
}

void sub_1000181AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001831C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_21:
  return v17;
}

    goto LABEL_22;
  }

  if (-[UASharedPasteboardClientController currentLocalGeneration](self, "currentLocalGeneration") <= a4)
  {
    if (-[UASharedPasteboardClientController currentLocalGeneration](self, "currentLocalGeneration") < a4)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
      [v14 cleanupCloneDir];
    }

    -[UASharedPasteboardClientController setCurrentLocalTypes:](self, "setCurrentLocalTypes:", v6);
    -[UASharedPasteboardClientController setCurrentLocalGeneration:](self, "setCurrentLocalGeneration:", a4);
    -[UASharedPasteboardClientController setHasFetchedLocalData:](self, "setHasFetchedLocalData:", 0LL);
    if (-[UASharedPasteboardClientController localReflection](self, "localReflection"))
    {
      os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 createFileForLocalPasteboardBlob]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fileURLForCloneItems]);

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController clientConnection](self, "clientConnection"));
      unint64_t v20 = v19;
      if (v19) {
        [v19 auditToken];
      }
      else {
        memset(v36, 0, sizeof(v36));
      }
      BOOL v22 = sub_1000248C4(v18, v36);
      os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController clientConnection](self, "clientConnection"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 remoteObjectProxy]);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100025DF8;
      v35[3] = &unk_1000BD378;
      v35[4] = self;
      [v25 writeLocalPasteboardToFile:v16 itemDir:v18 extension:v23 withCompletion:v35];
    }

    -[UASharedPasteboardClientController setAdvertiseTypes:](self, "setAdvertiseTypes:", 1LL);
    os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    [v26 scheduleUpdatingAdvertisableItems];

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
      [v28 invalidate];
    }

    int v29 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [v29 localPasteboardAvalibilityTimeout];
    v31 = v30;

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "clearLocalPasteboardTypes:",  0LL,  0LL,  v31));
    -[UASharedPasteboardClientController setLocalTimeout:](self, "setLocalTimeout:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    dispatch_time_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController localTimeout](self, "localTimeout"));
    [v33 addTimer:v34 forMode:NSRunLoopCommonModes];

    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    -[os_log_s cleanupItemsDir](v10, "cleanupItemsDir");
    goto LABEL_21;
  }

    uint64_t v37 = 0;
    goto LABEL_22;
  }

  double v12 = sub_100039584(@"pasteboard-server");
  os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    v52 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Received new client connection: %@",  buf,  0xCu);
  }

  uint64_t v14 = sub_10003AB58();
  os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[UAAuditToken setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v15);

  -[UAAuditToken setExportedObject:](v7, "setExportedObject:", self);
  os_log_t v16 = sub_10003A968();
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[UAAuditToken setExportedInterface:](v7, "setExportedInterface:", v17);

  -[UAAuditToken setInterruptionHandler:](v7, "setInterruptionHandler:", &stru_1000BD608);
  os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardClientController clientConnection](self, "clientConnection"));
  objc_initWeak((id *)buf, self);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10002BA6C;
  v47[3] = &unk_1000BD630;
  objc_copyWeak(&v49, (id *)buf);
  id v19 = v18;
  v48 = v19;
  -[UAAuditToken setInvalidationHandler:](v7, "setInvalidationHandler:", v47);
  -[UAAuditToken resume](v7, "resume");
  -[UASharedPasteboardClientController setClientConnection:](self, "setClientConnection:", v7);

  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)buf);

LABEL_17:
  uint64_t v37 = 1;
LABEL_22:

  return v37;
}

void sub_100018584( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001863C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100018798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018AB4(_Unwind_Exception *a1)
{
  id v7 = v4;

  _Unwind_Resume(a1);
}

int64_t sub_100018B48(id a1, UAClientController *a2, UAClientController *a3)
{
  os_log_t v4 = a3;
  int64_t v5 = -[UACornerActionManagerHandler priority](a2, "priority");
  id v6 = -[UACornerActionManagerHandler priority](v4, "priority");
  uint64_t v7 = -1LL;
  if ((id)v5 == v6) {
    int64_t v8 = 0LL;
  }
  else {
    int64_t v8 = v7;
  }

  return v8;
}

void sub_100018B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018D94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_44:
              v39 = (void *)objc_claimAutoreleasedReturnValue([v19 activityType]);
              uint64_t v40 = [v39 isEqual:NSUserActivityTypeBrowsingWeb];

              if (v40) {
                char v41 = 1;
              }
              else {
                char v41 = v84;
              }
              LODWORD(v84) = v41;
              goto LABEL_48;
            }
          }

          else
          {
          }
        }

        -[UACornerActionManager setLastTimePayloadWasRequestedForAdvertisedItem:]( self,  "setLastTimePayloadWasRequestedForAdvertisedItem:",  0LL);
        goto LABEL_44;
      }

          id v11 = v68;
          os_log_t v4 = v70;
        }

        os_log_t v16 = v66;
      }

      goto LABEL_47;
    }

    v72.receiver = self;
    v72.super_class = (Class)&OBJC_CLASS___UANetworkReplayController;
    os_log_t v15 = -[UAActivityReplay processCommand:](&v72, "processCommand:", v4);
  }

  else
  {
    os_log_t v16 = v14;
  }

LABEL_48:
      os_log_t v18 = (char *)v18 + 1;
    }

    while (v15 != v18);
    uint64_t v14 = obj;
    dispatch_source_t v46 = [obj countByEnumeratingWithState:&v93 objects:v106 count:16];
    os_log_t v15 = v46;
  }

  while (v46);
LABEL_62:

  v47 = v84 & 1;
  v48 = v85 & 1;
LABEL_63:
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertiseableItems](self, "advertiseableItems", v79));
  v50 = [v49 count];

  lastNumAdvertiseableProcesses = self->_lastNumAdvertiseableProcesses;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager itemsBeingAdvertised](self, "itemsBeingAdvertised"));
  __int16 v53 = [v87 isEqual:v52];

  if ((v53 ^ 1 | v47 | (lastNumAdvertiseableProcesses != v50)) == 1)
  {
    v54 = self;
    objc_sync_enter(v54);
    if (![v87 count] && -[NSArray count](v54->_itemsBeingAdvertised, "count"))
    {
      v56 = 1;
      goto LABEL_81;
    }

    __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
    if (v55)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
      v84 = objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v54->_itemsBeingAdvertised, "firstObject"));
      if (!objc_msgSend(v52, "isEqual:"))
      {
        v86 = v52;
        v56 = 1;
        goto LABEL_79;
      }
    }

    v86 = v52;
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 activityType]);
    if ([v58 isEqual:NSUserActivityTypeBrowsingWeb])
    {

      v56 = 1;
      if (!v55) {
        goto LABEL_80;
      }
LABEL_79:
    }

    else
    {
      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v54->_itemsBeingAdvertised, "firstObject"));
      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v54->_itemsBeingAdvertised, "firstObject"));
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
        v62 = [v60 isEqual:v61];

        v56 = v62 ^ 1;
        if (!v55) {
          goto LABEL_80;
        }
        goto LABEL_79;
      }

      v56 = 0;
      if (v55) {
        goto LABEL_79;
      }
    }

  return v15;
}

LABEL_80:
LABEL_81:
    self->_lastNumAdvertiseableProcesses = v50;
    __int16 v63 = (NSArray *)[v87 copy];
    itemsBeingAdvertised = v54->_itemsBeingAdvertised;
    v54->_itemsBeingAdvertised = v63;

    objc_sync_exit(v54);
    if (v56)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
      if (v65)
      {
        v66 = sub_100039584(0LL);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue([v65 uuid]);
          v69 = (void *)objc_claimAutoreleasedReturnValue([v68 UUIDString]);
          v70 = (void *)objc_claimAutoreleasedReturnValue([v65 logString]);
          *(_DWORD *)__int128 buf = 138543619;
          v103 = v69;
          v104 = 2113;
          v105 = v70;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "DETERMINE: %{public}@/%{private}@ as the current item-to-advertise.",  buf,  0x16u);
        }

        v71 = -[UACornerActionManager advertisingSuspended](v54, "advertisingSuspended");
        v72 = 1.0;
        if (v71) {
          v72 = 0.0;
        }
        -[UACornerActionManager triggerUserIdleDetermination:](v54, "triggerUserIdleDetermination:", v72);
        LOBYTE(v4_Block_object_dispose(va, 8) = 0;
      }

      else
      {
        v73 = sub_100039584(0LL);
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "DETERMINE: No item is being advertised, so removing any previously set of advertised items.",  buf,  2u);
        }
      }
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertisers](v54, "advertisers"));
    v76 = [v75 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v76)
    {
      v77 = *(void *)v89;
      do
      {
        for (j = 0LL; j != v76; j = (char *)j + 1)
        {
          if (*(void *)v89 != v77) {
            objc_enumerationMutation(v75);
          }
          [*(id *)(*((void *)&v88 + 1) + 8 * (void)j) setAdvertisableItems:v87];
        }

        v76 = [v75 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }

      while (v76);
    }

    if ((v48 & 1) != 0) {
LABEL_100:
    }
      -[UACornerActionManager triggerUserIdleDetermination](self, "triggerUserIdleDetermination");
  }

  else if (v48)
  {
    goto LABEL_100;
  }

  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

void sub_10001991C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100019B80(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainDispatchQ]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_100019C38;
  v7[3] = &unk_1000BD010;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  uint64_t v10 = *(void *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100019C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100019C38(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"signposts");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  os_log_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 32);
  if (v5 + 1 >= 2 && os_signpost_enabled(v3))
  {
    BOOL v18 = *(void *)(a1 + 40) == 0LL;
    int v19 = 67240192;
    LODWORD(v20) = v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_END,  v5,  "handoffFetchSpeculative",  "success=%{public}d enableTelemetry=YES ",  (uint8_t *)&v19,  8u);
  }

  BOOL v6 = *(void *)(a1 + 40) == 0LL;
  os_log_t v7 = sub_100039584(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      os_log_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logString]);
      int v19 = 138543619;
      unint64_t v20 = v16;
      __int16 v21 = 2113;
      BOOL v22 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "DETERMINE: Activity %{public}@/%{private}@ had unsynchronized documents, so we asked it to update and we've heard back.",  (uint8_t *)&v19,  0x16u);
    }

    return [*(id *)(a1 + 48) scheduleUpdatingAdvertisableItems];
  }

  else
  {
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logString]);
      uint64_t v13 = *(void *)(a1 + 40);
      int v19 = 138543875;
      unint64_t v20 = v11;
      __int16 v21 = 2113;
      BOOL v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "DETERMINE: Activity %{public}@/%{private}@ had unsynchronized documents, so we asked it to update and we've hear d back with an error %{public}@.",  (uint8_t *)&v19,  0x20u);
    }

    return [*(id *)(a1 + 48) scheduleUpdatingAdvertisableItems:*(double *)(a1 + 56)];
  }

void sub_100019E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A03C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001A1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_86:
  if (v29 != -[UACornerActionManager systemHasSuspendedAdvertisements](v5, "systemHasSuspendedAdvertisements"))
  {
    if (v29)
    {
      __int16 v61 = sub_100039584(0LL);
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        v83 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_INFO,  "IDLE: Determined that advertising should be suspended, removing any active advertisement and setting self.syst emHasSuspendedAdvertisements = YES(idle=%.2f seconds)",  buf,  0xCu);
      }

      -[UACornerActionManager setSystemHasSuspendedAdvertisements:](v5, "setSystemHasSuspendedAdvertisements:", 1LL);
    }

    else
    {
      -[UACornerActionManager setSystemHasSuspendedAdvertisements:](v5, "setSystemHasSuspendedAdvertisements:", 0LL);
      -[UACornerActionManager scheduleUpdatingAdvertisableItems](v5, "scheduleUpdatingAdvertisableItems");
    }
  }

  -[UACornerActionManager setSystemHasSuspendedScanning:](v5, "setSystemHasSuspendedScanning:", v38 | v36);
  objc_sync_exit(v5);

  objc_autoreleasePoolPop(context);
  dispatch_group_leave((dispatch_group_t)self->_helpersDispatchGroup);
}

void sub_10001AB2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001ADCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _Unwind_Resume(a1);
}

id sub_10001AE08(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  os_log_t v3 = sub_100039584(0LL);
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "*** SUSPENDING ADVERTISER %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    return [*(id *)(a1 + 32) suspend];
  }

  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "*** RESUMING ADVERTISER %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    return [*(id *)(a1 + 32) resume];
  }

LABEL_18:
  }

  id v17 = 0u;
  BOOL v18 = 0u;
  os_log_t v15 = 0u;
  os_log_t v16 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager receivers](v4, "receivers", 0LL));
  double v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) setScanningForTypes:v5];
      }

      double v12 = [v11 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }

  objc_sync_exit(v4);
}

  int v19 = v2->_poweredOn;
LABEL_19:
  objc_sync_exit(v2);

  return v19;
}
}

    if (*((_DWORD *)v61 + 6))
    {
      __int16 v36 = sub_100039584(0LL);
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v13, "UUIDString"));
        v39 = (void *)objc_claimAutoreleasedReturnValue([v48 advertiser]);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 advertisingItems]);
        char v41 = (void *)objc_claimAutoreleasedReturnValue([v40 description]);
        int v42 = sub_10005BF18(v41);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        *(_DWORD *)__int128 buf = 138543619;
        v65 = v38;
        v66 = 2113;
        v67 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Failed to find activity matching uuid %{public}@, items=%{private}@",  buf,  0x16u);
      }
    }
  }

  v44 = *((unsigned int *)v61 + 6);

  _Block_object_dispose(&v60, 8);
  return v44;
}
  }

  v33 = *((unsigned int *)v46 + 6);

  _Block_object_dispose(&v45, 8);
  return v33;
}

void sub_10001B1A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001B448( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

LABEL_11:
  return v6;
}

  return v6;
}

  objc_sync_exit(v2);
  return v5;
}

  objc_sync_exit(v2);
  return v5;
}

  return v3;
}

  return v9;
}

void sub_10001B5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B6CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001B7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BBB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BDB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001BED0(uint64_t a1, uint64_t a2, int a3)
{
  os_log_t v5 = sub_100039584(0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "CornerActionManager: Triggering all because the state of Bluetooth changed to %{BOOL}d",  (uint8_t *)v8,  8u);
  }

  return [*(id *)(a1 + 32) triggerAll];
}

void sub_10001C030( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10001C5E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
  objc_sync_exit(v49);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C6C4(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Received kMobileKeyBagLockStatusNotifyToken notification, after first unlock, so the system can start processing activities.",  v5,  2u);
  }

  [*(id *)(a1 + 32) triggerUserIdleDetermination];
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return result;
}

void sub_10001D00C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D180()
{
  os_log_t v0 = sub_100039584(0LL);
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "## Received com.apple.location.changed so restarting deamon",  v2,  2u);
  }

  exit(0);
}

id sub_10001D1E0(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "UserActivity, received UAUserActivityManagerActivityContinuationIsEnabledChangedNotification notification, so spin ning all threads.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) triggerAll];
}

void sub_10001D254(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  uint32_t state = notify_get_state(token, &state64);
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (!state) {
    [*(id *)(a1 + 32) updateUIDeviceLockedState:state64 != 0];
  }
  objc_sync_exit(v4);
}

void sub_10001D2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D2E4(uint64_t a1)
{
  uint64_t state64 = 0LL;
  notify_get_state((int)[*(id *)(a1 + 32) backlightLevelToken], &state64);
  *(_BYTE *)(*(void *)(a1 + 32) + 120LL) = state64 != 0;
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(void *)(a1 + 32) + 120LL)) {
      id v4 = @"On";
    }
    else {
      id v4 = @"Off";
    }
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Backlight %@", buf, 0xCu);
  }

  os_log_t v5 = *(void **)(a1 + 32);
  else {
    uint64_t v6 = [*(id *)(a1 + 32) isMirroringActive] ^ 1;
  }
  return [v5 updateScreenDimStateState:v6];
}

void sub_10001D430(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 67109120;
    LODWORD(v13) = v4 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Mirroring active state update: %d",  (uint8_t *)&v12,  8u);
  }

  unsigned int v7 = [*(id *)(a1 + 32) isMirroringActive];
  [*(id *)(a1 + 32) setIsMirroringActive:v4 != 0];
  if ((v4 != 0LL) != v7)
  {
    os_log_t v8 = sub_100039584(0LL);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      else {
        uint64_t v10 = "no";
      }
      id v11 = "no";
      if (([*(id *)(a1 + 32) isBacklightOn] & 1) == 0
        && ![*(id *)(a1 + 32) isMirroringActive])
      {
        id v11 = "yes";
      }

      int v12 = 136315394;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      os_log_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Mirroring state changed, updating isUserActive with isMirroringActive %s and screenDimState with %s",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }
}

void sub_10001D5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D5FC(uint64_t a1)
{
  os_log_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mainDispatchQ]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D670;
  block[3] = &unk_1000BCCA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_10001D670(uint64_t a1)
{
  os_log_t v2 = objc_autoreleasePoolPush();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "--- Received MCEffectiveSettingsChangedNotification notification, so signalling all our queues to re-check what's allowed.",  v6,  2u);
  }

  [*(id *)(a1 + 32) triggerAll];
  objc_sync_exit(v3);

  objc_autoreleasePoolPop(v2);
}

void sub_10001D718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D734(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineItemToAdvertiseForHandoffThread];
}

void sub_10001DB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10001DB4C(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v30 = a2;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    double v11 = 0.0;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        if ([v13 active] && objc_msgSend(v13, "advertising"))
        {
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 advertisingItems]);
          id v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v36;
            do
            {
              for (j = 0LL; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v36 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)j);
                uint64_t v19 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo);
                char isKindOfClass = objc_opt_isKindOfClass(v18, v19);
                if (v11 >= a4) {
                  double v21 = v11;
                }
                else {
                  double v21 = a4;
                }
                if (v11 >= a3) {
                  double v22 = v11;
                }
                else {
                  double v22 = a3;
                }
                if ((isKindOfClass & 1) != 0) {
                  double v11 = v21;
                }
                else {
                  double v11 = v22;
                }
              }

              id v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }

            while (v15);
          }
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v9);
  }

  else
  {
    double v11 = 0.0;
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v23 = v30;
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v32;
    do
    {
      for (k = 0LL; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v23);
        }
        id v27 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)k);
        if ([v27 active])
        {
          [v27 intervalToDelaySuspensionOfAdvertisingForItem:0];
          if (v11 < v28) {
            double v11 = v28;
          }
        }
      }

      id v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }

    while (v24);
  }

  return v11;
}

void sub_10001DDFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10001DE58(uint64_t a1, int a2)
{
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "userInactivePowerAssertion, power assertion timed out and expired, so triggering user idle determination.",  buf,  2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "userInactivePowerAssertion, userInactivePowerAssertion power assertion removed.",  v8,  2u);
    }
  }

  [*(id *)(a1 + 32) setUserInactivePowerAssertion:0];
  return [*(id *)(a1 + 32) scheduleUpdatingAdvertisableItems];
}

void sub_10001E2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001E2FC(uint64_t a1, int a2)
{
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "screenDimmedPowerAssertion, power assertion timed out and expired, so triggering user idle determination.",  buf,  2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "screenDimmedPowerAssertion, screenDimmedPowerAssertion power assertion removed.",  v8,  2u);
    }
  }

  [*(id *)(a1 + 32) setScreenDimmedPowerAssertion:0];
  return [*(id *)(a1 + 32) scheduleUpdatingAdvertisableItems];
}

void sub_10001E754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001E7A4(uint64_t a1, int a2)
{
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, power assertion timed out and expired, so triggering user idle determination.",  buf,  2u);
    }

    [*(id *)(a1 + 32) triggerUserIdleDetermination];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "updateUIDeviceLockedState, power assertion removed.",  v8,  2u);
    }
  }

  return [*(id *)(a1 + 32) setDeviceUILockedPowerAssertion:0];
}

void sub_10001E980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EE34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

int64_t sub_10001EF14(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a2;
  os_log_t v5 = a3;
  id v6 = -[UACornerActionManagerHandler priority](v4, "priority");
  if (v6 == (id)-[UACornerActionManagerHandler priority](v5, "priority"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    int64_t v8 = -[UACornerActionManagerHandler priority](v4, "priority");
    if (v8 < -[UACornerActionManagerHandler priority](v5, "priority")) {
      int64_t v7 = -1LL;
    }
    else {
      int64_t v7 = 1LL;
    }
  }

  return v7;
}

void sub_10001EF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EFAC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = sub_100021948;
  v16[4] = sub_100021958;
  id v17 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100021960;
  v12[3] = &unk_1000BD268;
  id v14 = a4;
  id v15 = v16;
  id v13 = v7;
  id v9 = v14;
  id v10 = v7;
  id v11 = v8;
  [a2 enumerateLinesUsingBlock:v12];

  _Block_object_dispose(v16, 8);
}

void sub_10001F0B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10001F0EC(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a2;
  os_log_t v5 = a3;
  id v6 = -[UACornerActionManagerHandler priority](v4, "priority");
  if (v6 == (id)-[UACornerActionManagerHandler priority](v5, "priority"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    int64_t v8 = -[UACornerActionManagerHandler priority](v4, "priority");
    if (v8 < -[UACornerActionManagerHandler priority](v5, "priority")) {
      int64_t v7 = -1LL;
    }
    else {
      int64_t v7 = 1LL;
    }
  }

  return v7;
}

void sub_10001F170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020264( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, void *a29, uint64_t a30, _Unwind_Exception *exception_object, uint64_t a32, uint64_t a33, void *a34)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000206E8(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a2;
  os_log_t v5 = a3;
  id v6 = -[UACornerActionManagerHandler priority](v4, "priority");
  if (v6 == (id)-[UACornerActionManagerHandler priority](v5, "priority"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    int64_t v8 = -[UACornerActionManagerHandler priority](v4, "priority");
    if (v8 < -[UACornerActionManagerHandler priority](v5, "priority")) {
      int64_t v7 = -1LL;
    }
    else {
      int64_t v7 = 1LL;
    }
  }

  return v7;
}

void sub_10002076C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100020780(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a2;
  os_log_t v5 = a3;
  id v6 = -[UACornerActionManagerHandler priority](v4, "priority");
  if (v6 == (id)-[UACornerActionManagerHandler priority](v5, "priority"))
  {
    int64_t v7 = 0LL;
  }

  else
  {
    int64_t v8 = -[UACornerActionManagerHandler priority](v4, "priority");
    if (v8 < -[UACornerActionManagerHandler priority](v5, "priority")) {
      int64_t v7 = -1LL;
    }
    else {
      int64_t v7 = 1LL;
    }
  }

  return v7;
}

void sub_100020804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100020818(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  os_log_t v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](a2, "uuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo uuid](v4, "uuid"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_1000208AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000208EC(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](a2, "uuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](v4, "uuid"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_100020980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000209C0(id a1, UAAdvertiser *a2, UAAdvertiser *a3)
{
  os_log_t v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](a2, "uuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](v4, "uuid"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_100020A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100020A94(id a1, UAClientController *a2, UAClientController *a3)
{
  os_log_t v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](a2, "uuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](v4, "uuid"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

void sub_100020B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020F04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100020F7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100020FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021074( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021108( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000211F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000212D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021350( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000213C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000218EC(id a1)
{
  id v1 = strstr("@(#)PROGRAM:useractivityd  PROJECT:UserActivity-551\n", "PROJECT:UserActivity-");
  if (v1)
  {
    strlcpy(byte_1000DE2A1, v1 + 21, 0x40uLL);
    os_log_t v2 = strrchr(byte_1000DE2A1, 10);
    if (v2) {
      char *v2 = 0;
    }
  }

uint64_t sub_100021948(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100021958(uint64_t a1)
{
}

void sub_100021960(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    objc_msgSend(*(id *)(a1 + 32), "appendString:");
  }
  [*(id *)(a1 + 32) appendString:v3];
  [*(id *)(a1 + 32) appendString:@"\n"];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), *(id *)(a1 + 40));
}

void sub_1000219D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000227E8(_Unwind_Exception *a1)
{
  int64_t v8 = v6;

  _Unwind_Resume(a1);
}

id sub_100022840(uint64_t a1)
{
  return [*(id *)(a1 + 32) doIt];
}

void sub_1000228C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022CFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100022D94(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doIt];
}

void sub_100022DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100022E64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doIt];
}

void sub_100023084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002321C(_Unwind_Exception *a1)
{
  os_log_t v5 = v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000233C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023BA8(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[REMOTE GEN] Responding to type Info request",  v9,  2u);
  }

  if ([*(id *)(a1 + 32) state] == (id)6)
  {
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

    if (!v4)
    {
      os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
      [*(id *)(a1 + 32) setError:v5];

      [*(id *)(a1 + 32) setPbInfo:0];
    }
  }

  uint64_t v6 = *(void *)(a1 + 40);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pbInfo]);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
}

void sub_100023CC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend( *(id *)(a1 + 32),  "setPayloadXferTime:",  +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - *(void *)(a1 + 48)));
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v80 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[REMOTE GEN] Type payload fetch error: %{public}@",  buf,  0xCu);
    }

    uint64_t v10 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v77 = NSUnderlyingErrorKey;
    id v78 = v6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
    int v12 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  -120LL,  v11));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
    [v13 submitRemotePasteboardBecameUnavailable:4];

    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
    os_log_t v14 = sub_100039584(@"pasteboard-server");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      *(_DWORD *)__int128 buf = 138477827;
      id v80 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Type Fetch Info: %{private}@",  buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
    [v17 submitRemotePasteboardTypeInfoRequested:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) updateState:1];
    [*(id *)(a1 + 40) setError:v12];
  }

  else
  {
    uint64_t v61 = a1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[REMOTE GEN] Received type info", buf, 2u);
    }

    v62 = v5;
    uint64_t v18 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  0LL);
    id v19 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v18,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfoWrapper),  NSKeyedArchiveRootObjectKey);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v60 = v18;
    -[NSKeyedUnarchiver finishDecoding](v18, "finishDecoding");
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int16 v59 = v20;
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pbinfo]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 items]);

    id obj = v22;
    id v23 = [v22 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(obj);
          }
          id v27 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 types]);
          int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);

          id v30 = [v29 countByEnumeratingWithState:&v65 objects:v75 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v66;
            do
            {
              for (j = 0LL; j != v31; j = (char *)j + 1)
              {
                if (*(void *)v66 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)j);
                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v27 types]);
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v34]);
                [v36 setDataFile:0];
              }

              id v31 = [v29 countByEnumeratingWithState:&v65 objects:v75 count:16];
            }

            while (v31);
          }
        }

        id v24 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      }

      while (v24);
    }

    else {
      uint64_t v37 = (uint64_t)[v59 protocolVersion];
    }
    id v5 = v62;
    a1 = v61;
    [*(id *)(v61 + 40) setStreamProtocolVersion:v37];
    os_log_t v38 = sub_100039584(@"pasteboard-server");
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    id v6 = 0LL;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v40 = [*(id *)(v61 + 40) streamProtocolVersion];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v80) = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Setting protocol version: %d",  buf,  8u);
    }

    objc_msgSend(*(id *)(v61 + 32), "setPayloadSize:", objc_msgSend(v62, "length"));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v59 pbinfo]);
    [*(id *)(v61 + 40) setPbInfo:v41];

    [*(id *)(v61 + 40) updateState:3];
    if ([v59 extraDataType] == (id)2)
    {
      os_log_t v42 = sub_100039584(@"pasteboard-server");
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Received extra data, saving for later",  buf,  2u);
      }

      [*(id *)(v61 + 40) updateState:5];
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 createFileForRemotePasteboardBlob]);
      dispatch_source_t v46 = (void *)objc_claimAutoreleasedReturnValue([v59 extraData]);
      id v64 = 0LL;
      [v45 writeData:v46 error:&v64];
      id v47 = v64;

      if (v47)
      {
        uint64_t v48 = UAContinuityErrorDomain;
        NSErrorUserInfoKey v73 = NSUnderlyingErrorKey;
        id v74 = v47;
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v48,  -128LL,  v49));

        __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
        [v51 submitRemotePasteboardBecameUnavailable:4];

        objc_msgSend(*(id *)(v61 + 32), "setErrorCode:", objc_msgSend(v50, "code"));
        [*(id *)(v61 + 40) updateState:1];
        [*(id *)(v61 + 40) setError:v50];
      }
    }

    os_log_t v52 = sub_100039584(@"pasteboard-server");
    __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v61 + 32) description]);
      id v55 = sub_10005BF18(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      *(_DWORD *)__int128 buf = 138477827;
      id v80 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Type Fetch Info: %{private}@",  buf,  0xCu);
    }

    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
    [v57 submitRemotePasteboardTypeInfoRequested:*(void *)(v61 + 32)];

    int v12 = v60;
  }

  uint64_t v58 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) respQueue]);
  dispatch_activate(v58);
}

void sub_100024730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002475C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002476C(uint64_t a1)
{
}

void sub_100024774(uint64_t a1, int a2, id obj)
{
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

char *sub_1000248C4(void *a1, _OWORD *a2)
{
  id v3 = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], v8);
  if (v3)
  {
    __int128 v4 = a2[1];
    v7[0] = *a2;
    v7[1] = v4;
    id v3 = (char *)sandbox_extension_issue_file_to_process(APP_SANDBOX_READ_WRITE, v8, 0LL, v7);
    if (v3)
    {
      id v5 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v3,  strlen(v3),  1LL);
      id v3 = (char *)objc_claimAutoreleasedReturnValue(v5);
    }
  }

  return v3;
}

void sub_100024D78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100024D98(id a1)
{
  os_log_t v1 = sub_100039584(@"pasteboard-server");
  os_log_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Client Notification Connection interrupted(pboardd crash?)",  v3,  2u);
  }
}

void sub_100024E04(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Client Notification Connection invalidated; remote copy/paste will no longer work.",
      v5,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setClientNotificationConnection:0];
}

void sub_100024F50(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  os_log_t v2 = (void *)qword_1000DE2F0;
  qword_1000DE2F0 = v1;
}

void sub_100025148(_Unwind_Exception *a1)
{
}

void sub_1000256E0(_Unwind_Exception *a1)
{
}

void sub_100025700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100025760;
    block[3] = &unk_1000BCC58;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(&_dispatch_main_q, block);
  }

id sub_100025760(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
}

void sub_100025770(id a1, NSError *a2)
{
  os_log_t v2 = a2;
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error getting client connection: %@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_1000258DC(_Unwind_Exception *a1)
{
}

void sub_100025DF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Received pasteboard info: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
  [*(id *)(a1 + 32) setCurrentLocalPasteboard:v6];

  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocalPasteboardSize:", objc_msgSend(v3, "dataSize"));
  [*(id *)(a1 + 32) setRemotePasteboardAvalibility:1 withDataRequester:0];
}

void sub_1000263FC(_Unwind_Exception *a1)
{
}

void sub_100026410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  if (a3)
  {
    v4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002649C;
    block[3] = &unk_1000BCC58;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v4();
  }

id sub_10002649C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
}

void sub_100026D70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100026E0C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    if (v5)
    {
      [*(id *)(a1 + 32) setRemotePasteboardAvalibility:0 withDataRequester:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
      [v8 submitRemotePasteboardBecameUnavailable:4];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteGeneration]);
    [v9 setReturnEarly:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    [v10 cleanupArchiveDir];
  }
}

void sub_100026EEC(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard Fetch Cancelled",  buf,  2u);
  }

  os_log_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pasteInfo]);
  [v6 setCancelled:1];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteGeneration]);
  [v8 updateState:6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 coders]);

  objc_sync_enter(v11);
  id v12 = objc_loadWeakRetained(v4);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 coders]);
  id v14 = [v13 copy];

  objc_sync_exit(v11);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v19, "cancelReceive") & 1) != 0) {
          objc_msgSend(v19, "cancelReceive", (void)v22);
        }
      }

      id v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v16);
  }

  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  [v20 cancelAllLocks];

  id v21 = objc_loadWeakRetained(v4);
  [v21 hideProgressUI:0];
}

void sub_100027170(_Unwind_Exception *a1)
{
}

void sub_10002718C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
  unsigned __int8 v8 = [v7 isCancelled];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) pasteFetchStartTime]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
    [v10 setPayloadXferTime:v9];

    if (v6)
    {
      os_log_t v11 = sub_100039584(@"pasteboard-server");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v92 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Payload fetch error: %{public}@",  buf,  0xCu);
      }

      uint64_t v13 = UAContinuityErrorDomain;
      NSErrorUserInfoKey v89 = NSUnderlyingErrorKey;
      id v90 = v6;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
      id v15 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  -120LL,  v14));

      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
      [v16 invalidate];

      [*(id *)(a1 + 32) hideProgressUI:1];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      id v17 = [v5 length];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
      [v18 setPayloadSize:v17];

      double v19 = (double)(unint64_t)[v5 length] * 8.0;
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
      unint64_t v21 = (unint64_t)(v19 / ((double)(unint64_t)[v20 payloadXferTime] / 1000000000.0));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
      [v22 setPayloadXferSpeed:v21];

      id v15 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  0LL);
      id v23 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v15,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfoWrapper),  NSKeyedArchiveRootObjectKey);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[NSKeyedUnarchiver finishDecoding](v15, "finishDecoding");
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 error]);

      if (v25)
      {
        os_log_t v26 = sub_100039584(@"pasteboard-server");
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          double v28 = (void *)objc_claimAutoreleasedReturnValue([v24 error]);
          *(_DWORD *)__int128 buf = 138543362;
          id v92 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Payload fetch error: %{public}@",  buf,  0xCu);
        }

        int v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
        [v29 invalidate];

        [*(id *)(a1 + 32) hideProgressUI:0];
        uint64_t v30 = *(void *)(a1 + 48);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v24 error]);
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0LL, v31);
      }

      else if ([v24 extraDataType] == (id)2)
      {
        os_log_t v32 = sub_100039584(@"pasteboard-server");
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] PBData came with stream request, was a small pboard",  buf,  2u);
        }

        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
        [v34 setTotalUnitCount:1];

        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
        [v35 setCompletedUnitCount:1];

        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
        [v36 invalidate];

        [*(id *)(a1 + 32) hideProgressUI:0];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
        os_log_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 createFileForRemotePasteboardBlob]);

        if (v38)
        {
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v24 extraData]);
          id v86 = 0LL;
          unsigned int v40 = [v38 writeData:v39 error:&v86];
          id v73 = v86;

          if (v40)
          {
            __int128 v68 = v38;
            __int128 v69 = v24;
            __int128 v70 = v15;
            uint64_t v71 = a1;
            id v72 = v5;
            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v24 pbinfo]);
            os_log_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 remotePasteboardBlobForReading]);
            [v41 setDataFile:v43];

            __int128 v84 = 0u;
            __int128 v85 = 0u;
            __int128 v82 = 0u;
            __int128 v83 = 0u;
            __int128 v67 = v41;
            id obj = (id)objc_claimAutoreleasedReturnValue([v41 items]);
            id v76 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
            if (v76)
            {
              uint64_t v75 = *(void *)v83;
              do
              {
                uint64_t v44 = 0LL;
                do
                {
                  if (*(void *)v83 != v75) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v77 = v44;
                  v45 = *(void **)(*((void *)&v82 + 1) + 8 * v44);
                  __int128 v78 = 0u;
                  __int128 v79 = 0u;
                  __int128 v80 = 0u;
                  __int128 v81 = 0u;
                  dispatch_source_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 types]);
                  id v47 = [v46 countByEnumeratingWithState:&v78 objects:v87 count:16];
                  if (v47)
                  {
                    id v48 = v47;
                    uint64_t v49 = *(void *)v79;
                    do
                    {
                      for (i = 0LL; i != v48; i = (char *)i + 1)
                      {
                        if (*(void *)v79 != v49) {
                          objc_enumerationMutation(v46);
                        }
                        uint64_t v51 = *(void *)(*((void *)&v78 + 1) + 8LL * (void)i);
                        os_log_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
                        __int16 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 remotePasteboardBlobForReading]);
                        v54 = (void *)objc_claimAutoreleasedReturnValue([v45 types]);
                        id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v51]);
                        [v55 setDataFile:v53];
                      }

                      id v48 = [v46 countByEnumeratingWithState:&v78 objects:v87 count:16];
                    }

                    while (v48);
                  }

                  uint64_t v44 = v77 + 1;
                }

                while ((id)(v77 + 1) != v76);
                id v76 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
              }

              while (v76);
            }

            v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v71 + 32) pasteInfo]);
            [v56 setUsedStreams:0];

            __int16 v57 = v67;
            (*(void (**)(void))(*(void *)(v71 + 48) + 16LL))();
            id v6 = 0LL;
            id v5 = v72;
            __int128 v24 = v69;
            id v15 = v70;
            os_log_t v38 = v68;
            uint64_t v58 = v73;
          }

          else
          {
            os_log_t v65 = sub_100039584(@"pasteboard-server");
            __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
            uint64_t v58 = v73;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v92 = v73;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "ERROR: Error writing pasteboard data blob: %@",  buf,  0xCu);
            }

            __int16 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -128LL,  0LL));
            (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
          }
        }

        else
        {
          os_log_t v63 = sub_100039584(@"pasteboard-server");
          id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error creating remote data file",  buf,  2u);
          }

          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -128LL,  0LL));
          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        }
      }

      else
      {
        id v59 = [v24 extraDataType];
        v60 = *(void **)(a1 + 32);
        if (v59 == (id)1)
        {
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v24 extraData]);
          objc_msgSend( v60,  "receivePasteboardStreamData:version:withCompletion:",  v61,  objc_msgSend(*(id *)(a1 + 40), "streamProtocolVersion"),  *(void *)(a1 + 48));
        }

        else
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
          [v62 invalidate];

          [*(id *)(a1 + 32) hideProgressUI:0];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        }
      }
    }
  }
}

void sub_100027B50(uint64_t a1)
{
  os_log_t v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(a1 + 32);
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 showUITimer]);
  [v3 showProgressUI:v4];

  [*(id *)(a1 + 32) setStreamOpenStartTime:mach_absolute_time()];
  objc_initWeak(&location, *(id *)(a1 + 32));
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 64)));
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Requesting to open streams with version: %@",  buf,  0xCu);
  }

  unint64_t v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100027D30;
  v12[3] = &unk_1000BD4D0;
  void v12[4] = *(void *)(a1 + 32);
  objc_copyWeak(v14, &location);
  id v10 = *(id *)(a1 + 56);
  os_log_t v11 = *(void **)(a1 + 64);
  id v13 = v10;
  v14[1] = v11;
  [v9 getContinuationStreamsWithEndpointData:v8 completionHandler:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v2);
}

void sub_100027D00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100027D30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
  unsigned int v11 = [v10 isCancelled];

  if (v11)
  {
    sub_1000282E8(v12, v7, v8);
    goto LABEL_20;
  }

  unint64_t v13 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) streamOpenStartTime]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pasteInfo]);
  [v15 setStreamOpenTime:v13];

  os_log_t v16 = sub_100039584(@"pasteboard-server");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (!v9)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Opened streams", buf, 2u);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 createFileForRemotePasteboardBlob]);

    if (!v24)
    {
      os_log_t v34 = sub_100039584(@"pasteboard-server");
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Could not create data file for remote pasteboard",  buf,  2u);
      }

      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -128LL,  0LL));
      sub_1000282E8((uint64_t)v36, v7, v8);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
      [v37 invalidate];

      [*(id *)(a1 + 32) hideProgressUI:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      goto LABEL_19;
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10002837C;
    v45[3] = &unk_1000BD480;
    id v25 = *(id *)(a1 + 40);
    v45[4] = *(void *)(a1 + 32);
    id v46 = v25;
    os_log_t v42 = objc_retainBlock(v45);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100029194;
    v43[3] = &unk_1000BD4A8;
    objc_copyWeak(&v44, (id *)(a1 + 48));
    v43[4] = *(void *)(a1 + 32);
    os_log_t v26 = objc_retainBlock(v43);
    uint64_t v27 = mach_absolute_time();
    id v28 = objc_loadWeakRetained((id *)(a1 + 48));
    [v28 setStreamXferStartTime:v27];

    uint64_t v29 = *(void *)(a1 + 56);
    if (v29 == 2)
    {
      uint64_t v30 = -[UCStreamCoderV2 initWithInputStream:outputStream:]( objc_alloc(&OBJC_CLASS___UCStreamCoderV2),  "initWithInputStream:outputStream:",  v7,  v8);
      os_log_t v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteGeneration]);
      id v39 = [v38 returnEarly];

      unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
      [v40 setIsAsyncTransfer:v39];

      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
      -[UCStreamCoderV2 receivePasteboardToFile:withProgress:infoReceivedHandler:completionHandler:returnInfoEarly:]( v30,  "receivePasteboardToFile:withProgress:infoReceivedHandler:completionHandler:returnInfoEarly:",  v24,  v41,  v42,  v26,  v39);

      os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
      objc_sync_enter(v32);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
      [v33 addObject:v30];
    }

    else
    {
      if (v29 != 1)
      {
LABEL_18:

        objc_destroyWeak(&v44);
        __int128 v36 = v46;
LABEL_19:

        goto LABEL_20;
      }

      uint64_t v30 = -[UAPBStreamCoderV1 initWithInputStream:outputStream:]( objc_alloc(&OBJC_CLASS___UAPBStreamCoderV1),  "initWithInputStream:outputStream:",  v7,  v8);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchProgress]);
      -[UCStreamCoderV2 receivePasteboardToFile:withProgress:infoReceivedHandler:completionHandler:returnInfoEarly:]( v30,  "receivePasteboardToFile:withProgress:infoReceivedHandler:completionHandler:returnInfoEarly:",  v24,  v31,  v42,  v26,  0LL);

      os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
      objc_sync_enter(v32);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
      [v33 addObject:v30];
    }

    objc_sync_exit(v32);
    goto LABEL_18;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v50 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Opened streams with error: %{public}@",  buf,  0xCu);
  }

  NSErrorUserInfoKey v47 = NSUnderlyingErrorKey;
  id v48 = v9;
  double v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -121LL,  v19));

  sub_1000282E8(v21, v7, v8);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
  [v22 invalidate];

  [*(id *)(a1 + 32) hideProgressUI:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

LABEL_20:
}

void sub_1000282AC(_Unwind_Exception *a1)
{
}

void sub_1000282E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (![v5 streamStatus]) {
    [v5 open];
  }
  if (![v4 streamStatus]) {
    [v4 open];
  }
  if ([v5 streamStatus] != (id)6) {
    [v5 close];
  }
  if ([v4 streamStatus] != (id)6) {
    [v4 close];
  }
}

void sub_10002837C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_log_t v7 = sub_100039584(@"pasteboard-server");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543362;
      CFURLRef v138 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error receiving pboard info: %{public}@",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_75;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  os_log_t v10 = sub_100039584(@"pasteboard-server");
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v5 error]);
      *(_DWORD *)__int128 buf = 138543362;
      CFURLRef v138 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Received error from remote: %{public}@",  buf,  0xCu);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0LL, v15);

    goto LABEL_75;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    CFURLRef v138 = (CFURLRef)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Received pboard info: %@",  buf,  0xCu);
  }

  os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remotePasteboardBlobForReading]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 pbinfo]);
  [v18 setDataFile:v17];

  double v19 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 sharedDataPath]);

  v121 = (void *)v20;
  if (v20)
  {
    v116 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 pbinfo]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 items]);
    id v23 = [v22 count];
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
    [v24 setNumberOfItems:v23];

    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    v111 = v5;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 pbinfo]);
    os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 items]);

    id obj = v26;
    id v114 = [v26 countByEnumeratingWithState:&v133 objects:v146 count:16];
    if (!v114) {
      goto LABEL_69;
    }
    uint64_t v113 = *(void *)v134;
    uint64_t v117 = APP_SANDBOX_READ_WRITE;
    uint64_t v123 = a1;
    while (1)
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v134 != v113) {
          objc_enumerationMutation(obj);
        }
        uint64_t v115 = v27;
        id v28 = *(void **)(*((void *)&v133 + 1) + 8 * v27);
        __int128 v129 = 0u;
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v132 = 0u;
        id v125 = (id)objc_claimAutoreleasedReturnValue([v28 types]);
        id v127 = [v125 countByEnumeratingWithState:&v129 objects:v145 count:16];
        if (v127)
        {
          uint64_t v126 = *(void *)v130;
          do
          {
            for (i = 0LL; i != v127; i = (char *)i + 1)
            {
              if (*(void *)v130 != v126) {
                objc_enumerationMutation(v125);
              }
              uint64_t v30 = *(void **)(*((void *)&v129 + 1) + 8LL * (void)i);
              id v31 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
              os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 remotePasteboardBlobForReading]);
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
              os_log_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v30]);
              [v34 setDataFile:v32];

              if ([v30 isEqualToString:@"public.file-url"])
              {
                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
                [v35 setIsFileCopy:1];

                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v30]);
                os_log_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dataFile]);
                id v39 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v30]);
                __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 offset]);
                objc_msgSend(v38, "seekToFileOffset:", objc_msgSend(v41, "longLongValue"));

                os_log_t v42 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:v30]);
                id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dataFile]);
                v45 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v30]);
                NSErrorUserInfoKey v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "readDataOfLength:", objc_msgSend(v46, "size")));

                id v48 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v30]);
                id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 dataFile]);
                [v50 seekToFileOffset:0];

                id v51 = v47;
                CFURLRef v52 = CFURLCreateWithBytes( kCFAllocatorDefault,  (const UInt8 *)[v51 bytes],  (CFIndex)objc_msgSend(v51, "length"),  0x8000100u,  0);
                os_log_t v53 = sub_100039584(@"pasteboard-server");
                v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)__int128 buf = 138412290;
                  CFURLRef v138 = v52;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "URL on pasteboard: %@", buf, 0xCu);
                }

                if (!v52
                  || (id v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL scheme](v52, "scheme"))) == 0LL
                  || (v56 = v55, id v57 = [v55 compare:@"file" options:1], v56, v57))
                {
                  os_log_t v58 = sub_100039584(@"pasteboard-server");
                  id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)__int128 buf = 138543362;
                    CFURLRef v138 = v52;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_FAULT,  "[PBOARD CONTROLLER] Non-file: url provide in stream, %{public}@",  buf,  0xCu);
                  }

                  goto LABEL_64;
                }

                id v124 = v51;
                v60 = (__CFString *)CFURLCopyPath(v52);
                unsigned int v122 = -[__CFString hasSuffix:](v60, "hasSuffix:", @"/");

                id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v52, "lastPathComponent"));
                uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v30]);
                os_log_t v63 = (void *)objc_claimAutoreleasedReturnValue([v62 uuid]);
                id v64 = (void *)objc_claimAutoreleasedReturnValue([v63 UUIDString]);
                os_log_t v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"items/%@/",  v64));

                __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v121 stringByAppendingPathComponent:v65]);
                if (v66 && v65)
                {
                  v120 = v65;
                  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v66));
                  __int128 v68 = v67;
                  if (v59) {
                    __int128 v69 = (const __CFString *)v59;
                  }
                  else {
                    __int128 v69 = &stru_1000BE738;
                  }
                  __int128 v70 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v67 URLByAppendingPathComponent:v69]);

                  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v123 + 32) remoteGeneration]);
                  unsigned int v72 = [v71 returnEarly];

                  if (v72)
                  {
                    v118 = v66;
                    NSFileAttributeType v73 = NSFileTypeDirectory;
                    if (!v122) {
                      NSFileAttributeType v73 = NSFileTypeRegular;
                    }
                    id v74 = v73;
                    os_log_t v75 = sub_100039584(@"pasteboard-server");
                    id v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)__int128 buf = 138412546;
                      CFURLRef v138 = v70;
                      __int16 v139 = 2112;
                      v140 = v74;
                      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEBUG,  "Creating %@ as type %@",  buf,  0x16u);
                    }

                    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                    __int128 v78 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v70, "path"));
                    if (v122)
                    {
                      NSFileAttributeKey v143 = NSFileType;
                      NSFileAttributeType v144 = NSFileTypeDirectory;
                      __int128 v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v144,  &v143,  1LL));
                      [v77 createDirectoryAtPath:v78 withIntermediateDirectories:0 attributes:v79 error:0];
                    }

                    else
                    {
                      NSFileAttributeKey v141 = NSFileType;
                      NSFileAttributeType v142 = NSFileTypeRegular;
                      __int128 v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));
                      [v77 createFileAtPath:v78 contents:0 attributes:v79];
                    }

                    __int128 v66 = v118;
                  }

                  os_log_t v82 = sub_100039584(@"pasteboard-server");
                  __int128 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    CFURLRef v138 = v70;
                    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] new URL for item: %@",  buf,  0xCu);
                  }

                  __int128 v81 = v70;
                  a1 = v123;
                  if (realpath_DARWIN_EXTSN( (const char *)-[__CFURL fileSystemRepresentation](v81, "fileSystemRepresentation"),  (char *)buf))
                  {
                    os_log_t v84 = sub_100039584(@"pasteboard-server");
                    __int128 v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)v128 = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Issuing sandbox extension",  v128,  2u);
                    }

                    id v86 = (const char *)sandbox_extension_issue_file(v117, buf, 0LL);
                    os_log_t v87 = sub_100039584(@"pasteboard-server");
                    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
                    NSErrorUserInfoKey v89 = v88;
                    if (v86)
                    {
                      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)v128 = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Got extension",  v128,  2u);
                      }

                      id v90 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v86,  strlen(v86),  1LL);
                      uint64_t v91 = objc_claimAutoreleasedReturnValue(v90);
                      a1 = v123;
                      if (v91)
                      {
                        NSErrorUserInfoKey v89 = (os_log_s *)v91;
                        v119 = v66;
                        os_log_t v92 = sub_100039584(@"pasteboard-server");
                        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)v128 = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Saving sandbox extension to dict",  v128,  2u);
                        }

                        v94 = (void *)objc_claimAutoreleasedReturnValue([v28 types]);
                        v95 = (void *)objc_claimAutoreleasedReturnValue([v94 objectForKeyedSubscript:v30]);
                        v96 = (void *)objc_claimAutoreleasedReturnValue([v95 uuid]);
                        v97 = (void *)objc_claimAutoreleasedReturnValue([v96 UUIDString]);

                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v116,  "setObject:forKeyedSubscript:",  v89,  v97);
                        a1 = v123;
                        __int128 v66 = v119;
                        goto LABEL_61;
                      }
                    }

                    else
                    {
                      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v128 = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error issuing extension",  v128,  2u);
                      }

LABEL_61:
                    }
                  }

                  id v51 = v124;
                  os_log_t v65 = v120;
                }

                else
                {
                  os_log_t v80 = sub_100039584(@"pasteboard-server");
                  __int128 v81 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v80);
                  a1 = v123;
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)__int128 buf = 138543362;
                    CFURLRef v138 = v52;
                    _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_FAULT,  "[PBOARD CONTROLLER] Corrupt file: url in stream, %{public}@",  buf,  0xCu);
                  }

                  id v51 = v124;
                }

LABEL_64:
                continue;
              }
            }

            id v127 = [v125 countByEnumeratingWithState:&v129 objects:v145 count:16];
          }

          while (v127);
        }

        uint64_t v27 = v115 + 1;
      }

      while ((id)(v115 + 1) != v114);
      id v114 = [obj countByEnumeratingWithState:&v133 objects:v146 count:16];
      if (!v114)
      {
LABEL_69:

        v98 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
        v99 = (void *)objc_claimAutoreleasedReturnValue([v98 sharedDataPath]);
        id v5 = v111;
        v100 = (void *)objc_claimAutoreleasedReturnValue([v111 pbinfo]);
        [v100 setSharedDataPath:v99];

        v101 = (void *)objc_claimAutoreleasedReturnValue([v111 pbinfo]);
        v102 = (os_log_s *)v116;
        [v101 setSandboxExtensions:v116];

        os_log_t v103 = sub_100039584(@"pasteboard-server");
        v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](v116, "description"));
          id v106 = sub_10005BF18(v105);
          v107 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v106);
          *(_DWORD *)__int128 buf = 138412290;
          CFURLRef v138 = v107;
          _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEBUG,  "[PBOARD CONTROLLER] Sending extensions: %@",  buf,  0xCu);
        }

        uint64_t v108 = *(void *)(a1 + 40);
        v109 = (void *)objc_claimAutoreleasedReturnValue([v111 pbinfo]);
        (*(void (**)(uint64_t, void *, void))(v108 + 16))(v108, v109, 0LL);

        id v6 = 0LL;
        goto LABEL_74;
      }
    }
  }

  os_log_t v110 = sub_100039584(@"pasteboard-server");
  v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Unable to get shared temp dir@", buf, 2u);
  }

  return (SharingBTLEAdvertisementPayload *)v18;
}

LABEL_74:
LABEL_75:
}

void sub_100029194(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v11 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  v9 - (void)[WeakRetained streamXferStartTime]);

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pasteInfo]);
  [v13 setStreamDataXferTime:v11];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pasteInfo]);
  [v15 setStreamDataSize:a3];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pasteInfo]);
  [v17 setStreamDataXferSpeed:(unint64_t)((double)a3 * 8.0 / ((double)v11 / 1000000000.0))];

  unint64_t v18 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) pasteFetchStartTime]);
  double v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
  [v19 setTotalTime:v18];

  if (v8 && [v8 code] != (id)-125)
  {
    id v20 = [v8 code];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
    [v21 setErrorCode:v20];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if (v23)
    {
      id v24 = [v23 code];
      id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
      [v25 setUnderlyingErrorCode:v24];
    }
  }

  os_log_t v26 = sub_100039584(@"pasteboard-server");
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 description]);
    id v30 = sub_10005BF18(v29);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    int v38 = 138412290;
    id v39 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Paste Fetch Info: %@",  (uint8_t *)&v38,  0xCu);
  }

  os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteInfo]);
  [v32 submitRemotePasteboardWasRequested:v33];

  [*(id *)(a1 + 32) setPasteInfo:0];
  os_log_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) showUITimer]);
  [v34 invalidate];

  [*(id *)(a1 + 32) hideProgressUI:v8 != 0];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
  objc_sync_enter(v35);
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coders]);
  [v36 removeObject:v7];

  objc_sync_exit(v35);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteGeneration]);
  [v37 updateState:5];
}

void sub_100029520(_Unwind_Exception *a1)
{
}

void sub_100029944(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pboard is small enough to send via BTLE payload",  (uint8_t *)&v17,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardInfoToSend]);
  [v4 setExtraDataType:2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localPasteboardBlobForReading]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readDataToEndOfFile]);
  [v4 setExtraData:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v9 setUsedStreams:0];

  unint64_t v10 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v11 setTotalTime:v10];

  os_log_t v12 = sub_100039584(@"pasteboard-server");
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    int v17 = 138477827;
    unint64_t v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@",  (uint8_t *)&v17,  0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v15 submitDidSendLocalPasteboard:v16];

  [*(id *)(a1 + 32) setLocalInfo:0];
}

void sub_100029B98(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 48)));
    int v17 = 138412290;
    unint64_t v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Starting pboard service for paste, version: %@",  (uint8_t *)&v17,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (objc_opt_class(&OBJC_CLASS___SFCompanionAdvertiser))
  {
    id v7 = -[SFCompanionAdvertiser initWithServiceType:]( objc_alloc(&OBJC_CLASS___SFCompanionAdvertiser),  "initWithServiceType:",  v6);
    [*(id *)(a1 + 32) setPasteAdvertiser:v7];
  }

  else
  {
    [*(id *)(a1 + 32) setPasteAdvertiser:0];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteAdvertiser]);
  [v8 setSupportsStreams:1];

  uint64_t v9 = *(void **)(a1 + 32);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pasteAdvertiser]);
  [v10 setDelegate:v9];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteAdvertiser]);
  [v11 start];

  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardInfoToSend]);
  [v12 setExtraDataType:1];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pasteAdvertiser]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceEndpointData]);
  [v12 setExtraData:v14];

  [v12 setProtocolVersion:*(void *)(a1 + 48)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL));
  [*(id *)(a1 + 32) setSendingCoderVersion:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v16 setUsedStreams:1];

  [*(id *)(a1 + 32) setStreamOpenStartTime:mach_absolute_time()];
}

void sub_100029DF0(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 createFileForLocalPasteboardBlob]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fileURLForCloneItems]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientConnection]);
    id v7 = v6;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v33, 0, sizeof(v33));
    }
    id v24 = sub_1000248C4(v5, v33);
    os_log_t v12 = (UASharedPasteboardInfoWrapper *)objc_claimAutoreleasedReturnValue(v24);

    id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientConnection]);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10002A1FC;
    v31[3] = &unk_1000BD548;
    os_log_t v26 = *(void **)(a1 + 40);
    v31[4] = *(void *)(a1 + 32);
    id v32 = v26;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteObjectProxyWithErrorHandler:v31]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10002A4EC;
    v28[3] = &unk_1000BD570;
    v28[4] = *(void *)(a1 + 32);
    id v29 = *(id *)(a1 + 48);
    id v30 = *(id *)(a1 + 56);
    [v27 writeLocalPasteboardToFile:v3 itemDir:v5 extension:v12 withCompletion:v28];
  }

  else
  {
    os_log_t v8 = sub_100039584(@"pasteboard-server");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Failed to create local pasteboard data file",  buf,  2u);
    }

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);
    if (v10)
    {
      unint64_t v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);
      dispatch_semaphore_signal(v11);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -128LL,  0LL));
    os_log_t v12 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfoWrapper);
    -[UASharedPasteboardInfoWrapper setError:](v12, "setError:", v5);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  0LL));
    id v14 = [v5 code];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    [v15 setErrorCode:v14];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    [v16 setUsedStreams:0];

    unint64_t v17 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    [v18 setTotalTime:v17];

    os_log_t v19 = sub_100039584(@"pasteboard-server");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
      *(_DWORD *)__int128 buf = 138477827;
      __int128 v35 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@",  buf,  0xCu);
    }

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    [v22 submitDidSendLocalPasteboard:v23];

    [*(id *)(a1 + 32) setLocalInfo:0];
  }
}

void sub_10002A1FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v26 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error getting client object proxy: %{public}@",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);
  if (v6)
  {
    id v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);
    dispatch_semaphore_signal(v7);
  }

  uint64_t v8 = UAContinuityErrorDomain;
  NSErrorUserInfoKey v23 = NSUnderlyingErrorKey;
  id v24 = v3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  -124LL,  v9));

  unint64_t v11 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfoWrapper);
  -[UASharedPasteboardInfoWrapper setError:](v11, "setError:", v10);
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  0LL));
  id v13 = [v10 code];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v14 setErrorCode:v13];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v15 setUsedStreams:0];

  unint64_t v16 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v17 setTotalTime:v16];

  os_log_t v18 = sub_100039584(@"pasteboard-server");
  os_log_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
    *(_DWORD *)__int128 buf = 138477827;
    id v26 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Pasteboard Sent Info: %{private}@",  buf,  0xCu);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v21 submitDidSendLocalPasteboard:v22];

  [*(id *)(a1 + 32) setLocalInfo:0];
}

void sub_10002A4EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v51 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Received pasteboard info: %@",  buf,  0xCu);
  }

  [*(id *)(a1 + 32) setHasFetchedLocalData:1];
  unint64_t v9 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  mach_absolute_time() - (void)[*(id *)(a1 + 32) localSendStartTime]);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v10 setClientWriteTime:v9];

  id v11 = [v5 dataSize];
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v12 setClientWriteSize:v11];

  double v13 = (double)(uint64_t)[v5 dataSize] * 8.0;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  unint64_t v15 = (unint64_t)(v13 / ((double)(unint64_t)[v14 clientWriteTime] / 1000000000.0));
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localInfo]);
  [v16 setClientWriteSpeed:v15];

  unint64_t v17 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfoWrapper);
  os_log_t v18 = v17;
  if (v6)
  {
    -[UASharedPasteboardInfoWrapper setError:](v17, "setError:", v6);
  }

  else
  {
    os_log_t v19 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardInfo);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    -[UASharedPasteboardInfo setItems:](v19, "setItems:", v20);

    -[UASharedPasteboardInfo setDataSize:](v19, "setDataSize:", [v5 dataSize]);
    -[UASharedPasteboardInfoWrapper setPbinfo:](v18, "setPbinfo:", v19);
  }

  [*(id *)(a1 + 32) setPboardInfoToSend:v18];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);

  if (v21)
  {
    __int128 v22 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pboardFetchSem]);
    dispatch_semaphore_signal(v22);
  }

  NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  id v24 = [v23 pasteboardEmbeddedPayloadSizeLimitInBytes];

  os_log_t v25 = sub_100039584(@"pasteboard-server");
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper pbinfo](v18, "pbinfo"));
    id v28 = [v27 dataSize];
    *(_DWORD *)__int128 buf = 134218240;
    id v51 = v28;
    __int16 v52 = 2048;
    id v53 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] pbsize: %ld, payload size limit: %ld",  buf,  0x16u);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v30)
  {
    id v31 = v30;
    id v41 = v24;
    os_log_t v42 = v18;
    id v43 = v6;
    id v44 = v5;
    char v32 = 0;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v29);
        }
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * (void)i), "types", v41, v42, v43, v44));
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 allKeys]);
        unsigned __int8 v37 = [v36 containsObject:@"public.file-url"];

        v32 |= v37;
      }

      id v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v31);

    id v6 = v43;
    id v5 = v44;
    id v24 = v41;
    os_log_t v18 = v42;
    if ((v32 & 1) != 0) {
      goto LABEL_22;
    }
  }

  else
  {
  }

  int v38 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper pbinfo](v18, "pbinfo"));
  id v39 = [v38 dataSize];

  if ((uint64_t)v39 >= (uint64_t)v24)
  {
LABEL_22:
    uint64_t v40 = a1 + 48;
    goto LABEL_23;
  }

  uint64_t v40 = a1 + 40;
LABEL_23:
  (*(void (**)(void))(*(void *)v40 + 16LL))();
}

void sub_10002A924(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Telling client pboard will be fetched",  buf,  2u);
  }

  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientNotificationConnection]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_10002AA4C;
  v8[3] = &unk_1000BD5C0;
  id v9 = *(id *)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:v8]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002AB60;
  v6[3] = &unk_1000BCDE0;
  id v7 = *(id *)(a1 + 40);
  [v5 pasteboardWillBeFetched:v6];
}

void sub_10002AA4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"pasteboard-server");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error getting client connection for write notification: %@",  (uint8_t *)&v8,  0xCu);
  }

  os_log_t v6 = sub_100039584(@"pasteboard-server");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v_Block_object_dispose(va, 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Attempting to get local pasteboard data",  (uint8_t *)&v8,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10002AB60(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Getting pboard written to file",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002AF94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10002AFD4(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7 = a2;
  int v8 = a4;
  os_log_t v9 = sub_100039584(@"pasteboard-server");
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id WeakRetained = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v43 = 138543362;
      id v44 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error sending types: %{public}@",  (uint8_t *)&v43,  0xCu);
    }

    id v12 = -[__CFString code](v8, "code");
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(a1 + 32));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s localInfo](WeakRetained, "localInfo"));
    [v13 setErrorCode:v12];
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v43 = 138412290;
    id v44 = @"All";
    _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_INFO,  "[PBOARD CONTROLLER] Finished sending types: %@",  (uint8_t *)&v43,  0xCu);
  }

  id v14 = (id *)(a1 + 32);
  id v15 = objc_loadWeakRetained(v14);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localInfo]);
  [v16 setStreamDataSize:a3];

  uint64_t v17 = mach_absolute_time();
  id v18 = objc_loadWeakRetained(v14);
  unint64_t v19 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  v17 - (void)[v18 streamXferStartTime]);

  id v20 = objc_loadWeakRetained(v14);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localInfo]);
  [v21 setStreamDataXferTime:v19];

  uint64_t v22 = mach_absolute_time();
  id v23 = objc_loadWeakRetained(v14);
  unint64_t v24 = +[UADiagnosticUtils absoluteToNSec:]( UADiagnosticUtils,  "absoluteToNSec:",  v22 - (void)[v23 localSendStartTime]);
  id v25 = objc_loadWeakRetained(v14);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 localInfo]);
  [v26 setTotalTime:v24];

  id v27 = objc_loadWeakRetained(v14);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 localInfo]);
  [v28 setStreamDataXferSpeed:(unint64_t)((double)a3 * 8.0 / ((double)v19 / 1000000000.0))];

  id v29 = objc_loadWeakRetained(v14);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 coders]);

  objc_sync_enter(v30);
  id v31 = objc_loadWeakRetained(v14);
  char v32 = (void *)objc_claimAutoreleasedReturnValue([v31 coders]);
  [v32 removeObject:v7];

  objc_sync_exit(v30);
  os_log_t v33 = sub_100039584(@"pasteboard-server");
  os_log_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = objc_loadWeakRetained(v14);
    __int128 v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v35 localInfo]);
    int v43 = 138477827;
    id v44 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Local Pasteboard Sent Info: %{private}@",  (uint8_t *)&v43,  0xCu);
  }

  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
  id v38 = objc_loadWeakRetained(v14);
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 localInfo]);
  [v37 submitDidSendLocalPasteboard:v39];

  id v40 = objc_loadWeakRetained(v14);
  [v40 setLocalInfo:0];

  id v41 = objc_loadWeakRetained(v14);
  os_log_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 pasteAdvertiser]);
  [v42 stop];
}

void sub_10002B3C0(_Unwind_Exception *a1)
{
}

void sub_10002B97C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10002BA00(id a1)
{
  os_log_t v1 = sub_100039584(@"pasteboard-server");
  os_log_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] Client interrupted", v3, 2u);
  }
}

void sub_10002BA6C(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[PBOARD CONTROLLER] Client invalidated",  v11,  2u);
  }

  os_log_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fetchProgress]);

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fetchProgress]);
    [v8 cancel];
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = objc_loadWeakRetained(v4);
    [v10 setClientConnection:v9];
  }

void sub_10002BB50(id a1)
{
  os_log_t v1 = sub_100039584(@"pasteboard-server");
  os_log_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] AUX interrupted", v3, 2u);
  }
}

void sub_10002BBBC(uint64_t a1)
{
  os_log_t v2 = sub_100039584(@"pasteboard-server");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PBOARD CONTROLLER] AUX invalidated", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAuxConnection:0];
}

void sub_10002BC48(uint64_t a1)
{
  os_log_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained controlConnections]);

  objc_sync_enter(v4);
  os_log_t v5 = sub_100039584(@"pasteboard-server");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Controller Connection Invalidated", buf, 2u);
  }

  id v7 = objc_loadWeakRetained(v2);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 controlConnections]);
  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 removeObject:v9];

  id v10 = objc_loadWeakRetained(v2);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 controlConnections]);
  id v12 = [v11 count];

  if (!v12)
  {
    os_log_t v13 = sub_100039584(@"pasteboard-server");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No more active controllers, Re-enabling UC",  v16,  2u);
    }

    id v15 = objc_loadWeakRetained(v2);
    [v15 setScreenWatcherPresent:0];
  }

  objc_sync_exit(v4);
}

void sub_10002BDC8(_Unwind_Exception *a1)
{
}

void sub_10002C184(_Unwind_Exception *a1)
{
}

void sub_10002C1A4(id a1, NSError *a2)
{
  os_log_t v2 = a2;
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    os_log_t v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error connecting to progress UI service: %@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10002C474(_Unwind_Exception *a1)
{
}

id sub_10002C490(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) osxUIConnection]);

  if (!v2)
  {
    os_log_t v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.coreservices.uasharedpasteboardprogressui.xpc",  0LL);
    [*(id *)(a1 + 32) setOsxUIConnection:v3];

    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardProgressUIProtocol));
    int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) osxUIConnection]);
    [v5 setRemoteObjectInterface:v4];

    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) osxUIConnection]);
    [v6 resume];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) osxUIConnection]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:&stru_1000BD6D8]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  [v8 endProgressForUUID:v9 didFail:*(unsigned __int8 *)(a1 + 40)];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) osxUIConnection]);
  [v10 invalidate];

  return [*(id *)(a1 + 32) setOsxUIConnection:0];
}

void sub_10002C5C0(id a1, NSError *a2)
{
  os_log_t v2 = a2;
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    os_log_t v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[PBOARD CONTROLLER] Error connecting to progress UI service: %@",  (uint8_t *)&v5,  0xCu);
  }
}

id sub_10002D4CC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stream:a1 handleEvent:a2];
}

void sub_10002DC0C(_Unwind_Exception *a1)
{
}

LABEL_24:
    goto LABEL_25;
  }

  -[UAStreamHandler setOutMessage:](self, "setOutMessage:", 0LL);
  -[UAStreamHandler setByteIndex:](self, "setByteIndex:", 0LL);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
  id v27 = objc_opt_respondsToSelector(v26, "streams:didWriteMessageWithTag:");

  if ((v27 & 1) != 0)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[UAStreamHandler delegate](self, "delegate"));
    objc_msgSend(v28, "streams:didWriteMessageWithTag:", self, -[UAStreamHandler outMessageTag](self, "outMessageTag"));
  }

void sub_10002EA38(_Unwind_Exception *a1)
{
}

void sub_10002EE2C(_Unwind_Exception *a1)
{
}

void sub_10002EE88(_Unwind_Exception *a1)
{
}

void sub_10002EF30(_Unwind_Exception *a1)
{
}

void sub_10002EFC8(_Unwind_Exception *a1)
{
}

void sub_10002F33C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

id sub_10002F358()
{
  if (qword_1000DE308 != -1) {
    dispatch_once(&qword_1000DE308, &stru_1000BD748);
  }
  return (id)qword_1000DE300;
}

void sub_10002F398(uint64_t a1)
{
  id v2 = sub_10002F400();
  id v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  [v5 setObject:WeakRetained forKey:v4];
}

id sub_10002F400()
{
  if (qword_1000DE318 != -1) {
    dispatch_once(&qword_1000DE318, &stru_1000BD768);
  }
  return (id)qword_1000DE310;
}

void sub_10002F77C(uint64_t a1)
{
  id v2 = sub_10002F400();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  [v4 removeObjectForKey:v3];
}

uint64_t sub_10002F7D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002F824(_Unwind_Exception *a1)
{
}

void sub_10002FE7C(_Unwind_Exception *a1)
{
}

id sub_10002FEE4()
{
  if (qword_1000DE328 != -1) {
    dispatch_once(&qword_1000DE328, &stru_1000BD788);
  }
  return (id)qword_1000DE320;
}

void sub_10002FF24(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id obj = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(obj);
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _releaseAssertion:1];

  objc_sync_exit(obj);
}

void sub_10002FF7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002FF90(uint64_t a1)
{
  os_log_t v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) block]);
  v1[2](v1, 1LL);
}

void sub_1000301D8(_Unwind_Exception *a1)
{
}

void sub_100030204(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Calling block with YES because assertion timed out",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) block]);
  v5[2](v5, 1LL);
}

id sub_100030360(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertion:*(unsigned __int8 *)(a1 + 40)];
}

id sub_1000303DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseAssertion:0];
}

uint64_t sub_1000304A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000304B4(uint64_t a1)
{
}

void sub_1000304BC(uint64_t a1)
{
  id v2 = sub_10002F400();
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 count])
  {
    uint64_t v21 = a1;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"PowerAssertions:"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v22 = v3;
    id obj = (id)objc_claimAutoreleasedReturnValue([v3 objectEnumerator]);
    id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 timerExpiration]);

          if (v10)
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 timerExpiration]);
            id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v11 timeIntervalSinceDate:v12];
            id v14 = sub_10005C02C(v13);
            id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);
          }

          else
          {
            id v15 = @"-";
          }

          else {
            unint64_t v16 = &stru_1000BE738;
          }
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
          [v4 appendFormat:@" %@{%@/%@}", v16, v17, v15];
        }

        id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v6);
    }

    id v18 = [v4 copy];
    uint64_t v19 = *(void *)(*(void *)(v21 + 32) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    os_log_t v3 = v22;
  }
}

void sub_1000307C0(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("UATimedPowerAssertionsMapTableQueue", 0LL);
  id v2 = (void *)qword_1000DE300;
  qword_1000DE300 = (uint64_t)v1;
}

void sub_1000307EC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
  id v2 = (void *)qword_1000DE310;
  qword_1000DE310 = v1;
}

void sub_100030818(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("UATimedPowerAssertionsTimerQueue", 0LL);
  id v2 = (void *)qword_1000DE320;
  qword_1000DE320 = (uint64_t)v1;
}

id sub_100030844(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_autoreleasePoolPush();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 readDataOfLength:a3]);
  id v8 = [v7 length];
  [v7 getBytes:a2 length:v8];

  objc_autoreleasePoolPop(v6);
  return v8;
}

uint64_t sub_1000308B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v6 = a3;
  uint64_t v7 = a3;
  do
  {
    if (*(_DWORD *)a5 == 2 && (*(_BYTE *)(a5 + 8) & 0x10) != 0)
    {
      os_log_t v8 = sub_100039584(@"pasteboard-server");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[UCExtractor] Found ACE Deny Delete, removing",  v11,  2u);
      }

      *(_DWORD *)a5 = 0;
      --v7;
    }

    a5 += 288LL;
    --v6;
  }

  while (v6);
  return v7;
}

uint64_t sub_100030988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uid_t v4 = getuid();
  uint64_t result = getgid();
  *(_BYTE *)a3 |= 3u;
  *(_DWORD *)(a3 + 4) = v4;
  *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = result;
  return result;
}

void sub_100030B40(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "destURL",  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0));
  id v4 = objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = [v4 cStringUsingEncoding:4];

  *((void *)&v12 + 1) = v5;
  *(void *)&__int128 v13 = sub_100030844;
  *((void *)&v16 + 1) = sub_1000308B4;
  *((void *)&v15 + 1) = sub_100030988;
  *(void *)&__int128 v14 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archiveReadHandle]);

  os_log_t v6 = sub_100039584(@"pasteboard-server");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    *(_DWORD *)__int128 buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2080;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[UCExtractor] Extracting archive %@ to url '%s'",  buf,  0x16u);
  }

  int v9 = ParallelArchiveExtract(&v12);
  os_log_t v10 = sub_100039584(@"pasteboard-server");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v1_Block_object_dispose(va, 8) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[UCExtractor] Extract status: %d", buf, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_1000319D4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  os_log_t v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nextPacketReady]);
  dispatch_time_t v4 = dispatch_time(0LL, 2000000000LL);
  uint64_t v5 = dispatch_semaphore_wait(v3, v4);

  os_log_t v6 = sub_100039584(@"pasteboard-server");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[Packager] Delivery signaled", (uint8_t *)v22, 2u);
  }

  os_log_t v8 = *(void **)(a1 + 32);
  if (v5)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 receiver]);
    [v9 filePackagerError:0];
  }

  else
  {
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 queuedPackets]);
    objc_sync_enter(v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedPackets]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    if (v9)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedPackets]);
      [v12 removeObjectAtIndex:0];
    }

    objc_msgSend( *(id *)(a1 + 32),  "setNextPacketToDeliver:",  (char *)objc_msgSend(*(id *)(a1 + 32), "nextPacketToDeliver") + 1);
    objc_sync_exit(v10);

    if (sub_1000397F4((int)[v9 packetNumber], (int)objc_msgSend(*(id *)(a1 + 32), "totalPacketCount")))
    {
      os_log_t v13 = sub_100039584(@"pasteboard-server");
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v15 = [v9 packetNumber];
        unsigned int v16 = [*(id *)(a1 + 32) totalPacketCount];
        v22[0] = 67109376;
        v22[1] = v15;
        __int16 v23 = 1024;
        unsigned int v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "[Packager] Delivering packet %d/%d",  (uint8_t *)v22,  0xEu);
      }
    }

    if (v9)
    {
      id v18 = *(void **)(a1 + 32);
      uint64_t v17 = (id *)(a1 + 32);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 receiver]);
      id v20 = *v17;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 packetData]);
      objc_msgSend(v19, "packager:gotData:forPacket:", v20, v21, objc_msgSend(v9, "packetNumber"));

      [*v17 checkShouldFetch];
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100031C4C(_Unwind_Exception *a1)
{
}

void sub_100031D40(_Unwind_Exception *a1)
{
}

void sub_100031D54(uint64_t a1)
{
  if (sub_1000397F4(*(_DWORD *)(a1 + 40), (int)[*(id *)(a1 + 32) totalPacketCount]))
  {
    os_log_t v2 = sub_100039584(@"pasteboard-server");
    os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      unsigned int v5 = [*(id *)(a1 + 32) totalPacketCount];
      v12[0] = 67109376;
      v12[1] = v4;
      __int16 v13 = 1024;
      unsigned int v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[Packager] Reading packet data %d/%d",  (uint8_t *)v12,  0xEu);
    }
  }

  os_log_t v6 = objc_alloc_init(&OBJC_CLASS___UCFilePackagerPacket);
  -[UCFilePackagerPacket setPacketNumber:](v6, "setPacketNumber:", *(void *)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) file]);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readDataOfLength:", objc_msgSend(*(id *)(a1 + 32), "packetSize")));
  -[UCFilePackagerPacket setPacketData:](v6, "setPacketData:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedPackets]);
  objc_sync_enter(v9);
  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queuedPackets]);
  [v10 addObject:v6];

  objc_sync_exit(v9);
  id v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nextPacketReady]);
  dispatch_semaphore_signal(v11);

  [*(id *)(a1 + 32) checkShouldFetch];
}

void sub_100031EF8(_Unwind_Exception *a1)
{
}

void sub_100031FA4(_Unwind_Exception *a1)
{
}

void sub_100032498(_Unwind_Exception *a1)
{
  os_log_t v8 = v7;

  _Unwind_Resume(a1);
}

void sub_100032660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___UAActivityReplay;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100032820(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000329A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032AB8(void *a1)
{
  os_log_t v2 = (void *)a1[4];
  if (v2
    && [v2 count]
    && (id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  a1[4],  0LL,  0LL))) != 0LL)
  {
    os_log_t v3 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
  }

  else
  {
    id v9 = 0LL;
    os_log_t v3 = &stru_1000BE738;
  }

  unsigned int v5 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  if (v4)
  {
    id v6 = sub_1000034D8(v4);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v7 = @"-";
  }

  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BROADCAST $%@ %@\n",  v7,  v3));
  [v5 sendResponse:v8];

  if (v4) {
}
  }

void sub_100032BB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

void sub_100033078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100033190(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"0123456789abcdefABCDEF$"));
  if (a2 && ![v3 scanString:@"[" intoString:0])
  {
    id v6 = 0LL;
LABEL_8:
    os_log_t v8 = 0LL;
    goto LABEL_9;
  }

  id v11 = 0LL;
  unsigned int v5 = [v3 scanCharactersFromSet:v4 intoString:&v11];
  id v6 = v11;
  id v7 = sub_1000035C0(v6);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
LABEL_9:
  id v9 = v8;

  return v9;
}

void sub_100033284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034450( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

id sub_1000348C0(void *a1)
{
  id v1 = a1;
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"0123456789abcdefABCDEF-"));
  id v6 = 0LL;
  unsigned __int8 v3 = [v1 scanCharactersFromSet:v2 intoString:&v6];
  id v4 = v6;

  if ((v3 & 1) == 0)
  {

    id v4 = 0LL;
  }

  return v4;
}

void sub_100034948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100034964(void *a1)
{
  id v1 = a1;
  if ([v1 scanString:@"" intoString:0])
  {
    id v11 = 0LL;
    unsigned int v2 = [v1 scanUpToString:@"" intoString:&v11];
    id v3 = v11;
    unsigned __int8 v4 = [v1 scanString:@"" intoString:0];
    goto LABEL_9;
  }

  if (![v1 scanString:@"'" intoString:0])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    id v9 = 0LL;
    unsigned __int8 v8 = [v1 scanUpToCharactersFromSet:v7 intoString:&v9];
    id v3 = v9;

    if ((v8 & 1) != 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v10 = 0LL;
  unsigned int v5 = [v1 scanUpToString:@"'" intoString:&v10];
  id v3 = v10;
  if (!v5 || ([v1 scanString:@"'" intoString:0] & 1) == 0)
  {
    unsigned __int8 v4 = [v1 scanString:@"'" intoString:0];
LABEL_9:
    if ((v4 & 1) == 0)
    {
LABEL_10:

      id v3 = 0LL;
    }
  }

void sub_100034AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034B00(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100034BE8;
  v11[3] = &unk_1000BD800;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void sub_100034BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034BE8(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = sub_10005BD28(*(void **)(a1 + 32), 32LL);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)__int128 buf = 138478083;
    unsigned int v16 = v5;
    __int16 v17 = 2113;
    uint64_t v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "REPLAY: PULLPAYLOAD request, got encodedData %{private}@ from creating application for advertisementPayload %{priv ate}@, so returning that to paired client over the network.",  buf,  0x16u);
  }

  BOOL v7 = *(void *)(a1 + 48) == 0LL;
  unsigned __int8 v8 = *(void **)(a1 + 56);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) advertisementPayload]);
  id v10 = sub_1000034D8(v9);
  if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v14 = sub_1000034D8(*(void **)(a1 + 32));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RETURNPAYLOAD $%@ [$%@]\n",  v11,  v12));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RETURNPAYLOADERROR $%@ %@\n",  v11,  v12));
  }

  [v8 sendResponse:v13];
}

void sub_100034D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100034EE8(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    int v5 = 1;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v5 &= objc_msgSend( *(id *)(a1 + 40),  "processCommand:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i),  (void)v8);
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100035004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000350FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_100035424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035A30(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairedScanner]);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peer]);
  [v3 receiveAdvertisement:v5 options:v4 fromPeer:v6];

  objc_autoreleasePoolPop(v2);
}

void sub_100035B44(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairedScanner]);

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairedScanner]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));

    (*(void (**)(void, void *, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v6, 0LL);
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -50LL,  0LL));
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v6);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100035CEC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pairedScanner]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  unsigned int v6 = [v3 isEqual:v5];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v6)
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pairedScanner]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peer]);
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v9, 0LL);
  }

  else
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -50LL,  0LL));
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v8);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100035E68(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_100035FB4(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100036078;
  v8[3] = &unk_1000BD8A0;
  id v9 = *(id *)(a1 + 64);
  [v3 activityAdvertiser:v4 activityPayloadForAdvertisementPayload:v5 command:v6 requestedByDevice:v7 withCompletionHandler:v8];

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100036078(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100036280(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = [[SFActivityAdvertisement alloc] initWithAdvertisementVersion:1 advertisementPayload:*(void *)(a1 + 32) options:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 56) sendFoundDevice])
  {
    [*(id *)(a1 + 56) setSendFoundDevice:0];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) delegate]);
    uint64_t v5 = *(void **)(a1 + 56);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 peer]);
    [v4 activityScanner:v5 foundDeviceWithDevice:v6];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) delegate]);
  [v7 activityScanner:*(void *)(a1 + 56) receivedAdvertisement:v3];

  objc_autoreleasePoolPop(v2);
}

void sub_100036438(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairedAdvertiser]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peer]);
  [v3 payloadRequestFromPeer:v4 advertisementPayload:*(void *)(a1 + 40) command:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];

  objc_autoreleasePoolPop(v2);
}

void sub_10003658C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003664C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100036880( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000368D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036E18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  sub_100037598((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100036F34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, _OWORD *a7, mach_port_name_t *a8, vm_address_t *a9, _DWORD *a10, void *a11)
{
  unsigned int v17 = a1;
  uint64_t v51 = a2;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UASimulatorController simulatorControllerForCommandPort:]( &OBJC_CLASS___UASimulatorController,  "simulatorControllerForCommandPort:",  a1));
  pid_t pidp = 0;
  __int128 v19 = a7[1];
  *(_OWORD *)atoken.val = *a7;
  *(_OWORD *)&atoken.val[4] = v19;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  uint64_t v20 = pidp;
  os_log_t v21 = sub_100039584(0LL);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 134218496;
    *(void *)&atoken.val[1] = a6;
    LOWORD(atoken.val[3]) = 1024;
    *(unsigned int *)((char *)&atoken.val[3] + 2) = v17;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "SIMULATOR: RegisterWithParentWithVersion simulatorVersion=%llu, serverPort=%x pid=%d",  (uint8_t *)&atoken,  0x18u);
  }

  if (!v18)
  {
    uint64_t v29 = 5LL;
    goto LABEL_25;
  }

  os_log_t v23 = sub_100039584(0LL);
  unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 68289282;
    atoken.val[1] = 16;
    LOWORD(atoken.val[2]) = 2098;
    *(void *)((char *)&atoken.val[2] + 2) = &v51;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "SIMULATOR: Creating UASimulator to be parent simulator in OSX, uuid=%{public,posix:uuid}.16P port=%x",  (uint8_t *)&atoken,  0x18u);
  }

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UASimulator simulatorWithController:pairedPort:childSimPid:childVersion:]( &OBJC_CLASS___UASimulator,  "simulatorWithController:pairedPort:childSimPid:childVersion:",  v18,  a3,  v20,  a6));
  if (a6 == 1)
  {
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___UAPeerDevice);
    id v31 = sub_100006B98(v30, a4, a5, 0);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v31);
    [v25 setPeeredDevice:v28];
  }

  else
  {
    if (a6 != 2)
    {
      os_log_t v43 = sub_100039584(0LL);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        atoken.val[0] = 134217984;
        *(void *)&atoken.val[1] = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "SIMULATOR: Failed to create simulator; simulated useractivityd client version %ld is unknown.",
          (uint8_t *)&atoken,
          0xCu);
      }

      uint64_t v29 = 5LL;
      goto LABEL_21;
    }

    uint64_t v26 = objc_opt_class(&OBJC_CLASS___SFPeerDevice);
    id v27 = sub_100006B98(v26, a4, a5, 0);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    [v25 setPeeredDevice:v28];
  }

  if (v25)
  {
    [v18 addSimulator:v25];
    char v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 dispatchQ]);
    dispatch_source_t v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)v20, 0x80000000uLL, v32);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100037490;
    handler[3] = &unk_1000BD940;
    int v50 = v20;
    id v34 = v25;
    id v47 = v34;
    id v48 = v18;
    id v35 = v33;
    uint64_t v49 = v35;
    dispatch_source_set_event_handler((dispatch_source_t)v35, handler);
    dispatch_resume((dispatch_object_t)v35);
    mach_port_name_t v36 = [v34 commandPort];
    *a8 = v36;
    mach_port_insert_right(mach_task_self_, v36, v36, 0x14u);
    id v37 = (id)objc_claimAutoreleasedReturnValue(+[SFPeerDevice peerForSelf](&OBJC_CLASS___SFPeerDevice, "peerForSelf"));
    if (v37
      && (v38 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL),  -[NSKeyedArchiver encodeObject:forKey:](v38, "encodeObject:forKey:", v37, NSKeyedArchiveRootObjectKey),  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v38, "encodedData")),  v38,  (id v40 = v39) != 0LL))
    {
      id v41 = v40;
      if (vm_allocate(mach_task_self_, a9, (vm_size_t)[v40 length], 1))
      {
        id v42 = v41;
      }

      else
      {
        *a10 = [v41 length];
        __int128 v45 = (void *)*a9;
        id v42 = v41;
        memcpy(v45, [v42 bytes], (size_t)objc_msgSend(v42, "length"));
      }
    }

    else
    {
      id v42 = 0LL;
      *a9 = 0LL;
      *a10 = 0;
    }

    [v34 resume];
    uint64_t v29 = 0LL;
LABEL_21:

    goto LABEL_23;
  }

  uint64_t v29 = 5LL;
LABEL_23:
  if (a11) {
    *a11 = 2LL;
  }
LABEL_25:

  return v29;
}

void sub_1000373F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037490(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 56);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Detected death of child simulator, pid=%d, so terminating the UASimulator and removing it.",  (uint8_t *)v5,  8u);
  }

  [*(id *)(a1 + 32) terminate];
  [*(id *)(a1 + 40) removeSimulator:*(void *)(a1 + 32)];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

uint64_t sub_100037550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _OWORD *a6, mach_port_name_t *a7, vm_address_t *a8, _DWORD *a9)
{
  uint64_t v12 = 0LL;
  __int128 v9 = a6[1];
  v11[0] = *a6;
  v11[1] = v9;
  return sub_100036F34(a1, a2, a3, a4, a5, 1LL, v11, a7, a8, a9, &v12);
}

uint64_t sub_100037598(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 12))
  {
    if (*(void *)a1)
    {
      vm_size_t v2 = *(unsigned int *)(a1 + 8);
      if ((_DWORD)v2) {
        vm_deallocate(mach_task_self_, *(void *)a1, v2);
      }
    }
  }

  return a1;
}

void sub_1000377A8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___UAUserActivityDefaults);
  vm_size_t v2 = (void *)qword_1000DE340;
  qword_1000DE340 = (uint64_t)v1;
}

void sub_100037868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000379D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003809C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000381E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003822C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000382C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003835C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000383A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000383F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003848C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000384E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100038538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003858C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000385E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003862C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038680( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000386D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000387CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000388C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003891C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000389C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10003907C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

LABEL_7:
}

void sub_1000391A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000391E0(id a1)
{
  int out_token = 0;
  if (!notify_register_check("com.apple.system.lowpowermode", &out_token)) {
    dword_1000DE358 = out_token;
  }
}

os_log_t sub_100039584(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    vm_size_t v2 = getenv("_UALOGGINGCATEGORY");
    if (!v2
      || (id v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v2,  4LL))) == 0LL)
    {
      id v1 = @"main";
    }
  }

  if (pthread_mutex_lock(&stru_1000DDE48))
  {
    os_log_t v3 = 0LL;
  }

  else
  {
    int v4 = (void *)qword_1000DE360;
    if (!qword_1000DE360)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v6 = (void *)qword_1000DE360;
      qword_1000DE360 = v5;

      int v4 = (void *)qword_1000DE360;
    }

    os_log_t v3 = (os_log_t)objc_claimAutoreleasedReturnValue([v4 objectForKey:v1]);
    if (!v3)
    {
      uint64_t v7 = v1;
      os_log_t v8 = os_log_create( "com.apple.useractivity",  (const char *)-[__CFString cStringUsingEncoding:](v7, "cStringUsingEncoding:", 4LL));
      if (v8)
      {
        os_log_t v3 = v8;
        [(id)qword_1000DE360 setValue:v8 forKey:v7];
      }

      else
      {
        os_log_t v3 = (os_log_t)&_os_log_default;
        id v9 = &_os_log_default;
      }
    }

    pthread_mutex_unlock(&stru_1000DDE48);
  }

  return v3;
}

void sub_1000396C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_1000396D8(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, v1, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
    if ((unint64_t)-[__CFData length](Data, "length") > 0xFFFFFFFE)
    {
      os_log_t v3 = 0LL;
    }

    else
    {
      os_log_t v3 = (char *)malloc((size_t)-[__CFData length](Data, "length") + 200);
      *(_DWORD *)os_log_t v3 = 1;
      *((_DWORD *)v3 + 1) = -[__CFData length](Data, "length");
      bzero(v3 + 8, 0x40uLL);
      bzero(v3 + 72, 0x40uLL);
      bzero(v3 + 136, 0x40uLL);
      strlcpy(v3 + 136, "UAUserActivity", 0x40uLL);
      memcpy(v3 + 200, -[__CFData bytes](Data, "bytes"), *((unsigned int *)v3 + 1));
    }
  }

  else
  {
    os_log_t v3 = 0LL;
  }

  return v3;
}

void sub_1000397D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000397F4(int a1, int a2)
{
  return a1 == 1
      || (int)((double)(a1 - 1) / (double)a2 * 10.0) % 10 != (int)((double)a1 / (double)a2 * 10.0) % 10
      || a1 == a2;
}

id sub_100039868()
{
  if (qword_1000DE370 != -1) {
    dispatch_once(&qword_1000DE370, &stru_1000BD9A0);
  }
  return (id)qword_1000DE368;
}

void sub_1000398A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.useractivity", "biome-69594900");
  vm_size_t v2 = (void *)qword_1000DE368;
  qword_1000DE368 = (uint64_t)v1;

  os_log_t v3 = (os_log_s *)qword_1000DE368;
  if (os_log_type_enabled((os_log_t)qword_1000DE368, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "- UAUserActivity\tv1.0", v4, 2u);
  }

void sub_100039968(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___UADiagnosticManager);
  vm_size_t v2 = (void *)qword_1000DE378;
  qword_1000DE378 = (uint64_t)v1;
}

id UActivityCreationXPCServiceName()
{
  return sub_10003A3CC("_UAUSERACTIVITYCREATION", @"com.apple.coreservices.lsuseractivitymanager.xpc");
}

id sub_10003A3CC(const char *a1, void *a2)
{
  id v3 = a2;
  int v4 = getenv(a1);
  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v4, 4LL));
    os_log_t v6 = sub_100039584(0LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543618;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Using service name %{public}@ for %{public}@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else
  {
    id v5 = v3;
  }

  return v5;
}

id UABestAppSuggestionManagerServiceName()
{
  return sub_10003A3CC("_UAUSERACTIVITYBESTAPP", @"com.apple.coreservices.lsbestappsuggestionmanager.xpc");
}

id UASharedPasteboardManagerServiceName()
{
  return sub_10003A3CC("_UAUSERACTIVITYPASTEBOARD", @"com.apple.coreservices.uasharedpasteboardmanager.xpc");
}

id UASharedPasteboardAUXServiceName()
{
  return sub_10003A3CC("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardaux.xpc");
}

id UASharedPasteboardControllServiceName()
{
  return sub_10003A3CC("_UAUSERACTIVITYPASTEBOARDAUX", @"com.apple.coreservices.uasharedpasteboardcontroll.xpc");
}

id sub_10003A518()
{
  if (qword_1000DE390 != -1) {
    dispatch_once(&qword_1000DE390, &stru_1000BD9E0);
  }
  return (id)qword_1000DE388;
}

void sub_10003A558(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UAUserActivityClientProtocol));
  vm_size_t v2 = (void *)qword_1000DE388;
  qword_1000DE388 = v1;

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UAUserActivityInfo);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
  id v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
  id v15 = (id)objc_claimAutoreleasedReturnValue(v10);
  [(id)qword_1000DE388 setClasses:v15 forSelector:"doUpdateUserActivityInfo:makeCurrent:completionHandler:" argumentIndex:0 ofReply:0];
  [(id)qword_1000DE388 setClasses:v15 forSelector:"doFetchUserActivityInfoWithUUID:completionHandler:" argumentIndex:0 ofReply:1];
  [(id)qword_1000DE388 setClasses:v15 forSelector:"doPinUserActivityInfo:completionHandler:" argumentIndex:0 ofReply:0];
  __int16 v11 = (void *)qword_1000DE388;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___UAUserActivityProxy),  0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v11 setClasses:v14 forSelector:"doGetUserActivityProxiesWithOptions:completionHandler:" argumentIndex:0 ofReply:1];
}

id sub_10003A71C()
{
  if (qword_1000DE3A0 != -1) {
    dispatch_once(&qword_1000DE3A0, &stru_1000BDA00);
  }
  return (id)qword_1000DE398;
}

void sub_10003A75C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UAUserActivityClientResponseProtocol));
  vm_size_t v2 = (void *)qword_1000DE398;
  qword_1000DE398 = v1;
}

id sub_10003A790()
{
  if (qword_1000DE3B0 != -1) {
    dispatch_once(&qword_1000DE3B0, &stru_1000BDA20);
  }
  return (id)qword_1000DE3A8;
}

void sub_10003A7D0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UABestAppSuggestionManagerProtocol));
  vm_size_t v2 = (void *)qword_1000DE3A8;
  qword_1000DE3A8 = v1;

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UAUserActivityInfo);
  uint64_t v4 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, objc_opt_class(&OBJC_CLASS___NSArray), 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  [(id)qword_1000DE3A8 setClasses:v5 forSelector:"doDetermineBestAppSuggestionWithCompletionHandler:" argumentIndex:0 ofReply:1];
}

id sub_10003A87C()
{
  if (qword_1000DE3C0 != -1) {
    dispatch_once(&qword_1000DE3C0, &stru_1000BDA40);
  }
  return (id)qword_1000DE3B8;
}

void sub_10003A8BC(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UABestAppSuggestionManagerResponseProtocol));
  vm_size_t v2 = (void *)qword_1000DE3B8;
  qword_1000DE3B8 = v1;

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UAUserActivityInfo);
  uint64_t v4 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, objc_opt_class(&OBJC_CLASS___NSArray), 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  [(id)qword_1000DE3B8 setClasses:v5 forSelector:"notifyBestAppsChanged:when:confidence:" argumentIndex:0 ofReply:0];
}

id sub_10003A968()
{
  if (qword_1000DE3D0 != -1) {
    dispatch_once(&qword_1000DE3D0, &stru_1000BDA60);
  }
  return (id)qword_1000DE3C8;
}

void sub_10003A9A8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardManagerProtocol));
  vm_size_t v2 = (void *)qword_1000DE3C8;
  qword_1000DE3C8 = v1;

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfo);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardItemInfo);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardTypeInfo);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v13,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [(id)qword_1000DE3C8 setClasses:v15 forSelector:"localPasteboardTypesDidChange:forGeneration:" argumentIndex:0 ofReply:0];
  [(id)qword_1000DE3C8 setClasses:v15 forSelector:"fetchRemotePasteboardTypesForProcess:withCompletion:" argumentIndex:0 ofReply:1];
  [(id)qword_1000DE3C8 setClasses:v15 forSelector:"fetchRemotePasteboardForProcess:withCompletion:" argumentIndex:0 ofReply:1];
}

id sub_10003AB58()
{
  if (qword_1000DE3E0 != -1) {
    dispatch_once(&qword_1000DE3E0, &stru_1000BDA80);
  }
  return (id)qword_1000DE3D8;
}

void sub_10003AB98(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardManagerResponseProtocol));
  vm_size_t v2 = (void *)qword_1000DE3D8;
  qword_1000DE3D8 = v1;

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardInfo);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardItemInfo);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardTypeInfo);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [(id)qword_1000DE3D8 setClasses:v15 forSelector:"writeLocalPasteboardToFile:itemDir:withCompletion:" argumentIndex:0 ofReply:1];
  [(id)qword_1000DE3D8 setClasses:v15 forSelector:"writeLocalPasteboardToFile:itemDir:extension:withCompletion:" argumentIndex:0 ofReply:1];
}

id sub_10003AD30()
{
  if (qword_1000DE3F0 != -1) {
    dispatch_once(&qword_1000DE3F0, &stru_1000BDAA0);
  }
  return (id)qword_1000DE3E8;
}

void sub_10003AD70(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardAUXProtocol));
  vm_size_t v2 = (void *)qword_1000DE3E8;
  qword_1000DE3E8 = v1;
}

id sub_10003ADA4()
{
  if (qword_1000DE400 != -1) {
    dispatch_once(&qword_1000DE400, &stru_1000BDAC0);
  }
  return (id)qword_1000DE3F8;
}

void sub_10003ADE4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UASharedPasteboardControllProtocol));
  vm_size_t v2 = (void *)qword_1000DE3F8;
  qword_1000DE3F8 = v1;
}

void sub_10003B288(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  *(void *)(a1 + 32),  1LL,  0LL));
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
    [v3 log:5, @"ITEM:%@ %@ [0x%@]\n", v5, v6, v7 format];
  }

int64_t sub_10003BBB8(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  if (!sub_10005C3C4((uint64_t)-[UAUserActivityInfo type](v4, "type"))
    && sub_10005C3C4((uint64_t)-[UAUserActivityInfo type](v5, "type"))
    || (uint64_t v6 = objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v5, "dynamicActivityType"))) != 0
    && (id v7 = (void *)v6,
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo dynamicActivityType](v4, "dynamicActivityType")),
        v8,
        v7,
        !v8))
  {
    int64_t v12 = 1LL;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](v5, "when"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](v4, "when"));
    BOOL v11 = sub_10005BA4C(v9, v10);

    if (v11) {
      int64_t v12 = 1LL;
    }
    else {
      int64_t v12 = -1LL;
    }
  }

  return v12;
}

void sub_10003BFA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10003BFC0(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained manager]);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 mainDispatchQ]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_10003C09C;
  v8[3] = &unk_1000BD630;
  objc_copyWeak(&v10, a1);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
}

void sub_10003C09C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleAppStateMonitorUpdate:*(void *)(a1 + 32)];
}

void sub_10003C4F0(_Unwind_Exception *a1)
{
}

void sub_10003C518(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) auditToken]);
    unsigned int v7 = [v6 pid];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v9 = sub_10005BF18(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11[0] = 67109379;
    v11[1] = v7;
    __int16 v12 = 2113;
    uint64_t v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "-- Initial process info, for pid %d, is %{private}@",  (uint8_t *)v11,  0x12u);
  }

  [*(id *)(a1 + 40) handleAppStateMonitorUpdate:v3];
}

void sub_10003C8CC(_Unwind_Exception *a1)
{
}

void sub_10003C928(_Unwind_Exception *a1)
{
}

void sub_10003CA9C(_Unwind_Exception *a1)
{
}

void sub_10003CB4C(_Unwind_Exception *a1)
{
}

void sub_10003CBB8(_Unwind_Exception *a1)
{
}

void sub_10003CC58(_Unwind_Exception *a1)
{
}

void sub_10003CCF4(_Unwind_Exception *a1)
{
}

void sub_10003CD7C(_Unwind_Exception *a1)
{
}

void sub_10003D258(_Unwind_Exception *a1)
{
}

LABEL_53:
  }
}

void sub_10003D9E4(_Unwind_Exception *a1)
{
}

void sub_10003E704(_Unwind_Exception *a1)
{
}

int64_t sub_10003E940(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 lastFrontTime]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastFrontTime]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10003EAD8(_Unwind_Exception *a1)
{
}

LABEL_35:
        }

        mach_port_name_t v36 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
      }

      while (v36);
    }

    [v34 appendString:@"}\n"];
    unsigned int v17 = v32;
  }

  objc_sync_exit(v38);
  return v34;
}

      if (v17)
      {
        os_log_t v43 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:_LSUserActivityContainsFileProviderURLKey]);
        id v44 = [v43 BOOLValue];

        if (v44) {
          v18[15] |= 2u;
        }
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey]);
        __int128 v46 = [v45 BOOLValue];

        if (v46) {
          v18[15] |= 4u;
        }
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"UAPasteboardAvailable"]);
        id v48 = [v47 BOOLValue];

        if (v48)
        {
          v18[15] |= 8u;
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"UAPasteboardVersionBit"]);
          int v50 = [v49 BOOLValue];

          if (v50) {
            v18[15] |= 0x10u;
          }
        }

        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:UAUserActivityAutoPullActivitiesListKey]);
        __int16 v52 = [v51 BOOLValue];

        if (v52) {
          v18[15] |= 0x20u;
        }
        id v53 = (void *)objc_claimAutoreleasedReturnValue( [v17 objectForKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"]);
        v54 = [v53 BOOLValue];

        if (v54) {
          v18[15] |= 0x40u;
        }
        id v55 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"UAUserActivityItemIsNotActiveKey"]);
        v56 = [v55 BOOLValue];

        if (v56) {
          v18[15] |= 0x80u;
        }
        id v57 = [v17 copy];
        os_log_t v58 = (void *)*((void *)v18 + 5);
        *((void *)v18 + 5) = v57;
      }

      id v59 = v74;
      if (!v74) {
        id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      }
      [v18 setWhen:v59];
      if (!v74) {

      }
      v60 = (id)objc_claimAutoreleasedReturnValue([v18 when]);
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[SharingBTLEAdvertisementPayload dateEpochStart:]( &OBJC_CLASS___SharingBTLEAdvertisementPayload,  "dateEpochStart:",  v60));
      [v60 timeIntervalSinceDate:v61];
      os_log_t v63 = fmax(trunc(v62) * 0.25, 0.0);
      id v64 = (int)v63;
      if (v63 > 124.0) {
        LOBYTE(v64) = -1;
      }
      if (a9) {
        os_log_t v65 = v64 | 0x80;
      }
      else {
        os_log_t v65 = v64;
      }

      v18[16] = v65;
      __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v18 when]);
      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue( +[SharingBTLEAdvertisementPayload dateEpochStart:]( &OBJC_CLASS___SharingBTLEAdvertisementPayload,  "dateEpochStart:",  v66));
      [v18 setEpochStart:v67];

LABEL_60:
      goto LABEL_61;
    }

    if (a3 != 1)
    {
      if (a3 == 2)
      {
        __int128 v25 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType(kCFAllocatorDefault, v20, v19);
        uint64_t v22 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  @"NOTIFICATION",  v25));

        os_log_t v23 = 4LL;
      }

      goto LABEL_23;
    }

    if ([v19 isEqual:@"NSUserActivityTypeBrowsingWeb"])
    {
      id v27 = objc_claimAutoreleasedReturnValue([v21 host]);
      os_log_t v23 = 2LL;
    }

    else
    {
      if ([v19 isEqual:@"com.apple.GameController"])
      {
        id v27 = _LSCopyAdvertisementStringForTeamIdentifierAndActivityType(kCFAllocatorDefault, &stru_1000BE738, v19);
      }

      else
      {
        if ([v69 length])
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v19,  v69));
          uint64_t v22 = (id)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType(kCFAllocatorDefault, v20, v28);

          os_log_t v23 = 1LL;
          goto LABEL_23;
        }

        id v27 = _LSCopyAdvertisementStringForTeamIdentifierAndActivityType(kCFAllocatorDefault, v20, v19);
      }

      os_log_t v23 = 1LL;
    }

    uint64_t v22 = (id)v27;
    goto LABEL_23;
  }

void sub_10003EFC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id obj)
{
}

int64_t sub_10003F014(id a1, UAUserActivityClientProcess *a2, UAUserActivityClientProcess *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](a2, "auditToken"));
  unsigned int v6 = [v5 pid];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](v4, "auditToken"));

  int64_t v8 = (int)(v6 - [v7 pid]);
  return v8;
}

id sub_10003F088(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void sub_10003F464(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    id v14 = [v5 length];
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@",  (uint8_t *)&v13,  0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v9 > 0.0)
  {
    unsigned int v10 = vcvtpd_s64_f64(v9);
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      LODWORD(v14) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Adding %d delay for testing",  (uint8_t *)&v13,  8u);
    }

    sleep(v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003F80C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    id v14 = [v5 length];
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@",  (uint8_t *)&v13,  0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v9 > 0.0)
  {
    unsigned int v10 = vcvtpd_s64_f64(v9);
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      LODWORD(v14) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Adding %d delay for testing",  (uint8_t *)&v13,  8u);
    }

    sleep(v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003FBB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"pasteboard-server");
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    id v14 = [v5 length];
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting complete: %lu bytes, error: %@",  (uint8_t *)&v13,  0x16u);
  }

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  if (v9 > 0.0)
  {
    unsigned int v10 = vcvtpd_s64_f64(v9);
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      LODWORD(v14) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Adding %d delay for testing",  (uint8_t *)&v13,  8u);
    }

    sleep(v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003FE60(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___UABluetoothStatus);
  vm_size_t v2 = (void *)qword_1000DE408;
  qword_1000DE408 = (uint64_t)v1;
}

void sub_1000400DC(_Unwind_Exception *a1)
{
}

id sub_1000401A4()
{
  if (qword_1000DE420 != -1) {
    dispatch_once(&qword_1000DE420, &stru_1000BDC60);
  }
  return (id)qword_1000DE418;
}

void sub_1000401E4(uint64_t a1)
{
  __int16 v15 = sub_100040380;
  id v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = sub_1000401A4();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = BTSessionAttachWithQueue("userActivityBTStatus", &v15, v2, v5);

  id v7 = *v3;
  objc_sync_enter(v7);
  if (v6)
  {
    os_log_t v8 = sub_100039584(0LL);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67240192;
      int v17 = v6;
      unsigned int v10 = "BLUETOOTH: Failed to attach to BTSession, result=%{public}d";
      os_log_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, 8u);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 1;
    os_log_t v13 = sub_100039584(0LL);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24LL);
      *(_DWORD *)__int128 buf = 67109120;
      int v17 = v14;
      unsigned int v10 = "BLUETOOTH: Attached to BTSession, setting attached to %{BOOL}d.";
      os_log_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 25LL) = 0;
  objc_sync_exit(v7);
}

void sub_100040360(_Unwind_Exception *a1)
{
}

id sub_100040380(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleSessionEvent:a1 event:a2 result:a3];
}

void sub_100040458(uint64_t a1)
{
  int v1 = BTSessionDetachWithQueue(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67240192;
    v4[1] = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "BLUETOOTH: Detached from BTSession, result=%{public}d, setting attached to NO.",  (uint8_t *)v4,  8u);
  }
}

void sub_1000406AC(_Unwind_Exception *a1)
{
}

void sub_1000407C8(_Unwind_Exception *a1)
{
}

void sub_1000408B0(_Unwind_Exception *a1)
{
}

void sub_1000408C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(0LL);
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = objc_retainBlock(v6);
    int v10 = *(unsigned __int8 *)(a1 + 32);
    int v11 = 138543874;
    id v12 = v5;
    __int16 v13 = 2050;
    id v14 = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "BLUETOOTH: Letting callback %{public}@/%{public}p know that the power status is now %{BOOL}d",  (uint8_t *)&v11,  0x1Cu);
  }

  (*((void (**)(id, id, void))v6 + 2))(v6, v5, *(unsigned __int8 *)(a1 + 32));
}

void sub_100040DB8(_Unwind_Exception *a1)
{
}

id sub_100040DE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 handleLocalDeviceCallback:a1 event:a2 result:a3];
}

void sub_100040F74(_Unwind_Exception *a1)
{
}

void sub_10004108C(_Unwind_Exception *a1)
{
}

id sub_1000411C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) processCallbacks];
}

void sub_1000411DC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("bluetoothStatusQ", 0LL);
  os_log_t v2 = (void *)qword_1000DE418;
  qword_1000DE418 = (uint64_t)v1;
}

void sub_100041688(_Unwind_Exception *a1)
{
}

LABEL_43:
    self = v13;
LABEL_44:

    goto LABEL_45;
  }

  id v14 = 0LL;
LABEL_45:

  return v14;
}

      uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -105LL,  0LL));
      (*((void (**)(id, void, void, id))v15 + 2))(v15, 0LL, 0LL, v29);
      goto LABEL_44;
    }

    if (-[__CFString isEqualToString:](v13, "isEqualToString:", @"pbpaste2"))
    {
      id v48 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      uint64_t v49 = [v48 clipboardSharingEnabled];

      if (!v49) {
        goto LABEL_43;
      }
      int v50 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 pasteboardController]);
      __int16 v52 = v51 == 0LL;

      if (v52) {
        goto LABEL_45;
      }
      id v53 = sub_100039584(@"pasteboard-server");
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 name]);
        *(_DWORD *)__int128 buf = 138543619;
        __int128 v79 = v55;
        os_log_t v80 = 2113;
        __int128 v81 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[PBOARD] Paste V2 Requested from remote %{public}@/%{private}@",  buf,  0x16u);
      }

      id v57 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      os_log_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 pasteboardController]);
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v58 uuid]);

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 pasteboardController]);
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472LL;
      v76[2] = sub_100068BC8;
      v76[3] = &unk_1000BE020;
      id v47 = v76;
      v76[5] = v15;
      uint64_t v29 = v71;
      v76[4] = v29;
      [v46 startServiceForPasteVersion:2 handler:v76];
    }

    else
    {
      if (!-[__CFString isEqualToString:](v13, "isEqualToString:", @"pbtypes"))
      {
        uint64_t v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -115LL,  0LL));
        (*((void (**)(id, void, void, id))v15 + 2))(v15, 0LL, 0LL, v29);
        goto LABEL_44;
      }

      id v59 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      v60 = [v59 clipboardSharingEnabled];

      if (!v60) {
        goto LABEL_43;
      }
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 pasteboardController]);
      os_log_t v63 = v62 == 0LL;

      if (v63) {
        goto LABEL_45;
      }
      id v64 = sub_100039584(@"pasteboard-server");
      os_log_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);
        __int128 v67 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 name]);
        *(_DWORD *)__int128 buf = 138543619;
        __int128 v79 = v66;
        os_log_t v80 = 2113;
        __int128 v81 = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "[PBOARD] Types Requested from remote %{public}@/%{private}@",  buf,  0x16u);
      }

      __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v68 pasteboardController]);
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v69 uuid]);

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 pasteboardController]);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472LL;
      v75[2] = sub_100068BE0;
      v75[3] = &unk_1000BE020;
      id v47 = v75;
      v75[5] = v15;
      uint64_t v29 = v72;
      v75[4] = v29;
      [v46 getLocalPasteboardInfoData:v75];
    }

id sub_100041BEC(void *a1)
{
  id v1 = a1;
  int v11 = 0;
  if ((unint64_t)[v1 length] < 4 || (unint64_t)objc_msgSend(v1, "length") > 0x7FFFFFFE)
  {
    id v4 = 0LL;
  }

  else
  {
    id v2 = v1;
    int v11 = *(_DWORD *)[v2 bytes];
    id v3 = v2;
    strm.avail_in = objc_msgSend( v3,  "length",  (char *)objc_msgSend(v3, "bytes") + 4,  0,  0,  0,  0,  0,  0,  0,  0,  0)
                  - 4;
    __chkstk_darwin();
    strm.next_out = v9;
    strm.avail_out = 2048;
    id v4 = 0LL;
    if (!BZ2_bzDecompressInit(&strm, 0, 0))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
      [v4 appendBytes:&v11 length:4];
      while (1)
      {
        int v5 = BZ2_bzDecompress(&strm);
        if (v5 < 0) {
          break;
        }
        int v6 = v5;
        [v4 appendBytes:v9 length:2048 - strm.avail_out];
        strm.next_out = v9;
        strm.avail_out = 2048;
        if (v6 == 4) {
          goto LABEL_10;
        }
      }

      id v4 = 0LL;
LABEL_10:
      if (BZ2_bzDecompressEnd(&strm))
      {

        id v4 = 0LL;
      }
    }
  }

  id v7 = [v4 copy];

  return v7;
}

id sub_100041DA4(void *a1, _DWORD *a2)
{
  id v3 = a1;
  id v4 = (char *)[v3 bytes];
  uint64_t v5 = *a2;
  int v6 = v5 + 4;
  if (v5 + 4 <= (unint64_t)[v3 length])
  {
    int v8 = *(_DWORD *)&v4[v5];
    uint64_t v9 = *(void *)&v8 & 0xFFFFFFLL;
    if ((v8 & 0xFFFFFF) != 0 && (unint64_t)[v3 length] >= (v9 + v6))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v4[v6], v9));
      v6 += v9;
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
    int v6 = v5;
  }

  *a2 = v6;

  return v7;
}

void sub_100042140(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = a1;
    unsigned int v5 = [v3 length] & 0xFFFFFF | 0x1000000;
    [v4 appendBytes:&v5 length:4];
    [v4 appendData:v3];
  }

  else
  {
    int v6 = 0;
    id v4 = a1;
    [v4 appendBytes:&v6 length:4];
  }
}

id sub_1000421CC(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1 || (unint64_t)[v1 length] < 5)
  {
    int v16 = 0LL;
    goto LABEL_15;
  }

  id v3 = v2;
  int v4 = *(_DWORD *)[v3 bytes];
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  LODWORD(strm.next_in) = v4 | 0x100;
  [v5 appendBytes:&strm length:4];
  memset(&strm.avail_in, 0, 72);
  id v6 = v3;
  strm.avail_in = objc_msgSend(v6, "length", (char *)objc_msgSend(v6, "bytes") + 4) - 4;
  __chkstk_darwin();
  strm.next_out = v23;
  strm.avail_out = 2048;
  if (BZ2_bzCompressInit(&strm, 1, 0, 200)) {
    goto LABEL_11;
  }
  while (1)
  {
    strm.next_out = v23;
    strm.avail_out = 2048;
    int v8 = BZ2_bzCompress(&strm, 2 * (strm.avail_in == 0));
    if (v8 < 0) {
      break;
    }
    int v7 = v8;
    [v5 appendBytes:v23 length:2048 - strm.avail_out];
    if (v7 == 4) {
      goto LABEL_8;
    }
  }

  id v5 = 0LL;
LABEL_8:
  int v9 = BZ2_bzCompressEnd(&strm);
  os_log_t v10 = sub_100039584(0LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v5 length];
    id v13 = [v6 length];
    unint64_t v14 = 100 * (void)[v5 length];
    unint64_t v15 = (unint64_t)[v6 length];
    *(_DWORD *)__int128 buf = 134218496;
    id v26 = v12;
    __int16 v27 = 2048;
    id v28 = v13;
    __int16 v29 = 2048;
    unint64_t v30 = v14 / v15;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "-- Compressed data to %ld bytes (from %ld bytes) in data,(%ld%%)",  buf,  0x20u);
  }

  if (v9)
  {
LABEL_11:

    id v5 = 0LL;
  }

  else if (v5)
  {
    id v18 = [v5 length];
    if (v18 < [v6 length])
    {
      os_log_t v19 = sub_100039584(0LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        os_log_t v21 = [v6 length];
        uint64_t v22 = [v5 length];
        *(_DWORD *)__int128 buf = 134217984;
        id v26 = (id)(v21 - v22);
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Using compressed data, because it is %ld bytes smaller than the uncompressed data.",  buf,  0xCu);
      }

      id v5 = v5;
      int v16 = v5;
      goto LABEL_13;
    }
  }

  int v16 = 0LL;
LABEL_13:

LABEL_15:
  return v16;
}

id sub_100042A0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCleanupFunc];
}

void sub_100042A60(_Unwind_Exception *a1)
{
}

void sub_100042D98(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v8 = sub_10005BF18(v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v16 = 138543362;
    int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, ".scanForTypes=%{public}@", (uint8_t *)&v16, 0xCu);
  }

  if ((objc_opt_respondsToSelector(v3, "scanForTypes:") & 1) != 0)
  {
    uint64_t v10 = [v4 containsObject:off_1000DD890];
    unsigned int v11 = [v4 containsObject:off_1000DD898];
    uint64_t v12 = 2LL;
    if (!v11) {
      uint64_t v12 = 0LL;
    }
    uint64_t v13 = v12 | v10;
    unsigned int v14 = [v4 containsObject:off_1000DD8A0];
    uint64_t v15 = 4LL;
    if (!v14) {
      uint64_t v15 = 0LL;
    }
    [v3 scanForTypes:v13 | v15];
  }
}

void sub_100042F50(_Unwind_Exception *a1)
{
}

void sub_100042FAC(_Unwind_Exception *a1)
{
}

void sub_100043074(_Unwind_Exception *a1)
{
}

void sub_100043214(_Unwind_Exception *a1)
{
}

void sub_100043338(_Unwind_Exception *a1)
{
}

id sub_100043944(uint64_t a1)
{
  return [*(id *)(a1 + 32) foundDevice:*(void *)(a1 + 40)];
}

void sub_100043B5C(_Unwind_Exception *a1)
{
}

void sub_100043CF8(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueID]);
    os_log_t v5 = *(void **)(*(void *)(a1 + 40) + 88LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueID]);
    *(_DWORD *)__int128 buf = 138412802;
    id v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    __int16 v21 = 1024;
    unsigned int v22 = [v5 containsObject:v6];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "lostDevice timer firing deviceIdentifier=%@; _recentlyLostDeviceIDs is %@, will remove is %d",
      buf,
      0x1Cu);
  }

  int v7 = *(void **)(*(void *)(a1 + 40) + 88LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueID]);
  LODWORD(v7) = [v7 containsObject:v8];

  if ((_DWORD)v7)
  {
    int v9 = *(void **)(*(void *)(a1 + 40) + 88LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueID]);
    [v9 removeObject:v10];

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) manager]);
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 mainDispatchQ]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100043ED8;
    block[3] = &unk_1000BDC88;
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    dispatch_async(v12, block);
  }

id sub_100043ED8(uint64_t a1)
{
  return [*(id *)(a1 + 32) lostDevice:*(void *)(a1 + 40)];
}

void sub_1000441A0(_Unwind_Exception *a1)
{
}

void sub_10004475C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100044880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100044928;
    v9[3] = &unk_1000BDCD8;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    char v12 = *(_BYTE *)(a1 + 48);
    MRMediaRemoteGetNowPlayingClientForOrigin(a3, v6, v9);
  }

void sub_100044928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    os_log_t v5 = sub_100039584(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = a3;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Unable to determine nowPlaying client, error=%{public}@ for item %{public}@",  (uint8_t *)&v13,  0x16u);
    }

LABEL_9:
    return;
  }

  if (a2)
  {
    uint64_t BundleIdentifier = MRNowPlayingClientGetBundleIdentifier(a2);
    if (BundleIdentifier)
    {
      uint64_t v9 = BundleIdentifier;
      id v6 = (os_log_s *)*(id *)(a1 + 40);
      objc_sync_enter(v6);
      os_log_t v10 = sub_100039584(0LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = 138543618;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "NowPlaying item is %{public}@ for item %{public}@",  (uint8_t *)&v13,  0x16u);
      }

      [*(id *)(a1 + 32) setBundleIdentifier:v9];
      [*(id *)(a1 + 40) _addItem:*(void *)(a1 + 32) scheduleUpdates:*(unsigned __int8 *)(a1 + 48)];
      objc_sync_exit(v6);
      goto LABEL_9;
    }
  }

void sub_100044A98(_Unwind_Exception *a1)
{
}

void sub_100044B44(_Unwind_Exception *a1)
{
}

void sub_100044FF0(_Unwind_Exception *a1)
{
}

void sub_1000452DC(_Unwind_Exception *a1)
{
}

id sub_100045618(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveAdvertisement:*(void *)(a1 + 40) scanner:*(void *)(a1 + 48)];
}

LABEL_68:
          uint64_t v108 = sub_100039584(@"pasteboard-server");
          v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "[PBOARD] Notify client of new remote pboard and reset timmer",  buf,  2u);
          }

          os_log_t v110 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          -[UASharingReceiver setLastSeenPasteboardDevice:](self, "setLastSeenPasteboardDevice:", v110);

          -[UASharingReceiver setLastSeenPasteboardVersionBit:](self, "setLastSeenPasteboardVersionBit:", v92);
          v111 = objc_alloc_init(&OBJC_CLASS___UASharedPasteboardDataRequester);
          v112 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          -[UASharedPasteboardDataRequester setPeer:](v111, "setPeer:", v112);

          -[UASharedPasteboardDataRequester setScanner:](v111, "setScanner:", v292);
          uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
          id v114 = (void *)objc_claimAutoreleasedReturnValue([v113 pasteboardController]);
          [v114 setRemotePasteboardAvalibility:1 withDataRequester:v111];

          uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
          [v115 submitRemotePasteboardBecameAvailable];

          v116 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          [v116 remotePasteboardAvailableTimeout];
          v118 = v117;

          v119 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](self, "remotePboardTimer"));
          [v119 invalidate];

          v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "clearRemotePasteboardAvailable:",  0LL,  0LL,  v118));
          -[UASharingReceiver setRemotePboardTimer:](self, "setRemotePboardTimer:", v120);

          v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
          unsigned int v122 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](self, "remotePboardTimer"));
          [v121 addTimer:v122 forMode:NSRunLoopCommonModes];

          goto LABEL_71;
        }

        if (v93)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_INFO,  "[PBOARD] Ad is from last seen device",  buf,  2u);
        }

        if ((id)-[UASharingReceiver lastSeenPasteboardVersionBit](self, "lastSeenPasteboardVersionBit") != (id)v87)
        {
          v94 = sub_100039584(@"pasteboard-server");
          uint64_t v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            v95 = "[PBOARD] Pboard version bit flipped, notify client";
LABEL_67:
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, v95, buf, 2u);
            goto LABEL_68;
          }

          goto LABEL_68;
        }

LABEL_71:
        uint64_t v123 = sub_100039584(0LL);
        id v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
        {
          id v125 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue([v125 name]);
          id v127 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          v128 = (void *)objc_claimAutoreleasedReturnValue([v127 uniqueID]);
          *(_DWORD *)__int128 buf = 138543875;
          *(void *)v317 = v296;
          *(_WORD *)&v317[8] = 2113;
          *(void *)&v317[10] = v126;
          *(_WORD *)&v317[18] = 2113;
          *(void *)v318 = v128;
          _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEBUG,  " -- Looking for activity matching advertisingPayload %{public}@, from %{private}@/%{private}@",  buf,  0x20u);
        }

        __int128 v129 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
        __int128 v130 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingReceiver sharingBTLESuggestedItemForAdvertisementPayload:forDevice:]( self,  "sharingBTLESuggestedItemForAdvertisementPayload:forDevice:",  v296,  v129));

        if (v130)
        {
          __int128 v131 = (void *)objc_claimAutoreleasedReturnValue([v130 bundleIdentifier]);
          __int128 v132 = v131 == 0LL;

          if (!v132)
          {
LABEL_75:
            v297 = v130;
LABEL_76:
            __int128 v133 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload description](v296, "description"));
            __int128 v134 = (void *)objc_claimAutoreleasedReturnValue([v297 activityType]);
            __int128 v135 = (void *)objc_claimAutoreleasedReturnValue([v297 dynamicActivityType]);
            __int128 v136 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
            v137 = (void *)objc_claimAutoreleasedReturnValue([v136 name]);
            CFURLRef v138 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
            __int16 v139 = (void *)objc_claimAutoreleasedReturnValue([v138 uniqueID]);
            v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCANNING:Received %@ %@ %@ from %@/%@",  v133,  v134,  v135,  v137,  v139));
            +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v140);

            LODWORD(v140) = -[SharingBTLEAdvertisementPayload compareOptionBits:]( v296,  "compareOptionBits:",  [v297 optionBits]);
            NSFileAttributeKey v141 = sub_100039584(0LL);
            NSFileAttributeType v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
            NSFileAttributeKey v143 = os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG);
            if ((_DWORD)v140)
            {
              if (v143)
              {
                NSFileAttributeType v144 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
                v145 = sub_1000034D8(v144);
                v146 = (id)objc_claimAutoreleasedReturnValue(v145);
                v147 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                v148 = (void *)objc_claimAutoreleasedReturnValue([v147 uniqueID]);
                v149 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                v150 = (void *)objc_claimAutoreleasedReturnValue([v149 UUIDString]);
                *(_DWORD *)__int128 buf = 138544131;
                *(void *)v317 = v146;
                *(_WORD *)&v317[8] = 2113;
                *(void *)&v317[10] = v148;
                *(_WORD *)&v317[18] = 2114;
                *(void *)v318 = v150;
                *(_WORD *)&v318[8] = 2113;
                *(void *)v319 = v297;
                _os_log_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_DEBUG,  " -- Found matching advertisingPayload to item already received from this device, %{public}@/%{private} @, so using it. %{public}@/%{private}@",  buf,  0x2Au);
              }

              if ([v297 isPayloadAvailable])
              {
                v151 = (void *)objc_claimAutoreleasedReturnValue([v297 advertisementPayload]);
                v152 = (void *)objc_claimAutoreleasedReturnValue([v151 time]);
                v153 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload time](v296, "time"));
                v154 = [v152 isEqual:v153];

                if ((v154 & 1) == 0)
                {
                  v155 = sub_100039584(0LL);
                  v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
                  if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                  {
                    v157 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                    v158 = (void *)objc_claimAutoreleasedReturnValue([v157 UUIDString]);
                    *(_DWORD *)__int128 buf = 138543619;
                    *(void *)v317 = v158;
                    *(_WORD *)&v317[8] = 2113;
                    *(void *)&v317[10] = v297;
                    _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  " -- Clearing payload of item %{public}@/%{private}@ because the last active time from that device has changed.",  buf,  0x16u);
                  }

                  v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  8.0));
                  [v297 setDontPrefetchBefore:v159];

                  [v297 clearPayload];
                }
              }

              v160 = self;
              objc_sync_enter(v160);
              v307 = 0u;
              v308 = 0u;
              v309 = 0u;
              v310 = 0u;
              v161 = v160->_receivedItems;
              v162 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v161,  "countByEnumeratingWithState:objects:count:",  &v307,  v324,  16LL);
              if (v162)
              {
                v163 = *(void *)v308;
                do
                {
                  for (j = 0LL; j != v162; j = (char *)j + 1)
                  {
                    if (*(void *)v308 != v163) {
                      objc_enumerationMutation(v161);
                    }
                    [*(id *)(*((void *)&v307 + 1) + 8 * (void)j) resignCurrent];
                  }

                  v162 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v161,  "countByEnumeratingWithState:objects:count:",  &v307,  v324,  16LL);
                }

                while (v162);
              }

              objc_sync_exit(v160);
              [v297 updateFromSFAdvertisement:v295];
              v165 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v160, "manager"));
              [v165 scheduleBestAppDetermination];
              goto LABEL_108;
            }

            if (v143)
            {
              obja = [v297 optionBits];
              v166 = (void *)objc_claimAutoreleasedReturnValue([v297 options]);
              v167 = (void *)objc_claimAutoreleasedReturnValue([v166 description]);
              v168 = sub_10005BF18(v167);
              v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
              v287 = -[SharingBTLEAdvertisementPayload optionBits](v296, "optionBits");
              v170 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload options](v296, "options"));
              v171 = (void *)objc_claimAutoreleasedReturnValue([v170 description]);
              v172 = sub_10005BF18(v171);
              v173 = (void *)objc_claimAutoreleasedReturnValue(v172);
              v174 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
              v175 = sub_1000034D8(v174);
              v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
              *(_DWORD *)__int128 buf = 67110403;
              *(_DWORD *)v317 = obja;
              *(_WORD *)&v317[4] = 2114;
              *(void *)&v317[6] = v169;
              *(_WORD *)&v317[14] = 1024;
              *(_DWORD *)&v317[16] = v287;
              *(_WORD *)v318 = 2114;
              *(void *)&v318[2] = v173;
              *(_WORD *)v319 = 2114;
              *(void *)&v319[2] = v176;
              *(_WORD *)v320 = 2113;
              *(void *)&v320[2] = v297;
              _os_log_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_DEBUG,  " -- Because the optionBits in the packet changed, from %x%{public}@ to %x%{public}@, discarding current item and starting fresh, %{public}@ / %{private}@",  buf,  0x36u);
            }

            -[UASharingReceiver removeItem:](self, "removeItem:", v297);
            v165 = v297;
            goto LABEL_107;
          }

          v177 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
          v178 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:",  v295,  sub_10005EECC(v177),  v292,  self);
          v179 = (void *)objc_claimAutoreleasedReturnValue(v178);

          v180 = (void *)objc_claimAutoreleasedReturnValue([v179 bundleIdentifier]);
          if (!v180)
          {

            goto LABEL_75;
          }

          v181 = sub_100039584(0LL);
          v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
          if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
          {
            v183 = (void *)objc_claimAutoreleasedReturnValue([v179 bundleIdentifier]);
            *(_DWORD *)__int128 buf = 138543619;
            *(void *)v317 = v296;
            *(_WORD *)&v317[8] = 2113;
            *(void *)&v317[10] = v183;
            _os_log_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_DEBUG,  "SFRECEIVER: Replacing received advertisement %{public}@ because it matches a new bundleIdentifier %{private}@",  buf,  0x16u);
          }

          v297 = v179;
          if (v297) {
            goto LABEL_76;
          }
        }

        if (-[SharingBTLEAdvertisementPayload advertisementKind](v296, "advertisementKind") == 2)
        {
          v184 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          v165 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingReceiver sharingBTLESuggestedItemForAdvertisementPayload:forDevice:]( self,  "sharingBTLESuggestedItemForAdvertisementPayload:forDevice:",  0LL,  v184));

          if (v165)
          {
            v185 = (void *)objc_claimAutoreleasedReturnValue([v165 advertisementPayload]);
            v186 = [v185 advertisementKind] == 2;

            if (v186)
            {
              v187 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
              v188 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:",  v295,  sub_10005EECC(v187),  v292,  self);
              v189 = (void *)objc_claimAutoreleasedReturnValue(v188);

              v190 = (void *)objc_claimAutoreleasedReturnValue([v189 bundleIdentifier]);
              v191 = (void *)objc_claimAutoreleasedReturnValue([v165 bundleIdentifier]);
              LODWORD(v187) = [v190 isEqual:v191];

              v192 = sub_100039584(0LL);
              v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v192);
              v194 = os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG);
              if ((_DWORD)v187)
              {
                if (v194)
                {
                  v195 = (void *)objc_claimAutoreleasedReturnValue([0 bundleIdentifier]);
                  v196 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
                  v197 = sub_1000034D8(v196);
                  v198 = (void *)objc_claimAutoreleasedReturnValue(v197);
                  v199 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                  v200 = (void *)objc_claimAutoreleasedReturnValue([v199 uniqueID]);
                  *(_DWORD *)__int128 buf = 138478595;
                  *(void *)v317 = v195;
                  *(_WORD *)&v317[8] = 2114;
                  *(void *)&v317[10] = v198;
                  *(_WORD *)&v317[18] = 2113;
                  *(void *)v318 = v200;
                  *(_WORD *)&v318[8] = 2113;
                  *(void *)v319 = 0LL;
                  _os_log_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_DEBUG,  " -- Matching dns- item to previously received one, mapping to %{private}@, for item already received from this device, %{public}@/%{private}@, so using it. %{private}@",  buf,  0x2Au);
                }

                v297 = v165;
                [v297 updateFromSFAdvertisement:v295];
                v201 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
                [v201 scheduleBestAppDetermination];
              }

              else
              {
                if (v194)
                {
                  v283 = (void *)objc_claimAutoreleasedReturnValue([v165 advertisementPayload]);
                  *(_DWORD *)__int128 buf = 138543875;
                  *(void *)v317 = v283;
                  *(_WORD *)&v317[8] = 2114;
                  *(void *)&v317[10] = v296;
                  *(_WORD *)&v317[18] = 2113;
                  *(void *)v318 = v165;
                  _os_log_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_DEBUG,  " -- New advertisement of DNS type didn't seem to match to same app as  previous one, %{public}@ vs % {public}@, so can't use it. %{private}@",  buf,  0x20u);
                }

                -[UASharingReceiver removeItem:](self, "removeItem:", v165);
                v297 = 0LL;
              }

LABEL_108:
              v207 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
              v208 = (void *)objc_claimAutoreleasedReturnValue([v207 pingController]);
              if (v208)
              {
                v209 = -[SharingBTLEAdvertisementPayload advertisementKind](v296, "advertisementKind") == 5;

                if (!v209) {
                  goto LABEL_112;
                }
                v210 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
                v211 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:",  v295,  sub_10005EECC(v210),  v292,  self);
                v212 = (void *)objc_claimAutoreleasedReturnValue(v211);

                v304[0] = _NSConcreteStackBlock;
                v304[1] = 3221225472LL;
                v304[2] = sub_100047748;
                v304[3] = &unk_1000BCC30;
                v305 = v212;
                v306 = self;
                v297 = v305;
                [v305 requestPayloadWithCompletionHandler:v304];
                v207 = v305;
              }

LABEL_112:
              if (!v297)
              {
                v213 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
                v214 = sub_10005EECC(v213);

                v215 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver activeDevices](self, "activeDevices"));
                v216 = (unint64_t)[v215 count] > 1;

                if (v216) {
                  v217 = v214 | 0x40;
                }
                else {
                  v217 = v214;
                }
                v297 = (id)objc_claimAutoreleasedReturnValue( +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:]( &OBJC_CLASS___SharingBTLESuggestedItem,  "cornerActionBTLEItemWithSFAdvertisement:optionBits:scanner:receiver:",  v295,  v217,  v292,  self));
                v218 = sub_100039584(0LL);
                v219 = (os_log_s *)objc_claimAutoreleasedReturnValue(v218);
                if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                {
                  v220 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
                  v221 = sub_1000034D8(v220);
                  v222 = (id)objc_claimAutoreleasedReturnValue(v221);
                  v223 = (void *)objc_claimAutoreleasedReturnValue([v297 activityType]);
                  v285 = (void *)objc_claimAutoreleasedReturnValue([v297 bundleIdentifier]);
                  v288 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                  objb = (id)objc_claimAutoreleasedReturnValue([v288 UUIDString]);
                  v286 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                  v284 = (void *)objc_claimAutoreleasedReturnValue([v286 name]);
                  v224 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                  v225 = (void *)objc_claimAutoreleasedReturnValue([v224 uniqueID]);
                  v226 = (void *)objc_claimAutoreleasedReturnValue([v295 options]);
                  v227 = (void *)objc_claimAutoreleasedReturnValue([v226 description]);
                  v228 = sub_10005BF18(v227);
                  v229 = (id)objc_claimAutoreleasedReturnValue(v228);
                  *(_DWORD *)__int128 buf = 138544899;
                  *(void *)v317 = v222;
                  *(_WORD *)&v317[8] = 2113;
                  *(void *)&v317[10] = v223;
                  *(_WORD *)&v317[18] = 2113;
                  *(void *)v318 = v285;
                  *(_WORD *)&v318[8] = 2114;
                  *(void *)v319 = objb;
                  *(_WORD *)&v319[8] = 2113;
                  *(void *)v320 = v284;
                  *(_WORD *)&v320[8] = 2113;
                  v321 = v225;
                  v322 = 2114;
                  v323 = v229;
                  _os_log_impl( (void *)&_mh_execute_header,  v219,  OS_LOG_TYPE_DEFAULT,  "# RECEIVED advertisement, %{public}@ type=%{private}@ -> %{private}@, %{public}@, from %{private}@/% {private}@ options=%{public}@",  buf,  0x48u);
                }

                if ((v52 & 1) == 0)
                {
                  v230 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                  v231 = (void *)objc_claimAutoreleasedReturnValue([v230 uniqueID]);
                  -[UASharingReceiver removeAllFromDevice:](self, "removeAllFromDevice:", v231);
                }

                -[UASharingReceiver addItem:scheduleUpdates:](self, "addItem:scheduleUpdates:", v297, 1LL);
                v232 = (void *)objc_claimAutoreleasedReturnValue( +[UADiagnosticManager sharedManager]( &OBJC_CLASS___UADiagnosticManager,  "sharedManager"));
                v233 = (void *)objc_claimAutoreleasedReturnValue([v297 activityType]);
                [v232 submitUserActivityWasDiscovered:v233];
              }

              v234 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
              if ([v234 multiHandoffEnabled])
              {
                v235 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload options](v296, "options"));
                v236 = (void *)objc_claimAutoreleasedReturnValue([v235 objectForKeyedSubscript:UAUserActivityAutoPullActivitiesListKey]);
                v237 = [v236 BOOLValue];

                if (v237)
                {
                  v238 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                  v239 = (void *)objc_claimAutoreleasedReturnValue([v238 uniqueID]);
                  v240 = [v239 isEqualToString:self->_lastAutoPullActivitiesRequesterId];

                  if ((v240 & 1) == 0)
                  {
                    v241 = sub_100039584(0LL);
                    v242 = (os_log_s *)objc_claimAutoreleasedReturnValue(v241);
                    if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)__int128 buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v242,  OS_LOG_TYPE_DEFAULT,  "received UAUserActivityAutoPullActivitiesListKey bit on, fetching more app suggestions",  buf,  2u);
                    }

                    v243 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
                    v244 = (NSString *)objc_claimAutoreleasedReturnValue([v243 uniqueID]);
                    lastAutoPullActivitiesRequesterId = self->_lastAutoPullActivitiesRequesterId;
                    self->_lastAutoPullActivitiesRequesterId = v244;

                    v246 = (NSString *)objc_claimAutoreleasedReturnValue([v295 device]);
                    -[UASharingReceiver fetchMoreAppSuggestionsFromDevice:]( self,  "fetchMoreAppSuggestionsFromDevice:",  v246);
                    goto LABEL_130;
                  }

                  goto LABEL_131;
                }
              }

              else
              {
              }

              v247 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
              v248 = (void *)objc_claimAutoreleasedReturnValue([v247 uniqueID]);
              v249 = [v248 isEqualToString:self->_lastAutoPullActivitiesRequesterId];

              if (v249)
              {
                v246 = self->_lastAutoPullActivitiesRequesterId;
                self->_lastAutoPullActivitiesRequesterId = 0LL;
LABEL_130:
              }

  if ([v64 count] == (id)1)
  {
    int v50 = (void *)objc_claimAutoreleasedReturnValue([v64 anyObject]);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 uuid]);
  }

  else
  {
    uint64_t v51 = 0LL;
  }

  if (v57) {
    v57[2](v57, v51);
  }

  objc_autoreleasePoolPop(context);
}

LABEL_131:
              if ([v297 active])
              {
                v250 = self;
                objc_sync_enter(v250);
                v300 = 0u;
                v301 = 0u;
                v302 = 0u;
                v303 = 0u;
                id obj = v250;
                v251 = v250->_receivedItems;
                v252 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v251,  "countByEnumeratingWithState:objects:count:",  &v300,  v315,  16LL);
                if (v252)
                {
                  v253 = *(void *)v301;
                  do
                  {
                    for (k = 0LL; k != v252; k = (char *)k + 1)
                    {
                      if (*(void *)v301 != v253) {
                        objc_enumerationMutation(v251);
                      }
                      v255 = *(void **)(*((void *)&v300 + 1) + 8LL * (void)k);
                      if (([v255 isEqual:v297] & 1) == 0)
                      {
                        v256 = (void *)objc_claimAutoreleasedReturnValue([v255 peerDevice]);
                        v257 = (void *)objc_claimAutoreleasedReturnValue([v256 uniqueID]);
                        v258 = (void *)objc_claimAutoreleasedReturnValue([v297 peerDevice]);
                        v259 = (void *)objc_claimAutoreleasedReturnValue([v258 uniqueID]);
                        v260 = [v257 isEqualToString:v259];

                        if (v260) {
                          [v255 setActive:0];
                        }
                      }
                    }

                    v252 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v251,  "countByEnumeratingWithState:objects:count:",  &v300,  v315,  16LL);
                  }

                  while (v252);
                }

                objc_sync_exit(obj);
              }

              if (v297)
              {
                v261 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
                v262 = [v261 debugEnablePrefetch];

                if (v262)
                {
                  -[SharingBTLEAdvertisementPayload isCurrent](v296, "isCurrent");
                  v263 = sub_100039584(0LL);
                  v264 = (os_log_s *)objc_claimAutoreleasedReturnValue(v263);
                  if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
                  {
                    v265 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                    v266 = (void *)objc_claimAutoreleasedReturnValue([v265 UUIDString]);
                    v267 = (id)objc_claimAutoreleasedReturnValue([v297 statusString]);
                    *(_DWORD *)__int128 buf = 138543619;
                    *(void *)v317 = v266;
                    *(_WORD *)&v317[8] = 2113;
                    *(void *)&v317[10] = v267;
                    _os_log_impl( (void *)&_mh_execute_header,  v264,  OS_LOG_TYPE_DEFAULT,  "*** Checking whether to do a pre-emptive fetch of the payload for item %{public}@/%{private}@",  buf,  0x16u);
                  }

                  v268 = (void *)objc_claimAutoreleasedReturnValue([v297 dontPrefetchBefore]);
                  if (v268)
                  {
                    v269 = (void *)objc_claimAutoreleasedReturnValue([v297 dontPrefetchBefore]);
                    v270 = sub_10005B9D8(v269);

                    if (v270) {
                      [v297 setDontPrefetchBefore:0];
                    }
                  }

                  v271 = (void *)objc_claimAutoreleasedReturnValue([v297 dontPrefetchBefore]);

                  if (v271)
                  {
                    v272 = sub_100039584(0LL);
                    v273 = (os_log_s *)objc_claimAutoreleasedReturnValue(v272);
                    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
                    {
                      v274 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                      v275 = (void *)objc_claimAutoreleasedReturnValue([v274 UUIDString]);
                      v276 = (id)objc_claimAutoreleasedReturnValue([v297 statusString]);
                      v277 = (void *)objc_claimAutoreleasedReturnValue([v297 dontPrefetchBefore]);
                      *(_DWORD *)__int128 buf = 138543875;
                      *(void *)v317 = v275;
                      *(_WORD *)&v317[8] = 2113;
                      *(void *)&v317[10] = v276;
                      *(_WORD *)&v317[18] = 2114;
                      *(void *)v318 = v277;
                      _os_log_impl( (void *)&_mh_execute_header,  v273,  OS_LOG_TYPE_DEFAULT,  "*** Ignoring prefetch for item %{public}@/%{private}@ because dontPrefetchBefore=%{public}@",  buf,  0x20u);
                    }
                  }

                  if (([v297 isPayloadRequested] & 1) == 0
                    && ([v297 isPayloadAvailable] & 1) == 0)
                  {
                    v278 = sub_100039584(0LL);
                    v279 = (os_log_s *)objc_claimAutoreleasedReturnValue(v278);
                    if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                    {
                      v280 = (void *)objc_claimAutoreleasedReturnValue([v297 uuid]);
                      v281 = (void *)objc_claimAutoreleasedReturnValue([v280 UUIDString]);
                      v282 = (id)objc_claimAutoreleasedReturnValue([v297 statusString]);
                      *(_DWORD *)__int128 buf = 138543619;
                      *(void *)v317 = v281;
                      *(_WORD *)&v317[8] = 2113;
                      *(void *)&v317[10] = v282;
                      _os_log_impl( (void *)&_mh_execute_header,  v279,  OS_LOG_TYPE_DEFAULT,  "*** Scheduling a pre-emptive fetch of the payload for item %{public}@/%{private}@",  buf,  0x16u);
                    }

                    v298[0] = _NSConcreteStackBlock;
                    v298[1] = 3221225472LL;
                    v298[2] = sub_100047984;
                    v298[3] = &unk_1000BDD50;
                    v299 = v297;
                    v297 = v299;
                    [v299 requestPayloadWithCompletionHandler:v298];
                  }
                }
              }

              goto LABEL_46;
            }
          }
        }

        else
        {
          v165 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload description](v296, "description"));
          v202 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          v203 = (void *)objc_claimAutoreleasedReturnValue([v202 name]);
          v204 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
          v205 = (void *)objc_claimAutoreleasedReturnValue([v204 uniqueID]);
          v206 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCANNING:Received %@ (no match) from %@/%@",  v165,  v203,  v205));
          +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v206);
        }

LABEL_107:
        v297 = 0LL;
        goto LABEL_108;
      }
    }

    else
    {
    }

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](self, "lastSeenPasteboardDevice"));
    if (v96)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver lastSeenPasteboardDevice](self, "lastSeenPasteboardDevice"));
      v98 = (void *)objc_claimAutoreleasedReturnValue([v97 uniqueID]);
      v99 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
      v100 = (void *)objc_claimAutoreleasedReturnValue([v99 uniqueID]);
      v101 = [v98 isEqualToString:v100];

      if (v101)
      {
        v102 = sub_100039584(@"pasteboard-server");
        os_log_t v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_INFO,  "[PBOARD] Recived add w/o remote pboard for last seen device, notify client and clear timmer",  buf,  2u);
        }

        -[UASharingReceiver setLastSeenPasteboardDevice:](self, "setLastSeenPasteboardDevice:", 0LL);
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        v105 = (void *)objc_claimAutoreleasedReturnValue([v104 pasteboardController]);
        [v105 setRemotePasteboardAvalibility:0 withDataRequester:0];

        id v106 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
        [v106 submitRemotePasteboardBecameUnavailable:3];

        v107 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingReceiver remotePboardTimer](self, "remotePboardTimer"));
        [v107 invalidate];

        -[UASharingReceiver setRemotePboardTimer:](self, "setRemotePboardTimer:", 0LL);
      }
    }

    goto LABEL_71;
  }

  __int16 v29 = sub_100039584(0LL);
  oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v295 advertisementPayload]);
    id v31 = sub_1000034D8(v30);
    char v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    dispatch_source_t v33 = (void *)objc_claimAutoreleasedReturnValue([v295 device]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
    *(_DWORD *)__int128 buf = 138543619;
    *(void *)v317 = v32;
    *(_WORD *)&v317[8] = 2113;
    *(void *)&v317[10] = v34;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Ignoring received ActivityContinuation because the current profile disallows it, %{public}@ from %{private}@",  buf,  0x16u);
  }

LABEL_47:
}

void sub_10004770C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id obj)
{
}

void sub_100047748(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = -[UAPingUserActivityInfo initFromPing:]( objc_alloc(&OBJC_CLASS___UAPingUserActivityInfo),  "initFromPing:",  *(void *)(a1 + 32));
    objc_initWeak(&location, v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    _DWORD v8[2] = sub_100047874;
    v8[3] = &unk_1000BDD28;
    void v8[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v9, &location);
    [v4 setWasContinuedBlock:v8];
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) manager]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pingController]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 client]);
    [v7 pushItem:v4];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void sub_100047854( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100047874(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "PING: Pong was sent, error=%{public}@",  (uint8_t *)&v10,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pingController]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 client]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 removeItem:WeakRetained];
}

void sub_100047984(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) statusString]);
    int v7 = 138543619;
    uint64_t v8 = v5;
    __int16 v9 = 2113;
    int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "*** Completed a pre-emptive fetch of the payload for item %{public}@/%{private}@",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_100047D48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location)
{
}

void sub_100047D9C(void *a1, void *a2)
{
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addNewItemsFromPayloads:v4 device:a1[4] scanner:a1[5] force:*(void *)(*(void *)(a1[6] + 8) + 24) == 0];
}

void sub_100047FE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100048010(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addNewItemsFromPayloads:v4 device:*(void *)(a1 + 32) scanner:*(void *)(a1 + 40) force:1];
}

void sub_100048554(_Unwind_Exception *a1)
{
}

void sub_1000493FC(_Unwind_Exception *a1)
{
}

uint64_t sub_10004A1D8(__SecTask *a1, const __CFString *a2)
{
  if (!a1) {
    return 0LL;
  }
  os_log_t v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a1, a2, 0LL);
  if (!v2) {
    return 0LL;
  }
  id v3 = v2;
  id v4 = (const __CFNumber *)CFGetTypeID(v2);
  if (v4 == (const __CFNumber *)CFBooleanGetTypeID())
  {
    uint64_t Value = CFBooleanGetValue(v3);
  }

  else if (v4 == (const __CFNumber *)CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0LL;
    CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
    uint64_t Value = valuePtr != 0;
  }

  else
  {
    uint64_t Value = 0LL;
  }

  CFRelease(v3);
  return Value;
}

uint64_t sub_10004A278()
{
  if (qword_1000DE440 != -1) {
    dispatch_once(&qword_1000DE440, &stru_1000BDDD0);
  }
  return qword_1000DE438;
}

void sub_10004A2B8(id a1)
{
  kern_return_t v1;
  _OWORD *v2;
  __int128 v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;
  task_info_outCnt = 8;
  id v1 = task_info(mach_task_self_, 0xFu, task_info_out, &task_info_outCnt);
  if (v1)
  {
    syslog(3, "failed to get audit token for current process: %llx", v1);
  }

  else
  {
    os_log_t v2 = operator new(0x20uLL);
    id v3 = v6;
    CFBooleanRef v2 = *(_OWORD *)task_info_out;
    v2[1] = v3;
    qword_1000DE438 = (uint64_t)v2;
  }

_OWORD *sub_10004A32C(_OWORD *result, BOOL *a2)
{
  if (result)
  {
    __int128 v3 = result[1];
    v4[0] = *result;
    v4[1] = v3;
    uint64_t result = (_OWORD *)sandbox_check_by_audit_token(v4, 0LL, 0LL);
    if (a2) {
      *a2 = (_DWORD)result != 0;
    }
  }

  return result;
}

__CFString *sub_10004A37C(_OWORD *a1)
{
  __int128 v1 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v1;
  os_log_t v2 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  __int128 v3 = v2;
  if (!v2) {
    return (__CFString *)0LL;
  }
  id v4 = (__CFString *)SecTaskCopySigningIdentifier(v2, 0LL);
  CFRelease(v3);
  return v4;
}

void sub_10004A3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_85:
      id v64 = 0LL;
      id v18 = v137;
LABEL_99:
      os_log_t v65 = v152;
      goto LABEL_100;
    default:
      id v28 = 0LL;
      os_log_t v65 = 0LL;
      id v64 = 0LL;
      id v26 = 0LL;
      unsigned int v24 = v143;
      goto LABEL_106;
  }

  do
  {
    id v57 = (void *)objc_claimAutoreleasedReturnValue([v153 objectAtIndex:v56]);
    os_log_t v58 = (void *)_LSCreateHashedBytesForAdvertisingFromString(2LL, v57);
    if (!_LSCompareHashedBytesFromAdvertisingStrings(v58, v145))
    {
      __int128 v81 = sub_100039584(0LL);
      os_log_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v83 = sub_1000034D8(v58);
        os_log_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue(v83);
        __int128 v85 = v26;
        id v86 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);
        *(_DWORD *)__int128 buf = 138543875;
        v159 = v84;
        v160 = 2113;
        v161 = (unint64_t)v57;
        v162 = 2113;
        v163 = v86;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  " -- MATCHED, adverising bytes %{public}@ to domain name %{private}@, from application %{private}@",  buf,  0x20u);

        id v26 = v85;
      }

      sub_10004B398(v26, v132);
      os_log_t v87 = objc_claimAutoreleasedReturnValue([v26 bundleIdentifier]);

      int v17 = v132;
      id v28 = (id)v87;

      id v64 = 0LL;
      os_log_t v65 = @"NSUserActivityTypeBrowsingWeb";
      uint64_t v16 = v126;
      int v13 = v145;
      id v18 = v136;
      goto LABEL_42;
    }

    ++v56;
  }

  while (v56 < (unint64_t)[v153 count]);
LABEL_38:

  uint64_t v16 = v126;
  int v13 = v145;
  int v17 = v132;
  id v18 = v136;
LABEL_39:
  id v59 = sub_100039584(0LL);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEBUG,  " -- Received a kLSAdvertisementStringDomainNameKind; no match for native application, so looking for browser",
      buf,
      2u);
  }

  uint64_t v61 = sub_10005C524();
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);

  os_log_t v63 = objc_claimAutoreleasedReturnValue([v62 bundleIdentifier]);
  sub_10004B398(v62, v17);
  id v64 = 0LL;
  os_log_t v65 = @"NSUserActivityTypeBrowsingWeb";
  id v26 = v62;
  id v28 = (id)v63;
LABEL_42:
  unsigned int v24 = v143;
LABEL_100:
  if (v28 && v65)
  {
    v152 = (__CFString *)v65;
    v151 = v28;
    uint64_t v115 = sub_100039584(0LL);
    v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      uint64_t v117 = sub_1000034D8(v13);
      v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
      *(_DWORD *)__int128 buf = 138478595;
      v159 = v65;
      v160 = 2113;
      v161 = (unint64_t)v151;
      v162 = 2113;
      v163 = v141;
      v164 = 2114;
      v165 = v118;
      _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_INFO,  " -- Found application %{private}@, with matching advertisingIdentifier %{private}@, from %{private}@ for payload %{public}@",  buf,  0x2Au);

      unsigned int v24 = v143;
    }

    id v28 = v151;
LABEL_105:
    os_log_t v65 = v152;
  }

LABEL_106:
  id v124 = v16;
  id v125 = v64;
  v119 = v16;
  v120 = v64;
  uint64_t v14 = v141;
  v121 = -[SharingBTLESuggestedItem initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scanner:receiver:dynamicIdentifier:]( objc_alloc(&OBJC_CLASS___SharingBTLESuggestedItem),  "initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scann er:receiver:dynamicIdentifier:",  v13,  v141,  v15,  v142,  v140,  v65,  v28,  v17,  v18,  v146,  v124,  v125);
  unsigned int v122 = (__CFString *)v65;
  uint64_t v123 = v28;
  id v31 = v121;

  uint64_t v16 = v119;
LABEL_17:

  return v31;
}

void sub_10004B398(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  os_log_t v5 = v4;
  if (v3 && v4)
  {
    audit_token_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 teamID]);
    if (v6) {
      [v5 addObject:v6];
    }
    id v7 = [v3 entitlementValueForKey:@"useractivity-team-identifier" ofClass:objc_opt_class(NSString)];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      os_log_t v9 = sub_100039584(0LL);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
        int v26 = 138543618;
        __int16 v27 = v8;
        __int16 v28 = 2114;
        __int16 v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  " including entitledTeam: %{public}@ for bundle %{public}@",  (uint8_t *)&v26,  0x16u);
      }

      [v5 addObject:v8];
    }

    id v12 = [v3 entitlementValueForKey:@"com.apple.developer.team-identifier" ofClass:objc_opt_class(NSString)];
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v13)
    {
      os_log_t v14 = sub_100039584(0LL);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
        int v26 = 138543618;
        __int16 v27 = v13;
        __int16 v28 = 2114;
        __int16 v29 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  " including developerTeamID: %{public}@ for bundle %{public}@",  (uint8_t *)&v26,  0x16u);
      }

      [v5 addObject:v13];
    }

    id v17 = [v3 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class(NSString)];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    __int16 v19 = v18;
    if (v18)
    {
      if ((unint64_t)[v18 length] >= 0xB)
      {
        id v20 = [v19 rangeOfString:@"."];
        if (v21 == 1 && v20 == (id)10)
        {
          os_log_t v22 = sub_100039584(0LL);
          os_log_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v19 substringToIndex:10]);
            int v26 = 138543618;
            __int16 v27 = v24;
            __int16 v28 = 2114;
            __int16 v29 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  " including teamID: %{public}@ from applicationIdentifier %{public}@",  (uint8_t *)&v26,  0x16u);
          }

          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v19 substringToIndex:10]);
          [v5 addObject:v25];
        }
      }
    }

    if ([v5 containsObject:@"0000000000"])
    {
      [v5 removeObject:@"0000000000"];
      [v5 addObject:&stru_1000BE738];
    }
  }
}

LABEL_17:
      -[SharingBTLESuggestedItem setObject:forKey:]( v47,  "setObject:forKey:",  &__kCFBooleanTrue,  UAUserActivityAutoPullActivitiesListKey,  v90);
      goto LABEL_18;
    }

    goto LABEL_18;
  }

  if (v7)
  {
    os_log_t v23 = 0u;
    unsigned int v24 = 0u;
    uint64_t v21 = 0u;
    os_log_t v22 = 0u;
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisingItems](self, "advertisingItems", 0LL));
    os_log_t v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v14)
    {
      __int16 v15 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
          __int16 v19 = [v18 isEqual:v7];

          if (v19)
          {
            [v17 wasResumedOnAnotherDeviceWithCompletionHandler:&stru_1000BE068];
            goto LABEL_17;
          }
        }

        os_log_t v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    goto LABEL_17;
  }

LABEL_16:
  -[SharingBTLESuggestedItem setWhen:](self, "setWhen:", v23);
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 currentUntil]);
  -[SharingBTLESuggestedItem setCurrentUntilDate:](self, "setCurrentUntilDate:", v30);

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
  char v32 = (sub_10005EECC(v31) & 0x80) == 0;

  -[SharingBTLESuggestedItem setActive:](self, "setActive:", v32);
  dispatch_source_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem currentUntilDate](self, "currentUntilDate"));

  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  id v35 = v34;
  if (v33)
  {
    [v34 cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires];
    id v37 = v36;
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem advertisementPayload](self, "advertisementPayload"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 validUntil]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v39,  v37));
    -[SharingBTLESuggestedItem setRemoveAfter:](self, "setRemoveAfter:", v40);
  }

  else
  {
    [v34 cornerActionItemMaximumTimeForBTLEItemToLive];
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
    -[SharingBTLESuggestedItem setRemoveAfter:](self, "setRemoveAfter:", v38);
  }

  return 1;
}

void sub_10004C9FC(_Unwind_Exception *a1)
{
}

void sub_10004CA3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = sub_100039584(@"signposts");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_log_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 32);
  if (v10 + 1 >= 2 && os_signpost_enabled(v8))
  {
    if (v5) {
      BOOL v51 = v6 == 0LL;
    }
    else {
      BOOL v51 = 0;
    }
    int v52 = v51;
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v137) = v52;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "sharingFetch",  "success=%{public}d enableTelemetry=YES ",  buf,  8u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v11 debugAdditionalPayloadReceiveTimeInterval];
  double v13 = v12;

  if (v13 > 0.0)
  {
    os_log_t v14 = sub_100039584(0LL);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      double v137 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "*** DELAYING payload receive by an additional %f seconds for DEBUGAdditionalPayloadReceiveTimeInterval",  buf,  0xCu);
    }

    usleep((v13 * 1000000.0));
    os_log_t v16 = sub_100039584(0LL);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      double v137 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "*** FINISHED DELAYING payload receive by an additional %f seconds for DEBUGAdditionalPayloadReceiveTimeInterval",  buf,  0xCu);
    }
  }

  kdebug_trace(722141196LL, 0LL, 0LL, 0LL, 0LL);
  double v18 = sub_10005C3D4() - *(double *)(a1 + 40);
  double v19 = 0.0;
  if (v18 > 0.0) {
    double v19 = (double)(unint64_t)[v5 length] / v18;
  }
  os_log_t v20 = sub_100039584(0LL);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) advertisementPayload]);
    id v25 = [v5 length];
    id v26 = sub_10005BD28(v5, 40LL);
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *(_DWORD *)__int128 buf = 138544899;
    double v137 = *(double *)&v23;
    __int16 v138 = 2114;
    id v139 = v24;
    __int16 v140 = 2048;
    id v141 = v25;
    __int16 v142 = 2113;
    uint64_t v143 = (uint64_t)v27;
    __int16 v144 = 2048;
    double v145 = v18;
    __int16 v146 = 2048;
    uint64_t v147 = (uint64_t)v19;
    __int16 v148 = 2114;
    id v149 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PAYLOAD:GOT payload for item %{public}@/%{public}@, dataSize=%ld/%{private}@ speed=%g/%{bitrate}ld error=%{public}@",  buf,  0x48u);
  }

  if (v5)
  {
    id v28 = [v5 length];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    [v29 setPayloadSize:v28];

    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    [v30 setTransferSpeed:v19];

    id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    [v31 setTransferDuration:v18];
  }

  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    [v31 setError:v6];
  }

LABEL_17:
  os_log_t v32 = sub_100039584(@"Diagnostic");
  dispatch_source_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
    *(_DWORD *)__int128 buf = 138477827;
    double v137 = *(double *)&v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Updated wasContinuedInfo with payload fetch results: %{private}@",  buf,  0xCu);
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadRequestedCompletions]);
  [*(id *)(a1 + 32) setPayloadRequestedCompletions:0];
  id v36 = *(id *)(a1 + 32);
  objc_sync_enter(v36);
  [*(id *)(a1 + 32) setPayloadRequested:0];
  if (!v6)
  {
    id v42 = -[UserActivityToBTLEPayload initWithData:]( objc_alloc(&OBJC_CLASS___UserActivityToBTLEPayload),  "initWithData:",  v5);
    os_log_t v43 = v42;
    if (!v42)
    {
      id v6 = 0LL;
      goto LABEL_75;
    }

    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload error](v42, "error"));
    BOOL v45 = v44 == 0LL;

    if (!v45)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload error](v43, "error"));
      [*(id *)(a1 + 32) setPayloadAvailable:0];
      os_log_t v46 = sub_100039584(0LL);
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 UUIDString]);
        int v50 = *(void **)(a1 + 32);
        *(_DWORD *)__int128 buf = 138543875;
        double v137 = *(double *)&v49;
        __int16 v138 = 2113;
        id v139 = v50;
        __int16 v140 = 2114;
        id v141 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Payload for item %{public}@/%{private}@ was received with error %{public}@\n",  buf,  0x20u);
      }

LABEL_73:
      goto LABEL_74;
    }

    id v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
      unsigned __int8 v55 = [v54 isEqual:@"com.apple.GameController"];
    }

    else
    {
      unsigned __int8 v55 = 0;
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
    if (!v56
      || (id v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]),
          unsigned int v58 = [v57 isEqual:@"NSUserActivityTypeBrowsingWeb"],
          v57,
          v56,
          !v58))
    {
      if ((v55 & 1) != 0
        || (__int128 v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs])) == 0
        || (uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]),
            unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID")),
            unsigned __int8 v73 = [v71 containsObject:v72],
            v72,
            v71,
            v70,
            (v73 & 1) != 0))
      {
        id v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
        if (!v74) {
          goto LABEL_63;
        }
        os_log_t v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
        id v76 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](v43, "activityType"));
        unsigned __int8 v77 = [v75 isEqual:v76];

        if ((v77 & 1) != 0) {
          goto LABEL_63;
        }
        os_log_t v78 = sub_100039584(0LL);
        __int128 v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          os_log_t v80 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
          id v81 = (id)objc_claimAutoreleasedReturnValue([v80 UUIDString]);
          os_log_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](v43, "activityType"));
          __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityType]);
          *(_DWORD *)__int128 buf = 138544131;
          double v137 = *(double *)&v81;
          __int16 v138 = 2113;
          id v139 = v82;
          __int16 v140 = 2113;
          id v141 = v83;
          __int16 v142 = 2048;
          uint64_t v143 = -111LL;
          _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "*** Mismatch for activity %{public}@ between activityType from received activity, %{private}@, and activityT ype associated with application targeted, %{private}@, so refusing to pass along activity to this target, error #%ld.",  buf,  0x2Au);
        }
      }

      else
      {
        os_log_t v84 = sub_100039584(0LL);
        __int128 v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          __int128 v130 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
          id v85 = (id)objc_claimAutoreleasedReturnValue([v130 UUIDString]);
          id v86 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
          os_log_t v87 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]);
          v88 = (void *)objc_claimAutoreleasedReturnValue([v87 description]);
          id v89 = sub_10005BF18(v88);
          id v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
          *(_DWORD *)__int128 buf = 138544131;
          double v137 = *(double *)&v85;
          __int16 v138 = 2113;
          id v139 = v86;
          __int16 v140 = 2113;
          id v141 = v90;
          __int16 v142 = 2048;
          uint64_t v143 = -111LL;
          _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "*** Mismatch for activity %{public}@  between teamID from received activity, %{private}@, and teamID associa ted with application targeted, %{private}@, so refusing to pass along activity to this target.  Error #%ld, UAContinuityUserActivityFailedValidation",  buf,  0x2Au);
        }
      }

      id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -111LL,  0LL));
LABEL_74:

      goto LABEL_75;
    }

    id v59 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]);
      if (v60)
      {
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]);
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
        unsigned __int8 v128 = [v61 containsObject:v62];

        if ((v128 & 1) == 0)
        {
          os_log_t v63 = sub_100039584(0LL);
          id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            os_log_t v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
            id v129 = (id)objc_claimAutoreleasedReturnValue([v65 UUIDString]);
            id v127 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
            __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]);
            __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 description]);
            id v68 = sub_10005BF18(v67);
            __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
            *(_DWORD *)__int128 buf = 138543875;
            double v137 = *(double *)&v129;
            __int16 v138 = 2113;
            id v139 = v127;
            __int16 v140 = 2113;
            id v141 = v69;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "*** For activity %{public}@ of type NSUserActivityTypeBrowsingWeb, being reecived, since the teamID from r eceived activity, %{private}@, and teamID associated with application targeted, %{private}@, do not match, setting the userInfoPayload to nil so we don't deliver an un-expected payload type to the target.",  buf,  0x20u);
          }

LABEL_62:
          -[UserActivityToBTLEPayload setUserInfoPayload:](v43, "setUserInfoPayload:", 0LL);
          -[UserActivityToBTLEPayload setStreamsData:](v43, "setStreamsData:", 0LL);
          goto LABEL_63;
        }
      }

      else
      {
      }
    }

    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) teamIDs]);
    if (v91)
    {
    }

    else
    {
      os_log_t v92 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
      BOOL v93 = v92 == 0LL;

      if (!v93)
      {
        os_log_t v94 = sub_100039584(0LL);
        id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
          id v96 = (id)objc_claimAutoreleasedReturnValue([v95 UUIDString]);
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](v43, "teamID"));
          *(_DWORD *)__int128 buf = 138543619;
          double v137 = *(double *)&v96;
          __int16 v138 = 2113;
          id v139 = v97;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "*** For activity %{public}@ of type NSUserActivityTypeBrowsingWeb, being received, since the teamID from rec eived activity, %{private}@, and the target application has no teamID, setting the userInfoPayload to nil so we don't deliver an un-expected payload type to the target.",  buf,  0x16u);
        }

        goto LABEL_62;
      }
    }

LABEL_63:
    os_log_t v98 = sub_100039584(0LL);
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      v101 = (void *)objc_claimAutoreleasedReturnValue([v100 UUIDString]);
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload userInfoPayload](v43, "userInfoPayload"));
      id v103 = sub_1000034D8(v102);
      v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
      *(_DWORD *)__int128 buf = 138543619;
      double v137 = *(double *)&v101;
      __int16 v138 = 2113;
      id v139 = v104;
      _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEBUG,  "Updating payload for item %{public}@ to %{private}@\n",  buf,  0x16u);
    }

    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload title](v43, "title"));
    [*(id *)(a1 + 32) setTitle:v105];

    id v106 = *(void **)(a1 + 32);
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload userInfoPayload](v43, "userInfoPayload"));
    [v106 setPayload:v107 identifier:UAUserActivityUserInfoPayload];

    uint64_t v108 = *(void **)(a1 + 32);
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload streamsData](v43, "streamsData"));
    [v108 setPayload:v109 identifier:UAUserActivityStreamsPayload];

    os_log_t v110 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload webpageURL](v43, "webpageURL"));
    [*(id *)(a1 + 32) setWebpageURL:v110];

    [*(id *)(a1 + 32) setPayloadAvailable:1];
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload additionalItems](v43, "additionalItems"));
    v112 = (void *)objc_claimAutoreleasedReturnValue([v111 objectForKey:@"persistentID"]);
    [*(id *)(a1 + 32) setPersistentIdentifier:v112];

    uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload additionalItems](v43, "additionalItems"));
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v113 objectForKey:@"targetContentID"]);

    if (v47)
    {
      uint64_t v114 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v47, v114) & 1) != 0)
      {
        os_log_t v115 = sub_100039584(0LL);
        v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138739971;
          double v137 = *(double *)&v47;
          _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_INFO,  "- Extracted targetContentIdentifie=%{sensitive}@ from additionalItems payload",  buf,  0xCu);
        }

        [*(id *)(a1 + 32) setTargetContentIdentifier:v47];
      }
    }

    uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload streamsData](v43, "streamsData"));

    if (v117)
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wasContinuedInfo]);
      [v118 setSupportsContinuityStreams:1];
    }

    v119 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
    [v119 scheduleBestAppDetermination];

    [*(id *)(a1 + 32) setPayloadAvailable:1];
    id v6 = 0LL;
    goto LABEL_73;
  }

  os_log_t v37 = sub_100039584(0LL);
  id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
    id v41 = *(void **)(a1 + 32);
    *(_DWORD *)__int128 buf = 138543875;
    double v137 = *(double *)&v40;
    __int16 v138 = 2113;
    id v139 = v41;
    __int16 v140 = 2112;
    id v141 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to fetch payload from sharingd for item %{public}@/%{private}@, with error %@\n",  buf,  0x20u);
  }

  [*(id *)(a1 + 32) setPayloadAvailable:0];
LABEL_75:
  os_log_t v120 = sub_100039584(0LL);
  v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
  {
    id v122 = [v35 count];
    *(_DWORD *)__int128 buf = 134218242;
    double v137 = *(double *)&v122;
    __int16 v138 = 2114;
    id v139 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEBUG,  "-- Calling %ld completionHandlers with payloadRequest information: error=%{public}@",  buf,  0x16u);
  }

  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  id v123 = v35;
  id v124 = [v123 countByEnumeratingWithState:&v131 objects:v135 count:16];
  if (v124)
  {
    uint64_t v125 = *(void *)v132;
    do
    {
      for (i = 0LL; i != v124; i = (char *)i + 1)
      {
        if (*(void *)v132 != v125) {
          objc_enumerationMutation(v123);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v131 + 1) + 8LL * (void)i) + 16LL))();
      }

      id v124 = [v123 countByEnumeratingWithState:&v131 objects:v135 count:16];
    }

    while (v124);
  }

  objc_sync_exit(v36);
}

void sub_10004D9F8(_Unwind_Exception *a1)
{
}

void sub_10004DC78(_Unwind_Exception *a1)
{
}

LABEL_28:
}

LABEL_84:
  dispatch_group_leave(*(dispatch_group_t *)&self->_shouldAdvertiseHandoff);
  return 0;
}

LABEL_19:
LABEL_20:
  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));

  if (v48)
  {
    v10->_clientIsSigned = 1;
  }

  else
  {
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
    int v50 = objc_claimAutoreleasedReturnValue([v49 valueForEntitlement:@"application-identifier"]);
    BOOL v51 = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v50;
  }

  int v52 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](v10, "teamID"));
  if (v52) {
    goto LABEL_26;
  }
  id v53 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));
  v54 = v53 == 0LL;

  if (!v54)
  {
    int v52 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));
    unsigned __int8 v55 = sub_10005BAD8(v52);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    id v57 = v10->_teamID;
    v10->_teamID = (NSString *)v56;

LABEL_26:
  }

  unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](v10, "teamID"));
  id v59 = v58 == 0LL;

  if (v59)
  {
    v60 = v10->_teamID;
    v10->_teamID = (NSString *)&stru_1000BE738;
  }

  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  v62 = v61;
  if (v61) {
    [v61 auditToken];
  }
  else {
    memset(v105, 0, sizeof(v105));
  }
  os_log_t v63 = sub_10004A37C(v105);
  id v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  -[UAUserActivityClientProcess setBundleIdentifier:](v10, "setBundleIdentifier:", v64);

  os_log_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v10, "bundleIdentifier"));
  LODWORD(v64) = v65 == 0LL;

  if ((_DWORD)v64)
  {
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v10, "applicationIdentifier"));
    -[UAUserActivityClientProcess setBundleIdentifier:](v10, "setBundleIdentifier:", v66);

    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v10, "bundleIdentifier"));
    id v68 = (char *)[v67 rangeOfString:@":"];
    __int128 v70 = v69;

    if (v70 == 1)
    {
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v10, "bundleIdentifier"));
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v71 substringFromIndex:v68 + 1]);
      -[UAUserActivityClientProcess setBundleIdentifier:](v10, "setBundleIdentifier:", v72);
    }
  }

  v10->_allowedToUseLSAlwaysEligible = 1;
  unsigned __int8 v73 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.private.coreservices.alwaysEligibleEvenWhenInBackground"]);
  v10->_allowedToUseEligibleEvenWhenInBackground = sub_100051F84(v73);

  id v74 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.LSAlwaysPick"]);
  v10->_allowedToUseLSAlwaysPick = sub_100051F84(v74);

  os_log_t v75 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.coreservices.canalwaysadvertise"]);
  v10->_allowedToUseUAAlwaysAdvertise = sub_100051F84(v75);

  id v76 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.private.coreservices.cangetcurrentactivityinfo"]);
  v10->_allowedToGetCurrentActivityInfo = sub_100051F84(v76);

  unsigned __int8 v77 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.private.coreservices.allowedToMatchUserActivities"]);
  if (sub_100051F84(v77))
  {
    v10->_allowedToMatchUserActivities = 1;
  }

  else
  {
    os_log_t v78 = (void *)objc_claimAutoreleasedReturnValue( [v8 valueForEntitlement:@"com.apple.private.coreserivces.allowedToMatchUserActivities"]);
    v10->_allowedToMatchUserActivities = sub_100051F84(v78);
  }

  __int128 v79 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess connection](v10, "connection"));
  os_log_t v80 = (void *)objc_claimAutoreleasedReturnValue([v79 valueForEntitlement:@"com.apple.private.canmodifyanyuseractivity"]);
  v10->_allowedToAccessAnyItem = sub_100051F84(v80);

  id v81 = sub_100039584(0LL);
  os_log_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
  {
    __int128 v83 = -[UAAuditToken pid](v10->_auditToken, "pid");
    os_log_t v84 = (void *)objc_claimAutoreleasedReturnValue([v7 appStateMonitor]);
    id v85 = @"YES";
    if (!v84) {
      id v85 = @"NO";
    }
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)os_log_t v110 = v83;
    *(_WORD *)&v110[4] = 2114;
    *(void *)&v110[6] = v85;
    _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEBUG,  "About to fetch bundleIdentifier for process with pid %d. Has appStateMonitor: %{public}@",  buf,  0x12u);
  }

  id v86 = dispatch_time(0LL, 10000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052000;
  block[3] = &unk_1000BCC58;
  os_log_t v87 = v10;
  v104 = v87;
  dispatch_after(v86, &_dispatch_main_q, block);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v7 appStateMonitor]);
  id v89 = (id)-[UAAuditToken pid](v10->_auditToken, "pid");
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_1000520D4;
  v100[3] = &unk_1000BDB30;
  id v90 = v87;
  v101 = v90;
  v102 = v7;
  [v88 applicationInfoForPID:v89 completion:v100];

  uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v91 addObserver:v90 selector:"debugStateChanged:" name:@"UAUserActivityDebugStateChanged" object:0];

  os_log_t v92 = sub_100039584(0LL);
  BOOL v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
  {
    os_log_t v94 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](v90, "auditToken"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess teamID](v90, "teamID"));
    id v96 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess applicationIdentifier](v90, "applicationIdentifier"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v90, "bundleIdentifier"));
    os_log_t v98 = -[UAUserActivityClientProcess allowedToAccessAnyItem](v90, "allowedToAccessAnyItem");
    *(_DWORD *)__int128 buf = 138544387;
    *(void *)os_log_t v110 = v94;
    *(_WORD *)&v110[8] = 2113;
    *(void *)&v110[10] = v95;
    v111 = 2113;
    v112 = v96;
    uint64_t v113 = 2113;
    uint64_t v114 = v97;
    os_log_t v115 = 1026;
    v116 = v98;
    _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "UserActivityClient:%{public}@, teamID=%{private}@ applicationID=%{private}@ bundleID=%{private}@ accessAny=%{public,BOOL}d ",  buf,  0x30u);
  }

  _Block_object_dispose(__str, 8);
  objc_destroyWeak(v122);
LABEL_45:

  return v10;
}

void sub_100051D8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_100051DDC(uint64_t a1, uint64_t a2)
{
}

void sub_100051DE8(uint64_t a1)
{
}

id sub_100051DF0(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained bundleIdentifier]);
    id v6 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 auditToken]);
    int v13 = 138478083;
    os_log_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = (int)[v7 pid];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "--- invalidation on connection to client %{private}@ pid=%ld",  (uint8_t *)&v13,  0x16u);
  }

  id v8 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  [v8 invalidate];

  id v9 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 controller]);
  id v11 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  [v10 removeClientActivityClient:v11];

  return objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), 0LL);
}

uint64_t sub_100051F84(void *a1)
{
  id v1 = a1;
  if (!v1
    || (uint64_t v2 = 1LL,
        id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL)),
        unsigned __int8 v4 = [v1 isEqual:v3],
        v3,
        (v4 & 1) == 0))
  {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:@"YES"];
  }

  return v2;
}

void sub_100052000(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);

  if (!v2)
  {
    os_log_t v3 = sub_100039584(0LL);
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      signed int v5 = [*(id *)(*(void *)(a1 + 32) + 88) pid];
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to fetch bundleIdentifier for process with pid %ld after 10 seconds",  (uint8_t *)&v6,  0xCu);
    }
  }

void sub_1000520D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  signed int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 88) pid];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v8 = sub_10005BF18(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)__int128 buf = 67109379;
    unsigned int v18 = v6;
    __int16 v19 = 2113;
    os_log_t v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CLIENT: Process info, for pid %d, is %{private}@",  buf,  0x12u);
  }

  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 mainDispatchQ]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052270;
  block[3] = &unk_1000BCE78;
  id v14 = *(id *)(a1 + 32);
  id v15 = v3;
  id v16 = *(id *)(a1 + 40);
  id v12 = v3;
  dispatch_async(v11, block);
}

void sub_100052270(id *a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = [*((id *)a1[4] + 11) pid];
    signed int v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] description]);
    id v6 = sub_10005BF18(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v16 = 67109379;
    unsigned int v17 = v4;
    __int16 v18 = 2113;
    __int16 v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "CLIENT: Process info, for pid %d, is %{private}@ (on queue)",  (uint8_t *)&v16,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKey:BKSApplicationStateDisplayIDKey]);
  id v9 = a1[4];
  objc_sync_enter(v9);
  if (v8)
  {
    [a1[4] setBundleIdentifier:v8];
    [a1[6] addUserActivityClient:a1[4]];
  }

  else
  {
    os_log_t v10 = sub_100039584(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = [*((id *)a1[4] + 11) pid];
      int v13 = (void *)objc_claimAutoreleasedReturnValue([a1[5] description]);
      id v14 = sub_10005BF18(v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v16 = 67109378;
      unsigned int v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CLIENT: Process info, for pid %d, doesn't include bundle identifier, so unable to locate this process \texcept b y pid.(is %{public}@)",  (uint8_t *)&v16,  0x12u);
    }

    [a1[6] addUserActivityClient:a1[4]];
  }

  objc_sync_exit(v9);
}

void sub_100052478(_Unwind_Exception *a1)
{
}

void sub_1000526B8(_Unwind_Exception *a1)
{
}

void sub_10005274C(_Unwind_Exception *a1)
{
}

void sub_1000527AC(_Unwind_Exception *a1)
{
}

void sub_100052844(_Unwind_Exception *a1)
{
}

void sub_100052C58(_Unwind_Exception *a1)
{
}

void sub_100052F14(_Unwind_Exception *a1)
{
}

void sub_1000535C4(_Unwind_Exception *a1)
{
}

void sub_1000535E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  signed int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Got error on connection back to client for %{public}@, error: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  id v7 = *(id *)(a1 + 40);
  objc_sync_enter(v7);
  [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
  objc_sync_exit(v7);

  [*(id *)(a1 + 40) dispatchPendingTasksForUUID:*(void *)(a1 + 32) error:v3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  [*(id *)(a1 + 48) invalidate];
}

void sub_100053714(_Unwind_Exception *a1)
{
}

void sub_100053730(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  int v8 = a4;
  os_log_t v9 = sub_100039584(0LL);
  __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
      int v19 = 138543618;
      os_log_t v20 = v12;
      __int16 v21 = 2114;
      os_log_t v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "FAILED: Calling back to client to ask it to save activity %{public}@ with error %{public}@.",  (uint8_t *)&v19,  0x16u);
    }

    goto LABEL_11;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    if (a3) {
      id v14 = "YES";
    }
    else {
      id v14 = "NO";
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 logString]);
    int v19 = 138543875;
    os_log_t v20 = v13;
    __int16 v21 = 2082;
    os_log_t v22 = v14;
    __int16 v23 = 2113;
    unsigned int v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Returned from back to client to ask it to save activity %{public}@, clean=%{public}s updatedInfo=%{private}@",  (uint8_t *)&v19,  0x20u);
  }

  int v16 = *(void **)(a1 + 40);
  if (v16)
  {
    [v16 update:v7];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) manager]);
    -[os_log_s scheduleUpdatingAdvertisableItems](v11, "scheduleUpdatingAdvertisableItems");
LABEL_11:
  }

  id v17 = *(id *)(a1 + 48);
  objc_sync_enter(v17);
  if (a3) {
    [*(id *)(*(void *)(a1 + 48) + 120) removeObject:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(a1 + 48) + 48) removeObject:*(void *)(a1 + 32)];
  objc_sync_exit(v17);

  [*(id *)(a1 + 48) dispatchPendingTasksForUUID:*(void *)(a1 + 32) error:v8];
  uint64_t v18 = *(void *)(a1 + 64);
  if (v18) {
    (*(void (**)(uint64_t, char *))(v18 + 16))(v18, v8);
  }
  [*(id *)(a1 + 56) invalidate];
}

void sub_100053978(_Unwind_Exception *a1)
{
}

void sub_100053B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  signed int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_100053E54(_Unwind_Exception *a1)
{
}

void sub_100053E84(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  signed int v5 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    int v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 block]);
    v7[2](v7, *(void *)(a1 + 40));

    [*(id *)(a1 + 48) addIndex:a3];
  }
}

void sub_100056164(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(void, void, uint64_t))(v2 + 16))(*(void *)(a1 + 40), 0LL, a2);
  }

  else
  {
    id v3 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0LL);
  }

void sub_1000561D0(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_log_t v5 = sub_100039584(0LL);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logString]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) payloadForIdentifier:UAUserActivityUserInfoPayload]);
    id v8 = sub_10005BD28(v7, 32LL);
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = UAUserActivityStreamsPayload;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) payloadForIdentifier:UAUserActivityStreamsPayload]);
    if (v11)
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) payloadForIdentifier:v10]);
      id v12 = sub_10005BD28(v34, 16LL);
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"stream=%@ ",  v2));
    }

    else
    {
      int v13 = &stru_1000BE738;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) webpageURL]);
    *(_DWORD *)__int128 buf = 138544643;
    id v15 = @"YES";
    id v38 = v36;
    if (!v14) {
      id v15 = &stru_1000BE738;
    }
    __int16 v39 = 2113;
    id v40 = v35;
    __int16 v41 = 2113;
    id v42 = v9;
    __int16 v43 = 2113;
    id v44 = v13;
    __int16 v45 = 2113;
    os_log_t v46 = v15;
    __int16 v47 = 2114;
    id v48 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "-- activity with uuid %{public}@, completed fetching payload, %{private}@ %{private}@ %{private}@%{private}@, for it. error=%{public}@",  buf,  0x3Eu);

    if (v11)
    {
    }
  }

  if (v4)
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    uint64_t v17 = UAContinuityErrorDomain;
    if ([v16 isEqual:UAContinuityErrorDomain])
    {
      id v18 = v4;
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  NSUnderlyingErrorKey));
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  -105LL,  v25));
    }

    os_log_t v26 = sub_100039584(0LL);
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
      *(_DWORD *)__int128 buf = 138543618;
      id v38 = v4;
      __int16 v39 = 2114;
      id v40 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  " -- Received error %{public}@ trying to fetch payload for item uuid %{public}@",  buf,  0x16u);
    }

    (*(void (**)(void, void, id))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL, v18);
  }

  else
  {
    os_log_t v19 = sub_100039584(0LL);
    os_log_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
      __int16 v23 = *(void **)(a1 + 40);
      *(_DWORD *)__int128 buf = 138543619;
      id v38 = v22;
      __int16 v39 = 2113;
      id v40 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  " -- Sending userActivityInfo back to client, %{public}@/%{private}@",  buf,  0x16u);
    }

    uint64_t v24 = *(void *)(a1 + 48);
    id v18 = [*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, id, void))(v24 + 16))(v24, v18, 0LL);
  }

  os_log_t v29 = sub_100039584(0LL);
  unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
    os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
    dispatch_source_t v33 = *(void **)(a1 + 40);
    *(_DWORD *)__int128 buf = 138543619;
    id v38 = v32;
    __int16 v39 = 2113;
    id v40 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  " -- Removing cornerActionItem payload %{public}@/%{private}@ because a client fetched it.",  buf,  0x16u);
  }

  [*(id *)(a1 + 40) clearPayload];
}

LABEL_33:
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem webpageURL](v16, "webpageURL"));
  unsigned __int8 v55 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v7, "webpageURL"));
  v56 = v55;
  if (v54 && v55)
  {
    id v57 = [v54 isEqual:v55];

    if ((v57 & 1) != 0) {
      goto LABEL_41;
    }
  }

  else
  {

    if (v54 == v56) {
      goto LABEL_41;
    }
  }

  unsigned int v58 = sub_100039584(0LL);
  os_log_t v19 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
  {
    id v59 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 UUIDString]);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem logString](v16, "logString"));
    *(_DWORD *)__int128 buf = 138543619;
    v119 = v60;
    os_log_t v120 = 2113;
    v121 = v61;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEBUG,  "Application item %{public}@/%{private}@ has changed .webPageURL, forcing an advertisement update.",  buf,  0x16u);
  }

  LOBYTE(v19) = 1;
LABEL_41:
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem proxiedBundleIdentifier](v16, "proxiedBundleIdentifier"));
  os_log_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v7, "options"));
  id v64 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);
  os_log_t v65 = v64;
  if (v62 && v64)
  {
    __int128 v66 = [v62 isEqual:v64];

    if ((v66 & 1) != 0) {
      goto LABEL_44;
    }
  }

  else
  {

    if (v62 == v65)
    {
LABEL_44:
      self = v116;
      if (!v115)
      {
        if ((v19 & 1) != 0)
        {
          LODWORD(v19) = 1;
          goto LABEL_70;
        }

        goto LABEL_64;
      }

  __int16 v21 = v27;
  if (BYTE2(v27->_sfAdvertisers) != v3 || BYTE3(v27->_sfAdvertisers) != v2)
  {
    os_log_t v22 = sub_100039584(0LL);
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = "";
      id v25 = "Handoff";
      if (!v3) {
        id v25 = "";
      }
      if (v2) {
        uint64_t v24 = "Pasteboard";
      }
      *(_DWORD *)__int128 buf = 136446466;
      dispatch_source_t v33 = v25;
      id v34 = 2082;
      id v35 = (uint64_t)v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "PEERS: Our peers ability to received handoff or pasteboard advertisements has changed; scheduling an check for o"
        "ur advertisement. %{public}s/%{public}s",
        buf,
        0x16u);
    }

    __int16 v21 = v27;
    BYTE2(v27->_sfAdvertisers) = v3;
    BYTE3(v27->_sfAdvertisers) = v2;
    -[UASharingAdvertiser scheduleAdvertisementUpdate:](v27, "scheduleAdvertisementUpdate:", 0.1);
  }

  objc_sync_exit(v21);
}

LABEL_51:
      unsigned __int8 v73 = objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
      if (!v73) {
        goto LABEL_59;
      }
      id v74 = (void *)v73;
      os_log_t v75 = v8;
      id v76 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess currentAdvertisableActivity](self, "currentAdvertisableActivity"));
      unsigned __int8 v77 = (void *)objc_claimAutoreleasedReturnValue([v76 uuid]);
      os_log_t v78 = objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
      __int128 v79 = (void *)v78;
      if (v77 && v78) {
        os_log_t v80 = [v77 isEqual:v78];
      }
      else {
        os_log_t v80 = v77 == (void *)v78;
      }

      id v8 = v75;
      self = v116;
      if ((v80 & 1) == 0)
      {
LABEL_59:
        id v85 = sub_100039584(0LL);
        os_log_t v19 = objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          id v86 = v8;
          os_log_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue([v87 UUIDString]);
          id v89 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem logString](v16, "logString"));
          id v90 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess bundleIdentifier](v116, "bundleIdentifier"));
          uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess auditToken](v116, "auditToken"));
          os_log_t v92 = [v91 pid];
          *(_DWORD *)__int128 buf = 138544131;
          v119 = v88;
          os_log_t v120 = 2113;
          v121 = v89;
          id v122 = 2113;
          id v123 = v90;
          id v124 = 2048;
          uint64_t v125 = (void *)v92;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "- Making %{public}@/%{private}@ into the currentItem from process %{private}@/%ld",  buf,  0x2Au);

          id v8 = v86;
          self = v116;
        }

        objc_storeStrong((id *)&self->_currentAdvertisableActivity, v16);
        LOBYTE(v19) = 1;
      }

      BOOL v93 = v19;
      os_log_t v94 = !sub_10005C3C4((uint64_t)-[UAUserActivityAdvertisableItem type](v16, "type"));
      v117 |= v94;
      LODWORD(v19) = 1;
      if ((v93 & 1) != 0 || v94)
      {
LABEL_68:
        auditToken = self->_auditToken;
        if (auditToken)
        {
          -[UAAuditToken auditTokenValue](auditToken, "auditTokenValue");
          id v96 = (void *)objc_claimAutoreleasedReturnValue(+[UADiagnosticManager sharedManager](&OBJC_CLASS___UADiagnosticManager, "sharedManager"));
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v7, "activityType"));
          [v96 submitUserActivityBecameCurrent:v97 withToken:buf];
        }

        goto LABEL_70;
      }

LABEL_64:
      if (-[UAUserActivityAdvertisableItem alwaysPick](v16, "alwaysPick")) {
        LODWORD(v19) = 1;
      }
      else {
        LODWORD(v19) = -[UAUserActivityAdvertisableItem alwaysEligible](v16, "alwaysEligible");
      }
      if (!v115) {
        goto LABEL_70;
      }
      goto LABEL_68;
    }
  }

  __int128 v67 = sub_100039584(0LL);
  os_log_t v19 = objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
  {
    id v68 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
    __int128 v69 = (__CFString *)objc_claimAutoreleasedReturnValue([v68 UUIDString]);
    __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(-[UAAdvertisableItem logString](v16, "logString"));
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString options](v7, "options"));
    unsigned int v72 = (__CFString *)objc_claimAutoreleasedReturnValue([v71 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"]);
    *(_DWORD *)__int128 buf = 138543875;
    v119 = v69;
    os_log_t v120 = 2113;
    v121 = v70;
    id v122 = 2114;
    id v123 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEBUG,  "Application item %{public}@/%{private}@ has changed proxy %{public}@, so forcing an advertisement update.",  buf,  0x20u);
  }

  LODWORD(v19) = 1;
  self = v116;
  if (v115) {
    goto LABEL_51;
  }
LABEL_70:
  -[UAUserActivityAdvertisableItem update:](v16, "update:", v7);
  if (!v18) {
    goto LABEL_74;
  }
LABEL_71:
  os_log_t v98 = sub_100039584(0LL);
  v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v7, "uuid"));
    v101 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v7, "activityType"));
    *(_DWORD *)__int128 buf = 138543875;
    v119 = v18;
    os_log_t v120 = 2114;
    v121 = v100;
    id v122 = 2113;
    id v123 = v101;
    _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "refusing to register user activity from client, and returning error %{public}@ for item %{public}@ %{private}@",  buf,  0x20u);
  }

LABEL_74:
  if ((_DWORD)v19)
  {
    v102 = sub_100039584(0LL);
    id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
      v105 = (__CFString *)objc_claimAutoreleasedReturnValue([v104 UUIDString]);
      *(_DWORD *)__int128 buf = 138543619;
      v119 = v105;
      os_log_t v120 = 2113;
      v121 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_INFO,  "BECOMECURRENT: updating advertisement for %{public}@/%{private}@ because the becomeCurrent item changed or a DNS item changed its URL",  buf,  0x16u);
    }

    id v106 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    [v106 scheduleUpdatingAdvertisableItems];
  }

  if (v117)
  {
    v107 = sub_100039584(0LL);
    uint64_t v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityAdvertisableItem uuid](v16, "uuid"));
      os_log_t v110 = (__CFString *)objc_claimAutoreleasedReturnValue([v109 UUIDString]);
      *(_DWORD *)__int128 buf = 138543619;
      v119 = v110;
      os_log_t v120 = 2113;
      v121 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_INFO,  "BECOMECURRENT: updating notifiers for %{public}@/%{private}@ because the becomeCurrent item changed",  buf,  0x16u);
    }

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityClientProcess manager](self, "manager"));
    [v111 scheduleBestAppDetermination];
  }

  v8[2](v8, v18);

  objc_autoreleasePoolPop(context);
}
    }

    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems"));
    __int128 v67 = v66 == 0LL;

    if (!v67)
    {
      id v68 = sub_100039584(0LL);
      __int128 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems"));
        *(_DWORD *)__int128 buf = 138412546;
        v105 = v70;
        id v106 = 2112;
        v107 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  "self.advertisableItems is %@, itemToAdvertise is %@",  buf,  0x16u);
      }
    }

    if (v25
      && (uint64_t v71 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo), (objc_opt_isKindOfClass(v25, v71) & 1) == 0))
    {
      os_log_t v78 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
      __int128 v79 = v78 == 0LL;

      if (!v79) {
        -[UASharingAdvertiser setBeginTimeForNonActiveAdvertisement:]( self,  "setBeginTimeForNonActiveAdvertisement:",  0LL);
      }
    }

    else
    {
      unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
      unsigned __int8 v73 = v72 == 0LL;

      if (!v73)
      {
        id v74 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        os_log_t v75 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
        id v76 = [v74 shouldItemBeAdvertised:v75];

        if (v76)
        {
          unsigned __int8 v77 = objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));

          id v25 = (id)v77;
        }

        else
        {
          os_log_t v80 = sub_100039584(0LL);
          id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            os_log_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
            __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v82 uuid]);
            os_log_t v84 = (id)objc_claimAutoreleasedReturnValue([v83 UUIDString]);
            id v85 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
            id v86 = (void *)objc_claimAutoreleasedReturnValue([v85 activityType]);
            *(_DWORD *)__int128 buf = 138543619;
            v105 = v84;
            id v106 = 2113;
            v107 = v86;
            _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "UPDATEADVERTISEMENT: Removing current advertisement item, %{public}@/%{private}@, because its process is gone",  buf,  0x16u);
          }

          -[UASharingAdvertiser removeAdvertisement](self, "removeAdvertisement");
        }
      }

      if (!v25)
      {
        os_log_t v92 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
        BOOL v93 = v92 == 0LL;

        if (v93)
        {
          id v25 = 0LL;
        }

        else
        {
          os_log_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
          v95 = [v94 multiHandoffEnabled];

          id v96 = sub_100039584(0LL);
          v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
          os_log_t v98 = os_log_type_enabled(v97, OS_LOG_TYPE_INFO);
          if (v95)
          {
            if (v98)
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_INFO,  "UPDATEADVERTISEMENT: No item available to advertise, so switching to advertising existing advertisement nonactively.",  buf,  2u);
            }

            id v25 = 0LL;
            -[UASharingAdvertiser moveAdvertisementToNonActive](self, "moveAdvertisementToNonActive");
          }

          else
          {
            if (v98)
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_INFO,  "UPDATEADVERTISEMENT: No item available to advertise, so",  buf,  2u);
            }

            id v25 = 0LL;
            -[UASharingAdvertiser removeAdvertisement](self, "removeAdvertisement");
          }
        }

        goto LABEL_83;
      }
    }

    os_log_t v87 = sub_100039584(0LL);
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      id v89 = (void *)objc_claimAutoreleasedReturnValue([v25 uuid]);
      id v90 = (void *)objc_claimAutoreleasedReturnValue([v89 UUIDString]);
      *(_DWORD *)__int128 buf = 138543362;
      v105 = v90;
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "UPDATEADVERTISEMENT: choose to advertise (%{public}@)",  buf,  0xCu);
    }

    -[UASharingAdvertiser advertiseItem:force:](self, "advertiseItem:force:", v25, 0LL);
LABEL_83:

    goto LABEL_84;
  }

  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  id v42 = v41 == 0LL;

  __int16 v43 = sub_100039584(0LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  id v44 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v42)
  {
    if (v44)
    {
      __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
      os_log_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 uuid]);
      __int16 v47 = (id)objc_claimAutoreleasedReturnValue([v46 UUIDString]);
      id v48 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 activityType]);
      *(_DWORD *)__int128 buf = 138543619;
      v105 = v47;
      id v106 = 2113;
      v107 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "UPDATEADVERTISEMENT: Removing current advertisement item, %{public}@/%{private}@, because self.activityAdvertisingAllowed == NO",  buf,  0x16u);
    }

    goto LABEL_32;
  }

  if (v44)
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "UPDATEADVERTISEMENT: Reached default case, not performing any action",  buf,  2u);
  }

LABEL_72:
            }
          }

          if (v80)
          {
            os_log_t v75 = (__CFString *)objc_claimAutoreleasedReturnValue([p_isa currentAdvertisableActivity]);
            id v76 = v75 == v30;

            if (v76)
            {
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472LL;
              v87[2] = sub_10005820C;
              v87[3] = &unk_1000BDD50;
              v87[4] = p_isa;
              -[__CFString requestPayloadWithCompletionHandler:](v30, "requestPayloadWithCompletionHandler:", v87);
            }
          }

          goto LABEL_76;
        }

LABEL_54:
        id v57 = (__CFString *)objc_claimAutoreleasedReturnValue([p_isa currentAdvertisableActivity]);
        unsigned int v58 = v57 == v30;

        if (v58)
        {
          id v59 = (void *)objc_claimAutoreleasedReturnValue([p_isa manager]);
          [v59 scheduleUpdatingAdvertisableItems];
        }

        goto LABEL_57;
      }

LABEL_38:
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v30, "activityType"));
      id v44 = [v43 isEqual:NSUserActivityTypeBrowsingWeb];

      if (v44)
      {
        __int16 v45 = sub_100039584(0LL);
        os_log_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([p_isa auditToken]);
          id v48 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uuid](v30, "uuid"));
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 UUIDString]);
          *(_DWORD *)__int128 buf = 138543875;
          BOOL v93 = v47;
          os_log_t v94 = 2114;
          v95 = v49;
          id v96 = 2113;
          v97 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Scheduling an advertising item update, for application %{public}@, because the   changed on a NSUserActivity TypeBrowsingWeb item, %{public}@/%{private}@",  buf,  0x20u);
        }

        int v50 = (void *)objc_claimAutoreleasedReturnValue([p_isa manager]);
        [v50 scheduleUpdatingAdvertisableItems];
      }

      goto LABEL_43;
    }
  }

LABEL_76:
  objc_autoreleasePoolPop(context);
}

void sub_1000581F0(_Unwind_Exception *a1)
{
}

void sub_10005820C(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
    [v2 scheduleUpdatingAdvertisableItems];
  }

void sub_100059FB8(_Unwind_Exception *a1)
{
}

void sub_100059FCC(uint64_t a1)
{
  context = objc_autoreleasePoolPush();
  uint64_t v5 = *(void *)(a1 + 48);
  switch(v5)
  {
    case 1LL:
      unsigned int v6 = *(void **)(a1 + 32);
      int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) inputStream]);

      if (v6 == v7)
      {
        id v103 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peerName]);

        if (!v103)
        {
          v104 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyForKey:@"__kCFStreamPropertyPeerAddress"]);
          v105 = v104;
          if (v104)
          {
            id v106 = v104;
            if (!getnameinfo( (const sockaddr *)[v106 bytes],  (socklen_t)objc_msgSend(v106, "length"),  (char *)buf,  0x1000u,  0,  0,  2))
            {
              v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  buf,  4LL));
              [*(id *)(a1 + 40) setPeerName:v107];
            }
          }
        }

        uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peerName]);
        [*(id *)(a1 + 40) setName:v108];
      }

      else
      {
        id v8 = *(void **)(a1 + 32);
        os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) outputStream]);

        if (v8 == v9)
        {
          os_log_t v10 = sub_100039584(0LL);
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peerName]);
            int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peerUUID]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
            int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
            *(_DWORD *)__int128 buf = 138478339;
            uint64_t v114 = v12;
            __int16 v115 = 2114;
            id v116 = v14;
            __int16 v117 = 2114;
            v118 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "NETWORK: Sending initial packet to paired client %{private}@/%{public}@ from controllerUUID=%{public}@.",  buf,  0x20u);
          }

          uint64_t v17 = *(void **)(a1 + 40);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 manager]);
          os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
          os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HANDOFF v%g %@\n",  0x4081380000000000LL,  v20,  context));
          [v17 sendResponse:v21];

          os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SFPeerDevice peerForSelf](&OBJC_CLASS___SFPeerDevice, "peerForSelf"));
          if (v22)
          {
            __int16 v23 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
            -[NSKeyedArchiver encodeObject:forKey:](v23, "encodeObject:forKey:", v22, NSKeyedArchiveRootObjectKey);
            uint64_t v24 = *(void **)(a1 + 40);
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v23, "encodedData"));
            id v26 = sub_1000034D8(v25);
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PEERINFO SF[$%@]\n",  v27));
            [v24 sendResponse:v28];
          }
        }
      }

      break;
    case 2LL:
      uint64_t v29 = (uint64_t)[*(id *)(a1 + 32) read:buf maxLength:1024];
      if (v29 >= 1)
      {
        unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
        [v30 appendBytes:buf length:v29];
      }

      os_log_t v31 = sub_100039584(0LL);
      os_log_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        dispatch_source_t v33 = *(void **)(a1 + 32);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
        id v35 = [v34 length];
        id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
        id v37 = sub_1000034D8(v36);
        id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
        *(_DWORD *)__int128 buf = 138478595;
        uint64_t v114 = v33;
        __int16 v115 = 2048;
        id v116 = v35;
        __int16 v117 = 2113;
        v118 = v38;
        __int16 v119 = 2114;
        os_log_t v120 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "NETWORK: stream=%{private}@ have %ld/%{private}@ controllerUUID=%{public}@",  buf,  0x2Au);
      }

      id v41 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
      os_log_t v110 = (char *)[v41 bytes];

      id v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
      BOOL v43 = [v42 length] == 0;

      uint64_t v44 = 0LL;
      if (!v43)
      {
        unint64_t v45 = 0LL;
        do
        {
          os_log_t v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
          BOOL v47 = v45 < (unint64_t)[v46 length];

          if (v47)
          {
            uint64_t v48 = 0LL;
            uint64_t v49 = &v110[v45];
            do
            {
              unsigned int v50 = v49[v48];
              BOOL v51 = v50 > 0xD;
              int v52 = (1 << v50) & 0x2401;
              BOOL v53 = v51 || v52 == 0;
              if (v53 || v48 < 2)
              {
                v54 = 0LL;
              }

              else
              {
                v54 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v49,  v48,  4LL);
                uint64_t v44 = v45 + v48 + 1;
              }

              unsigned __int8 v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
              BOOL v57 = v45 + v48 + 1 < (unint64_t)[v55 length] && v54 == 0;

              ++v48;
            }

            while (v57);
            v45 += v48;
            if (v54)
            {
              unsigned int v58 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) queue]);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10005AA60;
              block[3] = &unk_1000BDC88;
              void block[4] = *(void *)(a1 + 40);
              v112 = v54;
              id v59 = v54;
              dispatch_async(v58, block);
            }
          }

          v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
          BOOL v61 = v45 < (unint64_t)[v60 length];
        }

        while (v61);
      }

      v62 = objc_alloc(&OBJC_CLASS___NSMutableData);
      os_log_t v63 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
      id v64 = -[NSMutableData initWithBytes:length:]( v62,  "initWithBytes:length:",  &v110[v44],  (char *)[v63 length] - v44);
      [*(id *)(a1 + 40) setReadBuffer:v64];

      os_log_t v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
      BOOL v66 = [v65 length] == 0;

      if (!v66)
      {
        os_log_t v67 = sub_100039584(0LL);
        id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          __int128 v70 = *(void **)(a1 + 40);
          __int128 v69 = (id *)(a1 + 40);
          uint64_t v71 = *(v69 - 1);
          unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v70 readBuffer]);
          id v73 = [v72 length];
          id v74 = (void *)objc_claimAutoreleasedReturnValue([*v69 readBuffer]);
          id v75 = sub_1000034D8(v74);
          id v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
          *(_DWORD *)__int128 buf = 138478339;
          uint64_t v114 = v71;
          __int16 v115 = 2048;
          id v116 = v73;
          __int16 v117 = 2113;
          v118 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_INFO,  "NETWORK: stream=%{private}@ Remaining data, %ld/%{private}@",  buf,  0x20u);
        }
      }

      break;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
      break;
    case 4LL:
      id v77 = *(id *)(a1 + 40);
      objc_sync_enter(v77);
      os_log_t v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
      [v78 length];
      while (1)
      {

        __int128 v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
        id v80 = [v79 length];

        if (!v80) {
          break;
        }
        id v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) outputStream]);
        id v82 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
        id v83 = [v82 bytes];
        os_log_t v84 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
        id v85 = objc_msgSend(v81, "write:maxLength:", v83, objc_msgSend(v84, "length"));

        if (!v85) {
          break;
        }
        os_log_t v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
        id v86 = [v78 length];
        if (v85 >= v86)
        {
          v88 = 0LL;
        }

        else
        {
          id v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
          id v87 = [v1 bytes];
          id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) writeBuffer]);
          id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( NSMutableData,  "dataWithBytes:length:",  &v85[(void)v87],  (_BYTE *)[v2 length] - v85));
          v88 = v3;
        }

        [*(id *)(a1 + 40) setWriteBuffer:v88];
        if (v85 < v86)
        {
        }
      }

      objc_sync_exit(v77);

      break;
    case 8LL:
      os_log_t v89 = sub_100039584(0LL);
      id v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        uint64_t v91 = *(void **)(a1 + 32);
        os_log_t v92 = (void *)objc_claimAutoreleasedReturnValue([v91 streamError]);
        *(_DWORD *)__int128 buf = 138478083;
        uint64_t v114 = v91;
        __int16 v115 = 2114;
        id v116 = v92;
        _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_INFO,  "NETWORK: stream=%{private}@ error=%{public}@",  buf,  0x16u);
      }

      goto LABEL_51;
    default:
      if (v5 == 16)
      {
LABEL_51:
        os_log_t v93 = sub_100039584(0LL);
        os_log_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          v95 = *(void **)(a1 + 32);
          *(_DWORD *)__int128 buf = 138477827;
          uint64_t v114 = v95;
          _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEBUG,  "NETWORK: stream=%{private}@ END ENCOUNTERED",  buf,  0xCu);
        }

        id v96 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
        BOOL v97 = [v96 length] == 0;

        if (!v97)
        {
          id v98 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
          id v99 = [v98 bytes];

          v100 = objc_alloc(&OBJC_CLASS___NSString);
          v101 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readBuffer]);
          v102 = -[NSString initWithBytes:length:encoding:]( v100,  "initWithBytes:length:encoding:",  v99,  [v101 length],  4);

          [*(id *)(a1 + 40) processCommand:v102];
        }

        [*(id *)(a1 + 40) terminate];
      }

      break;
  }

  objc_autoreleasePoolPop(context);
}

void sub_10005AA3C(_Unwind_Exception *a1)
{
}

id sub_10005AA60(uint64_t a1)
{
  return [*(id *)(a1 + 32) processCommand:*(void *)(a1 + 40)];
}

void sub_10005B474(_Unwind_Exception *a1)
{
}

void sub_10005B6C8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputStream]);
  [v2 close];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputStream]);
  [v3 close];
}

BOOL sub_10005B958(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4) {
      BOOL v6 = [v3 compare:v4] == (id)-1;
    }
    else {
      BOOL v6 = 1LL;
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

void sub_10005B9C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005B9D8(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v3 = sub_10005B958(v1, v2);

  return v3;
}

void sub_10005BA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005BA4C(void *a1, void *a2)
{
  return !sub_10005B958(a1, a2);
}

BOOL sub_10005BA64(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v3 = !sub_10005B958(v1, v2);

  return v3;
}

void sub_10005BABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005BAD8(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0xB)
  {
    id v3 = [v2 rangeOfString:@"."];
    id v4 = 0LL;
    if (v5 == 1 && v3 == (id)10) {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 substringToIndex:10]);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

void sub_10005BB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_10005BB68(void *a1, unsigned int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (char *)[v3 length];
    if ((uint64_t)v5 <= a2)
    {
      id v8 = v4;
    }

    else
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 0, a2 >> 1));
      int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", &v5[-(a2 >> 1)], a2 >> 1));
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@..(%ld)..%@",  v6,  &v5[-a2],  v7));
    }
  }

  else
  {
    id v8 = &stru_1000BE738;
  }

  return v8;
}

void sub_10005BC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005BC70(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0x41)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData, "dataWithBytesNoCopy:length:freeWhenDone:", [v2 bytes], 64, 0));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  }

  return v4;
}

void sub_10005BD08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005BD28(void *a1, uint64_t a2)
{
  id v20 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"$"));
  id v4 = v20;
  __int16 v21 = (unsigned __int8 *)[v4 bytes];
  uint64_t v5 = (char *)[v4 length];
  BOOL v6 = v5;
  if (a2 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = a2 + 1;
  }
  uint64_t v8 = v7 >> 1;
  else {
    unint64_t v9 = (unint64_t)v5;
  }
  if (v9)
  {
    os_log_t v10 = v21;
    unint64_t v11 = v9;
    do
    {
      unsigned int v12 = *v10++;
      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c",  a0123456789abcd[(unint64_t)v12 >> 4],  a0123456789abcd[v12 & 0xF]));
      [v3 appendString:v13];

      --v11;
    }

    while (v11);
  }

  if ((unint64_t)v6 > v9)
  {
    objc_msgSend(v3, "appendFormat:", @".. %ld ..", v6);
    if (&v6[-v9] < v6)
    {
      uint64_t v14 = -(uint64_t)v9;
      id v15 = &v6[(void)v21];
      do
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c",  a0123456789abcd[(unint64_t)v15[v14] >> 4],  a0123456789abcd[v15[v14] & 0xF]));
        [v3 appendString:v16];
      }

      while (!__CFADD__(v14++, 1LL));
    }
  }

  id v18 = [v3 copy];

  return v18;
}

void sub_10005BECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

id sub_10005BF18(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if ([v1 containsString:@"\n"])
  {
    id v3 = [v1 mutableCopy];
    do
      id v4 = objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"\n",  &stru_1000BE738,  0,  0,  objc_msgSend(v3, "length"));
    while ((char *)objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"  ",  @" ",  0,  0,  objc_msgSend(v3, "length"))
          + (void)v4);
    id v2 = [v3 copy];
  }

  return v2;
}

void sub_10005C004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_10005C02C(double a1)
{
  if (a1 >= 1.0e98) {
    return @"forever";
  }
  if (a1 <= 0.0) {
    return @"now";
  }
  if (a1 >= 300.0)
  {
    if (a1 >= 3600.0)
    {
      if (a1 >= 86400.0)
      {
        if (a1 >= 7776000.0) {
          return @"a long time";
        }
        id v1 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"roughly %ld days",  3600 * ((uint64_t)a1 / 24));
      }

      else
      {
        id v1 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"roughly %ld hours",  (uint64_t)a1 / 3600);
      }
    }

    else
    {
      id v1 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"roughly %ld minutes",  (uint64_t)a1 / 60);
    }
  }

  else
  {
    id v1 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld seconds", (uint64_t)a1);
  }

  return (__CFString *)(id)objc_claimAutoreleasedReturnValue(v1);
}

__CFString *sub_10005C188(unint64_t a1)
{
  if (a1 == -1LL)
  {
    uint64_t v5 = @"forever";
  }

  else if (a1 && (v2 = dispatch_time(0LL, 0LL), v2 <= a1) && (double v3 = ((double)a1 - (double)v2) / 1000000000.0, v3 > 0.0))
  {
    if (v3 >= 10.0)
    {
      if (v3 >= 30.0)
      {
        if (v3 >= 300.0)
        {
          if (v3 >= 3600.0)
          {
            if (v3 >= 86400.0)
            {
              uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
              uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v7));

              return v5;
            }

            id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"roughly %2ld hours",  (uint64_t)(v3 / 60.0) / 24);
          }

          else
          {
            id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"roughly %2ld minutes",  (uint64_t)v3 / 60);
          }
        }

        else
        {
          id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%3ld seconds",  (uint64_t)v3);
        }
      }

      else
      {
        id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%2ld seconds",  (uint64_t)v3);
      }
    }

    else
    {
      id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%2.1g seconds",  *(void *)&v3);
    }

    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    uint64_t v5 = @"now";
  }

  return v5;
}

void sub_10005C354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_10005C364(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  else {
    dispatch_time_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UASuggestedActionType=%ld",  a1));
  }
  return v2;
}

BOOL sub_10005C3C4(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

double sub_10005C3D4()
{
  uint64_t v0 = mach_absolute_time();
  if (!v0) {
    return NAN;
  }
  unint64_t v1 = v0;
  mach_timebase_info info = 0LL;
  if (mach_timebase_info(&info)) {
    return NAN;
  }
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  double result = (double)v1 * (double)v2 / (double)v3 / 1000000000.0;
  double v5 = fabs(result);
  if (result < 0.0 || v5 == INFINITY) {
    return NAN;
  }
  return result;
}

id sub_10005C454(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1
    && (unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 appState]),
        unsigned int v4 = [v3 isInstalled],
        v3,
        v2,
        v4))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v2 activityTypes]);
    BOOL v6 = v5;
    if (v5) {
      id v7 = [v5 containsObject:@"NSUserActivityTypeBrowsingWeb"];
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_10005C4EC(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id sub_10005C524()
{
  id v0 = objc_alloc(&OBJC_CLASS___LSClaimBinding);
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https:"));
  id v10 = 0LL;
  id v2 = [v0 initWithURL:v1 error:&v10];
  id v3 = v10;

  if (!v2) {
    goto LABEL_6;
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleRecord]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleRecord]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 compatibilityObject]);

  if (!v8) {
    goto LABEL_6;
  }
  if ((sub_10005C454(v8) & 1) == 0)
  {

LABEL_6:
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.mobilesafari"));
  }

  return v8;
}

void sub_10005C648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005C67C(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_20;
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 allKeys]);
  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    uint64_t v6 = _LSUserActivityContainsFileProviderURLKey;
    uint64_t v17 = _LSUserActivityContainsUnsynchronizedCloudDocsKey;
    uint64_t v15 = UAUserActivityItemIsNotActiveKey;
    uint64_t v16 = _UAUserActivityContainsCloudDocsKey;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v8 isEqual:v6])
        {
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v8]);
          [v2 appendFormat:@"fileProvider:%@", v9];
        }

        else if ([v8 isEqual:v17])
        {
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v8]);
          [v2 appendFormat:@"unsyncronizedCloudDocs:%@", v9];
        }

        else if ([v8 isEqual:v16])
        {
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v8]);
          [v2 appendFormat:@"cloudDocs:%@", v9];
        }

        else if ([v8 isEqual:v15])
        {
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v8]);
          [v2 appendFormat:@"inactive:%@", v9];
        }

        else
        {
          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v8]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
          id v11 = sub_10005BF18(v10);
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          [v2 appendFormat:@"%@=%@", v8, v12];
        }
      }

      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v4);
  }

  [v2 appendFormat:@"}"];
  if (v2)
  {
    id v13 = [v2 copy];
  }

  else
  {
LABEL_20:
    id v13 = 0LL;
  }

  return v13;
}

void sub_10005C958( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005C9EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  a2,  a3,  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  [v6 writeArchiveData:v5 forItem:*a1];

  return a3;
}

BOOL sub_10005CA64(void *a1, const char *a2)
{
  return strncmp( (const char *)[a1 cStringUsingEncoding:4], a2, (int)objc_msgSend(a1, "length")) == 0;
}

void sub_10005CC2C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  [v3 createTmpArchiveFileWithUUID:v4];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v19 = 0LL;
  id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  *((void *)&v20 + 1) = sub_10005C9EC;
  *((void *)&v21 + 1) = &v19;
  LODWORD(v20) = 0;
  [*(id *)(a1 + 32) setWriter:ParallelArchiveWriterCreate(&v20)];
  __int128 v17 = 0u;
  LODWORD(v17) = -1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "baseURL",  0,  0,  0,  0,  (void)v17,  0,  0,  sub_10005CA64,  0));
  id v6 = objc_claimAutoreleasedReturnValue([v5 path]);
  *(void *)&__int128 v16 = [v6 cStringUsingEncoding:4];

  id v18 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) leaf]);
  if (!realpath_DARWIN_EXTSN((const char *)v16, v24))
  {
    os_log_t v7 = sub_100039584(@"pasteboard-server");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v23) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Dir invalid: %d", buf, 8u);
    }
  }

  uint64_t v10 = ParallelArchiveWriteDirContents([*(id *)(a1 + 32) writer], &v15);
  os_log_t v11 = sub_100039584(@"pasteboard-server");
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 134217984;
    uint64_t v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[Archiver] Created archive of size: %lld",  buf,  0xCu);
  }

  ParallelArchiveWriterDestroy([*(id *)(a1 + 32) writer]);
  [*(id *)(a1 + 32) setWriter:0];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
  [v13 finishWritingArchiveForUUID:v14];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_10005CEDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
}

void sub_10005D398( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10005D3B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id, id, id))(v8 + 16))(v8, v9, [v9 totalBytesReceived], v7);
}

void sub_10005D68C(_Unwind_Exception *a1)
{
}

void sub_10005E668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10005E69C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  (*(void (**)(uint64_t, id, uint64_t, id))(v4 + 16))(v4, WeakRetained, a2, v6);
}

uint64_t sub_10005EECC(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_10005EF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005EF30(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1
    && [v1 length]
    && (id v3 = v2,
        uint64_t v4 = (char *)[v3 bytes],
        uint64_t v5 = (uint64_t)[v3 length],
        v5 >= 1))
  {
    id v6 = v4 - 1;
    do
    {
      BOOL v7 = v6[v5] == 0;
      if (v6[v5]) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = (unint64_t)v5 > 1;
      }
      --v5;
    }

    while (v8);
  }

  else
  {
    BOOL v7 = 1LL;
  }

  return v7;
}

void sub_10005EFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F8D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10005FD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005FEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005FF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060050( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100060140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000604D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006055C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000611F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006199C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100007098((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_100062238( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24)
{
  _Unwind_Resume(a1);
}

id sub_1000622C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAdvertisement];
}

id sub_1000622D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _periodicIdleUpdate];
}

void sub_1000622D8(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  [*(id *)(a1 + 32) setUserIsCurrent:a2];
  if (v2) {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -8.0));
  }
  objc_msgSend(*(id *)(a1 + 32), "setLastUserActiveTime:");
}

void sub_100062354( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000623B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1000629AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100062B24(_Unwind_Exception *a1)
{
  BOOL v7 = v5;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100062B80(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) setPreventIdleSleepAssertion:0];
  objc_sync_exit(obj);
}

void sub_100062BCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_100062C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100062C98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _advertisePayload:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 48) name:0];
}

void sub_100062EBC(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

LABEL_40:
  return (char)v18;
}

LABEL_44:
    goto LABEL_45;
  }

  -[UASharingAdvertiser activityAdvertiser:activityPayloadForAdvertisementPayload:handoffCommand:requestedByDevice:withCompletionHandler:]( self,  "activityAdvertiser:activityPayloadForAdvertisementPayload:handoffCommand:requestedByDevice:withCompletionHandler:",  v74,  v12,  v13,  v14,  v15);
LABEL_45:
}

void sub_1000634E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_121:
LABEL_122:
            goto LABEL_123;
          }

          id v139 = sub_100039584(0LL);
          __int16 v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
          {
            id v141 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            __int16 v142 = [v141 maximumAdvertisementsPerTimeInterval];
            uint64_t v143 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            [v143 maximumAdvertisementsTimeInterval];
            double v145 = v144;
            __int16 v146 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
            uint64_t v147 = (void *)objc_claimAutoreleasedReturnValue([v146 firstObject]);
            *(_DWORD *)__int128 buf = 134218754;
            v176 = *(double *)&v142;
            v177 = 2048;
            v178 = v145;
            v179 = 2114;
            v180 = v147;
            v181 = 2114;
            v182 = v169;
            _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEBUG,  "ADVERTISING: Setting supressAdvertisementChange = YES because the advertisement too quickly, %ld in last % f seconds (earliest=%{public}@ now=%{public}@)",  buf,  0x2Au);
          }

          __int16 v148 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisementTimes](v166, "advertisementTimes"));
          id v149 = (void *)objc_claimAutoreleasedReturnValue([v148 firstObject]);
          -[__CFString timeIntervalSinceDate:](v169, "timeIntervalSinceDate:", v149);
          v151 = v150;

          if (v151 < 0.0)
          {
            v152 = (void *)objc_claimAutoreleasedReturnValue( +[UAUserActivityDefaults sharedDefaults]( &OBJC_CLASS___UAUserActivityDefaults,  "sharedDefaults"));
            [v152 minimumIntervalBetweenAdvertisements];
            if (v153 > -v151) {
              v153 = -v151;
            }
            -[UASharingAdvertiser scheduleAdvertisementUpdate:](v166, "scheduleAdvertisementUpdate:", v153);
          }

LABEL_119:
          v158 = sub_100039584(0LL);
          id v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "ADVERTISING: Since supressAdvertisementChange == YES, not actually changing the active advertisement and r elying on it happening again in the near future.",  buf,  2u);
          }

          goto LABEL_121;
        }
      }
    }

    goto LABEL_60;
  }

LABEL_123:
  return 0;
}
}

void sub_100064944( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20, void *a21, void *a22)
{
  _Unwind_Resume(a1);
}

LABEL_32:
    -[UASharingAdvertiser removeAdvertisement](self, "removeAdvertisement");
    goto LABEL_84;
  }

  if (-[UACornerActionManagerHandler suspended](self, "suspended"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
    uint64_t v14 = v13 == 0LL;

    __int128 v15 = sub_100039584(0LL);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    __int128 v16 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "UPDATEADVERTISEMENT: called while we are suspended",  buf,  2u);
      }
    }

    else if (v16)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
      *(_DWORD *)__int128 buf = 138543362;
      v105 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "ADVERTISING: Removing advertisement %{public}@ because advertising is suspended",  buf,  0xCu);
    }

    goto LABEL_32;
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  uint64_t v23 = [v22 activityAdvertisingAllowed];

  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    id v25 = (id)objc_claimAutoreleasedReturnValue([v24 pinnedUserActivityInfoItem]);

    id v26 = objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [(id)v26 lastActiveItemRemovalDelay];
    id v28 = v27;

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
    LOBYTE(v26) = v29 == 0LL;

    if ((v26 & 1) == 0)
    {
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
      [v30 timeIntervalSinceDate:v31];
      dispatch_source_t v33 = v32;

      id v34 = sub_100039584(0LL);
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28 - v33));
        *(_DWORD *)__int128 buf = 138412546;
        v105 = v36;
        id v106 = 2112;
        v107 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "We have a non-active advertisement, started at: %@, %@s till removal",  buf,  0x16u);
      }

      if (v33 >= v28)
      {
        unsigned int v50 = sub_100039584(0LL);
        BOOL v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          int v52 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
          *(_DWORD *)__int128 buf = 138543362;
          v105 = v52;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "Removing non-active advertisment (%{public}@)",  buf,  0xCu);
        }

        -[UASharingAdvertiser setBeginTimeForNonActiveAdvertisement:]( self,  "setBeginTimeForNonActiveAdvertisement:",  0LL);
        -[UASharingAdvertiser removeAdvertisement](self, "removeAdvertisement");
      }

      else
      {
        id v38 = sub_100039584(0LL);
        __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
          *(_DWORD *)__int128 buf = 138543362;
          v105 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Rescheduling update to remove advertisment (%{public}@)",  buf,  0xCu);
        }

        -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:", v28 - v33);
      }
    }

    if (!v25)
    {
      BOOL v53 = sub_100039584(0LL);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "UPDATEADVERTISEMENT: looking for a new activity to advertise",  buf,  2u);
      }

      if (-[UASharingAdvertiser shouldAdvertisePasteboard](self, "shouldAdvertisePasteboard"))
      {
        unsigned __int8 v55 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        v56 = [v55 clipboardSharingEnabled];
      }

      else
      {
        v56 = 0;
      }

      BOOL v57 = -[UASharingAdvertiser shouldAdvertiseHandoff](self, "shouldAdvertiseHandoff");
      v101 = 0u;
      v102 = 0u;
      id v99 = 0u;
      v100 = 0u;
      unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser advertisableItems](self, "advertisableItems"));
      id v25 = 0LL;
      id v59 = [v58 countByEnumeratingWithState:&v99 objects:v103 count:16];
      if (v59)
      {
        v60 = *(void *)v100;
        while (2)
        {
          for (i = 0LL; i != v59; i = (char *)i + 1)
          {
            if (*(void *)v100 != v60) {
              objc_enumerationMutation(v58);
            }
            v62 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
            os_log_t v63 = objc_opt_class(&OBJC_CLASS___UASharedPasteboardActivityInfo);
            if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0)
            {
              if (v56)
              {
                id v64 = v62;

                id v25 = v64;
              }
            }

            else
            {
              if (v25) {
                os_log_t v65 = 0;
              }
              else {
                os_log_t v65 = v57;
              }
              if (v65 == 1)
              {
                id v25 = v62;
                goto LABEL_64;
              }
            }
          }

          id v59 = [v58 countByEnumeratingWithState:&v99 objects:v103 count:16];
          if (v59) {
            continue;
          }
          break;
        }
      }

void sub_100065A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065C1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100065F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000662C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

LABEL_13:
    id v19 = 1;
    goto LABEL_14;
  }

  if (v28 > 13) {
    goto LABEL_13;
  }
  if (v28 != 13) {
    goto LABEL_29;
  }
  __int128 v16 = v26 == 65;
  if (v26 > 65) {
    goto LABEL_13;
  }
  __int128 v17 = v27;
  id v18 = 125LL;
LABEL_23:
  id v19 = v16 && v17 > v18;
LABEL_14:

  return v19;
}

  objc_sync_exit(v4);
}

  objc_autoreleasePoolPop(v8);
}

void sub_100066624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000667AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100066A68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshPairedSFPeerDevices];
}

void sub_100066B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100066B30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshPairedSFPeerDevices];
}

void sub_100066D38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_100066D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
    [v4 addObjectsFromArray:v5];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100066DFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100067220( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, id obj)
{
  _Unwind_Resume(a1);
}

BOOL sub_100067280(void *a1, void *a2, unsigned int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 productName]);
    if ([v7 isEqual:v6])
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 productBuildVersion]);
      BOOL v9 = (uint64_t)[v8 integerValue] >= a3;
    }

    else
    {
      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  return v9;
}

void sub_100067320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006734C(void *a1)
{
  id v13 = a1;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{("));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = v13;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 modelIdentifier]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 productBuildVersion]);
        [v1 appendFormat:@"%@/%@/%@/%@ ", v7, v8, v9, v10];
      }

      id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v3);
  }

  [v1 appendString:@"}"]);
  id v11 = [v1 copy];

  return v11;
}

void sub_1000674F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000675C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000677A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_4:
  unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000BDFF8]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v9 = sub_100039584(0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dataForMoreAppSuggestions:", buf, 2u);
  }

  uint64_t v49 = 0u;
  unsigned int v50 = 0u;
  BOOL v47 = 0u;
  uint64_t v48 = 0u;
  id obj = v45;
  id v11 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v11)
  {
    unsigned int v12 = *(void *)v48;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        __int128 v14 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
        if (-[UASharingAdvertiser userIsCurrent](self, "userIsCurrent"))
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[UASharingAdvertiser beginTimeForNonActiveAdvertisement]( self,  "beginTimeForNonActiveAdvertisement"));
          if (v15)
          {
          }

          else
          {
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
            __int128 v17 = [v16 isEqual:v14];

            if ((v17 & 1) != 0)
            {
              id v18 = 1LL;
              goto LABEL_20;
            }
          }
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
        [v8 timeIntervalSinceDate:v19];
        __int128 v21 = v20 > 600.0;

        if (v21)
        {
          __int128 v22 = sub_100039584(0LL);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
            *(_DWORD *)__int128 buf = 138412802;
            v56 = v24;
            BOOL v57 = 2112;
            unsigned int v58 = v25;
            id v59 = 2048;
            v60 = 10LL;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "skipping %@ because its .when (%@) is older than %lum:",  buf,  0x20u);
          }

          goto LABEL_25;
        }

        id v18 = 0LL;
LABEL_20:
        id v26 = objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload);
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
        uint64_t v23 = -[SharingBTLEAdvertisementPayload initWithItem:isCurrent:when:versionFlags:]( v26,  "initWithItem:isCurrent:when:versionFlags:",  v14,  v18,  v27,  5LL);

        id v28 = sub_100039584(0LL);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
          os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue([v14 when]);
          *(_DWORD *)__int128 buf = 138412546;
          v56 = v30;
          BOOL v57 = 2112;
          unsigned int v58 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
        }

        if (![v6 length])
        {
          os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s advertisementPayload](v23, "advertisementPayload"));
          dispatch_source_t v33 = [v32 length];

          buf[0] = v33;
          [v6 appendBytes:buf length:1];
        }

        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s advertisementPayload](v23, "advertisementPayload"));
        [v6 appendData:v34];

LABEL_25:
      }

      id v11 = [obj countByEnumeratingWithState:&v47 objects:v61 count:16];
    }

    while (v11);
  }

  return v6;
}

void sub_100067DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100067F00(id a1, UAUserActivityInfo *a2, UAUserActivityInfo *a3)
{
  uint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](a2, "when"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityInfo when](v4, "when"));
  id v7 = [v5 compare:v6];

  return (int64_t)v7;
}

void sub_100067F6C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100068930( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100068BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2,  a3);
}

uint64_t sub_100068BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2,  a3);
}

uint64_t sub_100068BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2,  a3);
}

LABEL_116:
    v187 = sub_100039584(0LL);
    v188 = (os_log_s *)objc_claimAutoreleasedReturnValue(v187);
    if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
    {
      v189 = sub_1000034D8(v203);
      v190 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue(v189);
      v191 = (__CFString *)objc_claimAutoreleasedReturnValue([0 activityType]);
      v192 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
      v193 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue([v192 UUIDString]);
      *(_DWORD *)__int128 buf = 138543875;
      v217 = v190;
      v218 = 2113;
      v219 = v191;
      v220 = 2114;
      v221 = v193;
      _os_log_impl( (void *)&_mh_execute_header,  v188,  OS_LOG_TYPE_ERROR,  "Failure after updating userActivity information from client application for activity %{public}@/%{private}@ %{pu blic}@; the activity disappeared/is no longer current and so cannot be handedOff.",
        buf,
        0x20u);
    }

    id v34 = 0LL;
    v195 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -107LL,  0LL));
    (*((void (**)(id, void, void))v202 + 2))(v202, 0LL, 0LL);
    goto LABEL_119;
  }

  os_log_t v32 = sub_100039584(0LL);
  dispatch_source_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Failing request because self.activityAdvertisingAllowed == NO",  buf,  2u);
  }

  if (v202)
  {
    id v34 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -107LL,  0LL));
    (*((void (**)(id, void, void, SharingBTLEAdvertisementPayload *))v202 + 2))(v202, 0LL, 0LL, v34);
    goto LABEL_122;
  }

void sub_10006A404( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20, void *a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, void *a28)
{
  _Unwind_Resume(a1);
}

void sub_10006AAE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(@"signposts");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 32);
  if (v7 + 1 >= 2 && os_signpost_enabled(v5))
  {
    int v15 = 67109120;
    LODWORD(v16) = v3 == 0LL;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "handoffFetch",  "success=%d enableTelemetry=YES ",  (uint8_t *)&v15,  8u);
  }

  os_log_t v8 = sub_100039584(0LL);
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logString]);
    int v15 = 138543875;
    id v16 = v11;
    __int16 v17 = 2114;
    id v18 = v13;
    __int16 v19 = 2113;
    __int128 v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "-- received data from advertiseableItem delegate callback to client, uuid=%{public}@ activity=%{public}@/%{private}@",  (uint8_t *)&v15,  0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006ACA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006AF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B0F8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sfActivityAdvertisers]);
  id v4 = [v3 count];

  if ((unint64_t)v4 > 1)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 65LL) = 1;
  }

  else
  {
    os_log_t v5 = sub_100039584(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) count];
      id v8 = sub_10006734C(*(void **)(a1 + 40));
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairedDevices]);
      int v11 = 134218498;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2048;
      id v16 = [v10 count];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Adopting paired devices, PAIRED DEVICES CHANGED: Now is %ld/%@  (was %ld devices)",  (uint8_t *)&v11,  0x20u);
    }

    [*(id *)(a1 + 32) setPairedDevices:*(void *)(a1 + 40)];
  }

  objc_sync_exit(v2);
}

void sub_10006B26C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006B300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B3A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006B430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B6C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_10006B718( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10006B764( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10006B8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006BA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_10:
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](self, "sfActivityAdvertisers"));
  id v12 = [v11 count];

  if (v12 != (id)1)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertisers](self, "sfActivityAdvertisers"));
    objc_msgSend(v64, "appendFormat:", @"%ld sfActivityAdvertisers", objc_msgSend(v13, "count"));
  }

  BOOL v61 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
  id v14 = [v61 runCount];
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser nextScheduleUpdate](self, "nextScheduleUpdate"));
  __int16 v15 = sub_10005C188((unint64_t)[v60 nextTime]);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v59 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
  id v16 = [v59 runCount];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser periodicUpdate](self, "periodicUpdate"));
  id v18 = sub_10005C188((unint64_t)[v17 nextTime]);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (-[UASharingAdvertiser userIsCurrent](self, "userIsCurrent")) {
    __int128 v20 = @"(current) ";
  }
  else {
    __int128 v20 = &stru_1000BE738;
  }
  __int128 v21 = -[UASharingAdvertiser userIsCurrent](self, "userIsCurrent");
  __int128 v22 = &stru_1000BE738;
  if ((v21 & 1) != 0)
  {
    uint64_t v23 = 0;
  }

  else
  {
    unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastUserActiveTime](self, "lastUserActiveTime"));
    if (v58)
    {
      BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastUserActiveTime](self, "lastUserActiveTime"));
      uint64_t v24 = sub_1000758E0(v57);
      __int128 v22 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v23 = 1;
    }

    else
    {
      uint64_t v23 = 0;
      unsigned int v58 = 0LL;
    }
  }

  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  if ([v27 clipboardSharingEnabled])
  {
    id v28 = -[UASharingAdvertiser pasteboardAvailible](self, "pasteboardAvailible");
    uint64_t v29 = @"+ Advertising Local Pasteboard.";
    if (!v28) {
      uint64_t v29 = &stru_1000BE738;
    }
  }

  else
  {
    uint64_t v29 = @"ClipboardSharingDisabled";
  }

  [v64 appendFormat:@", run=%ld times/%@ periodic=%ld/%@ %@%@%@\n", v14, v62, v16, v19, v20, v22, v29];

  if (v23)
  {
  }

  if ((v21 & 1) == 0) {

  }
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisedItem](self, "currentAdvertisedItem"));
  if (v30
    && (os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload")),
        v31,
        v31))
  {
    os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 activityType]);
    dispatch_source_t v33 = (void *)objc_claimAutoreleasedReturnValue([v30 dynamicActivityType]);
    if (v33)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v30 dynamicActivityType]);
      os_log_t v63 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @":%@",  v14));
    }

    else
    {
      os_log_t v63 = &stru_1000BE738;
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue([v30 uuid]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser currentAdvertisementPayload](self, "currentAdvertisementPayload"));
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](self, "lastAdvertismentTime"));
    id v40 = sub_1000758E0(v39);
    id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    [v64 appendFormat:@" ADVERTISING: %@%@ %@ /, data=%@, at %@\n", v32, v63, v37, v38, v41];

    if (!v33) {
      goto LABEL_43;
    }
  }

  else
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertisementPayload](self, "lastAdvertisementPayload"));

    if (!v34)
    {
      [v64 appendString:@" LAST: nil\n"];
      goto LABEL_44;
    }

    os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertisementPayload](self, "lastAdvertisementPayload"));
    dispatch_source_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser lastAdvertismentTime](self, "lastAdvertismentTime"));
    id v35 = sub_1000758E0(v33);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v35);
    [v64 appendFormat:@" LAST:%@, at %@\n", v32, v14];
  }

LABEL_43:
LABEL_44:
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertiser](self, "sfActivityAdvertiser"));

  if (v42)
  {
    BOOL v43 = dispatch_group_create();
    dispatch_group_enter(v43);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertiser](self, "sfActivityAdvertiser"));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10006C314;
    v69[3] = &unk_1000BE090;
    unint64_t v45 = v64;
    __int128 v70 = v45;
    uint64_t v71 = self;
    os_log_t v46 = v43;
    unsigned int v72 = v46;
    [v44 fetchLoginIDWithCompletionHandler:v69];

    dispatch_group_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    dispatch_group_enter(v46);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[UASharingAdvertiser sfActivityAdvertiser](self, "sfActivityAdvertiser"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_10006C3FC;
    v65[3] = &unk_1000BE0B8;
    unsigned int v50 = v47;
    BOOL v66 = v50;
    BOOL v51 = v48;
    os_log_t v67 = v51;
    int v52 = v46;
    id v68 = v52;
    [v49 fetchSFPeerDevicesWithCompletionHandler:v65];

    dispatch_group_wait(v52, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v53 = &stru_1000BE738;
    if (v50) {
      v54 = v50;
    }
    else {
      v54 = &stru_1000BE738;
    }
    if (v51) {
      BOOL v53 = v51;
    }
    [v45 appendFormat:@"%@%@\n", v54, v53];
  }

  unsigned __int8 v55 = [v64 copy];

  return v55;
}

void sub_10006C118( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
  _Unwind_Resume(a1);
}

void sub_10006C314(uint64_t a1, void *a2, void *a3)
{
  int v11 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 appendFormat:@" No AppleID, %@", v5];
  }

  else
  {
    id v7 = @"?";
    if (v11) {
      id v7 = v11;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(_BYTE *)(v8 + 66)) {
      id v9 = "";
    }
    else {
      id v9 = "(no handoff)";
    }
    if (*(_BYTE *)(v8 + 67)) {
      uint64_t v10 = "";
    }
    else {
      uint64_t v10 = "(no pasteboard)";
    }
    [v6 appendFormat:@" AppleID:%@, devices%s%s:", v7, v9, v10];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10006C3E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10006C3FC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v17 = v2;
    id obj = v2;
    id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          if ([v7 validKey])
          {
            uint64_t v8 = *(void **)(a1 + 32);
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 modelIdentifier]);
            int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 productName]);
            id v12 = sub_10006C6C4(v11);
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 productBuildVersion]);
            [v8 appendFormat:@"%@/%@-%@-%@:+%ld, ", v9, v10, v13, v14, objc_msgSend(v7, "keyCounter")];
          }

          else
          {
            __int16 v15 = *(void **)(a1 + 40);
            id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 modelIdentifier]);
            int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 productName]);
            id v16 = sub_10006C6C4(v11);
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 productBuildVersion]);
            [v15 appendFormat:@"[%@/%@-%@-%@], ", v9, v10, v13, v14];
          }
        }

        id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v4);
    }

    id v3 = v17;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10006C620( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
}

__CFString *sub_10006C6C4(void *a1)
{
  id v1 = a1;
  if ([v1 isEqual:@"iPhone OS"])
  {
    id v2 = @"iOS";
  }

  else if ([v1 isEqual:@"Mac OS X"])
  {
    id v2 = @"macOS";
  }

  else if ([v1 isEqual:@"Watch OS"])
  {
    id v2 = @"watchOS";
  }

  else if ([v1 isEqual:@"TVOS"])
  {
    id v2 = @"tvOS";
  }

  else
  {
    id v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_10006C770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CDF8(uint64_t a1, void *a2)
{
  id v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000DE468);
  id v3 = (void *)qword_1000DE460;
  if (v7 && !qword_1000DE460)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v5 = (void *)qword_1000DE460;
    qword_1000DE460 = v4;

    id v3 = (void *)qword_1000DE460;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a1));
  [v3 setObject:v7 forKeyedSubscript:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DE468);
}

void sub_10006CEA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006CEC8(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  os_log_t v3 = sub_100039584(0LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(a1 + 32) commandPort];
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Received message from another simulator on port %ld, so dispatching.",  (uint8_t *)&v6,  0xCu);
  }

  dispatch_mig_server(*(void *)(a1 + 40), 92LL, sub_1000771D8);
  objc_autoreleasePoolPop(v2);
}

void sub_10006CFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CFBC(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  os_log_t v3 = sub_100039584(0LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(a1 + 32) commandPort];
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Tearing down dispatch_source_t for messages from simulator port %ld",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(a1 + 32) terminate];
  sub_10006CDF8((uint64_t)[*(id *)(a1 + 32) commandPort], *(void **)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_10006D09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006D26C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10006D2B8(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Received notification that parent simulator started up, so forcing a reconnect to re-establish state.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) reconnectToParentSimulator];
}

void sub_10006D3B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___UASimulator;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_10006D8A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006D938(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    *(_DWORD *)__int128 buf = 134217984;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Detected death of parent simulator port %ld.",  buf,  0xCu);
  }

  mach_port_mod_refs(mach_task_self_, *(_DWORD *)(a1 + 48), 0, -1);
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(_DWORD *)(*(void *)(a1 + 32) + 48LL) = 0;
  objc_sync_exit(v5);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 dispatchQ]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006DAD4;
  block[3] = &unk_1000BCCA8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v6, v8, block);
}

void sub_10006DABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006DAD4(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: *** Attempting to reconnect / relaunch parent simulator.",  v5,  2u);
  }

  return [*(id *)(a1 + 32) reconnectToParentSimulator];
}

void sub_10006DB48(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Cancelling parent simulator port death source, port %ld",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10006DC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006DDB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006DF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006E504(uint64_t a1, uint64_t a2, unsigned int a3)
{
  id v5 = sub_10006E67C(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2, a3));
    id v9 = -[NSKeyedUnarchiver initForReadingFromData:error:](v7, "initForReadingFromData:error:", v8, 0LL);

    id v10 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v9,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___SFPeerDevice),  NSKeyedArchiveRootObjectKey);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQ]);
      __int16 v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472LL;
      id v17 = sub_10006E700;
      id v18 = &unk_1000BCD38;
      id v19 = v11;
      id v20 = v6;
      dispatch_sync(v12, &v15);
    }

    -[NSKeyedUnarchiver finishDecoding](v9, "finishDecoding", v15, v16, v17, v18);

    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = 5LL;
  }

  return v13;
}

void sub_10006E648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006E67C(uint64_t a1)
{
  os_log_t v2 = (void *)qword_1000DE460;
  if (qword_1000DE460)
  {
    os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a1));
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DE468);
  return v2;
}

void sub_10006E6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10006E700(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138477827;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Changing peer device info to %{private}@",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(a1 + 40) setPeeredDevice:*(void *)(a1 + 32)];
}

uint64_t sub_10006E7B0(uint64_t a1)
{
  id v1 = sub_10006E67C(a1);

  return 0LL;
}

uint64_t sub_10006E7D0(uint64_t a1)
{
  id v1 = sub_10006E67C(a1);

  return 5LL;
}

uint64_t sub_10006E7F0( uint64_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5, void *a6, uint64_t a7, void *a8, _DWORD *a9)
{
  id v14 = sub_10006E67C(a1);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v26 = 0LL;
    __int16 v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_10006E984;
    unint64_t v30 = sub_10006E994;
    id v31 = 0LL;
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 dispatchQ]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E99C;
    block[3] = &unk_1000BE128;
    id v18 = v16;
    int v25 = a3;
    id v23 = v18;
    uint64_t v24 = &v26;
    dispatch_sync(v17, block);

    *a6 = 0LL;
    sub_10006EE20((void *)v27[5], a4, a5);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 ourDevice]);
    sub_10006EE20(v19, a8, a9);

    _Block_object_dispose(&v26, 8);
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = 5LL;
  }

  return v20;
}

void sub_10006E944( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006E984(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10006E994(uint64_t a1)
{
}

void sub_10006E99C(uint64_t a1)
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) advertiser]);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 advertisingItems]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) advertiser]);
  unsigned int v6 = [v5 suspended];

  if (v6)
  {
    os_log_t v7 = sub_100039584(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      id v9 = "SIMULATOR: Because advertising is suspended, returning 'no advertised item' information to paired simulator.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }

  else if (v4)
  {
    if (*(_DWORD *)(a1 + 48))
    {
      os_log_t v10 = sub_100039584(0LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        *(_DWORD *)__int128 buf = 138543362;
        unint64_t v30 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "SIMULATOR: Requesting payload for item %{public}@",  buf,  0xCu);
      }

      dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472LL;
      int v25 = sub_10006ECF8;
      uint64_t v26 = &unk_1000BE048;
      id v27 = v4;
      dispatch_semaphore_t v28 = v14;
      __int16 v15 = v14;
      [v27 requestPayloadWithCompletionHandler:&v23];
    }

    id v16 = objc_msgSend(v4, "copy", v23, v24, v25, v26);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setActive:1];
    os_log_t v19 = sub_100039584(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
      *(_DWORD *)__int128 buf = 138543362;
      unint64_t v30 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "SIMULATOR: Sending information on item %{public}@ to paired simulator",  buf,  0xCu);
    }
  }

  else
  {
    os_log_t v22 = sub_100039584(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      id v9 = "SIMULATOR: Returning 'no advertised item' information to paired simulator.";
      goto LABEL_13;
    }
  }
}

void sub_10006EC64(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_10006ECF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "SIMULATOR: Retrieved payload for item %{public}@, error=%{public}@",  (uint8_t *)&v8,  0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006EDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006EE20(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  if (v5)
  {
    id v8 = v5;
    unsigned int v6 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v6, "encodeObject:forKey:", v8, NSKeyedArchiveRootObjectKey);
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v6, "encodedData"));
    sub_100070130(v7, a2, a3);

    id v5 = v8;
  }

  else
  {
    *a2 = 0LL;
    *a3 = 0;
  }
}

void sub_10006EEBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006EEE8(uint64_t a1)
{
  id v1 = sub_10006E67C(a1);
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v2;
  if (v2)
  {
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 controller]);
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 dispatchQ]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006EFBC;
    block[3] = &unk_1000BCCA8;
    id v9 = v3;
    dispatch_async(v5, block);

    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = 5LL;
  }

  return v6;
}

void sub_10006EFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006EFBC(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Asking receiver to fetch the advertisement.",  buf,  2u);
  }

  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) receiver]);
  unsigned int v5 = [v4 fetchAdvertisedItems:0];

  if (v5)
  {
    os_log_t v6 = sub_100039584(0LL);
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Telling manager to determine the bestApp again",  v15,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 manager]);
    [v9 scheduleBestAppDetermination];

    if ([*(id *)(a1 + 32) activitiesShouldCrossover])
    {
      os_log_t v10 = sub_100039584(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)dispatch_semaphore_t v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "SIMULATOR: Also telling advertisers to determine the item to advertise, because activitiesShouldCrossover=YES",  v14,  2u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) controller]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 manager]);
      [v13 scheduleUpdatingAdvertisableItems];
    }
  }

void sub_10006F140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006F168(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v6 = sub_10006E67C(a1);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___UAUserActivityInfo);
    id v9 = sub_100006B98(v8, a3, a4, 0);
    os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      id v11 = objc_alloc(&OBJC_CLASS___UASimulatorSuggestedItem);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 peeredDevice]);
      uint64_t v13 = -[UASimulatorSuggestedItem initWithUserActivityInfo:peerDevice:simulator:]( v11,  "initWithUserActivityInfo:peerDevice:simulator:",  v10,  v12,  v7);

      os_log_t v14 = sub_100039584(0LL);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](v13, "uuid"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
        *(_DWORD *)__int128 buf = 138543619;
        id v27 = v17;
        __int16 v28 = 2113;
        uint64_t v29 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "SIMULATOR: Setting received item to %{public}@/%{private}@",  buf,  0x16u);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 controller]);
      os_log_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 dispatchQ]);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10006F3D8;
      v23[3] = &unk_1000BCD38;
      id v24 = v7;
      int v25 = v13;
      uint64_t v20 = v13;
      dispatch_async(v19, v23);

      uint64_t v21 = 0LL;
    }

    else
    {
      uint64_t v21 = 5LL;
    }
  }

  else
  {
    uint64_t v21 = 5LL;
  }

  return v21;
}

void sub_10006F370(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10006F3D8(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) receiver]);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v2));
  }
  else {
    id v3 = 0LL;
  }
  [v4 doSetReceivedItems:v3];
  if (v2) {
}
  }

void sub_10006F454( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t sub_10006F478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = 0LL;
  BOOL v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  int v63 = 5;
  id v12 = sub_10006E67C(a1);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v48)
  {
    uint64_t v13 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a2);
    __int128 v59 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v48 advertiser]);
    uint64_t v46 = a6;
    uint64_t v47 = a7;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 advertisingItems]);

    id v16 = [v15 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v57;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v15);
          }
          os_log_t v19 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uuid]);
          unsigned int v21 = -[NSUUID isEqual:](v13, "isEqual:", v20);

          if (v21)
          {
            os_log_t v22 = sub_100039584(0LL);
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 uuid]);
              int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
              *(_DWORD *)__int128 buf = 138543619;
              os_log_t v65 = v25;
              __int16 v66 = 2113;
              os_log_t v67 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "SIMULATOR: Found item to send; %{public}@/%{private}@.  Fetching payload.",
                buf,
                0x16u);
            }

            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472LL;
            v49[2] = sub_10006FA24;
            v49[3] = &unk_1000BE150;
            uint64_t v52 = a4;
            uint64_t v53 = a5;
            uint64_t v54 = v46;
            uint64_t v55 = v47;
            v49[4] = v19;
            BOOL v51 = &v60;
            uint64_t v26 = dispatch_semaphore_create(0LL);
            unsigned int v50 = v26;
            [v19 requestPayloadWithCompletionHandler:v49];
            os_log_t v27 = sub_100039584(0LL);
            __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v19 uuid]);
              unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
              *(_DWORD *)__int128 buf = 138543362;
              os_log_t v65 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "SIMULATOR: Waiting for payload fetch to complete for item %{public}@",  buf,  0xCu);
            }

            dispatch_time_t v31 = dispatch_time(0LL, 15000000000LL);
            dispatch_semaphore_wait(v26, v31);
            os_log_t v32 = sub_100039584(0LL);
            dispatch_source_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v19 uuid]);
              id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
              *(_DWORD *)__int128 buf = 138543362;
              os_log_t v65 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "SIMULATOR: Finished wait for payload fetch to complete for item %{public}@",  buf,  0xCu);
            }

            goto LABEL_18;
          }
        }

        id v16 = [v15 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

void sub_10006F914( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006FA24(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) webpageURL]);
  sub_10006EE20(v2, *(void **)(a1 + 56), *(_DWORD **)(a1 + 64));

  uint64_t v3 = UAUserActivityUserInfoPayload;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payloadForIdentifier:UAUserActivityUserInfoPayload]);
  unsigned int v5 = *(vm_address_t **)(a1 + 72);
  id v6 = *(_DWORD **)(a1 + 80);
  id v7 = v4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (!vm_allocate(mach_task_self_, v5, (vm_size_t)[v7 length], 1))
    {
      _DWORD *v6 = [v8 length];
      id v9 = (void *)*v5;
      id v10 = v8;
      memcpy(v9, [v10 bytes], (size_t)objc_msgSend(v10, "length"));
    }
  }

  else
  {
    *unsigned int v5 = 0LL;
    _DWORD *v6 = 0;
  }

  os_log_t v11 = sub_100039584(0LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    __int16 v15 = *(void **)(a1 + 32);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadForIdentifier:v3]);
    id v17 = sub_10005BD28(v16, 32LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    int v20 = 138543875;
    unsigned int v21 = v14;
    __int16 v22 = 2113;
    id v23 = v15;
    __int16 v24 = 2113;
    int v25 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "SIMULATOR: Got payload for item %{public}@/%{private}@.  Returning this info:%{private}@",  (uint8_t *)&v20,  0x20u);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10006FC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006FC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v45 = 0LL;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  int v48 = 5;
  id v8 = sub_10006E67C(a1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    uint64_t v35 = a4;
    id v10 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a2);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 advertiser]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 advertisingItems]);

    id v13 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v42;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
          unsigned int v18 = -[NSUUID isEqual:](v10, "isEqual:", v17);

          if (v18)
          {
            os_log_t v19 = sub_100039584(0LL);
            int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
              __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
              *(_DWORD *)__int128 buf = 138543619;
              unsigned int v50 = v22;
              __int16 v51 = 2113;
              uint64_t v52 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "SIMULATOR: Found item ; %{public}@/%{private}@.  Calling its wasContinued.",
                buf,
                0x16u);
            }

            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472LL;
            v36[2] = sub_1000700EC;
            v36[3] = &unk_1000BE178;
            uint64_t v39 = v35;
            uint64_t v40 = a5;
            id v38 = &v45;
            id v23 = dispatch_semaphore_create(0LL);
            id v37 = v23;
            [v16 wasResumedOnAnotherDeviceWithCompletionHandler:v36];
            os_log_t v24 = sub_100039584(0LL);
            int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
              os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
              *(_DWORD *)__int128 buf = 138543362;
              unsigned int v50 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "SIMULATOR: Waiting for payload fetch to complete for item %{public}@",  buf,  0xCu);
            }

            dispatch_time_t v28 = dispatch_time(0LL, 15000000000LL);
            dispatch_semaphore_wait(v23, v28);
            os_log_t v29 = sub_100039584(0LL);
            unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              dispatch_time_t v31 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);
              os_log_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
              *(_DWORD *)__int128 buf = 138543362;
              unsigned int v50 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "SIMULATOR: Finished wait for payload fetch to complete for item %{public}@",  buf,  0xCu);
            }

            goto LABEL_18;
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

void sub_100070020( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000700EC(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100070128()
{
  return 5LL;
}

void sub_100070130(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  sub_1000701E4(&v9, [v5 length], 0);
  id v6 = (void *)v9;
  id v7 = v5;
  id v8 = [v7 bytes];
  memcpy(v6, v8, __n);
  *a2 = v9;
  *a3 = __n;
  sub_100007098((uint64_t)&v9);
}

void sub_1000701C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

vm_address_t *sub_1000701E4(vm_address_t *address, unsigned int a2, char a3)
{
  *address = 0LL;
  *((_DWORD *)address + 2) = a2;
  *((_BYTE *)address + 12) = a3;
  if (vm_allocate(mach_task_self_, address, a2, 1))
  {
    *address = 0LL;
    *((_DWORD *)address + 2) = 0;
  }

  return address;
}

void sub_10007049C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100070598( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100070724(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

os_state_data_s *__cdecl sub_10007075C(id a1, os_state_hints_s *a2)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[ActivityManagerDebuggingManager actionStrs:maximumInternal:clear:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "actionStrs:maximumInternal:clear:",  100LL,  0LL,  3600.0));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@"\n"]);
  id v5 = sub_1000396D8(v4);

  objc_autoreleasePoolPop(v2);
  return (os_state_data_s *)v5;
}

void sub_1000707D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070838( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100070890( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000708F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000709AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

id sub_1000709E4()
{
  if (qword_1000DE470 != -1) {
    dispatch_once(&qword_1000DE470, &stru_1000BE290);
  }
  return (id)qword_1000DE478;
}

void sub_100070C60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100070F84( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  id v12 = v11;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100071328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071D0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
}

void sub_1000725FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000728C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
}

void sub_10007290C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!*(void *)(a1 + 40) || (v4 = [v3 type] == *(id *)(a1 + 40), id v3 = v7, v4))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
    [v5 addObject:v6];
  }
}

void sub_100072984( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100072A64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100072B08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100072B88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100072C14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100072E00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100072E28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) statusString]);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void sub_100072E70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100072E84(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clients]);

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recentEligibleItemsInOrder:99999.0]);
        if (v7)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
          vm_address_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
          [v1 appendFormat:@"Client: %@ %@\n", v9, v10];

          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v11 = v7;
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v11);
                }
                [v1 appendFormat:@" - %@\n", v15];
              }

              id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v12);
          }
        }
      }

      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000730F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073250( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000732F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000733A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000739E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100073B30(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a1[7]));
  [*(id *)(a1[4] + 24) setWebpageURL:v2];

  return [*(id *)(a1[4] + 24) setPayloadAvailable:1];
}

void sub_100073BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073BD8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 uuid]);
    LODWORD(v3) = [v3 isEqual:v4];

    if ((_DWORD)v3)
    {
      os_log_t v5 = sub_100039584(0LL);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) uuid]);
        int v11 = 138412290;
        id v12 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Removing injected fake BTLE item %@",  (uint8_t *)&v11,  0xCu);
      }

      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = a1 + 32;
      [*(id *)(v9 + 16) setDebugCornerItem:0];
      id v10 = *(void **)(*(void *)v8 + 24LL);
      *(void *)(*(void *)v8 + 24LL) = 0LL;
    }
  }

void sub_100073CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073FD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = sub_100039584(0LL);
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Finished call prepareToResumeActivityWithUUID for activityUUID %{public}@, error=%{public}@",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000740B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10007437C(uint64_t a1)
{
  os_log_t v2 = sub_100039584(0LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Finished call didResumeUserActivityWithUUID for activityUUID %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10007444C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007455C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000745EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000746A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100074744( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000749C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074B80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100074C2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100074DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074E7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100074EE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100074F78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100075190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100075410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000755B0(void *a1)
{
  id v1 = a1;
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      int v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) UUIDString]);
        [v2 appendFormat:@"%@ ", v7];

        int v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  [v2 appendString:@"}"];
  return v2;
}

void sub_100075704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100075748(void *a1)
{
  id v1 = a1;
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"("));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      int v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) UUIDString]);
        [v2 appendFormat:@"%@ ", v7];

        int v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  [v2 appendString:@""]);
  return v2;
}

void sub_10007589C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1000758E0(void *a1)
{
  id v1 = a1;
  os_log_t v2 = v1;
  if (v1)
  {
    [v1 timeIntervalSinceNow];
    double v4 = fabs(v3);
    if (v4 >= 15.0)
    {
      if (v4 >= 200.0)
      {
        if (v4 >= 3600.0)
        {
          if (v4 < 43200.0)
          {
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 components:96 fromDate:v2]);

            int v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"at %2.2ld:%2.2ld",  [v12 hour],  objc_msgSend(v12, "minute")));
            goto LABEL_15;
          }

          uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v2));
          goto LABEL_14;
        }

        uint64_t v8 = @"%ld minutes %s";
        double v4 = v4 / 60.0;
      }

      else
      {
        uint64_t v8 = @"%ld seconds %s";
      }

      __int128 v9 = "from now";
      if (v3 <= 0.0) {
        __int128 v9 = "ago";
      }
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, (uint64_t)v4, v9));
    }

    else
    {
      uint64_t v5 = "from now";
      if (v3 <= 0.0) {
        uint64_t v5 = "ago";
      }
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1f seconds %s",  *(void *)&v4,  v5));
    }

void sub_100075A94(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

__CFString *sub_100075AC8(unint64_t a1)
{
  if (a1 == -1LL)
  {
    double v4 = @"forever";
  }

  else
  {
    dispatch_time_t v2 = dispatch_time(0LL, 0LL);
    if (v2 <= a1) {
      double v3 = sub_100075CB4(a1 - v2);
    }
    else {
      double v3 = -sub_100075CB4(v2 - a1);
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v3));
    uint64_t v6 = sub_1000758E0(v5);
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v4;
}

void sub_100075B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100075B60(double a1)
{
  double v1 = fabs(a1);
  if (v1 >= 15.0)
  {
    if (v1 >= 200.0)
    {
      if (v1 >= 3600.0)
      {
        double v3 = v1 / 3600.0;
        if (v3 >= 24.0)
        {
          if (v3 >= 504.0) {
            dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%5ld days",  (uint64_t)v3 / 24,  v5);
          }
          else {
            dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%2ld days, %ld hours",  (uint64_t)v3 / 24,  (uint64_t)v3 % 24);
          }
        }

        else
        {
          dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%2.3f hours",  *(void *)&v3,  v5);
        }
      }

      else
      {
        dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%2ld minutes",  (uint64_t)(v1 / 60.0),  v5);
      }
    }

    else
    {
      dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld seconds",  (uint64_t)v1,  v5);
    }
  }

  else
  {
    dispatch_time_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%4.1f seconds",  *(void *)&v1,  v5);
  }

  return (id)objc_claimAutoreleasedReturnValue(v2);
}

void sub_100075C88(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_time_t v2 = (void *)qword_1000DE478;
  qword_1000DE478 = v1;
}

double sub_100075CB4(int64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
  dispatch_time_t v3 = dispatch_time(0LL, 0LL);
  if (!a1) {
    return 0.0;
  }
  dispatch_time_t v4 = v2 - v3;
  dispatch_time_t v5 = dispatch_time(0LL, a1);
  double v6 = 0.0;
  do
  {
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(v6 * 1000000000.0));
    uint64_t v8 = 1LL;
    do
    {
      unint64_t v9 = v8;
      dispatch_time_t v10 = dispatch_time(v7, 1000000000 * v8);
      uint64_t v8 = 2 * v9;
    }

    while (v10 < v5);
    double v6 = v6 + (double)(v9 >> 1);
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(v6 * 1000000000.0));
  }

  while (v5 > v11 && v5 - v11 > v4);
  return v6;
}

uint64_t sub_100075EE0(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 16777472;
  int v7 = a3;
  NDR_record_t v8 = NDR_record;
  int v9 = a3;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100089CB0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t sub_100075F68(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v7 = a2;
  int v8 = 16777472;
  int v9 = a3;
  uint64_t v10 = a4;
  int v11 = 16777472;
  int v12 = a5;
  NDR_record_t v13 = NDR_record;
  int v14 = a3;
  int v15 = a5;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100089CC0;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x4Cu, 0, 0, 0, 0);
}

uint64_t sub_100075FF8( mach_port_t a1, int a2, void *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  *(NDR_record_t *)__int128 v23 = NDR_record;
  *(_DWORD *)&v23[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x3EB00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v16 = mach_msg(&msg, 3, 0x24u, 0x64u, reply_port, 0, 0);
  uint64_t v17 = v16;
  if ((v16 - 268435458) <= 0xE && ((1 << (v16 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v16)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v17 = 4294966988LL;
      }

      else if (msg.msgh_id == 1103)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996LL;
          if (*(_DWORD *)v23 == 2 && msg.msgh_size == 92 && !msg.msgh_remote_port && v24 == 1 && v27 == 1)
          {
            int v18 = v25;
            if (v25 == v29)
            {
              int v19 = v28;
              if (v28 == v32)
              {
                uint64_t v17 = 0LL;
                *a3 = *(void *)&v23[4];
                *a4 = v18;
                uint64_t v20 = v31;
                *a5 = v30;
                *a6 = v20;
                *a7 = v26;
                *a8 = v19;
                return v17;
              }
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v17 = 4294966996LL;
          if (*(_DWORD *)&v23[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v17 = 4294966996LL;
            }
            else {
              uint64_t v17 = *(unsigned int *)&v23[8];
            }
          }
        }

        else
        {
          uint64_t v17 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v17 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v17;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v17;
}

uint64_t sub_100076210(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1004;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint64_t sub_100076270( mach_port_t a1, _OWORD *a2, mach_msg_timeout_t a3, void *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  *(NDR_record_t *)uint64_t v20 = NDR_record;
  *(_OWORD *)&v20[8] = *a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x3ED00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&msg, 275, 0x30u, 0x54u, reply_port, a3, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (msg.msgh_id == 1105)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996LL;
          if (*(_DWORD *)v20 == 2 && msg.msgh_size == 76 && !msg.msgh_remote_port && v20[15] == 1 && v21 == 1)
          {
            int v16 = *(_DWORD *)&v20[16];
            if (*(_DWORD *)&v20[16] == v23)
            {
              int v17 = v22;
              if (v22 == v24)
              {
                uint64_t v15 = 0LL;
                *a4 = *(void *)&v20[4];
                *a5 = v16;
                *a6 = *(void *)&v20[20];
                *a7 = v17;
                return v15;
              }
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996LL;
          if (*(_DWORD *)&v20[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = *(unsigned int *)&v20[8];
            }
          }
        }

        else
        {
          uint64_t v15 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v15;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v15;
}

uint64_t sub_100076470(mach_port_t a1, _OWORD *a2, mach_msg_timeout_t a3, void *a4, _DWORD *a5)
{
  *(NDR_record_t *)uint64_t v15 = NDR_record;
  *(_OWORD *)&v15[8] = *a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x3EE00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 275, 0x30u, 0x40u, reply_port, a3, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 1106)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996LL;
          if (*(_DWORD *)v15 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v15[15] == 1)
          {
            int v12 = *(_DWORD *)&v15[16];
            if (*(_DWORD *)&v15[16] == v16)
            {
              uint64_t v11 = 0LL;
              *a4 = *(void *)&v15[4];
              *a5 = v12;
              return v11;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v11 = 4294966996LL;
          if (*(_DWORD *)&v15[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = *(unsigned int *)&v15[8];
            }
          }
        }

        else
        {
          uint64_t v11 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v11;
}

uint64_t sub_100076638(mach_port_t a1, mach_msg_timeout_t a2, void *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x3EF00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 275, 0x18u, 0x40u, reply_port, a2, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 1107)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v16 == 1)
          {
            int v11 = v17;
            if (v17 == v18)
            {
              uint64_t v10 = 0LL;
              *a3 = v15;
              *a4 = v11;
              return v10;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (HIDWORD(v15))
          {
            if (msg.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v10;
}

uint64_t sub_1000767E8( mach_port_t a1, __int128 *a2, int a3, uint64_t a4, int a5, uint64_t a6, _DWORD *a7, void *a8, _DWORD *a9, void *a10)
{
  int v19 = 2;
  int v20 = a3;
  int v22 = 1310720;
  uint64_t v23 = a4;
  int v24 = 16777472;
  int v25 = a5;
  NDR_record_t v26 = NDR_record;
  __int128 v27 = *a2;
  int v28 = a5;
  uint64_t v29 = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x3F000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&msg, 3, 0x5Cu, 0x54u, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (msg.msgh_id == 1108)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996LL;
          if (v19 == 2
            && msg.msgh_size == 76
            && !msg.msgh_remote_port
            && HIWORD(v22) << 16 == 1114112
            && HIBYTE(v24) == 1)
          {
            int v16 = v25;
            if (v25 == (_DWORD)v27)
            {
              uint64_t v15 = 0LL;
              *a7 = v20;
              *a8 = v23;
              *a9 = v16;
              *a10 = *(void *)((char *)&v27 + 4);
              return v15;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996LL;
          if (v21)
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = v21;
            }
          }
        }

        else
        {
          uint64_t v15 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v15;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v15;
}

uint64_t (*sub_1000769F8(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

void sub_100076A2C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (unsigned int v3 = *(_DWORD *)(a1 + 40), v3 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        *(_DWORD *)(a2 + 32) = sub_10006E504(*(unsigned int *)(a1 + 12), *(void *)(a1 + 28), v3);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose((const void *)(v11 - 248), 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v4 = -309;
    }

    else
    {
      int v4 = -300;
    }
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076B08(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && (int v3 = *(_DWORD *)(a1 + 40), v3 == *(_DWORD *)(a1 + 68))
      && *(_DWORD *)(a1 + 56) == *(_DWORD *)(a1 + 72))
    {
      if (!*(_DWORD *)(a1 + 76) && *(_DWORD *)(a1 + 80) > 0x1Fu)
      {
        uint64_t v5 = *(unsigned int *)(a1 + 12);
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 112);
        v8[0] = *(_OWORD *)(a1 + 96);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_10006F168(v5, (uint64_t)v8, v6, v3);
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0LL;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose((const void *)(v11 - 248), 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v4 = -309;
    }

    else
    {
      int v4 = -300;
    }
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_100076C18(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 6_Block_object_dispose((const void *)(v11 - 248), 8) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 16777472;
  *(_DWORD *)(a2 + 8_Block_object_dispose((const void *)(v11 - 248), 8) = 0;
  uint64_t v4 = *(unsigned int *)(result + 12);
  int v5 = *(_DWORD *)(result + 32);
  __int128 v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  double result = sub_10006E7F0( v4,  (uint64_t)v7,  v5,  (void *)(a2 + 28),  (_DWORD *)(a2 + 68),  (void *)(a2 + 72),  a2 + 80,  (void *)(a2 + 44),  (_DWORD *)(a2 + 88));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 68);
    *(_DWORD *)(a2 + 56) = *(_DWORD *)(a2 + 88);
    *(NDR_record_t *)(a2 + 60) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 92;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100076D20(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
  }

  else
  {
    if (!result[6] && result[7] > 0x1Fu)
    {
      double result = (_DWORD *)sub_10006EEE8(result[3]);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100076DB0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 6_Block_object_dispose((const void *)(v11 - 248), 8) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 16777472;
  *(_DWORD *)(a2 + 72) = 0;
  uint64_t v4 = *(unsigned int *)(result + 12);
  __int128 v5 = *(_OWORD *)(result + 84);
  v7[0] = *(_OWORD *)(result + 68);
  v7[1] = v5;
  double result = sub_10006F478(v4, result + 32, (uint64_t)v7, a2 + 28, a2 + 68, a2 + 44, a2 + 72);
  if (!(_DWORD)result)
  {
    int v6 = *(_DWORD *)(a2 + 72);
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 68);
    *(_DWORD *)(a2 + 56) = v6;
    *(NDR_record_t *)(a2 + 60) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 76;
    *(_DWORD *)(a2 + 24) = 2;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100076EA8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v4 = *(unsigned int *)(result + 12);
  __int128 v5 = *(_OWORD *)(result + 84);
  v6[0] = *(_OWORD *)(result + 68);
  v6[1] = v5;
  double result = sub_10006FC6C(v4, result + 32, (uint64_t)v6, a2 + 28, a2 + 52);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100076F8C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (result[6] || result[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  double result = (_DWORD *)sub_100070128();
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100077068(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 92)
  {
    int v4 = -304;
    goto LABEL_11;
  }

  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(_BYTE *)(a1 + 51) != 1
    || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a1 + 80))
  {
    int v4 = -300;
    goto LABEL_11;
  }

  if (*(_DWORD *)(a1 + 92) || *(_DWORD *)(a1 + 96) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_12;
  }

  *(_DWORD *)(a2 + 64) = 0;
  *(void *)(a2 + 32) = 0x14000000000000LL;
  *(_DWORD *)(a2 + 4_Block_object_dispose((const void *)(v11 - 248), 8) = 16777472;
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  uint64_t v6 = *(unsigned int *)(a1 + 28);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 52);
  uint64_t v9 = *(void *)(a1 + 84);
  __int128 v10 = *(_OWORD *)(a1 + 128);
  v12[0] = *(_OWORD *)(a1 + 112);
  v12[1] = v10;
  int v11 = sub_100036F34( v5,  a1 + 64,  v6,  v7,  v8,  v9,  v12,  (mach_port_name_t *)(a2 + 28),  (vm_address_t *)(a2 + 40),  (_DWORD *)(a2 + 64),  (void *)(a2 + 68));
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0LL;
  *(_DWORD *)(a1 + 52) = 0;
  if (!v11)
  {
    *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 64);
    *(NDR_record_t *)(a2 + 56) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 76;
    *(_DWORD *)(a2 + 24) = 2;
    return;
  }

  *(_DWORD *)(a2 + 32) = v11;
LABEL_12:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_1000771D8(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v11 - 248), 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 1009) >= 0xFFFFFFF7
    && (uint64_t v5 = (void (*)(void))off_1000BE2B0[5 * (v4 - 1000) + 5]) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_100077260()
{
}

void sub_100077288()
{
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_activityAdvertiser_activityPayloadForAdvertisementPayload_command_requestedByDevice_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "activityAdvertiser:activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:");
}

id objc_msgSend_activityAdvertiser_activityPayloadForAdvertisementPayload_handoffCommand_requestedByDevice_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "activityAdvertiser:activityPayloadForAdvertisementPayload:handoffCommand:requestedByDevice:withCompletionHandler:");
}

id objc_msgSend_activityPayloadFromDevice_forAdvertisementPayload_command_timeout_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityPayloadFromDevice:forAdvertisementPayload:command:timeout:withCompletionHandler:");
}

id objc_msgSend_cornerActionBTLEItemWithPayload_device_options_optionBits_scanner_receiver_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cornerActionBTLEItemWithPayload:device:options:optionBits:scanner:receiver:");
}

id objc_msgSend_initWithPayload_device_options_optionBits_type_activityType_bundleIdentifier_teamIDs_advertisingOptions_scanner_receiver_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scanner:receiver:");
}

id objc_msgSend_initWithPayload_device_options_optionBits_type_activityType_bundleIdentifier_teamIDs_advertisingOptions_scanner_receiver_dynamicIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPayload:device:options:optionBits:type:activityType:bundleIdentifier:teamIDs:advertisingOptions:scann er:receiver:dynamicIdentifier:");
}

id objc_msgSend_initWithType_string_dynamicType_teamID_webpageURL_options_isCurrent_when_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:");
}

id objc_msgSend_initWithType_string_dynamicType_teamID_webpageURL_options_isCurrent_when_versionFlags_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:");
}

id objc_msgSend_receivePasteboardToFile_withProgress_infoReceivedHandler_completionHandler_returnInfoEarly_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivePasteboardToFile:withProgress:infoReceivedHandler:completionHandler:returnInfoEarly:");
}

id objc_msgSend_xpclistener(void *a1, const char *a2, ...)
{
  return [a1 xpclistener];
}