__CFString *sub_100003CA0(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  if ((_DWORD)a1)
  {
    if ((_DWORD)a1 == 1)
    {
      v1 = @".wk";
    }

    else
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a1));
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 description]);
    }
  }

  else
  {
    v1 = @"cdn";
  }

  return v1;
}

void sub_100003D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003EF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateTaskStatesUsingBlock:&stru_100030778];
}

void sub_100003F08(id a1, SWCDownloadTaskState *a2, BOOL *a3)
{
}

void sub_100003F8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000040A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004150( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004354(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000043D4;
  v2[3] = &unk_1000307C8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateTaskStatesUsingBlock:v2];
}

void sub_1000043C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_1000043D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);

  [v3 downloadRoute];
  [v3 isDiscretionary];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 dateScheduled]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 buffer]);
  [v4 length];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000044C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  sub_1000044E4(&a9);
  _Unwind_Resume(a1);
}

id *sub_1000044E4(id *a1)
{
  return a1;
}

void sub_1000049DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004D78(_Unwind_Exception *a1)
{
  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_1000056A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1000058A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005BAC(_Unwind_Exception *a1)
{
  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_100005E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_100006164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006244( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000062F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000638C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000065E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000673C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006878( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000068B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000068C8(uint64_t a1)
{
}

void sub_1000068D0(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  int v7 = *(unsigned __int8 *)(a1 + 48);
  if (v7 == [v8 downloadRoute]
    && [*(id *)(a1 + 32) isEqual:v6])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_100006968( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100006AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006B34(uint64_t a1)
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) underlyingQueue]);
  dispatch_assert_queue_V2(v2);

  if (([*(id *)(a1 + 40) isValid] & 1) == 0)
  {
    if (qword_100037168 != -1) {
      dispatch_once(&qword_100037168, &stru_1000308F8);
    }
    id v8 = (os_log_s *)qword_100037160;
    if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Domain %@ is invalid. Will not attempt a download.",  buf,  0xCu);
    }

    v10 = objc_alloc(&OBJC_CLASS___NSError);
    v43[0] = &off_1000325D8;
    v42[0] = @"Line";
    v42[1] = @"Function";
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCDownloader(Private) _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretion ary:completionHandlers:]_block_invoke"));
    v43[1] = v11;
    v42[2] = @"Domain";
    v43[2] = *(void *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));
    id v3 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", _SWCErrorDomain, 8LL, v12);

    uint64_t v13 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    int v7 = (void *)v13;
    if (v13 && (objc_opt_respondsToSelector(v13, "downloader:failedToDownloadAASAFileFromDomain:error:") & 1) != 0) {
      [v7 downloader:*(void *)(a1 + 32) failedToDownloadAASAFileFromDomain:*(void *)(a1 + 40) error:v3];
    }
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v14 = (SWCDownloadTaskState *)*(id *)(a1 + 48);
    id v15 = -[SWCDownloadTaskState countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v33 + 1) + 8LL * (void)i) + 16LL))(*(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
        }

        id v15 = -[SWCDownloadTaskState countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
      }

      while (v15);
    }

    goto LABEL_51;
  }

  id v3 = (NSError *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _taskStateForDomain:*(void *)(a1 + 40) downloadRoute:*(unsigned __int8 *)(a1 + 80)]);
  if (!v3)
  {
    if (*(void *)(a1 + 56) && !*(_BYTE *)(a1 + 80))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCDomain appleDomain](&OBJC_CLASS____SWCDomain, "appleDomain"));
      if ([v18 encompassesDomain:*(void *)(a1 + 40)])
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
        unsigned int v20 = [v19 isAppleInternal];

        if (v20 && !arc4random_uniform(0x64u))
        {
          if (qword_100037168 != -1) {
            dispatch_once(&qword_100037168, &stru_1000308F8);
          }
          v21 = (os_log_s *)qword_100037160;
          if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_FAULT))
          {
            uint64_t v22 = *(void *)(a1 + 56);
            v23 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v38 = v22;
            __int16 v39 = 2112;
            v40 = v23;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Application %@ is attempting to download AASA data from %@ over the public Internet (via an Apple-controll ed CDN.) Doing so may leak information about unannounced apps or features. This application must be update d. Please file a bug report against this application.",  buf,  0x16u);
          }
        }
      }

      else
      {
      }
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    int v7 = (void *)v24;
    if (v24 && (objc_opt_respondsToSelector(v24, "downloader:willDownloadAASAFileFromDomain:") & 1) != 0) {
      [v7 downloader:*(void *)(a1 + 32) willDownloadAASAFileFromDomain:*(void *)(a1 + 40)];
    }
    v14 = -[SWCDownloadTaskState initWithDownloader:domain:downloadRoute:]( objc_alloc(&OBJC_CLASS___SWCDownloadTaskState),  "initWithDownloader:domain:downloadRoute:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 80));
    if (!v14)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v32 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"SWCDownloader.mm" lineNumber:571 description:@"Failed to create download state object"];
    }

    if (*(void *)(a1 + 48))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState completionHandlers](v14, "completionHandlers"));
      [v25 addObjectsFromArray:*(void *)(a1 + 48)];
    }

    if (*(_BYTE *)(a1 + 81))
    {
      if (qword_100037168 != -1) {
        dispatch_once(&qword_100037168, &stru_1000308F8);
      }
      v26 = (os_log_s *)qword_100037160;
      if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Downloading discretionary data for domain %@",  buf,  0xCu);
      }

      BOOL v28 = *(_BYTE *)(a1 + 81) != 0;
    }

    else
    {
      BOOL v28 = 0LL;
    }

    -[SWCDownloadTaskState setDiscretionary:](v14, "setDiscretionary:", v28);
    v29 = *(void **)(*(void *)(a1 + 32) + 48LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](v14, "taskDescription"));
    [v29 setObject:v14 forKey:v30];

    [*(id *)(a1 + 32) _resumePendingTasks];
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SWCAnalyticsLogger sharedLogger](&OBJC_CLASS___SWCAnalyticsLogger, "sharedLogger"));
    [v31 logAASAFileDownloadEventWithDomain:*(void *)(a1 + 40) route:*(unsigned __int8 *)(a1 + 80)];

    id v3 = 0LL;
LABEL_51:

    goto LABEL_52;
  }

  if (qword_100037168 != -1) {
    dispatch_once(&qword_100037168, &stru_1000308F8);
  }
  v4 = (os_log_s *)qword_100037160;
  if (os_log_type_enabled((os_log_t)qword_100037160, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = @"discretionary";
    if (!*(_BYTE *)(a1 + 81)) {
      v6 = @"non-discretionary";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = v5;
    __int16 v39 = 2112;
    v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Already downloading data for domain %@, so skipping a second download (%@)",  buf,  0x16u);
  }

  if (*(void *)(a1 + 48))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError completionHandlers](v3, "completionHandlers"));
    [v7 addObjectsFromArray:*(void *)(a1 + 48)];
LABEL_52:
  }
}

void sub_100007148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000075EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_100007740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007990( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
  _Block_object_dispose(&a31, 8);
  sub_1000086EC(v31);
  _Unwind_Resume(a1);
}

uint64_t sub_1000079F0(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0LL;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0LL;
  uint64_t v5 = a2[8];
  id v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }

    else
    {
      v7 &= v8 - 1;
    }

    *(void *)(v2 + 8 * v7) = result + 64;
    void *v3 = 0LL;
    v3[1] = 0LL;
  }

  return result;
}

uint64_t sub_100007A60(uint64_t a1)
{
  return sub_1000086EC(a1 + 48);
}

void sub_100007A68(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);

  if (v3)
  {
    unsigned __int8 v6 = [*(id *)(a1 + 32) _sessionIDForTaskState:v5];
    uint64_t v4 = sub_100008734((float *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL), v6, &v6);
    ++v4[3];
  }
}

void sub_100007AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_100007AF8(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 task]);

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) _sessionIDForTaskState:v7];
    char v8 = (char)v4;
    id v5 = sub_100008734((float *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL), v4, &v8);
    unint64_t v6 = v5[3];
    if (v6 < (unint64_t)[*(id *)(a1 + 32) _maximumActiveTaskCountForSessionID:v4])
    {
      ++v5[3];
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void sub_100007BA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_100007D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000812C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000085FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000086BC(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "dl");
  uint64_t v2 = (void *)qword_100037160;
  qword_100037160 = (uint64_t)v1;
}

uint64_t sub_1000086EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  id v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100008734(float *a1, unsigned __int8 a2, _BYTE *a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = *((void *)a1 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & a2;
    }

    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  v10 = operator new(0x20uLL);
  void *v10 = 0LL;
  v10[1] = v6;
  *((_BYTE *)v10 + 16) = *a3;
  v10[3] = 0LL;
  float v12 = (float)(unint64_t)(*((void *)a1 + 3) + 1LL);
  float v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      int8x8_t prime = (int8x8_t)v16;
    }
    else {
      int8x8_t prime = (int8x8_t)v15;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v7 = *((void *)a1 + 1);
    }

    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        unint64_t v24 = std::__next_prime(v24);
      }

      else
      {
        uint64_t v26 = 1LL << -(char)__clz(v24 - 1);
        if (v24 >= 2) {
          unint64_t v24 = v26;
        }
      }

      if (*(void *)&prime <= v24) {
        int8x8_t prime = (int8x8_t)v24;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)a1 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_100008B24();
          }
          v18 = operator new(8LL * *(void *)&prime);
          v19 = *(void **)a1;
          *(void *)a1 = v18;
          if (v19) {
            operator delete(v19);
          }
          uint64_t v20 = 0LL;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v20++) = 0LL;
          while (*(void *)&prime != v20);
          v21 = (void *)*((void *)a1 + 2);
          if (v21)
          {
            unint64_t v22 = v21[1];
            uint8x8_t v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(void *)&prime) {
                v22 %= *(void *)&prime;
              }
            }

            else
            {
              v22 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v22) = a1 + 4;
            uint64_t v27 = (void *)*v21;
            if (*v21)
            {
              do
              {
                unint64_t v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(void *)&prime) {
                    v28 %= *(void *)&prime;
                  }
                }

                else
                {
                  v28 &= *(void *)&prime - 1LL;
                }

                if (v28 != v22)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v28))
                  {
                    *(void *)(*(void *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }

                  void *v21 = *v27;
                  *uint64_t v27 = **(void **)(*(void *)a1 + 8 * v28);
                  **(void **)(*(void *)a1 + 8 * v28) = v27;
                  uint64_t v27 = v21;
                }

                unint64_t v28 = v22;
LABEL_55:
                v21 = v27;
                uint64_t v27 = (void *)*v27;
                unint64_t v22 = v28;
              }

              while (v27);
            }
          }

          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }

        __int128 v33 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v33) {
          operator delete(v33);
        }
        unint64_t v7 = 0LL;
        *((void *)a1 + 1) = 0LL;
      }
    }

LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  v29 = *(void **)a1;
  v30 = *(void **)(*(void *)a1 + 8 * v3);
  if (v30)
  {
    void *v10 = *v30;
LABEL_72:
    void *v30 = v10;
    goto LABEL_73;
  }

  void *v10 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v10;
  v29[v3] = a1 + 4;
  if (*v10)
  {
    unint64_t v31 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7) {
        v31 %= v7;
      }
    }

    else
    {
      v31 &= v7 - 1;
    }

    v30 = (void *)(*(void *)a1 + 8 * v31);
    goto LABEL_72;
  }

LABEL_73:
  ++*((void *)a1 + 3);
  return v10;
}

void sub_100008B10(_Unwind_Exception *a1)
{
}

void sub_100008B24()
{
}

void sub_100008B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000093D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009474( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000094FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000095A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009C1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100009C74(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqual:NSUnderlyingErrorKey])
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"UnderlyingError"];
LABEL_6:

    goto LABEL_7;
  }

  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v5))
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
LABEL_7:
}

void sub_100009D48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A4C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10000A848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AFF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B0DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9);
        unint64_t v11 = objc_alloc(&OBJC_CLASS___SWCEntry);
        float v12 = -[SWCEntry initWithApplicationIdentifier:service:domain:]( v11,  "initWithApplicationIdentifier:service:domain:",  *(void *)(a1 + 32),  v5,  v10,  (void)v13);
        [*(id *)(a1 + 40) addObject:v12];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }
}

void sub_10000B21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B2C8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000B430( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000B468(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (_NSIsNSString(v12) && _NSIsNSDictionary(v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:]( &OBJC_CLASS____SWCSubstitutionVariableList,  "substitutionVariableListWithDictionary:",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"defaults"]);
    if ((_NSIsNSDictionary(v7) & 1) == 0)
    {

      id v7 = &__NSDictionary0__struct;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"details"]);
    if (v8 && (uint64_t v9 = _SWCServiceTypeMaximumDetailsCount(v12)) != 0)
    {
      if (_NSIsNSArray(v8))
      {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromDetailsArray:v8 domain:*(void *)(a1 + 40) substitutionVariables:v6 defaults:v7 maximum:v9];
      }

      else if (_NSIsNSDictionary(v8))
      {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromDetailsDictionary:v8 domain:*(void *)(a1 + 40) substitutionVariables:v6 defaults:v7 maximum:v9];
      }
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"apps"]);
      unint64_t v11 = (void *)v10;
      if (v10 && _NSIsNSArray(v10)) {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forService:v12 fromAppsArray:v11 domain:*(void *)(a1 + 40)];
      }
    }
  }
}

void sub_10000B5E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B760( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

LABEL_50:
LABEL_51:
  objc_autoreleasePoolPop(context);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = obj;
  v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v59,  v71,  16LL);
  if (v37)
  {
    uint64_t v38 = *(void *)v60;
    do
    {
      __int16 v39 = 0LL;
      do
      {
        if (*(void *)v60 != v38) {
          objc_enumerationMutation(obja);
        }
        v40 = *(const __CFString **)(*((void *)&v59 + 1) + 8LL * (void)v39);
        v41 = objc_autoreleasePoolPush();
        v42 = -[_SWCDomain initWithString:](objc_alloc(&OBJC_CLASS____SWCDomain), "initWithString:", v40);
        v43 = v42;
        if (v42 && -[_SWCDomain isValid](v42, "isValid"))
        {
          v44 = CFBundleCopyResourceURLInDirectory(bundleURL, v40, @"json", 0LL);
          if (v44)
          {
            if (qword_100037178 != -1) {
              dispatch_once(&qword_100037178, &stru_100030AC0);
            }
            v45 = (os_log_s *)(id)qword_100037170;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v44, "lastPathComponent"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
              *(_DWORD *)buf = 138412802;
              v75 = v47;
              v76 = 2112;
              v77 = v43;
              v78 = 2112;
              v79 = v48;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "Found JSON file %@ for domain %@ in directory %@",  buf,  0x20u);
            }

            v53[2](v53, v43, v44);
          }
        }

        else
        {
          if (qword_100037178 != -1) {
            dispatch_once(&qword_100037178, &stru_100030AC0);
          }
          v44 = (CFURLRef)(id)qword_100037170;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v46 = (_SWCDomain *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
            *(_DWORD *)buf = 138412546;
            v75 = v40;
            v76 = 2112;
            v77 = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Could not construct a domain name object for the filename %@.json in directory %@",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v41);
        __int16 v39 = (char *)v39 + 1;
      }

      while (v37 != v39);
      v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v59,  v71,  16LL);
    }

    while (v37);
  }
}

void sub_10000BFE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000C474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C898(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10000C9A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000C9CC(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v15 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v15;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domainRequiringModeOfOperation:0]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9));
        unint64_t v11 = v10;
        if (v10) {
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)[v10 unsignedLongLongValue] | (int)objc_msgSend( v8,  "modeOfOperation")));
        }
        else {
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithChar:]( NSNumber,  "numberWithChar:",  [v8 modeOfOperation]));
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v9);
      }

      id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v5);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000CCE0;
  v19[3] = &unk_100030998;
  __int128 v13 =  -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [obj count]);
  uint64_t v20 = v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  id v14 = -[NSMutableSet copy](v13, "copy");
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v17];
}

void sub_10000CC40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000CCE0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "domainRequiringModeOfOperation:",  (char)objc_msgSend(v5, "unsignedLongLongValue")));
  [*(id *)(a1 + 32) addObject:v6];
}

void sub_10000CD50( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D09C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000D178(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayWithOptions:16 usingComparator:&stru_100030A00]);

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_10000D1F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

int64_t sub_10000D220(id a1, _SWCDomain *a2, _SWCDomain *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = -[_SWCDomain isWildcard](v4, "isWildcard");
  unsigned int v7 = -[_SWCDomain isWildcard](v5, "isWildcard");
  if (((v6 | v7 ^ 1) & 1) == 0) {
    goto LABEL_6;
  }
  if ((v6 ^ 1 | v7) != 1) {
    goto LABEL_8;
  }
  if (((v6 ^ 1 | v7 ^ 1) & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain host](v4, "host"));
    id v10 = [v9 length];

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain host](v5, "host"));
    id v12 = [v11 length];

    if (v10 > v12)
    {
LABEL_6:
      int64_t v8 = -1LL;
      goto LABEL_9;
    }

    if (v10 >= v12) {
      goto LABEL_4;
    }
LABEL_8:
    int64_t v8 = 1LL;
    goto LABEL_9;
  }

LABEL_4:
  int64_t v8 = 0LL;
LABEL_9:

  return v8;
}

void sub_10000D2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D4DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D53C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = objc_autoreleasePoolPush();
  id v16 = 0LL;
  int64_t v8 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  v6,  1LL,  &v16);
  id v9 = v16;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](&OBJC_CLASS___SWCSecurityGuard, "sharedSecurityGuard"));
    id v15 = v9;
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 JSONObjectWithSignedJSONData:v8 error:&v15]);
    id v12 = v15;

    if (!v11)
    {
      if (qword_100037178 != -1) {
        dispatch_once(&qword_100037178, &stru_100030AC0);
      }
      __int128 v13 = (os_log_s *)qword_100037170;
      if (os_log_type_enabled((os_log_t)qword_100037170, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to decode JSON object from file %@: %@",  buf,  0x16u);
      }

      unint64_t v11 = 0LL;
    }
  }

  else
  {
    if (qword_100037178 != -1) {
      dispatch_once(&qword_100037178, &stru_100030AC0);
    }
    id v14 = (os_log_s *)qword_100037170;
    if (os_log_type_enabled((os_log_t)qword_100037170, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to read JSON file %@: %@",  buf,  0x16u);
    }

    unint64_t v11 = 0LL;
    id v12 = v9;
  }

  objc_autoreleasePoolPop(v7);
  if (v11) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10000D794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D9B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DA0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000DA1C(uint64_t a1)
{
}

void sub_10000DA24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) entriesForJSONObject:a3 domain:a2]);
  if (v21)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
      int64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v9 = v21;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      __int16 v12 = (a4 & 7) << 8;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
          unsigned int v16 = [v15 isEqual:*(void *)(a1 + 32)];

          if (v16)
          {
            id v17 = v14;
            id v18 = [v17 fields];
            _WORD *v18 = *v18 & 0xF8FF | v12;
            id v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) indexOfObject:v17];
            id v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL) {
              [v20 addObject:v17];
            }
            else {
              [v20 replaceObjectAtIndex:v19 withObject:v17];
            }
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v10);
    }
  }
}

void sub_10000DC04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10000E010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, void *a30, void *a31, void *a32, void *a33)
{
  _Unwind_Resume(a1);
}

void sub_10000E0D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v16 = v3;
    int v5 = _NSIsNSString(v3);
    id v4 = v16;
    if (v5)
    {
      id v6 = -[_SWCApplicationIdentifier initWithString:]( objc_alloc(&OBJC_CLASS____SWCApplicationIdentifier),  "initWithString:",  v16);
      uint64_t v7 = objc_alloc(&OBJC_CLASS___SWCEntry);
      int64_t v8 = -[SWCEntry initWithApplicationIdentifier:service:domain:]( v7,  "initWithApplicationIdentifier:service:domain:",  v6,  _SWCServiceTypeAppLinks,  *(void *)(a1 + 32));
      -[SWCEntry setPatterns:](v8, "setPatterns:", *(void *)(a1 + 40));
      -[SWCEntry setSubstitutionVariables:](v8, "setSubstitutionVariables:", *(void *)(a1 + 48));
      char v9 = *(_BYTE *)(a1 + 72);
      id v10 = v8;
      uint64_t v11 = -[SWCEntry fields](v10, "fields");
      *(_WORD *)uint64_t v11 = *(_WORD *)v11 & 0xFF3F | ((v9 & 3) << 6);
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12 && (objc_opt_respondsToSelector(v12, "intValue") & 1) != 0)
      {
        int v13 = [*(id *)(a1 + 56) intValue];
        id v14 = -[SWCEntry fields](v10, "fields");
        if (v13 >= 100) {
          int v15 = 100;
        }
        else {
          int v15 = v13;
        }
        if (v15 <= -100) {
          LOBYTE(v15) = -100;
        }
        v14->relativeOrder = v15;
      }

      [*(id *)(a1 + 64) addObject:v10];

      id v4 = v16;
    }
  }
}

void sub_10000E20C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E3C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E528( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E570(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v9 = a2;
  id v7 = a3;
  if (_NSIsNSString(v9) && _NSIsNSDictionary(v7))
  {
    id v8 = [v7 mutableCopy];
    [v8 setObject:v9 forKeyedSubscript:@"appID"];
    [*(id *)(a1 + 72) _addEntryToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromSingleDetailsDictionary:v8 domain:*(void *)(a1 + 40) substitutionVariables:*(void *)(a1 + 48) defaults:*(void *)(a1 + 56)];
    if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) >= *(void *)(a1 + 80)) {
      *a4 = 1;
    }
  }
}

void sub_10000E63C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E7EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E83C(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "entry");
  uint64_t v2 = (void *)qword_100037170;
  qword_100037170 = (uint64_t)v1;
}

void sub_10000E8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_14:
  return v11;
}

  v10[2](v10, v16, v15);
}

void sub_10000EA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_12:
  return v11;
}

  return v11;
}

void sub_10000EBB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ED5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  if ((_set_user_dir_suffix("com.apple.swcd") & 1) == 0)
  {
    int v1 = *__error();
    if (qword_100037198 != -1) {
      dispatch_once(&qword_100037198, &stru_100030B60);
    }
    uint64_t v2 = (os_log_s *)(id)qword_100037190;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109378;
      v10[1] = v1;
      __int16 v11 = 2082;
      uint64_t v12 = strerror(v1);
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "### _set_user_dir_suffix() failed: %i %{public}s",  (uint8_t *)v10,  0x12u);
    }
  }

  signal(13, (void (__cdecl *)(int))1);
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("SWC notification queue", v4);
  id v6 = (void *)qword_100037180;
  qword_100037180 = (uint64_t)v5;

  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)qword_100037180, &stru_100030B00);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_100037180, &stru_100030B20);
  dispatch_source_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)qword_100037180);
  id v8 = (void *)qword_100037188;
  qword_100037188 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100037188, &stru_100030B40);
  dispatch_resume((dispatch_object_t)qword_100037188);
  id v9 = sub_10000F7AC();
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_10000F188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F1A0(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (qword_100037198 != -1) {
    dispatch_once(&qword_100037198, &stru_100030B60);
  }
  dispatch_queue_attr_t v3 = (os_log_s *)qword_100037190;
  if (os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    dispatch_queue_t v5 = v2;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "XPC stream event (distnoted): %@",  (uint8_t *)&v4,  0xCu);
  }

  sub_10000F290(v2);
}

void sub_10000F278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F290(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_error)
  {
    dispatch_queue_attr_t v3 = xpc_copy_description(v1);
    if (qword_100037198 != -1) {
      dispatch_once(&qword_100037198, &stru_100030B60);
    }
    int v4 = (os_log_s *)qword_100037190;
    if (!os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)__int16 v11 = 136446210;
    *(void *)&v11[4] = v3;
    id v9 = "XPC error on event handler: %{public}s";
    goto LABEL_24;
  }

  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (qword_100037198 != -1) {
      dispatch_once(&qword_100037198, &stru_100030B60);
    }
    uint64_t v2 = (os_log_s *)(id)qword_100037190;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      type = xpc_get_type(v1);
      *(_DWORD *)__int16 v11 = 136446210;
      *(void *)&v11[4] = xpc_type_get_name(type);
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Unexpected XPC type on event handler: %{public}s",  v11,  0xCu);
    }

    goto LABEL_18;
  }

  string = xpc_dictionary_get_string(v1, _xpc_event_key_name);
  if (!string)
  {
    dispatch_queue_attr_t v3 = xpc_copy_description(v1);
    if (qword_100037198 != -1) {
      dispatch_once(&qword_100037198, &stru_100030B60);
    }
    int v4 = (os_log_s *)qword_100037190;
    if (!os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)__int16 v11 = 136380675;
    *(void *)&v11[4] = v3;
    id v9 = "XPC message is missing a notification name: %{private}s";
LABEL_24:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v9, v11, 0xCu);
LABEL_11:
    free(v3);
    goto LABEL_18;
  }

  id v6 = xpc_copy_description(v1);
  if (qword_100037198 != -1) {
    dispatch_once(&qword_100037198, &stru_100030B60);
  }
  dispatch_source_t v7 = (os_log_s *)qword_100037190;
  if (os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v11 = 136446467;
    *(void *)&v11[4] = string;
    *(_WORD *)&v11[12] = 2081;
    *(void *)&v11[14] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received notification %{public}s, updating entry list: %{private}s",  v11,  0x16u);
  }

  free(v6);
  *(void *)&v11[8] = 0LL;
  __int128 v12 = 0u;
  *(void *)__int16 v11 = 0x3FD0000000000000LL;
  *(void *)&v11[16] = 0x3FD0000000000000LL;
  *(void *)&__int128 v12 = (id)qword_100037180;
  *((void *)&v12 + 1) = os_transaction_create("com.apple.swc.xpc-notification-update", v8);
  sub_10001E9B4(&qword_1000371A0, (uint64_t)v11, &stru_100030B80);

LABEL_18:
}

void sub_10000F5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F60C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (qword_100037198 != -1) {
    dispatch_once(&qword_100037198, &stru_100030B60);
  }
  dispatch_queue_attr_t v3 = (os_log_s *)qword_100037190;
  if (os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    dispatch_queue_t v5 = v2;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "XPC stream event (libnotify): %@",  (uint8_t *)&v4,  0xCu);
  }

  sub_10000F290(v2);
}

void sub_10000F6E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F6FC(id a1)
{
  if (qword_100037198 != -1) {
    dispatch_once(&qword_100037198, &stru_100030B60);
  }
  id v1 = (os_log_s *)qword_100037190;
  if (os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Received signal SIGTERM. Will terminate when clean.",  v4,  2u);
  }

  id v2 = sub_10000F7AC();
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 receiveSIGTERMSignal];

  xpc_transaction_exit_clean();
}

void sub_10000F79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F7AC()
{
  v0 = objc_autoreleasePoolPush();
  if (qword_1000371B0 != -1) {
    dispatch_once(&qword_1000371B0, &stru_100030BC8);
  }
  objc_autoreleasePoolPop(v0);
  return (id)qword_1000371A8;
}

void sub_10000F804(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "daemon");
  id v2 = (void *)qword_100037190;
  qword_100037190 = (uint64_t)v1;
}

void sub_10000F834(id a1)
{
  id v1 = sub_10000F7AC();
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F8D8;
  block[3] = &unk_100030BA8;
  id v6 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
}

void sub_10000F8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F8D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEntriesForAllBundlesIgnoringCurrentState:0];
}

void sub_10000F8E4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[SWCManager beginListening](&OBJC_CLASS___SWCManager, "beginListening"));
  id v2 = (void *)qword_1000371A8;
  qword_1000371A8 = v1;

  if (qword_100037198 != -1) {
    dispatch_once(&qword_100037198, &stru_100030B60);
  }
  dispatch_queue_attr_t v3 = (os_log_s *)qword_100037190;
  if (os_log_type_enabled((os_log_t)qword_100037190, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "swcd started", v4, 2u);
  }

void sub_10000F9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F9FC(id a1)
{
  id v1 = -[SWCDatabase _initShared](objc_alloc(&OBJC_CLASS___SWCDatabase), "_initShared");
  id v2 = (void *)qword_1000371B8;
  qword_1000371B8 = (uint64_t)v1;
}

void sub_10000FA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FCC8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    [v2 saveReturningError:0];
    sub_10001EC14((dispatch_source_t *)(*(void *)(a1 + 32) + 24LL));
  }

void sub_10000FD78(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("SWC database queue", v4);
  dispatch_queue_attr_t v3 = (void *)qword_1000371C8;
  qword_1000371C8 = (uint64_t)v2;
}

void sub_10000FE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010058( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

void sub_10001014C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001036C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000103EC(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([a2 domain]);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void sub_100010484( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100010520( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000105F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100010618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100010628(uint64_t a1)
{
}

void sub_100010630(uint64_t a1, id obj, _BYTE *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7) {
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) isWildcard])
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue([obj domain]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 host]);
    id v10 = [v9 length];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain]);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 host]);
    if (v10 <= [v12 length])
    {
    }

    else
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue([obj domain]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain]);
      unsigned int v15 = [v13 encompassesDomain:v14];

      if (v15)
      {
        id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
LABEL_6:
        objc_storeStrong(v6, obj);
      }
    }
  }

  else
  {
    *a3 = 1;
  }

void sub_10001079C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010C8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100010CC4(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 40) indexOfObject:a2];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a2 isDownloadable])
    {
      uint64_t v5 = [a2 fields];
      _WORD *v5 = *v5 & 0xFFF3 | 8;
    }
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v4]);
    id v6 = a2;
    uint64_t v7 = [v6 fields];
    _WORD *v7 = *v7 & 0xFFF3 | 4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 patterns]);
    [v6 setPatterns:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 substitutionVariables]);
    [v6 setSubstitutionVariables:v9];
  }

void sub_100010DE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000110D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *a31)
{
  _Unwind_Resume(a1);
}

void sub_100011138(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceType]);
  LODWORD(v4) = [v4 isEqual:v5];

  if ((_DWORD)v4) {
    [*(id *)(a1 + 40) addObject:a2];
  }
}

void sub_1000111A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001122C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011404( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
  _Unwind_Resume(a1);
}

void sub_100011454(uint64_t a1, void *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 applicationIdentifier]);
  if (v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 domain]);

    if (!v5) {
      return;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entryMatchingServiceSpecifier:a2]);

  if (!v6)
  {
    if (qword_1000371E0 != -1) {
      dispatch_once(&qword_1000371E0, &stru_100030D18);
    }
    uint64_t v7 = (os_log_s *)qword_1000371D8;
    if (os_log_type_enabled((os_log_t)qword_1000371D8, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Will remove settings for service specifier %@ because there are no more service entries matching it",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 40) addObject:a2];
  }

LABEL_21:
  return v9;
}

void sub_100011828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011F20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100012038(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result = objc_opt_isKindOfClass(a2, *(void *)(a1 + 40));
  if ((result & 1) == 0
    || (uint64_t result = +[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  a3,  200LL),  (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *a4 = 1;
  }
  return result;
}

void sub_1000124C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012614( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000126F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000127CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000129E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  id v20 = v19;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100012A24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = 0LL;
    unsigned __int8 v3 = [WeakRetained saveReturningError:&v6];
    id v4 = v6;
    if ((v3 & 1) == 0)
    {
      if (qword_1000371E0 != -1) {
        dispatch_once(&qword_1000371E0, &stru_100030D18);
      }
      uint64_t v5 = (os_log_s *)qword_1000371D8;
      if (os_log_type_enabled((os_log_t)qword_1000371D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error saving SWC database: %@",  buf,  0xCu);
      }
    }
  }
}

void sub_100012B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013018(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "db");
  dispatch_queue_t v2 = (void *)qword_1000371D8;
  qword_1000371D8 = (uint64_t)v1;
}

void sub_1000130E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001311C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013170( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100013238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013368(uint64_t a1, void *a2)
{
  id v4 = a2;
  unsigned __int8 v3 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) _performUpdateWithActivity:v4];
  objc_autoreleasePoolPop(v3);
}

void sub_1000133B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

LABEL_20:
}

void sub_1000136A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000136C8(uint64_t a1)
{
  return xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 5LL);
}

void sub_1000137D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013804(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDownloadable])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextCheckDate]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) earlierDate:v4]);
    unsigned int v6 = [v5 isEqual:v4];

    if (v6)
    {
      if (qword_1000371F0 != -1) {
        dispatch_once(&qword_1000371F0, &stru_100030D88);
      }
      uint64_t v7 = (os_log_s *)qword_1000371E8;
      if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2114;
        __int128 v12 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Entry %@ needed to be rechecked at %{public}@",  (uint8_t *)&v9,  0x16u);
      }

      [*(id *)(a1 + 40) addObject:v3];
    }

    else
    {
      if (qword_1000371F0 != -1) {
        dispatch_once(&qword_1000371F0, &stru_100030D88);
      }
      id v8 = (os_log_s *)qword_1000371E8;
      if (os_log_type_enabled((os_log_t)qword_1000371E8, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2114;
        __int128 v12 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Entry %@ will need to be rechecked at %{public}@",  (uint8_t *)&v9,  0x16u);
      }
    }
  }
}

void sub_1000139C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013CC4(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "dlsched");
  dispatch_queue_t v2 = (void *)qword_1000371E8;
  qword_1000371E8 = (uint64_t)v1;
}

void sub_100014468(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___SWCAnalyticsLogger);
  dispatch_queue_t v2 = (void *)qword_100037200;
  qword_100037200 = (uint64_t)v1;
}

id sub_1000144E8(uint64_t a1)
{
  id v4 = @"route";
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *(unsigned __int8 *)(a1 + 32)));
  uint64_t v5 = v1;
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

void sub_100014650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000146D8(id a1)
{
  os_log_t v1 = (void *)os_transaction_create("com.apple.swc.begin");
  dispatch_queue_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014780;
  block[3] = &unk_100030BA8;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void sub_100014770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014780()
{
  v0 = objc_alloc(&OBJC_CLASS___SWCManager);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase sharedDatabase](&OBJC_CLASS___SWCDatabase, "sharedDatabase"));
  dispatch_queue_t v2 = -[SWCManager initWithDatabase:](v0, "initWithDatabase:", v1);
  id v3 = (void *)qword_100037208;
  qword_100037208 = (uint64_t)v2;

  id v4 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v5 = -[NSXPCListener initWithMachServiceName:](v4, "initWithMachServiceName:", _SWCXPCServiceName);
  unsigned int v6 = *(void **)(qword_100037208 + 8);
  *(void *)(qword_100037208 + 8) = v5;

  objc_msgSend(*(id *)(qword_100037208 + 8), "setDelegate:");
  uint64_t v7 = *(void **)(qword_100037208 + 8);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
  [v7 _setQueue:v8];

  [*(id *)(qword_100037208 + 8) resume];
  [(id)qword_100037208 updateEntriesForAllBundlesIgnoringCurrentState:0];
  return [*(id *)(qword_100037208 + 40) update];
}

void sub_100014864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014E04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id sub_100014EBC()
{
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  return (id)qword_100037218;
}

void sub_100014EFC(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  id v3 = (os_log_s *)qword_100037218;
  if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Error during LS enumeration. App list may be incomplete: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_10001525C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

void sub_1000152D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  dispatch_queue_t v2 = (os_log_s *)(id)qword_100037218;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 134217984;
    uint64_t v4 = (int)[WeakRetained processIdentifier];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Connection interrupted: %llu",  (uint8_t *)&v3,  0xCu);
  }
}

void sub_1000153C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000153DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  dispatch_queue_t v2 = (os_log_s *)(id)qword_100037218;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 134217984;
    uint64_t v4 = (int)[WeakRetained processIdentifier];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Connection invalidated: %llu",  (uint8_t *)&v3,  0xCu);
  }
}

void sub_1000154CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015594(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) enumerateEntriesMatchingService:0 exactDomain:*(void *)(a1 + 40) appID:0 block:&stru_100030E68];
}

void sub_1000155B0(id a1, SWCEntry *a2, BOOL *a3)
{
  int v3 = -[SWCEntry fields](a2, "fields");
  *(_WORD *)v3 |= 0x10u;
}

void sub_100015698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000156AC(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[SWCEntry entriesForJSONObject:domain:]( &OBJC_CLASS___SWCEntry,  "entriesForJSONObject:domain:",  a1[6],  a1[5]));
  objc_msgSend(*(id *)(a1[4] + 24), "updateEntriesForDomain:canonicalEntries:", a1[5]);
}

void sub_100015718( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001572C(id a1, SWCEntry *a2, BOOL *a3)
{
  int v3 = -[SWCEntry fields](a2, "fields");
  *(_WORD *)v3 &= ~0x10u;
}

void sub_100015814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015828(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100015910;
  v6[3] = &unk_100030C80;
  id v5 = v2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 enumerateEntriesMatchingService:0 exactDomain:v3 appID:0 block:v6];
  [*(id *)(*(void *)(a1 + 32) + 24) scheduleNextSave];
}

void sub_1000158E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
}

void sub_100015910(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 fields];
  *v3 &= ~0x10u;
  [v9 setLastCheckedDate:*(void *)(a1 + 32)];
  [v9 setLastError:*(void *)(a1 + 40)];
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v9 retryCount]);
  id v5 = (void *)v4;
  unsigned int v6 = &off_100032698;
  if (v4) {
    unsigned int v6 = (_UNKNOWN **)v4;
  }
  id v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v7 unsignedLongLongValue] + 1));
  [v9 setRetryCount:v8];
}

void sub_1000159D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int128 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100015A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100015AA4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  unsigned int v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v9)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_serviceDetailsWithEntry:"));
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0LL);
  }

  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0LL, v5);
  }
}

void sub_100015B38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015DA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100016274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_17:
}

  __int128 v21 = -1LL;
LABEL_20:

  return v21;
}

  return v11;
}

void sub_100016760( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100016828(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100016C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017048(_Unwind_Exception *a1)
{
  unsigned int v6 = v3;

  _Unwind_Resume(a1);
}

_WORD *sub_1000170C8(uint64_t a1, id a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  char v2 = *(_BYTE *)(a1 + 40);
  uint64_t result = [a2 fields];
  *uint64_t result = *result & 0xFFFC | v2 & 3;
  return result;
}

void sub_1000172FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_3:
  _SWCForceTTY(0xFFFFFFFFLL);
  v11[2](v11);
}

void sub_100017A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017C14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    _SWCLogSeparator(*(void *)(a1 + 40));
  }
  [v3 logToFile:*(void *)(a1 + 40) verbosity:*(unsigned __int8 *)(a1 + 48)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
}

void sub_100017C7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100017C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  id v5 = objc_alloc(&OBJC_CLASS___NSString);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)a2 description]);
  uint64_t v7 = *(unsigned __int8 *)(a2 + 8);
  if (v4)
  {
    id v8 = sub_100003CA0(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = *(unsigned __int8 *)(a2 + 9);
    [*(id *)(a2 + 24) timeIntervalSinceNow];
    __int128 v12 = @" discretionary";
    if (!v10) {
      __int128 v12 = &stru_100031DB8;
    }
    int v13 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"%@ (%@%@ running for %.0fs)",  v6,  v9,  v12,  floor(fabs(v11)));
  }

  else
  {
    id v14 = sub_100003CA0(v7);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    id v9 = (void *)v15;
    if (*(_BYTE *)(a2 + 9)) {
      id v16 = @" discretionary";
    }
    else {
      id v16 = &stru_100031DB8;
    }
    int v13 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@ (%@%@ in future)", v6, v15, v16);
  }

  id v18 = v13;

  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromByteCount:*(void *)(a2 + 32)]);
  _SWCLogValueForKey(*(void *)(a1 + 40), v18, v17, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

void sub_100017DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)a2 description]);
  id v5 = (id)v4;
  if (*(void *)(a2 + 24) && *(_BYTE *)(a1 + 40))
  {
    id v13 = (id)v4;
    unsigned int v6 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v7 = sub_100003CA0(*(unsigned __int8 *)(a2 + 8));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = *(unsigned __int8 *)(a2 + 9);
    [*(id *)(a2 + 24) timeIntervalSinceNow];
    double v11 = @" discretionary";
    if (!v9) {
      double v11 = &stru_100031DB8;
    }
    __int128 v12 = -[NSString initWithFormat:](v6, "initWithFormat:", @"%@ (%@%@ %.0fs)", v13, v8, v11, floor(fabs(v10)));

    id v5 = v12;
  }

  id v14 = v5;
  [*(id *)(a1 + 32) addObject:v5];
}

void sub_100017EF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100017F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _SWCLogValueForKey(*(void *)(a1 + 32), a2, a3, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

void sub_100017F28(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    _SWCLogSeparator(*(void *)(a1 + 40));
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  _SWCLogValueForKey(v6, v7, v5, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
}

void sub_100017FC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100017FEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationIdentifier]);
  uint64_t v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (!v6)
  {
    uint64_t v6 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  512LL,  0LL);
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationIdentifier]);
    [v7 setObject:v6 forKeyedSubscript:v8];
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v11 patterns]);
  if (v9) {
    -[NSHashTable addObject:](v6, "addObject:", v9);
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v11 substitutionVariables]);
  if (v10) {
    -[NSHashTable addObject:](v6, "addObject:", v10);
  }
}

void sub_1000180EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 sub_10001813C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void sub_100018160(uint64_t a1)
{
  os_log_t v1 = (void **)(a1 + 48);
  sub_10001C7A4(&v1);
}

void sub_100018188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v6 = a3;
  size_t v7 = 0LL;
  id v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    size_t v9 = 0LL;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(const void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v13 = (objc_class *)objc_opt_class(v12);
        size_t InstanceSize = class_getInstanceSize(v13);
        size_t v15 = malloc_size(v12);
        if (v15 > InstanceSize)
        {
          size_t v7 = v15 - InstanceSize + v9;
          size_t v9 = v7;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v8);
  }

  id v16 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v18 = (void *)v16[7];
  unint64_t v17 = v16[8];
  if ((unint64_t)v18 < v17)
  {
    void *v18 = v5;
    v18[1] = v7;
    id v19 = v18 + 2;
    goto LABEL_29;
  }

  uint64_t v20 = v16[6];
  uint64_t v21 = ((uint64_t)v18 - v20) >> 4;
  uint64_t v22 = v17 - v20;
  uint64_t v23 = v22 >> 3;
  else {
    unint64_t v24 = v23;
  }
  if (v24)
  {
    if (v24 >> 60) {
      sub_100008B24();
    }
    __int128 v25 = (char *)operator new(16 * v24);
  }

  else
  {
    __int128 v25 = 0LL;
  }

  uint64_t v26 = &v25[16 * v21];
  *(void *)uint64_t v26 = v5;
  *((void *)v26 + 1) = v7;
  uint64_t v27 = (void *)v16[6];
  unint64_t v28 = (void *)v16[7];
  if (v28 == v27)
  {
    id v19 = v26 + 16;
    v16[6] = v26;
    v16[7] = v26 + 16;
    v16[8] = &v25[16 * v24];
    if (!v27) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  v29 = (void *)v16[7];
  v30 = v26;
  do
  {
    uint64_t v31 = *(v29 - 2);
    v29 -= 2;
    void *v29 = 0LL;
    *((void *)v30 - 2) = v31;
    v30 -= 16;
    *((void *)v30 + 1) = v29[1];
  }

  while (v29 != v27);
  id v19 = v26 + 16;
  v16[6] = v30;
  v16[7] = v26 + 16;
  v16[8] = &v25[16 * v24];
  do
  {
    v32 = (void *)*(v28 - 2);
    v28 -= 2;
  }

  while (v28 != v27);
  if (v27) {
LABEL_28:
  }
    operator delete(v27);
LABEL_29:
  v16[7] = v19;
}

void sub_1000183D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100018410(id a1, const void *a2, const void *a3)
{
  return *((void *)a2 + 1) > *((void *)a3 + 1);
}

void sub_1000185D4(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_100018838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018F00(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

LABEL_6:
  id v16 = objc_alloc(&OBJC_CLASS___NSError);
  v23[0] = @"Line";
  v23[1] = @"Function";
  v24[0] = &off_100032860;
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]"));
  v24[1] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  id v19 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2LL, v18);
LABEL_8:
  uint64_t v21 = v19;

  uint64_t v22 = 0LL;
LABEL_9:
  v10[2](v10, v22, v21);
}

void sub_1000191EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019410( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100019460(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000194D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100019720( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10001978C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001985C;
    v8[3] = &unk_1000307F0;
    size_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    dispatch_async(v6, v8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10001984C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001985C(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v4 = 0LL;
  [v2 _setDeveloperModeEnabled:1 error:&v4];
  id v3 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000198C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_37:
LABEL_38:
            if (qword_100037220 != -1) {
              dispatch_once(&qword_100037220, &stru_100031160);
            }
            __int128 v25 = (os_log_s *)qword_100037218;
            if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Entry %@ needs its JSON updated because the app PI changed",  buf,  0xCu);
            }

            -[NSMutableOrderedSet addObject:](v36, "addObject:", v13);
            -[NSMutableOrderedSet addObject:](v37, "addObject:", v18);
LABEL_14:
            downloader = self->_downloader;
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
            unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationIdentifier]);
            -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:]( downloader,  "downloadAASAFileForDomain:applicationIdentifier:completionHandler:",  v16,  v17,  0LL);

            goto LABEL_16;
          }

          if (v22 != 100) {
            goto LABEL_38;
          }
        }

LABEL_19:
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      uint64_t v26 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
      id v6 = v26;
    }

    while (v26);
  }

  objc_autoreleasePoolPop(context);
  uint64_t v27 = objc_autoreleasePoolPush();
  if (-[NSMutableOrderedSet count](v36, "count"))
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    unint64_t v28 = (os_log_s *)(id)qword_100037218;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = -[NSMutableOrderedSet count](v36, "count");
      *(_DWORD *)buf = 134218242;
      v47 = v30;
      v48 = 2112;
      v49 = v36;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Removing %llu entries: %@", buf, 0x16u);
    }

    -[SWCDatabase removeEntries:](self->_database, "removeEntries:", v36);
  }

  if (-[NSMutableOrderedSet count](v37, "count"))
  {
    if (qword_100037220 != -1) {
      dispatch_once(&qword_100037220, &stru_100031160);
    }
    v29 = (os_log_s *)(id)qword_100037218;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = -[NSMutableOrderedSet count](v37, "count");
      *(_DWORD *)buf = 134218242;
      v47 = v31;
      v48 = 2112;
      v49 = v37;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Adding %llu entries: %@", buf, 0x16u);
    }

    -[SWCDatabase addEntries:](self->_database, "addEntries:", v37);
  }

  objc_autoreleasePoolPop(v27);
  if (-[NSMutableOrderedSet count](v36, "count")) {
    -[SWCDatabase cleanOldSettings](self->_database, "cleanOldSettings");
  }
  -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  -[SWCDownloadScheduler update](self->_downloadScheduler, "update");
}

    uint64_t v21 = 1LL;
    goto LABEL_20;
  }

void sub_10001A750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10001A844(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(_WORD *)[v3 fields] & 0x700) != 0x200
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void sub_10001A8A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001AA58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001AAB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100037220 != -1) {
    dispatch_once(&qword_100037220, &stru_100031160);
  }
  id v4 = (os_log_s *)qword_100037218;
  if (os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG))
  {
    id v18 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v22 = v3;
    __int16 v23 = 2112;
    id v24 = v18;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Found entry %@ matching inputs %@",  buf,  0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v20 = 0LL;
    id v6 = [v3 evaluateWithURLComponents:v5 auditToken:a1 + 56 matchingPattern:&v20];
    id v7 = v20;
    id v8 = v7;
    if (v6)
    {
      if (v6 != (id)100)
      {
        if (v6 == (id)200)
        {
          if (v7)
          {
            if (qword_100037220 != -1) {
              dispatch_once(&qword_100037220, &stru_100031160);
            }
            uint64_t v9 = qword_100037218;
            if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_27;
            }
            *(_DWORD *)buf = 138412546;
            id v22 = v8;
            __int16 v23 = 2112;
            id v24 = v3;
            uint64_t v10 = "Inputs matched pattern %@ on entry %@";
            id v11 = (os_log_s *)v9;
            uint32_t v12 = 22;
          }

          else
          {
            if (qword_100037220 != -1) {
              dispatch_once(&qword_100037220, &stru_100031160);
            }
            uint64_t v19 = qword_100037218;
            if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_27;
            }
            *(_DWORD *)buf = 138412290;
            id v22 = v3;
            uint64_t v10 = "Entry %@ did not have any patterns to match against";
            id v11 = (os_log_s *)v19;
            uint32_t v12 = 12;
          }

          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
LABEL_27:
          [*(id *)(a1 + 48) addObject:v3];
        }

LABEL_28:
        goto LABEL_29;
      }

      if (qword_100037220 != -1) {
        dispatch_once(&qword_100037220, &stru_100031160);
      }
      uint64_t v13 = qword_100037218;
      if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v3;
      id v14 = "Inputs blocked by pattern %@ on entry %@";
      size_t v15 = (os_log_s *)v13;
      uint32_t v16 = 22;
    }

    else
    {
      if (qword_100037220 != -1) {
        dispatch_once(&qword_100037220, &stru_100031160);
      }
      uint64_t v17 = qword_100037218;
      if (!os_log_type_enabled((os_log_t)qword_100037218, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      id v14 = "Inputs did not match entry %@";
      size_t v15 = (os_log_s *)v17;
      uint32_t v16 = 12;
    }

    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
    goto LABEL_28;
  }

  [*(id *)(a1 + 48) addObject:v3];
LABEL_29:
}

void sub_10001ADD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001ADF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = (char *)[v7 fields];
  __int16 v9 = *(_WORD *)v8;
  int v10 = v8[2];
  id v11 = v6;
  uint32_t v12 = (char *)[v11 fields];
  __int16 v13 = *(_WORD *)v12;
  int v14 = v12[2];
  BOOL v16 = (v9 & 3) == 1 || (v9 & 0xC) == 4;
  int v17 = v13 & 3;
  int v18 = v13 & 0xC;
  BOOL v20 = v17 == 1 || v18 == 4;
  if (v16 && !v20) {
    goto LABEL_17;
  }
  if (!v16 && v20) {
    goto LABEL_19;
  }
  if (v10 >= v14)
  {
    if (v10 <= v14)
    {
      if (!*(void *)(a1 + 32)) {
        goto LABEL_26;
      }
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 patterns]);

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 patterns]);
      if (v23 && !v24) {
        goto LABEL_17;
      }
      if (v23 || !v24)
      {
LABEL_26:
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
        if (([v25 isEqual:v26] & 1) == 0)
        {
          if ([v25 isWildcard]
            && ([v25 encompassesDomain:v26] & 1) != 0)
          {
            uint64_t v21 = 1LL;
LABEL_34:

            goto LABEL_20;
          }

          if ([v26 isWildcard]
            && ([v26 encompassesDomain:v25] & 1) != 0)
          {
            uint64_t v21 = -1LL;
            goto LABEL_34;
          }
        }

        uint64_t v21 = 0LL;
        goto LABEL_34;
      }
    }

void sub_10001AF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B75C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](&OBJC_CLASS___SWCDatabase, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001B83C;
    v8[3] = &unk_1000310F0;
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, v8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10001B82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001B83C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_10001B8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_24:
  return v7;
}

void sub_10001BF50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C2F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10001C340(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001C350(uint64_t a1)
{
}

void sub_10001C358(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (_NSIsNSData()
    && (objc_opt_isKindOfClass(v7, *(void *)(a1 + 56)) & 1) != 0
    && ([v7 isValid] & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rawValue]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathExtension:@"json"]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URLByAppendingPathComponent:v10]);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id obj = *(id *)(v12 + 40);
      unsigned int v13 = [v8 writeToURL:v11 options:1 error:&obj];
      objc_storeStrong((id *)(v12 + 40), obj);
      if (v13) {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      }
      else {
        *a4 = 1;
      }
    }
  }
}

void sub_10001C478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C6EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001C774(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "manager");
  char v2 = (void *)qword_100037218;
  qword_100037218 = (uint64_t)v1;
}

void sub_10001C7A4(void ***a1)
{
  os_log_t v1 = *a1;
  char v2 = (char *)**a1;
  if (v2)
  {
    id v4 = (char *)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        id v6 = (void *)*((void *)v4 - 2);
        v4 -= 16;
      }

      while (v4 != v2);
      id v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_10001C810(void **a1, void **a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  id v10 = a2 - 2;
  v88 = a2;
  v90 = a2 - 4;
  v87 = a2 - 6;
  id v11 = a1;
  while (2)
  {
    a1 = v11;
    uint64_t v12 = (char *)a2 - (char *)v11;
    unint64_t v13 = v12 >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        return;
      case 3uLL:
        sub_10001D230(a1, a1 + 2, v10, a3);
        return;
      case 4uLL:
        sub_10001D588(a1, a1 + 2, a1 + 4, v10, a3);
        return;
      case 5uLL:
        sub_10001D648(a1, a1 + 2, a1 + 4, a1 + 6, v10, a3);
        return;
      default:
        if (v12 <= 383)
        {
          if ((a5 & 1) != 0)
          {
            if (a1 != a2)
            {
              __int128 v33 = a1 + 2;
              if (a1 + 2 != a2)
              {
                uint64_t v34 = 0LL;
                __int128 v35 = a1;
                do
                {
                  __int128 v36 = v33;
                  if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                  {
                    v37 = (void *)*v36;
                    *__int128 v36 = 0LL;
                    v95 = v37;
                    v101 = v35[3];
                    uint64_t v38 = v34;
                    while (1)
                    {
                      __int16 v39 = (void **)((char *)a1 + v38);
                      uint64_t v40 = *(uint64_t *)((char *)a1 + v38);
                      *__int16 v39 = 0LL;
                      v41 = *(void **)((char *)a1 + v38 + 16);
                      v39[2] = v40;

                      v39[3] = v39[1];
                      if (!v38) {
                        break;
                      }
                      v38 -= 16LL;
                      if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
                      {
                        uint64_t v42 = (uint64_t)a1 + v38 + 16;
                        goto LABEL_66;
                      }
                    }

                    uint64_t v42 = (uint64_t)a1;
LABEL_66:
                    v43 = *(void **)v42;
                    *(void *)uint64_t v42 = v95;

                    *(void *)(v42 + 8) = v101;
                    a2 = v88;
                  }

                  __int128 v33 = v36 + 2;
                  v34 += 16LL;
                  __int128 v35 = (void **)v36;
                }

                while (v36 + 2 != a2);
              }
            }
          }

          else if (a1 != a2)
          {
            v79 = a1 + 2;
            if (a1 + 2 != a2)
            {
              v80 = a1 - 2;
              do
              {
                v81 = v79;
                if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                {
                  v82 = (void *)*v81;
                  void *v81 = 0LL;
                  v98 = v82;
                  v104 = a1[3];
                  v83 = v80;
                  do
                  {
                    v84 = v83[2];
                    v83[2] = 0LL;
                    v85 = v83[4];
                    v83[4] = v84;

                    v83[5] = v83[3];
                    v83 -= 2;
                  }

                  while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
                  v86 = v83[4];
                  v83[4] = v98;

                  v83[5] = v104;
                }

                v79 = v81 + 2;
                v80 += 2;
                a1 = (void **)v81;
              }

              while (v81 + 2 != a2);
            }
          }

          return;
        }

        if (!a4)
        {
          if (a1 != a2)
          {
            int64_t v44 = (v13 - 2) >> 1;
            int64_t v91 = v44;
            do
            {
              int64_t v45 = v44;
              if (v91 >= v44)
              {
                uint64_t v46 = (2 * v44) | 1;
                v47 = &a1[2 * v46];
                if (2 * v44 + 2 < (uint64_t)v13 && (*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                {
                  v47 += 2;
                  uint64_t v46 = 2 * v45 + 2;
                }

                v48 = &a1[2 * v45];
                if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
                {
                  v49 = *v48;
                  *v48 = 0LL;
                  v96 = v49;
                  v102 = a1[2 * v45 + 1];
                  do
                  {
                    v50 = v47;
                    v51 = *v47;
                    *v47 = 0LL;
                    v52 = *v48;
                    *v48 = v51;

                    v48[1] = v47[1];
                    if (v91 < v46) {
                      break;
                    }
                    uint64_t v53 = (2 * v46) | 1;
                    v47 = &a1[2 * v53];
                    uint64_t v46 = 2 * v46 + 2;
                    if (v46 >= (uint64_t)v13)
                    {
                      uint64_t v46 = v53;
                    }

                    else if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                    {
                      v47 += 2;
                    }

                    else
                    {
                      uint64_t v46 = v53;
                    }

                    v48 = v50;
                  }

                  while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
                  v54 = *v50;
                  *v50 = v96;

                  v50[1] = v102;
                }
              }

              int64_t v44 = v45 - 1;
            }

            while (v45);
            uint64_t v55 = (unint64_t)v12 >> 4;
            v56 = v88;
            do
            {
              uint64_t v57 = 0LL;
              v89 = a1[1];
              v92 = *a1;
              *a1 = 0LL;
              uint64_t v58 = v55 - 2;
              if (v55 < 2) {
                uint64_t v58 = v55 - 1;
              }
              uint64_t v59 = v58 >> 1;
              v60 = a1;
              do
              {
                v61 = &v60[2 * v57 + 2];
                uint64_t v62 = (2 * v57) | 1;
                uint64_t v63 = 2 * v57 + 2;
                if (v63 < v55 && (*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                {
                  v61 += 2;
                  uint64_t v62 = v63;
                }

                v64 = *v61;
                *v61 = 0LL;
                v65 = *v60;
                *v60 = v64;

                v60[1] = v61[1];
                v60 = v61;
                uint64_t v57 = v62;
              }

              while (v62 <= v59);
              if (v61 == v56 - 2)
              {
                v77 = *v61;
                *v61 = v92;

                v61[1] = v89;
              }

              else
              {
                v66 = *(v56 - 2);
                *(v56 - 2) = 0LL;
                v67 = *v61;
                *v61 = v66;

                v61[1] = *(v56 - 1);
                v68 = *(v56 - 2);
                *(v56 - 2) = v92;

                *(v56 - 1) = v89;
                uint64_t v69 = (char *)v61 - (char *)a1 + 16;
                if (v69 >= 17)
                {
                  unint64_t v70 = (((unint64_t)v69 >> 4) - 2) >> 1;
                  v71 = &a1[2 * v70];
                  if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
                  {
                    v72 = *v61;
                    *v61 = 0LL;
                    v97 = v72;
                    v103 = v61[1];
                    do
                    {
                      v73 = v71;
                      v74 = *v71;
                      *v71 = 0LL;
                      v75 = *v61;
                      *v61 = v74;

                      v61[1] = v71[1];
                      if (!v70) {
                        break;
                      }
                      unint64_t v70 = (v70 - 1) >> 1;
                      v71 = &a1[2 * v70];
                      v61 = v73;
                    }

                    while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
                    v76 = *v73;
                    *v73 = v97;

                    v73[1] = v103;
                  }
                }
              }

              v56 -= 2;
            }

            while (v55-- > 2);
          }

          return;
        }

        int v14 = &a1[2 * (v13 >> 1)];
        if ((unint64_t)v12 < 0x801)
        {
          sub_10001D230(&a1[2 * (v13 >> 1)], a1, v10, a3);
        }

        else
        {
          sub_10001D230(a1, &a1[2 * (v13 >> 1)], v10, a3);
          sub_10001D230(a1 + 2, v14 - 2, v90, a3);
          sub_10001D230(a1 + 4, &a1[2 * (v13 >> 1) + 2], v87, a3);
          sub_10001D230(v14 - 2, &a1[2 * (v13 >> 1)], &a1[2 * (v13 >> 1) + 2], a3);
          sub_10001D528(a1, &a1[2 * (v13 >> 1)]);
        }

        --a4;
        a2 = v88;
        if ((a5 & 1) == 0 && ((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
        {
          __int128 v25 = *a1;
          uint64_t v26 = a1[1];
          *a1 = 0LL;
          v94 = v25;
          v100 = v26;
          if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0)
          {
            id v11 = a1;
            do
              v11 += 2;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0);
          }

          else
          {
            uint64_t v27 = a1 + 2;
            do
            {
              id v11 = v27;
              if (v27 >= v88) {
                break;
              }
              int v28 = (*(uint64_t (**)(void))(*(void *)a3 + 16LL))();
              uint64_t v27 = v11 + 2;
            }

            while (!v28);
          }

          v29 = v88;
          if (v11 < v88)
          {
            v29 = v88;
            do
              v29 -= 2;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
          }

          while (v11 < v29)
          {
            sub_10001D528(v11, v29);
            do
              v11 += 2;
            while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
            do
              v29 -= 2;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
          }

          if (v11 - 2 != a1)
          {
            v30 = *(v11 - 2);
            *(v11 - 2) = 0LL;
            uint64_t v31 = *a1;
            *a1 = v30;

            a1[1] = *(v11 - 1);
          }

          v32 = *(v11 - 2);
          *(v11 - 2) = v94;

          *(v11 - 1) = v100;
          a5 = 0;
          continue;
        }

        uint64_t v15 = 0LL;
        BOOL v16 = *a1;
        int v17 = a1[1];
        *a1 = 0LL;
        v93 = v16;
        v99 = v17;
        do
          v15 += 2LL;
        while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
        int v18 = &a1[v15];
        uint64_t v19 = v88;
        if (v15 == 2)
        {
          uint64_t v19 = v88;
          do
          {
            if (v18 >= v19) {
              break;
            }
            v19 -= 2;
          }

          while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0);
        }

        else
        {
          do
            v19 -= 2;
          while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
        }

        id v11 = &a1[v15];
        if (v18 < v19)
        {
          BOOL v20 = v19;
          do
          {
            sub_10001D528(v11, v20);
            do
              v11 += 2;
            while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
            do
              v20 -= 2;
            while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
          }

          while (v11 < v20);
        }

        if (v11 - 2 != a1)
        {
          uint64_t v21 = *(v11 - 2);
          *(v11 - 2) = 0LL;
          id v22 = *a1;
          *a1 = v21;

          a1[1] = *(v11 - 1);
        }

        __int16 v23 = *(v11 - 2);
        *(v11 - 2) = v93;

        *(v11 - 1) = v99;
        if (v18 < v19)
        {
LABEL_29:
          sub_10001C810(a1, v11 - 2, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }

        char v24 = sub_10001D314(a1, v11 - 2, a3);
        if (!sub_10001D314(v11, v88, a3))
        {
          if ((v24 & 1) != 0) {
            continue;
          }
          goto LABEL_29;
        }

        a2 = v11 - 2;
        if ((v24 & 1) == 0) {
          goto LABEL_1;
        }
        return;
    }
  }

void sub_10001D1C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

void sub_10001D230(void **a1, void **a2, void **a3, uint64_t a4)
{
  char v8 = (*(uint64_t (**)(void))(*(void *)a4 + 16LL))();
  int v9 = (*(uint64_t (**)(void))(*(void *)a4 + 16LL))();
  if ((v8 & 1) != 0)
  {
    if (v9)
    {
      id v10 = a1;
    }

    else
    {
      sub_10001D528(a1, a2);
      id v10 = a2;
    }

    sub_10001D528(v10, a3);
  }

  else if (v9)
  {
    sub_10001D528(a2, a3);
  }

uint64_t sub_10001D314(void **a1, void **a2, uint64_t a3)
{
  BOOL v6 = 1LL;
  switch(((char *)a2 - (char *)a1) >> 4)
  {
    case 0LL:
    case 1LL:
      return v6;
    case 2LL:
      return v6;
    case 3LL:
      sub_10001D230(a1, a1 + 2, a2 - 2, a3);
      return v6;
    case 4LL:
      sub_10001D588(a1, a1 + 2, a1 + 4, a2 - 2, a3);
      return v6;
    case 5LL:
      sub_10001D648(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2, a3);
      return v6;
    default:
      sub_10001D230(a1, a1 + 2, a1 + 4, a3);
      id v7 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1LL;
      }
      uint64_t v8 = 0LL;
      int v9 = 0;
      break;
  }

  while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
  {
LABEL_14:
    v8 += 16LL;
    v7 += 2;
    if (v7 == a2) {
      return 1LL;
    }
  }

  id v10 = *v7;
  id v11 = v7[1];
  dispatch_queue_s *v7 = 0LL;
  uint64_t v19 = v10;
  BOOL v20 = v11;
  uint64_t v12 = v8;
  while (1)
  {
    unint64_t v13 = (void **)((char *)a1 + v12);
    uint64_t v14 = *(uint64_t *)((char *)a1 + v12 + 32);
    v13[4] = 0LL;
    uint64_t v15 = *(void **)((char *)a1 + v12 + 48);
    v13[6] = v14;

    v13[7] = v13[5];
    if (v12 == -32) {
      break;
    }
    v12 -= 16LL;
    if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
    {
      uint64_t v16 = (uint64_t)a1 + v12 + 48;
      goto LABEL_12;
    }
  }

  uint64_t v16 = (uint64_t)a1;
LABEL_12:
  int v17 = *(void **)v16;
  *(void *)uint64_t v16 = v19;

  *(void *)(v16 + 8) = v20;
  if (++v9 != 8)
  {

    goto LABEL_14;
  }

  BOOL v6 = v7 + 2 == a2;

  return v6;
}

void sub_10001D514( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_10001D528(void **a1, void **a2)
{
  id v4 = *a1;
  *a1 = 0LL;
  id v5 = *a2;
  *a2 = 0LL;
  BOOL v6 = *a1;
  *a1 = v5;

  id v7 = *a2;
  *a2 = v4;

  uint64_t v8 = a1[1];
  a1[1] = a2[1];
  a2[1] = v8;
}

void sub_10001D588(void **a1, void **a2, void **a3, void **a4, uint64_t a5)
{
  if ((*(unsigned int (**)(void))(*(void *)a5 + 16LL))())
  {
    sub_10001D528(a3, a4);
    if ((*(unsigned int (**)(void))(*(void *)a5 + 16LL))())
    {
      sub_10001D528(a2, a3);
    }
  }

void sub_10001D648(void **a1, void **a2, void **a3, void **a4, void **a5, uint64_t a6)
{
  if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
  {
    sub_10001D528(a4, a5);
    if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
    {
      sub_10001D528(a3, a4);
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
      {
        sub_10001D528(a2, a3);
      }
    }
  }

void sub_10001D770(id a1)
{
  id v1 = -[SWCSecurityGuard _init](objc_alloc(&OBJC_CLASS___SWCSecurityGuard), "_init");
  char v2 = (void *)qword_100037228;
  qword_100037228 = (uint64_t)v1;
}

void sub_10001D7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DA80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001DD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E110( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

LABEL_13:
  return (optional<SecTrustResultType>)(v17.var0.var0 | ((v13 & 0xFFFFFF) << 8) | v18);
}

void sub_10001E4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E6E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_10001E8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E984(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "security");
  char v2 = (void *)qword_100037238;
  qword_100037238 = (uint64_t)v1;
}

void sub_10001E9B4(dispatch_object_t *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_unfair_lock_lock(&stru_100037248);
  id v6 = v5;
  double v7 = *(double *)a2;
  double v8 = *(double *)(a2 + 8);
  double v9 = *(double *)(a2 + 16);
  id v10 = (dispatch_queue_s *)*(id *)(a2 + 24);
  id v11 = *(id *)(a2 + 32);
  dispatch_time_t v12 = dispatch_time(0LL, (uint64_t)(v7 * 1000000000.0));
  if (v8 <= 0.0 || fabs(v8) == INFINITY) {
    uint64_t v13 = -1LL;
  }
  else {
    uint64_t v13 = (unint64_t)(v8 * 1000000000.0);
  }
  if (*a1)
  {
    dispatch_suspend(*a1);
  }

  else
  {
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v10);
    dispatch_object_t v15 = *a1;
    *a1 = v14;

    if (!*a1)
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void scheduleTimerNoLock(SWCTimer &, const SWCTimerSettings *, void (^__strong)())"));
      [v20 handleFailureInFunction:v21 file:@"SWCTimer.mm" lineNumber:51 description:@"Unexpected failure to allocate a libdispatch timer source"];
    }
  }

  dispatch_source_set_timer((dispatch_source_t)*a1, v12, v13, (unint64_t)(v9 * 1000000000.0));
  uint64_t v16 = (dispatch_source_s *)*a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3321888768LL;
  v22[2] = sub_10001EC5C;
  v22[3] = &unk_1000311C8;
  id v23 = v6;
  uint64_t v24 = v13;
  __int128 v25 = a1;
  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  v29 = v10;
  id v30 = v11;
  id v17 = v6;
  int v18 = v10;
  id v19 = v11;
  dispatch_source_set_event_handler(v16, v22);
  dispatch_resume(*a1);

  os_unfair_lock_unlock(&stru_100037248);
}

void sub_10001EBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EC14(dispatch_source_t *a1)
{
  if (*a1)
  {
    dispatch_source_cancel(*a1);
    dispatch_source_t v2 = *a1;
    *a1 = 0LL;
  }

  os_unfair_lock_unlock(&stru_100037248);
}

void sub_10001EC5C(uint64_t a1)
{
  if (*(void *)(a1 + 40) == -1LL) {
    sub_10001EC14(*(dispatch_source_t **)(a1 + 48));
  }
}

id sub_10001ECA0(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(void *)(a1 + 80) = *(id *)(a2 + 80);
  id result = *(id *)(a2 + 88);
  *(void *)(a1 + 88) = result;
  return result;
}

void sub_10001ECE8(uint64_t a1)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend__addEntriesForAllBundlesWithEnumerator_toWorkingSet_enterpriseContext_developerModeEnabled_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:");
}

id objc_msgSend__addEntriesToOrderedSet_forUniversalLinksFromDetailsArray_domain_substitutionVariables_defaults_maximum_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_addEntriesToOrderedSet:forUniversalLinksFromDetailsArray:domain:substitutionVariables:defaults:maximum:");
}

id objc_msgSend__addEntriesToOrderedSet_forUniversalLinksFromDetailsDictionary_domain_substitutionVariables_defaults_maximum_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_addEntriesToOrderedSet:forUniversalLinksFromDetailsDictionary:domain:substitutionVariables:defaults:maximum:");
}

id objc_msgSend__addEntryToOrderedSet_forUniversalLinksFromSingleDetailsDictionary_domain_substitutionVariables_defaults_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_addEntryToOrderedSet:forUniversalLinksFromSingleDetailsDictionary:domain:substitutionVariables:defaults:");
}

id objc_msgSend__associatedDomainsFromEntitlementForBundleRecord_applicationIdentifier_developerModeEnabled_enterpriseContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_associatedDomainsFromEntitlementForBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:");
}

id objc_msgSend__copyStagingDirectoryAtURL_toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:");
}

id objc_msgSend__downloadAASAFileForDomain_applicationIdentifier_downloadRoute_discretionary_completionHandlers_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:");
}

id objc_msgSend__shouldIncludeServiceWithDomain_fromBundleRecord_applicationIdentifier_developerModeEnabled_enterpriseContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_shouldIncludeServiceWithDomain:fromBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:");
}

id objc_msgSend_additionalServiceDetailsDirectoryURLForApplicationIdentifier_createParentIfNeeded_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:");
}

id objc_msgSend_downloadAASAFileForDomain_applicationIdentifier_downloadRoute_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:");
}

id objc_msgSend_downloader_didDownloadAASAFileContainingJSONObject_fromDomain_downloadRoute_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloader:didDownloadAASAFileContainingJSONObject:fromDomain:downloadRoute:");
}

id objc_msgSend_evaluateWithURLComponents_substitutionVariables_auditToken_matchingPattern_index_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithURLComponents:substitutionVariables:auditToken:matchingPattern:index:");
}

id objc_msgSend_updateAASAFileForDomain_applicationIdentifier_downloadRoute_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}