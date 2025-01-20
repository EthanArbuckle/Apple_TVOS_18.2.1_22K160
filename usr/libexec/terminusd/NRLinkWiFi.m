@interface NRLinkWiFi
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9;
- (unsigned)metric;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)invalidateLink;
- (void)refreshCompanionProxyAgent;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
- (void)setIsPrimary:(BOOL)a3;
@end

@implementation NRLinkWiFi

- (id)copyStatusString
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = -[NSMutableString initWithString:](v3, "initWithString:", v4);

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "nrUUID", self->super._nrUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "localInterfaceName", v6);

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "listenerPortString",  *(void *)((char *)&self->_notifyToken + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassC",  *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "virtualInterfaceName", v8);
  }

  uint64_t v9 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v9) {
    uint64_t v9 = *(void *)(v9 + 120);
  }
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %llu", "symptomsAdvisoryFalsePositives", v9);
  return v5;
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v15)
  {
    id v32 = sub_10003295C();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v32, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_26;
    }
    id v34 = sub_10003295C();
    _NRLogWithArgs(v34, 17LL, "%s called with null queue");
LABEL_22:

    v30 = 0LL;
    goto LABEL_9;
  }

  if (!v16)
  {
    id v35 = sub_10003295C();
    int v36 = _NRLogIsLevelEnabled(v35, 17LL);

    if (!v36) {
      goto LABEL_26;
    }
    id v34 = sub_10003295C();
    _NRLogWithArgs(v34, 17LL, "%s called with null linkDelegate");
    goto LABEL_22;
  }

  if (!v17)
  {
    id v37 = sub_10003295C();
    int v38 = _NRLogIsLevelEnabled(v37, 17LL);

    if (!v38) {
      goto LABEL_26;
    }
    id v34 = sub_10003295C();
    _NRLogWithArgs(v34, 17LL, "%s called with null nrUUID");
    goto LABEL_22;
  }

  if ((_NRIsUUIDNonZero(v17) & 1) == 0)
  {
    id v39 = sub_10003295C();
    int v40 = _NRLogIsLevelEnabled(v39, 17LL);

    if (!v40) {
      goto LABEL_26;
    }
    id v34 = sub_10003295C();
    _NRLogWithArgs(v34, 17LL, "called with all-zero nrUUID");
    goto LABEL_22;
  }

  if (!v18)
  {
    id v41 = sub_10003295C();
    int v42 = _NRLogIsLevelEnabled(v41, 17LL);

    if (!v42) {
      goto LABEL_26;
    }
    id v34 = sub_10003295C();
    _NRLogWithArgs(v34, 17LL, "%s called with null wifiInterfaceName");
    goto LABEL_22;
  }

  if (!v19)
  {
    id v43 = sub_10003295C();
    int v44 = _NRLogIsLevelEnabled(v43, 17LL);

    if (v44)
    {
      id v34 = sub_10003295C();
      _NRLogWithArgs(v34, 17LL, "%s called with null localOuterEndpoint");
      goto LABEL_22;
    }

- (void)setIsPrimary:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
  -[NRLink setIsPrimary:](&v21, "setIsPrimary:");
  objc_opt_self(&OBJC_CLASS___NRLinkDirector);
  if (qword_1001DC878 != -1) {
    dispatch_once(&qword_1001DC878, &stru_1001AEED0);
  }
  id v5 = (id)qword_1001DC870;
  v6 = v5;
  if (v5) {
    v7 = (void *)*((void *)v5 + 6);
  }
  else {
    v7 = 0LL;
  }
  v8 = v7;
  uint64_t v9 = v8;
  if (v3)
  {
    if (self) {
      v10 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      v10 = 0LL;
    }
    sub_1001424C8(v8, 32LL, v10, &off_1001BC9E0);

    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v11 = (id)qword_1001DC870;
    v12 = v11;
    if (v11) {
      v13 = (void *)*((void *)v11 + 6);
    }
    else {
      v13 = 0LL;
    }
    id v14 = v13;
    id v15 = v14;
    if (self) {
      id v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      id v16 = 0LL;
    }
    int v17 = 1;
  }

  else
  {
    if (self) {
      id v18 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      id v18 = 0LL;
    }
    sub_100142404(v8, v18);

    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v19 = (id)qword_1001DC870;
    v12 = v19;
    if (v19) {
      id v20 = (void *)*((void *)v19 + 6);
    }
    else {
      id v20 = 0LL;
    }
    id v14 = v20;
    id v15 = v14;
    if (self) {
      id v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    }
    else {
      id v16 = 0LL;
    }
    int v17 = 0;
  }

  sub_100140F48((uint64_t)v14, v17, v16);
}

- (void)invalidateLink
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
  -[NRLink invalidateLink](&v25, "invalidateLink");
  if (self)
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
    -[NRLink invalidateIKESessionForClass:](&v26, "invalidateIKESessionForClass:", 3LL);
    -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0LL);
    self->super._peerAvailabilityCheckInProgress = 0;
    -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeListener + 7);
    id v5 = *(NSString **)((char *)&self->_listenerPortString + 7);
    if (v5)
    {
      [v5 cancel];
      v6 = *(NSString **)((char *)&self->_listenerPortString + 7);
      *(NSString **)((char *)&self->_listenerPortString + 7) = 0LL;
    }

    v7 = *(nw_browser **)((char *)&self->_pairingClient + 7);
    if (v7)
    {
      nw_browser_cancel(v7);
      v8 = *(NRPairingClient **)((char *)&self->_pairingClient + 7);
      *(NRPairingClient **)((char *)&self->_pairingClient + 7) = 0LL;

      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 0LL);

      if (IsLevelEnabled)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
        id v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v12,  0LL,  "%s%.30s:%-4d %@: stopped AWDL browser",  ",  "-[NRLinkWiFi stopAWDLBrowser]"",  489LL,  v13);
      }
    }

    sub_1000350FC((uint64_t)self, v4);
    id v14 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v14)
    {
      [v14 setDelegate:0];
      [*(id *)((char *)&self->_ikeSessionClassC + 7) destroy];
      id v15 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0LL;
    }
  }

  else
  {
    sub_1000350FC(0LL, v3);
  }

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1LL);
    NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface"));
  }

  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DE28((uint64_t)companionProxyAgent, v16);
    -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
    id v18 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0LL;
  }

  objc_opt_self(&OBJC_CLASS___NRLinkDirector);
  if (qword_1001DC878 != -1) {
    dispatch_once(&qword_1001DC878, &stru_1001AEED0);
  }
  id v19 = (id)qword_1001DC870;
  id v20 = v19;
  if (v19) {
    objc_super v21 = (void *)*((void *)v19 + 6);
  }
  else {
    objc_super v21 = 0LL;
  }
  id v22 = v21;
  sub_100140F48((uint64_t)v22, 0, *(void **)((char *)&self->_linkAnalytics + 7));

  *(unsigned int *)((char *)&self->_ikeRetryCounter + 3) = 0;
  *(_DWORD *)(&self->_ikeRetryBackoffScheduled + 2) = 0;
  *(unsigned int *)((char *)&self->_startRetryCounter + 3) = 0;
  uint64_t v23 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
  if (v23)
  {
    sub_100005DB0(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
    sub_100005794(v23, 6, 0);
    v24 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0LL;
  }

- (void)refreshCompanionProxyAgent
{
  if (self->super._state == 255)
  {
    uint64_t v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

    if (IsLevelEnabled)
    {
      id v7 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      id v6 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v7,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'refreshCompanionProxyAgent'",  ",  "-[NRLinkWiFi refreshCompanionProxyAgent]"",  213LL,  v6);
    }
  }

  else
  {
    sub_10005F3F0((uint64_t)self->super._companionProxyAgent, (uint64_t)a2);
  }

- (id)copyDescriptionInner
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
  id v4 = -[NRLink copyDescriptionInner](&v9, "copyDescriptionInner");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  id v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@, %@ -> %@", v4, v5, v6);

  return v7;
}

- (unsigned)metric
{
  return 100;
}

- (BOOL)start
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[NRLink state](self, "state") == 255)
  {
    id v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1LL);

    if (!IsLevelEnabled) {
      return 0;
    }
    v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    id v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Ignoring start request as link is cancelled",  ",  "-[NRLinkWiFi start]"",  305LL,  v11);
    goto LABEL_8;
  }

  if (-[NRLink state](self, "state") == 8)
  {
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v5 linkIsReady:self];
LABEL_4:

    return 1;
  }

  if (-[NRLink state](self, "state") != 9)
  {
    if (-[NRLink startRequested](self, "startRequested")) {
      return 1;
    }
    -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isResponder);
    if (!self) {
      return 0;
    }
    if (!self->_isResponder)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));

      if (!v12) {
        return 0;
      }
      id v13 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
      v10 = v13;
      if (v13 && v13[13] || -[NRLink ikev2Role](self, "ikev2Role"))
      {
      }

      else
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
        if (!v24) {
          goto LABEL_9;
        }
        objc_super v25 = (void *)v24;
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken"));

        if (!v26) {
          return 0;
        }
      }
    }

    -[NRLink setStartRequested:](self, "setStartRequested:", 1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));

    if (v14)
    {
      if (-[NRLink state](self, "state") == 1)
      {
        int v17 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->super._nrUUID);
        uint64_t v5 = v17;
        if (v17 && v17[13]) {
          sub_100035884((uint64_t)self, v18);
        }
        else {
          sub_1000355E8((uint64_t)self);
        }
        if (-[NRLink subtype](self, "subtype") == 102) {
          sub_100035B70((uint64_t)self);
        }
        goto LABEL_4;
      }

      id v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
      int v20 = _NRLogIsLevelEnabled(v19, 17LL);

      if (!v20) {
        return 0;
      }
      v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
      id v22 = -[NRLink copyDescription](self, "copyDescription");
      uint64_t v23 = sub_1001080C0(-[NRLink state](self, "state"));
      _NRLogWithArgs(v10, 17LL, "%@: Cannot start link in state %@", v22, v23);

      goto LABEL_9;
    }

    v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
    int v28 = _NRLogIsLevelEnabled(v27, 17LL);

    if (!v28) {
      return 0;
    }
    v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v29);
    id v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 17LL, "%@: Cannot start Wi-Fi link without wifiInterfaceName", v11);
LABEL_8:

LABEL_9:
    return 0;
  }

  return -[NRLinkWiFi resume](self, "resume");
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v42 = &v44;
    uint64_t v5 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v4,  &v44);
    unsigned __int8 v6 = -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255LL, v5);
    uint64_t v8 = _NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    uint64_t v9 = (void *)v8;
    if ((v6 & 1) != 0)
    {
      int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 16LL);

      if (IsLevelEnabled)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
        id v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v12,  16LL,  "%s%.30s:%-4d %@: Cancelling due to %@, dumping last status:",  ",  "-[NRLinkWiFi cancelWithReason:]"",  387LL,  v13,  v5);
      }

      id v37 = v5;
      id v36 = -[NRLinkWiFi copyStatusString](self, "copyStatusString");
      id v14 = (id)objc_claimAutoreleasedReturnValue([v36 componentsSeparatedByString:@"\n"]);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v15)
      {
        id v17 = v15;
        uint64_t v18 = *(void *)v39;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
            uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
            int v22 = _NRLogIsLevelEnabled(v21, 16LL);

            if (v22)
            {
              uint64_t v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
              id v24 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v23, 16LL, "%s%.30s:%-4d %@: %@", ", "-[NRLinkWiFi cancelWithReason:]"", 391LL, v24, v20);
            }
          }

          id v17 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }

        while (v17);
      }

      int v28 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v28 linkIsUnavailable:self];

      -[NRLinkWiFi invalidateLink](self, "invalidateLink");
      uint64_t v29 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v29) {
        *(void *)(v29 + 128) = *(unsigned int *)((char *)&self->_ikeRetryCounter + 3);
      }
      -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
      uint64_t v31 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v31)
      {
        *(void *)(v31 + 16) = v30;
        id v32 = *(NWNetworkOfInterestManager **)((char *)&self->_symptomsNOIManager + 7);
      }

      else
      {
        id v32 = 0LL;
      }

      uint64_t v5 = v37;
      v27 = v36;
      [v32 submit];
      goto LABEL_21;
    }

    int v25 = _NRLogIsLevelEnabled(v8, 0LL);

    if (v25)
    {
      v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
      id v14 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v27,  0LL,  "%s%.30s:%-4d %@: link already cancelled",  ",  "-[NRLinkWiFi cancelWithReason:]"",  383LL,  v14);
LABEL_21:
    }
  }

  else
  {
    id v34 = sub_10003295C();
    int v35 = _NRLogIsLevelEnabled(v34, 17LL);

    if (!v35) {
      goto LABEL_23;
    }
    uint64_t v5 = (NSString *)sub_10003295C();
    _NRLogWithArgs(v5, 17LL, "%s called with null reasonFormat", "-[NRLinkWiFi cancelWithReason:]");
  }

LABEL_23:
  return v4 != 0LL;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0LL);

  if (IsLevelEnabled)
  {
    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    id v8 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v7,  0LL,  "%s%.30s:%-4d %@: submitting live-link monitor preferences",  ",  "-[NRLinkWiFi didStartTrackingNOI:]"",  705LL,  v8);
  }

  uint64_t v9 = mach_absolute_time();
  uint64_t v11 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v11) {
    *(void *)(v11 + 112) = v9;
  }
  if (*(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
  {
    if (!&_symptom_new)
    {
      id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
      int v16 = _NRLogIsLevelEnabled(v15, 16LL);

      if (v16)
      {
        id v36 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
        id v18 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v36,  16LL,  "%s%.30s:%-4d %@: SymptomReporterFramework not present, skipping.",  ",  "-[NRLinkWiFi startSymptomsMonitor]"",  600LL,  v18);
      }

      return;
    }

    if (qword_1001DCA08 != -1) {
      dispatch_once(&qword_1001DCA08, &stru_1001AFC08);
    }
    uint64_t v12 = symptom_new(qword_1001DCA00, 438273LL);
    if (!v12)
    {
      if (qword_1001DC748 != -1) {
        dispatch_once(&qword_1001DC748, &stru_1001AE638);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC740, 17LL))
      {
        if (qword_1001DC748 != -1) {
          dispatch_once(&qword_1001DC748, &stru_1001AE638);
        }
        _NRLogWithArgs(qword_1001DC740, 17LL, "symptom_new failed");
      }

      return;
    }

    uint64_t v13 = v12;
    if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath")) {
      id v14 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    }
    else {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
    }
    id v19 = v14;
    symptom_set_additional_qualifier(v13, 0, [v14 length], objc_msgSend(v14, "UTF8String"));
    if (symptom_send(v13))
    {
      uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      int v22 = _NRLogIsLevelEnabled(v21, 17LL);

      if (v22)
      {
        id v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v23);
        id v25 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v24, 17LL, "%@: failed to send symptom to start link monitoring", v25);
      }

      goto LABEL_37;
    }

    objc_initWeak(&location, self);
    uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100035434;
    handler[3] = &unk_1001B0938;
    objc_copyWeak(&v38, &location);
    uint32_t v27 = notify_register_dispatch( "com.apple.symptoms.liveLinkHasAdvice",  (int *)((char *)&self->_symptomsAdvisoryCounter + 3),  v26,  handler);

    if (v27 || *(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
    {
      if (qword_1001DC748 != -1) {
        dispatch_once(&qword_1001DC748, &stru_1001AE638);
      }
      id v29 = (id)qword_1001DC740;
      char v30 = _NRLogIsLevelEnabled(v29, 17LL);

      if ((v30 & 1) == 0) {
        goto LABEL_36;
      }
      if (qword_1001DC748 != -1) {
        dispatch_once(&qword_1001DC748, &stru_1001AE638);
      }
      id v31 = (id)qword_1001DC740;
      _NRLogWithArgs( v31,  17LL,  "notify_register_dispatch (status: %u, token: %d) failed",  v27,  *(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3));
    }

    else
    {
      id v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v28);
      int v33 = _NRLogIsLevelEnabled(v32, 0LL);

      if (!v33)
      {
LABEL_36:
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
LABEL_37:

        return;
      }

      id v31 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v34);
      id v35 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v31,  0LL,  "%s%.30s:%-4d %@: successfully sent symptom to start link monitoring on interface: %@",  ",  "-[NRLinkWiFi startSymptomsMonitor]"",  656LL,  v35,  v19);
    }

    goto LABEL_36;
  }

- (void)didStopTrackingAllNOIs:(id)a3
{
  if (-[NRLink state](self, "state", a3) != 255)
  {
    uint64_t v5 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0LL);

    if (IsLevelEnabled)
    {
      id v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
      id v9 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v8,  0LL,  "%s%.30s:%-4d %@: re-submitting live-link monitor preferences",  ",  "-[NRLinkWiFi didStopTrackingAllNOIs:]"",  717LL,  v9);
    }

    sub_1000350FC((uint64_t)self, v7);
    sub_100034D58((char *)self);
  }

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[NRLink peerAvailabilityCheckInProgress](self, "peerAvailabilityCheckInProgress");
  uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0LL);

  if (v5)
  {
    if (IsLevelEnabled)
    {
      id v17 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v10 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v17,  0LL,  "%s%.30s:%-4d %@: peer availability check already in progress, ignoring request",  ",  "-[NRLinkWiFi checkPeerAvailabilityWithForceAggressive:]"",  727LL,  v10);
    }
  }

  else
  {
    if (IsLevelEnabled)
    {
      uint64_t v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d %@: peer availability check requested (aggresive: %d)",  ",  "-[NRLinkWiFi checkPeerAvailabilityWithForceAggressive:]"",  730LL,  v12,  v3);
    }

    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    id v13 = *(id *)((char *)&self->_ikeListener + 7);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    if (v3) {
      uint64_t v15 = 1000LL;
    }
    else {
      uint64_t v15 = 3000LL;
    }
    if (v3) {
      uint64_t v16 = 5LL;
    }
    else {
      uint64_t v16 = 3LL;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100034F7C;
    v18[3] = &unk_1001AF950;
    objc_copyWeak(&v19, &location);
    [v13 sendKeepaliveWithRetries:v16 retryIntervalInMilliseconds:v15 callbackQueue:v14 callback:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (char *)a6;
  id v18 = (uint64_t (**)(id, NEIKEv2SessionConfiguration *))a7;
  id v19 = a8;
  uint64_t v21 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v64 = sub_10003295C();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v64, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_56;
    }
    id v66 = sub_10003295C();
    _NRLogWithArgs(v66, 17LL, "%s called with null listener");
LABEL_48:

    goto LABEL_56;
  }

  if (!v15)
  {
    id v67 = sub_10003295C();
    int v68 = _NRLogIsLevelEnabled(v67, 17LL);

    if (!v68) {
      goto LABEL_56;
    }
    id v66 = sub_10003295C();
    _NRLogWithArgs(v66, 17LL, "%s called with null session");
    goto LABEL_48;
  }

  if (!v16)
  {
    id v69 = sub_10003295C();
    int v70 = _NRLogIsLevelEnabled(v69, 17LL);

    if (!v70) {
      goto LABEL_56;
    }
    id v66 = sub_10003295C();
    _NRLogWithArgs(v66, 17LL, "%s called with null sessionConfig");
    goto LABEL_48;
  }

  if (!v18)
  {
    id v71 = sub_10003295C();
    int v72 = _NRLogIsLevelEnabled(v71, 17LL);

    if (!v72) {
      goto LABEL_56;
    }
    id v66 = sub_10003295C();
    _NRLogWithArgs(v66, 17LL, "%s called with null validateAuthBlock");
    goto LABEL_48;
  }

  if (v19)
  {
    int v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    int v23 = _NRLogIsLevelEnabled(v22, 0LL);

    if (v23)
    {
      id v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      id v26 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v25,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  1117LL,  v26,  v14,  v15,  v16,  v17);
    }

    int state = self->super._state;
    id v87 = v15;
    if (state == 255) {
      goto LABEL_53;
    }
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    id v86 = a4;
    if (qword_1001DCA78 != -1) {
      dispatch_once(&qword_1001DCA78, &stru_1001AFD50);
    }
    id v29 = (id)qword_1001DCA70;
    unsigned int v30 = [v28 isEqual:v29];

    if (!v30)
    {
      uint64_t v34 = v16;
      id v35 = v18;
      id v36 = v17;
      id v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      int v38 = _NRLogIsLevelEnabled(v37, 16LL);

      if (v38)
      {
        __int128 v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
        id v41 = -[NRLink copyDescription](self, "copyDescription");
        int v42 = v34;
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v34 localIdentifier]);
        _NRLogWithArgs( v40,  16LL,  "%s%.30s:%-4d %@: Unrecognized identifier %@",  ",  "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  1164LL,  v41,  v43);

        int v33 = 0LL;
        uint64_t v44 = 0LL;
        id v17 = v36;
        id v18 = v35;
        id v16 = v42;
      }

      else
      {
        int v33 = 0LL;
        uint64_t v44 = 0LL;
        id v17 = v36;
        id v18 = v35;
        id v16 = v34;
      }

      goto LABEL_54;
    }

    if (v17)
    {
      id v32 = v17;
      int v33 = sub_10010C340();
      -[NEIKEv2ChildSAConfiguration setMode:](v33, "setMode:", 2LL);
      -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v33, "setReplayWindowSize:", 4LL);
    }

    else
    {
      if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
      {
LABEL_52:
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024LL, @"ClassC %@", v15);
LABEL_53:
        int v33 = 0LL;
        uint64_t v44 = 0LL;
        goto LABEL_54;
      }

      id v32 = 0LL;
      int v33 = 0LL;
    }

    uint64_t v45 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    if (v45)
    {
      sub_100005DB0(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
      sub_100005794(v45, 6, 0);
      int v46 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
      *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0LL;
    }

    id v47 = *(id *)((char *)&self->_symptomsNOIManager + 7);
    if (v47) {
      ++v47[8];
    }

    uint64_t v48 = mach_absolute_time();
    uint64_t v49 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
    id v17 = v32;
    if (v49) {
      *(void *)(v49 + 32) = v48;
    }
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v50 = (id *)sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v15);

    if (v50)
    {
      uint64_t v44 = sub_10010C6B8(0, v50, 3LL);
      if (sub_10010CE6C(v50))
      {
        id v83 = v16;
        v51 = v18;
        id v85 = v14;
        id v52 = v50[16];
        unsigned __int8 v53 = [v52 hasCompanionDatapath];

        v84 = v17;
        if ((v53 & 1) != 0) {
          v54 = 0LL;
        }
        else {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
        }
        id v55 = sub_10010CEF4(v50, v54);
        id v89 = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89, 1LL));
        -[NEIKEv2SessionConfiguration setCustomIKEAuthPrivateNotifies:](v44, "setCustomIKEAuthPrivateNotifies:", v56);

        id v17 = v84;
        id v14 = v85;
        id v18 = v51;
        id v16 = v83;
      }

      if ((v18[2](v18, v44) & 1) != 0)
      {
        v88.receiver = self;
        v88.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
        -[NRLink invalidateIKESessionForClass:](&v88, "invalidateIKESessionForClass:", 3LL);
        -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0LL);
        self->super._peerAvailabilityCheckInProgress = 0;
        -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeListener + 7);
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v86);
        sub_100032B0C((uint64_t)self);
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016LL, @"ClassC %@", v87);

        if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
        {
          ((void (**)(void, NEIKEv2SessionConfiguration *, NEIKEv2ChildSAConfiguration *, NEVirtualInterface_s *))v21)[2]( v21,  v44,  v33,  -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_55:

          id v15 = v87;
          goto LABEL_56;
        }

        v58 = v17;
        v59 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v57);
        int v60 = _NRLogIsLevelEnabled(v59, 17LL);

        if (v60)
        {
          v62 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v61);
          id v63 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v62, 17LL, "%@: Failed to setup virtual interface", v63);
        }

        id v17 = v58;
      }

      else
      {
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021LL, @"ClassC %@", v87);
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
      uint64_t v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      id v20 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10003299C;
      v17[3] = &unk_1001AF950;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      id v14 = sub_10003295C();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17LL);

      if (IsLevelEnabled)
      {
        id v16 = sub_10003295C();
        _NRLogWithArgs(v16, 17LL, "NEIKEv2PrivateNotify init %u %@ failed", 50702LL, v4);
      }
    }
  }

  else
  {
    id v11 = sub_10003295C();
    int v12 = _NRLogIsLevelEnabled(v11, 17LL);

    if (v12)
    {
      id v13 = sub_10003295C();
      _NRLogWithArgs(v13, 17LL, "%s called with null data", "-[NRLinkWiFi sendControlData:]");
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)suspend
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
  -[NRLink suspend](&v18, "suspend");
  if (self->super._state != 255)
  {
    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9LL, @"(suspend)");
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DE28((uint64_t)companionProxyAgent, v4) & 1) != 0)
      {
        -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
      }

      else
      {
        int v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 16LL);

        if (IsLevelEnabled)
        {
          id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
          id v16 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v15,  16LL,  "%s%.30s:%-4d %@: failed to unregister companion agent",  ",  "-[NRLinkWiFi suspend]"",  1240LL,  v16);
        }
      }
    }

    -[NRLink setInterfaceRank](self, "setInterfaceRank");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v10 linkIsSuspended:self];
    goto LABEL_10;
  }

  uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  int v8 = _NRLogIsLevelEnabled(v7, 1LL);

  if (v8)
  {
    id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    id v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'",  ",  "-[NRLinkWiFi suspend]"",  1232LL,  v11);

LABEL_10:
  }

  return 1;
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    uint64_t v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    BOOL v7 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1LL);

    if (IsLevelEnabled)
    {
      id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'",  ",  "-[NRLinkWiFi resume]"",  1256LL,  v11);
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NRLinkWiFi;
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
          int v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          int v13 = _NRLogIsLevelEnabled(v12, 16LL);

          if (v13)
          {
            id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
            id v16 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v15,  16LL,  "%s%.30s:%-4d %@: failed to register companion agent",  ",  "-[NRLinkWiFi resume]"",  1267LL,  v16);
          }
        }
      }

      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8LL, @"(resume)");
      -[NRLink setInterfaceRank](self, "setInterfaceRank");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
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

- (void).cxx_destruct
{
}

@end