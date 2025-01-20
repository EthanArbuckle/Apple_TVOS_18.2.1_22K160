@interface NRLinkWired
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)hasScheduledSendingLocalClassCUnlock;
- (BOOL)initiateConnection;
- (BOOL)isIKEResponder;
- (BOOL)onlyAllowClassC;
- (BOOL)remoteClassCUnlocked;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)sentLocalClassCUnlockNotify;
- (BOOL)start;
- (BOOL)suspend;
- (NEIKEv2Listener)ikeListener;
- (NEIKEv2Session)ikeSessionClassC;
- (NEIKEv2Session)ikeSessionClassD;
- (NRPairingClient)pairingClient;
- (NSString)listenerPortString;
- (NSUUID)randomUUID;
- (OS_nw_path_evaluator)pathEvaluator;
- (id)copyDescriptionInner;
- (id)copyNotifyPayloadsToSendWithProxy:(BOOL)a3;
- (id)copyStatusString;
- (id)ikeSessionPointerForDataProtectionClass:(unsigned __int8)a3;
- (id)respondToIKESession:(id)a3 dataProtectionClass:(unsigned __int8)a4 validateAuthBlock:(id)a5;
- (unsigned)metric;
- (unsigned)setupIPsecRetryCounter;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)handleNotifyCode:(unsigned __int16)a3 payload:(id)a4;
- (void)initiatePairing;
- (void)invalidateIKESessionClassC;
- (void)invalidateIKESessionClassD;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)restartIKESessionForDataProtectionClass:(unsigned __int8)a3;
- (void)retrySetupIPsec:(unsigned __int8)a3;
- (void)sendClassCUnlockedNotify;
- (void)setHasScheduledSendingLocalClassCUnlock:(BOOL)a3;
- (void)setIkeListener:(id)a3;
- (void)setIkeSessionClassC:(id)a3;
- (void)setIkeSessionClassD:(id)a3;
- (void)setIsIKEResponder:(BOOL)a3;
- (void)setListenerPortString:(id)a3;
- (void)setOnlyAllowClassC:(BOOL)a3;
- (void)setPairingClient:(id)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setRandomUUID:(id)a3;
- (void)setRemoteClassCUnlocked:(BOOL)a3;
- (void)setSentLocalClassCUnlockNotify:(BOOL)a3;
- (void)setSetupIPsecRetryCounter:(unsigned int)a3;
- (void)setupIKECallbacks:(unsigned __int8)a3;
- (void)setupIPsecIfNecessary:(unsigned __int8)a3;
- (void)upgradeSessionsIfNeeded;
@end

@implementation NRLinkWired

- (id)copyStatusString
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = -[NSMutableString initWithString:](v3, "initWithString:", v4);

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "nrUUID", self->super._nrUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "localInterfaceName", v6);

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "listenerPortString",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassD",  *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassC",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "virtualInterfaceName", v8);
  }

  return v5;
}

- (void)invalidateLink
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NRLinkWired;
  -[NRLink invalidateLink](&v14, "invalidateLink");
  -[NRLinkWired invalidateIKESessionClassD](self, "invalidateIKESessionClassD");
  -[NRLinkWired invalidateIKESessionClassC](self, "invalidateIKESessionClassC");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeListener](self, "ikeListener"));

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeListener](self, "ikeListener"));
    [v5 cancel];

    -[NRLinkWired setIkeListener:](self, "setIkeListener:", 0LL);
  }

  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DE28((uint64_t)companionProxyAgent, v4);
    -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
    v7 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pairingClient](self, "pairingClient"));

  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NRLinkWired pairingClient](self, "pairingClient"));
    v10 = (void *)v9;
    if (v9)
    {
      sub_100005DB0(v9);
      sub_100005794((uint64_t)v10, 6, 0);
    }

    -[NRLinkWired setPairingClient:](self, "setPairingClient:", 0LL);
  }

  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pathEvaluator](self, "pathEvaluator"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pathEvaluator](self, "pathEvaluator"));
    nw_path_evaluator_cancel(v12, v13);

    -[NRLinkWired setPathEvaluator:](self, "setPathEvaluator:", 0LL);
  }

- (id)copyDescriptionInner
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRLinkWired;
  id v4 = -[NRLink copyDescriptionInner](&v9, "copyDescriptionInner");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@, %@ -> %@", v4, v5, v6);

  return v7;
}

- (unsigned)metric
{
  return 40;
}

- (BOOL)start
{
  if (-[NRLink state](self, "state") == 8)
  {
    v3 = (char *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v3 linkIsReady:self];
LABEL_3:

    return 1;
  }

  if (-[NRLink startRequested](self, "startRequested")) {
    return 1;
  }
  -[NRLink setStartRequested:](self, "setStartRequested:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));

  if (!v5)
  {
    v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v16, 17LL);

    if (!IsLevelEnabled) {
      return 0;
    }
    uint64_t v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
    id v19 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 17LL, "%@: Cannot start Wi-Fi link without local interface name", v19);

    goto LABEL_15;
  }

  if (-[NRLink state](self, "state") != 1)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    int v11 = _NRLogIsLevelEnabled(v10, 17LL);

    if (!v11) {
      return 0;
    }
    uint64_t v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    id v14 = -[NRLink copyDescription](self, "copyDescription");
    v15 = sub_1001080C0(-[NRLink state](self, "state"));
    _NRLogWithArgs(v13, 17LL, "%@: Cannot start link in state %@", v14, v15);

LABEL_15:
    return 0;
  }

  -[NRLink reportEvent:](self, "reportEvent:", 3001LL);
  -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isIKEResponder);
  if (-[NRLinkWired isIKEResponder](self, "isIKEResponder")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint")),
        v8,
        v8))
  {
    objc_super v9 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
    v3 = v9;
    if (v9 && v9[12]) {
      -[NRLinkWired initiateConnection](self, "initiateConnection");
    }
    else {
      -[NRLinkWired initiatePairing](self, "initiatePairing");
    }
    goto LABEL_3;
  }

  -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", @"No remote outer endpoint present");
  return 0;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v4,  &v16);
    -[NRLink reportEvent:details:](self, "reportEvent:details:", 3005LL, v5);
    if (-[NRLink changeStateTo:](self, "changeStateTo:", 255LL))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v7 linkIsUnavailable:self];

      -[NRLinkWired invalidateLink](self, "invalidateLink");
    }

    else
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1LL);

      if (IsLevelEnabled)
      {
        int v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
        id v12 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v11,  1LL,  "%s%.30s:%-4d %@: link already cancelled: %@",  ",  "-[NRLinkWired cancelWithReason:]"",  191LL,  v12,  self);
      }
    }
  }

  else
  {
    id v14 = sub_1000C449C();
    int v15 = _NRLogIsLevelEnabled(v14, 17LL);

    if (!v15) {
      goto LABEL_7;
    }
    v5 = (NSString *)sub_1000C449C();
    _NRLogWithArgs(v5, 17LL, "%s called with null reasonFormat", "-[NRLinkWired cancelWithReason:]");
  }

LABEL_7:
  return v4 != 0LL;
}

- (void)initiatePairing
{
  v3 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
  id v4 = objc_alloc_init(&OBJC_CLASS___NRPairingParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  if (v4) {
    objc_storeStrong((id *)&v4->_localInterfaceName, v5);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  if (v4) {
    objc_storeStrong((id *)&v4->_localEndpoint, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v8 = v7;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_remoteEndpoint, v7);

    v4->_isResponder = self->_isIKEResponder;
  }

  else
  {
  }

  objc_initWeak(&location, self);
  objc_super v9 = sub_10000AE08( (id *)objc_alloc(&OBJC_CLASS___NRPairingClient),  self->super._queue,  self->super._nrUUID,  (__objc2_meth_list **)v4);
  objc_initWeak(&from, v9);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000C553C;
  v20[3] = &unk_1001AF2B0;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  uint64_t v10 = v20;
  int v11 = v10;
  if (v9 && !*((_BYTE *)v9 + 10))
  {
    id v12 = objc_retainBlock(v10);
    id v13 = v9[18];
    v9[18] = v12;
  }

  sub_10000B180((uint64_t)v9);
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), v9);
  int v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
  char IsLevelEnabled = _NRLogIsLevelEnabled(v15, 0LL);

  if ((IsLevelEnabled & 1) != 0)
  {
    uint64_t v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    id v19 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v18,  0LL,  "%s%.30s:%-4d %@: initiated pairing with %@",  ",  "-[NRLinkWired initiatePairing]"",  243LL,  v19,  v3);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (BOOL)initiateConnection
{
  v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    uint64_t v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    id v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v6,  0LL,  "%s%.30s:%-4d %@: initiating connection with peer",  ",  "-[NRLinkWired initiateConnection]"",  248LL,  v7);
  }

  if (self->_isIKEResponder) {
    goto LABEL_4;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));

  if (!v10)
  {
    int v11 = @"No remote outer endpoint present";
    goto LABEL_15;
  }

  if (!-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
  {
    int v11 = @"failed to setup virtual interface";
LABEL_15:
    -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", v11);
    return 0;
  }

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[NRLink peerAvailabilityCheckInProgress](self, "peerAvailabilityCheckInProgress");
  id v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0LL);

  if (v5)
  {
    if (IsLevelEnabled)
    {
      id v18 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v10 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v18,  0LL,  "%s%.30s:%-4d %@: peer availability check already in progress, ignoring request",  ",  "-[NRLinkWired checkPeerAvailabilityWithForceAggressive:]"",  276LL,  v10);
    }
  }

  else
  {
    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d %@: peer availability check requested (aggresive: %d)",  ",  "-[NRLinkWired checkPeerAvailabilityWithForceAggressive:]"",  279LL,  v12,  v3);
    }

    BOOL v13 = !v3;
    if (v3) {
      uint64_t v14 = 5LL;
    }
    else {
      uint64_t v14 = 3LL;
    }
    if (v13) {
      uint64_t v15 = 3000LL;
    }
    else {
      uint64_t v15 = 1000LL;
    }
    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeSessionClassC](self, "ikeSessionClassC"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000C53F4;
    v19[3] = &unk_1001AF950;
    objc_copyWeak(&v20, &location);
    [v16 sendKeepaliveWithRetries:v14 retryIntervalInMilliseconds:v15 callbackQueue:v17 callback:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkWired;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:]( self,  "invalidateIKESession:",  -[NRLinkWired ikeSessionPointerForDataProtectionClass:](self, "ikeSessionPointerForDataProtectionClass:", v3));
}

- (id)ikeSessionPointerForDataProtectionClass:(unsigned __int8)a3
{
  if (a3 == 4)
  {
    uint64_t v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassD;
    return (id *)((char *)&self->super.super.isa + *v3);
  }

  if (a3 == 3)
  {
    uint64_t v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassC;
    return (id *)((char *)&self->super.super.isa + *v3);
  }

  HIDWORD(v17) = a3;
  id v5 = sub_1000C449C();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 16LL);

  if (IsLevelEnabled)
  {
    id v7 = sub_1000C449C();
    String = (void *)NRDataProtectionClassCreateString(HIDWORD(v17));
    _NRLogWithArgs( v7,  16LL,  "%s%.30s:%-4d ABORTING: Cannot copy IKE session pointer for %@",  ",  "-[NRLinkWired ikeSessionPointerForDataProtectionClass:]"",  325LL,  String);
  }

  uint64_t v9 = _os_log_pack_size(22LL);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v11 = __error();
  uint64_t v12 = _os_log_pack_fill( v10,  v9,  *v11,  &_mh_execute_header,  "%{public}s Cannot copy IKE session pointer for %@");
  uint64_t v13 = NRDataProtectionClassCreateString(HIDWORD(v17));
  *(_DWORD *)uint64_t v12 = 136446466;
  *(void *)(v12 + 4) = "-[NRLinkWired ikeSessionPointerForDataProtectionClass:]";
  *(_WORD *)(v12 + 12) = 2112;
  *(void *)(v12 + 14) = v13;
  id v14 = sub_1000C449C();
  uint64_t v15 = (NRLinkWired *)_NRLogAbortWithPack(v14, v10);
  -[NRLinkWired invalidateIKESessionClassD](v15, v16);
  return result;
}

- (void)invalidateIKESessionClassD
{
}

- (void)invalidateIKESessionClassC
{
}

- (void)restartIKESessionForDataProtectionClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id String = (id)NRDataProtectionClassCreateString(a3);
  if (self->super._state == 255)
  {
    uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0LL);

    if (!IsLevelEnabled) {
      goto LABEL_12;
    }
    uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
    id v16 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v15,  0LL,  "%s%.30s:%-4d %@: Not restarting %@ session because cancelled",  ",  "-[NRLinkWired restartIKESessionForDataProtectionClass:]"",  347LL,  v16,  String);
LABEL_11:

    goto LABEL_12;
  }

  -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v3);
  if ((_DWORD)v3 == 3 && !-[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
  {
    uint64_t v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    int v18 = _NRLogIsLevelEnabled(v17, 0LL);

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v19);
    id v16 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v15,  0LL,  "%s%.30s:%-4d %@: Not restarting %@ session because remote not unlocked",  ",  "-[NRLinkWired restartIKESessionForDataProtectionClass:]"",  352LL,  v16,  String);
    goto LABEL_11;
  }

  id v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  int v8 = _NRLogIsLevelEnabled(v7, 0LL);

  if (v8)
  {
    id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    id v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v10,  0LL,  "%s%.30s:%-4d %@: Restarting %@ session",  ",  "-[NRLinkWired restartIKESessionForDataProtectionClass:]"",  355LL,  v11,  String);
  }

  -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", v3);
LABEL_12:
}

- (void)setupIKECallbacks:(unsigned __int8)a3
{
  int v3 = a3;
  id String = (void *)NRDataProtectionClassCreateString(a3);
  if (v3 == 3)
  {
    id v7 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
    if (!v7)
    {
      id v35 = sub_1000C449C();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v35, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_13;
      }
      id v10 = sub_1000C449C();
      _NRLogWithArgs(v10, 17LL, "%s called with null _ikeSessionClassC");
      goto LABEL_12;
    }
  }

  else
  {
    if (v3 != 4)
    {
      v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      int v32 = _NRLogIsLevelEnabled(v31, 17LL);

      if (v32)
      {
        id v10 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v33);
        id v34 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v10, 17LL, "%@: Cannot setup IKE callbacks for %@", v34, String);

        goto LABEL_12;
      }

- (void)setupIPsecIfNecessary:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (!-[NRLinkWired isIKEResponder](self, "isIKEResponder"))
  {
    id v7 = -[NRLinkWired ikeSessionPointerForDataProtectionClass:](self, "ikeSessionPointerForDataProtectionClass:", v3);
    if (*v7) {
      return;
    }
    id v8 = v7;
    id String = (void *)NRDataProtectionClassCreateString(v3);
    if (self->super._state == 255)
    {
      id v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v22, 0LL);

      if (!IsLevelEnabled)
      {
LABEL_28:

        return;
      }

      id v13 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      id v25 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v13,  0LL,  "%s%.30s:%-4d %@: Not starting %@ initiator session because cancelled",  ",  "-[NRLinkWired setupIPsecIfNecessary:]"",  580LL,  v25,  String);
    }

    else
    {
      id v11 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
      id v13 = v11;
      if (!v11)
      {
        id v42 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
        int v43 = _NRLogIsLevelEnabled(v42, 17LL);

        if (!v43) {
          goto LABEL_27;
        }
        id v16 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v44);
        id v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v16,  17LL,  "%@: Not starting %@ IKE initiator session because localDevice is missing",  v29,  String);
        goto LABEL_18;
      }

      id v14 = sub_10012ADD4(v11, v3);

      if (v14)
      {
        id v16 = sub_10010C0B8();
        sub_10010BDB0(v13, v16);
        [v16 setRandomizeLocalPort:1];
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
        [v16 setOutgoingInterfaceName:v17];

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
        [v16 setRemoteEndpoint:v18];

        objc_msgSend( v16,  "setRequestChildlessSA:",  -[NRLink hasCompanionDatapath](self, "hasCompanionDatapath") ^ 1);
        if (qword_1001DC9B8 != -1) {
          dispatch_once(&qword_1001DC9B8, &stru_1001AFB18);
        }
        if (byte_1001DC9B0)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
          id v20 = [v19 addressFamily];

          if (v20 == (id)2)
          {
            LODWORD(v54) = 0;
            uint64_t v53 = 0LL;
            unsigned __int16 v21 = 528;
          }

          else
          {
            uint64_t v53 = 0LL;
            uint64_t v54 = 0LL;
            uint64_t v55 = 0LL;
            unsigned __int16 v21 = 7708;
          }

          unsigned int v52 = v21 | 0x94110000;
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NWAddressEndpoint endpointWithAddress:]( &OBJC_CLASS___NWAddressEndpoint,  "endpointWithAddress:",  &v52));
          [v16 setLocalEndpoint:v30];

          [v16 setForceUDPEncapsulation:1];
        }

        v31 = sub_10010C6B8(1, v13, v3);
        -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v3);
        int v32 = sub_10010C340();
        -[NEIKEv2ChildSAConfiguration setMode:](v32, "setMode:", 2LL);
        -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v32, "setReplayWindowSize:", 4LL);
        sub_10010BF54(v13, v32);
        id v50 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"terminus-Wired-%@",  String);
        uint64_t v33 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kernelSASessionName:packetDelegate:]( objc_alloc(&OBJC_CLASS___NEIKEv2Session),  "initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kernelSASessionNa me:packetDelegate:",  v16,  v32,  v31,  self->super._queue,  -[NRLink virtualInterface](self, "virtualInterface"),  0LL,  v50,  0LL);
        id v34 = *v8;
        id *v8 = v33;

        if (*v8)
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3015LL, @"%@ %@", String, *v8);
          -[NRLinkWired setupIKECallbacks:](self, "setupIKECallbacks:", v3);
          v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
          int v38 = _NRLogIsLevelEnabled(v37, 0LL);

          if (v38)
          {
            id v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
            id v41 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v40,  0LL,  "%s%.30s:%-4d %@: Connecting initiator %@ session %@",  ",  "-[NRLinkWired setupIPsecIfNecessary:]"",  643LL,  v41,  String,  *v8);
          }

          [*v8 connect];
        }

        else
        {
          v45 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
          int v46 = _NRLogIsLevelEnabled(v45, 17LL);

          if (v46)
          {
            id v48 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v47);
            id v49 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v48, 17LL, "%@: Failed to create initiator %@ IKE session", v49, String);
          }

          -[NRLinkWired retrySetupIPsec:](self, "retrySetupIPsec:", v3);
        }

        goto LABEL_26;
      }

      uint64_t v26 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      int v27 = _NRLogIsLevelEnabled(v26, 0LL);

      if (v27)
      {
        id v16 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v28);
        id v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v16,  0LL,  "%s%.30s:%-4d %@: Not starting %@ IKE initiator session because we do not have keys %@",  ",  "-[NRLinkWired setupIPsecIfNecessary:]"",  589LL,  v29,  String,  v13);
LABEL_18:

LABEL_26:
      }
    }

- (void)retrySetupIPsec:(unsigned __int8)a3
{
  if (-[NRLinkWired setupIPsecRetryCounter](self, "setupIPsecRetryCounter") > 4)
  {
    -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", @"IKE session creation hit max retries");
  }

  else
  {
    -[NRLink reportEvent:](self, "reportEvent:", 3026LL);
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C462C;
    block[3] = &unk_1001AF3C8;
    objc_copyWeak(&v8, &location);
    unsigned __int8 v9 = a3;
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v52 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v19 = (void (**)(id, id, NEIKEv2ChildSAConfiguration *, NEVirtualInterface_s *))a8;
  if (v52)
  {
    if (!v14)
    {
      id v44 = sub_1000C449C();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v44, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_31;
      }
      id v39 = sub_1000C449C();
      _NRLogWithArgs(v39, 17LL, "%s called with null session");
      goto LABEL_30;
    }

    if (!v15)
    {
      id v46 = sub_1000C449C();
      int v47 = _NRLogIsLevelEnabled(v46, 17LL);

      if (!v47) {
        goto LABEL_31;
      }
      id v39 = sub_1000C449C();
      _NRLogWithArgs(v39, 17LL, "%s called with null sessionConfig");
      goto LABEL_30;
    }

    if (!v17)
    {
      id v48 = sub_1000C449C();
      int v49 = _NRLogIsLevelEnabled(v48, 17LL);

      if (!v49) {
        goto LABEL_31;
      }
      id v39 = sub_1000C449C();
      _NRLogWithArgs(v39, 17LL, "%s called with null validateAuthBlock");
      goto LABEL_30;
    }

    if (!v19)
    {
      id v50 = sub_1000C449C();
      int v51 = _NRLogIsLevelEnabled(v50, 17LL);

      if (!v51) {
        goto LABEL_31;
      }
      id v39 = sub_1000C449C();
      _NRLogWithArgs(v39, 17LL, "%s called with null responseBlock");
      goto LABEL_30;
    }

    id v20 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
    int v21 = _NRLogIsLevelEnabled(v20, 0LL);

    if (v21)
    {
      id v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v22);
      id v24 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v23,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRLinkWired requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  683LL,  v24,  v52,  v14,  v15,  v16);
    }

    if (self->super._state != 255)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
      if (qword_1001DCA68 != -1) {
        dispatch_once(&qword_1001DCA68, &stru_1001AFD30);
      }
      id v26 = (id)qword_1001DCA60;
      unsigned int v27 = [v25 isEqual:v26];

      if (v27)
      {
        if (v16)
        {
          uint64_t v28 = sub_10010C340();
          -[NEIKEv2ChildSAConfiguration setMode:](v28, "setMode:", 2LL);
          -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v28, "setReplayWindowSize:", 4LL);
LABEL_25:
          id v39 = (id)objc_claimAutoreleasedReturnValue( -[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:]( self,  "respondToIKESession:dataProtectionClass:validateAuthBlock:",  v14,  4LL,  v17));
          goto LABEL_26;
        }

        if (!-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
        {
          uint64_t v28 = 0LL;
          goto LABEL_25;
        }

        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024LL, @"ClassD %@", v14);
        goto LABEL_21;
      }

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 localIdentifier]);
      if (qword_1001DCA78 != -1) {
        dispatch_once(&qword_1001DCA78, &stru_1001AFD50);
      }
      id v30 = (id)qword_1001DCA70;
      unsigned int v31 = [v29 isEqual:v30];

      if (v31)
      {
        if (v16)
        {
          uint64_t v28 = sub_10010C340();
          -[NEIKEv2ChildSAConfiguration setMode:](v28, "setMode:", 2LL);
          -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v28, "setReplayWindowSize:", 4LL);
LABEL_34:
          objc_opt_self(&OBJC_CLASS___NRDKeyManager);
          if (qword_1001DCC18 != -1) {
            dispatch_once(&qword_1001DCC18, &stru_1001B0910);
          }
          id v40 = (id)qword_1001DCC10;
          id v41 = v40;
          if (v40)
          {
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v40 + 2));
            if (!v41[10])
            {
              v41[10] = 1;
              if (v41[8] == 4)
              {
                sub_100143DD4((uint64_t)v41);
                if (v41[9])
                {
                  v41[8] = 3;
                  sub_100144044((uint64_t)v41);
                }
              }
            }

            if ((v41[8] & 0xFD) == 1)
            {
              id v39 = (id)objc_claimAutoreleasedReturnValue( -[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:]( self,  "respondToIKESession:dataProtectionClass:validateAuthBlock:",  v14,  3LL,  v17));

LABEL_26:
              if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
              {
                v19[2](v19, v39, v28, -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_29:

                goto LABEL_30;
              }

- (id)respondToIKESession:(id)a3 dataProtectionClass:(unsigned __int8)a4 validateAuthBlock:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = (uint64_t (**)(id, NEIKEv2SessionConfiguration *))a5;
  if (v9)
  {
    id String = (id)NRDataProtectionClassCreateString(v6);
    uint64_t v12 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
    id v13 = sub_10012ADD4(v12, v6);
    id v14 = v13;
    if (v13) {
      id v15 = (void *)*((void *)v13 + 1);
    }
    else {
      id v15 = 0LL;
    }
    id v16 = v15;

    if (!v16)
    {
      -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3019LL,  @"%@ %@ %@",  String,  v9,  v12);
      int v21 = 0LL;
LABEL_17:

      goto LABEL_18;
    }

    if ((_DWORD)v6 == 3)
    {
      if (v12)
      {
        uint64_t v22 = sub_100146AFC();
        dispatch_assert_queue_V2((dispatch_queue_t)v22);

        uint64_t v18 = (void *)sub_10012D45C(v12, @"0");
        id v23 = sub_100146AFC();
        dispatch_assert_queue_V2((dispatch_queue_t)v23);

        id v20 = sub_10012D610(v12, @"0");
        goto LABEL_12;
      }
    }

    else
    {
      if ((_DWORD)v6 != 4)
      {
LABEL_13:
        id v24 = sub_10010C6B8(0, v12, v6);
        id v25 = -[NRLinkWired copyNotifyPayloadsToSendWithProxy:]( self,  "copyNotifyPayloadsToSendWithProxy:",  sub_10010CE6C(v12));
        -[NEIKEv2SessionConfiguration setCustomIKEAuthPrivateNotifies:](v24, "setCustomIKEAuthPrivateNotifies:", v25);
        if ((v10[2](v10, v24) & 1) != 0)
        {
          -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v6);
          objc_storeStrong( -[NRLinkWired ikeSessionPointerForDataProtectionClass:]( self,  "ikeSessionPointerForDataProtectionClass:",  v6),  a3);
          -[NRLinkWired setupIKECallbacks:](self, "setupIKECallbacks:", v6);
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016LL, @"%@ %@", String, v9);
          int v21 = v24;
        }

        else
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021LL, @"%@ %@", String, v9);
          int v21 = 0LL;
        }

        goto LABEL_17;
      }

      if (v12)
      {
        id v17 = sub_100146AFC();
        dispatch_assert_queue_V2((dispatch_queue_t)v17);

        uint64_t v18 = sub_10012CD2C(v12, @"0");
        id v19 = sub_100146AFC();
        dispatch_assert_queue_V2((dispatch_queue_t)v19);

        id v20 = sub_10012D254(v12, @"0");
LABEL_12:

        goto LABEL_13;
      }
    }

    id v20 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_12;
  }

  id v27 = sub_1000C449C();
  int IsLevelEnabled = _NRLogIsLevelEnabled(v27, 17LL);

  if (!IsLevelEnabled)
  {
    int v21 = 0LL;
    goto LABEL_19;
  }

  id String = sub_1000C449C();
  _NRLogWithArgs( String,  17LL,  "%s called with null session",  "-[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:]");
  int v21 = 0LL;
LABEL_18:

LABEL_19:
  return v21;
}

- (id)copyNotifyPayloadsToSendWithProxy:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_time_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int16 v26 = 5632;
  uint64_t v6 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v26,  2LL);
  id v7 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:48602 notifyData:v6];
  -[NSMutableArray addObject:](v5, "addObject:", v7);

  if (qword_1001DC9A8 != -1) {
    dispatch_once(&qword_1001DC9A8, &stru_1001AFAF8);
  }
  id v8 = (id)qword_1001DC9A0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  id v10 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:48603 notifyData:v9];
  -[NSMutableArray addObject:](v5, "addObject:", v10);

  if (qword_1001DC998 != -1) {
    dispatch_once(&qword_1001DC998, &stru_1001AFAD8);
  }
  id v11 = (id)qword_1001DC990;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataUsingEncoding:4]);

  id v13 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:48604 notifyData:v12];
  -[NSMutableArray addObject:](v5, "addObject:", v13);

  id v14 = sub_10010CD5C();
  -[NSMutableArray addObject:](v5, "addObject:", v14);

  if (v3)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    id v16 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v15);

    if (v16) {
      id v17 = (void *)*((void *)v16 + 16);
    }
    else {
      id v17 = 0LL;
    }
    id v18 = v17;
    id v19 = [v18 proxyCapability];

    if (v19 == (id)1)
    {
      if (v16) {
        id v20 = (void *)*((void *)v16 + 16);
      }
      else {
        id v20 = 0LL;
      }
      id v21 = v20;
      unsigned __int8 v22 = [v21 hasCompanionDatapath];

      if ((v22 & 1) != 0) {
        id v23 = 0LL;
      }
      else {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
      }
      id v24 = sub_10010CEF4(v16, v23);
      -[NSMutableArray addObject:](v5, "addObject:", v24);
    }
  }

  return v5;
}

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:50702 notifyData:v4];
    BOOL v6 = v5 != 0LL;
    if (v5)
    {
      objc_initWeak(&location, self);
      id v7 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
      id v20 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000C44DC;
      v17[3] = &unk_1001AF950;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      id v14 = sub_1000C449C();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17LL);

      if (IsLevelEnabled)
      {
        id v16 = sub_1000C449C();
        _NRLogWithArgs(v16, 17LL, "NEIKEv2PrivateNotify init %u %@ failed", 50702LL, v4);
      }
    }
  }

  else
  {
    id v11 = sub_1000C449C();
    int v12 = _NRLogIsLevelEnabled(v11, 17LL);

    if (v12)
    {
      id v13 = sub_1000C449C();
      _NRLogWithArgs(v13, 17LL, "%s called with null data", "-[NRLinkWired sendControlData:]");
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)sendClassCUnlockedNotify
{
  if (-[NRLink state](self, "state") == 8)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeSessionClassD](self, "ikeSessionClassD"));

    if (v3)
    {
      if (!-[NRLinkWired hasScheduledSendingLocalClassCUnlock](self, "hasScheduledSendingLocalClassCUnlock"))
      {
        -[NRLinkWired setHasScheduledSendingLocalClassCUnlock:](self, "setHasScheduledSendingLocalClassCUnlock:", 1LL);
        objc_initWeak(&location, self);
        objc_opt_self(&OBJC_CLASS___NRDKeyManager);
        if (qword_1001DCC18 != -1) {
          dispatch_once(&qword_1001DCC18, &stru_1001B0910);
        }
        id v4 = (id)qword_1001DCC10;
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472LL;
        v5[2] = sub_1000C41F0;
        v5[3] = &unk_1001AFED0;
        objc_copyWeak(&v6, &location);
        sub_100144478((uint64_t)v4, v5);

        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }

- (void)upgradeSessionsIfNeeded
{
  if (self
    && self->_upgradeSessionAfterFirstUnlock
    && -[NRLinkWired sentLocalClassCUnlockNotify](self, "sentLocalClassCUnlockNotify")
    && -[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
  {
    objc_opt_self(&OBJC_CLASS___NRDKeyManager);
    if (qword_1001DCC18 != -1) {
      dispatch_once(&qword_1001DCC18, &stru_1001B0910);
    }
    BOOL v3 = (dispatch_queue_t *)(id)qword_1001DCC10;
    if (!v3) {
      goto LABEL_19;
    }
    id v4 = v3;
    dispatch_assert_queue_V2(v3[2]);
    if (!*((_BYTE *)v4 + 10))
    {
      *((_BYTE *)v4 + 10) = 1;
      if (*((_BYTE *)v4 + 8) == 4)
      {
        sub_100143DD4((uint64_t)v4);
        if (*((_BYTE *)v4 + 9))
        {
          *((_BYTE *)v4 + 8) = 3;
          sub_100144044((uint64_t)v4);
        }
      }
    }

    int v5 = (_BYTE)v4[1] & 0xFD;

    if (v5 == 1 && !-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished"))
    {
      if (-[NRLink state](self, "state") == 8)
      {
        -[NRLinkWired suspend](self, "suspend");
        -[NRLinkWired invalidateIKESessionClassD](self, "invalidateIKESessionClassD");
        -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", 3LL);
        return;
      }

      id v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16LL);

      if (IsLevelEnabled)
      {
        id v11 = (dispatch_queue_t *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
        id v10 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v11,  16LL,  "%s%.30s:%-4d %@: both sides unlocked with unexpected link state",  ",  "-[NRLinkWired upgradeSessionsIfNeeded]"",  946LL,  v10);

        BOOL v3 = v11;
LABEL_19:
      }
    }
  }

- (void)handleNotifyCode:(unsigned __int16)a3 payload:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  id v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1LL);

  if (IsLevelEnabled)
  {
    id v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    id v12 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v11,  1LL,  "%s%.30s:%-4d %@: Received notify code %u %@",  ",  "-[NRLinkWired handleNotifyCode:payload:]"",  958LL,  v12,  v4,  v6);
  }

  switch(v4)
  {
    case 0xBE3Du:
      char v18 = 0;
      if ([v6 length])
      {
        [v6 getBytes:&v18 length:1];
        if (v18 < 0 && !-[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
        {
          -[NRLinkWired setRemoteClassCUnlocked:](self, "setRemoteClassCUnlocked:", 1LL);
          objc_initWeak(&location, self);
          objc_opt_self(&OBJC_CLASS___NRDKeyManager);
          if (qword_1001DCC18 != -1) {
            dispatch_once(&qword_1001DCC18, &stru_1001B0910);
          }
          id v14 = (id)qword_1001DCC10;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_1000C419C;
          v15[3] = &unk_1001AFED0;
          objc_copyWeak(&v16, &location);
          sub_100144478((uint64_t)v14, v15);

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
      }

      break;
    case 0xC60Du:
      sub_100136084((uint64_t)&OBJC_CLASS___NRDLocalDevice, v6, self->super._nrUUID);
      -[NRLink checkProxyAgentWithForceUpdate:](self, "checkProxyAgentWithForceUpdate:", 0LL);
      break;
    case 0xC60Eu:
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v13 linkDidReceiveData:self data:v6];

      break;
  }
}

- (BOOL)suspend
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NRLinkWired;
  -[NRLink suspend](&v17, "suspend");
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DE28((uint64_t)companionProxyAgent, v3) & 1) != 0)
      {
        -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
      }

      else
      {
        id v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16LL);

        if (IsLevelEnabled)
        {
          id v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v13);
          id v15 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v14,  16LL,  "%s%.30s:%-4d %@: failed to unregister companion agent",  ",  "-[NRLinkWired suspend]"",  1003LL,  v15);
        }
      }
    }

    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9LL, @"(suspend)");
    -[NRLink setInterfaceRank](self, "setInterfaceRank");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v9 linkIsSuspended:self];
    goto LABEL_10;
  }

  id v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  int v7 = _NRLogIsLevelEnabled(v6, 1LL);

  if (v7)
  {
    uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    id v10 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v9,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'",  ",  "-[NRLinkWired suspend]"",  997LL,  v10);

LABEL_10:
  }

  return 1;
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    id v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    BOOL v7 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1LL);

    if (IsLevelEnabled)
    {
      id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'",  ",  "-[NRLinkWired resume]"",  1020LL,  v11);
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NRLinkWired;
    if (-[NRLink resume](&v19, "resume"))
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_10005E944((uint64_t)companionProxyAgent, v3) & 1) != 0)
        {
          -[NRLink reportEvent:](self, "reportEvent:", 12002LL);
        }

        else
        {
          id v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          int v13 = _NRLogIsLevelEnabled(v12, 16LL);

          if (v13)
          {
            id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
            id v16 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v15,  16LL,  "%s%.30s:%-4d %@: failed to register companion agent",  ",  "-[NRLinkWired resume]"",  1031LL,  v16);
          }
        }
      }

      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8LL, @"(resume)");
      -[NRLink setInterfaceRank](self, "setInterfaceRank");
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v17 linkIsReady:self];

      return 1;
    }

    else
    {
      return 0;
    }
  }

  return v7;
}

- (NEIKEv2Listener)ikeListener
{
  return *(NEIKEv2Listener **)((char *)&self->_listenerPort + 7);
}

- (void)setIkeListener:(id)a3
{
}

- (NEIKEv2Session)ikeSessionClassD
{
  return *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
}

- (void)setIkeSessionClassD:(id)a3
{
}

- (NEIKEv2Session)ikeSessionClassC
{
  return *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
}

- (void)setIkeSessionClassC:(id)a3
{
}

- (NSString)listenerPortString
{
  return *(NSString **)((char *)&self->_ikeSessionClassC + 7);
}

- (void)setListenerPortString:(id)a3
{
}

- (BOOL)hasScheduledSendingLocalClassCUnlock
{
  return self->_hasScheduledSendingLocalClassCUnlock;
}

- (void)setHasScheduledSendingLocalClassCUnlock:(BOOL)a3
{
  self->_hasScheduledSendingLocalClassCUnlock = a3;
}

- (BOOL)sentLocalClassCUnlockNotify
{
  return self->_sentLocalClassCUnlockNotify;
}

- (void)setSentLocalClassCUnlockNotify:(BOOL)a3
{
  self->_sentLocalClassCUnlockNotify = a3;
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return *(OS_nw_path_evaluator **)((char *)&self->_listenerPortString + 7);
}

- (void)setPathEvaluator:(id)a3
{
}

- (BOOL)isIKEResponder
{
  return self->_isIKEResponder;
}

- (void)setIsIKEResponder:(BOOL)a3
{
  self->_isIKEResponder = a3;
}

- (NSUUID)randomUUID
{
  return *(NSUUID **)((char *)&self->_pathEvaluator + 7);
}

- (void)setRandomUUID:(id)a3
{
}

- (BOOL)remoteClassCUnlocked
{
  return self->_remoteClassCUnlocked;
}

- (void)setRemoteClassCUnlocked:(BOOL)a3
{
  self->_remoteClassCUnlocked = a3;
}

- (NRPairingClient)pairingClient
{
  return *(NRPairingClient **)((char *)&self->_randomUUID + 7);
}

- (void)setPairingClient:(id)a3
{
}

- (BOOL)onlyAllowClassC
{
  return self->_onlyAllowClassC;
}

- (void)setOnlyAllowClassC:(BOOL)a3
{
  self->_onlyAllowClassC = a3;
}

- (unsigned)setupIPsecRetryCounter
{
  return *(_DWORD *)(&self->_onlyAllowClassC + 2);
}

- (void)setSetupIPsecRetryCounter:(unsigned int)a3
{
  *(_DWORD *)(&self->_onlyAllowClassC + 2) = a3;
}

- (void).cxx_destruct
{
}

@end