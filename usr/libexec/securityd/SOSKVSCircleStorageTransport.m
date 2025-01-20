@interface SOSKVSCircleStorageTransport
- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4;
- (BOOL)flushChanges:(__CFError *)a3;
- (BOOL)kvsAppendDebugKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsAppendKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsAppendRingKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsRingFlushChanges:(__CFError *)a3;
- (BOOL)kvsRingPostRing:(__CFString *)a3 ring:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)kvsSendOfficialDSID:(__CFString *)a3 err:(__CFError *)a4;
- (BOOL)kvsSendPendingChanges:(__CFError *)a3;
- (BOOL)kvssendDebugInfo:(__CFString *)a3 debug:(void *)a4 err:(__CFError *)a5;
- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5;
- (NSMutableDictionary)pending_changes;
- (NSString)circleName;
- (SOSKVSCircleStorageTransport)init;
- (SOSKVSCircleStorageTransport)initWithAccount:(id)a3 andCircleName:(id)a4;
- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4;
- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4;
- (int64_t)getTransportType;
- (void)kvsAddToPendingChanges:(__CFString *)a3 data:(__CFData *)a4;
- (void)setCircleName:(id)a3;
- (void)setPending_changes:(id)a3;
@end

@implementation SOSKVSCircleStorageTransport

- (SOSKVSCircleStorageTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SOSKVSCircleStorageTransport;
  return -[SOSCircleStorageTransport init](&v3, "init");
}

- (SOSKVSCircleStorageTransport)initWithAccount:(id)a3 andCircleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SOSKVSCircleStorageTransport;
  v8 = -[SOSCircleStorageTransport init](&v12, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SOSKVSCircleStorageTransport setPending_changes:](v8, "setPending_changes:", v9);

    v10 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", v7);
    -[SOSKVSCircleStorageTransport setCircleName:](v8, "setCircleName:", v10);

    -[SOSCircleStorageTransport setAccount:](v8, "setAccount:", v6);
    sub_1001B4F9C(v8);
  }

  return v8;
}

- (int64_t)getTransportType
{
  return 1LL;
}

- (BOOL)kvsSendPendingChanges:(__CFError *)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes", a3));
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
    id v7 = [v6 count];

    if (v7)
    {
      v8 = sub_100190528(self->super.account);
      if (v8) {
        CFNullRef v9 = (CFNullRef)v8;
      }
      else {
        CFNullRef v9 = kCFNull;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      [v10 setObject:v9 forKey:kSOSKVSRequiredKey];

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      sub_1001BBD68((uint64_t)v11);

      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
      [v12 removeAllObjects];
    }
  }

  return 1;
}

- (void)kvsAddToPendingChanges:(__CFString *)a3 data:(__CFData *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[SOSKVSCircleStorageTransport setPending_changes:](self, "setPending_changes:", v8);
  }

  CFNullRef v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport pending_changes](self, "pending_changes"));
  id v11 = v9;
  if (a4)
  {
    [v9 setObject:a4 forKey:a3];
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v11 setObject:v10 forKey:a3];
  }
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_1001BC4BC;
  context[3] = &unk_100293110;
  context[4] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_1001BC4A4, context);
  if (CFDictionaryGetCount(Mutable)) {
    sub_1001BBD68((uint64_t)Mutable);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return -[SOSKVSCircleStorageTransport kvsSendPendingChanges:](self, "kvsSendPendingChanges:", a3);
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7 = SOSCircleKeyCreateWithName(a3, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v7, a4);
    CFRelease(v8);
  }

  return 1;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
  Name = (const void *)SOSCircleGetName([v7 trustedCircle]);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if ([v7 trustedCircle]
    && (Value = (const __CFDictionary *)CFDictionaryGetValue(a3, Name)) != 0LL
    && (v18 = Value, CFTypeID v19 = CFGetTypeID(Value), v19 == CFDictionaryGetTypeID()))
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_1001A1580;
    context[3] = &unk_100292208;
    v40 = a4;
    id v20 = v7;
    id v38 = v20;
    id v21 = v6;
    id v39 = v21;
    v41 = Mutable;
    CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_1001A0E04, context);
    id v22 = [v21 peerInfo];
    if (v22)
    {
      id v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v20 retirees]);
      LODWORD(v23) = [v24 containsObject:v23];

      if ((_DWORD)v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v21 trust]);
        [v25 purgeIdentity];

        [v20 setDepartureCode:6];
      }
    }

    if (CFArrayGetCount(Mutable)) {
      CFDictionaryRef v33 = sub_100107FA8(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, (uint64_t)Name, (uint64_t)Mutable);
    }
    else {
      CFDictionaryRef v33 = sub_100107FA8(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, 0LL, v36);
    }
    v34 = v33;
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    v34 = sub_100107FA8(kCFAllocatorDefault, v10, v11, v12, v13, v14, v15, v16, 0LL, v36);
  }

  return v34;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001BBF04;
  v8[3] = &unk_100293DA8;
  v8[4] = self;
  v8[5] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_1001BC4A4, v8);
  return Mutable;
}

- (BOOL)kvsAppendKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account", a3, a4));
  id v11 = sub_100199E38(v10, 0LL);

  if (!v11) {
    goto LABEL_9;
  }
  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport circleName](self, "circleName"));

  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = SOSCircleKeyCreateWithName(v12, a6);
  if (v13)
  {
    int v14 = (const void *)v13;
    account = self->super.account;
    if (account)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](account, "trust"));
      id v17 = [v16 trustedCircle];
      if (v17)
      {
        id v18 = v17;
        Name = (const void *)SOSCircleGetName(v17);
        if (Name)
        {
          if (CFEqual(v12, Name))
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_1001BBEAC;
            v21[3] = &unk_100292FD0;
            v21[4] = v12;
            v21[5] = a3;
            SOSCircleForEachActivePeer(v18, v21);
            CFArrayAppendValue(a5, v14);
            CFRelease(v14);

LABEL_9:
            LOBYTE(v13) = 1;
            return v13;
          }
        }
      }
    }

    CFRelease(v14);
LABEL_12:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)kvsAppendRingKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSCircleStorageTransport account](self, "account", a3, a4, a5, a6));
  id v9 = sub_100199E38(v8, 0LL);

  if (!v9)
  {
LABEL_9:
    LOBYTE(account) = 1;
    return (char)account;
  }

  account = self->super.account;
  if (account)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](account, "trust"));
    if ([v11 trustedCircle])
    {
      int v12 = self->super.account;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      id v18 = sub_1001BBE64;
      CFTypeID v19 = &unk_1002931B8;
      id v20 = a5;
      uint64_t v13 = v17;
      if (-[SOSAccount peerInfo](v12, "peerInfo"))
      {
        int v14 = (const __CFSet *)SOSViewCopyViewSet(0LL);
        context[0] = _NSConcreteStackBlock;
        context[1] = 3221225472LL;
        context[2] = sub_100195358;
        context[3] = &unk_100291E68;
        int v15 = v13;
        id v22 = v15;
        CFSetApplyFunction(v14, (CFSetApplierFunction)sub_100195344, context);
        if (v14) {
          CFRelease(v14);
        }
        v18((uint64_t)v15, (uint64_t)@"RecoveryRing");
      }

      goto LABEL_9;
    }

    LOBYTE(account) = 0;
  }

  return (char)account;
}

- (BOOL)kvsAppendDebugKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  uint64_t v7 = (const void *)SOSDebugInfoKeyCreateWithTypeName(@"Scope", a2, a3, a4, a5, a6);
  CFArrayAppendValue(a3, v7);
  if (v7) {
    CFRelease(v7);
  }
  return 1;
}

- (BOOL)kvssendDebugInfo:(__CFString *)a3 debug:(void *)a4 err:(__CFError *)a5
{
  id v6 = (const void *)SOSDebugInfoKeyCreateWithTypeName(a3, a2, a3, a4, a5);
  id v9 = v6;
  int v10 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  if (v6) {
    CFRelease(v6);
  }
  sub_1001BBD68((uint64_t)v7);

  return 1;
}

- (BOOL)kvsRingPostRing:(__CFString *)a3 ring:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7 = SOSRingKeyCreateWithName(a3, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v7, a4);
    CFRelease(v8);
  }

  return 1;
}

- (BOOL)kvsRingFlushChanges:(__CFError *)a3
{
  return -[SOSKVSCircleStorageTransport kvsSendPendingChanges:](self, "kvsSendPendingChanges:", a3);
}

- (BOOL)kvsSendOfficialDSID:(__CFString *)a3 err:(__CFError *)a4
{
  if (a3)
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a3, 0x8000100u, 0x3Fu);
    -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:]( self,  "kvsAddToPendingChanges:data:",  kSOSKVSOfficialDSIDKey,  ExternalRepresentation);
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
  }

  return 1;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  uint64_t v7 = SOSPeerInfoCopyEncodedData(a4, kCFAllocatorDefault, a5);
  if (v7)
  {
    v8 = (const void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSKVSCircleStorageTransport circleName](self, "circleName"));
    SOSPeerInfoGetPeerID(a4);
    int v10 = (const void *)SOSRetirementKeyCreateWithCircleNameAndPeer(v9);

    if (v10)
    {
      -[SOSKVSCircleStorageTransport kvsAddToPendingChanges:data:](self, "kvsAddToPendingChanges:data:", v10, v8);
      CFRelease(v10);
    }

    CFRelease(v8);
  }

  return 1;
}

- (NSMutableDictionary)pending_changes
{
  return self->pending_changes;
}

- (void)setPending_changes:(id)a3
{
}

- (NSString)circleName
{
  return self->circleName;
}

- (void)setCircleName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end