@interface MRDConnectToRelaySecondaryOperation
- (MRDConnectToRelaySecondaryOperation)initWithOutputDevice:(id)a3;
- (MRExternalDeviceTransportConnectionHandle)handle;
- (NSString)debugDescription;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setHandle:(id)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4;
@end

@implementation MRDConnectToRelaySecondaryOperation

- (MRDConnectToRelaySecondaryOperation)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDConnectToRelaySecondaryOperation;
  v6 = -[MRDConnectToRelaySecondaryOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
  }

  return v7;
}

- (NSString)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation handle](self, "handle"));
  v6 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@:%p\n handle=%@\n pendingReplies=%@\n>",  v4,  self,  v5,  self->_pendingConfigureConnectionReplies);

  return v6;
}

- (void)execute
{
  v3 = -[MRRequestDetails initWithName:requestID:reason:]( objc_alloc(&OBJC_CLASS___MRRequestDetails),  "initWithName:requestID:reason:",  @"ConnectToMRRelay",  0LL,  0LL);
  details = self->_details;
  self->_details = v3;

  id v5 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
  v8 = -[NSMutableString initWithFormat:](v5, "initWithFormat:", @"%@<%@>", v6, v7);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", v11);
  }

  uint64_t v12 = _MRLogForCategory(10LL, v10);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v143 = (const __CFString *)v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails reason](self->_details, "reason"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  MRExternalDeviceConnectionReasonUserInfoKey);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v16,  MRExternalDeviceConnectionCorrelationIDUserInfoKey);

  if (-[MRDConnectToRelaySecondaryOperation isCancelled](self, "isCancelled"))
  {
    v17 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 25LL);
    -[MRDConnectToRelaySecondaryOperation finishWithError:](self, "finishWithError:", v17);
  }

  else
  {
    id v18 = objc_alloc(&OBJC_CLASS___MRAVOutputDeviceTransport);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice uid](self->_outputDevice, "uid"));
    v17 = (NSError *)[v18 initWithOutputDeviceUID:v19];

    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v20 = objc_alloc(&OBJC_CLASS___NSMutableString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
    v22 = -[NSMutableString initWithFormat:]( v20,  "initWithFormat:",  @"%@<%@>",  @"ConnectToMRRelay.createConnection",  v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
      -[NSMutableString appendFormat:](v22, "appendFormat:", @" for %@", v25);
    }

    uint64_t v26 = _MRLogForCategory(10LL, v24);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v143 = (const __CFString *)v22;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSError createConnectionWithUserInfo:](v17, "createConnectionWithUserInfo:", v14));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);
    if (v28) {
      BOOL v30 = v29 == 0LL;
    }
    else {
      BOOL v30 = 0;
    }
    int v31 = v30;

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));

      uint64_t v34 = _MRLogForCategory(10LL, v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v39 timeIntervalSinceDate:v130];
          *(_DWORD *)buf = 138544386;
          v143 = @"ConnectToMRRelay.createConnection";
          __int16 v144 = 2114;
          v145 = v37;
          __int16 v146 = 2112;
          v147 = v28;
          __int16 v148 = 2114;
          v149 = v38;
          __int16 v150 = 2048;
          uint64_t v151 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
        }
      }

      else if (v36)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v53 timeIntervalSinceDate:v130];
        *(_DWORD *)buf = 138544130;
        v143 = @"ConnectToMRRelay.createConnection";
        __int16 v144 = 2114;
        v145 = v52;
        __int16 v146 = 2112;
        v147 = v28;
        __int16 v148 = 2048;
        v149 = v54;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds",  buf,  0x2Au);
      }
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
      uint64_t v44 = _MRLogForCategory(10LL, v43);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      v35 = v45;
      if (v41)
      {
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        if (v42)
        {
          if (v46)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
            v48 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v50 timeIntervalSinceDate:v130];
            *(_DWORD *)buf = 138544386;
            v143 = @"ConnectToMRRelay.createConnection";
            __int16 v144 = 2114;
            v145 = v47;
            __int16 v146 = 2114;
            v147 = v48;
            __int16 v148 = 2114;
            v149 = v49;
            __int16 v150 = 2048;
            uint64_t v151 = v51;
            _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
          }
        }

        else if (v46)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
          v61 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v62 timeIntervalSinceDate:v130];
          *(_DWORD *)buf = 138544130;
          v143 = @"ConnectToMRRelay.createConnection";
          __int16 v144 = 2114;
          v145 = v60;
          __int16 v146 = 2114;
          v147 = v61;
          __int16 v148 = 2048;
          v149 = v63;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);
        }
      }

      else
      {
        BOOL v55 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        if (v42)
        {
          if (v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v58 timeIntervalSinceDate:v130];
            *(_DWORD *)buf = 138544130;
            v143 = @"ConnectToMRRelay.createConnection";
            __int16 v144 = 2114;
            v145 = v56;
            __int16 v146 = 2114;
            v147 = v57;
            __int16 v148 = 2048;
            v149 = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds",  buf,  0x2Au);
          }
        }

        else if (v55)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v65 timeIntervalSinceDate:v130];
          *(_DWORD *)buf = 138543874;
          v143 = @"ConnectToMRRelay.createConnection";
          __int16 v144 = 2114;
          v145 = v64;
          __int16 v146 = 2048;
          v147 = v66;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
        }
      }
    }

    v67 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice uid](self->_outputDevice, "uid"));
    -[MRDeviceInfo setDeviceUID:](v67, "setDeviceUID:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice name](self->_outputDevice, "name"));
    -[MRDeviceInfo setName:](v67, "setName:", v69);

    v70 = -[MRExternalDeviceTransportConnectionHandle initWithConnection:deviceInfo:]( objc_alloc(&OBJC_CLASS___MRExternalDeviceTransportConnectionHandle),  "initWithConnection:deviceInfo:",  v28,  v67);
    -[MRDConnectToRelaySecondaryOperation setHandle:](self, "setHandle:", v70);

    uint64_t v136 = 0LL;
    v137 = &v136;
    uint64_t v138 = 0x3032000000LL;
    v139 = sub_100154124;
    v140 = sub_100154134;
    id v141 = 0LL;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v28 error]);

    if (v71)
    {
      uint64_t v72 = objc_claimAutoreleasedReturnValue([v28 error]);
      v73 = (void *)v137[5];
      v137[5] = v72;

      -[MRDConnectToRelaySecondaryOperation finishWithError:](self, "finishWithError:", v137[5]);
    }

    else
    {
      if (-[MRDConnectToRelaySecondaryOperation isCancelled](self, "isCancelled"))
      {
        v74 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 25LL);
        -[MRDConnectToRelaySecondaryOperation finishWithError:](self, "finishWithError:", v74);
      }

      else
      {
        [v28 addObserver:self];
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
        v128 = (NSError *)objc_claimAutoreleasedReturnValue([v75 deviceInfo]);

        id v76 = objc_alloc(&OBJC_CLASS___MRConfigureConnectionServiceMessage);
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSError WHAIdentifier](v128, "WHAIdentifier"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSError name](v128, "name"));
        id v129 = [v76 initWithServiceType:@"MRRelay" sourceOutputDeviceUID:v77 sourceOutputDeviceName:v78];

        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        v80 = (void *)objc_claimAutoreleasedReturnValue([v79 UUIDString]);
        [v129 setReplyIdentifier:v80];

        v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        pendingConfigureConnectionReplies = self->_pendingConfigureConnectionReplies;
        self->_pendingConfigureConnectionReplies = v81;

        dispatch_semaphore_t v83 = dispatch_semaphore_create(0LL);
        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472LL;
        v132[2] = sub_10015413C;
        v132[3] = &unk_1003A31C8;
        v84 = v67;
        v133 = v84;
        v135 = &v136;
        dispatch_semaphore_t dsema = v83;
        dispatch_semaphore_t v134 = dsema;
        v85 = objc_retainBlock(v132);
        v86 = self->_pendingConfigureConnectionReplies;
        v87 = (void *)objc_claimAutoreleasedReturnValue([v129 replyIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v86, "setObject:forKeyedSubscript:", v85, v87);

        v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        v88 = objc_alloc(&OBJC_CLASS___NSMutableString);
        v89 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
        v90 = -[NSMutableString initWithFormat:]( v88,  "initWithFormat:",  @"%@<%@>",  @"ConnectToMRRelay.configureConnection",  v89);

        v91 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
        if (v91)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
          -[NSMutableString appendFormat:](v90, "appendFormat:", @" for %@", v93);
        }

        uint64_t v94 = _MRLogForCategory(10LL, v92);
        v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v143 = (const __CFString *)v90;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
        }

        v96 = (void *)objc_claimAutoreleasedReturnValue([v129 protobufData]);
        [v28 sendTransportData:v96 options:0];

        v97 = (void *)objc_claimAutoreleasedReturnValue(+[MRProtocolMessageLogger sharedLogger](&OBJC_CLASS___MRProtocolMessageLogger, "sharedLogger"));
        [v97 logMessage:@"Message Sent:" label:@"MRRelay" deviceInfo:v84 protocolMessage:v129];

        dispatch_time_t v98 = dispatch_time(0LL, 7000000000LL);
        if (dispatch_semaphore_wait(dsema, v98))
        {
          v99 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  26LL,  @"Failed to configureConnection");
          v100 = (void *)v137[5];
          v137[5] = (uint64_t)v99;
        }

        outputDevice = self->_outputDevice;
        if (v137[5])
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](outputDevice, "debugName"));

          if (v102)
          {
            uint64_t v104 = _MRLogForCategory(10LL, v103);
            v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              v131 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
              v106 = (void *)v137[5];
              v107 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
              v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v108 timeIntervalSinceDate:v126];
              *(_DWORD *)buf = 138544386;
              v143 = @"ConnectToMRRelay.configureConnection";
              __int16 v144 = 2114;
              v145 = v131;
              __int16 v146 = 2114;
              v147 = v106;
              __int16 v148 = 2114;
              v149 = v107;
              __int16 v150 = 2048;
              uint64_t v151 = v109;
              _os_log_error_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
            }
          }

          else
          {
            uint64_t v117 = _MRLogForCategory(10LL, v103);
            v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              v118 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
              v119 = (void *)v137[5];
              v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v120 timeIntervalSinceDate:v126];
              *(_DWORD *)buf = 138544130;
              v143 = @"ConnectToMRRelay.configureConnection";
              __int16 v144 = 2114;
              v145 = v118;
              __int16 v146 = 2114;
              v147 = v119;
              __int16 v148 = 2048;
              v149 = v121;
              _os_log_error_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);
            }
          }
        }

        else
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](outputDevice, "debugName"));

          if (v110)
          {
            uint64_t v112 = _MRLogForCategory(10LL, v111);
            v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              v113 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
              v114 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
              v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v115 timeIntervalSinceDate:v126];
              *(_DWORD *)buf = 138544130;
              v143 = @"ConnectToMRRelay.configureConnection";
              __int16 v144 = 2114;
              v145 = v113;
              __int16 v146 = 2114;
              v147 = v114;
              __int16 v148 = 2048;
              v149 = v116;
              _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds",  buf,  0x2Au);
            }
          }

          else
          {
            uint64_t v122 = _MRLogForCategory(10LL, v111);
            v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              v123 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
              v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v124 timeIntervalSinceDate:v126];
              *(_DWORD *)buf = 138543874;
              v143 = @"ConnectToMRRelay.configureConnection";
              __int16 v144 = 2114;
              v145 = v123;
              __int16 v146 = 2048;
              v147 = v125;
              _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
            }
          }
        }

        [v28 removeObserver:self];
        -[MRDConnectToRelaySecondaryOperation finishWithError:](self, "finishWithError:", v137[5]);

        v74 = v128;
      }
    }

    _Block_object_dispose(&v136, 8);
  }
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation handle](self, "handle"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
    uint64_t v19 = _MRLogForCategory(10LL, v18);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v20 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v17)
      {
        if (!v20) {
          goto LABEL_19;
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation handle](self, "handle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
        [v14 timeIntervalSinceDate:v21];
        *(_DWORD *)buf = 138544386;
        int v31 = v10;
        __int16 v32 = 2114;
        uint64_t v33 = v11;
        __int16 v34 = 2112;
        id v35 = v12;
        __int16 v36 = 2114;
        v37 = v13;
        __int16 v38 = 2048;
        uint64_t v39 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds",  buf,  0x34u);

        goto LABEL_17;
      }

      if (!v20) {
        goto LABEL_19;
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation handle](self, "handle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
      [v13 timeIntervalSinceDate:v14];
      *(_DWORD *)buf = 138544130;
      int v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2048;
      v37 = v25;
      uint64_t v24 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }

    else
    {
      if (!v17)
      {
        if (v20)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
          [v12 timeIntervalSinceDate:v13];
          *(_DWORD *)buf = 138543874;
          int v31 = v10;
          __int16 v32 = 2114;
          uint64_t v33 = v11;
          __int16 v34 = 2048;
          id v35 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
          goto LABEL_18;
        }

        goto LABEL_19;
      }

      if (!v20) {
        goto LABEL_19;
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
      [v13 timeIntervalSinceDate:v14];
      *(_DWORD *)buf = 138544130;
      int v31 = v10;
      __int16 v32 = 2114;
      uint64_t v33 = v11;
      __int16 v34 = 2114;
      id v35 = v12;
      __int16 v36 = 2048;
      v37 = v23;
      uint64_t v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }

    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v24, buf, 0x2Au);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));

  uint64_t v7 = _MRLogForCategory(10LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails name](self->_details, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice debugName](self->_outputDevice, "debugName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
    [v13 timeIntervalSinceDate:v14];
    *(_DWORD *)buf = 138544386;
    int v31 = v10;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    __int16 v34 = 2114;
    id v35 = v4;
    __int16 v36 = 2114;
    v37 = v12;
    __int16 v38 = 2048;
    uint64_t v39 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
    goto LABEL_17;
  }

  if (v9) {
    sub_1002BB63C((uint64_t)self, (uint64_t)v4, v8);
  }
LABEL_19:

  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MRDConnectToRelaySecondaryOperation;
  -[MRDConnectToRelaySecondaryOperation finishWithError:](&v29, "finishWithError:", v4);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation completionBlock](self, "completionBlock"));

  if (v26)
  {
    v27 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MRDConnectToRelaySecondaryOperation completionBlock](self, "completionBlock"));
    v27[2]();
  }
}

- (void)setHandle:(id)a3
{
  id v4 = (MRExternalDeviceTransportConnectionHandle *)a3;
  handle = self->_handle;
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (handle)
  {
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestReasonID](self->_details, "requestReasonID"));
      v11 = self->_handle;
      int v16 = 138544130;
      v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = @"connection";
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = v4;
      uint64_t v12 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
      v13 = v8;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }

  else if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestReasonID](self->_details, "requestReasonID"));
    int v16 = 138543874;
    v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = @"connection";
    __int16 v20 = 2112;
    v21 = v4;
    uint64_t v12 = "Set: %{public}@ setting %{public}@ to <%@>";
    v13 = v8;
    uint32_t v14 = 32;
    goto LABEL_6;
  }

  uint64_t v15 = self->_handle;
  self->_handle = v4;
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRProtocolMessage protocolMessageWithProtobufData:error:]( &OBJC_CLASS___MRProtocolMessage,  "protocolMessageWithProtobufData:error:",  v6,  0LL));
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    BOOL v9 = v8;
    objc_sync_enter(v9);
    pendingConfigureConnectionReplies = v9->_pendingConfigureConnectionReplies;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 replyIdentifier]);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingConfigureConnectionReplies,  "objectForKeyedSubscript:",  v11));

    objc_sync_exit(v9);
    if (v12) {
      ((void (**)(void, void *))v12)[2](v12, v7);
    }

    objc_sync_exit(v9);
  }
}

- (MRExternalDeviceTransportConnectionHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end