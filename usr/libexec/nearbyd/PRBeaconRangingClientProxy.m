@interface PRBeaconRangingClientProxy
- (BOOL)createBeaconListenerJob:(id *)a3;
- (NSDictionary)clientInfo;
- (PRBeaconRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (id).cxx_construct;
- (unsigned)pointToShareInitiatorServiceId;
- (void)activate;
- (void)clearBeaconAllowlist:(id)a3;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)disablePTSInitiating:(id)a3;
- (void)enablePTSInitiating:(id)a3 reply:(id)a4;
- (void)pushBeaconAllowlist:(id)a3 reply:(id)a4;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)setPointToShareInitiatorServiceId:(unsigned __int16)a3;
- (void)startBeaconing:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)stopBeaconing:(int64_t)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRBeaconRangingClientProxy

- (PRBeaconRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  v23 = self;
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"PRBeaconRangingClientProxy.mm", 43, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PRBeaconRangingClientProxy;
  v23 = 0LL;
  v9 = -[PRBeaconRangingClientProxy init](&v22, "init");
  v10 = v9;
  v23 = v9;
  if (v9)
  {
    *((_BYTE *)v9 + 44) = 0;
    v11 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = 0LL;

    v12 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  v7);
    v13 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v12;

    sub_10003466C((void **)&v23, &buf);
    sub_10000EE54((uint64_t)v23 + 16, &buf);
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

    *((_DWORD *)v23 + 10) = 0;
  }

  v17 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRangingClientProxy init",  (uint8_t *)&buf,  2u);
  }

  v18 = v23;

  return v18;
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRanging: XPC connection created. Process name: %@, pid: %d",  (uint8_t *)&v9,  0x12u);
  }

  objc_storeStrong((id *)self + 4, a3);
  -[PRBeaconRangingClientProxy activate](self, "activate");
}

- (void)dealloc
{
  if (!*((_BYTE *)self + 44)) {
    -[PRBeaconRangingClientProxy terminate](self, "terminate");
  }
  [*((id *)self + 1) invalidate];
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PRBeaconRangingClientProxy;
  -[PRBeaconRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  v3 = sub_100288340();
  sub_1000122E4(&v17, (void *)(*((void *)self + 2) + 8LL));
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
  sub_1000122E4(&v17, (void *)(*((void *)self + 2) + 8LL));
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
  objc_super v4 = (std::__shared_weak_count *)*((void *)self + 3);
  unint64_t v11 = *((void *)self + 2);
  unint64_t v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }

  sub_10028CB38((uint64_t)v3, &v11);
  id v7 = v12;
  if (v12)
  {
    id v8 = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  *((_BYTE *)self + 44) = 1;
  id v10 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0LL;
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)*((void *)self + 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100032074;
  v7[3] = &unk_1007A2038;
  id v8 = v4;
  id v6 = v4;
  [v5 actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v18 = a3;
  id v4 = (void *)*((void *)self + 18);
  v25[0] = (char *)self + 144;
  v25[1] = voucher_adopt(v4);
  if (*((_WORD *)self + 20))
  {
    double v5 = sub_100023CC4();
    double v6 = *((double *)self + 6);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = v18;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      double v9 = v5 - v6;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          *(void *)__int128 buf = objc_msgSend(v12, "mac_addr");
          *(double *)&buf[8] = v9;
          sub_100034718((uint64_t **)self + 7, (unint64_t *)buf, (uint64_t *)buf);
          if ((v13 & 1) != 0)
          {
            v14 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = objc_msgSend(v12, "mac_addr");
              *(_DWORD *)__int128 buf = 134283777;
              *(void *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2050;
              *(double *)&buf[14] = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PtsSession, responder, %{private}llx, latency, %{public}0.3f",  buf,  0x16u);
            }
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v8);
    }

    std::mutex::unlock((std::mutex *)((char *)self + 80));
  }

  __int128 v16 = (void *)*((void *)self + 1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000323BC;
  v19[3] = &unk_1007A2038;
  id v17 = v18;
  id v20 = v17;
  [v16 actOnRemoteObjectAndScheduleBarrierBlock:v19];

  sub_100012358((uint64_t)v25);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id v4 = (void *)*((void *)self + 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003249C;
  v5[3] = &unk_1007A2080;
  v5[4] = a3;
  v5[5] = a4;
  [v4 actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  double v5 = (char *)self + 144;
  id v4 = (void *)*((void *)self + 18);
  v8[0] = (char *)self + 144;
  v8[1] = voucher_adopt(v4);
  double v6 = (void *)*((void *)v5 - 17);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000325BC;
  v7[3] = &unk_1007A20A0;
  void v7[4] = a3;
  [v6 actOnRemoteObjectAndScheduleBarrierBlock:v7];
  sub_100012358((uint64_t)v8);
}

- (void)startBeaconing:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  double v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessNameKey]);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessIdentifierKey]);
    *(_DWORD *)__int128 buf = 138412546;
    id v20 = v11;
    __int16 v21 = 1024;
    unsigned int v22 = [v12 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRanging: XPC command - startBeaconing. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if (a3 == 1)
  {
    uint64_t v13 = voucher_copy(-[PRBeaconRangingClientProxy enablePTSInitiating:reply:](self, "enablePTSInitiating:reply:", v8, v9));
    v14 = (void *)*((void *)self + 18);
    *((void *)self + 18) = v13;
  }

  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v18 = @"Asked to enable unsupported ranging subtype.";
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v16 = PRErrorWithCodeAndUserInfo(100LL, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v9[2](v9, 0LL, v14);
  }
}

- (void)stopBeaconing:(int64_t)a3 reply:(id)a4
{
  double v6 = (void (**)(id, void, void *))a4;
  id v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessNameKey]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessIdentifierKey]);
    *(_DWORD *)__int128 buf = 138412546;
    id v17 = v8;
    __int16 v18 = 1024;
    unsigned int v19 = [v9 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRanging: XPC command - stopBeaconing. Process name: %@, pid: %d",  buf,  0x12u);
  }

  uint64_t v10 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0LL;

  if (a3 == 1)
  {
    -[PRBeaconRangingClientProxy disablePTSInitiating:](self, "disablePTSInitiating:", v6);
  }

  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    id v15 = @"Asked to disable unsupported ranging subtype.";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    id v12 = PRErrorWithCodeAndUserInfo(100LL, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v6[2](v6, 0LL, v13);
  }
}

- (void)pushBeaconAllowlist:(id)a3 reply:(id)a4
{
  id v40 = a3;
  v39 = (void (**)(id, void, void *))a4;
  id v48 = v39;
  double v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessNameKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessIdentifierKey]);
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v8 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRanging: XPC command - pushBeaconAllowlist. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if (![v40 count])
  {
    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    v56 = @"Must provide at least one beacon to allowlist.";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    id v32 = PRErrorWithCodeAndUserInfo(106LL, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v39[2](v39, 0LL, v33);

LABEL_31:
    v37 = v39;
    goto LABEL_38;
  }

  double v9 = self;
  objc_sync_enter(v9);
  if (*((_WORD *)v9 + 21)) {
    goto LABEL_9;
  }
  uint64_t v10 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No beacon listener job defined. Creating.",  buf,  2u);
  }

  id v47 = 0LL;
  unsigned __int8 v11 = -[PRBeaconRangingClientProxy createBeaconListenerJob:](v9, "createBeaconListenerJob:", &v47);
  id v12 = v47;
  uint64_t v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038AC7C();
    }
    v39[2](v39, 0LL, v13);

    objc_sync_exit(v9);
    goto LABEL_31;
  }

LABEL_9:
  objc_sync_exit(v9);

  NSErrorUserInfoKey v14 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PRBeaconClient: allowlist the following devices: %@",  buf,  0xCu);
  }

  memset(buf, 0, sizeof(buf));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v15 = v40;
  id v16 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v44;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(id *)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 btAdvAddress]);
        if (!v20
          || (__int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 btAdvAddress]),
              BOOL v22 = [v21 length] == (id)6,
              v21,
              v20,
              !v22))
        {
          NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
          v52 = @"Beacon has invalid BT Adv Address.";
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL,  v9));
          id v35 = PRErrorWithCodeAndUserInfo(106LL, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          v39[2](v39, 0LL, v36);

          goto LABEL_35;
        }

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v19 btAdvAddress]);
        [v23 getBytes:&v41 length:6];

        __int128 v24 = (char *)&v41 + 1;
        v25 = &v42;
        do
        {
          char v26 = *(v24 - 1);
          *(v24 - 1) = *v25;
          *v25-- = v26;
        }

        while (v24++ < v25);
        sub_1000330D0((void **)buf, &v41);
      }

      id v16 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v28 = sub_100288340();
  v49[0] = &off_1007A2B28;
  v49[1] = &v48;
  v50 = v49;
  sub_10028AB1C((uint64_t)v28, (uint64_t)buf, (uint64_t)v49);
  v29 = v50;
  if (v50 == v49)
  {
    uint64_t v30 = 4LL;
    v29 = v49;
  }

  else
  {
    if (!v50) {
      goto LABEL_34;
    }
    uint64_t v30 = 5LL;
  }

  v29 = (void *)(*(uint64_t (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  uint64_t v38 = voucher_copy(v29);
  id v15 = (id)*((void *)v9 + 18);
  *((void *)v9 + 18) = v38;
LABEL_35:

  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

  v37 = v48;
LABEL_38:
}

- (void)clearBeaconAllowlist:(id)a3
{
  id v11 = a3;
  id v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessNameKey]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 4) objectForKey:PRProcessIdentifierKey]);
    *(_DWORD *)__int128 buf = 138412546;
    id v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = [v6 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRanging: XPC command - clearBeaconAllowlist. Process name: %@, pid: %d",  buf,  0x12u);
  }

  id v7 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0LL;

  id v8 = sub_100288340();
  v12[0] = &off_1007A2BB8;
  v12[1] = &v11;
  uint64_t v13 = v12;
  sub_10028AD50((uint64_t)v8, (uint64_t)v12);
  double v9 = v13;
  if (v13 == v12)
  {
    uint64_t v10 = 4LL;
    double v9 = v12;
    goto LABEL_7;
  }

  if (v13)
  {
    uint64_t v10 = 5LL;
LABEL_7:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
}

- (void)enablePTSInitiating:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  double v6 = sub_100288340();
  uint64_t v7 = *((void *)v6 + 406);
  id v8 = (std::__shared_weak_count *)*((void *)v6 + 407);
  uint64_t v47 = v7;
  id v48 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }

  if (v7)
  {
    __int16 v46 = 0;
    if (sub_100266E04(v7, &v45, (unsigned __int8 *)&v46, 0))
    {
      sub_10013F91C(&v45, (uint64_t)v52);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLForKey:@"P2SConfigPlistPath"]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v12));

      if (v13)
      {
        NSErrorUserInfoKey v14 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "============================================",  (uint8_t *)&buf,  2u);
        }

        id v15 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRangingClientProxy options dict:\n%@",  (uint8_t *)&buf,  0xCu);
        }

        unsigned int v17 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "============================================",  (uint8_t *)&buf,  2u);
        }

        id v44 = 0LL;
        char v18 = sub_10000B858(v13, v53, &v44);
        id v19 = v44;
        id v20 = v19;
        if ((v18 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_10038ACA8();
          }
          v5[2](v5, 0LL, v20);

LABEL_36:
          id v8 = v48;
          if (!v48) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
      }

      __int16 v21 = (std::__shared_weak_count *)sub_100288340();
      sub_1000122E4(&buf, (void *)(*((void *)self + 2) + 8LL));
      __int128 v43 = buf;
      if (*((void *)&buf + 1))
      {
        BOOL v22 = (unint64_t *)(*((void *)&buf + 1) + 16LL);
        do
          unint64_t v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }

      int v24 = sub_100288B90(v21, (uint64_t *)&v43, (uint64_t)v52);
      if (*((void *)&v43 + 1)) {
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v43 + 1));
      }
      v25 = (std::__shared_weak_count *)*((void *)&buf + 1);
      if (*((void *)&buf + 1))
      {
        char v26 = (unint64_t *)(*((void *)&buf + 1) + 8LL);
        do
          unint64_t v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }

      if ((v24 & 0xFF0000) != 0)
      {
        *((double *)self + 6) = sub_100023CC4();
        v28 = (std::mutex *)((char *)self + 80);
        std::mutex::lock((std::mutex *)((char *)self + 80));
        uint64_t v30 = (void *)*((void *)self + 8);
        v29 = (void *)((char *)self + 64);
        sub_100034A98((uint64_t)(v29 - 1), v30);
        *(v29 - 1) = v29;
        void *v29 = 0LL;
        v29[1] = 0LL;
        std::mutex::unlock(v28);
        *((_WORD *)v29 - 12) = v24;
        v5[2](v5, 1LL, 0LL);
        v31 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PtsSession, start", (uint8_t *)&buf, 2u);
        }
      }

      else
      {
        NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
        v50 = @"Register for service failed";
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL,  (void)v43));
        id v39 = PRErrorWithCodeAndUserInfo(101LL, v38);
        id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v5[2](v5, 0LL, v40);
      }

      goto LABEL_36;
    }

    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v55 = @"Failed to prepare service request.";
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    id v36 = PRErrorWithCodeAndUserInfo(101LL, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v5[2](v5, 0LL, v37);
  }

  else
  {
    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    v57 = @"Configuration Manager Error.";
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
    id v33 = PRErrorWithCodeAndUserInfo(999LL, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v5[2](v5, 0LL, v34);
  }

  if (!v8) {
    goto LABEL_41;
  }
LABEL_37:
  int v41 = (unint64_t *)&v8->__shared_owners_;
  do
    unint64_t v42 = __ldaxr(v41);
  while (__stlxr(v42 - 1, v41));
  if (!v42)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

- (void)disablePTSInitiating:(id)a3
{
  id v32 = a3;
  double v4 = sub_100023CC4();
  double v5 = *((double *)self + 6);
  std::mutex::lock((std::mutex *)((char *)self + 80));
  v31 = (std::mutex *)((char *)self + 80);
  double v6 = v4 - v5;
  int v7 = *((_DWORD *)self + 18);
  id v8 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PtsMetric, session, numOfResponders, %d, sessionDuration, %0.3f",  buf,  0x12u);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100033E7C;
  v37[3] = &unk_1007A2AF8;
  int v38 = v7;
  *(double *)&v37[4] = v6;
  AnalyticsSendEventLazy(@"com.apple.nearbyd.PointToShareSession", v37);
  double v9 = (char *)*((void *)self + 7);
  uint64_t v30 = self;
  unint64_t v10 = (char *)self + 64;
  if (v9 != v10)
  {
    do
    {
      id v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *((void *)v9 + 5);
        *(_DWORD *)__int128 buf = 134218240;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PtsMetric, responderLatency, %0.3f, numOfResponders, %d",  buf,  0x12u);
      }

      uint64_t v13 = *((void *)v9 + 5);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100033F70;
      v35[3] = &unk_1007A2AF8;
      v35[4] = v13;
      int v36 = v7;
      AnalyticsSendEventLazy(@"com.apple.nearbyd.PointToShareResponderLatency", v35);
      NSErrorUserInfoKey v14 = (char *)*((void *)v9 + 1);
      if (v14)
      {
        do
        {
          id v15 = v14;
          NSErrorUserInfoKey v14 = *(char **)v14;
        }

        while (v14);
      }

      else
      {
        do
        {
          id v15 = (char *)*((void *)v9 + 2);
          BOOL v16 = *(void *)v15 == (void)v9;
          double v9 = v15;
        }

        while (!v16);
      }

      double v9 = v15;
    }

    while (v15 != v10);
  }

  std::mutex::unlock(v31);
  if (!*((_WORD *)v30 + 20))
  {
    unsigned int v17 = v32;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038AD08();
    }
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    unint64_t v42 = @"Asked to cancel, but no point to share initiator job defined";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    id v26 = PRErrorWithCodeAndUserInfo(999LL, v25);
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    (*((void (**)(id, void, void *))v32 + 2))(v32, 0LL, v27);
    goto LABEL_29;
  }

  unsigned int v17 = v32;
  char v18 = sub_100288340();
  sub_1000122E4(buf, (void *)(*((void *)v30 + 2) + 8LL));
  uint64_t v33 = *(void *)buf;
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    id v19 = (unint64_t *)(*(void *)&buf[8] + 16LL);
    do
      unint64_t v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }

  BOOL v21 = sub_1002891C8((uint64_t)v18, &v33, *((unsigned __int16 *)v30 + 20));
  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  BOOL v22 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    unint64_t v23 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
      if (v21) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
  }

  if (!v21)
  {
LABEL_28:
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    id v40 = @"Unregistering for service failed";
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    id v28 = PRErrorWithCodeAndUserInfo(999LL, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    (*((void (**)(id, void, void *))v32 + 2))(v32, 0LL, v29);

LABEL_29:
    goto LABEL_30;
  }

- (BOOL)createBeaconListenerJob:(id *)a3
{
  double v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRangingClientProxy::createBeaconListenerJob",  buf,  2u);
  }

  double v6 = sub_100288340();
  uint64_t v7 = *((void *)v6 + 406);
  id v8 = (std::__shared_weak_count *)*((void *)v6 + 407);
  uint64_t v37 = v7;
  int v38 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }

  if (!v7)
  {
    if (!a3) {
      goto LABEL_35;
    }
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    uint64_t v47 = @"Configuration Manager Error.";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    id v26 = PRErrorWithCodeAndUserInfo(999LL, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v26);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038AD34();
    }
    goto LABEL_34;
  }

  __int16 v36 = 0;
  if (sub_100266E04(v7, &v35, (unsigned __int8 *)&v36, 0))
  {
    sub_10013FD60(&v35, (uint64_t)buf);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLForKey:@"P2SConfigPlistPath"]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v12));

    if (!v13) {
      goto LABEL_16;
    }
    NSErrorUserInfoKey v14 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "============================================",  (uint8_t *)&v41,  2u);
    }

    id v15 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
      LODWORD(v41) = 138412290;
      *(void *)((char *)&v41 + 4) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PRBeaconRangingClientProxy responder options dict:\n%@",  (uint8_t *)&v41,  0xCu);
    }

    unsigned int v17 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "============================================",  (uint8_t *)&v41,  2u);
    }

    if ((sub_10000B858(v13, v43, a3) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038AD8C();
      }
    }

    else
    {
LABEL_16:
      char v18 = (std::__shared_weak_count *)sub_100288340();
      sub_1000122E4(&v41, (void *)(*((void *)self + 2) + 8LL));
      __int128 v34 = v41;
      if (*((void *)&v41 + 1))
      {
        id v19 = (unint64_t *)(*((void *)&v41 + 1) + 16LL);
        do
          unint64_t v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }

      int v21 = sub_100288B90(v18, (uint64_t *)&v34, (uint64_t)buf);
      if (*((void *)&v34 + 1)) {
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
      }
      BOOL v22 = (std::__shared_weak_count *)*((void *)&v41 + 1);
      if (*((void *)&v41 + 1))
      {
        unint64_t v23 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
        do
          unint64_t v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }

      if ((v21 & 0xFF0000) != 0)
      {
        *((_WORD *)self + 21) = v21;
        LOBYTE(a3) = 1;
        goto LABEL_44;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038AD60();
      }
      if (!a3)
      {
LABEL_44:

        id v8 = v38;
        if (!v38) {
          return (char)a3;
        }
        goto LABEL_45;
      }

      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      id v40 = @"Failed to register for job: point to share responder";
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
      id v30 = PRErrorWithCodeAndUserInfo(101LL, v29);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v30);
    }

    LOBYTE(a3) = 0;
    goto LABEL_44;
  }

  if (a3)
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    char v45 = @"Failed to prepare service request.";
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    id v28 = PRErrorWithCodeAndUserInfo(101LL, v27);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038AD34();
    }
LABEL_34:
    LOBYTE(a3) = 0;
  }

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (unsigned)pointToShareInitiatorServiceId
{
  return *((_WORD *)self + 76);
}

- (void)setPointToShareInitiatorServiceId:(unsigned __int16)a3
{
  *((_WORD *)self + 76) = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 850045863LL;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  return self;
}

@end