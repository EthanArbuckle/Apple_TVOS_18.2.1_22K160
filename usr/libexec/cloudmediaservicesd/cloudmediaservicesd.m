void sub_100002100(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100024410;
  qword_100024410 = (uint64_t)v1;
}

void sub_1000027A8(_Unwind_Exception *a1)
{
}

void sub_100002878(id a1, OS_xpc_object *a2)
{
  string = (char *)xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string) {
    string = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
  }
  if ([string isEqualToString:kCMSMediaRemoteSetPlayBackQueueInvokedNotification])
  {
    uint64_t v3 = _CMSQLoggingFacility();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = string;
      v5 = "Received Launchd Event Notification %@";
      v6 = v4;
      uint32_t v7 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, v7);
    }

LABEL_20:
    goto LABEL_21;
  }

  if ([string isEqualToString:kAppleLanguageChangedNotification])
  {
    uint64_t v8 = _CMSQLoggingFacility();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    LOWORD(v12) = 0;
    v5 = "Received Device Language Changed notification";
LABEL_18:
    v6 = v4;
    uint32_t v7 = 2;
    goto LABEL_19;
  }

  if ([string isEqualToString:kMediaSetupServiceChangedNotification])
  {
    uint64_t v9 = _CMSQLoggingFacility();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    LOWORD(v12) = 0;
    v5 = "Received Launchd Event: MediaServices changed notification";
    goto LABEL_18;
  }

  if ([string isEqualToString:@"com.apple.homehubd.endpointActivated"])
  {
    uint64_t v10 = _CMSQLoggingFacility();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    LOWORD(v12) = 0;
    v5 = "Received Launchd Event: Siri Endpoint Activated notification";
    goto LABEL_18;
  }

  if ([string isEqualToString:@"com.apple.homehubd.endpointDeactivated"])
  {
    uint64_t v11 = _CMSQLoggingFacility();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    LOWORD(v12) = 0;
    v5 = "Received Launchd Event: Siri Endpoint Deactivated notification";
    goto LABEL_18;
  }

LABEL_21:
}
}

void sub_100002B14(_Unwind_Exception *a1)
{
}

void sub_100002B28(id a1, CMSPlayer *a2, BOOL *a3)
{
}

void sub_100002BB8(_Unwind_Exception *a1)
{
}

void sub_100002BCC(id a1, CMSPlayer *a2, BOOL *a3)
{
}

void sub_100002DBC(_Unwind_Exception *a1)
{
}

void sub_100002DF0(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = _CMSQLoggingFacility(v9);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000F060();
    }
  }

  else
  {
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 configPublicKey]);
    id v14 = a1[4];
    id v17 = a1[5];
    uint64_t v15 = CMSCloudExtensionLanguageCode();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100002FA8;
    v18[3] = &unk_10001C630;
    objc_copyWeak(&v23, a1 + 8);
    id v19 = a1[5];
    id v20 = a1[4];
    id v21 = a1[6];
    id v22 = a1[7];
    +[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]( &OBJC_CLASS___CMSCloudExtensionConfiguration,  "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfigurati on:languageCode:completion:",  v14,  v17,  0LL,  0LL,  0LL,  v12,  v13,  0LL,  v16,  v18);

    objc_destroyWeak(&v23);
  }
}

void sub_100002F94(_Unwind_Exception *a1)
{
}

void sub_100002FA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = ((uint64_t (*)(void))_CMSQLoggingFacility)();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000F08C((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v16 = WeakRetained;
  if (v5 && WeakRetained)
  {
    uint64_t v17 = ((uint64_t (*)(void))_CMSQLoggingFacility)();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Retrieved service configuration %@",  buf,  0xCu);
    }

    id v19 = -[CMSCloudExtensionSession initWithConfiguration:authProviderDelegate:]( objc_alloc(&OBJC_CLASS___CMSCloudExtensionSession),  "initWithConfiguration:authProviderDelegate:",  v5,  0LL);
    -[CMSCloudExtensionSession setQosClass:](v19, "setQosClass:", 33LL);
    -[CMSCloudExtensionSession setSessionIdentifier:](v19, "setSessionIdentifier:", *(void *)(a1 + 32));
    -[CMSCloudExtensionSession setEndpointIdentifier:](v19, "setEndpointIdentifier:", 0LL);
    -[CMSCloudExtensionSession setRequesterHomeUserID:](v19, "setRequesterHomeUserID:", 0LL);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  *(void *)(a1 + 40),  0LL));
    id v21 = *(const __CFString **)(a1 + 48);
    if (!v21) {
      id v21 = @"pl.cbefd5b0db0e4d9698da967311cb811c.clean";
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/v1/queues/%@",  v21));
    [v20 setPath:v22];

    uint64_t v23 = _CMSQLoggingFacility([v20 setQuery:@"limit=1"]);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v20 URL]);
      *(_DWORD *)buf = 138412290;
      id v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Playlist URL configured as %@", buf, 0xCu);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v20 URL]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100003254;
    v27[3] = &unk_10001C608;
    id v28 = *(id *)(a1 + 56);
    -[CMSCloudExtensionSession getQueueSegmentFromURL:referrer:networkActivity:completion:]( v19,  "getQueueSegmentFromURL:referrer:networkActivity:completion:",  v26,  0LL,  0LL,  v27);
  }
}

void sub_100003254(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = v7;
  if (!a3 || v7)
  {
    id v11 = a2;
    uint64_t v12 = _CMSQLoggingFacility();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000F0F0((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);
    }

    [v11 closeWithForce:1];
  }

  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = a2;
    [v9 configureAGPlayerSession:v10 withInitialQueueSegment:a3 initialUserActivity:0 initialNetworkActivity:0 playerPointer:0];

    [*(id *)(a1 + 32) initiatePlayback];
  }
}

void sub_100003618(_Unwind_Exception *a1)
{
}

void sub_100003634(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _CMSQLoggingFacility(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000F154((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v16 = 138412290;
    uint64_t v17 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "SendPlaybackQueue Sent Successfully to routeID..%@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v4);
  }
}

void sub_100003D84(_Unwind_Exception *a1)
{
}

void sub_100003E1C(_Unwind_Exception *a1)
{
}

void sub_100004288(_Unwind_Exception *a1)
{
}

void sub_1000042A4(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v6 currentAudioSession]);
  unsigned int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 == 1)
    {
      [v6 initiatePlayback];
    }

    else if (!v5)
    {
      [v6 pause];
    }
  }
}

void sub_10000478C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationBundleID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPointer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userAccountHomeUserID]);

  uint64_t v8 = _CMSQLoggingFacility(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138478083;
    id v21 = v4;
    __int16 v22 = 2113;
    uint64_t v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "NowPlaying Service with BundleID: %{private}@, userAccountHomeUserID: %{private}@",  (uint8_t *)&v20,  0x16u);
  }

  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) UUIDString]);
    unsigned int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      uint64_t v13 = _CMSQLoggingFacility(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "User removed now playing service, stopping playback",  (uint8_t *)&v20,  2u);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 contentManager]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v3 contentManager]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 queueController]);

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlaying]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v15 queueController:v17 report:2 nowPlaying:v18 previous:0 timestamp:v19];

      [v3 invalidateNowPlayingInfo];
      [v3 invalidateAudioObjects];
    }
  }
}

void sub_100004AD8(_Unwind_Exception *a1)
{
}

void sub_100004B90(_Unwind_Exception *a1)
{
}

void sub_100004CC8(_Unwind_Exception *a1)
{
}

void sub_100004D90(_Unwind_Exception *a1)
{
}

void sub_100004E08(_Unwind_Exception *a1)
{
}

void sub_100004EFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100004F14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004F24(uint64_t a1)
{
}

void sub_100004F2C(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
  unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_100005070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100005098(uint64_t a1, void *a2, _BYTE *a3)
{
  id result = [a2 isNowPlayingApp];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

void sub_1000051D4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000051E4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100005284(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100024428;
  qword_100024428 = (uint64_t)v1;
}

void sub_10000557C(uint64_t a1)
{
}

void sub_10000563C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = _CMSQLoggingFacility(WeakRetained);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading Homes", buf, 2u);
  }

  if (*((_BYTE *)WeakRetained + 8))
  {
    uint64_t v6 = _CMSQLoggingFacility(v5);
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Homes Already Loaded", v11, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[4] homes]);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained homesLoadedHandlers]);
    id v10 = objc_retainBlock(*(id *)(a1 + 32));
    [v9 addObject:v10];
  }
}

void sub_100005A8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = v6;
  if (v5)
  {
    uint64_t v8 = _CMSQLoggingFacility(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F350((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005C74(_Unwind_Exception *a1)
{
}

id sub_100005C88(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSiriEndpointSettings:a2 home:*(void *)(a1 + 40)];
}

void sub_10000608C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id location)
{
}

void sub_1000060E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = v3;
  if (v3)
  {
    uint64_t v5 = _CMSQLoggingFacility(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000F4A0(a1, (uint64_t)v4, v6);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000615C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = v6;
  if (!v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___CMSHomeManagerDelegate])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
      char v12 = objc_opt_respondsToSelector(v11, "homeManager:didAddSiriEndpoint:withSettings:");

      if ((v12 & 1) == 0)
      {
LABEL_9:
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_10;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      [v10 homeManager:WeakRetained didAddSiriEndpoint:*(void *)(a1 + 32) withSettings:v7];
    }

    goto LABEL_9;
  }

  uint64_t v8 = _CMSQLoggingFacility(v6);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10000F548(a1, (uint64_t)v5, v9);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
LABEL_10:
}

void sub_100006274(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingAccessoryIDs]);
    objc_sync_enter(obj);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingAccessoryIDs]);
    [v2 removeObject:*(void *)(a1 + 40)];

    objc_sync_exit(obj);
  }
}

void sub_1000062F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100006468(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHomesLoaded:1];

  uint64_t v5 = _CMSQLoggingFacility(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) homes]);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Homes Loaded: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = objc_loadWeakRetained(v2);
  [v8 _notifyManagerLoadedHomes:*(void *)(a1 + 32)];
}

LABEL_15:
}

void sub_100006F80(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t start()
{
  uint64_t v0 = _set_user_dir_suffix("com.apple.cloudmediaservicesd");
  if ((v0 & 1) == 0)
  {
    uint64_t v1 = _CMSQLoggingFacility(v0);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10000F748(v2);
    }
  }

  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = _CMSQLoggingFacility(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CloudMediaServices launching", v9, 2u);
  }

  id v6 = +[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared");
  objc_autoreleasePoolPop(v3);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v7 run];

  return 0LL;
}

void sub_1000070E0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100024430;
  qword_100024430 = (uint64_t)v1;
}

void sub_10000744C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100024448;
  qword_100024448 = (uint64_t)v1;
}

id sub_10000760C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeHomePodPlaybackConstraints];
}

LABEL_9:
}

LABEL_12:
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
        __int16 v22 = kUpdateListeningHistoryHomeKitSettingDefaultsKey;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForDefault:kUpdateListeningHistoryHomeKitSettingDefaultsKey]);

        if (v23)
        {
          v25 = [v23 BOOLValue];
          v26 = (int)v25;
          uint64_t v27 = _CMSQLoggingFacility(v25);
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          v29 = v28;
          if ((_DWORD)v9 == v26)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              LOWORD(v33) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "UpdateListeningHistory setting did not change, skipping update",  (uint8_t *)&v33,  2u);
            }

            goto LABEL_20;
          }

          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 67109120;
            v34 = (int)v9;
            id v30 = "Updating cached value of Update Listening History with %d";
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v33, 8u);
          }
        }

        else
        {
          v31 = _CMSQLoggingFacility(v24);
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 67109120;
            v34 = (int)v9;
            id v30 = "Updating initial value of Update Listening History with %d";
            goto LABEL_18;
          }
        }

        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
        -[os_log_s setObject:forDefault:](v29, "setObject:forDefault:", v32, v22);

LABEL_20:
        goto LABEL_21;
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 67109120;
        v34 = (int)v8;
        uint64_t v18 = "Updating cached value of Allow Explicit Content Setting with %d";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v33, 8u);
      }
    }

    else
    {
      uint64_t v19 = _CMSQLoggingFacility(v12);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 67109120;
        v34 = (int)v8;
        uint64_t v18 = "Updating initial value of Allow Explicit Content with %d";
        goto LABEL_10;
      }
    }

    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[os_log_s setObject:forDefault:](v17, "setObject:forDefault:", v20, v11);

    goto LABEL_12;
  }

  id v6 = _CMSQLoggingFacility(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping settings update",  (uint8_t *)&v33,  2u);
  }

id sub_100008B94(id a1, HHEndpoint *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[HHEndpoint accessoryId](a2, "accessoryId"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  return v3;
}

id sub_100008BD0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

void sub_1000091B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1000091D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000091E0(uint64_t a1)
{
}

void sub_1000091E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___CMSServiceSetting);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(a1 + 32) _settingsInfoFromHMSettings:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) homeSettings:v3];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id v8 = *(void **)(a1 + 40);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) UUIDString]);
  objc_msgSend(v8, "na_safeSetObject:forKey:", v7, v9);

  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) copy];
  [v10 _updateCachedData:v11];
}

void sub_1000094D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyPath]);
  unsigned int v5 = [v4 isEqualToString:allowExplicitContentSettingsKeyPath];

  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMBooleanSetting);
    id v7 = v3;
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
    id v9 = v8;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "setAllowExplicitContent:", objc_msgSend(v9, "BOOLValue"));
LABEL_18:

      goto LABEL_19;
    }

    uint64_t v17 = _CMSQLoggingFacility(v10);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000FBB8();
    }
    goto LABEL_17;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 keyPath]);
  unsigned int v12 = [v11 isEqualToString:kHPSettingKeypathUpdateListeningHistory];

  if (v12)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___HMBooleanSetting);
    id v14 = v3;
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    id v9 = v15;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "setUpdateListeningHistory:", objc_msgSend(v9, "BOOLValue"));
      goto LABEL_18;
    }

    uint64_t v19 = _CMSQLoggingFacility(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000FBE4();
    }
LABEL_17:

    goto LABEL_18;
  }

LABEL_19:
}

void sub_100009AB8(_Unwind_Exception *a1)
{
}

void sub_100009E30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100009F48;
    v13[3] = &unk_10001C970;
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    [v11 requestAuthRenewalForMediaService:v7 homeUserID:v8 parentNetworkActivity:v12 completion:v13];
  }

  else
  {
    if (!v9) {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CMSCloudExtensionSessionErrorDomain,  9LL,  0LL));
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_100009F48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 authCredential]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authToken]);

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = 0LL;
    goto LABEL_8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 authCredential]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authHeader]);

  if (!v10)
  {
    uint64_t v12 = _CMSQLoggingFacility(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000FCE0(v5, v13);
    }

    if (!v6) {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CMSCloudExtensionSessionErrorDomain,  9LL,  0LL));
    }
    goto LABEL_7;
  }

LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000A694(uint64_t a1, int a2)
{
  uint64_t v4 = _CMSQLoggingFacility(a1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) sessionIdentifier]);
    int v21 = 136315394;
    __int16 v22 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]_block_invoke";
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s preroll completion for session %{public}@",  (uint8_t *)&v21,  0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) queueController]);
  id v8 = [v7 idleReason];

  uint64_t v10 = _CMSQLoggingFacility(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      uint64_t v13 = CMSPlaybackQueueControllerIdleReasonToString(v8);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v21 = 136315394;
      __int16 v22 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]_block_invoke";
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s preventing starting playback from preroll. discovered the queue controller idled due to %@: ",  (uint8_t *)&v21,  0x16u);
    }
  }

  else
  {
    if (v12)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 120) sessionIdentifier]);
      int v21 = 136315394;
      __int16 v22 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]_block_invoke";
      __int16 v23 = 2114;
      v24 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s compare _prerollPointer for session %{public}@",  (uint8_t *)&v21,  0x16u);
    }

    if (a2
      && [*(id *)(a1 + 32) _validatePrerollContextFromPlayerPointer:*(void *)(*(void *)(a1 + 32) + 120)])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 120);
      *(void *)(v16 + 120) = 0LL;

      uint64_t v19 = _CMSQLoggingFacility(v18);
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        __int16 v22 = "-[CMSPlayer _playMediaForUserActivityDictionary:withPlayerPointer:]_block_invoke";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s preroll completed after final call, start playback",  (uint8_t *)&v21,  0xCu);
      }

      [*(id *)(a1 + 32) initiatePlayback];
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12LL));
}

void sub_10000A918(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) initiatePlayback];
  }

  else
  {
    uint64_t v2 = _CMSQLoggingFacility(a1);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000FE44();
    }
  }

LABEL_74:
LABEL_75:
      return v29;
  }

LABEL_13:
}

void sub_10000BAB4(uint64_t a1)
{
  id v8 = *(id *)(*(void *)(a1 + 32) + 64LL);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0LL;

  uint64_t v4 = v8;
  if (v8)
  {
    [v8 recordEvent:kCMSInterfaceAnalyticsDataRequestTSTypeSuccessEnd];
    uint64_t v4 = v8;
  }

  if (*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 removeObserver:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0LL;

    uint64_t v4 = v8;
  }
}

void sub_10000C5D8(_Unwind_Exception *a1)
{
}

uint64_t sub_10000C654(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C664(uint64_t a1)
{
}

void sub_10000C66C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = _CMSQLoggingFacility(v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000100E8();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 40);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) sessionAuthHeader]);
    uint64_t v13 = *(void *)(a1 + 64);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) parentNetworkActivity]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 configPublicKey]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) siriLanguageCode]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000C804;
    v21[3] = &unk_10001CA10;
    __int128 v19 = *(_OWORD *)(a1 + 72);
    id v18 = (id)v19;
    __int128 v23 = v19;
    id v22 = *(id *)(a1 + 32);
    +[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]( &OBJC_CLASS___CMSCloudExtensionConfiguration,  "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfigurati on:languageCode:completion:",  v20,  v11,  v12,  v13,  v14,  v15,  v16,  0LL,  v17,  v21);
  }
}

void sub_10000C804(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  if (v7)
  {
    uint64_t v9 = _CMSQLoggingFacility(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100010148();
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0LL);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000C8A8(id a1, CMSCloudExtensionSession *a2, NSMutableURLRequest *a3)
{
  uint64_t v13 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSCloudExtensionSession endpointIdentifier](v13, "endpointIdentifier"));
  id v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);

  if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CMSCloudExtensionSession requesterHomeUserID](v13, "requesterHomeUserID"));
    uint64_t v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
    id v10 = [v9 explicitContentSettingForUser:v8];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
    id v12 = [v11 updateListeningHistorySettingForUser:v8 accessoryID:v5];
  }

  else
  {
    id v10 = (id)+[CMSSettingsManager explicitContentSettingForAccessoryID:]( &OBJC_CLASS___CMSSettingsManager,  "explicitContentSettingForAccessoryID:",  v5);
    id v12 = (id)+[CMSSettingsManager listeningHistorySettingForAccessory]( &OBJC_CLASS___CMSSettingsManager,  "listeningHistorySettingForAccessory");
  }

  -[CMSCloudExtensionSession setAllowExplicitContent:](v13, "setAllowExplicitContent:", v10);
}

void sub_10000C9F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9)
  {
    uint64_t v18 = _CMSQLoggingFacility([*(id *)(a1 + 32) completeActivity:3]);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000101BC();
    }

    uint64_t v20 = *(void *)(a1 + 40);
    int v21 = *(void **)(v20 + 48);
    *(void *)(v20 + 4_Block_object_dispose((const void *)(v1 - 160), 8) = 0LL;

    uint64_t v22 = *(void *)(a1 + 80);
    if (v22) {
      (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0LL);
    }
    [v7 closeWithForce:1];
  }

  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared"));
    [v12 reportAnalyticsForMethod:@"Playback.handle" forEventType:kCMSInterfaceAnalyticsDataRequestTSTypeServerCall sessionIdentifier:*(void *)(a1 + 48) andAppBundleIdentifier:*(void *)(a1 + 56)];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 loggingSessionForIdentifier:*(void *)(a1 + 48)]);
    id v15 = WeakRetained[8];
    WeakRetained[8] = (id)v14;

    [WeakRetained[8] recordEvent:kCMSInterfaceAnalyticsDataRequestTSTypePlaybackStarted];
    [WeakRetained _setupAwaitStartPlayingNotification];
    [WeakRetained configureAGPlayerSession:v7 withInitialQueueSegment:v8 initialUserActivity:*(void *)(a1 + 64) initialNetworkActivity:*(void *)(a1 + 32) playerPointer:*(void *)(a1 + 72)];
    [*(id *)(a1 + 32) completeActivity:2];
    uint64_t v16 = *(void *)(a1 + 80);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, 1LL);
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CMSPlayerManager shared](&OBJC_CLASS___CMSPlayerManager, "shared"));
    [v17 reportAnalyticsForMethod:@"Playback.handle" forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess sessionIdentifier:*(void *)(a1 + 48) andAppBundleIdentifier:*(void *)(a1 + 56)];
  }
}

LABEL_10:
    goto LABEL_11;
  }

  id v15 = 0;
LABEL_12:
  uint64_t v16 = _CMSQLoggingFacility(v12);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int128 v19 = @"NO";
    playerPointer = self->_playerPointer;
    int v21 = 138412802;
    if (v15) {
      __int128 v19 = @"YES";
    }
    uint64_t v22 = v19;
    __int128 v23 = 2112;
    v24 = playerPointer;
    v25 = 2112;
    v26 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "_validateServiceContextFromPlayerPointer: %@ Current PlayerPointer:(%@)\n New PlayerPointer:(%@)",  (uint8_t *)&v21,  0x20u);
  }

  return v15;
}

void sub_10000D108( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000D18C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_100024450;
  qword_100024450 = (uint64_t)v1;
}

void sub_10000D270(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("Logging Queue", 0LL);
  uint64_t v2 = (void *)qword_100024468;
  qword_100024468 = (uint64_t)v1;
}

void sub_10000D3F0(id a1, NSString *a2, NSDictionary *a3)
{
}

void sub_10000D4A0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  else {
    double v4 = 3600.0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D5B0;
  v8[3] = &unk_10001CB48;
  objc_copyWeak(&v9, v2);
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v8,  v4));
  id v6 = WeakRetained[2];
  WeakRetained[2] = (id)v5;

  [WeakRetained[1] timeIntervalSinceNow];
  objc_destroyWeak(&v9);
}

void sub_10000D598(_Unwind_Exception *a1)
{
}

void sub_10000D5B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fileMetrics];
}

void sub_10000D690(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

void sub_10000DA14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  [v8 doubleValue];
  double v10 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
  double v12 = v10 * (double)(unint64_t)[v11 unsignedIntegerValue];

  [v6 doubleValue];
  double v14 = v13;

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v7]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v15 unsignedIntegerValue] + 1));
  [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v7];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v7]);
  double v18 = (v12 + v14) / (double)(unint64_t)[v17 unsignedIntegerValue];

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v7];
}

void sub_10000DB5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  double v9 = (char *)[v8 unsignedIntegerValue];

  id v10 = [v6 unsignedIntegerValue];
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  &v9[(void)v10]));
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
}

void sub_10000DC08(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);

  if (v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_10000DCF0(uint64_t a1)
{
  id v17 = *(id *)(*(void *)(a1 + 32) + 32LL);
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  id v5 = *(id *)(*(void *)(a1 + 32) + 48LL);
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 4_Block_object_dispose((const void *)(v1 - 160), 8) = v6;

  double v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) performanceLog]);
  if (v12)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000DE5C;
    v19[3] = &unk_10001CC38;
    v19[4] = *(void *)(a1 + 32);
    [v17 enumerateKeysAndObjectsUsingBlock:v19];
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) occuranceLog]);

  if (v13)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000DFE8;
    v18[3] = &unk_10001CC38;
    void v18[4] = *(void *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v18];
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 8);
  *(void *)(v15 + _Block_object_dispose((const void *)(v1 - 160), 8) = v14;

  [*(id *)(a1 + 32) _saveAnalyticsData];
}

void sub_10000DE5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000DF60;
  v13[3] = &unk_10001CBE8;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6]);
  [v12 setValuesForKeysWithDictionary:v8];

  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 performanceLog]);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);
}

void sub_10000DF60(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_10000DFE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000E0EC;
  v13[3] = &unk_10001CBE8;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6]);
  [v12 setValuesForKeysWithDictionary:v8];

  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[7];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 occuranceLog]);
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v12);
}

void sub_10000E0EC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  if (!v7) {
    id v7 = v8;
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_10000E344( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000E35C(void *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7 = a3;
  if ((objc_opt_isKindOfClass(a2, a1[5]) & 1) == 0 || (objc_opt_isKindOfClass(v7, a1[6]) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_10000E8C8(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count]
    && ([*(id *)(a1 + 40) isEqualToString:@"Start"] & 1) == 0)
  {
    NSLog( @"Warning: CMSLoggerSession should start with kMSLoggingEventTypeStart. We have %@. It will be insert for you %s",  *(void *)(a1 + 40),  "-[CMSLoggingSession recordEvent:occuredAt:]_block_invoke");
    id v2 = -[MSLoggingEvent initForEventType:atTimestamp:]( objc_alloc(&OBJC_CLASS___MSLoggingEvent),  "initForEventType:atTimestamp:",  @"Start",  *(void *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:v2];
  }

  id v3 = -[MSLoggingEvent initForEventType:atTimestamp:]( objc_alloc(&OBJC_CLASS___MSLoggingEvent),  "initForEventType:atTimestamp:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v3];
}

void sub_10000EE14(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventDurations]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventOccurance]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40LL));
  [WeakRetained _sumbitFromSessionType:*(void *)(*(void *)(a1 + 32) + 24) withMetadata:*(void *)(*(void *)(a1 + 32) + 32) withEventDurations:v4 withEventOccurance:v2];
}

void sub_10000F060()
{
}

void sub_10000F08C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F0F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F154( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F1B8()
{
}

void sub_10000F1E4()
{
}

void sub_10000F210()
{
}

void sub_10000F23C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F2AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F2E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F350( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F3B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F424(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[CMSHomeManager _updateSiriEndpointSettings:home:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_100006F80((void *)&_mh_execute_header, a2, a3, "%s Accessory for endpoint %@ is nil", (uint8_t *)&v3);
  sub_100005208();
}

void sub_10000F4A0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_100006F80( (void *)&_mh_execute_header,  a3,  v6,  "Error adding subscription for Siri endpoint accessory %@, %@",  (uint8_t *)&v7);
}

void sub_10000F548(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_100006F80((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error fetching settings for %@, %@", (uint8_t *)&v4);
  sub_100005208();
}

void sub_10000F5C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F634( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F6A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F714( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F748(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "_set_user_dir_suffix failed! Errno: %{darwin.errno}d",  (uint8_t *)v3,  8u);
}

void sub_10000F7D4()
{
}

void sub_10000F800(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create NSData object, %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000F874()
{
}

void sub_10000F8A0()
{
}

void sub_10000F8CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F930()
{
}

void sub_10000F95C()
{
}

void sub_10000F988( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F9F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FA68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FAD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FB48( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FBB8()
{
}

void sub_10000FBE4()
{
}

void sub_10000FC10()
{
}

void sub_10000FC70( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FCE0(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 authCredential]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tokenType]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 authCredential]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authToken]);
  int v9 = 138412546;
  uint64_t v10 = v5;
  sub_10000D0F8();
  sub_100006F80( (void *)&_mh_execute_header,  a2,  v8,  "No auth header for authAccessTokenType %@, token: %@",  (uint8_t *)&v9);
}

void sub_10000FDB8()
{
}

void sub_10000FDE4()
{
}

void sub_10000FE44()
{
}

void sub_10000FE70()
{
}

void sub_10000FED0()
{
}

void sub_10000FEFC()
{
}

void sub_10000FF5C()
{
}

void sub_10000FF88()
{
}

void sub_10000FFB4()
{
}

void sub_100010014()
{
}

void sub_100010074()
{
  int v2 = 136315394;
  uint64_t v3 = "-[CMSPlayer _configurePlayerWith:playerPointer:configURL:completionHandler:]";
  sub_10000D0F8();
  sub_100006F80((void *)&_mh_execute_header, v0, v1, "%s Parsing error in configuration: %@", (uint8_t *)&v2);
  sub_100005208();
}

void sub_1000100E8()
{
}

void sub_100010148()
{
  int v2 = 136315394;
  uint64_t v3 = "-[CMSPlayer _configurePlayerWith:playerPointer:configURL:completionHandler:]_block_invoke";
  sub_10000D0F8();
  sub_100006F80((void *)&_mh_execute_header, v0, v1, "%s Error retrieving and parsing configuration:%@", (uint8_t *)&v2);
  sub_100005208();
}

void sub_1000101BC()
{
}

id objc_msgSend__sumbitFromSessionType_withMetadata_withEventDurations_withEventOccurance_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sumbitFromSessionType:withMetadata:withEventDurations:withEventOccurance:");
}

id objc_msgSend_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfig uration:languageCode:completion:");
}

id objc_msgSend_configureAGPlayerSession_withInitialQueueSegment_initialUserActivity_initialNetworkActivity_playerPointer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configureAGPlayerSession:withInitialQueueSegment:initialUserActivity:initialNetworkActivity:playerPointer:");
}

id objc_msgSend_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:");
}

id objc_msgSend_initWithSession_initialQueueSegment_forUserActivityDictionary_withInitialNetworkActivity_andParentNetworkActivity_playerPointer_playerPath_audioSession_commandHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithSession:initialQueueSegment:forUserActivityDictionary:withInitialNetworkActivity:andParentNetworkActi vity:playerPointer:playerPath:audioSession:commandHandler:");
}

id objc_msgSend_reportAnalyticsForMethod_forEventType_sessionIdentifier_andAppBundleIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportAnalyticsForMethod:forEventType:sessionIdentifier:andAppBundleIdentifier:");
}

id objc_msgSend_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:");
}

id objc_msgSend_sendAGPlaybackQueueToMRMediaRemoteDestination_forIntentID_withIntentData_userActivityDictionary_prepareQueue_withCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendAGPlaybackQueueToMRMediaRemoteDestination:forIntentID:withIntentData:userActivityDictionary:prepareQueue:withCompletion:");
}

id objc_msgSend_sendAGPlaybackQueueToMRMediaRemoteDestination_playbackQueueInfo_withCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAGPlaybackQueueToMRMediaRemoteDestination:playbackQueueInfo:withCompletion:");
}

id objc_msgSend_subscribeToAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_options_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:");
}

id objc_msgSend_updateQueueSegment_forUserActivityDictionary_withInitialNetworkActivity_andParentNetworkActivity_playerPointer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateQueueSegment:forUserActivityDictionary:withInitialNetworkActivity:andParentNetworkActivity:playerPointer:");
}

id objc_msgSend_waitForHomesToLoad(void *a1, const char *a2, ...)
{
  return [a1 waitForHomesToLoad];
}