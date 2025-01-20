@interface NESMIKEv2VPNSession
- (BOOL)initializePlugins;
- (BOOL)prepareConfigurationForStart;
- (NESMIKEv2VPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7;
- (int)getVirtualInterfaceMTU:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation NESMIKEv2VPNSession

- (NESMIKEv2VPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{
  return 0LL;
}

- (BOOL)initializePlugins
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

  if (v3) {
    return 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));

  if (v5)
  {
    v8 = objc_alloc(&OBJC_CLASS___NEAgent);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    v10 = -[NEAgent initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:]( v8,  "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:",  @"com.apple.NetworkExtension.IKEv2Provider",  1LL,  5LL,  &off_1000C19E8,  v9);

    if (v10)
    {
      v11 = objc_alloc(&OBJC_CLASS___NEVPNTunnelPlugin);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v13 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:]( v11,  "initWithAgent:delegateQueue:andDelegate:",  v10,  v12,  self);
      -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v13);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    BOOL v4 = v14 != 0LL;
  }

  else
  {
    uint64_t v15 = ne_log_obj(v6, v7);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@: No UID available, cannot create plugin",  (uint8_t *)&v18,  0xCu);
    }

    return 0;
  }

  return v4;
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  if (-[NESMVPNSession sessionType](self, "sessionType") == 3)
  {
    id v6 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    NEGetInterfaceType([v6 UTF8String], buf, &v37);

    if (buf[0] && v37)
    {
      [v5 setNatKeepAliveOffloadInterval:20];
    }

    else if (!buf[0] {
           && (![v5 natKeepAliveOffloadInterval]
    }
            || [v5 natKeepAliveOffloadInterval] == 110))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
      v8 = (void *)v7;
      if (v7) {
        unsigned int v9 = *(_DWORD *)(v7 + 356);
      }
      else {
        unsigned int v9 = 0;
      }
      if (v9 <= 0x6E) {
        uint64_t v10 = 110LL;
      }
      else {
        uint64_t v10 = v9;
      }
      [v5 setNatKeepAliveOffloadInterval:v10];
    }

    [v5 setDisableMOBIKERetryOnWake:1];
  }

  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    v12 = self;
    v14 = v12;
    if (v11)
    {
      if (v12)
      {
        id v15 = objc_msgSend(objc_getProperty(v11, v13, 360, 1), "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        int v18 = v16;
        if (v16) {
          Property = (NESMIKEv2VPNSession *)objc_getProperty(v16, v17, 24LL, 1);
        }
        else {
          Property = 0LL;
        }

        id v21 = objc_getProperty(v11, v20, 360LL, 1);
        if (Property == v14)
        {
          v29 = (_DWORD *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:1]);
          if (v29) {
            unsigned int v23 = v29[2];
          }
          else {
            unsigned int v23 = 0;
          }

          uint64_t v32 = ne_log_obj(v30, v31);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v23;
          v28 = "shouldDisableInitialContactForSession fallback session status %d";
        }

        else
        {
          v22 = (_DWORD *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);
          if (v22) {
            unsigned int v23 = v22[2];
          }
          else {
            unsigned int v23 = 0;
          }

          uint64_t v26 = ne_log_obj(v24, v25);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v23;
          v28 = "shouldDisableInitialContactForSession primary session status %d";
        }

        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 8u);
LABEL_32:

        BOOL v33 = v23 > 1;
LABEL_33:

        [v5 setDisableInitialContact:v33];
        goto LABEL_34;
      }

      uint64_t v34 = ne_log_obj(0LL, v13);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[NESMIKEv2VPNFallbackSession shouldDisableInitialContactForSession:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "%s called with null session",  buf,  0xCu);
      }
    }

    BOOL v33 = 0LL;
    goto LABEL_33;
  }

- (BOOL)prepareConfigurationForStart
{
  if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
  v5 = sub_100009C50((uint64_t)v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 alwaysOnVPN]);
  [v8 setActiveInterfaceProtocolKey:v6];

  uint64_t v11 = ne_log_obj(v9, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 alwaysOnVPN]);
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activeInterfaceProtocolKey]);
    int v21 = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@: prepareConfigurationForStart: activeInterfaceProtocolKey %@",  (uint8_t *)&v21,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 alwaysOnVPN]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activeInterfaceProtocolKey]);
  BOOL v16 = v15 != 0LL;

  return v16;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = -[NESMSession status](self, "status");
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NESMIKEv2VPNSession;
  -[NESMVPNSession setStatus:](&v36, "setStatus:", v3);
  if (self && (_DWORD)v3 == 3) {
    self->_sessionDidConnect = 1;
  }
  if (!-[NESMSession isOnDemand](self, "isOnDemand")
    && (id)-[NESMVPNSession tunnelKind](self, "tunnelKind") == (id)1
    && -[NESMVPNSession sessionType](self, "sessionType") != 3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationIdentifier]);
    if (v7)
    {
    }

    else
    {
      if (self) {
        BOOL v25 = !self->_sessionDidConnect;
      }
      else {
        BOOL v25 = 1;
      }

      if ((_DWORD)v3 == 1 && v25 && v5 != 1)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 userInfo]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"LocalizedHeader"]);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 userInfo]);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

        if (v28 && v31)
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));
          [v32 cancel];

          BOOL v33 = objc_alloc(&OBJC_CLASS___NEUserNotification);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          id v35 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:]( v33,  "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extens ionItem:callbackQueue:callbackHandler:",  v28,  v31,  0LL,  0LL,  0LL,  0LL,  0LL,  v34,  &stru_1000BE488);
          -[NESMVPNSession setNotification:](self, "setNotification:", v35);
        }

        if (self) {
          goto LABEL_12;
        }
        return;
      }
    }
  }

  if ((_DWORD)v3 == 5)
  {
    if (self)
    {
      if (qword_1000CFBF0 != -1) {
        dispatch_once(&qword_1000CFBF0, &stru_1000BE4A8);
      }
      if (-[NESMSession connectTime](self, "connectTime"))
      {
        unint64_t v8 = (unint64_t)(*(double *)&qword_1000CFBF8 * (double)mach_absolute_time());
        unint64_t v9 = -[NESMSession connectTime](self, "connectTime");
        unint64_t v10 = v8 - v9;
        if (v8 != v9)
        {
          id v11 = -[NESMVPNSession copyStatistics](self, "copyStatistics");
          v12 = v11;
          if (v11)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"VPN"]);
            v14 = v13;
            if (v13)
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"BytesIn"]);
              id v16 = [v15 unsignedLongLongValue];

              v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"BytesOut"]);
              id v18 = [v17 unsignedLongLongValue];

              int64_t v19 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
              SEL v20 = @"Fallback Tunnel";
              if (v19 == 1) {
                SEL v20 = @"Primary Tunnel";
              }
              int v21 = v20;
              unsigned __int8 v22 = -[NESMSession isOnDemand](self, "isOnDemand");
              unsigned __int8 v23 = sub_100077340(self);
              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472LL;
              v37[2] = sub_10006D970;
              v37[3] = &unk_1000BE4D0;
              unsigned __int8 v42 = v23;
              unsigned __int8 v43 = v22;
              v38 = v21;
              unint64_t v39 = v10;
              id v40 = v16;
              id v41 = v18;
              uint64_t v24 = v21;
              AnalyticsSendEventLazy(@"com.apple.NetworkExtension.IKEv2Tunnel", v37);
            }
          }
        }
      }
    }
  }

  else if ((_DWORD)v3 == 1 && self)
  {
LABEL_12:
    self->_sessionDidConnect = 0;
  }

- (int)getVirtualInterfaceMTU:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  id v6 = [v5 mtu];
  if ((unint64_t)v6 >= 0x3E8 && (id v6 = [v5 mtu], (unint64_t)v6 < 0x5DD))
  {
    int v11 = [v5 mtu];
  }

  else
  {
    uint64_t v8 = ne_log_obj(v6, v7);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      id v14 = [v5 mtu];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "requested mtu size out of range %lu",  (uint8_t *)&v13,  0xCu);
    }

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 MTU]);
    int v11 = [v10 intValue];
  }

  return v11;
}

@end