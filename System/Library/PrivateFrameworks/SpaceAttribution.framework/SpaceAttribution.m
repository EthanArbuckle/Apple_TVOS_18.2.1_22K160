void sub_1000056E0(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B90(id a1)
{
  v1 = (void *)qword_10005A9D0;
  qword_10005A9D0 = (uint64_t)&off_10004FCD8;
}

void sub_100006468(id a1)
{
  v1 = (void *)qword_10005A9E0;
  qword_10005A9E0 = (uint64_t)&off_10004FBA0;
}

LABEL_55:
            v72 = SALog(v69);
            v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
              sub_10002EDB0(v73, v74, v75, v76, v77, v78, v79, v80);
            }

            v97[2](v97, v68);
            v81 = v103;
LABEL_58:

LABEL_59:
            v64 = obj;
            objc_sync_exit(obj);
            goto LABEL_60;
          }

          v71 = objc_alloc(&OBJC_CLASS___NSError);
          v116 = NSLocalizedFailureReasonErrorKey;
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The provided paths contain overlapping paths or they overlap with existing paths."));
          v117 = v52;
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
          v54 = -[NSError initWithDomain:code:userInfo:]( v71,  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  17LL,  v53);
        }
      }

      v68 = v54;

      v30 = v103;
      if (v68) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }

  v55 = SALog(v14);
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    sub_10002ED40(v56, v57, v58, v59, v60, v61, v62, v63);
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1024LL,  0LL));
  v97[2](v97, v64);
LABEL_60:
}

void sub_100006E58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_100006EE8(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = SALog(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) url]);
      v12 = @"shared";
      int v13 = 138412802;
      v14 = v11;
      __int16 v15 = 2112;
      if (a3) {
        v12 = @"exclusive";
      }
      v16 = v6;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "New url %@ is already registered to bundle %@ as %@",  (uint8_t *)&v13,  0x20u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) url]);
    [v9 addObject:v10];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

void sub_100007478( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1000077F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t sub_10000782C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000783C(uint64_t a1)
{
}

uint64_t sub_100007844(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getAppCacheSize:1];
  [v3 tempSize:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleRecords]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 groupContainerIdentifiers]);
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v8);
        id v10 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        objc_sync_enter(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9]);
        BOOL v12 = v11 == 0LL;

        if (v12)
        {
          int v13 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKeyedSubscript:v9];
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9]);
        [v14 addObject:v3];

        objc_sync_exit(v10);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);
  }

  id v15 = *(id *)(a1 + 32);
  objc_sync_enter(v15);
  [*(id *)(a1 + 32) addObject:v3];
  objc_sync_exit(v15);

  return 1LL;
}

void sub_100007A54(_Unwind_Exception *a1)
{
}

uint64_t sub_100007A74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v25 = a1;
  v26 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v5]);
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v31 + 1) + 8LL * (void)v11);
        objc_sync_enter(v12);
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedURLs]);
        unsigned __int8 v14 = [v13 containsObject:v6];

        if ((v14 & 1) == 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedURLs]);
          [v15 addObject:v6];
        }

        objc_sync_exit(v12);

        if (([v12 isPlugin] & 1) == 0)
        {
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleRecords]);
          id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v28;
            do
            {
              __int128 v19 = 0LL;
              do
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v16);
                }
                -[NSMutableSet addObject:](v7, "addObject:", *(void *)(*((void *)&v27 + 1) + 8LL * (void)v19));
                __int128 v19 = (char *)v19 + 1;
              }

              while (v17 != v19);
              id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }

            while (v17);
          }
        }

        v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v9);
  }

  LOBYTE(v24) = 1;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[SAAppPath appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( &OBJC_CLASS___SAAppPath,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v7,  v26,  v6,  0LL,  0LL,  0LL,  v24));
  __int128 v21 = v20;
  if (v20)
  {
    [v20 getAppCacheSize:1];
    [v21 tempSize:1];
    id v22 = *(id *)(v25 + 32);
    objc_sync_enter(v22);
    [*(id *)(v25 + 32) addObject:v21];
    objc_sync_exit(v22);
  }

  return 1LL;
}

void sub_100007D30(_Unwind_Exception *a1)
{
}

void sub_100007F68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_100007F8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      uint64_t v7 = SALog(v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002F1FC();
      }
    }
  }

  else
  {
    uint64_t v9 = SALog(0LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      id v12 = "+[SAHelper getOVPFileAndVolumeSize]_block_invoke";
      __int16 v13 = 2112;
      unsigned __int8 v14 = @"/private/var/.overprovisioning_file";
      __int16 v15 = 2048;
      uint64_t v16 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: File %@ size %llu",  (uint8_t *)&v11,  0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += a2;
  }
}

void sub_100008374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_1000083C0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), a4);
    uint64_t v10 = SALog(v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002F37C((uint64_t)a1, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  else
  {
    uint64_t v18 = SALog(0LL);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = a1[4];
      int v22 = 136315650;
      v23 = "-[SAHelper computeSizeOfSystemVolume:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      __int16 v26 = 2048;
      uint64_t v27 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: Volume %@ used size %llu",  (uint8_t *)&v22,  0x20u);
    }

    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) += a2;
    uint64_t v21 = *(void *)(a1[6] + 8LL);
    if (!*(void *)(v21 + 24)) {
      *(void *)(v21 + 24) = a3;
    }
  }
}

void sub_100008894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000088D4(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), obj);
}

void sub_100008C38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008C50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008C60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100008C98( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008CA8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008CB8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100008CE8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100008CF4(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -604800.0));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -43200.0));
  if (v1)
  {
    if ([v1 compare:v4] == (id)1)
    {
      uint64_t v5 = 4LL;
    }

    else if ([v1 compare:v3] == (id)1)
    {
      uint64_t v5 = 3LL;
    }

    else if ([v1 compare:v2] == (id)1)
    {
      uint64_t v5 = 2LL;
    }

    else
    {
      uint64_t v5 = 1LL;
    }
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  return v5;
}

LABEL_14:
  return v9;
}

        id v8 = 0;
        goto LABEL_15;
      }

      uint64_t v17 = [v10 containsString:@"/./"];
      if ((_DWORD)v17)
      {
        uint64_t v18 = SALog(v17);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          __int128 v30 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "Invalid path (%@) - the path contains reference to current dir.";
          goto LABEL_21;
        }

        goto LABEL_14;
      }

      uint64_t v20 = [v10 containsString:@"/../"];
      if ((_DWORD)v20)
      {
        uint64_t v21 = SALog(v20);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          __int128 v30 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "Invalid path (%@) - the path contains reference to parent dir.";
          goto LABEL_21;
        }

        goto LABEL_14;
      }

  v7[2](v7, v13, v14);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

LABEL_15:
      uint64_t v9 = (char *)v9 + 1;
    }

    while (v6 != v9);
    int v22 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    id v6 = v22;
  }

  while (v22);
LABEL_25:

  return v8 & 1;
}

LABEL_62:
  return v55;
}

LABEL_58:
  uint64_t v13 = v91;
  if (v96 && !*p_dataContainerURL && !a8)
  {
    v78 = sub_1000121D4( (const char *)[v97 UTF8String], 2, (uint64_t)objc_msgSend(v90, "platform"), (uint64_t)objc_msgSend(v96, "UTF8String"), 0, 0);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    v80 = *p_dataContainerURL;
    *p_dataContainerURL = (void *)v79;
  }

  v81 = (NSMutableSet *)[v91 mutableCopy];
  bundleRecords = v15->_bundleRecords;
  v15->_bundleRecords = v81;

  objc_storeStrong((id *)&v15->_personaUniqueString, v92);
  v15->_isDataSeparated = a7;
  v15->_isPlugin = a8;
  v15->_isGroup = a9;
  v83 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SAAppPath tempSize:](v15, "tempSize:", 0LL)));
  lastKnownTmpSize = v15->_lastKnownTmpSize;
  v15->_lastKnownTmpSize = (NSNumber *)v83;

  v85 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SAAppPath getAppCacheSize:](v15, "getAppCacheSize:", 0LL)));
  lastKnownAppCacheSize = v15->_lastKnownAppCacheSize;
  v15->_lastKnownAppCacheSize = (NSNumber *)v85;

  v15->_timestamp = nan("");
  cacheVolumePath = v15->_cacheVolumePath;
  v15->_cacheVolumePath = 0LL;

  v37 = v15;
  v38 = v95;
  v36 = v90;
LABEL_63:

  return v37;
}

id sub_10000B140(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_10000B260(id a1)
{
  v5[0] = @"com.apple.Passbook";
  if (+[SASupport targetDeviceIsIpad](&OBJC_CLASS___SASupport, "targetDeviceIsIpad")) {
    id v1 = &__kCFBooleanTrue;
  }
  else {
    id v1 = &__kCFBooleanFalse;
  }
  v6[0] = v1;
  v5[1] = @"com.apple.compass";
  if (+[SASupport targetDeviceIsIpad](&OBJC_CLASS___SASupport, "targetDeviceIsIpad")) {
    uint64_t v2 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v2 = &__kCFBooleanFalse;
  }
  v6[1] = v2;
  v6[2] = &__kCFBooleanTrue;
  v5[2] = @"com.apple.Preferences";
  v5[3] = @"com.apple.NanoPassbook";
  v6[3] = &__kCFBooleanTrue;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  4LL));
  v4 = (void *)qword_10005A9F0;
  qword_10005A9F0 = v3;
}

void sub_10000B418(id a1)
{
  v10[0] = @"com.apple.MobileSMS";
  v10[1] = @"com.apple.TapToRadar";
  v11[0] = &__kCFBooleanTrue;
  v11[1] = &__kCFBooleanTrue;
  v10[2] = @"com.apple.mobilesafari";
  v10[3] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  v11[2] = &__kCFBooleanTrue;
  v11[3] = &__kCFBooleanTrue;
  v11[4] = &__kCFBooleanTrue;
  v10[4] = @"com.apple.FileProvider.LocalStorage";
  v10[5] = @"com.apple.mobilephone";
  if (+[SASupport targetDeviceIsIpad](&OBJC_CLASS___SASupport, "targetDeviceIsIpad")) {
    id v1 = &__kCFBooleanFalse;
  }
  else {
    id v1 = &__kCFBooleanTrue;
  }
  v11[5] = v1;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = @"com.apple.Health";
  v10[7] = @"com.apple.Maps";
  v11[7] = &__kCFBooleanTrue;
  v11[8] = &__kCFBooleanTrue;
  v10[8] = @"com.apple.mobileslideshow";
  v10[9] = @"com.apple.journal";
  if (+[SASupport targetDeviceIsIpad](&OBJC_CLASS___SASupport, "targetDeviceIsIpad")) {
    uint64_t v2 = &__kCFBooleanFalse;
  }
  else {
    uint64_t v2 = &__kCFBooleanTrue;
  }
  v11[9] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.fakeapp.System" description]);
  v10[10] = v3;
  v11[10] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.fakeapp.SystemData" description]);
  v10[11] = v4;
  v11[11] = &__kCFBooleanTrue;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.fakeapp.SoftwareUpdate" description]);
  v10[12] = v5;
  v11[12] = &__kCFBooleanTrue;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.fakeapp.SyncedContent" description]);
  v10[13] = v6;
  v11[13] = &__kCFBooleanTrue;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.MobileAsset.SystemEnvironmentAsset" description]);
  v10[14] = v7;
  v11[14] = &__kCFBooleanTrue;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  15LL));
  uint64_t v9 = (void *)qword_10005AA00;
  qword_10005AA00 = v8;
}

void sub_10000B750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000B768(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B778(uint64_t a1)
{
}

void sub_10000B780(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = SALog(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002FD44(a1, (uint64_t)v5, v9);
    }
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}
}

void sub_10000CA28(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v28 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v28 uniqueURLs]);
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v9);
        int v11 = objc_autoreleasePoolPush();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path", v27));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v12,  1LL));

        uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 16LL);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        [v14 insertPath:v15];

        objc_autoreleasePoolPop(v11);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v7);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v28 sharedURLs]);
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v20);
        int v22 = objc_autoreleasePoolPush();
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v23,  1LL));

        uint64_t v25 = *(void **)(*(void *)(a1 + 32) + 16LL);
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
        [v25 insertPath:v26];

        objc_autoreleasePoolPop(v22);
        uint64_t v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v18);
  }
}

void sub_10000CD30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  if (([v6 isGroup] & 1) == 0)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "writersIDs", 0));
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          if (([v13 isEqualToString:v5] & 1) == 0
            && ([*(id *)(a1 + 32) isAppVisible:v13] & 1) == 0)
          {
            [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKeyedSubscript:v13];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v10);
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10000CFA4(_Unwind_Exception *a1)
{
}

void sub_10000D128( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000D140(uint64_t result, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

void sub_10000D204( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D21C(uint64_t a1, void *a2)
{
}

void sub_10000D608(id a1, NSString *a2, SAAppPath *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](v6, "identifier"));
    if (!v8
      || (id v9 = (void *)v8,
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](v7, "identifier")),
          id v11 = [v10 length],
          v10,
          v9,
          !v11))
    {
      uint64_t v12 = SALog(v8);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100030338();
      }

      -[SAAppPath setIdentifier:](v7, "setIdentifier:", v5);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](v7, "writersIDs"));
    if (v14)
    {
      __int128 v15 = (void *)v14;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](v7, "writersIDs"));
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray);
      char isKindOfClass = objc_opt_isKindOfClass(v16, v17);

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v20 = SALog(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000302C8();
        }

        int v22 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](v7, "writersIDs"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

        id v24 = [v23 mutableCopy];
        -[SAAppPath setWritersIDs:](v7, "setWritersIDs:", v24);
      }
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[SAAppPath uniqueURLs](v7, "uniqueURLs"));
    if (v25)
    {
      __int16 v26 = (void *)v25;
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath uniqueURLs](v7, "uniqueURLs"));
      uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
      char v29 = objc_opt_isKindOfClass(v27, v28);

      if ((v29 & 1) != 0)
      {
        uint64_t v31 = SALog(v30);
        __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100030258();
        }

        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath uniqueURLs](v7, "uniqueURLs"));
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v33));

        id v35 = [v34 mutableCopy];
        -[SAAppPath setUniqueURLs:](v7, "setUniqueURLs:", v35);
      }
    }

    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[SAAppPath sharedURLs](v7, "sharedURLs"));
    if (v36)
    {
      v37 = (void *)v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath sharedURLs](v7, "sharedURLs"));
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
      char v40 = objc_opt_isKindOfClass(v38, v39);

      if ((v40 & 1) != 0)
      {
        uint64_t v42 = SALog(v41);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_1000301E8();
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath sharedURLs](v7, "sharedURLs"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v44));

        id v46 = [v45 mutableCopy];
        -[SAAppPath setSharedURLs:](v7, "setSharedURLs:", v46);
      }
    }
  }
}

void sub_10000D910(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = a1;
  id v28 = a2;
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueURLs]);
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v12, v27));
        uint64_t v14 = (void *)v13;
        if (v13) {
          __int128 v15 = (void *)v13;
        }
        else {
          __int128 v15 = v12;
        }
        id v16 = v15;

        -[NSMutableSet addObject:](v5, "addObject:", v16);
      }

      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v9);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedURLs]);
  id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v22, v27));
        id v24 = (void *)v23;
        if (v23) {
          uint64_t v25 = (void *)v23;
        }
        else {
          uint64_t v25 = v22;
        }
        id v26 = v25;

        -[NSMutableSet addObject:](v6, "addObject:", v26);
      }

      id v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v19);
  }

  [v4 setUniqueURLs:v5];
  [v4 setSharedURLs:v6];
  [*(id *)(v27 + 32) setObject:v4 forKeyedSubscript:v28];
}

void sub_10000DEEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleRecords]);

  if (v7)
  {
    id v8 = 0LL;
    id v9 = 0LL;
  }

  else
  {
    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    [v6 setBundleRecords:v10];

    id v55 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v5,  1LL,  &v55));
    id v11 = v55;
    id v8 = v11;
    if (v11 || !v9)
    {
      uint64_t v13 = SALog(v11);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000303A8();
      }
    }

    else
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 bundleRecords]);
      -[os_log_s addObject:](v12, "addObject:", v9);
      id v8 = 0LL;
    }
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 bundleRecords]);
  id v42 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v42)
  {
    __int128 v36 = v8;
    v37 = v9;
    id v38 = v5;
    uint64_t v14 = 0LL;
    uint64_t v40 = *(void *)v52;
    uint64_t v41 = 0LL;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableSet);

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 groupContainerIdentifiers]);
        -[NSMutableSet unionSet:](v17, "unionSet:", v18);

        uint64_t v19 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
        if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
        {
          id v20 = v16;

          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          uint64_t v41 = v20;
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 applicationExtensionRecords]);
          id v22 = [v21 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v48;
            do
            {
              for (j = 0LL; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v48 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) groupContainerIdentifiers]);
                -[NSMutableSet unionSet:](v17, "unionSet:", v26);
              }

              id v23 = [v21 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }

            while (v23);
          }
        }

        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        uint64_t v14 = v17;
        id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v43,  v56,  16LL);
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v44;
          do
          {
            for (k = 0LL; k != v28; k = (char *)k + 1)
            {
              if (*(void *)v44 != v29) {
                objc_enumerationMutation(v14);
              }
              uint64_t v31 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)k);
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v31]);

              if (!v32)
              {
                __int128 v33 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
                [*(id *)(a1 + 32) setObject:v33 forKeyedSubscript:v31];
              }

              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v31]);
              [v34 addObject:v6];
            }

            id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v43,  v56,  16LL);
          }

          while (v28);
        }
      }

      id v42 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v42);

    id v9 = v37;
    id v5 = v38;
    id v8 = v36;
    __int128 v35 = v41;
  }

  else
  {
    __int128 v35 = 0LL;
  }
}

void sub_10000E5F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

uint64_t sub_10000E620(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = v6;

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 80);
  if (v7 && *(double *)(*(void *)(v8 + 8) + 24LL) > 2.0)
  {
    if ([v7 shouldDefer])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
      objc_sync_exit(v4);

      uint64_t v9 = 0LL;
      goto LABEL_24;
    }

    uint64_t v8 = *(void *)(a1 + 80);
  }

  if (*(double *)(*(void *)(v8 + 8) + 24LL) > 2.0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  objc_sync_exit(v4);

  uint64_t v13 = *(void **)(a1 + 48);
  if (v13 && *(void *)(a1 + 56))
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier", 0));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

    uint64_t v16 = 0LL;
    id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)v19)]);
          id v21 = [v20 unsignedLongLongValue];

          v16 += (uint64_t)v21;
          uint64_t v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v17);
    }

    [v3 setCacheDeletePluginSize:v16];
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  [v3 setCacheDeletePluginSize:v16];
  if (v3)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 cacheVolumePath]);

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleSet]);
      id v24 = +[SADirCacheElement newWithBundleSet:purgeable:cacheFolder:]( &OBJC_CLASS___SADirCacheElement,  "newWithBundleSet:purgeable:cacheFolder:",  v23,  0LL,  1LL);

      uint64_t v25 = *(void **)(a1 + 64);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v3 cacheVolumePath]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v26]);

      id v28 = v27;
      objc_sync_enter(v28);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 cacheDirStatsID]));
      [v28 setObject:v24 forKey:v29];

      objc_sync_exit(v28);
      [v3 setCacheVolumePath:0];
    }

    [*(id *)(a1 + 72) updateWithAppPath:v3];
  }

  uint64_t v9 = 1LL;
LABEL_24:

  return v9;
}

void sub_10000E960(_Unwind_Exception *a1)
{
}

uint64_t sub_10000E988(uint64_t a1, void *a2, void *a3)
{
  id v39 = a2;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v6;

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  if (v7 && *(double *)(*(void *)(v8 + 8) + 24LL) > 2.0)
  {
    if ([v7 shouldDefer])
    {
      uint64_t v9 = 0LL;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      goto LABEL_33;
    }

    uint64_t v8 = *(void *)(a1 + 64);
  }

  if (*(double *)(*(void *)(v8 + 8) + 24LL) > 2.0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v39]);
  int v14 = 0;
  id v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        id v19 = v18;
        objc_sync_enter(v19);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sharedURLs]);
        unsigned __int8 v21 = [v20 containsObject:v4];

        if ((v21 & 1) == 0)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 sharedURLs]);
          [v22 addObject:v4];
        }

        objc_sync_exit(v19);

        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleRecords]);
        id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v43;
          do
          {
            for (j = 0LL; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v23);
              }
              -[NSMutableSet addObject:](v13, "addObject:", *(void *)(*((void *)&v42 + 1) + 8LL * (void)j));
            }

            id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }

          while (v24);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v15);
  }

  LOBYTE(v3_Block_object_dispose((const void *)(v36 - 152), 8) = 1;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[SAAppPath appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( &OBJC_CLASS___SAAppPath,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v13,  v39,  v4,  0LL,  0LL,  0LL,  v38));
  id v28 = v27;
  if (v28)
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 cacheVolumePath]);

    if (v29)
    {
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleSet]);
      id v31 = +[SADirCacheElement newWithBundleSet:purgeable:cacheFolder:]( &OBJC_CLASS___SADirCacheElement,  "newWithBundleSet:purgeable:cacheFolder:",  v30,  0LL,  1LL);

      __int128 v32 = *(void **)(a1 + 48);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v28 cacheVolumePath]);
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v33]);

      id v35 = v34;
      objc_sync_enter(v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v28 cacheDirStatsID]));
      [v35 setObject:v31 forKey:v36];

      objc_sync_exit(v35);
      [v28 setCacheVolumePath:0];
    }

    [*(id *)(a1 + 56) updateWithAppPath:v28];
  }

  uint64_t v9 = 1LL;
LABEL_33:

  return v9;
}

void sub_10000EDD8(_Unwind_Exception *a1)
{
}

void sub_10000F00C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000F030(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
}

LABEL_11:
  return (char)v7;
}
}
}

  return v19;
}

    uint64_t v10 = 0;
    goto LABEL_12;
  }

  uint64_t v8 = SALog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = 136315138;
    id v17 = "-[SAAppSizerScan shouldDefer:activity:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s app sizer is requested to defer",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v10 = 2;
LABEL_10:

  [v6 setShouldStop:1];
LABEL_12:

  return v10;
}

void sub_10000F7BC(id a1)
{
  v10[0] = @"com.apple.MobileAddressBook";
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"/private/var/mobile/Library/Contacts/",  0LL));
  v10[1] = @"com.apple.mobilenotes";
  v11[0] = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"/private/var/mobile/Library/Notes/",  0LL));
  v11[1] = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  id v4 = (void *)qword_10005AA10;
  qword_10005AA10 = v3;

  uint64_t v8 = @"com.apple.fakeapp.SyncedContent";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"/private/var/mobile/Media/iTunes_Control/Music"));
  uint64_t v9 = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)qword_10005AA18;
  qword_10005AA18 = v6;
}

void sub_10000F8F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (SAAppPath *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v5]);
  if (!v7)
  {
    uint64_t v8 = SALog(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000304D8();
    }

    id v7 = objc_opt_new(&OBJC_CLASS___SAAppPath);
    -[SAAppPath setIdentifier:](v7, "setIdentifier:", v5);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000FA0C;
  v12[3] = &unk_10004C988;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  int v14 = v7;
  uint64_t v10 = v7;
  id v11 = v5;
  [v6 enumerateObjectsUsingBlock:v12];
  [*(id *)(a1 + 32) updateWithAppPath:v10];
}

void sub_10000FA0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 1LL));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v4));
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32LL);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000FC58;
  v20[3] = &unk_10004C960;
  id v21 = v9;
  id v11 = v8;
  id v22 = v11;
  id v12 = v3;
  id v23 = v12;
  id v24 = &v30;
  uint64_t v25 = &v26;
  id v13 = [v10 enumerateKeysAndObjectsUsingBlock:v20];
  if (!*((_BYTE *)v31 + 24))
  {
    if (!*((_BYTE *)v27 + 24)) {
      goto LABEL_9;
    }
    uint64_t v14 = SALog(v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000305B8();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) sharedURLs]);
    [v16 addObject:v11];

    if (!*((_BYTE *)v27 + 24))
    {
LABEL_9:
      uint64_t v17 = SALog(v13);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100030548();
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) uniqueURLs]);
      [v19 addObject:v11];
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void sub_10000FC2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000FC58(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned __int8 v10 = [v9 isEqualToString:a1[4]];

  if ((v10 & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueURLs]);
    unsigned int v12 = [v11 containsObject:a1[5]];

    if (v12)
    {
      uint64_t v14 = SALog(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = a1[4];
        uint64_t v23 = a1[6];
        int v26 = 136315906;
        id v27 = "-[SAAppPathList importDefaultApps]_block_invoke_2";
        __int16 v28 = 2112;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: bundle (%@) path (%@) is used as unique path for app (%@), can't add this path to our bundle.",  (uint8_t *)&v26,  0x2Au);
      }

      *a4 = 1;
      uint64_t v16 = a1[7];
LABEL_10:
      *(_BYTE *)(*(void *)(v16 + 8) + 24LL) = 1;
      goto LABEL_11;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 sharedURLs]);
    unsigned int v18 = [v17 containsObject:a1[5]];

    if (v18)
    {
      uint64_t v20 = SALog(v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = a1[4];
        uint64_t v25 = a1[6];
        int v26 = 136315906;
        id v27 = "-[SAAppPathList importDefaultApps]_block_invoke";
        __int16 v28 = 2112;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v25;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s: bundle (%@) path (%@) is used as shared path for app (%@), add this path to our bundle as shared path.",  (uint8_t *)&v26,  0x2Au);
      }

      uint64_t v16 = a1[8];
      goto LABEL_10;
    }
  }

void sub_10000FE60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000100A0;
  v23[3] = &unk_10004CA00;
  v23[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v24 = v7;
  [v6 enumerateObjectsUsingBlock:v23];
  id v8 = (SAAppPath *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v7]);
  if (!v8)
  {
    uint64_t v9 = SALog(0LL);
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100030628();
    }

    id v8 = objc_opt_new(&OBJC_CLASS___SAAppPath);
    -[SAAppPath setIdentifier:](v8, "setIdentifier:", v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath uniqueURLs](v8, "uniqueURLs"));

  if (!v11)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[SAAppPath setUniqueURLs:](v8, "setUniqueURLs:", v12);
  }

  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_1000103C8;
  uint64_t v20 = &unk_10004CA00;
  id v13 = v7;
  id v21 = v13;
  uint64_t v14 = v8;
  uint64_t v22 = v14;
  uint64_t v15 = SALog([v6 enumerateObjectsUsingBlock:&v17]);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v26 = "-[SAAppPathList importDefaultApps]_block_invoke";
    __int16 v27 = 2112;
    __int16 v28 = v14;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: adding (%@) to bundle (%@)", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateWithAppPath:", v14, v17, v18, v19, v20);
}

void sub_1000100A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v11));
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = v11;
  }
  id v6 = v5;

  id v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(*(void *)(a1 + 32) + 32LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000101A0;
  v12[3] = &unk_10004C9D8;
  id v13 = v7;
  id v14 = v6;
  id v15 = v3;
  id v9 = v3;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
}

void sub_1000101A0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned __int8 v6 = [v5 isEqualToString:a1[4]];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueURLs]);
    unsigned int v8 = [v7 containsObject:a1[5]];

    if (v8)
    {
      uint64_t v10 = SALog(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = a1[6];
        uint64_t v20 = a1[4];
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        int v25 = 136315906;
        int v26 = "-[SAAppPathList importDefaultApps]_block_invoke_3";
        __int16 v27 = 2112;
        uint64_t v28 = v19;
        __int16 v29 = 2112;
        uint64_t v30 = v20;
        __int16 v31 = 2112;
        __int16 v32 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: path (%@) is forcedly assigned to bundle (%@), therefore removed from the uniqueURLs of bundle (%@).",  (uint8_t *)&v25,  0x2Au);
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueURLs]);
LABEL_10:
      uint64_t v18 = v12;
      [v12 removeObject:a1[5]];

      goto LABEL_11;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedURLs]);
    unsigned int v14 = [v13 containsObject:a1[5]];

    if (v14)
    {
      uint64_t v16 = SALog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = a1[6];
        uint64_t v23 = a1[4];
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        int v25 = 136315906;
        int v26 = "-[SAAppPathList importDefaultApps]_block_invoke";
        __int16 v27 = 2112;
        uint64_t v28 = v22;
        __int16 v29 = 2112;
        uint64_t v30 = v23;
        __int16 v31 = 2112;
        __int16 v32 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: path (%@) is forcedly assigned to bundle (%@), therefore removed from the sharedURLs of bundle (%@).",  (uint8_t *)&v25,  0x2Au);
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedURLs]);
      goto LABEL_10;
    }
  }

void sub_1000103C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v4));
  unsigned __int8 v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v10 = SALog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v14 = 136315650;
    uint64_t v15 = "-[SAAppPathList importDefaultApps]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: adding (%@) to bundle (%@)",  (uint8_t *)&v14,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueURLs]);
  [v13 addObject:v8];
}

void sub_100010604(id a1, NSString *a2, SAAppPath *a3, BOOL *a4)
{
  uint64_t v10 = a2;
  uint64_t v5 = a3;
  unsigned __int8 v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](v5, "writersIDs"));
  unsigned int v8 = [v7 containsObject:@"com.apple.bird"];

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](v5, "writersIDs"));
    [v9 removeObject:@"com.apple.bird"];
  }

  objc_autoreleasePoolPop(v6);
}

void sub_1000106A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  if (([v6 isGroup] & 1) == 0)
  {
    uint64_t v19 = v7;
    unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v20 = v6;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 writersIDs]);
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v15 = objc_msgSend(*(id *)(a1 + 32), "isAppVisible:", v14, v19);
          if ((_DWORD)v15)
          {
            uint64_t v16 = SALog(v15);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v26 = v5;
              __int16 v27 = 2112;
              uint64_t v28 = v14;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "App (%@) declares a UI visible app (%@) as its writer",  buf,  0x16u);
            }

            -[NSMutableSet addObject:](v8, "addObject:", v14);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v11);
    }

    id v6 = v20;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v20 writersIDs]);
    [v18 minusSet:v8];

    id v7 = v19;
  }

  objc_autoreleasePoolPop(v7);
}

void sub_1000108A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  if (([v6 isGroup] & 1) == 0
    && ([v6 isUserVisible] & 1) == 0)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getGreaterAncestorOfBundle:v5]);
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = [v8 isEqualToString:v5];
      if ((v10 & 1) == 0)
      {
        uint64_t v11 = SALog(v10);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315650;
          id v17 = "-[SAAppPathList mergeWritersAppPaths]_block_invoke";
          __int16 v18 = 2112;
          id v19 = v5;
          __int16 v20 = 2112;
          __int128 v21 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: merging writer %@ appPath with it's greater ancestor %@",  (uint8_t *)&v16,  0x20u);
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appPathForBundleID:v9]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        [v13 addWriterId:v14];

        [v13 extendWithPropertiesFromAppPath:v6];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) writersMap]);
        [v15 setObject:v9 forKeyedSubscript:v5];
      }
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_100010A48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  if (([v6 isGroup] & 1) == 0)
  {
    id v17 = v7;
    id v18 = v6;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 writersIDs]);
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          id v14 = [v13 isEqualToString:v5];
          if ((v14 & 1) == 0)
          {
            uint64_t v15 = SALog(v14);
            int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              __int128 v24 = "-[SAAppPathList mergeWritersAppPaths]_block_invoke";
              __int16 v25 = 2112;
              id v26 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: removing writer %@ from appPathList",  buf,  0x16u);
            }

            [*(id *)(a1 + 32) removeAppPath:v13];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v10);
    }

    id v7 = v17;
    id v6 = v18;
  }

  objc_autoreleasePoolPop(v7);
}

void sub_100010E1C(_Unwind_Exception *a1)
{
}

LABEL_7:
  return v7;
}

id sub_100011AEC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:a2];
}

void sub_100011B50(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100011B5C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100011B8C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

void sub_100011BBC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t sub_100011BD8(uint64_t a1, uint64_t a2)
{
  return a2;
}

  ;
}

void sub_100012140(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 generateDictionary]);
  [v4 setObject:v6 forKey:v5];
}

CFStringRef sub_1000121C8()
{
  return @"/private/var";
}

id sub_1000121D4(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = container_query_create();
  container_query_set_class(v12, a2);
  uint64_t v28 = 0LL;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int16 v31 = sub_100012474;
  __int16 v32 = sub_100012484;
  id v33 = 0LL;
  if (a2 == 13 || a2 == 7)
  {
    xpc_object_t v13 = xpc_string_create(a1);
    container_query_set_group_identifiers(v12, v13);
  }

  else
  {
    xpc_object_t v13 = xpc_string_create(a1);
    container_query_set_identifiers(v12, v13);
  }

  container_query_set_transient(v12, a5);
  container_query_operation_set_flags(v12, 0x100000002LL);
  container_query_operation_set_platform(v12, a3);
  if (a4) {
    container_query_set_persona_unique_string(v12, a4);
  }
  else {
    container_query_set_persona_unique_string(v12, CONTAINER_PERSONA_PRIMARY);
  }
  if (a6)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10001248C;
    v27[3] = &unk_10004CA98;
    v27[4] = &v28;
    if ((container_query_iterate_results_with_subquery_sync(a6, v12, v27) & 1) == 0)
    {
      uint64_t last_error = container_query_get_last_error(v12);
      uint64_t v15 = (void *)container_error_copy_unlocalized_description(last_error);
      uint64_t v16 = SALog(v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003085C();
      }
      goto LABEL_17;
    }
  }

  else
  {
    uint64_t single_result = container_query_get_single_result(v12);
    if (!single_result)
    {
      uint64_t v22 = container_query_get_last_error(v12);
      uint64_t v23 = container_error_copy_unlocalized_description(v22);
      uint64_t v15 = (void *)v23;
      if (!v23)
      {
LABEL_18:
        free(v15);
        goto LABEL_19;
      }

      uint64_t v24 = SALog(v23);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000307F8();
      }
LABEL_17:

      goto LABEL_18;
    }

    __int128 v19 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  container_get_path(single_result),  1LL,  0LL);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    __int128 v21 = (void *)v29[5];
    v29[5] = v20;
  }

LABEL_19:
  container_query_free(v12);
  id v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

    uint64_t v23 = self;
    objc_sync_enter(v23);
    v23->_shouldContinueScanning = 0;
    objc_sync_exit(v23);

    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v24 = v23;
    objc_sync_enter(v24);
    v23->_shouldContinueScanning = 1;
    objc_sync_exit(v24);
  }

  else
  {
    id v17 = SALog(v12);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100031988((uint64_t)self, v18, v19);
    }

    uint64_t v16 = 3;
  }

  return v16;
}

void sub_100012438( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100012474(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100012484(uint64_t a1)
{
}

uint64_t sub_10001248C(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  container_get_path(a2),  1LL,  0LL);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1LL;
}

NSMutableDictionary *sub_1000124E8(void *a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v16 = a1;
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationExtensionRecords]);
  id v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0LL;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        id v9 = objc_claimAutoreleasedReturnValue([v7 executableURL]);
        id v10 = sub_1000126D4((const char *)[v9 fileSystemRepresentation]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

        if (v11) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v11,  @"CONTAINER_CLASS_APPLICATION");
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 dataContainerURL]);

        if (v12)
        {
          xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 dataContainerURL]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v13,  @"CONTAINER_CLASS_APPLICATION_DATA");
        }

        if (-[NSMutableDictionary count](v8, "count"))
        {
          if (!v4) {
            uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, v14);
        }
      }

      id v3 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

id sub_1000126D4(const char *a1)
{
  if (a1 && (id v1 = strdup(a1)) != 0LL)
  {
    id v2 = v1;
    id v3 = rindex(v1, 47);
    if (v3)
    {
      *id v3 = 0;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v2,  1LL,  0LL));
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    free(v2);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

NSMutableDictionary *sub_1000127B8(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]),
        v3,
        !v3))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CACHE_DELETE_NAME_MAP"]);
    __int128 v19 = v2;
    __int128 v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = v2;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          id v14 = v11;
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v15, v19));

          if (v11)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"]);

            if (v16)
            {
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, v16);

              id v10 = (void *)v16;
            }

            else
            {
              id v10 = 0LL;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    else
    {
      id v10 = 0LL;
      uint64_t v11 = 0LL;
    }

    id v6 = v20;
    id v2 = v19;
  }

  else
  {
    uint64_t v4 = SALog(v1);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000308C0(v2 == 0LL, v2, (os_log_s *)v5);
    }
    id v6 = 0LL;
  }

  return v6;
}

id sub_1000129E8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/System/Library/SpaceAttribution",  @"SpaceAttributionFramework_PathList.plist"));
  id v13 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v0,  2LL,  &v13));
  id v2 = v13;
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0LL;
  }
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = SALog(v2);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030968();
    }
    goto LABEL_14;
  }

  id v12 = 0LL;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v1,  0LL,  0LL,  &v12));
  id v7 = v12;
  uint64_t v4 = v7;
  if (v7 || !v6)
  {
    uint64_t v9 = SALog(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000309D4();
    }

LABEL_14:
    id v8 = 0LL;
    goto LABEL_15;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v6,  "objectForKeyedSubscript:",  @"SPACE_ATTRIBUTION_DAEMON_MAP"));
LABEL_15:

  return v8;
}

LABEL_20:
  return v10;
}

    goto LABEL_21;
  }

  id v10 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  LOBYTE(v76) = 0;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SAAppPath appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( &OBJC_CLASS___SAAppPath,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v11,  v12,  v3,  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 80),  *(unsigned __int8 *)(a1 + 81),  v76));

  if (!v13)
  {
LABEL_21:
    __int128 v50 = SALog(v14);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100033E18(a1, v13, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_40;
  }

void sub_1000132C8(id a1)
{
  id v1 = (id)MGCopyAnswer(@"mtrAoWJ3gsq+I90ZnQ0vQw", 0LL);
  byte_10005AA28 = [v1 intValue] == 3;
}

void sub_10001334C(id a1)
{
  id v1 = (id)MGCopyAnswer(@"DeviceName", 0LL);
  byte_10005AA38 = [v1 isEqualToString:@"HomePod"];
}

void sub_1000134B0(_Unwind_Exception *a1)
{
}

void sub_100013678(_Unwind_Exception *a1)
{
}

LABEL_12:
  return v10;
}

void sub_100013ABC(id a1)
{
  id v1 = (id)MGCopyAnswer(@"mtrAoWJ3gsq+I90ZnQ0vQw", 0LL);
  byte_10005AA50 = [v1 intValue] == 6;
}

void sub_100014420(id a1)
{
  uint64_t v1 = getmntinfo_r_np(&v11, 2);
  if ((_DWORD)v1)
  {
    int v2 = v1;
    BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v4 = (void *)qword_10005AA60;
    qword_10005AA60 = (uint64_t)v3;

    if (v2 >= 1)
    {
      unint64_t v5 = 0LL;
      uint64_t v6 = 2168LL * v2;
      do
      {
        id v7 = (void *)qword_10005AA60;
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v11[v5 / 0x878].f_mntonname));
        [v7 addObject:v8];

        v5 += 2168LL;
      }

      while (v6 != v5);
    }

    free(v11);
  }

  else
  {
    uint64_t v9 = SALog(v1);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003136C();
    }
  }

void sub_1000146B4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000146C8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

char *sub_100014704(int *a1)
{
  return strerror(*a1);
}

  ;
}

  ;
}

int *sub_10001473C()
{
  return __error();
}

void sub_100014744( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

char *sub_10001478C( int a1, int __errnum, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return strerror(__errnum);
}

void sub_100015178(_Unwind_Exception *a1)
{
}

LABEL_72:
    v96 = v50;
    v97 = v47;
    HIDWORD(v99) = 120000;
    uint64_t v38 = fsctl(v101.f_mntonname, 0xC0384A74uLL, &v95, 1u);
    __int128 v46 = v50;
  }

  while (!(_DWORD)v38);
  id v39 = v38;
  id v25 = (id)v76;
  uint64_t v16 = v77;
LABEL_11:
  uint64_t v40 = SALog(v38);
  uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    sub_1000316A8();
  }

  __int128 v42 = NSPOSIXErrorDomain;
  __int128 v43 = v39;
LABEL_14:
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v42,  v43,  0LL));
LABEL_15:
  free(v78);
  ((void (**)(id, void *, void *))v16)[2](v16, v86, 0LL);
LABEL_16:
}

LABEL_26:
          __int128 v22 = (v23 + 32 * v24);
          __int128 v23 = v22 + 24;
        }

        break;
      }

LABEL_16:
      uint64_t v30 = v21;
      HIDWORD(v32) = 120000;
      uint64_t v16 = fsctl(v34.f_mntonname, 0xC0384A74uLL, v29, 1u);
      if ((_DWORD)v16) {
        goto LABEL_8;
      }
    }
  }

LABEL_29:
  if (v17) {
    __int16 v27 = v17 == a3;
  }
  else {
    __int16 v27 = 0;
  }
  id v14 = v27;
LABEL_35:

  return v14;
}

  ;
}

void sub_1000160C0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000160E4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000160F0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000163EC(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___SAAppSizerScan);
  int v2 = (void *)qword_10005AA78;
  qword_10005AA78 = (uint64_t)v1;
}

void sub_10001661C(_Unwind_Exception *a1)
{
}

void sub_100016DBC(_Unwind_Exception *a1)
{
}

uint64_t sub_100016E0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016E1C(uint64_t a1)
{
}

void sub_100016E24(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
}

void sub_100016E6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 writersIDs]);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 writersIDs]);
    if ([v9 count])
    {
      unsigned __int8 v10 = [v6 isGroup];

      if ((v10 & 1) == 0)
      {
        uint64_t v15 = @"writersBundles";
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 writersIDs]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
        uint64_t v16 = v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) appsList]);
        [v14 setObject:v13 forKey:v5];
      }
    }

    else
    {
    }
  }
}

void sub_100016FB0(uint64_t a1)
{
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 0;
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = sub_100016E0C;
  v59 = sub_100016E1C;
  id v60 = 0LL;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  int v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:*(int *)(a1 + 72)]);
  id v3 = [v2 countByEnumeratingWithState:&v51 objects:v73 count:16];
  id obj = v2;
  if (v3)
  {
    uint64_t v48 = *(void *)v52;
LABEL_3:
    uint64_t v4 = 0LL;
    id v49 = v3;
    while (1)
    {
      if (*(void *)v52 != v48) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v51 + 1) + 8 * v4);
      id v6 = objc_autoreleasePoolPush();
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48LL);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_1000177A8;
      v50[3] = &unk_10004CB88;
      v50[4] = v5;
      v50[5] = &v55;
      v50[6] = &v61;
      [v7 getAppsSetForURL:v5 completionHandler:v50];
      if (*((_BYTE *)v62 + 24))
      {
        id v8 = 0LL;
        *((_BYTE *)v62 + 24) = 0;
        int v9 = 3;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
        if ([(id)v56[5] count] == (id)1)
        {
          unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] anyObject]);
          BOOL v11 = +[SASpeculativeDownloadAnalytics isBundleIdInHierarchy:]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "isBundleIdInHierarchy:",  v10);
          if (v11)
          {
            uint64_t v12 = SALog(v11);
            id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v66 = v8;
              __int16 v67 = 2112;
              id v68 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Enabling hierarchy on path %@ for bundleId %@",  buf,  0x16u);
            }

            uint64_t v14 = 22LL;
          }

          else
          {
            uint64_t v14 = 6LL;
          }
        }

        else
        {
          uint64_t v14 = 6LL;
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getFolderSizeAtPath:v8 options:v14]);
        objc_msgSend( *(id *)(*(void *)(a1 + 32) + 32),  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:",  v56[5],  0,  objc_msgSend(v15, "dataSize"),  0,  objc_msgSend(v15, "purgeableSize"),  0,  objc_msgSend(v15, "physicalSize"),  0,  0);
        if ([v15 usedDirStat])
        {
          unint64_t v16 = (unint64_t)[v15 purgeableSize];
          if ((v16 & 0x8000000000000000LL) != 0)
          {
            uint64_t v17 = SALog(v16);
            __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v45 = [v15 purgeableSize];
              __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] description]);
              *(_DWORD *)buf = 138412802;
              v66 = v8;
              __int16 v67 = 2048;
              id v68 = v45;
              __int16 v69 = 2112;
              id v70 = v46;
              _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Path (%@) dir-stat purgeableSize: %lld < 0 for bundles set %@",  buf,  0x20u);
            }
          }
        }

        if ([v15 usedDirStat])
        {
          id v19 = [v15 physicalSize];
          id v20 = [v15 purgeableSize];
          if ((uint64_t)v19 < (uint64_t)v20)
          {
            uint64_t v21 = SALog(v20);
            __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v39 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] description]);
              id v40 = [v15 purgeableSize];
              id v41 = [v15 physicalSize];
              *(_DWORD *)buf = 138413058;
              v66 = v39;
              __int16 v67 = 2112;
              id v68 = v8;
              __int16 v69 = 2048;
              id v70 = v40;
              __int16 v71 = 2048;
              id v72 = v41;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@: Path (%@) dir-stat purgeable size (%lld) is greater than dir-stat physical size (%lld)",  buf,  0x2Au);
            }
          }
        }

        if ([v15 usedDirStat])
        {
          id v23 = [v15 physicalSize];
          id v24 = [v15 cloneSize];
          if ((uint64_t)v23 < (uint64_t)v24)
          {
            uint64_t v25 = SALog(v24);
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] description]);
              id v43 = [v15 cloneSize];
              id v44 = [v15 physicalSize];
              *(_DWORD *)buf = 138413058;
              v66 = v42;
              __int16 v67 = 2112;
              id v68 = v8;
              __int16 v69 = 2048;
              id v70 = v43;
              __int16 v71 = 2048;
              id v72 = v44;
              _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%@: Path (%@) dir-stat clone size (%lld) is greater than dir-stat physical size (%lld)",  buf,  0x2Au);
            }
          }
        }

        objc_msgSend( *(id *)(a1 + 48),  "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:",  v56[5],  objc_msgSend(v15, "usedDirStat"),  0,  objc_msgSend(v15, "dataSize"),  0,  objc_msgSend(v15, "purgeableSize"));
        objc_msgSend( *(id *)(a1 + 48),  "updateDirStatInfo:usedDirsStat:failedDirStat:skippedDirStat:",  objc_msgSend(v15, "enabledDirStat"),  objc_msgSend(v15, "usedDirStat"),  objc_msgSend(v15, "failedDirStat"),  objc_msgSend(v15, "skippedDirStat"));
        if ([v15 dirstatsID])
        {
          __int16 v27 = *(void **)(*(void *)(a1 + 32) + 48LL);
          id v28 = [v15 dirstatsID];
          [v27 insertDirStatID:v28 forBundlesSet:v56[5]];
        }

        if ((*(_BYTE *)(a1 + 64) & 0x20) != 0)
        {
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) pathsList]);
          objc_sync_enter(v29);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) pathsList]);
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([(id)v56[5] allObjects]);
          id v32 = [v31 copy];
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 generateDictionary:v32]);
          [v30 setObject:v33 forKey:v8];

          objc_sync_exit(v29);
        }

        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList]);

        if (v34)
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList]);
          objc_sync_enter(v35);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList]);
          id v37 = [v15 dataSize];
          [v36 addPath:v8 fixedPath:0 size:v37 bundleId:v56[5]];

          objc_sync_exit(v35);
        }

        BOOL v38 = *(_BYTE *)(*(void *)(a1 + 32) + 8LL) == 0;

        int v9 = 2 * v38;
      }

      objc_autoreleasePoolPop(v6);
      if (v9 != 3)
      {
        if (v9) {
          break;
        }
      }

      if (v49 == (id)++v4)
      {
        id v3 = [obj countByEnumeratingWithState:&v51 objects:v73 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);
}

void sub_100017734( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_1000177A8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  else
  {
    uint64_t v5 = SALog(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031904(a1, v6);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

id sub_100018244(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    switch(a3)
    {
      case 4LL:
        id v10 = [*(id *)(a1 + 32) analyzeDirExit:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      case 2LL:
        id v10 = [*(id *)(a1 + 32) analyzeDirEntry:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      case 1LL:
        id v10 = [*(id *)(a1 + 32) analyzeFile:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      default:
        uint64_t v12 = SALog(0LL);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_100031B78();
        }

        goto LABEL_2;
    }

    id v9 = v10;
    goto LABEL_10;
  }

LABEL_2:
  id v9 = 0LL;
LABEL_10:

  return v9;
}

void sub_100018470( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100018498(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = SALog(v9);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v7 updateState];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v18 = 134218498;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SUControllerManager state(%ld) descriptor(%@) error(%@)",  (uint8_t *)&v18,  0x20u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v15 = SALog(v14);
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100031BD8();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a4);
  }

  else
  {
    uint64_t v17 = (char *)[v7 updateState];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100018804(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundlesSet]);

  uint64_t v11 = SALog(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218242;
      id v16 = [v6 unsignedLongLongValue];
      __int16 v17 = 2112;
      int v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding %llu to %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appSizerResults]);
    objc_msgSend(v14, "accountSUPurgeableFor:purgeableSize:", v9, objc_msgSend(v6, "unsignedLongLongValue"));

    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) telemetryManager]);
    -[os_log_s updateAppSet:withSUPurgeableSize:]( v13,  "updateAppSet:withSUPurgeableSize:",  v9,  [v6 unsignedLongLongValue]);
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_100031C40(v5, v13);
  }

  objc_autoreleasePoolPop(v7);
}

void sub_100018C7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100018CD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
  if (([v8 isEqual:@"com.apple.fakeapp.SystemData"] & 1) != 0
    || ([v8 isEqual:@"com.apple.fakeapp.System"] & 1) != 0
    || ([v8 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) != 0)
  {
    goto LABEL_27;
  }

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  unint64_t v9 = (unint64_t)[v6 dataSize];
  unint64_t v10 = (unint64_t)[v6 fixedSize];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  id v12 = (char *)[*(id *)(a1 + 32) totalVisibleAppSize];
  id v13 = [*(id *)(a1 + 32) totalHiddenAppSize];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = &v12[(void)v13
                                                                   - *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL)
                                                                               + 24LL)];
  uint64_t v14 = SALog(v13);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    *(_DWORD *)buf = 138413058;
    id v41 = v11;
    __int16 v42 = 2048;
    unint64_t v43 = v9;
    __int16 v44 = 2048;
    unint64_t v45 = v10;
    __int16 v46 = 2048;
    unint64_t v47 = v35;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "processing %@ with dataSize %llu and fixedSize %llu, totalAppSize %llu",  buf,  0x2Au);
  }

  if ((v9 & 0x8000000000000000LL) != 0)
  {
    uint64_t v27 = SALog(v16);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100031D78();
    }

    [v6 setDataSize:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    id v17 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
    unint64_t v9 = 0LL;
    if ((v10 & 0x8000000000000000LL) == 0) {
      goto LABEL_12;
    }
LABEL_19:
    uint64_t v29 = SALog(v17);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100031D10();
    }

    [v6 setFixedSize:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    [*(id *)(a1 + 32) dataVolumeSizeUsed];
    unint64_t v10 = 0LL;
    goto LABEL_22;
  }

  id v17 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
  if (v9 > (unint64_t)v17)
  {
    uint64_t v18 = SALog(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v37 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138412802;
      id v41 = v11;
      __int16 v42 = 2048;
      unint64_t v43 = v9;
      __int16 v44 = 2048;
      unint64_t v45 = (unint64_t)v37;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Bundles set %@ dataSize (%llu) > dataVolumeSizeUsed (%llu)",  buf,  0x20u);
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v21 = (char *)(*(void *)(v20 + 24) + v9);
    unint64_t v9 = 0LL;
    *(void *)(v20 + 24) = v21;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  }

  if ((v10 & 0x8000000000000000LL) != 0) {
    goto LABEL_19;
  }
LABEL_12:
  id v22 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
  if (v10 > (unint64_t)v22)
  {
    uint64_t v23 = SALog(v22);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v38 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138412802;
      id v41 = v11;
      __int16 v42 = 2048;
      unint64_t v43 = v10;
      __int16 v44 = 2048;
      unint64_t v45 = (unint64_t)v38;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Bundles set %@ fixedSize (%llu) > dataVolumeSizeUsed (%llu)",  buf,  0x20u);
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v26 = (char *)(*(void *)(v25 + 24) + v10);
    unint64_t v10 = 0LL;
    *(void *)(v25 + 24) = v26;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  }

LABEL_22:
  __int16 v31 = (char *)(v10 + v9 + *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  id v32 = (char *)[*(id *)(a1 + 32) dataVolumeSizeUsed];
  if (v31 > v32)
  {
    uint64_t v33 = SALog(v32);
    __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      unint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      id v36 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138413314;
      id v41 = v11;
      __int16 v42 = 2048;
      unint64_t v43 = v39;
      __int16 v44 = 2048;
      unint64_t v45 = v9;
      __int16 v46 = 2048;
      unint64_t v47 = v10;
      __int16 v48 = 2048;
      id v49 = v36;
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Bundles set %@ Total App Size (%llu) + dataSize (%llu) + fixedSize (%llu) is larger than usedDataVolumes (%llu)",  buf,  0x34u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += v10 + v9;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  }

  objc_msgSend( *(id *)(a1 + 32),  "setTotalVisibleAppSize:",  (char *)objc_msgSend(v6, "dataSize")
  + (void)[v6 fixedSize]
  + (unint64_t)[*(id *)(a1 + 32) totalVisibleAppSize]);

LABEL_27:
  objc_autoreleasePoolPop(v7);
}

void sub_100019998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000199B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = SALog(v6);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003200C(v7, v9);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
}

void sub_100019F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

void sub_100019FA4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = a4;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
}

void sub_100019FCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tagMap]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);

  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) telemetryManager]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    objc_msgSend(v11, "updateAppSet:withPurgeableTagSize:", v12, objc_msgSend(v6, "longLongValue"));
  }

  else
  {
    uint64_t v13 = SALog(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10003208C();
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10001BCD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_10001BE7C(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 setAppSizerResults:a3];
  [*(id *)(a1 + 32) setTelemetryManager:v7];
}

void sub_10001BEE0(uint64_t a1)
{
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:*(int *)(a1 + 72)]);
  id v52 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v67;
    do
    {
      uint64_t v2 = 0LL;
      do
      {
        if (*(void *)v67 != v51)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }

        uint64_t v55 = v2;
        uint64_t v4 = *(void *)(*((void *)&v66 + 1) + 8 * v2);
        v56 = objc_autoreleasePoolPush();
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities breakCommaSeparatedStringToComponents:]( &OBJC_CLASS___SAUtilities,  "breakCommaSeparatedStringToComponents:",  v4));
        if ([v61 count] == (id)1)
        {
          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v61 anyObject]);
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v53]);
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v54 binaryURLs]);
          BOOL v6 = [v5 count] == 0;

          if (v6)
          {
            uint64_t v49 = SALog(v7);
            uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v71 = v53;
              _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "bundleID %@ does not have any executable paths",  buf,  0xCu);
            }
          }

          else
          {
            __int128 v64 = 0u;
            __int128 v65 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 binaryURLs]);
            id v60 = -[os_log_s countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
            if (v60)
            {
              uint64_t v59 = *(void *)v63;
              do
              {
                for (i = 0LL; i != v60; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v59) {
                    objc_enumerationMutation(v57);
                  }
                  unint64_t v9 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
                  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
                  unsigned __int8 v11 = +[SASupport isItemMountedOnSystemVolume:]( &OBJC_CLASS___SASupport,  "isItemMountedOnSystemVolume:",  v10);

                  if ((v11 & 1) == 0)
                  {
                    context = objc_autoreleasePoolPush();
                    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", [v9 fileSystemRepresentation]));
                    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) getFolderSizeAtPath:v12 options:6]);
                    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appSizerResults]);
                    objc_msgSend( v14,  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:",  v61,  objc_msgSend(v13, "dataSize"),  0,  0,  objc_msgSend(v13, "purgeableSize"),  0,  objc_msgSend(v13, "physicalSize"),  0,  0);

                    if ([v13 usedDirStat])
                    {
                      unint64_t v15 = (unint64_t)[v13 purgeableSize];
                      if ((v15 & 0x8000000000000000LL) != 0)
                      {
                        uint64_t v16 = SALog(v15);
                        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
                        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                        {
                          id v47 = [v13 purgeableSize];
                          __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v61 description]);
                          *(_DWORD *)buf = 138412802;
                          __int16 v71 = v12;
                          __int16 v72 = 2048;
                          id v73 = v47;
                          __int16 v74 = 2112;
                          id v75 = v48;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Path (%@) dir-stat purgeableSize: %lld < 0 for bundles set %@",  buf,  0x20u);
                        }
                      }
                    }

                    if ([v13 usedDirStat])
                    {
                      id v18 = [v13 physicalSize];
                      id v19 = [v13 purgeableSize];
                      if ((uint64_t)v18 < (uint64_t)v19)
                      {
                        uint64_t v20 = SALog(v19);
                        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                        {
                          id v41 = (void *)objc_claimAutoreleasedReturnValue([v61 description]);
                          id v42 = [v13 purgeableSize];
                          id v43 = [v13 physicalSize];
                          *(_DWORD *)buf = 138413058;
                          __int16 v71 = v41;
                          __int16 v72 = 2112;
                          id v73 = v12;
                          __int16 v74 = 2048;
                          id v75 = v42;
                          __int16 v76 = 2048;
                          id v77 = v43;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%@: Path (%@) dir-stat purgeable size (%lld) is greater than dir-stat physical size (%lld)",  buf,  0x2Au);
                        }
                      }
                    }

                    if ([v13 usedDirStat])
                    {
                      id v22 = [v13 physicalSize];
                      id v23 = [v13 cloneSize];
                      if ((uint64_t)v22 < (uint64_t)v23)
                      {
                        uint64_t v24 = SALog(v23);
                        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                        {
                          __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v61 description]);
                          id v45 = [v13 cloneSize];
                          id v46 = [v13 physicalSize];
                          *(_DWORD *)buf = 138413058;
                          __int16 v71 = v44;
                          __int16 v72 = 2112;
                          id v73 = v12;
                          __int16 v74 = 2048;
                          id v75 = v45;
                          __int16 v76 = 2048;
                          id v77 = v46;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%@: Path (%@) dir-stat clone size (%lld) is greater than dir-stat physical size (%lld)",  buf,  0x2Au);
                        }
                      }
                    }

                    id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) telemetryManager]);
                    objc_msgSend( v26,  "updateDirStatInfo:usedDirsStat:failedDirStat:skippedDirStat:",  objc_msgSend(v13, "enabledDirStat"),  objc_msgSend(v13, "usedDirStat"),  objc_msgSend(v13, "failedDirStat"),  objc_msgSend(v13, "skippedDirStat"));

                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) telemetryManager]);
                    objc_msgSend( v27,  "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:",  v61,  objc_msgSend(v13, "usedDirStat"),  objc_msgSend(v13, "dataSize"),  0,  0,  objc_msgSend(v13, "purgeableSize"));

                    if ([v13 dirstatsID])
                    {
                      id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) pathList]);
                      objc_msgSend(v28, "insertDirStatID:forBundlesSet:", objc_msgSend(v13, "dirstatsID"), v61);
                    }

                    if ((*(_BYTE *)(a1 + 64) & 0x20) != 0)
                    {
                      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appSizerResults]);
                      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 pathsList]);

                      objc_sync_enter(v30);
                      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appSizerResults]);
                      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 pathsList]);
                      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v61 allObjects]);
                      id v34 = [v33 copy];
                      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v13 generateDictionary:v34]);
                      [v32 setObject:v35 forKey:v12];

                      objc_sync_exit(v30);
                    }

                    id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 56) + 24) appSizeBreakdownList]);

                    if (v36)
                    {
                      id v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appSizerResults]);
                      id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 appSizeBreakdownList]);

                      objc_sync_enter(v38);
                      unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appSizerResults]);
                      id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 appSizeBreakdownList]);
                      objc_msgSend( v40,  "addPath:fixedPath:size:bundleId:",  v12,  1,  objc_msgSend(v13, "dataSize"),  v61);

                      objc_sync_exit(v38);
                    }

                    objc_autoreleasePoolPop(context);
                  }
                }

                id v60 = -[os_log_s countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
              }

              while (v60);
            }
          }
        }

        objc_autoreleasePoolPop(v56);
        uint64_t v2 = v55 + 1;
      }

      while ((id)(v55 + 1) != v52);
      id v52 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
    }

    while (v52);
  }
}

void sub_10001C710(_Unwind_Exception *a1)
{
}

void sub_10001C730(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = v11;
  uint64_t v13 = a3 - a4;
  if (a3 < a4)
  {
    uint64_t v14 = SALog(v11);
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      id v46 = a6;
      __int16 v47 = 2112;
      __int16 v48 = v12;
      __int16 v49 = 2048;
      unint64_t v50 = a3;
      __int16 v51 = 2048;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      uint64_t v54 = a5;
      __int16 v55 = 2112;
      uint64_t v56 = v44;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Attribution tag %llu for bundleID %@ phySize %llu is less than cloneSize %llu. totalCount %llu, volumePath %@",  buf,  0x3Eu);
    }

    uint64_t v13 = 0LL;
  }

  if (v12)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appPathList]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 getParentOfBundle:v12]);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v23 = *(void **)(v20 + 40);
    id v21 = (id *)(v20 + 40);
    id v22 = v23;
    if (v23) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v12;
    }
    objc_storeStrong(v21, v24);
    uint64_t v26 = SALog(v25);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412546;
      id v46 = v12;
      __int16 v47 = 2112;
      __int16 v48 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Bundle %@ ParentBundle %@", buf, 0x16u);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appSizerResults]);
    [v29 updateBundleID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withDataSize:v13];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) telemetryManager]);
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)));
    [v30 updateAppSet:v31 attributionSize:v13 attributionCloneSize:a4 attributionTagCount:a5];

    if ((*(_BYTE *)(a1 + 64) & 0x40) != 0)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
      id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
      id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  @"bundleID",  v32,  @"physicalSize",  v33,  @"cloneSize",  v34,  @"attributionSize",  v35,  @"totalCount",  0LL));

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v36];
    }

    uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) tagMap]);
    unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a6));
    [v38 setObject:v37 forKeyedSubscript:v39];

    id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 24) appSizeBreakdownList]);
    if (v40)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appSizerResults]);
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 appSizeBreakdownList]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)));
      [v42 addTagSize:v13 bundleId:v43];
    }
  }
}

void sub_10001CB14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v42 = v6;
  if (v6)
  {
    uint64_t v7 = SALog(v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000321A8();
    }
  }

  else
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v44 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v44)
    {
      uint64_t v43 = *(void *)v56;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v56 != v43) {
            objc_enumerationMutation(v5);
          }
          uint64_t v47 = v9;
          uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
          id v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_10001CFE0;
          v52[3] = &unk_10004CD68;
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v54 = *(void *)(a1 + 48);
          v52[4] = v12;
          uint64_t v13 = v11;
          __int16 v53 = v13;
          [v10 enumerateObjectsUsingBlock:v52];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v14 dataSize];

          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appSizerResults]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          id v45 = [v46 dataSize];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          id v17 = [v16 cloneSize];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          id v19 = [v18 purgeableSize];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          objc_msgSend( v15,  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:",  v13,  0,  v45,  v17,  v19,  objc_msgSend(v20, "purgeableSize"),  0,  0,  0,  v42);

          id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          unint64_t v22 = (unint64_t)[v21 dataSize];

          if ((v22 & 0x8000000000000000LL) != 0)
          {
            uint64_t v24 = SALog(v23);
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
              id v40 = [v39 dataSize];
              id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
              *(_DWORD *)buf = 134218242;
              id v61 = v40;
              __int16 v62 = 2112;
              __int128 v63 = v41;
              _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Clone Map data size: %lld < 0 for bundles set %@",  buf,  0x16u);
            }
          }

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) telemetryManager]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          [v26 updateCloneInfoWithAppSet:v13 withItemSize:v27];

          id v28 = v13;
          if (*(_BYTE *)(a1 + 64))
          {
            uint64_t v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 clonesInfo]);

            id v32 = [v31 countByEnumeratingWithState:&v48 objects:v59 count:16];
            if (v32)
            {
              id v33 = v32;
              uint64_t v34 = *(void *)v49;
              do
              {
                for (i = 0LL; i != v33; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  -[NSMutableArray addObject:](v29, "addObject:", v36);
                }

                id v33 = [v31 countByEnumeratingWithState:&v48 objects:v59 count:16];
              }

              while (v33);
            }

            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appSizerResults]);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 clonesInfo]);
            [v38 setObject:v29 forKeyedSubscript:v10];
          }

          uint64_t v9 = v47 + 1;
        }

        while ((id)(v47 + 1) != v44);
        id v44 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }

      while (v44);
    }
  }
}

void sub_10001CFE0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v13 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appPathList]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 getParentOfBundle:v13]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  uint64_t v10 = v11;
  uint64_t v12 = v13;
  if (v11) {
    uint64_t v12 = v10;
  }
  objc_storeStrong(v9, v12);
  [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void sub_10001D074(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  if ([v5 count] == (id)1)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appPathList]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appPathForBundleID:v8]);

    if (v10)
    {
      id v11 = (char *)[v10 getAppCacheSize:0];
      if ((char *)[v10 cacheDeletePluginSize] + (void)v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
        objc_msgSend( v12,  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:",  v5,  0,  0,  0,  &v11[(void)objc_msgSend(v10, "cacheDeletePluginSize")],  0,  0,  v11,  objc_msgSend(v10, "cacheDeletePluginSize"));

        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) telemetryManager]);
        objc_msgSend( v13,  "updateAppSet:appCacheSize:CDPluginSize:",  v5,  v11,  objc_msgSend(v10, "cacheDeletePluginSize"));

        if (v6)
        {
          uint64_t v14 = &v11[(void)[v10 cacheDeletePluginSize]];
          unint64_t v15 = (char *)[v6 dataSize];
          if (v14 <= v15)
          {
            objc_msgSend(v6, "setDataSize:", (_BYTE *)objc_msgSend(v6, "dataSize") - v14);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) telemetryManager]);
            objc_msgSend(v18, "setValue:forAppInfoEntry:forBundleSet:", objc_msgSend(v6, "dataSize"), 22, v5);

            id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 appSizeBreakdownList]);

            if (v20)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
              unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 appSizeBreakdownList]);
              objc_msgSend(v22, "addPluginSize:bundleId:", objc_msgSend(v10, "cacheDeletePluginSize"), v5);

              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v27 appSizeBreakdownList]);
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathList]);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 cachePath]);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 findAncestorOfPath:v25]);
              [v23 updatePath:v26 cacheSize:v11 bundleId:v5];
            }
          }

          else
          {
            uint64_t v16 = SALog(v15);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134219010;
              uint64_t v29 = v14;
              __int16 v30 = 2048;
              __int16 v31 = v11;
              __int16 v32 = 2048;
              id v33 = [v10 cacheDeletePluginSize];
              __int16 v34 = 2048;
              id v35 = [v6 dataSize];
              __int16 v36 = 2112;
              id v37 = v5;
              _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "purgeable size: %llu (%llu + %llu) is greater than existing data size: %llu for bundleSet %@",  buf,  0x34u);
            }
          }
        }
      }
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10001D3D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  if ([v6 isGroup])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleSet]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v8));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appsDataInternal]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

    if (v12)
    {
      id v13 = [v12 dataSize];
      uint64_t v14 = [v6 getAppCacheSize:0];
      if (v14)
      {
        unint64_t v15 = v14;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
        [v16 updateAppSet:v8 fixedSize:0 dataSize:0 cloneSize:0 purgeableSize:v15 FSPurgeableSize:0 physicalSize:0 appCacheSize:v15 CDPluginSize:0];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) telemetryManager]);
        [v17 updateAppSet:v8 appCacheSize:v15 CDPluginSize:0];

        if (v15 <= v13)
        {
          objc_msgSend(v12, "setDataSize:", (_BYTE *)objc_msgSend(v12, "dataSize") - v15);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) telemetryManager]);
          objc_msgSend(v21, "setValue:forAppInfoEntry:forBundleSet:", objc_msgSend(v12, "dataSize"), 22, v8);

          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 appSizeBreakdownList]);

          if (v23)
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v28 appSizeBreakdownList]);
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathList]);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 cachePath]);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v27 findAncestorOfPath:v24]);
            [v26 updatePath:v25 cacheSize:v15 bundleId:v8];
          }
        }

        else
        {
          uint64_t v19 = SALog(v18);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v30 = v5;
            __int16 v31 = 2048;
            __int16 v32 = v15;
            __int16 v33 = 2048;
            id v34 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error: Group %@ cache size: %llu is greater than existing data size: %llu",  buf,  0x20u);
          }
        }
      }
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v12 = 0LL;
  }

  objc_autoreleasePoolPop(v7);
}

void sub_10001D6E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = SALog(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100032220(v7, v9);
    }
  }

  else
  {
    uint64_t v10 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained appSizerResults]);
    id v13 = [v5 capacity];
    id v14 = [v5 used];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001D818;
    v15[3] = &unk_10004CDE0;
    objc_copyWeak(&v16, v10);
    [v12 addSystemVolumeWithCapacity:v13 used:v14 withReplyBlock:v15];

    objc_destroyWeak(&v16);
  }
}

void sub_10001D804(_Unwind_Exception *a1)
{
}

void sub_10001D818(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained telemetryManager]);
  [v8 updateAppSet:v7 usedDirStat:0 fixedSize:a4 dataSize:a3 cloneSize:0 purgeableSize:0];
}

void sub_10001D894(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a3);
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_PURGEABLE_CLONES"]);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v15 = SALog(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000322A4();
    }

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) unsignedLongLongValue])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
      objc_msgSend( v17,  "setTotalCDAvailable:",  (char *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "longLongValue")
      + (void)[v17 totalCDAvailable]);
    }

    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unsignedLongLongValue])
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
      objc_msgSend( v18,  "setTotalPurgeableClones:",  (char *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "longLongValue")
      + (void)[v18 totalPurgeableClones]);
    }

    id v53 = v5;
    uint64_t v19 = sub_1000127B8(v5);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = sub_1000129E8();
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = v22;
    if (v22)
    {
      if (v20)
      {
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        id v57 = [v22 countByEnumeratingWithState:&v64 objects:v76 count:16];
        if (v57)
        {
          uint64_t v24 = *(void *)v65;
          __int128 v55 = v23;
          uint64_t v56 = a1;
          uint64_t v54 = *(void *)v65;
          do
          {
            for (i = 0LL; i != v57; i = (char *)i + 1)
            {
              if (*(void *)v65 != v24) {
                objc_enumerationMutation(v23);
              }
              uint64_t v26 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)i);
              uint64_t v75 = v26;
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v75,  1LL));
              uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v27));

              uint64_t v59 = (void *)v28;
              uint64_t v29 = objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v28));
              id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
              __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 appsDataInternal]);
              __int128 v58 = (void *)v29;
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v29]);

              if (v32)
              {
                __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appPathList]);
                id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 appPathList]);
                id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 valueForKey:v26]);

                if (!v35)
                {
                  __int128 v62 = 0u;
                  __int128 v63 = 0u;
                  __int128 v60 = 0u;
                  __int128 v61 = 0u;
                  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v26]);
                  id v37 = [v36 countByEnumeratingWithState:&v60 objects:v74 count:16];
                  if (v37)
                  {
                    id v38 = v37;
                    unint64_t v39 = 0LL;
                    uint64_t v40 = *(void *)v61;
                    do
                    {
                      for (j = 0LL; j != v38; j = (char *)j + 1)
                      {
                        if (*(void *)v61 != v40) {
                          objc_enumerationMutation(v36);
                        }
                        id v42 = (void *)objc_claimAutoreleasedReturnValue( [v20 objectForKeyedSubscript:*(void *)(*((void *)&v60 + 1) + 8 * (void)j)]);
                        v39 += (unint64_t)[v42 unsignedLongLongValue];
                      }

                      id v38 = [v36 countByEnumeratingWithState:&v60 objects:v74 count:16];
                    }

                    while (v38);
                  }

                  else
                  {
                    unint64_t v39 = 0LL;
                  }

                  a1 = v56;
                  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v56 + 32) appSizerResults]);
                  [v43 updateAppSet:v59 fixedSize:0 dataSize:0 cloneSize:0 purgeableSize:v39 FSPurgeableSize:0 physicalSize:0 appCacheSize:0 CDPluginSize:v39];

                  id v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v56 + 32) telemetryManager]);
                  [v44 updateAppSet:v59 appCacheSize:0 CDPluginSize:v39];

                  id v45 = [v32 dataSize];
                  uint64_t v24 = v54;
                  if (v39 <= (unint64_t)v45)
                  {
                    objc_msgSend(v32, "setDataSize:", (char *)objc_msgSend(v32, "dataSize") - v39);
                    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v56 + 32) telemetryManager]);
                    objc_msgSend( v49,  "setValue:forAppInfoEntry:forBundleSet:",  objc_msgSend(v32, "dataSize"),  22,  v59);

                    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v56 + 32) appSizerResults]);
                    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 appSizeBreakdownList]);

                    uint64_t v23 = v55;
                    if (!v51) {
                      goto LABEL_33;
                    }
                    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v56 + 32) appSizerResults]);
                    unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v47 appSizeBreakdownList]);
                    [v52 addPluginSize:v39 bundleId:v59];
                  }

                  else
                  {
                    uint64_t v46 = SALog(v45);
                    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                    uint64_t v23 = v55;
                    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
                    {
                      id v48 = [v32 dataSize];
                      *(_DWORD *)buf = 138412802;
                      uint64_t v69 = v26;
                      __int16 v70 = 2048;
                      unint64_t v71 = v39;
                      __int16 v72 = 2048;
                      id v73 = v48;
                      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v47,  OS_LOG_TYPE_ERROR,  "Error: %@ cd total plugin size: %llu is greater than existing data size: %llu",  buf,  0x20u);
                    }
                  }
                }
              }

LABEL_33:
            }

            id v57 = [v23 countByEnumeratingWithState:&v64 objects:v76 count:16];
          }

          while (v57);
        }
      }
    }

    id v7 = 0LL;
    id v5 = v53;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
  [*(id *)(a1 + 40) leave];
}

void sub_10001DE70(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = SALog(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100032344(a1, v7, v9);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
  }

  else
  {
    objc_msgSend( *(id *)(a1 + 32),  "setDataVolumeSizeUsed:",  (char *)objc_msgSend(a2, "rawUsed") + (void)objc_msgSend(*(id *)(a1 + 32), "dataVolumeSizeUsed"));
  }
}

void sub_10001DF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = SALog(a1);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003246C(v4, v5, v6);
    }
  }

  else
  {
    uint64_t v8 = (id *)(a1 + 32);
    uint64_t v9 = SALog( objc_msgSend( *(id *)(a1 + 32),  "setDataVolumeSizeUsed:",  (char *)objc_msgSend(*(id *)(a1 + 32), "dataVolumeSizeUsed") - a2));
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000323E0(v8, a2, v4);
    }
  }
}

void sub_10001DFB0(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count] != (id)1) {
    goto LABEL_6;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
  if (([v3 isEqual:@"com.apple.fakeapp.SystemData"] & 1) == 0
    && ([v3 isEqual:@"com.apple.fakeapp.System"] & 1) == 0
    && ([v3 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0)
  {

LABEL_6:
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appSizerResults]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getVendorNameForBundleSet:](&OBJC_CLASS___SAQuery, "getVendorNameForBundleSet:", v5));
    [v3 setAppSet:v5 vendorName:v4];
  }
}

void sub_10001E078(uint64_t a1)
{
  do
  {
    unsigned int v2 = __ldaxr(&dword_10005AA8C);
    unsigned int v3 = v2 - 1;
  }

  while (__stlxr(v3, &dword_10005AA8C));
  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SACallbackManager activeHandlers](&OBJC_CLASS___SACallbackManager, "activeHandlers"));
    id v5 = [v4 intersectsSet:*(void *)(a1 + 32)];
    if ((_DWORD)v5)
    {
      uint64_t v6 = SALog(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v14 = +[SACallbackManager handlersCount](&OBJC_CLASS___SACallbackManager, "handlersCount");
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "App Sizer is rescheduled (for %u handlers)",  buf,  8u);
      }

      uint64_t v8 = *(unsigned int *)(a1 + 64);
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      unint64_t v11 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFEDLL | 0x10;
      uint64_t v12 = 0LL;
      [v9 runAppSizerWithAsyncBlocksNum:v8 withRunMode:2 withActivity:v10 withScanOptions:v11 error:&v12];
    }
  }

void sub_10001E2A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64LL), a2);
    *(void *)(*(void *)(a1 + 32) + 48LL) = 0LL;
    *(void *)(*(void *)(a1 + 32) + 56LL) = 1LL;
    uint64_t v6 = SALog(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000324E0();
    }
  }
}

void sub_10001E824(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x500], 8) = a1;
}

void sub_10001E8EC(_Unwind_Exception *a1)
{
}

void sub_10001E9B4(_Unwind_Exception *a1)
{
}

void sub_10001EAA0(_Unwind_Exception *a1)
{
}

void sub_10001EDB4(_Unwind_Exception *a1)
{
}

void sub_10001EDD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SALog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10003270C(v3, v5);
  }

  +[SACallbackManager removeAppSizerHandler:]( &OBJC_CLASS___SACallbackManager,  "removeAppSizerHandler:",  *(void *)(a1 + 32));
}

void *sub_10001EE3C(void *result, int a2)
{
  if (a2) {
    return +[SACallbackManager removeAppSizerHandler:]( &OBJC_CLASS___SACallbackManager,  "removeAppSizerHandler:",  result[4]);
  }
  return result;
}

void sub_10001EE58( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001F49C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sizerID]);
    +[SAURlSizersManager removeURLSizerHandler:](&OBJC_CLASS___SAURlSizersManager, "removeURLSizerHandler:", v2);
  }

void sub_10001F66C(_Unwind_Exception *a1)
{
}

void sub_10001F718(_Unwind_Exception *a1)
{
}

void sub_10001F904( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10001FBE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10001FDCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SALog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000329CC(v3, v5);
  }

  +[SAURlSizersManager removeURLSizerHandler:]( &OBJC_CLASS___SAURlSizersManager,  "removeURLSizerHandler:",  *(void *)(a1 + 32));
}

id sub_10001FE38(uint64_t a1, int a2)
{
  if (a2) {
    return +[SAURlSizersManager removeURLSizerHandler:]( &OBJC_CLASS___SAURlSizersManager,  "removeURLSizerHandler:",  *(void *)(a1 + 32));
  }
  else {
    return [*(id *)(a1 + 40) setResults:*(void *)(a1 + 48)];
  }
}

void sub_10001FE5C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_6:
  return v7;
}

void sub_100020904(id a1)
{
  uint64_t v1 = (void *)qword_10005AAB8;
  qword_10005AAB8 = (uint64_t)&off_10004FC30;

  id v2 = (void *)qword_10005AAC0;
  qword_10005AAC0 = (uint64_t)&off_10004FC48;
}

void sub_100020F58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 perBundle]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100021004;
  v9[3] = &unk_10004D008;
  id v7 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

void sub_100021004(uint64_t a1, void *a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000210B4;
  v6[3] = &unk_10004CFE0;
  id v7 = a2;
  id v9 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v5 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_1000210B4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021174;
  v7[3] = &unk_10004CFB8;
  id v8 = a1[4];
  id v9 = v5;
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void sub_100021174(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021248;
  v7[3] = &unk_10004CF90;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = v5;
  id v12 = a1[7];
  id v11 = a1[6];
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void sub_100021248(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v5 unsignedLongLongValue];
  [*(id *)(a1 + 40) unsignedLongLongValue];
  [*(id *)(a1 + 48) unsignedLongLongValue];
  [v6 unsignedLongLongValue];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100021448( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002146C(uint64_t a1, void *a2, int a3, int a4, int a5, int a6, void *a7)
{
  id v73 = a2;
  id v13 = a7;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v14 = SALog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v75 = v73;
    __int16 v76 = 1024;
    *(_DWORD *)id v77 = a3;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = a4;
    LOWORD(v7_Block_object_dispose(va, 8) = 1024;
    *(_DWORD *)((char *)&v78 + 2) = a5;
    HIWORD(v7_Block_object_dispose(va, 8) = 1024;
    *(_DWORD *)v79 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "BundleID: %@, volType %u, residency %u, urgency: %u, state %u",  buf,  0x24u);
  }

  uint64_t v17 = SALog(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    __int16 v70 = (void *)objc_claimAutoreleasedReturnValue([v64 objectAtIndexedSubscript:0]);
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v61 objectAtIndexedSubscript:1]);
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:2]);
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v55 objectAtIndexedSubscript:3]);
    unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v52 objectAtIndexedSubscript:4]);
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v49 objectAtIndexedSubscript:5]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:6]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 ageGroupCount]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:7]);
    *(_DWORD *)buf = 138414082;
    id v75 = v70;
    __int16 v76 = 2112;
    *(void *)id v77 = v67;
    *(_WORD *)&v77[8] = 2112;
    v78 = v19;
    *(_WORD *)v79 = 2112;
    *(void *)&v79[2] = v20;
    __int16 v80 = 2112;
    v81 = v21;
    __int16 v82 = 2112;
    v83 = v22;
    __int16 v84 = 2112;
    v85 = v24;
    __int16 v86 = 2112;
    v87 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "age:  %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }

  uint64_t v28 = SALog(v27);
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    unint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v65 objectAtIndexedSubscript:0]);
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v62 objectAtIndexedSubscript:1]);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v59 objectAtIndexedSubscript:2]);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:3]);
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndexedSubscript:4]);
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:5]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:6]);
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeGroupCount]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndexedSubscript:7]);
    *(_DWORD *)buf = 138414082;
    id v75 = v71;
    __int16 v76 = 2112;
    *(void *)id v77 = v68;
    *(_WORD *)&v77[8] = 2112;
    v78 = v30;
    *(_WORD *)v79 = 2112;
    *(void *)&v79[2] = v31;
    __int16 v80 = 2112;
    v81 = v32;
    __int16 v82 = 2112;
    v83 = v33;
    __int16 v84 = 2112;
    v85 = v35;
    __int16 v86 = 2112;
    v87 = v37;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "size: %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }

  uint64_t v39 = SALog(v38);
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    __int16 v72 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:0]);
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v63 objectAtIndexedSubscript:1]);
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v60 objectAtIndexedSubscript:2]);
    id v57 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v57 objectAtIndexedSubscript:3]);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndexedSubscript:4]);
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:5]);
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:6]);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v13 sizeOfAgeGroupCount]);
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndexedSubscript:7]);
    *(_DWORD *)buf = 138414082;
    id v75 = v72;
    __int16 v76 = 2112;
    *(void *)id v77 = v69;
    *(_WORD *)&v77[8] = 2112;
    v78 = v41;
    *(_WORD *)v79 = 2112;
    *(void *)&v79[2] = v42;
    __int16 v80 = 2112;
    v81 = v43;
    __int16 v82 = 2112;
    v83 = v44;
    __int16 v84 = 2112;
    v85 = v46;
    __int16 v86 = 2112;
    v87 = v48;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "size: %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }
}

void sub_100021C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = SALog(a1);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Inside processEvents with %lu events",  buf,  0xCu);
  }

  if (a3)
  {
    uint64_t v10 = 0LL;
    uint64_t v49 = *(int *)(a2 + 64);
    uint64_t v47 = a2 + 16;
    uint64_t v48 = a2 + 104;
    while (!*(_BYTE *)(a2 + 2216))
    {
      id v11 = *(void **)(a2 + 8);
      if (v11) {
        void *v11 = *(void *)(a6 + 8 * v10);
      }
      if ((*(_DWORD *)(a5 + 4 * v10) & 0x10) != 0)
      {
        uint64_t v44 = SALog(v9);
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_100032D30();
        }

        [*(id *)(a2 + 2208) unlockWithCondition:1];
        return;
      }

      uint64_t v12 = *(void *)(a4 + 8 * v10);
      if (v12)
      {
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SAFSEEvent initWithFSEventString:](&OBJC_CLASS___SAFSEEvent, "initWithFSEventString:", v13));
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = [v14 dev];
          if ((_DWORD)v16 == (_DWORD)v49)
          {
            unint64_t v17 = +[SASupport getDirStatKeyForOriginID:ofMount:]( SASupport,  "getDirStatKeyForOriginID:ofMount:",  [v15 originID],  v48);
            if (v17)
            {
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[SACloneTreeWalker getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:]( &OBJC_CLASS___SACloneTreeWalker,  "getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:",  v17,  v47,  *(void *)(a2 + 2200),  *(void *)(a2 + 2192)));
              uint64_t v19 = v18;
              if (!v18
                || (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 bundlesSet]),
                    BOOL v21 = v20 == 0LL,
                    v20,
                    v21))
              {
                uint64_t v36 = SALog(v18);
                id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  id v41 = [v15 originID];
                  *(_DWORD *)buf = 134218240;
                  *(void *)&uint8_t buf[4] = v17;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v41;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "can't find dir for dir-key %llu and origin-id %llu",  buf,  0x16u);
                }
              }

              else
              {
                *(void *)buf = 0LL;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000LL;
                char v64 = 0;
                unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 bundlesSet]);
                v54[0] = _NSConcreteStackBlock;
                v54[1] = 3221225472LL;
                v54[2] = sub_1000222EC;
                v54[3] = &unk_10004D080;
                v54[4] = buf;
                [v22 enumerateObjectsUsingBlock:v54];

                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 bundlesSet]);
                uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v23));

                if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
                {
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 bundlesSet]);
                  BOOL v26 = [v25 count] == (id)1;

                  if (!v26)
                  {
                    uint64_t v28 = SALog(v27);
                    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 bundlesSet]);
                      id v31 = [v15 originID];
                      *(_DWORD *)id v57 = 138412802;
                      __int128 v58 = v30;
                      __int16 v59 = 2048;
                      id v60 = v31;
                      __int16 v61 = 2112;
                      __int128 v62 = v46;
                      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "bundle set %@ for dir-stat key %llu contains multiple bundle ids. Taking %@",  v57,  0x20u);
                    }
                  }

                  objc_msgSend( *(id *)a2,  "upsertBundleID:volType:urgency:state:residency:age:size:",  v46,  *(unsigned int *)(a2 + 2184),  objc_msgSend(v15, "urgency"),  objc_msgSend(v15, "useState"),  objc_msgSend(v15, "residency"),  objc_msgSend(v15, "purgeableATime"),  objc_msgSend(v15, "size"));
                }

                else
                {
                  uint64_t v39 = SALog(v24);
                  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id v57 = 138412290;
                    __int128 v58 = v46;
                    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "no telemetry for bundleID %@",  v57,  0xCu);
                  }
                }

                _Block_object_dispose(buf, 8);
              }
            }

            else
            {
              uint64_t v38 = SALog(0LL);
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
                sub_100032CC8(v65, v15, &v66, (os_log_s *)v19);
              }
            }
          }

          else
          {
            uint64_t v34 = SALog(v16);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
            {
              signed int v35 = [v15 dev];
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v35;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v49;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "evennt.dev (%llu) is not equal to fsid (%llu",  buf,  0x16u);
            }
          }
        }

        else
        {
          uint64_t v33 = SALog(0LL);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
            sub_100032C94(&v55, v56, (os_log_s *)v19);
          }
        }
      }

      else
      {
        uint64_t v32 = SALog(v9);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "null event string for event number %llu",  buf,  0xCu);
        }
      }

      if (a3 == ++v10) {
        return;
      }
    }

    uint64_t v42 = SALog(v9);
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_100032D5C();
    }
  }

void sub_1000222B4(_Unwind_Exception *a1)
{
}

BOOL sub_1000222EC(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  BOOL result = +[SASpeculativeDownloadAnalytics isBundleIdInHierarchy:]( &OBJC_CLASS___SASpeculativeDownloadAnalytics,  "isBundleIdInHierarchy:",  a2);
  if (result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

LABEL_13:
  return (char)v5;
}

void sub_100022468(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", &off_10004FC60));
  id v2 = (void *)qword_10005AAC8;
  qword_10005AAC8 = v1;
}

void sub_100022A6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id a33)
{
}

void sub_100022AAC(uint64_t a1)
{
  uint64_t v2 = SALog([*(id *)(a1 + 32) unlockWithCondition:1]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SDA: Release FS events stream", v4, 2u);
  }
}

void sub_100022B30(id *a1)
{
}

void sub_100022CC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a2;
  id v14 = a7;
  context = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"bundle_id"];
  __int16 v61 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v13));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appData]);
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (_BYTE *)[*(id *)(a1 + 40) diskCapacity]
                  - (_BYTE *)[*(id *)(a1 + 40) diskUsed]));
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"disk_free_space"];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v17 fixedSize] + (void)objc_msgSend(v17, "dataSize")));
  [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:@"total_size"];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v17 purgeableSize]));
  [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:@"purgeable_size"];

  BOOL v21 = *(void **)(a1 + 48);
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);
  [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:@"volume_role"];

  uint64_t v24 = *(void **)(a1 + 56);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);
  [*(id *)(a1 + 32) setObject:v26 forKeyedSubscript:@"state"];

  uint64_t v27 = *(void **)(a1 + 64);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a5));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v28]);
  [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:@"urgency"];

  id v30 = *(void **)(a1 + 72);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v31]);
  [*(id *)(a1 + 32) setObject:v32 forKeyedSubscript:@"residency_reason"];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v14 ageGroupCount]);
  id v34 = [v33 count];

  if (v34)
  {
    unint64_t v35 = 0LL;
    do
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%d",  @"age_",  v35));
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v14 ageGroupCount]);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:v35]);
      [*(id *)(a1 + 32) setObject:v38 forKeyedSubscript:v36];

      ++v35;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v14 ageGroupCount]);
      id v40 = [v39 count];
    }

    while ((unint64_t)v40 > v35);
  }

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeGroupCount]);
  id v42 = [v41 count];

  if (v42)
  {
    unint64_t v43 = 0LL;
    do
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%d",  @"size_",  v43));
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeGroupCount]);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:v43]);
      [*(id *)(a1 + 32) setObject:v46 forKeyedSubscript:v44];

      ++v43;
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeGroupCount]);
      id v48 = [v47 count];
    }

    while ((unint64_t)v48 > v43);
  }

  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeOfAgeGroupCount]);
  id v50 = [v49 count];

  if (v50)
  {
    unint64_t v51 = 0LL;
    do
    {
      unint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%d",  @"size_of_age_",  v51));
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeOfAgeGroupCount]);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndexedSubscript:v51]);
      [*(id *)(a1 + 32) setObject:v54 forKeyedSubscript:v52];

      ++v51;
      uint8_t v55 = (void *)objc_claimAutoreleasedReturnValue([v14 sizeOfAgeGroupCount]);
      id v56 = [v55 count];
    }

    while ((unint64_t)v56 > v51);
  }

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100023224;
  v62[3] = &unk_10004D0F0;
  id v63 = *(id *)(a1 + 32);
  uint64_t v57 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.speculativeDownloads", v62);
  if ((v57 & 1) == 0)
  {
    uint64_t v58 = SALog(v57);
    __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_100032FA4();
    }
  }

  objc_autoreleasePoolPop(context);
}

id sub_100023224(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10002326C(id a1)
{
  v3[0] = &off_10004FD80;
  v3[1] = &off_10004FEE8;
  v4[0] = @"TYPE_UNKNOWN";
  v4[1] = @"TYPE_USER";
  v3[2] = &off_10004FD68;
  v3[3] = &off_10004FF00;
  v4[2] = @"TYPE_DATA";
  v4[3] = @"TYPE_ENTERPRISE";
  v3[4] = &off_10004FF18;
  v4[4] = @"TYPE_LAST";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  5LL));
  uint64_t v2 = (void *)qword_10005AAD8;
  qword_10005AAD8 = v1;
}

void sub_100023384(id a1)
{
  v3[0] = &off_10004FD80;
  v3[1] = &off_10004FEE8;
  v4[0] = @"ACCESS";
  v4[1] = @"SYSTEM_DISCARDED";
  v3[2] = &off_10004FD68;
  v3[3] = &off_10004FF00;
  v4[2] = @"USER_DISCARDED";
  v4[3] = @"FOUNDATION_API_DISCARDED";
  v3[4] = &off_10004FF18;
  void v3[5] = &off_10004FF30;
  v4[4] = @"FP_API_DISCARDED";
  void v4[5] = @"REMOTE_UPDATE_POLICY_DISCARDED";
  v3[6] = &off_10004FF48;
  v3[7] = &off_10004FF60;
  v4[6] = @"CLEAR_PURGEABILITY";
  v4[7] = @"MAX";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  8LL));
  uint64_t v2 = (void *)qword_10005AAE8;
  qword_10005AAE8 = v1;
}

void sub_1000234D4(id a1)
{
  v3[0] = &off_10004FD80;
  v3[1] = &off_10004FEE8;
  v4[0] = @"NONE";
  v4[1] = @"LOW";
  v3[2] = &off_10004FD68;
  v3[3] = &off_10004FF00;
  v4[2] = @"MED";
  v4[3] = @"HIGH";
  v3[4] = &off_10004FF18;
  void v3[5] = &off_10004FF30;
  v4[4] = @"SOFTWARE_UPDATE";
  void v4[5] = @"LAST";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
  uint64_t v2 = (void *)qword_10005AAF8;
  qword_10005AAF8 = v1;
}

void sub_1000235FC(id a1)
{
  v3[0] = &off_10004FD80;
  v3[1] = &off_10004FEE8;
  v4[0] = @"RESIDENCY_NONE";
  v4[1] = @"RESIDENCY_1";
  v3[2] = &off_10004FD68;
  v3[3] = &off_10004FF00;
  v4[2] = @"RESIDENCY_2";
  v4[3] = @"RESIDENCY_3";
  v3[4] = &off_10004FF18;
  void v3[5] = &off_10004FF30;
  v4[4] = @"RESIDENCY_4";
  void v4[5] = @"RESIDENCY_LAST";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  6LL));
  uint64_t v2 = (void *)qword_10005AB08;
  qword_10005AB08 = v1;
}

void sub_1000237F4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100023BC4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100023D80(uint64_t a1)
{
  id v56 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v59 = [&off_10004FC78 countByEnumeratingWithState:&v70 objects:v96 count:16];
  if (!v59)
  {
LABEL_46:
    uint64_t v44 = v56;
    [*(id *)(a1 + 40) setSUPurgeableUrgencyData:v56];
    goto LABEL_50;
  }

  uint64_t v58 = *(void *)v71;
  id v3 = &selRef_setWithObjects_;
  *(void *)&__int128 v2 = 136315394LL;
  __int128 v55 = v2;
  uint64_t v61 = a1;
LABEL_3:
  uint64_t v4 = 0LL;
  while (1)
  {
    if (*(void *)v71 != v58) {
      objc_enumerationMutation(&off_10004FC78);
    }
    uint64_t v60 = v4;
    id v5 = *(void **)(*((void *)&v70 + 1) + 8 * v4);
    char v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5, v55));
    uint64_t v6 = (uint64_t)[v3 + 473 getFSPurgeableOnVolume:v5 purgeableUrgency:0x8000];
    uint64_t v7 = SALog(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138412546;
      *(void *)&buf.f_iosize = v5;
      WORD2(buf.f_blocks) = 2048;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Total SU purgeable urgency size for %@ is %llu",  (uint8_t *)&buf,  0x16u);
    }

    if (v6 >> 29) {
      break;
    }
LABEL_44:

    uint64_t v4 = v60 + 1;
    if ((id)(v60 + 1) == v59)
    {
      id v59 = [&off_10004FC78 countByEnumeratingWithState:&v70 objects:v96 count:16];
      if (!v59) {
        goto LABEL_46;
      }
      goto LABEL_3;
    }
  }

  uint64_t v10 = SALog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    buf.f_bsize = v55;
    *(void *)&buf.f_iosize = "-[SAPurgeableRecords asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:andDirKeyCa"
                               "cheList:]_block_invoke";
    WORD2(buf.f_blocks) = 2112;
    *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s for %@", (uint8_t *)&buf, 0x16u);
  }

  bzero(&buf, 0x878uLL);
  id v12 = v5;
  statfs((const char *)[v12 fileSystemRepresentation], &buf);
  id v57 = v12;
  id v63 = (char *)[v57 fileSystemRepresentation];
  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v14 = (char *)malloc(0x8000uLL);
  if (v14)
  {
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    v66[1] = 0LL;
    __int128 v62 = v14;
    uint64_t v69 = v14;
    v66[2] = 512LL;
    v66[0] = 4LL;
    while (1)
    {
      uint64_t v15 = objc_autoreleasePoolPush();
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activity]);
      unsigned int v17 = [v16 shouldStop];

      if (v17) {
        break;
      }
      uint64_t v19 = fsctl(v63, 0xC0404A83uLL, v66, 0);
      if ((_DWORD)v19)
      {
        uint64_t v41 = SALog(v19);
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          id v42 = __error();
          unint64_t v43 = strerror(*v42);
          *(_DWORD *)v78 = 138412546;
          *(void *)&v78[4] = v57;
          *(_WORD *)&v78[12] = 2080;
          *(void *)&v78[14] = v43;
          _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to get the purgeable records for volume %@ with error %s",  v78,  0x16u);
        }

        goto LABEL_42;
      }

      context = v15;
      unint64_t v20 = *((void *)&v68 + 1);
      if (*((void *)&v68 + 1))
      {
        unint64_t v21 = 0LL;
        unint64_t v22 = v62;
        while ((v22[9] & 0x80) == 0)
        {
LABEL_23:
          ++v21;
          v22 += 64;
          if (v20 <= v21) {
            goto LABEL_36;
          }
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 + 473 getPathOfNodeID:*(void *)v22 FSid:&buf.f_fsid]);
        uint64_t v94 = 0LL;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        *(_OWORD *)&v78[8] = 0u;
        __int128 v79 = 0u;
        *(void *)v78 = 0x200000003LL;
        id v24 = v23;
        uint64_t v25 = fsctl((const char *)[v24 UTF8String], 0xC1104A71uLL, v78, 0);
        if ((_DWORD)v25)
        {
          uint64_t v26 = SALog(v25);
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            unint64_t v35 = __error();
            uint64_t v36 = strerror(*v35);
            *(_DWORD *)__int16 v74 = 138412546;
            id v75 = v24;
            __int16 v76 = 2080;
            id v77 = v36;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to get the dirStats ID for path %@ with error %s",  v74,  0x16u);
          }

          goto LABEL_21;
        }

        if (*((void *)&v79 + 1) && (v22[9] & 0x40) == 0)
        {
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SACloneTreeWalker getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:]( &OBJC_CLASS___SACloneTreeWalker,  "getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:"));
          uint64_t v27 = v28;
          if (v28
            && (uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundlesSet](v28, "bundlesSet")),
                v29,
                v29))
          {
            id v30 = (char *)*((void *)v22 + 6);
            id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)&v79 + 1)));
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v31));

            if (v32) {
              uint64_t v33 = &v30[(void)[v32 unsignedLongLongValue]];
            }
            else {
              uint64_t v33 = v30;
            }
            id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v33));
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)&v79 + 1)));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v37, v38);

            a1 = v61;
            id v3 = &selRef_setWithObjects_;
          }

          else
          {
            uint64_t v34 = SALog(v28);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int16 v74 = 134218242;
              id v75 = (id)*((void *)&v79 + 1);
              __int16 v76 = 2112;
              id v77 = (char *)v24;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  OS_LOG_TYPE_ERROR,  "can't find saf dir for dir-key %llu file path %@",  v74,  0x16u);
            }
          }

LABEL_21:
        }

        unint64_t v20 = *((void *)&v68 + 1);
        goto LABEL_23;
      }

LABEL_36:
      objc_autoreleasePoolPop(context);
      if (!(void)v68) {
        goto LABEL_43;
      }
    }

    uint64_t v39 = SALog(v18);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", v78, 2u);
    }

LABEL_42:
    objc_autoreleasePoolPop(v15);
LABEL_43:
    free(v62);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v13, v57);

    goto LABEL_44;
  }

  id v45 = v13;
  uint64_t v46 = SALog(0LL);
  uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_100033254(v47, v48, v49, v50, v51, v52, v53, v54);
  }

  uint64_t v44 = v56;
LABEL_50:
}

uint64_t start()
{
  BOOL v0 = +[SAHelper isSAFSupported](&OBJC_CLASS___SAHelper, "isSAFSupported");
  if (v0)
  {
    uint64_t v4 = SALog(objc_autoreleasePoolPush());
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000333A4();
    }

    uint64_t v6 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.SpaceAttributiond.daily");
    -[NSBackgroundActivityScheduler setPreregistered:](v6, "setPreregistered:", 1LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_100024FD0;
    v11[3] = &unk_10004D1E8;
    id v12 = v6;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v12, "scheduleWithBlock:", v11);
    uint64_t v7 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.SpaceAttributiond.postInstall");
    -[NSBackgroundActivityScheduler setPreregistered:](v7, "setPreregistered:", 1LL);
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v7, "scheduleWithBlock:", &stru_10004D228);
    id v8 = objc_opt_new(&OBJC_CLASS___SAListenerDelegate);
    uint64_t v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.spaceattributiond");
    -[NSXPCListener setDelegate:](v9, "setDelegate:", v8);
    -[NSXPCListener resume](v9, "resume");
    dispatch_main();
  }

  uint64_t v1 = SALog(v0);
  __int128 v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Space Attribution Framework is NOT supported",  v10,  2u);
  }

  return 0LL;
}

uint64_t sub_100024FD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SALog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000333D0();
  }

  int64_t v6 = +[SAHelper runAppSizerWithActivity:completionHandler:]( &OBJC_CLASS___SAHelper,  "runAppSizerWithActivity:completionHandler:",  *(void *)(a1 + 32),  v3);
  uint64_t result = +[SASupport targetDeviceIsHomePod](&OBJC_CLASS___SASupport, "targetDeviceIsHomePod");
  if ((_DWORD)result)
  {
    if (v6 == 1) {
      return xpc_transaction_exit_clean();
    }
  }

  return result;
}

void sub_10002505C(id a1, id a2)
{
  __int128 v2 = (void (**)(id, uint64_t))a2;
  uint64_t v3 = SALog(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000333FC();
  }

  v2[2](v2, 1LL);
}

void sub_100025160(id a1)
{
  uint64_t v1 = (void *)qword_10005AB18;
  qword_10005AB18 = (uint64_t)&off_100050210;
}

void sub_10002534C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities breakCommaSeparatedStringToComponents:]( &OBJC_CLASS___SAUtilities,  "breakCommaSeparatedStringToComponents:",  v5));
  if ([v8 count] == (id)1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
    unsigned int v10 = +[SALLMList isLLM:](&OBJC_CLASS___SALLMList, "isLLM:", v9);

    if (v10)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
      id v11 = (char *)[v6 dataSize];
      id v12 = &v11[(void)[v6 fixedSize]];
      id v13 = (char *)[v6 purgeableSize];
      LOBYTE(v12) = v12 < v13;
      uint64_t v14 = SALog(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = v15;
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100033428((uint64_t)v8, v6, v16);
        }
      }

      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)statfs buf = 138413058;
          uint64_t v28 = v8;
          __int16 v29 = 2048;
          id v30 = [v6 dataSize];
          __int16 v31 = 2048;
          id v32 = [v6 fixedSize];
          __int16 v33 = 2048;
          id v34 = [v6 purgeableSize];
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Classify LLM %@ to System (data: %llu, fixed: %llu, purgeable: %llu)",  buf,  0x2Au);
        }

        uint64_t v25 = (char *)[v6 dataSize];
        id v17 = [v6 fixedSize];
        uint64_t v18 = (char *)[v6 purgeableSize];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) systemDetails]);
        objc_sync_enter(v19);
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) systemDetails]);
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v26]);

        int64_t v22 = &v25[(void)v17] - v18;
        if (v21) {
          v22 += (int64_t)[v21 unsignedLongLongValue];
        }
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22));

        id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) systemDetails]);
        [v24 setValue:v23 forKey:v26];

        objc_sync_exit(v19);
        [*(id *)(a1 + 32) updateAppSet:*(void *)(a1 + 40) withAppSize:v6];
        objc_msgSend( *(id *)(a1 + 48),  "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:",  *(void *)(a1 + 40),  0,  objc_msgSend(v6, "fixedSize"),  objc_msgSend(v6, "dataSize"),  objc_msgSend(v6, "cloneSize"),  objc_msgSend(v6, "purgeableSize"));
        [*(id *)(a1 + 32) removeBundleSet:v8];
      }
    }
  }

  objc_autoreleasePoolPop(v7);
}

void sub_100025674(_Unwind_Exception *a1)
{
}

uint64_t sub_100026750(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v8)
  {
    if (a3 != 1)
    {
      uint64_t v23 = SALog(0LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        uint64_t v25 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "unexpected options 0x%lx",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_4;
    }

    unint64_t v13 = +[SASupport getInodeIDForPath:](&OBJC_CLASS___SASupport, "getInodeIDForPath:", v7);
    unint64_t v14 = +[SASupport getCloneDstreamIDForPath:](&OBJC_CLASS___SASupport, "getCloneDstreamIDForPath:", v7);
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 128LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));
    if (([v15 containsObject:v16] & 1) == 0)
    {
      id v17 = *(void **)(*(void *)(a1 + 32) + 136LL);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      LOBYTE(v17) = [v17 containsObject:v18];

      if ((v17 & 1) != 0)
      {
LABEL_14:
        unint64_t v21 = *(void **)(*(void *)(a1 + 32) + 136LL);
        int64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
        [v21 addObject:v22];

        goto LABEL_5;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SATraverse getFileSize:](&OBJC_CLASS___SATraverse, "getFileSize:", v7));
      if ([v16 isFileCloned]
        && +[SACloneTreeWalker isNodeID:oldestForDStreamID:forVolPath:]( &OBJC_CLASS___SACloneTreeWalker,  "isNodeID:oldestForDStreamID:forVolPath:",  v13,  v14,  v7))
      {
        uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 128LL);
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v14));
        [v19 addObject:v20];

        objc_msgSend(v16, "setDataSize:", objc_msgSend(v16, "cloneSize"));
      }

      [*(id *)(a1 + 40) updateWithSizeInfo:v16];
    }

    goto LABEL_14;
  }

  uint64_t v10 = SALog(v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1000339E8();
  }
LABEL_4:

LABEL_5:
  return 0LL;
}

LABEL_17:
  id v17 = 0;
LABEL_18:
  objc_autoreleasePoolPop(v14);
  if (v17)
  {
    uint64_t v18 = v31;
    uint64_t v19 = v24;
    v31[3] = *((void *)&v24 + 1);
    unint64_t v20 = v39;
    v39[3] = v25;
    v35[3] = v19;
    unint64_t v21 = *((void *)&v25 + 1);
    v27[3] = v19 - (v18[3] + v20[3]);
    -[SAItemSizeInfo setUsedDirStat:](v7, "setUsedDirStat:", 1LL);
  }

  else
  {
    unint64_t v21 = 0LL;
  }

  -[SAItemSizeInfo setDataSize:](v7, "setDataSize:", v27[3]);
  -[SAItemSizeInfo setCloneSize:](v7, "setCloneSize:", v39[3]);
  -[SAItemSizeInfo setPhysicalSize:](v7, "setPhysicalSize:", v35[3]);
  -[SAItemSizeInfo setPurgeableSize:](v7, "setPurgeableSize:", v31[3]);
  -[SAItemSizeInfo setDirstatsID:](v7, "setDirstatsID:", v21);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v7;
}

void sub_100026F54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_100026FA8(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = SALog(v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000339E8();
    }
  }

  else if (a3 == 1)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SATraverse getFileSize:](&OBJC_CLASS___SATraverse, "getFileSize:", v7));
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) += -[os_log_s dataSize](v11, "dataSize");
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) += -[os_log_s cloneSize](v11, "cloneSize");
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) += -[os_log_s purgeableSize](v11, "purgeableSize");
    *(void *)(*(void *)(a1[7] + 8LL) + 24LL) += -[os_log_s physicalSize](v11, "physicalSize");
  }

  else
  {
    uint64_t v12 = SALog(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100033A9C(a3, v11, v13, v14, v15, v16, v17, v18);
    }
  }

  return 0LL;
}

void sub_100027670(id a1, NSError *a2)
{
  __int128 v2 = a2;
  uint64_t v3 = SALog(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100033B40(v2, v5);
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully created radar draft", v6, 2u);
    }

    +[SATapToRadar updateLastTTRNotificationDate](&OBJC_CLASS___SATapToRadar, "updateLastTTRNotificationDate");
  }
}

uint64_t sub_1000277D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 48);
  if (v4 < (int)[v3 urgency] && !*(_BYTE *)(a1 + 52))
  {
    uint64_t v34 = 1LL;
    goto LABEL_39;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 bundleRecords]);
  id v5 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v5)
  {
    uint64_t v34 = 1LL;
    goto LABEL_38;
  }

  id v7 = v5;
  uint64_t v8 = *(void *)v40;
  uint64_t v9 = &off_10004FCC0;
  *(void *)&__int128 v6 = 138412290LL;
  __int128 v36 = v6;
  uint64_t v38 = v3;
  while (2)
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
      uint64_t v12 = objc_autoreleasePoolPush();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      uint64_t v14 = *(void **)(a1 + 32);
      if (v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v13]);

        if (v15)
        {
          uint64_t v16 = v9;
          id v17 = v7;
          uint64_t v18 = v8;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUsed]);
          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v13]);
          if (v19)
          {
            unint64_t v21 = (char *)[v19 compare:v20];

            BOOL v22 = v21 + 1 == 0LL;
            id v3 = v38;
            if (!v22) {
              goto LABEL_15;
            }
            unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v13]);
          }

          objc_msgSend(v3, "setLastUsed:", v20, v36);

LABEL_15:
          uint64_t v8 = v18;
          id v7 = v17;
          uint64_t v9 = v16;
        }
      }

      objc_autoreleasePoolPop(v12);
      if (([v3 isPlugin] & 1) == 0)
      {
        id v23 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v24 = [v9 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v44;
          while (2)
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v44 != v26) {
                objc_enumerationMutation(v9);
              }
              id v28 = objc_msgSend(v23, "hasPrefix:", *(void *)(*((void *)&v43 + 1) + 8 * (void)j), v36);
              if ((_DWORD)v28)
              {
                uint64_t v32 = SALog(v28);
                __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)statfs buf = v36;
                  id v49 = v23;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "skipping excluded id %@",  buf,  0xCu);
                }

                id v3 = v38;
                goto LABEL_31;
              }
            }

            id v25 = [v9 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        signed int v29 = [v38 urgency];
        signed int v30 = *(_DWORD *)(a1 + 48);

        BOOL v31 = v29 <= v30;
        id v3 = v38;
        if (v31) {
          [v38 getAppCacheSize:1];
        }
      }

LABEL_31:
      if (*(_BYTE *)(a1 + 52) || (int)[v3 urgency] <= *(_DWORD *)(a1 + 48))
      {
        uint64_t v34 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
        goto LABEL_38;
      }
    }

    id v7 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    uint64_t v34 = 1LL;
    if (v7) {
      continue;
    }
    break;
  }

LABEL_38:
LABEL_39:
  return v34;
}

        if (!v13)
        {
          if (v39) {
            goto LABEL_41;
          }
          goto LABEL_21;
        }

        goto LABEL_39;
      }

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s containingBundleRecord](v16, "containingBundleRecord"));
      id v28 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
      signed int v29 = objc_opt_isKindOfClass(v27, v28);

      if ((v29 & 1) != 0)
      {
        BOOL v31 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s containingBundleRecord](v16, "containingBundleRecord"));
        uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
        __int16 v33 = sub_1000121D4( (const char *)[v32 UTF8String], 2, (uint64_t)objc_msgSend(v31, "platform"), (uint64_t)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), 0, *(void *)(a1 + 72));
        uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);

        unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v31));
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
        LOBYTE(v76) = 0;
        __int128 v85 = (void *)v34;
        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[SAAppPath appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( &OBJC_CLASS___SAAppPath,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v35,  v36,  v34,  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 80),  0LL,  v76));

        uint64_t v38 = v37;
        __int128 v39 = v37 != 0LL;
        if (!v37)
        {
LABEL_34:
          if (v85)
          {
            uint64_t v13 = 0LL;
          }

          else
          {
            __int128 v73 = v38;
            uint64_t v13 = v38;
            uint64_t v38 = v73;
          }

          goto LABEL_38;
        }

        __int128 v81 = v37;
        id obj = v37;
        objc_sync_enter(obj);
        __int128 v40 = objc_claimAutoreleasedReturnValue(-[os_log_s executableURL](v16, "executableURL"));
        __int128 v41 = sub_1000126D4((const char *)[v40 fileSystemRepresentation]);
        __int128 v82 = (id)objc_claimAutoreleasedReturnValue(v41);
        __int128 v80 = v39;

        __int128 v86 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        __int128 v83 = objc_claimAutoreleasedReturnValue(-[os_log_s executableURL](v16, "executableURL"));
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v83 fileSystemRepresentation]));
        __int128 v84 = (void *)objc_claimAutoreleasedReturnValue([obj binaryURLs]);
        __int128 v43 = objc_claimAutoreleasedReturnValue([v84 objectAtIndexedSubscript:0]);
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v43 fileSystemRepresentation]));
        if ([v42 hasPrefix:v44])
        {
        }

        else
        {
          __int128 v79 = (void *)objc_claimAutoreleasedReturnValue([obj binaryURLs]);
          id v77 = v82;
          id v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v77 fileSystemRepresentation]));
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v59,  1LL));
          v78 = [v79 containsObject:v60];

          if ((v78 & 1) != 0)
          {
LABEL_29:
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([obj binaryURLs]);
            __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v86, "allObjects"));
            [v61 addObjectsFromArray:v62];

            id v63 = (void *)objc_claimAutoreleasedReturnValue([obj writersIDs]);
            char v64 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundleIdentifier](v16, "bundleIdentifier"));
            __int128 v65 = [v63 containsObject:v64];

            if ((v65 & 1) == 0)
            {
              uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([obj writersIDs]);
              __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundleIdentifier](v16, "bundleIdentifier"));
              [v66 addObject:v67];
            }

            __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([obj uniqueURLs]);
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dataContainerURL](v16, "dataContainerURL"));
            __int128 v70 = [v68 containsObject:v69];

            if ((v70 & 1) == 0)
            {
              __int128 v71 = (void *)objc_claimAutoreleasedReturnValue([obj uniqueURLs]);
              __int128 v72 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dataContainerURL](v16, "dataContainerURL"));
              [v71 addObject:v72];
            }

            objc_sync_exit(obj);
            __int128 v39 = v80;
            uint64_t v38 = v81;
            goto LABEL_34;
          }

          __int128 v83 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", [v77 fileSystemRepresentation]));
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v83,  1LL));
          -[NSMutableSet addObject:](v86, "addObject:", v42);
        }

        goto LABEL_29;
      }

      uint64_t v48 = SALog(v30);
      id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_100033F44(v16, v49);
      }
    }

    else
    {
      __int128 v45 = SALog(v25);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100034034((void *)(a1 + 32), v16);
      }
    }

void sub_100027CF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100027D24(uint64_t a1, uint64_t a2)
{
  int v4 = objc_autoreleasePoolPush();
  uint64_t path = container_get_path(a2);
  if (path)
  {
    uint64_t v6 = path;
    uint64_t v7 = SALog(path);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100033CD8();
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v6,  1LL,  0LL));
    uint64_t v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  container_get_identifier(a2));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  objc_autoreleasePoolPop(v4);
  return v12;
}

void sub_100028124(_Unwind_Exception *a1)
{
}

uint64_t sub_100028154(uint64_t a1, uint64_t a2)
{
  int v4 = objc_autoreleasePoolPush();
  uint64_t path = container_get_path(a2);
  if (path)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  path,  1LL,  0LL));
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  container_get_identifier(a2));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = SALog(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100033D38();
    }

    uint64_t persona_unique_string = container_get_persona_unique_string(a2);
    if (persona_unique_string)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  persona_unique_string));
      v17[0] = v8;
      v17[1] = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    }

    else
    {
      uint64_t v16 = v8;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
      uint64_t v12 = 0LL;
    }

    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) addObject:v13];
  }

  uint64_t v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  objc_autoreleasePoolPop(v4);
  return v14;
}

void sub_1000282F4(uint64_t a1, uint64_t a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a2]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a2]);
  id v7 = [v6 count];

  id v10 = 0LL;
  if ((unint64_t)v7 >= 2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a2]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:a2]);
  +[SAQuery getAppPathForContainer:identifier:containerClass:personaString:existingQuery:block:]( &OBJC_CLASS___SAQuery,  "getAppPathForContainer:identifier:containerClass:personaString:existingQuery:block:",  v9,  v5,  *(void *)(a1 + 56),  v10,  *(void *)(a1 + 64),  *(void *)(a1 + 48));
}

void sub_1000285F0(_Unwind_Exception *a1)
{
}

uint64_t sub_100028610(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_autoreleasePoolPush();
  id v5 = v4;
  if (!v3)
  {
    uint64_t v15 = SALog(v4);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100033E80(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_20;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  uint64_t v9 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord);
    uint64_t v25 = objc_opt_isKindOfClass(v9, v24);
    if ((v25 & 1) != 0)
    {
      uint64_t v16 = (os_log_s *)*(id *)(a1 + 32);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s containingBundleRecord](v16, "containingBundleRecord"));

      if (!v26)
      {
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v16));
        LOBYTE(v76) = 0;
        id v31 = (id)objc_claimAutoreleasedReturnValue( +[SAAppPath appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( &OBJC_CLASS___SAAppPath,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v46,  *(void *)(a1 + 48),  v3,  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 80),  1LL,  v76));

        if (v31)
        {
          id v31 = v31;
          BOOL v39 = 0;
          uint64_t v13 = (os_log_s *)v31;
        }

        else
        {
          uint64_t v57 = SALog(v47);
          uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            sub_100033EB0(v16, v58);
          }

          BOOL v39 = 0;
          uint64_t v13 = 0LL;
        }

LABEL_39:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_40:

LABEL_41:
  objc_autoreleasePoolPop(v5);
  uint64_t v74 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);

  return v74;
}

void sub_100028D3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_100029270(_Unwind_Exception *a1)
{
}

uint64_t sub_1000292A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000292B0(uint64_t a1)
{
}

void sub_1000292B8(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getLSBundleRecordForBundle:](&OBJC_CLASS___SAQuery, "getLSBundleRecordForBundle:", a2));
  if (v3)
  {
    id v5 = v3;
    unsigned __int8 v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v3];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
      id v3 = v5;
    }
  }
}

void sub_100029330(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getVendorNameFromBundleRecord:](&OBJC_CLASS___SAQuery, "getVendorNameFromBundleRecord:", a2));
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v9 = *(void **)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    uint64_t v8 = v9;
    uint64_t v13 = v5;
    if (v9)
    {
      unsigned __int8 v10 = [v8 isEqual:v5];
      id v5 = v13;
      if ((v10 & 1) == 0)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = 0LL;

        id v5 = v13;
        *a3 = 1;
      }
    }

    else
    {
      objc_storeStrong(v7, v5);
      id v5 = v13;
    }
  }
}

  ;
}

void sub_100029FE8(_Unwind_Exception *a1)
{
}

void sub_10002A0E0(_Unwind_Exception *a1)
{
}

void sub_10002A1C0(_Unwind_Exception *a1)
{
}

void sub_10002A258(_Unwind_Exception *a1)
{
}

void sub_10002A320(_Unwind_Exception *a1)
{
}

void sub_10002AC40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002ACE8(_Unwind_Exception *a1)
{
}

void sub_10002AD68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002AE14(_Unwind_Exception *a1)
{
}

void sub_10002AF00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002AFA8(_Unwind_Exception *a1)
{
}

void sub_10002B028( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_8:
  -[SATelemetryManager addValue:forDirStatsTotalsInfoEntry:](self, "addValue:forDirStatsTotalsInfoEntry:", 1LL, 5LL);
  if (v6) {
LABEL_5:
  }
    -[SATelemetryManager addValue:forDirStatsTotalsInfoEntry:](self, "addValue:forDirStatsTotalsInfoEntry:", 1LL, 6LL);
}

void sub_10002B19C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002B244(_Unwind_Exception *a1)
{
}

void sub_10002B2C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002B3D0(_Unwind_Exception *a1)
{
}

void sub_10002B4F0(_Unwind_Exception *a1)
{
}

BOOL sub_10002B634(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
  id v11 = [v8 getValueForAppInfoEntry:v9 forBundleSet:v10];

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
  id v15 = [v13 getValueForAppInfoEntry:v12 forBundleSet:v14];

  objc_autoreleasePoolPop(v7);
  return v11 < v15;
}

void sub_10002C1A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities breakCommaSeparatedStringToComponents:]( &OBJC_CLASS___SAUtilities,  "breakCommaSeparatedStringToComponents:",  v5));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 getVendorValueforBundleSet:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities breakCommaSeparatedStringToComponents:]( &OBJC_CLASS___SAUtilities,  "breakCommaSeparatedStringToComponents:",  v10));
  id v12 = [v11 count];
  if ((unint64_t)v12 >= 2)
  {
    uint64_t v13 = SALog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "-[SATelemetryManager removeAppsWithMultipleVendors]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: blocking %@ for vendors %@",  (uint8_t *)&v15,  0x20u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v5];
  }

  objc_autoreleasePoolPop(v7);
}

id sub_10002CA48(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeInfo];
}

id sub_10002CA50(uint64_t a1)
{
  return [*(id *)(a1 + 32) totalsInfo];
}

id sub_10002CA58(uint64_t a1)
{
  return [*(id *)(a1 + 32) totalsDstatsInfo];
}

id sub_10002CA60(uint64_t a1)
{
  return [*(id *)(a1 + 32) thirdPartyfilteredInfo];
}

id sub_10002CA68(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstPartyfilteredInfo];
}

id sub_10002CA70(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appsInfo]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  return v3;
}

id sub_10002CAB4(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appsInfo]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  return v3;
}

void sub_10002CB38(id a1)
{
  v3[0] = &off_10004FF78;
  v3[1] = &off_10004FF90;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_10004FFA8;
  v3[3] = &off_10004FFC0;
  v4[2] = @"bundle_id";
  v4[3] = @"vendor";
  v3[4] = &off_10004FFD8;
  void v3[5] = &off_10004FFF0;
  v4[4] = @"icloud_plan";
  void v4[5] = @"saf_options";
  void v3[6] = &off_100050008;
  v3[7] = &off_100050020;
  void v4[6] = @"app_index";
  v4[7] = @"bundle_id_count";
  void v3[8] = &off_100050038;
  v3[9] = &off_100050050;
  void v4[8] = @"dirstat_data_size";
  v4[9] = @"dirstat_purgeables";
  v3[10] = &off_100050068;
  v3[11] = &off_100050080;
  v4[10] = @"dirstat_clones";
  v4[11] = @"dirstat_count";
  v3[12] = &off_100050098;
  v3[13] = &off_1000500B0;
  v4[12] = @"tag_data_size";
  v4[13] = @"tag_purgeables";
  v3[14] = &off_1000500C8;
  v3[15] = &off_1000500E0;
  v4[14] = @"tag_clones";
  v4[15] = @"tag_count";
  v3[16] = &off_1000500F8;
  v3[17] = &off_100050110;
  uint8_t v4[16] = @"clone_data_size";
  v4[17] = @"clone_clone_size";
  v3[18] = &off_100050128;
  v3[19] = &off_100050140;
  v4[18] = @"clone_purgeable_size";
  v4[19] = @"cd_app_cache_purgeable";
  v3[20] = &off_100050158;
  v3[21] = &off_100050170;
  v4[20] = @"cd_plugin_purgeable";
  v4[21] = @"spi_fixed_size";
  v3[22] = &off_100050188;
  v3[23] = &off_1000501A0;
  v4[22] = @"spi_data_size";
  v4[23] = @"spi_purgeable_size";
  v3[24] = &off_1000501B8;
  v3[25] = &off_1000501D0;
  v4[24] = @"spi_clone_size";
  v4[25] = @"bundle_id_group";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  26LL));
  __int128 v2 = (void *)qword_10005AB38;
  qword_10005AB38 = v1;
}

void sub_10002CDF8(id a1)
{
  v3[0] = &off_10004FF78;
  v3[1] = &off_10004FF90;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_10004FFA8;
  v3[3] = &off_10004FFD8;
  v4[2] = @"icloud_plan";
  v4[3] = @"app_index";
  v3[4] = &off_10004FFF0;
  void v3[5] = &off_10004FFC0;
  v4[4] = @"bundle_id_count";
  void v4[5] = @"saf_options";
  void v3[6] = &off_100050008;
  v3[7] = &off_100050020;
  void v4[6] = @"dirstat_data_size";
  v4[7] = @"dirstat_purgeables";
  void v3[8] = &off_100050038;
  v3[9] = &off_100050050;
  void v4[8] = @"dirstat_clones";
  v4[9] = @"dirstat_count";
  v3[10] = &off_100050068;
  v3[11] = &off_100050098;
  v4[10] = @"tag_data_size";
  v4[11] = @"tag_purgeables";
  v3[12] = &off_100050080;
  v3[13] = &off_1000500B0;
  v4[12] = @"dirstat_count";
  v4[13] = @"tag_clones";
  v3[14] = &off_1000500C8;
  v3[15] = &off_1000500E0;
  v4[14] = @"tag_count";
  v4[15] = @"cd_app_cache_purgeable";
  v3[16] = &off_1000500F8;
  v3[17] = &off_100050110;
  uint8_t v4[16] = @"cd_plugin_purgeable";
  v4[17] = @"spi_fixed_size";
  v3[18] = &off_100050128;
  v3[19] = &off_100050140;
  v4[18] = @"spi_data_size";
  v4[19] = @"spi_purgeable_size";
  v3[20] = &off_100050158;
  v3[21] = &off_100050170;
  v4[20] = @"spi_clone_size";
  v4[21] = @"apfs_used_block";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  22LL));
  __int128 v2 = (void *)qword_10005AB48;
  qword_10005AB48 = v1;
}

void sub_10002D060(id a1)
{
  v3[0] = &off_10004FF78;
  v3[1] = &off_10004FF90;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_10004FFA8;
  v3[3] = &off_10004FFC0;
  v4[2] = @"bundle_id_count";
  v4[3] = @"dirstat_data_size";
  v3[4] = &off_10004FFD8;
  void v3[5] = &off_10004FFF0;
  v4[4] = @"dirstat_purgeables";
  void v4[5] = @"dirstat_clones";
  void v3[6] = &off_100050008;
  void v4[6] = @"dirstat_count";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
  __int128 v2 = (void *)qword_10005AB58;
  qword_10005AB58 = v1;
}

void sub_10002D1A0(id a1)
{
  v3[0] = &off_10004FF78;
  v3[1] = &off_10004FF90;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_10004FFA8;
  v3[3] = &off_10004FFC0;
  v4[2] = @"app_index";
  v4[3] = @"dirstat_data_size";
  v3[4] = &off_10004FFD8;
  void v3[5] = &off_10004FFF0;
  v4[4] = @"tag_data_size";
  void v4[5] = @"spi_fixed_size";
  void v3[6] = &off_100050008;
  void v3[7] = &off_100050020;
  void v4[6] = @"spi_data_size";
  void v4[7] = @"spi_purgeable_size";
  void v3[8] = &off_100050038;
  v3[9] = &off_100050050;
  void v4[8] = @"spi_clone_size";
  v4[9] = @"tag_purgeables";
  v3[10] = &off_100050068;
  v4[10] = @"dirstat_purgeables";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
  __int128 v2 = (void *)qword_10005AB68;
  qword_10005AB68 = v1;
}

void sub_10002DD80(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"icloud_plan";
  v3[3] = @"app_index";
  v4[2] = @"icloud_plan";
  v4[3] = @"total_app_count";
  v3[4] = @"dirstat_data_size";
  void v3[5] = @"tag_data_size";
  v4[4] = @"total_dir_stat_processing_time";
  void v4[5] = @"total_tag_record_processing_time";
  void v3[6] = @"spi_fixed_size";
  void v3[7] = @"spi_data_size";
  void v4[6] = @"total_fixed_size_calculation_time";
  void v4[7] = @"total_app_sizer_run_time";
  void v3[8] = @"spi_purgeable_size";
  v3[9] = @"spi_clone_size";
  void v4[8] = @"total_cache_delete_query_time";
  v4[9] = @"total_clone_mapping_time";
  v3[10] = @"tag_purgeables";
  void v3[11] = @"dirstat_purgeables";
  v4[10] = @"total_purgeable_tags_time";
  void v4[11] = @"software_updates_query_time";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
  __int128 v2 = (void *)qword_10005AB78;
  qword_10005AB78 = v1;
}

void sub_10002E040(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"bundle_id_count";
  v3[3] = @"dirstat_data_size";
  v4[2] = @"total_number_of_paths";
  v4[3] = @"total_number_of_dirstat_enabled_paths";
  v3[4] = @"dirstat_purgeables";
  void v3[5] = @"dirstat_clones";
  v4[4] = @"total_number_of_dirstat_used_paths";
  void v4[5] = @"total_number_of_dirstat_failed_paths";
  void v3[6] = @"dirstat_count";
  void v4[6] = @"total_number_of_dirstat_skipped_paths";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
  __int128 v2 = (void *)qword_10005AB88;
  qword_10005AB88 = v1;
}

void sub_10002E2A8(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"icloud_plan";
  v3[3] = @"app_index";
  v4[2] = @"icloud_plan";
  v4[3] = @"total_app_count";
  v3[4] = @"bundle_id_count";
  void v3[5] = @"saf_options";
  v4[4] = @"total_enterprise_volumes_count";
  void v4[5] = @"total_purgeable_tags_count";
  void v3[6] = @"dirstat_data_size";
  void v3[7] = @"dirstat_purgeables";
  void v4[6] = @"total_dirstat_data_size";
  void v4[7] = @"total_dirstat_purgeable_size";
  void v3[8] = @"dirstat_clones";
  v3[9] = @"tag_data_size";
  void v4[8] = @"total_dirstat_clone_size";
  v4[9] = @"total_tag_attributed_data_size";
  v3[10] = @"tag_purgeables";
  void v3[11] = @"dirstat_count";
  v4[10] = @"total_hidden_purgeable_tags_size";
  void v4[11] = @"total_visible_purgeable_tags_size";
  void v3[12] = @"tag_clones";
  v3[13] = @"tag_count";
  void v4[12] = @"total_tag_attributed_clone_size";
  v4[13] = @"total_tag_attribution_count";
  v3[14] = @"cd_app_cache_purgeable";
  v3[15] = @"cd_plugin_purgeable";
  v4[14] = @"total_cache_delete_app_cache_purgeable_size";
  v4[15] = @"total_cache_delete_plugin_purgeable_size";
  v3[16] = @"spi_fixed_size";
  v3[17] = @"spi_data_size";
  uint8_t v4[16] = @"system_volume_size";
  v4[17] = @"system_data_size";
  v3[18] = @"spi_purgeable_size";
  v3[19] = @"spi_clone_size";
  v4[18] = @"total_purgeable_size";
  v4[19] = @"total_clone_size";
  v3[20] = @"apfs_used_block";
  v4[20] = @"total_apfs_used_block_count";
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  21LL));
  __int128 v2 = (void *)qword_10005AB98;
  qword_10005AB98 = v1;
}

void sub_10002E6DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10002E700(void *a1, int a2, os_log_s *a3)
{
  int v4 = 136315650;
  id v5 = "+[SAUtilities splitArray:into:]";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  unsigned int v9 = [a1 count];
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: number of parts (%d) is higher than the supplied array count (%d). can't split array",  (uint8_t *)&v4,  0x18u);
}

void sub_10002E7A8(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  id v3 = "+[SAUtilities splitArray:into:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: number of parts (%d) must be > 0",  (uint8_t *)&v2,  0x12u);
}

void sub_10002E830( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E8A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E910( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E980( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E9F0()
{
}

void sub_10002EA1C()
{
}

void sub_10002EA48()
{
}

void sub_10002EA74()
{
}

void sub_10002EAA0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EBF0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EC60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002ECD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002ED40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EDB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EE20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EE90()
{
}

void sub_10002EEBC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)statfs buf = 136315650;
  *(void *)(buf + 4) = "-[SAHelper registerPaths:reply:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = @"/var/db/spaceattribution";
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to create folder at (%@) with - %@",  buf,  0x20u);
}

void sub_10002EF34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EFA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F014( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F084()
{
}

void sub_10002F0F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F160( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F1D0()
{
}

void sub_10002F1FC()
{
}

void sub_10002F268(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 24LL);
  uint64_t v4 = *(void *)(*(void *)a2 + 24LL);
  int v5 = 136315650;
  uint8_t v6 = "-[SAHelper computeSizeOfSystemVolume:]";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s:end:sysVollUsed:%llu:totalCapacity:%llu",  (uint8_t *)&v5,  0x20u);
}

void sub_10002F30C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F37C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F3E4(void *a1, int a2, os_log_s *a3)
{
  int v5 = 136315394;
  id v6 = [a1 fileSystemRepresentation];
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Can't get mounted on volume of %s, statfs returned %d",  (uint8_t *)&v5,  0x12u);
  sub_100008CDC();
}

void sub_10002F47C(void *a1, os_log_s *a2)
{
  int v4 = 136315394;
  int v5 = "-[SAHelper computeSizeOfVolumeAtURL:options:completionHandler:]";
  __int16 v6 = 2080;
  id v7 = [a1 fileSystemRepresentation];
  sub_100008CE8((void *)&_mh_execute_header, a2, v3, "%s:start:%s", (uint8_t *)&v4);
  sub_100008CDC();
}

void sub_10002F50C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F57C()
{
}

void sub_10002F5EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F65C()
{
}

void sub_10002F6CC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "appSizerMaxRerunTimeout set to %u",  (uint8_t *)v2,  8u);
  sub_100008C70();
}

void sub_10002F73C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F7AC()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100008CE8((void *)&_mh_execute_header, v0, v1, "%s:importing plist from %@", (uint8_t *)v2);
  sub_100008C48();
}

void sub_10002F81C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F88C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F8FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F96C()
{
}

void sub_10002F998()
{
}

void sub_10002F9C4()
{
}

void sub_10002F9F0()
{
}

void sub_10002FA1C()
{
}

void sub_10002FA7C()
{
}

void sub_10002FAE4()
{
}

void sub_10002FB4C()
{
}

void sub_10002FBAC()
{
}

void sub_10002FC0C()
{
}

void sub_10002FC6C()
{
}

void sub_10002FCCC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 666;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%d SAAppPath: cannot create an SAAppPath without an identifier and LSRecord(s)!",  (uint8_t *)v1,  8u);
  sub_100008C70();
}

void sub_10002FD44(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_100011B5C( (void *)&_mh_execute_header,  a3,  v6,  "Failed to get application record for app %@ with error %@",  (uint8_t *)&v7);
}

void sub_10002FDEC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  v5[0] = 136315394;
  sub_100008C78();
  sub_100011B5C( (void *)&_mh_execute_header,  a2,  v4,  "%s: No LSApplicationRecord was found for app %@. Assuming invisible app by default.",  (uint8_t *)v5);

  sub_100011BD0();
}

void sub_10002FE7C()
{
}

void sub_10002FEA8()
{
}

void sub_10002FF08(int a1, os_log_s *a2)
{
}

void sub_10002FF80()
{
}

void sub_10002FFAC(os_log_s *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a1, v3, "gettimeofday failed: %s", v4);
  sub_100011BD0();
}

void sub_10003002C()
{
}

void sub_10003008C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000300FC()
{
}

void sub_10003015C()
{
}

void sub_1000301BC()
{
}

void sub_1000301E8()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100011B5C((void *)&_mh_execute_header, v0, v1, "%s: incorrect sharedURLs type for bundleID %@", (uint8_t *)v2);
  sub_100008C48();
}

void sub_100030258()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100011B5C((void *)&_mh_execute_header, v0, v1, "%s: incorrect uniqueURLs type for bundleID %@", (uint8_t *)v2);
  sub_100008C48();
}

void sub_1000302C8()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100011B5C((void *)&_mh_execute_header, v0, v1, "%s: incorrect writersIDs type for bundleID %@", (uint8_t *)v2);
  sub_100008C48();
}

void sub_100030338()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100011B5C((void *)&_mh_execute_header, v0, v1, "%s: missing identifier for bundleID %@", (uint8_t *)v2);
  sub_100008C48();
}

void sub_1000303A8()
{
}

void sub_100030410()
{
}

void sub_100030478()
{
}

void sub_1000304D8()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100008CE8( (void *)&_mh_execute_header,  v0,  v1,  "%s: bundle (%@) doesn't have AppPath, creating one",  (uint8_t *)v2);
  sub_100008C48();
}

void sub_100030548()
{
  int v2 = 136315650;
  sub_100011BA0();
  sub_100011BBC((void *)&_mh_execute_header, v0, v1, "%s: Adding unique path (%@) to bundle (%@)", v2);
  sub_100011BD0();
}

void sub_1000305B8()
{
  int v2 = 136315650;
  sub_100011BA0();
  sub_100011BBC((void *)&_mh_execute_header, v0, v1, "%s: Adding shared path (%@) to bundle (%@)", v2);
  sub_100011BD0();
}

void sub_100030628()
{
  v2[0] = 136315394;
  sub_100008C78();
  sub_100008CE8( (void *)&_mh_execute_header,  v0,  v1,  "%s: bundle (%@) doesn't have AppPath, creating one",  (uint8_t *)v2);
  sub_100008C48();
}

void sub_100030698()
{
}

void sub_1000306F8()
{
}

void sub_100030758(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_100011BD8(a1, a2), "path");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *uint64_t v3 = 138412290;
  void *v2 = v5;
  sub_100011B8C((void *)&_mh_execute_header, v6, v7, "Path (%@) is already registered as unique");

  sub_100011BEC();
}

void sub_1000307A8(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_100011BD8(a1, a2), "path");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *uint64_t v3 = 138412290;
  void *v2 = v5;
  sub_100011B8C((void *)&_mh_execute_header, v6, v7, "Path %@ is already claimed by another bundles-set");

  sub_100011BEC();
}

void sub_1000307F8()
{
}

void sub_10003085C()
{
}

void sub_1000308C0(char a1, void *a2, os_log_s *a3)
{
  if ((a1 & 1) != 0) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
  }
  uint64_t v5 = (void *)v4;
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a3, v6, "Unable to get fs purgeable information: %@", v7);

  sub_100008CDC();
}

void sub_100030968()
{
}

void sub_1000309D4()
{
}

void sub_100030A38()
{
  uint64_t v2 = __error();
  int v3 = 136315650;
  uint64_t v4 = "+[SASupport isItemMountedOnSystemVolume:]";
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  __int16 v7 = 2080;
  int v8 = sub_100014704(v2);
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: statfs failed for %@ with error %s",  (uint8_t *)&v3,  0x20u);
}

void sub_100030AE4()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Enabled APFSIOC_DIR_STATS_OP for %s with flags 0x%llx",  v2,  0x16u);
  sub_100008C48();
}

void sub_100030B60(int a1, int a2, os_log_s *a3, int a4, int a5, int a6, int a7, int a8)
{
}

void sub_100030BD4()
{
  sub_1000146C8( (void *)&_mh_execute_header,  v0,  v1,  "DirStatForOriginID: APFSIOC_DIR_STATS_OP for %llu returned errno %u",  v2,  v3,  v4,  v5,  v6);
  sub_100008CDC();
}

void sub_100030C40()
{
  sub_1000146C8( (void *)&_mh_execute_header,  v0,  v1,  "INodeForDirStatKey: APFSIOC_DIR_STATS_OP for %llu returned errno %u",  v2,  v3,  v4,  v5,  v6);
  sub_100008CDC();
}

void sub_100030CAC()
{
}

void sub_100030D10()
{
}

void sub_100030D74()
{
}

void sub_100030DD8()
{
}

void sub_100030E3C(int a1, int a2, os_log_s *a3, int a4, int a5, int a6, int a7, int a8)
{
}

void sub_100030EB0()
{
}

void sub_100030F14()
{
}

void sub_100030F78()
{
}

void sub_100030FDC()
{
  uint64_t v0 = __error();
  sub_100014704(v0);
  sub_1000146DC();
  sub_100014744( (void *)&_mh_execute_header,  v1,  v2,  "%s: Failed to resolve path (%s) with error %d (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_100014758();
}

void sub_100031064()
{
  uint64_t v0 = __error();
  sub_100014704(v0);
  sub_1000146DC();
  sub_100014744( (void *)&_mh_execute_header,  v1,  v2,  "%s: Failed to get path (%s) mount point with error %d (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_100014758();
}

void sub_1000310EC(int a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "fsgetpath returned errno %d for nodeID %llu",  (uint8_t *)v3,  0x12u);
  sub_100008C48();
}

void sub_10003116C(os_log_s *a1)
{
  uint64_t v2 = sub_10001473C();
  sub_100014704(v2);
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a1, v3, "fsctl APFSIOC_GET_PURGEABLE_FILE_FLAGS failed with error: %s", v4);
  sub_100008CDC();
}

void sub_1000311E0(os_log_s *a1)
{
  uint64_t v2 = sub_10001473C();
  sub_100014704(v2);
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a1, v3, "fsctl APFSIOC_GET_CLONE_INFO failed with error: %s", v4);
  sub_100008CDC();
}

void sub_100031254()
{
}

void sub_1000312B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 12);
  uint64_t v4 = *(void *)(a2 + 20);
  uint64_t v5 = *(void *)(a2 + 4);
  int v6 = 136316162;
  __int16 v7 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
  __int16 v8 = 2080;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v4;
  __int16 v14 = 2048;
  uint64_t v15 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s:%s:used:%llu:reserved:%llu:capacity:%llu",  (uint8_t *)&v6,  0x34u);
}

void sub_10003136C()
{
  uint64_t v0 = sub_10001473C();
  sub_100014704(v0);
  __error();
  sub_10001470C();
  sub_1000146C8((void *)&_mh_execute_header, v1, v2, "unable to get mounts: %s (%d)\n", v3, v4, v5, v6, v7);
  sub_100008CDC();
}

void sub_1000313E4(uint8_t *a1, char **a2, os_log_s *a3)
{
  uint64_t v6 = __error();
  uint8_t v7 = sub_100014704(v6);
  *(_DWORD *)a1 = 136315138;
  *a2 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "APFSIOC_GET_VOLUME_ROLE returned with error: %s",  a1,  0xCu);
}

void sub_10003144C(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000160E4((void *)&_mh_execute_header, a1, v3, "APFSIOC_DIR_STATS_OP returned errno %u", (uint8_t *)v4);
  sub_100008C48();
}

void sub_1000314CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031530(uint64_t a1, os_log_s *a2)
{
  int v4 = *__error();
  int v6 = 134218240;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_1000160F0((void *)&_mh_execute_header, a2, v5, "APFSIOC_DIR_STATS_OP for %llu returned errno %u", (uint8_t *)&v6);
}

void sub_1000315C8(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 120000LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "can't malloc %llu bytes",  (uint8_t *)&v1,  0xCu);
  sub_100008C48();
}

void sub_100031644( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000316A8()
{
}

void sub_100031728(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000160E4((void *)&_mh_execute_header, a2, a3, "statfs returned %d", (uint8_t *)v3);
}

void sub_100031794( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000317F8(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "+[SACloneTreeWalker isNodeID:oldestForDStreamID:forVolPath:]";
  __int16 v3 = 2048;
  uint64_t v4 = 120000LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s can't malloc %llu bytes",  (uint8_t *)&v1,  0x16u);
  sub_100008C48();
}

void sub_100031888(int a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "+[SACloneTreeWalker isNodeID:oldestForDStreamID:forVolPath:]";
  __int16 v5 = 1024;
  int v6 = a1;
  sub_1000160F0((void *)&_mh_execute_header, a2, a3, "%s statfs returned %d", (uint8_t *)&v3);
  sub_100008C48();
}

void sub_100031904(uint64_t a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a2, v4, "Can't find bundles set associated with path (%@)", v5);

  sub_100008CDC();
}

void sub_100031988(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_100011B50((void *)&_mh_execute_header, a2, a3, "Unknown run mode %lu", (uint8_t *)&v4);
  sub_100008C48();
}

void sub_1000319F4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  int v4 = "-[SAAppSizerScan initiatePathsScanWithBlocksNum:withRunMode:withActivity:scanOptions:withReplyBlock:]";
  sub_100011B50( (void *)&_mh_execute_header,  a1,  a3,  "%s : An XPC activity must be supplied with run mode SAAppSizerModeCheckDefer",  (uint8_t *)&v3);
  sub_100008C48();
}

void sub_100031A68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031AD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031B48( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031B78()
{
}

void sub_100031BD8()
{
  int v3 = 138412290;
  uint64_t v4 = v0;
  sub_100011B50( (void *)&_mh_execute_header,  v1,  v2,  "Failed to retrieve software update state with error: %@",  (uint8_t *)&v3);
  sub_100008C48();
}

void sub_100031C40(void *a1, os_log_s *a2)
{
  int v4 = 136315394;
  uint64_t v5 = "-[SAVolumeScanner updateAppSizerResultsWithSUPurgeableUrgencySizes]_block_invoke";
  sub_10001E7FC();
  sub_100011B5C( (void *)&_mh_execute_header,  a2,  v3,  "%s failed to find bundleSet for dirKey %llu in the dirKeyCache",  (uint8_t *)&v4);
  sub_100008CDC();
}

void sub_100031CC4(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_100011B5C( (void *)&_mh_execute_header,  a4,  a3,  "unreportedSize (%llu) is larger than totalHiddenAppSize (%llu).",  (uint8_t *)a1);
}

void sub_100031D10()
{
}

void sub_100031D78()
{
}

void sub_100031DE0(void *a1, os_log_s *a2)
{
  id v4 = [a1 totalPurgeableDataSize];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 appSizerResults]);
  [v5 diskUsed];
  int v7 = 134218240;
  id v8 = v4;
  sub_10001E7FC();
  sub_100011B5C( (void *)&_mh_execute_header,  a2,  v6,  "totalPurgeableDataSize %llu is greater than diskUsed (%llu). Ignoring totalPurgeableDataSize value",  (uint8_t *)&v7);

  sub_1000160D4();
}

void sub_100031E80()
{
}

void sub_100031EE4(void *a1, uint64_t a2, os_log_s *a3)
{
  int v6 = 134218240;
  id v7 = [a1 totalPurgeableDataSize];
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  sub_100011B5C( (void *)&_mh_execute_header,  a3,  v5,  "Can't adjust totalPurgeableDataSize (%llu) by %llu",  (uint8_t *)&v6);
  sub_100008CDC();
}

void sub_100031F6C(void *a1, os_log_s *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 appSizerResults]);
  id v5 = [v4 diskUsed];
  [a1 totalPurgeableDataSize];
  int v7 = 134218240;
  id v8 = v5;
  sub_10001E7FC();
  sub_100011B5C( (void *)&_mh_execute_header,  a2,  v6,  "Reported CD-Purgeables is too large. Adjusting diskUsed to %llu, and totalPurgeableDataSize to %llu",  (uint8_t *)&v7);

  sub_1000160D4();
}

void sub_10003200C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100011B68();
  sub_100011B50((void *)&_mh_execute_header, a2, v4, "Failed to get the size of software update volume with %@", v5);

  sub_100008CDC();
}

void sub_10003208C()
{
}

void sub_1000320F0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing system app", v1, 2u);
  sub_100008C70();
}

void sub_10003212C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100011B50( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unable to get CACHE_DELETE_TOTAL_AVAILABLE, purgeable size is set to 0: %@",  (uint8_t *)a2);
}

void sub_100032178( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000321A8()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_100011B5C((void *)&_mh_execute_header, v1, (uint64_t)v1, "CloneTreeWalker returned %@ for %@", v2);
  sub_100008C48();
}

void sub_100032220(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100011B68();
  sub_100011B50( (void *)&_mh_execute_header,  a2,  v4,  "Can't add system volume capacity and used info, because SAVolumeSizer encountered issues: %@",  v5);

  sub_100008CDC();
}

void sub_1000322A4()
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)v0 + 8LL) + 40LL);
  int v4 = 138412802;
  id v5 = @"/private/var";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Volume %@, CACHE_DELETE_TOTAL_AVAILABLE %@, CACHE_DELETE_PURGEABLE_CLONES %@",  (uint8_t *)&v4,  0x20u);
}

void sub_100032344(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  __int16 v10 = v5;
  sub_100011B5C( (void *)&_mh_execute_header,  a3,  v6,  "Can't add volume used info for %@, because SAVolumeSizer encountered issues: %@",  (uint8_t *)&v7);

  sub_1000160D4();
}

void sub_1000323E0(id *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = 134218240;
  uint64_t v6 = a2;
  sub_10001E7FC();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "overprovisioning_file: physicalSize (%llu), adjusting dataVolumeSizeUsed to (%llu)",  (uint8_t *)&v5,  0x16u);
  sub_100008CDC();
}

void sub_10003246C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "/private/var/.overprovisioning_file";
  sub_100011B50((void *)&_mh_execute_header, a1, a3, "Can't get size of %s", (uint8_t *)&v3);
  sub_100008C48();
}

void sub_1000324E0()
{
}

void sub_100032540()
{
}

void sub_1000325B8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unkown handler id (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_10003262C()
{
}

void sub_1000326A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000326D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003270C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 136315394;
  uint64_t v5 = "+[SACallbackManager callAppSizeHandlersWithResults:error:]_block_invoke";
  __int16 v6 = 2112;
  int v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to get client proxy with error: %@\nRemoving the handler from active handlers list",  (uint8_t *)&v4,  0x16u);

  sub_100008CDC();
}

void sub_1000327AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Calling url sizer handler with results",  v1,  2u);
}

void sub_1000327EC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v5 = 138412290;
  __int16 v6 = v3;
  sub_10001FE5C((void *)&_mh_execute_header, a2, v4, "No active URL sizer found for ID %@", (uint8_t *)&v5);

  sub_100008CDC();
}

void sub_100032874(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "removeURLSizerHandler: the provided handler ID (%@) is not active at the moment",  (uint8_t *)&v2,  0xCu);
  sub_100008C48();
}

void sub_1000328E4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "+[SAURlSizersManager callURLSizer:withResults:error:]";
  sub_10001FE5C((void *)&_mh_execute_header, a1, a3, "%s end", (uint8_t *)&v3);
  sub_100008C48();
}

void sub_100032958(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "+[SAURlSizersManager callURLSizer:withResults:error:]";
  sub_10001FE5C((void *)&_mh_execute_header, a1, a3, "%s start", (uint8_t *)&v3);
  sub_100008C48();
}

void sub_1000329CC(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 136315394;
  int v5 = "+[SAURlSizersManager callURLSizer:withResults:error:]_block_invoke";
  __int16 v6 = 2112;
  int v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Failed to get client proxy with error: %@\nRemoving the the sizer configuration",  (uint8_t *)&v4,  0x16u);

  sub_100008CDC();
}

void sub_100032A6C()
{
}

void sub_100032ACC(void *a1)
{
}

void sub_100032B3C(void *a1)
{
}

void sub_100032BAC()
{
}

void sub_100032C0C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 pathToDisk]);
  sub_100011B68();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "can't write to file %@", v4, 0xCu);

  sub_100008CDC();
}

void sub_100032C94(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000237F4((void *)&_mh_execute_header, a3, (uint64_t)a3, "can't parse eventStr", a1);
}

void sub_100032CC8(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  id v7 = [a2 originID];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "can't find dir-key origin id %llu", a1, 0xCu);
}

void sub_100032D30()
{
}

void sub_100032D5C()
{
}

void sub_100032D8C()
{
}

void sub_100032DEC(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Saving last event id %llu for vol %@",  (uint8_t *)&v4,  0x16u);
  sub_100008C48();
}

void sub_100032E70()
{
}

void sub_100032E9C(int a1, os_log_s *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "APFSIOC_GET_VOLUME_ROLE returned %d (errno = %d)",  (uint8_t *)v5,  0xEu);
  sub_100008CDC();
}

void sub_100032F34(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "statfs returned %d", (uint8_t *)v2, 8u);
  sub_100008C70();
}

void sub_100032FA4()
{
}

void sub_100032FD4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100023BC4( (void *)&_mh_execute_header,  a2,  a3,  "APFSIOC_VOL_ATTRIBUTION_TAG for User volume returned %i",  a5,  a6,  a7,  a8,  0);
  sub_100008C70();
}

void sub_100033038( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100023BC4( (void *)&_mh_execute_header,  a2,  a3,  "APFSIOC_VOL_ATTRIBUTION_TAG for Data volume returned %i",  a5,  a6,  a7,  a8,  0);
  sub_100008C70();
}

void sub_10003309C(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Can't find name for hash %llu",  (uint8_t *)&v2,  0xCu);
}

void sub_100033110( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003317C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100023BC4((void *)&_mh_execute_header, a2, a3, "APFSIOC_LIST_ATTRIBUTION_TAGS returned err %d", a5, a6, a7, a8, 0);
  sub_100008C70();
}

void sub_1000331E0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "processAttributionTagsForVol for %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100033254( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000332C4(void *a1, os_log_s *a2)
{
  int v3 = 134217984;
  id v4 = [a1 runMode];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown run mode %lu", (uint8_t *)&v3, 0xCu);
}

void sub_10003334C()
{
}

void sub_100033378()
{
}

void sub_1000333A4()
{
}

void sub_1000333D0()
{
}

void sub_1000333FC()
{
}

void sub_100033428(uint64_t a1, void *a2, os_log_s *a3)
{
  int v5 = 138413058;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  id v8 = [a2 dataSize];
  __int16 v9 = 2048;
  id v10 = [a2 fixedSize];
  __int16 v11 = 2048;
  id v12 = [a2 purgeableSize];
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Can't classify LLM %@ to System (data: %llu, fixed: %llu, purgeable: %llu)",  (uint8_t *)&v5,  0x2Au);
}

void sub_100033500(uint64_t a1, os_log_s *a2)
{
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "stat: execution time %f sec",  (uint8_t *)&v4,  0xCu);
}

void sub_100033590()
{
}

void sub_1000335F4()
{
}

void sub_100033658()
{
}

void sub_1000336BC()
{
}

void sub_100033720()
{
}

void sub_100033784()
{
}

void sub_1000337E8()
{
}

void sub_10003384C()
{
}

void sub_1000338B0()
{
}

void sub_100033914( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033978()
{
}

void sub_1000339E8()
{
}

void sub_100033A50(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = a1;
  sub_100011B5C((void *)&_mh_execute_header, a4, a3, "Failed fstatfs on directory (%@) with error %s", (uint8_t *)a2);
}

void sub_100033A9C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033B00(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "sending Tap-To-Radar notification", v1, 2u);
}

void sub_100033B40(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 136315394;
  uint64_t v5 = "+[SATapToRadar sendTapToRadarNotificationWithDescription:highPriorityProblem:]_block_invoke";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: error creating radar draft: %@",  (uint8_t *)&v4,  0x16u);
}

void sub_100033BE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033C18()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100008C48();
}

void sub_100033C78()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100008C48();
}

void sub_100033CD8()
{
}

void sub_100033D38()
{
}

void sub_100033DA8()
{
}

void sub_100033E18( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033E80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008CB8((void *)&_mh_execute_header, a1, a3, "data container path is not returned:", a5, a6, a7, a8, 0);
  sub_100008C70();
}

void sub_100033EB0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  v4[0] = 67109378;
  sub_1000293C8();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%d unable to create SAAppPath for extension: %@",  (uint8_t *)v4,  0x12u);

  sub_100008CDC();
}

void sub_100033F44(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 containingBundleRecord]);
  uint64_t v5 = objc_opt_class(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 containingBundleRecord]);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v8[0] = 67109634;
  v8[1] = 355;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%d enumerateAppPathsOnVolume encountered containing bundle record class: %@ : %@",  (uint8_t *)v8,  0x1Cu);
}

void sub_100034034(void *a1, os_log_s *a2)
{
  v3[0] = 67109378;
  sub_1000293C8();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%d enumerateAppPathsOnVolume skipping record class: %@",  (uint8_t *)v3,  0x12u);
  sub_100008CDC();
}

void sub_1000340BC()
{
}

void sub_10003411C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034180( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000341E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Saved RunTimeDataManager version and current version mismatch",  v1,  2u);
}

void sub_100034224( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034288(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "+[SARunTimeDataManager setRunTimeDataObject:forKey:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to write %@ data to disk with error %@",  (uint8_t *)&v3,  0x20u);
}

void sub_10003431C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003438C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000343FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003446C()
{
}

void sub_1000344D8()
{
}

void sub_100034544()
{
}

void sub_100034570()
{
}

void sub_10003459C()
{
}

void sub_1000345C8()
{
}

void sub_1000345F4()
{
}

void sub_100034620()
{
}

void sub_10003468C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034710()
{
}

void sub_10003477C()
{
}

void sub_1000347E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003486C()
{
}

void sub_1000348D8()
{
}

id objc_msgSend_addAttributedCloneToBundleSet_withCloneSize_withPurgeableSize_onCloneData_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttributedCloneToBundleSet:withCloneSize:withPurgeableSize:onCloneData:");
}

id objc_msgSend_addClonePathOfCloneID_FSId_dataSize_purgeableSize_dirStatKey_attributionTag_bundleSet_cloneData_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addClonePathOfCloneID:FSId:dataSize:purgeableSize:dirStatKey:attributionTag:bundleSet:cloneData:");
}

id objc_msgSend_appPathWithRecords_identifier_dataContainerURL_personaUniqueString_isDataSeparated_isPlugin_isGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "appPathWithRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:");
}

id objc_msgSend_asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList_andDirKeyCacheList_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:andDirKeyCacheList:");
}

id objc_msgSend_fillFilteredInfoDict_withNumberOfApps_withAppInfoArr_withFilterCriteria_withMetricType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fillFilteredInfoDict:withNumberOfApps:withAppInfoArr:withFilterCriteria:withMetricType:");
}

id objc_msgSend_getAppPathForContainer_identifier_containerClass_personaString_existingQuery_block_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAppPathForContainer:identifier:containerClass:personaString:existingQuery:block:");
}

id objc_msgSend_getBundlesSetOfInode_withDirKey_andTag_inVolume_usingPathList_andDirKeyCache_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBundlesSetOfInode:withDirKey:andTag:inVolume:usingPathList:andDirKeyCache:");
}

id objc_msgSend_initWithBundleRecords_identifier_dataContainerURL_personaUniqueString_isDataSeparated_isPlugin_isGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithBundleRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:");
}

id objc_msgSend_initWithDataSize_cloneSize_purgeableSize_dirStatKey_attributionTag_clonePath_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataSize:cloneSize:purgeableSize:dirStatKey:attributionTag:clonePath:");
}

id objc_msgSend_initiatePathsScanWithBlocksNum_withRunMode_withActivity_scanOptions_withReplyBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiatePathsScanWithBlocksNum:withRunMode:withActivity:scanOptions:withReplyBlock:");
}

id objc_msgSend_newWithDataSize_cloneSize_purgeableSize_dirStatKey_attributionTag_clonePath_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newWithDataSize:cloneSize:purgeableSize:dirStatKey:attributionTag:clonePath:");
}

id objc_msgSend_processCloneMapOnVol_pathList_appSizeBreakdownList_dirKeyCache_collectClonesPaths_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCloneMapOnVol:pathList:appSizeBreakdownList:dirKeyCache:collectClonesPaths:reply:");
}

id objc_msgSend_runAppSizerWithAsyncBlocksNum_withRunMode_withActivity_withScanOptions_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runAppSizerWithAsyncBlocksNum:withRunMode:withActivity:withScanOptions:error:");
}

id objc_msgSend_updateAppSet_fixedSize_dataSize_cloneSize_purgeableSize_FSPurgeableSize_physicalSize_appCacheSize_CDPluginSize_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:");
}

id objc_msgSend_updateAppSizeBreakdownList_FSId_dataSize_attributionTag_bundleSet_appSizeBreakdownList_pathList_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAppSizeBreakdownList:FSId:dataSize:attributionTag:bundleSet:appSizeBreakdownList:pathList:");
}

id objc_msgSend_zeroSizeAppsFiltering(void *a1, const char *a2, ...)
{
  return [a1 zeroSizeAppsFiltering];
}