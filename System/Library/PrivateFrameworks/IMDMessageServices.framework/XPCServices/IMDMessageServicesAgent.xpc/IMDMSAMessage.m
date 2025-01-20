@interface IMDMSAMessage
- (BOOL)iMessageOnly;
- (BOOL)isCheckInMessage;
- (BOOL)isKeyTransparencyVerifiedMessage;
- (IMDMSAMessage)initWithMessage:(_IMDMessageRecordStruct *)a3 inChat:(_IMDChatRecordStruct *)a4;
- (NSArray)participants;
- (NSDate)date;
- (NSDate)dateDelivered;
- (NSDictionary)attachments;
- (NSDictionary)chatProperties;
- (NSString)GUID;
- (NSString)chatGUID;
- (NSString)lastAddressedHandle;
- (NSString)lastAddressedSIMID;
- (NSString)senderLogin;
- (NSString)service;
- (NSString)subject;
- (double)timeSinceSent;
- (int64_t)itemType;
- (int64_t)rowID;
- (unint64_t)flags;
- (unsigned)error;
- (void)dealloc;
@end

@implementation IMDMSAMessage

- (IMDMSAMessage)initWithMessage:(_IMDMessageRecordStruct *)a3 inChat:(_IMDChatRecordStruct *)a4
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___IMDMSAMessage;
  v6 = -[IMDMSAMessage init](&v40, "init");
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3
    || !a4
    || (uint64_t v38 = 0LL,
        uint64_t v39 = 0LL,
        p_itemType = &v6->_itemType,
        id v36 = 0LL,
        uint64_t v37 = 0LL,
        id v35 = 0LL,
        IMDMessageRecordBulkCopy( a3,  &v6->_itemType,  &v6->_rowID,  0LL,  &v6->_GUID,  &v39,  0LL,  &v38,  0LL,  0LL,  0LL,  &v36,  &v6->_service,  &v6->_senderLogin,  0LL,  0LL,  &v6->_subject,  &v6->_error,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v37,  0LL,  &v35,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,
          0LL,
          0LL,
          0LL,
          0LL,
          0LL,
          0LL),
        *p_itemType))
  {

    return 0LL;
  }

  if (v39 >= 1) {
    v7->_date = (NSDate *) +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v39);
  }
  if (v38 >= 1) {
    v7->_dateDelivered = (NSDate *) +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:",  (double)v38);
  }
  v7->_flags = (unint64_t)[v36 unsignedLongLongValue];
  id v34 = 0LL;
  _IMDChatRecordBulkCopy( a4,  0LL,  0LL,  0LL,  &v34,  0LL,  0LL,  &v7->_chatGUID,  0LL,  0LL,  &v7->_lastAddressedHandle,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v7->_lastAddressedSIMID,  0LL,  0LL,  0LL,  0LL,  0LL);
  v7->_chatProperties = (NSDictionary *)(id)JWDecodeDictionary(v34);

  id v34 = 0LL;
  v10 = (const __CFArray *)IMDChatRecordCopyHandles(a4);
  if (v10)
  {
    v11 = v10;
    CFIndex Count = CFArrayGetCount(v10);
    uint64_t v13 = Count << 32;
    uint64_t v14 = (int)Count;
    v15 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", (int)Count);
    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v14;
      }
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, 0LL);
        v18 = (void *)IMDHandleRecordCopyID(kCFAllocatorDefault, ValueAtIndex);
        -[NSMutableArray addObject:](v15, "addObject:", v18);

        --v16;
      }

      while (v16);
    }

    v7->_participants = (NSArray *)-[NSMutableArray copy](v15, "copy");

    CFRelease(v11);
  }

  uint64_t v19 = IMDMessageRecordCopyAttachments(a3);
  if (v19)
  {
    v20 = (const __CFArray *)v19;
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ((int)CFArrayGetCount(v20) >= 1)
    {
      CFIndex v22 = 0LL;
      do
      {
        v23 = -[IMDMSAAttachment initWithAttachment:]( objc_alloc(&OBJC_CLASS___IMDMSAAttachment),  "initWithAttachment:",  CFArrayGetValueAtIndex(v20, v22));
        if (-[IMDMSAAttachment GUID](v23, "GUID")) {
          -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, -[IMDMSAAttachment GUID](v23, "GUID"));
        }

        ++v22;
      }

      while (v22 < (int)CFArrayGetCount(v20));
    }

    v7->_attachments = (NSDictionary *)-[NSMutableDictionary copy](v21, "copy");

    CFRelease(v20);
  }

  v24 = &v33;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  if ((v7->_flags & 0x200000) != 0 || v37)
  {
    char v33 = 1;
    goto LABEL_28;
  }

  if ([v35 length])
  {
    unsigned __int8 v27 = [v35 isEqualToString:IMBalloonPluginIdentifierRichLinks];
    v28 = v31;
    if ((v27 & 1) == 0)
    {
      *((_BYTE *)v31 + 24) = 1;
      v24 = (char *)(v28 + 3);
      goto LABEL_28;
    }
  }

  else
  {
    v28 = v31;
  }

  v24 = (char *)(v28 + 3);
LABEL_28:
  if (!*v24
    && [v35 isEqualToString:IMBalloonExtensionIDWithSuffix(IMBalloonBundleIdentifierSafetyMonitor)])
  {
    v7->_checkInMessage = 1;
  }

  if (*((_BYTE *)v31 + 24))
  {
    char v25 = 1;
  }

  else
  {
    attachments = v7->_attachments;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100004DC0;
    v29[3] = &unk_10000C730;
    v29[4] = &v30;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](attachments, "enumerateKeysAndObjectsUsingBlock:", v29);
    char v25 = *((_BYTE *)v31 + 24);
  }

  v7->_iMessageOnly = v25;
  v7->_keyTransparencyVerifiedMessage = (v7->_flags & 0x2000000000LL) != 0;

  id v36 = 0LL;
  id v35 = 0LL;
  _Block_object_dispose(&v30, 8);
  return v7;
}

- (double)timeSinceSent
{
  double v4 = v3;
  -[NSDate timeIntervalSince1970](-[IMDMSAMessage date](self, "date"), "timeIntervalSince1970");
  return v4 - v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IMDMSAMessage;
  -[IMDMSAMessage dealloc](&v3, "dealloc");
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)service
{
  return self->_service;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (NSDate)dateDelivered
{
  return self->_dateDelivered;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unsigned)error
{
  return self->_error;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (NSDictionary)chatProperties
{
  return self->_chatProperties;
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (NSString)senderLogin
{
  return self->_senderLogin;
}

- (BOOL)iMessageOnly
{
  return self->_iMessageOnly;
}

- (BOOL)isKeyTransparencyVerifiedMessage
{
  return self->_keyTransparencyVerifiedMessage;
}

- (BOOL)isCheckInMessage
{
  return self->_checkInMessage;
}

@end