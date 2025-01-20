@interface NESMFlowDivertSession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)resetPerAppPolicy;
- (NESMFlowDivertSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6;
- (id)pluginDidRequestFlowDivertControlSocket:(id)a3;
- (int64_t)agentPluginClass;
- (void)dealloc;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInstalledAppsChanged;
- (void)handleUserLogin;
- (void)install;
- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5;
- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4;
- (void)requestInstall;
- (void)setConfigurationWithCompletionHandler:(id)a3;
- (void)uninstall;
@end

@implementation NESMFlowDivertSession

- (NESMFlowDivertSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 copy];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appVPN]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
  objc_msgSend(v14, "updateAppRulesForUID:", objc_msgSend(v15, "unsignedIntValue"));

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NESMFlowDivertSession;
  v16 = -[NESMVPNSession initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:]( &v18,  "initWithConfiguration:andServer:andProtocol:andPluginType:andSessionType:",  v13,  v12,  v11,  v10,  2LL);

  return v16;
}

- (void)dealloc
{
  if (self)
  {
    scstore = self->_scstore;
    if (scstore) {
      CFRelease(scstore);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMFlowDivertSession;
  -[NESMVPNSession dealloc](&v4, "dealloc");
}

- (int64_t)agentPluginClass
{
  return 2LL;
}

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E444;
  v3[3] = &unk_1000BD600;
  v3[4] = self;
  -[NESMVPNSession queueChangesToTunnelConfiguration:completionHandler:]( self,  "queueChangesToTunnelConfiguration:completionHandler:",  v3,  a3);
}

- (void)requestInstall
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NESMVPNSession);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0 && (id)-[NESMVPNSession parentType](self, "parentType") == (id)1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession parent](self, "parent"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    [v4 requestInstallForSession:self withParentSession:v5 exclusive:0];
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    [v5 requestInstallForSession:self withParentSession:0 exclusive:0];
  }
}

- (void)install
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E3C8;
  v3[3] = &unk_1000BD628;
  objc_copyWeak(&v4, &location);
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](self, "setConfigurationWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)uninstall
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002EC00((uint64_t)v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002BCE0((uint64_t)v4);

  sub_10007C480(self, v5);
  if (self)
  {
    if (self->_scstore)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  (CFStringRef)[v8 UUIDString],  kSCEntNetProxies);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      id v12 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  (CFStringRef)[v11 UUIDString],  kSCEntNetDNS);

      v15[0] = NetworkServiceEntity;
      v15[1] = v12;
      id v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v15,  2LL));
      SCDynamicStoreSetMultiple(self->_scstore, 0LL, v13, 0LL);
    }

    objc_setProperty_atomic(self, v6, 0LL, 688LL);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v14 handleClearConfigurationResult:1];
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = v6;
  if ((_DWORD)v4 == 4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (self) {
      id Property = objc_getProperty(self, v8, 688LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([Property keyMaterial]);

    if (v11)
    {
      if (self) {
        id v13 = objc_getProperty(self, v12, 688LL, 1);
      }
      else {
        id v13 = 0LL;
      }
      id v14 = objc_claimAutoreleasedReturnValue([v13 keyMaterial]);
      id v16 = [v14 bytes];
      if (self) {
        id v17 = objc_getProperty(self, v15, 688LL, 1);
      }
      else {
        id v17 = 0LL;
      }
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 keyMaterial]);
      xpc_object_t v19 = xpc_data_create(v16, (size_t)[v18 length]);

      xpc_object_t value = xpc_dictionary_get_value(v7, "SessionOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue(value);
      v22 = v21;
      if (v21 && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t v23 = xpc_dictionary_get_value(v22, "SessionFlowDivertTokenProperties");
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = v24;
        if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_dictionary)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v22, "SessionFlowDivertTokenControlUnit");
          string = xpc_dictionary_get_string(v22, "SessionFlowDivertTokenSigningIdentifier");
          v28 = (void *)ne_session_policy_copy_flow_divert_token_with_key(uint64, v25, string, v19);
          v29 = v28;
          if (v28 && xpc_get_type(v28) == (xpc_type_t)&_xpc_type_data)
          {
            xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
            v31 = v30;
            if (v30 && xpc_get_type(v30) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_dictionary_set_value(v31, "SessionFlowDivertTokenKey", v29);
              xpc_dictionary_set_value(reply, "SessionInfo", v31);
            }
          }
        }
      }
    }

    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v7);
    v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v33, reply);
  }

  else
  {
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___NESMFlowDivertSession;
    -[NESMVPNSession handleGetInfoMessage:withType:](&v34, "handleGetInfoMessage:withType:", v6, v4);
  }
}

- (id)pluginDidRequestFlowDivertControlSocket:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appVPN]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NETransparentProxyProviderProtocol);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
    uint64_t v11 = (uint64_t)[v10 order];
  }

  else
  {
    uint64_t v11 = 0x7FFFFFFFLL;
  }

  if (self) {
    id Property = objc_getProperty(self, v9, 688LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v13 = objc_alloc(&OBJC_CLASS___NEFlowDivertFileHandle);
  if (Property)
  {
    id v14 = -[NEFlowDivertFileHandle initFlowDivertDataSocket](v13, "initFlowDivertDataSocket");
  }

  else
  {
    id v14 = -[NEFlowDivertFileHandle initFlowDivertControlSocketWithParams:order:]( v13,  "initFlowDivertControlSocketWithParams:order:",  v5 == 0LL,  v11);
    if (self) {
      objc_setProperty_atomic(self, v15, v14, 688LL);
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);

  return v16;
}

- (void)plugin:(id)a3 didSetConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  -[NESMVPNSession setPluginConfigurationEntities:](self, "setPluginConfigurationEntities:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000E330;
  v12[3] = &unk_1000BD650;
  id v11 = v10;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](self, "setConfigurationWithCompletionHandler:", v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)pluginDidClearConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)resetPerAppPolicy
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appVPN]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appRules]);
  if (![v5 count] || !-[NESMSession isActive](self, "isActive"))
  {

    return 1;
  }

  if (self) {
    id Property = objc_getProperty(self, v6, 688LL, 1);
  }
  else {
    id Property = 0LL;
  }

  if (!Property) {
    return 1;
  }
  uint64_t v10 = ne_log_obj(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Re-setting app rule policy",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appVPN]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appRules]);
  -[NSMutableString appendPrettyObject:withName:andIndent:options:]( v12,  "appendPrettyObject:withName:andIndent:options:",  v15,  @"Current app rules",  0LL,  0LL);

  uint64_t v16 = ne_log_large_obj();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
  }

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 appVPN]);
  if (self) {
    id v21 = objc_getProperty(self, v19, 688LL, 1);
  }
  else {
    id v21 = 0LL;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 handle]);
  unsigned __int8 v23 = objc_msgSend( v20,  "installSigningIdentifiersWithFlowDivertControlSocket:",  objc_msgSend(v22, "fileDescriptor"));

  if ((v23 & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 appVPN]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 appRules]);
    xpc_object_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
    sub_10003B00C((uint64_t)v26, v29, (uint64_t)[v30 intValue]);

    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 appVPN]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v33 appRules]);
    if (self) {
      id v36 = objc_getProperty(self, v34, 688LL, 1);
    }
    else {
      id v36 = 0LL;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 controlUnit]);
    unsigned int v62 = [v37 unsignedIntValue];
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 DNSSettings]);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v65 proxySettings]);
    unsigned __int8 v40 = [v64 enabled];
    v70 = v32;
    v71 = (_DWORD *)v31;
    v63 = v12;
    v68 = v37;
    v69 = v33;
    v67 = v38;
    if ((v40 & 1) != 0)
    {
      unsigned __int8 v61 = 1;
    }

    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession protocol](self, "protocol"));
      v59 = (void *)objc_claimAutoreleasedReturnValue([v60 proxySettings]);
      unsigned __int8 v61 = [v59 enabled];
    }

    v66 = (void *)v39;
    BOOL v44 = v39 != 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession primaryTunnelPlugin](self, "primaryTunnelPlugin"));
    id v47 = sub_100015D14(v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 appVPN]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 excludedDomains]);
    id v52 = v35;
    id v53 = v48;
    id v54 = v51;
    char v55 = (char)v71;
    if (v71)
    {
      if (isa_nsarray(v52) && v71[2] == 2)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v73 = sub_100040F9C;
        v74 = &unk_1000BDE60;
        v75 = v71;
        unsigned int v79 = v62;
        unsigned __int8 v80 = v61;
        BOOL v81 = v44;
        id v76 = v52;
        id v77 = v53;
        id v78 = v54;
        char v55 = sub_10002BFE8((uint64_t)&OBJC_CLASS___NESMPolicyMasterSession, &buf);
      }

      else
      {
        char v55 = 0;
      }
    }

    if ((v40 & 1) == 0)
    {
    }

    if ((v55 & 1) != 0)
    {

      return 1;
    }

    uint64_t v58 = ne_log_obj(v56, v57);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%@: failed to update the flow divert policies after installed applications changed",  (uint8_t *)&buf,  0xCu);
    }

    id v12 = v63;
  }

  else
  {
    uint64_t v42 = ne_log_obj(v24, v25);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%@: failed to install the signing identifiers in the kernel",  (uint8_t *)&buf,  0xCu);
    }
  }

  return 0;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = [a3 copy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appVPN]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession uid](self, "uid"));
  objc_msgSend(v5, "updateAppRulesForUID:", objc_msgSend(v6, "unsignedIntValue"));

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMFlowDivertSession;
  LOBYTE(self) = -[NESMVPNSession handleUpdateConfiguration:](&v8, "handleUpdateConfiguration:", v4);

  return (char)self;
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E2B4;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleUserLogin
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E238;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void).cxx_destruct
{
}

@end