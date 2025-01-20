@interface IMDMessageServicesAgentController
+ (id)sharedInstance;
- (_IMDChatRecordStruct)copyBestChatWithGuid:(id)a3 message:(_IMDMessageRecordStruct *)a4;
- (id)_routingDictionaryForService:(id)a3 extraFlags:(unint64_t)a4 updateProperties:(BOOL)a5;
- (void)_chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 error:(unsigned int)a5 handler:(id)a6;
- (void)checkExpireStateForMessage:(id)a3 handler:(id)a4;
- (void)checkExpireStateWithHandler:(id)a3;
- (void)checkForPendingRoutingWithHandler:(id)a3;
- (void)checkScheduledMessageForGUID:(id)a3 handler:(id)a4;
- (void)checkScheduledMessageWithHandler:(id)a3;
- (void)checkWatchdogForMessage:(id)a3 handler:(id)a4;
- (void)checkWatchdogWithHandler:(id)a3;
- (void)chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 withError:(unsigned int)a5 inChat:(id)a6 handler:(id)a7;
@end

@implementation IMDMessageServicesAgentController

+ (id)sharedInstance
{
  if (qword_100010D30 != -1) {
    dispatch_once(&qword_100010D30, &stru_10000C5F0);
  }
  return (id)qword_100010D38;
}

- (id)_routingDictionaryForService:(id)a3 extraFlags:(unint64_t)a4 updateProperties:(BOOL)a5
{
  BOOL v5 = a5;
  id result = [a3 length];
  if (result)
  {
    uint64_t v9 = IMDMessageServicesServiceKey;
    v10 = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4);
    uint64_t v11 = IMDMessageServicesFlagsKey;
    v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5);
    return +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a3,  v9,  v10,  v11,  v12,  IMDMessageServicesUpdateDowngradePropertiesKey,  0LL);
  }

  return result;
}

- (_IMDChatRecordStruct)copyBestChatWithGuid:(id)a3 message:(_IMDMessageRecordStruct *)a4
{
  v6 = (_IMDChatRecordStruct *)[a3 length];
  if (v6)
  {
    v6 = (_IMDChatRecordStruct *)IMDChatRecordCopyChatForGUID(a3);
    v7 = v6;
    if (!a4) {
      return v7;
    }
  }

  else
  {
    v7 = 0LL;
    if (!a4) {
      return v7;
    }
  }

  if (!v7)
  {
    if (IMOSLoggingEnabled(v6))
    {
      v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Could not find message with chatGUID:%@",  (uint8_t *)&v13,  0xCu);
      }
    }

    uint64_t v9 = (const __CFArray *)IMDMessageRecordCopyChats(a4);
    v10 = v9;
    if (v9)
    {
      if ((int)CFArrayGetCount(v9) < 1)
      {
        v7 = 0LL;
      }

      else
      {
        ValueAtIndex = (_IMDChatRecordStruct *)CFArrayGetValueAtIndex(v10, 0LL);
        v7 = ValueAtIndex;
        if (ValueAtIndex) {
          CFRetain(ValueAtIndex);
        }
      }

      CFRelease(v10);
    }

    else
    {
      return 0LL;
    }
  }

  return v7;
}

- (void)_chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 error:(unsigned int)a5 handler:(id)a6
{
  id v7 = a3;
  if (a3)
  {
    if ([a3 service] && objc_msgSend(a4, "containsObject:", objc_msgSend(v7, "service")))
    {
      uint64_t v11 = IMSMSFallbackEnabled();
      if ((v11 & 1) != 0)
      {
        if (objc_msgSend( +[IMDMSASMSRoutingAgent smsRoutingAgent]( IMDMSASMSRoutingAgent,  "smsRoutingAgent"),  "shouldSendMessage:",  v7))
        {
          id v12 = [v7 GUID];
          id v7 = (id)IMServiceNameSMS;
          unint64_t v13 = (unint64_t)(a5 != 22) << 19;
          BOOL v14 = a5 - 12 < 0xFFFFFFFA;
          goto LABEL_13;
        }
      }

      else if (IMOSLoggingEnabled(v11))
      {
        v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v19 = 138412290;
          id v20 = [v7 GUID];
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Message (%@) cannot be sent via SMS because sms fallback is not enabled",  (uint8_t *)&v19,  0xCu);
        }
      }
    }

    BOOL v14 = 0LL;
    unint64_t v13 = 0LL;
    id v7 = 0LL;
  }

  else
  {
    BOOL v14 = 0LL;
    unint64_t v13 = 0LL;
  }

  id v12 = 0LL;
LABEL_13:
  v16 = -[IMDMessageServicesAgentController _routingDictionaryForService:extraFlags:updateProperties:]( self,  "_routingDictionaryForService:extraFlags:updateProperties:",  v7,  v13,  v14);
  v17 = v16;
  if (!v16) {
    goto LABEL_16;
  }
  v16 = (NSDictionary *)[v12 length];
  if (v16)
  {
    v16 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v17,  v12);
    v17 = v16;
LABEL_16:
    if (!a6) {
      return;
    }
    goto LABEL_17;
  }

  v17 = 0LL;
  if (!a6) {
    return;
  }
LABEL_17:
  if (IMOSLoggingEnabled(v16))
  {
    v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Chose route:%@ for message:%@",  (uint8_t *)&v19,  0x16u);
    }
  }

  (*((void (**)(id, NSDictionary *, double))a6 + 2))(a6, v17, 0.0);
}

- (void)chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 withError:(unsigned int)a5 inChat:(id)a6 handler:(id)a7
{
  unint64_t v13 = (const void *)IMDMessageRecordCopyMessageForGUID(a3, a2);
  BOOL v14 = -[IMDMessageServicesAgentController copyBestChatWithGuid:message:]( self,  "copyBestChatWithGuid:message:",  a6,  v13);
  if (!v14)
  {
    if (IMOSLoggingEnabled(0LL))
    {
      v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = a3;
        __int16 v21 = 2112;
        id v22 = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Could not find a chat for message with GUID:%@   chatGUID:%@",  buf,  0x16u);
      }
    }
  }

  v16 = -[IMDMSAMessage initWithMessage:inChat:]( objc_alloc(&OBJC_CLASS___IMDMSAMessage),  "initWithMessage:inChat:",  v13,  v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002758;
  block[3] = &unk_10000C618;
  block[4] = a3;
  block[5] = a6;
  block[6] = v16;
  block[7] = self;
  unsigned int v18 = a5;
  block[8] = a4;
  block[9] = a7;
  dispatch_async(&_dispatch_main_q, block);

  if (v14) {
    CFRelease(v14);
  }
  if (v13) {
    CFRelease(v13);
  }
}

- (void)checkForPendingRoutingWithHandler:(id)a3
{
  int v5 = IMSMSEnabled(self, a2);
  int v6 = IMSMSFallbackEnabled();
  id v7 = -[IMSharedMessageSendingUtilities isRCSEnabled]( +[IMSharedMessageSendingUtilities sharedInstance]( &OBJC_CLASS___IMSharedMessageSendingUtilities,  "sharedInstance"),  "isRCSEnabled");
  int v8 = (int)v7;
  if (IMOSLoggingEnabled(v7))
  {
    uint64_t v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = @"NO";
      if (v5) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      if (v6) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      if (v8) {
        v10 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Checking pending route  (SMS Enabled: %@    Fallback Enabled: %@   RCSEnabled: %@)",  buf,  0x20u);
    }
  }

  unint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v29) = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  v23[3] = 0LL;
  BOOL v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  if ((v5 & v6 | v8) == 1)
  {
    if (IMOSLoggingEnabled(v15))
    {
      v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Checking for fallback messages...", v24, 2u);
      }
    }

    id v17 = +[IMDMSASMSRoutingAgent smsRoutingAgent](&OBJC_CLASS___IMDMSASMSRoutingAgent, "smsRoutingAgent");
    dispatch_group_enter(v14);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100002BE4;
    v22[3] = &unk_10000C640;
    v22[4] = self;
    v22[5] = v13;
    v22[7] = buf;
    v22[8] = v23;
    v22[6] = v14;
    [v17 getRoutableMessages:v22];
  }

  else if (IMOSLoggingEnabled(v15))
  {
    unsigned int v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = @"NO";
      if (v5) {
        id v20 = @"YES";
      }
      else {
        id v20 = @"NO";
      }
      if (v6) {
        int v19 = @"YES";
      }
      *(_DWORD *)v24 = 138412546;
      v25 = v20;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Not getting pending routes (isSMSEnabled:%@  isSMSFallBackEnabled:%@)",  v24,  0x16u);
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002E64;
  block[3] = &unk_10000C668;
  block[6] = a3;
  block[7] = v23;
  block[4] = v13;
  block[5] = v14;
  dispatch_group_notify(v14, &_dispatch_main_q, block);
  dispatch_group_leave(v14);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(buf, 8);
}

- (void)checkExpireStateForMessage:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled(v5))
  {
    id v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Check expire state for message: %@", buf, 0xCu);
    }
  }

  if (a3)
  {
    uint64_t v8 = IMDMessageRecordCopyMessageForGUID(a3, v6);
    uint64_t v9 = (const void *)v8;
    *(void *)buf = 0LL;
    unsigned __int8 v17 = 0;
    uint64_t v16 = 0LL;
    if (v8 && sub_1000044AC(v8, buf, &v17, &v16, 0LL, 0LL))
    {
      v10 = objc_alloc(&OBJC_CLASS___NSDictionary);
      uint64_t v11 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)buf);
      id v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17);
      unint64_t v13 = -[NSDictionary initWithObjectsAndKeys:]( v10,  "initWithObjectsAndKeys:",  v11,  IMDMessageServicesExpireStateKey,  v12,  IMDMessageServicesExpireStateShouldDeleteKey,  0LL);
      BOOL v14 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v13,  a3);
    }

    else
    {
      BOOL v14 = 0LL;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000031C8;
    block[3] = &unk_10000C6B8;
    block[4] = v14;
    block[5] = v5;
    block[6] = v16;
    dispatch_async(&_dispatch_main_q, block);
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000030EC;
    v18[3] = &unk_10000C690;
    v18[4] = v5;
    dispatch_async(&_dispatch_main_q, v18);
  }

- (void)checkExpireStateWithHandler:(id)a3
{
  if (IMOSLoggingEnabled(self))
  {
    v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Check expire state for messages", buf, 2u);
    }
  }

  uint64_t v4 = sub_1000047C0();
  id v5 = (void *)IMDMessageRecordCopyExpiringOrExpiredMessages(v4);
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = IMDMessageServicesExpireStateKey;
    uint64_t v10 = IMDMessageServicesExpireStateShouldDeleteKey;
    double v11 = 0.0;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        *(void *)buf = 0LL;
        unsigned __int8 v28 = 0;
        uint64_t v26 = 0LL;
        double v27 = 0.0;
        uint64_t v25 = 0LL;
        int v14 = sub_1000044AC(v13, buf, &v28, &v27, &v26, &v25);
        if (v25) {
          int v15 = v14;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          uint64_t v16 = objc_alloc(&OBJC_CLASS___NSDictionary);
          unsigned __int8 v17 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)buf);
          unsigned int v18 = -[NSDictionary initWithObjectsAndKeys:]( v16,  "initWithObjectsAndKeys:",  v17,  v9,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v28),  v10,  0LL);
          -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v18, v25);
        }

        if (v28)
        {
          if (v7 >= v26) {
            uint64_t v19 = v26;
          }
          else {
            uint64_t v19 = v7;
          }
          if (v7 <= 0) {
            uint64_t v7 = v26;
          }
          else {
            uint64_t v7 = v19;
          }
        }

        if (v11 >= v27 || v11 <= 0.0) {
          double v21 = v27;
        }
        else {
          double v21 = v11;
        }
        if (v27 > 0.0) {
          double v11 = v21;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v6);
    if (v7 >= 1) {
      sub_1000047A8(v7);
    }
  }

  else
  {
    double v11 = 0.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003574;
  block[3] = &unk_10000C6B8;
  block[4] = v23;
  block[5] = a3;
  *(double *)&block[6] = v11;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)checkScheduledMessageForGUID:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled(v5))
  {
    uint64_t v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Check scheduled message for guid: %@", buf, 0xCu);
    }
  }

  if (a3)
  {
    uint64_t v8 = (const void *)IMDMessageRecordCopyMessageForGUID(a3, v6);
    uint64_t Date = IMDMessageRecordGetDate(v8, 0LL);
    uint64_t v10 = objc_alloc(&OBJC_CLASS___NSDictionary);
    double v11 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", Date);
    id v12 = -[NSDictionary initWithObjectsAndKeys:]( v10,  "initWithObjectsAndKeys:",  v11,  IMDMessageServicesScheduledDateKey,  0LL);
    uint64_t v13 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v12,  a3);

    objc_msgSend( +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)Date),  "timeIntervalSinceNow");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003928;
    block[3] = &unk_10000C6B8;
    block[4] = v13;
    block[5] = v5;
    block[6] = v14;
    dispatch_async(&_dispatch_main_q, block);
    if (v8) {
      CFRelease(v8);
    }
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000384C;
    v16[3] = &unk_10000C690;
    v16[4] = v5;
    dispatch_async(&_dispatch_main_q, v16);
  }

- (void)checkScheduledMessageWithHandler:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100003A74;
  v3[3] = &unk_10000C6E0;
  v3[4] = a3;
  objc_msgSend( +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase"),  "fetchScheduledMessageRecordsForChatRecordWithGUID:limit:completionHandler:",  0,  100,  v3);
}

- (void)checkWatchdogForMessage:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled(v5))
  {
    uint64_t v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Check watchdog for message: %@", buf, 0xCu);
    }
  }

  if (a3)
  {
    uint64_t v8 = IMDMessageRecordCopyMessageForGUID(a3, v6);
    uint64_t v9 = (const void *)v8;
    unsigned __int8 v15 = 0;
    *(void *)buf = 0LL;
    if (v8 && sub_1000050C8(v8, &v15, (double *)buf, 0LL, 0LL))
    {
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSDictionary);
      double v11 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15);
      id v12 = -[NSDictionary initWithObjectsAndKeys:]( v10,  "initWithObjectsAndKeys:",  v11,  IMDMessageServicesWatchdogShouldFailSendKey,  0LL);
      uint64_t v13 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v12,  a3);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004054;
    block[3] = &unk_10000C6B8;
    block[4] = v13;
    block[5] = v5;
    block[6] = *(void *)buf;
    dispatch_async(&_dispatch_main_q, block);
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100003F78;
    v16[3] = &unk_10000C690;
    v16[4] = v5;
    dispatch_async(&_dispatch_main_q, v16);
  }

- (void)checkWatchdogWithHandler:(id)a3
{
  if (IMOSLoggingEnabled(self))
  {
    v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Check watchdog for messages", buf, 2u);
    }
  }

  uint64_t v4 = sub_100005548();
  id v5 = (void *)IMDMessageRecordCopyUnsentUnfailedMessages(v4);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = IMDMessageServicesWatchdogShouldFailSendKey;
    double v11 = 0.0;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        unsigned __int8 v26 = 0;
        uint64_t v24 = 0LL;
        *(double *)buf = 0.0;
        uint64_t v23 = 0LL;
        int v14 = sub_1000050C8(v13, &v26, (double *)buf, &v24, &v23);
        if (v23) {
          int v15 = v14;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          uint64_t v16 = objc_alloc(&OBJC_CLASS___NSDictionary);
          unsigned __int8 v17 = -[NSDictionary initWithObjectsAndKeys:]( v16,  "initWithObjectsAndKeys:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26),  v10,  0LL);
          -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v17, v23);
        }

        if (v26)
        {
          if (v8 >= v24) {
            uint64_t v18 = v24;
          }
          else {
            uint64_t v18 = v8;
          }
          if (v8 <= 0) {
            uint64_t v8 = v24;
          }
          else {
            uint64_t v8 = v18;
          }
        }

        else {
          double v20 = v11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v7);
    if (v8 >= 1) {
      sub_100005470(v8);
    }
  }

  else
  {
    double v11 = 0.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000043D0;
  block[3] = &unk_10000C6B8;
  block[4] = v6;
  block[5] = a3;
  *(double *)&block[6] = v11;
  dispatch_async(&_dispatch_main_q, block);
}

@end