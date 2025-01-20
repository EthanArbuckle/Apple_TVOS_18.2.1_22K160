@interface NESMVPNSession
- (BOOL)establishIPCPending;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)initializePlugins;
- (BOOL)interface:(id)a3 hasIPAddress:(id)a4 currentFlags:(unint64_t)a5;
- (BOOL)isSecondaryConnection;
- (BOOL)isSecondaryInterface;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (BOOL)prepareConfigurationForStart;
- (BOOL)proxyEnabled:(id)a3;
- (BOOL)reassertedByPlugin;
- (BOOL)resetPerAppPolicy;
- (BOOL)shouldSendIPCAttachForPlugin:(id)a3;
- (BOOL)sleepOnDisconnect;
- (BOOL)stopped;
- (BOOL)supportsDefaultDrop;
- (NEDNSSettingsNetworkAgent)dnsAgent;
- (NESMSession)parent;
- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7;
- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7 sessionQueue:(id)a8 messageQueue:(id)a9 tunnelKind:(int64_t)a10 parent:(id)a11;
- (NESMVPNSessionState)stateHandler;
- (NETunnelNetworkSettings)pluginConfigurationEntities;
- (NEUserNotification)notification;
- (NEVPNAuthenticationPlugin)authenticationPlugin;
- (NEVPNProtocol)protocol;
- (NEVPNTunnelPlugin)primaryTunnelPlugin;
- (NEVirtualInterface_s)virtualInterface;
- (NSMutableArray)setConfigurationCompletionHandlerArray;
- (NSMutableDictionary)cachedStateHandlers;
- (NSMutableDictionary)connectParameters;
- (NSString)authenticationPluginBundleIdentifier;
- (NSString)delegateInterfaceAddress;
- (NSString)description;
- (NSString)extensibleSSOProvider;
- (NSString)interfaceName;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (NSString)providerDesignatedRequirement;
- (NWNetworkAgentRegistration)dnsAgentRegistration;
- (OS_xpc_object)lastStartMessage;
- (id)copyExtendedStatus;
- (id)copyStatistics;
- (id)copyTunnelInterfaceName;
- (id)pluginCompletionHandler;
- (id)pluginPIDArray;
- (int)getVirtualInterfaceMTU:(id)a3;
- (int)sessionType;
- (int64_t)agentPluginClass;
- (int64_t)parentType;
- (int64_t)state;
- (int64_t)tunnelKind;
- (unsigned)isInterfaceIPAvailable:(const char *)a3;
- (void)addDefaultDropPolicyForPluginUUIDs:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)dealloc;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleChangeEventForRankedInterfaces;
- (void)handleEstablishIPCMessage:(id)a3;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)installPended;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)plugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)plugin:(id)a3 didFinishAuthenticationWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)plugin:(id)a3 didInitializeWithUUIDs:(id)a4;
- (void)plugin:(id)a3 didRequestVirtualInterfaceWithParameters:(id)a4 completionHandler:(id)a5;
- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5;
- (void)plugin:(id)a3 didSetStatus:(int)a4 andDisconnectError:(id)a5;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidAcknowledgeSleep:(id)a3;
- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4;
- (void)pluginDidDetachIPC:(id)a3;
- (void)pluginDidDispose:(id)a3;
- (void)prepareNetwork;
- (void)queueChangesToTunnelConfiguration:(id)a3 completionHandler:(id)a4;
- (void)registerSession:(id)a3 fromClient:(id)a4;
- (void)requestInstall;
- (void)requestUninstall;
- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3;
- (void)sendEstablishIPCReply;
- (void)setAuthenticationPlugin:(id)a3;
- (void)setCachedStateHandlers:(id)a3;
- (void)setConnectParameters:(id)a3;
- (void)setDelegateInterfaceAddress:(id)a3;
- (void)setDelegateInterfaceName:(id)a3;
- (void)setDnsAgent:(id)a3;
- (void)setDnsAgentRegistration:(id)a3;
- (void)setEndpointInEstablishIPCReply:(id)a3 forPlugin:(id)a4;
- (void)setInterfaceName:(id)a3;
- (void)setIsSecondaryConnection:(BOOL)a3;
- (void)setIsSecondaryInterface:(BOOL)a3;
- (void)setLastDisconnectError:(id)a3;
- (void)setLastStartMessage:(id)a3;
- (void)setLastStopReason:(int)a3;
- (void)setNotification:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentType:(int64_t)a3;
- (void)setPluginCompletionHandler:(id)a3;
- (void)setPluginConfigurationEntities:(id)a3;
- (void)setPrimaryTunnelPlugin:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setProviderDesignatedRequirement:(id)a3;
- (void)setReassertedByPlugin:(BOOL)a3;
- (void)setSessionType:(int)a3;
- (void)setSetConfigurationCompletionHandlerArray:(id)a3;
- (void)setSleepOnDisconnect:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStateHandler:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTunnelKind:(int64_t)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4;
- (void)uninstall;
@end

@implementation NESMVPNSession

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7 sessionQueue:(id)a8 messageQueue:(id)a9 tunnelKind:(int64_t)a10 parent:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v66 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  v23 = -[NESMSession initWithConfiguration:andServer:sessionQueue:messageQueue:]( &v68,  "initWithConfiguration:andServer:sessionQueue:messageQueue:",  v17,  v18,  v20,  v21);
  v24 = v23;
  if (!v23) {
    goto LABEL_19;
  }
  id v65 = v18;
  v23->_sessionType = a7;
  v23->_state = 0LL;
  objc_storeStrong((id *)&v23->_protocol, a5);
  establishIPCReply = v24->_establishIPCReply;
  v24->_establishIPCReply = 0LL;

  establishIPCMessage = v24->_establishIPCMessage;
  v24->_establishIPCMessage = 0LL;

  dispatch_queue_attr_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v27);
  dispatch_queue_t v29 = dispatch_queue_create("tunnel changes queue", v28);
  tunnelConfigQueue = v24->_tunnelConfigQueue;
  v24->_tunnelConfigQueue = (OS_dispatch_queue *)v29;

  NEInitCFTypes();
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  setConfigurationCompletionHandlerArray = v24->_setConfigurationCompletionHandlerArray;
  v24->_setConfigurationCompletionHandlerArray = v31;

  id pluginCompletionHandler = v24->_pluginCompletionHandler;
  v24->_id pluginCompletionHandler = 0LL;

  v24->_tunnelKind = a10;
  v24->_stopped = 1;
  if (v22)
  {
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NESMAlwaysOnSession);
    if ((objc_opt_isKindOfClass(v22, v34) & 1) != 0)
    {
      uint64_t v35 = 1LL;
    }

    else
    {
      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NESMIKEv2VPNFallbackSession);
      if ((objc_opt_isKindOfClass(v22, v36) & 1) == 0) {
        abort();
      }
      uint64_t v35 = 2LL;
    }

    v24->_parentType = v35;
    objc_storeWeak((id *)&v24->_parent, v22);
  }

  if (a7 <= 6 && ((1 << a7) & 0x46) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v17 VPN]);

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v17 VPN]);
    }

    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v17 appVPN]);

      if (!v39)
      {
        uint64_t v41 = 1LL;
        goto LABEL_15;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([v17 appVPN]);
    }

    v40 = v38;
    uint64_t v41 = (uint64_t)[v38 tunnelType];

LABEL_15:
    v42 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    v44 = sub_10002E7FC((id *)&v42->super.isa, v43, a7, [v17 grade], (void *)v41, (void *)a10);
    -[NESMSession setPolicySession:](v24, "setPolicySession:", v44);

    sub_10007AFD4(v24);
  }

  v45 = -[NEPolicySession initWithSessionName:]( objc_alloc(&OBJC_CLASS___NEPolicySession),  "initWithSessionName:",  @"VPN control");
  -[NESMSession setControlPolicySession:](v24, "setControlPolicySession:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  if (!v46)
  {
    uint64_t v60 = ne_log_obj(v47, v48);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    if (!os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      v59 = 0LL;
      id v18 = v65;
      goto LABEL_24;
    }

    *(_WORD *)buf = 0;
    v62 = "Failed to create VPN control policy session";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v61, OS_LOG_TYPE_ERROR, v62, buf, 2u);
    goto LABEL_23;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  [v49 setPriority:100];

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v24, "controlPolicySession"));
  [v50 lockSessionToCurrentProcess];

  v51 = -[NEPolicySession initWithSessionName:]( objc_alloc(&OBJC_CLASS___NEPolicySession),  "initWithSessionName:",  @"VPN high");
  -[NESMSession setHighPolicySession:](v24, "setHighPolicySession:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  if (!v52)
  {
    uint64_t v63 = ne_log_obj(v53, v54);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v62 = "Failed to create VPN high policy session";
    goto LABEL_27;
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  [v55 setPriority:400];

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v24, "highPolicySession"));
  [v56 lockSessionToCurrentProcess];

  v57 = objc_alloc_init(&OBJC_CLASS___NESMVPNSessionRetryCounter);
  objc_setProperty_atomic(v24, v58, v57, 456LL);

  id v18 = v65;
LABEL_19:
  v59 = v24;
LABEL_24:

  return v59;
}

- (NESMVPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{
  return -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:]( self,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sessionQueue:messageQueue:tunnelKind:parent:",  a3,  a4,  a5,  a6,  *(void *)&a7,  0LL,  0LL,  1LL,  0LL);
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int64_t v6 = -[NESMVPNSession parentType](self, "parentType");
  if (self)
  {
    int64_t v7 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
    v8 = @"Fallback Tunnel";
    if (v7 != 2) {
      v8 = &stru_1000BF3D0;
    }
    if (v7 == 1) {
      v8 = @"Primary Tunnel";
    }
  }

  else
  {
    v8 = 0LL;
  }

  if (v6) {
    v9 = @"Child:";
  }
  else {
    v9 = &stru_1000BF3D0;
  }
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@%@:%@:%@:%@]",  v5,  v9,  v10,  v12,  v15,  v16));

  return (NSString *)v17;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession notification](self, "notification"));
    [v4 cancel];
  }

  if (-[NESMVPNSession virtualInterface](self, "virtualInterface")) {
    CFRelease(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
  }
  if (self && objc_getProperty(self, v5, 448LL, 1))
  {
    Property = (dispatch_source_s *)objc_getProperty(self, v5, 448LL, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v7, 0LL, 448LL);
  }

  sub_100022BD4(self, v5);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession dealloc](&v8, "dealloc");
}

- (void)setState:(int64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));

  if (!v5
    || (int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers")),
        SEL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3)),
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]),
        v7,
        v6,
        !v8))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NESMVPNSessionState stateWithType:](&OBJC_CLASS___NESMVPNSessionState, "stateWithType:", a3));
    if (!v9) {
      __assert_rtn("-[NESMVPNSession setState:]", "NESMVPNSession.m", 466, "0");
    }
    objc_super v8 = (void *)v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));

    if (!v10)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NESMVPNSession setCachedStateHandlers:](self, "setCachedStateHandlers:", v11);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession cachedStateHandlers](self, "cachedStateHandlers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v12 setObject:v8 forKeyedSubscript:v13];
  }

  int64_t state = self->_state;
  -[NESMVPNSessionState leave](self->_stateHandler, "leave");
  self->_int64_t state = a3;
  objc_storeStrong((id *)&self->_stateHandler, v8);
  -[NESMVPNSessionState enterWithSession:](self->_stateHandler, "enterWithSession:", self);
  if (state)
  {
    if (state == 10)
    {
      int64_t v15 = self->_state;
      if (v15 == 1) {
        goto LABEL_24;
      }
    }

    else
    {
      int64_t v15 = self->_state;
    }

    uint64_t v16 = 2LL;
    switch(v15)
    {
      case 0LL:
      case 1LL:
      case 9LL:
      case 10LL:
        if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1) {
          sub_1000229A0(self);
        }
        goto LABEL_16;
      case 2LL:
      case 3LL:
      case 7LL:
        goto LABEL_23;
      case 4LL:
        uint64_t v16 = 3LL;
        goto LABEL_23;
      case 5LL:
      case 8LL:
        uint64_t v16 = 5LL;
        goto LABEL_23;
      case 6LL:
        uint64_t v16 = 4LL;
        goto LABEL_23;
      default:
LABEL_16:
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 VPN]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 protocol]);
        unsigned int v20 = [v19 includeAllNetworks];

        if (v20)
        {
          dispatch_time_t v22 = dispatch_time(0LL, 1000000000LL);
          v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_100028FCC;
          v27[3] = &unk_1000BED80;
          v27[4] = self;
          int v28 = 1;
          dispatch_after(v22, v23, v27);

          goto LABEL_25;
        }

        uint64_t v16 = 1LL;
        if (objc_getProperty(self, v21, 464LL, 1))
        {
          Property = (void (**)(void))objc_getProperty(self, v24, 464LL, 1);
          Property[2]();
          objc_setProperty_atomic_copy(self, v26, 0LL, 464LL);
        }

- (void)addDefaultDropPolicyForPluginUUIDs:(id)a3
{
  id v4 = a3;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    int64_t v6 = self;
    id v7 = v4;
    if (v5 && v6)
    {
      objc_super v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000ADFC;
      block[3] = &unk_1000BE900;
      block[4] = v5;
      v13 = v6;
      id v14 = v7;
      dispatch_async(v8, block);
    }
  }

  else
  {
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100028DE0;
    v10[3] = &unk_1000BEBE0;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v9, v10);
  }
}

- (int64_t)agentPluginClass
{
  return 5LL;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  if (v5) {
    unsigned __int8 v6 = [v4 isEqualToString:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSString)providerBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 providerBundleIdentifier]);

  return (NSString *)v3;
}

- (NSString)authenticationPluginBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 authenticationPluginType]);

  return (NSString *)v3;
}

- (NSString)providerDesignatedRequirement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 designatedRequirement]);

  return (NSString *)v3;
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  [v5 setDesignatedRequirement:v4];
}

- (NSString)extensibleSSOProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 extensibleSSOProvider]);

  return (NSString *)v3;
}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  id v9 = a3;
  if (-[NESMVPNSession sessionType](self, "sessionType") == 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 VPN]);
LABEL_5:
    id v5 = v4;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 protocol]);

    goto LABEL_7;
  }

  if (-[NESMVPNSession sessionType](self, "sessionType") == 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 appVPN]);
    goto LABEL_5;
  }

  unsigned __int8 v6 = 0LL;
LABEL_7:
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NETunnelProviderProtocol);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    [v6 setDesignatedRequirement:v8];
  }
}

- (BOOL)initializePlugins
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));

  if (!v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);

    if (!v6)
    {
      BOOL v4 = 1;
LABEL_70:

      return v4;
    }

    if (!self) {
      goto LABEL_37;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v10 = (char *)objc_claimAutoreleasedReturnValue([v9 pluginType]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerDesignatedRequirement](self, "providerDesignatedRequirement"));
    p_vtable = (objc_class *)&OBJC_CLASS___NESMVPNSessionRetryCounter.vtable;
    id v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___NEAgent);
    if (v11)
    {
      id v15 = sub_10000B4B4();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v17 = sub_10000CB18((uint64_t)v16, v11, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"));

      if (v17)
      {
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NESMAgent);
        if (!v12)
        {
          uint64_t v67 = ne_log_obj(v18, v19);
          unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v115 = self;
            __int16 v116 = 2112;
            v117 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@: Cannot create agent for plugin type %@, missing designated requirement",  buf,  0x16u);
          }

          id v25 = 0LL;
LABEL_19:

          if (v25)
          {
            int64_t v26 = -[NESMVPNSession agentPluginClass](self, "agentPluginClass");
            dispatch_queue_attr_t v27 = &off_1000BC508;
            int v28 = &off_1000BC4D0;
            if (v26 != 3) {
              int v28 = &off_1000BC640;
            }
            if (v26 != 2) {
              dispatch_queue_attr_t v27 = v28;
            }
            id v29 = objc_alloc((Class)objc_opt_class(*v27));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            id v31 = [v29 initWithAgent:v25 delegateQueue:v30 andDelegate:self];
            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v31);

            v32 = (void *)objc_claimAutoreleasedReturnValue( -[NESMVPNSession authenticationPluginBundleIdentifier]( self,  "authenticationPluginBundleIdentifier"));
            if (!v32) {
              goto LABEL_64;
            }
            v33 = v6;
            id v34 = v32;
            uint64_t v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"VPN-%@.plist",  v33);
            uint64_t v36 = SCPreferencesCreate(0LL, @"NEPluginPreferences", v35);
            if (!v36)
            {
              uint64_t v65 = ne_log_obj(0LL, v37);
              id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                int v87 = SCError();
                v88 = SCErrorString(v87);
                *(_DWORD *)buf = 138412546;
                v115 = v33;
                __int16 v116 = 2080;
                v117 = v88;
                _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Failed to create preferences for %@: %s",  buf,  0x16u);
              }

              v61 = 0LL;
              goto LABEL_62;
            }

            v38 = v36;
            CFPropertyListRef Value = SCPreferencesGetValue(v36, @"ApplicationURL");
            CFTypeID TypeID = CFDataGetTypeID();
            if (!Value || (v42 = TypeID, CFTypeID TypeID = CFGetTypeID(Value), TypeID != v42))
            {
              uint64_t v63 = ne_log_obj(TypeID, v41);
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v115 = (NESMVPNSession *)v35;
                _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "No ApplicationURL available in %@",  buf,  0xCu);
              }

              CFRelease(v38);
              v61 = 0LL;
              p_vtable = (objc_class *)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
              goto LABEL_62;
            }

            v113[0] = 0LL;
            v43 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue( +[NSURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:]( &OBJC_CLASS___NSURL,  "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:",  Value,  0LL,  0LL,  0LL,  v113));
            id v44 = v113[0];
            CFRelease(v38);
            v106 = v44;
            if (!v43)
            {
              uint64_t v68 = ne_log_obj(v45, v46);
              v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              v105 = v69;
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v115 = v33;
                __int16 v116 = 2112;
                v117 = (const char *)v44;
                _os_log_error_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "Failed to resolve app bookmark from data for %@: %@",  buf,  0x16u);
              }

              v61 = 0LL;
              p_vtable = (objc_class *)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
              goto LABEL_61;
            }

            uint64_t v47 = -[NSBundle initWithURL:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithURL:", v43);
            v105 = v47;
            if (!v47)
            {
              uint64_t v70 = ne_log_obj(0LL, v48);
              log = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
              p_vtable = (objc_class *)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v115 = v43;
                _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create a bundle from %@",  buf,  0xCu);
              }

              v61 = 0LL;
              goto LABEL_60;
            }

            v100 = v35;
            v101 = v33;
            uint64_t v49 = objc_claimAutoreleasedReturnValue(-[os_log_s builtInPlugInsURL](v47, "builtInPlugInsURL"));
            unsigned __int8 v110 = 0;
            p_vtable = (objc_class *)&OBJC_CLASS___NESMVPNSessionRetryCounter.vtable;
            log = (os_log_s *)v49;
            if (v49)
            {
              v99 = v43;
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](log, "path"));
              if ([v51 fileExistsAtPath:v52 isDirectory:&v110])
              {
                int v53 = v110;

                v43 = v99;
                if (v53)
                {
                  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](log, "path"));
                  id v109 = 0LL;
                  v56 = (void *)objc_claimAutoreleasedReturnValue([v54 contentsOfDirectoryAtPath:v55 error:&v109]);
                  v57 = (os_log_s *)v109;

                  v102 = v57;
                  v98 = v56;
                  if (v57)
                  {
                    uint64_t v60 = ne_log_obj(v58, v59);
                    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
                    {
                      v97 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[os_log_s path](log, "path"));
                      *(_DWORD *)buf = 138412546;
                      v115 = v97;
                      __int16 v116 = 2112;
                      v117 = (const char *)v57;
                      _os_log_error_impl( (void *)&_mh_execute_header,  obj,  OS_LOG_TYPE_ERROR,  "Failed to get the contents of %@: %@",  buf,  0x16u);
                    }
                  }

                  else
                  {
                    __int128 v120 = 0u;
                    __int128 v121 = 0u;
                    __int128 v118 = 0u;
                    __int128 v119 = 0u;
                    obj = v56;
                    id v107 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v118,  buf,  16LL);
                    if (v107)
                    {
                      uint64_t v89 = *(void *)v119;
                      v90 = &AnalyticsSendEventLazy_ptr;
                      uint64_t v103 = *(void *)v119;
                      while (2)
                      {
                        for (i = 0LL; i != v107; i = (char *)i + 1)
                        {
                          if (*(void *)v119 != v89) {
                            objc_enumerationMutation(obj);
                          }
                          v92 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)i);
                          if ([v92 hasSuffix:@".vpnplugin"])
                          {
                            id v93 = [objc_alloc((Class)v90[225]) initWithString:v92 relativeToURL:log];
                            if (v93)
                            {
                              v94 = -[NSBundle initWithURL:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithURL:", v93);
                              v61 = v94;
                              if (v94)
                              {
                                v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundleIdentifier](v94, "bundleIdentifier"));
                                unsigned __int8 v96 = [v95 isEqualToString:v34];

                                v90 = &AnalyticsSendEventLazy_ptr;
                                if ((v96 & 1) != 0)
                                {

                                  p_vtable = (objc_class *)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
                                  goto LABEL_87;
                                }
                              }

                              uint64_t v89 = v103;
                            }

                            p_vtable = (objc_class *)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
                          }
                        }

                        id v107 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v118,  buf,  16LL);
                        if (v107) {
                          continue;
                        }
                        break;
                      }
                    }
                  }

                  v61 = 0LL;
LABEL_87:
                  uint64_t v35 = v100;
                  v33 = v101;
                  v43 = v99;

                  goto LABEL_59;
                }
              }

              else
              {

                v43 = v99;
              }
            }

            uint64_t v71 = ne_log_obj(v49, v50);
            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
            v102 = v72;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v115 = (NESMVPNSession *)log;
              _os_log_error_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "Invalid plugins URL: %@",  buf,  0xCu);
            }

            v61 = 0LL;
            uint64_t v35 = v100;
            v33 = v101;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
            if (v61)
            {
              v111 = @"plugin-path";
              v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundlePath](v61, "bundlePath"));
              v112 = v75;
              v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v112,  &v111,  1LL));

              id v77 = objc_alloc(p_vtable + 317);
              v78 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
              id v79 = [v77 initWithPluginType:v34 pluginVersion:0 pluginClass:1 pluginInfo:v76 userID:v78];

              v80 = objc_alloc(&OBJC_CLASS___NEVPNAuthenticationPlugin);
              v81 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
              v82 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:]( v80,  "initWithAgent:delegateQueue:andDelegate:",  v79,  v81,  self);
              -[NESMVPNSession setAuthenticationPlugin:](self, "setAuthenticationPlugin:", v82);

LABEL_64:
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
              BOOL v4 = v83 != 0LL;

              id v34 = v32;
LABEL_69:

              goto LABEL_70;
            }

            uint64_t v84 = ne_log_obj(v73, v74);
            v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v115 = self;
              __int16 v116 = 2112;
              v117 = (const char *)v34;
              _os_log_error_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_ERROR,  "%@: Failed to obtain the bundle for %@",  buf,  0x16u);
            }

            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", 0LL);
LABEL_68:
            BOOL v4 = 0;
            goto LABEL_69;
          }

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  if (!v6)
  {
LABEL_12:
    v4[2](v4, 1LL);
    goto LABEL_13;
  }

  if (+[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v6))
  {
    v4[2](v4, (uint64_t)[v6 hasPrefix:@"com.apple."]);
    goto LABEL_13;
  }

  if ((id)-[NESMVPNSession state](self, "state") == (id)9)
  {
    uint64_t v9 = ne_log_obj(9LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin is being updated",  (uint8_t *)&v24,  0xCu);
    }

    v4[2](v4, 0LL);
    goto LABEL_13;
  }

  id v11 = sub_10000B4B4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int v13 = sub_10000CB18((uint64_t)v12, v7, -[NESMVPNSession agentPluginClass](self, "agentPluginClass"));

  if (v13)
  {
    uint64_t v16 = ne_log_obj(v14, v15);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin is registered with provider manager",  (uint8_t *)&v24,  0xCu);
    }

    goto LABEL_12;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession providerBundleIdentifier](self, "providerBundleIdentifier"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v18,  v6,  -[NESMVPNSession agentPluginClass](self, "agentPluginClass"),  0LL));

  if (!v19)
  {
    uint64_t v22 = ne_log_obj(v20, v21);
    int64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin is not available in launch services",  (uint8_t *)&v24,  0xCu);
    }
  }

  v4[2](v4, v19 != 0LL);

LABEL_13:
}

- (void)handleInitializeState
{
  v2 = self;
  objc_sync_enter(v2);
  if ((id)-[NESMVPNSession parentType](v2, "parentType") == (id)1
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v2, "interfaceName")),
        v3,
        v3))
  {
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v2, "interfaceName"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%d",  v6,  v7,  -[NESMVPNSession type](v2, "type")));
    -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v8);
  }

  else
  {
    id v9 = -[NESMVPNSession tunnelKind](v2, "tunnelKind");
    v10 = @"Fallback Tunnel";
    if (v9 == (id)1) {
      v10 = @"Primary Tunnel";
    }
    BOOL v4 = v10;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%d",  v7,  v4,  -[NESMVPNSession type](v2, "type")));
    -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v8);
  }

  -[NESMSession setupFromAuxiliaryData](v2, "setupFromAuxiliaryData");
  objc_sync_exit(v2);

  -[NESMVPNSession setState:](v2, "setState:", 1LL);
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_object_t value = xpc_dictionary_get_value(xdict, "SessionOptions");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NESMVPNSession setConnectParameters:](self, "setConnectParameters:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serverAddress]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serverAddress]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    [v11 setObject:v10 forKeyedSubscript:@"ServerAddress"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 username]);

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    [v16 setObject:v15 forKeyedSubscript:@"AccountName"];
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 passwordKeychainItem]);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 passwordKeychainItem]);
    id v22 = [v21 domain];

    if (v22) {
      goto LABEL_10;
    }
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 passwordKeychainItem]);
    id v17 = [v24 copyPassword];

    if (v17)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      [v25 setObject:v17 forKeyedSubscript:@"Password"];
    }
  }

LABEL_10:
  int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  unsigned int v27 = [v26 disconnectOnIdle];

  if (v27)
  {
    int v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v28 disconnectOnIdleTimeout]));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
    [v30 setObject:v29 forKeyedSubscript:@"IdleTimer"];
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  id v32 = [v31 type];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  id v34 = v33;
  if (v32 == (id)4)
  {
    if (![v33 authenticationMethod])
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      [v35 setObject:@"Password" forKeyedSubscript:@"AuthMethod"];
    }

    if ([v34 authenticationMethod] == (id)1)
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      [v36 setObject:@"Certificate" forKeyedSubscript:@"AuthMethod"];

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identityReferenceInternal]);

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 identityReferenceInternal]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
        [v41 setObject:v40 forKeyedSubscript:@"CertificateRef"];
      }
    }

    CFTypeID v42 = (void *)objc_claimAutoreleasedReturnValue([v34 providerConfiguration]);

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v34 providerConfiguration]);
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      [v44 setObject:v43 forKeyedSubscript:@"VendorData"];
    }

    if (!v5)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
      unsigned __int8 v82 = +[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v81);

      if ((v82 & 1) != 0)
      {
LABEL_57:

        goto LABEL_58;
      }

      uint64_t v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NESMVPNSession setConnectParameters:](self, "setConnectParameters:", v45);
      goto LABEL_56;
    }

    uint64_t v45 = (NSMutableDictionary *)_CFXPCCreateCFObjectFromXPCObject(v5);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginType](self, "pluginType"));
    unsigned int v47 = +[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v46);

    if (!v47)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
      [v83 addEntriesFromDictionary:v45];
LABEL_55:

      goto LABEL_56;
    }

    uint64_t v48 = kSCEntNetVPN;
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", kSCEntNetVPN));
    int v50 = isa_nsdictionary(v49);

    if (!v50)
    {
LABEL_53:
      unsigned __int8 v96 = (void *)objc_claimAutoreleasedReturnValue([v34 pluginType]);
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", v96));
      int v98 = isa_nsdictionary(v97);

      if (v98)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue([v34 pluginType]);
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", v83));
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession connectParameters](self, "connectParameters"));
        [v100 setObject:v99 forKeyedSubscript:@"VendorData"];

        goto LABEL_55;
      }

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    uint64_t v8 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    id v9 = v6;
    id v10 = v7;
    id v11 = self;
    if (v8)
    {
      id v12 = (id)-[NESMSession status](v8, "status");
      if ((_DWORD)v12 == 1)
      {
        uint64_t v14 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](v8, "messageQueue"));
        dispatch_suspend(v14);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v8, "server"));
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        id v22 = sub_1000862F4;
        int64_t v23 = &unk_1000BE9A0;
        int v24 = v8;
        id v25 = (NESMVPNSession *)v10;
        int64_t v26 = v11;
        id v27 = v9;
        [v15 registerSession:v8 withCompletionHandler:&buf];

        uint64_t v16 = v25;
      }

      else
      {
        uint64_t v17 = ne_log_obj(v12, v13);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ Already registered",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v11, "queue"));
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        id v22 = sub_1000863B4;
        int64_t v23 = &unk_1000BEBE0;
        int v24 = v11;
        id v25 = (NESMVPNSession *)v9;
        dispatch_async(v19, &buf);

        uint64_t v16 = v24;
      }
    }
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
    -[NESMSession registerSession:fromClient:](&v20, "registerSession:fromClient:", v6, v7);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  -[NESMVPNSession setLastStartMessage:](self, "setLastStartMessage:", v4);
  -[NESMVPNSession setStopped:](self, "setStopped:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 externalIdentifier]);
  if (!v6)
  {

LABEL_7:
    if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)1) {
      sub_10002224C(self);
    }
    if ((id)-[NESMVPNSession state](self, "state") != (id)9)
    {
      v35.receiver = self;
      v35.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
      -[NESMSession handleStartMessage:](&v35, "handleStartMessage:", v4);
    }

    xpc_object_t value = xpc_dictionary_get_value(v4, "SessionOptions");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    if (v15) {
      goto LABEL_12;
    }
    if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v13, "test-agent")) {
      goto LABEL_13;
    }
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(remote_connection);
    uint64_t v15 = (void *)v17;
    if (v17)
    {
      uint64_t v19 = (void *)xpc_connection_copy_entitlement_value(v17, "com.apple.private.networkextension.test-control");
      objc_super v20 = v19;
      if (v19 && xpc_get_type(v19) == (xpc_type_t)&_xpc_type_BOOL)
      {
        BOOL v24 = xpc_BOOL_get_value(v20);

        if (v24)
        {
          id v25 = objc_alloc(&OBJC_CLASS___NETestAgent);
          int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pluginType]);
          int v28 = sub_100064128( (id *)&v25->super.super.isa,  v27,  -[NESMVPNSession agentPluginClass](self, "agentPluginClass"),  v4);

          if (v28)
          {
            id v31 = objc_alloc(&OBJC_CLASS___NEVPNTunnelPlugin);
            id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            v33 = -[NEVPNTunnelPlugin initWithAgent:delegateQueue:andDelegate:]( v31,  "initWithAgent:delegateQueue:andDelegate:",  v28,  v32,  self);
            -[NESMVPNSession setPrimaryTunnelPlugin:](self, "setPrimaryTunnelPlugin:", v33);
          }

          else
          {
            uint64_t v34 = ne_log_obj(v29, v30);
            id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Failed to create a test agent",  buf,  2u);
            }
          }

LABEL_12:
LABEL_13:
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
          [v15 handleStartMessage:v4];
LABEL_14:

          goto LABEL_15;
        }
      }

      else
      {
      }
    }

    uint64_t v21 = ne_log_obj(v17, v18);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v37 = (NESMVPNSession *)"com.apple.private.networkextension.test-control";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Test provider does not have the %s entitlement",  buf,  0xCu);
    }

    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    [v23 handleStartMessage:v4];

    goto LABEL_14;
  }

  id v7 = (void *)v6;
  unsigned int v8 = -[NESMSession waitForPerApp](self, "waitForPerApp");

  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v11 = ne_log_obj(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v37 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Ignore start for perApp session - no appRule or app not installed",  buf,  0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v13 handleStop];
LABEL_15:
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NESMVPNSession setStopped:](self, "setStopped:", 1LL);
  -[NESMVPNSession setLastStartMessage:](self, "setLastStartMessage:", 0LL);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession handleStopMessageWithReason:](&v10, "handleStopMessageWithReason:", v3);
  if (-[NESMSession status](self, "status") && -[NESMSession status](self, "status") != 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    [v7 handleStop];
  }

  else
  {
    id v5 = sub_10004F238((uint64_t)&OBJC_CLASS___NESMServer);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100028DC8;
    v8[3] = &unk_1000BED80;
    int v9 = v3;
    v8[4] = self;
    sub_1000530F0((uint64_t)v6, self, v8);
  }

- (void)handleEstablishIPCMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  unsigned int v6 = -[NESMSession status](self, "status");
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(remote_connection);
  int v9 = (_xpc_connection_s *)v8;
  if (!v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_connection_send_message(v9, reply);

    goto LABEL_20;
  }

  objc_super v10 = (void *)xpc_connection_copy_entitlement_value(v8, "com.apple.developer.networking.networkextension");

  if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_array || (NEGetEntitlement(v10) & 3) == 0) {
    goto LABEL_10;
  }
  xpc_connection_t v11 = xpc_dictionary_get_remote_connection(v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)xpc_connection_copy_entitlement_value(v12, "application-identifier");

  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_string)
  {
    xpc_connection_t v14 = xpc_dictionary_get_remote_connection(v4);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = xpc_connection_copy_entitlement_value(v15, "com.apple.application-identifier");

    uint64_t v13 = (void *)v16;
    if (!v16) {
      goto LABEL_9;
    }
  }

  if (xpc_get_type(v13) != (xpc_type_t)&_xpc_type_string
    || (v43 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v13)),  id v44 = (void *)objc_claimAutoreleasedReturnValue(v43),  v45 = NEGetBundleIdentifierFromAppID(),  v46 = (void *)objc_claimAutoreleasedReturnValue(v45),  v44,  !v46))
  {
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v47 = objc_claimAutoreleasedReturnValue([v5 pluginType]);
  if (!v47)
  {

    goto LABEL_9;
  }

  uint64_t v48 = (void *)v47;
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);
  unsigned __int8 v50 = [v46 hasPrefix:v49];

  if ((v50 & 1) != 0) {
    goto LABEL_23;
  }
LABEL_10:
  xpc_connection_t v17 = xpc_dictionary_get_remote_connection(v4);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)xpc_connection_copy_entitlement_value(v18, "com.apple.private.nehelper.privileged");

  if (v19 && xpc_get_type(v19) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v19))
  {
    objc_super v10 = v19;
    goto LABEL_23;
  }

  xpc_connection_t v20 = xpc_dictionary_get_remote_connection(v4);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_super v10 = (void *)xpc_connection_copy_entitlement_value(v21, "com.apple.private.networkextension.configuration");

  if (v10)
  {
    type = (const char *)xpc_get_type(v10);
    if (type == (const char *)&_xpc_type_string)
    {
      type = xpc_string_get_string_ptr(v10);
      if (type)
      {
        type = (const char *)strcmp(type, "super");
        if (!(_DWORD)type)
        {
LABEL_23:
          BOOL v30 = -[NESMVPNSession establishIPCPending](self, "establishIPCPending");
          if (!v30)
          {
            xpc_connection_t v35 = xpc_dictionary_get_remote_connection(v4);
            uint64_t v36 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v35);
            uint64_t v37 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  xpc_connection_get_euid(v36));
            v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            -[NESMSession setUID:](self, "setUID:", v38);

            if (self) {
              objc_setProperty_atomic(self, v39, v4, 392LL);
            }
            id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
            [v27 handleEstablishIPC];
            goto LABEL_18;
          }

          uint64_t v32 = ne_log_obj(v30, v31);
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            xpc_connection_t v33 = xpc_dictionary_get_remote_connection(v4);
            uint64_t v34 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v33);
            int v51 = 138412546;
            uint64_t v52 = self;
            __int16 v53 = 1024;
            pid_t pid = xpc_connection_get_pid(v34);
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: cannot establish IPC with %d because IPC is already in the process of being established",  (uint8_t *)&v51,  0x12u);
LABEL_30:

            goto LABEL_17;
          }

          goto LABEL_17;
        }
      }
    }
  }

  uint64_t v24 = ne_log_obj(type, v23);
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    xpc_connection_t v40 = xpc_dictionary_get_remote_connection(v4);
    uint64_t v34 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v40);
    pid_t v41 = xpc_connection_get_pid(v34);
    CFTypeID v42 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);
    int v51 = 138412802;
    uint64_t v52 = self;
    __int16 v53 = 1024;
    pid_t pid = v41;
    __int16 v55 = 2112;
    v56 = v42;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%@: process %d is not entitled to establish IPC with plugins of type %@",  (uint8_t *)&v51,  0x1Cu);

    goto LABEL_30;
  }

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = -[NESMVPNSession copyExtendedStatus](self, "copyExtendedStatus");
  }

  else
  {
    if (a4 != 1) {
      goto LABEL_7;
    }
    id v7 = -[NESMVPNSession copyStatistics](self, "copyStatistics");
  }

  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
    xpc_dictionary_set_value(reply, "SessionInfo", v9);
  }

- (id)copyStatistics
{
  if (!-[NESMVPNSession virtualInterface](self, "virtualInterface")) {
    return 0LL;
  }
  uint64_t v3 = NEVirtualInterfaceCopyStatistics(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
  id v4 = (void *)v3;
  if (v3)
  {
    id v7 = @"VPN";
    uint64_t v8 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)copyExtendedStatus
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  id v4 = -[NESMSession copyExtendedStatus](&v82, "copyExtendedStatus");
  id v5 = -[NSMutableDictionary initWithDictionary:](v3, "initWithDictionary:", v4);

  v80 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    uint64_t v76 = NEVirtualInterfaceCopyVPNServerAddress(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
    if ([v9 type] == (id)1)
    {
      BOOL v10 = 1LL;
    }

    else
    {
      xpc_connection_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 VPN]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 protocol]);
      if ([v19 type] == (id)2)
      {
        BOOL v10 = 1LL;
      }

      else
      {
        int v74 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        uint64_t v71 = v6;
        xpc_connection_t v20 = (void *)objc_claimAutoreleasedReturnValue([v74 VPN]);
        id v79 = v17;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 protocol]);
        BOOL v10 = [v21 type] == (id)3;

        xpc_connection_t v17 = v79;
        unsigned int v6 = v71;
      }
    }

    int v78 = (void *)NEVirtualInterfaceCopyIPStateDictionary( -[NESMVPNSession virtualInterface](self, "virtualInterface"),  2LL,  v10);
    id v12 = (void *)NEVirtualInterfaceCopyIPStateDictionary( -[NESMVPNSession virtualInterface](self, "virtualInterface"),  30LL,  v10);
    uint64_t v13 = (void *)NEVirtualInterfaceCopyDNSDomain(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    xpc_connection_t v14 = (void *)NEVirtualInterfaceCopyDNSServers(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    uint64_t v15 = (void *)NEVirtualInterfaceCopyDNSSearchDomains(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    matched = (void *)NEVirtualInterfaceCopyDNSSupplementalMatchDomains(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
    uint64_t v11 = v76;
    if (v76) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v80,  "setObject:forKeyedSubscript:",  v76,  @"RemoteAddress");
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    int v78 = 0LL;
    id v12 = 0LL;
    uint64_t v13 = 0LL;
    xpc_connection_t v14 = 0LL;
    uint64_t v15 = 0LL;
    matched = 0LL;
  }

  id v77 = (void *)v11;
  if (-[NESMSession status](self, "status") == 3)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[NESMSession connectTime](self, "connectTime")));
    uint64_t v23 = @"ConnectTime";
  }

  else
  {
    if (-[NESMSession status](self, "status") == 2) {
      goto LABEL_16;
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NESMSession lastStopReason](self, "lastStopReason")));
    uint64_t v23 = @"LastCause";
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v80, "setObject:forKeyedSubscript:", v22, v23);

LABEL_16:
  v75 = matched;
  if ((sub_100077340(self) & 1) != 0 || sub_100077444(self))
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession matchedRule](self, "matchedRule"));

    if (v24)
    {
      id v25 = v15;
      xpc_connection_t v26 = v14;
      id v27 = v13;
      xpc_object_t v28 = v6;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession matchedRule](self, "matchedRule"));
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v29 action]));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v80,  "setObject:forKeyedSubscript:",  v30,  @"OnDemandAction");

      unsigned int v6 = v28;
      uint64_t v13 = v27;
      xpc_connection_t v14 = v26;
      uint64_t v15 = v25;
      matched = v75;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v80, @"VPN");
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NESMVPNSession state](self, "state")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v31, @"SessionState");

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NESMSession status](self, "status")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, @"NEStatus");

  xpc_connection_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NESMSession SCNCStatus](self, "SCNCStatus")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, @"Status");

  if (v78)
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:@"IsNULL"]);
    xpc_connection_t v35 = v34;
  }

  if (v12)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"IsNULL"]);
    uint64_t v37 = v36;
  }

  uint64_t v73 = v12;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NESMSession connectCount](self, "connectCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v38, @"ConnectCount");

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NESMSession connectedCount](self, "connectedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v39, @"ConnectedCount");

  xpc_connection_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NESMSession disconnectedCount](self, "disconnectedCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v40,  @"DisconnectedCount");

  pid_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[NESMSession maxConnectTime](self, "maxConnectTime")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v41, @"MaxConnectTime");

  CFTypeID v42 = v77;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    int v69 = v13;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v45 = self;
    if (v43)
    {
      id Property = objc_getProperty(v43, v44, 408LL, 1);
      uint64_t v47 = -1LL;
      if (v45 && Property)
      {
        id v72 = v6;
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v45, "interfaceName"));

        if (v48)
        {
          id v50 = objc_getProperty(v43, v49, 408LL, 1);
          int v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v45, "interfaceName"));
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v51]);

          if (v52)
          {
            uint64_t v47 = v52[1];
          }

          else
          {
            uint64_t v47 = -1LL;
          }
        }

        unsigned int v6 = v72;
      }
    }

    else
    {
      uint64_t v47 = 0LL;
    }

    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v47));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v53, @"RetryInterval");

    matched = v75;
    CFTypeID v42 = v77;
    uint64_t v13 = v69;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"ConnectionStatistics");
  int v54 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](self, "lastDisconnectError"));
  if (v54)
  {
    uint64_t v70 = v14;
    __int16 v55 = v13;
    v56 = v42;
    id v81 = 0LL;
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v54,  1LL,  &v81));
    id v58 = v81;
    uint64_t v60 = v58;
    if (v57)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v57,  @"LastDisconnectError");
    }

    else
    {
      uint64_t v61 = ne_log_obj(v58, v59);
      uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v84 = v60;
        _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Failed to serialize the last disconnect error: %@",  buf,  0xCu);
      }
    }

    CFTypeID v42 = v56;
    uint64_t v13 = v55;
    xpc_connection_t v14 = v70;
    matched = v75;
  }

  uint64_t v63 = v42;
  int v64 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](self, "lastStatusChangeTime"));

  if (v64)
  {
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](self, "lastStatusChangeTime"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v65,  @"LastStatusChangeTime");
  }

  if (v14) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, @"DNSServers");
  }
  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, @"DNSDomain");
  }
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v15,  @"DNSSearchDomains");
  }
  if (matched) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  matched,  @"DNSSupplementalMatchDomains");
  }
  id v66 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  NEVirtualInterfaceIsPrimary(-[NESMVPNSession virtualInterface](self, "virtualInterface")));
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v67,  @"IsPrimaryInterface");

  return v5;
}

- (BOOL)handleSleep
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028D98;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

- (void)handleSleepTime:(double)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100028CEC;
  v6[3] = &unk_1000BEB20;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)handleWakeup
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028CA4;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleUserLogout
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028C5C;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleUserSwitch
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028C14;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)interface:(id)a3 hasIPAddress:(id)a4 currentFlags:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = NEGetAddressFamilyFromString();
  int v11 = v10;
  if ((v5 & 1) == 0 && v10 == 2)
  {
LABEL_3:
    unsigned __int8 v12 = 0;
    goto LABEL_4;
  }

  unsigned __int8 v12 = 0;
  BOOL v15 = (v5 & 2) == 0 && v10 == 30;
  if (v10 && !v15)
  {
    uint64_t v31 = 0LL;
    v32[0] = 0LL;
    v32[1] = 0LL;
    BYTE1(v32[0]) = v10;
    strncpy(__dst, (const char *)[v8 UTF8String], 0xFuLL);
    int v16 = socket(v11, 2, 0);
    int v17 = ioctl(v16, 0xC0206921uLL, __dst);
    uint64_t v18 = close(v16);
    if (v17 < 0)
    {
      uint64_t v22 = ne_log_obj(v18, v19);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = __error();
        id v25 = strerror(*v24);
        *(_DWORD *)__int128 buf = 138412546;
        id v27 = self;
        __int16 v28 = 2080;
        uint64_t v29 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%@: ioctl(SIOCGIFADDR) failed: %s",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v20 = NECreateAddressString(v32);
      if (v20)
      {
        uint64_t v21 = (const void *)v20;
        unsigned __int8 v12 = [v9 isEqualToString:v20];
        CFRelease(v21);
        goto LABEL_4;
      }
    }

    goto LABEL_3;
  }

- (id)pluginPIDArray
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
  if (v4)
  {
    char v5 = (void *)v4;
    unsigned int v6 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    unsigned int v7 = sub_100016694(v6);

    if (v7)
    {
      id v8 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
      id v9 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sub_100016694(v8));
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[NSMutableArray addObject:](v3, "addObject:", v10);
    }
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
  if (v11)
  {
    unsigned __int8 v12 = (void *)v11;
    uint64_t v13 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
    unsigned int v14 = sub_100016694(v13);

    if (v14)
    {
      BOOL v15 = (unsigned int *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession authenticationPlugin](self, "authenticationPlugin"));
      int v16 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sub_100016694(v15));
      int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[NSMutableArray addObject:](v3, "addObject:", v17);
    }
  }

  return v3;
}

- (BOOL)proxyEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = SCDynamicStoreCopyProxiesWithOptions(0LL, 0LL);
  uint64_t v10 = v4;
  if (v4)
  {
    char v5 = (const __CFArray *)SCNetworkProxiesCopyMatching(v4, 0LL, v3);
    unsigned int v6 = v5;
    id v9 = v5;
    if (v5)
    {
      if (CFArrayGetCount(v5) < 1) {
        goto LABEL_15;
      }
      ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v6, 0LL);
      unsigned int v6 = ValueAtIndex;
      if (ValueAtIndex)
      {
        if (NEGetIntFromDictionary(ValueAtIndex, kSCPropNetProxiesHTTPEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesHTTPSEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesProxyAutoConfigEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesFTPEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesGopherEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesRTSPEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesSOCKSEnable, 0LL)
          || NEGetIntFromDictionary(v6, kSCPropNetProxiesProxyAutoDiscoveryEnable, 0LL))
        {
          LOBYTE(v6) = 1;
          goto LABEL_16;
        }

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:]( &v14,  "handleChangeEventForInterface:newFlags:previousFlags:",  v8,  a4,  a5);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028760;
  block[3] = &unk_1000BE8D8;
  block[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)handleNetworkPrepareResult:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  id v4 = a3;
  -[NESMSession handleNetworkPrepareResult:](&v6, "handleNetworkPrepareResult:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler", v6.receiver, v6.super_class));
  [v5 handleNetworkPrepareResult:v4];
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 1)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100028684;
    v8[3] = &unk_1000BED80;
    v8[4] = self;
    int v9 = a3;
    dispatch_async(v7, v8);
  }

- (void)handleCaptiveNetworkPluginsChanged
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    objc_super v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: handleCaptiveNetworkPluginsChanged",  (uint8_t *)&v5,  0xCu);
  }

  sub_10002224C(self);
}

- (void)handleChangeEventForRankedInterfaces
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = -[NESMVPNSession stopped](self, "stopped");
    uint64_t v6 = ne_session_status_to_string(-[NESMSession status](self, "status"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
    int v19 = 138413058;
    uint64_t v20 = self;
    __int16 v21 = 1024;
    *(_DWORD *)uint64_t v22 = v5;
    *(_WORD *)&v22[4] = 2080;
    *(void *)&v22[6] = v6;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = [v9 includeAllNetworks];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@: handleChangeEventForRankedInterfaces - stopped %d status %s includeAllNetworks %d",  (uint8_t *)&v19,  0x22u);
  }

  if (!-[NESMVPNSession stopped](self, "stopped") && -[NESMSession status](self, "status") == 3)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 VPN]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 protocol]);
    unsigned int v13 = [v12 includeAllNetworks];

    if (v13)
    {
      uint64_t v14 = sub_100024D3C(self);
      if ((v14 & 1) == 0)
      {
        uint64_t v16 = ne_log_obj(v14, v15);
        int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
          int v19 = 138412802;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          *(void *)uint64_t v22 = v18;
          *(_WORD *)&v22[8] = 2080;
          *(void *)&v22[10] = "-[NESMVPNSession handleChangeEventForRankedInterfaces]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s: applyTunnelDataPolicies failed",  (uint8_t *)&v19,  0x20u);
        }
      }
    }
  }

- (void)pluginDidDispose:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v5 handlePluginDisposeComplete:v4];

  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v6 = self;
    if (v9)
    {
      if (v6)
      {
        unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000AED8;
        block[3] = &unk_1000BEBE0;
        block[4] = v9;
        id v12 = v6;
        dispatch_async(v7, block);
      }
    }
  }

  else
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100028640;
    v10[3] = &unk_1000BEC08;
    v10[4] = self;
    dispatch_async(v8, v10);
  }

- (void)plugin:(id)a3 didFinishAuthenticationWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v13 handlePlugin:v12 authenticationCompleteWithResults:v11 status:v6 andError:v10];
}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  if ((id)-[NESMVPNSession parentType](self, "parentType", a3) == (id)2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    sub_100085770(v5);
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    sub_100051C0C(v5, v4);
  }
}

- (void)pluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v5 handlePluginDidDetachIPC:v4];
}

- (void)plugin:(id)a3 didSetStatus:(int)a4 andDisconnectError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 != 6 && a4)
  {
    uint64_t v13 = 0LL;
    goto LABEL_35;
  }

  if (!v9)
  {
    uint64_t v13 = 3LL;
    goto LABEL_35;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  unsigned int v12 = [v11 isEqualToString:@"NEAgentErrorDomain"];

  if (v12)
  {
    if ([v10 code] == (id)2)
    {
      uint64_t v13 = 6LL;
    }

    else if ([v10 code] == (id)1)
    {
      uint64_t v13 = 7LL;
    }

    else
    {
      uint64_t v13 = 3LL;
    }

    goto LABEL_34;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  unsigned int v15 = [v14 isEqualToString:kCFErrorDomainVPNTunnel];

  if (v15)
  {
    uint64_t v16 = (uint64_t)[v10 code];
    if (v16 <= 199)
    {
      switch(v16)
      {
        case 'd':
          uint64_t v13 = 10LL;
          break;
        case 'e':
          uint64_t v13 = 15LL;
          break;
        case 'f':
          uint64_t v13 = 16LL;
          break;
        case 'g':
          uint64_t v13 = 17LL;
          break;
        case 'h':
          uint64_t v13 = 18LL;
          break;
        case 'i':
          uint64_t v13 = 19LL;
          break;
        case 'j':
          uint64_t v13 = 20LL;
          break;
        case 'k':
          uint64_t v13 = 21LL;
          break;
        case 'l':
          uint64_t v13 = 22LL;
          break;
        default:
          if (v16 == 1)
          {
            uint64_t v13 = 7LL;
          }

          else
          {
            if (v16 != 2) {
              goto LABEL_33;
            }
            uint64_t v13 = 14LL;
          }

          break;
      }

      goto LABEL_34;
    }

    if (v16 > 399)
    {
      if (v16 <= 499)
      {
        switch(v16)
        {
          case 400LL:
            uint64_t v13 = 24LL;
            break;
          case 401LL:
            uint64_t v13 = 25LL;
            break;
          case 402LL:
            uint64_t v13 = 26LL;
            break;
          case 403LL:
            uint64_t v13 = 27LL;
            break;
          default:
            goto LABEL_33;
        }

        goto LABEL_34;
      }

      switch(v16)
      {
        case 500LL:
          uint64_t v13 = 28LL;
          goto LABEL_34;
        case 501LL:
          uint64_t v13 = 29LL;
          goto LABEL_34;
        case 502LL:
          uint64_t v13 = 30LL;
          goto LABEL_34;
      }

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  uint64_t v7 = ne_log_obj(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%@: Handling clear config request: session interface %@",  (uint8_t *)&v13,  0x16u);
  }

  -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  unsigned int v10 = [v9 handleClearConfiguration];

  if (v10)
  {
    -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", 0LL);
  }

  else if (v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  1LL,  0LL));
    v5[2](v5, v11);
    -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", 0LL);
  }
}

- (void)plugin:(id)a3 didRequestVirtualInterfaceWithParameters:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (char *)[v8 type];
  uint64_t v11 = kdebug_trace(726990972LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v13 = ne_log_obj(v11, v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Creating a virtual interface with type %ld",  buf,  0xCu);
  }

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100028308;
  v74[3] = &unk_1000BEC08;
  v74[4] = self;
  __int16 v15 = objc_retainBlock(v74);
  int v17 = (void (**)(void))v15;
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 == (char *)3)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v8 ethernetAddress]);
      if (v23)
      {
        uint64_t v25 = (void *)v23;
        xpc_connection_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 mtu]);

        if (v26)
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          uint64_t v68 = sub_100028500;
          int v69 = &unk_1000BD8A0;
          uint64_t v70 = self;
          id v27 = v8;
          id v71 = v27;
          id v72 = v17;
          id v73 = v9;
          __int16 v28 = v67;
          if (v27)
          {
            id v29 = [v27 type];
            if (v29 == (id)3)
            {
              uint64_t v31 = objc_claimAutoreleasedReturnValue([v27 ethernetAddress]);
              if (v31)
              {
                xpc_connection_t v33 = (void *)v31;
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v27 mtu]);

                if (v34)
                {
                  v78[0] = @"Product Name";
                  v78[1] = kIOUserEthernetInterfaceRole;
                  *(void *)__int128 buf = @"TAP network interface";
                  *(void *)&buf[8] = @"TAP";
                  v78[2] = @"HiddenInterface";
                  v78[3] = @"IsEphemeral";
                  *(void *)&uint8_t buf[16] = &__kCFBooleanTrue;
                  v80 = &__kCFBooleanTrue;
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v78,  4LL));
                  v76[0] = kIOEthernetHardwareAddress;
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v27 ethernetAddress]);
                  v77[0] = v36;
                  v76[1] = @"MaxTransferUnit";
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v27 mtu]);
                  v77[1] = v37;
                  v77[2] = @"utap";
                  v76[2] = @"NamePrefix";
                  v76[3] = kIOUserEthernetInterfaceMergeProperties;
                  v77[3] = v35;
                  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  4LL));

                  uint64_t v39 = IOEthernetControllerCreate(kCFAllocatorDefault, v38);
                  if (v39)
                  {
                    SEL v41 = (const void *)v39;
                    dispatch_queue_attr_t v42 = dispatch_queue_attr_make_with_autorelease_frequency( 0LL,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v43 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v42);
                    dispatch_queue_t v44 = dispatch_queue_create("User Ethernet Controller queue", v43);

                    IOEthernetControllerSetDispatchQueue(v41, v44);
                    __int16 v45 = objc_alloc_init(&OBJC_CLASS____NECompletion);
                    p_isa = (id *)&v45->super.isa;
                    if (v45)
                    {
                      objc_setProperty_nonatomic_copy(v45, v46, v28, 16LL);
                      objc_storeStrong(p_isa + 1, a4);
                    }

                    id v48 = p_isa;
                    IOEthernetControllerRegisterBSDAttachCallback(v41, sub_10007E770, v48);
                    uint64_t v49 = IOEthernetControllerSetLinkStatus(v41, 1LL);
                    if ((_DWORD)v49)
                    {
                      uint64_t v51 = ne_log_obj(v49, v50);
                      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)v75 = 0;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "Failed to bring up the user ethernet link",  v75,  2u);
                      }

                      IOEthernetControllerSetDispatchQueue(v41, 0LL);
                      CFRelease(v41);
                      sub_10007E770(0LL, v48);
                    }
                  }

                  else
                  {
                    uint64_t v63 = ne_log_obj(0LL, v40);
                    int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)v75 = 0;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Failed to create a ethernet controller",  v75,  2u);
                    }

                    v68((uint64_t)v28, 0LL);
                  }

                  goto LABEL_42;
                }
              }

              uint64_t v60 = ne_log_obj(v31, v32);
              id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v27 ethernetAddress]);
                id v66 = (void *)objc_claimAutoreleasedReturnValue([v27 mtu]);
                *(_DWORD *)__int128 buf = 134218240;
                *(void *)&uint8_t buf[4] = v65;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v66;
                _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Cannot create a user ethernet interface without an ethernet address (%p) or an MTU (%p)",  buf,  0x16u);
              }
            }

            else
            {
              uint64_t v57 = ne_log_obj(v29, v30);
              id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                id v59 = [v27 type];
                *(_DWORD *)__int128 buf = 134217984;
                *(void *)&uint8_t buf[4] = v59;
                _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Wrong type for creating a user ethernet interface: %ld",  buf,  0xCu);
              }
            }

            v68((uint64_t)v28, 0LL);
          }

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v56 = a3;
  id v8 = a5;
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    id v9 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    id v10 = v56;
    uint64_t v11 = self;
    id v12 = v8;
    uint64_t v14 = v12;
    if (v9 && v11)
    {
      if ((_DWORD)v6)
      {
        __int16 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v9, "queue"));
        *(void *)block = _NSConcreteStackBlock;
        *(void *)&block[8] = 3221225472LL;
        *(void *)&block[16] = sub_10000A63C;
        id v59 = &unk_1000BD4C8;
        uint64_t v60 = v9;
        int v64 = v6;
        id v61 = v10;
        uint64_t v62 = v11;
        id v63 = v14;
        dispatch_async(v15, block);
      }

      else
      {
        uint64_t v49 = ne_log_obj(v12, v13);
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)block = 138412546;
          *(void *)&block[4] = v9;
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "-[NESMAlwaysOnSession didStartWithPIDForSession:andVPNSession:andPID:error:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEBUG,  "%@:%s: Got 0 pid, proceed with clean up",  block,  0x16u);
        }

        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](v11, "stateHandler"));
        [v51 handlePlugin:v10 didStartWithPID:0 error:v14];
      }
    }

    goto LABEL_27;
  }

  int64_t v16 = -[NESMVPNSession tunnelKind](self, "tunnelKind");
  int v17 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  id v9 = v17;
  if (v16 != 2)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryPhysicalInterface](v17, "primaryPhysicalInterface"));
    if ([v19 type] != (id)1 && self)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 appVPN]);
      if (v21)
      {
        BOOL v22 = (void *)v21;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        __int16 v55 = v19;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 appVPN]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 protocol]);
        xpc_connection_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sliceUUID]);

        id v19 = v55;
        if (v26)
        {
          id v27 = v56;
          id v54 = v8;
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 appVPN]);
          if (v29)
          {
            uint64_t v30 = (void *)v29;
            __int16 v53 = v27;
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 appVPN]);
            xpc_connection_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 protocol]);
            id v34 = (id)objc_claimAutoreleasedReturnValue([v33 sliceUUID]);

            if (v34)
            {
              if (self->_coreTelephonyClient) {
                goto LABEL_16;
              }
              uint64_t v37 = objc_alloc(&OBJC_CLASS___CoreTelephonyClient);
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
              uint64_t v39 = -[CoreTelephonyClient initWithQueue:](v37, "initWithQueue:", v38);
              coreTelephonyClient = self->_coreTelephonyClient;
              self->_coreTelephonyClient = v39;

              id v35 = -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
              if (self->_coreTelephonyClient)
              {
LABEL_16:
                uint64_t v41 = ne_log_obj(v35, v36);
                dispatch_queue_attr_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
                  dispatch_queue_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 primaryPhysicalInterface]);
                  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 interfaceName]);
                  *(_DWORD *)block = 138412802;
                  *(void *)&block[4] = self;
                  *(_WORD *)&block[12] = 2112;
                  *(void *)&block[14] = v34;
                  *(_WORD *)&block[22] = 2112;
                  id v59 = v45;
                  _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%@: VPN Slice request in progress - sliceUUID %@ : primary-ifname %@ ",  block,  0x20u);
                }

                uint64_t v46 = self->_coreTelephonyClient;
                *(void *)block = _NSConcreteStackBlock;
                *(void *)&block[8] = 3221225472LL;
                *(void *)&block[16] = sub_100027F44;
                id v59 = &unk_1000BDA10;
                uint64_t v60 = self;
                id v34 = v34;
                id v61 = v34;
                id v27 = v53;
                uint64_t v62 = v53;
                int v64 = v6;
                __int16 v47 = v54;
                id v63 = v54;
                -[CoreTelephonyClient requestSliceByUUID:completion:](v46, "requestSliceByUUID:completion:", v34, block);
                char v57 = 1;

                id v48 = v55;
LABEL_32:

                if ((v57 & 1) != 0) {
                  goto LABEL_28;
                }
                goto LABEL_25;
              }
            }

            id v27 = v53;
          }

          else
          {

            id v34 = 0LL;
          }

          char v57 = 0;
          __int16 v47 = v54;
          id v48 = v55;
          goto LABEL_32;
        }
      }

      else
      {
      }
    }

LABEL_25:
    id v9 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryPhysicalInterface](v9, "primaryPhysicalInterface"));
    goto LABEL_26;
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryCellularInterface](v17, "primaryCellularInterface"));
LABEL_26:
  id v10 = v18;
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v18 interfaceName]);
  sub_100021958(self, v56, v6, v8, v52);

LABEL_27:
LABEL_28:
}

- (void)plugin:(id)a3 didInitializeWithUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = ne_log_obj(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin %@ initialized with Mach-O UUIDs %@",  (uint8_t *)&v11,  0x20u);
  }

  -[NESMVPNSession addDefaultDropPolicyForPluginUUIDs:](self, "addDefaultDropPolicyForPluginUUIDs:", v7);
}

- (void)setDelegateInterfaceName:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@: manager set delegate interface name to %@",  buf,  0x16u);
  }

  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100027CB0;
    v9[3] = &unk_1000BD8C8;
    v9[4] = self;
    id v10 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100027E98;
    v8[3] = &unk_1000BD8F0;
    v8[4] = self;
    -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  v9,  v8);
  }
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NEPacketTunnelNetworkSettings);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0) {
      __assert_rtn( "-[NESMVPNSession plugin:didSetConfiguration:completionHandler:]",  "NESMVPNSession.m",  1938,  "[configuration isKindOfClass:[NEPacketTunnelNetworkSettings class]]");
    }
    id v12 = -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", v9);
    uint64_t v14 = ne_log_obj(v12, v13);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      id v17 = objc_retainBlock(v10);
      int v26 = 138412802;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: Handling set config request: session interface %@ - completionHandler %@",  (uint8_t *)&v26,  0x20u);
    }

    -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", v10);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    unsigned int v19 = [v18 handleSetConfiguration];

    if (v19)
    {
      uint64_t is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      int v21 = is_debug_logging_enabled;
      uint64_t v22 = ne_log_large_obj(is_debug_logging_enabled);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          int v26 = 138412546;
          id v27 = self;
          __int16 v28 = 2112;
          id v29 = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%@: plugin set tunnel network settings: %@",  (uint8_t *)&v26,  0x16u);
        }
      }

      else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v9 descriptionWithIndent:0 options:2]);
        int v26 = 138412546;
        id v27 = self;
        __int16 v28 = 2112;
        id v29 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%@: plugin set tunnel network settings: %@",  (uint8_t *)&v26,  0x16u);
      }

      goto LABEL_13;
    }

    -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", 0LL);
    if (v10)
    {
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  1LL,  0LL));
      (*((void (**)(id, os_log_s *))v10 + 2))(v10, v24);
      -[NESMVPNSession setPluginCompletionHandler:](self, "setPluginCompletionHandler:", 0LL);
LABEL_13:
    }
  }
}

- (void)plugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v8 handlePlugin:v7 didAttachIPCWithEndpoint:v6];
}

- (void)sendEstablishIPCReply
{
  if (self)
  {
    if (!objc_getProperty(self, a2, 384LL, 1))
    {
      id Property = objc_getProperty(self, v3, 392LL, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v6, reply, 384LL);
    }

    id v7 = objc_getProperty(self, v3, 392LL, 1);
  }

  else
  {

    id v7 = 0LL;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v7);
  id v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  uint64_t v11 = v9;
  if (self)
  {
    id v12 = objc_getProperty(self, v10, 384LL, 1);
    xpc_connection_send_message(v11, v12);

    objc_setProperty_atomic(self, v13, 0LL, 384LL);
    objc_setProperty_atomic(self, v14, 0LL, 392LL);
  }

  else
  {
    xpc_connection_send_message(v9, 0LL);
  }

  xpc_object_t original = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [original handleEstablishIPCReplySent];
}

- (BOOL)establishIPCPending
{
  if (self) {
    self = (NESMVPNSession *)objc_getProperty(self, a2, 392LL, 1);
  }
  return self != 0LL;
}

- (BOOL)shouldSendIPCAttachForPlugin:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (!-[NESMVPNSession establishIPCPending](self, "establishIPCPending")) {
    goto LABEL_7;
  }
  if (self)
  {
    if (!objc_getProperty(self, v5, 384LL, 1))
    {
      id Property = objc_getProperty(self, v6, 392LL, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v9, reply, 384LL);
    }

    id v10 = objc_getProperty(self, v6, 384LL, 1);
  }

  else
  {

    id v10 = 0LL;
  }

  if (!xpc_dictionary_get_int64(v10, "SessionPrimaryPluginPID"))
  {
    if (self) {
      id v14 = objc_getProperty(self, v11, 384LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    id v15 = v14;
    signed int v16 = sub_100016694(v4);
    xpc_dictionary_set_int64(v15, "SessionPrimaryPluginPID", v16);

    BOOL v12 = 1;
  }

  else
  {
LABEL_7:
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setEndpointInEstablishIPCReply:(id)a3 forPlugin:(id)a4
{
  xpc_object_t value = a3;
  id v7 = a4;
  if (self)
  {
    if (!objc_getProperty(self, v6, 384LL, 1))
    {
      id Property = objc_getProperty(self, v8, 392LL, 1);
      xpc_object_t reply = xpc_dictionary_create_reply(Property);
      objc_setProperty_atomic(self, v11, reply, 384LL);
    }

    id v12 = objc_getProperty(self, v8, 384LL, 1);
  }

  else
  {

    id v12 = 0LL;
  }

  xpc_dictionary_set_value(v12, "SessionPrimaryPluginEndpoint", value);
  -[NESMVPNSession sendEstablishIPCReply](self, "sendEstablishIPCReply");
}

- (void)requestInstall
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 IPv4Settings]);
  id v5 = [v4 hasDefaultRoute];

  sub_100027AC0(self);
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    if (!v6) {
      goto LABEL_13;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    id v8 = v7;
    SEL v9 = self;
    id v10 = v6;
    goto LABEL_9;
  }

  if ((id)-[NESMVPNSession parentType](self, "parentType") != (id)2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    id v8 = v7;
    SEL v9 = self;
    id v10 = 0LL;
LABEL_9:
    unsigned __int8 v13 = [v7 requestInstallForSession:v9 withParentSession:v10 exclusive:v5];

    if ((v13 & 1) == 0)
    {
      uint64_t v16 = ne_log_obj(v14, v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
        *(_DWORD *)uint64_t v20 = 138412546;
        *(void *)&v20[4] = self;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@: config request: failed to request install [%@]",  v20,  0x16u);
      }

      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  1LL,  0LL));
      sub_100023778(self, v18);
    }

    goto LABEL_13;
  }

  SEL v11 = self;
  if (v6)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
    *(void *)uint64_t v20 = _NSConcreteStackBlock;
    *(void *)&v20[8] = 3221225472LL;
    *(void *)&v20[16] = sub_10008610C;
    int v21 = &unk_1000BE950;
    char v24 = (char)v5;
    uint64_t v22 = v6;
    uint64_t v23 = v11;
    dispatch_async(v12, v20);
  }

LABEL_13:
}

- (void)requestUninstall
{
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v3 = self;
    if (v5)
    {
      id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100086594;
      block[3] = &unk_1000BEBE0;
      block[4] = v5;
      id v7 = v3;
      dispatch_async(v4, block);
    }
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    [v5 requestUninstallForSession:self];
  }
}

- (void)install
{
  if (!-[NESMVPNSession virtualInterface](self, "virtualInterface")
    || (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities")),
        v3,
        !v3))
  {
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    sub_10002EB18((uint64_t)v19);

    sub_100024188(self, 1LL);
    return;
  }

  if (self)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 tunnelRemoteAddress]);
    if (v5)
    {
      SEL v6 = (void *)v5;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tunnelRemoteAddress]);
      int v9 = NEGetAddressFamilyFromString(v8);

      if (v9)
      {
        uint64_t v12 = ne_log_obj(v10, v11);
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%@: Starting to set the tunnel configuration",  buf,  0xCu);
        }

        if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
        {
          uint64_t v14 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
          uint64_t v15 = self;
          uint64_t v16 = v15;
          if (v14 && -[NESMVPNSession virtualInterface](v15, "virtualInterface"))
          {
            id v17 = -[NESMVPNSession virtualInterface](v16, "virtualInterface");
            myCFRetain();
            unsigned int v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v14, "queue"));
            *(void *)__int128 buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&uint8_t buf[16] = sub_10000A7B4;
            id v56 = (const char *)&unk_1000BE8D8;
            char v57 = v14;
            id v59 = v17;
            id v58 = v16;
            dispatch_async(v18, buf);
          }
        }

        else
        {
          int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 VPN]);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 protocol]);
          unsigned int v29 = [v28 includeAllNetworks];

          if (v29)
          {
            uint64_t v30 = sub_100024D3C(self);
            if ((v30 & 1) == 0)
            {
              uint64_t v32 = ne_log_obj(v30, v31);
              xpc_connection_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                id v48 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
                *(_DWORD *)__int128 buf = 138412802;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v48;
                *(_WORD *)&buf[22] = 2080;
                id v56 = "-[NESMVPNSession setConfiguration]";
                _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s: applyTunnelDataPolicies failed",  buf,  0x20u);
              }
            }
          }

          id v34 = sub_1000251F8(self);
          uint64_t v36 = ne_log_obj(v34, v35);
          uint64_t v14 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
          {
LABEL_27:

LABEL_28:
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
            v38 = (void *)objc_claimAutoreleasedReturnValue([v37 VPN]);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 protocol]);
            if ([v39 type] == (id)1)
            {
              BOOL v40 = 1;
            }

            else
            {
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              dispatch_queue_attr_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 VPN]);
              v43 = (void *)objc_claimAutoreleasedReturnValue([v42 protocol]);
              if ([v43 type] == (id)2)
              {
                BOOL v40 = 1;
              }

              else
              {
                uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
                dispatch_queue_t v44 = (void *)objc_claimAutoreleasedReturnValue([v49 VPN]);
                __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 protocol]);
                BOOL v40 = [v45 type] == (id)3;
              }
            }

            *(void *)__int128 buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&uint8_t buf[16] = sub_1000253A0;
            id v56 = (const char *)&unk_1000BD988;
            char v57 = self;
            LOBYTE(v58) = v40;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  buf,  &stru_1000BD9C8);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472LL;
            v53[2] = sub_100025730;
            v53[3] = &unk_1000BD988;
            v53[4] = self;
            BOOL v54 = v40;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  v53,  &stru_1000BD9E8);
            v50[4] = self;
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472LL;
            v51[2] = sub_10002626C;
            v51[3] = &unk_1000BD988;
            v51[4] = self;
            BOOL v52 = v40;
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472LL;
            v50[2] = sub_1000270E0;
            v50[3] = &unk_1000BD8F0;
            -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  v51,  v50);
            return;
          }

          uint64_t v16 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
          *(_DWORD *)__int128 buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2080;
          id v56 = "-[NESMVPNSession setConfiguration]";
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s: updateDNSSkipPolicies failed",  buf,  0x20u);
        }

        goto LABEL_27;
      }
    }

    else
    {
    }

    uint64_t v20 = ne_log_obj(v10, v11);
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%@: configuration has invalid tunnel remote address",  buf,  0xCu);
    }

    uint64_t v24 = ne_log_obj(v22, v23);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
      __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v46 tunnelRemoteAddress]);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v47;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%@: configuration has invalid tunnel remote address (%@)",  buf,  0x16u);
    }

    sub_100024188(self, 0LL);
  }

- (void)installPended
{
}

- (id)copyTunnelInterfaceName
{
  return (id)NEVirtualInterfaceCopyName(-[NESMVPNSession virtualInterface](self, "virtualInterface"));
}

- (int)getVirtualInterfaceMTU:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 MTU]);
  int v4 = [v3 intValue];

  return v4;
}

- (void)queueChangesToTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (self) {
    id Property = objc_getProperty(self, v8, 376LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100023BDC;
  v13[3] = &unk_1000BD960;
  uint64_t v10 = (dispatch_queue_s *)Property;
  objc_copyWeak(&v16, &location);
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100023AD0;
  v6[3] = &unk_1000BEB20;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)uninstall
{
  int64_t v3 = -[NESMVPNSession parentType](self, "parentType");
  int64_t v5 = v3;
  if (v3 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    id v7 = self;
    id v8 = v7;
    if (v6 && v7 && -[NESMVPNSession virtualInterface](v7, "virtualInterface"))
    {
      int v9 = -[NESMVPNSession virtualInterface](v8, "virtualInterface");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      myCFRetain(v9);
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472LL;
      *(void *)&block[16] = sub_10000AC88;
      v38 = (const char *)&unk_1000BE8D8;
      uint64_t v39 = v6;
      id v40 = v10;
      uint64_t v41 = v9;
      id v12 = v10;
      dispatch_async(v11, block);
    }

    goto LABEL_6;
  }

  if (!self
    || (unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession")),
        char v14 = sub_10002ECE8((uint64_t)v13),
        v13,
        (v14 & 1) == 0))
  {
    uint64_t v15 = ne_log_obj(v3, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    id v8 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    *(_DWORD *)block = 138412802;
    *(void *)&block[4] = self;
    *(_WORD *)&block[12] = 2112;
    *(void *)&block[14] = v8;
    *(_WORD *)&block[22] = 2080;
    v38 = "-[NESMVPNSession uninstall]";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s: removeTunnelDataPolicy failed",  block,  0x20u);
LABEL_6:

LABEL_10:
  }

  if (-[NESMVPNSession virtualInterface](self, "virtualInterface"))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 VPN]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 protocol]);
    if ([v18 type] == (id)1)
    {
      BOOL v19 = 1;
    }

    else
    {
      int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 VPN]);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 protocol]);
      if ([v28 type] == (id)2)
      {
        BOOL v19 = 1;
      }

      else
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        int64_t v32 = v5;
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v31 VPN]);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 protocol]);
        BOOL v19 = [v30 type] == (id)3;

        int64_t v5 = v32;
      }
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000233A4;
    v35[3] = &unk_1000BD988;
    v35[4] = self;
    BOOL v36 = v19;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000234B8;
    v33[3] = &unk_1000BE7A0;
    v33[4] = self;
    BOOL v34 = v5 == 1;
    -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  v35,  v33);
  }

  else
  {
    if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
      sub_100086878(v20, self);
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
    [v21 handleClearConfigurationResult:1];

    sub_100023668(self);
    sub_10007C480(self, v22);
    if (v5 != 1)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EC00((uint64_t)v23);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002BCE0((uint64_t)v24);

      if (!-[NESMVPNSession virtualInterface](self, "virtualInterface"))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
        sub_10002BE7C((uint64_t)v25);
      }
    }

    sub_100023778(self, 0LL);
  }

- (BOOL)isSecondaryConnection
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[NESMVPNSession type](v2, "type") == 2 || v2->_isSecondaryConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsSecondaryConnection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_isSecondaryConnection != v3)
  {
    v4->_isSecondaryConnection = v3;
    if ((id)-[NESMVPNSession parentType](v4, "parentType") == (id)1)
    {
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](v4, "pluginConfigurationEntities"));

      if (v5)
      {
        -[NESMVPNSession requestInstall](v4, "requestInstall");
      }

      else
      {
        uint64_t v8 = ne_log_obj(v6, v7);
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 138412290;
          id v11 = v4;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%@: plugin configuration is not set yet",  (uint8_t *)&v10,  0xCu);
        }
      }
    }
  }

  objc_sync_exit(v4);
}

- (unsigned)isInterfaceIPAvailable:(const char *)a3
{
  uint64_t v5 = nwi_state_copy(self, a2);
  if (!v5)
  {
    uint64_t v19 = ne_log_obj(0LL, v6);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      int v30 = 138412802;
      uint64_t v31 = self;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v28;
      __int16 v34 = 2080;
      uint64_t v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s:: no state",  (uint8_t *)&v30,  0x20u);
    }

    goto LABEL_16;
  }

  uint64_t v7 = v5;
  ifint64_t state = nwi_state_get_ifstate(v5, a3);
  if (!ifstate)
  {
    uint64_t v21 = ne_log_obj(0LL, v9);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      int v30 = 138412802;
      uint64_t v31 = self;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v29;
      __int16 v34 = 2080;
      uint64_t v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@[%@]:%s:: no ifState",  (uint8_t *)&v30,  0x20u);
    }

    nwi_state_release(v7);
LABEL_16:
    LOBYTE(v14) = 0;
    return v14;
  }

  unint64_t flags = nwi_ifstate_get_flags(ifstate);
  uint64_t v12 = ne_log_obj(flags, v11);
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    int v30 = 138413058;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v24;
    __int16 v34 = 2080;
    uint64_t v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    __int16 v36 = 1024;
    LODWORD(v37) = flags;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%@[%@]:%s:: flags %X",  (uint8_t *)&v30,  0x26u);
  }

  if ((flags & 3) != 0) {
    int v14 = (flags >> 2) & 1;
  }
  else {
    int v14 = 0;
  }
  uint64_t v15 = nwi_state_release(v7);
  uint64_t v17 = ne_log_obj(v15, v16);
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    int v26 = (void *)v25;
    id v27 = "DOWN";
    int v30 = 138413058;
    uint64_t v31 = self;
    if (v14) {
      id v27 = "UP";
    }
    __int16 v32 = 2112;
    uint64_t v33 = v25;
    __int16 v34 = 2080;
    uint64_t v35 = "-[NESMVPNSession isInterfaceIPAvailable:]";
    __int16 v36 = 2080;
    uint64_t v37 = v27;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: %s", (uint8_t *)&v30, 0x2Au);
  }

  return v14;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession setStatus:](&v75, "setStatus:");
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v6 = self;
    uint64_t v8 = v6;
    if (!v5 || !v6) {
      goto LABEL_44;
    }
    uint64_t v9 = ne_log_obj(v6, v7);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      uint64_t v42 = ne_session_status_to_string(v3);
      *(_DWORD *)__int128 buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2080;
      v83 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      LOWORD(v84) = 2080;
      *(void *)((char *)&v84 + 2) = v42;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%@[%@]:%s: VPN Status to Parent: %s",  buf,  0x2Au);
    }

    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)v5 queue]);
    block = _NSConcreteStackBlock;
    uint64_t v77 = 3221225472LL;
    int v78 = sub_10000B274;
    id v79 = &unk_1000BED80;
    uint64_t v80 = v5;
    LODWORD(v81) = v3;
    dispatch_async(v11, &block);

    if ((_DWORD)v3 != 1)
    {
      if ((_DWORD)v3 == 3) {
        sub_100009924((void *)v5, v8);
      }
      goto LABEL_44;
    }

    if ((*(_BYTE *)(v5 + 353) & 1) != 0
      || (id v18 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName")),
          unsigned int v19 = -[NESMVPNSession isInterfaceIPAvailable:]( v8,  "isInterfaceIPAvailable:",  [v18 UTF8String]),  v18,  !v19))
    {
      uint64_t v36 = ne_log_obj(v12, v13);
      uint64_t v20 = (NESMVPNSession *)objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_43:

        goto LABEL_44;
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v8, "interfaceName"));
      *(_DWORD *)__int128 buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2080;
      v83 = "-[NESMAlwaysOnSession setStatusFromSession:andStatus:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEBUG,  "%@[%@]:%s: Session stopped or interface down, no retry",  buf,  0x20u);
LABEL_28:

      goto LABEL_43;
    }

    uint64_t v20 = v8;
    if (!objc_getProperty((id)v5, v21, 408LL, 1)
      || (uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v20, "interfaceName")),
          v22,
          !v22))
    {

LABEL_26:
      uint64_t v40 = ne_log_obj(v38, v39);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v20, "interfaceName"));
        *(_DWORD *)__int128 buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2080;
        v83 = "-[NESMAlwaysOnSession alwaysOnRetry:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEBUG,  "%@[%@]:%s: failed to get retry interval",  buf,  0x20u);
      }

      goto LABEL_28;
    }

    id v24 = objc_getProperty((id)v5, v23, 408LL, 1);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v20, "interfaceName"));
    int v26 = (NESMAlwaysOnSessionRetryCounter *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

    if (v26
      || (int v26 = objc_alloc_init(&OBJC_CLASS___NESMAlwaysOnSessionRetryCounter),
          int v29 = 1,
          id v31 = objc_getProperty((id)v5, v30, 408LL, 1),
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](v20, "interfaceName")),
          [v31 setObject:v26 forKeyedSubscript:v32],
          v31,
          v32,
          v26))
    {
      int64_t interval = v26->_interval;
      if (interval)
      {
        int64_t retryCount = v26->_retryCount;
        v26->_int64_t retryCount = retryCount + 1;
        if (retryCount < *(void *)(v5 + 440)) {
          goto LABEL_35;
        }
        interval *= *(void *)(v5 + 432);
        v26->_int64_t interval = interval;
        int64_t v35 = *(void *)(v5 + 424);
        if (interval > v35)
        {
          v26->_int64_t interval = v35;
          int64_t interval = v35;
        }

- (void)setLastStopReason:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession setLastStopReason:](&v8, "setLastStopReason:");
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v6 = self;
    if (v5)
    {
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100085F04;
      block[3] = &unk_1000BEDA8;
      block[4] = v5;
      int v10 = v6;
      int v11 = a3;
      dispatch_async(v7, block);
    }
  }

- (void)setLastDisconnectError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession setLastDisconnectError:](&v9, "setLastDisconnectError:", v4);
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    uint64_t v6 = self;
    id v7 = v4;
    if (v5)
    {
      objc_super v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 queue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100086008;
      block[3] = &unk_1000BE900;
      block[4] = v5;
      int v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
  }
}

- (void)prepareNetwork
{
  if ((id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    uint64_t v4 = ne_log_obj(1LL, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      *(_DWORD *)block = 138412802;
      *(void *)&block[4] = self;
      *(_WORD *)&block[12] = 2112;
      *(void *)&block[14] = v11;
      *(_WORD *)&block[22] = 2080;
      uint64_t v15 = "-[NESMVPNSession prepareNetwork]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@[%@]:%s:: enter", block, 0x20u);
    }

    id v6 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
    unsigned int v7 = -[NESMVPNSession isInterfaceIPAvailable:](self, "isInterfaceIPAvailable:", [v6 UTF8String]);

    if (v7)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession interfaceName](self, "interfaceName"));
      -[NESMVPNSession handleNetworkPrepareResult:](self, "handleNetworkPrepareResult:", v8);
    }
  }

  else if ((id)-[NESMVPNSession tunnelKind](self, "tunnelKind") == (id)2 {
         && (id)-[NESMVPNSession parentType](self, "parentType") == (id)2)
  }
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    objc_super v9 = self;
    if (v12)
    {
      int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 queue]);
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472LL;
      *(void *)&block[16] = sub_10008584C;
      uint64_t v15 = (const char *)&unk_1000BEBE0;
      uint64_t v16 = v9;
      id v17 = v12;
      dispatch_async(v10, block);
    }
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
    -[NESMSession prepareNetwork](&v13, "prepareNetwork");
  }

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    sub_10002224C(self);
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_35;
  }

  if (-[NESMVPNSession type](self, "type") == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);
  }

  else if (-[NESMVPNSession type](self, "type") == 6)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
  }

  unsigned int v7 = v6;
  unsigned int v8 = [v6 isEnabled];

  uint64_t v11 = ne_log_obj(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    *(_DWORD *)__int128 buf = 138412802;
    uint64_t v45 = self;
    __int16 v46 = 1024;
    unsigned int v47 = v8;
    __int16 v48 = 2112;
    uint64_t v49 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@: NESMVPNSession - enabled = %d <%@>",  buf,  0x1Cu);
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  if (!-[NESMSession handleUpdateConfiguration:](&v43, "handleUpdateConfiguration:", v5)) {
    goto LABEL_15;
  }
  sub_10002224C(self);
  if (!-[NESMSession disableOnDemand](self, "disableOnDemand")) {
    goto LABEL_24;
  }
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 VPN]);
  if (v15)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
    if (([v3 isOnDemandEnabled] & 1) == 0)
    {

LABEL_20:
      -[NESMSession setDisableOnDemand:](self, "setDisableOnDemand:", 0LL);
      goto LABEL_24;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 appVPN]);
  if (v18)
  {
    unsigned int v19 = (void *)v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);
    unsigned __int8 v21 = [v20 isOnDemandEnabled];

    if (v15)
    {
    }

    if ((v21 & 1) == 0) {
      goto LABEL_20;
    }
  }

  else
  {

    if (v15)
    {
    }
  }

- (NSString)pluginType
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  id v4 = [v3 type];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  id v6 = v5;
  if (v4 != (id)4)
  {
    id v7 = [v5 type];

    if (v7 != (id)5)
    {
      unsigned int v8 = 0LL;
      return (NSString *)v8;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 pluginType]);

  return (NSString *)v8;
}

- (BOOL)prepareConfigurationForStart
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%@: Default prepareConfigurationForStart",  (uint8_t *)&v6,  0xCu);
  }

  return 1;
}

- (BOOL)resetPerAppPolicy
{
  v2 = self;
  id v3 = sub_100079F24((uint64_t)self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[NESMVPNSession type](v2, "type") != 2 || !-[NESMVPNSession virtualInterface](v2, "virtualInterface")) {
    goto LABEL_45;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appRules]);
  if (![v7 count] && !objc_msgSend(v4, "count"))
  {

    goto LABEL_45;
  }

  unsigned int v8 = -[NESMSession isActive](v2, "isActive");

  if (!v8)
  {
LABEL_45:
    char v59 = 1;
    goto LABEL_46;
  }

  v83 = (void *)NEVirtualInterfaceCopyName(-[NESMVPNSession virtualInterface](v2, "virtualInterface"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](v2, "policySession"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appVPN]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appRules]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](v2, "uid"));
  sub_10003B00C((uint64_t)v9, v12, (uint64_t)[v13 intValue]);

  uint64_t v80 = v2;
  if (v2)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 appVPN]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appRules]);

    if ([v18 count])
    {
      id v81 = v4;
      unsigned int v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      int v78 = v18;
      id obj = v18;
      id v20 = [obj countByEnumeratingWithState:&v93 objects:buf count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v86 = *(void *)v94;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v94 != v86) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)i);
            __int128 v89 = 0u;
            __int128 v90 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 cachedMachOUUIDs]);
            id v25 = [v24 countByEnumeratingWithState:&v89 objects:v97 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v90;
              do
              {
                for (j = 0LL; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v90 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v89 + 1) + 8LL * (void)j);
                  SEL v30 = (void *)objc_claimAutoreleasedReturnValue([v23 matchSigningIdentifier]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v30, v29);
                }

                id v26 = [v24 countByEnumeratingWithState:&v89 objects:v97 count:16];
              }

              while (v26);
            }
          }

          id v21 = [obj countByEnumeratingWithState:&v93 objects:buf count:16];
        }

        while (v21);
      }

      v2 = v80;
      id v4 = v81;
      uint64_t v18 = v78;
    }

    else
    {
      unsigned int v19 = 0LL;
    }
  }

  else
  {
    unsigned int v19 = 0LL;
  }

  uint64_t v31 = ne_log_obj(v14, v15);
  unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = -[NSMutableDictionary count](v19, "count");
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v2;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@: Setting the app UUID map with %lu entries",  buf,  0x16u);
  }

  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](v2, "primaryTunnelPlugin"));
  uint64_t v35 = (void *)v34;
  if (v34)
  {
    *(void *)__int128 buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_100016C50;
    v99 = &unk_1000BEA88;
    uint64_t v100 = v34;
    uint64_t v36 = v19;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v35 remotePluginObjectWithErrorHandler:buf]);
    [v37 setAppUUIDMap:v36];
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](v2, "protocol"));
  id v39 = [v38 type];
  BOOL v40 = v39 == (id)5;
  if (v39 == (id)5)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](v2, "protocol"));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 serverAddress]);
    unsigned int v43 = [v42 isEqualToString:@"0.0.0.0"];

    if (v43)
    {
      uint64_t v46 = ne_log_obj(v44, v45);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v2;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_DEFAULT,  "%@: Not installing interface tunnel policies",  buf,  0xCu);
      }

      goto LABEL_34;
    }

- (void)handleInstalledAppsChanged
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022194;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidate
{
  if (self)
  {
    -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", 0LL);
    objc_storeStrong((id *)&self->_coreTelephonyClient, 0LL);
  }

  else
  {
    [0 setDelegate:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession invalidate](&v4, "invalidate");
  -[NESMVPNSessionState leave](self->_stateHandler, "leave");
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0LL;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession observeValueForKeyPath:ofObject:change:context:]( &v56,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  a5,  a6);
  if (self) {
    id Property = objc_getProperty(self, v12, 424LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;
  if (v14 == v11)
  {
    unsigned int v15 = [v10 isEqualToString:@"path"];

    if (!v15) {
      goto LABEL_5;
    }
    uint64_t v18 = ne_log_obj(v16, v17);
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v21 = objc_getProperty(self, v20, 424LL, 1);
      }
      else {
        id v21 = 0LL;
      }
      *(_DWORD *)__int128 buf = 134218240;
      unint64_t v58 = (unint64_t)v11;
      __int16 v59 = 2048;
      id v60 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "IDS Nexus: got EVENT %p %p", buf, 0x16u);
    }

    if (self) {
      id v23 = objc_getProperty(self, v22, 424LL, 1);
    }
    else {
      id v23 = 0LL;
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue([v23 path]);
    id v24 = [v14 status];
    if (v24 == (id)1)
    {
      if (self) {
        unint64_t IDSNexusIfIndex = self->_IDSNexusIfIndex;
      }
      else {
        unint64_t IDSNexusIfIndex = 0LL;
      }
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v14 interface]);
      id v28 = [v27 interfaceIndex];

      if ((id)IDSNexusIfIndex == v28) {
        goto LABEL_4;
      }
      uint64_t v31 = ne_log_obj(v29, v30);
      unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unint64_t v33 = self->_IDSNexusIfIndex;
        }
        else {
          unint64_t v33 = 0LL;
        }
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v14 interface]);
        id v35 = [v34 interfaceIndex];
        *(_DWORD *)__int128 buf = 134218240;
        unint64_t v58 = v33;
        __int16 v59 = 2048;
        id v60 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "IDS Nexus interface changed %ld -> %ld",  buf,  0x16u);
      }

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 interface]);
      id v37 = [v36 interfaceIndex];
      if (self) {
        self->_unint64_t IDSNexusIfIndex = (unint64_t)v37;
      }

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v14 interface]);
      BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v39 interfaceName]);
      char v41 = sub_1000426C4((uint64_t)v38, v40);

      if ((v41 & 1) != 0) {
        goto LABEL_4;
      }
      uint64_t v44 = ne_log_obj(v42, v43);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v14 interface]);
        unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 interfaceName]);
        *(_DWORD *)__int128 buf = 138412290;
        unint64_t v58 = (unint64_t)v47;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to add IDS Nexus policy for %@",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v48 = ne_log_obj(v24, v25);
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "IDS Nexus interface unusable", buf, 2u);
      }

      if (self) {
        self->_unint64_t IDSNexusIfIndex = 0LL;
      }
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      char v52 = sub_10002F198(v50, v51);

      if ((v52 & 1) != 0) {
        goto LABEL_4;
      }
      uint64_t v55 = ne_log_obj(v53, v54);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }
    }
  }

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NESMVPNSession;
  -[NESMSession stopIfNecessaryWithReason:](&v11, "stopIfNecessaryWithReason:", v4);
  stopCompletionHandler = (void (**)(void))self->_stopCompletionHandler;
  if (stopCompletionHandler)
  {
    stopCompletionHandler[2]();
    id v8 = self->_stopCompletionHandler;
    self->_stopCompletionHandler = 0LL;
  }

  id v9 = objc_retainBlock(v6);
  id v10 = self->_stopCompletionHandler;
  self->_stopCompletionHandler = v9;
}

- (BOOL)supportsDefaultDrop
{
  if (!-[NESMSession defaultDropType](self, "defaultDropType") || -[NESMVPNSession type](self, "type") != 1) {
    return 0;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 VPN]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 protocol]);
  unsigned __int8 v6 = [v5 includeAllNetworks];

  return v6;
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v9) {
    goto LABEL_20;
  }
  if (self)
  {
    int coreTelephonyConnType = self->_coreTelephonyConnType;
    if (coreTelephonyConnType == 36) {
      goto LABEL_20;
    }
  }

  else
  {
    int coreTelephonyConnType = 0;
  }

  if (coreTelephonyConnType != a4) {
    goto LABEL_20;
  }
  if ([v9 state] == 2)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);

    if (v13)
    {
      if (self)
      {
        if (objc_getProperty(self, v12, 496LL, 1))
        {
          id v15 = objc_getProperty(self, v14, 496LL, 1);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);
          unsigned __int8 v17 = [v15 isEqual:v16];

          if ((v17 & 1) == 0)
          {
            uint64_t v20 = ne_log_obj(v18, v19);
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v72 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              SEL v70 = (void *)objc_claimAutoreleasedReturnValue([v72 appVPN]);
              SEL v69 = (void *)objc_claimAutoreleasedReturnValue([v70 protocol]);
              int v64 = (void *)objc_claimAutoreleasedReturnValue([v69 sliceUUID]);
              unsigned int v65 = [v10 state];
              id Property = objc_getProperty(self, v66, 496LL, 1);
              uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);
              *(_DWORD *)__int128 buf = 138413570;
              char v74 = self;
              __int16 v75 = 1024;
              int v76 = a4;
              __int16 v77 = 2112;
              int v78 = v64;
              __int16 v79 = 1024;
              unsigned int v80 = v65;
              __int16 v81 = 2112;
              id v82 = Property;
              __int16 v83 = 2112;
              __int128 v84 = v68;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%@: VPN Slice connectionStateChanged - Invalid transition <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> %@>",  buf,  0x36u);
            }

LABEL_19:
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
            [v36 handleStop];

            goto LABEL_20;
          }

          goto LABEL_20;
        }

        id v37 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);
        objc_setProperty_atomic(self, v38, v37, 496LL);
      }

      else
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);
      }

      uint64_t v41 = ne_log_obj(v39, v40);
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 appVPN]);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 protocol]);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 sliceUUID]);
        unsigned int v48 = [v10 state];
        if (self) {
          id v49 = objc_getProperty(self, v47, 496LL, 1);
        }
        else {
          id v49 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138413314;
        char v74 = self;
        __int16 v75 = 1024;
        int v76 = a4;
        __int16 v77 = 2112;
        int v78 = v46;
        __int16 v79 = 1024;
        unsigned int v80 = v48;
        __int16 v81 = 2112;
        id v82 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname nil --> %@>",  buf,  0x2Cu);
      }

      if (self)
      {
        -[NESMVPNSession setDelegateInterfaceName:]( self,  "setDelegateInterfaceName:",  objc_getProperty(self, v50, 496LL, 1));
        id v52 = objc_getProperty(self, v51, 504LL, 1);
        if (v52)
        {
          int slicePendingStartPluginPid = self->_slicePendingStartPluginPid;

          if (slicePendingStartPluginPid)
          {
            id v55 = objc_getProperty(self, v54, 504LL, 1);
            uint64_t v56 = self->_slicePendingStartPluginPid;
            id v57 = v55;
            id v59 = objc_getProperty(self, v58, 512LL, 1);
            id v61 = objc_getProperty(self, v60, 496LL, 1);
            sub_100021958(self, v57, v56, v59, v61);

            objc_setProperty_atomic(self, v62, 0LL, 504LL);
            self->_int slicePendingStartPluginPid = 0;
            objc_setProperty_atomic(self, v63, 0LL, 512LL);
          }
        }
      }

      else
      {
        [0 setDelegateInterfaceName:0];
      }

      goto LABEL_20;
    }
  }

  if (self)
  {
    id v22 = objc_getProperty(self, v12, 496LL, 1);
    if (v22)
    {
      id v24 = v22;
      id v25 = objc_getProperty(self, v23, 496LL, 1);
      id v26 = (id)objc_claimAutoreleasedReturnValue([v10 interfaceName]);

      if (v25 == v26)
      {
        uint64_t v29 = ne_log_obj(v27, v28);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          BOOL v71 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v71 appVPN]);
          unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 protocol]);
          unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 sliceUUID]);
          *(_DWORD *)__int128 buf = 138413314;
          char v74 = self;
          __int16 v75 = 1024;
          int v76 = a4;
          __int16 v77 = 2112;
          int v78 = v33;
          __int16 v79 = 1024;
          unsigned int v80 = [v10 state];
          __int16 v81 = 2112;
          id v82 = objc_getProperty(self, v34, 496LL, 1);
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%@: VPN Slice connectionStateChanged <type %d> - sliceUUID %@ : <state %d: slice ifname %@ --> nil>",  buf,  0x2Cu);
        }

        objc_setProperty_atomic(self, v35, 0LL, 496LL);
        goto LABEL_19;
      }
    }
  }

- (int64_t)state
{
  return self->_state;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (NESMVPNSessionState)stateHandler
{
  return (NESMVPNSessionState *)objc_getProperty(self, a2, 528LL, 1);
}

- (void)setStateHandler:(id)a3
{
}

- (NSMutableDictionary)connectParameters
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 536LL, 1);
}

- (void)setConnectParameters:(id)a3
{
}

- (BOOL)sleepOnDisconnect
{
  return self->_sleepOnDisconnect;
}

- (void)setSleepOnDisconnect:(BOOL)a3
{
  self->_sleepOnDisconnect = a3;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (NEVPNAuthenticationPlugin)authenticationPlugin
{
  return (NEVPNAuthenticationPlugin *)objc_getProperty(self, a2, 552LL, 1);
}

- (void)setAuthenticationPlugin:(id)a3
{
}

- (NEVPNTunnelPlugin)primaryTunnelPlugin
{
  return (NEVPNTunnelPlugin *)objc_getProperty(self, a2, 560LL, 1);
}

- (void)setPrimaryTunnelPlugin:(id)a3
{
}

- (NEVPNProtocol)protocol
{
  return (NEVPNProtocol *)objc_getProperty(self, a2, 568LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (NSMutableDictionary)cachedStateHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 576LL, 1);
}

- (void)setCachedStateHandlers:(id)a3
{
}

- (NETunnelNetworkSettings)pluginConfigurationEntities
{
  return (NETunnelNetworkSettings *)objc_getProperty(self, a2, 584LL, 1);
}

- (void)setPluginConfigurationEntities:(id)a3
{
}

- (int64_t)parentType
{
  return self->_parentType;
}

- (void)setParentType:(int64_t)a3
{
  self->_parentType = a3;
}

- (NESMSession)parent
{
  return (NESMSession *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
}

- (BOOL)isSecondaryInterface
{
  return self->_isSecondaryInterface;
}

- (void)setIsSecondaryInterface:(BOOL)a3
{
  self->_isSecondaryInterface = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 616LL, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (NSMutableArray)setConfigurationCompletionHandlerArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 624LL, 1);
}

- (void)setSetConfigurationCompletionHandlerArray:(id)a3
{
}

- (id)pluginCompletionHandler
{
  return objc_getProperty(self, a2, 632LL, 1);
}

- (void)setPluginCompletionHandler:(id)a3
{
}

- (BOOL)reassertedByPlugin
{
  return self->_reassertedByPlugin;
}

- (void)setReassertedByPlugin:(BOOL)a3
{
  self->_reassertedByPlugin = a3;
}

- (NEUserNotification)notification
{
  return (NEUserNotification *)objc_getProperty(self, a2, 640LL, 1);
}

- (void)setNotification:(id)a3
{
}

- (NSString)delegateInterfaceAddress
{
  return (NSString *)objc_getProperty(self, a2, 648LL, 1);
}

- (void)setDelegateInterfaceAddress:(id)a3
{
}

- (NEDNSSettingsNetworkAgent)dnsAgent
{
  return (NEDNSSettingsNetworkAgent *)objc_getProperty(self, a2, 656LL, 1);
}

- (void)setDnsAgent:(id)a3
{
}

- (NWNetworkAgentRegistration)dnsAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 664LL, 1);
}

- (void)setDnsAgentRegistration:(id)a3
{
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (OS_xpc_object)lastStartMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 672LL, 1);
}

- (void)setLastStartMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end