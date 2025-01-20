@interface NESMAlwaysOnSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)supportsDefaultDrop;
- (NESMAlwaysOnSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleWakeup;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setStatus:(int)a3;
@end

@implementation NESMAlwaysOnSession

- (NESMAlwaysOnSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
  v8 = -[NESMSession initWithConfiguration:andServer:](&v73, "initWithConfiguration:andServer:", v6, v7);
  v9 = v8;
  if (!v8) {
    goto LABEL_41;
  }
  v8->_retryIntervalMin = 5LL;
  v8->_retryIntervalMax = 600LL;
  v8->_retryIntervalMultipler = 2LL;
  v8->_retriesMax = 3LL;
  VPNSessions = v8->_VPNSessions;
  v8->_VPNSessions = 0LL;

  v9->_stopped = 1;
  v11 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v13 = [v6 grade];
  if (v11) {
    v11 = (NESMPolicySession *)sub_10002E7FC((id *)&v11->super.isa, v12, 3, v13, (void *)1, (void *)1);
  }
  -[NESMSession setPolicySession:](v9, "setPolicySession:", v11);

  sub_10007AFD4(v9);
  uint64_t v14 = ne_log_large_obj();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v75 = v9;
    __int16 v76 = 2080;
    v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
    __int16 v78 = 2112;
    id v79 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@:%s: Configuration %@", buf, 0x20u);
  }

  v17 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
  if (!v17)
  {
    uint64_t v43 = ne_log_obj(0LL, v16);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v75 = v9;
      __int16 v76 = 2080;
      v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
      v44 = "%@:%s: Failed to allocate VPN sessions";
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
    }

- (void)dealloc
{
  if (self)
  {
    if (objc_getProperty(self, a2, 360LL, 1))
    {
      objc_msgSend(objc_getProperty(self, v3, 360, 1), "removeObserver:forKeyPath:", self, @"path");
      objc_setProperty_atomic(self, v4, 0LL, 360LL);
    }

    self->_IDSNexusIfIndex = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    char v7 = sub_10002F198(v5, v6);

    if ((v7 & 1) == 0)
    {
      uint64_t v10 = ne_log_obj(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }
    }

    objc_setProperty_atomic(self, v9, 0LL, 376LL);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
  -[NESMSession dealloc](&v12, "dealloc");
}

- (int)type
{
  return 3;
}

- (void)handleInitializeState
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
  -[NESMSession handleInitializeState](&v23, "handleInitializeState");
  sub_1000079A4((uint64_t)self);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v3, 400LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id obj = Property;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v9);
        if (self) {
          id v11 = objc_getProperty(self, v6, 400LL, 1);
        }
        else {
          id v11 = 0LL;
        }
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
        id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 queue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000A5D8;
        block[3] = &unk_1000BEC08;
        id v18 = v12;
        id v14 = v12;
        dispatch_async(v13, block);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v15 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      id v7 = v15;
    }

    while (v15);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_setProperty_atomic(self, v4, v5, 392LL);
    self->_stopped = 0;
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
    -[NESMSession handleStartMessage:](&v26, "handleStartMessage:", v5);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id Property = objc_getProperty(self, v6, 400LL, 1);
  }

  else
  {
    v26.receiver = 0LL;
    v26.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
    -[NESMSession handleStartMessage:](&v26, "handleStartMessage:", v5);
    id Property = 0LL;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
  }

  id v8 = Property;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13);
        if (self) {
          id v15 = objc_getProperty(self, v10, 400LL, 1);
        }
        else {
          id v15 = 0LL;
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);
        if ([v16 state] == (id)1)
        {
          v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 queue]);
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_10000A5CC;
          v19[3] = &unk_1000BEBE0;
          id v20 = v16;
          id v21 = v5;
          dispatch_async(v17, v19);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v18 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v11 = v18;
    }

    while (v18);
  }
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self)
  {
    self->_stopped = 1;
    objc_setProperty_atomic(self, a2, 0LL, 392LL);
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
    -[NESMSession handleStopMessageWithReason:](&v26, "handleStopMessageWithReason:", v3);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id Property = objc_getProperty(self, v5, 400LL, 1);
  }

  else
  {
    v26.receiver = 0LL;
    v26.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
    -[NESMSession handleStopMessageWithReason:](&v26, "handleStopMessageWithReason:", *(void *)&a3);
    id Property = 0LL;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
  }

  id obj = Property;
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v11);
        if (self) {
          id v13 = objc_getProperty(self, v8, 400LL, 1);
        }
        else {
          id v13 = 0LL;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
        id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 queue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000A5BC;
        block[3] = &unk_1000BED80;
        id v20 = v14;
        int v21 = v3;
        id v16 = v14;
        dispatch_async(v15, block);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v9 = v17;
    }

    while (v17);
  }
}

- (void)handleWakeup
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A3EC;
  block[3] = &unk_1000BEC08;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    -[NESMSession setConfiguration:](self, "setConfiguration:", 0LL);
    -[NESMSession setConfigurationSignature:](self, "setConfigurationSignature:", 0LL);
    sub_10000816C(self, v16);
    goto LABEL_15;
  }

  unsigned int v5 = -[NESMSession status](self, "status");
  if (self && v5 == 4 && self->_stopped)
  {
    SEL v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    if (![v6 isEnabled])
    {
      unsigned int v7 = [v4 isEnabled];

      if (!v7) {
        goto LABEL_10;
      }
      self->_stopped = 0;
      uint64_t v10 = ne_log_obj(v8, v9);
      SEL v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v22 = self;
        __int16 v23 = 2080;
        __int128 v24 = "-[NESMAlwaysOnSession handleUpdateConfiguration:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEBUG,  "%@:%s: Enabling config in Reasserting state, clearing STOPPED",  buf,  0x16u);
      }
    }
  }

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t v29 = a3;
  xpc_object_t xdict = xpc_dictionary_create_reply(v29);
  if (a4 == 2)
  {
    self = -[NESMAlwaysOnSession copyExtendedStatus](self, "copyExtendedStatus");
    if (!self) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (a4 == 1)
  {
    if (self)
    {
      uint64_t v68 = 0LL;
      __int128 v69 = &v68;
      uint64_t v70 = 0x3032000000LL;
      v71 = sub_100009F54;
      v72 = sub_100009F64;
      id v73 = 0LL;
      uint64_t v64 = 0LL;
      v65 = &v64;
      uint64_t v66 = 0x2020000000LL;
      uint64_t v67 = 0LL;
      uint64_t v60 = 0LL;
      v61 = &v60;
      uint64_t v62 = 0x2020000000LL;
      uint64_t v63 = 0LL;
      uint64_t v56 = 0LL;
      v57 = &v56;
      uint64_t v58 = 0x2020000000LL;
      uint64_t v59 = 0LL;
      uint64_t v52 = 0LL;
      v53 = &v52;
      uint64_t v54 = 0x2020000000LL;
      uint64_t v55 = 0LL;
      uint64_t v48 = 0LL;
      uint64_t v49 = &v48;
      uint64_t v50 = 0x2020000000LL;
      uint64_t v51 = 0LL;
      uint64_t v44 = 0LL;
      uint64_t v45 = &v44;
      uint64_t v46 = 0x2020000000LL;
      uint64_t v47 = 0LL;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id obj = objc_getProperty(self, v6, 400LL, 1);
      id v8 = [obj countByEnumeratingWithState:&v40 objects:v78 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v41;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
            id v12 = objc_getProperty(self, v7, 400LL, 1);
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

            uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 queue]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100009F6C;
            block[3] = &unk_1000BD4A0;
            id v32 = v13;
            v33 = &v68;
            uint64_t v34 = &v64;
            v35 = &v60;
            v36 = &v56;
            v37 = &v52;
            v38 = &v48;
            id v39 = &v44;
            id v15 = v13;
            dispatch_sync(v14, block);
          }

          id v8 = [obj countByEnumeratingWithState:&v40 objects:v78 count:16];
        }

        while (v8);
      }

      uint64_t v76 = kSCEntNetVPN;
      v74[0] = @"BytesIn";
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v65[3]));
      v75[0] = v16;
      v74[1] = @"BytesOut";
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v61[3]));
      v75[1] = v17;
      v74[2] = @"PacketsIn";
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v57[3]));
      v75[2] = v18;
      v74[3] = @"PacketsOut";
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v53[3]));
      v75[3] = v19;
      v74[4] = @"ErrorsIn";
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v49[3]));
      v75[4] = v20;
      v74[5] = @"ErrorsOut";
      int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v45[3]));
      v75[5] = v21;
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  6LL));
      v77 = v22;
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
      __int128 v24 = (void *)v69[5];
      v69[5] = v23;

      self = (NESMAlwaysOnSession *)(id)v69[5];
      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      _Block_object_dispose(&v68, 8);
    }

    if (self)
    {
LABEL_13:
      __int128 v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(self);
      xpc_dictionary_set_value(xdict, "SessionInfo", v25);
    }
  }

- (id)copyExtendedStatus
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v4)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v3, 400LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id obj = Property;
    id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v10);
          if (self) {
            id v12 = objc_getProperty(self, v7, 400LL, 1);
          }
          else {
            id v12 = 0LL;
          }
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
          uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 queue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100009F0C;
          block[3] = &unk_1000BE900;
          id v20 = v13;
          int v21 = v4;
          uint64_t v22 = v11;
          id v15 = v13;
          dispatch_sync(v14, block);

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        id v8 = v16;
      }

      while (v16);
    }
  }

  return v4;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v10 = ne_log_obj(v8, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v20 = self;
    __int16 v21 = 2080;
    uint64_t v22 = "-[NESMAlwaysOnSession handleChangeEventForInterface:newFlags:previousFlags:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 1024;
    int v26 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@:%s: Enter (ifName %@, flags %X)",  buf,  0x26u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:]( &v18,  "handleChangeEventForInterface:newFlags:previousFlags:",  v8,  a4,  a5);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000883C;
  v14[3] = &unk_1000BE928;
  v14[4] = self;
  id v15 = v8;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  id v13 = v8;
  dispatch_async(v12, v14);
}

- (void)setStatus:(int)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v91 = self;
    __int16 v92 = 2080;
    v93 = "-[NESMAlwaysOnSession setStatus:]";
    __int16 v94 = 2080;
    uint64_t v95 = ne_session_status_to_string(a3);
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  unsigned int v7 = &selRef_setName_;
  if (self) {
    id Property = objc_getProperty(self, v6, 400LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  id v10 = [v9 countByEnumeratingWithState:&v83 objects:v98 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v84;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v84 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)v14);
        if (self) {
          id v16 = objc_getProperty(self, v11, *((int *)v7 + 397), 1);
        }
        else {
          id v16 = 0LL;
        }
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);
        uint64_t v19 = ne_log_obj(v17, v18);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          __int16 v21 = (NESMAlwaysOnSession *)objc_claimAutoreleasedReturnValue([v17 interfaceName]);
          uint64_t v22 = (const char *)[v17 connectCount];
          id v23 = [v17 connectedCount];
          id v24 = [v17 disconnectedCount];
          *(_DWORD *)buf = 138413058;
          v91 = v21;
          __int16 v92 = 2048;
          v93 = v22;
          __int16 v94 = 2048;
          uint64_t v95 = (uint64_t)v23;
          __int16 v96 = 2048;
          id v97 = v24;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "AlwaysOn Stats [%@]: connect %ld, connected %ld, disconnected %ld",  buf,  0x2Au);

          unsigned int v7 = &selRef_setName_;
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v25 = [v9 countByEnumeratingWithState:&v83 objects:v98 count:16];
      id v12 = v25;
    }

    while (v25);
  }

  int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
  [v27 getUUIDBytes:v89];

  switch(a3)
  {
    case 1:
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      if (self) {
        id v50 = objc_getProperty(self, v29, *((int *)v7 + 397), 1);
      }
      else {
        id v50 = 0LL;
      }
      id v51 = v50;
      id v52 = [v51 countByEnumeratingWithState:&v78 objects:v88 count:16];
      if (v52)
      {
        id v54 = v52;
        uint64_t v55 = *(void *)v79;
        do
        {
          uint64_t v56 = 0LL;
          do
          {
            if (*(void *)v79 != v55) {
              objc_enumerationMutation(v51);
            }
            uint64_t v57 = *(void *)(*((void *)&v78 + 1) + 8LL * (void)v56);
            if (self) {
              id v58 = objc_getProperty(self, v53, *((int *)v7 + 397), 1);
            }
            else {
              id v58 = 0LL;
            }
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:v57]);
            unsigned int v60 = [v59 status];

            if (v60 != 1)
            {

              return;
            }

            uint64_t v56 = (char *)v56 + 1;
          }

          while (v54 != v56);
          id v61 = [v51 countByEnumeratingWithState:&v78 objects:v88 count:16];
          id v54 = v61;
        }

        while (v61);
      }

      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EC00((uint64_t)v62);

      if (self && self->_stopped)
      {
        uint64_t v67 = ne_log_obj(v63, v64);
        uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v91 = self;
          __int16 v92 = 2080;
          v93 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEBUG,  "%@:%s: Status to Client: DISCONNECTED",  buf,  0x16u);
        }

        v77.receiver = self;
        v77.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
        -[NESMSession setStatus:](&v77, "setStatus:", 1LL);
      }

      else
      {
        uint64_t v65 = ne_log_obj(v63, v64);
        uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v91 = self;
          __int16 v92 = 2080;
          v93 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEBUG,  "%@:%s: Status to Client: REASSERTING",  buf,  0x16u);
        }

        v76.receiver = self;
        v76.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
        -[NESMSession setStatus:](&v76, "setStatus:", 4LL);
      }

      break;
    case 2:
    case 4:
    case 5:
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      if (self) {
        id v30 = objc_getProperty(self, v29, *((int *)v7 + 397), 1);
      }
      else {
        id v30 = 0LL;
      }
      id v31 = v30;
      id v32 = [v31 countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v32)
      {
        id v34 = v32;
        uint64_t v35 = *(void *)v73;
        do
        {
          v36 = 0LL;
          do
          {
            if (*(void *)v73 != v35) {
              objc_enumerationMutation(v31);
            }
            uint64_t v37 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)v36);
            if (self) {
              id v38 = objc_getProperty(self, v33, *((int *)v7 + 397), 1);
            }
            else {
              id v38 = 0LL;
            }
            id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v37]);
            unsigned int v40 = [v39 status];

            if (v40 == 3)
            {

              return;
            }

            v36 = (char *)v36 + 1;
          }

          while (v34 != v36);
          id v41 = [v31 countByEnumeratingWithState:&v72 objects:v87 count:16];
          id v34 = v41;
        }

        while (v41);
      }

      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EC00((uint64_t)v42);

      uint64_t v45 = ne_log_obj(v43, v44);
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v69 = ne_session_status_to_string(a3);
        *(_DWORD *)buf = 138412802;
        v91 = self;
        __int16 v92 = 2080;
        v93 = "-[NESMAlwaysOnSession setStatus:]";
        __int16 v94 = 2080;
        uint64_t v95 = v69;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "%@:%s: Status to Client: %s",  buf,  0x20u);
      }

      v71.receiver = self;
      v71.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
      -[NESMSession setStatus:](&v71, "setStatus:", a3);
      break;
    case 3:
      uint64_t v47 = ne_log_obj(v28, v29);
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v91 = self;
        __int16 v92 = 2080;
        v93 = "-[NESMAlwaysOnSession setStatus:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "%@:%s: Status to Client: CONNECTED",  buf,  0x16u);
      }

      v82.receiver = self;
      v82.super_class = (Class)&OBJC_CLASS___NESMAlwaysOnSession;
      -[NESMSession setStatus:](&v82, "setStatus:", 3LL);
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EB18((uint64_t)v49);

      break;
    default:
      return;
  }

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008708;
  v6[3] = &unk_1000BEB20;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 360LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"path"];

    if (!v15) {
      goto LABEL_30;
    }
    if (self) {
      id v17 = objc_getProperty(self, v16, 360LL, 1);
    }
    else {
      id v17 = 0LL;
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    id v19 = [v18 status];
    if (v19 == (id)1)
    {
      if (self) {
        unint64_t IDSNexusIfIndex = self->_IDSNexusIfIndex;
      }
      else {
        unint64_t IDSNexusIfIndex = 0LL;
      }
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 interface]);
      id v23 = [v22 interfaceIndex];

      if ((id)IDSNexusIfIndex == v23) {
        goto LABEL_29;
      }
      uint64_t v26 = ne_log_obj(v24, v25);
      unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unint64_t v28 = self->_IDSNexusIfIndex;
        }
        else {
          unint64_t v28 = 0LL;
        }
        xpc_object_t v29 = (void *)objc_claimAutoreleasedReturnValue([v18 interface]);
        int v50 = 134218240;
        unint64_t v51 = v28;
        __int16 v52 = 2048;
        id v53 = [v29 interfaceIndex];
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "IDS Nexus interface changed %ld -> %ld",  (uint8_t *)&v50,  0x16u);
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v18 interface]);
      id v31 = [v30 interfaceIndex];
      if (self) {
        self->_unint64_t IDSNexusIfIndex = (unint64_t)v31;
      }

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v18 interface]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 interfaceName]);
      char v35 = sub_1000426C4((uint64_t)v32, v34);

      if ((v35 & 1) != 0) {
        goto LABEL_29;
      }
      uint64_t v38 = ne_log_obj(v36, v37);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v18 interface]);
        id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 interfaceName]);
        int v50 = 138412290;
        unint64_t v51 = (unint64_t)v41;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to add IDS Nexus policy for %@",  (uint8_t *)&v50,  0xCu);
      }
    }

    else
    {
      uint64_t v42 = ne_log_obj(v19, v20);
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v50) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "IDS Nexus interface unusable",  (uint8_t *)&v50,  2u);
      }

      if (self) {
        self->_unint64_t IDSNexusIfIndex = 0LL;
      }
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      char v46 = sub_10002F198(v44, v45);

      if ((v46 & 1) != 0) {
        goto LABEL_29;
      }
      uint64_t v49 = ne_log_obj(v47, v48);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v50) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to clear Nexus policy",  (uint8_t *)&v50,  2u);
      }
    }

LABEL_29:
    goto LABEL_30;
  }

LABEL_30:
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5 && ((1 << a3) & 0x27) != 0)
  {
    block[7] = v3;
    block[8] = v4;
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000813C;
    block[3] = &unk_1000BEC08;
    void block[4] = self;
    dispatch_async(v6, block);
  }

- (void)handleCaptiveNetworkPluginsChanged
{
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007D78;
  block[3] = &unk_1000BEC08;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)supportsDefaultDrop
{
  return 1;
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Carrier bundle changed: %@",  (uint8_t *)&v8,  0xCu);
  }

  sub_1000079A4((uint64_t)self);
  -[NESMAlwaysOnSession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 1LL);
}

- (void).cxx_destruct
{
}

+ (BOOL)hasRequiredFrameworks
{
  if (!objc_opt_class(&OBJC_CLASS___CoreTelephonyClient)) {
    return 0;
  }
  id v2 = sub_10004F238((uint64_t)&OBJC_CLASS___NESMServer);
  uint64_t v3 = (_BYTE *)objc_claimAutoreleasedReturnValue(v2);
  if (v3) {
    BOOL v4 = v3[8] & 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end