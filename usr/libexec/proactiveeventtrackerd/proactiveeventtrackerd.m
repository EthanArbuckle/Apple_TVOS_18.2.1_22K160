}

LABEL_8:
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PET daemon has launched",  buf,  2u);
  }

  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  dispatch_source_set_event_handler(v3, &stru_10000C378);
  dispatch_resume(v3);
  _set_user_dir_suffix("com.apple.proactiveeventtrackerd");
  id v4 = NSTemporaryDirectory();
  v5 = objc_opt_new(&OBJC_CLASS___PETService);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to initialize PET service. Exiting...",  buf,  2u);
    }

    exit(1);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100004DF8;
  handler[3] = &unk_10000C3A0;
  handler[4] = v5;
  xpc_activity_register("com.apple.proactiveeventtrackerd.sendDaily", XPC_ACTIVITY_CHECK_IN, handler);
  xpc_activity_register("com.apple.proactiveeventtrackerd.updateAssetMetadata", XPC_ACTIVITY_CHECK_IN, &stru_10000C3E0);
  dispatch_main();
}

void sub_100004DF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running sendDaily",  buf,  2u);
    }

    sub_100004F68(v3);
    [*(id *)(a1 + 32) upload];
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5LL)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error setting XPC activity state to DONE",  v4,  2u);
    }
  }
}

void sub_100004ED8(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running updateAssetMetadata",  v3,  2u);
    }

    +[PETService updateMobileAssetMetadataWithXPCActivity:]( &OBJC_CLASS___PETService,  "updateMobileAssetMetadataWithXPCActivity:",  v2);
    sub_100004F68(v2);
  }
}

void sub_100004F68(void *a1)
{
  id v1 = a1;
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
  id v3 = dispatch_queue_create("com.apple.proactiveeventtrackerd.xpcMonitor", 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005018;
  block[3] = &unk_10000C408;
  id v6 = v1;
  id v4 = v1;
  dispatch_after(v2, v3, block);
}

void sub_100005018(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Checking defer for XPC activity",  buf,  2u);
  }

  while (state == 4 || state == 2)
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting XPC activity state to DEFER",  v5,  2u);
      }

      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3LL)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v4 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error setting XPC activity state to DEFER",  v4,  2u);
      }

      break;
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.100000001);
    xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Finished checking defer for XPC activity",  v3,  2u);
  }

void sub_1000051B0(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received SIGTERM. Exiting...",  v1,  2u);
  }

  exit(0);
}

void sub_1000064CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%@ to report data to FBFv2. Error: %@",  buf,  0x16u);
    }

    v13[0] = @"reason";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"PFA__%@", v3));
    v13[1] = @"group";
    v14[0] = v4;
    v14[1] = *(void *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    id v6 = @"com.apple.proactive.petd.upload_failed";
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      id v8 = [*(id *)(a1 + 40) length];
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2048;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ has been sent to FBFv2. Size: %lu",  buf,  0x16u);
    }

    v9 = *(void **)(a1 + 40);
    v12[0] = *(void *)(a1 + 32);
    v11[0] = @"message_group";
    v11[1] = @"compressed_size";
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 length]));
    v11[2] = @"upload_service";
    v12[1] = v4;
    v12[2] = @"PFA";
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
    id v6 = @"com.apple.proactive.petd.uploaded";
  }

  AnalyticsSendEvent(v6, v5);
}

void sub_1000066EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v21[0] = @"reason";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"fbfv2__%@", v3));
    v22[0] = v4;
    v21[1] = @"group";
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageGroup]);
    v22[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    AnalyticsSendEvent(@"com.apple.proactive.petd.upload_failed", v7);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to report data to FBFv2. Error: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageGroup]);
      id v10 = [*(id *)(a1 + 40) length];
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2048;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Upload data has been sent to FBFv2. messageGroup: %@; size: %lu",
        buf,
        0x16u);
    }

    v15[0] = @"message_group";
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 messageGroup]);
    v16[0] = v12;
    v15[1] = @"compressed_size";
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 40) length]));
    v15[2] = @"upload_service";
    v16[1] = v13;
    v16[2] = @"fbfv2";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
    AnalyticsSendEvent(@"com.apple.proactive.petd.uploaded", v14);
  }
}

void sub_100006980(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 sortUsingSelector:"compare:"];
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", @"\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  [v4 writeData:v5];
}

void sub_100006A0C(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_pas_componentsJoinedByString:", @"\n"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
  [v3 writeData:v4];
}

void sub_100006A78(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) assembleUnaggregatedUploadWithTracker:*(void *)(*(void *)(a1 + 40) + 8) messageGroup:a2]);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) _uploadWithUploadPackage:v3];
    id v3 = v4;
  }
}

void sub_100006C88(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MobileAsset metadata has been downloaded successfully.",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error downloading mobileasset metadata",  v4,  2u);
    }

    AnalyticsSendEvent(@"com.apple.proactive.petd.error_update_metadata", &off_10000CCD8);
  }

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5LL)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error setting XPC activity state to DONE",  v3,  2u);
  }

void sub_100007468( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100007884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100007C70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) compressedMessages]);
  id v5 = [v4 length];

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      id v6 = *(_BYTE **)(a1 + 40);
      if (!v6[8])
      {
LABEL_9:
        [*(id *)(a1 + 32) addMessage:v3];
        [*(id *)(a1 + 56) addUnaggregatedMessages:v3];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
        goto LABEL_13;
      }

      if ([v6 _canLog:v3 messageGroup:*(void *)(a1 + 48) isInternal:*(unsigned __int8 *)(a1 + 72)])
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) petConfig]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
        unsigned __int8 v9 = [v7 isAggregatedForMessageName:v8];

        if ((v9 & 1) == 0)
        {
          id v10 = *(void **)(a1 + 40);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
          LODWORD(v10) = [v10 _checkMessageSampling:v11];

          if ((_DWORD)v10)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) petConfig]);
            v13 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
            v14 = (void *)objc_claimAutoreleasedReturnValue([v12 whitelistForMessageName:v13]);

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue([v3 rawBytes]);
              id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PETProtobufRawDecoder filterProtobufData:withWhitelist:]( &OBJC_CLASS___PETProtobufRawDecoder,  "filterProtobufData:withWhitelist:",  v15,  v14));
              [v3 setRawBytes:v16];

              goto LABEL_9;
            }
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected nil message when enumerating log store: %@",  buf,  0xCu);
      }

      v20[0] = @"reason";
      v20[1] = @"msg_group";
      uint64_t v17 = *(void *)(a1 + 48);
      v21[0] = @"nil_message";
      v21[1] = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.message_dropped", v18);
    }
  }

LABEL_13:
}

void sub_100007EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) compressedMessages]);
  id v5 = [v4 length];

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 key]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rawMessage]);

      if (*(_BYTE *)(*(void *)(a1 + 40) + 8LL))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        unsigned int v9 = [v8 isEqualToString:@"PET1Key"];

        if (v9)
        {
          id v10 = objc_alloc(&OBJC_CLASS___PET1Key);
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 rawBytes]);
          id v12 = [v10 initWithData:v11];

          LOBYTE(v11) = [*(id *)(a1 + 40) _canLogPET1Key:v12];
          if ((v11 & 1) == 0) {
            goto LABEL_14;
          }
        }

        else
        {
          if (![*(id *)(a1 + 40) _canLog:v7 messageGroup:@"_aggregated" isInternal:*(unsigned __int8 *)(a1 + 56)]) {
            goto LABEL_14;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) petConfig]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 whitelistForMessageName:v14]);

          if (!v15) {
            goto LABEL_14;
          }
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 rawBytes]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[PETProtobufRawDecoder filterProtobufData:withWhitelist:]( &OBJC_CLASS___PETProtobufRawDecoder,  "filterProtobufData:withWhitelist:",  v16,  v15));
          [v7 setRawBytes:v17];
        }
      }

      [*(id *)(a1 + 32) addMessage:v3];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
LABEL_14:

      goto LABEL_15;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v18 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected nil message when enumerating aggregated state",  v18,  2u);
    }

    AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.message_dropped", &off_10000CDA0);
  }

LABEL_15:
}

id objc_msgSend_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}