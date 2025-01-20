void sub_100004A40(id a1)
{
  id v1;
  os_log_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  v1 = PLLogSignpostReader();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000A93C(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  v10 = dispatch_time(0LL, 60000000000LL);
  dispatch_after(v10, &_dispatch_main_q, &stru_100010348);
}

void sub_100004AA8(id a1)
{
  id v1 = PLLogSignpostReader();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Requesting exit in invalidation handler...",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = getpid();
  id v4 = PLLogSignpostReader();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A9A8(v3, v5, v6, v7, v8, v9, v10, v11);
  }

  proc_disable_cpumon(v3);
  NSLog(@"In the main of the XPCSignpostReader Service");
  v12 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v13 setDelegate:v12];
  [v13 resume];

  return 5000;
}

void sub_100004BB0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_13:
    v11->hitchDuration = 0.0;
    v11->animationDuration = 0.0;
    goto LABEL_14;
  }

LABEL_15:
  return v11;
}

double sub_100004EBC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double result = *(double *)(v4 + 48) + (float)(v3 * 1000.0);
  *(double *)(v4 + 48) = result;
  return result;
}

double sub_1000051C8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double result = *(double *)(v4 + 48) + (float)(v3 * 1000.0);
  *(double *)(v4 + 48) = result;
  return result;
}

void sub_1000055D0(id a1)
{
  id v1 = PLLogSignpostReader();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)float v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM handler invoked!", v3, 2u);
  }

  exit(0);
}

id PLLogSignpostReader()
{
  if (qword_100015468 != -1) {
    dispatch_once(&qword_100015468, &stru_1000103B0);
  }
  return (id)qword_100015460;
}

void sub_10000566C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PerfPowerServicesSignpostReader", "");
  v2 = (void *)qword_100015460;
  qword_100015460 = (uint64_t)v1;
}

LABEL_12:
}

LABEL_11:
}

void sub_100006634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

float sub_10000664C(uint64_t a1, void *a2)
{
  float result = v3 * 1000.0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += (unint64_t)result;
  return result;
}

LABEL_27:
}

LABEL_8:
}
}
}

LABEL_20:
}

uint64_t sub_100007650(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_100007670(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_100007690(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void sub_10000774C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v6]);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100007898;
  v14 = &unk_100010478;
  id v15 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v11];

  v16[0] = @"appSignpostDurations";
  v16[1] = @"appSignpostMetrics";
  v17[0] = v5;
  v17[1] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL,  v11,  v12,  v13,  v14));
  [*(id *)(a1 + 40) setObject:v10 forKey:v6];
}

void sub_100007898(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 getMetricDictionary]);
  [v4 setObject:v6 forKey:v5];
}

void sub_100007DC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = v5;
      id v10 = v6;
      if ([v10 count])
      {
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          id v21 = v10;
          id v22 = v6;
          id v23 = v5;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
              uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
              {
                [*(id *)(a1 + 32) addSubsystem:v9 category:v16];
                id v18 = PLLogSignpostReader();
                v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  id v29 = v9;
                  __int16 v30 = 2112;
                  uint64_t v31 = v16;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "adding %@,%@ to signpost allowlist",  buf,  0x16u);
                }
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v13);
          id v6 = v22;
          id v5 = v23;
          id v10 = v21;
        }
      }

      else
      {
        [*(id *)(a1 + 32) addSubsystem:v9 category:0];
        id v20 = PLLogSignpostReader();
        id v11 = (id)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
          sub_10000AEF4();
        }
      }
    }
  }
}

void sub_100008274( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000082A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000082B0(uint64_t a1)
{
}

void sub_1000082B8(uint64_t a1, void *a2)
{
  id v8 = a2;
  float v3 = (void *)objc_claimAutoreleasedReturnValue([v8 argument]);
  unsigned int v4 = [v3 type];

  if (v4 == 3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 placeholderTokens]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100008380;
    v9[3] = &unk_1000104F0;
    uint64_t v11 = *(void *)(a1 + 32);
    id v6 = v8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v6;
    uint64_t v12 = v7;
    [v5 enumerateObjectsUsingBlock:v9];
  }
}

void sub_100008380(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v13 = a2;
  unsigned int v6 = [v13 containsString:@"name="];
  uint64_t v7 = v13;
  if (v6)
  {
    if ([v13 isEqualToString:@"name=sx"])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) argument]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 argumentObject]);
      uint64_t v10 = *(void *)(a1 + 40);
    }

    else
    {
      if (![v13 isEqualToString:@"name=sy"])
      {
LABEL_7:
        *a4 = 1;
        uint64_t v7 = v13;
        goto LABEL_8;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) argument]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 argumentObject]);
      uint64_t v10 = *(void *)(a1 + 48);
    }

    uint64_t v11 = *(void *)(v10 + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v9;

    goto LABEL_7;
  }

void sub_100008E78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_100008EBC(uint64_t a1, uint64_t a2)
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) signpostIntervalData:a2 forTaskingConfig:*(void *)(a1 + 40)]);
  [*(id *)(a1 + 48) addObject:v3];
  if ((unint64_t)[*(id *)(a1 + 48) count] >= 0xC8) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "writeSignpostFile:withOrder:withData:",  *(void *)(a1 + 56),  *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8)
  }
                                                                                                  + 24LL),
                                                                                  *(void *)(a1 + 48));

  return 1LL;
}

void sub_10000A4A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000A4E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PLLogSignpostReader();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000B5BC();
  }

  if (v6)
  {
    id v9 = PLLogSignpostReader();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000B55C();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  }

  id v11 = PLLogSignpostReader();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
    int v17 = 138412290;
    id v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Remove after upload completion: %@",  (uint8_t *)&v17,  0xCu);
  }

  [*(id *)(a1 + 40) removeFile:*(void *)(a1 + 48)];
  id v14 = PLLogSignpostReader();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void **)(a1 + 32);
    int v17 = 138412290;
    id v18 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Finished iCloud upload for %@",  (uint8_t *)&v17,  0xCu);
  }
}

void sub_10000A86C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000A87C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_10000A8A4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000A8C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000A900(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "'signpost_reader_idle_exit' feature flag enabled, setting event handlers for incoming connection...",  v1,  2u);
  sub_100004BC0();
}

void sub_10000A93C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A9A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AA0C()
{
}

void sub_10000AA6C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 endEvent]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 number1Value]);
  sub_10000A8D0();
  sub_10000A8A4((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ Launch", v7, v8, v9, v10, v11);

  sub_10000A888();
}

void sub_10000AB10(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 endEvent]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 string2Value]);
  [v4 isEqualToString:@"YES"];
  sub_10000A8A4((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ Extended Launch", v7, v8, v9, v10, 2u);

  sub_10000A888();
}

void sub_10000ABE8(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 endEvent]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 number1Value]);
  sub_10000A8D0();
  sub_10000A8A4((void *)&_mh_execute_header, v5, v6, "Process: %@ is a %@ activation", v7, v8, v9, v10, v11);

  sub_10000A888();
}

void sub_10000AC8C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 endEvent]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 processName]);
  sub_10000A898();
  sub_10000A87C((void *)&_mh_execute_header, a2, v5, "Process: %@ is an App Resume", v6);

  sub_10000A888();
}

void sub_10000AD20(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 endEvent]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 processName]);
  sub_10000A898();
  sub_10000A87C((void *)&_mh_execute_header, a2, v5, "Process: %@ is an App Hang", v6);

  sub_10000A888();
}

void sub_10000ADB4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 beginEvent]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
  sub_10000A8E8();
  sub_10000A8A4((void *)&_mh_execute_header, v3, v4, "Got signpostInterval (%@) : %@", v5, v6, v7, v8, v9);

  sub_10000A888();
}

void sub_10000AE44(void *a1, os_log_s *a2)
{
  if (a1)
  {
    id v2 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
    [v2 UTF8String];
  }

  sub_10000A898();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "## Unable to serialize to %s", v5, 0xCu);
  if (a1) {

  }
  sub_10000A888();
}

void sub_10000AEF4()
{
}

void sub_10000AF54()
{
  sub_10000A86C((void *)&_mh_execute_header, v0, v1, "\t uuid = %@", v2, v3, v4, v5, v6);
  sub_10000A8B8();
}

void sub_10000AFB4()
{
  sub_10000A86C((void *)&_mh_execute_header, v0, v1, "\t allowlist = %@", v2, v3, v4, v5, v6);
  sub_10000A8B8();
}

void sub_10000B014()
{
  sub_10000A86C((void *)&_mh_execute_header, v0, v1, "\t endDate = %@", v2, v3, v4, v5, v6);
  sub_10000A8B8();
}

void sub_10000B074()
{
  sub_10000A86C((void *)&_mh_execute_header, v0, v1, "\t startDate = %@", v2, v3, v4, v5, v6);
  sub_10000A8B8();
}

void sub_10000B0D4()
{
  sub_10000A86C((void *)&_mh_execute_header, v0, v1, "\t tagConfig = %@", v2, v3, v4, v5, v6);
  sub_10000A8B8();
}

void sub_10000B134()
{
}

void sub_10000B194()
{
}

void sub_10000B1F4(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"Category"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"Name"]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"EndProcessName"]);
  if (v6) {
    uint64_t v7 = @"EndProcessName";
  }
  else {
    uint64_t v7 = @"BeginProcessName";
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:v7]);
  int v9 = 138412802;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Got signpostInterval %@_%@: %@",  (uint8_t *)&v9,  0x20u);
}

void sub_10000B318(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000A8E8();
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to create tag file: %@ (%@)",  v5,  0x16u);

  sub_10000A888();
}

void sub_10000B3A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "No signpost file to create tag file.",  v1,  2u);
}

void sub_10000B3E8()
{
}

void sub_10000B448(uint64_t a1, void *a2, os_log_s *a3)
{
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  id v8 = [a2 code];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Could not remove %@.Error [%ld] %@ ",  (uint8_t *)&v5,  0x20u);
}

void sub_10000B4FC()
{
}

void sub_10000B55C()
{
}

void sub_10000B5BC()
{
}

id objc_msgSend_createSignpostFile_withStartDate_withEndDate_withallowlist_withTagConfig_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSignpostFile:withStartDate:withEndDate:withallowlist:withTagConfig:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}