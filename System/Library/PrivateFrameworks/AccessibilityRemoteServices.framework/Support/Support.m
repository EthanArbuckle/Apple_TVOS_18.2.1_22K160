void sub_100002BB0(id a1)
{
  id v1;
  void *v2;
  v1 = -[AXRemoteDaemon _init](objc_alloc(&OBJC_CLASS___AXRemoteDaemon), "_init");
  v2 = (void *)qword_10000CCD8;
  qword_10000CCD8 = (uint64_t)v1;
}

void sub_100002E50(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_dictionary_get_string(xdict, _xpc_event_key_name))
  {
    v3 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    unsigned int v5 = [v4 isEqualToString:AXRemoteDaemonServiceType];

    if (v5)
    {
      if (xpc_dictionary_get_BOOL(xdict, "replyRequired"))
      {
        [*(id *)(a1 + 32) _resetTransactionTimer];
        xpc_object_t reply = xpc_dictionary_create_reply(xdict);
        xpc_dictionary_send_reply();
      }
    }
  }
}

void sub_100002F64(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transaction]);

  if (!v2)
  {
    uint64_t v5 = ax_remote_daemon_log(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "creating os_transaction", (uint8_t *)buf, 2u);
    }

    v7 = (void *)os_transaction_create("com.apple.accessibility.axremoted-ReceivingEvents");
    [*(id *)(a1 + 32) setTransaction:v7];
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) transactionTimeoutTimer]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000030AC;
  v9[3] = &unk_1000085E8;
  objc_copyWeak(&v10, buf);
  [v8 afterDelay:v9 processBlock:60.0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void sub_100003088(_Unwind_Exception *a1)
{
}

void sub_1000030AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ax_remote_daemon_log(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "timed out, clearing os_transaction", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelTransactionIfNecessary];
}
}

LABEL_12:
}

id sub_100003794(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransactionIfNecessary];
}

id sub_10000383C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransactionIfNecessary];
}

void sub_100003914(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRBannerPayloadKey]);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:AXRBannerPayloadTitleKey]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:AXRBannerPayloadMessageKey]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:AXRBannerPayloadDurationKey]);
    [v6 doubleValue];
    double v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXBannerServices sharedInstance](&OBJC_CLASS___AXBannerServices, "sharedInstance"));
    [v9 presentBannerWithTitle:v4 message:v5 duration:v8];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRDeviceRemoteActionPayloadKey]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRVoiceOverEventPayloadKey]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRScrollEventPayloadKey]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRHandGestureEventPayloadKey]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRHandGestureCustomizedActionsKey]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:AXRTouchEventPayloadKey]);
  v16 = (void *)v15;
  if (v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AXRDeviceRemoteActionNameKey]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXRDeviceRemoteActionHelper sharedInstance]( &OBJC_CLASS___AXRDeviceRemoteActionHelper,  "sharedInstance"));
    [v19 performAction:v17];
LABEL_13:

    [*(id *)(a1 + 40) _notifyUserEventOccured];
    goto LABEL_14;
  }

  if (v11)
  {
    v80 = (void *)v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AXRVoiceOverEventCommandNameKey]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      unsigned int v23 = [v22 triggerEventCommand:v20];

      if (v23) {
        [*(id *)(a1 + 40) _notifyUserEventOccured];
      }
    }

    v16 = v80;
  }

  else
  {
    if (v13)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:AXRHandGestureEventPayloadGestureKey]);
      id v25 = [v24 integerValue];

      v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:AXRHandGestureEventPayloadProbabilityKey]);
      [v26 floatValue];
      int v28 = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:AXRHandGestureEventPayloadLatencyKey]);
      [v29 floatValue];
      int v31 = v30;

      LODWORD(v32) = v28;
      LODWORD(v33) = v31;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation accessibilityEventRepresentationWithSender:usagePage:usage:modifierFlags:eventValue1:eventValue2:]( &OBJC_CLASS___AXEventRepresentation,  "accessibilityEventRepresentationWithSender:usagePage:usage:modifierFlags:eventValue1:eventValue2:",  6LL,  2LL,  v25,  0LL,  v32,  v33));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
      [v19 sendHIDSystemEvent:v17 senderID:0x8000000817319384];
      goto LABEL_13;
    }

    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v17 setRemoteHandGestureCustomizedActions:v14];
      goto LABEL_14;
    }

    if (v12)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:AXRScrollEventPayloadAmountKey]);
      signed int v35 = [v34 intValue];

      v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) scrollAccumulator]);
      [v36 accumulateScrollAmount:v35];

      [*(id *)(a1 + 40) _notifyUserEventOccured];
    }

    else
    {
      uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v16, v37) & 1) != 0)
      {
        if (qword_10000CCF0 != -1) {
          dispatch_once(&qword_10000CCF0, &stru_100008630);
        }
        id v100 = 0LL;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  qword_10000CCE8,  v16,  &v100));
        id v39 = v100;
        v41 = v39;
        if (v39)
        {
          uint64_t v42 = ax_remote_daemon_log(v39, v40);
          obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
            sub_100005410((uint64_t)v41, obj);
          }
        }

        else
        {
          __int128 v98 = 0u;
          __int128 v99 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          obj = v38;
          id v95 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v96,  v101,  16LL);
          if (v95)
          {
            v73 = 0LL;
            v74 = v38;
            v79 = 0LL;
            v81 = v16;
            v75 = 0LL;
            v76 = 0LL;
            v77 = 0LL;
            v78 = 0LL;
            uint64_t v94 = *(void *)v97;
            uint64_t v93 = AXRTouchEventPayloadHandInfoKey;
            uint64_t v92 = AXRTouchEventPayloadIsGeneratedEventKey;
            uint64_t v91 = AXRTouchEventPayloadGenerationCountKey;
            uint64_t v90 = AXRTouchEventPayloadWillUpdateMaskKey;
            uint64_t v89 = AXRTouchEventPayloadDidUpdateMaskKey;
            uint64_t v88 = AXRTouchEventPayloadUseOriginalHIDTimeKey;
            uint64_t v87 = AXRTouchEventPayloadHIDTimeKey;
            uint64_t v86 = AXRTouchEventPayloadIsDisplayIntegratedKey;
            uint64_t v85 = AXRTouchEventPayloadSenderIDKey;
            uint64_t v84 = AXRTouchEventPayloadContextIdKey;
            uint64_t v83 = AXRTouchEventPayloadHIDAttributeDataKey;
            v43 = &AXDefaultRemoteEventID_ptr;
            do
            {
              for (i = 0LL; i != v95; i = (char *)i + 1)
              {
                if (*(void *)v97 != v94) {
                  objc_enumerationMutation(obj);
                }
                v45 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
                v46 = v43[87];
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v93, v73, v74, v75, v76, v77, v78, v79));
                id v48 = [v46 secureUnarchiveData:v47 withExpectedClass:objc_opt_class(AXEventHandInfoRepresentation) otherAllowedClasses:0];
                v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

                if (v49)
                {
                  uint64_t v50 = mach_absolute_time();
                  v51 = (void *)objc_claimAutoreleasedReturnValue([v49 paths]);
                  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 firstObject]);
                  [v52 pathLocation];
                  double v54 = v53;
                  double v56 = v55;
                  v57 = (void *)objc_claimAutoreleasedReturnValue([v49 paths]);
                  v58 = (void *)objc_claimAutoreleasedReturnValue([v57 firstObject]);
                  [v58 pathLocation];
                  v61 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithType:subtype:time:location:windowLocation:handInfo:",  3001LL,  0LL,  v50,  v49,  v54,  v56,  v59,  v60));

                  v62 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v92]);
                  objc_msgSend(v61, "setIsGeneratedEvent:", objc_msgSend(v62, "BOOLValue"));

                  v63 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v91]);
                  objc_msgSend(v61, "setGenerationCount:", objc_msgSend(v63, "longLongValue"));

                  v64 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v90]);
                  objc_msgSend(v61, "setWillUpdateMask:", objc_msgSend(v64, "intValue"));

                  v65 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v89]);
                  objc_msgSend(v61, "setDidUpdateMask:", objc_msgSend(v65, "intValue"));

                  v66 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v88]);
                  objc_msgSend(v61, "setUseOriginalHIDTime:", objc_msgSend(v66, "BOOLValue"));

                  v67 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v87]);
                  objc_msgSend(v61, "setHIDTime:", objc_msgSend(v67, "longLongValue"));

                  v68 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v86]);
                  objc_msgSend(v61, "setIsDisplayIntegrated:", objc_msgSend(v68, "BOOLValue"));

                  v69 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v85]);
                  objc_msgSend(v61, "setSenderID:", objc_msgSend(v69, "longLongValue"));

                  v70 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v84]);
                  objc_msgSend(v61, "setContextId:", objc_msgSend(v70, "intValue"));

                  v71 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v83]);
                  [v61 setHIDAttributeData:v71];

                  v72 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
                  [v72 sendHIDSystemEvent:v61 senderID:0x8000000817319384];

                  v43 = &AXDefaultRemoteEventID_ptr;
                }
              }

              id v95 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v96,  v101,  16LL);
            }

            while (v95);
            v11 = v78;
            id v10 = v79;
            v13 = v76;
            v12 = v77;
            v38 = v74;
            v14 = v75;
            v16 = v81;
            v41 = v73;
          }
        }
      }
    }
  }

LABEL_15:
}

void sub_100004220(id a1)
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 5LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1, v4, v5, v6, v7));
  uint64_t v3 = (void *)qword_10000CCE8;
  qword_10000CCE8 = v2;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v2 = ax_remote_daemon_log(v0, v1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up axremoted", v11, 2u);
  }

  uint64_t v4 = getpwnam("mobile");
  uid_t pw_uid = v4->pw_uid;
  gid_t pw_gid = v4->pw_gid;
  if (pw_uid) {
    BOOL v7 = pw_gid == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || (getgid() == pw_gid || !setgid(pw_gid)) && (getuid() == pw_uid || !setuid(pw_uid)))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXRemoteDaemon sharedInstance](&OBJC_CLASS___AXRemoteDaemon, "sharedInstance"));
    [v8 run];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v9 run];
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

id sub_1000045BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_accumulateScrollAmount:", *(void *)(a1 + 40));
}

void sub_100004720(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 scrollAccumulator:*(void *)(a1 + 32) didAccumulateScrollInDirection:1];
}

void sub_100004764(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 scrollAccumulator:*(void *)(a1 + 32) didAccumulateScrollInDirection:2];
}

void sub_1000047F8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004848(id a1)
{
  id v1 = -[AXRDeviceRemoteActionHelper _init](objc_alloc(&OBJC_CLASS___AXRDeviceRemoteActionHelper), "_init");
  id v2 = (void *)qword_10000CCF8;
  qword_10000CCF8 = (uint64_t)v1;
}

LABEL_52:
}

uint64_t sub_100004F34(uint64_t a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  id v2 = (uint64_t (*)(uint64_t, void))off_10000CD08;
  uint64_t v8 = off_10000CD08;
  if (!off_10000CD08)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000051A8;
    v4[3] = &unk_1000086C8;
    v4[4] = &v5;
    sub_1000051A8((uint64_t)v4);
    id v2 = (uint64_t (*)(uint64_t, void))v6[3];
  }

  _Block_object_dispose(&v5, 8);
  if (!v2) {
    sub_1000054EC();
  }
  return v2(a1, 0LL);
}

void sub_100004FDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000504C()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_10000CD18;
  uint64_t v7 = qword_10000CD18;
  if (!qword_10000CD18)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100005298;
    v3[3] = &unk_1000086C8;
    v3[4] = &v4;
    sub_100005298((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000050E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_1000051A8(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_10000CD10)
  {
    __int128 v6 = off_1000086E8;
    uint64_t v7 = 0LL;
    qword_10000CD10 = _sl_dlopen(&v6, &v5);
    uint64_t v3 = v5;
    id v2 = (void *)qword_10000CD10;
    if (qword_10000CD10)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  id v2 = (void *)qword_10000CD10;
LABEL_5:
  result = dlsym(v2, "MRMediaRemoteSendCommand");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_10000CD08 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_100005298(uint64_t a1)
{
  uint64_t v3 = 0LL;
  if (!qword_10000CD20)
  {
    __int128 v4 = off_100008700;
    uint64_t v5 = 0LL;
    qword_10000CD20 = _sl_dlopen(&v4, &v3);
    if (!qword_10000CD20)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_10000550C();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("AVSystemController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_10000CD18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000538C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "did receive payload: %@, withOptions: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_100005410(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to unarchive touch event payload due to: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100005484( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000054B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000054EC()
{
  v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  sub_10000550C(v1);
}

void sub_10000550C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "AVSystemController");
  AXDeviceGetType(v0);
}

id objc_msgSend_accessibilityEventRepresentationWithSender_usagePage_usage_modifierFlags_eventValue1_eventValue2_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "accessibilityEventRepresentationWithSender:usagePage:usage:modifierFlags:eventValue1:eventValue2:");
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}