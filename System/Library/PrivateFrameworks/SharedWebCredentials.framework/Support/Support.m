void sub_100001578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100001638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100001648(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateTaskStatesUsingBlock:&stru_100028740];
}

void sub_100001658(id a1, SWCDownloadTaskState *a2, BOOL *a3)
{
}

void sub_1000016DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000017F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000018A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000019B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001AA4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100001B24;
  v2[3] = &unk_100028790;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateTaskStatesUsingBlock:v2];
}

void sub_100001B10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_100001B24(uint64_t a1, void *a2)
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

void sub_100001C10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  sub_100001C34(&a9);
  _Unwind_Resume(a1);
}

id *sub_100001C34(id *a1)
{
  return a1;
}

void sub_10000212C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000024C8(_Unwind_Exception *a1)
{
  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_100002DF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100002FF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000032FC(_Unwind_Exception *a1)
{
  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_100003554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_1000038B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003994( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100003A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003FC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004008(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004018(uint64_t a1)
{
}

void sub_100004020(uint64_t a1, void *a2, _BYTE *a3)
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

void sub_1000040B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100004248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004284(uint64_t a1)
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) underlyingQueue]);
  dispatch_assert_queue_V2(v2);

  if (([*(id *)(a1 + 40) isValid] & 1) == 0)
  {
    if (qword_10002E830 != -1) {
      dispatch_once(&qword_10002E830, &stru_1000288C0);
    }
    id v8 = (os_log_s *)qword_10002E828;
    if (os_log_type_enabled((os_log_t)qword_10002E828, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Domain %@ is invalid. Will not attempt a download.",  buf,  0xCu);
    }

    v10 = objc_alloc(&OBJC_CLASS___NSError);
    v43[0] = &off_10002A4E0;
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
          if (qword_10002E830 != -1) {
            dispatch_once(&qword_10002E830, &stru_1000288C0);
          }
          v21 = (os_log_s *)qword_10002E828;
          if (os_log_type_enabled((os_log_t)qword_10002E828, OS_LOG_TYPE_FAULT))
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
      if (qword_10002E830 != -1) {
        dispatch_once(&qword_10002E830, &stru_1000288C0);
      }
      v26 = (os_log_s *)qword_10002E828;
      if (os_log_type_enabled((os_log_t)qword_10002E828, OS_LOG_TYPE_DEFAULT))
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

  if (qword_10002E830 != -1) {
    dispatch_once(&qword_10002E830, &stru_1000288C0);
  }
  v4 = (os_log_s *)qword_10002E828;
  if (os_log_type_enabled((os_log_t)qword_10002E828, OS_LOG_TYPE_DEFAULT))
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

void sub_100004898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100004D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_100004E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000050E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
  _Block_object_dispose(&a31, 8);
  sub_100005E3C(v31);
  _Unwind_Resume(a1);
}

uint64_t sub_100005140(uint64_t result, void *a2)
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

uint64_t sub_1000051B0(uint64_t a1)
{
  return sub_100005E3C(a1 + 48);
}

void sub_1000051B8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);

  if (v3)
  {
    unsigned __int8 v6 = [*(id *)(a1 + 32) _sessionIDForTaskState:v5];
    uint64_t v4 = sub_100005E84((float *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL), v6, &v6);
    ++v4[3];
  }
}

void sub_100005230( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_100005248(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 task]);

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) _sessionIDForTaskState:v7];
    char v8 = (char)v4;
    id v5 = sub_100005E84((float *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL), v4, &v8);
    unint64_t v6 = v5[3];
    if (v6 < (unint64_t)[*(id *)(a1 + 32) _maximumActiveTaskCountForSessionID:v4])
    {
      ++v5[3];
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void sub_1000052F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_1000054C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000587C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005D4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100005E0C(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "dl");
  uint64_t v2 = (void *)qword_10002E828;
  qword_10002E828 = (uint64_t)v1;
}

uint64_t sub_100005E3C(uint64_t a1)
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

void *sub_100005E84(float *a1, unsigned __int8 a2, _BYTE *a3)
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
            sub_100006274();
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

void sub_100006260(_Unwind_Exception *a1)
{
}

void sub_100006274()
{
}

__CFString *sub_100006280(uint64_t a1)
{
  if ((_DWORD)a1)
  {
    if ((_DWORD)a1 == 1)
    {
      os_log_t v1 = @".wk";
    }

    else
    {
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a1));
      os_log_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 description]);
    }
  }

  else
  {
    os_log_t v1 = @"cdn";
  }

  return v1;
}

void sub_1000062E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000637C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_14:
  return v11;
}

void sub_1000064DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_12:
  return v11;
}

  objc_autoreleasePoolPop(v7);
  if (!v6 || !v11) {
    sub_10000D354(v14);
  }
  unint64_t v15 = [[_SWCPatternMatchingEngine alloc] initWithPatternDictionaries:v11];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 evaluateURLComponents:v6]);
  if (v16)
  {
    v17 = objc_autoreleasePoolPush();
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v16, "index")));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v18,  15LL,  0LL));

    if (v19)
    {
      uint64_t v20 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v19, 4LL);
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v16, "index")));
      uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue([v21 description]);
    }

    objc_autoreleasePoolPop(v17);
    unint64_t v22 = [v16 isExcluded];
    uint8x8_t v23 = __stdoutp;
    if (v22)
    {
      [v16 index];
      -[NSString UTF8String](v20, "UTF8String");
      fprintf(v23, "Excluded by pattern at index %lu: %s\n");
    }

    else
    {
      [v16 index];
      -[NSString UTF8String](v20, "UTF8String");
      fprintf(v23, "Matched by pattern at index %lu: %s\n");
    }
  }

  else
  {
    fwrite("Did not match.\n", 0xFuLL, 1uLL, __stdoutp);
  }
}

  return v11;
}

void sub_100006640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000067E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000072FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000073A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100007428( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000074D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000077A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007B48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100007BA0(uint64_t a1, void *a2, void *a3)
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

void sub_100007C74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000827C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000083EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100008774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008F20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100009008(uint64_t a1, void *a2, void *a3)
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

void sub_100009148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000091F4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000935C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100009394(uint64_t a1, void *a2, void *a3)
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

void sub_100009510( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000968C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
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
            if (qword_10002E840 != -1) {
              dispatch_once(&qword_10002E840, &stru_100028A88);
            }
            v45 = (os_log_s *)(id)qword_10002E838;
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
          if (qword_10002E840 != -1) {
            dispatch_once(&qword_10002E840, &stru_100028A88);
          }
          v44 = (CFURLRef)(id)qword_10002E838;
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

void sub_100009F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000A3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A7C4(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10000A8CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000A8F8(uint64_t a1, void *a2, void *a3)
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
  v19[2] = sub_10000AC0C;
  v19[3] = &unk_100028960;
  __int128 v13 =  -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [obj count]);
  uint64_t v20 = v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  id v14 = -[NSMutableSet copy](v13, "copy");
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v17];
}

void sub_10000AB6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000AC0C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "domainRequiringModeOfOperation:",  (char)objc_msgSend(v5, "unsignedLongLongValue")));
  [*(id *)(a1 + 32) addObject:v6];
}

void sub_10000AC7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000AFC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000B0A4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayWithOptions:16 usingComparator:&stru_1000289C8]);

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_10000B120( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

int64_t sub_10000B14C(id a1, _SWCDomain *a2, _SWCDomain *a3)
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

void sub_10000B224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B408( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B468(uint64_t a1, void *a2, void *a3)
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
      if (qword_10002E840 != -1) {
        dispatch_once(&qword_10002E840, &stru_100028A88);
      }
      __int128 v13 = (os_log_s *)qword_10002E838;
      if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_ERROR))
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
    if (qword_10002E840 != -1) {
      dispatch_once(&qword_10002E840, &stru_100028A88);
    }
    id v14 = (os_log_s *)qword_10002E838;
    if (os_log_type_enabled((os_log_t)qword_10002E838, OS_LOG_TYPE_ERROR))
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

void sub_10000B6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B8E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B938(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B948(uint64_t a1)
{
}

void sub_10000B950(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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

void sub_10000BB30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10000BF3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, void *a30, void *a31, void *a32, void *a33)
{
  _Unwind_Resume(a1);
}

void sub_10000C004(uint64_t a1, void *a2)
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

void sub_10000C138( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C2F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C454( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C49C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
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

void sub_10000C568( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C768(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "entry");
  uint64_t v2 = (void *)qword_10002E838;
  qword_10002E838 = (uint64_t)v1;
}

void sub_10000C7D8(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___SWCAnalyticsLogger);
  uint64_t v2 = (void *)qword_10002E850;
  qword_10002E850 = (uint64_t)v1;
}

id sub_10000C858(uint64_t a1)
{
  id v4 = @"route";
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *(unsigned __int8 *)(a1 + 32)));
  int v5 = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

uint64_t start(unsigned int a1, const void *a2)
{
  if (a1)
  {
    if ((a1 & 0x80000000) != 0) {
      abort();
    }
    id v4 = (char *)operator new(8LL * a1);
    memcpy(v4, a2, 8LL * a1);
    int v5 = &v4[8 * a1];
  }

  else
  {
    id v4 = 0LL;
    int v5 = 0LL;
  }

  v91 = (char **)v4;
  uint64_t v6 = v5 - v4;
  if ((unint64_t)(v5 - v4) <= 0xF)
  {
    v89 = objc_autoreleasePoolPush();
    sub_10000D354();
  }

  sub_10000DD24(v100, "--leaks");
  v102 = &byte_10002E858;
  sub_10000DD24(&v103, "--vmmap");
  v105 = &byte_10002E859;
  unint64_t v7 = (unint64_t)v100;
  sub_10000DD24(v106, "--heap");
  uint64_t v90 = v6;
  v92 = v5;
  v106[3] = &byte_10002E85A;
  sub_10000DD24(v107, "--verbose");
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  v107[3] = &byte_10002E85B;
  *(_OWORD *)__p = 0u;
  __int128 v96 = 0u;
  float v97 = 1.0;
  do
  {
    id v10 = &v100[4 * v9];
    char v11 = *((_BYTE *)v10 + 23);
    int v12 = v11;
    int v13 = (void *)*v10;
    if (v11 >= 0) {
      id v14 = &v100[4 * v9];
    }
    else {
      id v14 = (uint64_t *)*v10;
    }
    unint64_t v94 = v10[1];
    if (v11 >= 0) {
      unint64_t v15 = *((unsigned __int8 *)v10 + 23);
    }
    else {
      unint64_t v15 = v10[1];
    }
    unint64_t v16 = sub_10001391C(v14, v15);
    unint64_t v17 = v16;
    unint64_t v18 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v19.i16[0] = vaddlv_u8(v19);
      unint64_t v20 = v19.u32[0];
      if (v19.u32[0] > 1uLL)
      {
        unint64_t v7 = v16;
      }

      else
      {
        unint64_t v7 = ((unint64_t)__p[1] - 1) & v16;
      }

      __int128 v21 = (unsigned __int8 **)*((void *)__p[0] + v7);
      if (v21)
      {
        v93 = v13;
        for (i = *v21; i; i = *(unsigned __int8 **)i)
        {
          unint64_t v23 = *((void *)i + 1);
          if (v23 == v17)
          {
          }

          else
          {
            if (v20 > 1)
            {
              if (v23 >= v18) {
                v23 %= v18;
              }
            }

            else
            {
              v23 &= v18 - 1;
            }

            if (v23 != v7) {
              break;
            }
          }
        }

        int v13 = v93;
      }
    }

    __int128 v24 = operator new(0x30uLL);
    *__int128 v24 = 0LL;
    v24[1] = v17;
    __int128 v25 = v24 + 2;
    if (v12 < 0)
    {
      sub_10001205C(v25, v13, v94);
      uint64_t v8 = *((void *)&v96 + 1);
    }

    else
    {
      *(_OWORD *)__int128 v25 = *(_OWORD *)v10;
      v24[4] = v10[2];
    }

    v24[5] = (&v102)[4 * v9];
    float v26 = (float)(unint64_t)(v8 + 1);
    if (!v18 || (float)(v97 * (float)v18) < v26)
    {
      BOOL v27 = (v18 & (v18 - 1)) != 0;
      if (v18 < 3) {
        BOOL v27 = 1LL;
      }
      unint64_t v28 = v27 | (2 * v18);
      unint64_t v29 = vcvtps_u32_f32(v26 / v97);
      if (v28 <= v29) {
        size_t v30 = v29;
      }
      else {
        size_t v30 = v28;
      }
      sub_100013DF0((uint64_t)__p, v30);
      unint64_t v18 = (unint64_t)__p[1];
      if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
      {
        else {
          unint64_t v7 = v17;
        }
      }

      else
      {
        unint64_t v7 = ((unint64_t)__p[1] - 1) & v17;
      }
    }

    unint64_t v31 = __p[0];
    v32 = (void *)*((void *)__p[0] + v7);
    if (v32)
    {
      *__int128 v24 = *v32;
LABEL_53:
      void *v32 = v24;
      goto LABEL_54;
    }

    *__int128 v24 = v96;
    *(void *)&__int128 v96 = v24;
    v31[v7] = &v96;
    if (*v24)
    {
      unint64_t v33 = *(void *)(*v24 + 8LL);
      if ((v18 & (v18 - 1)) != 0)
      {
        if (v33 >= v18) {
          v33 %= v18;
        }
      }

      else
      {
        v33 &= v18 - 1;
      }

      v32 = (char *)__p[0] + 8 * v33;
      goto LABEL_53;
    }

LABEL_54:
    uint64_t v8 = ++*((void *)&v96 + 1);
LABEL_55:
    ++v9;
  }

  while (v9 != 4);
  uint64_t v34 = 0LL;
  __int128 v35 = v91;
  do
  {
    if (SHIBYTE(v107[v34 + 2]) < 0) {
      operator delete((void *)v107[v34]);
    }
    v34 -= 4LL;
  }

  while (v34 != -16);
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  unsigned int v37 = [v36 isAppleInternal];

  if (v37)
  {
    uint64_t v38 = operator new(0x30uLL);
    *uint64_t v38 = 0LL;
    v38[1] = 0LL;
    sub_10000DD24(v38 + 2, "--vverbose");
    v38[5] = &byte_10002E85D;
    int v39 = *((char *)v38 + 39);
    if (v39 >= 0) {
      v40 = v38 + 2;
    }
    else {
      v40 = (uint64_t *)v38[2];
    }
    if (v39 >= 0) {
      unint64_t v41 = *((unsigned __int8 *)v38 + 39);
    }
    else {
      unint64_t v41 = v38[3];
    }
    v38[1] = sub_10001391C(v40, v41);
    unint64_t v42 = sub_10001391C(v40, v41);
    unint64_t v43 = v42;
    v38[1] = v42;
    unint64_t v44 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v45 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v45.i16[0] = vaddlv_u8(v45);
      unint64_t v46 = v45.u32[0];
      if (v45.u32[0] > 1uLL)
      {
        unint64_t v47 = v42;
      }

      else
      {
        unint64_t v47 = ((unint64_t)__p[1] - 1) & v42;
      }

      v48 = (unsigned __int8 **)*((void *)__p[0] + v47);
      if (v48)
      {
        for (j = *v48; j; j = *(unsigned __int8 **)j)
        {
          unint64_t v50 = *((void *)j + 1);
          if (v50 == v43)
          {
            if (sub_100013D50(j + 16, (unsigned __int8 *)v38 + 16))
            {
              sub_100013FE8(1, (void **)v38);
              goto LABEL_105;
            }
          }

          else
          {
            if (v46 > 1)
            {
              if (v50 >= v44) {
                v50 %= v44;
              }
            }

            else
            {
              v50 &= v44 - 1;
            }

            if (v50 != v47) {
              break;
            }
          }
        }
      }
    }

    float v51 = (float)(unint64_t)(*((void *)&v96 + 1) + 1LL);
    if (!v44 || (float)(v97 * (float)v44) < v51)
    {
      BOOL v52 = 1LL;
      if (v44 >= 3) {
        BOOL v52 = (v44 & (v44 - 1)) != 0;
      }
      unint64_t v53 = v52 | (2 * v44);
      unint64_t v54 = vcvtps_u32_f32(v51 / v97);
      if (v53 <= v54) {
        size_t v55 = v54;
      }
      else {
        size_t v55 = v53;
      }
      sub_100013DF0((uint64_t)__p, v55);
      unint64_t v44 = (unint64_t)__p[1];
      unint64_t v43 = v38[1];
    }

    uint8x8_t v56 = (uint8x8_t)vcnt_s8((int8x8_t)v44);
    v56.i16[0] = vaddlv_u8(v56);
    if (v56.u32[0] > 1uLL)
    {
      if (v43 >= v44) {
        v43 %= v44;
      }
    }

    else
    {
      v43 &= v44 - 1;
    }

    v57 = __p[0];
    v58 = (void *)*((void *)__p[0] + v43);
    if (v58)
    {
      *uint64_t v38 = *v58;
      goto LABEL_103;
    }

    *uint64_t v38 = v96;
    *(void *)&__int128 v96 = v38;
    v57[v43] = &v96;
    if (*v38)
    {
      unint64_t v59 = *(void *)(*v38 + 8LL);
      if (v56.u32[0] > 1uLL)
      {
        if (v59 >= v44) {
          v59 %= v44;
        }
      }

      else
      {
        v59 &= v44 - 1;
      }

      v58 = (char *)__p[0] + 8 * v59;
LABEL_103:
      void *v58 = v38;
    }

    ++*((void *)&v96 + 1);
  }

LABEL_105:
  uint64_t v60 = v90 >> 3;
LABEL_106:
  while (2)
  {
    uint64_t v61 = v60 - 1;
    if (v60 != 1)
    {
      uint64_t v62 = v60--;
      v63 = &v35[v61];
      v64 = *v63;
      if (**v63 != 45 || v64[1] != 45) {
        continue;
      }
      sub_10000DD24(v100, v64);
      v65 = __p[0];
      int8x8_t v66 = (int8x8_t)__p[1];
      int v67 = (char)v101;
      v68 = (void *)v100[0];
      if ((v101 & 0x80u) == 0) {
        v69 = v100;
      }
      else {
        v69 = (uint64_t *)v100[0];
      }
      if ((v101 & 0x80u) == 0) {
        unint64_t v70 = v101;
      }
      else {
        unint64_t v70 = v100[1];
      }
      unint64_t v71 = sub_10001391C(v69, v70);
      if (!*(void *)&v66) {
        goto LABEL_132;
      }
      unint64_t v72 = v71;
      uint8x8_t v73 = (uint8x8_t)vcnt_s8(v66);
      v73.i16[0] = vaddlv_u8(v73);
      unint64_t v74 = v73.u32[0];
      if (v73.u32[0] > 1uLL)
      {
        unint64_t v75 = v71;
        if (v71 >= *(void *)&v66) {
          unint64_t v75 = v71 % *(void *)&v66;
        }
      }

      else
      {
        unint64_t v75 = v71 & (*(void *)&v66 - 1LL);
      }

      v76 = (unsigned __int8 **)v65[v75];
      if (!v76)
      {
LABEL_132:
        v77 = 0LL;
        goto LABEL_134;
      }

      v77 = *v76;
      if (!*v76) {
        goto LABEL_134;
      }
      while (1)
      {
        unint64_t v78 = *((void *)v77 + 1);
        if (v78 == v72)
        {
        }

        else
        {
          if (v74 > 1)
          {
            if (v78 >= *(void *)&v66) {
              v78 %= *(void *)&v66;
            }
          }

          else
          {
            v78 &= *(void *)&v66 - 1LL;
          }

          if (v78 != v75)
          {
            v77 = 0LL;
LABEL_134:
            __int128 v35 = v91;
            if (v67 < 0) {
              operator delete(v68);
            }
            if (!v77) {
              sub_10000D354();
            }
            **((_BYTE **)v77 + 5) = 1;
            v79 = &v91[v62];
            uint64_t v80 = v92 - (char *)v79;
            v92 = (char *)v63 + v80;
            goto LABEL_106;
          }
        }

        v77 = *(unsigned __int8 **)v77;
        if (!v77) {
          goto LABEL_134;
        }
      }
    }

    break;
  }

  if (byte_10002E85D)
  {
    char v81 = 1;
    byte_10002E85B = 1;
  }

  else
  {
    char v81 = byte_10002E85B;
  }

  byte_10002E85C = v81 + byte_10002E85D;
  sub_100014034((uint64_t)__p);
  unint64_t v82 = (unint64_t)(v92 - (char *)v35) >> 3;
  if ((int)v82 >= 2)
  {
    int v83 = 1;
    do
    {
      v84 = objc_autoreleasePoolPush();
      sub_10000DD24(__p, v35[v83]);
      sub_10000D540((uint64_t)v100, __p);
      if (!LOBYTE(v106[0])
        || (_BYTE)v105
        && (v85 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs")),
            unsigned __int8 v86 = [v85 isAppleInternal],
            v85,
            (v86 & 1) == 0))
      {
        sub_10000D354();
      }

      optind = 1;
      int v99 = v82 - v83;
      v98 = &v35[v83];
      if (!v104)
      {
        sub_1000138A0();
        __break(1u);
      }

      (*(void (**)(uint64_t, int *, char ***))(*(void *)v104 + 48LL))(v104, &v99, &v98);
      int v87 = optind;
      sub_1000138B4((uint64_t)v100);
      if (SBYTE7(v96) < 0) {
        operator delete(__p[0]);
      }
      objc_autoreleasePoolPop(v84);
      v83 += v87;
    }

    while (v83 < (int)v82);
  }

  if (byte_10002E858) {
    sub_10000D368((uint64_t)@"leaks");
  }
  if (byte_10002E859) {
    sub_10000D368((uint64_t)@"vmmap");
  }
  if (byte_10002E85A) {
    sub_10000D368((uint64_t)@"heap");
  }
  if (v35) {
    operator delete(v35);
  }
  return 0LL;
}

void sub_10000D20C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000D354()
{
}

void sub_10000D368(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([@"/usr/bin/" stringByAppendingPathComponent:a1]);
  id v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);

  unint64_t v16 = v6;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  sub_100013118(v3, v7);

  uint64_t v9 = _SWCGetServerConnection(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 processIdentifier];
  if ((_DWORD)v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);

    unint64_t v15 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    sub_100013118(v3, v14);
  }

  else
  {
    int v13 = v6;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10000D4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D540(uint64_t a1, _BYTE *a2)
{
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 64) = 0;
  sub_10000DD24(v25, "help");
  v26[0] = &off_100028AF8;
  v26[1] = sub_10000DDD0;
  v26[3] = v26;
  char v27 = 0;
  sub_10000DD24(v28, "add-all-apps");
  v29[0] = &off_100028AF8;
  v29[1] = sub_10000DDD4;
  v29[3] = v29;
  char v30 = 1;
  sub_10000DD24(v31, "add");
  v32[0] = &off_100028AF8;
  v32[1] = sub_10000DE5C;
  v32[3] = v32;
  char v33 = 1;
  sub_10000DD24(v34, "dl");
  v35[0] = &off_100028AF8;
  v35[1] = sub_10000DF88;
  v35[3] = v35;
  char v36 = 0;
  sub_10000DD24(v37, "loaddb");
  v38[0] = &off_100028AF8;
  v38[1] = sub_10000E1A8;
  v38[3] = v38;
  char v39 = 1;
  sub_10000DD24(v40, "get");
  v41[0] = &off_100028AF8;
  v41[1] = sub_10000E32C;
  v41[3] = v41;
  char v42 = 0;
  sub_10000DD24(v43, "openul");
  v44[0] = &off_100028AF8;
  v44[1] = sub_10000E554;
  v44[3] = v44;
  char v45 = 0;
  sub_10000DD24(v46, "remove");
  v47[0] = &off_100028AF8;
  v47[1] = sub_10000E7A8;
  v47[3] = v47;
  char v48 = 1;
  sub_10000DD24(v49, "set");
  v50[0] = &off_100028AF8;
  v50[1] = sub_10000E8B4;
  v50[3] = v50;
  char v51 = 1;
  sub_10000DD24(v52, "show");
  v53[0] = &off_100028AF8;
  v53[1] = sub_10000EB4C;
  v53[3] = v53;
  char v54 = 0;
  sub_10000DD24(v55, "verify");
  v56[0] = &off_100028AF8;
  v56[1] = sub_10000EC20;
  v56[3] = v56;
  char v57 = 0;
  sub_10000DD24(v58, "reset");
  v59[0] = &off_100028AF8;
  v59[1] = sub_10000F2E0;
  v59[3] = v59;
  char v60 = 0;
  sub_10000DD24(v61, "watch");
  v62[0] = &off_100028AF8;
  v62[1] = sub_10000F368;
  v62[3] = v62;
  char v63 = 0;
  sub_10000DD24(v64, "read-settings");
  v65[0] = &off_100028AF8;
  v65[1] = sub_10000F57C;
  v65[3] = v65;
  char v66 = 1;
  sub_10000DD24(v67, "write-settings");
  v68[0] = &off_100028AF8;
  v68[1] = sub_10000FB4C;
  v68[3] = v68;
  char v69 = 1;
  sub_10000DD24(v70, "match");
  v71[0] = &off_100028AF8;
  v71[1] = sub_100010074;
  v71[3] = v71;
  char v72 = 0;
  sub_10000DD24(v73, "developer-mode");
  v74[0] = &off_100028AF8;
  v74[1] = sub_1000104BC;
  v74[3] = v74;
  char v75 = 1;
  sub_10000DD24(v76, "get-tdi-epoch");
  v77[0] = &off_100028AF8;
  v77[1] = sub_100010604;
  v77[3] = v77;
  char v78 = 1;
  id v4 = (const std::string *)operator new(0x480uLL);
  unint64_t v23 = v4;
  v24[0] = v4;
  v24[1] = v4 + 48;
  uint64_t v5 = 0x1FFFFFFFFFFFFF70LL;
  do
  {
    uint64_t v6 = (char *)&v4[48] + v5 * 8;
    unint64_t v7 = (void **)&v79[v5];
    if (SHIBYTE(v79[v5 + 2]) < 0)
    {
      sub_10001205C(v6, *v7, v79[v5 + 1]);
    }

    else
    {
      *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
      *(std::string::size_type *)((char *)&v4[48].__r_.__value_.__l.__cap_ + v5 * 8) = v79[v5 + 2];
    }

    sub_100013794((uint64_t)&v4[49] + v5 * 8, (uint64_t)&v79[v5 + 3]);
    v4[50].__r_.__value_.__s.__data_[v5 * 8 + 8] = v79[v5 + 7];
    v5 += 8LL;
  }

  while (v5 * 8);
  v24[0] = v4 + 48;
  uint64_t v8 = 144LL;
  do
  {
    uint64_t v9 = (void ***)v24[v8];
    if (&v25[v8 - 5] == v9)
    {
      uint64_t v9 = &v25[v8 - 5];
      uint64_t v10 = 4LL;
    }

    else
    {
      if (!v9) {
        goto LABEL_12;
      }
      uint64_t v10 = 5LL;
    }

    ((void (*)(void))(*v9)[v10])();
LABEL_12:
    v8 -= 8LL;
  }

  while (v8 * 8);
  id v11 = v23;
  if (v23 == (const std::string *)v24[0])
  {
LABEL_34:
    if (v11 == (const std::string *)v24[0]) {
      goto LABEL_55;
    }
    if (!*(_BYTE *)(a1 + 64))
    {
      if ((char)v11->__r_.__value_.__s.__size_ < 0)
      {
        sub_10001205C((_BYTE *)a1, v11->__r_.__value_.__l.__data_, v11->__r_.__value_.__l.__size_);
      }

      else
      {
        __int128 v20 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        *(void *)(a1 + 16) = v11->__r_.__value_.__l.__cap_;
        *(_OWORD *)a1 = v20;
      }

      sub_100013794(a1 + 24, (uint64_t)&v11[1]);
      *(_BYTE *)(a1 + 56) = v11[2].__r_.__value_.__s.__data_[8];
      *(_BYTE *)(a1 + 64) = 1;
      goto LABEL_55;
    }

    std::string::operator=((std::string *)a1, v11);
    sub_100013794((uint64_t)v25, (uint64_t)&v11[1]);
    uint64_t v17 = a1 + 24;
    if (v25 != (void ***)(a1 + 24))
    {
      uint64_t v18 = v26[0];
      uint64_t v19 = *(void *)(a1 + 48);
      if ((void ***)v26[0] == v25)
      {
        if (v19 == v17)
        {
          (*((void (**)(void ***, void *))v25[0] + 3))(v25, v79);
          (*(void (**)(void))(*(void *)v26[0] + 32LL))(v26[0]);
          v26[0] = 0LL;
          (*(void (**)(void, void ***))(**(void **)(a1 + 48) + 24LL))(*(void *)(a1 + 48), v25);
          (*(void (**)(void))(**(void **)(a1 + 48) + 32LL))(*(void *)(a1 + 48));
          *(void *)(a1 + 48) = 0LL;
          v26[0] = v25;
          (*(void (**)(void *, uint64_t))(v79[0] + 24LL))(v79, a1 + 24);
          (*(void (**)(void *))(v79[0] + 32LL))(v79);
        }

        else
        {
          (*((void (**)(void ***, uint64_t))v25[0] + 3))(v25, a1 + 24);
          (*(void (**)(void))(*(void *)v26[0] + 32LL))(v26[0]);
          v26[0] = *(void *)(a1 + 48);
        }

        *(void *)(a1 + 48) = v17;
      }

      else if (v19 == v17)
      {
        (*(void (**)(uint64_t, void ***))(*(void *)(a1 + 24) + 24LL))(a1 + 24, v25);
        (*(void (**)(void))(**(void **)(a1 + 48) + 32LL))(*(void *)(a1 + 48));
        *(void *)(a1 + 48) = v26[0];
        v26[0] = v25;
      }

      else
      {
        v26[0] = *(void *)(a1 + 48);
        *(void *)(a1 + 48) = v18;
      }
    }

    __int128 v21 = (void ***)v26[0];
    if ((void ***)v26[0] == v25)
    {
      uint64_t v22 = 4LL;
      __int128 v21 = v25;
    }

    else
    {
      if (!v26[0])
      {
LABEL_54:
        *(_BYTE *)(a1 + 56) = v11[2].__r_.__value_.__s.__data_[8];
        goto LABEL_55;
      }

      uint64_t v22 = 5LL;
    }

    ((void (*)(void))(*v21)[v22])();
    goto LABEL_54;
  }

  char v12 = a2[23];
  if (v12 >= 0) {
    uint64_t v13 = a2[23];
  }
  else {
    uint64_t v13 = *((void *)a2 + 1);
  }
  if (v12 < 0) {
    a2 = *(_BYTE **)a2;
  }
  do
  {
    uint64_t size = v11->__r_.__value_.__s.__size_;
    if ((size & 0x80u) == 0LL) {
      std::string::size_type v15 = v11->__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v15 = v11->__r_.__value_.__l.__size_;
    }
    if (v15 == v13)
    {
      if ((size & 0x80) != 0)
      {
        if (!memcmp(v11->__r_.__value_.__l.__data_, a2, v11->__r_.__value_.__l.__size_)) {
          goto LABEL_34;
        }
      }

      else
      {
        if (!v11->__r_.__value_.__s.__size_) {
          goto LABEL_34;
        }
        uint64_t v16 = 0LL;
        while (v11->__r_.__value_.__s.__data_[v16] == a2[v16])
        {
          if (size == ++v16) {
            goto LABEL_34;
          }
        }
      }
    }

    id v11 = (const std::string *)((char *)v11 + 64);
  }

  while (v11 != (const std::string *)v24[0]);
LABEL_55:
  v25[0] = (void **)&v23;
  sub_1000137F8(v25);
}

void sub_10000DC78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)(v11 - 96) = &a10;
  sub_1000137F8((void ***)(v11 - 96));
  sub_1000138B4(v10);
  _Unwind_Resume(a1);
}

void *sub_10000DD24(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_10000DDD4(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "");
  uint64_t v3 = _SWCGetServerConnection(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028BB8]);
  [v4 addAllAppsWithCompletionHandler:&stru_100028BF8];
}

void sub_10000DE3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DE5C(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "a:d:s:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = sub_100012714(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);

  if (!v6) {
    sub_10000D354();
  }
  uint64_t v8 = _SWCGetServerConnection(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028C40]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100012854;
  v12[3] = &unk_100028C68;
  id v11 = v5;
  id v13 = v11;
  [v10 addServiceWithServiceSpecifier:v11 completionHandler:v12];
}

void sub_10000DF48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000DF88(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "d:t:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"d"]);
  if (!v4) {
    sub_10000D354();
  }
  id v5 = -[_SWCDomain initWithString:](objc_alloc(&OBJC_CLASS____SWCDomain), "initWithString:", v4);
  if (!v5) {
    sub_10000D354();
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"t"]);
  uint64_t v7 = v6;
  else {
    dispatch_time_t v9 = -1LL;
  }

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  id v11 = objc_alloc_init(&OBJC_CLASS___SWCDownloader);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100012944;
  v15[3] = &unk_100028C90;
  char v12 = v10;
  uint64_t v16 = v12;
  -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:]( v11,  "downloadAASAFileForDomain:applicationIdentifier:completionHandler:",  v5,  0LL,  v15);
  if (dispatch_semaphore_wait(v12, v9))
  {
    id v13 = __stderrp;
    id v14 = objc_claimAutoreleasedReturnValue(-[_SWCDomain description](v5, "description"));
    fprintf(v13, "Timed out waiting for %s\n", (const char *)[v14 UTF8String]);

    exit(1);
  }
}

void sub_10000E144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000E1A8(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "f:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"f"]);
  if (!v4) {
    sub_10000D354();
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 0LL));
  id v12 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SWCDatabase loadContentsOfURL:error:]( &OBJC_CLASS___SWCDatabase,  "loadContentsOfURL:error:",  v5,  &v12));
  id v7 = v12;

  if (!v6)
  {
    dispatch_semaphore_t v10 = __stderrp;
    id v11 = (const char *)sub_100012214(v7);
    fprintf(v10, "Error loading database: %s\n", v11);
    exit(1);
  }

  uint64_t v8 = __stdoutp;
  id v9 = objc_claimAutoreleasedReturnValue([v6 description]);
  fprintf(v8, "%s\n", (const char *)[v9 UTF8String]);
}

void sub_10000E2E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E32C(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "a:d:s:");
  std::string::size_type v15 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = sub_100012714(v15);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v20 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:error:]( &OBJC_CLASS____SWCServiceDetails,  "serviceDetailsWithServiceSpecifier:error:",  v4,  &v20));
  id v14 = v20;
  if (!v5)
  {
    id v12 = __stderrp;
    id v13 = (const char *)sub_100012214(v14);
    fprintf(v12, "Error getting info: %s\n", v13);
    exit(1);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_semaphore_t v10 = __stdoutp;
        id v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1)
                                                                                              + 8LL * (void)i), "description")));
        fprintf(v10, "%s\n", (const char *)[v11 UTF8String]);
      }

      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v7);
  }
}

void sub_10000E4F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000E554(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "u:r:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"u"]);
  if (v4)
  {
    id v5 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v5, "scheme"));
    id v7 = v6;
    if (v6
      && [v6 caseInsensitiveCompare:@"http"]
      && [v7 caseInsensitiveCompare:@"https"])
    {
      fprintf( __stderrp, "Invalid URL scheme %s.\n", (const char *)[v7 UTF8String]);

      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"r"]);
  if (v8) {
    id v9 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
  }
  else {
    id v9 = 0LL;
  }

  if (!v5) {
    sub_10000D354();
  }
  id v10 = objc_alloc_init(&OBJC_CLASS____LSOpenConfiguration);
  [v10 setReferrerURL:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100012A2C;
  v12[3] = &unk_100028C68;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  id v11 = v13;
  +[LSAppLink openWithURL:configuration:completionHandler:]( &OBJC_CLASS___LSAppLink,  "openWithURL:configuration:completionHandler:",  v5,  v10,  v12);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000E728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E7A8(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "a:d:s:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = sub_100012714(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = _SWCGetServerConnection(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028CB0]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100012B34;
  v10[3] = &unk_100028C68;
  id v9 = v5;
  id v11 = v9;
  [v8 removeServiceWithServiceSpecifier:v9 completionHandler:v10];
}

void sub_10000E878( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000E8B4(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "a:d:s:j:u:");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = sub_100012714(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"j"]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"u"]);
  uint64_t v8 = (void *)v7;
  if (!(v6 | v7))
  {
    fwrite("No changes specified\n", 0x15uLL, 1uLL, __stderrp);
    exit(1);
  }

  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v7 = (uint64_t)[(id)v7 caseInsensitiveCompare:@"approved"];
  if (!v7)
  {
    unsigned __int8 v11 = 1;
    goto LABEL_15;
  }

  uint64_t v7 = (uint64_t)[v8 caseInsensitiveCompare:@"denied"];
  if (!v7)
  {
    unsigned __int8 v11 = 2;
    goto LABEL_15;
  }

  uint64_t v7 = (uint64_t)[v8 caseInsensitiveCompare:@"unspecified"];
  if (!v7)
  {
LABEL_12:
    unsigned __int8 v11 = 0;
    goto LABEL_15;
  }

  id v9 = -[NSScanner initWithString:](objc_alloc(&OBJC_CLASS___NSScanner), "initWithString:", v8);
  unsigned int v19 = -1;
  unsigned __int8 v10 = -[NSScanner scanInt:](v9, "scanInt:", &v19);
  unsigned __int8 v11 = v19;
  if (v19 < 3) {
    unsigned __int8 v12 = v10;
  }
  else {
    unsigned __int8 v12 = 0;
  }
  if ((v12 & 1) == 0)
  {

    fwrite("Invalid user approval state.\n", 0x1DuLL, 1uLL, __stderrp);
    exit(1);
  }

LABEL_15:
  uint64_t v13 = _SWCGetServerConnection(v7);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  std::string::size_type v15 = (void *)objc_claimAutoreleasedReturnValue([v14 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028CD0]);
  if (v6)
  {
    __int128 v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v17 = sub_100012C7C((void *)v6, v16);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v15 setDetails:v18 forServiceWithServiceSpecifier:v5 completionHandler:&stru_100028CF0];
  }

  if (v8) {
    [v15 setUserApprovalState:v11 forServiceWithServiceSpecifier:v5 completionHandler:&stru_100028D10];
  }
}

void sub_10000EAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EB4C(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "");
  uint64_t v3 = _SWCGetServerConnection(v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028D30]);
  xpc_object_t v5 = xpc_fd_create(1);
  [v4 showWithVerbosity:byte_10002E85C isTTY:_SWCFileIsTTY(__stdoutp) fileDescriptor:v5 completionHandler:&stru_100028D50];
}

void sub_10000EBF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EC20(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "d:j:u:");
  unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"d"]);
  size_t v4 = (void *)v3;
  xpc_object_t v5 = @"www.example.com";
  if (v3) {
    xpc_object_t v5 = (__CFString *)v3;
  }
  id v6 = v5;

  unsigned int v37 = v6;
  char v42 = -[_SWCDomain initWithString:](objc_alloc(&OBJC_CLASS____SWCDomain), "initWithString:", v6);
  char v39 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"j"]);
  if (!v39) {
    sub_10000D354();
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"u"]);
  if (v7)
  {
    uint64_t v8 = -[NSURLComponents initWithString:](objc_alloc(&OBJC_CLASS___NSURLComponents), "initWithString:", v7);
    if (!v8) {
      sub_10000D354();
    }
    char v45 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents host](v8, "host"));
    if (v9) {
      unint64_t v41 = -[_SWCDomain initWithString:](objc_alloc(&OBJC_CLASS____SWCDomain), "initWithString:", v9);
    }
    else {
      unint64_t v41 = 0LL;
    }
  }

  else
  {
    unint64_t v41 = 0LL;
    char v45 = 0LL;
  }

  id v10 = sub_100012C7C(v39, 0LL);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  unsigned __int8 v12 = objc_autoreleasePoolPush();
  uint64_t v38 = (void *)v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SWCEntry entriesForJSONObject:domain:]( &OBJC_CLASS___SWCEntry,  "entriesForJSONObject:domain:",  v11,  v42));
  objc_autoreleasePoolPop(v12);
  v40 = v13;
  if (!v13) {
    goto LABEL_42;
  }
  if (v41 && (-[_SWCDomain encompassesDomain:](v42, "encompassesDomain:", v41) & 1) == 0)
  {
    char v27 = __stderrp;
    id v28 = objc_claimAutoreleasedReturnValue(-[_SWCDomain rawValue](v42, "rawValue"));
    unint64_t v29 = (const char *)[v28 UTF8String];
    id v30 = objc_claimAutoreleasedReturnValue(-[_SWCDomain rawValue](v41, "rawValue"));
    fprintf( v27,  "Input domain %s did not match input URL's domain %s.\n",  v29,  (const char *)[v30 UTF8String]);

    goto LABEL_42;
  }

  if (!v45)
  {
    _SWCLogHeader(__stdoutp, @"JSON Contents");
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v31 = v13;
    id v32 = [v31 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v47;
      char v34 = 1;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v31);
          }
          char v36 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          if ((v34 & 1) == 0) {
            _SWCLogSeparator(__stdoutp);
          }
          [v36 logToFile:__stdoutp verbosity:byte_10002E85C];
          char v34 = 0;
        }

        id v32 = [v31 countByEnumeratingWithState:&v46 objects:v55 count:16];
        char v34 = 0;
      }

      while (v32);
    }

    goto LABEL_42;
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (!v14)
  {

    goto LABEL_41;
  }

  char v15 = 0;
  uint64_t v16 = *(void *)v52;
  do
  {
    for (j = 0LL; j != v14; j = (char *)j + 1)
    {
      if (*(void *)v52 != v16) {
        objc_enumerationMutation(obj);
      }
      __int128 v18 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
      id v50 = 0LL;
      id v19 = [v18 evaluateWithURLComponents:v45 auditToken:0 matchingPattern:&v50];
      id v20 = v50;
      if (v19 == (id)100)
      {
        float v26 = __stdoutp;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceSpecifier]);
        id v23 = objc_claimAutoreleasedReturnValue([v22 description]);
        [v23 UTF8String];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v45, "URL"));
        id v25 = objc_claimAutoreleasedReturnValue([v24 absoluteString]);
        [v25 UTF8String];
        fprintf(v26, "%s: Pattern %s blocked match.\n");
      }

      else
      {
        if (v19 != (id)200) {
          goto LABEL_25;
        }
        __int128 v21 = __stdoutp;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceSpecifier]);
        id v23 = objc_claimAutoreleasedReturnValue([v22 description]);
        [v23 UTF8String];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v45, "URL"));
        id v25 = objc_claimAutoreleasedReturnValue([v24 absoluteString]);
        [v25 UTF8String];
        fprintf(v21, "%s: Pattern %s matched.\n");
      }

      char v15 = 1;
LABEL_25:
    }

    id v14 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  }

  while (v14);

  if ((v15 & 1) != 0) {
    goto LABEL_42;
  }
LABEL_41:
  fputs("Input JSON did not match input URL.\n", __stderrp);
LABEL_42:
}

void sub_10000F160( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10000F2E0(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "");
  uint64_t v3 = _SWCGetServerConnection(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028D70]);
  [v4 resetWithCompletionHandler:&stru_100028D90];
}

void sub_10000F348( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F368(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "");
  id v3 = [&off_10002A648 mutableCopy];
  if (byte_10002E85D) {
    size_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"subsystem == com.apple.swc" stringByAppendingString:@" || process == swcd"]);
  }
  else {
    size_t v4 = @"subsystem == com.apple.swc";
  }
  [v3 addObject:v4];
  if (byte_10002E85B)
  {
    [v3 addObject:@"--level"];
    [v3 addObject:@"debug"];
  }

  id v5 = (const char *)[@"/usr/bin/log" UTF8String];
  fputs(v5, __stdoutp);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        fputc(32, __stdoutp);
        id v11 = v10;
        unsigned __int8 v12 = (const char *)objc_msgSend(v11, "UTF8String", (void)v13);
        fputs(v12, __stdoutp);
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  fputc(10, __stdoutp);
  sub_100013118(@"/usr/bin/log", v6);
}

void sub_10000F54C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F57C(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "s:a:d:k:jp");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"s"]);
  if (!v4
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"k"]),
        v5,
        v4,
        !v5))
  {
    ((void (*)(void))sub_10000D354)();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"j"]);
  unsigned int v7 = [v6 BOOLValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"p"]);
  unsigned int v9 = [v8 BOOLValue];

  id v10 = sub_100012714(v3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v47 = 0LL;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceSettings serviceSettingsWithServiceSpecifier:error:]( &OBJC_CLASS____SWCServiceSettings,  "serviceSettingsWithServiceSpecifier:error:",  v11,  &v47));
  id v13 = v47;
  __int128 v14 = v13;
  if (!v12)
  {
    uint64_t v38 = __stderrp;
    char v39 = (const char *)sub_100012214(v13);
    fprintf(v38, "%s\n", v39);
    exit(1);
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"k"]);
  id v16 = [v12 objectForKey:v15 ofClass:objc_opt_class(NSObject)];
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  __int128 v18 = (__CFString *)v17;
  if (!v17)
  {
    fprintf( __stderrp, "Value for %s not found.\n", (const char *)[v15 UTF8String]);
    exit(1);
  }

  if ((v7 & v9) == 1)
  {
    size_t v40 = fwrite("Cannot specify both -j and -p.\n", 0x1FuLL, 1uLL, __stderrp);
    sub_10000D354(v40);
  }

  if (!v7)
  {
    if (v9)
    {
      __int128 v48 = v15;
      uint64_t v49 = v17;
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
      id v45 = 0LL;
      float v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v25,  100LL,  0LL,  &v45));
      id v21 = v45;

      if (!v26)
      {
        unint64_t v43 = __stderrp;
        unint64_t v44 = (const char *)sub_100012214(v21);
        fprintf(v43, "%s\n", v44);
        exit(1);
      }

      id v22 = v26;
      id v27 = [v22 bytes];
      id v28 = [v22 length];
      fwrite(v27, (size_t)v28, 1uLL, __stdoutp);
      goto LABEL_12;
    }

    if (byte_10002E85B)
    {
      unint64_t v29 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v30 = objc_opt_class(v18);
      id v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString debugDescription](v18, "debugDescription"));
      id v32 = -[NSString initWithFormat:](v29, "initWithFormat:", @"<%@> %@", v30, v31);

      __int128 v18 = (__CFString *)v32;
    }

    else
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID != CFGetTypeID(v18))
      {
LABEL_20:
        char v36 = __stdoutp;
        unsigned int v37 = (const char *)[v15 UTF8String];
        id v22 = objc_claimAutoreleasedReturnValue(-[__CFString description](v18, "description"));
        fprintf(v36, "%s = %s\n", v37, (const char *)[v22 UTF8String]);
        id v21 = v14;
        goto LABEL_21;
      }

      unsigned int v34 = -[__CFString BOOLValue](v18, "BOOLValue");
      __int128 v35 = @"false";
      if (v34) {
        __int128 v35 = @"true";
      }
      id v31 = v18;
      __int128 v18 = v35;
    }

    goto LABEL_20;
  }

  id v50 = v15;
  uint64_t v51 = v17;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
  id v46 = v14;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v19,  5LL,  &v46));
  id v21 = v46;

  if (!v20)
  {
    unint64_t v41 = __stderrp;
    char v42 = (const char *)sub_100012214(v21);
    fprintf(v41, "%s\n", v42);
    exit(1);
  }

  id v22 = v20;
  id v23 = [v22 bytes];
  id v24 = [v22 length];
  fwrite(v23, (size_t)v24, 1uLL, __stdoutp);
LABEL_12:
  fputc(10, __stdoutp);
LABEL_21:
}

void sub_10000FA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FB4C(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "s:a:d:k:v:jp");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"s"]);
  id v5 = (void *)v4;
  if (!v4) {
LABEL_21:
  }
    sub_10000D354(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"k"]);
  if (!v6)
  {

    goto LABEL_21;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"v"]);

  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"j"]);
  unsigned int v9 = [v8 BOOLValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"p"]);
  unsigned int v11 = [v10 BOOLValue];

  unsigned __int8 v12 = sub_100012714(v3);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v38 = 0LL;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceSettings serviceSettingsWithServiceSpecifier:error:]( &OBJC_CLASS____SWCServiceSettings,  "serviceSettingsWithServiceSpecifier:error:",  v13,  &v38));
  id v15 = v38;
  id v16 = v15;
  if (!v14)
  {
    id v28 = __stderrp;
    unint64_t v29 = (const char *)sub_100012214(v15);
    fprintf(v28, "%s\n", v29);
    exit(1);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"k"]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"v"]);
  id v19 = v18;
  if ((v9 & v11) == 1)
  {
    size_t v30 = fwrite("Cannot specify both -j and -p.\n", 0x1FuLL, 1uLL, __stderrp);
    sub_10000D354(v30);
  }

  if (v9)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dataUsingEncoding:4]);
    if (!v20)
    {
      fprintf( __stderrp, "Could not create UTF-8 data representation of value %s.\n", (const char *)[v19 UTF8String]);
      exit(1);
    }

    id v37 = v16;
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v20,  4LL,  &v37));
    id v22 = v37;

    if (!v21)
    {
      id v23 = __stderrp;
      id v24 = (const char *)sub_100012214(v22);
      fprintf(v23, "%s\n", v24);
      exit(1);
    }
  }

  else
  {
    if (!v11) {
      goto LABEL_14;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dataUsingEncoding:4]);
    if (!v20)
    {
      fprintf( __stderrp, "Could not create UTF-8 data representation of value %s.\n", (const char *)[v19 UTF8String]);
      exit(1);
    }

    id v36 = 0LL;
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v20,  0LL,  0LL,  &v36));
    id v22 = v36;

    if (!v21)
    {
      uint64_t v33 = __stderrp;
      unsigned int v34 = (const char *)sub_100012214(v22);
      fprintf(v33, "%s\n", v34);
      exit(1);
    }
  }

  id v16 = v22;
  id v19 = (void *)v21;
LABEL_14:
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  if (v19 == v25)
  {

    id v19 = 0LL;
  }

  else if (!+[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  v19,  200LL))
  {
    fprintf( __stderrp, "Value %s could not be stored in a property list.\n", (const char *)[v19 UTF8String]);
    exit(1);
  }

  [v14 setObject:v19 forKey:v17];
  id v35 = v16;
  unsigned __int8 v26 = [v14 commitReturningError:&v35];
  id v27 = v35;

  if ((v26 & 1) == 0)
  {
    id v31 = __stderrp;
    id v32 = (const char *)sub_100012214(v27);
    fprintf(v31, "%s\n", v32);
    exit(1);
  }
}

void sub_10000FFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010074(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "u:j:");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"u"]);
  if (v5) {
    id v6 = -[NSURLComponents initWithString:](objc_alloc(&OBJC_CLASS___NSURLComponents), "initWithString:", v5);
  }
  else {
    id v6 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  unsigned int v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"j"]);
  unsigned int v9 = v8;
  if (v8)
  {
    id v10 = sub_100012C7C(v8, 0LL);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (_NSIsNSDictionary(v11))
    {
      size_t v30 = v11;
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
LABEL_10:

      unsigned int v11 = (void *)v12;
      goto LABEL_12;
    }

    if (_NSIsNSString(v11))
    {
      id v27 = @"/";
      id v28 = v11;
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      uint64_t v29 = v13;
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));

      unsigned int v11 = (void *)v13;
      goto LABEL_10;
    }

    if ((_NSIsNSArray(v11) & 1) == 0)
    {
      id v24 = __stderrp;
      id v25 = (objc_class *)objc_opt_class(v11);
      Name = class_getName(v25);
      fprintf(v24, "Unexpected JSON object type %s.\n", Name);
      exit(1);
    }
  }

  else
  {
    unsigned int v11 = 0LL;
  }

void sub_1000103FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000104BC(int a1, char *const *a2)
{
  id v2 = sub_1000124FC(a1, a2, "e:");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"e"]);
  id v6 = v5;
  if (v5) {
    id v7 = [v5 BOOLValue];
  }
  else {
    id v7 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  uint64_t v9 = _SWCGetServerConnection(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 synchronousRemoteObjectProxyWithErrorHandler:&stru_100028DB0]);
  uint64_t v12 = v11;
  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100013670;
    v13[3] = &unk_100028E10;
    char v14 = (char)v7;
    [v11 setDeveloperModeEnabled:v7 completionHandler:v13];
  }

  else
  {
    [v11 getDeveloperModeEnabledWithCompletionHandler:&stru_100028DF0];
  }
}

void sub_1000105C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010604(int a1, char *const *a2)
{
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[_SWCTrackingDomainInfo lastDatabaseUpdate](&OBJC_CLASS____SWCTrackingDomainInfo, "lastDatabaseUpdate"));
  uint64_t v4 = sub_1000124FC(a1, a2, "pz:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"p"]);
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = __stdoutp;
    [v15 timeIntervalSince1970];
    fprintf(v8, "%lli\n", (uint64_t)v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"z"]);
    if (v10)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  v10));
      if (!v11)
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v10));
        if (!v11) {
          sub_10000D354(0LL);
        }
      }
    }

    else
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
    }

    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
    -[NSISO8601DateFormatter setTimeZone:](v12, "setTimeZone:", v11);
    uint64_t v13 = __stdoutp;
    id v14 = objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v12, "stringFromDate:", v15));
    fprintf(v13, "%s\n", (const char *)[v14 UTF8String]);
  }
}

void sub_100010790( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000107E8(uint64_t a1)
{
  id v2 = (void *)(a1 + 24);
  id v3 = *(void **)(a1 + 48);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    id v3 = v2;
  }

  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v4 = 5LL;
  }

  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  return a1;
}

void sub_100010848()
{
  v0 = __stderrp;
  getprogname();
  sub_100011AF0((uint64_t)v0);
  fputc(32, __stderrp);
  sub_100011AF0((uint64_t)__stderrp);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  [v1 isAppleInternal];

  sub_100011AF0((uint64_t)__stderrp);
  sub_100011AF0((uint64_t)__stderrp);
  sub_100011AF0((uint64_t)__stderrp);
  sub_100011AF0((uint64_t)__stderrp);
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("--leaks", (uint64_t)"Run leaks before termination.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("--vmmap", (uint64_t)"Run vmmap before termination.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("--heap", (uint64_t)"Run heap before termination.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("--verbose", (uint64_t)"Increase verbosity of output.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  LODWORD(v0) = [v2 isAppleInternal];

  if ((_DWORD)v0)
  {
    __int128 v17 = 0uLL;
    uint64_t v18 = 0LL;
    sub_100011B58( "--vverbose",  (uint64_t)"Increase verbosity of output to ludicrous levels (implies --verbose).",  (uint64_t *)&v17);
    *(void *)&__int128 v25 = &v17;
    sub_100011F74((void ***)&v25);
  }

  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("add-all-apps", (uint64_t)"Update the SWC database to match Launch Services.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  sub_10000DD24(&v17, "[-s <service>]");
  sub_10000DD24(v19, "-a <app-id>");
  sub_10000DD24(v20, "[-d <domain>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, &v21, (char *)v25);
  sub_100011B58( "add",  (uint64_t)"Temporarily add entries for the specified app identifier.\n Specify all params to force a specific service.",  (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t i = 0LL; i != -9; i -= 3LL)
  {
    if (SHIBYTE(v20[i + 2]) < 0) {
      operator delete((void *)v20[i]);
    }
  }

  sub_10000DD24(&v17, "-d <domain>");
  sub_10000DD24(v19, "[-t <timeout>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v20, (char *)v25);
  sub_100011B58( "dl",  (uint64_t)"Downloads an A-A-S-A file from a domain.\nIf specified, the timeout is in seconds.",  (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t j = 0LL; j != -6; j -= 3LL)
  {
    if (SHIBYTE(v19[j + 2]) < 0) {
      operator delete((void *)v19[j]);
    }
  }

  sub_10000DD24(&v25, "-f <path>");
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  *(void *)&__int128 v17 = operator new(0x18uLL);
  *((void *)&v17 + 1) = v17;
  uint64_t v18 = v17 + 24;
  *((void *)&v17 + 1) = sub_100011FEC(&v25, &v27, (char *)v17);
  sub_100011B58("loaddb", (uint64_t)"Loads a database into swcutil's memory.", (uint64_t *)&v17);
  id v16 = (void **)&v17;
  sub_100011F74(&v16);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)v25);
  }
  sub_10000DD24(&v17, "[-s <service>]");
  sub_10000DD24(v19, "[-a <app-id>]");
  sub_10000DD24(v20, "[-d <domain>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, &v21, (char *)v25);
  sub_100011B58("get", (uint64_t)"Gets info about apps and/or domains.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t k = 0LL; k != -9; k -= 3LL)
  {
    if (SHIBYTE(v20[k + 2]) < 0) {
      operator delete((void *)v20[k]);
    }
  }

  sub_10000DD24(&v17, "-u <url>");
  sub_10000DD24(v19, "[-r <referrer-url>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v20, (char *)v25);
  sub_100011B58("openul", (uint64_t)"Open a URL as a universal link.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t m = 0LL; m != -6; m -= 3LL)
  {
    if (SHIBYTE(v19[m + 2]) < 0) {
      operator delete((void *)v19[m]);
    }
  }

  sub_10000DD24(&v17, "[-s <service>]");
  sub_10000DD24(v19, "[-a <app-id>]");
  sub_10000DD24(v20, "[-d <domain>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, &v21, (char *)v25);
  sub_100011B58("remove", (uint64_t)"Temporarily removes an app from the SWC database.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t n = 0LL; n != -9; n -= 3LL)
  {
    if (SHIBYTE(v20[n + 2]) < 0) {
      operator delete((void *)v20[n]);
    }
  }

  sub_10000DD24(&v17, "-s <service>");
  sub_10000DD24(v19, "-a <app-id>");
  sub_10000DD24(v20, "-d <domain>");
  sub_10000DD24(&v21, "[-j <JSON-or-path>]");
  sub_10000DD24(v22, "[-u <user-approval>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x78uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 120;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v23, (char *)v25);
  sub_100011B58("set", (uint64_t)"Sets details and/or user approval for an app/domain/service.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (iuint64_t i = 0LL; ii != -15; ii -= 3LL)
  {
    if (SHIBYTE(v22[ii + 2]) < 0) {
      operator delete((void *)v22[ii]);
    }
  }

  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("show", (uint64_t)"Show the current state.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  sub_10000DD24(&v17, "[-d <domain>]");
  sub_10000DD24(v19, "-j <JSON-or-path>");
  sub_10000DD24(v20, "[-u <url>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, &v21, (char *)v25);
  sub_100011B58("verify", (uint64_t)"Verify apple-app-site-association files. Use -u to match a URL.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (juint64_t j = 0LL; jj != -9; jj -= 3LL)
  {
    if (SHIBYTE(v20[jj + 2]) < 0) {
      operator delete((void *)v20[jj]);
    }
  }

  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  sub_100011B58("reset", (uint64_t)"Reset the database and restart swcd.", (uint64_t *)&v17);
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  unsigned int v11 = [v10 isAppleInternal];

  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  if (v11) {
    sub_100011B58( "watch",  (uint64_t)"Watch the system log for SWC logging.\n Specify --verbose to enable debug-level logging.\n Specify --vverbose to enable logging in swcd for all subsystems.",  (uint64_t *)&v17);
  }
  else {
    sub_100011B58( "watch",  (uint64_t)"Watch the system log for SWC logging.\nSpecify --verbose to enable debug-level logging.",  (uint64_t *)&v17);
  }
  *(void *)&__int128 v25 = &v17;
  sub_100011F74((void ***)&v25);
  sub_10000DD24(&v17, "-s <service>");
  sub_10000DD24(v19, "[-a <app-id>]");
  sub_10000DD24(v20, "[-d <domain>]");
  sub_10000DD24(&v21, "-k <key>");
  sub_10000DD24(v22, "[-j]");
  sub_10000DD24(v23, "[-p]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x90uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 144;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v24, (char *)v25);
  sub_100011B58( "read-settings",  (uint64_t)"Reads settings.\nSpecify -j to output JSON or -p to output a plist.",  (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (kuint64_t k = 0LL; kk != -18; kk -= 3LL)
  {
    if (SHIBYTE(v23[kk + 2]) < 0) {
      operator delete((void *)v23[kk]);
    }
  }

  sub_10000DD24(&v17, "-s <service>");
  sub_10000DD24(v19, "[-a <app-id>]");
  sub_10000DD24(v20, "[-d <domain>]");
  sub_10000DD24(&v21, "-k <key>");
  sub_10000DD24(v22, "-v <value>");
  sub_10000DD24(v23, "[-j]");
  sub_10000DD24(v24, "[-p]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0xA8uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 168;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, &v25, (char *)v25);
  sub_100011B58( "write-settings",  (uint64_t)"Writes settings.\nSpecify -j to interpret <value> as JSON or -p to interpret <value> as a plist.",  (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (muint64_t m = 0LL; mm != -21; mm -= 3LL)
  {
    if (SHIBYTE(v24[mm + 2]) < 0) {
      operator delete((void *)v24[mm]);
    }
  }

  sub_10000DD24(&v17, "-u <url>");
  sub_10000DD24(v19, "-j <JSON-or-path>");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v20, (char *)v25);
  sub_100011B58("match", (uint64_t)"Test a pattern-matching dictionary against a URL.", (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (nuint64_t n = 0LL; nn != -6; nn -= 3LL)
  {
    if (SHIBYTE(v19[nn + 2]) < 0) {
      operator delete((void *)v19[nn]);
    }
  }

  sub_10000DD24(&v25, "-e <enabled>");
  __int128 v17 = 0uLL;
  uint64_t v18 = 0LL;
  *(void *)&__int128 v17 = operator new(0x18uLL);
  uint64_t v18 = v17 + 24;
  *((void *)&v17 + 1) = sub_100011FEC(&v25, &v27, (char *)v17);
  sub_100011B58("developer-mode", (uint64_t)"Enable or disable developer mode.", (uint64_t *)&v17);
  id v16 = (void **)&v17;
  sub_100011F74(&v16);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)v25);
  }
  sub_10000DD24(&v17, "[-p]");
  sub_10000DD24(v19, "[-z <time-zone>]");
  __int128 v25 = 0uLL;
  uint64_t v26 = 0LL;
  *(void *)&__int128 v25 = operator new(0x30uLL);
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100011FEC(&v17, (__int128 *)v20, (char *)v25);
  sub_100011B58( "get-tdi-epoch",  (uint64_t)"Gets the epoch (last-changed timestamp) of SWC's tracking domain info. Pass -p for a POSIX timestamp.",  (uint64_t *)&v25);
  id v16 = (void **)&v25;
  sub_100011F74(&v16);
  for (uint64_t i1 = 0LL; i1 != -6; i1 -= 3LL)
  {
    if (SHIBYTE(v19[i1 + 2]) < 0) {
      operator delete((void *)v19[i1]);
    }
  }

void sub_100011568( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)(v16 - 80) = v15;
  sub_100011F74((void ***)(v16 - 80));
  _Unwind_Resume(a1);
}

void sub_100011AF0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  _SWCLogObject(a1);
}

void sub_100011B44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100011B58(char *__s, uint64_t a2, uint64_t *a3)
{
  if (v32 < 0) {
    operator delete(__p[0]);
  }
  if (v35[64]
    && v35[56]
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs")),
        unsigned __int8 v6 = [v5 isAppleInternal],
        v5,
        (v6 & 1) == 0))
  {
    sub_1000138B4((uint64_t)v35);
  }

  else
  {
    sub_1000138B4((uint64_t)v35);
    fputc(32, __stderrp);
    fputc(32, __stderrp);
    sub_100011AF0((uint64_t)__stderrp);
    uint64_t v8 = *a3;
    for (uint64_t i = a3[1]; v8 != i; v8 += 24LL)
    {
      fputc(32, __stderrp);
      sub_100011AF0((uint64_t)__stderrp);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    fputc(10, __stderrp);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v18 componentsSeparatedByString:@"\n"]);
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v9)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        id v21 = v9;
        for (uint64_t j = 0LL; j != v21; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
          fputs("   ", __stderrp);
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@" "]);
          id v12 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v24;
            do
            {
              for (uint64_t k = 0LL; k != v12; uint64_t k = (char *)k + 1)
              {
                if (*(void *)v24 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)k);
                fputc(32, __stderrp);
                if ([v15 hasPrefix:@"<"]
                  && [v15 hasSuffix:@">"]
                  || [v15 hasPrefix:@"-"])
                {
                  uint64_t v16 = __stderrp;
                  [v15 UTF8String];
                  sub_100011AF0((uint64_t)v16);
                }

                else
                {
                  __int128 v17 = (const char *)[v15 UTF8String];
                  fputs(v17, __stderrp);
                }
              }

              id v12 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
            }

            while (v12);
          }

          fputc(10, __stderrp);
        }

        id v9 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }

      while (v9);
    }

    fputc(10, __stderrp);
  }

void sub_100011EF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *__p, uint64_t a32, int a33, __int16 a34, char a35, char a36)
{
  sub_1000138B4(v37 - 168);
  _Unwind_Resume(a1);
}

void sub_100011F74(void ***a1)
{
  os_log_t v1 = *a1;
  id v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
      }

      while (v4 != v2);
      id v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

char *sub_100011FEC(__int128 *a1, __int128 *a2, char *__dst)
{
  if (a1 != a2)
  {
    id v5 = a1;
    do
    {
      if (*((char *)v5 + 23) < 0)
      {
        sub_10001205C(__dst, *(void **)v5, *((void *)v5 + 1));
      }

      else
      {
        __int128 v6 = *v5;
        *((void *)__dst + 2) = *((void *)v5 + 2);
        *(_OWORD *)__dst = v6;
      }

      id v5 = (__int128 *)((char *)v5 + 24);
      __dst += 24;
    }

    while (v5 != a2);
  }

  return __dst;
}

void *sub_10001205C(_BYTE *__dst, void *__src, unint64_t a3)
{
  id v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    id v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void *sub_1000120EC(uint64_t a1)
{
  result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_100028AF8;
  result[1] = v3;
  return result;
}

uint64_t sub_100012120(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_100028AF8;
  a2[1] = v2;
  return result;
}

uint64_t sub_10001213C(uint64_t a1, unsigned int *a2, void *a3)
{
  return (*(uint64_t (**)(void, void))(a1 + 8))(*a2, *a3);
}

uint64_t sub_10001214C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000100020749LL
    || ((v3 & 0x8000000100020749LL & 0x8000000000000000LL) != 0LL) != __OFSUB__(v3, 0x8000000100020749LL)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000100020749LL & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

_UNKNOWN **sub_1000121B0()
{
  return &off_100028B78;
}

void sub_1000121BC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error adding all apps: %s\n", v4);
  exit(1);
}

void sub_100012204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012214(void *a1)
{
  id v1 = a1;
  if (byte_10002E85B)
  {
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    -[NSMutableString appendFormat:](v2, "appendFormat:", @"%@ %lli {", v3, [v1 code]);

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
    id v5 = [v4 count];

    if (v5)
    {
      v17[0] = 0LL;
      v17[1] = v17;
      v17[2] = 0x2020000000LL;
      char v18 = 1;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100012648;
      v14[3] = &unk_100028C20;
      uint64_t v16 = v17;
      uint64_t v7 = v2;
      uint64_t v15 = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:v14];

      -[NSMutableString appendString:](v7, "appendString:", @"\n}");
      _Block_object_dispose(v17, 8);
    }

    else
    {
      -[NSMutableString appendString:](v2, "appendString:", @" }");
    }

    unsigned int v11 = v2;
    id v12 = -[NSMutableString UTF8String](v11, "UTF8String");
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
    unsigned int v9 = [v8 isAppleInternal];

    if (v9) {
      id v10 = objc_claimAutoreleasedReturnValue([v1 description]);
    }
    else {
      id v10 = objc_claimAutoreleasedReturnValue([v1 localizedDescription]);
    }
    id v12 = [v10 UTF8String];
  }

  return v12;
}

void sub_1000123E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012460(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v6 = a3;
  if (!v3)
  {
    uint64_t v4 = __stderrp;
    id v5 = (const char *)sub_100012214(v6);
    fprintf(v4, "Error adding all apps: %s\n", v5);
    exit(1);
  }

  fwrite("Added all apps.\n", 0x10uLL, 1uLL, __stdoutp);
}

void sub_1000124E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSMutableDictionary *sub_1000124FC(int a1, char *const *a2, const char *a3)
{
  uint64_t v6 = objc_autoreleasePoolPush();
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  while (1)
  {
    int v8 = getopt(a1, a2, a3);
    if (v8 == -1) {
      break;
    }
    if (v8 == 63) {
      sub_10000D354();
    }
    __int16 v13 = v8;
    unsigned int v9 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  &v13,  1LL);
    id v10 = v9;
    if (optarg)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
      if (!v10) {
        goto LABEL_12;
      }
    }

    else
    {
      unsigned int v11 = &__kCFBooleanTrue;
      if (!v9) {
        goto LABEL_12;
      }
    }

    if (!v11) {
LABEL_12:
    }
      sub_10000D354();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, v10);
  }

  objc_autoreleasePoolPop(v6);
  return v7;
}

void sub_100012614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012648(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 debugDescription]);
  [v6 appendFormat:@"\n\t%@: %@", v8, v7];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
}

void sub_1000126F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

_SWCServiceSpecifier *sub_100012714(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc(&OBJC_CLASS____SWCServiceSpecifier);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"s"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"a"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"d"]);
  uint64_t v6 = -[_SWCServiceSpecifier initWithServiceType:applicationIdentifier:domain:]( v2,  "initWithServiceType:applicationIdentifier:domain:",  v3,  v4,  v5);

  return v6;
}

void sub_1000127C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000127FC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error adding app: %s\n", v4);
  exit(1);
}

void sub_100012844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012854(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  id v5 = *(void **)(a1 + 32);
  if (!a2)
  {
    id v8 = __stderrp;
    id v9 = objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
    id v10 = (const char *)[v9 UTF8String];
    unsigned int v11 = (const char *)sub_100012214(v12);
    fprintf(v8, "Error adding app %s: %s\n", v10, v11);

    exit(1);
  }

  uint64_t v6 = __stdoutp;
  id v7 = objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
  fprintf(v6, "Added app %s.\n", (const char *)[v7 UTF8String]);
}

void sub_100012920( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100012944(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v6 = a4;
  if (!v11)
  {
    id v9 = __stderrp;
    id v10 = (const char *)sub_100012214(v6);
    fprintf(v9, "%s\n", v10);
    exit(1);
  }

  id v7 = __stdoutp;
  id v8 = objc_claimAutoreleasedReturnValue([v11 description]);
  fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100012A08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012A2C(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (!a2)
  {
    id v5 = __stderrp;
    id v6 = (const char *)sub_100012214(v7);
    fprintf(v5, "%s\n", v6);
    exit(1);
  }

  fwrite("SUCCESS\n", 8uLL, 1uLL, __stdoutp);
  sleep(1u);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100012AC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100012ADC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error adding app: %s\n", v4);
  exit(1);
}

void sub_100012B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012B34(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  id v5 = *(void **)(a1 + 32);
  if (!a2)
  {
    id v8 = __stderrp;
    id v9 = objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
    id v10 = (const char *)[v9 UTF8String];
    id v11 = (const char *)sub_100012214(v12);
    fprintf(v8, "Error removing app %s: %s\n", v10, v11);

    exit(1);
  }

  id v6 = __stdoutp;
  id v7 = objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
  fprintf(v6, "Removed app %s.\n", (const char *)[v7 UTF8String]);
}

void sub_100012C00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100012C24(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error setting service options: %s\n", v4);
  exit(1);
}

void sub_100012C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012C7C(void *a1, objc_class *a2)
{
  id v3 = a1;
  id v15 = 0LL;
  uint64_t v4 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v3,  1LL,  &v15);
  id v5 = v15;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](&OBJC_CLASS___SWCSecurityGuard, "sharedSecurityGuard"));
    id v14 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 JSONObjectWithSignedJSONData:v4 error:&v14]);
    id v8 = v5;
    id v5 = v14;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
    if (!v6)
    {
      id v12 = __stderrp;
      __int16 v13 = (const char *)sub_100012214(v5);
      fprintf(v12, "Error reading JSON file: %s\n", v13);
      exit(1);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](&OBJC_CLASS___SWCSecurityGuard, "sharedSecurityGuard"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 JSONObjectWithSignedJSONData:v6 error:0]);
  }

  if (!v7)
  {
    id v10 = __stderrp;
    sub_100012214(v5);
    fprintf(v10, "Error parsing JSON: %s\n");
    goto LABEL_11;
  }

  if (a2 && (objc_opt_isKindOfClass(v7, a2) & 1) == 0)
  {
    id v11 = __stderrp;
    class_getName(a2);
    fprintf(v11, "Supplied JSON was decoded to the wrong class. Expected to decode to %s.\n");
LABEL_11:
    exit(1);
  }

  return v7;
}

void sub_100012E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012E80(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    uint64_t v4 = __stderrp;
    id v5 = (const char *)sub_100012214(v6);
    fprintf(v4, "Error setting service details: %s\n", v5);
    exit(1);
  }

  fwrite("Set service details.\n", 0x15uLL, 1uLL, __stdoutp);
}

void sub_100012F08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100012F1C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    uint64_t v4 = __stderrp;
    id v5 = (const char *)sub_100012214(v6);
    fprintf(v4, "Error setting service flags: %s\n", v5);
    exit(1);
  }

  fwrite("Set user approval state.\n", 0x19uLL, 1uLL, __stdoutp);
}

void sub_100012FA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100012FB8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error showing SWC state: %s\n", v4);
  exit(1);
}

void sub_100013000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013014(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = __stderrp;
  uint64_t v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error resetting swcd: %s", v4);
  exit(1);
}

void sub_10001305C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001306C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    uint64_t v4 = __stderrp;
    id v5 = (const char *)sub_100012214(v6);
    fprintf(v4, "Error resetting swcd: %s\n", v5);
    exit(1);
  }

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
  fwrite("Reset swcd.\n", 0xCuLL, 1uLL, __stdoutp);
}

void sub_100013104( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100013118(void *a1, void *a2)
{
  id v3 = a1;
  id v34 = a2;
  id v33 = v3;
  id v4 = [v33 fileSystemRepresentation];
  id v5 = (char *)operator new(8uLL);
  *(void *)id v5 = v4;
  id v6 = v5 + 8;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v34;
  id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    id v9 = v5 + 8;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)i) UTF8String];
        id v12 = v11;
        if (v9 >= v6)
        {
          uint64_t v13 = (v9 - v5) >> 3;
          unint64_t v14 = v13 + 1;
          if ((v6 - v5) >> 2 > v14) {
            unint64_t v14 = (v6 - v5) >> 2;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            unint64_t v15 = (unint64_t)sub_100013518(v15);
          }
          else {
            uint64_t v16 = 0LL;
          }
          __int128 v17 = (char *)(v15 + 8 * v13);
          id v6 = (char *)(v15 + 8 * v16);
          *(void *)__int128 v17 = v12;
          char v18 = v17 + 8;
          if (v9 == v5) {
            goto LABEL_20;
          }
          do
          {
            uint64_t v19 = *((void *)v9 - 1);
            v9 -= 8;
            *((void *)v17 - 1) = v19;
            v17 -= 8;
          }

          while (v9 != v5);
          if (v5) {
LABEL_20:
          }
            operator delete(v5);
          id v5 = v17;
          id v9 = v18;
        }

        else
        {
          *(void *)id v9 = v11;
          v9 += 8;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v7);

    if (v9 < v6)
    {
      *(void *)id v9 = 0LL;
      uint64_t v20 = (char **)v5;
      goto LABEL_41;
    }
  }

  else
  {

    id v9 = v5 + 8;
  }

  uint64_t v21 = (v9 - v5) >> 3;
  unint64_t v22 = v21 + 1;
  if ((v6 - v5) >> 2 > v22) {
    unint64_t v22 = (v6 - v5) >> 2;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23) {
    unint64_t v23 = (unint64_t)sub_100013518(v23);
  }
  uint64_t v20 = (char **)(v23 + 8 * v21);
  NSString *v20 = 0LL;
  if (v9 == v5)
  {
    id v5 = v9;
  }

  else
  {
    do
    {
      __int128 v24 = (char *)*((void *)v9 - 1);
      v9 -= 8;
      *--uint64_t v20 = v24;
    }

    while (v9 != v5);
    if (!v5) {
      goto LABEL_41;
    }
  }

  operator delete(v5);
LABEL_41:
  pid_t v37 = 0;
  __int128 v25 = *v20;
  __int128 v26 = _NSGetEnviron();
  if (posix_spawn(&v37, v25, 0LL, 0LL, v20, *v26))
  {
    __int128 v30 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    id v31 = __stderrp;
    char v32 = (const char *)sub_100012214(v30);
    fprintf(v31, "Error executing helper tool: %s\n", v32);
    exit(1);
  }

  int v27 = sigblock(0x80000);
  __int128 v28 = signal(2, (void (__cdecl *)(int))1);
  __int128 v29 = signal(3, (void (__cdecl *)(int))1);
  int v36 = 0;
  waitpid(v37, &v36, 0);
  sigsetmask(v27);
  signal(2, v28);
  signal(3, v29);
  operator delete(v20);
}

void sub_100013494( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  operator delete(v13);
  _Unwind_Resume(a1);
}

void *sub_100013518(unint64_t a1)
{
  if (a1 >> 61) {
    sub_100006274();
  }
  return operator new(8 * a1);
}

void sub_10001354C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = __stderrp;
  id v4 = (const char *)sub_100012214(v2);
  fprintf(v3, "Error setting developer mode: %s\n", v4);
  exit(1);
}

void sub_100013594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000135A4(id a1, NSNumber *a2, NSError *a3)
{
  id v10 = a2;
  id v4 = a3;
  if (!v10)
  {
    uint64_t v8 = __stderrp;
    id v9 = (const char *)sub_100012214(v4);
    fprintf(v8, "Error getting developer mode: %s\n", v9);
    exit(1);
  }

  id v5 = __stdoutp;
  unsigned int v6 = -[NSNumber BOOLValue](v10, "BOOLValue");
  id v7 = "disabled";
  if (v6) {
    id v7 = "enabled";
  }
  fprintf(v5, "Developer mode is %s.\n", v7);
}

void sub_100013658( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013670(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (!a2)
  {
    if ([v10 code] == (id)3072
      && (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]),
          unsigned int v7 = [v6 isEqual:NSCocoaErrorDomain],
          v6,
          v7))
    {
      fwrite("Operation cancelled.\n", 0x15uLL, 1uLL, __stderrp);
    }

    else
    {
      uint64_t v8 = __stderrp;
      id v9 = (const char *)sub_100012214(v10);
      fprintf(v8, "Error setting developer mode: %s\n", v9);
    }

    exit(1);
  }

  if (*(_BYTE *)(a1 + 32)) {
    id v5 = "enabled";
  }
  else {
    id v5 = "disabled";
  }
  fprintf(__stdoutp, "Developer mode %s.\n", v5);
}

void sub_100013774( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

void sub_1000137F8(void ***a1)
{
  id v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (!v2) {
    return;
  }
  id v4 = (char *)v1[1];
  id v5 = **a1;
  if (v4 == v2) {
    goto LABEL_12;
  }
  do
  {
    unsigned int v6 = (char *)*((void *)v4 - 2);
    if (v4 - 40 == v6)
    {
      unsigned int v6 = v4 - 40;
      uint64_t v7 = 4LL;
    }

    else
    {
      if (!v6) {
        goto LABEL_8;
      }
      uint64_t v7 = 5LL;
    }

    (*(void (**)(void))(*(void *)v6 + 8 * v7))();
LABEL_8:
    if (*(v4 - 41) < 0) {
      operator delete(*((void **)v4 - 8));
    }
    v4 -= 64;
  }

  while (v4 != v2);
  id v5 = **a1;
LABEL_12:
  v1[1] = v2;
  operator delete(v5);
}

uint64_t sub_1000138A0()
{
  return sub_1000138B4();
}

uint64_t sub_1000138B4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 64)) {
    return a1;
  }
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2 == (void *)(a1 + 24))
  {
    uint64_t v3 = 4LL;
    uint64_t v2 = (void *)(a1 + 24);
  }

  else
  {
    if (!v2) {
      goto LABEL_7;
    }
    uint64_t v3 = 5LL;
  }

  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_7:
  return a1;
}

unint64_t sub_10001391C(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9LL * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127LL * (v22 + v20) - 0x651E95C4D06FBFB1LL * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9LL * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }

    unint64_t v4 = 0x9DDFEA08EB382D69LL;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69LL
        * (v34 ^ ((0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69LL * (v40 ^ (v40 >> 47));
    unint64_t v42 = v32 + v35 + v36 + a2;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297LL * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v34 + v37 + v45;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    id v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0LL);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273LL * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273LL * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v58 + v56 + v67 + v57;
      uint64_t v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64LL;
    }

    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297LL
        * ((0x9DDFEA08EB382D69LL
          * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69LL * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69LL
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297LL
                * ((0x9DDFEA08EB382D69LL
                  * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69LL * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69LL * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }

  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273LL * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69LL;
    unint64_t v30 = 0x9DDFEA08EB382D69LL * ((v28 - 0x3C5A37A36834CED9LL * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69LL * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }

  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69LL;
      unint64_t v73 = 0x9DDFEA08EB382D69LL * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }

    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }

  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69LL
        * ((0x9DDFEA08EB382D69LL
          * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69LL * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_100013D50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1LL;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }

  while (v13 && v12);
  return v14;
}

void sub_100013DF0(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }

    else
    {
      uint64_t v13 = 1LL << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }

    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0LL;
      return;
    }
  }

  if (prime >> 61) {
    sub_100006274();
  }
  int v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0LL;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0LL;
  while (prime != v7);
  int v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }

    else
    {
      v9 &= prime - 1;
    }

    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    BOOL v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }

        else
        {
          v15 &= prime - 1;
        }

        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }

          void *v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          BOOL v14 = v8;
        }

        size_t v15 = v9;
LABEL_31:
        int v8 = v14;
        BOOL v14 = (void *)*v14;
        size_t v9 = v15;
      }

      while (v14);
    }
  }

void sub_100013FE8(char a1, void **__p)
{
  if (a1)
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t sub_100014034(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_10001482C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001483C(id a1)
{
  id v1 = -[SWCDatabase _initShared](objc_alloc(&OBJC_CLASS___SWCDatabase), "_initShared");
  uint64_t v2 = (void *)qword_10002E860;
  qword_10002E860 = (uint64_t)v1;
}

void sub_10001488C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014B08(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    [v2 saveReturningError:0];
    sub_10001936C((dispatch_source_t *)(*(void *)(a1 + 32) + 24LL));
  }

void sub_100014BB8(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int8x8_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("SWC database queue", v4);
  uint64_t v3 = (void *)qword_10002E870;
  qword_10002E870 = (uint64_t)v2;
}

void sub_100014C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

void sub_100014F8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000150D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000151AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001522C(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([a2 domain]);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void sub_1000152C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100015360( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015438( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100015458(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015468(uint64_t a1)
{
}

void sub_100015470(uint64_t a1, id obj, _BYTE *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7) {
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) isWildcard])
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue([obj domain]);
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue([v16 host]);
    id v10 = [v9 length];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain]);
    uint8x8_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 host]);
    if (v10 <= [v12 length])
    {
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([obj domain]);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain]);
      unsigned int v15 = [v13 encompassesDomain:v14];

      if (v15)
      {
        uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
LABEL_6:
        objc_storeStrong(v6, obj);
      }
    }
  }

  else
  {
    *a3 = 1;
  }

void sub_1000155DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000156B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015ACC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100015B04(uint64_t a1, void *a2)
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
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v10 patterns]);
    [v6 setPatterns:v8];
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 substitutionVariables]);
    [v6 setSubstitutionVariables:v9];
  }

void sub_100015C24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *a31)
{
  _Unwind_Resume(a1);
}

void sub_100015F78(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceType]);
  LODWORD(v4) = [v4 isEqual:v5];

  if ((_DWORD)v4) {
    [*(id *)(a1 + 40) addObject:a2];
  }
}

void sub_100015FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001606C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016244( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
  _Unwind_Resume(a1);
}

void sub_100016294(uint64_t a1, void *a2)
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
    if (qword_10002E888 != -1) {
      dispatch_once(&qword_10002E888, &stru_100028F60);
    }
    uint64_t v7 = (os_log_s *)qword_10002E880;
    if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      size_t v9 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Will remove settings for service specifier %@ because there are no more service entries matching it",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 40) addObject:a2];
  }

LABEL_21:
  return v9;
}

void sub_100016668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100016E78(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
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

void sub_100017300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017454( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100017538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001760C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000176C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017828( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  uint64_t v20 = v19;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100017864(uint64_t a1)
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
      if (qword_10002E888 != -1) {
        dispatch_once(&qword_10002E888, &stru_100028F60);
      }
      uint64_t v5 = (os_log_s *)qword_10002E880;
      if (os_log_type_enabled((os_log_t)qword_10002E880, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error saving SWC database: %@",  buf,  0xCu);
      }
    }
  }
}

void sub_10001796C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017E58(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "db");
  dispatch_queue_t v2 = (void *)qword_10002E880;
  qword_10002E880 = (uint64_t)v1;
}

void sub_100017EC8(id a1)
{
  id v1 = -[SWCSecurityGuard _init](objc_alloc(&OBJC_CLASS___SWCSecurityGuard), "_init");
  dispatch_queue_t v2 = (void *)qword_10002E890;
  qword_10002E890 = (uint64_t)v1;
}

void sub_100017F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000181D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

LABEL_17:
  return v11;
}

void sub_100018470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018868( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

LABEL_13:
  return (optional<SecTrustResultType>)(v17.var0.var0 | ((v13 & 0xFFFFFF) << 8) | v18);
}

void sub_100018C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_100019038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000190DC(id a1)
{
  os_log_t v1 = os_log_create((const char *)&_SWCLogSubsystem, "security");
  dispatch_queue_t v2 = (void *)qword_10002E8A0;
  qword_10002E8A0 = (uint64_t)v1;
}

void sub_10001910C(dispatch_object_t *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_unfair_lock_lock(&stru_10002E8B0);
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
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void scheduleTimerNoLock(SWCTimer &, const SWCTimerSettings *, void (^__strong)())"));
      [v20 handleFailureInFunction:v21 file:@"SWCTimer.mm" lineNumber:51 description:@"Unexpected failure to allocate a libdispatch timer source"];
    }
  }

  dispatch_source_set_timer((dispatch_source_t)*a1, v12, v13, (unint64_t)(v9 * 1000000000.0));
  id v16 = (dispatch_source_s *)*a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3321888768LL;
  v22[2] = sub_1000193B4;
  void v22[3] = &unk_100028FC8;
  id v23 = v6;
  uint64_t v24 = v13;
  unint64_t v25 = a1;
  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  unint64_t v29 = v10;
  id v30 = v11;
  id v17 = v6;
  uint64_t v18 = v10;
  id v19 = v11;
  dispatch_source_set_event_handler(v16, v22);
  dispatch_resume(*a1);

  os_unfair_lock_unlock(&stru_10002E8B0);
}

void sub_100019338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001936C(dispatch_source_t *a1)
{
  if (*a1)
  {
    dispatch_source_cancel(*a1);
    dispatch_source_t v2 = *a1;
    *a1 = 0LL;
  }

  os_unfair_lock_unlock(&stru_10002E8B0);
}

void sub_1000193B4(uint64_t a1)
{
  if (*(void *)(a1 + 40) == -1LL) {
    sub_10001936C(*(dispatch_source_t **)(a1 + 48));
  }
}

id sub_1000193F8(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(void *)(a1 + 80) = *(id *)(a2 + 80);
  id result = *(id *)(a2 + 88);
  *(void *)(a1 + 88) = result;
  return result;
}

void sub_100019440(uint64_t a1)
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