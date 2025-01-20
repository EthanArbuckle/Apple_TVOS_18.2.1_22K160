@interface NRDDeviceConductor
- (BOOL)preferWiFiP2PRequestUpdated;
- (BOOL)preferWiFiRequestAvailable;
- (BOOL)preferWiFiRequestUnavailable;
- (NSString)description;
- (void)apsIsConnected:(BOOL)a3;
- (void)deviceHasBTLinkUpgradeRequest:(BOOL)a3;
- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3;
- (void)deviceHasQuickRelayRequest:(id)a3 hasQuickRelayRequest:(BOOL)a4;
- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didUpdateDNSProxyState:(id)a3 state:(unsigned __int8)a4;
- (void)directToCloudRequestAvailable;
- (void)directToCloudRequestUnavailable;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4;
- (void)localAWDLEndpointChanged:(id)a3;
- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4;
- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4;
- (void)processAppStateChanged:(id)a3;
- (void)reportBTLinkUpgradeClientAdded:(id)a3;
- (void)reportBTLinkUpgradeClientRemoved:(id)a3;
@end

@implementation NRDDeviceConductor

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](nrUUID, "UUIDString"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"Conductor[%@]", v5);

  return v6;
}

- (void)processAppStateChanged:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EC830;
  v7[3] = &unk_1001B0720;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)didUpdateDNSProxyState:(id)a3 state:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  v7 = (NRDiscoveryProxyServer *)a3;
  if (!v7) {
    goto LABEL_30;
  }
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0LL;
  }
  v9 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v6);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 0LL);

  if (IsLevelEnabled)
  {
    if (self) {
      v12 = self->_nrUUID;
    }
    else {
      v12 = 0LL;
    }
    v13 = (void *)_NRCopyLogObjectForNRUUID(v12, v11);
    _NRLogWithArgs( v13,  0LL,  "%s%.30s:%-4d received state update for %@ state: %d",  ",  "-[NRDDeviceConductor didUpdateDNSProxyState:state:]"",  4617LL,  v7,  v4);
  }

  if (v4 != 4 && v4 != 2) {
    goto LABEL_30;
  }
  if (!self)
  {
    v16 = 0LL;
    discoveryProxyClient = 0LL;
    goto LABEL_15;
  }

  v14 = self->_dnsProxyServer;
  if (v14 == (NRDNSProxyServer *)v7)
  {

LABEL_22:
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    sub_1000EC68C((uint64_t)self, v7, v21);
    v22 = sub_100021D14(objc_alloc(&OBJC_CLASS___NRLinkDirectorMessage), self->_nrUUID);
    v23 = v22;
    if ((NRDiscoveryProxyServer *)self->_dnsProxyServer == v7)
    {
      sub_1000222F4((uint64_t)v22, 17, v21);
      if (v4 != 4)
      {
LABEL_29:
        sub_100023824((uint64_t)v23);

        goto LABEL_30;
      }

      p_dnsProxyServer = (id *)&self->_dnsProxyServer;
    }

    else
    {
      if (self->_discoveryProxyServer != v7) {
        goto LABEL_29;
      }
      sub_1000222F4((uint64_t)v22, 19, v21);
      if (v4 != 4) {
        goto LABEL_29;
      }
      p_dnsProxyServer = (id *)&self->_discoveryProxyServer;
    }

    [*p_dnsProxyServer cancel];
    id v25 = *p_dnsProxyServer;
    id *p_dnsProxyServer = 0LL;

    goto LABEL_29;
  }

  discoveryProxyServer = self->_discoveryProxyServer;

  if (discoveryProxyServer == v7) {
    goto LABEL_22;
  }
  v16 = self->_dnsProxyClient;
  if (v16 != (NRDNSProxyClient *)v7)
  {
    discoveryProxyClient = self->_discoveryProxyClient;
LABEL_15:

    if (discoveryProxyClient != (NRDNSProxyClient *)v7) {
      goto LABEL_30;
    }
    if (v4 != 2)
    {
LABEL_17:
      v18 = objc_alloc(&OBJC_CLASS___NRLinkDirectorMessage);
      if (self)
      {
        v19 = (NSMutableSet *)sub_100021D14(v18, self->_nrUUID);
        v20 = v19;
        if ((NRDiscoveryProxyServer *)self->_dnsProxyClient == v7)
        {
          sub_100022774((uint64_t)v19, 16, 0);
          sub_1000EC808((uint64_t)self);
        }

        else if ((NRDiscoveryProxyServer *)self->_discoveryProxyClient == v7)
        {
          sub_100022774((uint64_t)v19, 18, 0);
          sub_1000EC81C((uint64_t)self);
        }
      }

      else
      {
        v20 = (NSMutableSet *)sub_100021D14(v18, 0LL);
      }

      sub_100023824((uint64_t)v20);
      -[NRDiscoveryProxyServer cancel](v7, "cancel");
LABEL_48:

      goto LABEL_30;
    }

    goto LABEL_32;
  }

  if (v4 != 2) {
    goto LABEL_17;
  }
LABEL_32:
  if (self && (NRDiscoveryProxyServer *)self->_dnsProxyClient == v7)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    v20 = self->_availableLinks;
    id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v20);
          }
          v32 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ([v32 ikeClassDEstablished])
          {
            v33 = self->_dnsProxyClient;
            v34 = v33;
            if (v33) {
              serverEndpoint = v33->super._serverEndpoint;
            }
            else {
              serverEndpoint = 0LL;
            }
            v31 = serverEndpoint;
            [v32 publishDNSConfig:v31];
          }
        }

        id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      }

      while (v27);
    }

    goto LABEL_48;
  }

- (void)didStartTrackingNOI:(id)a3
{
  if (self && self->_isEnabled && self->_aluSupported)
  {
    unsigned int v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0LL);

    if (IsLevelEnabled)
    {
      v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      _NRLogWithArgs( v7,  0LL,  "%s%.30s:%-4d AutoLinkUpgrade: Submitting start recommendation",  ",  "-[NRDDeviceConductor createALUMonitorIfNeeded]"",  5247);
    }

    id v8 = objc_alloc(&OBJC_CLASS___NRAutoLinkUpgradeMonitor);
    nrUUID = self->_nrUUID;
    v10 = self->_queue;
    uint64_t v11 = (NRAutoLinkUpgradeMonitor *)sub_100066F40((id *)&v8->super.isa, v10, nrUUID);

    v12 = self->_aluMonitor;
    if (!v12) {
      goto LABEL_17;
    }
    v13 = v12;
    v14 = self->_aluMonitor;
    v15 = v14;
    if (v14 && (v16 = v14->_lastReceivedAdviceID) != 0LL)
    {
      v17 = v16;
      aluMonitor = self->_aluMonitor;
      if (aluMonitor) {
        aluMonitor = (NRAutoLinkUpgradeMonitor *)aluMonitor->_lastReceivedAdviceID;
      }
      v19 = aluMonitor;
      id v20 = -[NRAutoLinkUpgradeMonitor unsignedLongLongValue](v19, "unsignedLongLongValue");

      if (!v20) {
        goto LABEL_17;
      }
      v22 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v21);
      int v23 = _NRLogIsLevelEnabled(v22, 1LL);

      if (!v23) {
        goto LABEL_17;
      }
      v13 = (NRAutoLinkUpgradeMonitor *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v24);
      _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d AutoLinkUpgrade: sending last received ALU advice to symptomsd",  ",  "-[NRDDeviceConductor createALUMonitorIfNeeded]"",  5326);
    }

    else
    {
    }

LABEL_17:
    id v25 = self->_aluMonitor;
    self->_aluMonitor = v11;
  }

- (void)didStopTrackingAllNOIs:(id)a3
{
  v3 = self;
  if (self) {
    self = (NRDDeviceConductor *)self->_nrUUID;
  }
  unsigned int v4 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0LL);

  if (IsLevelEnabled)
  {
    if (v3) {
      nrUUID = v3->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    id v8 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v6);
    _NRLogWithArgs( v8,  0LL,  "%s%.30s:%-4d AutoLinkUpgrade: Re-submitting start recommendation",  ",  "-[NRDDeviceConductor didStopTrackingAllNOIs:]"",  5052);
  }

  if (v3)
  {
    aluMonitor = v3->_aluMonitor;
    if (aluMonitor)
    {
      if (!-[NRAutoLinkUpgradeMonitor cancelled](v3->_aluMonitor, "cancelled"))
      {
        -[NRAutoLinkUpgradeMonitor setCancelled:](aluMonitor, "setCancelled:", 1LL);
        -[NRAutoLinkUpgradeMonitor setUpdateBlock:](aluMonitor, "setUpdateBlock:", 0LL);
        -[NRAutoLinkUpgradeMonitor invalidateAggregateStatsTimerSource]( aluMonitor,  "invalidateAggregateStatsTimerSource");
        -[NRAutoLinkUpgradeMonitor reportEvent:](aluMonitor, "reportEvent:", 30003LL);
      }
    }

    linkUpgradeReportWiFiInfra = v3->_linkUpgradeReportWiFiInfra;
    v3->_linkUpgradeReportWiFiInfra = 0LL;

    linkUpgradeReportForBTClassic = v3->_linkUpgradeReportForBTClassic;
    v3->_linkUpgradeReportForBTClassic = 0LL;

    *(_OWORD *)&v3->_effectiveALUAdvice = 0u;
    sub_1000EC574(v3);
  }

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (self->_isEnabled)
    {
      unsigned int v6 = [v4 state];
      uint64_t v8 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      v9 = (void *)v8;
      if (v6 != 255)
      {
        int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1LL);

        if (IsLevelEnabled)
        {
          uint64_t v11 = self->_nrUUID;
          v13 = (void *)_NRCopyLogObjectForNRUUID(v11, v12);
          _NRLogWithArgs( v13,  1LL,  "%s%.30s:%-4d link is available: %@",  ",  "-[NRDDeviceConductor linkIsAvailable:]"",  5448LL,  v4);
        }

        id v14 = [v4 copyShortDescription];
        sub_10011BB18(self->_nrUUID, 1004, 0LL, v14);

        -[NSMutableSet addObject:](self->_availableLinks, "addObject:", v4);
        [v4 setPolicyIdentifierString:self->_policyIdentifier];
        [v4 setIsCompanionLink:self->_isCompanionLink];
        sub_1000D77EC((uint64_t)self, v4);
        switch([v4 type])
        {
          case 0u:
            id v70 = sub_1000D54AC();
            int v71 = _NRLogIsLevelEnabled(v70, 16LL);

            if (v71)
            {
              id v72 = sub_1000D54AC();
              _NRLogWithArgs( v72,  16LL,  "%s%.30s:%-4d ABORTING: %@ is available, but has no type",  ",  "-[NRDDeviceConductor linkIsAvailable:]"",  5659LL,  v4);
            }

            self = (NRDDeviceConductor *)_os_log_pack_size(22LL);
            __int128 v35 = (char *)block - ((__chkstk_darwin(self) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            v73 = __error();
            uint64_t v74 = _os_log_pack_fill( v35,  self,  *v73,  &_mh_execute_header,  "%{public}s %@ is available, but has no type");
            *(_DWORD *)uint64_t v74 = 136446466;
            *(void *)(v74 + 4) = "-[NRDDeviceConductor linkIsAvailable:]";
            *(_WORD *)(v74 + 12) = 2112;
            *(void *)(v74 + 14) = v4;
            id v75 = sub_1000D54AC();
            _NRLogAbortWithPack(v75, v35);
            goto LABEL_78;
          case 1u:
            if (!self->_isPreferWiFiProvider) {
              goto LABEL_56;
            }
            if (self->_preferWiFiRequest) {
              [v4 setSuspendWhenReady:1];
            }
            objc_opt_self(&OBJC_CLASS___NRDKeyManager);
            if (qword_1001DCC18 != -1) {
              dispatch_once(&qword_1001DCC18, &stru_1001B0910);
            }
            id v16 = (id)qword_1001DCC10;
            v17 = v16;
            if (!v16) {
              goto LABEL_49;
            }
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v16 + 2));
            if (!v17[10])
            {
              v17[10] = 1;
              if (v17[8] == 4)
              {
                sub_100143DD4((uint64_t)v17);
                if (v17[9])
                {
                  v17[8] = 3;
                  sub_100144044((uint64_t)v17);
                }
              }
            }

            if ((v17[8] & 0xFD) != 1)
            {
LABEL_49:

              goto LABEL_56;
            }

            int latestPreferWiFiRequestType = self->_latestPreferWiFiRequestType;
            if (latestPreferWiFiRequestType == 2)
            {
            }

            else
            {

              if (latestPreferWiFiRequestType != 3) {
                goto LABEL_56;
              }
            }

            if (self->_latestPreferWiFiRequestType == 2)
            {
              id v42 = sub_1000D4CD4((uint64_t)self);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              BOOL v44 = sub_1001426B0((BOOL)v43);
            }

            else
            {
              BOOL v44 = 0;
            }

            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472LL;
            v89[2] = sub_1000EC214;
            v89[3] = &unk_1001AF538;
            v89[4] = self;
            BOOL v90 = v44;
            sub_1000D79D4((uint64_t)self, v44, 0, 0, 1, v89);
LABEL_56:
            v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
            int v46 = _NRLogIsLevelEnabled(v45, 1LL);

            if (v46)
            {
              v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v47);
              _NRLogWithArgs( v48,  1LL,  "%s%.30s:%-4d Starting the Bluetooth link",  ",  "-[NRDDeviceConductor linkIsAvailable:]"",  5501);
            }

- (void)linkIsReady:(id)a3
{
  id v104 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v104)
  {
    id v102 = sub_1000D54AC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v102, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_110;
    }
    id v30 = sub_1000D54AC();
    _NRLogWithArgs(v30, 17LL, "%s called with null link", "-[NRDDeviceConductor linkIsReady:]");
    goto LABEL_109;
  }

  if (!self->_isEnabled)
  {
    id v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    int v28 = _NRLogIsLevelEnabled(v27, 1LL);

    if (!v28) {
      goto LABEL_110;
    }
    id v30 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
    _NRLogWithArgs( v30,  1LL,  "%s%.30s:%-4d Ignoring link ready event as conductor is disabled",  ",  "-[NRDDeviceConductor linkIsReady:]"",  5673);
LABEL_109:

    goto LABEL_110;
  }

  unsigned int v6 = [v104 state];
  uint64_t v8 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
  v9 = (void *)v8;
  if (v6 == 255)
  {
    int v31 = _NRLogIsLevelEnabled(v8, 16LL);

    if (!v31) {
      goto LABEL_110;
    }
    id v30 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v32);
    _NRLogWithArgs( v30,  16LL,  "%s%.30s:%-4d Ignoring link ready event as link was cancelled %@",  ",  "-[NRDDeviceConductor linkIsReady:]"",  5678LL,  v104);
    goto LABEL_109;
  }

  int v10 = _NRLogIsLevelEnabled(v8, 1LL);

  if (v10)
  {
    uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v11);
    _NRLogWithArgs(v12, 1LL, "%s%.30s:%-4d link is ready: %@", ", "-[NRDDeviceConductor linkIsReady:]"", 5683LL, v104);
  }

  id v13 = [v104 copyShortDescription];
  sub_1000D4F78((uint64_t)self, 1005, @"%@", v14, v15, v16, v17, v18, (uint64_t)v13);

  sub_1000E387C((void **)&self->super.isa);
  sub_1000E44D4((uint64_t)self);
  if ([v104 suspendWhenReady])
  {
    int v20 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v19);
    int v21 = _NRLogIsLevelEnabled(v20, 1LL);

    if (v21)
    {
      int v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
      _NRLogWithArgs( v23,  1LL,  "%s%.30s:%-4d Suspending link as it is ready: %@",  ",  "-[NRDDeviceConductor linkIsReady:]"",  5689LL,  v104);
    }

    [v104 setSuspendWhenReady:0];
    [v104 suspend];
  }

  if ([v104 type] == 1)
  {
    sub_1000D8FF0((uint64_t)self);
    sub_10002FFB8((uint64_t)self->_quickRelayAgent);
    if (self->_alwaysOnWiFiQueryComplete && !self->_alwaysOnWiFiUpdateSent)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      if (!self->_isAlwaysReachableOverWiFi)
      {
        self->_alwaysOnWiFiQueryComplete = 1;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        id v25 = sub_1000D8B90((uint64_t)self, 1, 0);
        id v26 = v25;
        if (v25) {
          self->_alwaysOnWiFiUpdateSent = sub_10009F51C((uint64_t)v25);
        }
      }
    }

    sub_1000D3034((uint64_t)self, v24);
  }

  else
  {
    if ([v104 type] == 2)
    {
      id v33 = sub_1000D8B90((uint64_t)self, 2, 102);
      if (self->_preferWiFiRequest || (self->_effectiveALUAdvice & 4) != 0)
      {
        uint64_t v34 = self->_linkUpgradeReportWiFiInfra;
        if (v34) {
          v34->_flags |= 0x800u;
        }

        if ((self->_effectiveALUAdvice & 4) != 0)
        {
          currentALUAdviceID = self->_currentALUAdviceID;
          __int128 v36 = self->_aluMonitor;
          sub_1000670E8(v36, currentALUAdviceID);
        }
      }
    }

    else
    {
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent && quickRelayAgent->_state.state != 2)
      {
        quickRelayAgent->_state.state = 2;
        -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
      }

      int64_t v38 = objc_alloc_init(&OBJC_CLASS___NRLinkDirectorRequest);
      v40 = v38;
      if (v38)
      {
        v38->_type = 8;
        v38->_allowsSuspendedLink = 0;
        v38->_requiredLinkType = 1;
        newValue = _NSConcreteStackBlock;
        uint64_t v118 = 3221225472LL;
        v119 = sub_1000DAF10;
        v120 = &unk_1001B0A88;
        v121 = self;
        objc_setProperty_nonatomic_copy(v38, v39, &newValue, 48LL);
      }

      else
      {
        newValue = _NSConcreteStackBlock;
        uint64_t v118 = 3221225472LL;
        v119 = sub_1000DAF10;
        v120 = &unk_1001B0A88;
        v121 = self;
      }

      sub_1000D312C((uint64_t)self, v40);

      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      id v33 = sub_1000D8B90((uint64_t)self, 2, 101);
    }
  }

- (void)linkIsSuspended:(id)a3
{
  id v33 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v33)
  {
    id v29 = sub_1000D54AC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v29, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_17;
    }
    id v20 = sub_1000D54AC();
    _NRLogWithArgs(v20, 17LL, "%s called with null link");
    goto LABEL_16;
  }

  if (self->_isEnabled)
  {
    if ([v33 state] == 255)
    {
      id v26 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
      int v27 = _NRLogIsLevelEnabled(v26, 16LL);

      if (v27)
      {
        uint64_t v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v28);
        id v20 = (id)v19;
        uint64_t v31 = 5793LL;
        id v32 = v33;
        int v21 = "%s%.30s:%-4d Ignoring link suspended event as link was cancelled %@";
        uint64_t v25 = 16LL;
        goto LABEL_15;
      }
    }

    else
    {
      queue = self->_queue;
      id v7 = v33;
      dispatch_assert_queue_V2((dispatch_queue_t)queue);
      [v7 removePolicies];

      sub_1000E160C((uint64_t)self);
      sub_1000DAF94((uint64_t)self);
      if ([v7 type] == 4)
      {
        quickRelayAgent = self->_quickRelayAgent;
        if (quickRelayAgent)
        {
          if (quickRelayAgent->_state.state != 1)
          {
            quickRelayAgent->_state.state = 1;
            -[NWNetworkAgentRegistration updateNetworkAgent:]( quickRelayAgent->_registrationObject,  "updateNetworkAgent:");
          }
        }
      }

      id v9 = [v7 copyShortDescription];
      sub_1000D4F78((uint64_t)self, 1006, @"%@", v10, v11, v12, v13, v14, (uint64_t)v9);

      uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
      int v17 = _NRLogIsLevelEnabled(v16, 1LL);

      if (v17)
      {
        uint64_t v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v18);
        id v20 = (id)v19;
        uint64_t v31 = 5808LL;
        id v32 = v7;
        int v21 = "%s%.30s:%-4d link is suspended: %@";
LABEL_12:
        uint64_t v25 = 1LL;
LABEL_15:
        _NRLogWithArgs(v19, v25, v21, ", "-[NRDDeviceConductor linkIsSuspended:]"", v31, v32);
LABEL_16:
      }
    }
  }

  else
  {
    uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    int v23 = _NRLogIsLevelEnabled(v22, 1LL);

    if (v23)
    {
      uint64_t v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v24);
      id v20 = (id)v19;
      uint64_t v31 = 5788LL;
      int v21 = "%s%.30s:%-4d Ignoring link suspended event as conductor is disabled";
      goto LABEL_12;
    }
  }

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
    id v59 = sub_1000D54AC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v59, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_81;
    }
    id v18 = sub_1000D54AC();
    _NRLogWithArgs(v18, 17LL, "%s called with null link");
    goto LABEL_11;
  }

  BOOL isEnabled = self->_isEnabled;
  id v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
  int v8 = _NRLogIsLevelEnabled(v7, 1LL);

  if (!isEnabled)
  {
    if (!v8) {
      goto LABEL_81;
    }
    id v18 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs(v18, 1LL, "%s%.30s:%-4d Ignoring link unavailability event as conductor is disabled");
LABEL_11:

    goto LABEL_81;
  }

  if (v8)
  {
    uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d link is unavailable: %@",  ",  "-[NRDDeviceConductor linkIsUnavailable:]"",  5822LL,  v4);
  }

  id v11 = [v4 copyShortDescription];
  sub_1000D4F78((uint64_t)self, 1007, @"%@", v12, v13, v14, v15, v16, (uint64_t)v11);

  -[NSMutableSet removeObject:](self->_availableLinks, "removeObject:", v4);
  if ([v4 type] == 1)
  {
    sub_1000E12E4((uint64_t)self);
    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v17 = (id)qword_1001DC870;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_1000E13F4;
    v66[3] = &unk_1001B0A88;
    v66[4] = self;
    sub_1000AEA84((uint64_t)v17, v66);
    goto LABEL_72;
  }

  if ([v4 type] != 2)
  {
    if ([v4 type] == 4)
    {
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent)
      {
        if (quickRelayAgent->_state.state != 1)
        {
          quickRelayAgent->_state.state = 1;
          -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
        }
      }
    }

    goto LABEL_73;
  }

  BOOL v19 = [v4 subtype] == 103 || objc_msgSend(v4, "subtype") == 102;
  id v17 = sub_1000D8B90((uint64_t)self, 2, 102);
  id v21 = sub_1000D8B90((uint64_t)self, 2, 103);
  if (v19)
  {
    if ([v4 startRequested])
    {
      if (!self->_peerDeviceIsNearby) {
        sub_1000E15D4((uint64_t)self);
      }
      goto LABEL_29;
    }
  }

  else
  {
    if (([v17 state] == 255 || (objc_msgSend(v17, "startRequested") & 1) == 0)
      && ([v21 state] == 255 || !objc_msgSend(v21, "startRequested")))
    {
LABEL_29:
      if (self->_pendingPreferWiFiRequest) {
        sub_1000D8CCC((uint64_t)self, 2u);
      }
      if (self->_isPreferWiFiProvider)
      {
        if (self->_preferWiFiRequest && !self->_preferwiFiTimeoutSet)
        {
          int v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          int v24 = _NRLogIsLevelEnabled(v23, 1LL);

          if (v24)
          {
            id v32 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
            _NRLogWithArgs( v32,  1LL,  "%s%.30s:%-4d Wi-Fi link went away while servicing prefer Wi-Fi request",  ",  "-[NRDDeviceConductor linkIsUnavailable:]"",  5892);
          }

          sub_1000DA884((uint64_t)self, @"Wi-Fi link went away", v26, v27, v28, v29, v30, v31, v61);
          id v33 = sub_1000D4CD4((uint64_t)self);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          self->_pendingPreferWiFiRequest = sub_1001426B0((BOOL)v34);
        }

        if (self->_preferwiFiTimeoutSet)
        {
          __int128 v35 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          int v36 = _NRLogIsLevelEnabled(v35, 0LL);

          if (v36)
          {
            __int128 v37 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
            _NRLogWithArgs( v37,  0LL,  "%s%.30s:%-4d Not rejecting prefer wifi request as connection is in progress",  ",  "-[NRDDeviceConductor linkIsUnavailable:]"",  5897);
          }
        }
      }

      if (self->_bringUpWiFiImmediately)
      {
        int64_t v38 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
        int v39 = _NRLogIsLevelEnabled(v38, 1LL);

        if (v39)
        {
          id v41 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v40);
          _NRLogWithArgs( v41,  1LL,  "%s%.30s:%-4d Wi-Fi link went away when we need it immediately",  ",  "-[NRDDeviceConductor linkIsUnavailable:]"",  5903);
        }

        sub_1000D9E00((uint64_t)self);
      }

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v42 = self->_availableLinks;
      id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
      if (v43)
      {
        id v44 = v43;
        id v45 = 0LL;
        uint64_t v46 = *(void *)v63;
        while (2)
        {
          uint64_t v47 = 0LL;
          v48 = v45;
          do
          {
            if (*(void *)v63 != v46) {
              objc_enumerationMutation(v42);
            }
            id v45 = *(id *)(*((void *)&v62 + 1) + 8LL * (void)v47);

            if ([v45 type] == 1)
            {
              char v49 = 0;
              goto LABEL_55;
            }

            uint64_t v47 = (char *)v47 + 1;
            v48 = v45;
          }

          while (v44 != v47);
          id v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
          if (v44) {
            continue;
          }
          break;
        }
      }

      id v45 = 0LL;
      char v49 = 1;
LABEL_55:

      id v50 = sub_1000D8B90((uint64_t)self, 2, 101);
      if ([v17 state] != 8 && objc_msgSend(v50, "state") != 8)
      {
        if ([v17 state] != 255
          && ([v17 startRequested] & 1) != 0
          || [v50 state] != 255 && objc_msgSend(v50, "startRequested"))
        {
          sub_1000D8174((uint64_t)self);
        }

        if ((v49 & 1) == 0)
        {
          uint64_t v52 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v51);
          int v53 = _NRLogIsLevelEnabled(v52, 1LL);

          if (v53)
          {
            v54 = self->_nrUUID;
            id v56 = (void *)_NRCopyLogObjectForNRUUID(v54, v55);
            _NRLogWithArgs( v56,  1LL,  "%s%.30s:%-4d Found BT link %@",  ",  "-[NRDDeviceConductor linkIsUnavailable:]"",  5940LL,  v45,  (void)v62);
          }

          if ([v45 state] == 9 && !self->_preferwiFiTimeoutSet)
          {
            [v45 resume];
          }

          else if ([v45 state] == 1)
          {
            [v45 start];
          }
        }
      }

      goto LABEL_71;
    }

    sub_1000D8434((uint64_t)self);
  }

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v435 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isEnabled)
  {
    unsigned int v10 = [v7 state];
    nrUUID = self->_nrUUID;
    if (v10 != 255)
    {
      v437 = v7;
      uint64_t v12 = nrUUID;
      uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID(v12, v13);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 1LL);

      if (IsLevelEnabled)
      {
        uint64_t v16 = self->_nrUUID;
        id v18 = (void *)_NRCopyLogObjectForNRUUID(v16, v17);
        [v435 length];
        v431 = "";
        _NRLogWithArgs(v18, 1LL, "%s%.30s:%-4d Received message of length %llu bytes on link %@");
      }

      BOOL v19 = self->_nrUUID;
      id v20 = (void *)sub_100021DD0((uint64_t)&OBJC_CLASS___NRLinkDirectorMessage, v435, v19);

      v436 = v20;
      if (!v20)
      {
        __int128 v65 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v21);
        int v66 = _NRLogIsLevelEnabled(v65, 16LL);

        id v7 = v437;
        if (v66)
        {
          uint64_t v68 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v67);
          _NRLogWithArgs( v68,  16LL,  "%s%.30s:%-4d Failed to create message from received data",  ",  "-[NRDDeviceConductor linkDidReceiveData:data:]"",  5997);
        }

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1LL);

  if (IsLevelEnabled)
  {
    unsigned int v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d link: %@, IsAsleep: %d",  ",  "-[NRDDeviceConductor linkPeerIsAsleep:isAsleep:]"",  6520LL,  v15,  v4);
  }

  self->_peerDeviceIsAsleep = v4;
  if (!v4 && self->_peerDeviceIsNearby)
  {
    netInfo = self->_netInfo;
    if (netInfo)
    {
      if (!netInfo->_isCoalescing)
      {
        unint64_t netInfoGenerationSent = self->_netInfoGenerationSent;
        goto LABEL_11;
      }

      uint64_t v12 = sub_100017030((uint64_t)netInfo);

      if (v12)
      {
        netInfo = self->_netInfo;
        unint64_t netInfoGenerationSent = self->_netInfoGenerationSent;
        if (!netInfo)
        {
          unint64_t generation = 0LL;
          goto LABEL_12;
        }

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSUUID isEqual:](self->_nrUUID, "isEqual:", v6) & 1) == 0)
  {
    id v15 = sub_1000D54AC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 16LL);

    if (IsLevelEnabled)
    {
      id v17 = sub_1000D54AC();
      _NRLogWithArgs( v17,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: [self.nrUUID isEqual:nrUUID]",  ",  "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]"",  6692);
    }

    uint64_t v18 = _os_log_pack_size(12LL);
    BOOL v19 = (char *)&block[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v20 = __error();
    uint64_t v21 = _os_log_pack_fill( v19,  v18,  *v20,  &_mh_execute_header,  "%{public}s Assertion Failed: [self.nrUUID isEqual:nrUUID]");
    *(_DWORD *)uint64_t v21 = 136446210;
    *(void *)(v21 + 4) = "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]";
    id v22 = sub_1000D54AC();
    _NRLogAbortWithPack(v22, v19);
  }

  uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
  int v9 = _NRLogIsLevelEnabled(v8, 1LL);

  if (v9)
  {
    id v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
    _NRLogWithArgs( v11,  1LL,  "%s%.30s:%-4d PeerIsNearby: %d",  ",  "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]"",  6693,  v4);
  }

  self->_peerDeviceIsNearby = v4;
  ++self->_peerDeviceIsNearbyUpdateCounter;
  if (v4)
  {
    sub_10002FFB8((uint64_t)self->_quickRelayAgent);
    unint64_t peerDeviceIsNearbyUpdateCounter = self->_peerDeviceIsNearbyUpdateCounter;
    dispatch_time_t v13 = dispatch_time(0x8000000000000000LL, 3000000000LL);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DB8E4;
    block[3] = &unk_1001AF588;
    block[4] = self;
    void block[5] = peerDeviceIsNearbyUpdateCounter;
    dispatch_after(v13, (dispatch_queue_t)queue, block);
  }

  sub_1000DAF94((uint64_t)self);
}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_peerDidUnpairBluetooth != v4)
  {
    if ((-[NSUUID isEqual:](self->_nrUUID, "isEqual:", v19) & 1) == 0)
    {
      id v11 = sub_1000D54AC();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16LL);

      if (IsLevelEnabled)
      {
        id v13 = sub_1000D54AC();
        _NRLogWithArgs( v13,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: [self.nrUUID isEqual:nrUUID]",  ",  "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]"",  6735);
      }

      uint64_t v14 = _os_log_pack_size(12LL);
      id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = __error();
      uint64_t v17 = _os_log_pack_fill( v15,  v14,  *v16,  &_mh_execute_header,  "%{public}s Assertion Failed: [self.nrUUID isEqual:nrUUID]");
      *(_DWORD *)uint64_t v17 = 136446210;
      *(void *)(v17 + 4) = "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]";
      id v18 = sub_1000D54AC();
      _NRLogAbortWithPack(v18, v15);
    }

    uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int v8 = _NRLogIsLevelEnabled(v7, 1LL);

    if (v8)
    {
      uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d PeerHasUnregistered: %d",  ",  "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]"",  6736,  v4);
    }

    self->_peerDidUnpairBluetooth = v4;
    sub_1000DAF94((uint64_t)self);
  }
}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isEnabled || !self->_supportsPhoneCallRelay || self->_hasPhoneCallRelayRequest == v3) {
    return;
  }
  if (!self->_phoneCallRelayAnalytics)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NRAnalyticsPhoneCallRelay);
    phoneCallRelayAnalytics = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = v5;
  }

  uint64_t v7 = mach_absolute_time();
  uint64_t v9 = self->_phoneCallRelayAnalytics;
  if (v3)
  {
    if (v9) {
      v9->_phoneCallRelayStart = v7;
    }
  }

  else
  {
    if (v9)
    {
      v9->_phoneCallRelayEnd = v7;
      uint64_t v10 = self->_phoneCallRelayAnalytics;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    -[NRAnalyticsPhoneCallRelay submit](v10, "submit");
    id v11 = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = 0LL;
  }

  uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v8);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0LL);

  if (IsLevelEnabled)
  {
    id v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    _NRLogWithArgs( v15,  0LL,  "%s%.30s:%-4d deviceHasPhoneCallRelayRequest: %d",  ",  "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]"",  6769,  v3);
  }

  self->_hasPhoneCallRelayRequest = v3;
  if (self->_isPreferWiFiProvider)
  {
    if (v3) {
      return;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v16 = (id)qword_1001DC870;
    uint64_t v17 = v16;
    if (v16) {
      id v18 = (void *)*((void *)v16 + 6);
    }
    else {
      id v18 = 0LL;
    }
    id v19 = v18;

    if (v19
      && (id v20 = (dispatch_queue_s *)v19[3],
          dispatch_assert_queue_V2(v20),
          v20,
          *((int *)v19 + 10) >= 1))
    {
      BOOL preferWiFiRequest = self->_preferWiFiRequest;

      if (!preferWiFiRequest)
      {
        int v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
        int v24 = _NRLogIsLevelEnabled(v23, 0LL);

        if (v24)
        {
          uint64_t v26 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
          _NRLogWithArgs( v26,  0LL,  "%s%.30s:%-4d processing outstanding prefer Wi-Fi requests",  ",  "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]"",  6776);
        }

        -[NRDDeviceConductor preferWiFiRequestAvailable](self, "preferWiFiRequestAvailable");
        return;
      }
    }

    else
    {
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v31 = (id)qword_1001DC870;
    id v32 = v31;
    if (v31) {
      id v33 = (void *)*((void *)v31 + 6);
    }
    else {
      id v33 = 0LL;
    }
    id v42 = v33;

    uint64_t v34 = v42;
    if (v42
      && (__int128 v35 = (dispatch_queue_s *)v42[3],
          dispatch_assert_queue_V2(v35),
          v35,
          uint64_t v34 = v42,
          *((int *)v42 + 10) > 0))
    {
    }

    else
    {
      BOOL v36 = self->_preferWiFiRequest;

      if (v36)
      {
        uint64_t v38 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v37);
        int v39 = _NRLogIsLevelEnabled(v38, 0LL);

        if (v39)
        {
          id v41 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v40);
          _NRLogWithArgs( v41,  0LL,  "%s%.30s:%-4d processing deferred prefer Wi-Fi disable request",  ",  "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]"",  6781);
        }

        -[NRDDeviceConductor preferWiFiRequestUnavailable](self, "preferWiFiRequestUnavailable");
      }
    }
  }

  else if (v3 && !self->_preferWiFiRequest && self->_pendingPreferWiFiRequest)
  {
    uint64_t v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    int v28 = _NRLogIsLevelEnabled(v27, 0LL);

    if (v28)
    {
      uint64_t v30 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
      _NRLogWithArgs( v30,  0LL,  "%s%.30s:%-4d resetting pending bit for prefer Wi-Fi request, as the device has a phone call relay request",  ",  "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]"",  6792);
    }

    self->_pendingPreferWiFiRequest = 0;
  }

- (void)apsIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    self->_hasReceivedFirstAPSIsConnectedUpdate = 1;
    if (self->_apsIsConnected == a3) {
      return;
    }
    nrUUID = self->_nrUUID;
    BOOL v6 = a3;
  }

  else
  {
    if (!a3) {
      return;
    }
    nrUUID = 0LL;
    BOOL v6 = 1;
  }

  uint64_t v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0LL);

  if (IsLevelEnabled)
  {
    if (self)
    {
      uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      BOOL apsIsConnected = self->_apsIsConnected;
    }

    else
    {
      uint64_t v10 = (void *)_NRCopyLogObjectForNRUUID(0LL, v9);
      BOOL apsIsConnected = 0;
    }

    _NRLogWithArgs( v10,  0LL,  "%s%.30s:%-4d apsIsConnected: %d -> %d",  ",  "-[NRDDeviceConductor apsIsConnected:]"",  6808,  apsIsConnected,  v6);
  }

  if (self)
  {
    self->_BOOL apsIsConnected = v3;
    if (self->_isEnabled)
    {
      if (v3) {
        sub_1000DAC60((uint64_t)self);
      }
      return;
    }

    uint64_t v12 = self->_nrUUID;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  id v13 = (void *)_NRCopyLogObjectForNRUUID(v12, v9);
  int v14 = _NRLogIsLevelEnabled(v13, 0LL);

  if (v14)
  {
    if (self) {
      id v16 = self->_nrUUID;
    }
    else {
      id v16 = 0LL;
    }
    id v17 = (id)_NRCopyLogObjectForNRUUID(v16, v15);
    _NRLogWithArgs( v17,  0LL,  "%s%.30s:%-4d Ignoring apsIsConnected callback as conductor is disabled (apsIsConnected: %d)",  ",  "-[NRDDeviceConductor apsIsConnected:]"",  6812,  v6);
  }

- (void)deviceHasQuickRelayRequest:(id)a3 hasQuickRelayRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v39 = v6;
  if (self)
  {
    if ([v6 isEqual:self->_nrUUID])
    {
      nrUUID = self->_nrUUID;
      if (self->_isEnabled)
      {
        uint64_t v9 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v7);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v9, 0LL);

        if (IsLevelEnabled)
        {
          uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v11);
          _NRLogWithArgs( v12,  0LL,  "%s%.30s:%-4d deviceHasQuickRelayRequest: %d -> %d",  ",  "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]"",  6873,  self->_hasQuickRelayRequest,  v4);
        }

        self->_hasQuickRelayRequest = v4;
        if (!self->_hasReceivedFirstAPSIsConnectedUpdate)
        {
          objc_opt_self(&OBJC_CLASS___NRLinkDirector);
          if (qword_1001DC878 != -1) {
            dispatch_once(&qword_1001DC878, &stru_1001AEED0);
          }
          id v13 = (id *)(id)qword_1001DC870;
          int v14 = v13;
          if (v13)
          {
            uint64_t v15 = v13[7];
            if (v15) {
              BOOL v16 = v15[32] != 0;
            }
            else {
              BOOL v16 = 0;
            }
          }

          else
          {
            uint64_t v15 = 0LL;
            BOOL v16 = 0;
          }

          self->_BOOL apsIsConnected = v16;

          id v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
          int v19 = _NRLogIsLevelEnabled(v18, 0LL);

          if (v19)
          {
            uint64_t v21 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v20);
            uint64_t v22 = (void *)v21;
            if (self->_apsIsConnected) {
              int v23 = "YES";
            }
            else {
              int v23 = "NO";
            }
            _NRLogWithArgs( v21,  0LL,  "%s%.30s:%-4d force fetching apsIsConnected: %s",  ",  "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]"",  6878,  v23);
          }
        }

        sub_1000DAC60((uint64_t)self);
        goto LABEL_30;
      }

      goto LABEL_26;
    }

    int v24 = self->_nrUUID;
  }

  else
  {
    unsigned __int8 v33 = [v6 isEqual:0];
    int v24 = 0LL;
    nrUUID = 0LL;
    if ((v33 & 1) != 0)
    {
LABEL_26:
      uint64_t v34 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v7);
      int v35 = _NRLogIsLevelEnabled(v34, 0LL);

      if (v35)
      {
        if (self) {
          uint64_t v37 = self->_nrUUID;
        }
        else {
          uint64_t v37 = 0LL;
        }
        uint64_t v38 = (void *)_NRCopyLogObjectForNRUUID(v37, v36);
        _NRLogWithArgs( v38,  0LL,  "%s%.30s:%-4d Ignoring quick relay request as conductor is disabled (request: %d)",  ",  "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]"",  6869,  v4);
      }

      goto LABEL_30;
    }
  }

  uint64_t v25 = (void *)_NRCopyLogObjectForNRUUID(v24, v7);
  int v26 = _NRLogIsLevelEnabled(v25, 17LL);

  if (v26)
  {
    if (self) {
      uint64_t v27 = self->_nrUUID;
    }
    else {
      uint64_t v27 = 0LL;
    }
    int v28 = v27;
    uint64_t v30 = _NRCopyLogObjectForNRUUID(v28, v29);
    id v31 = (void *)v30;
    if (self) {
      id v32 = self->_nrUUID;
    }
    else {
      id v32 = 0LL;
    }
    _NRLogWithArgs( v30,  17LL,  "Received quick relay request for incorrect conductor (expected: %@, received: %@",  v32,  v39);
  }

- (void)deviceHasBTLinkUpgradeRequest:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NRBluetoothLinkPreferences);
    [v4 setPacketsPerSecond:&off_1001BC790];
    if (self)
    {
      uint64_t v5 = self->_devicePreferencesManager;
      id v6 = self->_btLinkPreferencesAgent;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBTLinkPreferencesAgent agentUUID](v6, "agentUUID"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      sub_10010EC78((uint64_t)v5, v4, v8);

      unint64_t v9 = (self->_effectiveALUAdvice >> 1) & 1;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000DAC0C;
      v18[3] = &unk_1001AF538;
      char v19 = v9;
      v18[4] = self;
      sub_1000D8960((uint64_t)self, 1, v9, v18);
    }

    else
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([0 agentUUID]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      sub_10010EC78(0LL, v4, v15);
    }
  }

  else if (self)
  {
    uint64_t v10 = self->_devicePreferencesManager;
    uint64_t v11 = self->_btLinkPreferencesAgent;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBTLinkPreferencesAgent agentUUID](v11, "agentUUID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    sub_10010ED44((uint64_t)v10, v13);

    sub_1000D90D8((uint64_t)self, self->_linkUpgradeReportForBTClassic);
  }

  else
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([0 agentUUID]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    sub_10010ED44(0LL, v17);
  }

- (void)reportBTLinkUpgradeClientAdded:(id)a3
{
  if (self) {
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  }
  sub_10010EA70((uint64_t)self, a3);
}

- (void)reportBTLinkUpgradeClientRemoved:(id)a3
{
  if (self) {
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  }
  sub_10010EB74((uint64_t)self, a3);
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  if (_NRIsAppleInternal(self))
  {
    if (self && self->_disablePreferWiFi) {
      return 0;
    }
    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v4 = (unsigned __int8 *)(id)qword_1001DC870;
    if (v4)
    {
      int v5 = v4[8];

      if (v5) {
        return 0;
      }
    }
  }

  if (!self)
  {
    nrUUID = 0LL;
    goto LABEL_20;
  }

  if (!self->_preferWiFiRequest && !self->_preferWiFiRequestInFlight)
  {
    nrUUID = self->_nrUUID;
LABEL_20:
    id v13 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v3);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 0LL);

    BOOL result = 0;
    if (!IsLevelEnabled) {
      return result;
    }
    if (self)
    {
      BOOL v16 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
      BOOL preferWiFiRequest = self->_preferWiFiRequest;
      BOOL preferWiFiRequestInFlight = self->_preferWiFiRequestInFlight;
    }

    else
    {
      BOOL v16 = (void *)_NRCopyLogObjectForNRUUID(0LL, v15);
      BOOL preferWiFiRequest = 0;
      BOOL preferWiFiRequestInFlight = 0;
    }

    _NRLogWithArgs( v16,  0LL,  "%s%.30s:%-4d %d %d",  ",  "-[NRDDeviceConductor preferWiFiP2PRequestUpdated]"",  6930,  preferWiFiRequest,  preferWiFiRequestInFlight);

    return 0;
  }

  if (self->_supportsAWDL)
  {
    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    id v6 = (id)qword_1001DC870;
    uint64_t v7 = v6;
    if (v6) {
      uint64_t v8 = (void *)*((void *)v6 + 12);
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = v8;
    int v10 = sub_100061098((uint64_t)v9, 0LL);

    if (v10 != self->_p2pRequested)
    {
      -[NRDDeviceConductor preferWiFiRequestUnavailable](self, "preferWiFiRequestUnavailable");
      -[NRDDeviceConductor preferWiFiRequestAvailable](self, "preferWiFiRequestAvailable");
    }
  }

  return 1;
}

- (BOOL)preferWiFiRequestAvailable
{
  self->_BOOL preferWiFiRequestInFlight = 0;
  if (self->_disablePreferWiFi)
  {
    int v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0LL);

    BOOL result = 0;
    if (IsLevelEnabled)
    {
      id v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d ignoring prefer Wi-Fi request as it is manually disabled");
LABEL_14:

      return 0;
    }

    return result;
  }

  objc_opt_self(&OBJC_CLASS___NRLinkDirector);
  if (qword_1001DC878 != -1) {
    dispatch_once(&qword_1001DC878, &stru_1001AEED0);
  }
  int v10 = (unsigned __int8 *)(id)qword_1001DC870;
  if (!v10 || (int v11 = v10[8], v10, !v11))
  {
LABEL_48:
    if (self->_deviceSetupInProgress)
    {
      uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      int v16 = _NRLogIsLevelEnabled(v15, 0LL);

      BOOL result = 0;
      if (v16)
      {
        id v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
        _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d ignoring prefer Wi-Fi enable request as device setup is in progress");
        goto LABEL_14;
      }
    }

    else
    {
      if (self->_hasPhoneCallRelayRequest)
      {
        id v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
        int v19 = _NRLogIsLevelEnabled(v18, 0LL);

        if (v19)
        {
          uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v20);
          _NRLogWithArgs( v21,  0LL,  "%s%.30s:%-4d ignoring prefer Wi-Fi enable request as we have an active phone call relay request",  ",  "-[NRDDeviceConductor preferWiFiRequestAvailable]"",  6971);
        }
      }

      else
      {
        if (self->_supportsAWDL)
        {
          objc_opt_self(&OBJC_CLASS___NRLinkDirector);
          if (qword_1001DC878 != -1) {
            dispatch_once(&qword_1001DC878, &stru_1001AEED0);
          }
          id v22 = (id)qword_1001DC870;
          int v23 = v22;
          if (v22) {
            int v24 = (void *)*((void *)v22 + 12);
          }
          else {
            int v24 = 0LL;
          }
          id v25 = v24;
          self->_p2pRequested = sub_100061098((uint64_t)v25, 0LL);
        }

        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        id v26 = sub_1000D8B90((uint64_t)self, 2, 101);
        unsigned __int8 v33 = v26;
        if (!self->_p2pRequested) {
          goto LABEL_38;
        }
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        objc_opt_self(&OBJC_CLASS___NRLinkDirector);
        if (qword_1001DC878 != -1) {
          dispatch_once(&qword_1001DC878, &stru_1001AEED0);
        }
        id v34 = (id)qword_1001DC870;
        int v35 = v34;
        uint64_t v36 = v34 ? (void *)*((void *)v34 + 6) : 0LL;
        id v37 = v36;

        BOOL v38 = sub_10014281C((uint64_t)v37);
        if (v38)
        {
LABEL_32:
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          if (self->_isAlwaysReachableOverWiFi)
          {
            id v39 = objc_alloc_init(&OBJC_CLASS___NRLinkDirectorRequest);
            uint64_t v40 = v39;
            if (v39)
            {
              v39->_type = 1;
              v39->_requiredLinkType = 1;
              *(_WORD *)&v39->_attemptImmediately = 257;
            }

            sub_1000D312C((uint64_t)self, v39);
          }

          if (sub_1000D79D4((uint64_t)self, 1, 1, 1, 0, 0LL))
          {
            [v33 start];
          }

          else
          {
            self->_pendingPreferWiFiRequest = 1;
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472LL;
            v47[2] = sub_1000DAB5C;
            v47[3] = &unk_1001B0A88;
            v47[4] = self;
            sub_1000D79D4((uint64_t)self, 1, 0, 0, 0, v47);
            id v42 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v41);
            int v43 = _NRLogIsLevelEnabled(v42, 1LL);

            if (v43)
            {
              int v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v44);
              _NRLogWithArgs( v45,  1LL,  "%s%.30s:%-4d Enqueued prefer Wi-Fi request to be sent later",  ",  "-[NRDDeviceConductor preferWiFiRequestAvailable]"",  7033);
            }
          }
        }

        else
        {
LABEL_38:
          sub_1000DA884((uint64_t)self, @"No Wi-Fi link available", v27, v28, v29, v30, v31, v32, v46);
          self->_pendingPreferWiFiRequest = 1;
        }
      }

      return 1;
    }

    return result;
  }

  uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
  int v13 = _NRLogIsLevelEnabled(v12, 0LL);

  BOOL result = 0;
  if (v13)
  {
    id v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d ignoring prefer Wi-Fi request as fixed interface mode is enabled");
    goto LABEL_14;
  }

  return result;
}

- (BOOL)preferWiFiRequestUnavailable
{
  self->_BOOL preferWiFiRequestInFlight = 0;
  if (_NRIsAppleInternal(v3))
  {
    if (self->_disablePreferWiFi)
    {
      int v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      int IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0LL);

      BOOL result = 0;
      if (!IsLevelEnabled) {
        return result;
      }
      id v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d ignoring prefer Wi-Fi request as it is manually disabled");
LABEL_11:

      return 0;
    }

    objc_opt_self(&OBJC_CLASS___NRLinkDirector);
    if (qword_1001DC878 != -1) {
      dispatch_once(&qword_1001DC878, &stru_1001AEED0);
    }
    int v10 = (unsigned __int8 *)(id)qword_1001DC870;
    if (v10)
    {
      int v11 = v10[8];

      if (v11)
      {
        uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
        int v13 = _NRLogIsLevelEnabled(v12, 0LL);

        BOOL result = 0;
        if (!v13) {
          return result;
        }
        id v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d ignoring prefer Wi-Fi request as fixed interface mode is enabled");
        goto LABEL_11;
      }
    }
  }

  if (self->_hasPhoneCallRelayRequest)
  {
    uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    int v16 = _NRLogIsLevelEnabled(v15, 0LL);

    if (v16)
    {
      id v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
      _NRLogWithArgs( v18,  0LL,  "%s%.30s:%-4d ignoring prefer Wi-Fi disable request as we have an active phone call relay request",  ",  "-[NRDDeviceConductor preferWiFiRequestUnavailable]"",  7064);
    }
  }

  else
  {
    self->_p2pRequested = 0;
    self->_pendingPreferWiFiRequest = 0;
    sub_1000D7B08((uint64_t)self, 0);
  }

  return 1;
}

- (void)directToCloudRequestAvailable
{
  if (self)
  {
    if (self->_allowsDirectToCloud) {
  }
    }

- (void)directToCloudRequestUnavailable
{
  if (self && self->_allowsDirectToCloud)
  {
    uint64_t v3 = mach_absolute_time();
    directToCloudAnalytics = self->_directToCloudAnalytics;
    if (directToCloudAnalytics
      && (directToCloudAnalytics->_directToCloudRequestEnd = v3, (int v5 = self->_directToCloudAnalytics) != 0LL))
    {
      self->_directToCloudRequestEndTime = v5->_directToCloudRequestEnd;
      id v6 = v5;
      if (v6->_iRATManagerQueryStart)
      {
        uint64_t v7 = self->_directToCloudAnalytics;
        if (v7)
        {
          unint64_t iRATManagerQueryEnd = v7->_iRATManagerQueryEnd;

          if (iRATManagerQueryEnd) {
            goto LABEL_13;
          }
          id v9 = self->_directToCloudAnalytics;
          if (!v9) {
            goto LABEL_13;
          }
        }

        else
        {

          id v9 = self->_directToCloudAnalytics;
          if (!v9) {
            goto LABEL_13;
          }
        }

        v9->_iRATManagerQueryIncomplete = 1;
LABEL_13:
        -[NRAnalyticsDirectToCloud submit](self->_directToCloudAnalytics, "submit");
        int v10 = self->_directToCloudAnalytics;
        self->_directToCloudAnalytics = 0LL;

        return;
      }
    }

    else
    {
      self->_directToCloudRequestEndTime = 0LL;
      id v6 = 0LL;
    }

    goto LABEL_13;
  }

- (void)localAWDLEndpointChanged:(id)a3
{
  if (self && self->_isEnabled && self->_supportsAWDL)
  {
    sub_1000D2DE0((uint64_t)self);
    sub_1000D3034((uint64_t)self, v4);
  }

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v12 = a3;
  uint64_t v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d starting browse for %@",  ",  "-[NRDDeviceConductor didStartBrowseRequestForASName:asClient:]"",  8708LL,  v12);
    }

    sub_1000D2088((uint64_t)self, 1, 0);
  }
}

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v15 = a3;
  uint64_t v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v15 && self->_asClient == v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d stopping browse for %@",  ",  "-[NRDDeviceConductor didStopBrowseRequestForASName:asClient:]"",  8716LL,  v15);
    }

    asClient = self->_asClient;
    if (asClient) {
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForBrowsing;
    }
    int v13 = asClient;
    if (-[NRApplicationServiceClient count](v13, "count"))
    {
    }

    else
    {
      BOOL qrAssertedForBrowse = self->_qrAssertedForBrowse;

      if (qrAssertedForBrowse)
      {
        self->_BOOL qrAssertedForBrowse = 0;
        -[NRQuickRelayAgent unassertAgentWithOptions:](self->_quickRelayAgent, "unassertAgentWithOptions:", 0LL);
      }
    }
  }
}

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v12 = a3;
  uint64_t v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d starting resolve for %@",  ",  "-[NRDDeviceConductor didStartResolveRequestForASName:asClient:]"",  8727LL,  v12);
    }

    sub_1000D2088((uint64_t)self, 0, 1);
  }
}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v15 = a3;
  uint64_t v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v15 && self->_asClient == v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d stopping resolve for %@",  ",  "-[NRDDeviceConductor didStopResolveRequestForASName:asClient:]"",  8735LL,  v15);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_asNamesToResolvedEndpoints,  "setObject:forKeyedSubscript:",  0LL,  v15);
    asClient = self->_asClient;
    if (asClient) {
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForResolving;
    }
    int v13 = asClient;
    if (-[NRApplicationServiceClient count](v13, "count"))
    {
    }

    else
    {
      BOOL qrAssertedForResolve = self->_qrAssertedForResolve;

      if (qrAssertedForResolve)
      {
        self->_BOOL qrAssertedForResolve = 0;
        -[NRQuickRelayAgent unassertAgentWithOptions:](self->_quickRelayAgent, "unassertAgentWithOptions:", 0LL);
      }
    }
  }
}

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v12 = a3;
  uint64_t v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0LL);

    if (IsLevelEnabled)
    {
      int v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs( v11,  0LL,  "%s%.30s:%-4d resolve completed for %@",  ",  "-[NRDDeviceConductor didCompleteIncomingResolveRequestForASName:asClient:]"",  8747LL,  v12);
    }

    sub_1000D1D1C((uint64_t)self, v12);
  }
}

- (void).cxx_destruct
{
}

@end