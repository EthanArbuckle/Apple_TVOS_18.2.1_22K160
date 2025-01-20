@interface NRLink
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)changeStateTo:(unsigned __int8)a3;
- (BOOL)changeStateTo:(unsigned __int8)a3 details:(id)a4;
- (BOOL)changeStateTo:(unsigned __int8)a3 detailsFormat:(id)a4;
- (BOOL)hasClassCPolicies;
- (BOOL)hasClassDPolicies;
- (BOOL)hasCompanionDatapath;
- (BOOL)hasRouteRulePolicy;
- (BOOL)ikeClassCEstablished;
- (BOOL)ikeClassDEstablished;
- (BOOL)isCompanionLink;
- (BOOL)isPrimary;
- (BOOL)noTransport;
- (BOOL)peerAvailabilityCheckInProgress;
- (BOOL)publishDNSConfig:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)setInterfacePeerEgressFunctionalType:(unsigned int)a3;
- (BOOL)setInterfaceRank;
- (BOOL)setInterfaceSubfamily;
- (BOOL)setNoACKPrioritization;
- (BOOL)setupVirtualInterface;
- (BOOL)shouldCreateCompanionProxyAgent;
- (BOOL)start;
- (BOOL)startRequested;
- (BOOL)suspend;
- (BOOL)suspendWhenReady;
- (NEVirtualInterface_s)virtualInterface;
- (NRCompanionProxyAgent)companionProxyAgent;
- (NRLinkDelegate)linkDelegate;
- (NSMutableArray)appSvcPolicyIDs;
- (NSMutableArray)policyIDs;
- (NSString)description;
- (NSString)localInterfaceName;
- (NSString)localToken;
- (NSString)peerToken;
- (NSString)policyIdentifierString;
- (NSUUID)nrUUID;
- (NSUUID)proxyAgentUUID;
- (NWAddressEndpoint)localOuterEndpoint;
- (NWAddressEndpoint)remoteOuterEndpoint;
- (NWNetworkAgentRegistration)proxyAgentRegistration;
- (OS_dispatch_queue)queue;
- (OS_nw_proxy_config)publishedMasqueProxyConfig;
- (double)linkTotalReadyTimeInSec;
- (id)copyDescription;
- (id)copyDescriptionInner;
- (id)copyShortDescription;
- (id)copyShortDescriptionInner;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5;
- (unint64_t)identifier;
- (unsigned)ikev2Role;
- (unsigned)linkMTU;
- (unsigned)metric;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)checkProxyAgentWithForceUpdate:(BOOL)a3;
- (void)dealloc;
- (void)invalidateIKESession:(id *)a3;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)invalidateVirtualInterface;
- (void)processIKEDisconnection:(unsigned __int8)a3 error:(id)a4;
- (void)removePolicies;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
- (void)setAppSvcPolicyIDs:(id)a3;
- (void)setHasClassCPolicies:(BOOL)a3;
- (void)setHasClassDPolicies:(BOOL)a3;
- (void)setHasRouteRulePolicy:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIkeClassCEstablished:(BOOL)a3;
- (void)setIkeClassDEstablished:(BOOL)a3;
- (void)setIkev2Role:(unsigned __int8)a3;
- (void)setInterfaceAvailability;
- (void)setIsCompanionLink:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setLinkDelegate:(id)a3;
- (void)setLinkMTU:(unsigned __int16)a3;
- (void)setLocalInterfaceName:(id)a3;
- (void)setLocalOuterEndpoint:(id)a3;
- (void)setLocalToken:(id)a3;
- (void)setNoTransport:(BOOL)a3;
- (void)setNrUUID:(id)a3;
- (void)setPeerToken:(id)a3;
- (void)setPolicyIDs:(id)a3;
- (void)setPolicyIdentifierString:(id)a3;
- (void)setPowerAssertionState:(BOOL)a3;
- (void)setProxyAgentRegistration:(id)a3;
- (void)setPublishedMasqueProxyConfig:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteOuterEndpoint:(id)a3;
- (void)setStartRequested:(BOOL)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setSubtype:(unsigned __int8)a3;
- (void)setSuspendWhenReady:(BOOL)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
- (void)unregisterProxyAgent;
- (void)updateIKEv2Role:(BOOL *)a3;
@end

@implementation NRLink

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  v9 = (dispatch_queue_s *)a3;
  v10 = (char *)a4;
  v11 = (char *)a5;
  if (!v9)
  {
    id v20 = sub_100107F78();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v20, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_22;
    }
    id v22 = sub_100107F78();
    _NRLogWithArgs(v22, 17LL, "%s called with null queue");
LABEL_21:

    v18 = 0LL;
    goto LABEL_11;
  }

  dispatch_assert_queue_V2(v9);
  if (!v10)
  {
    id v23 = sub_100107F78();
    int v24 = _NRLogIsLevelEnabled(v23, 17LL);

    if (!v24) {
      goto LABEL_22;
    }
    id v22 = sub_100107F78();
    _NRLogWithArgs(v22, 17LL, "%s called with null linkDelegate");
    goto LABEL_21;
  }

  if (!v11)
  {
    id v25 = sub_100107F78();
    int v26 = _NRLogIsLevelEnabled(v25, 17LL);

    if (v26)
    {
      id v22 = sub_100107F78();
      _NRLogWithArgs(v22, 17LL, "%s called with null nrUUID");
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  if ((_NRIsUUIDNonZero(v11) & 1) == 0)
  {
    id v27 = sub_100107F78();
    int v28 = _NRLogIsLevelEnabled(v27, 17LL);

    if (v28)
    {
      id v22 = sub_100107F78();
      _NRLogWithArgs(v22, 17LL, "called with all-zero nrUUID");
      goto LABEL_21;
    }

- (id)copyDescriptionInner
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%llu", -[NRLink identifier](self, "identifier"));
  if (-[NRLink isPrimary](self, "isPrimary")) {
    -[NSMutableString appendString:](v3, "appendString:", @", PRIMARY");
  }
  StringFromNRLinkType = (void *)createStringFromNRLinkType(-[NRLink type](self, "type"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", %@", StringFromNRLinkType);

  if (-[NRLink subtype](self, "subtype"))
  {
    ShortStringFromNRLinkSubtype = (void *)createShortStringFromNRLinkSubtype(-[NRLink subtype](self, "subtype"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"(%@)", ShortStringFromNRLinkSubtype);
  }

  v6 = sub_1001080C0(-[NRLink state](self, "state"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", %@", v6);

  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    v7 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", %@", v7);
  }

  return v3;
}

- (id)copyDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = -[NRLink copyDescriptionInner](self, "copyDescriptionInner");
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[%@]", v4);

  return v5;
}

- (NSString)description
{
  return (NSString *)-[NRLink copyDescription](self, "copyDescription");
}

- (id)copyShortDescriptionInner
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = -[NRLink isPrimary](self, "isPrimary");
  ShortStringFromNRLinkType = (void *)createShortStringFromNRLinkType(self->_type);
  unsigned int state = self->_state;
  if (state == 8) {
    v8 = @"Rdy";
  }
  else {
    v8 = (__CFString *)sub_1001080C0(state);
  }
  v9 = "";
  if (v5) {
    v9 = " P";
  }
  v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%llu%s %@ %@",  identifier,  v9,  ShortStringFromNRLinkType,  v8);

  return v10;
}

- (id)copyShortDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = -[NRLink copyShortDescriptionInner](self, "copyShortDescriptionInner");
  unsigned int v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[%@]", v4);

  return v5;
}

- (BOOL)start
{
  return 1;
}

- (BOOL)suspend
{
  return 1;
}

- (BOOL)resume
{
  if (self->_ikeClassDEstablished || self->_ikeClassCEstablished) {
    return 1;
  }
  id v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 1LL);

  if (IsLevelEnabled)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    id v8 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v7,  1LL,  "%s%.30s:%-4d %@: Class D/C not yet established. Ignoring 'resume'",  ",  "-[NRLink resume]"",  308LL,  v8);
  }

  return 0;
}

- (unsigned)metric
{
  return -1;
}

- (id)copyStatusString
{
  return (id)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
}

- (BOOL)cancelWithReason:(id)a3
{
  return 1;
}

- (BOOL)sendControlData:(id)a3
{
  return 0;
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
  id v7 = -[NRLink copyShortDescription](self, "copyShortDescription");
  sub_10011BB18(v8, a3, v7, v6);
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v8);

  -[NRLink reportEvent:details:](self, "reportEvent:details:", v4, v7);
}

- (void)reportEvent:(unsigned int)a3
{
}

- (BOOL)changeStateTo:(unsigned __int8)a3 details:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  id v7 = v6;
  switch(v4)
  {
    case 8u:
      uint64_t v8 = self;
      uint64_t v9 = 3004LL;
LABEL_7:
      -[NRLink reportEvent:details:](v8, "reportEvent:details:", v9, v7);
      goto LABEL_8;
    case 0xFFu:
      uint64_t v8 = self;
      uint64_t v9 = 3005LL;
      goto LABEL_7;
    case 9u:
      uint64_t v8 = self;
      uint64_t v9 = 3002LL;
      goto LABEL_7;
  }

  if (v6 && [v6 length])
  {
    v18 = sub_1001080C0(v4);
    -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3008LL,  @"Changing state to %@ %@",  v18,  v7);
  }

  else
  {
    v18 = sub_1001080C0(v4);
    -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3008LL,  @"Changing state to %@",  v18,  v20);
  }

LABEL_8:
  int state = self->_state;
  if (state != v4)
  {
    if (state == 8)
    {
      unint64_t linkReadyStartTime = self->_linkReadyStartTime;
      uint64_t v12 = mach_absolute_time();
      double v15 = 0.0;
      if (linkReadyStartTime)
      {
        unint64_t v16 = v12 - linkReadyStartTime;
        if (v12 > linkReadyStartTime)
        {
          if (qword_1001DC9F0 != -1)
          {
            unint64_t v19 = v12 - linkReadyStartTime;
            dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
            unint64_t v16 = v19;
          }

          LODWORD(v13) = dword_1001DC9F8;
          LODWORD(v14) = *(_DWORD *)algn_1001DC9FC;
          double v15 = (double)v16 * (0.000000001 * (double)v13) / (double)v14;
        }
      }

      self->_linkTotalReadyTimeInSec = self->_linkTotalReadyTimeInSec + v15;
    }

    if (v4 == 8)
    {
      self->_unint64_t linkReadyStartTime = mach_absolute_time();
      -[NRLink setLinkMTU:](self, "setLinkMTU:", 1400LL);
    }

    else if (v4 == 255 || v4 == 9)
    {
      -[NRLink removePolicies](self, "removePolicies");
      if (v4 == 255 && state == 8 && -[NRLink virtualInterface](self, "virtualInterface")) {
        -[NRLink setInterfaceAvailability](self, "setInterfaceAvailability");
      }
    }

    self->_int state = v4;
  }

  return state != v4;
}

- (BOOL)changeStateTo:(unsigned __int8)a3 detailsFormat:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v9);

  LOBYTE(v4) = -[NRLink changeStateTo:details:](self, "changeStateTo:details:", v4, v7);
  return v4;
}

- (BOOL)changeStateTo:(unsigned __int8)a3
{
  return -[NRLink changeStateTo:details:](self, "changeStateTo:details:", a3, 0LL);
}

- (void)setLinkMTU:(unsigned __int16)a3
{
  if (self->_linkMTU != a3 && self->_virtualInterface)
  {
    uint64_t v4 = a3;
    unsigned int v5 = (unsigned __int16 *)sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->_nrUUID);
    if (!v5 || v5[14] < 0xCu) {
      goto LABEL_12;
    }
    double v15 = v5;
    if (NEVirtualInterfaceSetMTU(self->_virtualInterface, v4))
    {
      self->_linkMTU = v4;
      id v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0LL);

      unsigned int v5 = v15;
      if (IsLevelEnabled)
      {
        v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
        id v11 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs( v10,  0LL,  "%s%.30s:%-4d %@: Successfully updated interface mtu to %u",  ",  "-[NRLink setLinkMTU:]"",  444LL,  v11,  self->_linkMTU);
LABEL_11:

        unsigned int v5 = v15;
      }
    }

    else
    {
      uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      int v13 = _NRLogIsLevelEnabled(v12, 17LL);

      unsigned int v5 = v15;
      if (v13)
      {
        v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        id v11 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v10, 17LL, "%@: Failed to update interface mtu to %u", v11, self->_linkMTU);
        goto LABEL_11;
      }
    }

- (void)dealloc
{
  v3 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    uint64_t v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    id v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v6, 0LL, "%s%.30s:%-4d %@: Dealloc", ", "-[NRLink dealloc]"", 482LL, v7);
  }

  -[NRLink invalidateLink](self, "invalidateLink");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NRLink;
  -[NRLink dealloc](&v8, "dealloc");
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)processIKEDisconnection:(unsigned __int8)a3 error:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v6)
  {
    int state = self->_state;
    if (state == 8 || state == 9 && self->_type == 1)
    {
      uint64_t v8 = NEIKEv2ErrorDomain;
      id v16 = v6;
      BOOL v9 = [v6 code] == (id)3;
      v10 = v16;
      if (v9)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
        unsigned __int8 v12 = [v11 isEqualToString:v8];

        v10 = v16;
        if ((v12 & 1) != 0) {
          goto LABEL_10;
        }
      }

      id String = v10;
      if ([String code] != (id)4)
      {
LABEL_11:

        id v6 = v16;
        goto LABEL_12;
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([String domain]);
      unsigned int v15 = [v14 isEqualToString:v8];

      id v6 = v16;
      if (v15)
      {
LABEL_10:
        id String = (id)NRDataProtectionClassCreateString(v4);
        -[NRLink cancelWithReason:]( self,  "cancelWithReason:",  @"%@ session disconnected due to no response from peer",  String);
        goto LABEL_11;
      }
    }
  }

- (void)setIsCompanionLink:(BOOL)a3
{
  self->_isCompanionLink = a3;
}

- (BOOL)setInterfaceRank
{
  if (-[NRLink state](self, "state") != 9)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    uint64_t v5 = (id *)sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v4);

    if (!v5)
    {
      id v18 = sub_100107F78();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 16LL);

      if (IsLevelEnabled)
      {
        id v20 = sub_100107F78();
        _NRLogWithArgs( v20,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLink setInterfaceRank]"",  536);
      }

      uint64_t v21 = _os_log_pack_size(12LL);
      id v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      id v23 = __error();
      uint64_t v24 = _os_log_pack_fill( v22,  v21,  *v23,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
      *(_DWORD *)uint64_t v24 = 136446210;
      *(void *)(v24 + 4) = "-[NRLink setInterfaceRank]";
      id v25 = sub_100107F78();
      _NRLogAbortWithPack(v25, v22);
    }

    id v6 = v5[16];

    if (!v6)
    {
      BOOL v3 = 0;
LABEL_17:

      return v3;
    }

    id v7 = v5[16];
    unsigned int v8 = [v7 requiresReachability];

    unsigned int v9 = -[NRLink isCompanionLink](self, "isCompanionLink");
    unsigned int v10 = v9;
    if (v8)
    {
      id v11 = -[NRLink virtualInterface](self, "virtualInterface");
      if (!v10)
      {
        int v12 = NEVirtualInterfaceSetRankPrimaryEligible(v11, 1LL);
LABEL_16:
        BOOL v3 = v12 != 0;
        goto LABEL_17;
      }

- (BOOL)shouldCreateCompanionProxyAgent
{
  v2 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->_nrUUID);
  if (!v2)
  {
    id v6 = sub_100107F78();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 16LL);

    if (IsLevelEnabled)
    {
      id v8 = sub_100107F78();
      _NRLogWithArgs( v8,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLink shouldCreateCompanionProxyAgent]"",  580);
    }

    uint64_t v9 = _os_log_pack_size(12LL);
    unsigned int v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v11 = __error();
    uint64_t v12 = _os_log_pack_fill( v10,  v9,  *v11,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "-[NRLink shouldCreateCompanionProxyAgent]";
    id v13 = sub_100107F78();
    _NRLogAbortWithPack(v13, v10);
  }

  BOOL v3 = v2;
  unsigned __int8 v4 = sub_100107FE8(v2);

  return v4;
}

- (void)setIkeClassCEstablished:(BOOL)a3
{
  if (self->_ikeClassCEstablished != a3)
  {
    self->_ikeClassCEstablished = a3;
    if (self->_isPrimary && a3)
    {
      unint64_t ikeClassDEstablishedTime = self->_ikeClassDEstablishedTime;
      uint64_t v6 = mach_absolute_time();
      if (ikeClassDEstablishedTime)
      {
        BOOL v10 = v6 >= ikeClassDEstablishedTime;
        unint64_t v11 = v6 - ikeClassDEstablishedTime;
        if (v11 != 0 && v10)
        {
          if (qword_1001DC9F0 != -1) {
            dispatch_once(&qword_1001DC9F0, &stru_1001AFB98);
          }
          LODWORD(v8) = dword_1001DC9F8;
          LODWORD(v9) = *(_DWORD *)algn_1001DC9FC;
          if ((double)v11 * (0.000000001 * (double)v8) / (double)v9 > 1.0)
          {
            uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
            int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0LL);

            if (IsLevelEnabled)
            {
              unsigned int v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
              id v16 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs( v15,  0LL,  "%s%.30s:%-4d %@: setting interface availability for classC connect event",  ",  "-[NRLink setIkeClassCEstablished:]"",  596LL,  v16);
            }

            objc_opt_self(&OBJC_CLASS___NRLinkDirector);
            if (qword_1001DC878 != -1) {
              dispatch_once(&qword_1001DC878, &stru_1001AEED0);
            }
            id v23 = (id *)(id)qword_1001DC870;
            unint64_t v17 = self->_nrUUID;
            if (!v23) {
              goto LABEL_21;
            }
            id v18 = sub_100146AFC();
            dispatch_assert_queue_V2((dispatch_queue_t)v18);

            if (v17)
            {
              unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v23[27] objectForKeyedSubscript:v17]);

              if (!v19)
              {
LABEL_21:

                return;
              }

              id v20 = (id)objc_claimAutoreleasedReturnValue([v23[27] objectForKeyedSubscript:v17]);
              sub_1000E3500((uint64_t)v20);
            }

            else
            {
              id v21 = sub_1000A2100();
              int v22 = _NRLogIsLevelEnabled(v21, 17LL);

              if (!v22) {
                goto LABEL_21;
              }
              id v20 = sub_1000A2100();
              _NRLogWithArgs( v20,  17LL,  "%s called with null nrUUID",  "-[NRLinkDirector setInterfaceAvailabilityForCatchAllInterface:]");
            }

            goto LABEL_21;
          }
        }
      }
    }
  }

- (void)setIkeClassDEstablished:(BOOL)a3
{
  if (self->_ikeClassDEstablished != a3)
  {
    self->_ikeClassDEstablished = a3;
    if (a3) {
      uint64_t v4 = mach_absolute_time();
    }
    else {
      uint64_t v4 = 0LL;
    }
    self->_unint64_t ikeClassDEstablishedTime = v4;
  }

- (void)setInterfaceAvailability
{
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    id v8 = (id)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    sub_100103A54(v8);
  }

  else
  {
    uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 17LL);

    if (!IsLevelEnabled) {
      return;
    }
    id v8 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    id v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v8, 17LL, "%@: Attempting to set interface availability on a link with no interface", v7);
  }
}

- (BOOL)setInterfaceSubfamily
{
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    uint64_t v4 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    unsigned int v5 = -[NRLink type](self, "type");
    if (v5 > 5) {
      int v6 = 2;
    }
    else {
      int v6 = dword_100156920[v5];
    }
    char v11 = sub_100101EE8(v4, v6);
  }

  else
  {
    id v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 17LL);

    if (!IsLevelEnabled) {
      return 0;
    }
    uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    id v10 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v4, 17LL, "%@: No interface to set interface sub-family", v10);

    char v11 = 0;
  }

  return v11;
}

- (BOOL)setInterfacePeerEgressFunctionalType:(unsigned int)a3
{
  uint64_t v3 = *(const char **)&a3;
  if (!-[NRLink virtualInterface](self, "virtualInterface"))
  {
    id v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      int v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v6, 17LL, "%@: No interface to set interface sub-family", v11);
LABEL_8:

      BOOL v7 = 0;
      goto LABEL_9;
    }

    return 0;
  }

  if (!(_DWORD)v3)
  {
    uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    int v13 = _NRLogIsLevelEnabled(v12, 1LL);

    if (v13)
    {
      int v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v6,  1LL,  "%s%.30s:%-4d %@: Unsupported link type in trying to set the peer egress type.",  ",  "-[NRLink setInterfacePeerEgressFunctionalType:]"",  652LL,  v11);
      goto LABEL_8;
    }

    return 0;
  }

  int v6 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
  BOOL v7 = sub_1001022B8(v6, v3);
LABEL_9:

  return v7;
}

- (BOOL)setNoACKPrioritization
{
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    uint64_t v4 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    char v5 = sub_100102728(v4);
  }

  else
  {
    int v6 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v3);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 17LL);

    if (!IsLevelEnabled) {
      return 0;
    }
    uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v8);
    id v9 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v4, 17LL, "%@: No interface to set interface no ack prioritization", v9);

    char v5 = 0;
  }

  return v5;
}

- (void)setPowerAssertionState:(BOOL)a3
{
  if (a3)
  {
    if (!self || !self->_powerAssertion)
    {
      uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
      char v5 = (objc_class *)objc_opt_class(self);
      int v6 = NSStringFromClass(v5);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      AssertionName = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@:[%llu]",  v7,  -[NRLink identifier](self, "identifier"));

      uint64_t v8 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, AssertionName, &self->_powerAssertion);
      uint64_t v10 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      id v11 = (void *)v10;
      if ((_DWORD)v8)
      {
        int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17LL);

        if (IsLevelEnabled)
        {
          uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v13);
          id v15 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v14, 17LL, "%@: Failed to take power assertion: %d", v15, v8);
        }

        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3301LL, @"Error: %d", v8);
        self->_IOPMAssertionID powerAssertion = 0;
      }

      else
      {
        int v29 = _NRLogIsLevelEnabled(v10, 0LL);

        if (v29)
        {
          id v31 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v30);
          id v32 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v31,  0LL,  "%s%.30s:%-4d %@: Successfully took power assertion",  ",  "-[NRLink setPowerAssertionState:]"",  697LL,  v32);
        }

        -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3300LL,  @"id: %u",  self->_powerAssertion);
      }
    }
  }

  else if (self)
  {
    IOPMAssertionID powerAssertion = self->_powerAssertion;
    if (powerAssertion)
    {
      uint64_t v17 = IOPMAssertionRelease(powerAssertion);
      uint64_t v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v18);
      id v20 = (void *)v19;
      if ((_DWORD)v17)
      {
        int v21 = _NRLogIsLevelEnabled(v19, 17LL);

        if (v21)
        {
          id v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          id v24 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v23, 17LL, "%@: Failed to release power assertion: %d", v24, v17);
        }

        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3303LL, @"Error: %d", v17);
      }

      else
      {
        int v25 = _NRLogIsLevelEnabled(v19, 0LL);

        if (v25)
        {
          id v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v26);
          id v28 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v27,  0LL,  "%s%.30s:%-4d %@: Successfully released power assertion",  ",  "-[NRLink setPowerAssertionState:]"",  710LL,  v28);
        }

        -[NRLink reportEvent:detailsFormat:]( self,  "reportEvent:detailsFormat:",  3302LL,  @"id: %u",  self->_powerAssertion);
      }

      self->_IOPMAssertionID powerAssertion = 0;
    }
  }

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 1LL);

  if (IsLevelEnabled)
  {
    id v8 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    id v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v8,  1LL,  "%s%.30s:%-4d %@: peer availability check is unsupported",  ",  "-[NRLink checkPeerAvailabilityWithForceAggressive:]"",  720LL,  v7);
  }

- (BOOL)publishDNSConfig:(id)a3
{
  id v4 = a3;
  if (-[NRLink virtualInterface](self, "virtualInterface") && -[NRLink state](self, "state") == 8)
  {
    char v5 = -[NRLink virtualInterface](self, "virtualInterface");
    uint64_t v6 = v5;
    if (v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
      uint64_t v12 = v7;
      NEVirtualInterfaceSetDNSServers( v6,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

      id v8 = -[NRLink virtualInterface](self, "virtualInterface");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);
      NEVirtualInterfaceSetDNSPort(v8, [v9 intValue]);
    }

    else
    {
      NEVirtualInterfaceSetDNSServers(v5, 0LL);
      NEVirtualInterfaceSetDNSPort(-[NRLink virtualInterface](self, "virtualInterface"), 0LL);
    }

    NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface"));
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateIKEv2Role:(BOOL *)a3
{
  id v27 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->_nrUUID);
  -[NRLink setIkev2Role:](self, "setIkev2Role:", sub_100107E48(v27));
  unsigned int v5 = -[NRLink ikev2Role](self, "ikev2Role");
  unsigned int v6 = -[NRLink ikev2Role](self, "ikev2Role");
  BOOL v7 = v6 == 1;
  if (v5 != 2 && v6 != 1)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
    if (v8
      && (uint64_t v9 = (void *)v8,
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken")),
          v10,
          v9,
          v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken"));
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
    }

    else
    {
      if (v27) {
        uint64_t v13 = (void *)*((void *)v27 + 6);
      }
      else {
        uint64_t v13 = 0LL;
      }
      id v14 = v13;

      if (!v14)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
        uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID(v20, v21);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v22, 17LL);

        if (IsLevelEnabled)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
          uint64_t v26 = (void *)_NRCopyLogObjectForNRUUID(v24, v25);
          _NRLogWithArgs(v26, 17LL, "failed to determine ikev2 role");
        }

        unsigned __int8 v19 = 1;
        BOOL v7 = 1;
        goto LABEL_20;
      }

      objc_opt_self(&OBJC_CLASS___NRLinkDirector);
      if (qword_1001DC878 != -1) {
        dispatch_once(&qword_1001DC878, &stru_1001AEED0);
      }
      id v15 = (id)qword_1001DC870;
      id v11 = sub_1000AFCFC(v15, 0LL);

      if (v27) {
        id v16 = (void *)*((void *)v27 + 6);
      }
      else {
        id v16 = 0LL;
      }
      id v12 = v16;
    }

    uint64_t v17 = v12;
    id v18 = [v11 compare:v12];

    BOOL v7 = v18 == (id)-1LL;
    if (v18 == (id)-1LL) {
      unsigned __int8 v19 = 1;
    }
    else {
      unsigned __int8 v19 = 2;
    }
LABEL_20:
    -[NRLink setIkev2Role:](self, "setIkev2Role:", v19);
  }

  if (a3) {
    *a3 = v7;
  }
}

- (void)removePolicies
{
  policyIDs = self->_policyIDs;
  if (!policyIDs || !-[NSMutableArray count](policyIDs, "count"))
  {
    id v20 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v20, 0LL);

    if (!IsLevelEnabled) {
      return;
    }
    id v39 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
    id v23 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v39, 0LL, "%s%.30s:%-4d %@: No policies to remove", ", "-[NRLink removePolicies]"", 815LL, v23);
    goto LABEL_22;
  }

  if (!self->_policyIdentifierString)
  {
    uint64_t v35 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    int v36 = _NRLogIsLevelEnabled(v35, 17LL);

    if (!v36) {
      return;
    }
    id v39 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v37);
    id v23 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v39, 17LL, "%@: Invalid policy identifier string", v23);
LABEL_22:

    return;
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v4 = self->_policyIDs;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if ([v9 unsignedIntegerValue])
        {
          objc_opt_self(&OBJC_CLASS___NRDPolicySessionManager);
          if (qword_1001DCB60 != -1) {
            dispatch_once(&qword_1001DCB60, &stru_1001B0538);
          }
          id v11 = (id)qword_1001DCB58;
          sub_100120F60((uint64_t)v11, self->_policyIdentifierString, v9);
          goto LABEL_12;
        }

        id v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
        int v13 = _NRLogIsLevelEnabled(v12, 16LL);

        if (v13)
        {
          id v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
          id v16 = -[NRLink copyDescription](self, "copyDescription");
          v38 = "";
          _NRLogWithArgs(v15, 16LL, "%s%.30s:%-4d %@: found invalid policyID %@ with session %@");
        }

        uint64_t v17 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        int v18 = _NRLogIsLevelEnabled(v17, 17LL);

        if (v18)
        {
          id v11 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v19);
          v38 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v11, 17LL, "%@: Found invalid policyID %@");

LABEL_12:
          continue;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v40,  v44,  16LL);
    }

    while (v6);
  }

  objc_opt_self(&OBJC_CLASS___NRDPolicySessionManager);
  if (qword_1001DCB60 != -1) {
    dispatch_once(&qword_1001DCB60, &stru_1001B0538);
  }
  id v24 = (id)qword_1001DCB58;
  uint64_t v25 = (id *)v24;
  if (v24)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v24 + 1));
    if (([v25[2] apply] & 1) == 0) {
      sub_1001030D0( @"NRPolicySessionManager",  @"ApplyPolicy Failed",  0LL,  1,  @"Failed to apply policies",  v26,  v27,  v28,  (uint64_t)v38);
    }
  }

  -[NSMutableArray removeAllObjects](self->_policyIDs, "removeAllObjects");
  *(_WORD *)&self->_hasRouteRulePolicy = 0;
  self->_hasClassDPolicies = 0;
  uint64_t v30 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
  int v31 = _NRLogIsLevelEnabled(v30, 0LL);

  if (v31)
  {
    uint64_t v33 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v32);
    id v34 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v33, 0LL, "%s%.30s:%-4d %@: Removed all policies", ", "-[NRLink removePolicies]"", 813LL, v34);
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)ikeClassCEstablished
{
  return self->_ikeClassCEstablished;
}

- (BOOL)ikeClassDEstablished
{
  return self->_ikeClassDEstablished;
}

- (double)linkTotalReadyTimeInSec
{
  return self->_linkTotalReadyTimeInSec;
}

- (BOOL)peerAvailabilityCheckInProgress
{
  return self->_peerAvailabilityCheckInProgress;
}

- (BOOL)isCompanionLink
{
  return self->_isCompanionLink;
}

- (NSString)peerToken
{
  return self->_peerToken;
}

- (void)setPeerToken:(id)a3
{
}

- (NSString)localToken
{
  return self->_localToken;
}

- (void)setLocalToken:(id)a3
{
}

- (unsigned)ikev2Role
{
  return self->_ikev2Role;
}

- (BOOL)hasCompanionDatapath
{
  return self->_hasCompanionDatapath;
}

- (NSString)localInterfaceName
{
  return self->_localInterfaceName;
}

- (NWAddressEndpoint)localOuterEndpoint
{
  return self->_localOuterEndpoint;
}

- (NWAddressEndpoint)remoteOuterEndpoint
{
  return self->_remoteOuterEndpoint;
}

- (BOOL)noTransport
{
  return self->_noTransport;
}

- (void)setNoTransport:(BOOL)a3
{
  self->_noTransport = a3;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)suspendWhenReady
{
  return self->_suspendWhenReady;
}

- (void)setSuspendWhenReady:(BOOL)a3
{
  self->_suspendWhenReady = a3;
}

- (BOOL)hasRouteRulePolicy
{
  return self->_hasRouteRulePolicy;
}

- (void)setHasRouteRulePolicy:(BOOL)a3
{
  self->_hasRouteRulePolicy = a3;
}

- (BOOL)hasClassCPolicies
{
  return self->_hasClassCPolicies;
}

- (void)setHasClassCPolicies:(BOOL)a3
{
  self->_hasClassCPolicies = a3;
}

- (BOOL)hasClassDPolicies
{
  return self->_hasClassDPolicies;
}

- (void)setHasClassDPolicies:(BOOL)a3
{
  self->_hasClassDPolicies = a3;
}

- (NWNetworkAgentRegistration)proxyAgentRegistration
{
  return self->_proxyAgentRegistration;
}

- (void)setProxyAgentRegistration:(id)a3
{
}

- (OS_nw_proxy_config)publishedMasqueProxyConfig
{
  return self->_publishedMasqueProxyConfig;
}

- (void)setPublishedMasqueProxyConfig:(id)a3
{
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (NSMutableArray)policyIDs
{
  return self->_policyIDs;
}

- (void)setPolicyIDs:(id)a3
{
}

- (NSMutableArray)appSvcPolicyIDs
{
  return self->_appSvcPolicyIDs;
}

- (void)setAppSvcPolicyIDs:(id)a3
{
}

- (NSString)policyIdentifierString
{
  return self->_policyIdentifierString;
}

- (void)setPolicyIdentifierString:(id)a3
{
}

- (BOOL)startRequested
{
  return self->_startRequested;
}

- (unsigned)linkMTU
{
  return self->_linkMTU;
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (NRLinkDelegate)linkDelegate
{
  return (NRLinkDelegate *)objc_loadWeakRetained((id *)&self->_linkDelegate);
}

- (NRCompanionProxyAgent)companionProxyAgent
{
  return self->_companionProxyAgent;
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (void).cxx_destruct
{
}

- (void)setLocalOuterEndpoint:(id)a3
{
}

- (void)setRemoteOuterEndpoint:(id)a3
{
}

- (void)setLocalInterfaceName:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setState:(unsigned __int8)a3
{
  self->_int state = a3;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (void)setNrUUID:(id)a3
{
}

- (void)setStartRequested:(BOOL)a3
{
  self->_startRequested = a3;
}

- (void)setLinkDelegate:(id)a3
{
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (void)setIkev2Role:(unsigned __int8)a3
{
  self->_ikev2Role = a3;
}

- (void)invalidateLink
{
  *(_WORD *)&self->_ikeClassCEstablished = 0;
  -[NRLink unregisterProxyAgent](self, "unregisterProxyAgent");
  -[NRLink setPowerAssertionState:](self, "setPowerAssertionState:", 0LL);
  objc_opt_self(&OBJC_CLASS___NRIKEv2Listener);
  if (qword_1001DC640 != -1) {
    dispatch_once(&qword_1001DC640, &stru_1001ADE98);
  }
  uint64_t v3 = (id *)(id)qword_1001DC638;
  id v4 = self;
  if (!v3) {
    goto LABEL_24;
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = v3[3];
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v6)
  {
    id v16 = v5;
    goto LABEL_23;
  }

  id v7 = v6;
  uint64_t v32 = v4;
  uint64_t v8 = *(void *)v38;
LABEL_7:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v38 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3[3], "objectForKeyedSubscript:", v10, v32));
    id v12 = (void *)v11;
    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v13 = (uint64_t)v3;
    id v14 = *(id *)(v11 + 24);
    id v15 = [v14 identifier];
    if (v15 == (id)-[NRLink identifier](v32, "identifier")) {
      break;
    }

    uint64_t v3 = (id *)v13;
LABEL_9:

    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v7) {
        goto LABEL_7;
      }
      id v16 = v5;
      id v4 = v32;
      goto LABEL_23;
    }
  }

  id v16 = v10;

  id v4 = v32;
  uint64_t v3 = (id *)v13;
  if (!v16) {
    goto LABEL_24;
  }
  [*(id *)(v13 + 24) setObject:0 forKeyedSubscript:v16];
  if (qword_1001DC650 != -1) {
    dispatch_once(&qword_1001DC650, &stru_1001ADF08);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC648, 0LL))
  {
    if (qword_1001DC650 != -1) {
      dispatch_once(&qword_1001DC650, &stru_1001ADF08);
    }
    _NRLogWithArgs( qword_1001DC648,  0LL,  "%s%.30s:%-4d Successfully un-registered link %@",  ",  "-[NRIKEv2Listener unregisterLink:]"",  465LL,  v32);
  }

  sub_10000E3B8(v13);
LABEL_23:

LABEL_24:
  if (-[NRLink virtualInterface](v4, "virtualInterface"))
  {
    uint64_t v17 = NEVirtualInterfaceCopyName(-[NRLink virtualInterface](v4, "virtualInterface"));
    if (v17)
    {
      int v18 = (char *)v17;
      p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
      if (qword_1001DCAC8 == -1) {
        goto LABEL_27;
      }
    }

    else
    {
      id v26 = sub_100107F78();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v26, 16LL);

      if (IsLevelEnabled)
      {
        id v28 = sub_100107F78();
        _NRLogWithArgs( v28,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (interfaceName) != ((void *)0)",  ",  "-[NRLink(NRLinkProtected) invalidateLink]"",  912);
      }

      p_class_meths = (__objc2_meth_list **)_os_log_pack_size(12LL);
      int v18 = (char *)&v33[-1] - ((__chkstk_darwin(p_class_meths) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v29 = __error();
      uint64_t v30 = _os_log_pack_fill( v18,  p_class_meths,  *v29,  &_mh_execute_header,  "%{public}s Assertion Failed: (interfaceName) != ((void *)0)");
      *(_DWORD *)uint64_t v30 = 136446210;
      *(void *)(v30 + 4) = "-[NRLink(NRLinkProtected) invalidateLink]";
      id v31 = sub_100107F78();
      _NRLogAbortWithPack(v31, v18);
    }

    dispatch_once(&qword_1001DCAC8, &stru_1001AFE40);
LABEL_27:
    if (_NRLogIsLevelEnabled(qword_1001DCAC0, 1LL))
    {
      if (p_class_meths[345] != (__objc2_meth_list *)-1LL) {
        dispatch_once(&qword_1001DCAC8, &stru_1001AFE40);
      }
      _NRLogWithArgs( qword_1001DCAC0,  1LL,  "%s%.30s:%-4d Attempting to start interface leak monitor for %@",  ",  "-[NRLink(NRLinkProtected) invalidateLink]"",  914LL,  v18);
    }

    id v20 = sub_100102AF8(v18);
    if (v20)
    {
      id v21 = [(id)objc_opt_class(v4) description];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      dispatch_time_t v23 = dispatch_time(0LL, 5000000000LL);
      id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](v4, "queue"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10010B6C8;
      v33[3] = &unk_1001B0748;
      id v34 = v18;
      uint64_t v35 = v20;
      id v36 = v22;
      id v25 = v22;
      dispatch_after(v23, v24, v33);
    }
  }

- (void)invalidateVirtualInterface
{
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    CFRelease(-[NRLink virtualInterface](self, "virtualInterface"));
    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", 0LL);
  }

- (void)invalidateIKESession:(id *)a3
{
  if (*a3)
  {
    id v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0LL);

    if (IsLevelEnabled)
    {
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      id v9 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v8,  0LL,  "%s%.30s:%-4d %@: Invalidating IKE Session %@",  ",  "-[NRLink(NRLinkProtected) invalidateIKESession:]"",  953LL,  v9,  *a3);
    }

    objc_initWeak(&location, *a3);
    id v10 = [(id)objc_opt_class(self) description];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10010B608;
    block[3] = &unk_1001B0798;
    objc_copyWeak(&v18, &location);
    id v14 = v11;
    id v17 = v14;
    dispatch_after(v12, v13, block);

    [*a3 setStateUpdateBlock:0];
    [*a3 setChildStateUpdateBlock:0];
    [*a3 setConfigurationUpdateBlock:0];
    [*a3 setTrafficSelectorUpdateBlock:0];
    [*a3 setAdditionalAddressesUpdateBlock:0];
    [*a3 setShortDPDEventBlock:0];
    [*a3 setRedirectEventBlock:0];
    [*a3 setPrivateNotifyStatusEvent:0];
    [*a3 disconnect];
    [*a3 invalidate];
    id v15 = *a3;
    *a3 = 0LL;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  if (a3 == 3)
  {
    -[NRLink setIkeClassCEstablished:](self, "setIkeClassCEstablished:", 0LL);
  }

  else if (a3 == 4)
  {
    -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0LL);
  }

- (void)unregisterProxyAgent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink proxyAgentRegistration](self, "proxyAgentRegistration"));
    [v4 unregisterNetworkAgent];

    -[NRLink setProxyAgentRegistration:](self, "setProxyAgentRegistration:", 0LL);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink publishedMasqueProxyConfig](self, "publishedMasqueProxyConfig"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink publishedMasqueProxyConfig](self, "publishedMasqueProxyConfig"));
    nw_proxy_config_unpublish(v6);

    -[NRLink setPublishedMasqueProxyConfig:](self, "setPublishedMasqueProxyConfig:", 0LL);
  }

  proxyAgentUUID = self->_proxyAgentUUID;
  self->_proxyAgentUUID = 0LL;
}

- (BOOL)setupVirtualInterface
{
  if (!-[NRLink virtualInterface](self, "virtualInterface")
    && -[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    -[NRLink setVirtualInterface:](self, "setVirtualInterface:", sub_10010B160(v3));

    if (!-[NRLink virtualInterface](self, "virtualInterface"))
    {
      uint64_t v29 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v29, 16LL);

      if (!IsLevelEnabled) {
        return 0;
      }
      id v9 = (char *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v31);
      id v32 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v9,  16LL,  "%s%.30s:%-4d %@: failed to setup interface",  ",  "-[NRLink(NRLinkProtected) setupVirtualInterface]"",  1009LL,  v32);

      goto LABEL_51;
    }

    if (-[NRLink setInterfaceSubfamily](self, "setInterfaceSubfamily"))
    {
      if (-[NRLink setNoACKPrioritization](self, "setNoACKPrioritization"))
      {
        if (-[NRLink setInterfaceRank](self, "setInterfaceRank"))
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
          id v9 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v8);

          if (!v9)
          {
            id v78 = sub_100107F78();
            int v79 = _NRLogIsLevelEnabled(v78, 16LL);

            if (v79)
            {
              id v80 = sub_100107F78();
              _NRLogWithArgs( v80,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLink(NRLinkProtected) setupVirtualInterface]"",  1030);
            }

            uint64_t v81 = _os_log_pack_size(12LL);
            v82 = (char *)&v86 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            v83 = __error();
            uint64_t v84 = _os_log_pack_fill( v82,  v81,  *v83,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
            *(_DWORD *)uint64_t v84 = 136446210;
            *(void *)(v84 + 4) = "-[NRLink(NRLinkProtected) setupVirtualInterface]";
            id v85 = sub_100107F78();
            _NRLogAbortWithPack(v85, v82);
          }

          id v10 = -[NRLink virtualInterface](self, "virtualInterface");
          uint64_t v11 = (void *)sub_100136CA4(v9);
          LODWORD(v10) = NEVirtualInterfaceAddAddress(v10, v11, @"ffff:ffff:ffff:ffff::");

          if ((_DWORD)v10)
          {
            uint64_t v13 = -[NRLink virtualInterface](self, "virtualInterface");
            id v14 = (void *)sub_100136D08(v9);
            LODWORD(v13) = NEVirtualInterfaceAddAddress(v13, v14, @"ffff:ffff:ffff:ffff::");

            if ((_DWORD)v13)
            {
              id v16 = -[NRLink virtualInterface](self, "virtualInterface");
              id v17 = (void *)sub_100137014(v9);
              LODWORD(v16) = NEVirtualInterfaceAddAddress(v16, v17, @"ffff:ffff:ffff:ffff::");

              if ((_DWORD)v16)
              {
                if (NEVirtualInterfaceAddAddress( -[NRLink virtualInterface](self, "virtualInterface"),  @"192.0.0.6",  @"255.255.255.255"))
                {
                  id v20 = -[NRLink virtualInterface](self, "virtualInterface");
                  id v21 = (void *)sub_100136D6C(v9);
                  LODWORD(v20) = NEVirtualInterfaceAddIPv6Route(v20, v21, &off_1001BC808, 0LL, 0LL);

                  if ((_DWORD)v20)
                  {
                    dispatch_time_t v23 = -[NRLink virtualInterface](self, "virtualInterface");
                    id v24 = (void *)sub_100136DD0(v9);
                    LODWORD(v23) = NEVirtualInterfaceAddIPv6Route(v23, v24, &off_1001BC808, 0LL, 0LL);

                    if ((_DWORD)v23)
                    {
                      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NRLinkFixedInterface);
                      if ((objc_opt_isKindOfClass(self, v26) & 1) != 0)
                      {
                        uint64_t v27 = -[NRLink virtualInterface](self, "virtualInterface");
                        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
                        NEVirtualInterfaceSetDelegateInterface(v27, v28);

                        NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1LL);
                      }

                      else if (-[NRLink type](self, "type") == 5)
                      {
                        v65 = -[NRLink virtualInterface](self, "virtualInterface");
                        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
                        NEVirtualInterfaceSetDelegateInterface(v65, v66);
                      }

                      if (NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface")))
                      {
                        v68 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
                        v70 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v69);
                        int v71 = _NRLogIsLevelEnabled(v70, 0LL);

                        if (v71)
                        {
                          v73 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v72);
                          id v74 = -[NRLink copyDescription](self, "copyDescription");
                          _NRLogWithArgs( v73,  0LL,  "%s%.30s:%-4d %@: Created virtual interface %@",  ",  "-[NRLink(NRLinkProtected) setupVirtualInterface]"",  1074LL,  v74,  v68);
                        }

                        goto LABEL_45;
                      }

                      v75 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v67);
                      int v76 = _NRLogIsLevelEnabled(v75, 17LL);

                      if (!v76) {
                        goto LABEL_50;
                      }
                      v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v77);
                      id v49 = -[NRLink copyDescription](self, "copyDescription");
                      _NRLogWithArgs(v48, 17LL, "%@: failed to update ad-hoc service", v49);
                      goto LABEL_49;
                    }

                    v62 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
                    int v63 = _NRLogIsLevelEnabled(v62, 17LL);

                    if (v63)
                    {
                      v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v64);
                      id v49 = -[NRLink copyDescription](self, "copyDescription");
                      _NRLogWithArgs(v48, 17LL, "%@: failed to add ClassC route", v49);
                      goto LABEL_49;
                    }

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  uint64_t v5 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->_nrUUID);
  if (!v5)
  {
    id v28 = sub_100107F78();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16LL);

    if (IsLevelEnabled)
    {
      id v30 = sub_100107F78();
      _NRLogWithArgs( v30,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLink(NRLinkProtected) checkProxyAgentWithForceUpdate:]"",  1093);
    }

    uint64_t v31 = _os_log_pack_size(12LL);
    id v32 = (char *)&v36 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = __error();
    uint64_t v34 = _os_log_pack_fill( v32,  v31,  *v33,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)uint64_t v34 = 136446210;
    *(void *)(v34 + 4) = "-[NRLink(NRLinkProtected) checkProxyAgentWithForceUpdate:]";
    id v35 = sub_100107F78();
    _NRLogAbortWithPack(v35, v32);
  }

  uint64_t v6 = (id *)v5;
  if (a3) {
    goto LABEL_26;
  }
  uint64_t v7 = self->_usedProxyNotifyPayload;
  uint64_t v8 = (NSData *)v6[12];
  if (v7 == v8)
  {

    goto LABEL_20;
  }

  id v9 = v8;
  id v10 = self->_usedProxyNotifyPayload;
  id v11 = v6[12];
  unsigned __int8 v12 = -[NSData isEqual:](v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_26:
    id v13 = v6[16];
    id v14 = [v13 proxyCapability];

    if (v14 == (id)2)
    {
      -[NRLink unregisterProxyAgent](self, "unregisterProxyAgent");
      objc_storeStrong((id *)&self->_usedProxyNotifyPayload, v6[12]);
      if (self->_usedProxyNotifyPayload)
      {
        id v37 = 0LL;
        id v38 = 0LL;
        id v36 = 0LL;
        if (-[NRLink virtualInterface](self, "virtualInterface"))
        {
          uint64_t v15 = NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
        }

        else
        {
          if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
          {
            id v16 = 0LL;
LABEL_14:
            id v17 = self->_usedProxyNotifyPayload;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
            char v19 = sub_10010961C(v6, v17, v16, &v37, &v38, &v36, v18);

            if ((v19 & 1) != 0)
            {
              id v20 = v37;
              -[NRLink setProxyAgentRegistration:](self, "setProxyAgentRegistration:", v37);
              id v21 = v38;
              objc_storeStrong((id *)&self->_proxyAgentUUID, v38);
              -[NRLink setPublishedMasqueProxyConfig:](self, "setPublishedMasqueProxyConfig:", v36);
              if (v36)
              {
                id v22 = v6[16];
                unsigned __int8 v23 = [v22 hasPoliciesForProxyCriteria];

                if ((v23 & 1) == 0)
                {
                  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink policyIdentifierString](self, "policyIdentifierString"));
                  uint64_t v25 = sub_10010AA54(v21, v16, v24);
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink policyIDs](self, "policyIDs"));
                  [v27 addObjectsFromArray:v26];
                }
              }
            }

            else
            {
              -[NRLink cancelWithReason:](self, "cancelWithReason:", @"Failed to configure proxy agent");
              id v20 = v37;
              id v21 = v38;
            }

            goto LABEL_20;
          }

          uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
        }

        id v16 = (void *)v15;
        goto LABEL_14;
      }
    }
  }

@end