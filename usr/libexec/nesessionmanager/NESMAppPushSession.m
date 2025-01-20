@interface NESMAppPushSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)active;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (NESMAppPushSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)dealloc;
- (void)didExtensionExit:(id)a3;
- (void)didReceiveStatusChangeWithInterface:(int64_t)a3;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleProviderInstallationStatus:(id)a3 status:(int64_t)a4;
- (void)handleProviderStopped:(id)a3;
- (void)handleSendInfoMessage:(id)a3 withType:(int)a4;
- (void)install;
- (void)installPended;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)plugin:(id)a3 didReceiveIncomingCallWithUserInfo:(id)a4;
- (void)plugin:(id)a3 didReceiveProviderError:(id)a4;
- (void)plugin:(id)a3 didReceiveProviderError:(id)a4 forMessageID:(id)a5;
- (void)plugin:(id)a3 didReceivePushToTalkMessageWithUserInfo:(id)a4;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidDispose:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)uninstall;
@end

@implementation NESMAppPushSession

- (NESMAppPushSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NESMAppPushSession;
  v4 = -[NESMSession initWithConfiguration:andServer:](&v15, "initWithConfiguration:andServer:", a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0LL, 384LL);
    -[NESMAppPushSession setActive:](v6, "setActive:", 0LL);
    v6->_installed = 0;
    objc_setProperty_atomic(v6, v7, 0LL, 360LL);
    objc_setProperty_atomic(v6, v8, 0LL, 416LL);
    v6->_refCount = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    objc_setProperty_atomic(v6, v10, v9, 392LL);

    v6->_currentSSIDMatchStaus = 0LL;
    v6->_currentPLTEMatchStaus = 0LL;
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v6, "queue"));
    *(void *)&__int128 block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472LL;
    v17 = sub_100013774;
    v18 = &unk_1000BEC08;
    v19 = v6;
    dispatch_async(v11, &block);

    v6->_providerInstalled = 1;
    v4 = (NESMAppPushSession *)-[NESMAppPushSession addObserver:forKeyPath:options:context:]( v6,  "addObserver:forKeyPath:options:context:",  v6,  @"active",  5LL,  0LL);
  }

  uint64_t v12 = ne_log_obj(v4, v5);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(block) = 138412290;
    *(void *)((char *)&block + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%@ initialized app push provider session",  (uint8_t *)&block,  0xCu);
  }

  return v6;
}

- (int)type
{
  return 8;
}

- (void)install
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    SEL v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received install", (uint8_t *)&v6, 0xCu);
  }

  if (self)
  {
    self->_installed = 1;
    sub_1000122A4((uint64_t)self, v5);
  }

- (void)installPended
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received install pending", buf, 0xCu);
  }

  dispatch_time_t v5 = dispatch_time(0LL, 2000000000LL);
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001369C;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_after(v5, v6, block);
}

- (void)uninstall
{
  if (self) {
    self->_installed = 0;
  }
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received uninstall", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ deallocating session", buf, 0xCu);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 392, 1), "removeAllObjects");
    sub_10001118C(self, v6);
    sub_100011268(self, v7);
    sub_1000113B4((uint64_t)self);
    sub_100010FC8(self, v8);
  }

  else
  {
    [0 removeAllObjects];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMAppPushSession;
  -[NESMSession dealloc](&v9, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  SEL v10 = (NESMAppPushSession *)a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v14 = (NESMAppPushSession *)Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"status"];

    if (v15)
    {
      v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100013378;
      block[3] = &unk_1000BEC08;
      block[4] = self;
      dispatch_async(v16, block);

      goto LABEL_14;
    }
  }

  else
  {
  }

  if (v10 == self)
  {
    id v17 = [v9 isEqualToString:@"active"];
    if ((_DWORD)v17)
    {
      uint64_t v19 = ne_log_obj(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        unsigned int v21 = -[NESMAppPushSession active](self, "active");
        v22 = @"inactive";
        if (v21) {
          v22 = @"active";
        }
        *(_DWORD *)buf = 138412546;
        v25 = self;
        __int16 v26 = 2112;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ session became %@", buf, 0x16u);
      }

      -[NESMSession notifyChangedExtendedStatus](self, "notifyChangedExtendedStatus");
    }
  }

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___NESMAppPushSession;
    id v6 = (id)-[NESMSession handleUpdateConfiguration:](&v39, "handleUpdateConfiguration:", v5);
    if ((_DWORD)v6)
    {
      uint64_t v8 = ne_log_obj(v6, v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unsigned int refCount = self->_refCount;
        }
        else {
          unsigned int refCount = 0;
        }
        *(_DWORD *)buf = 138412546;
        v41 = self;
        __int16 v42 = 1024;
        unsigned int v43 = refCount;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ configuration changed [ref count:%u]",  buf,  0x12u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appPush]);
      unsigned __int8 v13 = [v12 isEnabled];

      if ((v13 & 1) != 0)
      {
        if (-[NESMAppPushSession active](self, "active"))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appPush]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 providerConfiguration]);

          if (self)
          {
            id Property = objc_getProperty(self, v20, 384LL, 1);
            if (Property)
            {
              v22 = Property;
              id v23 = v19;
              v24 = (void *)objc_claimAutoreleasedReturnValue([v22 remotePluginObject]);
              [v24 setProviderConfiguration:v23];
            }
          }
        }

        if (self)
        {
          sub_100012A44(self, v16);
          sub_100012AB0(self, v25);
          sub_100012B64((uint64_t)self, v26);
          sub_100012E2C(self, v27);
        }
      }

      else
      {
        uint64_t v33 = ne_log_obj(v14, v15);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = self;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@ configuration is disabled", buf, 0xCu);
        }

        if (self)
        {
          self->_unsigned int refCount = 0;
          sub_100012A44(self, v35);
          sub_100012AB0(self, v36);
          sub_100010EBC((uint64_t)self, v37);
        }
      }

      LOBYTE(self) = 1;
      goto LABEL_25;
    }

- (id)copyExtendedStatus
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMAppPushSession;
  id v4 = -[NESMSession copyExtendedStatus](&v8, "copyExtendedStatus");
  id v5 = -[NSMutableDictionary initWithDictionary:](v3, "initWithDictionary:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NESMAppPushSession active](self, "active")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"IsAppPushActive");

  return v5;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = -[NESMAppPushSession copyExtendedStatus](self, "copyExtendedStatus");
    if (v7)
    {
      objc_super v8 = v7;
      id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "SessionInfo", v9);
    }
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v11, reply);
}

- (void)handleSendInfoMessage:(id)a3 withType:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_100012754;
  v38 = sub_100012764;
  id v39 = 0LL;
  if (a4 == 5)
  {
    xpc_object_t value = xpc_dictionary_get_value(v6, "SessionAppPushCallInfo");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    SEL v10 = v9;
    if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v11 = (void *)_CFXPCCreateCFObjectFromXPCObject(v10);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        uint64_t v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472LL;
        v30 = sub_10001276C;
        v31 = &unk_1000BD6F0;
        id v32 = v7;
        uint64_t v33 = &v34;
        id v13 = v11;
        uint64_t v14 = &v28;
        v16 = v14;
        if (self)
        {
          if (self->_active)
          {
            id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", v28, v29));
            *(void *)&__int128 block = _NSConcreteStackBlock;
            *((void *)&block + 1) = 3221225472LL;
            unsigned int v43 = sub_1000128D8;
            v44 = &unk_1000BED30;
            v45 = self;
            v47 = v16;
            id v46 = v13;
            dispatch_async(v17, &block);
          }

          else
          {
            uint64_t v25 = ne_log_obj(v14, v15);
            __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(void *)((char *)&block + 4) = self;
              _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%@ cannot send outgoing call message for inactive  session",  (uint8_t *)&block,  0xCu);
            }

            v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NEAppPushErrorDomain,  4LL,  0LL,  v28,  v29));
            v30((uint64_t)v16, v27);
          }
        }

        xpc_object_t reply = v32;
      }

      else
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v7);
        v40 = @"AppPushSendCallInfoErrorCode";
        v41 = &off_1000C17B8;
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
        v20 = (void *)v35[5];
        v35[5] = v19;

        uint64_t v21 = v35[5];
        if (v21)
        {
          v22 = (void *)_CFXPCCreateXPCObjectFromCFObject(v21);
          xpc_dictionary_set_value(reply, "SessionAppPushSendMessageResult", v22);
        }

        xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v7);
        v24 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
        xpc_connection_send_message(v24, reply);
      }
    }
  }

  _Block_object_dispose(&v34, 8);
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v7 = a5;
  id v9 = v7;
  if (!a4 || v7)
  {
    uint64_t v18 = ne_log_obj(v7, v8);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 appPush]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 providerBundleIdentifier]);
      *(_DWORD *)uint64_t v28 = 138412802;
      *(void *)&v28[4] = self;
      *(_WORD *)&v28[12] = 2112;
      *(void *)&v28[14] = v22;
      *(_WORD *)&v28[22] = 2112;
      uint64_t v29 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: failed to start provider %@. error: %@",  v28,  0x20u);
    }

    if (v9)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v24 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v25 = [v9 code];

        if (v25 == (id)2)
        {
          if (!self) {
            goto LABEL_17;
          }
          if (self->_refCount)
          {
            dispatch_time_t v26 = dispatch_time(0LL, 15000000000LL);
            v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
            *(void *)uint64_t v28 = _NSConcreteStackBlock;
            *(void *)&v28[8] = 3221225472LL;
            *(void *)&v28[16] = sub_1000121E0;
            uint64_t v29 = &unk_1000BEC08;
            v30 = self;
            dispatch_after(v26, v27, v28);

            goto LABEL_17;
          }
        }
      }

      else
      {
      }
    }

    sub_1000110BC(self, v23);
    goto LABEL_17;
  }

  SEL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appPush]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 providerConfiguration]);

  if (self)
  {
    id Property = objc_getProperty(self, v13, 384LL, 1);
    if (Property)
    {
      uint64_t v15 = Property;
      id v16 = v12;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 remotePluginObject]);
      [v17 startConnectionWithProviderConfig:v16];
    }
  }

LABEL_17:
}

- (void)pluginDidDispose:(id)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ provider disposed", buf, 0xCu);
  }

  -[NESMAppPushSession setActive:](self, "setActive:", 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012184;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v6, block);
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v7;
  if (!self->_active)
  {
    uint64_t v10 = ne_log_obj(v7, v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        uint64_t v15 = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ provider failed to start",  (uint8_t *)&v14,  0xCu);
      }

      -[NESMAppPushSession setActive:](self, "setActive:", 0LL);
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        uint64_t v15 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ provider started, session is active now",  (uint8_t *)&v14,  0xCu);
      }

      -[NESMAppPushSession setActive:](self, "setActive:", 1LL);
      sub_100011E8C(self, v13);
    }
  }
}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4 forMessageID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v10 = ne_log_obj(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@ provider ack'd message delivery for [%@]",  buf,  0x16u);
  }

  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011CB8;
  block[3] = &unk_1000BE900;
  block[4] = self;
  id v16 = v8;
  id v17 = v7;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)plugin:(id)a3 didReceiveIncomingCallWithUserInfo:(id)a4
{
  id v6 = a3;
  uint64_t isKindOfClass = (uint64_t)a4;
  uint64_t v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0))
  {
    uint64_t v11 = ne_log_obj(isKindOfClass, v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ provider reported incoming call",  (uint8_t *)&v16,  0xCu);
    }

    id v13 = v9;
    if (self)
    {
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      *(void *)&__int128 v16 = _NSConcreteStackBlock;
      *((void *)&v16 + 1) = 3221225472LL;
      id v17 = sub_1000119D8;
      uint64_t v18 = &unk_1000BEBE0;
      uint64_t v19 = self;
      id v20 = v13;
      dispatch_async(v14, &v16);
    }
  }

  else
  {
    uint64_t v15 = ne_log_obj(isKindOfClass, v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%@ provider reported incoming call with invalid user info",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)plugin:(id)a3 didReceivePushToTalkMessageWithUserInfo:(id)a4
{
  id v6 = a3;
  uint64_t isKindOfClass = (uint64_t)a4;
  uint64_t v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0))
  {
    uint64_t v11 = ne_log_obj(isKindOfClass, v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      uint64_t v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ provider reported PushToTalk message",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    uint64_t v13 = ne_log_obj(isKindOfClass, v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ provider reported PushToTalk message with invalid user info",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)didExtensionExit:(id)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ provider exited", (uint8_t *)&v9, 0xCu);
  }

  sub_1000110BC(self, v6);
  sub_10001118C(self, v7);
  sub_1000118B8(self, v8);
}

- (void)handleProviderStopped:(id)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ provider stopped", (uint8_t *)&v7, 0xCu);
  }

  sub_1000118B8(self, v6);
}

- (void)handleProviderInstallationStatus:(id)a3 status:(int64_t)a4
{
  id v5 = @"uninstalled";
  if (a4 == 2) {
    id v5 = @"installed";
  }
  BOOL v6 = a4 != 1 && a4 == 2;
  if (a4 == 1) {
    int v7 = @"installing";
  }
  else {
    int v7 = v5;
  }
  self->_providerInstalled = v6;
  uint64_t v8 = ne_log_obj(self, a2);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ provider software installation status changed to [%@]",  (uint8_t *)&v10,  0x16u);
  }

  if (self->_providerInstalled && self->_refCount && !self->_installed) {
    sub_10001088C((uint64_t)self, 1LL);
  }
}

- (void)didReceiveStatusChangeWithInterface:(int64_t)a3
{
  uint64_t v5 = ne_log_obj(self, a2);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      unint64_t currentPLTEMatchStaus = self->_currentPLTEMatchStaus;
      objc_opt_self(&OBJC_CLASS___NESMAppPushSession);
      if (currentPLTEMatchStaus > 2) {
        uint64_t v8 = @"unknown";
      }
      else {
        uint64_t v8 = off_1000BD710[currentPLTEMatchStaus];
      }
    }

    else
    {
      objc_opt_self(&OBJC_CLASS___NESMAppPushSession);
      uint64_t v8 = @"Invalid";
    }

    objc_opt_self(&OBJC_CLASS___NESMAppPushSession);
    else {
      int v9 = off_1000BD710[a3];
    }
    if (self) {
      unsigned int refCount = self->_refCount;
    }
    else {
      unsigned int refCount = 0;
    }
    int v21 = 138413058;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v8;
    __int16 v25 = 2112;
    dispatch_time_t v26 = v9;
    __int16 v27 = 1024;
    unsigned int v28 = refCount;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@ private LTE network match status changed from '%@' to '%@' [ref count:%u]",  (uint8_t *)&v21,  0x26u);
  }

  if (a3 == 2)
  {
    if (self && self->_currentPLTEMatchStaus == 1)
    {
      --self->_refCount;
      self->_unint64_t currentPLTEMatchStaus = 2LL;
      sub_100010EBC((uint64_t)self, (uint64_t)v12);
      sub_100010FC8(self, v20);
    }
  }

  else
  {
    if (a3 != 1) {
      return;
    }
    if (self)
    {
      if (self->_currentPLTEMatchStaus == 1)
      {
LABEL_22:
        if (self->_installed)
        {
          uint64_t v16 = sub_1000109CC(self, v12);
          if ((v16 & 1) == 0)
          {
            uint64_t v18 = ne_log_obj(v16, v17);
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              int v21 = 138412290;
              v22 = self;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%@ failed to set the scoping policy",  (uint8_t *)&v21,  0xCu);
            }
          }
        }

        return;
      }

      ++self->_refCount;
      self->_unint64_t currentPLTEMatchStaus = 1LL;
    }

    uint64_t v13 = ne_log_obj(v11, v12);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (self) {
        unsigned int v15 = self->_refCount;
      }
      else {
        unsigned int v15 = 0;
      }
      int v21 = 138412546;
      v22 = self;
      __int16 v23 = 1024;
      LODWORD(v24) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%@ requesting install for LTE match [ref count:%u]",  (uint8_t *)&v21,  0x12u);
    }

    sub_10001088C((uint64_t)self, 0LL);
    if (self) {
      goto LABEL_22;
    }
  }

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)hasRequiredFrameworks
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___CoreTelephonyClient);
  if (v2)
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___CXNetworkExtensionMessageController);
    if (v2)
    {
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___MCProfileConnection);
      if (v2) {
        LOBYTE(v2) = objc_opt_class(&OBJC_CLASS___SWWakingTimer) != 0;
      }
    }
  }

  return v2;
}

@end