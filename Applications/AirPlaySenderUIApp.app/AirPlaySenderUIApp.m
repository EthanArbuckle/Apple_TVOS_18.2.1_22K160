void sub_100003F28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003F40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003F50(uint64_t a1)
{
}

void sub_100003F58(uint64_t a1)
{
  v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (dword_100015DA0 <= 30
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554462LL)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) availableOutputDevices]);
    LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke",  33554462LL,  "[%{ptr}] Available output device changed=%@.",  v2,  v3);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) availableOutputDevices]);
  id v4 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = @"IsDiscoveredWithBroker";
    uint64_t v7 = *(void *)v42;
    do
    {
      v8 = 0LL;
      id v34 = v5;
      do
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
        unsigned int v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 airPlayProperties]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v6]);

        if (v13)
        {
          if (*(void *)(*(void *)(a1 + 32) + 48LL))
          {
            id v14 = objc_alloc(&OBJC_CLASS___IRCandidate);
            uint64_t v15 = v7;
            v16 = v6;
            v17 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
            id v18 = [v14 initWithCandidateIdentifier:v17];

            id v19 = objc_alloc_init(&OBJC_CLASS___IRNode);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceID]);
            [v19 setAvOutpuDeviceIdentifier:v20];

            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v19));
            [v18 updateNodes:v21];

            id v22 = objc_alloc(&OBJC_CLASS___IRMediaEvent);
            if (v11) {
              uint64_t v23 = 9LL;
            }
            else {
              uint64_t v23 = 10LL;
            }
            id v24 = [v22 initWithEventType:v23 eventSubType:0];
            uint64_t v25 = *(void *)(a1 + 32);
            v26 = *(dispatch_queue_s **)(v25 + 24);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1000043AC;
            block[3] = &unk_100010410;
            block[4] = v25;
            id v39 = v24;
            id v40 = v18;
            id v27 = v18;
            id v28 = v24;
            dispatch_async(v26, block);
            -[NSMutableSet addObject:](v33, "addObject:", v27);

            v6 = v16;
            uint64_t v7 = v15;
            id v5 = v34;
          }

          if (v11 && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
          {
            if (dword_100015DA0 <= 50
              && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
            {
              uint64_t v29 = *(void *)(a1 + 32);
              v30 = *(const __CFString **)(a1 + 48);
              if (v30)
              {
                else {
                  v30 = @"#Redacted#";
                }
              }

              LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Found output device with deviceID=%@.",  v29,  v30);
            }

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v9);
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
          }
        }

        v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v5);
  }

  if (-[NSMutableSet count](v33, "count"))
  {
    uint64_t v31 = *(void *)(a1 + 32);
    v32 = *(dispatch_queue_s **)(v31 + 24);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100004468;
    v36[3] = &unk_100010438;
    v36[4] = v31;
    v37 = v33;
    dispatch_async(v32, v36);
  }
}

void *sub_1000043AC(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 48);
  if (v2)
  {
    v3 = result;
    if (dword_100015DA0 <= 30)
    {
      if (dword_100015DA0 == -1)
      {
        int v4 = _LogCategory_Initialize(&dword_100015DA0, 33554462LL);
        uint64_t v1 = v3[4];
        if (!v4) {
          return [*(id *)(v1 + 48) addEvent:v3[5] forCandidate:v3[6]];
        }
        uint64_t v2 = *(void *)(v1 + 48);
      }

      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke_2",  33554462LL,  "[%{ptr}] IRSession [%{ptr}]: Adding event %@ for candidate %@",  v1,  v2,  v3[5],  v3[6]);
      uint64_t v1 = v3[4];
    }

    return [*(id *)(v1 + 48) addEvent:v3[5] forCandidate:v3[6]];
  }

  return result;
}

void *sub_100004468(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 48);
  if (v2)
  {
    v3 = result;
    if (dword_100015DA0 <= 30)
    {
      if (dword_100015DA0 == -1)
      {
        int v4 = _LogCategory_Initialize(&dword_100015DA0, 33554462LL);
        uint64_t v1 = v3[4];
        if (!v4) {
          return [*(id *)(v1 + 48) updateCandidates:v3[5]];
        }
        uint64_t v2 = *(void *)(v1 + 48);
      }

      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]_block_invoke_3",  33554462,  "[%{ptr}] IRSession [%{ptr}]: Updating %d candidates",  v1,  v2,  [(id)v3[5] count]);
      uint64_t v1 = v3[4];
    }

    return [*(id *)(v1 + 48) updateCandidates:v3[5]];
  }

  return result;
}

void sub_100004534(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6727LL,  0LL));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

id sub_100004708(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pickRouteWithID:*(void *)(a1 + 40) authString:*(void *)(a1 + 48) useRemoteControl:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

void sub_100004914(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 status];
  if (v4 == (id)2)
  {
    if (dword_100015DA0 <= 50
      && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
      if (v6 && !IsAppleInternalBuild())
      {
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Added device with deviceID=%@ to output context.",  v5,  @"#Redacted#");
      }

      else
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Added device with deviceID=%@ to output context.",  v5,  v7);
      }
    }

    int v12 = 0;
  }

  else
  {
    if (dword_100015DA0 <= 90
      && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554522LL)))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
      if (v9 && !IsAppleInternalBuild())
      {
        int v11 = 0;
        v10 = @"#Redacted#";
      }

      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
        int v11 = 1;
      }

      id v13 = [v3 status];
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 cancellationReason]);
      LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]_block_invoke",  33554522LL,  "[%{ptr}] Failed to add device with deviceID=%@ to output context (status=%d, reason=%@).",  v8,  v10,  v13,  v14);

      if (v11) {
    }
      }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 cancellationReason]);
    unsigned int v16 = [v15 isEqualToString:AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped];

    if (v16) {
      int v12 = -6754;
    }
    else {
      int v12 = -6700;
    }
  }

  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    id v18 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004BA4;
    block[3] = &unk_1000104D8;
    id v20 = v17;
    BOOL v22 = v4 == (id)2;
    int v21 = v12;
    dispatch_async(v18, block);
  }
}

void sub_100004BA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    BOOL v3 = v2 != 0;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain));
    (*(void (**)(uint64_t, BOOL, id))(v1 + 16))(v1, v3, v4);
  }

  else
  {
    (*(void (**)(void, BOOL, void))(v1 + 16))(*(void *)(a1 + 32), v2 != 0, 0LL);
  }
}

void sub_100004D58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (dword_100015DA0 <= 50
      && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
      if (v11 && !IsAppleInternalBuild())
      {
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Created silent connection to deviceID=%@\n",  v10,  @"#Redacted#");
      }

      else
      {
        int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Created silent connection to deviceID=%@\n",  v10,  v12);
      }
    }

    int v16 = 0;
  }

  else
  {
    if (dword_100015DA0 <= 90
      && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554522LL)))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
      if (v14 && !IsAppleInternalBuild())
      {
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke",  33554522LL,  "[%{ptr}] Failed to create silent connection to deviceID=%@ (error=%@, reason=%@)\n",  v13,  @"#Redacted#",  v8,  v9);
      }

      else
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceID]);
        LogPrintF( &dword_100015DA0,  "-[APUIRouteManager _createSilentConnectionToDevice:authString:completion:]_block_invoke",  33554522LL,  "[%{ptr}] Failed to create silent connection to deviceID=%@ (error=%@, reason=%@)\n",  v13,  v15,  v8,  v9);
      }
    }

    if ([v9 isEqualToString:AVOutputDeviceCommunicationChannelOpenCancellationReasonAuthorizationSkipped]) {
      int v16 = -6754;
    }
    else {
      int v16 = -6700;
    }
  }

  [v7 close];
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    id v18 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004FE4;
    block[3] = &unk_1000104D8;
    id v20 = v17;
    BOOL v22 = v7 != 0LL;
    int v21 = v16;
    dispatch_async(v18, block);
  }
}

void sub_100004FE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    BOOL v3 = v2 != 0;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain));
    (*(void (**)(uint64_t, BOOL, id))(v1 + 16))(v1, v3, v4);
  }

  else
  {
    (*(void (**)(void, BOOL, void))(v1 + 16))(*(void *)(a1 + 32), v2 != 0, 0LL);
  }

LABEL_20:
}

void sub_1000053F8(uint64_t a1)
{
  int v2 = *(dispatch_semaphore_s **)(*(void *)(a1 + 32) + 32LL);
  dispatch_time_t v3 = dispatch_time(0LL, 30000000000LL);
  uint64_t v4 = dispatch_semaphore_wait(v2, v3);
  id v9 = *(id *)(a1 + 32);
  objc_sync_enter(v9);
  if (dword_100015DA0 <= 50
    && (dword_100015DA0 != -1 || _LogCategory_Initialize(&dword_100015DA0, 33554482LL)))
  {
    uint64_t v5 = "timed out waiting for";
    if (!v4) {
      uint64_t v5 = "received";
    }
    LogPrintF( &dword_100015DA0,  "-[APUIRouteManager startIntelligentRoutingLocationSensing]_block_invoke",  33554482LL,  "[%{ptr}] IRSession [%{ptr}] %s setSpotOnLocationWithParameters callback with error=%{error}.",  *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 32) + 48LL),  v5,  *(void *)(*(void *)(a1 + 32) + 40LL));
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v4 || *(void *)(v6 + 40))
  {
    [*(id *)(v6 + 48) setDelegate:0];
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = 0LL;
  }

  objc_sync_exit(v9);
}

void sub_10000551C(_Unwind_Exception *a1)
{
}

void sub_100005988(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 48);
  if ((_DWORD)v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v3,  0LL));
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v4, *(void *)(a1 + 32));
  }

  else
  {
    (*(void (**)(void, void, void))(v2 + 16))(*(void *)(a1 + 40), 0LL, *(void *)(a1 + 32));
  }

void sub_100005ABC(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = v2;
  uint64_t v4 = a1[4];
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"BrokerGroupID"];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005B78;
  v6[3] = &unk_1000105A0;
  uint64_t v5 = (void *)a1[6];
  id v7 = (id)a1[5];
  id v8 = v5;
  [v7 _sendBrokerRequest:@"GetInfo" params:v3 timeout:4 completion:v6];
}

id sub_100005B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleGetInfoResponse:a4 requestUUID:a2 error:a3 completion:*(void *)(a1 + 40)];
}

void sub_100005DE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 48);
  if ((_DWORD)v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v3,  0LL));
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v4, *(void *)(a1 + 32));
  }

  else
  {
    (*(void (**)(void, void, void))(v2 + 16))(*(void *)(a1 + 40), 0LL, *(void *)(a1 + 32));
  }

void sub_100005F3C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v2 setObject:a1[4] forKeyedSubscript:@"BrokerAuthString"];
  uint64_t v3 = a1[5];
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"BrokerGroupID"];
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100006008;
  v5[3] = &unk_1000105A0;
  id v4 = (void *)a1[7];
  id v6 = (id)a1[6];
  id v7 = v4;
  [v6 _sendBrokerRequest:@"Authenticate" params:v2 timeout:25 completion:v5];
}

id sub_100006008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleAuthenticationResponse:a4 requestUUID:a2 error:a3 completion:*(void *)(a1 + 40)];
}

void sub_1000060F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);

  id v4 = objc_opt_new(&OBJC_CLASS___APUIBrokerHelperRequestContext);
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKeyedSubscript:v3];
  objc_sync_exit(v5);

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    id v7 = [v6 mutableCopy];
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v8 = v7;
  [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"RequestType"];
  [v8 setObject:v3 forKeyedSubscript:@"RequestUUID"];
  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = IsAppleInternalBuild();
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Sending discovery broker %'@ command %@%?{end} with param %@",  v9,  v10,  v3,  v11 == 0,  v8);
  }

  uint64_t v12 = APSXPCClientSendCommandCreatingReply( @"com.apple.airplay.discoverybroker",  @"BrokerRequest",  v8,  0LL);
  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Sent %'@ request: %#m",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  v12);
  }

  if ((_DWORD)v12)
  {
    APSLogErrorAt(v12, "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke", 209LL, 0LL);
  }

  else
  {
    uint64_t v13 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[APUIBrokerHelperRequestContext semaphore](v4, "semaphore"));
    dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL * *(void *)(a1 + 64));
    uint64_t v15 = dispatch_semaphore_wait(v13, v14);

    if (v15)
    {
      if (dword_100015F30 <= 90
        && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554522LL)))
      {
        LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke",  33554522LL,  "[%{ptr}] Giving up waiting for %'@ request %@ response after %d secs",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  v3,  *(void *)(a1 + 64));
      }

      uint64_t v12 = 4294960574LL;
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  id v16 = *(id *)(a1 + 32);
  objc_sync_enter(v16);
  if ((_DWORD)v12 || !v4)
  {
    if (dword_100015F30 <= 90
      && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554522LL)))
    {
      LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _sendBrokerRequest:params:timeout:completion:]_block_invoke",  33554522LL,  "[%{ptr}] Discovery broker request %@ failed with error: %#m",  *(void *)(a1 + 32),  v3,  v12);
    }

    id v18 = 0LL;
  }

  else
  {
    v17 = v4;
    objc_sync_enter(v17);
    LODWORD(v12) = -[APUIBrokerHelperRequestContext status](v17, "status");
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[APUIBrokerHelperRequestContext response](v17, "response"));
    objc_sync_exit(v17);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v3];
  objc_sync_exit(v16);

  id v19 = *(void **)(a1 + 56);
  if (v19)
  {
    id v20 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006538;
    block[3] = &unk_100010618;
    id v24 = v19;
    id v22 = v3;
    int v25 = v12;
    id v23 = v18;
    dispatch_async(v20, block);
  }
}

void sub_100006510(_Unwind_Exception *a1)
{
}

void sub_100006538(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(int *)(a1 + 56);
  if ((_DWORD)v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v4,  0LL));
    (*(void (**)(uint64_t, uint64_t, id, void))(v2 + 16))(v2, v3, v5, *(void *)(a1 + 40));
  }

  else
  {
    (*(void (**)(void, void, void, void))(v2 + 16))( *(void *)(a1 + 48),  *(void *)(a1 + 32),  0LL,  *(void *)(a1 + 40));
  }

LABEL_16:
}

void sub_100006880(_Unwind_Exception *a1)
{
}

uint64_t sub_100006918(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_1000161A8;
  qword_1000161A8 = v1;

  return APSXPCClientAddEventHandler(@"com.apple.airplay.discoverybroker", @"BrokerResponse", sub_100006958);
}

void sub_100006958(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[APUIBrokerHelper sharedInstance](&OBJC_CLASS___APUIBrokerHelper, "sharedInstance"));
  id v7 = v4;
  if (a1 == @"BrokerResponse" || a1 && (v5 = CFEqual(a1, @"BrokerResponse"), uint64_t v4 = v7, v5))
  {
    [v4 _handleBrokerResponse:a2];
LABEL_5:
    uint64_t v4 = v7;
    goto LABEL_10;
  }

  if (dword_100015F30 <= 90)
  {
    if (dword_100015F30 != -1 || (v6 = _LogCategory_Initialize(&dword_100015F30, 33554522LL), uint64_t v4 = v7, v6))
    {
      LogPrintF( &dword_100015F30,  "void _HandleBrokerServiceResponse(CFStringRef, CFDictionaryRef)",  33554522LL,  "[%{ptr}] Unsupported event type: %@\n",  v4,  a1);
      goto LABEL_5;
    }
  }

LABEL_10:
}

    objc_sync_exit(v4);

    uint64_t v13 = (APUIConnectivityManager *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
    -[APUIConnectivityManager postNotificationName:object:]( v13,  "postNotificationName:object:",  @"kAPUIConnectivityManagerNotification_ConnectivityStateChanged",  v4);
    uint64_t v4 = v13;
    goto LABEL_11;
  }

  objc_sync_exit(v4);
LABEL_11:
}

uint64_t sub_100006C4C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

LABEL_12:
  wifiSSID = self->_wifiPassphrase;
  if (!wifiSSID)
  {
    int v21 = objc_claimAutoreleasedReturnValue([v8 wifiPassphrase]);
    if (!v21) {
      goto LABEL_21;
    }
    isNetworkHidden = v21;
    if (!self->_wifiPassphrase) {
      goto LABEL_46;
    }
  }

  id v16 = objc_claimAutoreleasedReturnValue([v8 wifiPassphrase]);
  if (!v16) {
    goto LABEL_45;
  }
  v17 = (void *)v16;
  wifiPassphrase = self->_wifiPassphrase;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 wifiPassphrase]);
  id v20 = -[NSString isEqualToString:](wifiPassphrase, "isEqualToString:", v19);

  if (wifiSSID)
  {
    if (!v20) {
      goto LABEL_47;
    }
  }

  else
  {

    if ((v20 & 1) == 0) {
      goto LABEL_47;
    }
  }

LABEL_21:
  wifiSSID = self->_captivePortalAuthToken;
  if (!wifiSSID)
  {
    id v27 = objc_claimAutoreleasedReturnValue([v8 captivePortalAuthToken]);
    if (!v27) {
      goto LABEL_30;
    }
    isNetworkHidden = v27;
    if (!self->_captivePortalAuthToken) {
      goto LABEL_46;
    }
  }

  id v22 = objc_claimAutoreleasedReturnValue([v8 captivePortalAuthToken]);
  if (!v22) {
    goto LABEL_45;
  }
  id v23 = (void *)v22;
  captivePortalAuthToken = self->_captivePortalAuthToken;
  int v25 = (void *)objc_claimAutoreleasedReturnValue([v8 captivePortalAuthToken]);
  v26 = -[NSString isEqual:](captivePortalAuthToken, "isEqual:", v25);

  if (wifiSSID)
  {
    if (!v26) {
      goto LABEL_47;
    }
  }

  else
  {

    if ((v26 & 1) == 0) {
      goto LABEL_47;
    }
  }

LABEL_30:
  isNetworkHidden = self->_isNetworkHidden;
  wifiSSID = self->_brokerToken;
  if (!wifiSSID)
  {
    v33 = objc_claimAutoreleasedReturnValue([v8 brokerToken]);
    if (!v33) {
      goto LABEL_40;
    }
    isNetworkHidden = v33;
    if (!self->_brokerToken) {
      goto LABEL_46;
    }
  }

  id v28 = objc_claimAutoreleasedReturnValue([v8 brokerToken]);
  if (!v28) {
    goto LABEL_45;
  }
  uint64_t v29 = (void *)v28;
  brokerToken = self->_brokerToken;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 brokerToken]);
  v32 = -[NSString isEqualToString:](brokerToken, "isEqualToString:", v31);

  if (wifiSSID)
  {
    if (!v32) {
      goto LABEL_47;
    }
  }

  else
  {

    if ((v32 & 1) == 0) {
      goto LABEL_47;
    }
  }

LABEL_40:
  wifiSSID = self->_receiverToken;
  if (!wifiSSID)
  {
    __int128 v41 = objc_claimAutoreleasedReturnValue([v8 receiverToken]);
    if (!v41) {
      goto LABEL_53;
    }
    isNetworkHidden = v41;
    if (!self->_receiverToken)
    {
LABEL_46:

      goto LABEL_47;
    }
  }

  id v34 = objc_claimAutoreleasedReturnValue([v8 receiverToken]);
  if (!v34)
  {
LABEL_45:
    if (wifiSSID) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }

  v35 = (void *)v34;
  receiverToken = self->_receiverToken;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v8 receiverToken]);
  v38 = -[NSString isEqualToString:](receiverToken, "isEqualToString:", v37);

  if (!wifiSSID)
  {

    if ((v38 & 1) == 0) {
      goto LABEL_47;
    }
LABEL_53:
    routeToReceiver = self->_routeToReceiver;
    id v39 = routeToReceiver == [v8 routeToReceiver];
    goto LABEL_48;
  }

  if (v38) {
    goto LABEL_53;
  }
LABEL_47:
  id v39 = 0;
LABEL_48:

  return v39;
}

void sub_100007658(id a1)
{
  if (dword_100016060 <= 50
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _initWifiInterface]_block_invoke",  33554482LL,  "CWFInterface invalidated.");
  }

void sub_100007980(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32LL);
  int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_100007BF0;
  dispatch_time_t v14 = &unk_1000106F0;
  objc_copyWeak(&v16, &location);
  uint64_t v4 = v2;
  uint64_t v15 = v4;
  [v3 setEventHandler:&v11];
  dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (dword_100016060 <= 90
      && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554522LL)))
    {
      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke",  33554522LL,  "[%{ptr}] WiFi has no valid IP after %d secs.",  *(void *)(a1 + 32),  10LL,  v11,  v12,  v13,  v14);
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"WiFi has no valid IP" value:&stru_100010B08 table:0]);
    id v19 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UserErrorDomain",  301028LL,  v9));
  }

  else
  {
    int v6 = 0LL;
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void sub_100007BC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100007BF0(uint64_t a1, void *a2)
{
  id v38 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[4];
    id v6 = [v38 type];
    if (v6 == (id)19)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4Addresses]);
      if (![v15 count])
      {

LABEL_43:
        goto LABEL_44;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4SubnetMasks]);
      id v17 = [v16 count];

      if (!v17) {
        goto LABEL_43;
      }
      NSErrorUserInfoKey v18 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4Addresses]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:0]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4SubnetMasks]);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:0]);
      unsigned int v22 = [v19 isValidIPv4AddressWithSubnetMask:v21];

      if (!v22) {
        goto LABEL_43;
      }
      if (dword_100016060 <= 50
        && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4Addresses]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
        if (v24 && !IsAppleInternalBuild())
        {
          int v25 = 0;
          v37 = @"#Redacted#";
        }

        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4Addresses]);
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue([v36 objectAtIndexedSubscript:0]);
          int v25 = 1;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4SubnetMasks]);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:0]);
        if (v31 && !IsAppleInternalBuild())
        {
          LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2",  33554482LL,  "[%{ptr}] Configured IPv4 address %@ with subnet mask %@ are valid.",  v4,  v37,  @"#Redacted#");
        }

        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv4SubnetMasks]);
          v33 = v23;
          int v34 = v25;
          v35 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndexedSubscript:0]);
          LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2",  33554482LL,  "[%{ptr}] Configured IPv4 address %@ with subnet mask %@ are valid.",  v4,  v37,  v35);

          int v25 = v34;
          id v23 = v33;
        }

        if (v25)
        {
        }
      }
    }

    else
    {
      if (v6 != (id)20) {
        goto LABEL_43;
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv6Addresses]);
      id v8 = [v7 count];

      if (!v8) {
        goto LABEL_43;
      }
      unint64_t v9 = 0LL;
      while (1)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv6Addresses]);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);
        unsigned int v12 = [v11 isValidIPv6Address];

        if (v12) {
          break;
        }
        ++v9;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv6Addresses]);
        id v14 = [v13 count];
      }

      if (dword_100016060 <= 50
        && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv6Addresses]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:v9]);
        if (v27 && !IsAppleInternalBuild())
        {
          LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2",  33554482LL,  "[%{ptr}] Configured IPv6 address %@ is valid.",  v4,  @"#Redacted#");
        }

        else
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 IPv6Addresses]);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:v9]);
          LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2",  33554482LL,  "[%{ptr}] Configured IPv6 address %@ is valid.",  v4,  v29);
        }
      }
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_43;
  }

  if (dword_100016060 <= 60
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554492LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _monitorWiFiIPAddressConfigurationWithCompletion:]_block_invoke_2",  33554492LL,  "APUIConnectivityManager has gone away in CWInterface eventHandler");
  }

LABEL_44:
}

void sub_100008588(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (-[__CFString count](v6, "count"))
  {
    if (dword_100016060 <= 50
      && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
    {
      uint64_t v7 = a1[4];
      id v8 = -[__CFString count](v6, "count");
      id v9 = v8;
      else {
        uint64_t v10 = v6;
      }
      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:]_block_invoke",  33554482LL,  "[%{ptr}] Found %lu networks with scan results = %@.",  v7,  v9,  v10);
    }

    id v16 = (void *)a1[4];
    uint64_t v17 = a1[5];
    uint64_t v18 = a1[6];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0LL));
    [v16 _associateWithNetworkWithPassPhrase:v17 captivePortalAuthToken:v18 scanResults:v19 completion:a1[7]];

    id v11 = 0LL;
  }

  else
  {
    if (v5)
    {
      id v11 = v5;
    }

    else
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"No results found in WiFi scan" value:&stru_100010B08 table:0]);
      int v21 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6700LL,  v14));
    }

    uint64_t v15 = a1[7];
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0LL, v11);
    }
  }
}

void sub_1000088F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100016060 <= 50
      && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke",  33554482LL,  "[%{ptr}] WiFi association failed with error %@.",  v4,  v5);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0LL, v3);
    }
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100008B70;
    v17[3] = &unk_100010768;
    id v6 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 32);
    id v19 = v6;
    [v18 _monitorWiFiIPAddressConfigurationWithCompletion:v17];
    [*(id *)(a1 + 32) _startMonitoringWiFiEvents];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) currentKnownNetworkProfile]);
    if (dword_100016060 <= 50
      && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554482LL)))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 networkName]);
      uint64_t v10 = (void *)v9;
      if (v9 && !IsAppleInternalBuild(v9))
      {
        int v12 = 0;
        id v11 = @"#Redacted#";
      }

      else
      {
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 networkName]);
        int v12 = 1;
      }

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 captiveProfile]);
      uint64_t v15 = (void *)v14;
      if (v14 && !IsAppleInternalBuild(v14))
      {
        LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke",  33554482LL,  "[%{ptr}] WiFi associated with %@. currentNetworkProfile captiveProfile: %@",  v8,  v11,  @"#Redacted#");
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 captiveProfile]);
        LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke",  33554482LL,  "[%{ptr}] WiFi associated with %@. currentNetworkProfile captiveProfile: %@",  v8,  v11,  v16);
      }

      if (v12) {
    }
      }

    [*(id *)(a1 + 32) tagAirPlayNetwork];
  }
}

void sub_100008B70(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5
    && dword_100016060 <= 90
    && (dword_100016060 != -1 || _LogCategory_Initialize(&dword_100016060, 33554522LL)))
  {
    LogPrintF( &dword_100016060,  "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]_block_invoke_2",  33554522LL,  "[%{ptr}] Associated WiFi has no IP configuration.",  *(void *)(a1 + 32));
  }

  [*(id *)(a1 + 32) _stopMonitoringWiFiEvents];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v5;
  if (v3)
  {
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v5 == 0LL, v5);
    uint64_t v4 = v5;
  }
}

void sub_100008D74(_Unwind_Exception *a1)
{
}

void sub_100008EE8(_Unwind_Exception *a1)
{
}

void sub_100008F78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100009008( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100009164(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  if (a2 == 3) {
    objc_msgSend(a4, "handleWiFiInterfaceChangedWithEventInfo:");
  }
}

void sub_10000924C(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  dispatch_semaphore_t v2 = (void *)qword_1000161B8;
  qword_1000161B8 = v1;
}

LABEL_46:
    }

    id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16) {
      continue;
    }
    break;
  }

LABEL_53:
LABEL_54:
  return v13;
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  return v8;
}

id objc_msgSend__associateWithNetworkWithPassPhrase_captivePortalAuthToken_scanResults_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:");
}

id objc_msgSend__startWiFiNetworkScanWithScanParameters_passPhrase_captivePortalAuthToken_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:");
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}