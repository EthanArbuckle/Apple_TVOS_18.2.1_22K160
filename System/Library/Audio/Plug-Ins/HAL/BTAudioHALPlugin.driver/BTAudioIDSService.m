@interface BTAudioIDSService
- (BOOL)compatibleAndConnected;
- (BOOL)compatibleAndNearby;
- (BOOL)deviceIsCompatible:(id)a3;
- (BOOL)isConnected;
- (BOOL)sendArbitrationMsg:(id)a3 forAddress:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)var0 :char_traits<char>;
- (BTAudioIDSService)init;
- (IDSService)mIdsService;
- (NSString)lastUsedIdentifierKey;
- (void)dealloc;
- (void)handleDidTakeOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)handleReconcileOwnershipRemoteOwns:()basic_string<char;
- (void)handleReconcileOwnershipRemoteReleased:()basic_string<char;
- (void)handleRequestOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)handleTakeOwnershipFailed:()basic_string<char;
- (void)handleUnsupportedArbitrationMsg:()basic_string<char;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCompatibleAndConnected:(BOOL)a3;
- (void)setCompatibleAndNearby:(BOOL)a3;
- (void)setLastUsedIdentifierKey:(id)a3;
- (void)setMIdsService:(id)a3;
@end

@implementation BTAudioIDSService

- (BTAudioIDSService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BTAudioIDSService;
  v2 = -[BTAudioIDSService init](&v6, "init");
  if (v2)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_18C10;
    block[3] = &unk_81BE0;
    block[4] = v2;
    dispatch_async(global_queue, block);
  }

  return v2;
}

- (void)dealloc
{
  self->_lastUsedIdentifierKey = 0LL;
  self->_mIdsService = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioIDSService;
  -[BTAudioIDSService dealloc](&v3, "dealloc");
}

- (BOOL)isConnected
{
  BOOL v3 = -[BTAudioIDSService compatibleAndNearby](self, "compatibleAndNearby");
  if (v3) {
    LOBYTE(v3) = -[BTAudioIDSService compatibleAndConnected](self, "compatibleAndConnected");
  }
  return v3;
}

- (BOOL)deviceIsCompatible:(id)a3
{
  return (unint64_t)[a3 serviceMinCompatibilityVersion] > 2;
}

- (BOOL)sendArbitrationMsg:(id)a3 forAddress:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)var0 :char_traits<char>
{
  v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  memset(&v48, 0, sizeof(v48));
  sub_A248(&v48, "");
  v10 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (NSDictionary *)objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    unsigned int v12 = -[BTAudioIDSService isConnected](self, "isConnected");
    BOOL compatibleAndConnected = self->compatibleAndConnected;
    BOOL compatibleAndNearby = self->compatibleAndNearby;
    v15 = &v48;
    if ((v48.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v15 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136447234;
    v54 = v11;
    __int16 v55 = 1024;
    *(_DWORD *)v56 = v12;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = compatibleAndConnected;
    __int16 v57 = 1024;
    BOOL v58 = compatibleAndNearby;
    __int16 v59 = 2080;
    v60 = v15;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "sendArbitrationMsg arbitrationKey: %{public}s, isConnected: %d, connected: %d, nearby: %d, responseId: %s",  buf,  0x28u);
  }

  if (![a3 isEqualToString:@"RequestOwnership"]
    || -[BTAudioIDSService isConnected](self, "isConnected"))
  {
    if ([a3 isEqualToString:@"RequestOwnership"]
      && -[BTAudioIDSService isConnected](self, "isConnected"))
    {
      uint64_t v16 = qword_962E8;
      if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
      {
        sub_A134(__dst, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
      }

      else
      {
        *(_OWORD *)__dst = *(_OWORD *)var0->var0.var0.var0.var0.var0;
        uint64_t v45 = *((void *)&var0->var0.var0.var0.var1 + 2);
      }

      int v19 = sub_3B68C(v16, (uint64_t)__dst);
      char v20 = v19;
      if (SHIBYTE(v45) < 0)
      {
        operator delete(__dst[0]);
        if ((v20 & 1) != 0) {
          goto LABEL_25;
        }
      }

      else if (v19)
      {
LABEL_25:
        v21 = (os_log_s *)qword_95A30;
        if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "Remote device is idle, handling successful ownership immediately and sending ownership msg with max timeout",  buf,  2u);
        }

        if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
        {
          sub_A134(v42, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
        }

        else
        {
          *(_OWORD *)v42 = *(_OWORD *)var0->var0.var0.var0.var0.var0;
          uint64_t v43 = *((void *)&var0->var0.var0.var0.var1 + 2);
        }

        -[BTAudioIDSService handleDidTakeOwnership:withResponseIdentifier:]( self,  "handleDidTakeOwnership:withResponseIdentifier:",  v42,  0LL);
        if (SHIBYTE(v43) < 0) {
          operator delete(v42[0]);
        }
        int v22 = 2;
LABEL_31:
        v50 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", var0);
        id v51 = a3;
        v49 = @"kOwnershipDeviceAddr";
        v52 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL);
        v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL);
        v24 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice);
        id v41 = 0LL;
        id v25 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        LODWORD(v26) = 8.0;
        v27 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v26);
        [v25 setValue:v27 forKey:IDSSendMessageOptionTimeoutKey];
        [v25 setValue:&__kCFBooleanTrue forKey:IDSSendMessageOptionFireAndForgetKey];
        [v25 setValue:&__kCFBooleanTrue forKey:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
        v28 = -[BTAudioIDSService lastUsedIdentifierKey](self, "lastUsedIdentifierKey");
        [v25 setValue:v28 forKey:IDSSendMessageOptionQueueOneIdentifierKey];
        else {
          [v25 setValue:v5 forKey:IDSSendMessageOptionPeerResponseIdentifierKey];
        }
        uint64_t v40 = 0LL;
        unsigned int v18 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:]( self->_mIdsService,  "sendMessage:toDestinations:priority:options:identifier:error:",  v23,  v24,  300LL,  v25,  &v40,  &v41);
        -[BTAudioIDSService setLastUsedIdentifierKey:](self, "setLastUsedIdentifierKey:", v40);
        uint64_t v29 = qword_95A30;
        BOOL v30 = os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (!v30) {
            goto LABEL_42;
          }
          v31 = -[BTAudioIDSService lastUsedIdentifierKey](self, "lastUsedIdentifierKey");
          *(_DWORD *)buf = 138543618;
          v54 = v23;
          __int16 v55 = 2114;
          *(void *)v56 = v31;
          v32 = "Successfully sent msg %{public}@ with identifier %{public}@";
          v33 = (os_log_s *)v29;
          uint32_t v34 = 22;
        }

        else
        {
          if (!v30) {
            goto LABEL_42;
          }
          v35 = (NSDictionary *)objc_msgSend(objc_msgSend(v41, "description"), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v54 = v35;
          v32 = "Msg send failed with error %{public}s";
          v33 = (os_log_s *)v29;
          uint32_t v34 = 12;
        }

        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
LABEL_42:
        if ([a3 isEqualToString:@"RequestOwnership"])
        {
          int v36 = 1;
        }

        else if ([a3 isEqualToString:@"DidTakeOwnership"])
        {
          int v36 = 2;
        }

        else if ([a3 isEqualToString:@"ReconcileOwnershipRemoteOwns"])
        {
          int v36 = 4;
        }

        else if ([a3 isEqualToString:@"ReconcileOwnershipRemoteReleased"])
        {
          int v36 = 5;
        }

        else
        {
          int v36 = 0;
        }

        uint64_t v37 = *(void *)(qword_962E8 + 328);
        else {
          std::string v39 = v48;
        }
        sub_1B3A8(v37, 2, 0, v36, (int)Current, (uint64_t *)&v39, v22);
        goto LABEL_56;
      }
    }

    int v22 = 3;
    goto LABEL_31;
  }

  v17 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "We're not connected to a nearby device, returning success immediately",  buf,  2u);
  }

  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, var0->var0.var0.var0.var1.var0, var0->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)var0->var0.var0.var0.var0.var0;
    uint64_t v47 = *((void *)&var0->var0.var0.var0.var1 + 2);
  }

  -[BTAudioIDSService handleDidTakeOwnership:withResponseIdentifier:]( self,  "handleDidTakeOwnership:withResponseIdentifier:",  __p,  0LL);
  if (SHIBYTE(v47) < 0) {
    operator delete(__p[0]);
  }
  LOBYTE(v18) = 1;
LABEL_56:
  return v18;
}

- (void)handleRequestOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v4 = v3;
  objc_super v6 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    *(_DWORD *)buf = 136446210;
    unsigned int v12 = var0;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Got ownership request for device %{public}s, relinquishing from this side",  buf,  0xCu);
  }

  sub_527C8(13LL);
  v8 = (void *)qword_962E8;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v10 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }

  sub_3BA0C(v8, (uint64_t)__p, 0LL, 1, v4);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleDidTakeOwnership:()basic_string<char withResponseIdentifier:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v4 = v3;
  objc_super v6 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Ownership request was successful, reporting property change",  buf,  2u);
  }

  sub_527C8(14LL);
  v7 = (void *)qword_962E8;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v9 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }

  sub_3BA0C(v7, (uint64_t)__p, 1LL, 0, v4);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleTakeOwnershipFailed:()basic_string<char
{
  v4 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Ownership request failed, reporting property change", buf, 2u);
  }

  uint64_t v5 = qword_962E8;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v7 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }

  sub_3C090(v5, (uint64_t)__p);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleReconcileOwnershipRemoteOwns:()basic_string<char
{
  v4 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = var0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Reconciling ownership, remote side owns device %{public}s because it is streaming, releasing from this side",  buf,  0xCu);
  }

  objc_super v6 = (void *)qword_962E8;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v8 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }

  sub_3BA0C(v6, (uint64_t)__p, 0LL, 0, 0LL);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleReconcileOwnershipRemoteReleased:()basic_string<char
{
  v4 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = var0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Reconciling ownership, remote side has released ownership of device %{public}s, locally take ownership.",  buf,  0xCu);
  }

  objc_super v6 = (void *)qword_962E8;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    sub_A134(__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a3->var0.var0.var0.var0.var0;
    uint64_t v8 = *((void *)&a3->var0.var0.var0.var1 + 2);
  }

  sub_3BA0C(v6, (uint64_t)__p, 1LL, 0, 0LL);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleUnsupportedArbitrationMsg:()basic_string<char
{
  v4 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    objc_super v6 = var0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Device %{public}s does not support previously sent arbitration message",  (uint8_t *)&v5,  0xCu);
  }

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  v11 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = objc_msgSend(objc_msgSend(a6, "description"), "UTF8String");
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Received IDS message %{public}s from %{public}s", buf, 0x16u);
  }

  id v12 = objc_msgSend(objc_msgSend(a5, "allKeys"), "objectAtIndex:", 0);
  if (v12)
  {
    id v13 = [a5 valueForKey:v12];
    if (v13)
    {
      memset(buf, 0, sizeof(buf));
      sub_A248( buf,  (char *)objc_msgSend(objc_msgSend(v13, "valueForKey:", @"kOwnershipDeviceAddr"), "UTF8String"));
      if ([v12 isEqualToString:@"RequestOwnership"])
      {
        id v14 = [a7 outgoingResponseIdentifier];
        if ((char)buf[23] < 0)
        {
          sub_A134(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 __dst = *(_OWORD *)buf;
          uint64_t v33 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleRequestOwnership:withResponseIdentifier:]( self,  "handleRequestOwnership:withResponseIdentifier:",  &__dst,  v14);
        if ((SHIBYTE(v33) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&__dst;
      }

      else if ([v12 isEqualToString:@"DidTakeOwnership"])
      {
        id v17 = [a7 incomingResponseIdentifier];
        if ((char)buf[23] < 0)
        {
          sub_A134(&v30, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v30 = *(_OWORD *)buf;
          uint64_t v31 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleDidTakeOwnership:withResponseIdentifier:]( self,  "handleDidTakeOwnership:withResponseIdentifier:",  &v30,  v17);
        if ((SHIBYTE(v31) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v30;
      }

      else if ([v12 isEqualToString:@"TakeOwnershipFailed"])
      {
        if ((char)buf[23] < 0)
        {
          sub_A134(&v28, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v28 = *(_OWORD *)buf;
          uint64_t v29 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleTakeOwnershipFailed:](self, "handleTakeOwnershipFailed:", &v28);
        if ((SHIBYTE(v29) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v28;
      }

      else if ([v12 isEqualToString:@"ReconcileOwnershipRemoteOwns"])
      {
        if ((char)buf[23] < 0)
        {
          sub_A134(&v26, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v26 = *(_OWORD *)buf;
          uint64_t v27 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleReconcileOwnershipRemoteOwns:](self, "handleReconcileOwnershipRemoteOwns:", &v26);
        if ((SHIBYTE(v27) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v26;
      }

      else if ([v12 isEqualToString:@"ReconcileOwnershipRemoteReleased"])
      {
        if ((char)buf[23] < 0)
        {
          sub_A134(&v24, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v24 = *(_OWORD *)buf;
          uint64_t v25 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleReconcileOwnershipRemoteReleased:]( self,  "handleReconcileOwnershipRemoteReleased:",  &v24);
        if ((SHIBYTE(v25) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v24;
      }

      else if ([v12 isEqualToString:@"UnsupportedArbitrationMsg"])
      {
        if ((char)buf[23] < 0)
        {
          sub_A134(&v22, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v22 = *(_OWORD *)buf;
          uint64_t v23 = *(void *)&buf[16];
        }

        -[BTAudioIDSService handleUnsupportedArbitrationMsg:](self, "handleUnsupportedArbitrationMsg:", &v22);
        if ((SHIBYTE(v23) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v22;
      }

      else
      {
        int v19 = (os_log_s *)qword_95A30;
        if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_ERROR)) {
          sub_5A808((uint64_t)objc_msgSend(objc_msgSend(a5, "description"), "UTF8String"), (uint64_t)v34, v19);
        }
        if ((char)buf[23] < 0)
        {
          sub_A134(&v20, *(void **)buf, *(unint64_t *)&buf[8]);
        }

        else
        {
          __int128 v20 = *(_OWORD *)buf;
          uint64_t v21 = *(void *)&buf[16];
        }

        -[BTAudioIDSService sendArbitrationMsg:forAddress:withResponseIdentifier:]( self,  "sendArbitrationMsg:forAddress:withResponseIdentifier:",  @"UnsupportedArbitrationMsg",  &v20,  0LL);
        if ((SHIBYTE(v21) & 0x80000000) == 0) {
          goto LABEL_53;
        }
        p_dst = (void **)&v20;
      }

      operator delete(*p_dst);
LABEL_53:
      return;
    }

    uint64_t v16 = (os_log_s *)qword_95A30;
    if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_ERROR)) {
      sub_5A788(v12, v16);
    }
  }

  else
  {
    v15 = (os_log_s *)qword_95A30;
    if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_ERROR)) {
      sub_5A708(a5, v15);
    }
  }

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  v4 = &byte_8D8DA[30502];
  int v5 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [a4 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Nearby devices changed to %lu", buf, 0xCu);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v6)
  {
    id v8 = v6;
    int v9 = 0;
    uint64_t v10 = *(void *)v27;
    *(void *)&__int128 v7 = 136316674LL;
    __int128 v20 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v13 = (os_log_s *)*((void *)v4 + 326);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = objc_msgSend(objc_msgSend(v12, "productName"), "UTF8String");
          id v23 = [v12 productBuildVersion];
          id v22 = objc_msgSend(objc_msgSend(v12, "service"), "UTF8String");
          id v14 = "true";
          else {
            v15 = "false";
          }
          uint64_t v16 = v4;
          id v17 = [v12 serviceMinCompatibilityVersion];
          unsigned int v18 = -[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12);
          *(_DWORD *)buf = v20;
          int v19 = "will not";
          if (v18) {
            int v19 = "will";
          }
          id v31 = v24;
          __int16 v32 = 2112;
          id v33 = v23;
          __int16 v34 = 2080;
          id v35 = v22;
          __int16 v36 = 2080;
          uint64_t v37 = v15;
          __int16 v38 = 2080;
          std::string v39 = v14;
          __int16 v40 = 2048;
          id v41 = v17;
          v4 = v16;
          __int16 v42 = 2080;
          uint64_t v43 = v19;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Device %s %@ is registered on service %s. Nearby: %s Connected: %s. ServiceMincompatibilityVersion: %lu. Dev ice %s arbitrate",  buf,  0x48u);
        }

        if (-[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12, v20)) {
          v9 += [v12 isNearby];
        }
      }

      id v8 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
    }

    while (v8);
  }

  else
  {
    int v9 = 0;
  }

  -[BTAudioIDSService setCompatibleAndNearby:](self, "setCompatibleAndNearby:", v9 > 0);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  v4 = &byte_8D8DA[30502];
  int v5 = (os_log_s *)qword_95A30;
  if (os_log_type_enabled((os_log_t)qword_95A30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [a4 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Connected devices changed to %lu", buf, 0xCu);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v6)
  {
    id v8 = v6;
    int v9 = 0;
    uint64_t v10 = *(void *)v27;
    *(void *)&__int128 v7 = 136316674LL;
    __int128 v20 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v13 = (os_log_s *)*((void *)v4 + 326);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = objc_msgSend(objc_msgSend(v12, "productName"), "UTF8String");
          id v23 = [v12 productBuildVersion];
          id v22 = objc_msgSend(objc_msgSend(v12, "service"), "UTF8String");
          id v14 = "true";
          else {
            v15 = "false";
          }
          uint64_t v16 = v4;
          id v17 = [v12 serviceMinCompatibilityVersion];
          unsigned int v18 = -[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12);
          *(_DWORD *)buf = v20;
          int v19 = "will not";
          if (v18) {
            int v19 = "will";
          }
          id v31 = v24;
          __int16 v32 = 2112;
          id v33 = v23;
          __int16 v34 = 2080;
          id v35 = v22;
          __int16 v36 = 2080;
          uint64_t v37 = v15;
          __int16 v38 = 2080;
          std::string v39 = v14;
          __int16 v40 = 2048;
          id v41 = v17;
          v4 = v16;
          __int16 v42 = 2080;
          uint64_t v43 = v19;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Device %s %@ is registered on service %s. Nearby: %s Connected: %s. ServiceMincompatibilityVersion: %lu. Dev ice %s arbitrate",  buf,  0x48u);
        }

        if (-[BTAudioIDSService deviceIsCompatible:](self, "deviceIsCompatible:", v12, v20)) {
          v9 += [v12 isConnected];
        }
      }

      id v8 = [a4 countByEnumeratingWithState:&v26 objects:v44 count:16];
    }

    while (v8);
  }

  else
  {
    int v9 = 0;
  }

  -[BTAudioIDSService setCompatibleAndConnected:](self, "setCompatibleAndConnected:", v9 > 0);
}

- (BOOL)compatibleAndConnected
{
  return self->compatibleAndConnected;
}

- (void)setCompatibleAndConnected:(BOOL)a3
{
  self->BOOL compatibleAndConnected = a3;
}

- (BOOL)compatibleAndNearby
{
  return self->compatibleAndNearby;
}

- (void)setCompatibleAndNearby:(BOOL)a3
{
  self->BOOL compatibleAndNearby = a3;
}

- (IDSService)mIdsService
{
  return self->_mIdsService;
}

- (void)setMIdsService:(id)a3
{
}

- (NSString)lastUsedIdentifierKey
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLastUsedIdentifierKey:(id)a3
{
}

@end