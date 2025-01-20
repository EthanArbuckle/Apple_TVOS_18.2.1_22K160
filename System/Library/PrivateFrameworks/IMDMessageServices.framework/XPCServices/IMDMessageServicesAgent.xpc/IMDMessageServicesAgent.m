id sub_1000012A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_s *v12;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, double);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  v7 = IMGetXPCIntFromDictionary(a2, "error");
  v8 = IMGetXPCStringFromDictionary(a2, "GUID");
  v9 = IMGetXPCStringFromDictionary(a2, "chatGUID");
  v10 = IMGetXPCArrayFromDictionary(a2, "downgradableServices");
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472LL;
  v16 = sub_100001454;
  v17 = &unk_10000C4F8;
  v18 = a3;
  v19 = a4;
  if (!(_DWORD)v7) {
    return -[IMDMessageServicesAgentController checkForPendingRoutingWithHandler:]( +[IMDMessageServicesAgentController sharedInstance]( &OBJC_CLASS___IMDMessageServicesAgentController,  "sharedInstance",  v14,  v15,  v16,  v17,  v18,  v19),  "checkForPendingRoutingWithHandler:",  &v14);
  }
  v11 = v10;
  if (IMOSLoggingEnabled(v10))
  {
    v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 1024;
      v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Handling routing request for GUID:%@  chatGUID:%@  error:%d",  buf,  0x1Cu);
    }
  }

  return -[IMDMessageServicesAgentController chooseRouteForMessage:downgradableServices:withError:inChat:handler:]( +[IMDMessageServicesAgentController sharedInstance]( &OBJC_CLASS___IMDMessageServicesAgentController,  "sharedInstance",  v14,  v15,  v16,  v17,  v18,  v19),  "chooseRouteForMessage:downgradableServices:withError:inChat:handler:",  v8,  v11,  v7,  v9,  &v14);
}

uint64_t sub_100001454(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count]) {
    IMInsertDictionariesToXPCDictionary( *(void *)(a1 + 32),  [IMDMessageServicesRoutingDictionaryKey UTF8String]);
  }
  if (a3 > 0.0) {
    IMInsertIntsToXPCDictionary(*(void *)(a1 + 32), [IMDMessageServicesCallbackIntervalKey UTF8String]);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100001518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary(a2, "GUID");
  v7 = +[IMDMessageServicesAgentController sharedInstance]( &OBJC_CLASS___IMDMessageServicesAgentController,  "sharedInstance",  _NSConcreteStackBlock,  3221225472LL,  sub_1000015B4,  &unk_10000C4F8,  a3,  a4);
  if (v6) {
    return -[IMDMessageServicesAgentController checkExpireStateForMessage:handler:]( v7,  "checkExpireStateForMessage:handler:",  v6,  &v9);
  }
  else {
    return -[IMDMessageServicesAgentController checkExpireStateWithHandler:](v7, "checkExpireStateWithHandler:", &v9);
  }
}

uint64_t sub_1000015B4(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count]) {
    IMInsertDictionariesToXPCDictionary( *(void *)(a1 + 32),  [IMDMessageServicesExpireStateDictionaryKey UTF8String]);
  }
  if (a3 > 0.0) {
    IMInsertIntsToXPCDictionary(*(void *)(a1 + 32), [IMDMessageServicesCallbackIntervalKey UTF8String]);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100001678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary(a2, "GUID");
  v7 = +[IMDMessageServicesAgentController sharedInstance]( &OBJC_CLASS___IMDMessageServicesAgentController,  "sharedInstance",  _NSConcreteStackBlock,  3221225472LL,  sub_100001714,  &unk_10000C4F8,  a3,  a4);
  if (v6) {
    return -[IMDMessageServicesAgentController checkWatchdogForMessage:handler:]( v7,  "checkWatchdogForMessage:handler:",  v6,  &v9);
  }
  else {
    return -[IMDMessageServicesAgentController checkWatchdogWithHandler:](v7, "checkWatchdogWithHandler:", &v9);
  }
}

uint64_t sub_100001714(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count]) {
    IMInsertDictionariesToXPCDictionary( *(void *)(a1 + 32),  [IMDMessageServicesWatchdogDictionaryKey UTF8String]);
  }
  if (a3 > 0.0) {
    IMInsertIntsToXPCDictionary(*(void *)(a1 + 32), [IMDMessageServicesCallbackIntervalKey UTF8String]);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_1000017D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary(a2, "GUID");
  v7 = +[IMDMessageServicesAgentController sharedInstance]( &OBJC_CLASS___IMDMessageServicesAgentController,  "sharedInstance",  _NSConcreteStackBlock,  3221225472LL,  sub_100001874,  &unk_10000C4F8,  a3,  a4);
  if (v6) {
    return -[IMDMessageServicesAgentController checkScheduledMessageForGUID:handler:]( v7,  "checkScheduledMessageForGUID:handler:",  v6,  &v9);
  }
  else {
    return -[IMDMessageServicesAgentController checkScheduledMessageWithHandler:]( v7,  "checkScheduledMessageWithHandler:",  &v9);
  }
}

uint64_t sub_100001874(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count]) {
    IMInsertDictionariesToXPCDictionary( *(void *)(a1 + 32),  [IMDMessageServicesScheduledMessagesDictionaryKey UTF8String]);
  }
  if (a3 > 0.0) {
    IMInsertIntsToXPCDictionary(*(void *)(a1 + 32), [IMDMessageServicesCallbackIntervalKey UTF8String]);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void start()
{
  uint64_t v0 = xpc_track_activity();
  IMSetEmbeddedTempDirectory(v0);
  xpc_main((xpc_connection_handler_t)sub_100001954);
}

void sub_100001954(_xpc_connection_s *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000019C8;
  handler[3] = &unk_10000C520;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_1000019C8(uint64_t a1, void *a2)
{
  v4 = (void **)(a1 + 32);
  xpc_connection_get_audit_token(*(void *)(a1 + 32), v16);
  int HasEntitlement = IMDAuditTokenTaskHasEntitlement(v16, @"com.apple.private.imcore.imdmessageservices");
  uint64_t v6 = *v4;
  if (HasEntitlement)
  {
    if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
    {
      xpc_retain(a2);
      xpc_retain(v6);
      v7 = xpc_copy_description(a2);
      if (IMOSLoggingEnabled(v7))
      {
        v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          pid_t pid = xpc_connection_get_pid((xpc_connection_t)v6);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = pid;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "received message from peer(%d): %s",  buf,  0x12u);
        }
      }

      free(v7);
      ++dword_100010D18;
      uint64_t v10 = os_transaction_create("IMDMessageServicesAgent_peer_event_handler");
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100001CA0;
      v19 = &unk_10000C588;
      v20 = v6;
      xpc_object_t v21 = reply;
      v22 = a2;
      uint64_t v23 = v10;
      id v12 = [buf copy];
      if (qword_100010D28 != -1) {
        dispatch_once(&qword_100010D28, &stru_10000C5A8);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100001E44;
      block[3] = &unk_10000C5D0;
      block[4] = a2;
      block[5] = v6;
      block[6] = reply;
      block[7] = v12;
      dispatch_async((dispatch_queue_t)qword_100010D20, block);
    }
  }

  else
  {
    uint64_t v13 = xpc_connection_get_pid((xpc_connection_t)v6);
    if (IMOSLoggingEnabled(v13))
    {
      v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = IMProcessNameForPid(v13);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = @"com.apple.private.imcore.imdmessageservices";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v19) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  buf,  0x1Cu);
      }
    }

    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_100001C6C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100001AD0LL);
  }

  _Unwind_Resume(a1);
}

void sub_100001CA0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100001CFC;
  v2[3] = &unk_10000C588;
  __int128 v1 = *(_OWORD *)(a1 + 48);
  __int128 v3 = *(_OWORD *)(a1 + 32);
  __int128 v4 = v1;
  dispatch_async(&_dispatch_main_q, v2);
}

uint64_t sub_100001CFC(uint64_t a1)
{
  --dword_100010D18;
  return im_dispatch_after(&stru_10000C560, 30.0);
}

void sub_100001D60(id a1)
{
  if (dword_100010D18 <= 0)
  {
    if (IMOSLoggingEnabled(a1))
    {
      __int128 v1 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v2 = 0;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Idle exiting, we're done here", v2, 2u);
      }
    }

    exit(0);
  }

void sub_100001DFC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("IMDMessageServicesAgentQueue", 0LL);
  qword_100010D20 = (uint64_t)v1;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  dispatch_set_target_queue(v1, global_queue);
}

id sub_100001E44(uint64_t *a1)
{
  v2 = (void *)IMGetXPCStringFromDictionary(a1[4], "command");
  id v3 = [v2 isEqualToString:@"route"];
  if ((_DWORD)v3) {
    return sub_1000012A4((uint64_t)v3, a1[4], a1[6], a1[7]);
  }
  id v5 = [v2 isEqualToString:@"expire"];
  if ((_DWORD)v5) {
    return sub_100001518((uint64_t)v5, a1[4], a1[6], a1[7]);
  }
  id v6 = [v2 isEqualToString:@"watchdog"];
  if ((_DWORD)v6) {
    return sub_100001678((uint64_t)v6, a1[4], a1[6], a1[7]);
  }
  id v7 = [v2 isEqualToString:@"scheduled"];
  if ((_DWORD)v7) {
    return sub_1000017D8((uint64_t)v7, a1[4], a1[6], a1[7]);
  }
  if (IMOSLoggingEnabled(v7))
  {
    v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unknown command: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return (id)(*(uint64_t (**)(void))(a1[7] + 16))();
}

BOOL sub_100002048(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeAudio) != 0;
}

BOOL sub_100002070(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeAudiovisualContent) != 0;
}

BOOL sub_100002098(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeVCard) != 0;
}

BOOL sub_1000020C0(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeImage) != 0;
}

void sub_100002128(id a1)
{
  qword_100010D38 = objc_alloc_init(&OBJC_CLASS___IMDMessageServicesAgentController);
}

id sub_100002758(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412802;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Found message for routing with GUID:%@ inChat:%@ -- %@",  (uint8_t *)&v7,  0x20u);
    }
  }

  return [*(id *)(a1 + 56) _chooseRouteForMessage:*(void *)(a1 + 48) downgradableServices:*(void *)(a1 + 64) error:*(unsigned int *)(a1 + 80) handler:*(void *)(a1 + 72)];
}

void sub_100002BE4(uint64_t a1, void *a2, double a3)
{
  if (IMOSLoggingEnabled(a1))
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found routable messages: %@", buf, 0xCu);
    }
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v20;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v18 = v8;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(a2);
        }
        __int16 v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
        id v12 = objc_msgSend( *(id *)(a1 + 32),  "_routingDictionaryForService:extraFlags:updateProperties:",  IMServiceNameSMS,  0x80000,  1,  v18);
        id v13 = v12;
        if (v12)
        {
          if (IMOSLoggingEnabled(v12))
          {
            v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v18;
              v25 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "  Adding route: %@", buf, 0xCu);
            }
          }

          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v13, objc_msgSend(v11, "GUID"));
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  if (a3 > 0.0)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
    if (*(_BYTE *)(v15 + 24))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
      double v17 = *(double *)(v16 + 24);
      if (v17 >= a3) {
        double v17 = a3;
      }
      *(double *)(v16 + 24) = v17;
    }

    else
    {
      *(_BYTE *)(v15 + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a3;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100002E64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, double))(v2 + 16))( v2,  *(void *)(a1 + 32),  *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t sub_1000030EC(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("nil");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of expire state check: %@",  (uint8_t *)&v3,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16LL))(0.0);
  }

  return result;
}

uint64_t sub_1000031C8(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of expire state check: %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

uint64_t sub_100003574(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of expire state check: %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

uint64_t sub_10000384C(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("nil");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of schedule message: %@",  (uint8_t *)&v3,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16LL))(0.0);
  }

  return result;
}

uint64_t sub_100003928(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of schedule message check : %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

void sub_100003A74(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v4 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v7 = IMDMessageServicesScheduledDateKey;
    double v8 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int16 v11 = (void *)IMDMessageRecordCopyGUIDForMessage(v10);
        uint64_t Date = IMDMessageRecordGetDate(v10, 0LL);
        if (v11)
        {
          uint64_t v13 = Date;
          v14 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", Date),  v7,  0LL);
          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, v11);
          objc_msgSend( +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v13),  "timeIntervalSinceNow");
          double v16 = v15;
        }

        else
        {
          double v16 = 0.0;
        }

        if (v8 >= v16 || v8 <= 0.0) {
          double v18 = v16;
        }
        else {
          double v18 = v8;
        }
        if (v16 > 0.0) {
          double v8 = v18;
        }
      }

      id v5 = [a2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v5);
  }

  else
  {
    double v8 = 0.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003C8C;
  block[3] = &unk_10000C6B8;
  uint64_t v19 = *(void *)(a1 + 32);
  block[4] = v3;
  block[5] = v19;
  *(double *)&block[6] = v8;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100003C8C(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of scheduled messages check: %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

uint64_t sub_100003F78(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("nil");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of watchdog check: %@",  (uint8_t *)&v3,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16LL))(0.0);
  }

  return result;
}

uint64_t sub_100004054(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of watchdog check: %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

uint64_t sub_1000043D0(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled(result))
    {
      uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Results of watchdog check: %@",  (uint8_t *)&v4,  0xCu);
      }
    }

    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16LL))(*(double *)(v1 + 48));
  }

  return result;
}

uint64_t sub_1000044B0(uint64_t result, uint64_t *a2, _BYTE *a3, double *a4, void *a5, void *a6)
{
  if (!result) {
    return result;
  }
  v32 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = 0LL;
  IMDMessageRecordBulkCopy( result,  0LL,  &v33,  0LL,  &v32,  &v31,  0LL,  0LL,  &v30,  0LL,  0LL,  &v29,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v28,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,
    0LL,
    0LL,
    0LL,
    0LL,
    0LL,
    0LL);
  unint64_t v11 = (unint64_t)[v29 unsignedLongLongValue];
  id v12 = [v29 unsignedLongLongValue];
  uint64_t v13 = v28;
  if ((v12 & 0x1000000) == 0)
  {
    double v14 = 0.0;
    if (IMOSLoggingEnabled(v12))
    {
      double v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = @"YES";
        if ((v11 & 4) == 0) {
          double v16 = @"NO";
        }
        *(_DWORD *)buf = 134219522;
        uint64_t v35 = v33;
        __int16 v36 = 2112;
        v37 = v32;
        __int16 v38 = 2112;
        v39 = @"NO";
        __int16 v40 = 2112;
        v41 = v16;
        __int16 v42 = 2048;
        uint64_t v43 = v28;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        __int16 v46 = 2048;
        uint64_t v47 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Ignoring non-expirable message with rowID: %lld, guid: %@, is_expirable: %@, from_me: %@, expire_state: %lld, date: %lld, date_played: %lld",  buf,  0x48u);
      }
    }

    BOOL v17 = 0;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  if (v28 <= 2)
  {
    if (v31) {
      id v18 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v31);
    }
    else {
      id v18 = 0LL;
    }
    if (v30) {
      id v22 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v30);
    }
    else {
      id v22 = 0LL;
    }
    double v23 = IMMessageItemExpireStateExpiredDuration();
    double v24 = IMMessageItemExpireStateExpiringDuration();
    double v25 = IMMessageItemTimeIntervalSinceStartedExpiringForTimes((v11 >> 2) & 1, v18, v22);
    double v26 = v24 - v25;
    uint64_t v27 = 2LL;
    if (v25 > v24) {
      double v26 = v23 - v25;
    }
    else {
      uint64_t v27 = v13;
    }
    BOOL v17 = v25 > v23;
    if (v25 <= v23) {
      uint64_t v13 = v27;
    }
    else {
      uint64_t v13 = 2LL;
    }
    if (v25 > v23) {
      double v26 = 0.0;
    }
    double v14 = fmax(v26, 0.0);
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  BOOL v17 = 0;
  double v14 = 0.0;
  if (a2) {
LABEL_14:
  }
    *a2 = v13;
LABEL_15:
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v33;
  }
  uint64_t v19 = v32;
  if (a6) {
    *a6 = v32;
  }
  id v20 = v19;
  id v21 = v29;
  return v28 != v13 || v17;
}

uint64_t sub_1000047A8(uint64_t a1)
{
  return IMSetDomainIntForKey(@"com.apple.messaging.expire", @"expireWatermark_v2", a1);
}

uint64_t sub_1000047C0()
{
  uint64_t v3 = 0LL;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  uint64_t v6 = IMGetDomainIntForKey(@"com.apple.messaging.expire", @"expireWatermark_v2");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000487C;
  block[3] = &unk_10000C708;
  block[4] = &v3;
  if (qword_100010D40 != -1) {
    dispatch_once(&qword_100010D40, block);
  }
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_10000487C(uint64_t a1)
{
  uint64_t result = IMDMessageRecordGetMessagesSequenceNumber();
  if (result >= 1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(void *)(v3 + 24) > result)
    {
      *(void *)(v3 + 24) = 0LL;
      return IMSetDomainIntForKey( @"com.apple.messaging.expire",  @"expireWatermark_v2",  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    }
  }

  return result;
}

id sub_100004DC0(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result = [a3 isSticker];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

uint64_t sub_1000050C8(uint64_t a1, _BYTE *a2, double *a3, void *a4, void *a5)
{
  if (!a1) {
    return 0LL;
  }
  v39 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v37 = 0LL;
  id v38 = 0LL;
  uint64_t v35 = 0LL;
  id v36 = 0LL;
  uint64_t v34 = 0LL;
  IMDMessageRecordBulkCopy( a1,  0LL,  &v40,  0LL,  &v39,  &v37,  0LL,  0LL,  0LL,  0LL,  0LL,  &v36,  &v38,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v34,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,
    0LL,
    0LL,
    0LL,
    0LL,
    &v35,
    0LL);
  unsigned __int16 v9 = (unsigned __int16)[v36 unsignedLongLongValue];
  if (v37)
  {
    unsigned __int16 v10 = v9;
    id v11 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v37);
    if (v35 == 2)
    {
      if (v34)
      {
        id v12 = +[NSDictionary dictionaryWithMessageSummaryInfoData:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithMessageSummaryInfoData:");
        id v13 = -[NSDictionary objectForKey:](v12, "objectForKey:", IMMessageSummaryInfoScheduledMessageLastModifiedTime);
      }

      else
      {
        id v13 = 0LL;
      }

      if (v13) {
        id v11 = v13;
      }
    }

    id v15 = v38;
    if ([v38 isEqualToString:IMServiceNameiMessageLite])
    {
      double v16 = 3600.0;
    }

    else if ([v15 isEqualToString:IMServiceNameSatelliteSMS])
    {
      double v16 = 3600.0;
    }

    else
    {
      double v16 = 600.0;
    }

    id v17 = objc_msgSend( +[FTServerBag sharedInstanceForBagType:](FTServerBag, "sharedInstanceForBagType:", 1),  "objectForKey:",  @"md-watchdog-duration");
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      id v19 = [v17 objectForKeyedSubscript:v15];
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        [v19 doubleValue];
        if (v21 != 0.0)
        {
          [v19 doubleValue];
          double v16 = v22;
        }
      }
    }

    uint64_t v23 = IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.imessage",  @"MessageWatchdogDuration",  (uint64_t)v16);
    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
    double v25 = v24;
    id v26 = [v11 timeIntervalSinceReferenceDate];
    double v28 = v25 - v27;
    if (v28 <= (double)v23)
    {
      uint64_t v14 = 0LL;
      double v29 = (double)v23 - v28;
      if (!a2) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }

    if ((v10 & 0x8000) == 0)
    {
      uint64_t v14 = 1LL;
      goto LABEL_28;
    }

    if (IMOSLoggingEnabled(v26))
    {
      uint64_t v30 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v42 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Watchdog wants to fail message with guid %@ but message is sent",  buf,  0xCu);
      }
    }
  }

  uint64_t v14 = 0LL;
LABEL_28:
  double v29 = 0.0;
  if (a2) {
LABEL_29:
  }
    *a2 = v14;
LABEL_30:
  if (a3) {
    *a3 = fmax(v29, 0.0);
  }
  if (a4) {
    *a4 = v40;
  }
  uint64_t v31 = v39;
  if (a5) {
    *a5 = v39;
  }
  id v32 = v31;

  return v14;
}

uint64_t sub_100005470(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    uint64_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Updating watchdog message watermark to %d",  (uint8_t *)v4,  8u);
    }
  }

  return IMSetDomainIntForKey(@"com.apple.messaging.watchdog", @"watchdogWatermark", a1);
}

uint64_t sub_100005548()
{
  uint64_t v3 = 0LL;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  uint64_t v6 = IMGetDomainIntForKey(@"com.apple.messaging.watchdog", @"watchdogWatermark");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005604;
  block[3] = &unk_10000C708;
  block[4] = &v3;
  if (qword_100010D48 != -1) {
    dispatch_once(&qword_100010D48, block);
  }
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_100005604(uint64_t a1)
{
  uint64_t result = IMDMessageRecordGetMessagesSequenceNumber();
  if (result >= 1)
  {
    int v3 = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) > result)
    {
      if (IMOSLoggingEnabled(result))
      {
        int v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
          v6[0] = 67109376;
          v6[1] = v5;
          __int16 v7 = 1024;
          int v8 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Watchdog watermark (%d) was greater than sequence number (%d) - resetting",  (uint8_t *)v6,  0xEu);
        }
      }

      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
      return sub_100005470(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    }
  }

  return result;
}

void sub_1000057E4(id a1)
{
  qword_100010D68 = objc_alloc_init(&OBJC_CLASS___IMDMSASMSRoutingAgent);
}

LABEL_16:
  if (IMOSLoggingEnabled(v7))
  {
    double v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v21 = Seconds;
      double v22 = 2048;
      uint64_t v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Comparing media duration (%f) against maximum: %f",  buf,  0x16u);
    }
  }

  if (v8 <= 0.0) {
    id v17 = 1;
  }
  else {
    id v17 = v13;
  }
  uint64_t result = Seconds < v8;
  if ((v17 & 1) != 0) {
    return 1;
  }
  return result;
}

void sub_100005ED4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100005EA4LL);
  }

  _Unwind_Resume(a1);
}

void sub_100006068(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100006034LL);
  }

  _Unwind_Resume(a1);
}

void sub_100006228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100006240(uint64_t a1)
{
  id result = (id)IMDMessageRecordGetMessagesSequenceNumber();
  int v3 = (int)result;
  if ((int)result >= 1 && *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > (int)result)
  {
    if (IMOSLoggingEnabled(result))
    {
      int v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        v6[0] = 67109376;
        v6[1] = v5;
        __int16 v7 = 1024;
        int v8 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Watermark (%d) was greater than sequence number (%d) - resetting",  (uint8_t *)v6,  0xEu);
      }
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    return [*(id *)(a1 + 32) _updateUndeliveredMessageWaterMark:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }

  return result;
}

uint64_t sub_100006698(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100006B68(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1000068F0LL);
  }

  _Unwind_Resume(a1);
}

LABEL_23:
  double v16 = v6;
  id v17 = 12;
LABEL_24:
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v7, buf, v17);
  return 0;
}

void sub_100007318( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1000072D4LL);
  }

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(exc_buf);
}

void sub_1000073AC(void *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x100006FD8LL);
  }

  JUMPOUT(0x10000738CLL);
}

BOOL sub_1000073C8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7 = objc_msgSend(*(id *)(a1 + 32), "_attachmentCanBeSentViaMMS:");
  if ((v7 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v7))
    {
      int v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = [a3 GUID];
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Attachment (%@) cannot be sent via MMS",  (uint8_t *)&v12,  0xCu);
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  unsigned __int16 v9 = (const __CFString *)[a3 UTIType];
  BOOL result = sub_1000020C0(v9);
  if (result)
  {
    uint64_t v11 = *(void *)(a1 + 48);
  }

  else
  {
    BOOL result = sub_100002048(v9);
    if (result)
    {
      uint64_t v11 = *(void *)(a1 + 56);
    }

    else
    {
      BOOL result = sub_100002070(v9);
      if (!result) {
        goto LABEL_13;
      }
      uint64_t v11 = *(void *)(a1 + 64);
    }
  }

  ++*(void *)(*(void *)(v11 + 8) + 24LL);
LABEL_13:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    *a4 = 1;
  }
  return result;
}

void sub_100007574(uint64_t a1, void *a2)
{
  if (IMOSLoggingEnabled(a1))
  {
    int v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got candidate messages: %@", buf, 0xCu);
    }
  }

  v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v5 = [a2 countByEnumeratingWithState:&v51 objects:v61 count:16];
  id v7 = v5;
  if (!v5)
  {
    double v10 = 0.0;
    uint64_t v8 = 0x7FFFFFFFLL;
    if (a2) {
      goto LABEL_54;
    }
LABEL_59:
    if (IMOSLoggingEnabled(v5))
    {
      __int16 v46 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Updating watermark because we received no candidate messages",  buf,  2u);
      }
    }

    uint64_t v8 = IMDMessageRecordCountMessages();
    goto LABEL_63;
  }

  char v50 = 0;
  uint64_t v8 = 0x7FFFFFFFLL;
  uint64_t v9 = *(void *)v52;
  double v10 = 0.0;
  *(void *)&__int128 v6 = 138412546LL;
  __int128 v48 = v6;
  do
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v52 != v9) {
        objc_enumerationMutation(a2);
      }
      int v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v11);
      id v13 = objc_msgSend( objc_msgSend(objc_msgSend(v12, "participants", v48), "__imFirstObject"),  "_appearsToBePhoneNumber");
      if ((v13 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v13))
        {
          uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v12 GUID];
            *(_DWORD *)buf = 138412290;
            id v56 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Message (%@) is not to a phone number, not downgrading",  buf,  0xCu);
          }
        }

        [v12 senderLogin];
        goto LABEL_19;
      }

      id v14 = [v12 senderLogin];
      if ([v14 length])
      {
        if (([v14 hasPrefix:@"p:"] & 1) == 0)
        {
          id v15 = [v14 hasPrefix:@"P:"];
          if ((v15 & 1) == 0)
          {
            uint64_t v43 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
              goto LABEL_19;
            }
            id v44 = [v12 GUID];
            *(_DWORD *)buf = v48;
            id v56 = v44;
            __int16 v57 = 2112;
            double v58 = *(double *)&v14;
            id v38 = v43;
            v39 = "Message (%@) is not from a phone number (sender:'%@'), not downgrading to SMS";
            uint32_t v40 = 22;
            goto LABEL_47;
          }
        }
      }

      id v16 = [*(id *)(a1 + 32) canSendMessage:v12];
      if ((v16 & 1) != 0)
      {
        int v17 = 1;
        goto LABEL_20;
      }

      if (IMOSLoggingEnabled(v16))
      {
        id v36 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v37 = [v12 GUID];
          *(_DWORD *)buf = 138412290;
          id v56 = v37;
          id v38 = v36;
          v39 = "Message (%@) cannot be sent via SMS/MMS, not downgrading";
          uint32_t v40 = 12;
LABEL_47:
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v39, buf, v40);
        }
      }

LABEL_19:
      int v17 = 0;
LABEL_20:
      [*(id *)(a1 + 32) _upperDowngradeIntervalForMessage:v12];
      double v21 = v20;
      id v22 = [v12 timeSinceSent];
      double v24 = v23;
      if (v21 > 0.0 && v23 < v21)
      {
        if (v17)
        {
          id v30 = [*(id *)(a1 + 32) _lowerDowngradeIntervalForMessage:v12];
          double v32 = v31;
          double v33 = v31 - v24;
          if (v31 - v24 <= 0.0)
          {
            if (IMOSLoggingEnabled(v30))
            {
              v41 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                id v42 = [v12 GUID];
                *(_DWORD *)buf = 138412802;
                id v56 = v42;
                __int16 v57 = 2048;
                double v58 = v32;
                __int16 v59 = 2048;
                double v60 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "Message with GUID: (%@) is ready to be sent immediately (downgradeInterval:%7.3f  timeSinceSent:%7.3f)",  buf,  0x20u);
              }
            }

            -[NSMutableArray addObject:](v49, "addObject:", v12);
          }

          else
          {
            if (IMOSLoggingEnabled(v30))
            {
              uint64_t v34 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
              char v50 = 1;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                id v35 = [v12 GUID];
                *(_DWORD *)buf = v48;
                id v56 = v35;
                __int16 v57 = 2048;
                double v58 = v33;
                char v50 = 1;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Scheduling message with GUID: (%@) to fire in %7.3f seconds",  buf,  0x16u);
              }
            }

            else
            {
              char v50 = 1;
            }
          }
        }
      }

      else
      {
        if (IMOSLoggingEnabled(v22))
        {
          id v26 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            id v27 = [v12 GUID];
            *(_DWORD *)buf = 138412802;
            id v56 = v27;
            __int16 v57 = 2048;
            double v58 = v24;
            __int16 v59 = 2048;
            double v60 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Message (%@) was sent %f seconds ago, skipping since it's over %f seconds old",  buf,  0x20u);
          }
        }

        id v28 = [v12 rowID];
        uint64_t v29 = (int)v8;
        uint64_t v8 = v29;
      }

      uint64_t v11 = (char *)v11 + 1;
    }

    while (v7 != v11);
    id v5 = [a2 countByEnumeratingWithState:&v51 objects:v61 count:16];
    id v7 = v5;
  }

  while (v5);
  if (!a2) {
    goto LABEL_59;
  }
LABEL_54:
  id v5 = [a2 count];
  if (!v5) {
    goto LABEL_59;
  }
  if ((_DWORD)v8 != 0x7FFFFFFF)
  {
    if (IMOSLoggingEnabled(v5))
    {
      uint64_t v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "Updating watermark to lowestIgnoredMessageDueToAge",  buf,  2u);
      }
    }

LABEL_63:
    [*(id *)(a1 + 32) _updateUndeliveredMessageWaterMark:v8];
  }

  uint64_t v47 = *(void *)(a1 + 40);
  if (v47) {
    (*(void (**)(uint64_t, NSMutableArray *, double))(v47 + 16))(v47, v49, v10);
  }
}

id objc_msgSend_fetchScheduledMessageRecordsForChatRecordWithGUID_limit_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchScheduledMessageRecordsForChatRecordWithGUID:limit:completionHandler:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}