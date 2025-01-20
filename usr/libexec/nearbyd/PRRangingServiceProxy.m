@interface PRRangingServiceProxy
- (NSDictionary)clientInfo;
- (PRRangingServiceProxy)initWithConnection:(id)a3 queue:(id)a4;
- (id).cxx_construct;
- (void)activate;
- (void)configureForP2PRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)startP2PRanging:(id)a3 reply:(id)a4;
- (void)stopP2PRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRRangingServiceProxy

- (PRRangingServiceProxy)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 38, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v20 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 39, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PRRangingServiceProxy;
  v10 = -[PRRangingServiceProxy init](&v23, "init");
  v11 = v10;
  if (v10)
  {
    v10->_terminated = 0;
    v12 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v12;

    objc_initWeak(&location, v11);
    sub_100038C24(&location, &buf);
    sub_10000EE54((uint64_t)&v11->_rangingManagerClient, &buf);
    v14 = (std::__shared_weak_count *)*((void *)&buf + 1);
    if (*((void *)&buf + 1))
    {
      v15 = (unint64_t *)(*((void *)&buf + 1) + 8LL);
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    v11->_p2pServiceId = 0;
    objc_destroyWeak(&location);
  }

  v17 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PRRangingServiceProxy init",  (uint8_t *)&buf,  2u);
  }

  return v11;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:PRProcessNameKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:PRProcessIdentifierKey]);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = [v8 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PRGenericRanging: XPC connection created. Process name: %@, pid: %d",  (uint8_t *)&v9,  0x12u);
  }

  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRRangingServiceProxy activate](self, "activate");
}

- (void)dealloc
{
  if (!self->_terminated) {
    -[PRRangingServiceProxy terminate](self, "terminate");
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRRangingServiceProxy dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PRRangingServiceProxy;
  -[PRRangingServiceProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  v3 = sub_100288340();
  sub_1000122E4(&v17, (void *)self->_rangingManagerClient.__ptr_ + 1);
  __int128 v18 = v17;
  __int128 v17 = 0uLL;
  sub_10028CA60((uint64_t)v3, (unint64_t *)&v18);
  objc_super v4 = (std::__shared_weak_count *)*((void *)&v18 + 1);
  if (*((void *)&v18 + 1))
  {
    id v5 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
    do
      unint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  id v7 = (std::__shared_weak_count *)*((void *)&v17 + 1);
  if (*((void *)&v17 + 1))
  {
    id v8 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  id v10 = sub_100288340();
  sub_1000122E4(&v17, (void *)self->_rangingManagerClient.__ptr_ + 1);
  __int128 v16 = v17;
  if (*((void *)&v17 + 1))
  {
    __int16 v11 = (unint64_t *)(*((void *)&v17 + 1) + 16LL);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  sub_1002889DC((uint64_t)v10, (uint64_t *)&v16);
  if (*((void *)&v16 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
  }
  v13 = (std::__shared_weak_count *)*((void *)&v17 + 1);
  if (*((void *)&v17 + 1))
  {
    v14 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

- (void)terminate
{
  v3 = sub_100288340();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  __int16 v11 = cntrl;
  if (cntrl)
  {
    id v5 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  sub_10028CB38((uint64_t)v3, (unint64_t *)&ptr);
  id v7 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    id v8 = (unint64_t *)((char *)v11 + 8);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  self->_terminated = 1;
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000372F0;
  v7[3] = &unk_1007A2038;
  id v8 = v4;
  id v6 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100037410;
  v7[3] = &unk_1007A2038;
  id v8 = v4;
  id v6 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000374F0;
  v5[3] = &unk_1007A2080;
  v5[4] = a3;
  v5[5] = a4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v5);
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000375D0;
  v4[3] = &unk_1007A20A0;
  v4[4] = a3;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000376F4;
  v9[3] = &unk_1007A20F0;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (void)configureForP2PRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v88 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  int64_t v11 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v13 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PRGenericRanging: XPC command - configureForP2PRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if (!v9)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v85 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 150, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }

  v14 = (void **)sub_100288340();
  uint64_t v15 = (*(uint64_t (**)(void *))(*v14[808] + 72LL))(v14[808]);
  int v16 = v15;
  sub_1000065CC(buf, (&off_1007A2F38)[v15 >> 32]);
  if (v104 >= 0) {
    __int128 v17 = buf;
  }
  else {
    __int128 v17 = *(_BYTE **)buf;
  }
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ranging service is not ready. Reason: %s",  v17));
  if (v104 < 0) {
    operator delete(*(void **)buf);
  }
  if ((v16 - 3) <= 0xFFFFFFFD)
  {
    NSErrorUserInfoKey v124 = NSLocalizedDescriptionKey;
    v125 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v125,  &v124,  1LL));
    id v20 = PRErrorWithCodeAndUserInfo(101LL, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v10[2](v10, 0LL, v21);
    goto LABEL_37;
  }

  if (self->_p2pServiceId)
  {
    v22 = sub_100288340();
    sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
    uint64_t v97 = *(void *)buf;
    v98 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      objc_super v23 = (unint64_t *)(*(void *)&buf[8] + 16LL);
      do
        unint64_t v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }

    BOOL v25 = sub_1002891C8((uint64_t)v22, &v97, self->_p2pServiceId);
    if (v98) {
      std::__shared_weak_count::__release_weak(v98);
    }
    v26 = *(std::__shared_weak_count **)&buf[8];
    if (!*(void *)&buf[8]) {
      goto LABEL_22;
    }
    v27 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
      if (v25) {
        goto LABEL_23;
      }
    }

    else
    {
LABEL_22:
      if (v25) {
        goto LABEL_23;
      }
    }

    NSErrorUserInfoKey v122 = NSLocalizedDescriptionKey;
    v123 = @"Failed to override P2P job.";
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v123,  &v122,  1LL));
    id v52 = PRErrorWithCodeAndUserInfo(105LL, v51);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v52);

    v10[2](v10, 0LL, v21);
    goto LABEL_37;
  }

- (void)startP2PRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 270, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }

  id v9 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    id v35 = v10;
    __int16 v36 = 1024;
    unsigned int v37 = [v11 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PRGenericRanging: XPC command - startP2PRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 roseMACAddress]);
  [v12 getBytes:&v49 length:8];

  *(_DWORD *)__int128 buf = 1;
  LOBYTE(v35) = 0;
  char v38 = 0;
  uint64_t v39 = v49;
  __int16 v40 = 1;
  char v41 = 0;
  char v42 = 1;
  uint64_t v43 = 50000LL;
  char v44 = 1;
  int v45 = 10000000;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  if (!self->_p2pServiceId)
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    v33 = @"Must configure for ranging before calling start ranging.";
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v21 = PRErrorWithCodeAndUserInfo(102LL, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    v8[2](v8, 0LL, v22);
LABEL_20:

    goto LABEL_21;
  }

  v13 = sub_100288340();
  sub_1000122E4(&v26, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v28 = v26;
  uint64_t v29 = v27;
  if (v27)
  {
    p_shared_weak_owners = (unint64_t *)&v27->__shared_weak_owners_;
    do
      unint64_t v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
  }

  unsigned __int8 v16 = sub_1002898F4((uint64_t)v13, &v28, self->_p2pServiceId, (uint64_t)buf);
  if (v29) {
    std::__shared_weak_count::__release_weak(v29);
  }
  __int128 v17 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
      if ((v16 & 1) != 0) {
        goto LABEL_16;
      }
      goto LABEL_19;
    }
  }

  if ((v16 & 1) == 0)
  {
LABEL_19:
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v31 = @"Initate user triggered ranging failed";
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    id v24 = PRErrorWithCodeAndUserInfo(102LL, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v24);

    v8[2](v8, 0LL, v22);
    goto LABEL_20;
  }

- (void)stopP2PRanging:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2, self, @"PRRangingServiceProxy.mm", 312, @"Invalid parameter not satisfying: %@", @"remoteDevice" object file lineNumber description];
  }

  id v9 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v11 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PRGenericRanging: XPC command - stopP2PRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if (!self->_p2pServiceId)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v30 = @"This remote device is unknown";
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    id v20 = PRErrorWithCodeAndUserInfo(103LL, v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v8[2](v8, 0LL, v21);
LABEL_20:

    goto LABEL_21;
  }

  id v12 = sub_100288340();
  sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v25 = *(void *)buf;
  uint64_t v26 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v13 = (unint64_t *)(*(void *)&buf[8] + 16LL);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  char v15 = sub_10028A508((uint64_t)v12, &v25, self->_p2pServiceId);
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  unsigned __int8 v16 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    __int128 v17 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
      if ((v15 & 1) != 0) {
        goto LABEL_16;
      }
      goto LABEL_19;
    }
  }

  if ((v15 & 1) == 0)
  {
LABEL_19:
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    uint64_t v28 = @"Stop ranging failed";
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v23 = PRErrorWithCodeAndUserInfo(103LL, v22);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v8[2](v8, 0LL, v21);
    goto LABEL_20;
  }

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end