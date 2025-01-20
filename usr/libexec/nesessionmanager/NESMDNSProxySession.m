@interface NESMDNSProxySession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)waitForPerApp;
- (NESMDNSProxySession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6;
- (id)authenticationPluginBundleIdentifier;
- (id)providerBundleIdentifier;
- (id)providerDesignatedRequirement;
- (int64_t)agentPluginClass;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForRankedInterfaces;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogin;
- (void)install;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)prepareNetwork;
- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3;
- (void)setProviderDesignatedRequirement:(id)a3;
- (void)setStatus:(int)a3;
- (void)uninstall;
@end

@implementation NESMDNSProxySession

- (NESMDNSProxySession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  result = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:]( &v7,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:",  a3,  a4,  a5,  a6,  6LL);
  if (result) {
    result->_restartIntervalSecs = 1LL;
  }
  return result;
}

- (int64_t)agentPluginClass
{
  return 3LL;
}

- (id)providerBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 providerBundleIdentifier]);

  return v3;
}

- (id)authenticationPluginBundleIdentifier
{
  return 0LL;
}

- (id)providerDesignatedRequirement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 designatedRequirement]);

  return v3;
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  [v5 setDesignatedRequirement:v4];
}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dnsProxy]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 protocol]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NEDNSProxyProviderProtocol);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMDNSProxySession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    [v7 setDesignatedRequirement:v6];
  }
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession createConnectParametersWithStartMessage:](&v10, "createConnectParametersWithStartMessage:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dnsProxy]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 protocol]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 providerConfiguration]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 providerConfiguration]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    [v9 setObject:v8 forKeyedSubscript:@"VendorData"];
  }
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession handleNetworkConfigurationChange:](&v7, "handleNetworkConfigurationChange:");
  if ((v3 & 2) != 0)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002B8F4;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v5, block);
  }

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dnsProxy]);
    if ([v6 isEnabled])
    {
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dnsProxy]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 perApp]);
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appRules]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 perApp]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 appRules]);
      BOOL v14 = v10 != v13;
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  id v15 = (id)-[NESMFlowDivertSession handleUpdateConfiguration:](&v24, "handleUpdateConfiguration:", v5);
  BOOL v17 = (char)v15;
  if ((_DWORD)v15) {
    BOOL v18 = !v14;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    uint64_t v19 = ne_log_obj(v15, v16);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@: Handling Update Configuration - updating policies <%@>",  buf,  0x16u);
    }

    -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 1LL);
  }

  return v17;
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    objc_super v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Handling installed apps change <%@>",  (uint8_t *)&v7,  0x16u);
  }

  -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2LL);
}

- (void)handleCaptiveNetworkPluginsChanged
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    objc_super v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: Handling installed captive plugins change (%@>",  (uint8_t *)&v7,  0x16u);
  }

  -[NESMDNSProxySession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2LL);
}

- (void)handleChangeEventForRankedInterfaces
{
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5)
  {
    uint64_t v3 = *(void *)&a3;
    if (((1 << a3) & 0x26) != 0)
    {
      uint64_t v5 = ne_log_obj(self, a2);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = inputNotification2String(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
        *(_DWORD *)buf = 138412802;
        v13 = self;
        __int16 v14 = 2080;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        BOOL v17 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: received a %s notification <%@>",  buf,  0x20u);
      }

      if ((v3 - 1) <= 1)
      {
        objc_super v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002B74C;
        block[3] = &unk_1000BEC08;
        block[4] = self;
        dispatch_async(v10, block);
      }

      -[NESMSession restartSession](self, "restartSession");
    }
  }

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = -[NESMSession status](self, "status");
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession setStatus:](&v21, "setStatus:", v3);
  if (-[NESMSession status](self, "status") == 1
    && v5 != 1
    && (!self || !self->_externallyStopped)
    && -[NESMSession lastStopReason](self, "lastStopReason") != 3
    && -[NESMSession lastStopReason](self, "lastStopReason") != 6
    && (id)-[NESMVPNSession state](self, "state") != (id)9)
  {
    if (qword_1000CFBA8 != -1) {
      dispatch_once(&qword_1000CFBA8, &stru_1000BDA30);
    }
    uint64_t v6 = mach_absolute_time();
    if (self && (v6 - self->_pluginStartTicks) / qword_1000CF740 >= 0x3C) {
      self->_unint64_t restartIntervalSecs = 1LL;
    }
    uint64_t v8 = ne_log_obj(v6, v7);
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = ne_session_stop_reason_to_string(-[NESMSession lastStopReason](self, "lastStopReason"));
      if (self) {
        unint64_t restartIntervalSecs = self->_restartIntervalSecs;
      }
      else {
        unint64_t restartIntervalSecs = 0LL;
      }
      *(_DWORD *)buf = 138412802;
      v23 = self;
      __int16 v24 = 2080;
      uint64_t v25 = v10;
      __int16 v26 = 2048;
      unint64_t v27 = restartIntervalSecs;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: unexpected disconnect (%s), restarting in ~%lu seconds",  buf,  0x20u);
    }

    sub_10002B5C8((uint64_t)self, 0LL);
    if (self) {
      int64_t v12 = 1000000000 * self->_restartIntervalSecs;
    }
    else {
      int64_t v12 = 0LL;
    }
    dispatch_time_t v13 = dispatch_time(0LL, v12);
    __int16 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    uint64_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v14);

    if (self) {
      uint64_t v16 = 100000000 * self->_restartIntervalSecs;
    }
    else {
      uint64_t v16 = 0LL;
    }
    dispatch_source_set_timer(v15, v13, 0xFFFFFFFFFFFFFFFFLL, v16);
    objc_initWeak((id *)buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002B638;
    handler[3] = &unk_1000BDA58;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate(v15);
    sub_10002B5C8((uint64_t)self, v15);
    if (self)
    {
      unint64_t v17 = self->_restartIntervalSecs;
      if (v17 != 60)
      {
        unint64_t v18 = 3 * v17;
        self->_unint64_t restartIntervalSecs = v18;
        if (v18 >= 0x3D) {
          self->_unint64_t restartIntervalSecs = 60LL;
        }
      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_setProperty_atomic(self, v4, 0LL, 728LL);
  }
  xpc_object_t value = xpc_dictionary_get_value(v5, "SessionOptions");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v8 = v7;
  if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v8, "test-agent")) {
    goto LABEL_26;
  }
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v5);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(remote_connection);
  int64_t v12 = (void *)v10;
  if (!v10)
  {
LABEL_10:
    uint64_t v15 = ne_log_obj(v10, v11);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
      [v17 handleStartMessage:v5];

      goto LABEL_28;
    }

    *(_DWORD *)buf = 136315138;
    v45 = "com.apple.private.networkextension.test-control";
    v37 = "Test provider does not have the %s entitlement";
    v38 = (os_log_s *)v16;
    uint32_t v39 = 12;
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_11;
  }

  dispatch_time_t v13 = (void *)xpc_connection_copy_entitlement_value(v10, "com.apple.private.networkextension.test-control");
  __int16 v14 = v13;
  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_BOOL)
  {

    goto LABEL_10;
  }

  BOOL v18 = xpc_BOOL_get_value(v14);

  if (!v18) {
    goto LABEL_10;
  }
  id v19 = -[NEProcessIdentity initFromXPCConnection:]( objc_alloc(&OBJC_CLASS___NEProcessIdentity),  "initFromXPCConnection:",  v12);
  objc_super v21 = v19;
  if (!self)
  {

    goto LABEL_30;
  }

  objc_setProperty_atomic(self, v20, v19, 728LL);

  id Property = objc_getProperty(self, v22, 728LL, 1);
  if (!Property)
  {
LABEL_30:
    uint64_t v42 = ne_log_obj(Property, v24);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v37 = "Failed to create a process identity from the session connection";
    v38 = (os_log_s *)v16;
    uint32_t v39 = 2;
    goto LABEL_20;
  }

  xpc_object_t v25 = xpc_dictionary_get_value(v8, "listener-endpoint");
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  unint64_t v27 = v26;
  if (v26 && xpc_get_type(v26) == (xpc_type_t)&_xpc_type_endpoint)
  {
    v28 = objc_alloc(&OBJC_CLASS___NETestAgent);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 pluginType]);
    v31 = sub_100064128((id *)&v28->super.super.isa, v30, 3LL, v5);

    if (v31)
    {
      v34 = objc_alloc(&OBJC_CLASS___NEDNSProxyPlugin);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v36 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:]( v34,  "initWithAgent:delegateQueue:andDelegate:",  v31,  v35,  self);
      -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v36);
    }

    else
    {
      uint64_t v40 = ne_log_obj(v32, v33);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to create a test agent",  buf,  2u);
      }
    }
  }

LABEL_26:
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession handleStartMessage:](&v43, "handleStartMessage:", v5);
  sub_10002B5C8((uint64_t)self, 0LL);
  if (self) {
    self->_externallyStopped = 0;
  }
LABEL_28:
}

- (void)handleStopMessageWithReason:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession handleStopMessageWithReason:](&v4, "handleStopMessageWithReason:", *(void *)&a3);
  sub_10002B5C8((uint64_t)self, 0LL);
  if (self)
  {
    self->_externallyStopped = 1;
    self->_unint64_t restartIntervalSecs = 1LL;
  }

- (void)prepareNetwork
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v2 handleNetworkPrepareResult:&stru_1000BF3D0];
}

- (BOOL)waitForPerApp
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 externalIdentifier]);
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = (void *)v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dnsProxy]);
  if (![v7 isEnabled])
  {

LABEL_9:
    return 1;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dnsProxy]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 perApp]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dnsProxy]);
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 perApp]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    objc_msgSend(v13, "updateAppRulesForUID:", objc_msgSend(v14, "unsignedIntValue"));

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dnsProxy]);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 perApp]);
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appRules]);
    id v19 = [v18 count];

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      SEL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dnsProxy]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 perApp]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 appRules]);
      xpc_object_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
      sub_10003B00C((uint64_t)v20, v24, (uint64_t)[v25 intValue]);
    }

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 dnsProxy]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 perApp]);
    id v29 = [v28 copyCachedMachOUUIDs];

    if (v29) {
      return 0;
    }
  }

  return 1;
}

- (void)install
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002EB18((uint64_t)v3);

  id v5 = sub_10002B004(self, v4);
  id v7 = v5;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = ne_log_obj(v5, v6);
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      int64_t v12 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@: failed to set the DNSProxy policies",  (uint8_t *)&v11,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v10 handleSetConfigurationResult:v7];

  if (self) {
    self->_installed = 1;
  }
}

- (void)uninstall
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMFlowDivertSession uninstall](&v5, "uninstall");
  if (self)
  {
    if (self->_externallyStopped)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002BCE0((uint64_t)v3);

      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EC00((uint64_t)v4);
    }

    self->_installed = 0;
  }

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NESMDNSProxySession;
  -[NESMVPNSession plugin:didStartWithPID:error:](&v11, "plugin:didStartWithPID:error:", v8, v6, a5);
  if ((int)v6 >= 1)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

    if (v9 == v8)
    {
      uint64_t v10 = mach_absolute_time();
      if (self)
      {
        self->_pluginStartTicks = v10;
        sub_10002B38C(self);
      }
    }
  }
}

- (void)handleUserLogin
{
}

- (void).cxx_destruct
{
}

@end