@interface SOSMessageKVS
- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageKVSAppendKeyInterest:(id)a3 ak:(__CFArray *)a4 firstUnlock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7;
- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5;
- (SOSMessageKVS)initWithAccount:(id)a3 andName:(id)a4;
- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5;
- (__CFDictionary)pending_changes;
- (__CFString)SOSTransportMessageGetCircleName;
- (int64_t)SOSTransportMessageGetTransportType;
- (int64_t)SOSTransportMessageGetTransportType:(id)a3 err:(__CFError *)a4;
- (void)SOSTransportMessageGetEngine;
- (void)dealloc;
- (void)setPending_changes:(__CFDictionary *)a3;
@end

@implementation SOSMessageKVS

- (SOSMessageKVS)initWithAccount:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SOSMessageKVS;
  v8 = -[SOSMessageKVS init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    -[SOSMessage setAccount:](v8, "setAccount:", v6);
    v10 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", v7);
    -[SOSMessage setCircleName:](v9, "setCircleName:", v10);

    v11 = (uint64_t (**)(id, void *, void))[v6 factory];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](v9, "circleName"));
    if (v11 && (uint64_t v13 = v11[1](v11, v12, 0LL)) != 0)
    {
      v14 = *(const void **)v13;
      (*(void (**)(uint64_t, void))(v13 + 72))(v13, 0LL);

      if (v14) {
        CFRetain(v14);
      }
    }

    else
    {

      v14 = 0LL;
    }

    -[SOSMessage setEngine:](v9, "setEngine:", v14);
    v9->_pending_changes = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v15 = v9;
    v16 = (__CFArray *)sub_1001B4CEC();
    CFArrayAppendValue(v16, v15);
  }

  return v9;
}

- (void)dealloc
{
  pending_changes = self->_pending_changes;
  if (pending_changes)
  {
    self->_pending_changes = 0LL;
    CFRelease(pending_changes);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SOSMessageKVS;
  -[SOSMessage dealloc](&v4, "dealloc");
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 1LL;
}

- (__CFString)SOSTransportMessageGetCircleName
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));

  return v2;
}

- (void)SOSTransportMessageGetEngine
{
  if (!-[SOSMessage engine](self, "engine"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
    objc_super v4 = (uint64_t (**)(id, void *, void))[v3 factory];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));
    if (v4 && (uint64_t v6 = v4[1](v4, v5, 0LL)) != 0)
    {
      id v7 = *(const void **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0LL);

      if (v7) {
        CFRetain(v7);
      }
    }

    else
    {

      id v7 = 0LL;
    }

    -[SOSMessage setEngine:](self, "setEngine:", v7);
  }

  return -[SOSMessage engine](self, "engine");
}

- (BOOL)SOSTransportMessageKVSAppendKeyInterest:(id)a3 ak:(__CFArray *)a4 firstUnlock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  id v10 = a3;
  v11 = -[SOSMessage engine](self, "engine");
  if (v11)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSMessageKVS SOSTransportMessageGetAccount](self, "SOSTransportMessageGetAccount"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 trust]);
    uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo([v13 fullPeerInfo]);
    if (PeerInfo) {
      uint64_t PeerInfo = SOSPeerInfoGetPeerID(PeerInfo);
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10019C11C;
    v25[3] = &unk_100291F58;
    id v26 = v12;
    uint64_t v27 = PeerInfo;
    id v15 = v12;
    v16 = sub_10019BF14(v15, (uint64_t)a7, v25);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 peerID]);

      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472LL;
      context[2] = sub_1001D8F8C;
      context[3] = &unk_100293D80;
      id v22 = v10;
      id v23 = v18;
      v24 = a6;
      id v19 = v18;
      v28.length = CFArrayGetCount(v16);
      v28.location = 0LL;
      CFArrayApplyFunction(v16, v28, (CFArrayApplierFunction)sub_1001D8B5C, context);
      CFRelease(v16);
    }
  }

  return v11 != 0LL;
}

- (int64_t)SOSTransportMessageGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1LL;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v7 = a3;
  v8 = [v7 SOSTransportMessageGetEngine];
  BOOL v10 = -[OTSOSActualAdapter sosEnabled]_0((uint64_t)v8, v9);
  uint64_t v11 = 0LL;
  if (v8 && v10) {
    uint64_t v11 = v8[10];
  }
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1001D8CC8;
  objc_super v18 = &unk_100293DA8;
  id v19 = v7;
  uint64_t v20 = v11;
  id v12 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_1001D89B4, &v15);
  unsigned __int8 v13 = objc_msgSend(v12, "SOSTransportMessageFlushChanges:err:", v12, a5, v15, v16, v17, v18);

  return v13;
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 circleName]);
  Value = (const __CFDictionary *)CFDictionaryGetValue(a4, v8);

  CFMutableArrayRef v10 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Value)
  {
    unsigned __int8 v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    id v15 = sub_1001D8B70;
    uint64_t v16 = &unk_100293DA8;
    id v17 = v6;
    CFMutableArrayRef v18 = v10;
    CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)sub_1001D89B4, &v13);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "circleName", v13, v14, v15, v16));
  CFDictionaryAddValue(Mutable, v11, v10);

  if (v10) {
    CFRelease(v10);
  }

  return Mutable;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_1001D8A78;
  context[3] = &unk_100293DD0;
  uint64_t v11 = &v13;
  id v7 = a3;
  id v10 = v7;
  id v12 = a5;
  CFSetApplyFunction(a4, (CFSetApplierFunction)sub_1001D8B5C, context);
  LOBYTE(a5) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a5;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_1001D8848;
  context[3] = &unk_100293DF8;
  id v7 = a3;
  uint64_t v11 = v13;
  id v12 = a5;
  id v10 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_1001D89B4, context);

  _Block_object_dispose(v13, 8);
  return 1;
}

- (__CFDictionary)pending_changes
{
  return self->_pending_changes;
}

- (void)setPending_changes:(__CFDictionary *)a3
{
  self->_pending_changes = a3;
}

@end