void sub_100004664( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004680(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004690(uint64_t a1)
{
}

uint64_t sub_100004698(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_22:
    v22 = v13;
    [v11 addObject:v13];

    uint64_t v10 = 1LL;
    goto LABEL_23;
  }

  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v14 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_string_get_string_ptr(v5),  4LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v15 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v16 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v19 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithXPCDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithXPCDictionary:",  v5));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v20 = *(void **)(a1 + 32);
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = [v20 initWithXPCArray:v5];
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v21 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)xpc_date_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }

  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10008FEF4(a2, v8, v9);
  }

  uint64_t v10 = 0LL;
LABEL_23:

  return v10;
}

void sub_100004A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100004A30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    xpc_object_t v11 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    v15 = v11;
    xpc_array_append_value(v10, v11);

    goto LABEL_6;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData, v9);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v14 = v6;
    xpc_object_t v11 = xpc_data_create([v14 bytes], (size_t)objc_msgSend(v14, "length"));
    goto LABEL_5;
  }

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  if ((objc_opt_isKindOfClass(v6, v16) & 1) != 0)
  {
    id v18 = v6;
    if (!strcmp((const char *)[v18 objCType], "i")
      || (id v19 = v18, !strcmp((const char *)[v19 objCType], "s"))
      || (id v20 = v19, !strcmp((const char *)[v20 objCType], "q"))
      || (id v21 = v20, !strcmp((const char *)[v21 objCType], "q")))
    {
      v30 = *(void **)(a1 + 32);
      xpc_object_t v31 = xpc_int64_create((int64_t)[v18 longLongValue]);
    }

    else
    {
      id v22 = v21;
      if (!strcmp((const char *)[v22 objCType], "f")
        || (id v23 = v22, !strcmp((const char *)[v23 objCType], "d")))
      {
        v30 = *(void **)(a1 + 32);
        [v22 doubleValue];
        xpc_object_t v31 = xpc_double_create(v39);
      }

      else
      {
        id v24 = v23;
        if (strcmp((const char *)[v24 objCType], "B"))
        {
          id v25 = v24;
          if (strcmp((const char *)[v25 objCType], "c"))
          {
            id v26 = sub_10003A95C();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_10008FF60(v25, v27);
            }

            *a4 = 1;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
            goto LABEL_23;
          }
        }

        v30 = *(void **)(a1 + 32);
        xpc_object_t v31 = xpc_BOOL_create((BOOL)[v24 BOOLValue]);
      }
    }

    v32 = v31;
    xpc_array_append_value(v30, v31);

LABEL_23:
    goto LABEL_6;
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
  if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    xpc_object_t v11 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 xpcArrayFromArray]);
    goto LABEL_5;
  }

  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSDictionary, v29);
  if ((objc_opt_isKindOfClass(v6, v33) & 1) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    xpc_object_t v11 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 createXPCDictionary]);
    goto LABEL_5;
  }

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDate, v34);
  if ((objc_opt_isKindOfClass(v6, v35) & 1) != 0)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    xpc_object_t v11 = xpc_date_create((uint64_t)v36);
    goto LABEL_5;
  }

  id v37 = sub_10003A95C();
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_10008FFE4(v38);
  }

  *a4 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
LABEL_6:
}

void sub_100004D84(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000050A4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDConfigurationProfileManager);
  v2 = (void *)qword_100125210;
  qword_100125210 = (uint64_t)v1;
}

LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_9;
  }

  xpc_object_t v11 = [v5 isEqualToString:@"com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"];
  uint64_t v12 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      id v18 = 138543362;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unknown profile type: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    goto LABEL_16;
  }

  if (v13)
  {
    LOWORD(v1_Block_object_dispose(va, 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Installing restrictions configuration profile.",  (uint8_t *)&v18,  2u);
  }

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 getSupervisedRestrictions]);
  uint64_t v9 = -[MSDConfigurationProfileManager installRestrictionsConfigurationProfile:]( self,  "installRestrictionsConfigurationProfile:",  v8);
LABEL_9:

  return v9;
}

    uint64_t v29 = 1;
    goto LABEL_17;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 fileCachePathFromSourcePath:0 forBackgroundDownload:v8]);
  xpc_object_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v7]);

  v15 = sub_10003AAAC();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = -[MSDOperation signpostId](self, "signpostId");
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v18 = v17;
    if (os_signpost_enabled(v16))
    {
      v32 = 138412290;
      uint64_t v33 = v7;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v18,  "Download File",  "File download hash: %{xcode:string}@",  (uint8_t *)&v32,  0xCu);
    }
  }

  id v19 = -[MSDInstallableFileDownloadOperation _downloadInstallableFile:ofHash:toPath:]( self,  "_downloadInstallableFile:ofHash:toPath:",  v5,  v7,  v11);
  id v20 = sub_10003AAAC();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = -[MSDOperation signpostId](self, "signpostId");
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v23 = v22;
    if (os_signpost_enabled(v21))
    {
      v32 = 67109120;
      LODWORD(v33) = v19;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v23,  "Download File",  "File download result: %{xcode:BOOLean}d",  (uint8_t *)&v32,  8u);
    }
  }

  if (v19)
  {
    id v24 = [v3 fileSizeInCache:v7];
    id v25 = sub_10003AAAC();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    v27 = -[MSDOperation signpostId](self, "signpostId");
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v28 = v27;
      if (os_signpost_enabled(v26))
      {
        v32 = 134217984;
        uint64_t v33 = v24;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_EVENT,  v28,  "File Downloaded",  "File download size: %{xcode:size-in-bytes}llu",  (uint8_t *)&v32,  0xCu);
      }
    }

    goto LABEL_16;
  }

  -[MSDOperation setRetryable:](self, "setRetryable:", 1LL);
  xpc_object_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));

  if (v31)
  {
    uint64_t v29 = 0;
    goto LABEL_18;
  }

  xpc_object_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744736LL,  @"An error has occurred."));
  -[MSDOperation setError:](self, "setError:", v11);
  uint64_t v29 = 0;
LABEL_17:

LABEL_18:
  return v29;
}

LABEL_13:
            uint64_t v12 = sub_10003A95C();
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              id v21 = v11;
              _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to remove profile: %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            id v14 = sub_10003A95C();
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              id v21 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unknown profile identifier found: %{public}@, Marking as removed.",  buf,  0xCu);
            }
          }

          continue;
        }

        if (!-[MSDConfigurationProfileManager uninstallConfigurationProfileIfNeeded:]( self,  "uninstallConfigurationProfileIfNeeded:",  v11)) {
          goto LABEL_13;
        }
      }

      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }
}
}
}

  return v12;
}

  return (char)v8;
}

  return (char)v9;
}

  v41 = 1;
  v15 = v66;
  uint64_t v13 = v67;
LABEL_14:
  v71[0] = v6;
  v71[1] = v11;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
  [v3 removeWorkDirectories:v42];

  return v41;
}

  uint64_t v17 = 0LL;
  do
  {
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
    id v18 = v17++ >= v5;
  }

  while (!v18 || (int)v5 < 1);
}

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v11));

LABEL_14:
  return v18;
}

  uint64_t v29 = sub_10003A95C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v31 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "A certificate for non-manual signing is used.",  v31,  2u);
  }

  xpc_object_t v11 = 0;
LABEL_16:

  return v11;
}

  id v6 = sub_10003A95C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPlatform platformType](v2, "platformType"));
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[MSDPlatform init]";
    uint64_t v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: PlatformType '%{public}@'.", buf, 0x16u);
  }

  return v2;
}

  return v19;
}

  return v8;
}

void sub_1000059B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000059C8(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    id v6 = sub_10003A95C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009022C();
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005C10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100005C20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
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

void sub_1000062CC(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDAppPrivacyPermissionsHelper);
  v2 = (void *)qword_100125220;
  qword_100125220 = (uint64_t)v1;
}

LABEL_20:
LABEL_21:
        xpc_object_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v26 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
      uint64_t v9 = v26;
    }

    while (v26);
  }
}

    id v20 = 0;
    goto LABEL_21;
  }

  if (!v12 || !-[__CFString length](v12, "length"))
  {
    if (a6)
    {
      v94 = NSLocalizedDescriptionKey;
      v95 = @"Missing timestamp header in HTTP request";
      id v18 = &v95;
      id v19 = &v94;
      goto LABEL_18;
    }

    goto LABEL_20;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)-[__CFString integerValue](v12, "integerValue") / 1000.0));
  if (v13)
  {
    if (defaultAlgorithm == -1) {
      defaultAlgorithm = self->_defaultAlgorithm;
    }
    if (defaultAlgorithm >= 6)
    {
      if (a6)
      {
        v90 = NSLocalizedDescriptionKey;
        v91 = @"Invalid HMAC algorithm";
        uint64_t v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
        uint64_t v17 = 2LL;
        goto LABEL_26;
      }
    }

    else
    {
      id v14 = qword_1000BD6D8[defaultAlgorithm];
      v15 = -[NSData length](self->_key, "length");
      v72 = v14;
      if (v15 >= v14)
      {
        if (!v10) {
          uint64_t v10 = self->_defaultIncludedHeaders;
        }
        v70 = self;
        id v22 = v10;
        uint64_t v10 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet _lowercaseSet](v10, "_lowercaseSet"));

        if (qword_1001252D0 != -1) {
          dispatch_once(&qword_1001252D0, &stru_1000F9A80);
        }
        if (!-[NSSet containsObject:](v10, "containsObject:", qword_1001252D8))
        {
          id v23 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](v10, "setByAddingObject:", qword_1001252D8));

          uint64_t v10 = (NSSet *)v23;
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v10, "allObjects"));
        v73 = (id)objc_claimAutoreleasedReturnValue([v24 sortedArrayUsingSelector:"compare:"]);

        v75 = CFHTTPMessageCopyRequestURL(a3);
        id v25 = (__CFString *)CFHTTPMessageCopyRequestMethod(a3);
        v27 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v26);
        v71 = v25;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v25, "lowercaseString"));
        LODWORD(v7_Block_object_dispose(va, 8) = [v27 _addHMACComponent:v28 error:a6];

        v76 = v27;
        if (!(_DWORD)v78) {
          goto LABEL_55;
        }
        uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v75, "path"));
        v30 = v29;
        if (!v29) {
          uint64_t v29 = @"/";
        }
        xpc_object_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v29, "lowercaseString"));
        LODWORD(v7_Block_object_dispose(va, 8) = [v76 _addHMACComponent:v31 error:a6];

        if ((_DWORD)v78)
        {
          v32 = v75;
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL query](v75, "query"));
          v69 = v33;
          if (v33
            && [v33 length]
            && (uint64_t v34 = [v76 _addHMACComponent:v69 error:a6], v35 = v69, !v34))
          {
            id v20 = 0;
            uint64_t v16 = v73;
            v48 = v71;
          }

          else
          {
            v68 = v13;
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            double v36 = (CFDataRef)v73;
            v78 = -[__CFData countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v79,  v87,  16LL);
            if (v78)
            {
              v77 = *(uint64_t **)v80;
              v67 = v10;
              v74 = v36;
              while (2)
              {
                for (i = 0LL; i != v78; i = (char *)i + 1)
                {
                  v38 = *(const __CFString **)(*((void *)&v79 + 1) + 8LL * (void)i);
                  double v39 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, v38);
                  v40 = v39;
                  if (v39)
                  {
                    v41 = v39;
                    v42 = -[__CFString length](v39, "length");
                    v40 = v41;
                    if (v42)
                    {
                      if (![v76 _addHMACComponent:v38 error:a6])
                      {
                        id v20 = 0;
                        uint64_t v16 = v73;
                        v48 = v71;
                        v40 = v41;
                        uint64_t v10 = v67;
                        uint64_t v13 = v68;
                        goto LABEL_69;
                      }

                      v43 = [v76 _addHMACComponent:v41 error:a6];
                      v40 = v41;
                      double v36 = v74;
                      if (!v43)
                      {
                        id v20 = 0;
                        uint64_t v10 = v67;
                        uint64_t v13 = v68;
                        goto LABEL_64;
                      }
                    }
                  }
                }

                uint64_t v10 = v67;
                v78 = -[__CFData countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v79,  v87,  16LL);
                if (v78) {
                  continue;
                }
                break;
              }
            }

            v44 = CFHTTPMessageCopyBody(a3);
            v45 = v44;
            if (v44 && -[__CFData length](v44, "length"))
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v45, "base64EncodedStringWithOptions:", 0LL));
              v47 = v76;
              [v76 addObject:v46];
            }

            else
            {
              v47 = v76;
              [v76 addObject:&stru_1000FB848];
            }

            v49 = (void *)objc_claimAutoreleasedReturnValue([v47 componentsJoinedByString:@"|"]);
            v50 = objc_claimAutoreleasedReturnValue([v49 dataUsingEncoding:1]);

            v40 = (void *)v50;
            uint64_t v13 = v68;
            v74 = v45;
            if (v50)
            {
              v77 = &v65;
              __chkstk_darwin(v51);
              v53 = (char *)&v65 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              v54 = v70;
              v56 = v55;
              v66 = -[NSData bytes](v70->_key, "bytes");
              v70 = -[NSData length](v54->_key, "length");
              v78 = v56;
              v57 = v56;
              v58 = [v57 bytes];
              v59 = [v57 length];
              CCHmac(defaultAlgorithm, v66, (size_t)v70, v58, (size_t)v59, v53);
              v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v53,  v72,  0LL));
              v61 = (void *)objc_claimAutoreleasedReturnValue([v60 base64EncodedStringWithOptions:0]);

              v62 = [v61 isEqualToString:v11];
              id v20 = v62;
              if (a6 && (v62 & 1) == 0)
              {
                v83 = NSLocalizedDescriptionKey;
                v84 = @"HMAC verification failed";
                v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
                *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  5LL,  v63));
              }

              v40 = v78;
LABEL_64:
              uint64_t v16 = v73;
              v48 = v71;
            }

            else
            {
              v48 = v71;
              if (a6)
              {
                v85 = NSLocalizedDescriptionKey;
                v86 = @"Cannot encode HMAC text";
                v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
                *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  1LL,  v64));

                v40 = 0LL;
              }

              id v20 = 0;
              uint64_t v16 = v73;
            }

LABEL_21:
          -[MSDDemoUpdateController setBusy:](v13, "setBusy:", 0LL);
          goto LABEL_22;
        }
      }
    }

    v32 = 0;
    goto LABEL_21;
  }

  v55 = sub_10003A95C();
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    sub_100098474();
  }

  v60 = 0LL;
  v15 = 0LL;
  id v19 = 0LL;
  v32 = 0;
LABEL_22:

  objc_sync_exit(v13);
  return v32;
}
}

    v59 = v5;
    v60 = a3;

    id v25 = 0LL;
    id v26 = 0LL;
    v27 = 0LL;
    v15 = 0LL;
    goto LABEL_21;
  }

  xpc_object_t v11 = sub_10003A95C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v69 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Loading account settings from file: %{public}@",  buf,  0xCu);
  }

  uint64_t v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  v67 = 0LL;
  v15 = -[NSDictionary initWithContentsOfURL:error:](v13, "initWithContentsOfURL:error:", v14, &v67);
  uint64_t v16 = v67;

  uint64_t v17 = sub_10003A95C();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if (!v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100099130(v16, v19);
    }

    goto LABEL_16;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v69 = (MSDGetAccountSettingsRequest *)v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Account settings successfully loaded: %{public}@",  buf,  0xCu);
  }
}

    if (-[NSMutableArray count](v3, "count"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
      [v32 addObjectsFromArray:v3];

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
      [v24 removeObjectsInArray:v3];
      goto LABEL_33;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);

    if (v24) {
      break;
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);

    v27 = sub_10003A95C();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (!v26)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No more pending component to discard.",  buf,  2u);
      }

      goto LABEL_32;
    }

    if (v29)
    {
      *(_DWORD *)buf = v36;
      v43 = (unint64_t)v26;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Discarding one pending component due to insufficient disk space: %{public}@",  buf,  0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
    [v30 addObject:v26];

    xpc_object_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
    [v31 removeObject:v26];

    [v26 discardStagedOperationsAndTriggerCompletion];
  }

  uint64_t v33 = sub_10003A95C();
  uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = v36;
    v43 = (unint64_t)v24;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Removing existing component to free up disk space: %{public}@",  buf,  0xCu);
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  [v35 addObject:v24];

  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
  -[os_log_s removeObject:](v28, "removeObject:", v24);
LABEL_32:

LABEL_33:
}

void sub_1000078D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t sub_1000078F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007904(uint64_t a1)
{
}

void sub_10000790C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10003A95C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100090464((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  else
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v15 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v5);
          }
          id v19 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
          unsigned int v21 = [v20 isEqualToString:@"com.apple.preferences.networkprivacy"];

          if (v21) {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v19);
          }
        }

        id v16 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v16);
    }

    id v22 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    if (!v22)
    {
      id v23 = [[NEConfiguration alloc] initWithName:@"com.apple.preferences.networkprivacy" grade:2];
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      id v22 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 pathController]);

    if (!v26)
    {
      id v27 = objc_alloc_init(&OBJC_CLASS___NEPathController);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPathController:v27];
    }

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40LL), "pathController"));
    -[os_log_s setEnabled:](v8, "setEnabled:", 1LL);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100007C90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007CB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000904C8(v3, v5);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100007EA4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100008258(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDBluetoothHelper);
  v2 = (void *)qword_100125230;
  qword_100125230 = (uint64_t)v1;
}

LABEL_23:
      double v36 = 1;
      goto LABEL_24;
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 findFileInCache:v11]);
  if (v14) {
    goto LABEL_5;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 fileCachePathFromSourcePath:0 forBackgroundDownload:v12]);
  id v20 = sub_10003AAAC();
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = -[MSDOperation signpostId](self, "signpostId");
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v23 = v22;
    if (os_signpost_enabled(v21))
    {
      double v39 = 138412290;
      v40 = v5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "Download App",  "App identifier: %{xcode:string}@",  (uint8_t *)&v39,  0xCu);
    }
  }

  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MSDApplicationFileDownloadOperation _downloadAppArchiveFile:ofHash:ofAppUID:currenntAppUID:toFolder:]( self,  "_downloadAppArchiveFile:ofHash:ofAppUID:currenntAppUID:toFolder:",  v5,  v11,  v7,  v9,  v14));
  uint64_t v24 = sub_10003AAAC();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = -[MSDOperation signpostId](self, "signpostId");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v27 = v26;
    if (os_signpost_enabled(v25))
    {
      double v39 = 67109120;
      LODWORD(v40) = v17 != 0LL;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  v27,  "Download App",  "App download result: %{xcode:BOOLean}d",  (uint8_t *)&v39,  8u);
    }
  }

  if (v17)
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    __int128 v29 = [v28 useDiffPatch];

    if (v29)
    {
      [v3 addAppDiffPatchFile:v17 sourceAppUID:v9 targetAppUID:v7];
    }

    else if (([v11 isEqualToString:v17] & 1) == 0)
    {
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      [v30 setFileHash:v17];
    }

    __int128 v31 = [v3 fileSizeInCache:v17];
    v32 = sub_10003AAAC();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = -[MSDOperation signpostId](self, "signpostId");
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v35 = v34;
      if (os_signpost_enabled(v33))
      {
        double v39 = 134217984;
        v40 = v31;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_EVENT,  v35,  "File Downloaded",  "File download size: %{xcode:size-in-bytes}llu",  (uint8_t *)&v39,  0xCu);
      }
    }

    goto LABEL_23;
  }

  -[MSDOperation setRetryable:](self, "setRetryable:", 1LL);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));

  if (v38)
  {
    double v36 = 0;
    goto LABEL_25;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744736LL,  @"An error has occurred."));
  -[MSDOperation setError:](self, "setError:", v14);
  double v36 = 0;
LABEL_24:

LABEL_25:
  return v36;
}

void sub_100008D94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100008DBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008DCC(uint64_t a1)
{
}

uint64_t sub_100008DD4(uint64_t a1, uint64_t a2)
{
  uint64_t UUID = MISProvisioningProfileGetUUID(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];

  return 1LL;
}

void sub_100008F64(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDDeviceDataCollector);
  v2 = (void *)qword_100125240;
  qword_100125240 = (uint64_t)v1;

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  [(id)qword_100125240 setSessionUUID:v3];
}

void sub_100009034(_Unwind_Exception *a1)
{
}

void sub_100009258(_Unwind_Exception *a1)
{
}

void sub_100009300(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained collectAppUsageTimer]);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectAppUsageTimer]);
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setCollectAppUsageTimer:0];
  }

  double v8 = 7200.0;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    [v9 appUsagePollingInterval];
    double v11 = v10;

    if (v11 != 0.0)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
      [v12 appUsagePollingInterval];
      double v8 = v13;
    }
  }

  id v14 = sub_10003A95C();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100090694(v15, v8);
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastAppUsageSyncTime]);
  if (!v16) {
    goto LABEL_10;
  }
  uint64_t v17 = (void *)v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastAppUsageSyncTime]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dateByAddingTimeInterval:v8]);
  unsigned int v21 = [v18 isLaterDateThan:v20];

  if (!v21)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastAppUsageSyncTime]);
  }

  else
  {
LABEL_10:
    id v22 = sub_10003A95C();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastAppUsageSyncTime]);
      int v38 = 138543874;
      double v39 = v24;
      __int16 v40 = 2114;
      v41 = v25;
      __int16 v42 = 2050;
      double v43 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Current Time: %{public}@, Last Sync Date: %{public}@. Setting fire date to %{public}f seconds from now.",  (uint8_t *)&v38,  0x20u);
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }

  id v27 = (void *)v26;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v26,  v8));
  __int128 v29 = objc_alloc(&OBJC_CLASS___NSTimer);
  id v30 = objc_loadWeakRetained(v2);
  __int128 v31 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v29,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v28,  v30,  "collectAppUsageDataTimerHandler:",  0LL,  1LL,  v8);
  id v32 = objc_loadWeakRetained(v2);
  [v32 setCollectAppUsageTimer:v31];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v34 = objc_loadWeakRetained(v2);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 collectAppUsageTimer]);
  [v33 addTimer:v35 forMode:NSDefaultRunLoopMode];

  id v36 = sub_10003A95C();
  id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138543362;
    double v39 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "About to set timer for app usage sync at: %{public}@",  (uint8_t *)&v38,  0xCu);
  }
}

void sub_1000098FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000991C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10009070C((uint64_t)v3, v5);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bundleID"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"executableName"]);
  id v7 = *(void **)(a1 + 32);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"sessionStartTime"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringFromDate:v8]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"sessionEndTime"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
    double v13 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromDate:v10]);
  }
  else {
    double v13 = @"<NOT_SET>";
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"appDuration"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v19 = *(void *)(v18 + 24);
  *(void *)(v18 + 24) = v19 + 1;
  [v14 doubleValue];
  objc_msgSend( v15,  "sendAppUsageDataEvent:withExecutable:sessionUUID:sessionStart:sessionEnd:sessionDuration:appOrder:appDuration:",  v20,  v6,  v17,  v9,  v13,  v16,  v19);
}

void sub_100009CE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100009CF8(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000907D4(v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [WeakRetained collectAppUsageWithSessionStart:v5 andEnd:v6];
}

void sub_10000A5E4(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDAnalytics);
  id v2 = (void *)qword_100125250;
  qword_100125250 = (uint64_t)v1;
}

void sub_10000A824(_Unwind_Exception *a1)
{
}

id sub_10000A838(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10000ACB8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);

  if (v6)
  {
    id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) parseResponseForError:v9 andPayload:v5]);
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

LABEL_19:
  id v25 = 0LL;
  sub_100087610(&v25, 3727744769LL, (uint64_t)@"Input is invalid");
  id v20 = v25;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 completion]);

  if (!v24) {
    goto LABEL_11;
  }
  uint64_t v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v12 completion]);
  uint64_t v19 = -[MSDServerResponse initWithError:](objc_alloc(&OBJC_CLASS___MSDServerResponse), "initWithError:", v20);
  ((void (**)(void, MSDServerResponse *))v18)[2](v18, v19);
LABEL_10:

LABEL_11:
}
  }
}

    double v10 = v5;
    goto LABEL_20;
  }

  if (v6 != 6) {
    goto LABEL_19;
  }
  if (![v5 hasPrefix:@"app."])
  {
    if ([v5 hasPrefix:@"backup."])
    {
      id v7 = @"backup.";
      goto LABEL_15;
    }

    goto LABEL_7;
  }

  id v7 = @"app.";
LABEL_15:
  double v8 = (uint64_t)-[__CFString length](v7, "length");
  id v9 = v5;
LABEL_16:
  double v10 = (id)objc_claimAutoreleasedReturnValue([v9 substringFromIndex:v8]);
LABEL_20:
  uint64_t v11 = v10;

  return v11;
}

void sub_10000AFCC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);

  if (v6)
  {
    id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) parseResponseForError:v9 andPayload:v5]);
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

void sub_10000B094( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_6:
  return v10;
}

  return v10;
}

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor foregroundAllowedApps](v2, "foregroundAllowedApps"));
  unsigned int v21 = [v20 containsObject:v5];

  id v22 = v21 ^ 1;
  if (!v21) {
    uint64_t v19 = @"systemInUseTriggeredPause";
  }
LABEL_14:
  uint64_t v26 = sub_10003A95C();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_100092804((uint64_t)v5, v9, v27);
  }

  -[MSDSystemMonitor setCoreDuetTriggeredPause:](v2, "setCoreDuetTriggeredPause:", v18 | v22);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](v2, "observer"));

  if (v28)
  {
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](v2, "observer"));
    id v30 = -[MSDSystemMonitor coreDuetTriggeredPause](v2, "coreDuetTriggeredPause")
       || -[MSDSystemMonitor diskSpaceTriggeredPause](v2, "diskSpaceTriggeredPause");
    [v29 didReceiveNewPauseStatus:v30 forReason:v19];
  }

  objc_sync_exit(v2);
}

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));
  uint64_t v11 = v10;
LABEL_7:

  return v17;
}

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  uint64_t v19 = [v18 updateSignedManifest];

  if ((v19 & 1) == 0)
  {
    __int16 v42 = sub_10003A95C();
    uint64_t v11 = (MSDDownloadManifestRequest *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10009C814();
    }
    double v43 = 0LL;
    goto LABEL_24;
  }

  v44 = v5;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"MSDCacheManifestVersion"]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 getInfo]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"PartNumber"]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 getInfo]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"Revision"]);
  v45 = v3;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestInfo]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"SigningKey"]);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@",  v23,  v25,  v27));

  __int128 v29 = v21;
  if (v21 && ([v21 isEqualToString:v28] & 1) == 0)
  {
    uint64_t v35 = sub_10003A95C();
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "This is a new manifest (%{public}@). Discard this cache and reset timer.",  buf,  0xCu);
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
    int v38 = (void *)objc_claimAutoreleasedReturnValue([v10 getAllFileHash]);
    [v37 clearCacheExceptFileHashes:v38];

    -[MSDTargetDevice cleanUpBackgroundState:](self, "cleanUpBackgroundState:", 1LL);
    id v3 = v45;
    p_vtable = &OBJC_METACLASS___MSDDownloadIPARequest.vtable;
  }

  else
  {
    id v3 = v45;
    p_vtable = (void **)(&OBJC_METACLASS___MSDDownloadIPARequest + 24);
    if (v44)
    {
      __int128 v31 = sub_10003A95C();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Factory cache exists. Discard this cache.",  buf,  2u);
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 getAllFileHash]);
      [v33 clearCacheExceptFileHashes:v34];
    }
  }

  double v39 = (void *)objc_claimAutoreleasedReturnValue([p_vtable + 412 sharedInstance]);
  [v39 setObject:v28 forKey:@"MSDCacheManifestVersion"];

  double v10 = v10;
  __int16 v40 = v10;
LABEL_17:

  return v40;
}

LABEL_12:
        double v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v32 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
      id v7 = v32;
    }

    while (v32);
  }

  id v3 = 1;
LABEL_34:

  return v3;
}

  uint64_t v18 = 0;
LABEL_63:

  return v18;
}

  return v11;
}

  __int128 v29 = v23;
  double v39 = v23;
  id v30 = [v3 createSymbolicLinkAtPath:v8 withDestinationPath:v14 error:&v39];
  id v23 = v39;

  if ((v30 & 1) == 0)
  {
    id v37 = sub_10003A95C();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100096034(v23, v34);
    }
    goto LABEL_26;
  }

  __int128 v31 = 1;
LABEL_14:

  return v31;
}

  return v7;
}

  return v7;
}

  id v14 = xpc_dictionary_get_string(v6, "QueryDeviceInfo");
  if (v14)
  {
    id v15 = strncmp(v14, "MSDDemoDeviceFrozen", 0x14uLL);
    uint64_t v16 = [v7 containsObject:@"Manage"];
    if (v15)
    {
      if (!v16) {
        goto LABEL_37;
      }
    }

    else if ((v16 & 1) == 0 && ([v7 containsObject:@"SecurityPlugin"] & 1) == 0)
    {
      goto LABEL_37;
    }
  }

  if (xpc_dictionary_get_string(v6, "PricingMessage")
    && ([v7 containsObject:@"Manage"] & 1) == 0)
  {
    goto LABEL_37;
  }

  uint64_t v17 = 1;
LABEL_25:

  return v17;
}
}
  }
}

  uint64_t v19 = 0LL;
LABEL_52:

  return v19;
}

    id v20 = 0LL;
    goto LABEL_6;
  }

  id v7 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Hash"]);
  if (!v7)
  {
    uint64_t v24 = sub_10003A95C();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v4;
      id v23 = "Missing Hash value in the Info section for stand-alone package:  %{public}@";
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  double v8 = (void *)v7;
  id v9 = objc_alloc_init(&OBJC_CLASS___MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v9, "setIdentifier:", v4);
  -[MSDInstallableFileContext setFileType:](v9, "setFileType:", 1LL);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 hexStringRepresentation]);
  -[MSDInstallableFileContext setFileHash:](v9, "setFileHash:", v10);

  -[MSDInstallableFileContext setVerifyFileHash:]( v9,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getOriginServerFromSection:@"Packages" forIdentifier:v4]);
  -[MSDInstallableFileContext setOriginServer:](v9, "setOriginServer:", v12);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 getStandAlonePackageRealSize:v4]);
  id v15 = [v14 unsignedLongLongValue];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 getStandAlonePackageFileSize:v4]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v17 unsignedLongLongValue]
                  + (void)v15
  -[MSDOperationContext setDiskSpacedRequired:](v9, "setDiskSpacedRequired:", v18);

  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDBasePrepareOperation",  @"MSDInstallableFileDownloadOperation",  0LL));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
    -[os_log_s addObject:](v19, "addObject:", @"MSDPackageInstallOperation");
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialOperationsForIdentifiers:andContext:]( self,  "sequentialOperationsForIdentifiers:andContext:",  v19,  v9));

LABEL_6:
  return v20;
}

void sub_10000D58C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D5B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000D5C0(uint64_t a1)
{
}

void sub_10000D5C8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"/"] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nonContainerizedContentRoots]);
    unsigned int v10 = [v9 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v10)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }
}

void sub_10000E4B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000E4DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_10000E558(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDKeychainManager);
  id v2 = (void *)qword_100125260;
  qword_100125260 = (uint64_t)v1;
}

void sub_10000E758(_Unwind_Exception *a1)
{
}

void sub_10000E900(_Unwind_Exception *a1)
{
}

void sub_10000EA20(_Unwind_Exception *a1)
{
}

void sub_10000EC80(_Unwind_Exception *a1)
{
}

void sub_10000EE04(_Unwind_Exception *a1)
{
}

void sub_10000F100( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000FC60(_Unwind_Exception *a1)
{
}

void sub_1000100F0(_Unwind_Exception *a1)
{
}

void sub_100010528( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id obj)
{
}

void sub_10001067C(_Unwind_Exception *a1)
{
}

void sub_1000107B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100010898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000108FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100010A00(_Unwind_Exception *a1)
{
}

void sub_100010B10(_Unwind_Exception *a1)
{
}

void sub_100010BEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100010CF4(_Unwind_Exception *a1)
{
}

void sub_100010EF4(_Unwind_Exception *a1)
{
}

LABEL_11:
  objc_sync_exit(v2);
  return v3;
}

  id v15 = sub_10003A95C();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = 138544386;
    uint64_t v19 = v9;
    id v20 = 2114;
    unsigned int v21 = v10;
    id v22 = 2114;
    id v23 = v11;
    uint64_t v24 = 2114;
    id v25 = v12;
    uint64_t v26 = 1024;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Does available update version (%{public}@, %{public}@) match expected update version (%{public}@, %{public}@): %{BOOL}d",  (uint8_t *)&v18,  0x30u);
  }

  return v13;
}

    -[MSDOperation setSkipped:](self, "setSkipped:", 1LL);
  }

  return 1;
}

void sub_1000110F4(_Unwind_Exception *a1)
{
}

void sub_1000124CC(_Unwind_Exception *a1)
{
}

void sub_100012718(_Unwind_Exception *a1)
{
}

LABEL_32:
            unsigned int v10 = 1;
            goto LABEL_33;
          }

          if (-[MSDHubTrustEvaluate isHubCertificatePinnedTo:applePKI:]( self,  "isHubCertificatePinnedTo:applePKI:",  v17,  v15))
          {
            goto LABEL_32;
          }

          id v30 = sub_10003A95C();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_100091CA0();
          }
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hashForCertificate:](self, "hashForCertificate:", v17));
          id v20 = [v14 isEqualToData:v19];

          unsigned int v21 = sub_10003A95C();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          id v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if ((v20 & 1) != 0)
          {
            if (v23)
            {
              LOWORD(v31) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Migrating certificate pinning.",  (uint8_t *)&v31,  2u);
            }

            if (-[MSDHubTrustEvaluate saveHubCertificateIdentifer:applePKI:]( self,  "saveHubCertificateIdentifer:applePKI:",  v17,  0LL))
            {
              goto LABEL_32;
            }

            uint64_t v24 = sub_10003A95C();
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100091CCC();
            }
          }

          else if (v23)
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 hexStringRepresentation]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hashForCertificate:](self, "hashForCertificate:", v17));
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 hexStringRepresentation]);
            __int128 v31 = 138543618;
            id v32 = v27;
            uint64_t v33 = 2114;
            id v34 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@",  (uint8_t *)&v31,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v26 = sub_10003A95C();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100091C74();
        }
        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

LABEL_43:
    unsigned int v10 = 0;
    goto LABEL_33;
  }

  __int128 v31 = 0;
  unsigned int v10 = 0;
  if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v31)) {
    unsigned int v10 = v31 == 4 || v31 == 1;
  }
LABEL_13:
  uint64_t v14 = 0LL;
LABEL_33:

  return v10;
}
}

void sub_100013894(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDTestInterface);
  id v2 = (void *)qword_100125270;
  qword_100125270 = (uint64_t)v1;

  [(id)qword_100125270 start];
}

id sub_100013B18(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushTestLog:*(void *)(a1 + 40)];
}

void sub_100013EA8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 userInfo]);
  [v2 sendTestEvents:v3];
}

void sub_100014874( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000148F4(id a1, BMStoreEvent *a2)
{
  id v2 = a2;
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000921DC(v4, v5, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v2, "eventBody"));
  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "printBMAppInfocusEvent:",  v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v2, "eventBody"));
  unsigned __int8 v9 = [v8 starting];

  return v9;
}

NSCopying *__cdecl sub_100014994(id a1, BMStoreEvent *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);

  return (NSCopying *)v3;
}

uint64_t sub_1000149D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000149E0(uint64_t a1)
{
}

void sub_1000149E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 state])
  {
    id v7 = sub_10003A95C();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100092254(v5, v8);
    }
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v9 = sub_10003A95C();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - Sink completed successfully.",  (uint8_t *)&v10,  0xCu);
    }
  }
}

void sub_100014AFC(id *a1, void *a2)
{
  id v30 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v30 startEvent]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v30 endEvent]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 eventBody]);

  id v7 = sub_10003A95C();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000923A8();
  }

  id v9 = sub_10003A95C();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10009237C();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "printBMAppInfocusEvent:",  v4);
  id v11 = sub_10003A95C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100092350();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "printBMAppInfocusEvent:",  v6);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteTimestamp]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteTimestamp]);
  id v15 = v13;
  id v16 = v14;
  id v17 = a1[5];
  id v18 = a1[6];
  id v19 = v15;
  id v20 = v16;
  unsigned int v21 = v20;
  if (&OBJC_METACLASS___MSDDownloadIPARequest.vtable == (void **)-816LL)
  {
    id v26 = v19;
    id v27 = v20;
LABEL_12:

    goto LABEL_13;
  }

  if (+[MSDBiomeAppInFocusStream timeRange:subsumes:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "timeRange:subsumes:",  v17,  v18,  v19,  v20))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    unsigned __int8 v23 = [v22 isEqualToString:@"com.apple.SpringBoard.transitionReason.externalrequest"];

    if ((v23 & 1) == 0)
    {
      id v24 = v4;
      id v25 = v6;
      id v26 = v24;
      id v27 = v25;
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[MSDBiomeAppInFocusStream eventSessionToAppUsage:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "eventSessionToAppUsage:",  v26,  v27));
      [a1[4] addObject:v18];
      id v28 = sub_10003A95C();
      id v17 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
      {
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleID]);
        sub_100092308(v29, (uint64_t)v31, (os_log_s *)v17);
      }

      goto LABEL_12;
    }
  }

void sub_100014DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014DD8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = result;
  return result;
}

void sub_100014E10(uint64_t a1)
{
}

void sub_100014E38(id *a1, void *a2)
{
  id v23 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v23 events]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0 || ![v2 count])
  {
    id v22 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000923D4();
    }
    uint64_t v14 = 0LL;
    id v13 = 0LL;
    id v6 = 0LL;
    goto LABEL_13;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndexedSubscript:0]);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 eventBody]);

  id v7 = sub_10003A95C();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100092454();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "printBMAppInfocusEvent:",  v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s absoluteTimestamp](v6, "absoluteTimestamp"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s absoluteTimestamp](v6, "absoluteTimestamp"));
  id v11 = a1[5];
  id v12 = a1[6];
  id v13 = v9;
  uint64_t v14 = v10;
  if (&OBJC_METACLASS___MSDDownloadIPARequest.vtable == (void **)-816LL)
  {

    id v17 = v14;
LABEL_13:

    goto LABEL_14;
  }

  if (+[MSDBiomeAppInFocusStream timeRange:subsumes:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "timeRange:subsumes:",  v11,  v12,  v13,  v14))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s launchReason](v6, "launchReason"));
    unsigned __int8 v16 = [v15 isEqualToString:@"com.apple.SpringBoard.transitionReason.externalrequest"];

    if ((v16 & 1) == 0)
    {
      id v17 = v6;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MSDBiomeAppInFocusStream eventSessionToAppUsage:]( &OBJC_CLASS___MSDBiomeAppInFocusStream,  "eventSessionToAppUsage:",  v17,  0LL));
      [a1[4] addObject:v18];
      id v19 = sub_10003A95C();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundleID](v17, "bundleID"));
        sub_10009240C(v21, (uint64_t)v25, v20);
      }

      id v6 = v17;
      goto LABEL_13;
    }
  }

LABEL_14:
}

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 features]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000193F8;
  v38[3] = &unk_1000F9328;
  v38[4] = &v42;
  v38[5] = &v54;
  -[MSDAccountManagerHelper _configureiCloudAccountFeatures:completionHandler:]( self,  "_configureiCloudAccountFeatures:completionHandler:",  v23,  v38);

  id v24 = (dispatch_semaphore_s *)v55[5];
  id v25 = dispatch_time(0LL, 200000000000LL);
  if (dispatch_semaphore_wait(v24, v25))
  {
    id v36 = sub_10003A95C();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    id v34 = 3727741049LL;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100092AE8();
    }
    uint64_t v35 = @"Failed to configure account features.";
LABEL_35:

    sub_100087650(a4, v34, (uint64_t)v35, (uint64_t)@"Operation timed out");
LABEL_36:
    id v28 = 0;
    goto LABEL_20;
  }

  id v26 = (void *)v43[5];
  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedDescription]);
    sub_100087650(a4, 3727741049LL, (uint64_t)@"Failed to configure account features.", (uint64_t)v27);
    goto LABEL_18;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  -[MSDAccountManagerHelper _waitForIDSOperationToQuiesceForAccount:forSignOut:]( self,  "_waitForIDSOperationToQuiesceForAccount:forSignOut:",  v27,  0LL);
  id v28 = 1;
LABEL_19:

LABEL_20:
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v28;
}

    unsigned __int8 v16 = 0;
    goto LABEL_15;
  }

  int v10 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    id v19 = sub_10003A95C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = 136446210;
      id v22 = "-[MSDPreferencesFile setObject:forKey:]";
      id v18 = "%{public}s - Key must be of type NSString.";
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  if (!+[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  v6,  100LL)) {
    -[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]( self,  "raiseInvalidPropertyListObjectExceptionForObject:",  v6);
  }
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100096338((uint64_t)v9, (uint64_t)v6, v12);
  }

  id v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s cache](v13, "cache"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s deepCopy:](v13, "deepCopy:", v6));
  [v14 setObject:v15 forKey:v9];

  unsigned __int8 v16 = -[os_log_s saveCache](v13, "saveCache");
  objc_sync_exit(v13);
LABEL_15:

  return v16;
}

  return v27;
}

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
        uint64_t v14 = 1;
        [v15 setRestored:1];

        -[MSDOperation setSkipped:](self, "setSkipped:", 1LL);
LABEL_16:

        return v14;
      }

      if (v9) {
        goto LABEL_14;
      }
    }

  return v17;
}

  objc_destroyWeak(&buf);
}

void sub_100015100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100015130(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", @"sessionStartTime"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"sessionStartTime"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100015354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000154F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001562C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100015638( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100015648(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100015654(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

  ;
}

  ;
}

uint64_t sub_10001567C(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

  ;
}

  ;
}

void sub_100015D4C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDSystemMonitor);
  id v2 = (void *)qword_100125280;
  qword_100125280 = (uint64_t)v1;

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v4 = [v3 macOS];

  if (v4)
  {
    id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.ist.demoloop",  @"com.apple.ScreenSaver.Engine",  @"com.apple.ist.DigitalSignage.iOS",  0LL,  v15,  v16,  v17);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v7 = [v6 iOS];

    if (v7)
    {
      id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.retailtech.arkenstone",  @"com.apple.ist.windward",  @"com.apple.ist.DemoDiscoveryApp",  @"com.apple.ist.demoloop",  @"com.apple.ist.DigitalCatalog",  @"com.apple.ist.DigitalSignage.iOS",  0LL);
    }

    else
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
      unsigned int v9 = [v8 watchOS];

      if (v9)
      {
        id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.NanoDemo",  0LL,  v13,  v14,  v15,  v16,  v17);
      }

      else
      {
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
        unsigned int v11 = [v10 tvOS];

        if (!v11)
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
          goto LABEL_10;
        }

        id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.TVIdleScreen",  @"com.apple.PineBoard",  @"com.apple.IdleScreen",  0LL,  v15,  v16,  v17);
      }
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(v5);
LABEL_10:
  id v18 = (void *)v12;
  [(id)qword_100125280 setForegroundAllowedApps:v12];
}

void sub_100016144(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained diskSpaceMonitoringTimer]);

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diskSpaceMonitoringTimer]);
    [v5 invalidate];
  }

  id v8 = objc_loadWeakRetained(v1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v8,  "processDiskSpaceMonitorCallback",  0LL,  1LL,  300.0));
  id v7 = objc_loadWeakRetained(v1);
  [v7 setDiskSpaceMonitoringTimer:v6];
}

void sub_1000162A4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained diskSpaceMonitoringTimer]);

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 diskSpaceMonitoringTimer]);
    [v5 invalidate];

    id v6 = objc_loadWeakRetained(v1);
    [v6 setDiskSpaceMonitoringTimer:0];
  }

void sub_100016430( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100016628( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t sub_100016654(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processCoreDuetCallBack];

  return 1LL;
}

void sub_100016950(_Unwind_Exception *a1)
{
}

void sub_100017054(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 groupContainerPaths]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);

  [v8 setObject:v7 forKey:v6];
}

void sub_1000170D4(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 groupContainerPaths]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);

  [v8 setObject:v7 forKey:v6];
}

LABEL_27:
        if (v28)
        {
          if ([v28 hasPrefix:@"/private"])
          {
            uint64_t v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringFromIndex:", objc_msgSend(@"/private", "length")));

            id v28 = (void *)v35;
          }

          id v36 = sub_10003A95C();
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v22;
            v55 = 2114;
            v56 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Container '%{public}@' assigned with content root path: %{public}@",  buf,  0x16u);
          }

          [v22 setContentRootPath:v28];
        }

LABEL_29:
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  id v28 = v92;
  __int128 v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v96,  v148,  16LL);
  if (v29)
  {
    id v30 = *(void *)v97;
    while (2)
    {
      __int128 v31 = 0LL;
      do
      {
        if (*(void *)v97 != v30) {
          objc_enumerationMutation(v28);
        }
        id v32 = *(void *)(*((void *)&v96 + 1) + 8LL * (void)v31);
        uint64_t v33 = objc_autoreleasePoolPush();
        if (([(id)v141[5] fileExistsAtPath:v32] & 1) != 0
          || (id v34 = (void *)v141[5],
              uint64_t v35 = (id *)(v129 + 5),
              v95 = (id)v129[5],
              id v36 = [v34 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:0 error:&v95],  objc_storeStrong(v35, v95),  *((_BYTE *)v135 + 24) = v36,  (v36 & 1) != 0))
        {
          id v37 = 0;
          int v38 = 1;
        }

        else
        {
          double v39 = sub_10003A95C();
          __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue([(id)v129[5] localizedDescription]);
            *(_DWORD *)buf = 138543618;
            v150 = v32;
            v151 = 2114;
            v152 = v41;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Could not create directory at %{public}@ - %{public}@",  buf,  0x16u);
          }

          int v38 = 0;
          id v37 = 6;
        }

        objc_autoreleasePoolPop(v33);
        if (!v38)
        {

          if (v37 == 6) {
            goto LABEL_54;
          }
          goto LABEL_46;
        }

        __int128 v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      __int16 v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v96,  v148,  16LL);
      __int128 v29 = v42;
      if (v42) {
        continue;
      }
      break;
    }
  }

LABEL_46:
  double v43 = objc_msgSend((id)v111[5], "count", v84);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000309FC;
  block[3] = &unk_1000F9B98;
  block[4] = &v110;
  block[5] = &v104;
  block[6] = &v140;
  block[7] = &v128;
  block[8] = &v134;
  dispatch_apply((size_t)v43, 0LL, block);
  if (!*((_BYTE *)v135 + 24))
  {
    v59 = sub_10003A95C();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_100096238(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_61;
  }

  v44 = [(id)v123[5] count];
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472LL;
  v93[2] = sub_100030B68;
  v93[3] = &unk_1000F9BC0;
  v93[4] = &v122;
  v93[5] = &v116;
  v93[6] = &v140;
  v93[7] = &v128;
  v93[8] = v146;
  v93[9] = v138;
  v93[10] = &v134;
  dispatch_apply((size_t)v44, 0LL, v93);
  if (!*((_BYTE *)v135 + 24))
  {
    v68 = sub_10003A95C();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_100096268(v60, v69, v70, v71, v72, v73, v74, v75);
    }
    goto LABEL_61;
  }

  if (!+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 containerType]);
    v47 = [v46 isEqualToString:@"BackupData"];

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    if (v47)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v50 = [v49 contentBeingInstalled];
      v52 = objc_msgSend( v48,  "restoreBackupAttributesUnder:range:manifestUID:deviceUID:",  v91,  v50,  v51,  &off_100106408,  &off_100106408);
      *((_BYTE *)v135 + 24) = v52;
    }

    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v49 containerType]);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
      v56 = [v48 restoreAppDataAttributesUnder:v91 containerType:v53 identifier:v55 manifestUID:&off_100106408 deviceUID:&off_100106408];
      *((_BYTE *)v135 + 24) = v56;
    }
  }

  if (!*((_BYTE *)v135 + 24))
  {
    v76 = sub_10003A95C();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_100096298(v60, v77, v78, v79, v80, v81, v82, v83);
    }
LABEL_61:
  }
}

  return v46;
}

LABEL_33:
        unsigned int v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      int v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v45,  v57,  16LL);
      id v19 = v38;
    }

    while (v38);
  }

  return 1;
}

  objc_autoreleasePoolPop(v8);
}

void sub_100017730(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Clearing app data container: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"AppData" containerPath:v6 isContainerized:1];
}

void sub_100017810(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Clearing plugin data container: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"ExtensionData" containerPath:v6 isContainerized:1];
}

void sub_1000178F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Clearing group data container: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"GroupData" containerPath:v6 isContainerized:1];
}

void sub_100017BE8(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDBackgroundDownload);
  id v2 = (void *)qword_100125290;
  qword_100125290 = (uint64_t)v1;

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 backgroundBundle]);
  [(id)qword_100125290 setBundleDownloadInProgress:v4];

  [(id)qword_100125290 setIsBackgroundDownloadQueueEmpty:1];
}

void sub_100017D5C(_Unwind_Exception *a1)
{
}

void sub_100017D74(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSystemMonitor sharedInstance](&OBJC_CLASS___MSDSystemMonitor, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [*(id *)(a1 + 32) setDevice:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  [v6 setBackgroundDownloadActive:1];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  [v7 manageDeviceSnapshot:@"MountSnapshot"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 backgroundBundle]);
  [*(id *)(a1 + 32) setBundleDownloadInProgress:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleDownloadInProgress]);
  [v10 startBundleUpdateTimer];

  if (![v4 stageDeviceForUpdateProcess:1])
  {
    id v29 = sub_10003A95C();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100092A18(v30, v31, v32);
    }
    goto LABEL_17;
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initiateBackgroundDownload]);
  if (!v11)
  {
    unint64_t v12 = 0LL;
    do
    {
      id v13 = sub_10003A95C();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000929E4(&v44, v45, v14);
      }

      uint64_t v15 = v12 + 1;
      sleep(0x3Cu);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initiateBackgroundDownload]);
      unsigned int v11 = (void *)v16;
      if (v16) {
        break;
      }
    }

    while (v12++ < 4);
    if (!v16)
    {
      id v33 = sub_10003A95C();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100092938(v15, v30);
      }
LABEL_17:

      id v20 = 0LL;
      id v19 = 0LL;
      goto LABEL_18;
    }
  }

  id v18 = -[MSDComponentBuilder initWithSignedManifest:andOptions:]( objc_alloc(&OBJC_CLASS___MSDComponentBuilder),  "initWithSignedManifest:andOptions:",  v11,  &off_100106600);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder buildComponentsFromManifest](v18, "buildComponentsFromManifest"));
  if (!v19)
  {
    id v39 = sub_10003A95C();
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000929AC(v40, v41, v42);
    }

    id v20 = 0LL;
    goto LABEL_12;
  }

  id v20 = -[MSDComponentProcessor initWithQoS:](objc_alloc(&OBJC_CLASS___MSDComponentProcessor), "initWithQoS:", 9LL);
  unsigned int v21 = -[MSDComponentManager initWithComponents:andProcessor:]( objc_alloc(&OBJC_CLASS___MSDComponentManager),  "initWithComponents:andProcessor:",  v19,  v20);
  [*(id *)(a1 + 32) setComponentManager:v21];

  [v3 registerObserver:*(void *)(a1 + 32)];
  [v3 startSystemIdleDetection];
  id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) componentManager]);
  [v22 startProcessingAllComponents];

  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) componentManager]);
  unsigned int v24 = [v23 waitForProcessingCompletionTillDate:0 outError:0];

  [v3 unregisterObserver];
  [v3 stopSystemIdleDetection];
  if (v24)
  {
LABEL_12:
    id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleDownloadInProgress]);
    [v25 setBundleStateAs:3];

    id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
    id v27 = v26;
    uint64_t v28 = 3LL;
    goto LABEL_19;
  }

LABEL_18:
  id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleDownloadInProgress]);
  [v34 setBundleStateAs:4];

  id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  id v27 = v26;
  uint64_t v28 = 4LL;
LABEL_19:
  [v26 setBackgroundDownloadState:v28];

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  [v35 manageDeviceSnapshot:@"UnmountSnapshot"];

  id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleDownloadInProgress]);
  [v36 stopBundleUpdateTimer];

  id v37 = sub_10003A95C();
  int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v43 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Can not continue background download. Exiting...",  v43,  2u);
  }

  [*(id *)(a1 + 32) setIsBackgroundDownloadQueueEmpty:1];
  objc_autoreleasePoolPop(v2);
}

  return v5;
}

  return v20;
}
}

void sub_1000184D4(_Unwind_Exception *a1)
{
}

void sub_100018660(_Unwind_Exception *a1)
{
}

void sub_100018804(_Unwind_Exception *a1)
{
}

void sub_1000189B4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100019268( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

uint64_t sub_1000192A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000192B8(uint64_t a1)
{
}

void sub_1000192C0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

void sub_100019350(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_1000193A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_1000193F8(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_1000197BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_1000197FC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

void sub_10001988C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100019AD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_100019B00(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100019D10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_100019D38(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_10001A068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001A084(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001A27C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_10001A2A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_10001A4F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100092C74(v6, v9);
    }

    id v10 = v6;
    goto LABEL_10;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ak_redactedCopy"));
    int v15 = 138543362;
    uint64_t v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Account authentication completed with results: %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  if (![*(id *)(a1 + 32) _isAllowListedAccount:*(void *)(a1 + 40) withAuthResults:v5])
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741044LL,  @"Account is not allowed."));
LABEL_10:
    uint64_t v14 = v10;
    id v13 = 0LL;
    goto LABEL_11;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
  [v12 setObject:*(void *)(a1 + 48) forKeyedSubscript:AKAuthenticationRawPasswordKey];
  id v13 = [v12 copy];

  uint64_t v14 = 0LL;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10001A95C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001A980(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Signing in to Apple ID completed!", v16, 2u);
    }

    id v9 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100092CF4();
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);

          if (v13)
          {
            id v9 = (id)objc_claimAutoreleasedReturnValue([v12 error]);
            goto LABEL_17;
          }
        }

        id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0LL;
}

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

          __int128 v19 = 0;
LABEL_18:

          goto LABEL_19;
        }

        [(id)v123[5] addObject:v14];
        id v22 = [v17 getFileSize];
        id v23 = (void *)v117[5];
        if (v22)
        {
          unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 getHash]);
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s hexStringRepresentation](v21, "hexStringRepresentation"));
          [v23 setObject:v24 forKey:v14];

          goto LABEL_17;
        }

        [(id)v117[5] setObject:@"ZERO_SIZE" forKey:v14];
      }

      __int128 v19 = 0;
LABEL_19:

      objc_autoreleasePoolPop(v13);
      if (!v17)
      {

        if (v19 == 6) {
          goto LABEL_54;
        }
        goto LABEL_29;
      }

      if (v9 == (id)++v11)
      {
        id v27 = [obj countByEnumeratingWithState:&v100 objects:v153 count:16];
        id v9 = v27;
        if (v27) {
          goto LABEL_3;
        }
        goto LABEL_27;
      }
    }

    id v26 = sub_10003A95C();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v84;
      v150 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Cannot find metadata for path %{public}@",  buf,  0xCu);
    }

    __int128 v18 = 0LL;
    __int128 v19 = 6;
    goto LABEL_18;
  }

      break;
    }

    uint64_t v10 = [v6 code];
    uint64_t v11 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = v12;
    if (v10 == (id)3727741043LL)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int128 v18 = "Account authentication failure. Not going to retry.";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }

      goto LABEL_17;
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedFailureReason]);
      uint64_t v16 = [v6 code];
      *(_DWORD *)buf = v20;
      id v23 = v7 - 1;
      unsigned int v24 = 2114;
      id v25 = v15;
      id v26 = 2048;
      id v27 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to setup accounts (retryCount = %td): %{public}@(0x%tx)",  buf,  0x20u);
    }

    sleep(5u);
    uint64_t v14 = v7-- < 2 || v9;
  }

  while ((v14 & 1) == 0);
  if (a3) {
    *a3 = v6;
  }
  -[MSDAccountManager syncAppsWithiCloud](self, "syncAppsWithiCloud");

  return v9;
}

LABEL_18:
LABEL_19:

        objc_autoreleasePoolPop(v10);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v37 != v8);
      unsigned int v24 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      id v37 = v24;
    }

    while (v24);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  [v25 setAlreadyHaveList:v34];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  [v27 setCloneFailedList:v26];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  [v28 setCreationList:v36];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](v31, "context"));
  [v29 setDeviceManifest:0];

  return 1;
}

          id v26 = 0LL;
LABEL_18:
          if (v13)
          {
            id v27 = -[MSDComponent initWithName:andOperations:]( objc_alloc(&OBJC_CLASS___MSDComponent),  "initWithName:andOperations:",  v9,  v13);
            if (v27)
            {
              uint64_t v28 = v27;
              if (v26) {
                -[MSDComponent addRemoveOperations:](v27, "addRemoveOperations:", v26);
              }
              uint64_t v29 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) appItemToDefer]);
              if (v29)
              {
                id v30 = (void *)v29;
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) appItemToDefer]);
                if ([v31 isEqualToString:v9])
                {
                  uint64_t v32 = v26;
                  id v33 = v8;
                  id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) signedManifest]);
                  v61 = [v34 isItemApp:v7];

                  uint64_t v8 = v33;
                  id v26 = v32;

                  if (v61)
                  {
                    uint64_t v35 = sub_10003A95C();
                    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Deferring the update of app item as requested.",  buf,  2u);
                    }

                    id v37 = *(void *)(*(void *)(a1 + 72) + 8LL);
                    int v38 = *(void **)(v37 + 40);
                    *(void *)(v37 + 40) = v28;
                    id v39 = v28;

LABEL_32:
                    goto LABEL_33;
                  }
                }

                else
                {
                }
              }

              __int16 v40 = sub_10003A95C();
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v63 = (const char *)v28;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Component built successfully: %{public}@",  buf,  0xCu);
              }

              [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v28];
              goto LABEL_32;
            }
          }

    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v24 removeObserver:v15];

    goto LABEL_18;
  }

  id v22 = sub_10003A95C();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No more active component to process.", buf, 2u);
  }

  id v23 = 1;
LABEL_21:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v23;
}

void sub_10001AEB4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ((char *)[v6 statusCode] - 200 > (char *)0x63)
  {
    id v12 = sub_10003A95C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100092D84();
    }

    if (v7) {
      id v14 = v7;
    }
    else {
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
    }
    id v11 = v14;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v8 = v6;
    id v9 = objc_alloc(&OBJC_CLASS___AAiCloudTermsAgreeRequest);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 agreeURL]);

    id v11 = [v9 initWithURLString:v10 account:*(void *)(a1 + 32)];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001B020;
    v15[3] = &unk_1000F9830;
    id v16 = *(id *)(a1 + 40);
    [v11 performRequestWithHandler:v15];
  }
}

void sub_10001B020(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = (char *)[a3 statusCode] - 200;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if ((unint64_t)v7 > 0x63)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100092DE8();
    }

    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
    }
    id v12 = v11;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Successfully agreed to iCloud terms!",  v13,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10001B338(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Signing out from Apple ID completed!",  v14,  2u);
    }

    id v9 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100092E4C();
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);

          if (v13)
          {
            id v9 = (id)objc_claimAutoreleasedReturnValue([v12 error]);
            goto LABEL_17;
          }
        }

        id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

void sub_10001B4F0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Signing out from Apple ID completed!",  v11,  2u);
    }

    id v9 = 0LL;
  }

  else
  {
    id v9 = v5;
    id v10 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100092EB0(v9, v8);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001B778(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100092F30(v5, v7);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_34:
  }
}

void sub_10001BC08(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "iCloud account features have been successfully updated!",  v9,  2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100093018(v5, v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_22:
}

  return v14;
}

void sub_10001BF40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100093098(v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New user profile successfully created!", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) relinquish];
}

void sub_10001C6DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001C70C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100093254(v3, v6);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "iCloud keychain has been successfully synced!",  v9,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;
}

void sub_10001D1F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003A95C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (a2) {
      id v8 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removal of account completed with success: %@, error: %@",  (uint8_t *)&v9,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001D39C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDTestPreferences);
  id v2 = (void *)qword_1001252A0;
  qword_1001252A0 = (uint64_t)v1;
}

void sub_10001E8BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10001E8F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001E908(uint64_t a1)
{
}

void sub_10001E910(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
  if (v8)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serverType]);
    unsigned int v10 = [v9 isEqualToString:@"localCachingHub"];

    if (!v6)
    {
      if (v10)
      {
        [*(id *)(a1 + 32) setLocalHubURLSchema:v26];
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAnalyticsEventHandler sharedInstance]( &OBJC_CLASS___MSDAnalyticsEventHandler,  "sharedInstance"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType]);
      [v27 sendFileDownloadSourceEvent:v28];

      id v29 = sub_10003AAAC();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v31 = (char *)[*(id *)(a1 + 32) signpostId];
      if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v32 = (os_signpost_id_t)v31;
        if (os_signpost_enabled(v30))
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fileInfo]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 fileHash]);
          int v40 = 138543618;
          uint64_t v41 = v34;
          __int16 v42 = 2114;
          double v43 = v35;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_EVENT,  v32,  "Download File",  "File with hash %{public}@ downloaded from %{public}@",  (uint8_t *)&v40,  0x16u);
        }
      }

      goto LABEL_21;
    }

    if (v10) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL), a2);
    }
    if (!v7
      || (uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"statusCode"]),
          uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8LL),
          id v13 = *(void **)(v12 + 40),
          *(void *)(v12 + 40) = v11,
          v13,
          !v11))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8LL);
      __int128 v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = &off_1001063F0;
    }
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) nextTry]);
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8LL);
  __int128 v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  __int128 v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
  if (v19)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 urlSchema]);
    [*(id *)(a1 + 56) setUrlSchema:v20];

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) credential]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"Headers"]);
    [*(id *)(a1 + 56) setCredentialHeaders:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType]);
    [*(id *)(a1 + 56) setServerType:v23];

    [*(id *)(a1 + 64) launchTaskWithInfo:*(void *)(a1 + 56)];
    goto LABEL_24;
  }

  id v24 = sub_10003A95C();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100093464(a1, v25);
  }

  if ([v6 code] == (id)-1001
    || [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) integerValue] == (id)408)
  {
    [*(id *)(a1 + 32) limitConcurrentRequests];
  }

LABEL_21:
  uint64_t v36 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) parseResponseForError:v6 andPayload:v7]);
  uint64_t v37 = *(void *)(*(void *)(a1 + 104) + 8LL);
  int v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v36;

  id v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType]);
  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) setDownloadSource:v39];

  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) setLocalHubError:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  if ([*(id *)(a1 + 72) tryCachingHub]) {
    objc_msgSend( *(id *)(a1 + 32),  "updateLocalHubReachability:withRequest:andResponse:",  objc_msgSend(*(id *)(a1 + 48), "localHubReachable"),  *(void *)(a1 + 40),  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40));
  }
  [*(id *)(a1 + 32) handleCompletionForDownloadRequest:*(void *)(a1 + 40) withResponse:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) forSession:*(void *)(a1 + 64)];
LABEL_24:
}

    uint64_t v28 = 0LL;
    id v29 = v16;
LABEL_47:
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager existingAccounts](self, "existingAccounts"));
    if (v50)
    {
      v51 = v50;
      v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:@"Account"]);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKey:@"Account"]);
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v52,  @"iCloudAccount",  v53,  @"iTunesAccount",  0LL));
    }

    else
    {
      v54 = 0LL;
      v51 = &__NSDictionary0__struct;
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue([v61 bundleInProgress]);
    [v55 updateComponentProgress:@"Accounts" withResult:v28 withAdditionalInfo:v54];

    if (v60)
    {
      uint64_t v16 = v29;
      *v60 = v16;
    }

    else
    {
      uint64_t v16 = v29;
    }

    id v5 = v59;
    goto LABEL_57;
  }

  if (v40)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "No iCloud or iTunes account settings provided. Skip setting up any account.",  buf,  2u);
  }

  -[MSDAccountManager _forceiCloudKeychainToSyncWithServer](self, "_forceiCloudKeychainToSyncWithServer");
  id v25 = 0LL;
  v54 = 0LL;
  v51 = 0LL;
  id v26 = 0LL;
  id v27 = 0LL;
  LOBYTE(v2_Block_object_dispose((const void *)(v29 - 112), 8) = 1;
LABEL_57:

  return (char)v28;
}

LABEL_10:
}

    *(_BYTE *)(*(void *)(a1[10] + 8LL) + 24LL) = 0;
  }
}

  if (([v3 moveStagingToFinal:v6 finalPath:v15] & 1) == 0)
  {
    v52 = sub_10003A95C();
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_100099DF8((os_log_s *)v22, v53, v54, v55, v56, v57, v58, v59);
    }
    goto LABEL_27;
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  os_signpost_id_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 containerType]);
  id v33 = [v32 isEqualToString:@"BackupData"];

  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v36 = v35;
  if (!v33)
  {
    uint8_t v44 = (void *)objc_claimAutoreleasedReturnValue([v35 containerType]);
    v63 = v11;
    v64 = v6;
    v45 = v7;
    v46 = v3;
    v47 = v4;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
    int v38 = (void *)v65;
    v50 = [v34 restoreAppDataAttributesUnder:v65 containerType:v44 identifier:v49 manifestUID:&off_100106480 deviceUID:&off_100106480];

    id v4 = v47;
    id v3 = v46;
    id v7 = v45;
    uint64_t v11 = v63;
    id v6 = v64;

    if ((v50 & 1) != 0) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }

  uint64_t v37 = [v35 contentBeingInstalled];
  int v38 = (void *)v65;
  int v40 = objc_msgSend( v34,  "restoreBackupAttributesUnder:range:manifestUID:deviceUID:",  v65,  v37,  v39,  &off_100106480,  &off_100106480);

  if ((v40 & 1) == 0)
  {
LABEL_16:
    v51 = sub_10003A95C();
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_100099D94();
    }
    __int128 v15 = v66;
    id v13 = v67;
    goto LABEL_28;
  }

    -[MSDIPAInstallOperation _createFullIPAInstallOperationsAsFallback]( self,  "_createFullIPAInstallOperationsAsFallback");
    uint64_t v12 = 0;
    goto LABEL_4;
  }

  uint64_t v12 = 1;
LABEL_4:

  return v12;
}

  return v9;
}
  }

  _Block_object_dispose(&v44, 8);
}

    int v9 = 0;
    goto LABEL_4;
  }

  int v9 = 1;
LABEL_4:

  return v9;
}

  id v25 = v5;
LABEL_11:

  return v25;
}

void sub_1000202DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_10002031C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002032C(uint64_t a1)
{
}

void sub_100020334(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v7 = v6;
  if (!a2 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
    id v8 = sub_10003A95C();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100093628(a1, v7);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100020568( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100020FB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFDCforRequest:*(void *)(a1 + 40)];
}

void sub_1000217E8(uint64_t a1)
{
  if ((uint64_t)[*(id *)(a1 + 32) downloadedSize] >= 1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadSource]);

    if (v2)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadSource]);
      unsigned int v4 = [v3 isEqualToString:@"localCachingHub"];
      id v5 = @"remote";
      if (v4) {
        id v5 = @"local";
      }
      id v6 = v5;

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      id v8 = (id)objc_claimAutoreleasedReturnValue([v7 bundleInProgress]);

      objc_msgSend(v8, "updateDownloadedContent:fromSource:", objc_msgSend(*(id *)(a1 + 32), "downloadedSize"), v6);
    }
  }

id sub_1000218D4(id *a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] fileInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fileHash]);
    int v13 = 138543362;
    uint64_t v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Attempting to download file again: %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  id v6 = sub_10003AAAC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int v9 = (char *)[WeakRetained signpostId];

  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[4] fileInfo]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fileHash]);
    int v13 = 138412290;
    uint64_t v14 = v11;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  (os_signpost_id_t)v9,  "Retry File Download",  "File download retry: %{xcode:string}@",  (uint8_t *)&v13,  0xCu);
  }

  objc_msgSend(a1[4], "setRetryCount:", (char *)objc_msgSend(a1[4], "retryCount") - 1);
  return [a1[5] _dispatchRequest:a1[4]];
}

void sub_100021B64(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDCache);
  id v2 = (void *)qword_1001252B0;
  qword_1001252B0 = (uint64_t)v1;
}

void sub_100021DB4(_Unwind_Exception *a1)
{
}

void sub_100021E6C(_Unwind_Exception *a1)
{
}

void sub_100021F6C(_Unwind_Exception *a1)
{
}

void sub_100022040(_Unwind_Exception *a1)
{
}

void sub_100022164(_Unwind_Exception *a1)
{
}

void sub_100022314(_Unwind_Exception *a1)
{
}

void sub_1000224E4(_Unwind_Exception *a1)
{
}

void sub_100022608(_Unwind_Exception *a1)
{
}

LABEL_5:
  return v6;
}

  return v8;
}

LABEL_36:
      if (acl_valid(v49))
      {
        v66 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_100093EEC();
        }
      }

      else
      {
        if (!acl_set_file( (const char *)[v4 fileSystemRepresentation], ACL_TYPE_EXTENDED, v49)) {
          goto LABEL_38;
        }
        v68 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_100094308();
        }
      }

LABEL_38:
      acl_free(v49);
    }

    else
    {
      v49 = acl_init(0);
      if (v49) {
        goto LABEL_36;
      }
      v69 = sub_10003A95C();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10009429C();
      }
LABEL_65:
    }
  }

  id v33 = 0LL;
LABEL_40:
  v56 = 1;
LABEL_41:

  return v56;
}

  return v7;
}

LABEL_56:
  return v47;
}

void sub_100024880( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_1000248AC()
{
  return __error();
}

  ;
}

char *sub_1000248C0(int *a1)
{
  return strerror(*a1);
}

  ;
}

LABEL_24:
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"HomeDomain"));
  if (!v10
    || (id v34 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v33), (objc_opt_isKindOfClass(v10, v34) & 1) == 0))
  {
    v51 = sub_10003A95C();
    int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_100094668();
    }
    goto LABEL_44;
  }

  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v13 || (uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v35), (objc_opt_isKindOfClass(v13, v36) & 1) == 0))
  {
    v54 = sub_10003A95C();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100094694();
    }
LABEL_37:

LABEL_38:
LABEL_39:

LABEL_40:
    v48 = 0LL;
    goto LABEL_41;
  }

  -[os_log_s addObject:](v13, "addObject:", @"Library/Preferences/com.apple.identityservices.idstatuscache.plist");
  -[os_log_s addObject:](v13, "addObject:", @"Library/Preferences/com.apple.identityservicesd.plist");
  -[os_log_s addObject:](v13, "addObject:", @"Library/Preferences/com.apple.ids.deviceproperties.plist");
  -[os_log_s addObject:](v13, "addObject:", @"Library/Preferences/com.apple.ids.subservices.plist");
  -[os_log_s addObject:](v13, "addObject:", @"Library/Preferences/com.apple.ids.plist");
  -[os_log_s removeObject:]( v13,  "removeObject:",  @"Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db");
  [v10 setObject:v13 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v15 || (int v38 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v37), (objc_opt_isKindOfClass(v15, v38) & 1) == 0))
  {
    v57 = sub_10003A95C();
    int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000946C0();
    }
    goto LABEL_44;
  }

  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/Accounts");
  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/DeviceRegistry");
  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/DeviceRegistry.state");
  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/MobileBluetooth");
  -[NSMutableArray addObject:](v15, "addObject:", @"Library/Application Support/ScreenSaverManager");
  int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"]);
  if (v40 && (uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v39), (objc_opt_isKindOfClass(v40, v41) & 1) != 0))
  {
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v15, "arrayByAddingObjectsFromArray:", v40));
    double v43 = (NSMutableArray *)[v42 mutableCopy];

    uint8_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v10 setObject:v44 forKey:@"RelativePathsToBackupToDriveAndStandardAccount"];

    uint64_t v15 = v43;
  }

  else
  {
    v62 = sub_10003A95C();
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v142 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.",  v142,  2u);
    }
  }

  [v10 setObject:v15 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v64 || (v66 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v65), (objc_opt_isKindOfClass(v64, v66) & 1) == 0))
  {
    v114 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_1000946EC();
    }
    goto LABEL_112;
  }

  -[NSMutableArray addObject:](v64, "addObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray addObject:](v64, "addObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v10 setObject:v64 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToRestoreOnly"]);

  if (!v15 || (v68 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v67), (objc_opt_isKindOfClass(v15, v68) & 1) == 0))
  {
    v117 = sub_10003A95C();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      sub_100094718();
    }
    goto LABEL_117;
  }

  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v10 setObject:v15 forKey:@"RelativePathsToRestoreOnly"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToOnlyBackupEncrypted"]);

  if (!v64 || (v70 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v69), (objc_opt_isKindOfClass(v64, v70) & 1) == 0))
  {
    v120 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_100094744();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v64, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray removeObject:](v64, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v10 setObject:v64 forKey:@"RelativePathsToOnlyBackupEncrypted"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v15 || (v72 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v71), (objc_opt_isKindOfClass(v15, v72) & 1) == 0))
  {
    v121 = sub_10003A95C();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      sub_100094770();
    }
    goto LABEL_117;
  }

  -[NSMutableArray addObject:](v15, "addObject:", @"Library/Safari/SafariTabs.db");
  [v10 setObject:v15 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToRestoreOnly"]);

  if (!v64 || (v74 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v73), (objc_opt_isKindOfClass(v64, v74) & 1) == 0))
  {
    v122 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_10009479C();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v64, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v10 setObject:v64 forKey:@"RelativePathsToRestoreOnly"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToOnlyBackupEncrypted"]);

  if (!v15 || (v76 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v75), (objc_opt_isKindOfClass(v15, v76) & 1) == 0))
  {
    v123 = sub_10003A95C();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      sub_1000947C8();
    }
    goto LABEL_117;
  }

  -[NSMutableArray removeObject:](v15, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v10 setObject:v15 forKey:@"RelativePathsToOnlyBackupEncrypted"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToBackupToService"]);

  if (!v64 || (v78 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v77), (objc_opt_isKindOfClass(v64, v78) & 1) == 0))
  {
    v124 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_1000947F4();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v64, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v10 setObject:v64 forKey:@"RelativePathsNotToBackupToService"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"HomeDomain");
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"KeychainDomain"));

  if (!v79
    || (v81 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v80), (objc_opt_isKindOfClass(v79, v81) & 1) == 0))
  {
    v125 = sub_10003A95C();
    v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
      sub_100094820();
    }

    goto LABEL_40;
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v79 setObject:v82 forKey:@"RelativePathsToBackupAndRestore"];

  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v79, @"KeychainDomain");
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"MediaDomain"));

  if (!v83
    || (v85 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v84), (objc_opt_isKindOfClass(v83, v85) & 1) == 0))
  {
    v127 = sub_10003A95C();
    v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
      sub_10009484C();
    }
    goto LABEL_135;
  }

  [v83 removeObjectForKey:@"RelativePathsNotToBackupToDrive"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v83, @"MediaDomain");
  v86 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v86 || (v88 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v87), (objc_opt_isKindOfClass(v86, v88) & 1) == 0))
  {
    v129 = sub_10003A95C();
    v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
      sub_100094878();
    }

    goto LABEL_139;
  }

  [v86 removeObject:@"Media/iTunes_Control/Device/Trainer"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/iTunesPrefs.plist"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/MobileSync.plist"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/ApertureAlbumPrefs"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/PSAlbumAlbums"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/PSElementsAlbums"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderPrefs"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderAlbums"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderName"];
  [v86 removeObject:@"Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"];
  [v86 addObject:@"Media/iTunes_Control/iTunes"];
  [v86 addObject:@"Media/iTunes_Control/Music"];
  [v86 addObject:@"Media/iTunes_Control/Sync"];
  [v86 addObject:@"Media/iTunes_Control/Artwork"];
  [v86 addObject:@"Media/Books"];
  [v86 addObject:@"Media/Music/Downloads"];
  [v83 setObject:v86 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v83, @"MediaDomain");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"RootDomain"));

  if (!v10
    || (v90 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v89), (objc_opt_isKindOfClass(v10, v90) & 1) == 0))
  {
    v131 = sub_10003A95C();
    v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
      sub_1000948A4();
    }

    goto LABEL_39;
  }

  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsToRemoveOnRestore"]);

  if (!v15 && (uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) == 0LL
    || (v92 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v91), (objc_opt_isKindOfClass(v15, v92) & 1) == 0))
  {
    v133 = sub_10003A95C();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      sub_1000948D0();
    }
    goto LABEL_117;
  }

  -[NSMutableArray addObject:](v15, "addObject:", @"Library/Preferences/com.apple.ASPCarryLog.plist");
  [v10 setObject:v15 forKey:@"RelativePathsToRemoveOnRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"RootDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToRemoveIfNotRestored"]);

  if (!v64 && (v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) == 0LL
    || (v94 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v93), (objc_opt_isKindOfClass(v64, v94) & 1) == 0))
  {
    v134 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_1000948FC();
    }
    goto LABEL_112;
  }

  -[NSMutableArray addObject:](v64, "addObject:", @"Library/Preferences/com.apple.MobileAsset.plist");
  [v10 setObject:v64 forKey:@"RelativePathsNotToRemoveIfNotRestored"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"RootDomain");
  uint64_t v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToRestore"]);

  if (!v15 || (v96 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v95), (objc_opt_isKindOfClass(v15, v96) & 1) == 0))
  {
    v135 = sub_10003A95C();
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      sub_100094928();
    }
LABEL_117:

LABEL_44:
    goto LABEL_39;
  }

  -[NSMutableArray removeObject:]( v15,  "removeObject:",  @"Library/Preferences/com.apple.powerd.lowpowermode.state.plist");
  [v10 setObject:v15 forKey:@"RelativePathsNotToRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"RootDomain");
  v64 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v64 || (v98 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v97), (objc_opt_isKindOfClass(v64, v98) & 1) == 0))
  {
    v136 = sub_10003A95C();
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      sub_100094954();
    }
LABEL_112:

    goto LABEL_39;
  }

  -[NSMutableArray removeObject:]( v64,  "removeObject:",  @"Library/Preferences/com.apple.powerd.lowpowermode.state.plist");
  [v10 setObject:v64 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v10, @"RootDomain");
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"SystemPreferencesDomain"));

  if (!v83
    || (v100 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v99), (objc_opt_isKindOfClass(v83, v100) & 1) == 0))
  {
    v137 = sub_10003A95C();
    v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
      sub_100094980();
    }
LABEL_135:

LABEL_139:
    goto LABEL_40;
  }

  v101 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v101
    || (v103 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v102), (objc_opt_isKindOfClass(v101, v103) & 1) == 0))
  {
    v138 = sub_10003A95C();
    v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      sub_1000949AC();
    }

    goto LABEL_139;
  }

  [v101 addObject:@"SystemConfiguration/com.apple.wifi.plist"];
  [v101 addObject:@"SystemConfiguration/com.apple.wifi-networks.plist"];
  [v83 setObject:v101 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v83, @"SystemPreferencesDomain");
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v7, "objectForKey:", @"KeyboardDomain"));

  if (!v104
    || (v106 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v105), (objc_opt_isKindOfClass(v104, v106) & 1) == 0))
  {
    v140 = sub_10003A95C();
    v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
      sub_1000949D8();
    }

    goto LABEL_40;
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (v107)
  {
    v109 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v108);
    if ((objc_opt_isKindOfClass(v107, v109) & 1) != 0) {
      [v107 addObject:@"Library/KeyboardServices"];
    }
  }

  v110 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  -[NSMutableDictionary setObject:forKey:](v110, "setObject:forKey:", @"/var/MobileAsset", @"RootPath");
  v111 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

  -[NSMutableArray addObject:](v111, "addObject:", @"AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_GenerativeModels");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_Overrides");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_Understanding");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_UnderstandingNLOverrides");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_Planner");
  -[NSMutableArray addObject:]( v111,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_PlannerOverrides");
  -[NSMutableDictionary setObject:forKey:](v110, "setObject:forKey:", v111, @"RelativePathsToBackupAndRestore");
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v110, @"MobileAssetDomain");
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  [v112 setObject:@"/var/mobile/XcodeBuiltProducts" forKey:@"RootPath"];
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  [v113 addObject:@"PressDemoScripts.xctestproducts"];
  [v112 setObject:v113 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v112, @"DemoPortalScriptsDomain");
  [v5 setObject:v7 forKey:@"SystemDomains"];
  v48 = v5;

LABEL_41:
  return v48;
}
}

void sub_100026808(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 lowercaseString]);
  [v2 addObject:v3];
}

void sub_10002688C(id a1)
{
  v1 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"Host",  @"X-Apple-HMAC-Sent-Timestamp",  0LL);
  id v2 = (void *)qword_1001252C0;
  qword_1001252C0 = (uint64_t)v1;
}

LABEL_59:
        }

        goto LABEL_61;
      }

      __int128 v18 = 0;
      v55 = v77;
    }

    else
    {
      __int128 v18 = 0;
      v55 = v77;
      int v38 = v81;
    }

    uint64_t v14 = v78;
    int v13 = v80;
LABEL_61:

    goto LABEL_62;
  }

  if (a7)
  {
    v93 = NSLocalizedDescriptionKey;
    v94 = @"Invalid HMAC algorithm";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
    uint64_t v17 = 2LL;
    goto LABEL_11;
  }

void sub_100027220(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"X-Apple-HMAC-Sent-Timestamp" lowercaseString]);
  id v2 = (void *)qword_1001252D8;
  qword_1001252D8 = v1;
}

LABEL_69:
            os_signpost_id_t v32 = v75;
            uint64_t v35 = v69;
          }
        }

        else
        {
LABEL_55:
          __int128 v20 = 0;
          uint64_t v16 = v73;
          os_signpost_id_t v32 = v75;
          v48 = v71;
        }

        goto LABEL_72;
      }

      if (a6)
      {
        v88 = NSLocalizedDescriptionKey;
        v89 = @"Key size too short";
        uint64_t v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
        uint64_t v17 = 6LL;
LABEL_26:
        __int128 v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  v17,  v16));
LABEL_72:

        goto LABEL_19;
      }
    }
  }

  else if (a6)
  {
    v92 = NSLocalizedDescriptionKey;
    v93 = @"Invalid timestamp value in HTTP request";
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
    uint64_t v17 = 4LL;
    goto LABEL_26;
  }

  __int128 v20 = 0;
LABEL_19:

LABEL_21:
  return v20;
}

void sub_100027B04(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"X-Apple-HMAC-Sent-Timestamp" lowercaseString]);
  id v2 = (void *)qword_1001252D8;
  qword_1001252D8 = v1;
}

void sub_100027BC0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDS3UploadHandler);
  id v2 = (void *)qword_1001252E0;
  qword_1001252E0 = (uint64_t)v1;
}

void sub_100027ECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100027EF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100027F00(uint64_t a1)
{
}

void sub_100027F08(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  unsigned int v4 = [v3 collectDemoLogsToFolder:*(void *)(a1 + 32)];

  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Collection of logs succeeded, lets upload these logs.",  buf,  2u);
    }

    id v8 = objc_alloc_init(&OBJC_CLASS___MSDS3UploadRequest);
    -[MSDS3UploadRequest setS3url:](v8, "setS3url:", *(void *)(a1 + 40));
    -[MSDS3UploadRequest setLogFilePath:]( v8,  "setLogFilePath:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz");
    -[MSDS3UploadRequest setRetryAttempts:](v8, "setRetryAttempts:", *(void *)(a1 + 72));
    -[MSDS3UploadRequest setHttpHeaders:](v8, "setHttpHeaders:", *(void *)(a1 + 48));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 handleRequestSync:v8]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
    id v12 = sub_10003A95C();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
        id v16 = [v15 code];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
        *(_DWORD *)buf = 134218242;
        id v27 = v16;
        __int16 v28 = 2114;
        id v29 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Log upload failed. Inform hub of error. Error: %ld, Reason: %{public}@",  buf,  0x16u);
      }

      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 error]);
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8LL);
      int v13 = *(os_log_s **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Log upload completed successfully.", buf, 2u);
    }

    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id obj = *(id *)(v23 + 40);
    [v2 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz" error:&obj];
    objc_storeStrong((id *)(v23 + 40), obj);
  }

  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Log collection failed. Inform hub of error.",  buf,  2u);
    }

    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v24 = *(id *)(v21 + 40);
    sub_100087610(&v24, 3727744742LL, (uint64_t)@"Failed to upload MobileStoreDemo logs to S3.");
    id v22 = v24;
    id v8 = *(MSDS3UploadRequest **)(v21 + 40);
    *(void *)(v21 + 40) = v22;
  }

  [*(id *)(a1 + 56) setUploadInProgress:0];
  [*(id *)(a1 + 56) demoLogUploadCompleted:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

LABEL_2:
  id v3 = self->_uniqueName;
  return v3;
}

void sub_100028D8C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDHelperAgent);
  id v2 = (void *)qword_1001252F0;
  qword_1001252F0 = (uint64_t)v1;
}

void sub_100028ECC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      id v13 = sub_10003A95C();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100094E30(v5, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    else
    {
      id v4 = sub_10003A95C();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100094E60(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }

    goto LABEL_11;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    sub_100094E90();
  }
LABEL_11:
}

void sub_10002CB6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002CBBC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDWorkQueueSet);
  id v2 = (void *)qword_100125300;
  qword_100125300 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.msddemoupdate", 0LL);
  [(id)qword_100125300 setDemoUpdateQueue:v3];

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.msdmessage", 0LL);
  [(id)qword_100125300 setMessageQueue:v4];

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.msdpolling", 0LL);
  [(id)qword_100125300 setPollingQueue:v5];

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.backgroundDownloadQueue", 0LL);
  [(id)qword_100125300 setBackgroundDownloadQueue:v6];

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.contentDownloadQueue", &_dispatch_queue_attr_concurrent);
  [(id)qword_100125300 setContentDownloadConcurrentQueue:v7];

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  [(id)qword_100125300 setOperationQueue:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100125300 operationQueue]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100125300 contentDownloadConcurrentQueue]);
  [v9 setUnderlyingQueue:v10];

  id v11 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100125300 operationQueue]);
  [v11 setMaxConcurrentOperationCount:3];
}

LABEL_8:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  v4,  0LL));
    goto LABEL_9;
  }

  dispatch_queue_t v4 = (id)kCFBundleVersionKey;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp info](self, "info"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v4]);

  if (v5)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
    if ((objc_opt_isKindOfClass(v5, v15) & 1) != 0) {
      goto LABEL_8;
    }
  }

  uint64_t v17 = sub_10003A95C();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000954E0();
  }

  uint64_t v12 = 0LL;
LABEL_9:

  return v12;
}

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);

  if (!v22) {
    [v10 setError:v21];
  }
  if (v21)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    id v24 = [v8 fileExistsAtPath:v23];

    if (v24)
    {
      id v25 = sub_10003A95C();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
        *(_DWORD *)buf = 138543362;
        uint8_t v44 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Hash check or entitlement check for %{public}@ failed, deleting file",  buf,  0xCu);
      }

      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
      id v39 = 0LL;
      id v30 = [v28 removeItemAtPath:v29 error:&v39];
      uint64_t v31 = v39;

      if ((v30 & 1) == 0)
      {
        os_signpost_id_t v32 = sub_10003A95C();
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10009AC88(self, v33);
        }
      }
    }
  }

  return v10;
}

    return;
  }

  if (v4 == (id)3)
  {
    id v11 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v30 = 0;
      id v13 = "Device is factory demo SKU device; skipping enrollment retry";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v30, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (v9)
  {
    uint64_t v15 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)id v30 = 0;
    id v13 = "Device is already enrolled; skipping enrollment retry";
    goto LABEL_7;
  }

  if (HIBYTE(v31))
  {
    uint64_t v16 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)id v30 = 0;
    id v13 = "Content update is in progress, skipping enrollment retry";
    goto LABEL_7;
  }

  if (v4 != (id)5)
  {
    id v26 = sub_10003A95C();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v30 = 0;
      __int16 v28 = "Unconditionally retry enrollment upon first launch!";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, v30, 2u);
    }

    dispatch_queue_t v7 = 0;
    goto LABEL_9;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation checkpointBarrier](self, "checkpointBarrier"));
  uint64_t v10 = [v9 activated];

  if (!v10) {
    return 1;
  }
  id v11 = sub_10003A95C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = 138543362;
    id v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is halted by checkpoint barrier.",  (uint8_t *)&v23,  0xCu);
  }

  id v13 = sub_10003AAAC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = -[MSDOperation signpostId](self, "signpostId");
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      uint64_t v23 = 138412290;
      id v24 = self;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "Encounter Checkpoint Barrier",  "Operation name: %{xcode:string}@",  (uint8_t *)&v23,  0xCu);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation checkpointBarrier](self, "checkpointBarrier"));
  [v17 waitUntilClear];

  uint64_t v18 = sub_10003AAAC();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = -[MSDOperation signpostId](self, "signpostId");
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v21,  "Encounter Checkpoint Barrier",  (const char *)&unk_1000D0677,  (uint8_t *)&v23,  2u);
    }
  }

  id v22 = sub_10003A95C();
  dispatch_queue_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = 138543362;
    id v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is free of checkpoint barrier.",  (uint8_t *)&v23,  0xCu);
  }

  dispatch_queue_t v7 = 1;
LABEL_9:

  return v7;
}

void sub_10002E118(_Unwind_Exception *a1)
{
}

void sub_10002E220( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002E314( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002E3F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002EB04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10002EB20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002EB30(uint64_t a1)
{
}

uint64_t sub_10002EB38(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL));
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_22:
    uint64_t v23 = v14;
    [v12 setObject:v14 forKey:v6];

    uint64_t v11 = 1LL;
    goto LABEL_23;
  }

  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v15 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_string_get_string_ptr(v5),  4LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v16 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = [v18 initWithXPCDictionary:v5];
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](&OBJC_CLASS___NSArray, "arrayWithXPCArray:", v5));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_double)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v21 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_date)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v22 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)xpc_date_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_22;
  }

  id v8 = sub_10003A95C();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100095BE8((uint64_t)v6, v9, v10);
  }

  uint64_t v11 = 0LL;
LABEL_23:

  return v11;
}

void sub_10002F6A0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10002F6D4()
{
  return [v0 code];
}

LABEL_54:
  v57 = *((_BYTE *)v135 + 24) != 0;
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v116, 8);

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(v146, 8);
  return v57;
}

void sub_1000308F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_1000309E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000309F4(uint64_t a1)
{
}

void sub_1000309FC(void *a1, uint64_t a2)
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[4] + 8) + 40) objectAtIndex:a2]);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v3]);
  id v5 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v5 createSymbolicLinkAtPath:v3 withDestinationPath:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) == 0)
  {
    id v8 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[7] + 8) + 40) localizedDescription]);
      *(_DWORD *)buf = 138543874;
      id v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Could not create link from %{public}@ to %{public}@ - %{public}@",  buf,  0x20u);
    }

    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 0;
  }
}

void sub_100030B68(void *a1, uint64_t a2)
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[4] + 8) + 40) objectAtIndex:a2]);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v3]);
  if ([v4 isEqualToString:@"ZERO_SIZE"])
  {
    if (([*(id *)(*(void *)(a1[6] + 8) + 40) createFileAtPath:v3 contents:0 attributes:0] & 1) == 0)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727740944LL,  @"Cannot write file."));
      uint64_t v6 = *(void *)(a1[7] + 8LL);
      unsigned __int8 v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v8 = sub_10003A95C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        uint64_t v15 = v3;
        uint64_t v10 = "Could not create empty file at %{public}@";
        uint64_t v11 = v9;
        uint32_t v12 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
        goto LABEL_10;
      }

      goto LABEL_10;
    }
  }

  else if (([*(id *)(*(void *)(a1[8] + 8) + 40) copyFileIfPresentInCache:v4 toLocation:v3 verifyHash:*(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24)] & 1) == 0)
  {
    id v13 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v3;
      uint64_t v10 = "Could not copy file %{public}@ from content cache to %{public}@";
      uint64_t v11 = v9;
      uint32_t v12 = 22;
      goto LABEL_9;
    }

void sub_1000313B8(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDPreferencesFile);
  id v2 = (void *)qword_100125310;
  qword_100125310 = (uint64_t)v1;
}

void sub_100031514( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000315CC(_Unwind_Exception *a1)
{
}

void sub_1000317D4(_Unwind_Exception *a1)
{
}

void sub_100031898(_Unwind_Exception *a1)
{
}

void sub_100031954(_Unwind_Exception *a1)
{
}

void sub_100031D88(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathExtension:@"plist"]);

  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 0LL));
  dispatch_queue_t v3 = (void *)qword_100125320;
  qword_100125320 = v2;
}

void sub_100032BCC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLocalization);
  uint64_t v2 = (void *)qword_100125330;
  qword_100125330 = (uint64_t)v1;
}

void sub_100032F14(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLocalEventStreamHandler);
  uint64_t v2 = (void *)qword_100125340;
  qword_100125340 = (uint64_t)v1;
}

id sub_100032FD4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleEvent:a2 fromStream:"com.apple.fsevents.matching"];
}

void sub_1000348E0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDStoreHoursManager);
  uint64_t v2 = (void *)qword_100125350;
  qword_100125350 = (uint64_t)v1;
}

void sub_100034A80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100034AA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expirationTimer]);
  [v1 fire];
}

LABEL_15:
  uint64_t v19 = sub_10003A95C();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v36) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "New store open-closed status:",  (uint8_t *)&v36,  2u);
  }

  uint64_t v21 = sub_10003A95C();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = -[MSDStoreHoursManager isStoreOpenNow](self, "isStoreOpenNow");
    uint64_t v36 = 67109120;
    LODWORD(v37) = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "    Is store open now: %{BOOL}d",  (uint8_t *)&v36,  8u);
  }

  id v24 = sub_10003A95C();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreOpenDate](self, "nextStoreOpenDate"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 toString]);
    uint64_t v36 = 138543362;
    uint64_t v37 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "    Next store open date: %{public}@",  (uint8_t *)&v36,  0xCu);
  }

  __int16 v28 = sub_10003A95C();
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextStoreClosedDate](self, "nextStoreClosedDate"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 toString]);
    uint64_t v36 = 138543362;
    uint64_t v37 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "    Next store close date: %{public}@",  (uint8_t *)&v36,  0xCu);
  }

  os_signpost_id_t v32 = sub_10003A95C();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDStoreHoursManager nextContentRevertDate](self, "nextContentRevertDate"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 toString]);
    uint64_t v36 = 138543362;
    uint64_t v37 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "    Next content revert date: %{public}@",  (uint8_t *)&v36,  0xCu);
  }

  uint64_t v18 = 1;
LABEL_26:

  return v18;
}

    int v14 = 1;
    goto LABEL_16;
  }

  return 0;
}

  return v11;
}

void sub_100035DF4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained expirationTimer]);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 expirationTimer]);
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setExpirationTimer:0];
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v8,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v9,  v10,  "storeHourSettingsExpirationHandler:",  0LL,  0LL,  0.0);
  id v12 = objc_loadWeakRetained(v2);
  [v12 setExpirationTimer:v11];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v14 = objc_loadWeakRetained(v2);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 expirationTimer]);
  [v13 addTimer:v15 forMode:NSDefaultRunLoopMode];

  id v16 = sub_10003A95C();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toString]);
    int v19 = 138543362;
    uint64_t v20 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Store hour settings will expire on %{public}@",  (uint8_t *)&v19,  0xCu);
  }
}

void sub_100036130(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained storeOpenTimer]);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeOpenTimer]);
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreOpenTimer:0];
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v8,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v9,  v10,  "storeOpenHandler:",  0LL,  0LL,  0.0);
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreOpenTimer:v11];

  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v13 = objc_loadWeakRetained(v2);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 storeOpenTimer]);
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

void sub_1000363CC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained storeCloseTimer]);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeCloseTimer]);
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreCloseTimer:0];
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  uint64_t v11 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v8,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v9,  v10,  "storeCloseHandler:",  0LL,  0LL,  0.0);
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreCloseTimer:v11];

  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v13 = objc_loadWeakRetained(v2);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 storeCloseTimer]);
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

LABEL_31:
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"/"]);
  if ([v27 count] != v36 || (objc_msgSend(v35, "annotated:", v18) & 1) != 0)
  {
LABEL_35:
    LOBYTE(v26) = 1;
    goto LABEL_36;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  id v30 = [v29 iOS];

  if (v30)
  {
  }

  else if (objc_msgSend(v35, "shouldRestoreSystemContainer_WatchAndTV:shared:", v19, v26))
  {
    goto LABEL_35;
  }

  os_signpost_id_t v32 = sub_10003A95C();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_1000971F0((uint64_t)v5, v33);
  }

  LOBYTE(v26) = 0;
LABEL_36:

  return v26;
}

          v64 = v17;
          sub_100087694(&v64, 3727744768LL, @"An error has occurred.");
          v59 = v64;

          v56 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDemoUpdateStatusHub sharedInstance]( &OBJC_CLASS___MSDDemoUpdateStatusHub,  "sharedInstance"));
          [v56 demoUpdateFailed:v59];

          v51 = objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
          [(id)v51 sendContentUpdateFailureEvent:v59 isFatal:1];

          -[MSDDemoUpdateController checkWithTimeKeeper:](v2, "checkWithTimeKeeper:", v59);
          -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 0LL);
          LOBYTE(v51) = 0;
          goto LABEL_18;
        }

        v67 = 0LL;
        sub_100087694(&v67, 3727740940LL, @"Could not download manifest.");
        uint64_t v17 = v67;
        v60 = 0LL;
        id v27 = 0LL;
LABEL_27:
        id v15 = 0LL;
        goto LABEL_31;
      }

      v54 = sub_10003A95C();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_1000984CC();
      }
    }

    v60 = 0LL;
    id v27 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_27;
  }

  v53 = sub_10003A95C();
  v51 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_DEFAULT, "demo updater is busy.", buf, 2u);
  }

  v59 = 0LL;
  v60 = 0LL;
  id v27 = 0LL;
  id v15 = 0LL;
LABEL_18:

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v2);

  return v51 & (v63 ^ 1);
}

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  id obj = (os_log_s *)v137;
  v130 = v22;
  v127 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v159,  v177,  16LL);
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  int v38 = 0;
  if (v127)
  {
    v128 = *(void *)v160;
    while (1)
    {
      id v39 = 0LL;
      do
      {
        if (*(void *)v160 != v128) {
          objc_enumerationMutation(obj);
        }
        int v40 = v36;
        v129 = v39;
        uint64_t v41 = *(void **)(*((void *)&v159 + 1) + 8 * v39);
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v143 = v41;
        v138 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:"));
        v141 = [v138 countByEnumeratingWithState:&v155 objects:v176 count:16];
        if (!v141) {
          goto LABEL_50;
        }
        v139 = *(void *)v156;
        while (2)
        {
          __int16 v42 = 0LL;
          do
          {
            v147 = v38;
            v149 = v24;
            double v43 = v37;
            uint8_t v44 = v23;
            if (*(void *)v156 != v139) {
              objc_enumerationMutation(v138);
            }
            v45 = *(const __CFString **)(*((void *)&v155 + 1) + 8LL * (void)v42);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v142 objectForKey:v143]);
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v45]);

            v47 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"Certificate"]);
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v145, "objectForKey:", v47));
            v49 = v48;
            uint64_t v36 = v40;
            if (!v48)
            {
              v87 = sub_10003A95C();
              v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                sub_10009DA90();
              }
LABEL_100:
              id v16 = v133;
              id v8 = v134;

              uint64_t v23 = v44;
              uint64_t v11 = v135;
              id v22 = v130;
LABEL_101:
              id v24 = v149;
              goto LABEL_102;
            }

            v50 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"TypeOfSignature"]);

            if ((v140 & [v50 isEqualToString:@"UAT"]) == 1)
            {
              v110 = sub_10003A95C();
              v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                sub_10009DAFC(v88, v111, v112, v113, v114, v115, v116, v117);
              }
              goto LABEL_99;
            }

            v51 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](v150, "getComponentData:", v37));

            if (!v51)
            {
              v89 = sub_10003A95C();
              v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                sub_10009DB6C();
              }
              uint64_t v36 = 0LL;
LABEL_99:
              uint8_t v44 = v50;
              goto LABEL_100;
            }

            v52 = (__SecKey *)[v49 objectForKey:@"publicKey"];
            v53 = v37;
            int v40 = (__CFString *)v51;
            v54 = sub_100071B48((uint64_t)kCFAllocatorDefault, v45, v51);
            v55 = (const __CFData *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"Signature"]);
            LODWORD(v52) = SecKeyVerifySignature( v52,  kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1,  (CFDataRef)+[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v54,  20LL),  v55,  &error);
            free(v54);
            v146 = v53;
            if (!(_DWORD)v52)
            {
              v90 = sub_10003A95C();
              v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
              v92 = v133;
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                v171 = 2114;
                *(void *)v172 = v45;
                *(_WORD *)&v172[8] = 2114;
                v173 = v143;
                v174 = 2114;
                v175 = error;
                _os_log_error_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@",  buf,  0x2Au);
              }

LABEL_87:
              id v22 = v130;
              uint64_t v36 = v40;
              uint64_t v37 = v146;
              uint64_t v23 = v50;
              id v16 = v92;
              id v8 = v134;
              uint64_t v11 = v135;
              goto LABEL_101;
            }

            v56 = (__CFString *)objc_claimAutoreleasedReturnValue([v49 objectForKey:@"RigorousCheckType"]);

            [v53 setObject:v56 forKey:@"RigorousCheckType"];
            v57 = -[__CFString isEqualToString:](v56, "isEqualToString:", @"Skip");
            v58 = v56;
            if (-[__CFString isEqualToString:](v56, "isEqualToString:", @"AppleISTCertCheck")
              && [v143 isEqualToString:@"Apps"]
              && !-[MSDDemoManifestCheck validateISTSignedApp:manifest:]( v150,  "validateISTSignedApp:manifest:",  v45,  v142))
            {
              v149 = v56;
              v92 = v133;
              goto LABEL_87;
            }

            int v38 = v57 ^ 1 | v147;

            __int16 v42 = (char *)v42 + 1;
            uint64_t v37 = v146;
            uint64_t v23 = v50;
            id v24 = v58;
          }

          while (v141 != v42);
          v141 = [v138 countByEnumeratingWithState:&v155 objects:v176 count:16];
          if (v141) {
            continue;
          }
          break;
        }

id sub_10003A95C()
{
  if (qword_100125368 != -1) {
    dispatch_once(&qword_100125368, &stru_1000F9CD0);
  }
  return (id)qword_100125360;
}

void sub_10003A99C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  uint64_t v2 = (void *)qword_100125360;
  qword_100125360 = (uint64_t)v1;
}

id sub_10003A9CC()
{
  if (qword_100125378 != -1) {
    dispatch_once(&qword_100125378, &stru_1000F9CF0);
  }
  return (id)qword_100125370;
}

void sub_10003AA0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  uint64_t v2 = (void *)qword_100125370;
  qword_100125370 = (uint64_t)v1;
}

id sub_10003AA3C()
{
  if (qword_100125388 != -1) {
    dispatch_once(&qword_100125388, &stru_1000F9D10);
  }
  return (id)qword_100125380;
}

void sub_10003AA7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  uint64_t v2 = (void *)qword_100125380;
  qword_100125380 = (uint64_t)v1;
}

id sub_10003AAAC()
{
  if (qword_100125398 != -1) {
    dispatch_once(&qword_100125398, &stru_1000F9D30);
  }
  return (id)qword_100125390;
}

void sub_10003AAEC(id a1)
{
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }

  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }

  dispatch_queue_t v3 = (void *)qword_100125390;
  qword_100125390 = (uint64_t)v1;
}

void sub_10003AB48( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_10003ABE4(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLogModel);
  id v2 = (void *)qword_1001253A0;
  qword_1001253A0 = (uint64_t)v1;
}

void sub_10003AD80(_Unwind_Exception *a1)
{
}

void sub_10003B110( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10003B128(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003B138(uint64_t a1)
{
}

void sub_10003B140(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1LL)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }

  *a4 = 0;
}

void sub_10003B3DC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDAnalyticsEventHandler);
  id v2 = (void *)qword_1001253B0;
  qword_1001253B0 = (uint64_t)v1;
}

uint64_t sub_10003DC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1LL;
}

LABEL_39:
      v71 = 0LL;
LABEL_40:
      uint64_t v36 = v29;
      os_signpost_id_t v32 = v28;
      goto LABEL_41;
    }

    id v14 = v31;
    id v15 = v76;
    if (v31
      && (int v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path")),
          uint64_t v41 = -[MSDManifest folder:contains:](v77, "folder:contains:", v31, v40),
          v40,
          v41)
      || v76
      && (__int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path")),
          double v43 = -[MSDManifest path:inSuperSet:](v77, "path:inSuperSet:", v42, v76),
          v42,
          (v43 & 1) == 0))
    {
      uint8_t v44 = context;
      goto LABEL_18;
    }

    if (([v27 BOOLValue] & 1) == 0
      && ([v26 BOOLValue] & 1) == 0
      && ![v28 BOOLValue])
    {
      v55 = sub_10003A95C();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
        *(_DWORD *)buf = 138543362;
        v90 = (NSURLResourceKey)v57;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is special file. Leave it along",  buf,  0xCu);
        goto LABEL_38;
      }

      goto LABEL_39;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
    v46 = (char *)[v45 rangeOfString:*p_rootPath];
    v70 = v47;

    if (v46)
    {
      if (v46 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = 0LL;
        goto LABEL_29;
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v68 substringFromIndex:&v46[v70]]);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue( [v50 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_1000FB848]);

      v49 = v68;
    }

    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue( [v49 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_1000FB848]);
    }

LABEL_29:
    if (-[__CFString length](v48, "length"))
    {
      v71 = v48;
    }

    else
    {

      v71 = @"/";
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata fileMetadatatWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "fileMetadatatWithPath:",  v51));

    if (!v52)
    {
      v64 = sub_10003A95C();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_100097628(v87, v19, &v88, v56);
      }
      v74 = 0LL;
      goto LABEL_40;
    }

    v53 = v71;
    if ((v73[2](v73, v52, v71) & 1) == 0) {
      break;
    }
    v74 = v52;
    v54 = context;
LABEL_35:

    uint8_t v44 = v54;
LABEL_18:
    objc_autoreleasePoolPop(v44);
    id v25 = objc_claimAutoreleasedReturnValue([v79 nextObject]);

    id v30 = v25 == 0;
    if (((v25 == 0) & v78) != 0)
    {

      uint64_t v20 = 1;
      int v19 = (os_log_s *)v79;
      goto LABEL_54;
    }
  }

  v66 = sub_10003A95C();
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
    sub_10009769C(v19, v67);
  }

  objc_autoreleasePoolPop(context);
  uint64_t v20 = 0;
LABEL_54:
  id v12 = v75;
  id v13 = v69;
  uint64_t v17 = v73;
LABEL_55:

  return v20;
}

    id v11 = (void *)v42;
    id v13 = v41;
LABEL_40:
    id v14 = v11;
LABEL_67:
    id v12 = v7;
    goto LABEL_5;
  }

BOOL sub_10003E580(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = sub_10003A95C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v4, "path"));
    int v10 = 136315906;
    id v11 = "-[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]_block_invoke";
    __int16 v12 = 2114;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Could not enumerate %{public}@, url=%{public}@, error=%{public}@",  (uint8_t *)&v10,  0x2Au);
  }

  return 1;
}

void sub_10003F020(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDSessionMetrics);
  id v2 = (void *)qword_1001253C8;
  qword_1001253C8 = (uint64_t)v1;
}

void sub_10003F1E8(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transactionMetrics", 0));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 resourceFetchType] != (id)3)
        {
          uint64_t v8 = -[MSDSessionTransactionData initWithData:]( objc_alloc(&OBJC_CLASS___MSDSessionTransactionData),  "initWithData:",  v7);
          [*(id *)(a1 + 40) saveToFile:v8];
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void sub_10003F564( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10003F674(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDEnrollPassword);
  id v2 = (void *)qword_1001253D8;
  qword_1001253D8 = (uint64_t)v1;
}

void sub_10003F958(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDPricingUpdateController);
  id v2 = (void *)qword_1001253E8;
  qword_1001253E8 = (uint64_t)v1;
}

void sub_10003FB04(_Unwind_Exception *a1)
{
}

id sub_10003FF28(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) heartBeatMonitor]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) heartBeatMonitor]);
    [v3 invalidate];
  }

  return [*(id *)(a1 + 32) setHeartBeatMonitor:0];
}

void sub_100040010(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = 120;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting timer for Pricing (will trigger in %d seconds).",  (uint8_t *)v5,  8u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "pricingUpdateTimeOut:",  0LL,  0LL,  120.0));
  [*(id *)(a1 + 32) setHeartBeatMonitor:v4];
}

void sub_1000403AC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLocalMessageResponder);
  id v2 = (void *)qword_1001253F8;
  qword_1001253F8 = (uint64_t)v1;
}

void sub_100040998(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcListener]);
  id v5 = v3;
  id v6 = sub_10003AA3C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100097A1C();
  }

  xpc_type_t type = xpc_get_type(v5);
  id v9 = sub_10003AA3C();
  __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000979F0();
  }

  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    if (v5 == &_xpc_error_termination_imminent)
    {
      id v17 = sub_10003AA3C();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v24) = 0;
      int v19 = "XPC connection will be closed";
    }

    else
    {
      id v20 = sub_10003AA3C();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v21 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v5 != &_xpc_error_connection_invalid)
      {
        if (v21)
        {
          LODWORD(v24) = 136446210;
          *(void *)((char *)&v24 + 4) = xpc_dictionary_get_string(v5, _xpc_error_key_description);
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Got XPC error on listener connection: %{public}s",  (uint8_t *)&v24,  0xCu);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLocalMessageResponder sharedInstance]( &OBJC_CLASS___MSDLocalMessageResponder,  "sharedInstance"));
        uint64_t v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v22 xpcListener]);
        xpc_connection_cancel(v23);

        exit(1);
      }

      if (!v21)
      {
LABEL_18:

        exit(0);
      }

      LOWORD(v24) = 0;
      int v19 = "No XPC connection, exiting";
    }

    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, 2u);
    goto LABEL_18;
  }

  id v11 = sub_10003AA3C();
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000979C4();
  }

  id v13 = v5;
  id v14 = sub_10003AA3C();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Start to deal with new connection",  (uint8_t *)&v24,  2u);
  }

  *(void *)&__int128 v24 = _NSConcreteStackBlock;
  *((void *)&v24 + 1) = 3221225472LL;
  id v25 = sub_100044A5C;
  id v26 = &unk_1000F9C68;
  id v27 = v13;
  __int16 v16 = (_xpc_connection_s *)v13;
  xpc_connection_set_event_handler(v16, &v24);
  xpc_connection_resume(v16);
}

LABEL_229:
    goto LABEL_96;
  }

  if (!strncmp(string, "DemoUpdate", 0xBuLL))
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    int v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v37 demoUpdateQueue]);
    v344[0] = _NSConcreteStackBlock;
    v344[1] = 3221225472LL;
    v344[2] = sub_100043E80;
    v344[3] = &unk_1000F9ED0;
    v345 = v18;
    v344[5] = &v354;
    uint64_t v36 = v344;
    v344[4] = v316;
    dispatch_async(v38, v344);

LABEL_62:
    reply = (os_log_s *)v36[4];
    goto LABEL_63;
  }

  if (!strncmp(string, "DemoMaualUpdate", 0x10uLL))
  {
    v46 = (void *)os_transaction_create("Turning off snapshot.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v46);

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v47 = [v320 canUnlockSnapshot];
    *((_BYTE *)v355 + 24) = v47;
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v47);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v355 + 24))
    {
      v48 = [v320 unlockSnapshot];
      *((_BYTE *)v355 + 24) = v48;

      goto LABEL_95;
    }

    v192 = sub_10003AA3C();
    v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v192);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
      sub_100097B74();
    }
    goto LABEL_289;
  }

  if (!strncmp(string, "DemoSnapshotRevert", 0x13uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v54 = [v320 canRevertSnapshot];
    *((_BYTE *)v355 + 24) = v54;
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v54);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v355 + 24))
    {
      v48 = [v320 revertSnapshot];
      *((_BYTE *)v355 + 24) = v48;

      goto LABEL_95;
    }

    v196 = sub_10003AA3C();
    v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v196);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
      sub_100097BA0();
    }
    goto LABEL_289;
  }

  if (!strncmp(string, "SetLastShallowRefreshTime", 0x1AuLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v57 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v57, "setDateFormat:", @"dd-MM-yyyy_HH:mm:ss:SSS");
    v58 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "LastShallowRefreshTime"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v57, "dateFromString:", v59));

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v61 saveLastShallowRefreshTime:v60];

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    [v62 sendLastShallowRefreshTime:v60];

    xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
    xpc_connection_send_message(connection, reply);

    goto LABEL_63;
  }

  if (!strncmp(string, "DemoSnapshotCommit", 0x13uLL))
  {
    global_queue = dispatch_get_global_queue(21LL, 0LL);
    v78 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v341[0] = _NSConcreteStackBlock;
    v341[1] = 3221225472LL;
    v341[2] = sub_100043F60;
    v341[3] = &unk_1000F9EF8;
    uint64_t v36 = v341;
    v341[4] = v5;
    v342 = v320;
    v343 = connection;
    dispatch_async(v78, v341);

    goto LABEL_62;
  }

  if (!strncmp(string, "SetSEPDemoMode", 0xFuLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v79 = objc_msgSend(v320, "setSEPDemoMode:", xpc_dictionary_get_BOOL(v5, "SEPDemoMode"));
    *((_BYTE *)v355 + 24) = v79;
    xpc_dictionary_set_BOOL(reply, "MSDResult", v79);
    xpc_connection_send_message(connection, reply);
    goto LABEL_63;
  }

  if (!strncmp(string, "DemoPrepare", 0xCuLL))
  {
    v80 = (void *)os_transaction_create("Preparing demo device.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v80);

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    xpc_dictionary_set_BOOL(reply, "DemoPrepareAcknowledged", 1);
    if (-[MSDLocalMessageResponder demoPrepareInProgress](self, "demoPrepareInProgress"))
    {
      v81 = sub_10003A95C();
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Ignore second demo prepare request as it's already started.",  buf,  2u);
      }

      xpc_connection_send_message(connection, reply);
      goto LABEL_97;
    }

    -[MSDLocalMessageResponder setDemoPrepareInProgress:](self, "setDemoPrepareInProgress:", 1LL);
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    v88 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v87 demoUpdateQueue]);
    v333[0] = _NSConcreteStackBlock;
    v333[1] = 3221225472LL;
    v333[2] = sub_100044034;
    v333[3] = &unk_1000F9F20;
    v334 = v320;
    v335 = connection;
    v336 = reply;
    v339 = &v354;
    v340 = &v357;
    v337 = v5;
    v338 = self;
    reply = reply;
    dispatch_async(v88, v333);

    goto LABEL_63;
  }

  if (!strncmp(string, "Demo", 5uLL))
  {
    v85 = (void *)os_transaction_create("Turning on snapshot.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v85);

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v86 = [v320 canLockSnapshot];
    *((_BYTE *)v355 + 24) = v86;
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v86);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v355 + 24))
    {
      v48 = [v320 lockSnapshot];
      *((_BYTE *)v355 + 24) = v48;

      goto LABEL_95;
    }

    v215 = sub_10003AA3C();
    v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v215);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
      sub_100097BCC();
    }
LABEL_289:

    goto LABEL_97;
  }

  if (!strncmp(string, "Virgin", 7uLL))
  {
    v89 = (void *)os_transaction_create("Unpairing");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v89);

    v90 = xpc_dictionary_get_BOOL(v5, "ObliterateDevice");
    v91 = xpc_dictionary_get_BOOL(v5, "PreserveESim");
    v92 = xpc_dictionary_get_BOOL(v5, "CleanUpForBetterTogether");
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    if (v92)
    {
      v93 = [v320 canRunCleanUpForBetterTogetherDevice];
      *((_BYTE *)v355 + 24) = v93;
      if (!v93)
      {
        v101 = 0;
        goto LABEL_165;
      }

      v94 = [v320 runCleanUpForBetterTogetherDevice];
    }

    else
    {
      v94 = [v320 canUnenrollWithObliteration:v90 consultDeviceOptions:1];
    }

    v101 = v94;
    *((_BYTE *)v355 + 24) = v94;
LABEL_165:
    xpc_dictionary_set_BOOL(reply, "Acknowledged", v101);
    xpc_connection_send_message(connection, reply);
    if (*((_BYTE *)v355 + 24))
    {
      if (v92) {
        goto LABEL_97;
      }
      v48 = [v320 unenrollWithObliteration:v90 preserveESim:v91 callUnregister:1 preserveDDLFlag:1];
      *((_BYTE *)v355 + 24) = v48;

LABEL_95:
      if ((v48 & 1) != 0) {
        goto LABEL_64;
      }
LABEL_96:
      v55 = v358;
      id obj = v358[5];
      sub_100087694(&obj, 3727744768LL, @"An error has occurred.");
      objc_storeStrong(v55 + 5, obj);
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MSDDemoUpdateStatusHub sharedInstance]( &OBJC_CLASS___MSDDemoUpdateStatusHub,  "sharedInstance"));
      -[os_log_s demoUpdateFailed:](reply, "demoUpdateFailed:", v358[5]);
LABEL_97:

      goto LABEL_127;
    }

    v222 = sub_10003AA3C();
    v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR)) {
      sub_100097BF8();
    }
    goto LABEL_289;
  }

  if (!strncmp(string, "GetDeviceOptions", 0x11uLL))
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue([v320 getDeviceOptions]);
    v96 = xpc_dictionary_create_reply(v5);
    if (!v96) {
      v96 = xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v97 = xpc_dictionary_get_string(v5, "SubKey");
    if (v97)
    {
      v98 = v97;
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue([v95 objectForKey:v99]);
    }

    else
    {
      reply = v95;
      v98 = "device_options";
    }

    v111 = objc_opt_class(&OBJC_CLASS___NSDictionary, v100);
    if ((objc_opt_isKindOfClass(reply, v111) & 1) != 0)
    {
      v113 = v358;
      v332 = v358[5];
      v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  reply,  0LL,  &v332));
      objc_storeStrong(v113 + 5, v332);
      if (v358[5])
      {
        v234 = sub_10003AA3C();
        v235 = (os_log_s *)objc_claimAutoreleasedReturnValue(v234);
        if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR)) {
          sub_100097CA0();
        }

        goto LABEL_97;
      }

      v115 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v114, 4LL);

      reply = (os_log_s *)v115;
    }

    if (reply)
    {
      v116 = objc_opt_class(&OBJC_CLASS___NSString, v112);
      if ((objc_opt_isKindOfClass(reply, v116) & 1) == 0)
      {
        v118 = objc_opt_class(&OBJC_CLASS___NSNumber, v117);
        if ((objc_opt_isKindOfClass(reply, v118) & 1) == 0)
        {
          v241 = sub_10003AA3C();
          v242 = (os_log_s *)objc_claimAutoreleasedReturnValue(v241);
          if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR)) {
            sub_100097C24();
          }

          goto LABEL_229;
        }
      }

      v119 = objc_opt_class(&OBJC_CLASS___NSString, v117);
      if ((objc_opt_isKindOfClass(reply, v119) & 1) != 0) {
        xpc_dictionary_set_string( v96, v98, (const char *)-[os_log_s UTF8String](reply, "UTF8String"));
      }
      else {
        xpc_dictionary_set_BOOL(v96, v98, (BOOL)-[os_log_s BOOLValue](reply, "BOOLValue"));
      }
    }

    xpc_connection_send_message(connection, v96);

    goto LABEL_63;
  }

  if (!strncmp(string, "ConfigureWiFi", 0xEuLL))
  {
    v102 = sub_10003AA3C();
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Configuring WiFi...", buf, 2u);
    }

    v104 = xpc_dictionary_create_reply(v5);
    v105 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "SSID"));
    v106 = (char *)objc_claimAutoreleasedReturnValue(v105);
    v107 = xpc_dictionary_get_string(v5, "Password");
    if (v107) {
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v107));
    }
    else {
      reply = 0LL;
    }
    v147 = sub_10003AA3C();
    v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v364 = v106;
      _os_log_impl( (void *)&_mh_execute_header,  v148,  OS_LOG_TYPE_DEFAULT,  "Setting up WiFi: ssid = %{public}@",  buf,  0xCu);
    }

    v149 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
    v150 = [v149 configureWiFi:v106 password:reply];

    if ([v320 dcotaOfflineModeDevice])
    {
      v151 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](&OBJC_CLASS___MSDFindMyHub, "sharedInstance"));
      [v151 handleEnrollmentRetryUponFirstLaunch];
    }

    xpc_dictionary_set_BOOL(v104, "Result", v150);
    xpc_connection_send_message(connection, v104);

    goto LABEL_63;
  }

  if (!strncmp(string, "DisconnectAndForgetWiFi", 0x18uLL))
  {
    v108 = sub_10003AA3C();
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "Disconnecting from current WiFi and forgetting all known WiFi...",  buf,  2u);
    }

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
    [v110 disassociateAndForgetWiFi];

    xpc_dictionary_set_BOOL(reply, "Result", 1);
    xpc_connection_send_message(connection, reply);
    goto LABEL_63;
  }

  if (!strncmp(string, "SetLanguageAndRegion", 0x15uLL))
  {
    v120 = sub_10003AA3C();
    v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "Setting Device Language and Region...",  buf,  2u);
    }

    v122 = (void *)os_transaction_create("Setting Device Language and Region.");
    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v122);

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v123 = dispatch_semaphore_create(0LL);
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v124 startFullScreenUIWith:@"LANGUAGE_UPDATE" allowCancel:0];

    value = 0;
    v125 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "languageIdentifier"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
    v127 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "regionCode"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
    v329[0] = _NSConcreteStackBlock;
    v329[1] = 3221225472LL;
    v329[2] = sub_1000444FC;
    v329[3] = &unk_1000F9F48;
    v130 = v123;
    v330 = v130;
    v131 = [v129 setDeviceLanguage:v126 andRegion:v128 sbRestartNeeded:&value sbRestartHandler:v329];

    xpc_dictionary_set_BOOL(reply, "Result", v131);
    xpc_connection_send_message(connection, reply);
    if (value) {
      v132 = v131;
    }
    else {
      v132 = 0;
    }
    if (v132 == 1)
    {
      v133 = sub_10003A95C();
      v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "Waiting for Springboard restart", buf, 2u);
      }

      v135 = dispatch_time(0LL, 70000000000LL);
      if (dispatch_semaphore_wait(v130, v135))
      {
        v136 = sub_10003A95C();
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
          sub_100097CCC(v137, v138, v139, v140, v141, v142, v143, v144);
        }
      }
    }

    v145 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v145 stopFullScreenUI:0];

    -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", 0LL);
    goto LABEL_63;
  }

  if (!strncmp(string, "GetLanguageAndRegion", 0x15uLL))
  {
    v152 = sub_10003AA3C();
    v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_DEFAULT,  "Getting Device Language and Region...",  buf,  2u);
    }

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v154 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
    v155 = (void *)objc_claimAutoreleasedReturnValue([v154 getCurrentDeviceLanguage]);

    if (v155)
    {
      v156 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      v157 = (void *)objc_claimAutoreleasedReturnValue([v156 getCurrentDeviceRegion]);

      if (!v157)
      {
        v264 = sub_10003A95C();
        v265 = (os_log_s *)objc_claimAutoreleasedReturnValue(v264);
        if (os_log_type_enabled(v265, OS_LOG_TYPE_ERROR)) {
          sub_100097D64();
        }

        goto LABEL_229;
      }

      v158 = v155;
      xpc_dictionary_set_string(reply, "languageIdentifier", (const char *)[v158 UTF8String]);
      v159 = v157;
      xpc_dictionary_set_string(reply, "regionCode", (const char *)[v159 UTF8String]);
      xpc_connection_send_message(connection, reply);

      goto LABEL_63;
    }

    v262 = sub_10003A95C();
    v263 = (os_log_s *)objc_claimAutoreleasedReturnValue(v262);
    if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR)) {
      sub_100097D38();
    }
    goto LABEL_329;
  }

  if (!strncmp(string, "GetAppUsageSessionUUID", 0x17uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v162 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDeviceDataCollector sharedInstance](&OBJC_CLASS___MSDDeviceDataCollector, "sharedInstance"));
    v163 = (void *)objc_claimAutoreleasedReturnValue([v162 getCurrentAppUsageSessionUUID]);

    if (v163)
    {
      xpc_dictionary_set_BOOL(reply, "Result", 1);
      xpc_dictionary_set_string( reply, "SessionUUID", (const char *)[v163 UTF8String]);
    }

    else
    {
      xpc_dictionary_set_BOOL(reply, "Result", 0);
    }

    xpc_connection_send_message(connection, reply);

    goto LABEL_63;
  }

  if (!strncmp(string, "CollectAppUsageData", 0x14uLL))
  {
    v164 = xpc_dictionary_create_reply(v5);
    v165 = xpc_dictionary_get_value(v5, "StartTime");
    v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
    if (xpc_get_type(v166) == (xpc_type_t)&_xpc_type_double)
    {
      v167 = xpc_dictionary_get_value(v5, "EndTime");
      v168 = (void *)objc_claimAutoreleasedReturnValue(v167);
      if (xpc_get_type(v168) == (xpc_type_t)&_xpc_type_double)
      {
        v169 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  xpc_double_get_value(v166));
        reply = (os_log_s *)objc_claimAutoreleasedReturnValue(v169);
        v170 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  xpc_double_get_value(v168));
        v171 = (void *)objc_claimAutoreleasedReturnValue(v170);
        v172 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDeviceDataCollector sharedInstance]( &OBJC_CLASS___MSDDeviceDataCollector,  "sharedInstance"));
        [v172 collectAppUsageWithSessionStart:reply andEnd:v171];
        v173 = 1;
LABEL_223:

        xpc_dictionary_set_BOOL(v164, "Result", v173);
        xpc_connection_send_message(connection, v164);

        goto LABEL_63;
      }

      v280 = sub_10003A95C();
      v172 = (void *)objc_claimAutoreleasedReturnValue(v280);
      if (os_log_type_enabled((os_log_t)v172, OS_LOG_TYPE_ERROR)) {
        sub_100097D90();
      }
    }

    else
    {
      v279 = sub_10003A95C();
      v172 = (void *)objc_claimAutoreleasedReturnValue(v279);
      if (os_log_type_enabled((os_log_t)v172, OS_LOG_TYPE_ERROR)) {
        sub_100097DBC();
      }
      v168 = 0LL;
    }

    v171 = 0LL;
    reply = 0LL;
    v173 = 0;
    goto LABEL_223;
  }

  if (!strncmp(string, "SaveBTPairingInfo", 0x12uLL))
  {
    v177 = sub_10003AA3C();
    v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
    if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "Saving Bluetooth Pairing Info...", buf, 2u);
    }

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if ([v320 isContentFrozen])
    {
      v179 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBluetoothHelper sharedInstance](&OBJC_CLASS___MSDBluetoothHelper, "sharedInstance"));
      v180 = [v179 preserveBTPairingRecord];

      v181 = sub_10003A95C();
      v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
      if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v364) = v180;
        _os_log_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_DEFAULT,  "Bluetooth pairing info result: %{public, BOOL}d",  buf,  8u);
      }
    }

    else
    {
      LOBYTE(v180) = 1;
    }

    xpc_dictionary_set_BOOL(reply, "Result", v180);
    xpc_connection_send_message(connection, reply);
    goto LABEL_63;
  }

  if (!strncmp(string, "StartOSUpdate", 0xEuLL))
  {
    reply = (os_log_s *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v23);
    v183 = [v320 isVerifiedDemoDevice];
    v184 = xpc_dictionary_create_reply(v5);
    if (!v184) {
      v184 = xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    if ((v183 & 1) != 0)
    {
      if ((os_variant_has_internal_content("com.apple.mobilestoredemod") & 1) != 0)
      {
        v185 = xpc_dictionary_get_string(v5, "OSVersion");
        if (v185)
        {
          v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v185));
          -[os_log_s setObject:forKey:](reply, "setObject:forKey:", v186, @"OSVersion");
        }

        v187 = xpc_dictionary_get_string(v5, "DemodVersion");
        if (v187)
        {
          v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v187));
          -[os_log_s setObject:forKey:](reply, "setObject:forKey:", v188, @"demodVersion");
        }

        [v320 saveOSUpdateRequest:reply];
        v189 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
        v190 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v189 demoUpdateQueue]);
        v327[0] = _NSConcreteStackBlock;
        v327[1] = 3221225472LL;
        v327[2] = sub_100044504;
        v327[3] = &unk_1000F9768;
        v328 = v320;
        dispatch_async(v190, v327);

        v191 = v328;
      }

      else
      {
        v293 = sub_10003AA3C();
        v191 = (os_log_s *)objc_claimAutoreleasedReturnValue(v293);
        if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
          sub_100097DE8(v191, v294, v295, v296, v297, v298, v299, v300);
        }
      }
    }

    else
    {
      v292 = sub_10003AA3C();
      v191 = (os_log_s *)objc_claimAutoreleasedReturnValue(v292);
      if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
        sub_100097E58();
      }
    }

    xpc_dictionary_set_BOOL(v184, "Result", 1);
    xpc_connection_send_message(connection, v184);

    goto LABEL_63;
  }

  if (!strncmp(string, "LaunchApp", 0xAuLL))
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      v194 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "BundleID"));
      v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v194);
      +[MSDAppLauncherTerminator launchApp:withOptions:outError:]( &OBJC_CLASS___MSDAppLauncherTerminator,  "launchApp:withOptions:outError:",  v195,  0LL,  0LL);
    }

    else
    {
      v199 = sub_10003A95C();
      v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v199);
      if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
        sub_100097E84(v195, v200, v201, v202, v203, v204, v205, v206);
      }
    }

    v207 = (os_log_s *)xpc_dictionary_create_reply(v5);
    reply = v207;
    if (v207)
    {
      xpc_dictionary_set_BOOL(v207, "MSDResult", 0);
      xpc_connection_send_message(connection, reply);
    }

    goto LABEL_63;
  }

  if (!strncmp(string, "UICheckIn", 0xAuLL))
  {
    v197 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v197 setConnection:connection];

    v198 = (os_log_s *)xpc_dictionary_create_reply(v5);
    reply = v198;
    if (v198)
    {
LABEL_259:
      xpc_dictionary_set_BOOL(v198, "Acknowledged", 1);
      xpc_connection_send_message(connection, reply);
    }

LABEL_63:
    goto LABEL_64;
  }

  if (!strncmp(string, "Cancel", 7uLL))
  {
    v208 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
    [v208 cancelDemoContentUpdate];

    v198 = (os_log_s *)xpc_dictionary_create_reply(v5);
    reply = v198;
    if (!v198) {
      goto LABEL_63;
    }
    goto LABEL_259;
  }

  if (!strncmp(string, "StoreDataBlob", 0xEuLL))
  {
    *((_BYTE *)v21 + 24) = 0;
    if (v311 && v312)
    {
      v209 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
      v210 = [v209 storeDataBlob:v311 withContainerIdentifier:v312];
      *((_BYTE *)v355 + 24) = v210;
    }

    v211 = (os_log_s *)xpc_dictionary_create_reply(v5);
    reply = v211;
    if (!v211) {
      goto LABEL_63;
    }
LABEL_270:
    xpc_dictionary_set_BOOL(v211, "Acknowledged", *((_BYTE *)v355 + 24));
    xpc_connection_send_message(connection, reply);
    goto LABEL_63;
  }

  if (!strncmp(string, "RetrieveSavedDataBlob", 0x16uLL))
  {
    if (v312)
    {
      v212 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue([v212 retrieveDataBlob:v312]);
    }

    else
    {
      reply = 0LL;
    }

    v220 = xpc_dictionary_create_reply(v5);
    if (v220)
    {
      v221 = reply;
      xpc_dictionary_set_data( v220,  "SavedDataBlob",  -[os_log_s bytes](v221, "bytes"),  (size_t)-[os_log_s length](v221, "length"));
      xpc_connection_send_message(connection, v220);
    }

    goto LABEL_63;
  }

  if (!strncmp(string, "DeleteDataBlob", 0xFuLL))
  {
    *((_BYTE *)v21 + 24) = 0;
    if (v312)
    {
      v213 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
      v214 = [v213 deleteDataBlob:v312];
      *((_BYTE *)v355 + 24) = v214;
    }

    v211 = (os_log_s *)xpc_dictionary_create_reply(v5);
    reply = v211;
    if (!v211) {
      goto LABEL_63;
    }
    goto LABEL_270;
  }

  if (!strncmp(string, "GetCurrentNetworkInfo", 0x16uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    if (!reply) {
      reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v216 = xpc_dictionary_create(0LL, 0LL, 0LL);
    array = xpc_dictionary_get_array(v5, "NetworkInfoKeys");
    v218 = (void *)objc_claimAutoreleasedReturnValue(array);
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_100044544;
    applier[3] = &unk_1000F9F70;
    v219 = v216;
    v325 = v219;
    v326 = v320;
    xpc_array_apply(v218, applier);
    xpc_dictionary_set_value(reply, "Result", v219);
    xpc_connection_send_message(connection, reply);

    goto LABEL_63;
  }

  if (!strncmp(string, "IsStoreOpen", 0xCuLL))
  {
    v223 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v223 refreshStoreHoursManagerUsingSettings];

    v224 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
    v225 = [v224 isStoreOpenNow];

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v226 = sub_10003A95C();
    v227 = (os_log_s *)objc_claimAutoreleasedReturnValue(v226);
    if (os_log_type_enabled(v227, OS_LOG_TYPE_DEBUG)) {
      sub_100097EF4(v225, v227);
    }

    if (reply)
    {
      xpc_dictionary_set_BOOL(reply, "MSDResult", 1);
      xpc_dictionary_set_BOOL(reply, "ResultData", v225);
      xpc_connection_send_message(connection, reply);
    }

    goto LABEL_63;
  }

  if (!strncmp(string, "NextStoreOpenDate", 0x12uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v228 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v228 refreshStoreHoursManagerUsingSettings];

    v229 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
    v230 = (void *)objc_claimAutoreleasedReturnValue([v229 nextStoreOpenDate]);

    if (reply)
    {
      if (v230)
      {
        v231 = sub_10003A95C();
        v232 = (os_log_s *)objc_claimAutoreleasedReturnValue(v231);
        if (os_log_type_enabled(v232, OS_LOG_TYPE_DEBUG)) {
          sub_100097F7C();
        }

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        [v230 timeIntervalSince1970];
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v233);
      }

      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string( reply,  "ErrorMessage",  "MSDStoreHoursManager returned nil value for nextStoreOpenDate");
      }

      xpc_connection_send_message(connection, reply);
    }

    goto LABEL_326;
  }

  if (!strncmp(string, "NextStoreCloseDate", 0x13uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    v236 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v236 refreshStoreHoursManagerUsingSettings];

    v237 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
    v230 = (void *)objc_claimAutoreleasedReturnValue([v237 nextStoreClosedDate]);

    if (reply)
    {
      if (v230)
      {
        v238 = sub_10003A95C();
        v239 = (os_log_s *)objc_claimAutoreleasedReturnValue(v238);
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEBUG)) {
          sub_100097FE8();
        }

        xpc_dictionary_set_BOOL(reply, "Result", 1);
        [v230 timeIntervalSince1970];
        xpc_dictionary_set_date(reply, "NextStoreHour", (uint64_t)v240);
      }

      else
      {
        xpc_dictionary_set_BOOL(reply, "Result", 0);
        xpc_dictionary_set_string( reply,  "ErrorMessage",  "MSDStoreHoursManager returned nil value for nextStoreCloseDate");
      }

      xpc_connection_send_message(connection, reply);
    }

  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v50 & 1;
}

LABEL_326:
    goto LABEL_63;
  }

  if (!strncmp(string, "UpdateStoreHours", 0x11uLL))
  {
    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
    v244 = has_internal_content;
    if (!has_internal_content)
    {
      v266 = sub_10003A95C();
      v247 = (os_log_s *)objc_claimAutoreleasedReturnValue(v266);
      if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR)) {
        sub_1000980F0(v247, v267, v268, v269, v270, v271, v272, v273);
      }
LABEL_335:

      if (reply)
      {
        xpc_dictionary_set_BOOL(reply, "Result", v244);
        xpc_connection_send_message(connection, reply);
      }

      goto LABEL_63;
    }

    v245 = xpc_dictionary_get_array(v5, "RawStoreHours");
    v246 = (void *)objc_claimAutoreleasedReturnValue(v245);
    v247 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](&OBJC_CLASS___NSArray, "arrayWithXPCArray:", v246));

    if (v247)
    {
      v248 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)xpc_dictionary_get_date(v5, "EvaluateAgainstDate"));
      v249 = (void *)objc_claimAutoreleasedReturnValue(v248);
      if (!v249)
      {
        v309 = sub_10003A95C();
        v310 = (os_log_s *)objc_claimAutoreleasedReturnValue(v309);
        if (os_log_type_enabled(v310, OS_LOG_TYPE_ERROR)) {
          sub_1000980C4();
        }

        goto LABEL_229;
      }

      v250 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
      v251 = (void *)objc_claimAutoreleasedReturnValue([v250 hubSuppliedSettings]);
      v252 = [v251 mutableCopy];

      [v252 setObject:v247 forKey:@"StoreHours"];
      [v250 saveHubSuppliedSettings:v252];
      [v250 refreshStoreHoursManagerUsingSettings];
      v253 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
      [v253 evaluateStoreStatusAgainstPointInTime:v249];

      goto LABEL_335;
    }

    v301 = sub_10003A95C();
    v263 = (os_log_s *)objc_claimAutoreleasedReturnValue(v301);
    if (os_log_type_enabled(v263, OS_LOG_TYPE_ERROR)) {
      sub_100098054(v263, v302, v303, v304, v305, v306, v307, v308);
    }
LABEL_329:

    goto LABEL_229;
  }

  if (!strncmp(string, "preserveSecondPartyAppDataToShelter", 0x24uLL))
  {
    v254 = (char *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"SourcePath"]);
    v255 = sub_10003AA3C();
    v256 = (os_log_s *)objc_claimAutoreleasedReturnValue(v255);
    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v364 = v254;
      _os_log_impl( (void *)&_mh_execute_header,  v256,  OS_LOG_TYPE_DEFAULT,  "Preserving second-party app data from %{public}@",  buf,  0xCu);
    }

    v257 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    v323 = 0LL;
    v258 = [v257 preserveSecondPartyAppDataToShelter:v254 withReturnErrorMsg:&v323];
    reply = (os_log_s *)v323;

    v259 = xpc_dictionary_create_reply(v5);
    v260 = v259;
    if (v259)
    {
      xpc_dictionary_set_BOOL(v259, "Result", v258);
      if (reply) {
        v261 = v258;
      }
      else {
        v261 = 1;
      }
      if ((v261 & 1) == 0) {
        xpc_dictionary_set_string( v260, "ErrorMsg", (const char *)-[os_log_s UTF8String](reply, "UTF8String"));
      }
      xpc_connection_send_message(connection, v260);
    }

    goto LABEL_63;
  }

  if (!strncmp(string, "ReloadDemodsPreferencesFile", 0x1CuLL))
  {
    v274 = os_variant_has_internal_content("com.apple.mobilestoredemod");
    v275 = v274;
    if (v274)
    {
      v276 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      [v276 reload];
    }

    else
    {
      v281 = sub_10003A95C();
      v276 = (void *)objc_claimAutoreleasedReturnValue(v281);
      if (os_log_type_enabled((os_log_t)v276, OS_LOG_TYPE_ERROR)) {
        sub_100098160((os_log_s *)v276, v282, v283, v284, v285, v286, v287, v288);
      }
    }

    reply = (os_log_s *)xpc_dictionary_create_reply(v5);
    xpc_dictionary_set_BOOL(reply, "Result", v275);
    xpc_connection_send_message(connection, reply);
    goto LABEL_63;
  }

  if (!strncmp(string, "queryFeatureFlag", 0x11uLL))
  {
    v277 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "FeatureFlag"));
    reply = (os_log_s *)objc_claimAutoreleasedReturnValue(v277);
    if (+[MSDHubFeatureFlags isSupportedFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "isSupportedFeatureFlag:",  reply))
    {
      v278 = +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  reply);
    }

    else
    {
      v289 = sub_10003AA3C();
      v290 = (os_log_s *)objc_claimAutoreleasedReturnValue(v289);
      if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG)) {
        sub_1000981D0();
      }

      v278 = 0;
    }

    v291 = xpc_dictionary_create_reply(v5);
    xpc_dictionary_set_BOOL(v291, "Result", v278);
    xpc_connection_send_message(connection, v291);

    goto LABEL_63;
  }

  __int128 v24 = sub_10003AA3C();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v364 = string;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unknown request: %{public}s", buf, 0xCu);
  }

  [v320 deleteOperationRequest];
LABEL_64:
  int v40 = xpc_dictionary_get_string(v5, "QueryDeviceInfo");
  uint64_t v41 = sub_10003AA3C();
  __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    sub_100097B14();
  }

  if (!v40) {
    goto LABEL_106;
  }
  reply = (os_log_s *)xpc_dictionary_create_reply(v5);
  if (!reply) {
    reply = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  if (!strncmp(v40, "MSDDemoManualUpdateState", 0x19uLL))
  {
    [v320 manualUpdateMode:buf allowChange:&value];
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateCurrentMode", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoManualUpdateAllowChange", value);
    xpc_connection_send_message(connection, reply);
    goto LABEL_105;
  }

  if (!strncmp(v40, "MSDDemoUpdateState", 0x13uLL))
  {
    [v316 getDemoUpdateInProgress:buf operationAllowed:&value];
    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateInProgress", buf[0]);
    xpc_dictionary_set_BOOL(reply, "MSDDemoUpdateAllowed", value);
    xpc_dictionary_set_BOOL(reply, "MSDDemoAlreadySetup", (BOOL)[v320 demoSetup]);
    xpc_connection_send_message(connection, reply);
    goto LABEL_105;
  }

  if (!strncmp(v40, "MSDDemoUpdateEnrolled", 0x16uLL))
  {
    if (v318 && (v49 = objc_opt_class(&OBJC_CLASS___NSString, v43), (objc_opt_isKindOfClass(v318, v49) & 1) != 0))
    {
      if (v317)
      {
        v51 = objc_opt_class(&OBJC_CLASS___NSString, v50);
        if ((objc_opt_isKindOfClass(v317, v51) & 1) != 0)
        {
          [v320 setHubHostName:v318];
          [v320 setHubPort:v317];
          xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
          v52 = [v316 enrolled];
          v53 = "MSDDemoUpdateEnrolled";
          goto LABEL_103;
        }
      }

      v176 = sub_10003AA3C();
      v175 = (os_log_s *)objc_claimAutoreleasedReturnValue(v176);
      if (!os_log_type_enabled(v175, OS_LOG_TYPE_ERROR)) {
        goto LABEL_228;
      }
    }

    else
    {
      v174 = sub_10003AA3C();
      v175 = (os_log_s *)objc_claimAutoreleasedReturnValue(v174);
      if (!os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
      {
LABEL_228:

        goto LABEL_229;
      }
    }

    sub_100097AA8();
    goto LABEL_228;
  }

  if (strncmp(v40, "MSDDemoDeviceManaged", 0x15uLL))
  {
    if (strncmp(v40, "MSDDemoDeviceFrozen", 0x14uLL))
    {
      if (!strncmp(v40, "MSDDemoDeviceInstallState", 0x1AuLL))
      {
        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_int64(reply, "MSDDemoDeviceInstallState", [v320 mode]);
      }

      else
      {
        if (strncmp(v40, "MSDTypeOfDemoDevice", 0x14uLL))
        {
          if (!strncmp(v40, "MSDFriendlyDeviceName", 0x16uLL))
          {
            v83 = (void *)objc_claimAutoreleasedReturnValue([v320 hubSuppliedSettings]);
            v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:@"DeviceName"]);

            if (v84)
            {
              xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
              xpc_dictionary_set_string( reply, "MSDFriendlyDeviceName", (const char *)[v84 UTF8String]);
            }

            else
            {
              xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 0);
            }

            xpc_connection_send_message(connection, reply);
          }

          else
          {
            uint8_t v44 = sub_10003AA3C();
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Unknown query", buf, 2u);
            }
          }

          goto LABEL_105;
        }

        xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
        xpc_dictionary_set_uint64(reply, "MSDTypeOfDemoDevice", (uint64_t)[v320 typeOfDemoDevice]);
      }

      goto LABEL_104;
    }

    xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
    v52 = [v320 isContentFrozen];
    v53 = "MSDDemoDeviceFrozen";
LABEL_103:
    xpc_dictionary_set_BOOL(reply, v53, v52);
LABEL_104:
    xpc_connection_send_message(connection, reply);
    goto LABEL_105;
  }

  v56 = [v320 typeOfDemoDevice];
  xpc_dictionary_set_BOOL(reply, "QueryDeviceInfoResult", 1);
  xpc_dictionary_set_BOOL(reply, "MSDDemoDeviceManaged", v56 == (id)6);
  xpc_connection_send_message(connection, reply);
LABEL_105:

LABEL_106:
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance", v311));
  if ([v63 macOS])
  {
  }

  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    v65 = [v64 iOS];

    if (!v65) {
      goto LABEL_127;
    }
  }

  v66 = xpc_dictionary_get_string(v5, "PricingMessage");
  v67 = sub_10003AA3C();
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    sub_100097A48();
  }

  if (v66)
  {
    -[MSDLocalMessageResponder setConnectionForPricing:](self, "setConnectionForPricing:", connection);
    if (!strcmp(v66, "PricingMessageRequestUpdate"))
    {
      v71 = sub_10003AA3C();
      v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "XPC - PricingRequestUpdate", buf, 2u);
      }

      [v313 receivedUpdateRequest:connection fromRequest:v5];
    }

    else if (!strcmp(v66, "PricingMessageUpdateComplete"))
    {
      v73 = sub_10003AA3C();
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "XPC - PricingUpdateComplete", buf, 2u);
      }

      [v313 receivedCompletionNotice:connection fromRequest:v5];
    }

    else if (!strcmp(v66, "PricingMessageHeartBeat"))
    {
      v75 = sub_10003AA3C();
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "XPC - PricingMessageHeartBeat", buf, 2u);
      }

      [v313 receivedHeartBeat:connection fromRequest:v5];
    }

    else
    {
      v69 = sub_10003AA3C();
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Unknow message from Pricing.", buf, 2u);
      }

      [v313 receivedOtherMessages:connection fromRequest:v5];
    }
  }

LABEL_127:
  _Block_object_dispose(&v354, 8);
  _Block_object_dispose(&v357, 8);
}

void sub_100043B5C(_Unwind_Exception *a1)
{
}

uint64_t sub_100043D70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100043D80(uint64_t a1)
{
}

void sub_100043D88(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  [v2 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8LL);
  id obj = *(id *)(v8 + 40);
  unsigned __int8 v9 = [v3 enrollForDeviceName:v4 pairingCredential:v5 hubHostName:v6 hubPort:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = v9;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)
    || ([*(id *)(a1 + 72) setDemoEnrollmentFlag:@"enrollmentSuccess"],
        !*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)))
  {
    [*(id *)(a1 + 72) setDemoEnrollmentFlag:@"enrollmentFailed"];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v10 stopFullScreenUI:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }

void sub_100043E80(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  [v2 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
  id v4 = [v3 setCompletionTime:*(unsigned int *)(a1 + 48) reserveTimeForCleanup:1];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updateDemoContent];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v5 = sub_10003A95C();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device is busy?", v7, 2u);
    }
  }

void sub_100043F60(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  if ([*(id *)(a1 + 40) isContentFrozen])
  {
    [*(id *)(a1 + 40) manageDeviceSnapshot:@"CommitSnapshot"];
  }

  else
  {
    id v3 = sub_10003A95C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Snapshot commit not allowed in current state.",  v5,  2u);
    }
  }

  xpc_dictionary_set_BOOL(reply, "Acknowledged", 1);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
}

id sub_100044034(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getDemoEnrollmentFlag]);

  if ([*(id *)(a1 + 32) isVerifiedDemoDevice])
  {
    if (!v2)
    {
      [*(id *)(a1 + 32) setupDemoDeviceMetadataFolder];
      [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentStarted"];
    }
  }

  else if ([*(id *)(a1 + 32) isVerifiedPOSDevice])
  {
    [*(id *)(a1 + 32) setupDemoDeviceMetadataFolder];
    [*(id *)(a1 + 32) setPOSDeviceFlag];
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
  if (![*(id *)(a1 + 32) isVerifiedDemoDevice])
  {
    id v10 = sub_10003AA3C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "This device is not a demo device.", buf, 2u);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v12 startFullScreenUIWith:@"NOT_VERIFIED" allowCancel:1];
    goto LABEL_15;
  }

  if (v2)
  {
    id v26 = sub_10003AA3C();
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      os_signpost_id_t v32 = "DemoPrepare";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Skipping %s request because it already ran once",  buf,  0xCu);
    }

    goto LABEL_15;
  }

  [*(id *)(a1 + 32) setDemoDeviceFlag];
  [*(id *)(a1 + 32) registerCAHearbeatActivity];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v5 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "SSID");
    if (string)
    {
      uint64_t v7 = string;
      uint64_t v8 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "Password");
      if (v8) {
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
      }
      else {
        unsigned __int8 v9 = 0LL;
      }
      id v14 = sub_10003AA3C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        os_signpost_id_t v32 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting up WiFi: ssid = %{public}s",  buf,  0xCu);
      }

      for (unint64_t i = 4LL; i > 1; --i)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v17 configureWiFi:v18 password:v9];

        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
          goto LABEL_24;
        }
        sleep(5u);
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
      {
LABEL_24:
        [*(id *)(a1 + 32) waitForNetworkReachability];

        goto LABEL_25;
      }

      uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741072LL,  @"Failed to configure WiFi."));
      uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8LL);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;
    }

    else
    {
LABEL_25:
      int v19 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "PreferredStoreID");
      if (v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
        [*(id *)(a1 + 32) setPreferredStoreID:v20];
      }

      id v21 = sub_10003AA3C();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        os_signpost_id_t v32 = "-[MSDLocalMessageResponder handleMessage:from:]_block_invoke";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: requesting discoverAndEnrollWithHub.",  buf,  0xCu);
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](&OBJC_CLASS___MSDFindMyHub, "sharedInstance"));
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8LL);
      id obj = *(id *)(v24 + 40);
      unsigned __int8 v25 = [v23 discoverAndEnrollWithHub:&obj];
      objc_storeStrong((id *)(v24 + 40), obj);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v25;

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
        [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentSuccess"];
      }
    }

    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
    {
      [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentFailed"];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
      [v12 stopFullScreenUI:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
LABEL_15:
    }
  }

  return [*(id *)(a1 + 64) setDemoPrepareInProgress:0];
}

uint64_t sub_1000444FC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100044504(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[MSDOSUpdaterController sharedInstance](&OBJC_CLASS___MSDOSUpdaterController, "sharedInstance"));
  [v1 startOSUpdate];
}

uint64_t sub_100044544(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_string) {
    goto LABEL_14;
  }
  string_ptr = xpc_string_get_string_ptr(v4);
  if (!strncmp(string_ptr, "CurrentWiFiSSID", 0x10uLL))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 getCurrentWiFiSsid]);
  }

  else
  {
    if (strncmp(string_ptr, "PersistentWiFiSSID", 0x13uLL))
    {
      if (!strncmp(string_ptr, "EmbeddedSIMInstalled", 0x15uLL))
      {
        xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), string_ptr, 0);
      }

      else if (!strncmp(string_ptr, "ActiveNetworkInterface", 0x17uLL))
      {
        xpc_dictionary_set_uint64( *(xpc_object_t *)(a1 + 32),  string_ptr,  (uint64_t)[*(id *)(a1 + 40) fetchActiveNetworkInterface]);
      }

      else
      {
        id v6 = sub_10003A95C();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136446210;
          id v13 = string_ptr;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received unrecognized key for network info: %{public}s",  (uint8_t *)&v12,  0xCu);
        }
      }

      goto LABEL_14;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 getPersistentWiFiSsid]);
  }

  id v10 = (void *)v9;

  if (v10) {
    xpc_dictionary_set_string( *(xpc_object_t *)(a1 + 32), string_ptr, (const char *)[v10 UTF8String]);
  }

LABEL_14:
  return 1LL;
}

void sub_100044A5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = sub_10003AA3C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000979F0();
  }

  id v7 = sub_10003AA3C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v9) {
      sub_1000982B4();
    }

    if (v3 == &_xpc_error_connection_invalid)
    {
      id v14 = sub_10003AA3C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "XPC disconnected by client", buf, 2u);
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLocalMessageResponder sharedInstance]( &OBJC_CLASS___MSDLocalMessageResponder,  "sharedInstance"));
      [v12 lostClientConnection:*(void *)(a1 + 32)];
    }

    else
    {
      if (v3 != &_xpc_error_termination_imminent) {
        goto LABEL_10;
      }
      id v13 = sub_10003AA3C();
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "XPC connection will be closed",  v16,  2u);
      }
    }
  }

  else
  {
    if (v9) {
      sub_100098334();
    }

    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_10009830C();
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLocalMessageResponder sharedInstance](&OBJC_CLASS___MSDLocalMessageResponder, "sharedInstance"));
    [v10 handleMessage:v3 from:*(void *)(a1 + 32)];

    id v11 = sub_10003AA3C();
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000982E0();
    }
  }

LABEL_10:
}

void sub_100044C40( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100044C64()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLocalMessageResponder sharedInstance](&OBJC_CLASS___MSDLocalMessageResponder, "sharedInstance"));
  [v0 start];

  id v1 = +[MSDTestInterface sharedInstance](&OBJC_CLASS___MSDTestInterface, "sharedInstance");
  return 0LL;
}

uint64_t sub_100044CB0()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLocalEventStreamHandler sharedInstance]( &OBJC_CLASS___MSDLocalEventStreamHandler,  "sharedInstance"));
  [v0 start];

  return 0LL;
}

uint64_t sub_100044CE8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
  [v0 start];

  return 0LL;
}

uint64_t start(uint64_t a1, void **a2)
{
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2020000000LL;
  int v60 = 0;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = sub_1000452FC;
  v55 = sub_10004530C;
  id v56 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  uint64_t v39 = objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  id v5 = objc_alloc_init(&OBJC_CLASS___MSDLegacyMigrationHelper);
  unsigned int v6 = [v3 isVerifiedDemoDevice];
  unsigned int v7 = [v3 isOfflineMode];
  unsigned __int8 v8 = [v3 dcotaOfflineModeDevice];
  unsigned int v9 = [v3 isVerifiedPOSDevice];
  [v3 isBetterTogetherDemo];
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *a2;
    *(_DWORD *)buf = 136446210;
    v62 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s started", buf, 0xCu);
  }

  id v13 = sub_10003A95C();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper osVersionStr](v5, "osVersionStr"));
    *(_DWORD *)buf = 138543362;
    v62 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "OS version: %{public}@", buf, 0xCu);
  }

  id v16 = sub_10003A95C();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 demodVersion]);
    *(_DWORD *)buf = 138543362;
    v62 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "demod version: %{public}@", buf, 0xCu);
  }

  id v19 = sub_10003A95C();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 packageVersion]);
    *(_DWORD *)buf = 138543362;
    v62 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Package version: %{public}@", buf, 0xCu);
  }

  if (-[MSDLegacyMigrationHelper doPreSkyMigration](v5, "doPreSkyMigration")) {
    [v3 clearUpNvramIfNeeded];
  }
  if ((v6 | v9) == 1)
  {
    [v3 setupWorkFolderForBootTask];
    if (-[MSDLegacyMigrationHelper doPreSkyMigration](v5, "doPreSkyMigration"))
    {
      [v3 migrateDemoDeviceToDemoVolume];
      [v3 clearUpF200FootprintIfNeeded];
    }

    objc_msgSend(v3, "createMobileStoreDemoCache", v39);
  }

  else if (v7)
  {
    [v3 setupFactoryDemoDeviceMetadataFolder];
  }

  unsigned int v22 = objc_msgSend(v3, "mode", v39);
  *((_DWORD *)v58 + 6) = v22;
  if (v22 - 1 <= 8)
  {
    uint64_t v23 = os_transaction_create("Booted as a demo device");
    uint64_t v24 = (void *)v52[5];
    v52[5] = v23;
  }

  if (v6)
  {
    if (-[MSDLegacyMigrationHelper doPreSkyMigration](v5, "doPreSkyMigration")) {
      +[MSDBundleProgressTracker migratePreferencesFromLegacyDevicesIfNeeded]( &OBJC_CLASS___MSDBundleProgressTracker,  "migratePreferencesFromLegacyDevicesIfNeeded");
    }
    if (-[MSDLegacyMigrationHelper doPreSydneyMigration](v5, "doPreSydneyMigration"))
    {
      [v3 cleanUpPreferencesFile];
      if (([v3 migrateCellularSupportFlag] & 1) == 0)
      {
        id v25 = sub_10003A95C();
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100098360(v26);
        }
      }
    }

    [v40 loadBundles];
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);
  BOOL v29 = v28 != 0LL;

  if (v29)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
    [v30 createSecretKeyIfNeeded];
  }

  if (v6) {
    -[MSDLegacyMigrationHelper saveOSVerionAfterMigration](v5, "saveOSVerionAfterMigration");
  }
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
  os_signpost_id_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 demoUpdateQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045314;
  block[3] = &unk_1000F9F98;
  id v33 = v3;
  id v42 = v33;
  uint8_t v44 = &v57;
  BOOL v46 = v29;
  char v47 = v9;
  id v34 = v4;
  char v48 = v6;
  char v49 = v7;
  unsigned __int8 v50 = v8;
  id v43 = v34;
  v45 = &v51;
  dispatch_async(v32, block);

  id v35 = sub_10003A95C();
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Starting the xpc and mail services as soon as device boot up.",  buf,  2u);
  }

  sub_100044CE8();
  sub_100044C64();
  sub_100044CB0();
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v37 run];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
  return 0LL;
}

void sub_100045288( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000452FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004530C(uint64_t a1)
{
}

void sub_100045314(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) allowSnapshotMode];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
  id v5 = sub_10003A95C();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v98 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DeviceMode = %d. Checking startup tasks...",  buf,  8u);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
    [v8 restoreDeviceLanguageAndRegionIfNeeded];

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBluetoothHelper sharedInstance](&OBJC_CLASS___MSDBluetoothHelper, "sharedInstance"));
    [v9 restoreBTPairingRecordIfNeeded];

    [*(id *)(a1 + 32) configureNetworkInterface];
    [*(id *)(a1 + 32) waitForNetworkReachability];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDS3UploadHandler sharedInstance](&OBJC_CLASS___MSDS3UploadHandler, "sharedInstance"));
    [v10 uploadDemoLogsIfNeeded];

    [*(id *)(a1 + 32) registerCAHearbeatActivity];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance", v4));
  [v3 registerDemoUpdateStatusDelegate:v11];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  [v3 registerDemoUpdateStatusDelegate:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getSavedRequest]);
  unsigned int v14 = [*(id *)(a1 + 32) getSavedFlag];
  int v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v15 == 4)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    [v16 updateStage:201];

    int v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }

  BOOL v17 = v15 == 2 || v15 == 4;
  if (!v17
    && (v15 != 7
     || (unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOSUpdaterController sharedInstance]( MSDOSUpdaterController,  "sharedInstance")),  v23 = [v22 isOSUpdateInProgress],  v22,  (v23 & 1) != 0))
    || (id v18 = [*(id *)(a1 + 32) getSavedCompleteByInterval],
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDemoUpdateTimeKeeper sharedInstance]( MSDDemoUpdateTimeKeeper,  "sharedInstance")),  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 setCompletionTime:v18 reserveTimeForCleanup:1]),  v19,  !v20))
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
      || (int v24 = *(unsigned __int8 *)(a1 + 65), *(_BYTE *)(a1 + 65)))
    {
      [*(id *)(a1 + 32) holdPowerAssertion];
      int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    }

    if (v24 == 5) {
      unsigned int v25 = 0;
    }
    else {
      unsigned int v25 = v2;
    }
    if (v25 == 1) {
      [*(id *)(a1 + 32) manageDeviceSnapshot:@"DeleteSnapshot"];
    }
    if ([*(id *)(a1 + 32) snapshotRevertFlagged])
    {
      [*(id *)(a1 + 32) resetSystemTimeCache];
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](&OBJC_CLASS___MSDAccountManager, "sharedInstance"));
      [v26 forceiCloudKeychainToSyncWithServer];

      [*(id *)(a1 + 32) saveSnapshotRevertFlagged:0];
    }

    if (([*(id *)(a1 + 32) isPressDemoDevice] & 1) == 0) {
      [*(id *)(a1 + 32) syncStoreDemoMode:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    }
    switch(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      case 0:
        id v33 = sub_10003A95C();
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = *(unsigned __int8 *)(a1 + 66);
          int v36 = *(unsigned __int8 *)(a1 + 67);
          int v37 = *(unsigned __int8 *)(a1 + 68);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v98 = v35;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = v36;
          __int16 v99 = 1024;
          int v100 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Device is DCOTA device: %{BOOL}d; is Offline Mode Device: %{BOOL}d; is DCOTA Offline Mode Device:%{BOOL}d",
            buf,
            0x14u);
        }

        uint64_t v31 = v94;
        if (!*(_BYTE *)(a1 + 66) && !*(_BYTE *)(a1 + 68) || *(_BYTE *)(a1 + 64)) {
          goto LABEL_88;
        }
        int v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getDemoEnrollmentFlag]);

        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getDemoEnrollmentFlag]);
        unsigned int v40 = [v39 isEqualToString:@"enrollmentSuccess"];

        id v41 = sub_10003A95C();
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v98 = v38 != 0LL;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Device did attempt enrollment:  %{BOOL}d; success: %{BOOL}d",
            buf,
            0xEu);
        }

        char v43 = v38 ? v40 : 1;
        if ((v43 & 1) != 0) {
          goto LABEL_88;
        }
        uint64_t v44 = os_transaction_create("Retry enrolling");
        uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8LL);
        BOOL v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = v44;

        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFindMyHub sharedInstance](&OBJC_CLASS___MSDFindMyHub, "sharedInstance"));
        [v30 handleEnrollmentRetryUponFirstLaunch];
        goto LABEL_87;
      case 1:
        if ([*(id *)(a1 + 32) waitingForCommand])
        {
          char v47 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
          [v47 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

          [*(id *)(a1 + 32) startWaitingForCommandTimer];
          char v48 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
          [v48 setWaitingForCommand:1];
          goto LABEL_49;
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
        [v64 updateStage:100];

        if (v13) {
          [v3 demoUpdateCompleted:v13];
        }
        [*(id *)(a1 + 32) deleteOperationRequest];
        goto LABEL_71;
      case 2:
        char v49 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
        [v49 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

        if ((v14 & 4) != 0)
        {
          if (([*(id *)(a1 + 32) switchModeImmediately:4] & 1) == 0)
          {
            id v65 = sub_10003A95C();
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v65);
            uint64_t v31 = v94;
            if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
              sub_100098408((os_log_s *)v30, v66, v67, v68, v69, v70, v71, v72);
            }
            goto LABEL_87;
          }
        }

        else
        {
          if ((v14 & 8) != 0)
          {
            id v77 = sub_10003A95C();
            v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v98 = 5;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = 2;
              _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Switch to mode %d from mode %d to complete snapshot revert.",  buf,  0xEu);
            }

            uint64_t v31 = v94;
            id v79 = sub_10003A95C();
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
              sub_10009839C((os_log_s *)v30, v80, v81, v82, v83, v84, v85, v86);
            }
            goto LABEL_87;
          }

          [*(id *)(a1 + 32) deleteConfigurationApp];
          if ([*(id *)(a1 + 32) backgroundDownloadState] == (id)1
            || [*(id *)(a1 + 32) backgroundDownloadState] == (id)2)
          {
            [*(id *)(a1 + 32) setBackgroundDownloadState:4];
            [*(id *)(a1 + 32) setBackgroundDownloadActive:0];
          }

          unsigned __int8 v50 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
          if ([v50 macOS])
          {
            unsigned int v51 = 1;
          }

          else
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
            unsigned int v51 = [v87 iOS];
          }

          if (v51 && v14 == 2)
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
            [v88 updateStage:17];

            char v48 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
            [v48 setSwitchModeAfterCompletion:1];
LABEL_49:

            goto LABEL_71;
          }

          if ((v14 & 1) != 0)
          {
            uint64_t v31 = v94;
            id v89 = sub_10003A95C();
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v89);
            if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              os_signpost_id_t v32 = "Device is busy?";
LABEL_34:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
            }

LABEL_87:
LABEL_88:
            id v20 = 0LL;
            goto LABEL_89;
          }
        }

LABEL_71:
        id v20 = 0LL;
        goto LABEL_72;
      case 3:
        id v90 = sub_10003A95C();
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "kMSDModePreRebootDataStaged is obsoleted in Azul so we should NOT reach here!",  buf,  2u);
        }

        id v92 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"kMSDModePreRebootDataStaged is obsoleted in Azul",  0LL));
        objc_exception_throw(v92);
        sub_100045EEC(v93);
        return;
      case 4:
        if ((v14 & 4) != 0)
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
          [v73 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1 disableIdleTimer:1];

          uint64_t v31 = v94;
        }

        else
        {
          uint64_t v31 = v94;
          if ([v94 migrateDataWithBlockingUI:4 startMigration:1])
          {
            [*(id *)(a1 + 32) configureNetworkInterface];
            [*(id *)(a1 + 32) waitForNetworkReachability];
            [*(id *)(a1 + 40) clearStagedDeviceAfterUpdateProcess];
            v52 = (void *)objc_claimAutoreleasedReturnValue( +[MSDContentCacheManager sharedInstance]( &OBJC_CLASS___MSDContentCacheManager,  "sharedInstance"));
            [v52 clearCache];

            [*(id *)(a1 + 32) cleanUpBackgroundState:1];
            [v94 setTVSpecificSettings];
            [v94 setAutomatedDeviceGroupStoreID];
            if ([v94 continueToUpdateDemoContent])
            {
              uint64_t v53 = *(void **)(a1 + 32);
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472LL;
              v95[2] = sub_100045EEC;
              v95[3] = &unk_1000F9F48;
              id v96 = v53;
              [v96 waitForBuddy:v95];
            }
          }
        }

        goto LABEL_88;
      case 5:
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
        [v54 updateStage:100];

        if (v13) {
          [v3 demoUpdateCompleted:v13];
        }
        [*(id *)(a1 + 32) deleteOperationRequestAndQuitHelper];
        [*(id *)(a1 + 32) setupCoreAnalyticsLogsUploadTimer];
        [*(id *)(a1 + 32) setupStoreHoursManager];
        [*(id *)(a1 + 32) setupSnapshotRevertTimer];
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDeviceDataCollector sharedInstance](&OBJC_CLASS___MSDDeviceDataCollector, "sharedInstance"));
        [v55 setupCollectAppUsageDataTimer];

        id v56 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](&OBJC_CLASS___MSDAccountManager, "sharedInstance"));
        [v56 setupTrustedPeerChangeNotificationObserver];

        unsigned int v57 = [*(id *)(a1 + 32) backgroundDownloadActive];
        id v58 = sub_10003A95C();
        uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
        if (v57)
        {
          uint64_t v31 = v94;
          if (v60)
          {
            id v61 = [*(id *)(a1 + 32) backgroundDownloadState];
            *(_DWORD *)buf = 134217984;
            *(void *)v98 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Background download enabled and its status is:%lu",  buf,  0xCu);
          }

          id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBackgroundDownload sharedInstance](&OBJC_CLASS___MSDBackgroundDownload, "sharedInstance"));
          [v30 kickOffBackgroundDownload];
          goto LABEL_87;
        }

        uint64_t v31 = v94;
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Background download not enabled.",  buf,  2u);
        }

        goto LABEL_88;
      case 6:
      case 8:
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
        [v27 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == 6) {
          uint64_t v28 = 0LL;
        }
        else {
          uint64_t v28 = 9LL;
        }
        [*(id *)(a1 + 32) switchModeImmediately:v28];
        goto LABEL_71;
      case 7:
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 backgroundBundle]);
        if ([v63 bundleState] == 1)
        {

          uint64_t v31 = v94;
        }

        else
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
          v75 = (void *)objc_claimAutoreleasedReturnValue([v74 backgroundBundle]);
          unsigned int v76 = [v75 bundleState];

          uint64_t v31 = v94;
          if (v76 != 2) {
            goto LABEL_86;
          }
        }

        [*(id *)(a1 + 32) setBackgroundDownloadState:4];
        [*(id *)(a1 + 32) setBackgroundDownloadActive:0];
LABEL_86:
        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOSUpdaterController sharedInstance](&OBJC_CLASS___MSDOSUpdaterController, "sharedInstance"));
        [v30 startOSUpdate];
        goto LABEL_87;
      default:
        id v29 = sub_10003A95C();
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        uint64_t v31 = v94;
        if (!os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_87;
        }
        *(_WORD *)buf = 0;
        os_signpost_id_t v32 = "Unknown demo install state";
        goto LABEL_34;
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
  [v21 demoUpdateFailed:v20];

  if ([v20 code] == (id)3727741184) {
    [*(id *)(a1 + 32) forceSwitchToDemoModeIfNeeded];
  }
LABEL_72:
  uint64_t v31 = v94;
LABEL_89:
}

    v62 = 0LL;
    goto LABEL_53;
  }

  v89[0] = @"/var/MSDWorkContainer/.MSD_cache_manifest";
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v37 fileName]);
  v89[1] = v45;
  BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 2LL));
  char v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v46));

  char v48 = sub_10003A95C();
  char v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v92 = v47;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Loading manifest file from path %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v50 = (id)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactory createSignedManifestFromManifestFile:]( &OBJC_CLASS___MSDSignedManifestFactory,  "createSignedManifestFromManifestFile:",  v47));
  unsigned int v51 = sub_10003A95C();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  uint64_t v53 = v52;
  if (!v50)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_100098AF4();
    }

    uint64_t v82 = 0LL;
    sub_100087610(&v82, 3727740942LL, (uint64_t)@"Failed to load cached manifest file");
    unsigned int v57 = v82;
    unsigned __int8 v50 = 0LL;
    goto LABEL_66;
  }

  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v92 = v47;
    uint64_t v93 = 2114;
    v94 = v78;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Copying manifest file from %{public}@ to %{public}@",  buf,  0x16u);
  }

  if (([v75 fileExistsAtPath:v77] & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v73, "helperAgent"));
    v55 = [v54 prepareWorkDirectory:v77 writableByNonRoot:1];

    if ((v55 & 1) == 0)
    {
      uint64_t v68 = sub_10003A95C();
      uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_100098C40();
      }

      unsigned int v57 = 0LL;
      goto LABEL_66;
    }
  }

  if ([v75 fileExistsAtPath:v78])
  {
    uint64_t v81 = 0LL;
    id v56 = [v75 removeItemAtPath:v78 error:&v81];
    unsigned int v57 = v81;
    if ((v56 & 1) == 0)
    {
      id v58 = sub_10003A95C();
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100098BB4();
      }

      goto LABEL_66;
    }
  }

  else
  {
    unsigned int v57 = 0LL;
  }

  BOOL v60 = v57;
  uint64_t v80 = v57;
  id v61 = [v75 copyItemAtPath:v47 toPath:v78 error:&v80];
  unsigned int v57 = v80;

  if ((v61 & 1) == 0)
  {
    uint64_t v66 = sub_10003A95C();
    uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_100098B54();
    }

    int v7 = v78;
    goto LABEL_66;
  }

  unsigned __int8 v50 = v50;
  v62 = v50;
  int v7 = v78;
LABEL_53:

  return v62;
}

id sub_100045EEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) switchModeImmediately:5];
}

void sub_100045F58(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoUpdateController);
  unsigned int v2 = (void *)qword_100125408;
  qword_100125408 = (uint64_t)v1;
}

void sub_100046718(_Unwind_Exception *a1)
{
}

void sub_100046F9C(_Unwind_Exception *a1)
{
}

void sub_100047798(_Unwind_Exception *a1)
{
}

void sub_100047A5C(_Unwind_Exception *a1)
{
}

void sub_100047C34(_Unwind_Exception *a1)
{
}

void sub_100047E2C(_Unwind_Exception *a1)
{
}

LABEL_25:
    int v15 = 0LL;
LABEL_26:

    id v19 = v9;
    goto LABEL_27;
  }

  id v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@",  v9,  v5,  v7));

  +[OSASystemConfiguration setAutomatedDeviceGroup:]( &OBJC_CLASS___OSASystemConfiguration,  "setAutomatedDeviceGroup:",  v19);
  id v20 = sub_10003A95C();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Set new AutomatedDeviceGroup %@", buf, 0xCu);
  }

  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration automatedDeviceGroup]( &OBJC_CLASS___OSASystemConfiguration,  "automatedDeviceGroup"));
  int v15 = v22;
  if (!v22 || ([v22 isEqualToString:v19] & 1) == 0)
  {
    unsigned __int8 v23 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100098738();
    }
    unsigned int v9 = v19;
    goto LABEL_26;
  }

  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  os_signpost_id_t v32 = sub_10003A95C();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (!v34) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v69 = (MSDGetAccountSettingsRequest *)v15;
    int v35 = "Got account settings from hub: %{public}@";
    int v36 = v33;
    int v37 = 12;
  }

  else
  {
    if (!v34) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    int v35 = "Got account settings from hub";
    int v36 = v33;
    int v37 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_31:

  id v26 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v15, "objectForKey:", @"iCloud"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v15, "objectForKey:", @"iTunes"));
  int v38 = sub_10003A95C();
  uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  unsigned int v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
  if (v26 | v27)
  {
    uint64_t v59 = v5;
    BOOL v60 = a3;
    if (v40)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Signing out existing iCloud account.",  buf,  2u);
    }

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v26 objectForKey:@"PwdForExistingAccount"]);
    uint64_t v66 = v16;
    id v41 = -[MSDAccountManager _signOutiCloudAccountWithPassword:outError:]( self,  "_signOutiCloudAccountWithPassword:outError:",  v25,  &v66);
    id v29 = v66;

    if (!v41) {
      goto LABEL_61;
    }
    id v42 = sub_10003A95C();
    char v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Signing out existing iTunes account.",  buf,  2u);
    }

    id v65 = v29;
    uint64_t v44 = -[MSDAccountManager _signOutiTunesAccount:](self, "_signOutiTunesAccount:", &v65);
    uint64_t v16 = v65;

    if (v44)
    {
      uint64_t v45 = sub_10003A95C();
      BOOL v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Wait for some extra time to make sure accounts complete signout.",  buf,  2u);
      }

      sleep(0xAu);
      if (v26)
      {
        v64 = v16;
        char v47 = -[MSDAccountManager _setupiCloudAccountWithSettings:outError:]( self,  "_setupiCloudAccountWithSettings:outError:",  v26,  &v64);
        id v29 = v64;

        if (!v47) {
          goto LABEL_61;
        }
        uint64_t v16 = v29;
      }

      if (!v27)
      {
LABEL_46:
        char v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
        v62 = v16;
        uint64_t v28 = [v49 createTvUserProfileWithError:&v62];
        id v29 = v62;

        goto LABEL_47;
      }

      v63 = v16;
      char v48 = -[MSDAccountManager _setupiTunesAccountWithSettings:outError:]( self,  "_setupiTunesAccountWithSettings:outError:",  v27,  &v63);
      id v29 = v63;

      if (v48)
      {
        uint64_t v16 = v29;
        goto LABEL_46;
      }

              if (v14 == (id)++v16)
              {
                unsigned int v14 = [v12 countByEnumeratingWithState:&v31 objects:v47 count:16];
                if (!v14)
                {
LABEL_27:

                  int v7 = v26;
                  unsigned int v6 = v28;
                  unsigned __int8 v8 = v30;
                  goto LABEL_28;
                }

                continue;
              }

              goto LABEL_14;
            }
          }

          id v11 = [v9 isLeaf];

          if ((v11 & 1) != 0) {
            goto LABEL_11;
          }
        }

    -[MSDFindMyHub tryScheduleDefaultEnrollmentRetry](self, "tryScheduleDefaultEnrollmentRetry");
LABEL_26:
    v54 = sub_10003A95C();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10009AD14();
    }
    unsigned int v25 = 0LL;
    unsigned int v40 = 0LL;
    id v30 = 0LL;
    id v33 = 0LL;
    goto LABEL_29;
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  [v28 saveFindMyHubRetryAtTime:0];

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"URL"]);
  if (!v30 || (uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString, v29), (objc_opt_isKindOfClass(v30, v31) & 1) == 0))
  {
    uint64_t v68 = sub_10003A95C();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10009AD40(v55, v69, v70, v71, v72, v73, v74, v75);
    }
    unsigned int v40 = 0LL;
    id v33 = 0LL;
    goto LABEL_45;
  }

  os_signpost_id_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v30));
  id v33 = v32;
  if (!v32 || (id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 host]), v34, !v34))
  {
    v64 = sub_10003A95C();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10009ADB0((uint64_t)v30, v55);
    }
    unsigned int v40 = 0LL;
    goto LABEL_45;
  }

  int v35 = (void *)objc_claimAutoreleasedReturnValue([v33 host]);
  -[MSDFindMyHub setHubHostName:](self, "setHubHostName:", v35);

  int v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));
  int v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v36));
  -[MSDFindMyHub setServerList:](self, "setServerList:", v37);

  int v38 = (void *)objc_claimAutoreleasedReturnValue([v33 port]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 stringValue]);
  -[MSDFindMyHub setHubPort:](self, "setHubPort:", v39);

  unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"device_info"]);
  id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubHostName](self, "hubHostName"));

  if (!v41)
  {
    unsigned int v76 = sub_10003A95C();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10009AE34();
    }
LABEL_45:
    unsigned int v22 = 0LL;
LABEL_29:

    if (a3)
    {
      id v77 = v22;
      sub_100087694(&v77, 3727744512LL, @"Cannot enroll the device with DemoUnit.");
      id v56 = v77;

      unsigned int v22 = v56;
      *a3 = v22;
    }

    unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    [v57 sendFMHFailureEvent:v22];
    uint64_t v45 = 0;
    goto LABEL_32;
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub hubPort](self, "hubPort"));

  if (!v42) {
    -[MSDFindMyHub setHubPort:](self, "setHubPort:", @"443");
  }
  if (v40)
  {
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNull, v43);
    if ((objc_opt_isKindOfClass(v40, v44) & 1) == 0)
    {
      unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
      [v57 saveDeviceInfo:v40];
      unsigned int v22 = 0LL;
      uint64_t v45 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }

  unsigned int v22 = 0LL;
  uint64_t v45 = 1;
LABEL_33:

  return v45;
}

      break;
    }

    if (v30[3] >= (unint64_t)v8)
    {
      int v24 = sub_10003A95C();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v34 = v15;
        int v35 = 2114;
        int v36 = v5;
        id v21 = "Waited %lu seconds for system apps to install. Now moving forward. Still missing the following apps - %{public}@";
        unsigned int v22 = v20;
        unsigned __int8 v23 = 22;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }

      goto LABEL_25;
    }

    sleep(v12);
    v30[3] += v12;
    BOOL v17 = sub_10003A95C();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v25;
      id v34 = (unint64_t)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Still waiting for system apps %{public}@",  buf,  0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
}

void sub_10004AB90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Log upload completed. Error: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
  if (v6)
  {
    int v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completion]);
    unsigned __int8 v8 = -[MSDServerResponse initWithError:](objc_alloc(&OBJC_CLASS___MSDServerResponse), "initWithError:", v3);
    ((void (**)(void, MSDServerResponse *))v7)[2](v7, v8);
  }
}

void sub_10004ACDC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoUpdateTimeKeeper);
  unsigned int v2 = (void *)qword_100125418;
  qword_100125418 = (uint64_t)v1;
}

id sub_10004AFEC(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "The previous completion timer will be invalidated.",  v6,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
  [v4 invalidate];

  return [*(id *)(a1 + 32) setTimer:0];
}

void sub_10004B078(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) date]);
  [v3 timeIntervalSinceNow];
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "forceSwitchToDemoMode:",  0LL,  0LL));
  [*(id *)(a1 + 32) setTimer:v2];
}

id sub_10004B1C0(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidate fatal error timer.", v6, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timerForFatalError]);
  [v4 invalidate];

  return [*(id *)(a1 + 32) setTimerForFatalError:0];
}

void sub_10004B24C(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Setting up fatal error timer to trigger %d seconds later.",  (uint8_t *)v6,  8u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "forceSwitchToDemoMode:",  0LL,  0LL,  (double)*(int *)(a1 + 40)));
  [*(id *)(a1 + 32) setTimerForFatalError:v5];
}

void sub_10004BC84(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDOSUpdaterController);
  id v2 = (void *)qword_100125428;
  qword_100125428 = (uint64_t)v1;
}

id sub_10004C468(uint64_t a1)
{
  return [*(id *)(a1 + 32) switchModeImmediately:5];
}

void sub_10004C474(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)5)
    {
      id v8 = sub_10003A95C();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100098ED4(v9);
      }

      [*(id *)(a1 + 32) setScanDownloadFailedFlag:1];
      id v10 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) scanFinish]);
      dispatch_semaphore_signal(v10);
    }

    else
    {
      [*(id *)(a1 + 32) bail:"-[MSDOSUpdaterController startOSUpdate]_block_invoke" error:v7];
    }
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 productVersion]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 productBuildVersion]);
    id v13 = *(void **)(a1 + 32);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 expectedOSVersion]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expectedOSBuild]);
    LOBYTE(v13) = [v13 doesAvailableUpdateVersion:v11 andUpdateBuild:v12 matchExpectedUpdateVersion:v14 andUpdateBuild:v15];

    if ((v13 & 1) != 0)
    {
      id v16 = sub_10003A95C();
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Scan request completed. Kicking download:%{public}@.",  buf,  0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v18 updateStage:18];

      id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) manager]);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10004C6F4;
      v20[3] = &unk_1000FA048;
      v20[4] = *(void *)(a1 + 32);
      [v19 startDownload:v20];
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741030LL,  @"Unexpected OS update version found."));
      [*(id *)(a1 + 32) saveAvailableOSVersion:v11 andOSBuild:v12];
      [*(id *)(a1 + 32) bail:"-[MSDOSUpdaterController startOSUpdate]_block_invoke" error:v19];
    }
  }
}

id *sub_10004C6F4(id *result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] bail:"-[MSDOSUpdaterController startOSUpdate]_block_invoke" error:a3];
  }
  return result;
}

void sub_10004C94C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = sub_10003A95C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      id v8 = "Canceling other ongoing SU downloads happened sucessfuly.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 2u);
    }
  }

  else
  {
    id v9 = sub_10003A95C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Canceling other ongoing SU download failed: %{public}@",  (uint8_t *)&v12,  0xCu);
      }
    }

    else if (v10)
    {
      LOWORD(v12) = 0;
      id v8 = "Canceling other ongoing SU download failed without error.";
      goto LABEL_9;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10004CA88(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = sub_10003A95C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      id v8 = "Software update purge happened successfully.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 2u);
    }
  }

  else
  {
    id v9 = sub_10003A95C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "remove software update failed: %{public}@",  (uint8_t *)&v12,  0xCu);
      }
    }

    else if (v10)
    {
      LOWORD(v12) = 0;
      id v8 = "remove software update failed: no error returned";
      goto LABEL_9;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10004D974(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10003A95C();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 code];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    v11[0] = 67109890;
    v11[1] = a2;
    __int16 v12 = 2048;
    id v13 = v8;
    __int16 v14 = 2114;
    int v15 = v9;
    __int16 v16 = 2114;
    BOOL v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "result:%d errorCode:%td errorDomain:%{public}@ errorUserInfo:%{public}@.",  (uint8_t *)v11,  0x26u);
  }

  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) bail:"-[MSDOSUpdaterController client:downloadDidFinish:]_block_invoke" error:v5];
  }
}

void sub_10004DEAC(id a1, BOOL a2, NSError *a3)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance", a3));
  [v3 forceSwitchToDemoModeIfNeeded];
}

void sub_10004F0CC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDAccountManager);
  id v2 = (void *)qword_100125440;
  qword_100125440 = (uint64_t)v1;
}

void sub_10004F288(id a1, int a2)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received notification for trusted peer change!",  v5,  2u);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [v4 saveiCloudAccountSyncNeeded:1];
}

LABEL_61:
      uint64_t v28 = 0LL;
      goto LABEL_47;
    }

id sub_100050FDC()
{
  if (qword_100125458 != -1) {
    dispatch_once(&qword_100125458, &stru_1000FA1C8);
  }
  return (id)qword_100125450;
}

void sub_10005101C(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    id v3 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Demo.mov",  @"/var/mobile/Demo.plist",  @"/var/mobile/Media",  @"/var/mobile/Library/AddressBook",  @"/var/mobile/Library/Alarms",  @"/var/mobile/Library/Calendar",  @"/var/mobile/Library/CallHistoryDB",  @"/var/mobile/Library/Carousel",  @"/var/mobile/Library/Health",  @"/var/mobile/Library/Maps",  @"/var/mobile/Library/MapsHistory.plist",  @"/var/mobile/Library/NanoMailKit",  @"/var/mobile/Library/NanoMusicSync",  @"/var/mobile/Library/NanoPasses",  @"/var/mobile/Library/NanoPodcasts",  @"/var/mobile/Library/NanoPhotos",  @"/var/mobile/Library/NanoWeatherDemo",  @"/var/mobile/Library/News",  @"/var/mobile/Library/RetailDemo",  @"/var/mobile/Library/Reminders",  @"/var/mobile/Library/SMS",  @"/var/mobile/Library/UserConfigurationProfiles",  @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",  @"/var/mobile/Library/Preferences/com.apple.Accessibility.plist",  @"/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist",  @"/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.nano.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.support.plist",  @"/var/mobile/Library/Preferences/com.apple.backboardd.plist",  @"/var/mobile/Library/Preferences/com.apple.Carousel.plist",  @"/var/mobile/Library/Preferences/com.apple.coremedia.plist",  @"/var/mobile/Library/Preferences/com.apple.ControlCenter.plist",  @"/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist",  @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",  @"/var/mobile/Library/Preferences/com.apple.findmy.plist",  @"/var/mobile/Library/Preferences/com.apple.healthd.plist",  @"/var/mobile/Library/Preferences/com.apple.ids.plist",  @"/var/mobile/Library/Preferences/com.apple.locationd.plist",  @"/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist",  @"/var/mobile/Library/Preferences/com.apple.mobilephone.plist",  @"/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist",  @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist",  @"/var/mobile/Library/Preferences/com.apple.nanobuddy.plist",  @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist",  @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist",
           @"/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist",
           @"/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanopassbook.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanophotos.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist",
           @"/var/mobile/Library/Preferences/com.apple.Noise.plist",
           @"/var/mobile/Library/Preferences/com.apple.podcasts.plist",
           @"/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist",
           @"/var/mobile/Library/Preferences/com.apple.stockholm.plist",
           @"/var/mobile/Library/Preferences/com.apple.system.prefs.plist",
           @"/var/mobile/Library/Preferences/com.apple.timed.plist",
           @"/var/mobile/Library/Preferences/com.apple.voicememod.plist",
           @"/var/mobile/Library/Preferences/group.com.apple.stocks.plist",
           @"/var/mobile/Library/Preferences/Avalon");
  }

  else
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    id v3 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Media/DCIM",  @"/var/mobile/Media/PhotoData",  @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",  @"/var/MobileDevice/ProvisioningProfiles",  @"/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder",  @"/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",  @"/var/mobile/Library/DemoLoop",  0LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51,
           v52,
           v53,
           v54,
           v55,
           v56,
           v57,
           v58);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(v3);
  int v7 = (void *)qword_100125450;
  qword_100125450 = v6;
}

id sub_100051448()
{
  if (qword_100125468 != -1) {
    dispatch_once(&qword_100125468, &stru_1000FA1E8);
  }
  return (id)qword_100125460;
}

void sub_100051488(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData",  0LL));
  }

  else
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  uint64_t v6 = (void *)qword_100125460;
  qword_100125460 = v3;
}

id sub_100051588()
{
  if (qword_100125478 != -1) {
    dispatch_once(&qword_100125478, &stru_1000FA208);
  }
  return (id)qword_100125470;
}

void sub_1000515C8(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"systemgroup.com.apple.configurationprofiles",  0LL));
  }

  else
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  uint64_t v6 = (void *)qword_100125470;
  qword_100125470 = v3;
}

id sub_100051684()
{
  if (qword_100125488 != -1) {
    dispatch_once(&qword_100125488, &stru_1000FA228);
  }
  return (id)qword_100125480;
}

void sub_1000516C4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/.com.apple.mobile_container_manager.metadata.plist",  @"/Library/Caches",  @"/Library/SyncedPreferences",  @"/Library/Saved Application State",  @"/SystemData/com.apple.AuthenticationServices",  0LL));
  unsigned int v2 = (void *)qword_100125480;
  qword_100125480 = v1;
}

id sub_10005172C()
{
  if (qword_100125498 != -1) {
    dispatch_once(&qword_100125498, &stru_1000FA248);
  }
  return (id)qword_100125490;
}

void sub_10005176C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/.com.apple.mobile_container_manager.metadata.plist",  @"/Library/Caches",  @"/Library/SyncedPreferences",  @"/Library/Saved Application State",  @"/SystemData/com.apple.AuthenticationServices",  0LL));
  unsigned int v2 = (void *)qword_100125490;
  qword_100125490 = v1;
}

id sub_1000517D4()
{
  v6[0] = @"ContentRootDomain";
  id v0 = sub_100050FDC();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v6[1] = @"SystemContainerDomain";
  v7[0] = v1;
  id v2 = sub_100051588();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v7[1] = v3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

void sub_1000518C8(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDServerRequestHandler);
  id v2 = (void *)qword_1001254A0;
  qword_1001254A0 = (uint64_t)v1;
}

void sub_100051D24(_Unwind_Exception *a1)
{
}

void sub_100051DBC(_Unwind_Exception *a1)
{
}

void sub_100051FCC(_Unwind_Exception *a1)
{
}

void sub_100052210( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100052244(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100052254(uint64_t a1)
{
}

void sub_10005225C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000523A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  if (v4)
  {
    unsigned int v5 = 0LL;
    uint64_t v6 = 0LL;
    int v7 = 0LL;
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 credential]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
    unsigned __int8 v10 = [v8 saveItem:v9 forKey:@"com.apple.mobilestoredemo.keychainItemID"];

    if ((v10 & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hubServer]);
      [v11 overrideHmacKey:v7];

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 settingsDict]);
      if (v6)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
        unsigned __int8 v13 = [v12 saveHubSuppliedSettings:v6];

        if ((v13 & 1) == 0)
        {
          id v14 = sub_10003A95C();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 136315138;
            uint64_t v34 = "-[MSDServerRequestHandler handleEnroll:]_block_invoke";
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Cannot save settings dictionary.",  (uint8_t *)&v33,  0xCu);
          }
        }
      }

      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"DeviceOptions"]);
      if (v5)
      {
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
        if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
          unsigned __int8 v19 = [v18 updateDeviceOptions:v5 skipImutableKeys:0];

          if ((v19 & 1) == 0)
          {
            id v20 = sub_10003A95C();
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              int v33 = 136315138;
              uint64_t v34 = "-[MSDServerRequestHandler handleEnroll:]_block_invoke";
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Cannot set deviceOptions dictionary received during /Register response.",  (uint8_t *)&v33,  0xCu);
            }
          }
        }
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 hubProtocolVersion]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
      [v23 setHubProtocolVersion:v22];

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 hubProtocolVersion]);
      unsigned int v26 = [v25 lowerVersionThan:@"2"];

      if (v26)
      {
        id v27 = sub_10003A95C();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
          uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue([v29 hubProtocolVersion]);
          int v33 = 138543362;
          uint64_t v34 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Hub protocol version (%{public}@) is too old.",  (uint8_t *)&v33,  0xCu);
        }
      }
    }

    else
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727740949LL,  @"Cannot save enrollment record."));
      [v3 setError:v32];

      unsigned int v5 = 0LL;
      uint64_t v6 = 0LL;
    }
  }

  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(uint64_t, id))(v31 + 16))(v31, v3);
  }
}

id sub_1000528D8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) checkIPAForResponse:a2 withRequest:*(void *)(a1 + 40)];
}

id sub_1000528E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) downloadIPAForResponse:a2 withRequest:*(void *)(a1 + 40)];
}

void sub_100052A20(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getDownloadFileRequestFromResponse:v9 forFilePath:*(void *)(a1 + 40)]);
    if (v4)
    {
      unsigned int v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fileInfo]);
      [v6 setSkipHashCheck:1];

      [v5 setCompletion:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) handleDownloadFile:v5];

      goto LABEL_4;
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
    [v9 setError:v7];
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
LABEL_4:
}

LABEL_9:
}

    uint64_t v6 = 0;
    goto LABEL_4;
  }

  uint64_t v6 = 1;
LABEL_4:

  objc_sync_exit(v2);
  return v6;
}

  if (v6 >= 2)
  {
    id v9 = sub_10003A95C();
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Trying to terminate configuration app...",  buf,  2u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
    [v11 terminateApplication:@"com.apple.DemoUpdate" forReason:1 andReport:0 withDescription:0];

    uint64_t v12 = 11;
    while (1)
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
      id v14 = [v13 taskState];

      if (v14 < 2) {
        break;
      }
      sleep(1u);
      if (--v12 <= 1)
      {
        uint64_t v15 = sub_10003A95C();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_WORD *)buf = 0;
        uint64_t v17 = "Terminating configuration app timeout.";
        uint64_t v18 = v16;
        unsigned __int8 v19 = 2;
        goto LABEL_19;
      }
    }

    id v20 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 67109120;
    uint64_t v23 = v14;
    uint64_t v17 = "Configuration app terminated with state == %d";
    uint64_t v18 = v16;
    unsigned __int8 v19 = 8;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_20:
  }
}

    uint64_t v11 = 0LL;
    goto LABEL_10;
  }

  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);
LABEL_6:
  uint64_t v11 = v5;
LABEL_10:

  return v11;
}

void sub_100052DC8(_Unwind_Exception *a1)
{
}

void sub_10005321C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100053234(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  unsigned int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

    if (!v6)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) credential]);
      if (v8)
      {
        int v7 = (void *)v8;
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
        unsigned __int8 v10 = [v9 updateWithResponseFromGetFileDownloadCredentials:v7];

        if ((v10 & 1) != 0) {
          goto LABEL_6;
        }
        id v21 = sub_10003A95C();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000998C8(v22, v23, v24, v25, v26, v27, v28, v29);
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744737LL,  @"Cannot write file."));
      }

      else
      {
        id v11 = sub_10003A95C();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100099894(v12, v13, v14, v15, v16, v17, v18, v19);
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));
        int v7 = 0LL;
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setError:v20];

      goto LABEL_6;
    }
  }

  int v7 = 0LL;
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100053580(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  [*(id *)(a1 + 32) setError:v3];

  return [*(id *)(a1 + 40) checkIPAForResponse:*(void *)(a1 + 32) withRequest:*(void *)(a1 + 48)];
}

LABEL_7:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 completion]);
  if (v16)
  {
    uint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 completion]);
    ((void (**)(void, id))v17)[2](v17, v5);
  }
}

      uint64_t v8 = v45;
      uint64_t v6 = v46;
      id v9 = v44;
    }

    else if (([v9 isEqualToString:@"ExtensionData"] & 1) != 0 {
           || ([v9 isEqualToString:@"AppData"] & 1) != 0
    }
           || [v9 isEqualToString:@"GroupData"])
    {
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Identifier"]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v29]);
      int v33 = objc_opt_class(&OBJC_CLASS___NSDictionary, v32);
      if ((objc_opt_isKindOfClass(v31, v33) & 1) == 0)
      {
        uint64_t v40 = sub_10003A95C();
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_10009DE70();
        }

        goto LABEL_10;
      }

      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"RigorousCheckType"]);
      uint64_t v35 = [v34 isEqualToString:@"Skip"];

      if ((v35 & 1) != 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }

    uint64_t v28 = sub_10003A95C();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10009DD88();
    }
    goto LABEL_10;
  }

  uint64_t v30 = 1;
LABEL_22:

  return v30;
}

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v5,  (unint64_t)[v3 length] >> 1,  1));
LABEL_8:

  return (NSData *)v8;
}

  if (!-[NSString length](v9, "length")) {
    goto LABEL_10;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingFormat:@": %@", v9]);

LABEL_11:
  return v11;
}

void sub_100053B30(_Unwind_Exception *a1)
{
}

LABEL_28:
                    id v4 = v35;
                    goto LABEL_29;
                  }
                }
              }

              uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v61 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

LABEL_29:
          uint64_t v8 = v42;
          if (v40)
          {
            uint64_t v28 = sub_10003A95C();
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            uint64_t v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (a3)
            {
              if (v30)
              {
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v40 lastObject]);
                *(_DWORD *)buf = 138412546;
                uint64_t v57 = v9;
                uint64_t v58 = 2112;
                uint64_t v59 = v31;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Setting up intra-component dependency: %@ -> %@",  buf,  0x16u);
              }

              uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 lastObject]);
              [v9 addDependency:v29];
            }

            else if (v30)
            {
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v40 lastObject]);
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = v9;
              uint64_t v58 = 2112;
              uint64_t v59 = v32;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Skipping intra-component dependency linking: %@ -> %@",  buf,  0x16u);
            }
          }

          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v43, v41);

          int v7 = v37;
          uint64_t v6 = v38;
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(lock);
  return v4;
}

  uint64_t v15 = 1;
LABEL_33:

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  [v45 setAlreadyHaveList:0];

  return v15 & 1;
}

void sub_100057A60(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDAppHelper);
  id v2 = (void *)qword_1001254B0;
  qword_1001254B0 = (uint64_t)v1;
}

void sub_100058078(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"bundleIDs"]);

  id v5 = sub_10003A95C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received app registered notification with bundle IDs: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) signal];
  [*(id *)(a1 + 32) unlock];
}

LABEL_68:
LABEL_72:
    uint64_t v47 = 0;
    uint64_t v43 = 0LL;
    goto LABEL_29;
  }

  v104 = v25;
  uint64_t v38 = objc_msgSend(v24, "setAppAssetPromise:error:", v33, &v104, v36);
  uint64_t v32 = v104;

  if ((v38 & 1) == 0)
  {
    id v79 = sub_10003A95C();
    uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      v111 = v81;
      _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Could not set app asset promise with error - %{public}@",  buf,  0xCu);
    }

    uint64_t v47 = 0;
    uint64_t v43 = 0LL;
    goto LABEL_76;
  }

  v103 = v32;
  uint64_t v39 = [v36 setConfigurationCompleteWithError:&v103];
  uint64_t v25 = v103;

  if ((v39 & 1) == 0)
  {
    uint64_t v82 = sub_10003A95C();
    unsigned int v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      id v77 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      v111 = v77;
      v78 = "Could not set configuration comlete with error - %{public}@";
      goto LABEL_67;
    }

    goto LABEL_68;
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v42 = objc_msgSend( v40,  "copyFileIfPresentInCache:toLocation:verifyHash:",  v96,  v97,  objc_msgSend(v41, "verifyFileHash"));

  if ((v42 & 1) == 0)
  {
    uint64_t v83 = sub_10003A95C();
    uint64_t v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v111 = v96;
      _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Could not copy IPA/Patch file from cache: %{public}@",  buf,  0xCu);
    }

    goto LABEL_72;
  }

  uint64_t v43 = objc_alloc_init(&OBJC_CLASS___MIInstallOptions);
  [v43 setInstallTargetType:1];
  v102 = v25;
  uint64_t v44 = [v24 setInstallOptions:v43 error:&v102];
  uint64_t v32 = v102;

  if ((v44 & 1) == 0)
  {
    uint64_t v85 = sub_10003A95C();
    uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      v111 = v87;
      _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "Set install options failed with error - %{public}@",  buf,  0xCu);
    }

    uint64_t v47 = 0;
LABEL_76:
    uint64_t v25 = v32;
    goto LABEL_29;
  }

  if (v14)
  {
    v101 = v32;
    uint64_t v45 = -[MSDIPAInstallOperation _fulfillIXSZTransferPromise:withFile:outError:]( self,  "_fulfillIXSZTransferPromise:withFile:outError:",  v33,  v97,  &v101);
    uint64_t v25 = v101;

    if ((v45 & 1) == 0)
    {
      uint64_t v47 = 0;
      goto LABEL_29;
    }

    uint64_t v32 = v25;
  }

  else
  {
    [v33 setComplete:1];
  }

  uint64_t v46 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v25 = (id)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation installError](self, "installError"));
  uint64_t v47 = v25 == 0LL;
LABEL_29:
  uint64_t v48 = sub_10003AAAC();
  uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  uint64_t v50 = -[MSDOperation signpostId](self, "signpostId");
  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v51 = v50;
    if (os_signpost_enabled(v49))
    {
      *(_DWORD *)buf = 138412802;
      v111 = v6;
      v112 = 1024;
      *(_DWORD *)v113 = v14;
      *(_WORD *)&v113[4] = 1024;
      *(_DWORD *)&v113[6] = v47;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_EVENT,  v51,  "Install IPA",  "App identifier: %{xcode:string}@ Use diff patch: %{xcode:BOOLean}d Install Result: %{xcode:BOOLean}d",  buf,  0x18u);
    }
  }

  if (v47)
  {
    uint64_t v52 = v25;
  }

  else
  {
    int v100 = v25;
    sub_100087694(&v100, 3727740962LL, @"Cannot install app.");
    uint64_t v52 = v100;

    -[MSDOperation setError:](self, "setError:", v52);
    if (v33)
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472LL;
      v99[2] = sub_1000594B4;
      v99[3] = &unk_1000FA378;
      v99[4] = self;
      [v33 cancelForReason:v52 client:9 completion:v99];
      uint64_t v53 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
      dispatch_semaphore_wait(v53, 0xFFFFFFFFFFFFFFFFLL);
    }

    -[MSDIPAInstallOperation _createFullIPAInstallOperationsAsFallback]( self,  "_createFullIPAInstallOperationsAsFallback",  v89);
  }

  if (objc_msgSend(v95, "fileExistsAtPath:", v97, v89))
  {
    v98 = v52;
    uint64_t v54 = [v95 removeItemAtPath:v97 error:&v98];
    uint64_t v55 = v98;

    if ((v54 & 1) == 0)
    {
      uint64_t v56 = sub_10003A95C();
      uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_10009A350((uint64_t)v97, v55, v57);
      }
    }
  }

  else
  {
    uint64_t v55 = v52;
  }

  if (v14)
  {
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
    [v58 removeAppDiffPatchFileForSourceAppUID:v93 targetAppUID:v94];
  }

  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  BOOL v60 = [v59 deleteInstallableFileAfterInstall];

  if (!v60)
  {
    uint64_t v66 = sub_10003A95C();
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v111 = v96;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Skipping deletion of IPA/Patch file from cache: %{public}@",  buf,  0xCu);
    }

    v63 = v91;
    goto LABEL_52;
  }

  id v61 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  v62 = [v61 deleteFromCache:v96];

  v63 = v91;
  if ((v62 & 1) == 0)
  {
    v64 = sub_10003A95C();
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_10009A2EC();
    }
LABEL_52:
  }

  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  [v67 releaseAppTerminationAssertion:v63 forApp:v6];

  return v47;
}

void sub_1000594B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009A500(v3, v5);
    }
  }

  uint64_t v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) semaphore]);
  dispatch_semaphore_signal(v6);
}

void sub_100059B28(_Unwind_Exception *a1)
{
}

uint64_t sub_100059B74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100059B84(uint64_t a1)
{
}

void sub_100059B8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_10003A95C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009A6C4();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }

  uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) semaphore]);
  dispatch_semaphore_signal(v8);
}

void sub_100059C1C(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = sub_10003A95C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009A728();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) semaphore]);
  dispatch_semaphore_signal(v9);
}

void sub_100059CC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009A78C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  id v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) semaphore]);
  dispatch_semaphore_signal(v7);
}

LABEL_44:
LABEL_46:
  -[NSCondition lock](v63, "lock");
  while (v90[3] >= 1)
    -[NSCondition wait](v63, "wait");
  -[NSCondition unlock](v63, "unlock");
  if (*((_BYTE *)v86 + 24))
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      if (+[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  v80[5],  100LL))
      {
        uint64_t v43 = (void *)v80[5];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/tmp/DownloadedFileList.plist"));
        v64 = 0LL;
        uint64_t v45 = [v43 writeToURL:v44 error:&v64];
        uint64_t v46 = v64;

        if ((v45 & 1) == 0)
        {
          uint64_t v47 = sub_10003A95C();
          uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v46 localizedDescription]);
            sub_10009A7F0(v49, (uint64_t)buf, v48);
          }
        }
      }

      else
      {
        uint64_t v53 = sub_10003A95C();
        uint64_t v46 = (id)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR)) {
          sub_10009A850((os_log_t)v46);
        }
      }

      uint64_t v50 = 1;
      goto LABEL_62;
    }

    uint64_t v50 = 1;
  }

  else
  {
LABEL_57:
    -[MSDOperation setRetryable:](self, "setRetryable:", 1LL);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation error](self, "error"));
    uint64_t v52 = v51 == 0LL;

    if (v52)
    {
      uint64_t v46 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744736LL,  @"An error has occurred."));
      -[MSDOperation setError:](self, "setError:", v46);
      uint64_t v50 = 0;
LABEL_62:

      goto LABEL_63;
    }

    uint64_t v50 = 0;
  }

          uint64_t v15 = v61 + 1;
        }

        while ((id)(v61 + 1) != v14);
        uint64_t v48 = [v12 countByEnumeratingWithState:&v71 objects:v80 count:16];
        uint64_t v14 = v48;
        id v9 = v57;
        id v7 = v58;
        if (!v48)
        {
LABEL_49:

          uint64_t v49 = -[MSDOperationGroup initWithOperationGroups:]( objc_alloc(&OBJC_CLASS___MSDOperationGroup),  "initWithOperationGroups:",  v66);
          goto LABEL_57;
        }
      }
    }

    uint64_t v54 = sub_10003A95C();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_10009D9AC();
    }

    uint64_t v49 = 0LL;
  }

  else
  {
    uint64_t v50 = sub_10003A95C();
    uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v76 = (const char *)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "No app dependencies for %{public}@; skip building AppData operations ...",
        buf,
        0xCu);
    }

    uint64_t v49 = objc_alloc_init(&OBJC_CLASS___MSDOperationGroup);
  }

void sub_10005C194( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t sub_10005C220(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005C230(uint64_t a1)
{
}

id sub_10005C238(uint64_t a1, int a2)
{
  id v4 = sub_10003AAAC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (char *)[*(id *)(a1 + 32) signpostId];
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = (os_signpost_id_t)v6;
    if (os_signpost_enabled(v5))
    {
      int v8 = *(unsigned __int8 *)(a1 + 104);
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_END,  v7,  "Download File",  "File download result: %{xcode:BOOLean}d",  buf,  8u);
    }
  }

  if (a2)
  {
    id v9 = [*(id *)(a1 + 40) fileSizeInCache:*(void *)(a1 + 48)];
    id v10 = sub_10003AAAC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (char *)[*(id *)(a1 + 32) signpostId];
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = (os_signpost_id_t)v12;
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 134217984;
        id v23 = v9;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  v13,  "File Downloaded",  "File download size: %{xcode:size-in-bytes}llu",  buf,  0xCu);
      }
    }

    if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
    {
      uint64_t v14 = *(void *)(a1 + 48);
      id v20 = @"Hash";
      uint64_t v21 = v14;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v15 forKey:*(void *)(a1 + 56)];
    }
  }

  else
  {
    id v16 = sub_10003A95C();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009A8D4(a1, v17, v18);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
  }

  [*(id *)(a1 + 72) lock];
  --*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL);
  [*(id *)(a1 + 72) broadcast];
  return [*(id *)(a1 + 72) unlock];
}

void sub_10005C5EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10005C614(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  if (*(void *)(a1 + 32))
  {
    id v5 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setError:v5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id v3 = v5;
  }
}

void sub_10005C6CC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDFileDownloadCredentials);
  id v2 = (void *)qword_1001254C0;
  qword_1001254C0 = (uint64_t)v1;
}

void sub_10005DD70(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDFindMyHub);
  id v2 = (void *)qword_1001254D0;
  qword_1001254D0 = (uint64_t)v1;

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [(id)qword_1001254D0 setDevice:v3];

  id v5 = (id)objc_opt_new(&OBJC_CLASS___NSMutableString, v4);
  [(id)qword_1001254D0 setStoresSearched:v5];
}

LABEL_26:
    -[MSDFindMyHub retryEnrollmentWithHub:](self, "retryEnrollmentWithHub:", 1LL);
    return;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFindMyHub device](self, "device"));
  uint64_t v18 = [v17 findMyHubRetryAtTime];

  if ((uint64_t)v18 <= 0)
  {
    uint64_t v29 = sub_10003A95C();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v30 = 0;
      uint64_t v28 = "No FMH retry time set? Retry enrollment anyways.";
      goto LABEL_25;
    }

    goto LABEL_26;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v18));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v19 timeIntervalSinceDate:v20];
  uint64_t v22 = v21;

  id v23 = sub_10003A95C();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22 <= 300.0)
  {
    if (v25)
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "FMH retry timer is already expired or is about to expire. Retry now!",  v30,  2u);
    }

    -[MSDFindMyHub retryEnrollmentWithHub:](self, "retryEnrollmentWithHub:", 1LL);
  }

  else
  {
    if (v25)
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "FMH retry timer will be scheduled.", v30, 2u);
    }

    -[MSDFindMyHub scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:]( self,  "scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:",  v19,  1LL);
  }
}

  return v13;
}

      v11[2](v11, 0LL);
      goto LABEL_27;
    }
  }

  else
  {
    id v20 = 0LL;
  }

  v11[2](v11, 1LL);
LABEL_27:
}

id sub_10005E77C(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Cellular plan did change, retrying enrollment in Offline Mode",  v5,  2u);
  }

  return [*(id *)(a1 + 32) handleEnrollmentRetryUponFirstLaunch];
}

void sub_10005F430(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) toString]);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v19 = 138543618;
    id v20 = v4;
    __int16 v21 = 1026;
    int v22 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "FMH retry timer scheduled: %{public}@, isFirstLaunch: %{public, BOOL}d",  (uint8_t *)&v19,  0x12u);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) retryTimer]);
  if (v6)
  {
    os_signpost_id_t v7 = (void *)v6;
    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) retryTimer]);
    unsigned int v9 = [v8 isValid];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) retryTimer]);
      [v10 invalidate];

      [*(id *)(a1 + 40) setRetryTimer:0];
    }
  }

  id v11 = objc_alloc(&OBJC_CLASS___NSTimer);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  @"isFirstLaunch"));
  id v16 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v11,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v12,  v13,  "handleRetryTimerFireForEnrollment:",  v15,  0LL,  0.0);
  [*(id *)(a1 + 40) setRetryTimer:v16];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) retryTimer]);
  [v17 addTimer:v18 forMode:NSDefaultRunLoopMode];
}

id sub_10005F704(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryEnrollmentWithHub:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10005F9F4(_Unwind_Exception *a1)
{
}

void sub_100061544(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDCryptoHandler);
  id v2 = (void *)qword_1001254E0;
  qword_1001254E0 = (uint64_t)v1;
}

void sub_1000625A8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000625FC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLanguageAndRegionManager);
  id v2 = (void *)qword_1001254F0;
  qword_1001254F0 = (uint64_t)v1;
}

void sub_1000628FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_10006291C(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL) != -1)
  {
    uint64_t v1 = result;
    id v2 = sub_10003A95C();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Deadline for Springboard restart passed.",  v4,  2u);
    }

    [*(id *)(v1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(v1 + 48) + 8) + 24)];
    id result = *(void *)(v1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
    }
  }

  return result;
}

uint64_t sub_1000629C0(uint64_t a1)
{
  uint64_t result = out_token;
  if (out_token != -1)
  {
    uint64_t state64 = 0LL;
    uint64_t result = notify_get_state(out_token, &state64);
    if (state64)
    {
      id v3 = sub_10003A95C();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Springboard restarted.", v5, 2u);
      }

      [*(id *)(a1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      uint64_t result = *(void *)(a1 + 40);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
      }
    }
  }

  return result;
}

void sub_100062E38(int a1, int a2, CFStringRef theString1)
{
  if (CFStringCompare(theString1, @"com.apple.purplebuddy.setupdone", 0LL) == kCFCompareEqualTo)
  {
    id v3 = sub_10003A95C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received notification: buddy finished setup",  v6,  2u);
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v5 invokeHandler:1];
  }

void sub_100062F14(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDTargetDevice);
  id v2 = (void *)qword_100125500;
  qword_100125500 = (uint64_t)v1;

  [(id)qword_100125500 setModeLock:&off_1001064B0];
  [(id)qword_100125500 setBuddyCompletionHandlerLock:&off_1001064B0];
}

LABEL_79:
    if ((_DWORD)v3 == 4)
    {
LABEL_80:
      sleep(2u);
      -[MSDTargetDevice setProceeded:](self, "setProceeded:", 1LL);
      goto LABEL_86;
    }

LABEL_85:
    -[MSDTargetDevice setProceeded:](self, "setProceeded:", 0LL);
LABEL_86:
    if (v24
      || ((_DWORD)v3 == 5 ? (uint64_t v40 = (_DWORD)v6 == 1) : (uint64_t v40 = 0), !v40 ? (v41 = 0) : (v41 = 1), (_DWORD)v3 == 2 || v41))
    {
      if (!-[MSDTargetDevice setDemoDeviceFlag](self, "setDemoDeviceFlag"))
      {
        uint64_t v37 = sub_10003A95C();
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1000984A0();
        }

        int v19 = 0LL;
LABEL_91:
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
        [v39 demoUpdateFailed:v19];

        goto LABEL_26;
      }
    }

    if ((_DWORD)v3 == 5)
    {
      -[MSDTargetDevice deleteConfigurationApp](self, "deleteConfigurationApp");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v42 updateStage:7];

      if (-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
        [v43 saveCurrentWiFiSettings];
      }

      if ((_DWORD)v6 == 4)
      {
        uint64_t v44 = 1;
        -[MSDTargetDevice cleanUpBackgroundState:](self, "cleanUpBackgroundState:", 1LL);
      }

      else
      {
        uint64_t v44 = 1;
      }
    }

    else
    {
      uint64_t v44 = v6 == 5;
    }

    -[MSDTargetDevice setMode:](self, "setMode:", v3);
    if (v44) {
      -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", (_DWORD)v3 == 5);
    }
    if ((_DWORD)v3 == 4) {
      -[MSDTargetDevice rebootForStage:](self, "rebootForStage:", 6LL);
    }
LABEL_111:
    id v20 = 1;
    goto LABEL_112;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
  uint64_t v48 = 0LL;
  uint64_t v18 = [v17 shouldCleanUp:&v48];
  int v19 = v48;

  if (!v18 || [v19 code] != (id)3727741185)
  {

    goto LABEL_28;
  }

  -[MSDTargetDevice forceSwitchToDemoUpdateModeIfNeeded](self, "forceSwitchToDemoUpdateModeIfNeeded");
LABEL_26:

  id v20 = 0;
LABEL_112:
  objc_sync_exit(v5);

  return v20;
}

  return v72;
}

void sub_100063A64(_Unwind_Exception *a1)
{
}

void sub_100063C70(_Unwind_Exception *a1)
{
}

void sub_100063F48(_Unwind_Exception *a1)
{
}

void sub_1000640AC(_Unwind_Exception *a1)
{
}

void sub_1000642E8(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10003A95C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Obliterate request failed:%{public}@.",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_1000649BC(_Unwind_Exception *a1)
{
}

void sub_100064FEC(_Unwind_Exception *a1)
{
}

void sub_1000650C8(_Unwind_Exception *a1)
{
}

void sub_100065264(_Unwind_Exception *a1)
{
}

void sub_100065C60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    os_signpost_id_t v7 = (__CFString *)v3;
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoManualUpdateState"))
    {
      [*(id *)(a1 + 32) manualUpdateMode:&v82 allowChange:&v81];
      int v8 = *(void **)(a1 + 40);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v82));
      [v8 setObject:v9 forKey:@"MSDDemoManualUpdateCurrentMode"];

      id v10 = *(void **)(a1 + 40);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v81));
      uint64_t v12 = @"MSDDemoManualUpdateAllowChange";
      uint64_t v13 = v10;
LABEL_4:
      uint64_t v14 = v11;
LABEL_5:
      [v13 setObject:v14 forKey:v12];
LABEL_22:

      goto LABEL_23;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoContentStatus"))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));

      if (!v15)
      {
LABEL_23:

        goto LABEL_24;
      }

      id v16 = *(void **)(a1 + 40);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 getContentStatus]);
      [v16 setObject:v18 forKey:@"MSDDemoContentStatus"];

      int v19 = *(void **)(a1 + 40);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v20 getInternalStatus]));
      [v19 setObject:v21 forKey:@"InternalStatus"];

LABEL_9:
      goto LABEL_23;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoLastRebootTime"))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 lastRebootTime]);
      if (!v22) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoLastRevertTime"))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastSnapshotRevertTime]);
      if (!v22) {
        goto LABEL_23;
      }
LABEL_18:
      id v11 = v22;
      id v23 = *(void **)(a1 + 40);
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 toString]);
LABEL_19:
      uint64_t v25 = (void *)v24;
      uint64_t v26 = v23;
      uint64_t v27 = v25;
      uint64_t v28 = v7;
LABEL_20:
      [v26 setObject:v27 forKey:v28];
LABEL_21:

      goto LABEL_22;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDLastShallowRefreshTime"))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastShallowRefreshTime]);
      if (!v22) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoNANDSize"))
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
      unsigned int v30 = [v29 isNPIDevice];

      if (v30)
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 getMaskValueForKey:@"MSDDemoNANDSize"]);

        if (v32)
        {
          uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber, v33);
          id v20 = v32;
          if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
          {
LABEL_35:
            [*(id *)(a1 + 40) setObject:v20 forKey:v7];
            goto LABEL_9;
          }
        }
      }

      else
      {
        uint64_t v32 = 0LL;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 nandSize]);

      if (!v20) {
        goto LABEL_23;
      }
      goto LABEL_35;
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    if ([v35 macOS])
    {
      unsigned int v36 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDPricingRequestUpdate");

      if (!v36) {
        goto LABEL_42;
      }
LABEL_38:
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
      id v40 = [v39 needUpdate];

      uint64_t v41 = *(void **)(a1 + 40);
      uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v40));
      goto LABEL_39;
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    if ([v37 iOS])
    {
      unsigned __int8 v38 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDPricingRequestUpdate");

      if ((v38 & 1) != 0) {
        goto LABEL_38;
      }
    }

    else
    {
    }

LABEL_42:
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoAcceptUATContent"))
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
      unsigned __int8 v44 = [v43 macOS];

      if ((v44 & 1) != 0)
      {
        id v11 = &__kCFBooleanFalse;
      }

      else
      {
        id v11 = (void *)MGCopyAnswer(@"SigningFuse", 0LL);
        if (!v11) {
          goto LABEL_23;
        }
      }

      id v23 = *(void **)(a1 + 40);
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 BOOLValue] ^ 1));
      goto LABEL_19;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoProductDescription"))
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
      unsigned int v46 = [v45 isNPIDevice];

      if (v46)
      {
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v47 getMaskValueForKey:@"MSDDemoProductDescription"]);

        if (v11)
        {
          uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString, v48);
          uint64_t v50 = (uint64_t)v11;
          if ((objc_opt_isKindOfClass(v11, v49) & 1) != 0) {
            goto LABEL_66;
          }
        }
      }

      else
      {
        id v11 = 0LL;
      }

      uint64_t v56 = (void *)MGCopyAnswer(@"oPeik/9e8lQWMszEjbPzng", 0LL);
      uint64_t v25 = v56;
      if (v56)
      {
        uint64_t v50 = objc_claimAutoreleasedReturnValue([v56 objectForKey:@"ArtworkDeviceProductDescription"]);

        if (v50)
        {
          uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSString, v57);
          if ((objc_opt_isKindOfClass(v50, v58) & 1) != 0)
          {

            id v11 = (void *)v50;
LABEL_66:
            uint64_t v13 = *(void **)(a1 + 40);
            uint64_t v14 = (void *)v50;
            goto LABEL_67;
          }
        }

        id v66 = sub_10003A95C();
        uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10009BE04();
        }
        id v11 = (void *)v50;
      }

      else
      {
        id v68 = sub_10003A95C();
        uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10009BDD8();
        }
      }

      goto LABEL_21;
    }

    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoCarrierBundleID") & 1) != 0
      || -[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoCarrierBundleVersion"))
    {
      uint64_t v51 = (void *)MGCopyAnswer(@"CarrierBundleInfoArray", 0LL);
      id v11 = v51;
      if (v51 && [v51 count])
      {
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
        unsigned int v53 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoCarrierBundleID");
        uint64_t v54 = &kCFBundleIdentifierKey;
        if (!v53) {
          uint64_t v54 = &kCFBundleVersionKey;
        }
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:*v54]);
        if (v55) {
          [*(id *)(a1 + 40) setObject:v55 forKey:v7];
        }
      }

      goto LABEL_22;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDHubSuppliedSettingsID"))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 hubSuppliedSettings]);
      if (!v11) {
        goto LABEL_22;
      }
      uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSDictionary, v59);
      if ((objc_opt_isKindOfClass(v11, v60) & 1) == 0) {
        goto LABEL_22;
      }
      id v61 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"SettingsID"]);
      uint64_t v25 = v61;
      if (!v61 || ![v61 length]) {
        goto LABEL_21;
      }
      uint64_t v26 = *(void **)(a1 + 40);
      uint64_t v28 = @"SettingsID";
      uint64_t v27 = v25;
      goto LABEL_20;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDNetworkInterfacesEnabled"))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 32) fetchActiveNetworkInterface]));
      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v12 = @"MSDNetworkInterfacesEnabled";
      goto LABEL_4;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDCurrentWiFiSSID"))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v62 getCurrentWiFiSsid]);

      if (!v11) {
        goto LABEL_22;
      }
      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v12 = @"MSDCurrentWiFiSSID";
      goto LABEL_4;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDPersistentWiFiSSID"))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v63 getPersistentWiFiSsid]);

      if (!v11) {
        goto LABEL_22;
      }
      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v12 = @"MSDPersistentWiFiSSID";
      goto LABEL_4;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MinOSVersionAvailable"))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 minOSVersionAvailable]);
      if (!v11) {
        goto LABEL_22;
      }
LABEL_99:
      uint64_t v13 = *(void **)(a1 + 40);
      goto LABEL_40;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDApnsKey"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPushNotificationHandler sharedInstance]( &OBJC_CLASS___MSDPushNotificationHandler,  "sharedInstance"));
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 apsToken]);
      goto LABEL_98;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoSystemLanguage"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 getCurrentDeviceLanguage]);
      goto LABEL_98;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoSystemRegion"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 getCurrentDeviceRegion]);
      goto LABEL_98;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoPreferencesLanguage"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 getDemoPreferencesLanguage]);
      goto LABEL_98;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDDemoPreferencesRegion"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 getDemoPreferencesRegion]);
LABEL_98:
      id v11 = (void *)v65;

      if (!v11) {
        goto LABEL_22;
      }
      goto LABEL_99;
    }

    if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"IdleDuration"))
    {
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSystemMonitor sharedInstance](&OBJC_CLASS___MSDSystemMonitor, "sharedInstance"));
      id v70 = [v69 systemIdleDuration];

      uint64_t v41 = *(void **)(a1 + 40);
      uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v70));
    }

    else
    {
      if (!-[__CFString isEqualToString:](v7, "isEqualToString:", @"MSDTotalStorageAvailable"))
      {
        if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"UniqueDeviceID"))
        {
          uint64_t v72 = *(void **)(a1 + 40);
          v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) udid]);
          [v72 setObject:v73 forKey:v7];

          goto LABEL_23;
        }

        if (-[__CFString isEqualToString:](v7, "isEqualToString:", @"xRyzf9zFE/ycr/wJPweZvQ"))
        {
          id v11 = (void *)MGCopyAnswer(@"xRyzf9zFE/ycr/wJPweZvQ", 0LL);
          if (!v11) {
            goto LABEL_22;
          }
          uint64_t v13 = *(void **)(a1 + 40);
          uint64_t v12 = @"InternationalMobileEquipmentIdentity2";
          goto LABEL_4;
        }

        unsigned int v74 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"PartNumber");
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
        unsigned int v76 = [v75 isNPIDevice];

        if (v74)
        {
          if (v76)
          {
            id v77 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v77 getMaskValueForKey:v7]);
          }

          else
          {
            id v77 = (void *)MGCopyAnswer(@"ModelNumber", 0LL);
            id v79 = (void *)MGCopyAnswer(@"RegionInfo", 0LL);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v77 stringByAppendingString:v79]);
          }

          goto LABEL_35;
        }

        if (!v76
          || (v78 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance")),
              id v11 = (void *)objc_claimAutoreleasedReturnValue([v78 getMaskValueForKey:v7]),
              v78,
              !v11))
        {
          id v11 = (void *)MGCopyAnswer(v7, 0LL);
          if (!v11) {
            goto LABEL_23;
          }
        }

        goto LABEL_99;
      }

      uint64_t v71 = (const __CFDictionary *)MGCopyAnswer(@"DiskUsage", 0LL);
      if (!v71) {
        goto LABEL_23;
      }
      uint64_t v80 = 0LL;
      sub_100066784(v71, kMGQDiskUsageTotalDataAvailable, &v80);
      uint64_t v41 = *(void **)(a1 + 40);
      uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v80));
    }

CFNumberRef sub_100066784(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    uint64_t result = (const __CFNumber *)CFNumberGetTypeID();
    if ((const __CFNumber *)v6 == result) {
      return (const __CFNumber *)CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
    }
  }

  return result;
}

void sub_100068D24(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v3));

  if ([v4 isDeletable])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v5 addObject:v6];
  }
}

void sub_100068EFC(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  LODWORD(v3) = [v3 containsObject:v4];

  uint64_t v5 = v10;
  if ((_DWORD)v3)
  {
    CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));

    if ([v7 isInstalled] && (objc_msgSend(v7, "isPlaceholder") & 1) == 0)
    {
      int v8 = *(void **)(a1 + 40);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
      [v8 addObject:v9];
    }

    uint64_t v5 = v10;
  }
}

void sub_100069354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100069390(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  LODWORD(v4) = [v4 containsObject:v5];

  if ((_DWORD)v4)
  {
    CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));

    if ([v7 isInstalled] && (objc_msgSend(v7, "isPlaceholder") & 1) == 0)
    {
      int v8 = *(void **)(a1 + 32);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
      [v8 removeObject:v9];

      id v10 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "System app %{public}@ has been installed.",  (uint8_t *)&v13,  0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
    }
  }
}

id sub_10006AC18(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
  [v2 evaluateStoreStatusAgainstCurrentTime];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
  [v3 setupStoreOpenCloseTimers];

  id result = [*(id *)(a1 + 32) isContentFrozen];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) setupSnapshotRevertTimer];
  }
  return result;
}

id sub_10006AC90(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStoreOpenNotification];
}

id sub_10006AC98(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStoreClosedNotification];
}

void sub_10006ACDC(id a1)
{
  id v1 = sub_10003A95C();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "It's time to submit CoreAnalytics logs!",  v5,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v3 rollOverCoreAnalyticsLogs];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v4 uploadCoreAnalyticsLogs];
}

void sub_10006AE00(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained caLogsUploadTimer]);

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 caLogsUploadTimer]);
    [v7 invalidate];

    id v8 = objc_loadWeakRetained(v3);
    [v8 setCaLogsUploadTimer:0];
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    [v9 caLogsUploadInterval];
    double v11 = v10;

    if (v11 <= 0.0) {
      double v11 = 7200.0;
    }
  }

  else
  {
    double v11 = 7200.0;
  }

  id v12 = sub_10003A95C();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134217984;
    double v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CoreAnalytics logs upload timer interval set to: %f (seconds)",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v14 = objc_alloc(&OBJC_CLASS___NSTimer);
  id v15 = objc_loadWeakRetained(v3);
  id v16 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v14,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v2,  v15,  "caLogsUploadTimerHandler:",  0LL,  1LL,  v11);
  id v17 = objc_loadWeakRetained(v3);
  [v17 setCaLogsUploadTimer:v16];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v19 = objc_loadWeakRetained(v3);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 caLogsUploadTimer]);
  [v18 addTimer:v20 forMode:NSDefaultRunLoopMode];
}

void sub_10006B0FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10006B110(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "It's time for snapshot revert!", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained revertSnapshot];
}

void sub_10006B218(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshotRevertTimer]);

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshotRevertTimer]);
    [v7 invalidate];

    id v8 = objc_loadWeakRetained(v3);
    [v8 setSnapshotRevertTimer:0];
  }

  id v9 = objc_loadWeakRetained(v3);
  unsigned int v10 = [v9 allowSnapshotRevertTimer];

  if (v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v2 nextContentRevertDate]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    unsigned int v13 = [v11 isEqualToDate:v12];

    if (v13)
    {
      id v14 = sub_10003A95C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Disable snapshot revert timer for the near future.",  (uint8_t *)&v25,  2u);
      }
    }

    else
    {
      id v16 = objc_alloc(&OBJC_CLASS___NSTimer);
      id v17 = objc_loadWeakRetained(v3);
      uint64_t v18 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v16,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v11,  v17,  "snapshotRevertTimerHandler:",  0LL,  0LL,  0.0);
      id v19 = objc_loadWeakRetained(v3);
      [v19 setSnapshotRevertTimer:v18];

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      id v21 = objc_loadWeakRetained(v3);
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 snapshotRevertTimer]);
      [v20 addTimer:v22 forMode:NSDefaultRunLoopMode];

      id v23 = sub_10003A95C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 toString]);
        int v25 = 138543362;
        uint64_t v26 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Periodic snapshot revert timer scheduled: %{public}@",  (uint8_t *)&v25,  0xCu);
      }
    }
  }
}

void sub_10006B5B0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    id v3 = sub_10003A95C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10009C5E8();
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    [v5 sendHeartbeatEvent];

    xpc_activity_set_state(v2, 5LL);
  }
}

id sub_10006BB9C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) waitForCommandTimer]);
  [v2 invalidate];

  return [*(id *)(a1 + 32) setWaitForCommandTimer:0];
}

void sub_10006BC30(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006BCBC;
  v3[3] = &unk_1000FA6A0;
  v3[4] = *(void *)(a1 + 32);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v3,  300.0));
  [*(id *)(a1 + 32) setWaitForCommandTimer:v2];
}

id sub_10006BCBC(uint64_t a1)
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Didn't receive a valid command within given time, go to demo mode now.",  v5,  2u);
  }

  [*(id *)(a1 + 32) setWaitingForCommand:0];
  [*(id *)(a1 + 32) setWaitForCommandTimer:0];
  return [*(id *)(a1 + 32) lockSnapshot];
}

uint64_t sub_10006BEAC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006BF38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10006C7F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10006C83C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10006C84C(uint64_t a1)
{
}

id sub_10006C854(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) fetchActiveNetworkInterface];
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Found active network interfaces: %lu",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(*(void *)(a1[4] + 8) + 40) signal];
  return [*(id *)(*(void *)(a1[4] + 8) + 40) unlock];
}

void sub_10006CA20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10006CA40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied)
  {
    unsigned __int32 v4 = nw_interface_get_type(v3) - 1;
    if (v4 <= 2) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= qword_1000BD7B8[v4];
    }
  }

  return 1LL;
}

void sub_10006EB38(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDWiFiHelper);
  id v2 = (void *)qword_100125518;
  qword_100125518 = (uint64_t)v1;
}

id sub_10006FD08(uint64_t a1, void *a2)
{
  id result = [a2 type];
  if (result == (id)10)
  {
    id v4 = sub_10003A95C();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Wifi interface is now initialized. Should be safe to proceed..",  v6,  2u);
    }

    [*(id *)(a1 + 32) lock];
    [*(id *)(a1 + 32) signal];
    return [*(id *)(a1 + 32) unlock];
  }

  return result;
}

void sub_1000706C0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDLanguageAndRegionHelper);
  id v2 = (void *)qword_100125528;
  qword_100125528 = (uint64_t)v1;
}

void sub_10007104C(_Unwind_Exception *a1)
{
}

uint64_t sub_100071090(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000710A0(uint64_t a1)
{
}

void sub_1000710A8(uint64_t a1, void *a2, const char *a3, _BYTE *a4)
{
  uint64_t v7 = a2;
  id v8 = objc_autoreleasePoolPush();
  id v9 = (char *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifest getComponentFromPath:forManifestVersion:]( &OBJC_CLASS___MSDSignedManifest,  "getComponentFromPath:forManifestVersion:",  v7,  *(void *)(a1 + 32)));
  id v10 = sub_10003A95C();
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v63 = a3;
    __int16 v64 = 2114;
    uint64_t v65 = v7;
    __int16 v66 = 2114;
    uint64_t v67 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%lu] Building component for signed manifest item: %{public}@(%{public}@)",  buf,  0x20u);
  }

  if (!v9)
  {
    uint64_t v26 = 0LL;
    unsigned int v13 = 0LL;
    goto LABEL_53;
  }

  if (![*(id *)(a1 + 40) getComponentProgressStatus:v9])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) signedManifest]);
    unsigned int v18 = [v17 isItemBackup:v7];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) signedManifest]);
    id v20 = v19;
    if (v18)
    {
      unsigned int v21 = [v19 isItemDeviceSettings:v9];

      if (v21)
      {
        id v22 = sub_10003A95C();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[MSDComponentBuilder buildComponentsFromManifest]_block_invoke";
          __int16 v64 = 2114;
          uint64_t v65 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s - building settings dict for component %{public}@",  buf,  0x16u);
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildSettingsOperationWithIdentifier:v9]);
      }

      else
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildBackupOperationsWithPath:v7 andIndex:a3]);
      }
    }

    else
    {
      unsigned int v25 = [v19 isItemSystemAppData:v7];

      if (v25)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildSystemAppOperationsWithIdentifier:v9]);
      }

      else
      {
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) signedManifest]);
        unsigned int v43 = [v42 isItemApp:v7];

        if (v43)
        {
          unsigned __int8 v44 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) appItemToDefer]);
          unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( objc_msgSend( v44,  "buildAppOperationsWithIdentifier:shouldDeferApp:",  v9,  objc_msgSend(v45, "isEqualToString:", v9)));

          if (([*(id *)(a1 + 48) forBackgroundDownload] & 1) == 0
            && [*(id *)(a1 + 56) containsObject:v9]
            && ([v9 isEqualToString:@"com.apple.ist.windward"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.demoloop"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.DigitalSignage.iOS"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.dast"] & 1) == 0)
          {
            id v46 = sub_10003A95C();
            uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v63 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Building remove operations for app: %{public}@",  buf,  0xCu);
            }

            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildAppRemovalOperationsWithIdentifier:v9]);
            if (!v26) {
              goto LABEL_53;
            }
            goto LABEL_18;
          }

LABEL_53:
          id v52 = sub_10003A95C();
          unsigned int v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            sub_10009CDDC(v53, v54, v55, v56, v57, v58, v59, v60);
          }

          *a4 = 1;
          *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
          goto LABEL_32;
        }

        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) signedManifest]);
        unsigned int v49 = [v48 isItemConfigurationProfile:v7];

        id v50 = sub_10003A95C();
        unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        BOOL v51 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (!v49)
        {
          if (!v51) {
            goto LABEL_33;
          }
          *(_WORD *)buf = 0;
          id v14 = "Ignore unrecognized item in signed manifest.";
          id v15 = v13;
          uint32_t v16 = 2;
          goto LABEL_7;
        }

        if (v51)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Building config profile operation.",  buf,  2u);
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildConfigurationProfileOperationsWithIdentifier:v9]);
      }
    }

    unsigned int v13 = (os_log_s *)v24;
    goto LABEL_17;
  }

  id v12 = sub_10003A95C();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v63 = v9;
    id v14 = "Skip already processed component: %{public}@";
    id v15 = v13;
    uint32_t v16 = 12;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }

CFStringRef sub_100071A4C(unsigned __int8 *a1)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
}

unsigned __int8 *sub_100071B48(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  id v4 = sub_100071BA8(a2);
  uint64_t v5 = v4;
  if (v4)
  {
    id v4 = sub_100071BA8(a3);
    if (v4)
    {
      for (uint64_t i = 0LL; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }

  free(v4);
  return v5;
}

unsigned __int8 *sub_100071BA8(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    id v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
    LOBYTE(v17.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    id v4 = &v17;
    CC_LONG Length = 1;
LABEL_10:
    CC_SHA1(v4, Length, v3);
    return v3;
  }

  if (v2 != CFStringGetTypeID())
  {
    if (v2 == CFDateGetTypeID())
    {
      id v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      *(void *)&v17.h0 = CFDateGetAbsoluteTime((CFDateRef)a1);
      id v4 = &v17;
      CC_LONG Length = 8;
      goto LABEL_10;
    }

    if (v2 == CFDataGetTypeID())
    {
      id v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      CC_LONG Length = CFDataGetLength((CFDataRef)a1);
      id v4 = (CC_SHA1_CTX *)BytePtr;
      goto LABEL_10;
    }

    if (v2 == CFArrayGetTypeID())
    {
      if (CFArrayGetCount((CFArrayRef)a1))
      {
        if (!sub_10007239C((const __CFArray *)a1))
        {
          id v3 = (unsigned __int8 *)sub_100071BA8(@"array");
          CC_SHA1_Init(&v17);
          if (CFArrayGetCount((CFArrayRef)a1) >= 1)
          {
            CFIndex v12 = 0LL;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v12);
              id v14 = (unsigned __int8 *)sub_100071BA8(ValueAtIndex);
              if (!v14) {
                break;
              }
              id v15 = v14;
              CC_SHA1_Update(&v17, v14, 0x14u);
              CC_SHA1_Final(v15, &v17);
              if (v3)
              {
                for (uint64_t i = 0LL; i != 20; ++i)
                  v3[i] ^= v15[i];
              }

              free(v15);
              ++v12;
            }

            while (CFArrayGetCount((CFArrayRef)a1) > v12);
          }

          return v3;
        }

        id v9 = sub_10003A95C();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17.h0) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failing to hash due to duplicate array entries",  (uint8_t *)&v17,  2u);
        }
      }
    }

    else
    {
      if (v2 == CFDictionaryGetTypeID()) {
        return (unsigned __int8 *)sub_100072198((const __CFDictionary *)a1);
      }
      if (v2 == CFNumberGetTypeID()) {
        return sub_1000722EC((const __CFNumber *)a1);
      }
    }

    return 0LL;
  }

  id v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  size_t v6 = CFStringGetLength(a1) + 1;
  uint64_t v7 = (char *)calloc(1uLL, v6);
  CFStringGetCString(a1, v7, v6, 0x8000100u);
  CC_SHA1(v7, v6, v3);
  free(v7);
  return v3;
}

CFDataRef sub_100071E58( const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, float, float), uint64_t a6)
{
  if (CFStringCompare(theString1, @"SHA-1", 0LL) == kCFCompareEqualTo)
  {
    unsigned int v21 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v21)
    {
      id v34 = sub_10003A95C();
      CFIndex v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10009CE44((uint64_t)a2, v12);
      }
      goto LABEL_4;
    }

    id v22 = v21;
    id v23 = CFReadStreamCreateWithFile(a1, v21);
    if (!v23)
    {
      id v35 = sub_10003A95C();
      unsigned int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10009CEB4();
      }

      CFDataRef v20 = 0LL;
      goto LABEL_40;
    }

    uint64_t v24 = v23;
    if (CFReadStreamOpen(v23))
    {
      if (a5) {
        a5(a6, 0.0, -1.0);
      }
      CC_SHA1_Init(&c);
      unsigned int v25 = (UInt8 *)calloc(1uLL, 0x10000uLL);
      if (v25)
      {
        uint64_t v26 = v25;
        gettimeofday(&v59, 0LL);
        CFIndex v27 = CFReadStreamRead(v24, v26, 0x10000LL);
        if (v27 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          CFDataRef v32 = CFDataCreate(a1, md, 20LL);
          if (v32)
          {
            CFDataRef v20 = v32;
            CFStringRef v33 = sub_100071A4C(md);
            if (v33) {
              CFRelease(v33);
            }
            if (a5) {
              a5(a6, 1.0, -1.0);
            }
            goto LABEL_38;
          }

          id v47 = sub_10003A95C();
          uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10009CFA4(v48, v49, v50, v51, v52, v53, v54, v55);
          }
        }

        else
        {
          CFIndex v28 = v27;
          uint64_t v29 = 0LL;
          while (1)
          {
            CC_SHA1_Update(&c, v26, v28);
            v29 += v28;
            v30.n128_u32[0] = -1.0;
            if (a4) {
              v30.n128_f32[0] = (float)v29 / (float)a4;
            }
            if (a5)
            {
              int v31 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v30, -1.0);
              if (v31) {
                break;
              }
            }

            CFIndex v28 = CFReadStreamRead(v24, v26, 0x10000LL);
            if (v28 <= 0) {
              goto LABEL_18;
            }
          }

          int v56 = v31;
          id v57 = sub_10003A95C();
          uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10009CFD4(v56, v48);
          }
        }

        CFDataRef v20 = 0LL;
LABEL_38:
        free(v26);
        goto LABEL_39;
      }

      id v39 = sub_10003A95C();
      unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10009CF74(v38, v40, v41, v42, v43, v44, v45, v46);
      }
    }

    else
    {
      id v37 = sub_10003A95C();
      unsigned __int8 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10009CF14();
      }
    }

    CFDataRef v20 = 0LL;
LABEL_39:
    CFReadStreamClose(v24);
    CFRelease(v24);
LABEL_40:
    CFRelease(v22);
    return v20;
  }

  id v11 = sub_10003A95C();
  CFIndex v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10009D044(v12, v13, v14, v15, v16, v17, v18, v19);
  }
LABEL_4:

  return 0LL;
}

uint64_t sub_100072198(const __CFDictionary *a1)
{
  if (!CFDictionaryGetCount(a1)) {
    return 0LL;
  }
  uint64_t v2 = sub_100071BA8(@"dictionary");
  int64_t Count = CFDictionaryGetCount(a1);
  id v4 = (const void **)calloc(Count, 8uLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0LL);
  if (Count >= 1)
  {
    for (uint64_t i = 0LL; i != Count; ++i)
    {
      size_t v6 = (void *)sub_100071BA8(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      id v8 = (void *)sub_100071BA8(Value);
      CC_SHA1_Init(&v12);
      id v9 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }

      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }

      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (uint64_t j = 0LL; j != 20; ++j)
          *(_BYTE *)(v2 + j) ^= v9[j];
      }

      free(v9);
    }
  }

  free(v4);
  return v2;
}

unsigned __int8 *sub_1000722EC(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  else {
    size_t v3 = 4LL;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  uint64_t v5 = calloc(1uLL, v3);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t sub_10007239C(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0LL;
    v7.size_t length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2) {
      break;
    }
    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return 1LL;
}

void sub_100072454(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___MSDNPIMaskValues);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v2 = -[MSDNPIMaskValues initWithPreferencesFile:](v1, "initWithPreferencesFile:", v4);
  CFIndex v3 = (void *)qword_100125538;
  qword_100125538 = (uint64_t)v2;
}

LABEL_30:
  return v12;
}

LABEL_40:
    id v47 = 0LL;
    uint64_t v40 = 0LL;
LABEL_46:
    unsigned __int8 v38 = 0LL;
    CFIndex v27 = 0LL;
    uint64_t v46 = 0LL;
    uint64_t v41 = v72;
    goto LABEL_27;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  unsigned int v25 = [v24 getAppType:v6];

  if ((unint64_t)v25 >= 3)
  {
    id v57 = sub_10003A95C();
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v75 = v25;
      int v56 = "Received unknown value for app type: %lu";
      goto LABEL_39;
    }

    goto LABEL_40;
  }

  uint64_t v26 = v18;
  CFIndex v27 = objc_alloc_init(&OBJC_CLASS___MSDInstallableFileContext);
  -[MSDOperationContext setIdentifier:](v27, "setIdentifier:", v6);
  CFIndex v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 originServerForApp:v6]);
  -[MSDInstallableFileContext setOriginServer:](v27, "setOriginServer:", v29);

  __n128 v30 = (void *)objc_claimAutoreleasedReturnValue([v23 hexStringRepresentation]);
  -[MSDInstallableFileContext setFileHash:](v27, "setFileHash:", v30);

  -[MSDInstallableFileContext setFileType:](v27, "setFileType:", 0LL);
  -[MSDInstallableFileContext setUniqueIdentifier:](v27, "setUniqueIdentifier:", v73);
  -[MSDInstallableFileContext setCurrentUniqueIdentifier:](v27, "setCurrentUniqueIdentifier:", 0LL);
  -[MSDInstallableFileContext setUseDiffPatch:](v27, "setUseDiffPatch:", 0LL);
  -[MSDInstallableFileContext setAlreadyInstalled:](v27, "setAlreadyInstalled:", 0LL);
  -[MSDInstallableFileContext setPricingAppUpdateDeferred:](v27, "setPricingAppUpdateDeferred:", v4);
  -[MSDInstallableFileContext setVerifyFileHash:]( v27,  "setVerifyFileHash:",  -[MSDOperationBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));
  int v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  -[MSDInstallableFileContext setDeleteInstallableFileAfterInstall:]( v27,  "setDeleteInstallableFileAfterInstall:",  [v31 isOfflineMode] ^ 1);

  CFDataRef v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  CFStringRef v33 = (void *)objc_claimAutoreleasedReturnValue([v32 getAppRealSize:v6]);
  id v34 = [v33 unsignedLongLongValue];

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBuilder signedManifest](self, "signedManifest"));
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v35 getAppFileSize:v6]);
  id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v36 unsignedLongLongValue]
                  + (void)v34
  -[MSDOperationContext setDiskSpacedRequired:](v27, "setDiskSpacedRequired:", v37);

  unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"MSDApplicationFilePrepareOperation",  @"MSDApplicationFileDownloadOperation",  0LL));
  if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload"))
  {
    id v39 = &off_1000FA188;
    if (v25 != (id)2) {
      id v39 = &off_1000FA190;
    }
    [v38 addObject:*v39];
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder sequentialGroupForIdentifiers:andContext:]( self,  "sequentialGroupForIdentifiers:andContext:",  v38,  v27));
  uint64_t v41 = v72;
  uint64_t v18 = v26;
  if (v40)
  {
    if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload") && v26) {
      [v40 addDependency:v26];
    }
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 operations]);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 allObjects]);
    -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v43);

    if (([v6 isEqualToString:@"com.retailtech.arkenstone"] & 1) != 0
      || ([v6 isEqualToString:@"com.apple.ist.windward"] & 1) != 0
      || [v6 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"])
    {
      uint64_t v44 = sub_10003A95C();
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Skipping updating app data for %{public}@ as requested.",  buf,  0xCu);
      }

      uint64_t v46 = v72;
      id v47 = 0LL;
    }

    else
    {
      uint64_t v49 = objc_claimAutoreleasedReturnValue( -[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:]( self,  "buildAppDataOperationsWithIdentifier:andDependencies:",  v6,  v71));
      if (v49)
      {
        id v47 = (void *)v49;
        if (!-[MSDOperationBuilder forBackgroundDownload](self, "forBackgroundDownload")) {
          [v47 addDependency:v40];
        }
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v47 operations]);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 allObjects]);
        -[NSMutableArray addObjectsFromArray:](v72, "addObjectsFromArray:", v51);

        uint64_t v41 = v72;
        uint64_t v46 = v72;
      }

      else
      {
        uint64_t v60 = sub_10003A95C();
        unsigned int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10009D6DC(v61, v62, v63, v64, v65, v66, v67, v68);
        }

        id v47 = 0LL;
        uint64_t v46 = 0LL;
      }
    }

    uint64_t v18 = v26;
  }

  else
  {
    id v47 = 0LL;
    uint64_t v46 = 0LL;
  }

LABEL_57:
  return v49;
}

        if ((v18 & 1) == 0)
        {
LABEL_60:
          uint64_t v17 = 1;
          goto LABEL_61;
        }

        int v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
        uint64_t v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 demoUpdateQueue]);
        dispatch_async(v51, &stru_1000FA8A0);

LABEL_59:
        goto LABEL_60;
      }

      if ([v5 isEqualToString:@"UpdateOS"])
      {
        CFDataRef v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
        uint64_t v17 = 1;
        [v32 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

        CFStringRef v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v33 saveOSUpdateRequest:v4];

        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v34 setWaitingForCommand:0];

        -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0LL);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v35 switchModeImmediately:7];

        unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
        id v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v36 demoUpdateQueue]);
        dispatch_async(v37, &stru_1000FA8C0);

LABEL_38:
LABEL_61:
        uint64_t v13 = v118;
LABEL_62:

        goto LABEL_63;
      }

      if ([v5 isEqualToString:@"Restart"])
      {
        int v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v31 reboot];
        goto LABEL_59;
      }

      if ([v5 isEqualToString:@"TurnSnapshotON"])
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v48 setWaitingForCommand:0];

        -[MSDMailProcessor setWaitingForCommand:](self, "setWaitingForCommand:", 0LL);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        uint64_t v50 = [v49 lockSnapshot];
        goto LABEL_70;
      }

      if ([v5 isEqualToString:@"TurnSnapshotOFF"])
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        uint64_t v50 = [v49 unlockSnapshot];
        goto LABEL_70;
      }

      if ([v5 isEqualToString:@"RevertSnapshot"])
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        uint64_t v50 = [v49 revertSnapshot];
        goto LABEL_70;
      }

      if ([v5 isEqualToString:@"Virgin"])
      {
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ObliterateDevice"]);
        uint64_t v54 = [v53 BOOLValue];

        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PreserveESim"]);
        int v56 = [v55 BOOLValue];

        id v57 = sub_10003A95C();
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v122[0]) = (_DWORD)v54;
          WORD2(v122[0]) = 1024;
          *(_DWORD *)((char *)v122 + 6) = (_DWORD)v56;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Unenrolling device with obliteration: %{BOOL}d and preserve eSim: %{BOOL}d",  buf,  0xEu);
        }

        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        uint64_t v50 = [v49 unenrollWithObliteration:v54 preserveESim:v56 callUnregister:0 preserveDDLFlag:0];
LABEL_70:
        timeval v59 = v50;

        if ((v59 & 1) != 0) {
          goto LABEL_60;
        }
        goto LABEL_71;
      }

      if ([v5 isEqualToString:@"ChangeSettings"])
      {
        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        unsigned int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 hubSuppliedSettings]);

        v62 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Settings"]);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        [v63 saveHubSuppliedSettings:v62];

        __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v61, "objectForKey:", @"StoreHours"));
        uint64_t v65 = objc_claimAutoreleasedReturnValue([v62 objectForKey:@"StoreHours"]);
        v114 = (void *)v65;
        v115 = v64;
        if (v65)
        {
          uint64_t v67 = (void *)v65;
          id v68 = objc_opt_class(&OBJC_CLASS___NSArray, v66);
          if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0
            && [v67 count]
            && ([v64 isEqualToArray:v67] & 1) == 0)
          {
            uint64_t v69 = sub_10003A95C();
            id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v122[0] = "-[MSDMailProcessor processRequest:]";
              _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "%s - ChangeSettings has new 'StoreHours' set.",  buf,  0xCu);
            }

            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            [v71 refreshStoreHoursManagerUsingSettings];

            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
            v73 = [v72 isContentFrozen];

            if (v73)
            {
              unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
              [v74 setupSnapshotRevertTimer];
            }
          }
        }

        unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:@"PingFrequency"]);
        if (v76)
        {
          id v77 = objc_opt_class(&OBJC_CLASS___NSNumber, v75);
          if ((objc_opt_isKindOfClass(v76, v77) & 1) != 0)
          {
            if ([v76 unsignedIntegerValue])
            {
              v78 = [v76 unsignedIntegerValue];
              if (v78 != (id)-[MSDMailProcessor pingInterval](self, "pingInterval"))
              {
                id v79 = sub_10003A95C();
                uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v122[0] = "-[MSDMailProcessor processRequest:]";
                  _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "%s - ChangeSettings has new 'PingFrequency' set.",  buf,  0xCu);
                }

                -[MSDMailProcessor setPingInterval:]( self,  "setPingInterval:",  -[MSDMailProcessor pingIntervalToUse](self, "pingIntervalToUse"));
              }
            }
          }
        }

        v113 = v76;
        v117 = v62;
        unsigned __int8 v82 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:@"DeviceOptions"]);
        if (!v82
          || (uint64_t v83 = objc_opt_class(&OBJC_CLASS___NSDictionary, v81), (objc_opt_isKindOfClass(v82, v83) & 1) == 0)
          || (uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device")),
              uint64_t v85 = [v84 updateDeviceOptions:v82 skipImutableKeys:1],
              v84,
              v85))
        {
          uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v61, "objectForKey:", @"FeatureFlags", v61));
          v88 = (void *)objc_claimAutoreleasedReturnValue([v117 objectForKey:@"FeatureFlags"]);
          if (v88)
          {
            id v89 = objc_opt_class(&OBJC_CLASS___NSDictionary, v87);
            if ((objc_opt_isKindOfClass(v88, v89) & 1) != 0
              && ([v86 isEqualToDictionary:v88] & 1) == 0)
            {
              id v90 = sub_10003A95C();
              v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
              if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v122[0] = "-[MSDMailProcessor processRequest:]";
                _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "%s - ChangeSettings has new 'FeatureFlags' set.",  buf,  0xCu);
              }

              id v92 = (void *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
              [v92 processNewFeatureFlags:v88 oldFeatureFlags:v86];
            }
          }

          goto LABEL_60;
        }
      }

      else
      {
        if ([v5 isEqualToString:@"StopBackgroundDownload"])
        {
          int v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDBackgroundDownload sharedInstance](&OBJC_CLASS___MSDBackgroundDownload, "sharedInstance"));
          [v31 quitBackgroundDownload];
          goto LABEL_59;
        }

        uint64_t v93 = sub_10003AA3C();
        v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
          sub_10009F2D4(v94, v95, v96, v97, v98, v99, v100, v101);
        }

        unsigned int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDMailProcessor device](self, "device"));
        -[os_log_s deleteOperationRequest](v61, "deleteOperationRequest");
      }
    }

    else
    {
      v104 = sub_10003AA3C();
      unsigned int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_10009F304(v61, v105, v106, v107, v108, v109, v110, v111);
      }
    }

    uint64_t v13 = v118;
LABEL_110:

    goto LABEL_111;
  }

  uint64_t v17 = 1;
LABEL_63:

  return v17;
}

void sub_10007792C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoManifestCheck);
  uint64_t v2 = (void *)qword_100125550;
  qword_100125550 = (uint64_t)v1;
}

LABEL_50:
        id v22 = v130;
        id v39 = v129 + 1;
        timeval v59 = v150;
        unsigned int v36 = v40;
      }

      while ((id)(v129 + 1) != v127);
      v127 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v159,  v177,  16LL);
      if (!v127) {
        goto LABEL_54;
      }
    }
  }

  timeval v59 = v150;
LABEL_54:

  uint64_t v16 = v133;
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod")
    || !v136
    || (uint64_t v60 = v38 & 1, v60 == [v136 BOOLValue]))
  {
    if ((v38 & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_66;
  }

  unsigned int v61 = sub_10003A95C();
  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = [v136 BOOLValue];
    *(_DWORD *)buf = 136315650;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    v171 = 1024;
    *(_DWORD *)v172 = v60;
    *(_WORD *)&v172[4] = 1024;
    *(_DWORD *)&v172[6] = v63;
    _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d",  buf,  0x18u);
  }

  if ([v136 BOOLValue])
  {
LABEL_66:
    id v8 = v134;
    id v11 = v135;
    if (-[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:]( v59,  "secureManifestCheckForSegmentedManifest:options:",  v142,  v134))
    {
      goto LABEL_67;
    }

    v122 = v36;
    v123 = v37;
    v124 = v122;
    v125 = sub_10003A95C();
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10009DA64();
    }
    id v8 = v134;
    id v11 = v135;
    uint64_t v16 = v133;
    id v22 = v130;
    v126 = v124;
    id v37 = v123;
    unsigned int v36 = v126;
    goto LABEL_102;
  }

LABEL_60:
  __int16 v64 = sub_10003A95C();
  uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
  id v11 = v135;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%s: Skipping rigorous manifest testing.",  buf,  0xCu);
  }

  id v8 = v134;
LABEL_67:
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](v59, "blocklistedItems"));
  unsigned int v76 = [v75 count];

  if (!v76)
  {
    v119 = sub_10003A95C();
    id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "No items blocklisted, skip blocklist item exclusion",  buf,  2u);
    }

    goto LABEL_107;
  }

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  id v77 = (os_log_s *)v142;
  v78 = -[os_log_s countByEnumeratingWithState:objects:count:]( v77,  "countByEnumeratingWithState:objects:count:",  &v151,  v168,  16LL);
  if (!v78)
  {
LABEL_107:
    id v11 = v135;
    goto LABEL_108;
  }

  uint64_t v80 = v78;
  unsigned __int8 v81 = v37;
  unsigned __int8 v82 = *(void *)v152;
  do
  {
    for (uint64_t i = 0LL; i != v80; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v152 != v82) {
        objc_enumerationMutation(v77);
      }
      uint64_t v84 = *(void *)(*((void *)&v151 + 1) + 8LL * (void)i);
      uint64_t v85 = -[os_log_s objectForKey:ofType:]( v77,  "objectForKey:ofType:",  v84,  objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v79));
      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
      if (v86) {
        -[MSDDemoManifestCheck removeBlocklistedItemFromSection:withName:]( v150,  "removeBlocklistedItemFromSection:withName:",  v86,  v84);
      }
    }

    uint64_t v80 = -[os_log_s countByEnumeratingWithState:objects:count:]( v77,  "countByEnumeratingWithState:objects:count:",  &v151,  v168,  16LL);
  }

  while (v80);
  id v11 = v135;
  id v22 = v130;
  id v37 = v81;
  id v8 = v134;
  uint64_t v16 = v133;
LABEL_108:

LABEL_109:
  if (cf) {
    CFRelease(cf);
  }
  v118 = v142;
LABEL_112:

  return v118;
}

void sub_1000795D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100079604(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100079614(uint64_t a1)
{
}

void sub_10007961C(uint64_t a1, const __CFData *a2, uint64_t a3, _BYTE *a4)
{
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v6)
  {
    SecCertificateRef v18 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }

  else
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009E4F4(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0LL;

    *a4 = 1;
  }

void sub_100079E4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100079E80(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) containsObject:v10])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    _DWORD v11[2] = sub_100079F78;
    v11[3] = &unk_1000FA810;
    v11[4] = *(void *)(a1 + 40);
    id v8 = v10;
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v16 = v9;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    uint64_t v17 = a4;
    [v7 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void sub_100079F78(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) checkType]);
  if (v9) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) checkType]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RigorousCheckType"]);
  }
  uint64_t v11 = (char *)v10;

  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v7;
    __int16 v30 = 2114;
    int v31 = v14;
    __int16 v32 = 2114;
    CFStringRef v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@",  buf,  0x20u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getComponentData:v8]);
  if ([v11 isEqualToString:@"Skip"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }

  else if ([v11 isEqualToString:@"Default"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) runSecurityChecksForSection:v15 dataType :*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
  }

  else
  {
    if ([v11 isEqualToString:@"AppleISTCertCheck"])
    {
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  *(void *)(a1 + 40),  v7));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allowedISTSignedComponents]);
      unsigned int v18 = [v17 containsObject:v16];

      if (v18)
      {
        if ([v7 isEqualToString:*(void *)(a1 + 56)]
          && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 64)])
        {
          id v19 = sub_10003A95C();
          CFDataRef v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = (const char *)v16;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "About to run app layout checks for %{public}@",  buf,  0xCu);
          }

          unsigned __int8 v21 = [*(id *)(a1 + 32) runAppLayoutSecurityCheck:v15];
        }

        else
        {
          unsigned __int8 v21 = [*(id *)(a1 + 32) runSecurityChecksForSection:v15 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v21;
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
        id v24 = sub_10003A95C();
        unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10009E914();
        }
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v22 = sub_10003A95C();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        __int16 v30 = 2114;
        int v31 = v11;
        __int16 v32 = 2114;
        CFStringRef v33 = v7;
        __int16 v34 = 2114;
        uint64_t v35 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).",  buf,  0x2Au);
      }
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    id v26 = sub_10003A95C();
    CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10009E87C((uint64_t)v7, a1, v27);
    }

    *a4 = 1;
    **(_BYTE **)(a1 + 80) = 1;
  }
}

LABEL_78:
          uint64_t v40 = v96;
LABEL_79:
          id v19 = v82;
          uint64_t v44 = v98;
LABEL_80:

          objc_autoreleasePoolPop(context);
          id v68 = 4;
          uint64_t v69 = v40;
          uint64_t v10 = v84;
          goto LABEL_81;
        }

        uint64_t v50 = v49;
        int v100 = 0;
        uint64_t v51 = *(void *)v110;
        uint64_t v52 = v102;
        do
        {
          for (uint64_t i = 0LL; i != v50; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v110 != v51) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)i);
            if ([v52 rangeOfString:v54] != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
              int v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:v54]);

              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              id v57 = v56;
              uint64_t v58 = [v57 countByEnumeratingWithState:&v105 objects:v121 count:16];
              if (v58)
              {
                timeval v59 = v58;
                uint64_t v60 = self;
                unsigned int v61 = *(void *)v106;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v59; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v106 != v61) {
                      objc_enumerationMutation(v57);
                    }
                    if ([v48 rangeOfString:*(void *)(*((void *)&v105 + 1) + 8 * (void)j)] != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      int v100 = 1;
                      goto LABEL_49;
                    }
                  }

                  timeval v59 = [v57 countByEnumeratingWithState:&v105 objects:v121 count:16];
                  if (v59) {
                    continue;
                  }
                  break;
                }

LABEL_49:
                self = v60;
                uint64_t v52 = v102;
              }
            }
          }

          uint64_t v50 = [obja countByEnumeratingWithState:&v109 objects:v122 count:16];
        }

        while (v50);

        uint64_t v35 = v48;
        uint64_t v17 = v87;
        uint64_t v9 = v89;
        unsigned __int8 v38 = v90;
        id v37 = v91;
        if ((v100 & 1) == 0) {
          goto LABEL_77;
        }
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v98 valueForKey:@"NSFilePosixPermissions"]);
      __int16 v64 = (unsigned __int16)[v63 longValue];

      if ((v64 & 0xC00) != 0)
      {
        v75 = sub_10003A95C();
        unsigned int v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_10009EC04();
        }
        goto LABEL_78;
      }

      if ([v9 isEqualToString:v38])
      {
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
        __int16 v66 = [v65 handleSystemContainerFiles:v102 withMetadata:v97];

        if ((v66 & 1) == 0)
        {
          unsigned int v76 = sub_10003A95C();
          unsigned int v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_10009EBA4();
          }
          goto LABEL_78;
        }
      }

      objc_autoreleasePoolPop(context);
      id v39 = v94 + 1;
      uint64_t v40 = v96;
      uint64_t v41 = v98;
    }

    while ((id)(v94 + 1) != v93);
    uint64_t v67 = [v37 countByEnumeratingWithState:&v113 objects:v123 count:16];
    unsigned int v36 = v96;
    uint64_t v93 = v67;
    if (v67) {
      continue;
    }
    break;
  }

  id v68 = 0;
  id v19 = v82;
  uint64_t v10 = v84;
  uint64_t v44 = v98;
  uint64_t v69 = v96;
LABEL_81:

  if (v68 == 4)
  {
    id v8 = v19;
    uint64_t v11 = v85;
LABEL_83:
    uint64_t v72 = 0;
  }

  else
  {
    uint64_t v72 = 1;
    id v8 = v19;
    uint64_t v11 = v85;
  }

void sub_10007B9E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003A95C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Notification received for entitlement check for: %{public}@ %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  [*(id *)(a1 + 32) setItemBeingInstalled:v8];
}

void sub_10007CC84(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDMailProcessor);
  uint64_t v2 = (void *)qword_100125560;
  qword_100125560 = (uint64_t)v1;
}

void sub_10007D0EC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pingTimer]);

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pingTimer]);
    [v5 invalidate];
  }

  id v10 = objc_loadWeakRetained(v1);
  double v6 = (double)(unint64_t)[v10 pingInterval];
  id v7 = objc_loadWeakRetained(v1);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v7,  "handlePingTimerTicking:",  0LL,  1LL,  v6));
  id v9 = objc_loadWeakRetained(v1);
  [v9 setPingTimer:v8];
}

void sub_10007D400(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = sub_10003AA3C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ping and process command (if any)", buf, 2u);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pingWithType:*(void *)(a1 + 40)]);
  if (v6)
  {
    id v7 = sub_10003AA3C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received a request: %{public}@", buf, 0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 messageQueue]);
    __int16 v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    id v13 = sub_10007D5FC;
    id v14 = &unk_1000F94E0;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v6;
    dispatch_async(v10, &v11);
  }

  objc_msgSend( *(id *)(a1 + 32),  "setQueuedPingType:",  (unint64_t)objc_msgSend(*(id *)(a1 + 32), "queuedPingType", v11, v12, v13, v14, v15) & ~*(void *)(a1 + 40));

  objc_sync_exit(v3);
  objc_autoreleasePoolPop(v2);
}

void sub_10007D5D8(_Unwind_Exception *a1)
{
}

void sub_10007D5FC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) processRequest:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_10007EDE4(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
  unsigned __int8 v2 = [v1 updateDemoContent];

  if ((v2 & 1) == 0)
  {
    id v3 = sub_10003AA3C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10009F420(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

void sub_10007EE48(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[MSDOSUpdaterController sharedInstance](&OBJC_CLASS___MSDOSUpdaterController, "sharedInstance"));
  [v1 startOSUpdate];
}

void sub_10007F7FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10007F824(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10003A95C();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009F5A4(a1, (uint64_t)v3, v5);
    }

    char v6 = 0;
  }

  else
  {
    char v6 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007FB70(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoUpdateStatusHub);
  unsigned __int8 v2 = (void *)qword_100125570;
  qword_100125570 = (uint64_t)v1;

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
  [(id)qword_100125570 setDelegates:v3];
}

void sub_10007FF8C(_Unwind_Exception *a1)
{
}

id sub_10007FFAC(uint64_t a1, void *a2, _BYTE *a3)
{
  id result = [a2 demoUpdateProgress:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_1000800CC(_Unwind_Exception *a1)
{
}

id sub_1000800E4(uint64_t a1, void *a2, _BYTE *a3)
{
  id result = [a2 demoUpdateCompleted:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_1000801EC(_Unwind_Exception *a1)
{
}

id sub_100080200(uint64_t a1, void *a2, _BYTE *a3)
{
  id result = [a2 demoUpdateFailed:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_100080D50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100080D90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100080DA0(uint64_t a1)
{
}

void sub_100080DA8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 userInfo]);
  id v4 = sub_10003A95C();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received completion notification with info: %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  char v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Result"]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Error"]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100081F68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100081F8C(uint64_t a1, void *a2)
{
  id v4 = a2;
  context = objc_autoreleasePoolPush();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupIntraComponentDependency:*(_BYTE *)(a1 + 48) == 0]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  CFDataRef v20 = v4;
  if (*(void *)(v6 + 40))
  {
    objc_msgSend(v4, "addInstallDependency:", context, v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  }

  objc_storeStrong((id *)(v6 + 40), a2);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v12, context));
        if (v14)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
          id v17 = sub_10003A95C();
          unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 component]);
            unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 component]);
            *(_DWORD *)buf = 138413058;
            CFIndex v28 = v15;
            __int16 v29 = 2112;
            __int16 v30 = v22;
            __int16 v31 = 2112;
            __int16 v32 = v16;
            __int16 v33 = 2112;
            __int16 v34 = v21;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Setting up inter-operation dependency: %@(%@) -> %@(%@)",  buf,  0x2Au);
          }

          [v15 addDependency:v16];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }

    while (v9);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v7];
  objc_autoreleasePoolPop(context);
}

void sub_1000830B4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observer]);
  [v2 operation:*(void *)(a1 + 32) didProduceNewOperation:*(void *)(a1 + 40) forRollback:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10008359C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDProgressUpdater);
  id v2 = (void *)qword_100125580;
  qword_100125580 = (uint64_t)v1;
}

void sub_1000847EC(id a1, MSDServerResponse *a2)
{
  id v2 = a2;
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerResponse error](v2, "error"));
    int v6 = 136315394;
    id v7 = "-[MSDProgressUpdater demoUpdateCompleted:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: sent done status to hub; error=%{public}@",
      (uint8_t *)&v6,
      0x16u);
  }
}

void sub_1000849AC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDUIHelper);
  id v2 = (void *)qword_100125590;
  qword_100125590 = (uint64_t)v1;
}

void sub_100084B38(_Unwind_Exception *a1)
{
}

void sub_100084B4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "App providing UI checking out or app terminated.",  v19,  2u);
    }

    uint64_t v18 = *(void *)(a1 + 40);
    id v17 = *(id *)(v18 + 16);
    *(void *)(v18 + 16) = 0LL;
    goto LABEL_11;
  }

  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App providing UI checking in.", buf, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 16LL), *(id *)(a1 + 32));
  int v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v6);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingMessage]);

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    uint64_t v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v9 connection]);
    id v11 = objc_loadWeakRetained(v6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pendingMessage]);
    xpc_connection_send_message(v10, v12);

    id v13 = objc_loadWeakRetained(v6);
    [v13 setPendingMessage:0];
  }

  id v14 = objc_loadWeakRetained(v6);
  unsigned int v15 = [v14 fullScreenState];

  if (v15 == 1)
  {
    id v16 = objc_loadWeakRetained(v6);
    [v16 setFullScreenState:2];

    id v17 = objc_loadWeakRetained(v6);
    [v17 activateFullScreenUIAppMonitor];
LABEL_11:
  }

void sub_100084DE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100084DF4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained fullScreenState];

  if (!v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setMessage:v8];

    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    id v11 = objc_loadWeakRetained(v2);
    [v11 setAllowCancel:v10];

    uint64_t v12 = *(unsigned __int8 *)(a1 + 49);
    id v13 = objc_loadWeakRetained(v2);
    [v13 setDisableIdleTimer:v12];

    id v14 = objc_loadWeakRetained(v2);
    [v14 setPendingMessage:0];

    id v18 = objc_loadWeakRetained(v2);
    [v18 requestFullScreenUI];
LABEL_6:

    return;
  }

  id v5 = objc_loadWeakRetained(v2);
  unsigned int v6 = [v5 allowCancel];
  int v7 = *(unsigned __int8 *)(a1 + 48);

  if (v7 != v6)
  {
    uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
    id v16 = objc_loadWeakRetained(v2);
    [v16 setAllowCancel:v15];

    id v18 = (id)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    id v17 = objc_loadWeakRetained(v2);
    objc_msgSend(v18, "demoUpdateAllowCancel:", objc_msgSend(v17, "allowCancel"));

    goto LABEL_6;
  }

void sub_100085020(_Unwind_Exception *a1)
{
}

void sub_100085034(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained fullScreenState];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setFullScreenState:0];

    id v6 = objc_loadWeakRetained(v2);
    [v6 setCurrentProgress:0];

    id v7 = objc_loadWeakRetained(v2);
    [v7 deactivateFullScreenUIAppMonitor];

    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    id v9 = v8;
    if (v8)
    {
      xpc_dictionary_set_string(v8, "ContentUpdateStatus", "Completed");
      if (*(void *)(a1 + 32))
      {
        id v10 = sub_10003A95C();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [*(id *)(a1 + 32) code];
          id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
          *(_DWORD *)buf = 134218242;
          id v32 = v12;
          __int16 v33 = 2114;
          __int16 v34 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending xpc message with error: %td:%{public}@",  buf,  0x16u);
        }

        xpc_dictionary_set_int64(v9, "ErrorCode", (int64_t)[*(id *)(a1 + 32) code]);
        id v14 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domain]);
        xpc_dictionary_set_string(v9, "ErrorDomain", (const char *)[v14 cStringUsingEncoding:4]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1000852D8;
        v29[3] = &unk_1000FAAB8;
        id v30 = v9;
        [v15 enumerateKeysAndObjectsUsingBlock:v29];
      }

      id v16 = objc_loadWeakRetained(v2);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 connection]);

      id v18 = (os_log_s *)objc_loadWeakRetained(v2);
      id v19 = v18;
      if (v17)
      {
        CFDataRef v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[os_log_s connection](v18, "connection"));
        xpc_connection_send_message(v20, v9);
      }

      else
      {
        -[os_log_s setPendingMessage:](v18, "setPendingMessage:", v9);
      }
    }

    else
    {
      id v21 = sub_10003A95C();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10009F8E4(v19, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }

void sub_1000852D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v11 = sub_10003A95C();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10009F954();
      }

      xpc_dictionary_set_string( *(xpc_object_t *)(a1 + 32), (const char *)[v5 cStringUsingEncoding:4], (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4));
    }
  }
}

void sub_100085454(_Unwind_Exception *a1)
{
}

void sub_100085468(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFullScreenState:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setCurrentProgress:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 deactivateFullScreenUIAppMonitor];
}

void sub_100085624( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100085640(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 1)
  {
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Timer triggered but still no UI checked in. Requesting blocking UI again...",  v7,  2u);
    }

    id v6 = objc_loadWeakRetained(v1);
    [v6 requestFullScreenUI];
  }

void sub_100085808( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100085824(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_1001062E8];
  [v3 setStateDescriptor:v4];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fullScreenUIAppId]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v6));
  id v11 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v3 setPredicates:v8];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000859B8;
  v9[3] = &unk_1000FAAE0;
  objc_copyWeak(&v10, a1);
  [v3 setUpdateHandler:v9];
  objc_destroyWeak(&v10);
}

void sub_10008599C(_Unwind_Exception *a1)
{
}

void sub_1000859B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  id v7 = [v6 taskState];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 endowmentNamespaces]);

  id v9 = [v11 containsObject:@"com.apple.frontboard.visibility"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFullScreenUIAppStateChange:v7 withVisibility:v9];
}

void sub_100085D10(_Unwind_Exception *a1)
{
}

void sub_100085D34(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 2)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 deactivateFullScreenUIAppMonitor];

    id v5 = objc_loadWeakRetained(v1);
    [v5 requestFullScreenUI];
  }

void sub_100085DBC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 2)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 launchFullScreenUI];

    id v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "demoUpdateProgress:", objc_msgSend(v5, "currentProgress"));
  }

void sub_100086204( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100086230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100086240(uint64_t a1)
{
}

void sub_100086248(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    uint64_t v12 = a2;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "StoreDemoViewService launch failed dismissalReason:%tu error:%{public}@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0LL;
}

void sub_1000863E8(_Unwind_Exception *a1)
{
}

void sub_1000863FC(uint64_t a1)
{
  uint64_t v44 = 0LL;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  id v47 = sub_100086230;
  uint64_t v48 = sub_100086240;
  id v49 = 0LL;
  id v2 = sub_10003A95C();
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "demoUpdateFailed(XPC) is called", buf, 2u);
  }

  id v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    id v26 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009F9B4(v17, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_10;
  }

  if ([v4 code] != (id)3727741185)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    id v6 = (void *)v45[5];
    v45[5] = (uint64_t)v5;

    id v7 = (void *)v45[5];
    if (v7)
    {
      xpc_dictionary_set_string(v7, "ContentUpdateStatus", "Error");
      xpc_dictionary_set_int64((xpc_object_t)v45[5], "ErrorCode", (int64_t)[*(id *)(a1 + 32) code]);
      uint64_t v8 = (void *)v45[5];
      id v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domain]);
      xpc_dictionary_set_string(v8, "ErrorDomain", (const char *)[v9 cStringUsingEncoding:4]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1000866C0;
      v42[3] = &unk_1000FAB58;
      v42[4] = &v44;
      [v10 enumerateKeysAndObjectsUsingBlock:v42];

      int v11 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained(v11);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained connection]);

      if (v13)
      {
        id v14 = objc_loadWeakRetained(v11);
        uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v14 connection]);
        xpc_connection_send_message(v15, (xpc_object_t)v45[5]);

        id v16 = sub_10003A95C();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_10009FA94(v17, v18, v19, v20, v21, v22, v23, v24);
        }
      }

      else
      {
        uint64_t v25 = v45[5];
        id v17 = (os_log_s *)objc_loadWeakRetained(v11);
        -[os_log_s setPendingMessage:](v17, "setPendingMessage:", v25);
      }
    }

    else
    {
      id v34 = sub_10003A95C();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10009FA24(v17, v35, v36, v37, v38, v39, v40, v41);
      }
    }

void sub_100086698( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000866C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v11 = sub_10003A95C();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10009F954();
      }

      xpc_dictionary_set_string( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (const char *)[v5 cStringUsingEncoding:4], (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4));
    }
  }
}

void sub_10008684C(_Unwind_Exception *a1)
{
}

void sub_100086860(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending a progress(XPC)", v28, 2u);
    }

    xpc_dictionary_set_string(v2, "ContentUpdateStatus", "Progress");
    xpc_dictionary_set_int64(v2, "Percentage", *(void *)(a1 + 40));
    id v6 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained connection]);

    id v9 = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v10 = v9;
    if (v8)
    {
      id v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v9 connection]);
      xpc_connection_send_message(v11, v2);

      id v12 = sub_10003A95C();
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        sub_10009FB34((os_log_s *)v10, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    else
    {
      [v9 setPendingMessage:v2];
    }

    uint64_t v20 = *(void *)(a1 + 40);
    id v5 = (os_log_s *)objc_loadWeakRetained(v6);
    -[os_log_s setCurrentProgress:](v5, "setCurrentProgress:", v20);
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10009FAC4(v5, v21, v22, v23, v24, v25, v26, v27);
  }
}

void sub_100086A7C(_Unwind_Exception *a1)
{
}

void sub_100086A90(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(a1 + 40);
      v27[0] = 67109120;
      v27[1] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending allowCancel(XPC): %d",  (uint8_t *)v27,  8u);
    }

    xpc_dictionary_set_string(v2, "ContentUpdateStatus", "AllowContentUpdateCancel");
    xpc_dictionary_set_BOOL(v2, "allowCancel", *(_BYTE *)(a1 + 40));
    uint64_t v7 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained connection]);

    uint64_t v10 = (os_log_s *)objc_loadWeakRetained(v7);
    id v5 = v10;
    if (v9)
    {
      id v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[os_log_s connection](v10, "connection"));
      xpc_connection_send_message(v11, v2);

      id v12 = sub_10003A95C();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10009FBD4(v5, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    else
    {
      -[os_log_s setPendingMessage:](v10, "setPendingMessage:", v2);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10009FB64(v5, v20, v21, v22, v23, v24, v25, v26);
  }
}

void sub_100086D30(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100086D84(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDPlatform);
  xpc_object_t v2 = (void *)qword_1001255A0;
  qword_1001255A0 = (uint64_t)v1;
}

void sub_100086DEC(id a1)
{
  byte_1001255B0 = NSClassFromString(@"MSDHubBundleManager") != 0LL;
}

void *sub_100087610(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    id v3 = result;
    id result = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  a2,  a3));
    *id v3 = result;
  }

  return result;
}

void *sub_100087650(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    id v4 = result;
    id result = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:reason:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:reason:",  a2,  a3,  a4));
    *id v4 = result;
  }

  return result;
}

void sub_100087694(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1 && !*a1)
  {
    id v7 = v5;
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  a2,  v5));
    id v5 = v7;
    *a1 = v6;
  }
}

void sub_10008936C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDContentCacheManager);
  xpc_object_t v2 = (void *)qword_1001255C0;
  qword_1001255C0 = (uint64_t)v1;
}

void sub_10008995C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v23 = 0;
  v26[0] = *(void *)(a1 + 32);
  v26[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](&OBJC_CLASS___NSData, "dataWithHexString:", v3));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v8 = [v7 fileExistsAtPath:v5 isDirectory:&v23];
    int v9 = v23;

    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10 || ([*(id *)(a1 + 48) containsObject:v6] & 1) != 0)
    {
      id v11 = 0LL;
      goto LABEL_18;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fileManager]);
    id v21 = 0LL;
    unsigned __int8 v19 = [v18 removeItemAtPath:v5 error:&v21];
    id v11 = v21;

    if ((v19 & 1) != 0) {
      goto LABEL_18;
    }
    id v20 = sub_10003A95C();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009FDE0((uint64_t)v5, v11, v17);
    }
LABEL_17:

    goto LABEL_18;
  }

  id v12 = sub_10003A95C();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Removing download in progress %{public}@",  buf,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fileManager]);
  id v22 = 0LL;
  unsigned __int8 v15 = [v14 removeItemAtPath:v5 error:&v22];
  id v11 = v22;

  if ((v15 & 1) == 0)
  {
    id v16 = sub_10003A95C();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009FDE0((uint64_t)v5, v11, v17);
    }
    goto LABEL_17;
  }

void sub_100089F50(_Unwind_Exception *a1)
{
}

void sub_10008A020(_Unwind_Exception *a1)
{
}

void sub_10008A0F0(_Unwind_Exception *a1)
{
}

void sub_10008AC90(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDPushNotificationHandler);
  xpc_object_t v2 = (void *)qword_1001255D0;
  qword_1001255D0 = (uint64_t)v1;
}

void sub_10008B420( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008B460(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10008B470(uint64_t a1)
{
}

void sub_10008B478(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);

  if ([v5 isEqualToString:@"plist"])
  {
    v23[0] = *(void *)(*(void *)(a1[4] + 8LL) + 40LL);
    v23[1] = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

    id v8 = sub_10003A95C();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loading factory metadata from path %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v10 = -[MSDSignedManifestFactoryMetadata initWithContentPlistFile:]( objc_alloc(&OBJC_CLASS___MSDSignedManifestFactoryMetadata),  "initWithContentPlistFile:",  v7);
    uint64_t v11 = *(void *)(a1[5] + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
    {
      objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "addObject:");
    }

    else
    {
      id v13 = sub_10003A95C();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000A02D4((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

void sub_10008C684( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10008C6BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) demuxQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_10008C770;
  v6[3] = &unk_1000F93B8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_barrier_sync(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_10008C770(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDownloadPaused:*(void *)(a1 + 32)];
}

void sub_10008C7AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) demuxQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_10008C860;
  v6[3] = &unk_1000F93B8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_barrier_sync(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_10008C860(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDownloadAborted:*(void *)(a1 + 32)];
}

id sub_10008C980(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchSessionTask:*(void *)(a1 + 40)];
}

LABEL_52:
      uint64_t v30 = 0;
      uint64_t v10 = v48;
      goto LABEL_61;
    }

    uint64_t v48 = v10;
    v62 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 savePath]);

    if (v63)
    {
      __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
      uint64_t v65 = [v64 isDownloadComplete];

      if ((v65 & 1) != 0)
      {
        uint64_t v31 = 0;
        goto LABEL_83;
      }

      v103 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
      v104 = [v103 didProgress];

      if (v104)
      {
        v105 = sub_10003A95C();
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
          v108 = v7;
          v109 = v12;
          v110 = (void *)objc_claimAutoreleasedReturnValue([v107 savePath]);
          *(_DWORD *)buf = 138543362;
          v126 = (uint64_t)v110;
          _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "Allowing partial download of %{public}@ to progress without retry penalty",  buf,  0xCu);

          uint64_t v12 = v109;
          id v7 = v108;
        }

        objc_msgSend(v9, "setCurrentRetry:", (char *)objc_msgSend(v9, "currentRetry") - 1);
        v111 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
        [v111 recordDownloadedBytes];
      }
    }

    uint64_t v31 = 1;
LABEL_83:
    uint64_t v29 = v119;
    if (v29) {
      goto LABEL_57;
    }
    goto LABEL_52;
  }

  v116 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
  uint64_t v14 = [v13 isDownloadComplete];

  uint64_t v15 = sub_10003A95C();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v17)
    {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v52 = v10;
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v51 description]);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 savePath]);
      *(_DWORD *)buf = 138543618;
      v126 = (uint64_t)v53;
      v127 = 2114;
      v128 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "SessionTask %{public}@ with savePath: %{public}@ paused, waiting to be resumed",  buf,  0x16u);

      uint64_t v10 = v52;
    }

    uint64_t v29 = 0LL;
    uint64_t v12 = v116;
    goto LABEL_77;
  }

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
    uint64_t v19 = v11;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 savePath]);
    *(_DWORD *)buf = 138543362;
    v126 = (uint64_t)v20;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not pausing task for %{public}@ because download is already complete",  buf,  0xCu);

    uint64_t v11 = v19;
  }

  int v21 = sub_10003AAAC();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  unsigned __int8 v23 = -[MSDSession signpostId](self, "signpostId");
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 description]);
      v112 = v11;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 savePath]);
      *(_DWORD *)buf = 138412546;
      v126 = (uint64_t)v26;
      v127 = 2112;
      v128 = v28;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  v24,  "Resume Session Task",  "Not Pausing Completed Session Task: %{xcode:string}@ with save path: %{xcode:string}@",  buf,  0x16u);

      uint64_t v11 = v112;
    }
  }

  uint64_t v29 = 0LL;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
LABEL_46:
  uint64_t v12 = v116;
LABEL_61:
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession taskManager](self, "taskManager"));
  [v75 removeSessionTask:v9];

  -[MSDSession collectTimingDataForTask:withNetworkError:](self, "collectTimingDataForTask:withNetworkError:", v9, v119);
  if (v31)
  {
    v115 = v11;
    unsigned int v76 = v7;
    id v77 = v12;
    v78 = v10;
    id v79 = [v9 currentRetry];
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
    unsigned __int8 v81 = [v80 maxRetry];

    if ((uint64_t)v79 <= (uint64_t)v81)
    {
      -[MSDSession retrySessionTask:](self, "retrySessionTask:", v9);
      uint64_t v10 = v78;
      uint64_t v12 = v77;
      id v7 = v76;
      goto LABEL_77;
    }

    unsigned __int8 v82 = sub_10003A95C();
    uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v118 description]);
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
      uint64_t v86 = [v85 maxRetry];
      *(_DWORD *)buf = 138543618;
      v126 = (uint64_t)v84;
      v127 = 2048;
      v128 = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "%{public}@ exceeded maximum retry %ld",  buf,  0x16u);
    }

    uint64_t v10 = v78;
    uint64_t v12 = v77;
    id v7 = v76;
    uint64_t v11 = v115;
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v87, @"statusCode");

  if (v30)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
    id v89 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSession parseResponseHeader:statusCode:](self, "parseResponseHeader:statusCode:", v88, v11));
    -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", v89);
  }

  id v90 = (void *)objc_claimAutoreleasedReturnValue([v9 outData]);

  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue([v9 outData]);
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v91, @"data");
  }

  id v92 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue([v92 savePath]);

  if (v93)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue([v9 contentRange]);
    v95 = [v94 downloadedBytes];

    id v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v95));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v96, @"fileSize");
  }

  v97 = (void *)objc_claimAutoreleasedReturnValue([v9 fileHandle]);

  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue([v9 fileHandle]);
    [v98 closeFile];
  }

  __int16 v99 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  int v100 = (void *)objc_claimAutoreleasedReturnValue([v99 handler]);

  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
    v102 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v101 handler]);
    ((void (**)(void, id, NSMutableDictionary *))v102)[2](v102, v29, v12);
  }

LABEL_77:
}

id sub_10008F008(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchSessionTask:*(void *)(a1 + 40)];
}

void sub_10008F4E8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10008F514(uint64_t a1, void *a2)
{
  return [a2 count];
}

void sub_10008FE78(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Converted from xpc to NSArray: %{public}@",  (uint8_t *)&v3,  0xCu);
}

void sub_10008FEF4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "The value at index %lu in this xpcArray are of an unsupported type",  (uint8_t *)&v3);
}

void sub_10008FF60(void *a1, os_log_s *a2)
{
  int v4 = 136315138;
  id v5 = [a1 objCType];
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v3,  "Unsupported NSNumber type: %s for xpc dictionary encoding",  (uint8_t *)&v4);
}

void sub_10008FFE4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "The values in this NSArray are of an unsupported type",  v1,  2u);
}

void sub_100090024(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v5 = 138543362;
  id v6 = v3;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v4,  "Failed to remove configuration profile from staging: %{public}@",  (uint8_t *)&v5);
}

void sub_1000900B0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "Failed to copy file from content cache: %{public}@",  (uint8_t *)&v3);
}

void sub_10009011C()
{
}

void sub_100090148()
{
}

void sub_100090174()
{
}

void sub_1000901A0()
{
}

void sub_100090200()
{
}

void sub_10009022C()
{
}

void sub_10009028C()
{
}

void sub_1000902EC()
{
}

void sub_10009034C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  sub_100007EA4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to grant permission for resource: %{public}@ to bundleID: %{public}@",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_1000903C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000903F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090464( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000904C8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v5 = 136315394;
  uint64_t v6 = "-[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:]_block_invoke";
  __int16 v7 = 2114;
  id v8 = v3;
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s - Failed to save privacy configuration: %{public}@",  (uint8_t *)&v5);
}

void sub_100090568( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000905CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090630( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090694(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "App Usage polling timer value set to: %f",  (uint8_t *)&v2,  0xCu);
}

void sub_10009070C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  double v3 = "-[MSDDeviceDataCollector collectAppUsageDataForSession:fromStart:toEnd:]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s - appUsage:  %{public}@",  (uint8_t *)&v2,  0x16u);
}

void sub_100090794(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid lastSyncDate.  Must be of type NSDate.",  v1,  2u);
}

void sub_1000907D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "It's time to submit App Usage data to CoreAnalytics!",  v1,  2u);
}

void sub_100090814( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090844( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090874( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000908A4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: Failed to convert input to query items",  v4,  v5,  v6,  v7,  v8);

  sub_10000B0A8();
}

void sub_10009091C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: cannot send request to nil path", v4, v5, v6, v7, v8);

  sub_10000B0A8();
}

void sub_100090994(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: invalid request", v4, v5, v6, v7, v8);

  sub_10000B0A8();
}

void sub_100090A0C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to generate post data", v4, v5, v6, v7, v8);

  sub_10000B0A8();
}

void sub_100090A84(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: cannot send request to nil endpoint",  v4,  v5,  v6,  v7,  v8);

  sub_10000B0A8();
}

void sub_100090AFC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100005C40();
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to convert to task info", v4, v5, v6, v7, v8);

  sub_10000B0A8();
}

void sub_100090B74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090BE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090C54( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090CC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090D34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090DA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "One or more components have an invalid platformType",  v1,  2u);
}

void sub_100090DE4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[MSDSignedManifestV7 initWithManifestData:]";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2048;
  sub_10000E4DC( (void *)&_mh_execute_header,  a2,  a3,  "%s - InstallationOrder count (%lu) doesn't match number of components in manifest (%lu)",  *(const char **)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
}

void sub_100090E68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090ED8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090F48( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100090FB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091028( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091098()
{
}

void sub_100091104()
{
}

void sub_100091170()
{
}

void sub_1000911DC()
{
}

void sub_100091248()
{
  int v2 = 136315650;
  sub_10000E4C8();
  sub_10000E4DC( (void *)&_mh_execute_header,  v0,  v1,  "%s - Missing manifest data for section: %{public}@ for identifier: %{public}@",  v2);
}

void sub_1000912C0()
{
}

void sub_10009132C()
{
}

void sub_100091398()
{
}

void sub_100091404()
{
}

void sub_100091470()
{
}

void sub_1000914D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091548()
{
}

void sub_1000915B0()
{
}

void sub_10009162C()
{
}

void sub_1000916A8()
{
}

void sub_100091724( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091788()
{
}

void sub_1000917E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091818()
{
}

void sub_100091878()
{
}

void sub_1000918D8()
{
}

void sub_100091938( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009199C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = @"statusCode";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ response payload does not contain: %{public}@",  (uint8_t *)&v4,  0x16u);
}

void sub_100091A44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091AB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091B2C(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([a1 criticalComponents]);
  int v7 = 134218496;
  uint64_t v8 = a2;
  __int16 v9 = 2048;
  id v10 = [v6 count];
  __int16 v11 = 2048;
  id v12 = [a1 totalComponents];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Total Components: %ld. Critical Update: %ld, Full Update: %ld",  (uint8_t *)&v7,  0x20u);
}

void sub_100091BFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Bundle update timer was started previously.",  v1,  2u);
}

void sub_100091C3C()
{
}

void sub_100091C74()
{
}

void sub_100091CA0()
{
}

void sub_100091CCC()
{
}

void sub_100091CF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091D68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091DD8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F100((void *)&_mh_execute_header, a2, a3, "SecTrustEvaluate returned fail: %d", a5, a6, a7, a8, 0);
  sub_100005C30();
}

void sub_100091E3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091EAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091F1C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100091F80()
{
}

void sub_100091FAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009201C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009208C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000920FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009216C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000921DC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
  sub_10001562C((void *)&_mh_execute_header, a1, a3, "%s - Publisher event:", (uint8_t *)&v3);
}

void sub_100092254(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
  int v5 = 136315394;
  uint8_t v6 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Sink completed with error:  %{public}@",  (uint8_t *)&v5,  0x16u);

  sub_100015664();
}

void sub_100092308(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10001562C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Add closed event for app:  %{public}@", (uint8_t *)a2);

  sub_100015674();
}

void sub_100092350()
{
}

void sub_10009237C()
{
}

void sub_1000923A8()
{
}

void sub_1000923D4()
{
}

void sub_10009240C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10001562C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Add open event for app:  %{public}@", (uint8_t *)a2);

  sub_100015674();
}

void sub_100092454()
{
}

void sub_100092480(char a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1 & 1;
  sub_100015648((void *)&_mh_execute_header, a2, a3, "rval:  %{BOOL}d", (uint8_t *)v3);
  sub_100005C30();
}

void sub_1000924EC()
{
  sub_100015674();
}

void sub_100092530()
{
  sub_100015674();
}

void sub_100092574(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 absoluteTimestamp]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 toString]);
  int v6 = 138543362;
  __int16 v7 = v4;
  sub_10001562C((void *)&_mh_execute_header, a2, v5, "- Timestamp:      %{public}@", (uint8_t *)&v6);

  sub_100015664();
}

void sub_10009260C(void *a1, os_log_s *a2)
{
  v4[0] = 67240192;
  v4[1] = [a1 launchType];
  sub_100015648((void *)&_mh_execute_header, a2, v3, "- Type:           %{public}d", (uint8_t *)v4);
  sub_1000156A8();
}

void sub_100092684(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 launchReason]);
  int v5 = 138543362;
  int v6 = v3;
  sub_10001562C((void *)&_mh_execute_header, a2, v4, "- LaunchReason:   %{public}@", (uint8_t *)&v5);

  sub_10000B0A8();
}

void sub_100092708(void *a1, os_log_s *a2)
{
  v4[0] = 67109120;
  v4[1] = [a1 starting];
  sub_100015648((void *)&_mh_execute_header, a2, v3, "- Starting:       %{BOOL}d", (uint8_t *)v4);
  sub_1000156A8();
}

void sub_100092780(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleID]);
  int v5 = 138543362;
  int v6 = v3;
  sub_10001562C((void *)&_mh_execute_header, a2, v4, "- BundleID:       %{public}@", (uint8_t *)&v5);

  sub_10000B0A8();
}

void sub_100092804(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "appInforeground: %{public}@, systemInUse: %{BOOL}d",  (uint8_t *)&v3,  0x12u);
}

void sub_10009288C(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 info]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed trust evaluation for task: %{public}@",  (uint8_t *)&v5,  0xCu);
}

void sub_100092938(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to set background download environment after %ld attempts. Bailing out.",  (uint8_t *)&v2,  0xCu);
}

void sub_1000929AC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1000189B4((void *)&_mh_execute_header, a1, a3, "Failed to build components from manifest", v3);
}

void sub_1000929E4(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000189B4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to set background download environment. Will try again..",  a1);
}

void sub_100092A18(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1000189B4((void *)&_mh_execute_header, a1, a3, "Cannot stage device for update progress.", v3);
}

void sub_100092A50(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 device]);
  int v4 = 134217984;
  id v5 = [v3 backgroundDownloadState];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Called quitBackgroundDownload when background state:%lu",  (uint8_t *)&v4,  0xCu);
}

void sub_100092AE8()
{
}

void sub_100092B14()
{
}

void sub_100092B40()
{
}

void sub_100092B6C()
{
}

void sub_100092B98()
{
}

void sub_100092BC4()
{
}

void sub_100092BF0()
{
}

void sub_100092C1C()
{
}

void sub_100092C48()
{
}

void sub_100092C74(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to authenticate account: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100092CF4()
{
}

void sub_100092D58()
{
}

void sub_100092D84()
{
}

void sub_100092DE8()
{
}

void sub_100092E4C()
{
}

void sub_100092EB0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to sign out from Apple ID with error: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100092F30(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v4,  "Failed to save iCloud account as a managed account: %{public}@",  v5);

  sub_10000B0A8();
}

void sub_100092FB0()
{
}

void sub_100092FDC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "iCloud account is not provisioned to use this feature.",  buf,  2u);
}

void sub_100093018(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to update iCloud account features: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100093098(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to create user profile: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100093118(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = @"com.apple.private.alloy.mobilestoredemo.icloud";
  sub_100004D84( (void *)&_mh_execute_header,  a1,  a3,  "Failed to create IDSAccountController for IDS service: %{public}@",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_10009318C(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "IDS %{public}@ timed out after %f seconds.",  (uint8_t *)&v3,  0x16u);
  sub_100005C38();
}

void sub_100093208(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to create CKKSControl object: %{public}@",  (uint8_t *)a2);
}

void sub_100093254(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to sync iCloud keychain: %{public}@", v5);

  sub_10000B0A8();
}

void sub_1000932D4()
{
}

void sub_100093300()
{
}

void sub_100093364()
{
}

void sub_100093390(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to synchronize with CFPreferences.",  v1,  2u);
}

void sub_1000933D0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@: failed to convert data to dict",  (uint8_t *)&v4,  0xCu);
}

void sub_100093464(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getName]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@: All URL retries exhausted, returning...",  (uint8_t *)&v4,  0xCu);

  sub_10000B0A8();
}

void sub_1000934F4(void *a1, os_log_s *a2)
{
  int v3 = 134217984;
  id v4 = [a1 requestPerSession];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Decreased concurrent request per session to %ld",  (uint8_t *)&v3,  0xCu);
  sub_10000B0A8();
}

void sub_100093574(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timeout launching app.", v1, 2u);
}

void sub_1000935B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "With options: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100093628(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100020568( (void *)&_mh_execute_header,  v2,  v3,  "Failed to launch app: %{public}@ error: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100015664();
}

void sub_1000936BC(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100020568( (void *)&_mh_execute_header,  v2,  v3,  "Failed to terminate app: %{public}@ error: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100015664();
}

void sub_100093750( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100093784( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000937B8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "Failed to query recovery key availability: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10000B0A8();
}

void sub_100093834(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "Failed to generate recovery key: %{public}@", v4, v5, v6, v7, 2u);

  sub_10000B0A8();
}

void sub_1000938B0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@: invalid request",  (uint8_t *)&v4,  0xCu);
}

void sub_100093944(void *a1, os_log_s *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 originServer]);
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v5;
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v6,  "%{public}@ download credential for origin server %{public}@ invalid or expired",  (uint8_t *)&v7);
}

void sub_1000939FC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  sub_100007EA4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to rename file to %{public}@: %{public}@",  (uint8_t *)&v3);
}

void sub_100093A78(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "Container does not exist for containerIdentifier:%{public}@",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100093AE0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100004D84( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "data blob size larger than allowed for 3rd party apps.:%lu",  (uint8_t *)a1);
}

void sub_100093B1C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "Could not create a container for containerIdentifier:%{public}@",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100093B84(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "Trying to retrieve data without having container:%{public}@",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100093BEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Removing non-existing persistent data blob.",  v1,  2u);
}

void sub_100093C2C()
{
}

void sub_100093C8C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "Get file attributes failed for %{public}@ with error - %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_100093D10()
{
}

void sub_100093D7C()
{
}

void sub_100093DE8()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not get ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_100093E54()
{
}

void sub_100093E80()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not create ACL binary format for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_100093EEC()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not validate ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_100093F58()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_100007EA4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Could not extract extended file attributes from %{public}@, returned %td",  v2);
  sub_100005C38();
}

void sub_100093FCC()
{
}

void sub_10009402C()
{
}

void sub_10009408C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "Could not get destination of symbolic link %{public}@ with error - %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_100094110()
{
}

void sub_100094170()
{
}

void sub_1000941D0()
{
}

void sub_1000941FC()
{
  sub_100005C20((void *)&_mh_execute_header, v0, v1, "Inconsistent return value from listxattr.", v2, v3, v4, v5, v6);
  sub_100005C30();
}

void sub_100094228()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_100007EA4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Cannot remove extended attribte %{public}s from %{public}@.",  v2);
  sub_100005C38();
}

void sub_10009429C()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not create empty ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_100094308()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not set ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_100094374()
{
  uint64_t v0 = sub_1000248AC();
  sub_1000248C0(v0);
  sub_100024868();
  sub_100020568( (void *)&_mh_execute_header,  v1,  v2,  "Could not load ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_10000B0A8();
}

void sub_1000943E0()
{
}

void sub_100094440()
{
}

void sub_10009446C()
{
}

void sub_100094498()
{
}

void sub_100094504()
{
}

void sub_100094570(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot load Domains.plist: %{public}@.",  (uint8_t *)&v2,  0xCu);
}

void sub_1000945E4()
{
}

void sub_100094610()
{
}

void sub_10009463C()
{
}

void sub_100094668()
{
}

void sub_100094694()
{
}

void sub_1000946C0()
{
}

void sub_1000946EC()
{
}

void sub_100094718()
{
}

void sub_100094744()
{
}

void sub_100094770()
{
}

void sub_10009479C()
{
}

void sub_1000947C8()
{
}

void sub_1000947F4()
{
}

void sub_100094820()
{
}

void sub_10009484C()
{
}

void sub_100094878()
{
}

void sub_1000948A4()
{
}

void sub_1000948D0()
{
}

void sub_1000948FC()
{
}

void sub_100094928()
{
}

void sub_100094954()
{
}

void sub_100094980()
{
}

void sub_1000949AC()
{
}

void sub_1000949D8()
{
}

void sub_100094A04()
{
}

void sub_100094A30()
{
}

void sub_100094A5C()
{
}

void sub_100094A88()
{
}

void sub_100094AB4()
{
}

void sub_100094AE0(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to remove file from %{public}@ - %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100094B90(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to set file attributes: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100094C04(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v6 = *__error();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to clonefile from %{public}@ to %{public}@ - %{errno}d",  (uint8_t *)&v7,  0x1Cu);
}

void sub_100094CB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094CEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094D20()
{
}

void sub_100094D90()
{
}

void sub_100094E00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094E30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094E60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094E90()
{
  __assert_rtn("-[MSDHelperAgent init]_block_invoke", "MSDHelperAgent.m", 60, "type == XPC_TYPE_DICTIONARY");
}

void sub_100094EB8(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 136315650;
  int v7 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Failed to load device manifest from: %{public}@ error: %{public}@",  (uint8_t *)&v6,  0x20u);
}

void sub_100094F78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100094FE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002CB6C((void *)&_mh_execute_header, a1, a3, "%s: will return.", a5, a6, a7, a8, 2u);
  sub_100005C38();
}

void sub_100095058( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000950BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009512C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009519C()
{
}

void sub_100095200()
{
}

void sub_100095264()
{
}

void sub_1000952C8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v5[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s - Failed to get executable URL for app:  %{public}@",  (uint8_t *)v5);

  sub_10000B0A8();
}

void sub_100095354(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v5[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s - Failed to get CodeResources URL for app:  %{public}@",  (uint8_t *)v5);

  sub_10000B0A8();
}

void sub_1000953E0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot read file %{public}@", v5);

  sub_10000B0A8();
}

void sub_100095460(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot read data from %{public}@", v5);

  sub_10000B0A8();
}

void sub_1000954E0()
{
}

void sub_100095544(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = @"CFBundleShortVersionString";
  sub_100004D84((void *)&_mh_execute_header, a1, a3, "%{public}@ is not a string.", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_1000955B8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot load bundle: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100095638(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot find executable file in bundle:  %{public}@.", v5);

  sub_10000B0A8();
}

void sub_1000956B8()
{
  v2[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  v0,  v1,  "%s - Failed to find app name under folder:  %{public}@",  (uint8_t *)v2);
  sub_100005C38();
}

void sub_100095728(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 136315650;
  int v7 = "-[MSDiOSApp serachForFileWithSuffix:inFolder:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s - Failed to read contents of folder:  %{public}@ - Error:  %{public}@",  (uint8_t *)&v6,  0x20u);
}

void sub_1000957E8(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Dispatching operation %{public}@ to queue %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100095898()
{
}

void sub_100095904(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  v4[0] = 136315394;
  sub_10000E4C8();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:  Failed to convert manifest file to property list.  Error:  %{public}@",  (uint8_t *)v4,  0x16u);

  sub_10000B0A8();
}

void sub_100095998()
{
}

void sub_100095A04(void *a1, os_log_s *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "+[MSDSignedManifestFactory readManifestFromFile:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 intValue];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:  Manifest version %d is not supported yet.",  (uint8_t *)&v3,  0x12u);
  sub_10000B0A8();
}

void sub_100095A98()
{
}

void sub_100095B04()
{
}

void sub_100095B70(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Converted from xpc to NSDictionary: %{public}@",  (uint8_t *)&v3,  0xCu);
  sub_100005C38();
}

void sub_100095BE8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "The value for key %{public}@ has a type that is not supported yet",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100095C50(void *a1, os_log_s *a2)
{
  int v4 = 136315138;
  id v5 = [a1 objCType];
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v3,  "Unsupported NSNumber type: %s for xpc dictionary encoding",  (uint8_t *)&v4);
  sub_10000B0A8();
}

void sub_100095CCC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v8 = 138543618;
  uint64_t v9 = a1;
  sub_10002F6B4();
  id v6 = v5;
  sub_100007EA4( (void *)&_mh_execute_header,  a3,  v7,  "The value for key %{public}@ has unsupported type %{public}@",  (uint8_t *)&v8);

  sub_10000B0A8();
}

void sub_100095D5C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  int v4 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  __int16 v5 = 2114;
  uint64_t v6 = 0LL;
  sub_100007EA4((void *)&_mh_execute_header, a1, a3, "%s: Cannot convert %{public}@ to dictionary", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100095DDC(void *a1)
{
  sub_10002F6C4();
}

void sub_100095E60()
{
  int v2 = 136315394;
  uint64_t v3 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  sub_10002F6B4();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)&v2);
  sub_100005C38();
}

void sub_100095ED4(void *a1)
{
  sub_10002F6C4();
}

void sub_100095F58()
{
  int v2 = 136315394;
  uint64_t v3 = "-[NSDictionary(xpcdictConv) convertToNSData]";
  sub_10002F6B4();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s: Not a valid JSON object: %{public}@", (uint8_t *)&v2);
  sub_100005C38();
}

void sub_100095FCC()
{
}

void sub_100096034(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to create symbolic link - %{public}@", v5);

  sub_10000B0A8();
}

void sub_1000960B4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to remove symbolic link - %{public}@", v5);

  sub_10000B0A8();
}

void sub_100096134(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568((void *)&_mh_execute_header, v3, v4, "Failed to create %{public}@ - %{public}@", v5, v6, v7, v8, v9);

  sub_100015664();
}

void sub_1000961B8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to create parent folder - %{public}@", v5);

  sub_10000B0A8();
}

void sub_100096238( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096268( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096298( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000962C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096338(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Setting preference %{public}@:%{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100005C38();
}

void sub_1000963B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096428( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096498(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ returned error: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_100096544(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: no data received.", v4, v5, v6, v7, 2u);

  sub_10000B0A8();
}

void sub_1000965C0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to convert data to dict", v4, v5, v6, v7, 2u);

  sub_10000B0A8();
}

void sub_10009663C(os_log_t log)
{
  int v1 = 138543362;
  uint64_t v2 = @"/Applications/StoreDemoViewService.app";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not load localization bundle at %{public}@",  (uint8_t *)&v1,  0xCu);
}

void sub_1000966BC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received unknown XPC event of type: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100096730()
{
}

void sub_10009675C()
{
}

void sub_100096788()
{
}

void sub_1000967B4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot add authentication header - %{public}@.", v5);

  sub_10000B0A8();
}

void sub_100096834()
{
}

void sub_100096860(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = 0LL;
  sub_100004D84((void *)&_mh_execute_header, a1, a3, "Headers in wrong type: %{public}@", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_1000968CC(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 urlSchema]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot find prefix portion in URLSchema %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009694C()
{
}

void sub_100096978()
{
}

void sub_1000969DC(void *a1)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 fileHash]);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 savePath]);
  sub_100034818();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x20u);

  sub_10002F6C4();
}

void sub_100096A98()
{
}

void sub_100096AFC()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100034818();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
  sub_10002F6C4();
}

void sub_100096BA4(uint64_t a1, void *a2)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100034818();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_100096C4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096C80()
{
}

void sub_100096CE0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 toString]);
  sub_100005C40();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Store hour settings have or will be expired on %{public}@",  v4,  0xCu);
}

void sub_100096D70()
{
}

void sub_100096DD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100096E04()
{
}

void sub_100096E64()
{
}

void sub_100096EC4()
{
}

void sub_100096F24(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "/Register data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100096F98(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100036D78();
  sub_100020568( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: error from the server: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100015664();
}

void sub_100097018(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_100036D78();
  sub_100020568( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: required key not found: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100015664();
}

void sub_100097098(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot load domains.plist from %{public}@.",  (uint8_t *)&v2,  0xCu);
  sub_100005C38();
}

void sub_100097108( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009713C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097170(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Manifest file path %{public}@ is not same as real path: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100005C38();
}

void sub_1000971F0(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:Container check failed for %{public}@",  (uint8_t *)&v2,  0x16u);
  sub_100005C38();
}

void sub_100097274(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 context]);
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  int v5 = 136315394;
  uint64_t v6 = "-[MSDSettingsInstallOperation _applySettingToDevice]";
  __int16 v7 = 2114;
  uint8_t v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Error: unsupported device setting %{public}@ found in the manifest",  (uint8_t *)&v5,  0x16u);
}

void sub_100097334( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000973A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097414( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097484(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error writing HDR setting to the MSDPreferences file",  v1,  2u);
}

void sub_1000974C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000974F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009752C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "downloadSize: %lld downloadSizeBucket: %{public}@",  (uint8_t *)&v3,  0x16u);
}

void sub_1000975B0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDManifest addFilesUsingSourceManifest:]";
  sub_100004D84( (void *)&_mh_execute_header,  a1,  a3,  "%s: Root path must be the same between source and device manifest.",  (uint8_t *)&v3);
}

void sub_100097628(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Couldn't get meta data for %{public}@",  a1,  0xCu);
}

void sub_10009769C(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Couldn't run handler against %{public}@", (uint8_t *)&v5);
}

void sub_100097728(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "rootPath already specified. Could not add more files.",  v1,  2u);
}

void sub_100097768(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 absoluteString]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByRemovingPercentEncoding]);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot read file %{public}@",  (uint8_t *)&v5,  0xCu);

  sub_100015664();
}

void sub_100097808(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 absoluteString]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByRemovingPercentEncoding]);
  int v7 = 138543618;
  uint8_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Cannot read data from %{public}@ - %{public}@.",  (uint8_t *)&v7,  0x16u);

  sub_100015664();
}

void sub_1000978B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097928( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097998()
{
}

void sub_1000979C4()
{
}

void sub_1000979F0()
{
}

void sub_100097A1C()
{
}

void sub_100097A48()
{
  sub_10002CB6C((void *)&_mh_execute_header, v0, v1, "message = %{public}s", v2, v3, v4, v5, v6);
  sub_100005C38();
}

void sub_100097AA8()
{
}

void sub_100097B14()
{
  sub_10002CB6C((void *)&_mh_execute_header, v0, v1, "query = %{public}s", v2, v3, v4, v5, v6);
  sub_100005C38();
}

void sub_100097B74()
{
}

void sub_100097BA0()
{
}

void sub_100097BCC()
{
}

void sub_100097BF8()
{
}

void sub_100097C24()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Unexpected value type for DeviceOptions (subkey: %{public}s): %{public}@",  v2,  0x16u);
  sub_100005C38();
}

void sub_100097CA0()
{
}

void sub_100097CCC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097D38()
{
}

void sub_100097D64()
{
}

void sub_100097D90()
{
}

void sub_100097DBC()
{
}

void sub_100097DE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097E58()
{
}

void sub_100097E84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100097EF4(char a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDLocalMessageResponder handleMessage:from:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - isOpen: %d", (uint8_t *)&v2, 0x12u);
  sub_100005C38();
}

void sub_100097F7C()
{
}

void sub_100097FE8()
{
}

void sub_100098054( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000980C4()
{
}

void sub_1000980F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098160( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000981D0()
{
}

void sub_100098230()
{
}

void sub_10009825C()
{
}

void sub_100098288()
{
}

void sub_1000982B4()
{
}

void sub_1000982E0()
{
}

void sub_10009830C()
{
  __assert_rtn("MSD_handle_connection_block_invoke", "MSDLocalMessageResponder.m", 153, "type == XPC_TYPE_DICTIONARY");
}

void sub_100098334()
{
}

void sub_100098360(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to migrate cellular support flag",  v1,  2u);
  sub_100005C30();
}

void sub_10009839C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098408( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098474()
{
}

void sub_1000984A0()
{
}

void sub_1000984CC()
{
}

void sub_1000984F8()
{
}

void sub_100098558()
{
}

void sub_1000985B8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543618;
  uint64_t v4 = @"AutomatedDeviceGroup";
  __int16 v5 = 2114;
  uint8_t v6 = @"com.apple.da";
  sub_100007EA4( (void *)&_mh_execute_header,  a1,  a3,  "%{public}@ key does not exist in domain %{public}@, skip appending store ID",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_100098640(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543618;
  uint64_t v4 = @"store_id";
  __int16 v5 = 2114;
  uint8_t v6 = @"AutomatedDeviceGroup";
  sub_100007EA4( (void *)&_mh_execute_header,  a1,  a3,  "Failed to retrieve %{public}@ from device options, skip appending store ID to %{public}@ key",  (uint8_t *)&v3);
  sub_100005C38();
}

void sub_1000986C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098738()
{
  uint64_t v4 = @"AutomatedDeviceGroup";
  __int16 v5 = v0;
  uint8_t v6 = @"com.apple.da";
  __int16 v7 = v0;
  uint64_t v8 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Failed to write %{public}@ to key %{public}@ in domain %{public}@, current value is %{public}@",  v3,  0x2Au);
}

void sub_1000987D0(uint64_t a1, void *a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a2 device]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 OSVersion]);
  int v8 = 138543618;
  uint64_t v9 = a1;
  sub_10002F6B4();
  sub_100007EA4( (void *)&_mh_execute_header,  a3,  v7,  "Content requires OS version >= %{public}@, current OS version is %{public}@.",  (uint8_t *)&v8);
}

void sub_100098880()
{
}

void sub_1000988AC()
{
  uint64_t v3 = @"/private/var/demo_backup/Metadata/.Content.plist";
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "Failed to copy %{public}@ to %{public}@", v2);
  sub_100005C38();
}

void sub_10009891C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009898C()
{
  uint64_t v3 = @"/private/var/demo_backup/backup/var/mobile/Media/Content.plist";
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "Failed to copy %{public}@ to %{public}@", v2);
  sub_100005C38();
}

void sub_1000989FC()
{
  uint64_t v3 = v0;
  sub_100007EA4((void *)&_mh_execute_header, v1, (uint64_t)v1, "Failed to create %{public}@ with error: %{public}@", v2);
  sub_100005C38();
}

void sub_100098A68()
{
}

void sub_100098AC8()
{
}

void sub_100098AF4()
{
}

void sub_100098B54()
{
}

void sub_100098BB4()
{
  int v3 = 136315650;
  uint64_t v4 = "-[MSDDemoUpdateController _selectCachedManifestWithError:]";
  sub_10002F6B4();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s - Failed to remove older manifest file:  %{public}@ - Error:  %{public}@",  (uint8_t *)&v3,  0x20u);
}

void sub_100098C40()
{
  int v2 = 136315394;
  int v3 = "-[MSDDemoUpdateController _selectCachedManifestWithError:]";
  sub_10002F6B4();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s - Failed to create folder:  %{public}@", (uint8_t *)&v2);
  sub_100005C38();
}

void sub_100098CB4()
{
}

void sub_100098D14()
{
}

void sub_100098D40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098DB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100098E20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Device has no previous migration version saved.",  v1,  2u);
}

void sub_100098E60(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Previous saved migration version: %{public}@ not in expected format.",  (uint8_t *)&v2,  0xCu);
}

void sub_100098ED4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Download hit an error; set scanDownloadFailedFlag for a retry.",
    v1,
    2u);
}

void sub_100098F14(uint64_t a1, os_log_s *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to install OS update (%{public}s)",  (uint8_t *)&v2,  0xCu);
}

void sub_100098F88(uint64_t a1, void *a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "Failed to install OS update (%{public}s) - %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_10009900C(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to create %{public}@ - %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_1000990BC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to register for trusted peer change notification with status: %d",  (uint8_t *)v2,  8u);
}

void sub_100099130(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to load account settings: %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_1000991C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Account setup not allowed on this device.",  v1,  2u);
}

void sub_100099204( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099274( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000992E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099354( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000993C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099434()
{
}

void sub_1000994A0()
{
}

void sub_10009950C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009957C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000995EC()
{
}

void sub_100099658()
{
}

void sub_1000996C4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get bundle path for app: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_100099738()
{
  v2[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s: Unknown operation identifier - %{public}@", (uint8_t *)v2);
}

void sub_1000997AC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  v5[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s: Illegal operation object instantiated - %{public}@",  (uint8_t *)v5);
}

void sub_100099840(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Hub host name and port must be saved for handling request: %@",  buf,  0xCu);
}

void sub_100099894( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000998C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000998FC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 appID]);
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "Failed to get IPA from server for app %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10000B0A8();
}

void sub_100099978(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 savePath]);
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "Cannot find %{public}@", v4, v5, v6, v7, 2u);

  sub_10000B0A8();
}

void sub_1000999F4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@: does not conform to MSDDownloadFileDetailsProtocol.",  v4,  v5,  v6,  v7,  2u);

  sub_10000B0A8();
}

void sub_100099A70()
{
}

void sub_100099AD0()
{
}

void sub_100099B30()
{
}

void sub_100099B90()
{
}

void sub_100099BF0()
{
}

void sub_100099C50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099C80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099CB0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to create device manifest folder: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100099D30()
{
}

void sub_100099D94()
{
}

void sub_100099DF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099E28(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to move pseudo content root path: %{public}@", v5);

  sub_10000B0A8();
}

void sub_100099EA8()
{
}

void sub_100099F0C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "Failed to create LSApplicationRecord for app: %{public}@ error: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_100099F90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099FC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100099FF8()
{
}

void sub_10009A064()
{
}

void sub_10009A0C4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "ERROR - Failed to acquire termination assertion for app:  %{public}@ - Error:  %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_10009A148()
{
}

void sub_10009A1A8()
{
}

void sub_10009A208(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100020568( (void *)&_mh_execute_header,  v3,  v4,  "ERROR - Failed to invalidate termination assertion for app:  %{public}@ - Error:  %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100015664();
}

void sub_10009A28C()
{
}

void sub_10009A2EC()
{
}

void sub_10009A350(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Cannot remove temp IPA %{public}@ - %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_10009A400(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v4,  "Could not create IXUpdatingAppInstallCoordinator with error - %{public}@",  v5);

  sub_10000B0A8();
}

void sub_10009A480(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84( (void *)&_mh_execute_header,  a2,  v4,  "Could not create IXInitiatingAppInstallCoordinator with error - %{public}@",  v5);

  sub_10000B0A8();
}

void sub_10009A500(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot cancel IPA promise: %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009A580(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1026;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to open file: %{public}@ - %{public, errno}d",  buf,  0x12u);
}

void sub_10009A5D8()
{
}

void sub_10009A63C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to instantiate NSData object.",  v1,  2u);
}

void sub_10009A67C(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67240192;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to read data to buffer: %{public, errno}d",  buf,  8u);
}

void sub_10009A6C4()
{
}

void sub_10009A728()
{
}

void sub_10009A78C()
{
}

void sub_10009A7F0(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = @"/tmp/DownloadedFileList.plist";
  *(_WORD *)(a2 + 12) = 2114;
  *(void *)(a2 + 14) = a1;
  sub_100007EA4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to save list of downloaded files to:  %{public}@ - Error:  %{public}@",  (uint8_t *)a2);
}

void sub_10009A850(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "downloadedFileList is not in valid XML format.",  v1,  2u);
}

void sub_10009A890(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Cannot find metadata for %{public}@",  buf,  0xCu);
}

void sub_10009A8D4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  sub_100007EA4((void *)&_mh_execute_header, a2, a3, "Failed to download file %{public}@ to %{public}@", (uint8_t *)&v5);
}

void sub_10009A950(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10005CF80();
  sub_10002F6A0( (void *)&_mh_execute_header,  v5,  v6,  "%s - Failed to load file:  %{public}@ - Error:  %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_10002F6C4();
}

void sub_10009A9F0(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10005CF80();
  sub_10002F6A0( (void *)&_mh_execute_header,  v5,  v6,  "%s - Failed to save info to file:  %{public}@ - Error:  %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_10002F6C4();
}

void sub_10009AA90(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10002F6A0( (void *)&_mh_execute_header,  v2,  v3,  "%s - Failed to create folder:  %{public}@ - Error:  %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10002F6C4();
}

void sub_10009AB34(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown contaier type: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009ABA8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Skipping entitlement check for file:%{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009AC1C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100004D84((void *)&_mh_execute_header, a2, a3, "Entitlement check failed for %{public}@.", (uint8_t *)&v3);
}

void sub_10009AC88(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 savePath]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "File deletion for %{public}@ failed", (uint8_t *)&v5);
}

void sub_10009AD14()
{
}

void sub_10009AD40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009ADB0(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDFindMyHub askFindMyHubForHubInfo:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Invalid hub URL:  %{public}@",  (uint8_t *)&v2,  0x16u);
  sub_100005C38();
}

void sub_10009AE34()
{
}

void sub_10009AE60( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009AEC4()
{
}

void sub_10009AEF0()
{
}

void sub_10009AF1C(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 hubHostName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 hubPort]);
  int v6 = 136315650;
  uint64_t v7 = "-[MSDFindMyHub enrollAndSetup:]";
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - invalid hub host name or port; hubHostName=%{public}@; hubPort=%{public}@",
    (uint8_t *)&v6,
    0x20u);
}

void sub_10009AFEC()
{
}

void sub_10009B018()
{
}

void sub_10009B050( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B0C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B130()
{
}

void sub_10009B15C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B1CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B23C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B2AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B31C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B38C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B3FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B46C()
{
}

void sub_10009B498()
{
}

void sub_10009B4C4()
{
}

void sub_10009B4F0()
{
}

void sub_10009B51C()
{
}

void sub_10009B548(char a1, int a2, os_log_t log)
{
  uint64_t v3 = "decrypt";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "encrypt";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to %s input data - %d",  (uint8_t *)&v4,  0x12u);
  sub_100005C38();
}

void sub_10009B5E0()
{
}

void sub_10009B640()
{
}

void sub_10009B66C()
{
}

void sub_10009B6CC()
{
}

void sub_10009B72C()
{
}

void sub_10009B758()
{
}

void sub_10009B7B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B81C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B884( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009B8EC()
{
}

void sub_10009B94C()
{
}

void sub_10009B978()
{
}

void sub_10009B9A4()
{
}

void sub_10009BA04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009BA34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009BA64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009BA94()
{
}

void sub_10009BAF8()
{
}

void sub_10009BB24()
{
}

void sub_10009BB88()
{
}

void sub_10009BBB4()
{
}

void sub_10009BC18(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Not able to create dummy preferences file:%{public}@",  (uint8_t *)a2);
}

void sub_10009BC64()
{
}

void sub_10009BC90()
{
  int v2 = 136315650;
  sub_10006EADC();
  sub_10000E4DC((void *)&_mh_execute_header, v0, v1, "%s - Couldn't move %{public}@ to %{public}@}.", v2);
}

void sub_10009BD00(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Cannot create folder %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009BD80()
{
}

void sub_10009BDAC()
{
}

void sub_10009BDD8()
{
}

void sub_10009BE04()
{
}

void sub_10009BE30()
{
}

void sub_10009BE5C()
{
}

void sub_10009BE88()
{
}

void sub_10009BEB4()
{
}

void sub_10009BEE0()
{
}

void sub_10009BF0C()
{
}

void sub_10009BF38()
{
}

void sub_10009BF64()
{
}

void sub_10009BF90()
{
}

void sub_10009BFBC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Could not get activation record with error - %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009C03C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDTargetDevice hubSuppliedSettings]";
  sub_100004D84((void *)&_mh_execute_header, a1, a3, "%s: Hub supplied settings not in right format.", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_10009C0B0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDTargetDevice saveHubSuppliedSettings:]";
  sub_100004D84((void *)&_mh_execute_header, a1, a3, "%s: Hub supplied settings not in right format.", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_10009C124(char a1, void *a2, os_log_s *a3)
{
  int v4 = a1 & 1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2114;
  __int16 v8 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to set passcode modification allowed to %{BOOL}d: %{public}@",  (uint8_t *)v6,  0x12u);
}

void sub_10009C1D4(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to create device passcode: %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009C254(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to remove device passcode: %{public}@", v5);

  sub_10000B0A8();
}

void sub_10009C2D4()
{
}

void sub_10009C300()
{
}

void sub_10009C32C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to set SEP demo mode: %d",  (uint8_t *)v2,  8u);
  sub_100005C30();
}

void sub_10009C39C()
{
  int v2 = 136315650;
  sub_10006EADC();
  sub_10000E4DC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Incorrect demo mode value: %{public}@ for key: %{public}@",  v2);
}

void sub_10009C40C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = @"com.apple.DemoUpdate";
  sub_100004D84((void *)&_mh_execute_header, a1, a3, "Cannot uninstall application %{public}@", (uint8_t *)&v3);
  sub_100005C38();
}

void sub_10009C480()
{
}

void sub_10009C4AC()
{
}

void sub_10009C4D8()
{
}

void sub_10009C504()
{
}

void sub_10009C530(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  v5[0] = 138543618;
  sub_10000E4C8();
  sub_100007EA4((void *)&_mh_execute_header, a2, v4, "Failed to remove %{public}@ - %{public}@", (uint8_t *)v5);

  sub_10000B0A8();
}

void sub_10009C5BC()
{
}

void sub_10009C5E8()
{
}

void sub_10009C614()
{
}

void sub_10009C640()
{
  v2[0] = 138543618;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  v0,  v1,  "Failed to get process handle for %{public}@ with error: %{public}@",  (uint8_t *)v2);
  sub_100005C38();
}

void sub_10009C6B0()
{
}

void sub_10009C6DC()
{
}

void sub_10009C708()
{
}

void sub_10009C734()
{
}

void sub_10009C760()
{
}

void sub_10009C78C(os_log_s *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](&OBJC_CLASS___MSDPreferencesFile, "preferencesFilePath"));
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a1, v3, "Cannot write %{public}@.", v4);

  sub_10000B0A8();
}

void sub_10009C814()
{
}

void sub_10009C840()
{
}

void sub_10009C8A0()
{
}

void sub_10009C8CC()
{
}

void sub_10009C8F8()
{
}

void sub_10009C924()
{
}

void sub_10009C950()
{
}

void sub_10009C97C()
{
}

void sub_10009C9A8()
{
}

void sub_10009C9D4()
{
}

void sub_10009CA00()
{
}

void sub_10009CA2C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CA90()
{
}

void sub_10009CABC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CB2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CB9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CC08()
{
}

void sub_10009CC68()
{
}

void sub_10009CCC8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to remove known WiFi network - %{public}@",  v4,  0xCu);
}

void sub_10009CD58()
{
}

void sub_10009CD84()
{
}

void sub_10009CDB0()
{
}

void sub_10009CDDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CE10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CE44(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Can't create URL %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_100005C38();
}

void sub_10009CEB4()
{
}

void sub_10009CF14()
{
}

void sub_10009CF74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CFA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009CFD4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
  sub_100005C30();
}

void sub_10009D044( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D074( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D0E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D154()
{
}

void sub_10009D180()
{
}

void sub_10009D1AC()
{
}

void sub_10009D1D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D248()
{
}

void sub_10009D274( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D2E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D354( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D3C4()
{
}

void sub_10009D3F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D460( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D4D0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000B094( (void *)&_mh_execute_header,  v2,  v3,  "Failed to list directory contents - %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10000B0A8();
}

void sub_10009D54C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed in deleting provisionProfileDir.",  v1,  2u);
}

void sub_10009D58C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000B094((void *)&_mh_execute_header, v2, v3, "Failed to remove file: %{public}@", v4, v5, v6, v7, 2u);

  sub_10000B0A8();
}

void sub_10009D608(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to copy file from content cache: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009D67C()
{
}

void sub_10009D6DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D70C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D774()
{
  uint64_t v3 = @"ConfigurationProfiles";
  sub_100007EA4( (void *)&_mh_execute_header,  v0,  v1,  "ERROR - Missing data for profile:  %{public}@ under component:  %{public}@",  v2);
  sub_100005C38();
}

void sub_10009D7E4()
{
  uint64_t v3 = @"ConfigurationProfiles";
  sub_100007EA4( (void *)&_mh_execute_header,  v0,  v1,  "ERROR - Missing info for profile:  %{public}@ under component:  %{public}@",  v2);
  sub_100005C38();
}

void sub_10009D854()
{
}

void sub_10009D8BC()
{
}

void sub_10009D91C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009D94C()
{
}

void sub_10009D9AC()
{
}

void sub_10009DA0C()
{
}

void sub_10009DA38()
{
}

void sub_10009DA64()
{
}

void sub_10009DA90()
{
}

void sub_10009DAFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009DB6C()
{
}

void sub_10009DBCC()
{
}

void sub_10009DC38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009DCA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009DD18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009DD88()
{
}

void sub_10009DDE8(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s:There is unexpected invalid signature/entitlements:%08x",  (uint8_t *)&v1,  0x12u);
  sub_100005C38();
}

void sub_10009DE70()
{
}

void sub_10009DEDC()
{
}

void sub_10009DF48( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009DFB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E028()
{
}

void sub_10009E054()
{
}

void sub_10009E080( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E0F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E160( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E1C8()
{
}

void sub_10009E228()
{
}

void sub_10009E254( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E2C4()
{
}

void sub_10009E334( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E3A4()
{
}

void sub_10009E414()
{
}

void sub_10009E484()
{
}

void sub_10009E4F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E564(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Failed in verifying signature(%d)",  (uint8_t *)&v2,  0x12u);
  sub_100005C38();
}

void sub_10009E5E8()
{
}

void sub_10009E620( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E690( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E700()
{
}

void sub_10009E72C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E79C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E80C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009E87C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed rigorous check for:%{public}@ (from %{public}@)",  (uint8_t *)&v4,  0x20u);
}

void sub_10009E914()
{
}

void sub_10009E974()
{
}

void sub_10009E9E0()
{
}

void sub_10009EA4C()
{
}

void sub_10009EAB8()
{
}

void sub_10009EB18()
{
}

void sub_10009EB78()
{
}

void sub_10009EBA4()
{
}

void sub_10009EC04()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_100007EA4((void *)&_mh_execute_header, v1, (uint64_t)v1, "File permissions failed for file:%{public}@(%ld)", v2);
  sub_100005C38();
}

void sub_10009EC78()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_100007EA4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Not a valid fileType (%{public}@) for file: %{public}@",  v2);
  sub_100005C38();
}

void sub_10009ECEC()
{
}

void sub_10009ED4C()
{
}

void sub_10009EDAC()
{
}

void sub_10009EE0C()
{
}

void sub_10009EE6C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 fullKeyList]);
  v5[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s: Cannot get device information for keys: %{public}@",  (uint8_t *)v5);

  sub_10000B0A8();
}

void sub_10009EEF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009EF68(void *a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v7 = 136315906;
  __int16 v8 = "-[MSDMailProcessor pingWithType:]";
  __int16 v9 = 2114;
  __int16 v10 = v6;
  __int16 v11 = 2048;
  id v12 = [a1 code];
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Cannot convert to dictionary - %{public}@(0x%tx). Target: %{public}@",  (uint8_t *)&v7,  0x2Au);
}

void sub_10009F03C()
{
  v2[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
  sub_100005C38();
}

void sub_10009F0AC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100005C40();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ping returned error: %{public}@", v4, 0xCu);

  sub_10000B0A8();
}

void sub_10009F134()
{
}

void sub_10009F194( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F204( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F274()
{
}

void sub_10009F2D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F304( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F334(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  v5[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4( (void *)&_mh_execute_header,  a2,  v4,  "%s - updateManifestInfo failed.  Error:  %{public}@",  (uint8_t *)v5);

  sub_10000B0A8();
}

void sub_10009F3C0()
{
}

void sub_10009F420( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F450( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F4C0()
{
  v2[0] = 136315394;
  sub_10000E4C8();
  sub_100007EA4((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
  sub_100005C38();
}

void sub_10009F530(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to delete cache container for: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009F5A4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to uninstall app: %{public}@ - %{public}@",  (uint8_t *)&v4,  0x16u);
}

void sub_10009F62C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F660( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F694(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@: required key not found or is in unexpected format: %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_10009F740(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Is enrolled!", v1, 2u);
}

void sub_10009F780(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Component retrying: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10009F7F4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "DEBUG - Failed to get kMGQDiskUsageAmountDataReserved.  Default to %d percent of disk's free space.",  (uint8_t *)v1,  8u);
}

void sub_10009F870(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Execution error detected in method selector: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10009F8E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009F954()
{
}

void sub_10009F9B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FA24( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FA94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FAC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FB34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FB64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FBD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FC04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FC38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10009FC6C(void *a1, os_log_s *a2)
{
  int v4 = 134217984;
  unint64_t v5 = (unint64_t)[a1 length] >> 1;
  sub_100004D84((void *)&_mh_execute_header, a2, v3, "Unable to malloc bytes of size: %lu", (uint8_t *)&v4);
}

void sub_10009FCF0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "String should be all hex digits: %@ (bad digit around %ld)",  (uint8_t *)&v3,  0x16u);
}

void sub_10009FD74(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100004D84( (void *)&_mh_execute_header,  a2,  a3,  "Hex strings should have an even number of digits (%@)",  (uint8_t *)&v3);
}

void sub_10009FDE0(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000248C8();
  sub_100007EA4((void *)&_mh_execute_header, a3, v5, "Error removing file %{public}@: %{public}@", v6);

  sub_100015664();
}

void sub_10009FE6C()
{
}

void sub_10009FED4()
{
}

void sub_10009FF3C()
{
}

void sub_10009FFA0()
{
}

void sub_1000A0004(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to load app patches list: %{public}@", v5);

  sub_10000B0A8();
}

void sub_1000A0084(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005C40();
  sub_100004D84((void *)&_mh_execute_header, a2, v4, "Failed to save app patches list: %{public}@", v5);

  sub_10000B0A8();
}

void sub_1000A0104(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_10001562C( (void *)&_mh_execute_header,  a2,  a3,  "Received the following payload in push notification: %{public}@",  (uint8_t *)&v3);
}

void sub_1000A0170(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 apsToken]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_10001562C((void *)&_mh_execute_header, a2, v4, "Received token from APNS framework: %{public}@", (uint8_t *)&v5);
}

void sub_1000A01FC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_100005C38();
}

void sub_1000A0268( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_100005C38();
}

void sub_1000A02D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000A0338( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000A039C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000A0400(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_10004A128();
  sub_100020568( (void *)&_mh_execute_header,  v2,  v3,  "%{public}@ response payload does not contain: %{public}@",  v4,  v5,  v6,  v7,  v8);
}

void sub_1000A048C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 getName]);
  sub_10004A128();
  sub_100020568((void *)&_mh_execute_header, v2, v3, "%{public}@: HTTP status code is %{public}@.", v4, v5, v6, v7, v8);
}

void sub_1000A051C()
{
}

void sub_1000A0548()
{
}

void sub_1000A05A8()
{
}

void sub_1000A05D4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 info]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
  sub_100036D78();
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Cannot write data to file %{public}@, error: %{public}@",  v6,  0x16u);

  sub_100015664();
}

void sub_1000A0674()
{
}

void sub_1000A06D4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100036D78();
  sub_10008F4E8( (void *)&_mh_execute_header,  v2,  v3,  "Session task : %{public}@ - didReceiveChallenge() called, authenticationMethod: %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_100015664();
}

void sub_1000A0754()
{
    v1,
    2u);
  sub_100005C30();
}

void sub_1000A078C(uint64_t a1, void *a2)
{
}

void sub_1000A07F8(uint64_t a1, void *a2)
{
}

void sub_1000A0864()
{
}

void sub_1000A0890()
{
}

void sub_1000A08BC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 info]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 savePath]);
  sub_100005C40();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "File download paused, dispatching task with save path: %@ as paused",  v5,  0xCu);

  sub_100015664();
}

void sub_1000A0958()
{
}

void sub_1000A0984()
{
}

void sub_1000A09B0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000A0A14( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000A0A78(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}@: No URL schema found in %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100005C38();
}

id objc_msgSend__createUninstallOperationForContainer_ofType_containerPath_isContainerized_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createUninstallOperationForContainer:ofType:containerPath:isContainerized:");
}

id objc_msgSend__signInToAppleIDWithContext_forServices_usingAuthResults_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:");
}

id objc_msgSend_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestri ctionChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_coordinatorForAppWithBundleID_withClientID_createIfNotExisting_created_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:");
}

id objc_msgSend_createDeviceManifestForComponent_ofType_withRootPath_userHomePath_andSavePath_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:");
}

id objc_msgSend_doesAvailableUpdateVersion_andUpdateBuild_matchExpectedUpdateVersion_andUpdateBuild_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:");
}

id objc_msgSend_restoreAppDataAttributesUnder_containerType_identifier_manifestUID_deviceUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:");
}

id objc_msgSend_sendAppUsageDataEvent_withExecutable_sessionUUID_sessionStart_sessionEnd_sessionDuration_appOrder_appDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAppUsageDataEvent:withExecutable:sessionUUID:sessionStart:sessionEnd:sessionDuration:appOrder:appDuration:");
}

id objc_msgSend_sendContentUpdateCompletedEvent_withTimeTaken_cachingHubAvailable_isCriticalUpdate_contentUpdateType_andComponentSuccess_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendContentUpdateCompletedEvent:withTimeTaken:cachingHubAvailable:isCriticalUpdate:contentUpdateType:andComponentSuccess:");
}

id objc_msgSend_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}