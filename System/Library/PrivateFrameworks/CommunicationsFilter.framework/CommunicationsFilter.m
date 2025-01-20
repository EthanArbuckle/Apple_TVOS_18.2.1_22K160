uint64_t sub_100003B98()
{
  if (qword_10000C358 != -1) {
    dispatch_once(&qword_10000C358, &stru_1000082B8);
  }
  return qword_10000C350;
}

void sub_100003BD8(id a1)
{
  qword_10000C350 = (uint64_t)dispatch_queue_create("com.apple.IncomingCallFilter.cmfsyncagent", 0LL);
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance");
  v1 = (dispatch_queue_s *)sub_100003B98();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, &stru_100008358);
  uint64_t v2 = CMFAgentName;
  uint64_t v3 = sub_100003B98();
  v4 = (_xpc_connection_s *)IMXPCCreateServerConnection(v2, &stru_1000082D8, &stru_1000082D8, &stru_100008318, v3);
  xpc_connection_resume(v4);
  objc_autoreleasePoolPop(v0);
  -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
  return 0LL;
}

void sub_100003C98(id a1)
{
  v1 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "CMFSyncAgent getting killed", v2, 2u);
  }
}

void sub_100003CF4(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  v5 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Incoming peer auth grant request", buf, 2u);
  }

  xpc_connection_get_audit_token(a2, v43);
  if ((IMDAuditTokenTaskHasEntitlement(v43, @"com.apple.private.communicationsfilter") & 1) != 0
    || (IMDAuditTokenTaskHasEntitlement(v43, @"com.apple.private.imavcore.imavagent") & 1) != 0
    || IMDAuditTokenTaskHasEntitlement(v43, @"com.apple.private.icfcallserver"))
  {
    xpc_type_t type = xpc_get_type(a3);
    v7 = (os_log_s *)sub_1000043A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = type == (xpc_type_t)&_xpc_type_error;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "xpc_get_xpc_type_t type = %d", buf, 8u);
    }

    if (type != (xpc_type_t)&_xpc_type_error)
    {
      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        sub_100005BE0();
      }
      v8 = xpc_copy_description(a3);
      v9 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(a2);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = pid;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "received message from peer(%d): %p",  buf,  0x12u);
      }

      free(v8);
      int64_t int64 = xpc_dictionary_get_int64(a3, CMFXPCEventCode);
      uint64_t v12 = IMGetXPCDictionaryFromDictionary(a3, CMFXPCParameterKeyItem);
      if (v12) {
        id v13 = [[CommunicationFilterItem alloc] initWithDictionaryRepresentation:v12];
      }
      else {
        id v13 = 0LL;
      }
      xpc_object_t reply = xpc_dictionary_create_reply(a3);
      v23 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
      switch(int64)
      {
        case 0LL:
          unsigned int v24 = -[CommunicationsFilterBlockListStore addItemForAllServices:]( +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance"),  "addItemForAllServices:",  v13);
          goto LABEL_28;
        case 1LL:
          unsigned int v24 = -[CommunicationsFilterBlockListStore removeItemForAllServices:]( +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance"),  "removeItemForAllServices:",  v13);
LABEL_28:
          unsigned int v36 = v24;
          goto LABEL_29;
        case 2LL:
          id v38 = -[CommunicationsFilterBlockListStore copyAllItemsAsDictionaries]( +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance"),  "copyAllItemsAsDictionaries");
          if (v38) {
            -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v38, CMFDictionaryResultKey);
          }

          goto LABEL_34;
        case 3LL:
          v39 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CommunicationsFilterBlockListStore isItemInList:]( +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance"),  "isItemInList:",  v13));
          -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v39, CMFDictionaryResultKey);
LABEL_34:
          unsigned int v36 = 0;
          int v37 = 1;
          break;
        default:
          unsigned int v36 = 0;
LABEL_29:
          int v37 = 0;
          break;
      }

      v40 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = -[NSMutableDictionary allKeys](v23, "allKeys");
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "responseDictionary allKeys = %@, shouldPostDidChange = %d",  buf,  0x12u);
        if (!v37) {
          goto LABEL_37;
        }
      }

      else if (!v37)
      {
LABEL_37:
        if (!v36)
        {
LABEL_39:

          xpc_retain(a3);
          xpc_retain(a2);
          xpc_connection_send_message(a2, reply);
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_100004318;
          v45 = &unk_100008380;
          xpc_object_t v46 = reply;
          v47 = a3;
          v48 = a2;
          xpc_connection_send_barrier(a2, buf);
          return;
        }

LABEL_38:
        v42 = +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter");
        -[NSDistributedNotificationCenter __mainThreadPostNotificationName:object:]( v42,  "__mainThreadPostNotificationName:object:",  CMFSyncAgentBlockListUpdated,  0LL);
        notify_post((const char *)[CMFSyncAgentBlockListUpdated UTF8String]);
        goto LABEL_39;
      }

      IMInsertDictionariesToXPCDictionary(reply, CMFXPCResponseKey);
      if (!v36) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }

    if (a3 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      v28 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100005B78(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }

    else if (a3 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      v14 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100005BAC(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  else
  {
    pid_t v25 = xpc_connection_get_pid(a2);
    uint64_t v26 = IMProcessNameForPid();
    v27 = (os_log_s *)sub_1000043A0();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"com.apple.private.communicationsfilter";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v45) = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[WARN] Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  buf,  0x1Cu);
    }

    xpc_connection_cancel(a2);
  }

void sub_100004224(id a1, OS_xpc_object *a2)
{
  uint64_t v3 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waking up", buf, 2u);
  }

  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(a2, "Notification");
    if (!strcmp(string, "com.apple.cmfsyncagent.storedidchangeexternally"))
    {
      v5 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "store changed externally", v6, 2u);
      }

      -[CommunicationsFilterBlockListStore _storeDidChangeExternally]( +[CommunicationsFilterBlockListStore sharedInstance]( &OBJC_CLASS___CommunicationsFilterBlockListStore,  "sharedInstance"),  "_storeDidChangeExternally");
    }
  }

void sub_100004318(xpc_object_t *a1)
{
  uint64_t v2 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reply sent", v3, 2u);
  }

  xpc_release(a1[4]);
  xpc_release(a1[5]);
  xpc_release(a1[6]);
}

void sub_100004390( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_1000043A0()
{
  if (qword_10000C368 != -1) {
    dispatch_once(&qword_10000C368, &stru_1000083A0);
  }
  return qword_10000C360;
}

void sub_1000043E0(id a1)
{
  qword_10000C360 = (uint64_t)os_log_create("com.apple.calls.communicationsfilter.syncagent", "Default");
}

void sub_10000444C(id a1)
{
  qword_10000C378 = objc_alloc_init(&OBJC_CLASS___CommunicationsFilterBlockListStore);
}

uint64_t sub_100004840(unsigned int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005B00;
  block[3] = &unk_1000084A0;
  char v5 = a1;
  if (qword_10000C388 != -1) {
    dispatch_once(&qword_10000C388, block);
  }
  uint64_t v3 = 0LL;
  uint64_t result = notify_get_state(dword_10000C380, &v3);
  if ((((v3 == 0) ^ a1) & 1) == 0)
  {
    notify_set_state(dword_10000C380, a1);
    return notify_post("_CMFBlockListIsEmptyToken");
  }

  return result;
}

void sub_1000048F8(id a1)
{
  v1 = +[NSDistributedNotificationCenter defaultCenter](&OBJC_CLASS___NSDistributedNotificationCenter, "defaultCenter");
  -[NSDistributedNotificationCenter postNotificationName:object:]( v1,  "postNotificationName:object:",  CMFSyncAgentBlockListUpdated,  0LL);
  notify_post((const char *)[CMFSyncAgentBlockListUpdated UTF8String]);
}

id sub_100004B7C(void *a1, void *a2, int a3, void *a4, _BYTE *a5, _BYTE *a6)
{
  id v10 = [a1 objectForKey:@"__kCMFBlockListStoreTopLevelKey"];
  v11 = (void *)IMGetAppValueForKey(@"__kCMFBlockListStoreTopLevelKey");
  id v12 = objc_msgSend( objc_msgSend(v10, "objectForKey:", @"__kCMFBlockListStoreRevisionKey"),  "unsignedIntegerValue");
  id v13 = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"__kCMFBlockListStoreRevisionKey"),  "unsignedIntegerValue");
  v14 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    p_isa = sub_10000570C(v10);
    __int16 v47 = 2112;
    v48 = (const __CFString *)sub_10000570C(v11);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "kvs:%@, prefs:%@", buf, 0x16u);
  }

  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (v12 > v13) {
    goto LABEL_12;
  }
  if (v12 == v13)
  {
    id v15 = [v10 objectForKey:@"__kCMFBlockListStoreRevisionTimestampKey"];
    id v16 = [v11 objectForKey:@"__kCMFBlockListStoreRevisionTimestampKey"];
    uint64_t v17 = (os_log_s *)sub_1000043A0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [v15 timeIntervalSinceReferenceDate];
      unint64_t v19 = (unint64_t)v18;
      [v16 timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 67109120;
      LODWORD(p_isa) = v19 == (unint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "dates are equal ? %d", buf, 8u);
    }

    [v15 timeIntervalSinceReferenceDate];
    unint64_t v22 = (unint64_t)v21;
    [v16 timeIntervalSinceReferenceDate];
    if (v22 <= (unint64_t)v23)
    {
      [v15 timeIntervalSinceReferenceDate];
      double v25 = v24;
      [v16 timeIntervalSinceReferenceDate];
      if (!a6)
      {
        id v10 = v11;
        goto LABEL_19;
      }

      a5 = a6;
      id v10 = v11;
      goto LABEL_18;
    }

LABEL_12:
    if (!a5) {
      goto LABEL_19;
    }
LABEL_18:
    *a5 = 1;
    goto LABEL_19;
  }

  a5 = a6;
  id v10 = v11;
  if (a6) {
    goto LABEL_18;
  }
LABEL_19:
  id result = [a2 removeAllObjects];
  if (v10)
  {
    v28 = (NSString *)[v10 objectForKey:@"__kCMFBlockListStoreVersionKey"];
    uint64_t v29 = (__CFString *)[v10 objectForKey:@"__kCMFBlockListStoreTypeKey"];
    id v30 = [v10 objectForKey:@"__kCMFBlockListStoreArrayKey"];
    uint64_t v31 = v30;
    if (!v28 || !v29 || !v30)
    {
      uint64_t v32 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        p_isa = v28;
        __int16 v47 = 2112;
        v48 = v29;
        __int16 v49 = 2048;
        v50 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] missing parameters = version: %@, type: %@, list: %p",  buf,  0x20u);
      }
    }

    if (-[NSString integerValue](v28, "integerValue") >= 2)
    {
      uint64_t v33 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        p_isa = v28;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[WARN] bad version: %@", buf, 0xCu);
      }
    }

    if ((-[__CFString isEqualToString:](v29, "isEqualToString:", @"__kCMFBlockListStoreTypeValue") & 1) == 0)
    {
      uint64_t v34 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        p_isa = &v29->isa;
        __int16 v47 = 2112;
        v48 = @"__kCMFBlockListStoreTypeKey";
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARN] bad type: %@, %@", buf, 0x16u);
      }
    }

    if (a3 && v31)
    {
      [a2 addObjectsFromArray:v31];
    }

    else
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v35 = [v31 countByEnumeratingWithState:&v41 objects:buf count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v42;
        do
        {
          for (i = 0LL; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v42 != v37) {
              objc_enumerationMutation(v31);
            }
            id v39 = [[CommunicationFilterItem alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v41 + 1) + 8 * (void)i)];
            if (v39) {
              [a2 addObject:v39];
            }
          }

          id v36 = [v31 countByEnumeratingWithState:&v41 objects:buf count:16];
        }

        while (v36);
      }
    }

    id result = [v10 objectForKey:@"__kCMFBlockListStoreRevisionKey"];
    if (a4)
    {
      if (result)
      {
        id result = [result unsignedIntegerValue];
        *a4 = result;
      }
    }
  }

  return result;
}

LABEL_22:
      double v20 = IMSetAppValueForKey(@"__kCMFBlockListStoreTopLevelKey", v18);
      IMSyncronizeAppPreferences(v20);
      goto LABEL_23;
    }
  }

NSString *sub_10000570C(void *a1)
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"[%@, %@, %p and %d items]",  [a1 objectForKey:@"__kCMFBlockListStoreRevisionKey"],  objc_msgSend(a1, "objectForKey:", @"__kCMFBlockListStoreRevisionTimestampKey"),  objc_msgSend(a1, "objectForKey:", @"__kCMFBlockListStoreArrayKey"),  objc_msgSend(objc_msgSend(a1, "objectForKey:", @"__kCMFBlockListStoreArrayKey"), "count"));
}

void sub_1000058D8(id a1, NSError *a2)
{
  uint64_t v3 = (os_log_s *)sub_1000043A0();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005CA4((uint64_t)a2, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "StatusKit completed removing sharing of focus status",  v11,  2u);
  }

id sub_100005A38(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) updateDataStore];
}

uint64_t sub_100005B00(uint64_t a1)
{
  return notify_post("_CMFBlockListIsEmptyToken");
}

void sub_100005B50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100005B60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005B78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005BAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005BE0()
{
  __assert_rtn("CMFSyncAgent_peer_event_handler", "main.m", 96, "type == XPC_TYPE_DICTIONARY");
}

void sub_100005C08(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Data store synchronization failed.", v1, 2u);
  sub_100005B70();
}

void sub_100005C44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005C74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005CA4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005B50( (void *)&_mh_execute_header,  a2,  a3,  "StatusKit returned error while removing sharing of focus status. Error: %@",  a5,  a6,  a7,  a8,  2u);
}

void sub_100005D0C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}