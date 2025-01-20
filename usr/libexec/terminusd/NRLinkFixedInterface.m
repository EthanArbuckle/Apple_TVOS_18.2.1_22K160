@interface NRLinkFixedInterface
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)start;
- (BOOL)suspend;
- (id)copyDescriptionInner;
- (id)copyStatusString;
- (unsigned)metric;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRLinkFixedInterface

- (id)copyStatusString
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = -[NSMutableString initWithString:](v3, "initWithString:", v4);

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "nrUUID", self->super._nrUUID);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "localInterfaceName",  self->super._localInterfaceName);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "listenerPortString",  *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n %35s = %@",  "ikeSessionClassD",  *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v7 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\n %35s = %@", "virtualInterfaceName", v7);
  }

  return v5;
}

- (void)invalidateLink
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NRLinkFixedInterface;
  -[NRLink invalidateLink](&v10, "invalidateLink");
  if (!self)
  {
    [0 invalidateVirtualInterface];
    companionProxyAgent = (NRCompanionProxyAgent *)MEMORY[0x58];
    if (!MEMORY[0x58]) {
      return;
    }
    goto LABEL_7;
  }

  -[NRLinkFixedInterface invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
  v3 = *(NSNumber **)((char *)&self->_listenerPort + 7);
  if (v3)
  {
    [v3 cancel];
    v4 = *(NSNumber **)((char *)&self->_listenerPort + 7);
    *(NSNumber **)((char *)&self->_listenerPort + 7) = 0LL;
  }

  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  uint64_t v6 = *(uint64_t *)((char *)&self->_listenerPortString + 7);
  if (v6)
  {
    nw_path_evaluator_cancel(v6, v5);
    v7 = *(NSString **)((char *)&self->_listenerPortString + 7);
    *(NSString **)((char *)&self->_listenerPortString + 7) = 0LL;
  }

  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
LABEL_7:
    sub_10005DE28((uint64_t)companionProxyAgent, v5);
    -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
    v9 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0LL;
  }

- (id)copyDescriptionInner
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NRLinkFixedInterface;
  id v4 = -[NRLink copyDescriptionInner](&v9, "copyDescriptionInner");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@, %@ -> %@", v4, v5, v6);

  return v7;
}

- (unsigned)metric
{
  return 100;
}

- (BOOL)start
{
  v2 = self;
  if (-[NRLink state](self, "state") != 8)
  {
    if (-[NRLink state](v2, "state") == 9) {
      return -[NRLinkFixedInterface resume](v2, "resume");
    }
    if (-[NRLink startRequested](v2, "startRequested")) {
      return 1;
    }
    -[NRLink setStartRequested:](v2, "setStartRequested:", 1LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](v2, "localInterfaceName"));

    if (!v6)
    {
      id v22 = sub_1000627F8();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v22, 17LL);

      if (!IsLevelEnabled) {
        return 0;
      }
      v20 = sub_1000627F8();
      _NRLogWithArgs(v20, 17LL, "Cannot start Wi-Fi link without wifiInterfaceName");
LABEL_22:

      return 0;
    }

    if (-[NRLink state](v2, "state") == 1)
    {
      -[NRLink reportEvent:](v2, "reportEvent:", 3001LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](v2, "nrUUID"));
      v8 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v7);

      if (v8)
      {
        -[NRLink setIkev2Role:](v2, "setIkev2Role:", sub_100107E48(v8));
        if (-[NRLink ikev2Role](v2, "ikev2Role") == 2
          && (objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](v2, "remoteOuterEndpoint")),
              v9,
              !v9))
        {
          v21 = @"No remote outer endpoint present";
        }

        else
        {
          if (-[NRLink setupVirtualInterface](v2, "setupVirtualInterface"))
          {
            objc_super v10 = nw_parameters_create();
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](v2, "localInterfaceName"));
            v12 = (nw_interface *)nw_interface_create_with_name([v11 UTF8String]);
            nw_parameters_require_interface(v10, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](v2, "remoteOuterEndpoint"));
            id v14 = [v13 copyCEndpoint];
            evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(v14, v10);

            objc_initWeak(&location, v2);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](v2, "queue"));
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472LL;
            v32[2] = sub_1000646A8;
            v32[3] = &unk_1001AF8C0;
            objc_copyWeak(&v33, &location);
            nw_path_evaluator_set_update_handler(evaluator_for_endpoint, v16, v32);

            nw_path_evaluator_start(evaluator_for_endpoint);
            if (v2) {
              objc_storeStrong((id *)((char *)&v2->_listenerPortString + 7), evaluator_for_endpoint);
            }
            sub_100063ED0((char *)v2, v17);
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);

            BOOL v5 = 1;
            goto LABEL_27;
          }

          v21 = @"failed to setup virtual interface";
        }

        -[NRLinkFixedInterface cancelWithReason:](v2, "cancelWithReason:", v21);
        BOOL v5 = 0;
LABEL_27:

        return v5;
      }

      id v24 = sub_1000627F8();
      int v25 = _NRLogIsLevelEnabled(v24, 16LL);

      p_class_meths = (__objc2_meth_list **)"-[NRLinkFixedInterface start]";
      if (v25)
      {
        id v26 = sub_1000627F8();
        _NRLogWithArgs( v26,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)",  ",  "-[NRLinkFixedInterface start]"",  153);
      }

      v2 = (NRLinkFixedInterface *)_os_log_pack_size(12LL);
      v27 = (char *)&v32[-1] - ((__chkstk_darwin(v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v28 = __error();
      uint64_t v29 = _os_log_pack_fill( v27,  v2,  *v28,  &_mh_execute_header,  "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
      *(_DWORD *)uint64_t v29 = 136446210;
      *(void *)(v29 + 4) = "-[NRLinkFixedInterface start]";
      id v30 = sub_1000627F8();
      _NRLogAbortWithPack(v30, v27);
      __break(1u);
    }

    else
    {
      if (qword_1001DC7B8 != -1) {
        dispatch_once(&qword_1001DC7B8, &stru_1001AEA00);
      }
      p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
      if (qword_1001DC7B8 == -1) {
        goto LABEL_21;
      }
    }

    dispatch_once(&qword_1001DC7B8, &stru_1001AEA00);
LABEL_21:
    v19 = p_class_meths[246];
    v20 = sub_1001080C0(-[NRLink state](v2, "state"));
    _NRLogWithArgs(v19, 17LL, "Cannot start link in state %@", v20);

    goto LABEL_22;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](v2, "linkDelegate"));
  [v3 linkIsReady:v2];

  return 1;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v4,  &v11);
    -[NRLink reportEvent:details:](self, "reportEvent:details:", 3005LL, v5);
    if (-[NRLink changeStateTo:](self, "changeStateTo:", 255LL))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v6 linkIsUnavailable:self];

      -[NRLinkFixedInterface invalidateLink](self, "invalidateLink");
    }

    else
    {
      if (qword_1001DC7B8 != -1) {
        dispatch_once(&qword_1001DC7B8, &stru_1001AEA00);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC7B0, 1LL))
      {
        if (qword_1001DC7B8 != -1) {
          dispatch_once(&qword_1001DC7B8, &stru_1001AEA00);
        }
        _NRLogWithArgs( qword_1001DC7B0,  1LL,  "%s%.30s:%-4d link already cancelled: %@",  ",  "-[NRLinkFixedInterface cancelWithReason:]"",  207LL,  self);
      }
    }
  }

  else
  {
    id v8 = sub_1000627F8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      id v10 = sub_1000627F8();
      _NRLogWithArgs(v10, 17LL, "%s called with null reasonFormat", "-[NRLinkFixedInterface cancelWithReason:]");
    }
  }

  return v4 != 0LL;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkFixedInterface;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_100064550((uint64_t)self, v3));
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = (char *)a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (uint64_t (**)(id, NEIKEv2SessionConfiguration *))a7;
  id v19 = a8;
  v21 = (void (**)(void, void, void, void))v19;
  if (!v14)
  {
    id v50 = sub_1000627F8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v50, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_45;
    }
    id v52 = sub_1000627F8();
    _NRLogWithArgs(v52, 17LL, "%s called with null listener");
LABEL_37:

    goto LABEL_45;
  }

  if (!v15)
  {
    id v53 = sub_1000627F8();
    int v54 = _NRLogIsLevelEnabled(v53, 17LL);

    if (!v54) {
      goto LABEL_45;
    }
    id v52 = sub_1000627F8();
    _NRLogWithArgs(v52, 17LL, "%s called with null session");
    goto LABEL_37;
  }

  if (!v16)
  {
    id v55 = sub_1000627F8();
    int v56 = _NRLogIsLevelEnabled(v55, 17LL);

    if (!v56) {
      goto LABEL_45;
    }
    id v52 = sub_1000627F8();
    _NRLogWithArgs(v52, 17LL, "%s called with null sessionConfig");
    goto LABEL_37;
  }

  if (!v18)
  {
    id v57 = sub_1000627F8();
    int v58 = _NRLogIsLevelEnabled(v57, 17LL);

    if (!v58) {
      goto LABEL_45;
    }
    id v52 = sub_1000627F8();
    _NRLogWithArgs(v52, 17LL, "%s called with null validateAuthBlock");
    goto LABEL_37;
  }

  if (v19)
  {
    id v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    int v23 = _NRLogIsLevelEnabled(v22, 0LL);

    if (v23)
    {
      int v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      id v26 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v25,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  540LL,  v26,  v14,  v15,  v16,  v17);
    }

    int state = self->super._state;
    id v72 = v15;
    if (state == 255) {
      goto LABEL_42;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    id v71 = a4;
    if (qword_1001DCA68 != -1) {
      dispatch_once(&qword_1001DCA68, &stru_1001AFD30);
    }
    id v29 = (id)qword_1001DCA60;
    unsigned int v30 = [v28 isEqual:v29];

    if (!v30)
    {
      id v33 = v14;
      v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      int v35 = _NRLogIsLevelEnabled(v34, 16LL);

      if (v35)
      {
        v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
        id v38 = -[NRLink copyDescription](self, "copyDescription");
        id v39 = v17;
        id v40 = v16;
        v41 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        _NRLogWithArgs( v37,  16LL,  "%s%.30s:%-4d %@: Unrecognized identifier %@",  ",  "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  585LL,  v38,  v41);

        id v16 = v40;
        id v17 = v39;
      }

      v42 = 0LL;
      v32 = 0LL;
      id v14 = v33;
      goto LABEL_43;
    }

    if (v17)
    {
      v32 = sub_10010C340();
      -[NEIKEv2ChildSAConfiguration setMode:](v32, "setMode:", 2LL);
      -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v32, "setReplayWindowSize:", 4LL);
    }

    else
    {
      if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
      {
LABEL_41:
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024LL, @"ClassD %@", v15);
LABEL_42:
        v42 = 0LL;
        v32 = 0LL;
        goto LABEL_43;
      }

      v32 = 0LL;
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v43 = (id *)sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v15);

    if (v43)
    {
      id v68 = v17;
      v42 = sub_10010C6B8(0, v43, 4LL);
      id v44 = v43[16];
      unsigned __int8 v45 = [v44 hasCompanionDatapath];

      id v69 = v16;
      v70 = v14;
      if ((v45 & 1) != 0) {
        v46 = 0LL;
      }
      else {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
      }
      id v47 = sub_10010CEF4(v43, v46);
      v73[0] = v47;
      id v48 = sub_10010CD5C();
      v73[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL));
      -[NEIKEv2SessionConfiguration setCustomIKEAuthPrivateNotifies:](v42, "setCustomIKEAuthPrivateNotifies:", v49);

      if ((v18[2](v18, v42) & 1) != 0)
      {
        -[NRLinkFixedInterface invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4LL);
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v71);
        sub_100062978(self);
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016LL, @"ClassD %@", v72);

        id v16 = v69;
        id v14 = v70;
        id v17 = v68;
        if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
        {
          ((void (**)(void, NEIKEv2SessionConfiguration *, NEIKEv2ChildSAConfiguration *, NEVirtualInterface_s *))v21)[2]( v21,  v42,  v32,  -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_44:

          id v15 = v72;
          goto LABEL_45;
        }
      }

      else
      {
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021LL, @"ClassD %@", v72);

        id v16 = v69;
        id v14 = v70;
        id v17 = v68;
      }

- (BOOL)sendControlData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[NEIKEv2PrivateNotify alloc] initWithNotifyStatus:50702 notifyData:v4];
    BOOL v6 = v5 != 0LL;
    if (v5)
    {
      objc_initWeak(&location, self);
      v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      id v20 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100062838;
      v17[3] = &unk_1001AF950;
      objc_copyWeak(&v18, &location);
      [v7 sendPrivateNotifies:v8 maxRetries:10 retryIntervalInMilliseconds:1000 callbackQueue:v9 callback:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      id v14 = sub_1000627F8();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17LL);

      if (IsLevelEnabled)
      {
        id v16 = sub_1000627F8();
        _NRLogWithArgs(v16, 17LL, "NEIKEv2PrivateNotify init %u %@ failed", 50702LL, v4);
      }
    }
  }

  else
  {
    id v11 = sub_1000627F8();
    int v12 = _NRLogIsLevelEnabled(v11, 17LL);

    if (v12)
    {
      id v13 = sub_1000627F8();
      _NRLogWithArgs(v13, 17LL, "%s called with null data", "-[NRLinkFixedInterface sendControlData:]");
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)suspend
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NRLinkFixedInterface;
  -[NRLink suspend](&v17, "suspend");
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DE28((uint64_t)companionProxyAgent, v3) & 1) != 0)
      {
        -[NRLink reportEvent:](self, "reportEvent:", 12003LL);
      }

      else
      {
        id v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
        int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16LL);

        if (IsLevelEnabled)
        {
          id v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v13);
          id v15 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs( v14,  16LL,  "%s%.30s:%-4d %@: failed to unregister companion agent",  ",  "-[NRLinkFixedInterface suspend]"",  656LL,  v15);
        }
      }
    }

    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9LL, @"(suspend)");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    [v9 linkIsSuspended:self];
    goto LABEL_10;
  }

  BOOL v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  int v7 = _NRLogIsLevelEnabled(v6, 1LL);

  if (v7)
  {
    objc_super v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    id v10 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs( v9,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'",  ",  "-[NRLinkFixedInterface suspend]"",  650LL,  v10);

LABEL_10:
  }

  return 1;
}

- (BOOL)resume
{
  if (self->super._state == 255)
  {
    BOOL v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    BOOL v7 = 1;
    int IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1LL);

    if (IsLevelEnabled)
    {
      id v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      id v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'",  ",  "-[NRLinkFixedInterface resume]"",  672LL,  v11);
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NRLinkFixedInterface;
    if (-[NRLink resume](&v19, "resume"))
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_10005E944((uint64_t)companionProxyAgent, v3) & 1) != 0)
        {
          -[NRLink reportEvent:](self, "reportEvent:", 12002LL);
        }

        else
        {
          int v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          int v13 = _NRLogIsLevelEnabled(v12, 16LL);

          if (v13)
          {
            id v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
            id v16 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs( v15,  16LL,  "%s%.30s:%-4d %@: failed to register companion agent",  ",  "-[NRLinkFixedInterface resume]"",  683LL,  v16);
          }
        }
      }

      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8LL, @"(resume)");
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      [v17 linkIsReady:self];

      return 1;
    }

    else
    {
      return 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end