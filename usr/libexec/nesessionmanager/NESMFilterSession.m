@interface NESMFilterSession
- (BOOL)disableDefaultDropAfterBoot;
- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)isStopAllowed:(id)a3;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (BOOL)supportsDefaultDrop;
- (BOOL)waitForPerApp;
- (NESMFilterSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)plugin:(id)a3 didApplySettings:(id)a4;
- (id)pluginDidRequestContentFilterSocket:(id)a3;
- (id)pluginDidRequestPacketFilterChannel:(id)a3;
- (id)pluginType;
- (int)type;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogin;
- (void)handleWakeup;
- (void)install;
- (void)invalidate;
- (void)plugin:(id)a3 didSetStatus:(int64_t)a4 andError:(int64_t)a5;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidAcknowledgeSleep:(id)a3;
- (void)pluginDidDispose:(id)a3;
- (void)pluginDidRequestAgentClientServer:(id)a3;
- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4;
- (void)uninstall;
@end

@implementation NESMFilterSession

- (NESMFilterSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v13, "initWithConfiguration:andServer:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_state = 0LL;
    v7->_externallyStopped = 0;
    v7->_restartIntervalMsecs = 500LL;
    v7->_restartIntervalAttempts = 0LL;
    v9 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v11 = [v6 grade];
    if (v9) {
      v9 = (NESMPolicySession *)sub_10002E7FC((id *)&v9->super.isa, v10, 4, v11, (void *)1, (void *)1);
    }
    -[NESMSession setPolicySession:](v8, "setPolicySession:", v9);

    sub_10007AFD4(v8);
  }

  return v8;
}

- (int)type
{
  return 4;
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentFilter]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filterDataProviderBundleIdentifier]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentFilter]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 filterPacketProviderBundleIdentifier]);

  if (v8 && ([v4 isEqualToString:v8] & 1) != 0)
  {
    unsigned __int8 v13 = 1;
  }

  else if (v12)
  {
    unsigned __int8 v13 = [v4 isEqualToString:v12];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)handleInitializeState
{
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 externalIdentifier]);
  if (!v6)
  {

LABEL_9:
    if (self)
    {
      self->_externallyStopped = 0;
      objc_setProperty_atomic(self, v10, v4, 416LL);
      sub_100071460(self, 0LL);
    }

    v61.receiver = self;
    v61.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
    id v15 = -[NESMSession handleStartMessage:](&v61, "handleStartMessage:", v4);
    uint64_t v17 = ne_log_obj(v15, v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int controlUnit = self->_controlUnit;
      *(_DWORD *)buf = 138412546;
      v63 = self;
      __int16 v64 = 1024;
      unsigned int v65 = controlUnit;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: Starting with control unit %u",  buf,  0x12u);
    }

    else
    {

      if (!self)
      {
LABEL_15:
        xpc_object_t value = xpc_dictionary_get_value(v4, "SessionOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue(value);
        v24 = v22;
        if (v22 && xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v24, "test-agent"))
        {
          xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
          uint64_t v26 = objc_claimAutoreleasedReturnValue(remote_connection);
          v28 = (void *)v26;
          if (!v26)
          {
LABEL_22:
            uint64_t v31 = ne_log_obj(v26, v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
LABEL_23:

              if (self) {
                id Property = objc_getProperty(self, v33, 376LL, 1);
              }
              else {
                id Property = 0LL;
              }
              [Property handleStartMessage:v4];

              goto LABEL_29;
            }

            *(_DWORD *)buf = 136315138;
            v63 = (NESMFilterSession *)"com.apple.private.networkextension.test-control";
            v56 = "Test provider does not have the %s entitlement";
            v57 = (os_log_s *)v32;
            uint32_t v58 = 12;
LABEL_39:
            _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
            goto LABEL_23;
          }

          v29 = (void *)xpc_connection_copy_entitlement_value(v26, "com.apple.private.networkextension.test-control");
          v30 = v29;
          if (!v29 || xpc_get_type(v29) != (xpc_type_t)&_xpc_type_BOOL)
          {

            goto LABEL_22;
          }

          BOOL v36 = xpc_BOOL_get_value(v30);

          if (!v36) {
            goto LABEL_22;
          }
          id v37 = -[NEProcessIdentity initFromXPCConnection:]( objc_alloc(&OBJC_CLASS___NEProcessIdentity),  "initFromXPCConnection:",  v28);
          v39 = v37;
          if (self)
          {
            objc_setProperty_atomic(self, v38, v37, 368LL);

            id v41 = objc_getProperty(self, v40, 368LL, 1);
            if (v41)
            {
              xpc_object_t v43 = xpc_dictionary_get_value(v24, "listener-endpoint");
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              v45 = v44;
              if (v44 && xpc_get_type(v44) == (xpc_type_t)&_xpc_type_endpoint)
              {
                v46 = objc_alloc(&OBJC_CLASS___NETestAgent);
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
                v48 = (void *)objc_claimAutoreleasedReturnValue([v47 pluginType]);
                v49 = sub_100064128((id *)&v46->super.super.isa, v48, 4LL, v4);

                if (v49)
                {
                  v52 = objc_alloc(&OBJC_CLASS___NEFilterPlugin);
                  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
                  v54 = -[NEPlugin initWithAgent:delegateQueue:andDelegate:]( v52,  "initWithAgent:delegateQueue:andDelegate:",  v49,  v53,  self);
                  objc_setProperty_atomic(self, v55, v54, 400LL);
                }

                else
                {
                  uint64_t v59 = ne_log_obj(v50, v51);
                  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Failed to create a test agent",  buf,  2u);
                  }
                }
              }

              goto LABEL_27;
            }
          }

          else
          {
          }

          uint64_t v60 = ne_log_obj(v41, v42);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v60);
          if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v56 = "Failed to create a process identity from the session connection";
          v57 = (os_log_s *)v32;
          uint32_t v58 = 2;
          goto LABEL_39;
        }

        if (!self)
        {
          id v35 = 0LL;
          goto LABEL_28;
        }

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self && a3 != 37)
  {
    self->_externallyStopped = 1;
    objc_setProperty_atomic(self, a2, 0LL, 416LL);
  }

  sub_100071460(self, (const char *)((_DWORD)v3 != 37));
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
  -[NESMSession handleStopMessageWithReason:](&v7, "handleStopMessageWithReason:", v3);
  if (self) {
    id Property = objc_getProperty(self, v5, 376LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property handleStop];
}

- (BOOL)handleSleep
{
  if (self) {
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376LL, 1);
  }
  return -[NESMFilterSession handleSleep](self, "handleSleep");
}

- (void)handleWakeup
{
  if (self) {
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376LL, 1);
  }
  -[NESMFilterSession handleWakeup](self, "handleWakeup");
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if ((a3 & 0xFFFFFFFB) == 1)
  {
    block[7] = v3;
    block[8] = v4;
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100071428;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v6, block);
  }

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071364;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)pluginDidDispose:(id)a3
{
  id v6 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 376LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property handlePluginDisposeComplete:v6];
}

- (id)pluginDidRequestContentFilterSocket:(id)a3
{
  id v4 = a3;
  if (!self || !self->_controlUnit) {
    goto LABEL_17;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 externalIdentifier]);
  if (v6)
  {
    objc_super v7 = (void *)v6;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentFilter]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 perApp]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appRules]);
    id v12 = [v11 count];

    if (!v12) {
      goto LABEL_17;
    }
  }

  else
  {
  }

  unsigned int v37 = self->_controlUnit & 0x1FFFFFFF;
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket("com.apple.content-filter");
  if ((_DWORD)KernelControlSocket == -1)
  {
    uint64_t v23 = ne_log_obj(KernelControlSocket, v14);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to create the content filter control socket",  buf,  2u);
    }

    goto LABEL_17;
  }

  uint64_t v15 = KernelControlSocket;
  uint64_t v16 = NEHelperInterfaceSetOption(KernelControlSocket, 1LL, &v37, 4LL);
  if ((_DWORD)v16)
  {
    int v18 = v16;
    uint64_t v19 = ne_log_obj(v16, v17);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = strerror(v18);
      *(_DWORD *)buf = 136315138;
      v39 = v21;
      v22 = "Error setting CFIL_OPT_NECP_CONTROL_UNIT on socket: %s\n";
LABEL_22:
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 contentFilter]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 provider]);
  unsigned int v28 = [v27 preserveExistingConnections];

  unsigned int v36 = v28;
  uint64_t v29 = NEHelperInterfaceSetOption(v15, 3LL, &v36, 4LL);
  if ((_DWORD)v29)
  {
    int v31 = v29;
    uint64_t v32 = ne_log_obj(v29, v30);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v35 = strerror(v31);
      *(_DWORD *)buf = 136315138;
      v39 = v35;
      v22 = "Error setting CFIL_OPT_PRESERVE_CONNECTIONS on socket: %s\n";
      goto LABEL_22;
    }

- (void)pluginDidRequestAgentClientServer:(id)a3
{
  if (self) {
    self->_acceptAgentClients = 1;
  }
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = ne_log_obj(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!a4 || v9)
  {
    if (v13)
    {
      int v25 = 138412546;
      uint64_t v26 = self;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Failed to start with error: %@",  (uint8_t *)&v25,  0x16u);
    }

    if (v9)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v19 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v20 = [v9 code];

        if (v20 == (id)2)
        {
          -[NESMSession setLastStopReason:](self, "setLastStopReason:", 6LL);
          if (self) {
            id Property = objc_getProperty(self, v21, 376LL, 1);
          }
          else {
            id Property = 0LL;
          }
          id v23 = v8;
          uint64_t v24 = 0LL;
LABEL_21:
          [Property handlePlugin:v23 statusDidChangeToIdleWithError:v24];
          goto LABEL_22;
        }
      }

      else
      {
      }
    }

    if (self) {
      id Property = objc_getProperty(self, v18, 376LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v23 = v8;
    uint64_t v24 = 1LL;
    goto LABEL_21;
  }

  if (v13)
  {
    int v25 = 138412802;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    int v30 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin %@ started with pid %d",  (uint8_t *)&v25,  0x1Cu);
  }

  id v14 = v8;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NEFilterPlugin);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v15);
  if (v14 && (isKindOfClass & 1) != 0)
  {
    [v14 setStatus:1 error:0];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 remotePluginObject]);
    [v17 startFilter];
  }

LABEL_22:
}

- (void)plugin:(id)a3 didSetStatus:(int64_t)a4 andError:(int64_t)a5
{
  id v8 = a3;
  id v15 = v8;
  switch(a4)
  {
    case 0LL:
      if (self) {
        id Property = objc_getProperty(self, v9, 376LL, 1);
      }
      else {
        id Property = 0LL;
      }
      [Property handlePlugin:v15 statusDidChangeToIdleWithError:a5];
      goto LABEL_17;
    case 1LL:
      if (self) {
        id v14 = objc_getProperty(self, v9, 376LL, 1);
      }
      else {
        id v14 = 0LL;
      }
      [v14 handlePluginStatusDidChangeToStarting:v15];
      goto LABEL_17;
    case 2LL:
      if (self) {
        id v11 = objc_getProperty(self, v9, 376LL, 1);
      }
      else {
        id v11 = 0LL;
      }
      [v11 handlePluginStatusDidChangeToRunning:v15];
      goto LABEL_17;
    case 3LL:
      if (self) {
        id v12 = objc_getProperty(self, v9, 376LL, 1);
      }
      else {
        id v12 = 0LL;
      }
      [v12 handlePlugin:v15 statusDidChangeToStoppingWithError:a5];
      goto LABEL_17;
    case 4LL:
      if (self) {
        id v13 = objc_getProperty(self, v9, 376LL, 1);
      }
      else {
        id v13 = 0LL;
      }
      [v13 handlePluginStatusDidChangeToUpdating:v15];
LABEL_17:
      id v8 = v15;
      break;
    default:
      break;
  }
}

- (id)pluginDidRequestPacketFilterChannel:(id)a3
{
  id v4 = (unsigned int *)a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Plugin %@ requested a packet filter channel",  (uint8_t *)&v23,  0x16u);
  }

  id v8 = sub_100016694(v4);
  id v9 = (void *)nw_interpose_client_register(v8, 0LL);
  id v11 = v9;
  if (self)
  {
    objc_setProperty_atomic(self, v10, v9, 448LL);

    id Property = objc_getProperty(self, v12, 448LL, 1);
    if (Property)
    {
LABEL_8:
      id v17 = objc_getProperty(self, v14, 448LL, 1);
      goto LABEL_9;
    }
  }

  else
  {
  }

  uint64_t v15 = ne_log_obj(Property, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v23 = 138412546;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@: Plugin %@ failed to register for necp interpose client",  (uint8_t *)&v23,  0x16u);
  }

  if (self) {
    goto LABEL_8;
  }
  id v17 = 0LL;
LABEL_9:
  if (nw_interpose_get_client_uuid(v17, v29))
  {
    int v18 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v29);
    uint64_t v20 = ne_log_obj(v18, v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412802;
      uint64_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%@: Plugin %@ registered for necp interpose client %@",  (uint8_t *)&v23,  0x20u);
    }
  }

  else
  {
    int v18 = 0LL;
  }

  return v18;
}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server", a3));
  sub_100051C0C(v4, v3);
}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t int64 = xpc_dictionary_get_int64(v7, "command");
  int v9 = int64;
  uint64_t v11 = ne_log_obj(int64, v10);
  SEL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Received a request for a new filter connection",  buf,  2u);
  }

  if (v9 != 1) {
    goto LABEL_10;
  }
  uint64_t int64 = xpc_dictionary_get_uint64(v7, "control-unit");
  id v14 = self;
  objc_sync_enter(v14);
  unsigned int v15 = v14 ? v14->_controlUnit : 0;
  objc_sync_exit(v14);

  uint64_t v18 = ne_log_obj(v16, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  int v20 = uint64 & 0x1FFFFFFF;
  int v21 = v15 & uint64 & 0x1FFFFFFF;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v30 = v20;
    __int16 v31 = 1024;
    BOOL v32 = v21 != 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Received unit %u, matches %u", buf, 0xEu);
  }

  if (v21)
  {
    v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v14, "queue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100070F78;
    v25[3] = &unk_1000BE520;
    int v28 = 1;
    v25[4] = v14;
    id v26 = v6;
    id v27 = v7;
    dispatch_async(v22, v25);

    BOOL v23 = 1;
  }

  else
  {
LABEL_10:
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  id Property = a3;
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24LL, 1);
  }
  id v8 = Property;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NETestAgent);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v13 = ne_log_obj(v11, v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      int v18 = 138412802;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      int v21 = v7;
      __int16 v22 = 2112;
      BOOL v23 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@: Invalid attempt to pin filter plugin %@ to configuration %@",  (uint8_t *)&v18,  0x20u);
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)waitForPerApp
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 externalIdentifier]);
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentFilter]);
  if (![v7 isEnabled])
  {

LABEL_9:
    return 1;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentFilter]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 perApp]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentFilter]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 perApp]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    objc_msgSend(v13, "updateAppRulesForUID:", objc_msgSend(v14, "unsignedIntValue"));

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contentFilter]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 perApp]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appRules]);
    id v19 = [v18 count];

    if (v19)
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      int v21 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 contentFilter]);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v22 perApp]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 appRules]);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
      sub_10003B00C((uint64_t)v20, v24, (uint64_t)[v25 intValue]);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 contentFilter]);
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 perApp]);
    id v29 = [v28 copyCachedMachOUUIDs];

    if (v29) {
      return 0;
    }
  }

  return 1;
}

- (void)install
{
  if (self && self->_controlUnit) {
    sub_10006FBB4((uint64_t)self);
  }
  self->_isInstalled = 1;
}

- (void)uninstall
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002BCE0((uint64_t)v3);

  self->_isInstalled = 0;
  settings = self->_settings;
  self->_settings = 0LL;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    -[NESMSession setConfiguration:](self, "setConfiguration:", 0LL);
    -[NESMSession setConfigurationSignature:](self, "setConfigurationSignature:", 0LL);
    if (!self) {
      goto LABEL_24;
    }
    sub_100070430(self, 0);
LABEL_23:
    LOBYTE(self) = 0;
    goto LABEL_24;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentFilter]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
  unsigned int v8 = [v7 filterBrowsers];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 contentFilter]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
  if (v8 == [v10 filterBrowsers])
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v45 contentFilter]);
    uint64_t v11 = v4;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v44 provider]);
    unsigned int v13 = [v12 filterSockets];
    v46 = v5;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 contentFilter]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);
    unsigned int v47 = v13 ^ [v15 filterSockets];

    uint64_t v5 = v46;
    id v4 = v11;
  }

  else
  {
    unsigned int v47 = 1;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 contentFilter]);
  if ([v16 isEnabled])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contentFilter]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 perApp]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 appRules]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v4 contentFilter]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 perApp]);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v22 appRules]);

    BOOL v24 = v20 == v23;
    int v25 = v47;
    if (!v24) {
      int v25 = 1;
    }
  }

  else
  {
    int v25 = v47;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 contentFilter]);
  int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 provider]);
  unsigned int v29 = [v28 preserveExistingConnections];
  int v30 = (void *)objc_claimAutoreleasedReturnValue([v4 contentFilter]);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 provider]);
  unsigned int v32 = [v31 preserveExistingConnections];

  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
  if (!-[NESMSession handleUpdateConfiguration:](&v48, "handleUpdateConfiguration:", v4)) {
    goto LABEL_23;
  }
  if (self) {
    sub_100070430(self, 0);
  }
  int v33 = v29 ^ v32 | v25;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 contentFilter]);
  unsigned int v36 = [v35 isEnabled];

  if (v36)
  {
    if (self) {
      id Property = objc_getProperty(self, v37, 376LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property handleUpdateConfiguration];
  }

  if (v33)
  {
    sub_1000708F4(self);
    if (self)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      SEL v40 = (void *)objc_claimAutoreleasedReturnValue([v39 contentFilter]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 provider]);
      int v42 = sub_100070EC8((uint64_t)&OBJC_CLASS___NESMFilterSession, v41);

      self->_unsigned int controlUnit = self->_controlUnit & 0x1FFFFFFF | v42;
    }

    -[NESMSession stopIfNecessaryWithReason:](self, "stopIfNecessaryWithReason:", 37LL);
  }

  LOBYTE(self) = 1;
LABEL_24:

  return (char)self;
}

- (id)pluginType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentFilter]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginType]);

  return v5;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
  -[NESMSession invalidate](&v4, "invalidate");
  -[NESMFilterSessionState leave](self->_stateHandler, "leave");
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0LL;
}

- (void)handleUserLogin
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070400;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)plugin:(id)a3 didApplySettings:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_settings, a4);
  if (self->_isInstalled && self->_controlUnit && (sub_10006FBB4((uint64_t)self) & 1) == 0) {
    id v7 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NEFilterErrorDomain,  1LL,  0LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentFilter]);
  unsigned __int8 v9 = [v8 enableManualMode];

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NESMFilterSession;
    -[NESMSession startWithCommand:isOnDemand:](&v10, "startWithCommand:isOnDemand:", v6, v4);
  }
}

- (BOOL)disableDefaultDropAfterBoot
{
  if (!-[NESMSession defaultDropType](self, "defaultDropType")) {
    return 1;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 externalIdentifier]);

  BOOL result = 0;
  if (self)
  {
    if (v4) {
      return self->_perAppDropPoliciesInstalled;
    }
  }

  return result;
}

- (BOOL)supportsDefaultDrop
{
  return -[NESMSession defaultDropType](self, "defaultDropType") != 0;
}

- (BOOL)isStopAllowed:(id)a3
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(remote_connection);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    id v6 = (void *)xpc_connection_copy_entitlement_value(v4, "com.apple.private.networkextension.configuration");
    BOOL v7 = v6 != 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end