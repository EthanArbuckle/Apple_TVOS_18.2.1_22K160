@interface NESMSession
+ (BOOL)hasRequiredFrameworks;
+ (__CFDictionary)copyDefaultRouteCacheIsIPv6:(BOOL)a3;
+ (__CFDictionary)copyRouteCacheFromRoutes:(__CFArray *)a3 isIPv6:(BOOL)a4;
+ (id)sessionWithConfiguration:(id)a3 andType:(int)a4 andServer:(id)a5;
- (BOOL)canSleep;
- (BOOL)disableDefaultDropAfterBoot;
- (BOOL)disableOnDemand;
- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isDeregisteredAppVPNSession;
- (BOOL)isDeregisteredEnterpriseVPNSession;
- (BOOL)isDropPersistent;
- (BOOL)isOnDemand;
- (BOOL)isStopAllowed:(id)a3;
- (BOOL)restartPending;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (BOOL)supportsDefaultDrop;
- (BOOL)waitForPerApp;
- (NEConfiguration)configuration;
- (NENetworkAgent)networkAgent;
- (NEOnDemandRule)matchedRule;
- (NEPolicySession)controlPolicySession;
- (NEPolicySession)highPolicySession;
- (NESMPolicySession)policySession;
- (NESMServer)server;
- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4 sessionQueue:(id)a5 messageQueue:(id)a6;
- (NSArray)configurationUserUUIDs;
- (NSArray)registeredNetworkAgentInterfaces;
- (NSData)configurationSignature;
- (NSDate)firstFailedConnectTime;
- (NSDate)lastStatusChangeTime;
- (NSError)lastDisconnectError;
- (NSMutableArray)networkAgentInterfaces;
- (NSMutableArray)onDemandDomainCache;
- (NSMutableArray)staleOnDemandDNSKeys;
- (NSNumber)gid;
- (NSNumber)uid;
- (NSString)auxiliaryDataKey;
- (NSString)lastPrimaryInterface;
- (NSString)pluginType;
- (NWMonitor)onDemandMonitor;
- (NWNetworkAgentRegistration)networkAgentRegistration;
- (NWResolver)dnsRedirectionDetector;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)onDemandPauseTimerSource;
- (OS_os_transaction)dnsRedirectionTransaction;
- (OS_xpc_object)startMessage;
- (id)copyExtendedStatus;
- (id)description;
- (id)getIDSNetworkAgentDomain;
- (int)SCNCStatus;
- (int)lastStopReason;
- (int)status;
- (int)type;
- (int64_t)connectCount;
- (int64_t)connectedCount;
- (int64_t)defaultDropType;
- (int64_t)disconnectedCount;
- (int64_t)failedConnectCountWithinInterval;
- (int64_t)onDemandPauseLevelInternal;
- (unint64_t)connectTime;
- (unint64_t)lastConnectedDuration;
- (unint64_t)maxConnectTime;
- (void)addClientConnection:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleCommand:(id)a3 fromClient:(id)a4;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleGetStatusMessage:(id)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUpdateConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (void)installPendedOnQueue;
- (void)installWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)notifyChangedExtendedStatus;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseOnDemand;
- (void)prepareNetwork;
- (void)registerSession:(id)a3 fromClient:(id)a4;
- (void)removeAllClients;
- (void)restartSession;
- (void)satisfyPathResult:(id)a3;
- (void)sendConfigurationChangeHandledNotification;
- (void)setAuxiliaryDataKey:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationSignature:(id)a3;
- (void)setConfigurationUserUUIDs:(id)a3;
- (void)setConnectCount:(int64_t)a3;
- (void)setConnectTime:(unint64_t)a3;
- (void)setConnectedCount:(int64_t)a3;
- (void)setControlPolicySession:(id)a3;
- (void)setDefaultDropType:(int64_t)a3;
- (void)setDisableOnDemand:(BOOL)a3;
- (void)setDisconnectedCount:(int64_t)a3;
- (void)setDnsRedirectionDetector:(id)a3;
- (void)setDnsRedirectionTransaction:(id)a3;
- (void)setFailedConnectCountWithinInterval:(int64_t)a3;
- (void)setFirstFailedConnectTime:(id)a3;
- (void)setGid:(id)a3;
- (void)setHighPolicySession:(id)a3;
- (void)setIsDeregisteredAppVPNSession:(BOOL)a3;
- (void)setIsDeregisteredEnterpriseVPNSession:(BOOL)a3;
- (void)setIsDropPersistent:(BOOL)a3;
- (void)setIsOnDemand:(BOOL)a3;
- (void)setLastConnectedDuration:(unint64_t)a3;
- (void)setLastDisconnectError:(id)a3;
- (void)setLastPrimaryInterface:(id)a3;
- (void)setLastStatusChangeTime:(id)a3;
- (void)setLastStopReason:(int)a3;
- (void)setMatchedRule:(id)a3;
- (void)setMaxConnectTime:(unint64_t)a3;
- (void)setNetworkAgent:(id)a3;
- (void)setNetworkAgentInterfaces:(id)a3;
- (void)setNetworkAgentRegistration:(id)a3;
- (void)setOnDemandDomainCache:(id)a3;
- (void)setOnDemandMonitor:(id)a3;
- (void)setOnDemandPauseLevelInternal:(int64_t)a3;
- (void)setOnDemandPauseTimerSource:(id)a3;
- (void)setPolicySession:(id)a3;
- (void)setRegisteredNetworkAgentInterfaces:(id)a3;
- (void)setRestartPending:(BOOL)a3;
- (void)setStaleOnDemandDNSKeys:(id)a3;
- (void)setStartMessage:(id)a3;
- (void)setStatus:(int)a3;
- (void)setUID:(id)a3;
- (void)setupFromAuxiliaryData;
- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4;
- (void)stopIfNecessaryWithReason:(int)a3;
- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4;
- (void)uninstallOnQueue;
- (void)unpauseOnDemand;
@end

@implementation NESMSession

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = sub_100076D08;
  v20[4] = sub_100076D18;
  id v21 = (id)os_transaction_create("com.apple.nesessionmanager.networkDescriptionChange");
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100076D20;
  v15[3] = &unk_1000BE738;
  id v16 = v10;
  v17 = self;
  id v18 = v9;
  v19 = v20;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v12, v15);

  _Block_object_dispose(v20, 8);
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4 sessionQueue:(id)a5 messageQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NESMSession;
  v15 = -[NESMSession init](&v40, "init");
  id v16 = v15;
  if (v15)
  {
    firstFailedConnectTime = v15->_firstFailedConnectTime;
    v15->_failedConnectCountWithinInterval = 0LL;
    v15->_firstFailedConnectTime = 0LL;
    v15->_connectedCount = 0LL;
    v15->_disconnectedCount = 0LL;
    v15->_connectCount = 0LL;

    v16->_status = 1;
    id v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    clients = v16->_clients;
    v16->_clients = v18;

    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v16->_server, a4);
    v20 = (objc_class *)objc_opt_class(v16);
    id v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration name](v16->_configuration, "name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration identifier](v16->_configuration, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@:%@]",  v22,  v23,  v25));
    description = v16->_description;
    v16->_description = (NSString *)v26;

    policySession = v16->_policySession;
    v16->_policySession = 0LL;

    if (v13)
    {
      v29 = (OS_dispatch_queue *)v13;
      queue = (dispatch_queue_attr_s *)v16->_queue;
      v16->_queue = v29;
    }

    else
    {
      dispatch_queue_attr_t v31 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      queue = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v31);
      dispatch_queue_t v32 = dispatch_queue_create("NetworkExtension session queue", queue);
      v33 = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v32;
    }

    if (v14)
    {
      v34 = (OS_dispatch_queue *)v14;
      messageQueue = (dispatch_queue_attr_s *)v16->_messageQueue;
      v16->_messageQueue = v34;
    }

    else
    {
      dispatch_queue_attr_t v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      messageQueue = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v36);
      dispatch_queue_t v37 = dispatch_queue_create("NetworkExtension session message queue", messageQueue);
      v38 = v16->_messageQueue;
      v16->_messageQueue = (OS_dispatch_queue *)v37;
    }
  }

  return v16;
}

- (NESMSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  return -[NESMSession initWithConfiguration:andServer:sessionQueue:messageQueue:]( self,  "initWithConfiguration:andServer:sessionQueue:messageQueue:",  a3,  a4,  0LL,  0LL);
}

- (void)dealloc
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: deallocating", buf, 0xCu);
  }

  sub_10007C13C(self);
  sub_100078D48(self);
  sub_10007C208(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession onDemandPauseTimerSource](self, "onDemandPauseTimerSource"));

  if (v5)
  {
    v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NESMSession onDemandPauseTimerSource](self, "onDemandPauseTimerSource"));
    dispatch_source_cancel(v6);

    -[NESMSession setOnDemandPauseTimerSource:](self, "setOnDemandPauseTimerSource:", 0LL);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMSession;
  -[NESMSession dealloc](&v7, "dealloc");
}

- (id)description
{
  return self->_description;
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009277C;
  v7[3] = &unk_1000BEBE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeAllClients
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000925DC;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)registerSession:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](self, "messageQueue"));
  dispatch_suspend(v8);

  server = self->_server;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000923D0;
  v12[3] = &unk_1000BEC58;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  -[NESMServer registerSession:withCompletionHandler:](server, "registerSession:withCompletionHandler:", self, v12);
}

- (void)handleCommand:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t int64 = xpc_dictionary_get_int64(v6, "SessionCommandType");
  int64_t v10 = int64;
  if (!v7
    || (v7[3] & 1) == 0
    || (int64 == 6 || int64 == 1)
    && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NESMFlowDivertSession),
        int64_t int64 = objc_opt_isKindOfClass(self, v11),
        (int64 & 1) != 0))
  {
    switch(v10)
    {
      case 1LL:
        uint64_t v12 = ne_log_obj(int64, v9);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v69 = 138412546;
          *(void *)&v69[4] = self;
          *(_WORD *)&v69[12] = 2112;
          *(void *)&v69[14] = v7;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%@: Received a status query from %@",  v69,  0x16u);
        }

        kdebug_trace(726990876LL, 0LL, 0LL, 0LL, 0LL);
        -[NESMSession handleGetStatusMessage:](self, "handleGetStatusMessage:", v6);
        break;
      case 2LL:
        kdebug_trace(726990880LL, 0LL, 0LL, 0LL, 0LL);
        xpc_object_t value = xpc_dictionary_get_value(v6, "SessionOptions");
        xpc_type_t type = (xpc_type_t)objc_claimAutoreleasedReturnValue(value);
        v17 = type;
        if (type && (xpc_type_t type = xpc_get_type(type), type == (xpc_type_t)&_xpc_type_dictionary))
        {
          BOOL v19 = xpc_dictionary_get_BOOL(v17, "stop-current-session");
          xpc_type_t type = (xpc_type_t)xpc_dictionary_get_BOOL(v17, "restart");
          int v18 = (int)type;
        }

        else
        {
          int v18 = 0;
          BOOL v19 = 0;
        }

        uint64_t v44 = ne_log_obj(type, v16);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v69 = 138412802;
          *(void *)&v69[4] = self;
          if (v19 | v18) {
            v46 = "re";
          }
          else {
            v46 = "";
          }
          *(_WORD *)&v69[12] = 2080;
          *(void *)&v69[14] = v46;
          __int16 v70 = 2112;
          v71 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%@: Received a %sstart command from %@",  v69,  0x20u);
        }

        if (-[NESMSession status](self, "status") != 1 && -[NESMSession status](self, "status") && v19 | v18)
        {
          BOOL v47 = -[NESMSession restartPending](self, "restartPending");
          if (v47)
          {
            uint64_t v49 = ne_log_obj(v47, v48);
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v69 = 138412546;
              *(void *)&v69[4] = self;
              *(_WORD *)&v69[12] = 2112;
              *(void *)&v69[14] = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%@: Ignore restart command from %@, a pending start command already exists",  v69,  0x16u);
            }

LABEL_72:
            sub_1000922C8(v7, v51);
            goto LABEL_74;
          }

          -[NESMSession setRestartPending:](self, "setRestartPending:", 1LL);
          xpc_object_t v64 = xpc_copy(v6);
          -[NESMSession setStartMessage:](self, "setStartMessage:", v64);

          if (v19)
          {
            uint64_t v67 = ne_log_obj(v65, v66);
            v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v69 = 138412546;
              *(void *)&v69[4] = self;
              *(_WORD *)&v69[12] = 2112;
              *(void *)&v69[14] = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "%@: Stop current session as requested by an overriding restart command from %@",  v69,  0x16u);
            }

            -[NESMSession handleStopMessageWithReason:](self, "handleStopMessageWithReason:", 36LL);
          }
        }

        else
        {
          if (-[NESMSession failedConnectCountWithinInterval](self, "failedConnectCountWithinInterval", *(_OWORD *)v69) >= 4
            && -[NESMSession status](self, "status") == 1)
          {
            int64_t v52 = sub_100092350((uint64_t)self, v6);
            if ((_DWORD)v52)
            {
              if (!self
                || (int64_t v52 = -[NESMSession onDemandPauseLevelInternal](self, "onDemandPauseLevelInternal"), v52 != 2))
              {
                uint64_t v54 = ne_log_obj(v52, v53);
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v69 = 138412290;
                  *(void *)&v69[4] = self;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%@: Damping VOD request: too many consecutive VPN connection attempts failed.",  v69,  0xCu);
                }

                sub_10007C56C(self, (id)2);
              }
            }
          }

          int64_t v56 = -[NESMSession status](self, "status");
          if ((_DWORD)v56 != 1
            || (BOOL v58 = sub_100092350((uint64_t)self, v6), self)
            && v58
            && (int64_t v56 = -[NESMSession onDemandPauseLevelInternal](self, "onDemandPauseLevelInternal"), v56 == 2))
          {
            uint64_t v59 = ne_log_obj(v56, v57);
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              if (v19 | v18) {
                v61 = "re";
              }
              else {
                v61 = "";
              }
              uint64_t v62 = ne_session_status_to_string(-[NESMSession status](self, "status"));
              *(_DWORD *)v69 = 138413058;
              *(void *)&v69[4] = self;
              *(_WORD *)&v69[12] = 2080;
              *(void *)&v69[14] = v61;
              __int16 v70 = 2112;
              v71 = v7;
              __int16 v72 = 2080;
              uint64_t v73 = v62;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%@: Skip a %sstart command from %@: session in state %s",  v69,  0x2Au);
            }

            goto LABEL_72;
          }

          xpc_object_t v63 = xpc_copy(v6);
          -[NESMSession setStartMessage:](self, "setStartMessage:", v63);

          -[NESMSession registerSession:fromClient:](self, "registerSession:fromClient:", v6, v7);
        }

- (void)handleGetStatusMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_int64(xdict, "SessionStatus", -[NESMSession status](self, "status"));
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  xpc_connection_send_message(v6, xdict);
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_object_t value = xpc_dictionary_get_value(v4, "SessionOptions");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  int64_t int64 = xpc_dictionary_get_int64(v4, "SessionGroupID");
  int64_t euid = xpc_dictionary_get_int64(v4, "SessionUserID");
  int v11 = xpc_dictionary_get_int64(v4, "SessionPID");

  if (v6)
  {
    if ((_DWORD)int64)
    {
      if ((_DWORD)euid) {
        goto LABEL_4;
      }
LABEL_8:
      int64_t euid = xpc_connection_get_euid(v6);
      if (!v8) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }

    int64_t int64 = xpc_connection_get_egid(v6);
    if (!(_DWORD)euid) {
      goto LABEL_8;
    }
  }

- (void)handleStopMessageWithReason:(int)a3
{
  if (a3 != 36)
  {
    if (a3 == 1 && -[NESMSession type](self, "type") == 1) {
      sub_10007C56C(self, (id)1);
    }
    -[NESMSession setRestartPending:](self, "setRestartPending:", 0LL);
    -[NESMSession setStartMessage:](self, "setStartMessage:", 0LL);
  }

- (BOOL)canSleep
{
  return 1;
}

- (BOOL)handleSleep
{
  return 0;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", a3, a4, a5));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100092194;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  id v4 = a3;
  xpc_object_t message = xpc_dictionary_create_reply(v4);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  xpc_connection_send_message(v6, message);
}

- (id)copyExtendedStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession startMessage](self, "startMessage"));

  if (!v3) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession startMessage](self, "startMessage"));
  xpc_object_t v5 = xpc_copy(v4);

  xpc_dictionary_set_value(v5, "SessionBootstrapPort", 0LL);
  xpc_dictionary_set_value(v5, "SessionAuditSessionPort", 0LL);
  id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  if ((isa_nsdictionary(v7) & 1) == 0)
  {

    return 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SessionOptions"]);
  int v9 = isa_nsdictionary(v8);

  if (v9)
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SessionOptions"]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

    uint64_t v12 = kSCEntNetVPN;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kSCEntNetVPN]);
    int v14 = isa_nsdictionary(v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));

      if (isa_nsdictionary(v16))
      {
        uint64_t v17 = kSCPropNetVPNAuthPassword;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSCPropNetVPNAuthPassword]);

        if (v18)
        {
          [v16 setObject:@"****" forKeyedSubscript:v17];
          [v11 setObject:v16 forKeyedSubscript:v12];
          [v7 setObject:v11 forKeyedSubscript:@"SessionOptions"];
        }
      }
    }
  }

  uint64_t v21 = @"StartMessage";
  uint64_t v22 = v7;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));

  return v19;
}

- (void)handleNetworkPrepareResult:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      int64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@: Network available via interface %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    int64_t v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@: No network available",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)satisfyPathResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100092188;
  v7[3] = &unk_1000BEBE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)prepareNetwork
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  if (v3) {
    uint64_t v4 = v3[6];
  }
  else {
    uint64_t v4 = 0LL;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryPhysicalInterface]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 interfaceName]);

  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 1 || !v7)
  {
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100092170;
    v12[3] = &unk_1000BEC08;
    v12[4] = self;
    dispatch_async(v9, v12);
LABEL_10:

    goto LABEL_11;
  }

  if (v4 == 3)
  {
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    -[dispatch_queue_s satisfyPathForSession:](v9, "satisfyPathForSession:", self);
    goto LABEL_10;
  }

  if (v4 == 1)
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009217C;
    block[3] = &unk_1000BEBE0;
    block[4] = self;
    id v11 = v7;
    dispatch_async(v8, block);
  }

- (void)notifyChangedExtendedStatus
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 2LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v11);
        if (v12) {
          id v12 = objc_getProperty(v12, v8, 16LL, 1);
        }
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return a3 < 2;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int status = self->_status;
  unsigned int v6 = -[NESMSession shouldBeIdleForStatus:](self, "shouldBeIdleForStatus:", status);
  unsigned int v7 = -[NESMSession shouldBeIdleForStatus:](self, "shouldBeIdleForStatus:", v3);
  int v8 = self->_status;
  self->_unsigned int status = v3;
  if (status != (_DWORD)v3)
  {
    unsigned int v9 = v7;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NESMVPNSession);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(self, v11);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t isKindOfClass = (uint64_t)-[NESMSession parentType](self, "parentType");
      BOOL v14 = isKindOfClass == 2;
    }

    else
    {
      BOOL v14 = 0;
    }

    if (((v6 ^ 1 | v9) & 1) == 0 && !v14)
    {
      uint64_t v15 = ne_log_obj(isKindOfClass, v13);
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%@ is no longer idle, beginning transaction",  buf,  0xCu);
      }

      uint64_t v17 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
      uint64_t v20 = -[NSString initWithFormat:]( v17,  "initWithFormat:",  @"com.apple.nesessionmanager.activeSession.%@",  v19);

      uint64_t v21 = (void *)os_transaction_create(-[NSString UTF8String](v20, "UTF8String"));
      objc_setProperty_atomic(self, v22, v21, 56LL);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      sub_100051D5C(v23, 1LL);
    }

    if (((v6 | v9 ^ 1 | v14) & 1) == 0)
    {
      uint64_t v24 = ne_log_obj(isKindOfClass, v13);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%@ is now idle, ending transaction",  buf,  0xCu);
      }

      objc_setProperty_atomic(self, v26, 0LL, 56LL);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      sub_100051D5C(v27, -1LL);
    }

    uint64_t v28 = -[NESMSession type](self, "type");
    if ((_DWORD)v28 == 2 && (v3 - 5) <= 0xFFFFFFFD && v8 == 2)
    {
      uint64_t v30 = ne_log_obj(v28, v29);
      int64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%@ Per-app VPN failed to connect, pausing VPN On Demand",  buf,  0xCu);
      }

      uint64_t v28 = (uint64_t)sub_10007C56C(self, (id)2);
    }

    if ((_DWORD)v3 != 1)
    {
      if ((_DWORD)v3 == 3)
      {
        kdebug_trace(726990940LL, 0LL, 0LL, 0LL, 0LL);
        -[NESMSession setConnectedCount:]( self,  "setConnectedCount:",  (char *)-[NESMSession connectedCount](self, "connectedCount") + 1);
        -[NESMSession setFailedConnectCountWithinInterval:](self, "setFailedConnectCountWithinInterval:", 0LL);
        uint64_t v28 = (uint64_t)-[NESMSession setFirstFailedConnectTime:](self, "setFirstFailedConnectTime:", 0LL);
      }

      else if ((_DWORD)v3 == 2)
      {
        uint64_t v28 = (uint64_t)-[NESMSession setConnectCount:]( self,  "setConnectCount:",  (char *)-[NESMSession connectCount](self, "connectCount") + 1);
      }

- (void)setUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {

    uint64_t v5 = (NSNumber *)&off_1000C1980;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uid = self->_uid;
  self->_uid = v5;
}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  return 0;
}

- (int)lastStopReason
{
  v2 = self;
  objc_sync_enter(v2);
  int lastStopReason = v2->_lastStopReason;
  objc_sync_exit(v2);

  return lastStopReason;
}

- (void)setLastStopReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  if ((v3 & 0xFFFFFFDF) == 0 || !v4->_lastStopReason)
  {
    uint64_t v7 = ne_log_obj(v5, v6);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Setting last stop reason to %d",  (uint8_t *)v10,  8u);
    }

    v4->_int lastStopReason = v3;
    if ((_DWORD)v3 != 3)
    {
      id v9 = +[NEVPNConnection createDisconnectErrorWithDomain:code:]( &OBJC_CLASS___NEVPNConnection,  "createDisconnectErrorWithDomain:code:",  @"NEVPNConnectionErrorDomainPlugin",  v3);
      -[NESMSession setLastDisconnectError:](v4, "setLastDisconnectError:", v9);
    }
  }

  objc_sync_exit(v4);
}

- (NSError)lastDisconnectError
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_lastDisconnectError;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLastDisconnectError:(id)a3
{
  uint64_t v5 = (NSError *)a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  p_lastDisconnectError = &v6->_lastDisconnectError;
  lastDisconnectError = v6->_lastDisconnectError;
  if (lastDisconnectError != v5 && (-[NSError isEqual:](lastDisconnectError, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&v6->_lastDisconnectError, a3);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v6, "auxiliaryDataKey"));

    if (v9)
    {
      xpc_object_t v10 = *p_lastDisconnectError;
      if (*p_lastDisconnectError)
      {
        id v21 = 0LL;
        uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v10,  1LL,  &v21));
        id v12 = v21;
        BOOL v14 = v12;
        if (v11)
        {

LABEL_11:
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NEFileHandleMaintainer sharedMaintainer]( &OBJC_CLASS___NEFileHandleMaintainer,  "sharedMaintainer"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v6, "auxiliaryDataKey"));
          [v17 setAuxiliaryData:v11 forKey:v18];

          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NEFileHandleMaintainer sharedMaintainer]( &OBJC_CLASS___NEFileHandleMaintainer,  "sharedMaintainer"));
          [v19 commit];

          goto LABEL_12;
        }

        uint64_t v15 = ne_log_obj(v12, v13);
        __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *p_lastDisconnectError;
          *(_DWORD *)buf = 138412546;
          v23 = v20;
          __int16 v24 = 2112;
          uint64_t v25 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to serialize the last disconnect error (%@): %@",  buf,  0x16u);
        }
      }

      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSData);
      goto LABEL_11;
    }
  }

- (void)setupFromAuxiliaryData
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession auxiliaryDataKey](v2, "auxiliaryDataKey"));
  id v5 = [v3 copyAuxiliaryDataForKey:v4];

  if (isa_nsdata(v5) && [v5 length])
  {
    id v9 = 0LL;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError),  v5,  &v9);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = v9;
    if (v7) {
      objc_storeStrong((id *)&v2->_lastDisconnectError, v7);
    }
  }

  objc_sync_exit(v2);
}

- (int)SCNCStatus
{
  return SCNetworkConnectionGetStatusFromNEStatus(-[NESMSession status](self, "status"));
}

- (void)handleUpdateConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091A10;
  block[3] = &unk_1000BED30;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 generateSignature]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configurationSignature](self, "configurationSignature"));
    unsigned __int8 v8 = [v7 isEqualToData:v6];

    if ((v8 & 1) != 0)
    {
LABEL_25:
      char v14 = v8 ^ 1;

      goto LABEL_26;
    }

    uint64_t is_debug_logging_enabled = nelog_is_debug_logging_enabled();
    int v10 = is_debug_logging_enabled;
    uint64_t v11 = ne_log_large_obj(is_debug_logging_enabled);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        int v33 = self;
        __int16 v34 = 2112;
        double v35 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%@: handling configuration changed: %@",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptionWithOptions:2]);
      *(_DWORD *)buf = 138412546;
      int v33 = self;
      __int16 v34 = 2112;
      double v35 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%@: handling configuration changed: %@",  buf,  0x16u);
    }

    id v16 = v5;
    if (self)
    {
      p_vtable = &OBJC_CLASS___NESMVPNSessionRetryCounter.vtable;
      if (self->_policySession) {
        uint64_t v18 = sub_10002BFE8((uint64_t)&OBJC_CLASS___NESMPolicyMasterSession, &stru_1000BDB28);
      }
      else {
        uint64_t v18 = 0LL;
      }
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 appVPN]);
      if (v20)
      {
        id v21 = (void *)v20;
        SEL v22 = (void *)objc_claimAutoreleasedReturnValue([v16 appVPN]);

        if (v22)
        {
          uint64_t v30 = v18;
          buf[0] = 0;
          int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v31 appVPN]);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 appRules]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v16 appVPN]);
          SEL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 appRules]);
          unsigned int v27 = +[NEVPNApp compareAppRules:newAppRules:noExistingDomain:]( &OBJC_CLASS___NEVPNApp,  "compareAppRules:newAppRules:noExistingDomain:",  v24,  v26,  buf);

          p_vtable = (void **)(&OBJC_CLASS___NESMVPNSessionRetryCounter + 24);
          if (buf[0]) {
            int v28 = 1;
          }
          else {
            int v28 = v27;
          }
          if (v28 != 1 || !v30) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }

      else
      {
      }

      if (v18)
      {
LABEL_22:
        if (self->_policySession) {
          sub_10002BFE8((uint64_t)(p_vtable + 42), &stru_1000BDB08);
        }
      }
    }

- (void)installWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000919D4;
  v7[3] = &unk_1000BED58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)installPendedOnQueue
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000919CC;
  block[3] = &unk_1000BEC08;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)uninstallOnQueue
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000919C4;
  block[3] = &unk_1000BEC08;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopIfNecessaryWithReason:(int)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100091724;
  v6[3] = &unk_1000BED80;
  int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)stopIfNecessaryWithReason:(int)a3 withCompletionHandler:(id)a4
{
  uint64_t v5 = ne_log_obj(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2080;
    int v10 = "-[NESMSession stopIfNecessaryWithReason:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: %s not supported", (uint8_t *)&v7, 0x16u);
  }
}

- (NSString)pluginType
{
  return 0LL;
}

- (BOOL)isActive
{
  return -[NESMSession status](self, "status") == 3
      || -[NESMSession status](self, "status") == 2
      || -[NESMSession status](self, "status") == 4;
}

- (void)invalidate
{
  self->_unsigned int status = 0;
  server = self->_server;
  self->_server = 0LL;
}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  id v6 = a3;
  xpc_object_t v7 = v6;
  if (!v6) {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_dictionary_set_int64(v7, "SessionCommandType", 2LL);
  int int64 = xpc_dictionary_get_int64(v7, "SessionPID");
  __int16 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091554;
  block[3] = &unk_1000BEDD0;
  BOOL v14 = a4;
  void block[4] = self;
  id v12 = v7;
  int v13 = int64;
  id v10 = v7;
  dispatch_async(v9, block);
}

- (void)restartSession
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v6 = v4;
  if (v4)
  {
    xpc_dictionary_set_BOOL(v4, "restart", 1);
  }

  else
  {
    uint64_t v7 = ne_log_obj(0LL, v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", v9, 2u);
    }
  }

  xpc_dictionary_set_value(v3, "SessionOptions", v6);
  -[NESMSession startWithCommand:isOnDemand:](self, "startWithCommand:isOnDemand:", v3, 0LL);
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  return 0;
}

- (id)getIDSNetworkAgentDomain
{
  uint64_t v2 = NEGetConsoleUserUID(self, a2);
  if ((_DWORD)v2) {
    xpc_object_t v3 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"ids%d", v2);
  }
  else {
    xpc_object_t v3 = @"ids501";
  }
  return v3;
}

- (BOOL)disableDefaultDropAfterBoot
{
  return 0;
}

- (BOOL)supportsDefaultDrop
{
  return 0;
}

- (BOOL)waitForPerApp
{
  return 0;
}

- (void)sendConfigurationChangeHandledNotification
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, "SessionNotificationType", 3LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v11);
        if (v12) {
          id v12 = objc_getProperty(v12, v8, 16LL, 1);
        }
        xpc_connection_send_message((xpc_connection_t)v12, v3);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)pauseOnDemand
{
  uint64_t v3 = ne_log_obj(self, a2);
  xpc_object_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: pause VPN OnDemand", (uint8_t *)&v5, 0xCu);
  }

  sub_10007C56C(self, (id)3);
}

- (void)unpauseOnDemand
{
  uint64_t v3 = ne_log_obj(self, a2);
  xpc_object_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: unpause VPN OnDemand", (uint8_t *)&v5, 0xCu);
  }

  sub_10007C56C(self, 0LL);
}

- (BOOL)isStopAllowed:(id)a3
{
  return 1;
}

- (int)status
{
  return self->_status;
}

- (int)type
{
  return self->_type;
}

- (NESMServer)server
{
  return (NESMServer *)objc_getProperty(self, a2, 64LL, 1);
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSData)configurationSignature
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setConfigurationSignature:(id)a3
{
}

- (NSArray)configurationUserUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setConfigurationUserUUIDs:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (OS_dispatch_queue)messageQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSNumber)uid
{
  return self->_uid;
}

- (NSNumber)gid
{
  return (NSNumber *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setGid:(id)a3
{
}

- (BOOL)isOnDemand
{
  return self->_isOnDemand;
}

- (void)setIsOnDemand:(BOOL)a3
{
  self->_isOnDemand = a3;
}

- (unint64_t)connectTime
{
  return self->_connectTime;
}

- (void)setConnectTime:(unint64_t)a3
{
  self->_connectTime = a3;
}

- (unint64_t)lastConnectedDuration
{
  return self->_lastConnectedDuration;
}

- (void)setLastConnectedDuration:(unint64_t)a3
{
  self->_lastConnectedDuration = a3;
}

- (int64_t)connectCount
{
  return self->_connectCount;
}

- (void)setConnectCount:(int64_t)a3
{
  self->_connectCount = a3;
}

- (int64_t)connectedCount
{
  return self->_connectedCount;
}

- (void)setConnectedCount:(int64_t)a3
{
  self->_connectedCount = a3;
}

- (int64_t)disconnectedCount
{
  return self->_disconnectedCount;
}

- (void)setDisconnectedCount:(int64_t)a3
{
  self->_disconnectedCount = a3;
}

- (unint64_t)maxConnectTime
{
  return self->_maxConnectTime;
}

- (void)setMaxConnectTime:(unint64_t)a3
{
  self->_maxConnectTime = a3;
}

- (NESMPolicySession)policySession
{
  return (NESMPolicySession *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPolicySession:(id)a3
{
}

- (int64_t)failedConnectCountWithinInterval
{
  return self->_failedConnectCountWithinInterval;
}

- (void)setFailedConnectCountWithinInterval:(int64_t)a3
{
  self->_failedConnectCountWithinInterval = a3;
}

- (NSDate)firstFailedConnectTime
{
  return (NSDate *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setFirstFailedConnectTime:(id)a3
{
}

- (NSDate)lastStatusChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setLastStatusChangeTime:(id)a3
{
}

- (NSString)auxiliaryDataKey
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setAuxiliaryDataKey:(id)a3
{
}

- (NEPolicySession)controlPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setControlPolicySession:(id)a3
{
}

- (NEPolicySession)highPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setHighPolicySession:(id)a3
{
}

- (NWNetworkAgentRegistration)networkAgentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setNetworkAgentRegistration:(id)a3
{
}

- (NENetworkAgent)networkAgent
{
  return (NENetworkAgent *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setNetworkAgent:(id)a3
{
}

- (NWMonitor)onDemandMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setOnDemandMonitor:(id)a3
{
}

- (NEOnDemandRule)matchedRule
{
  return (NEOnDemandRule *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setMatchedRule:(id)a3
{
}

- (NSMutableArray)networkAgentInterfaces
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setNetworkAgentInterfaces:(id)a3
{
}

- (NSArray)registeredNetworkAgentInterfaces
{
  return (NSArray *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setRegisteredNetworkAgentInterfaces:(id)a3
{
}

- (int64_t)onDemandPauseLevelInternal
{
  return self->_onDemandPauseLevelInternal;
}

- (void)setOnDemandPauseLevelInternal:(int64_t)a3
{
  self->_onDemandPauseLevelInternal = a3;
}

- (OS_dispatch_source)onDemandPauseTimerSource
{
  return self->_onDemandPauseTimerSource;
}

- (void)setOnDemandPauseTimerSource:(id)a3
{
  self->_onDemandPauseTimerSource = (OS_dispatch_source *)a3;
}

- (NSMutableArray)staleOnDemandDNSKeys
{
  return (NSMutableArray *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setStaleOnDemandDNSKeys:(id)a3
{
}

- (NWResolver)dnsRedirectionDetector
{
  return (NWResolver *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setDnsRedirectionDetector:(id)a3
{
}

- (OS_os_transaction)dnsRedirectionTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setDnsRedirectionTransaction:(id)a3
{
}

- (NSString)lastPrimaryInterface
{
  return (NSString *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setLastPrimaryInterface:(id)a3
{
}

- (NSMutableArray)onDemandDomainCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setOnDemandDomainCache:(id)a3
{
}

- (BOOL)restartPending
{
  return self->_restartPending;
}

- (void)setRestartPending:(BOOL)a3
{
  self->_restartPending = a3;
}

- (OS_xpc_object)startMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setStartMessage:(id)a3
{
}

- (BOOL)disableOnDemand
{
  return self->_disableOnDemand;
}

- (void)setDisableOnDemand:(BOOL)a3
{
  self->_disableOnDemand = a3;
}

- (int64_t)defaultDropType
{
  return self->_defaultDropType;
}

- (void)setDefaultDropType:(int64_t)a3
{
  self->_defaultDropType = a3;
}

- (BOOL)isDropPersistent
{
  return self->_isDropPersistent;
}

- (void)setIsDropPersistent:(BOOL)a3
{
  self->_isDropPersistent = a3;
}

- (BOOL)isDeregisteredEnterpriseVPNSession
{
  return self->_isDeregisteredEnterpriseVPNSession;
}

- (void)setIsDeregisteredEnterpriseVPNSession:(BOOL)a3
{
  self->_isDeregisteredEnterpriseVPNSession = a3;
}

- (BOOL)isDeregisteredAppVPNSession
{
  return self->_isDeregisteredAppVPNSession;
}

- (void)setIsDeregisteredAppVPNSession:(BOOL)a3
{
  self->_isDeregisteredAppVPNSession = a3;
}

- (void).cxx_destruct
{
}

+ (id)sessionWithConfiguration:(id)a3 andType:(int)a4 andServer:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v10 = ne_log_obj(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = ne_session_type_to_string(v6);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    __int16 v76 = 2112;
    v77 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Creating session with type %s, id %@ (%@)",  buf,  0x20u);
  }

  switch((int)v6)
  {
    case 1:
      __int128 v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue([v7 VPN]);

      if (v15)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 protocol]);
        uint64_t v18 = (char *)[v17 type];

        if ((unint64_t)(v18 - 1) < 2)
        {
          SEL v54 = objc_alloc(&OBJC_CLASS___NESMLegacySession);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
          SEL v26 = v54;
          unsigned int v27 = v7;
          int v28 = v8;
          uint64_t v29 = v20;
          int v30 = 1;
          goto LABEL_48;
        }

        if (v18 == (char *)4)
        {
          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v62 protocol]);

          xpc_object_t v63 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
          id v64 = [v63 tunnelType];

          if (v64 == (id)1) {
            uint64_t v65 = &OBJC_CLASS___NESMVPNSession;
          }
          else {
            uint64_t v65 = &OBJC_CLASS___NESMTransparentProxySession;
          }
          uint64_t v73 = (NESMVPNSession *)objc_alloc(v65);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pluginType]);
          uint64_t v67 = v73;
          id v68 = v7;
          id v69 = v8;
          __int16 v70 = v19;
          v71 = v20;
          uint64_t v72 = 1LL;
          goto LABEL_61;
        }

        __int128 v15 = objc_alloc(&OBJC_CLASS___NESMIKEv2VPNSession);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v7 VPN]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
        if (v15)
        {
          *(void *)buf = v15;
          *(void *)&buf[8] = &OBJC_CLASS___NESMIKEv2VPNSession;
          id v21 = (NESMFlowDivertSession *)objc_msgSendSuper2( (objc_super *)buf,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sess ionQueue:messageQueue:tunnelKind:parent:",  v7,  v8,  v20,  @"com.apple.NetworkExtension.IKEv2Provider",  1,  0,  0,  1,  0);
          goto LABEL_62;
        }

        goto LABEL_63;
      }

      goto LABEL_64;
    case 2:
      __int128 v15 = (NESMIKEv2VPNSession *)objc_claimAutoreleasedReturnValue([v7 appVPN]);

      if (v15)
      {
        SEL v22 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 protocol]);
        id v24 = [v23 type];

        if (v24 == (id)5)
        {
          __int128 v15 = objc_alloc(&OBJC_CLASS___NESMIKEv2VPNSession);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
          if (!v15) {
            goto LABEL_63;
          }
          *(void *)buf = v15;
          *(void *)&buf[8] = &OBJC_CLASS___NESMIKEv2VPNSession;
          id v21 = (NESMFlowDivertSession *)objc_msgSendSuper2( (objc_super *)buf,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:sess ionQueue:messageQueue:tunnelKind:parent:",  v7,  v8,  v20,  @"com.apple.NetworkExtension.IKEv2Provider",  2,  0,  0,  1,  0);
        }

        else if (v24 == (id)4)
        {
          id v55 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v55 protocol]);

          id v56 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
          id v57 = [v56 tunnelType];

          if (v57 == (id)2)
          {
            id v58 = objc_alloc(&OBJC_CLASS___NESMFlowDivertSession);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pluginType]);
            id v21 = -[NESMFlowDivertSession initWithConfiguration:andServer:andProtocol:andPluginType:]( v58,  "initWithConfiguration:andServer:andProtocol:andPluginType:",  v7,  v8,  v19,  v20);
          }

          else
          {
            uint64_t v66 = objc_alloc(&OBJC_CLASS___NESMVPNSession);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pluginType]);
            uint64_t v67 = v66;
            id v68 = v7;
            id v69 = v8;
            __int16 v70 = v19;
            v71 = v20;
            uint64_t v72 = 2LL;
LABEL_61:
            id v21 = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:]( v67,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:",  v68,  v69,  v70,  v71,  v72);
          }
        }

        else
        {
          if (v24 != (id)1) {
            goto LABEL_46;
          }
          uint64_t v25 = objc_alloc(&OBJC_CLASS___NESMLegacySession);
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
          SEL v26 = v25;
          unsigned int v27 = v7;
          int v28 = v8;
          uint64_t v29 = v20;
          int v30 = 2;
LABEL_48:
          id v21 = (NESMFlowDivertSession *)sub_100063C34(v26, v27, v28, v29, v30);
        }

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

+ (__CFDictionary)copyRouteCacheFromRoutes:(__CFArray *)a3 isIPv6:(BOOL)a4
{
  return (__CFDictionary *)NEVirtualInterfaceCopyRouteCacheFromRoutes(a3, a4);
}

+ (__CFDictionary)copyDefaultRouteCacheIsIPv6:(BOOL)a3
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  int v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  __int128 v14 = v5;
  uint64_t v6 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  __int128 v13 = v6;
  if (a3)
  {
    *(void *)bytes = 0LL;
    uint64_t v12 = 0LL;
    *(void *)uint64_t v10 = CFDataCreate(kCFAllocatorDefault, bytes, 16LL);
    CFArrayAppendValue(v5, *(const void **)v10);
    CFArrayAppendValue(v6, *(const void **)v10);
    id v7 = v10;
  }

  else
  {
    *(_DWORD *)uint64_t v10 = 0;
    CFDataRef v8 = CFDataCreate(kCFAllocatorDefault, v10, 4LL);
    *(void *)bytes = v8;
    CFArrayAppendValue(v5, v8);
    CFArrayAppendValue(v6, v8);
    id v7 = bytes;
  }

  myCFRelease(v7);
  CFDictionarySetValue(Mutable, @"subnet-addresses", v5);
  CFDictionarySetValue(Mutable, @"subnet-masks", v6);
  myCFRelease(&v14);
  myCFRelease(&v13);
  return Mutable;
}

@end