@interface IMDMSASMSRoutingAgent
+ (id)smsRoutingAgent;
- (BOOL)__attachmentPassesDurationRestrictions:(id)a3;
- (BOOL)__attachmentPassesMMSRestrictions:(id)a3;
- (BOOL)__isSendableType:(id)a3;
- (BOOL)_attachmentCanBeSentViaMMS:(id)a3;
- (BOOL)_messageHasDowngradeMarkers:(id)a3;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)shouldSendMessage:(id)a3;
- (IMDMSASMSRoutingAgent)init;
- (double)_lowerDowngradeIntervalForMessage:(id)a3;
- (double)_upperDowngradeIntervalForMessage:(id)a3;
- (int)_undeliveredMessageWaterMark;
- (int64_t)_bagValueForKey:(id)a3 defaultValue:(int64_t)a4 minimumValue:(int64_t)a5;
- (void)_getCandidateMessages:(id)a3;
- (void)_updateUndeliveredMessageWaterMark:(int)a3;
- (void)getRoutableMessages:(id)a3;
@end

@implementation IMDMSASMSRoutingAgent

+ (id)smsRoutingAgent
{
  if (qword_100010D50 != -1) {
    dispatch_once(&qword_100010D50, &stru_10000C750);
  }
  if (qword_100010D58 != -1) {
    dispatch_once(&qword_100010D58, &stru_10000C770);
  }
  if (qword_100010D60 != -1) {
    dispatch_once(&qword_100010D60, &stru_10000C790);
  }
  return (id)qword_100010D68;
}

- (IMDMSASMSRoutingAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IMDMSASMSRoutingAgent;
  return -[IMDMSASMSRoutingAgent init](&v3, "init");
}

- (int64_t)_bagValueForKey:(id)a3 defaultValue:(int64_t)a4 minimumValue:(int64_t)a5
{
  id v7 = objc_msgSend( +[FTServerBag sharedInstanceForBagType:](FTServerBag, "sharedInstanceForBagType:", 1),  "objectForKey:",  a3);
  if (v7
    && (v8 = v7, (objc_opt_respondsToSelector(v7, "integerValue") & 1) != 0)
    && (a4 = a5, (uint64_t)[v8 integerValue] >= a5))
  {
    return (int64_t)[v8 integerValue];
  }

  else
  {
    return a4;
  }

- (BOOL)__isSendableType:(id)a3
{
  return sub_1000020C0((const __CFString *)a3)
      || sub_100002048((const __CFString *)a3)
      || sub_100002070((const __CFString *)a3)
      || sub_100002098((const __CFString *)a3);
}

- (BOOL)__attachmentPassesDurationRestrictions:(id)a3
{
  id v3 = a3;
  v4 = (const __CFString *)[a3 UTIType];
  id v5 = [v3 path];
  LOBYTE(v3) = sub_100002070(v4);
  BOOL v6 = sub_100002048(v4);
  id v7 = [v5 length];
  double v8 = 0.0;
  if (!v7) {
    goto LABEL_8;
  }
  v9 = objc_autoreleasePoolPush();
  v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5);
  if (!v10)
  {
    objc_autoreleasePoolPop(v9);
LABEL_8:
    char v13 = 1;
    double Seconds = 0.0;
    goto LABEL_16;
  }

  v11 = -[AVURLAsset initWithURL:options:]( objc_alloc(&OBJC_CLASS___AVURLAsset),  "initWithURL:options:",  v10,  IMAVURLAssetOptionsDefault());
  v12 = v11;
  if (v11) {
    -[AVURLAsset duration](v11, "duration");
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  objc_autoreleasePoolPop(v9);
  if (Seconds > 0.0)
  {
    if (sub_100002070(v4)) {
      id v7 = +[IMCTSMSUtilities IMMMSMaximumVideoDurationForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSMaximumVideoDurationForPhoneNumber:simID:",  0LL,  0LL);
    }
    else {
      id v7 = +[IMCTSMSUtilities IMMMSMaximumAudioDurationForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSMaximumAudioDurationForPhoneNumber:simID:",  0LL,  0LL);
    }
    double v8 = v15;
    char v13 = 0;
  }

  else
  {
    char v13 = 1;
  }

- (BOOL)__attachmentPassesMMSRestrictions:(id)a3
{
  if (!+[IMCTSMSUtilities IMMMSRestrictedModeEnabledForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSRestrictedModeEnabledForPhoneNumber:simID:",  0LL,  0LL)) {
    return 1;
  }
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  id v7 = (const __CFString *)[a3 path];
  double v8 = (const __CFString *)[a3 UTIType];
  id v9 = [a3 mimeType];
  if (-[NSFileManager fileExistsAtPath:](v6, "fileExistsAtPath:", v7))
  {
    LODWORD(v10) = objc_msgSend( -[NSDictionary objectForKey:]( -[NSFileManager attributesOfItemAtPath:error:]( v6,  "attributesOfItemAtPath:error:",  v7,  0),  "objectForKey:",  NSFileSize),  "intValue");
    if (sub_1000020C0(v8))
    {
      v11 = CFURLCreateWithFileSystemPath(0LL, v7, kCFURLPOSIXPathStyle, 0);
      if (v11)
      {
        v12 = v11;
        char v13 = CGImageSourceCreateWithURL(v11, 0LL);
        if (v13)
        {
          v14 = v13;
          size_t Count = CGImageSourceGetCount(v13);
          CFDictionaryRef v16 = CGImageSourceCopyProperties(v14, 0LL);
          if (v16)
          {
            CFDictionaryRef v17 = v16;
            id v18 = -[__CFDictionary objectForKey:](v16, "objectForKey:");
            id v19 = -[__CFDictionary objectForKey:](v17, "objectForKey:", kCGImagePropertyPixelHeight);
            if (v19) {
              BOOL v20 = v18 == 0LL;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20 && Count)
            {
              CFDictionaryRef v21 = CGImageSourceCopyPropertiesAtIndex(v14, 0LL, 0LL);
              if (v21)
              {
                CFDictionaryRef v22 = v21;
                id v18 = -[__CFDictionary objectForKey:](v21, "objectForKey:", kCGImagePropertyPixelWidth);
                id v19 = -[__CFDictionary objectForKey:](v22, "objectForKey:", kCGImagePropertyPixelHeight);
                CFRelease(v22);
              }
            }

            [v18 doubleValue];
            double width = v23;
            [v19 doubleValue];
            double height = v24;
            CFRelease(v17);
          }

          CFRelease(v14);
        }

        CFRelease(v12);
      }
    }

    uint64_t v10 = (int)v10;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return IMMMSPartCanBeSent(v9, v10, width, height);
}

- (BOOL)_attachmentCanBeSentViaMMS:(id)a3
{
  BOOL v5 = -[IMDMSASMSRoutingAgent __isSendableType:](self, "__isSendableType:", [a3 UTIType]);
  if (v5)
  {
    BOOL v6 = -[IMDMSASMSRoutingAgent __attachmentPassesMMSRestrictions:](self, "__attachmentPassesMMSRestrictions:", a3);
    if (v6)
    {
      BOOL v7 = -[IMDMSASMSRoutingAgent __attachmentPassesDurationRestrictions:]( self,  "__attachmentPassesDurationRestrictions:",  a3);
      if (v7)
      {
        LOBYTE(v8) = 1;
        return v8;
      }

      int v8 = IMOSLoggingEnabled(v7);
      if (v8)
      {
        char v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        int v8 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v8)
        {
          LOWORD(v15) = 0;
          uint64_t v10 = "Attachment does not pass duration restrictions";
          goto LABEL_14;
        }
      }
    }

    else
    {
      int v8 = IMOSLoggingEnabled(v6);
      if (v8)
      {
        char v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        int v8 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v8)
        {
          LOWORD(v15) = 0;
          uint64_t v10 = "Attachment does not pass MMS restrictions";
LABEL_14:
          v11 = v13;
          uint32_t v12 = 2;
          goto LABEL_15;
        }
      }
    }
  }

  else
  {
    int v8 = IMOSLoggingEnabled(v5);
    if (v8)
    {
      id v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      int v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        int v15 = 138412290;
        id v16 = [a3 UTIType];
        uint64_t v10 = "UTI type (%@) is not sendable via MMS";
        v11 = v9;
        uint32_t v12 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v15, v12);
        LOBYTE(v8) = 0;
      }
    }
  }

  return v8;
}

- (double)_upperDowngradeIntervalForMessage:(id)a3
{
  id v5 = [a3 service];
  if ([v5 isEqualToString:IMServiceNameiMessage])
  {
    uint64_t v6 = -[IMDMSASMSRoutingAgent _bagValueForKey:defaultValue:minimumValue:]( self,  "_bagValueForKey:defaultValue:minimumValue:",  @"md-auto-resend-as-sms-timeout-upper",  600LL,  30LL);
    double v7 = (double)v6;
    if (IMOSLoggingEnabled(v6))
    {
      int v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218242;
        double v14 = v7;
        __int16 v15 = 2112;
        id v16 = [a3 GUID];
        id v9 = "Using upper downgrade interval (%f) for message with GUID {%@}";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, 0x16u);
      }
    }
  }

  else
  {
    id v10 = -[IMDMSASMSRoutingAgent _lowerDowngradeIntervalForMessage:](self, "_lowerDowngradeIntervalForMessage:", a3);
    double v7 = v11 + v11;
    if (IMOSLoggingEnabled(v10))
    {
      int v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218242;
        double v14 = v7;
        __int16 v15 = 2112;
        id v16 = [a3 GUID];
        id v9 = "Using 2x lower downgrade interval for upper downgrade interval (%f) for message with GUID {%@}";
        goto LABEL_8;
      }
    }
  }

  return v7;
}

- (void)_updateUndeliveredMessageWaterMark:(int)a3
{
  if (IMOSLoggingEnabled(self))
  {
    v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Updating undelivered message watermark to %d",  (uint8_t *)v5,  8u);
    }
  }

  IMSetDomainIntForKey(@"com.apple.messaging.downgrade.sms", @"downgradeWatermark", a3);
}

- (int)_undeliveredMessageWaterMark
{
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  int v3 = IMGetDomainIntForKey(@"com.apple.messaging.downgrade.sms", @"downgradeWatermark");
  *((_DWORD *)v8 + 6) = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006240;
  v6[3] = &unk_10000C7B8;
  v6[4] = self;
  v6[5] = &v7;
  if (qword_100010D70 != -1) {
    dispatch_once(&qword_100010D70, v6);
  }
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_getCandidateMessages:(id)a3
{
  uint64_t v3 = -[IMDMSASMSRoutingAgent _undeliveredMessageWaterMark](self, "_undeliveredMessageWaterMark");
  signed int v4 = v3;
  if (IMOSLoggingEnabled(v3))
  {
    id v5 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Undelivered message watermark is %d", buf, 8u);
    }
  }

  uint64_t v6 = (void *)IMDMessageRecordCopyUndeliveredOneToOneiMessages(v4);
  if (IMOSLoggingEnabled(v6))
  {
    uint64_t v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int v8 = [v6 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v30 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Found %d potential SMS downgrade messages",  buf,  8u);
    }
  }

  if (!v6 || ![v6 count])
  {
    id v21 = 0LL;
    goto LABEL_35;
  }

  uint64_t v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v10) {
    goto LABEL_33;
  }
  uint64_t v11 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
      double v14 = (const __CFArray *)IMDMessageRecordCopyChats(v13);
      __int16 v15 = v14;
      if (v14)
      {
        if ((int)CFArrayGetCount(v14) < 1)
        {
          CFDictionaryRef v17 = 0LL;
        }

        else
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v15, 0LL);
          CFDictionaryRef v17 = ValueAtIndex;
          if (ValueAtIndex) {
            CFRetain(ValueAtIndex);
          }
        }

        CFRelease(v15);
        if (v13) {
          BOOL v18 = v17 == 0LL;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          id v19 = -[IMDMSAMessage initWithMessage:inChat:]( objc_alloc(&OBJC_CLASS___IMDMSAMessage),  "initWithMessage:inChat:",  v13,  v17);
          BOOL v20 = -[IMDMSAMessage service](v19, "service");
          if (!-[NSString isEqualToString:](v20, "isEqualToString:", IMServiceNameiMessage)
            || IMSMSFallbackEnabled())
          {
            -[NSMutableArray addObject:](v9, "addObject:", v19);
          }

LABEL_30:
          CFRelease(v17);
          continue;
        }

        if (v17) {
          goto LABEL_30;
        }
      }
    }

    id v10 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }

  while (v10);
LABEL_33:
  id v21 = -[NSMutableArray copy](v9, "copy");

LABEL_35:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006698;
  block[3] = &unk_10000C7E0;
  block[4] = v21;
  block[5] = a3;
  dispatch_async(&_dispatch_main_q, block);
}

- (BOOL)_messageHasDowngradeMarkers:(id)a3
{
  id v4 = [a3 chatProperties];
  if (![v4 objectForKey:kFZChatPropertyLastDowngradedMessageTime]) {
    return 0;
  }
  id v5 = [v4 objectForKey:kFZChatPropertyManuallyDowngradedMessageCount];
  id v6 = [v4 objectForKey:kFZChatPropertyAutoDowngradedMessageCount];
  uint64_t v7 = (uint64_t)[v5 integerValue];
  if (v7 <= 0)
  {
    uint64_t v7 = (uint64_t)[v6 integerValue];
    if (v7 < 1) {
      return 0;
    }
  }

  unsigned int v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
  BOOL v9 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412802;
    id v12 = [a3 GUID];
    __int16 v13 = 1024;
    unsigned int v14 = [v5 integerValue];
    __int16 v15 = 1024;
    unsigned int v16 = [v6 integerValue];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Message with GUID {%@} has %d manual and %d auto downgrade markers. Shortening downgrade interval.",  (uint8_t *)&v11,  0x18u);
  }

  return v9;
}

- (double)_lowerDowngradeIntervalForMessage:(id)a3
{
  id v5 = (void *)IMGetCachedDomainValueForKey(@"com.apple.imagent", @"DowngradeSeconds");
  if (v5)
  {
    id v6 = [v5 doubleValue];
    double v8 = v7;
    if (IMOSLoggingEnabled(v6))
    {
      BOOL v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v19 = 134218242;
        double v20 = v8;
        __int16 v21 = 2112;
        id v22 = [a3 GUID];
        id v10 = "Using defaults-overridden downgrade interval (%f) for message with GUID {%@}";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v19, 0x16u);
      }
    }
  }

  else
  {
    id v12 = [a3 service];
    if ([v12 isEqualToString:IMServiceNameiMessage])
    {
      if (-[IMDMSASMSRoutingAgent _messageHasDowngradeMarkers:](self, "_messageHasDowngradeMarkers:", a3))
      {
        uint64_t v13 = -[IMDMSASMSRoutingAgent _bagValueForKey:defaultValue:minimumValue:]( self,  "_bagValueForKey:defaultValue:minimumValue:",  @"md-auto-resend-as-sms-timeout-shortened",  25LL,  20LL);
        double v8 = (double)v13;
        if (IMOSLoggingEnabled(v13))
        {
          BOOL v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v19 = 134218242;
            double v20 = v8;
            __int16 v21 = 2112;
            id v22 = [a3 GUID];
            id v10 = "Using short downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }

      else
      {
        uint64_t v18 = -[IMDMSASMSRoutingAgent _bagValueForKey:defaultValue:minimumValue:]( self,  "_bagValueForKey:defaultValue:minimumValue:",  @"md-auto-resend-as-sms-timeout-lower",  300LL,  20LL);
        double v8 = (double)v18;
        if (IMOSLoggingEnabled(v18))
        {
          BOOL v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v19 = 134218242;
            double v20 = v8;
            __int16 v21 = 2112;
            id v22 = [a3 GUID];
            id v10 = "Using long downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
    }

    else
    {
      id v14 = [a3 service];
      id v15 = [v14 isEqualToString:IMServiceNameRCS];
      if ((_DWORD)v15)
      {
        id v16 = objc_msgSend( objc_msgSend( +[IMCTRCSUtilitiesManager sharedManager](IMCTRCSUtilitiesManager, "sharedManager"),  "revokeIntervalForPhoneNumber:simID:",  objc_msgSend(a3, "lastAddressedHandle"),  objc_msgSend(a3, "lastAddressedSIMID")),  "doubleValue");
        double v8 = v17;
        if (IMOSLoggingEnabled(v16))
        {
          BOOL v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v19 = 134218242;
            double v20 = v8;
            __int16 v21 = 2112;
            id v22 = [a3 GUID];
            id v10 = "Using RCS downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }

      else
      {
        double v8 = 300.0;
        if (IMOSLoggingEnabled(v15))
        {
          BOOL v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v19 = 138412546;
            double v20 = COERCE_DOUBLE([a3 service]);
            __int16 v21 = 2112;
            id v22 = [a3 GUID];
            id v10 = "Can't find downgrade interval for unknown service %@ for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)shouldSendMessage:(id)a3
{
  id v5 = [a3 GUID];
  id v6 = objc_msgSend(objc_msgSend(a3, "participants"), "count");
  if (v6 != (id)1)
  {
    int v10 = (int)v6;
    int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 1024;
    LODWORD(v19) = v10;
    id v12 = "Cannot send message (%@) via SMS because it has an incorrect number of recipients (%d)";
    uint64_t v13 = v11;
    uint32_t v14 = 18;
    goto LABEL_10;
  }

  id v7 = objc_msgSend(objc_msgSend(a3, "participants"), "objectAtIndex:", 0);
  id v8 = [v7 _appearsToBePhoneNumber];
  if (IMOSLoggingEnabled(v8))
  {
    id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v7;
      id v12 = "Cannot send message (%@) via SMS because it is not to a phone number: %@";
      uint64_t v13 = v15;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, v14);
    }
  }

  return 0;
}

- (BOOL)canSendMessage:(id)a3
{
  id v5 = [a3 iMessageOnly];
  if ((_DWORD)v5)
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v7 = "Message (%@) cannot be sent via SMS because it uses an iMessage only feature";
    goto LABEL_23;
  }

  id v8 = [a3 isKeyTransparencyVerifiedMessage];
  if ((_DWORD)v8)
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v7 = "Message (%@) cannot be sent via SMS because it is in a verified chat";
    goto LABEL_23;
  }

  id v9 = [a3 isCheckInMessage];
  if ((_DWORD)v9)
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v7 = "Check In Message (%@) cannot be sent via SMS as its not supported";
    goto LABEL_23;
  }

  uint64_t v11 = IMSMSEnabled(v9, v10);
  if ((v11 & 1) != 0)
  {
    unint64_t v12 = (unint64_t)objc_msgSend(objc_msgSend(a3, "attachments"), "count");
    id v13 = +[IMCTSMSUtilities IMMMSEnabledForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSEnabledForPhoneNumber:simID:",  0LL,  0LL);
    if ((v13 & 1) != 0)
    {
      id v14 = +[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSMaximumSlideCountForPhoneNumber:simID:",  0LL,  0LL);
      if (v12 > (int)v14)
      {
        id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = [a3 GUID];
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        id v7 = "Message (%@) cannot be sent via MMS because it has too many attachments (%d)";
        int v16 = v15;
        uint32_t v17 = 18;
        goto LABEL_24;
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v57 = 0LL;
      uint64_t v44 = 0LL;
      v45 = &v44;
      uint64_t v46 = 0x2020000000LL;
      uint64_t v47 = 0LL;
      uint64_t v40 = 0LL;
      v41 = &v40;
      uint64_t v42 = 0x2020000000LL;
      uint64_t v43 = 0LL;
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x2020000000LL;
      char v39 = 1;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000073C8;
      v35[3] = &unk_10000C808;
      v35[4] = self;
      v35[5] = &v36;
      v35[6] = buf;
      v35[7] = &v44;
      v35[8] = &v40;
      id v20 = objc_msgSend(objc_msgSend(a3, "attachments"), "enumerateKeysAndObjectsUsingBlock:", v35);
      if (!*((_BYTE *)v37 + 24)) {
        goto LABEL_48;
      }
      if (v45[3] <= 0)
      {
        if (v41[3] < 1 || v12 <= 1)
        {
LABEL_40:
          id v28 = +[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSMaximumMessageByteCountForPhoneNumber:simID:",  0LL,  0LL);
          float v29 = (double)(int)v28 * 0.95 / 102400.0;
          if (floorf(v29) <= 1.0)
          {
            signed int v31 = 1;
          }

          else
          {
            id v28 = +[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMMMSMaximumMessageByteCountForPhoneNumber:simID:",  0LL,  0LL);
            float v30 = (double)(int)v28 * 0.95 / 102400.0;
            signed int v31 = vcvtms_s32_f32(v30);
          }

          if (*(void *)(*(void *)&buf[8] + 24LL) <= v31)
          {
            BOOL v18 = 1;
            goto LABEL_49;
          }

          if (!IMOSLoggingEnabled(v28)
            || (v32 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices"),
                !os_log_type_enabled(v32, OS_LOG_TYPE_INFO)))
          {
LABEL_48:
            BOOL v18 = 0;
LABEL_49:
            _Block_object_dispose(&v36, 8);
            _Block_object_dispose(&v40, 8);
            _Block_object_dispose(&v44, 8);
            _Block_object_dispose(buf, 8);
            return v18;
          }

          id v33 = [a3 GUID];
          uint64_t v34 = *(void *)(*(void *)&buf[8] + 24LL);
          *(_DWORD *)v48 = 138412802;
          id v49 = v33;
          __int16 v50 = 1024;
          int v51 = v34;
          __int16 v52 = 1024;
          signed int v53 = v31;
          __int128 v25 = "Cannot send message (%@) via MMS because it has too may images (total:%d  max:%d)";
          __int128 v26 = v32;
          uint32_t v27 = 24;
LABEL_47:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v25, v48, v27);
          goto LABEL_48;
        }
      }

      else if (v12 < 2)
      {
        goto LABEL_40;
      }

      __int16 v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_48;
      }
      id v22 = [a3 GUID];
      uint64_t v23 = v41[3];
      uint64_t v24 = v45[3];
      *(_DWORD *)v48 = 138413058;
      id v49 = v22;
      __int16 v50 = 1024;
      int v51 = v23;
      __int16 v52 = 1024;
      signed int v53 = v24;
      __int16 v54 = 1024;
      int v55 = v12;
      __int128 v25 = "Cannot send message (%@) via MMS because it has too may rich attachments (video:%d  audio:%d  total:%d)";
      __int128 v26 = v21;
      uint32_t v27 = 30;
      goto LABEL_47;
    }

    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v7 = "Message (%@) cannot be sent via SMS because it needs MMS which is not enabled";
  }

  else
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServices");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v7 = "Message (%@) cannot be sent via SMS because sms is not enabled";
  }

- (void)getRoutableMessages:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100007574;
  v3[3] = &unk_10000C830;
  v3[4] = self;
  v3[5] = a3;
  -[IMDMSASMSRoutingAgent _getCandidateMessages:](self, "_getCandidateMessages:", v3);
}

@end