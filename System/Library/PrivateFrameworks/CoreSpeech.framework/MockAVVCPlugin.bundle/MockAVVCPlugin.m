id MockRemotePluginXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void v16[2];
  uint64_t v17;
  void v18[2];
  void v19[2];
  void v20[2];
  void v21[2];
  void v22[2];
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MockRemotePluginXPCProtocol));
  v22[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v22[1] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  [v0 setClasses:v2 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:0 ofReply:0];

  v21[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v21[1] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  [v0 setClasses:v4 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:1 ofReply:0];

  v20[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v20[1] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  [v0 setClasses:v6 forSelector:"createMockRemoteDeviceWithName:deviceID:completion:" argumentIndex:1 ofReply:1];

  v19[0] = objc_opt_class(&OBJC_CLASS___NSURL);
  v19[1] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  [v0 setClasses:v8 forSelector:"injectAudio:toDeviceWithUUID:completion:" argumentIndex:0 ofReply:0];

  v18[0] = objc_opt_class(&OBJC_CLASS___NSURL);
  v18[1] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  [v0 setClasses:v10 forSelector:"injectAudio:toDeviceWithUUID:completion:" argumentIndex:1 ofReply:0];

  v17 = objc_opt_class(&OBJC_CLASS___NSUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  [v0 setClasses:v12 forSelector:"disconnectDeviceWithUUID:completion:" argumentIndex:0 ofReply:0];

  v16[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v16[1] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13, v16[0]));
  [v0 setClasses:v14 forSelector:"listMockRemoteDeviecesWithCompletion:" argumentIndex:0 ofReply:1];

  return v0;
}
}

id sub_363C(uint64_t a1)
{
  return [*(id *)(a1 + 40) publishDevice:*(void *)(a1 + 32)];
}

void sub_3668(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceUUID]);
  [v2 setObject:v3 forKey:v4];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v5 inputPlugin:*(void *)(a1 + 32) didPublishDevice:*(void *)(a1 + 40)];
}

void sub_36EC(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceDictionary", 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 allKeys]);

  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidate];
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_37EC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:*(void *)(a1 + 40)]);

    if (v4)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 40)]);

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v16 = 0x2020000000LL;
      uint64_t v17 = 0LL;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_3A20;
      v14[3] = &unk_8308;
      v14[4] = &buf;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_3A30;
      v11[3] = &unk_8330;
      v11[4] = *(void *)(a1 + 32);
      p___int128 buf = &buf;
      uint64_t v7 = *(void *)(a1 + 48);
      id v12 = *(id *)(a1 + 56);
      [v6 speakAudio:v7 playbackStarted:v14 completion:v11];

      _Block_object_dispose(&buf, 8);
LABEL_8:

      return;
    }
  }

  __int128 v8 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Can't find device with uuid %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*(void (**)(uint64_t, void, void *, void, void))(v9 + 16))(v9, 0LL, v6, 0LL, 0LL);
    goto LABEL_8;
  }

void sub_3A00(_Unwind_Exception *a1)
{
}

uint64_t sub_3A20(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

uint64_t sub_3A30(void *a1, uint64_t a2)
{
  id v4 = *(os_log_s **)(a1[4] + 8LL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Device speak audio with startTime = %llu, stopTime = %llu",  (uint8_t *)&v7,  0x16u);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t))(result + 16))( result,  1LL,  0LL,  *(void *)(*(void *)(a1[6] + 8LL) + 24LL),  a2);
  }
  return result;
}

void sub_3B18(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
  if (v2
    && (id v3 = (void *)v2,
        id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]),
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:*(void *)(a1 + 40)]),
        v5,
        v4,
        v3,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
    id v14 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:*(void *)(a1 + 40)]);

    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v7 inputPlugin:*(void *)(a1 + 32) didUnpublishDevice:v14];

    [v14 invalidate];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
    [v8 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1LL, 0LL);
    }
  }

  else
  {
    uint64_t v10 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "deviceUUID %@ not existing in deviceDictionary, already disconnected",  buf,  0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1651LL,  0LL));
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v13);
    }
  }

uint64_t sub_3CFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_3D0C(uint64_t a1)
{
}

void sub_3D14(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceDictionary]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allValues]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_47CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_47E0(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_4850(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_48C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_48D4(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1653LL,  0LL));
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0LL, v4);
}

void sub_4978(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1652LL,  0LL));
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0LL, v4);
}

uint64_t sub_4A1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4A30(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1653LL,  0LL));
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0LL, v4, 0LL, 0LL);
}

void sub_4ADC(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1652LL,  0LL));
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0LL, v4, 0LL, 0LL);
}

uint64_t sub_4B88(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4B9C(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Interrupted", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1653LL,  0LL));
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0LL, v4, 0LL);
}

void sub_4C44(uint64_t a1)
{
  uint64_t v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CSMockRemotePluginServices Invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1652LL,  0LL));
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0LL, v4, 0LL);
}

LABEL_14:
}

uint64_t sub_5714(uint64_t a1)
{
  uint64_t v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) audioFeedTimer]);
  dispatch_source_cancel(v2);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_5760(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readAudioBufferAndFeed];
}

uint64_t sub_578C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}