void sub_100004838(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v5;
  void *v6;
  v5 = NSLocalizedDescriptionKey;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out waiting for a reply to %@ message with ID %@",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kPCSErrorDomain,  75LL,  v3));
  [*(id *)(a1 + 48) runReplyHandlerWithMessage:0 error:v4];
}

uint64_t sub_100004B8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004B9C(uint64_t a1)
{
}

void sub_100004BA4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ProtectedCloudStorage.MessagerRegistration", 0LL);
  v2 = (void *)qword_10002BD50;
  qword_10002BD50 = (uint64_t)v1;

  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)qword_10002BD58;
  qword_10002BD58 = (uint64_t)v3;
}

void sub_100004BEC(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([(id)qword_10002BD58 objectForKeyedSubscript:a1[4]]);
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
  {
    id v5 = [objc_alloc((Class)objc_opt_class(a1[6])) initWithServiceName:a1[4]];
    uint64_t v6 = *(void *)(a1[5] + 8LL);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
    if (v8) {
      [(id)qword_10002BD58 setObject:v8 forKeyedSubscript:a1[4]];
    }
  }
}

id sub_100004EA8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) serviceDelegateSet];
  if ((result & 1) == 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
    v4 = *(void **)(a1 + 32);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 internalQueue]);
    [v3 addDelegate:v4 queue:v5];

    return [*(id *)(a1 + 32) setServiceDelegateSet:1];
  }

  return result;
}

void sub_100005060(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceIdentifier]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
  }

  v42[0] = IDSSendMessageOptionTimeoutKey;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 72)));
  v43[0] = v6;
  v43[1] = &__kCFBooleanTrue;
  v42[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v42[2] = IDSSendMessageOptionExpectsPeerResponseKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2 != 0));
  v43[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  id v36 = 0LL;
  id v37 = 0LL;
  unsigned int v12 = [v9 sendMessage:v10 toDestinations:v5 priority:v11 options:v8 identifier:&v37 error:&v36];
  id v13 = v37;
  id v14 = v36;

  if (v12)
  {
    v15 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v16;
      __int16 v40 = 2112;
      id v41 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sent %@ message with IDS UUID %@",  buf,  0x16u);
    }

    if (v2)
    {
      v30 = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472LL;
      v32 = sub_100005420;
      v33 = &unk_100024998;
      uint64_t v34 = *(void *)(a1 + 40);
      id v17 = v13;
      id v35 = v17;
      v18 = objc_retainBlock(&v30);
      v19 = objc_alloc(&OBJC_CLASS___PCSIDSReplyContext);
      double v20 = *(double *)(a1 + 72) + 30.0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "internalQueue", v30, v31, v32, v33, v34));
      v22 = -[PCSIDSReplyContext initWithTimeout:queue:logDescription:sentID:replyHandler:completion:]( v19,  "initWithTimeout:queue:logDescription:sentID:replyHandler:completion:",  v21,  *(void *)(a1 + 56),  v17,  *(void *)(a1 + 64),  v18,  v20);

      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingReplies]);
      [v23 setObject:v22 forKeyedSubscript:v17];

      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingReplies]);
      id v25 = [v24 count];

      if (v25 == (id)1)
      {
        v26 = (void *)os_transaction_create("com.apple.ProtectedCloudStorage.outstandingReply");
        [*(id *)(a1 + 40) setTransaction:v26];
      }
    }
  }

  else
  {
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27)
    {
      (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0LL, v14);
    }

    else
    {
      v28 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v29;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Error occurred sending %@ message with no replyHandler: %@",  buf,  0x16u);
      }
    }
  }
}

void sub_100005420(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingReplies]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingReplies]);
  id v4 = [v3 count];

  if (!v4) {
    [*(id *)(a1 + 32) setTransaction:0];
  }
}

void sub_100005660(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fromID]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idsContext]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 outgoingResponseIdentifier]);

  if (v5)
  {
    v31[0] = IDSSendMessageOptionTimeoutKey;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64)));
    v32[0] = v6;
    v32[1] = &__kCFBooleanTrue;
    v31[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v31[2] = IDSSendMessageOptionPeerResponseIdentifierKey;
    v32[2] = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) service]);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 72);
    id v25 = 0LL;
    id v26 = 0LL;
    unsigned __int8 v11 = [v8 sendMessage:v9 toDestinations:v3 priority:v10 options:v7 identifier:&v26 error:&v25];
    id v12 = v26;
    id v13 = v25;

    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v14 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sent %@ message with IDS UUID %@",  buf,  0x16u);
      }
    }

    else
    {
      double v20 = (void *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 32);
        v22 = v20;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 idsContext]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 incomingResponseIdentifier]);
        *(_DWORD *)buf = 138412546;
        v28 = v5;
        __int16 v29 = 2112;
        id v30 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Failed to send response with ID %@ to message with ID %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    v15 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      id v17 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 idsContext]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 incomingResponseIdentifier]);
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to get response ID from original message id %@; dropping reply",
        buf,
        0xCu);
    }

    id v12 = 0LL;
    id v13 = 0LL;
  }
}

void sub_100005F84(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_10000605C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) observers]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_10000618C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000061A4(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_1000068AC(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___PCSDeviceManager);
  id v2 = (void *)qword_10002BD68;
  qword_10002BD68 = (uint64_t)v1;
}

void sub_100006A68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100006A80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006A90(uint64_t a1)
{
}

void sub_100006A98(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activePairedDevice]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100006C4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006C6C(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) devices]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100006E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006E5C(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "devices", 0));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pairingID]);
        if ([v9 isEqual:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v8);

          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

void sub_100007068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007080(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) devices]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allValues]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

BOOL sub_1000075E4(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_100007B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 handleIncomingMessage:*(void *)(a1 + 40)];
  }

  else
  {
    id v5 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to get sync connection for IDS device %@; dropping message",
        (uint8_t *)&v7,
        0xCu);
    }
  }
}

void sub_100007D38(_Unwind_Exception *a1)
{
}

void sub_100007D4C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained peers]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] idsDeviceIdentifier]);
    uint64_t v6 = (PCSPeerSyncing *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

    if (!v6)
    {
      int v7 = objc_alloc(&OBJC_CLASS___PCSPeerSyncing);
      id v8 = a1[4];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 manager]);
      uint64_t v6 = -[PCSPeerSyncing initWithDevice:syncingManager:](v7, "initWithDevice:syncingManager:", v8, v9);

      if (v6)
      {
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 peers]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([a1[4] idsDeviceIdentifier]);
        [v10 setObject:v6 forKey:v11];
      }
    }

    -[PCSPeerSyncing updateLastSeen](v6, "updateLastSeen");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 queue]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100007EC8;
    v15[3] = &unk_100024B10;
    id v13 = a1[5];
    uint64_t v16 = v6;
    id v17 = v13;
    id v14 = v6;
    [v12 addOperationWithBlock:v15];
  }
}

uint64_t sub_100007EC8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100007FAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100007FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained peers]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 count] != 0;
}

void sub_100008100(_Unwind_Exception *a1)
{
}

void sub_100008114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained peers]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:*(void *)(a1 + 32)]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) queue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000081DC;
  v7[3] = &unk_100024B88;
  id v8 = v4;
  char v9 = *(_BYTE *)(a1 + 56);
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

id sub_1000081DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkSyncing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1000082D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000082E8(uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained peers]);

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v10 = objc_loadWeakRetained(v2);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peers]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000084A4;
        v15[3] = &unk_100024B88;
        id v16 = v12;
        char v17 = *(_BYTE *)(a1 + 48);
        id v14 = v12;
        [v13 addOperationWithBlock:v15];
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);
  }
}

id sub_1000084A4(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncing  with: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) checkSyncing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100008940(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void sub_100008B3C(id a1, PCSPeerSyncing *a2)
{
}

LABEL_28:
LABEL_29:
}

void sub_100009EB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100009EE0(uint64_t a1, uint64_t a2)
{
}

void sub_100009EEC(uint64_t a1)
{
}

void sub_100009EF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  [WeakRetained setPendingRequest:0];

  id v8 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412546;
    id v34 = v5;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "reply from initital checkin: %@ error: %@",  (uint8_t *)&v33,  0x16u);
  }

  if (v6)
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    [v9 keyFailure:0];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"v"]);
    id v12 = [v11 intValue];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
    [v13 setClientVersion:v12];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"h"]);

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0)
    {

      id v9 = 0LL;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    char v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"r"]);
    unsigned int v18 = [v17 intValue];

    switch(v18)
    {
      case 3u:
        __int128 v21 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Client requests new protocol",  (uint8_t *)&v33,  2u);
        }

        id v22 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 syncingManager]);
        id v24 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 client]);
        [v23 updateClient:v25];

        id v26 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 client]);
        [v27 setProtocolVersion:1];

        id v28 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 syncingManager]);
        id v30 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 client]);
        [v29 saveClient:v31];

        id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        [v20 sendKeys];
        break;
      case 2u:
        v32 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138412290;
          id v34 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Client requests updating keys: have %@",  (uint8_t *)&v33,  0xCu);
        }

        id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        [v20 sendKeysOld];
        break;
      case 1u:
        __int128 v19 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138412290;
          id v34 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Client have keys: %@",  (uint8_t *)&v33,  0xCu);
        }

        id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        [v20 haveKeys:v9];
        break;
      default:
        id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
        [v20 keyFailure:v9];
        break;
    }
  }
}

void sub_10000A6E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000A70C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
  [WeakRetained setPendingRequest:0];
  [WeakRetained setKeys:0];
  id v8 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "reply from send key: %@ error: %@",  (uint8_t *)&v17,  0x16u);
  }

  if (v6)
  {
    [WeakRetained keyFailure:0];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"h"]);

    if (v10)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
      {

        id v10 = 0LL;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"r"]);
    unsigned int v14 = [v13 intValue];

    uint64_t v15 = (os_log_s *)qword_10002BDE0;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
    if (v14 == 1)
    {
      if (v16)
      {
        int v17 = 138412290;
        id v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "client confirms it have key: %@",  (uint8_t *)&v17,  0xCu);
      }

      [WeakRetained haveKeys:v10];
    }

    else
    {
      if (v16)
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "client failed", (uint8_t *)&v17, 2u);
      }

      [WeakRetained keyFailure:v10];
    }
  }
}

void sub_10000ACA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_10000ACE8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "pcsKeyData:"));
  if (v3)
  {
    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

void sub_10000AD50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "reply from send key: %@ error: %@",  (uint8_t *)&v28,  0x16u);
    }

    if (v6)
    {
      [WeakRetained keyFailure:0];
      [WeakRetained setPendingRequest:0];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained syncingManager]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[2] idsDeviceIdentifier]);
      [v9 signalComplete:v10];
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"r"]);
      unsigned int v13 = [v12 intValue];

      unsigned int v14 = (os_log_s *)qword_10002BDE0;
      BOOL v15 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          int v28 = 67109120;
          LODWORD(v29) = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client failed: %d", (uint8_t *)&v28, 8u);
        }
      }

      else
      {
        if (v15)
        {
          BOOL v16 = *(void **)(a1 + 32);
          int v17 = v14;
          unsigned int v18 = [v16 count];
          int v28 = 67109120;
          LODWORD(v29) = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "client confirms stored keys: %u",  (uint8_t *)&v28,  8u);
        }

        __int16 v19 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = v19;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 idsDeviceIdentifier]);
          v23 = *(void **)(a1 + 32);
          int v28 = 138412546;
          id v29 = v22;
          __int16 v30 = 2112;
          id v31 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "device: %@ type: 1 keys: %@",  (uint8_t *)&v28,  0x16u);
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained syncingManager]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained device]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 idsDeviceIdentifier]);
        [v24 updateSyncedKeysToDevice:v26 type:1 keys:*(void *)(a1 + 32)];
      }

      uint64_t v27 = *(void *)(a1 + 40);
      if (v27) {
        [WeakRetained sendSomeKeys:v27 dsid:*(void *)(a1 + 48)];
      }
      else {
        [WeakRetained sendCurrentKeys:*(void *)(a1 + 48)];
      }
    }
  }
}

void sub_10000B1D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000B1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PCSIdentitySetCopyCurrentIdentityWithError(*(void *)(a1 + 40), a2, 0LL);
  if (v4)
  {
    id v5 = (const void *)v4;
    [*(id *)(a1 + 32) setObject:PCSIdentityGetPublicKey() forKeyedSubscript:a2];
    CFRelease(v5);
  }

void sub_10000B250(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "set current: %@", (uint8_t *)&v9, 0xCu);
  }

  if (WeakRetained)
  {
    [WeakRetained setPendingRequest:0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained syncingManager]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[2] idsDeviceIdentifier]);
    [v7 signalComplete:v8];

    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

void sub_10000B7AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000B7D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v20) = 138412290;
        *(void *)((char *)&v20 + 4) = v6;
        int v9 = "Failed to send message to peer: %@, trying later";
        id v10 = (os_log_s *)v8;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, v11);
        goto LABEL_9;
      }

      goto LABEL_9;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"r"]);
    unsigned int v14 = [v13 intValue];

    BOOL v15 = (os_log_s *)qword_10002BDE0;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LODWORD(v20) = 67109120;
        DWORD1(v20) = v14;
        int v9 = "Other failure to store iCDP state: %d, trying later";
        id v10 = v15;
        uint32_t v11 = 8;
        goto LABEL_8;
      }

LABEL_9:
      objc_msgSend(WeakRetained, "setPendingRequest:", 0, v20);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained syncingManager]);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[2] idsDeviceIdentifier]);
      [v17 signalComplete:v18];

      goto LABEL_10;
    }

    if (v16)
    {
      int v19 = *(unsigned __int8 *)(a1 + 56);
      LODWORD(v20) = 67109120;
      DWORD1(v20) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Peer confirmed iCDP state too: %d",  (uint8_t *)&v20,  8u);
    }

    [WeakRetained setPeeriCDPStatus:*(unsigned __int8 *)(a1 + 56)];
    [WeakRetained setPeerCircleStatus:*(unsigned __int8 *)(a1 + 57)];
    [WeakRetained sendSomeKeys:*(void *)(a1 + 32) dsid:*(void *)(a1 + 40)];
  }

LABEL_10:
}
}

LABEL_27:
}

id sub_10000C414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) sendReply:a2 error:a4 toMessage:*(void *)(a1 + 40)];
}

id sub_10000C638()
{
  if (qword_10002BD80 != -1) {
    dispatch_once(&qword_10002BD80, &stru_100024E18);
  }
  return (id)qword_10002BD78;
}

void sub_10000C678(uint64_t a1)
{
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[7]);
    dispatch_object_t v3 = v2[3];
    if (v3)
    {
      id v4 = objc_retainBlock(v3);
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3032000000LL;
      v16[3] = sub_10000C800;
      v16[4] = sub_10000C810;
      int v17 = v2[8];
      dispatch_object_t v5 = v2[8];
      v2[8] = 0LL;

      dispatch_object_t v6 = v2[6];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10000C818;
      v13[3] = &unk_100024D80;
      uint64_t v7 = v4;
      unsigned int v14 = v7;
      BOOL v15 = v16;
      -[dispatch_object_s addOperationWithBlock:](v6, "addOperationWithBlock:", v13);

      _Block_object_dispose(v16, 8);
    }

    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * (void)v2[4]);
    id v9 = sub_10000C638();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C870;
    block[3] = &unk_100024DA8;
    id v12 = v2;
    dispatch_after(v8, v10, block);
  }
}

void sub_10000C7E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10000C800(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C810(uint64_t a1)
{
}

void sub_10000C818(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0LL;
  }

void sub_10000C870(uint64_t a1)
{
}

uint64_t sub_10000C948(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(_BYTE *)(result + 40) == 0;
  return result;
}

void sub_10000CA08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_object_t v6 = WeakRetained;
  if (!*((void *)WeakRetained + 9) && !*((void *)WeakRetained + 8))
  {
    id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) label]);
    uint64_t v4 = os_transaction_create([v3 UTF8String]);
    dispatch_object_t v5 = (void *)v6[8];
    v6[8] = v4;

    id WeakRetained = v6;
  }

  dispatch_source_merge_data(*((dispatch_source_t *)WeakRetained + 7), 1uLL);
}

void sub_10000CB9C(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("PCSDelayedActionQueue", v4);
  id v3 = (void *)qword_10002BD78;
  qword_10002BD78 = (uint64_t)v2;
}

void sub_10000CE64(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___PCSMetrics);
  dispatch_queue_t v2 = (void *)qword_10002BD90;
  qword_10002BD90 = (uint64_t)v1;
}

void sub_10000D31C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000D34C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  if ((PCSServiceItemTypeIsManatee(a2) & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    v23 = v4;
    uint64_t IndexByName = PCSServiceItemGetIndexByName(a2);
    v32[0] = kSecClass;
    v32[1] = kSecAttrSecurityDomain;
    v33[0] = kSecClassInternetPassword;
    v33[1] = kPCSServiceName;
    CFStringRef v6 = kSecMatchLimitAll;
    v32[2] = kSecMatchLimit;
    void v32[3] = kSecAttrServer;
    uint64_t v7 = *(void *)(a1 + 40);
    v33[2] = kSecMatchLimitAll;
    v33[3] = v7;
    v33[4] = &__kCFBooleanTrue;
    v32[4] = kSecAttrSynchronizable;
    v32[5] = kSecAttrType;
    uint64_t v22 = IndexByName;
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v32[6] = kSecReturnPersistentRef;
    v33[5] = v8;
    v33[6] = &__kCFBooleanTrue;
    id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  7LL));

    CFTypeRef result = 0LL;
    CFIndex Count = 0LL;
    if (!SecItemCopyMatching(v9, &result))
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)result);
      CFTypeRef v11 = result;
      if (result)
      {
        CFTypeRef result = 0LL;
        CFRelease(v11);
      }

      CFStringRef v6 = kSecMatchLimitAll;
    }

    v30[0] = kSecClass;
    v30[1] = kSecAttrSecurityDomain;
    v31[0] = kSecClassInternetPassword;
    v31[1] = kPCSServiceName;
    v30[2] = kSecMatchLimit;
    v30[3] = kSecAttrServer;
    uint64_t v12 = *(void *)(a1 + 40);
    v31[2] = v6;
    void v31[3] = v12;
    v31[4] = &__kCFBooleanTrue;
    v30[4] = kSecAttrSynchronizable;
    v30[5] = kSecAttrType;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v22 | 0x10000));
    v30[6] = kSecReturnAttributes;
    v31[5] = v13;
    v31[6] = &__kCFBooleanTrue;
    unsigned int v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  7LL));

    CFTypeRef result = 0LL;
    if (!SecItemCopyMatching(v14, &result))
    {
      Count += CFArrayGetCount((CFArrayRef)result);
      if (*(_DWORD *)(a1 + 88) == 1)
      {
        uint64_t v15 = (const __CFArray *)result;
        context[0] = _NSConcreteStackBlock;
        context[1] = 3221225472LL;
        context[2] = sub_10000D6C8;
        context[3] = &unk_100024E60;
        int8x16_t v21 = *(int8x16_t *)(a1 + 40);
        id v16 = (id)v21.i64[0];
        int v28 = v22;
        __int128 v17 = *(_OWORD *)(a1 + 64);
        int8x16_t v25 = vextq_s8(v21, v21, 8uLL);
        __int128 v26 = v17;
        uint64_t v27 = *(void *)(a1 + 80);
        v34.length = CFArrayGetCount(v15);
        v34.location = 0LL;
        CFArrayApplyFunction(v15, v34, (CFArrayApplierFunction)sub_10000E2C8, context);
      }

      CFTypeRef v18 = result;
      if (result)
      {
        CFTypeRef result = 0LL;
        CFRelease(v18);
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"keycount_%u",  v22));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", Count));
    [*(id *)(a1 + 56) setObject:v20 forKeyedSubscript:v19];

    uint64_t v4 = v23;
  }

  objc_autoreleasePoolPop(v4);
}

void sub_10000D6C8(uint64_t a1, CFDictionaryRef theDict)
{
  unsigned __int8 v4 = objc_msgSend( *(id *)(a1 + 32),  "getKeyInfoWithDSID:service:publicKey:",  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 72),  CFDictionaryGetValue(theDict, kSecAttrAccount));
  if ((v4 & 1) != 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }
  Value = CFDictionaryGetValue(theDict, kSecAttrIsNegative);
  CFStringRef v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
  if (v6)
  {
    CFTypeRef v11 = v6;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v7);
    CFStringRef v6 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      unsigned int v9 = [v11 BOOLValue];
      CFStringRef v6 = v11;
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 56);
LABEL_9:
        ++*(void *)(*(void *)(v10 + 8) + 24LL);
        goto LABEL_10;
      }
    }
  }

  if ((v4 & 2) != 0)
  {
    uint64_t v10 = *(void *)(a1 + 64);
    goto LABEL_9;
  }

void sub_10000D9BC(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000DA20;
  v3[3] = &unk_100024ED8;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = a2;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_10000E2DC, v3);
}

void sub_10000DA20(uint64_t a1, int a2, CFDictionaryRef theDict)
{
  Value = (const __CFArray *)CFDictionaryGetValue(theDict, kPCSSecureBackupCFKeyRegistryPublicIdentities);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000DAB0;
  v5[3] = &unk_100024EB0;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  v7.length = CFArrayGetCount(Value);
  v7.location = 0LL;
  CFArrayApplyFunction(Value, v7, (CFArrayApplierFunction)sub_10000E2C8, v5);
}

void sub_10000DAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = PCSPublicIdentityCreateWithPublicKeyInfo(a2, 0LL);
  if (v3)
  {
    unsigned __int8 v4 = (const void *)v3;
    uint64_t ServiceID = PCSPublicIdentityGetServiceID();
    [*(id *)(a1 + 32) addKeyWithDSID:*(void *)(a1 + 40) service:ServiceID publicKey:PCSPublicIdentityGetPublicID(v4)];
    CFRelease(v4);
  }

id sub_10000DB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) markKeyNegativeWithDSID:a2 service:a3];
}

uint64_t sub_10000E2C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10000E2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void sub_10000EBFC(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___PCSKeySyncing);
  dispatch_queue_t v2 = (void *)qword_10002BD98;
  qword_10002BD98 = (uint64_t)v1;
}

uint64_t sub_10000EE28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

LABEL_13:
    dispatch_time_t v8 = 0LL;
    goto LABEL_14;
  }

  __int128 v6 = v5;
  CFRange v7 = (void *)PCSIdentitySetCopyIdentity(v5, v4);
  CFRelease(v6);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v14 = v4;
      unsigned int v9 = "Failed to get identity for public key %@";
      uint64_t v10 = 12;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  dispatch_time_t v8 = (void *)PCSIdentityCopyExportedPrivateKey(v7, &cf);
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unsigned int v14 = v7;
    uint64_t v15 = 2112;
    id v16 = cf;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to get exported data for identity %@: %@",  buf,  0x16u);
  }

  CFRelease(v7);
  if (cf) {
    CFRelease(cf);
  }
LABEL_14:

  return v8;
}

void sub_10000F6B8(uint64_t a1, void *a2)
{
  unsigned __int8 v4 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Updating service %@",  buf,  0xCu);
  }

  uint64_t IndexByName = PCSServiceItemGetIndexByName(a2);
  if ((_DWORD)IndexByName)
  {
    uint64_t v6 = IndexByName;
    if ((_DWORD)IndexByName == 54
      || (_DWORD)IndexByName == 56
      || PCSServiceItemTypeIsShareableManatee(a2))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = a2;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Skipping identities for service %@",  buf,  0xCu);
      }

      if (([*(id *)(a1 + 32) deleteMirrorKeys:v6] & 1) == 0
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = a2;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to remove MirrorKeys from registry for %@",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    CFRange v7 = (void *)PCSIdentitySetCopyOrderedIdentities(*(void *)(a1 + 40), a2);
    if (v7)
    {
      unsigned __int8 v8 = [*(id *)(a1 + 32) beginExclusiveTransaction];
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v8 & 1) != 0)
      {
        uint64_t v27 = v4;
        if (v9)
        {
          id v10 = [v7 count];
          *(_DWORD *)buf = 134218242;
          id v34 = v10;
          __int16 v35 = 2112;
          id v36 = a2;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Syncing %lu identities %@ with database",  buf,  0x16u);
        }

        [*(id *)(a1 + 32) markMirrorKey:v6 type:3];
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v26 = v7;
        id v11 = v7;
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          char v15 = 1;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
              CFTypeRef v18 = objc_autoreleasePoolPush();
              int ServiceID = PCSIdentityGetServiceID(v17);
              if (ServiceID) {
                BOOL v20 = ServiceID == (_DWORD)v6;
              }
              else {
                BOOL v20 = 0;
              }
              if (v20)
              {
                int8x16_t v21 = (void *)PCSIdentityCopyPublicKeyInfo(v17);
                uint64_t PublicKey = PCSIdentityGetPublicKey(v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue(PublicKey);
                [*(id *)(a1 + 32) setMirrorKey:v23 service:v6 type:3 publicIdentity:v21];
                [*(id *)(a1 + 32) updateMirrorKey:v23 service:v6 type:3 newType:1 current:v15 & 1];

                char v15 = 0;
              }

              objc_autoreleasePoolPop(v18);
            }

            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }

          while (v13);
        }

        [*(id *)(a1 + 32) endTransaction:1];
        CFRange v7 = v26;
        unsigned __int8 v4 = v27;
        goto LABEL_35;
      }

      if (v9)
      {
        *(_WORD *)buf = 0;
        id v24 = "failed to open database transaction";
        uint32_t v25 = 2;
        goto LABEL_34;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = a2;
      id v24 = "Failed to get copy of identities of service type: %@";
      uint32_t v25 = 12;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
    }

LABEL_35:
  }

LABEL_36:
  objc_autoreleasePoolPop(v4);
}

void sub_100010290(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  CFRange v7 = objc_alloc(&OBJC_CLASS___PCSKeyClient);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accounts]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);
  id v11 = -[PCSKeyClient initWithName:values:dsid:](v7, "initWithName:values:dsid:", v6, v5, v9);

  id v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    id v10 = v11;
  }
}

void sub_100010420(id a1)
{
  id v6 = (id)os_transaction_create("starting IDS");
  dispatch_queue_attr_t v1 = objc_autoreleasePoolPush();
  dispatch_queue_t v2 = objc_alloc(&OBJC_CLASS___PCSSyncing);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  unsigned __int8 v4 = -[PCSSyncing initWithPCSKeySyncing:](v2, "initWithPCSKeySyncing:", v3);
  id v5 = (void *)qword_10002BDA8;
  qword_10002BDA8 = (uint64_t)v4;

  [(id)qword_10002BDA8 setupMetrics];
  objc_autoreleasePoolPop(v1);
}

void sub_100010AB8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100026688));
  dispatch_queue_t v2 = (void *)qword_10002BDC0;
  qword_10002BDC0 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000266A0));
  unsigned __int8 v4 = (void *)qword_10002BDC8;
  qword_10002BDC8 = v3;

  v8[0] = @"com.apple.ProtectedCloudStorage.mobileBackupStateChange";
  v8[1] = @"com.apple.ProtectedCloudStorage.test.mobileBackupStateChange";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  CFRange v7 = (void *)qword_10002BDD0;
  qword_10002BDD0 = v6;
}

void sub_100011200(_Unwind_Exception *a1)
{
}

void sub_100011224(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v34 = 0LL;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSPendingRollEpoch,  &v34));
    id v4 = v34;
    id v5 = v4;
    if (v3) {
      BOOL v6 = v4 == 0LL;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      CFRange v7 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      goto LABEL_24;
    }

    id v33 = 0LL;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"lastMobileBackupStatus",  &v33));
    id v9 = v33;
    id v10 = v9;
    if (!v8 || v9)
    {
      id v24 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) settings]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v8]);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mobileBackup]);
      unint64_t v14 = (unint64_t)[v13 isBackupEnabled];

      char v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) settings]);
      unsigned int v30 = [v15 BOOLForKey:v8];

      uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) getRollEpoch]);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAnalytics logger](&OBJC_CLASS___PCSAnalytics, "logger"));
      if (!v12 && v16)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) settings]);
        [v17 removeObjectForKey:v3];

        unsigned int v29 = v14;
        uint64_t v18 = kPCSErrorDomain;
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No last mobile backup status, but have a keyroll epoch time (%@)",  v16));
        v38 = v19;
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
        int8x16_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  118LL,  v20));

        id v12 = 0LL;
        id v10 = 0LL;

        [v32 logRecoverableError:v21 forEvent:PCSEventKeyRollStateChange withAttributes:0];
        unint64_t v14 = v29;
      }

      if ((_DWORD)v14 == v30)
      {
        __int128 v31 = (void *)v16;
        uint64_t v25 = kPCSErrorDomain;
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"False alarm check for backup state change"));
        id v36 = v26;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v25,  131LL,  v27));

        [v32 logRecoverableError:v28 forEvent:PCSEventKeyRollStateChange withAttributes:0];
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

        goto LABEL_24;
      }

      uint64_t v22 = (void *)v16;
      if (((v30 ^ 1 | v14) & 1) == 0)
      {
        [*(id *)(a1 + 40) recordEpochForKeyroll];
        [v32 logSuccessForEvent:PCSEventKeyRollStateChange];
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) settings]);
      [v23 setBool:v14 forKey:v8];

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }

LABEL_24:
    goto LABEL_25;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_25:
}

void sub_100011CD8(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id v5 = objc_autoreleasePoolPush();
  if (state == 2)
  {
    [*(id *)(a1 + 32) triggerKeyRolling];
  }

  else if (!state)
  {
    [*(id *)(a1 + 32) setScheduledKeyrollActivity:v3];
    if ([*(id *)(a1 + 32) activityIsScheduled:v3])
    {
      BOOL v6 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Identity key roll is already scheduled.",  (uint8_t *)&v10,  2u);
      }
    }

    else
    {
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, *(void *)(a1 + 40));
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
      xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      xpc_activity_set_criteria(v3, v7);
      unsigned __int8 v8 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 134217984;
        uint64_t v11 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Scheduled an identity key roll attempt to occur in %lld seconds.",  (uint8_t *)&v10,  0xCu);
      }
    }
  }

  objc_autoreleasePoolPop(v5);
}

void sub_1000120F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100012114(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100012124(uint64_t a1)
{
}

void sub_10001212C(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  char v5 = a4;
  if (a4 && a5 && *(void *)(a1 + 32))
  {
    uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)PCSIdentitySetGetCurrentCreationTime(*(void *)(a1 + 80), a3, 0LL));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ([*(id *)(a1 + 32) compare:v10] == (id)1) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

  int v11 = *(unsigned __int8 *)(a1 + 88);
  if (*(_BYTE *)(a1 + 88) && (v5 & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 89) && ([*(id *)(a1 + 40) containsObject:a3] & 1) == 0)
    {
      v26[0] = kSecClass;
      v26[1] = kSecAttrSynchronizable;
      v26[2] = kSecAttrSecurityDomain;
      v26[3] = kSecAttrServer;
      uint64_t v12 = *(void *)(a1 + 48);
      v27[2] = kPCSServiceName;
      v27[3] = v12;
      v27[0] = kSecClassInternetPassword;
      v27[1] = &__kCFBooleanTrue;
      v26[4] = kSecAttrType;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  a2 | 0x10000u));
      v26[5] = kSecAttrIsNegative;
      v27[4] = v13;
      v27[5] = &__kCFBooleanTrue;
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  6LL));

      *(void *)uint64_t v25 = 0LL;
      int v15 = _PCSKeychainForwardTable(v14, v25);
      if (v15 != -25300)
      {
        int v16 = v15;
        if (v15)
        {
          uint64_t v17 = (os_log_s *)qword_10002BDE0;
          if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_ERROR)) {
            sub_100017A40(a3, v16, v17);
          }
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      }
    }

    int v11 = *(unsigned __int8 *)(a1 + 88);
  }

  if (v11 && PCSServiceItemEscrowManateeIdentityByName(a3))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) registry]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 allMobileBackupPublicKeys]);
      uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8LL);
      int8x16_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }

    uint64_t v22 = PCSIdentitySetCopyCurrentIdentityWithError(*(void *)(a1 + 80), a3, 0LL);
    if (v22)
    {
      v23 = (const void *)v22;
      if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsObject:PCSIdentityGetPublicKey(v22)])
      {
        id v24 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v25 = 138412290;
          *(void *)&v25[4] = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Keyrolling service %@ due to existing backup",  v25,  0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      }

      CFRelease(v23);
    }
  }

void sub_1000126DC(_Unwind_Exception *a1)
{
}

void sub_100012700(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v41 = WeakRetained;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accounts]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v3 dsid]);

    if (!v42)
    {
      uint64_t v27 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Keyroll triggered, but DSID is unknown; will retry later",
          v61,
          2u);
      }

      goto LABEL_41;
    }

    unsigned __int8 v4 = [*(id *)(a1 + 32) shouldRollStingray];
    *(void *)v61 = 0LL;
    v62 = v61;
    uint64_t v63 = 0x2020000000LL;
    char v64 = 0;
    uint64_t v57 = 0LL;
    v58 = &v57;
    uint64_t v59 = 0x2020000000LL;
    char v60 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_100012F04;
    v52[3] = &unk_1000250A8;
    unsigned __int8 v56 = v4;
    v54 = v61;
    v55 = &v57;
    uint64_t v39 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v53 = v39;
    if (([v41 getServicesToRoll:v42 handler:v52] & 1) == 0)
    {
LABEL_40:

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(v61, 8);
LABEL_41:

      uint64_t v2 = v41;
      goto LABEL_42;
    }

    if (!-[NSMutableSet count](v39, "count"))
    {
      __int128 v28 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = *((unsigned __int8 *)v58 + 24);
        *(_DWORD *)v70 = 67109120;
        *(_DWORD *)&v70[4] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Keyroll triggered but we've already completed rolling (defer: %d)",  v70,  8u);
      }

      [*(id *)(a1 + 32) rollingComplete:*((unsigned __int8 *)v58 + 24)];
      goto LABEL_40;
    }

    if (v62[24])
    {
      char v5 = (void *)objc_claimAutoreleasedReturnValue([v41 settings]);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v5 setObject:v6 forKey:kPCSSettingStingrayRoll];
    }

    id v36 = _os_activity_create( (void *)&_mh_execute_header,  "PCSCKKSRollAndSync",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v36, &state);
    *(void *)v70 = 0LL;
    v71 = v70;
    uint64_t v72 = 0x2020000000LL;
    int v73 = 0;
    id v38 = -[NSMutableSet count](v39, "count");
    xpc_object_t v7 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v6_Block_object_dispose(va, 8) = (_DWORD)v38;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CKKS registry roll & sync for all eligible services (%d)",  buf,  8u);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    unsigned __int8 v8 = v39;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v47,  v69,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
          dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_100012F78;
          v44[3] = &unk_1000250D0;
          v44[4] = v12;
          v46 = v70;
          unint64_t v14 = v13;
          v45 = v14;
          objc_msgSend(v41, "createIdentity:dsid:roll:sync:forceSync:complete:", v12, v42, 1, 1, 0, v44, v36);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v47,  v69,  16LL);
      }

      while (v9);
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
    [v15 storeEventTimestamp:3];

    if (*((_DWORD *)v71 + 6) == (_DWORD)v38)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
      [v16 storeEventTimestamp:4];
    }

    id v43 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"testRollEpoch",  &v43,  v36));
    id v18 = v43;
    uint64_t v19 = v18;
    if (!v17 || v18)
    {
      unsigned int v30 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }

      goto LABEL_39;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAnalytics logger](&OBJC_CLASS___PCSAnalytics, "logger"));
    if (*((_DWORD *)v71 + 6) == (_DWORD)v38)
    {
      [v41 rollingComplete:*((unsigned __int8 *)v58 + 24)];
      int8x16_t v21 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = *((_DWORD *)v71 + 6);
        *(_DWORD *)buf = 67109120;
        LODWORD(v6_Block_object_dispose(va, 8) = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Successfully completed keyroll operations for  %d keys",  buf,  8u);
      }

      [v20 logSuccessForEvent:PCSEventKeyRollOperation];
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settings]);
      unsigned int v24 = [v23 BOOLForKey:v17];

      if (!v24) {
        goto LABEL_38;
      }
      notify_post("com.apple.ProtectedCloudStorage.test.mobileBackupStateChange.success");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settings]);
      [v25 setBool:0 forKey:v17];
    }

    else
    {
      __int128 v31 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = (_DWORD)v38 - *((_DWORD *)v71 + 6);
        *(_DWORD *)buf = 67109120;
        LODWORD(v6_Block_object_dispose(va, 8) = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Failed keyroll operations for  %d keys",  buf,  8u);
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kPCSErrorDomain,  119LL,  0LL));
      v65[0] = @"attemptedRoll";
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v38));
      v65[1] = @"successfulRoll";
      v66[0] = v33;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)v71 + 6)));
      v66[1] = v34;
      NSErrorUserInfoKey v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  2LL));
      [v20 logRecoverableError:v25 forEvent:PCSEventKeyRollOperation withAttributes:v35];
    }

LABEL_38:
LABEL_39:

    _Block_object_dispose(v70, 8);
    os_activity_scope_leave(&state);

    goto LABEL_40;
  }

  __int128 v26 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v61 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Keyroll triggered but there is no self",  v61,  2u);
  }

LABEL_42:
}

void sub_100012E98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, os_activity_scope_state_s state, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44)
{
}

void sub_100012F04(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if ((a3 & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      goto LABEL_6;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  id v6 = v5;
  [*(id *)(a1 + 32) addObject:v5];
  id v5 = v6;
LABEL_6:
}

void sub_100012F78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      uint64_t v12 = "CKKS registry roll & sync failed for service %@ with: %{public}@ (mtt: %@)";
      dispatch_semaphore_t v13 = (os_log_s *)v10;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }

  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v15 = qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v8;
      uint64_t v12 = "CKKS registry roll & sync for service %@ completed: %@";
      dispatch_semaphore_t v13 = (os_log_s *)v15;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

LABEL_18:
    if (CFErrorGetCode((CFErrorRef)cf) == -25300)
    {
      uint32_t v14 = cf;
      if (cf)
      {
        cf = 0LL;
        CFRelease(v14);
      }

      id v7 = (const void *)PCSIdentityCreateMaster(0LL, &cf);
    }

    else
    {
      id v7 = 0LL;
    }

    goto LABEL_3;
  }

  if (a4) {
    *a4 = (__CFError *)v13;
  }

  LOBYTE(v_Block_object_dispose((const void *)(v44 - 144), 8) = 0;
  return (char)v8;
}

void sub_1000133E8(_Unwind_Exception *a1)
{
}

void sub_10001340C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
      unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:*(void *)(a1 + 56)]);

      if (([v4 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
        [v5 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 56)];

        id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
        [v6 removeObjectForKey:*(void *)(a1 + 64)];
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(a1 + 64)]);

      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
      {

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
        [v10 removeObjectForKey:*(void *)(a1 + 64)];

        id v8 = 0LL;
      }

      uint64_t v11 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        int v29 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Trigger syncing with escrow proxy on behalf of cloudd: next sync: %{public}@",  buf,  0xCu);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      dispatch_semaphore_t v13 = v12;
      if (v8 && [v12 compare:v8] == (id)-1)
      {
        id v22 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "skipping sync due to ratelimiting",  buf,  2u);
        }

        int v17 = (EscrowProxySyncOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kPCSErrorDomain,  97LL,  0LL));
        (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      }

      else
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:7200.0]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) settings]);
        [v15 setObject:v14 forKey:*(void *)(a1 + 64)];

        uint64_t v16 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v29 = (const __CFString *)v14;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "setting cloudd expiration to: %@",  buf,  0xCu);
        }

        int v17 = -[EscrowProxySyncOperation initWithDSID:]( objc_alloc(&OBJC_CLASS___EscrowProxySyncOperation),  "initWithDSID:",  *(void *)(a1 + 32));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100013888;
        v23[3] = &unk_1000250F8;
        v23[4] = *(void *)(a1 + 48);
        id v24 = *(id *)(a1 + 64);
        id v25 = *(id *)(a1 + 72);
        -[EscrowProxySyncOperation setCompletionBlockWithError:](v17, "setCompletionBlockWithError:", v23);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained serialOperationQueue]);
        [v18 addOperation:v17];

        id v8 = (__CFString *)v14;
      }
    }

    else
    {
      __int16 v19 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v29 = @"Skipping escrow proxy sync, could not determine dsid and/or identifier";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      uint64_t v27 = @"Skipping escrow proxy sync, could not determine dsid and/or identifier";
      unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      uint64_t v20 = *(void *)(a1 + 72);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kPCSErrorDomain,  66LL,  v4));
      (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0LL, 0LL, v21);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }
}

void sub_100013888(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Escrow proxy sync reported: %d: %{public}@",  (uint8_t *)v14,  0x12u);
  }

  if ([v5 code] == (id)305)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    unsigned int v8 = [v7 isEqualToString:kPCSCloudServicesErrorDomain];

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if ([v10 code] == (id)311)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
        unsigned int v12 = [v11 isEqualToString:kPCSCloudServicesErrorDomain];

        if (v12)
        {
          dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) settings]);
          [v13 removeObjectForKey:*(void *)(a1 + 40)];
        }
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_21:
    LOBYTE(v11) = 1;
    goto LABEL_22;
  }

  unsigned int v8 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v7);
  if (!v8)
  {
    __int16 v15 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v16 = "failed to create identity set, will force CKKS fetch";
      goto LABEL_20;
    }

    goto LABEL_21;
  }

  uint64_t v9 = v8;
  uint64_t v20 = 0u;
  __int16 v21 = 0u;
  uint64_t v18 = 0u;
  __int16 v19 = 0u;
  uint64_t v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    unsigned int v12 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (const void *)PCSIdentitySetCopyIdentity(v9, *(void *)(*((void *)&v18 + 1) + 8LL * (void)i));
        if (!v14)
        {
          LOBYTE(v11) = 1;
          goto LABEL_17;
        }

        CFRelease(v14);
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

LABEL_17:
  CFRelease(v9);
LABEL_22:

  return (char)v11;
}

void sub_100013D88(_Unwind_Exception *a1)
{
}

void sub_100013DB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = _os_activity_create( (void *)&_mh_execute_header,  "PCSCKKSRegistrySync",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &state);
    unsigned __int8 v4 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee sync with CKKS registry for service %{public}@",  buf,  0xCu);
    }

    id v6 = [*(id *)(a1 + 40) forceSyncNeeded:*(void *)(a1 + 48) dsid:*(void *)(a1 + 56)];
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100013F5C;
    v9[3] = &unk_100025148;
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [WeakRetained createIdentity:v7 dsid:v8 roll:0 sync:1 forceSync:v6 complete:v9];

    os_activity_scope_leave(&state);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

void sub_100013F40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_100013F5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = qword_10002BDE0;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v8;
      unsigned int v12 = "CKKS registry sync failed with: %{public}@ (mtt: %@)";
      uint64_t v13 = (os_log_s *)v10;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    }
  }

  else if (v11)
  {
    int v15 = 138412290;
    id v16 = v8;
    unsigned int v12 = "CKKS registry sync completed: %@";
    uint64_t v13 = (os_log_s *)v10;
    uint32_t v14 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, BOOL, id, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v7 != 0LL, v8, v9);
}

LABEL_7:
}

void sub_1000144C0(_Unwind_Exception *a1)
{
}

void sub_1000144E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFTypeRef cf = 0LL;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupDSID]);
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupGuitarfish]);
    id v5 = [v4 BOOLValue];

    if ((PCSCurrentPersonaMatchesDSID(v3) & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 56) && PCSIdentityHaveiCloudIdentityLocally(v3, v5))
      {
        uint64_t v6 = qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = *(const void **)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          CFTypeRef v17 = v7;
          id v8 = "setupIdentitiesForAccount: account %@ is already setup, ignoring request";
          id v9 = (os_log_s *)v6;
          uint32_t v10 = 12;
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
        }
      }

      else
      {
        unsigned int v12 = (const void *)PCSIdentityLegacySetup(*(void *)(a1 + 32), &cf);
        if (v12)
        {
          CFRelease(v12);
        }

        else
        {
          uint64_t v13 = (os_log_s *)qword_10002BDE0;
          if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFTypeRef v17 = cf;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setupIdentitiesForAccount: PCSIdentitySetup failed: %@",  buf,  0xCu);
          }
        }

        CFTypeRef v14 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v14);
        }
      }
    }

    else
    {
      uint64_t v11 = qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v8 = "Current persona doesn't match dsid";
        id v9 = (os_log_s *)v11;
        uint32_t v10 = 2;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }
}

void sub_1000147EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100014810(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = 0LL;
  if (WeakRetained)
  {
    _PCSIdentityMigrateToiCDP(*(void *)(a1 + 32), &v5);
    uint64_t v3 = *(void *)(a1 + 40);
    unsigned __int8 v4 = v5;
    (*(void (**)(void))(v3 + 16))();
  }
}

void sub_100014978( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001499C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = 0LL;
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyRegistryCallback]);
    id v6 = objc_retainBlock(v5);
    [v3 setObject:v6 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 markNegativeCallback]);
    id v9 = objc_retainBlock(v8);
    [v3 setObject:v9 forKeyedSubscript:kPCSSetupCallbackMarkNegative];

    LODWORD(v7) = _PCSIdentityMigrateEnableWalrus(v3, &v13);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = v13;
    (*(void (**)(void))(v10 + 16))();

    if ((_DWORD)v7 && !v13)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
      [v12 storeEventTimestamp:1];
    }
  }
}

void sub_100014BEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100014C10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = 0LL;
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyRegistryCallback]);
    id v6 = objc_retainBlock(v5);
    [v3 setObject:v6 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

    LODWORD(v4) = _PCSIdentityMigrateDisableWalrus(v3, &v10);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v10;
    (*(void (**)(void))(v7 + 16))();

    if ((_DWORD)v4 && !v10)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
      [v9 storeEventTimestamp:2];
    }
  }
}

LABEL_15:
}

void sub_100015090( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1000150B0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Completed best-effort mobile backup restore with recoverIssue:%@ missing:%@ present:%@ error:%@",  (uint8_t *)&v14,  0x2Au);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000151C0(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v15 = [*(id *)(a1 + 32) isEqualToString:kPCSMessages3];
  if (!v13 && (a5 & 1) == 0 && a2 && v15)
  {
    __int16 v16 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Kicking off user registry sync due to new messages3 identity",  v19,  2u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained registry]);
    id v18 = [v17 syncUserRegistry];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_14:
    id v8 = 0LL;
    goto LABEL_15;
  }

  id v8 = (_PCSIdentitySetData *)v7;
LABEL_15:

  return v8;
}

void sub_1000156C4(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  unsigned __int8 v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAnalytics logger](&OBJC_CLASS___PCSAnalytics, "logger"));
  if (v3)
  {
    id v6 = &PCSEventWalrusRepairPerformed;
LABEL_6:
    [v5 logSuccessForEvent:*v6];
    goto LABEL_11;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v4, "domain"));
  if ([v7 isEqualToString:kPCSErrorDomain])
  {
    id v8 = -[NSError code](v4, "code");

    if (v8 == (id)159)
    {
      id v6 = &PCSEventWalrusRepairNotNeeded;
      goto LABEL_6;
    }
  }

  else
  {
  }

  id v9 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "repair migrate result: %@",  (uint8_t *)&v10,  0xCu);
  }

  [v5 logRecoverableError:v4 forEvent:PCSEventWalrusRepairPerformed withAttributes:0];
LABEL_11:
}

void sub_100015880(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_personID"));

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) identityCopySet:v3];
    if (v4)
    {
      id v5 = v4;
      CFRelease(v5);
    }
  }

  else
  {
    id v6 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dsid is nil", v7, 2u);
    }
  }
}

id sub_100015A04(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyInternalEvent:*(void *)(a1 + 40)];
}

void sub_100015B3C(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 accounts]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 dsid]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 getValues:v5]);
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  [v7 setObject:v6 forKeyedSubscript:v8];
}

__CFDictionary *sub_100016518( const __CFAllocator *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  Mutable = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v14 = (const void **)&a10;
  id v11 = key;
  if (key)
  {
    do
    {
      CFDictionarySetValue(Mutable, v11, *v14);
      id v12 = v14 + 1;
      v14 += 2;
      id v11 = *v12;
    }

    while (*v12);
  }

  return Mutable;
}

void sub_1000169C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000169EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6 && [v5 count])
  {
    NSErrorUserInfoKey v26 = 0LL;
    id v27 = v5;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v10) {
      goto LABEL_58;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (1)
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v13);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", @"view", v26, v27, (void)v28));
        unsigned __int8 v16 = [v15 isEqualToString:@"global"];

        if ((v16 & 1) == 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"currentTLK"]);
          id v18 = sub_100016F00(v17);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"keystate"]);
          id v21 = sub_100016F00(v20);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          if ([v22 isEqualToString:@"ready"]
            || [v22 isEqualToString:@"become_ready"])
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
LABEL_30:

            goto LABEL_31;
          }

          if ([v22 isEqualToString:@"readypendingunlock"])
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v24 = 23;
          }

          else if ([v22 isEqualToString:@"waitforunlock"])
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v24 = 13;
          }

          else if ([v22 isEqualToString:@"error"])
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v24 = 24;
          }

          else if ([v22 isEqualToString:@"initializing"] {
                 || [v22 isEqualToString:@"initialized"]
          }
                 || [v22 isEqualToString:@"fetchcomplete"]
                 || [v22 isEqualToString:@"begin_fetch"]
                 || [v22 isEqualToString:@"fetchcomplete"]
                 || [v22 isEqualToString:@"waitfortlkcreation"]
                 || [v22 isEqualToString:@"waitfortlkupload"])
          {
            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v24 = 14;
          }

          else
          {
            if (![v22 isEqualToString:@"badcurrentpointers"])
            {
              if ([v22 isEqualToString:@"waitfortrust"]
                || [v22 isEqualToString:@"needrefetch"]
                || [v22 isEqualToString:@"badcurrentpointers"]
                || [v22 isEqualToString:@"newtlksfailed"])
              {
                uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                int v24 = 15;
                goto LABEL_29;
              }

              if ([v22 isEqualToString:@"fetching"])
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 16;
                goto LABEL_30;
              }

              if ([v22 isEqualToString:@"tlkmissing"]
                || [v22 isEqualToString:@"waitfortlk"])
              {
                uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                int v24 = 17;
                goto LABEL_29;
              }

              if (![v22 isEqualToString:@"unhealthy"])
              {
                if ([v22 isEqualToString:@"healtlkshares"])
                {
                  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                  int v24 = 19;
                }

                else if ([v22 isEqualToString:@"healtlksharesfailed"])
                {
                  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                  int v24 = 20;
                }

                else if ([v22 isEqualToString:@"waitforfixupoperation"])
                {
                  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                  int v24 = 21;
                }

                else if ([v22 isEqualToString:@"resetzone"])
                {
                  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                  int v24 = 22;
                }

                else
                {
                  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
                  if (v19) {
                    int v24 = 8;
                  }
                  else {
                    int v24 = 7;
                  }
                }

                goto LABEL_29;
              }
            }

            uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v24 = 18;
          }

LABEL_29:
          *(_DWORD *)(v23 + 24) = v24;
          goto LABEL_30;
        }

LABEL_31:
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v25 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v11 = v25;
      if (!v25)
      {
LABEL_58:

        id v6 = v26;
        id v5 = v27;
        goto LABEL_59;
      }
    }
  }

  uint64_t v7 = pcsLogObjForScope("reportStatus");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PCSReportManateeStatus rpcStatus reply: %@",  buf,  0xCu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 10;
LABEL_59:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100016F00(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_1000171C8(_Unwind_Exception *a1)
{
}

void sub_1000171EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFTypeRef cf = 0LL;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupDSID]);
    if ((PCSCurrentPersonaMatchesDSID(v3) & 1) != 0)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupRecoveryToken]);
      uint64_t v5 = PCSIdentityLegacySetup(*(void *)(a1 + 32), &cf);
      if (v5)
      {
        id v6 = (const void *)v5;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        CFRelease(v6);
      }

      else
      {
        id v11 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v15 = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setupIdentitiesWithParameters: PCSIdentitySetup failed: %@",  buf,  0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }

      CFTypeRef v12 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v12);
      }
    }

    else
    {
      uint64_t v7 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current persona doesn't match dsid",  buf,  2u);
      }

      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = PCSErrorCreate(46LL, @"Current persona doesn't match dsid");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, uint64_t, void, void, void *))(v8 + 16))(v8, 2LL, 0LL, 0LL, v10);

      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
    id v3 = 0LL;
  }
}

uint64_t start()
{
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  id v1 = (void *)qword_10002BDD8;
  qword_10002BDD8 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10002BDD8, &stru_1000252D8);
  dispatch_activate((dispatch_object_t)qword_10002BDD8);
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSSyncing defaultPCSSyncing](&OBJC_CLASS___PCSSyncing, "defaultPCSSyncing"));
  os_log_t v5 = os_log_create("com.apple.ProtectedCloudStorage", "PCSSync");
  id v6 = (void *)qword_10002BDE0;
  qword_10002BDE0 = (uint64_t)v5;

  -[ServiceDelegate setManager:](v2, "setManager:", v3);
  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.protectedcloudstorage.protectedcloudkeysyncing");
  -[NSXPCListener setDelegate:](v8, "setDelegate:", v2);
  -[NSXPCListener resume](v8, "resume");

  objc_autoreleasePoolPop(v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100017904;
  handler[3] = &unk_1000252B8;
  id v9 = v4;
  id v19 = v9;
  xpc_activity_register("com.apple.ProtectedCloudStorage.fortnightly", XPC_ACTIVITY_CHECK_IN, handler);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  CFTypeRef v15 = sub_100017958;
  unsigned __int8 v16 = &unk_1000252B8;
  id v17 = v9;
  id v10 = v9;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &v13);
  objc_msgSend(v10, "triggerWatchSyncing", v13, v14, v15, v16);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v11 run];

  return 0LL;
}

void sub_100017904(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (xpc_activity_get_state(v4) == 2)
  {
    id v3 = objc_autoreleasePoolPush();
    [*(id *)(a1 + 32) notifyDailyEvent];
    objc_autoreleasePoolPop(v3);
  }
}

void sub_100017958(uint64_t a1, void *a2)
{
  id v7 = a2;
  string = xpc_dictionary_get_string(v7, _xpc_event_key_name);
  id v4 = objc_autoreleasePoolPush();
  os_log_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v5 notifyEvent:v6];

  objc_autoreleasePoolPop(v4);
}

void sub_1000179E4(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_1000179FC()
{
  *(_WORD *)dispatch_source_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PERF: Syncing with device older than watchOS 4 / iOS 11",  v0,  2u);
}

void sub_100017A40(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unexpected error finding current identity for %@: %d",  (uint8_t *)&v3,  0x12u);
}

id objc_msgSend_triggerEscrowSyncWithDSID_accountIdentifier_settingsKeyExpirationDate_settingsKeyIdentifier_complete_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "triggerEscrowSyncWithDSID:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:");
}

id objc_msgSend_triggerSyncingWithEscrowProxy_dsid_publicKeys_accountIdentifier_settingsKeyExpirationDate_settingsKeyIdentifier_complete_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "triggerSyncingWithEscrowProxy:dsid:publicKeys:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}