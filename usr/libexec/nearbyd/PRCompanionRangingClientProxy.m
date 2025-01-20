@interface PRCompanionRangingClientProxy
- (BOOL)startRangingMangagerAndCompanion:(id *)a3;
- (BOOL)stopRangingMangagerAndCompanion:(id *)a3;
- (NSDictionary)clientInfo;
- (PRCompanionRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (PRRemoteDevice)companion;
- (id).cxx_construct;
- (optional<rose::RoseDeviceDescriptor>)peerDescriptor;
- (void)activate;
- (void)cleanupRangingManagerAndCompanionAfterError:(id)a3;
- (void)combineAndReportLocalAndCompanionRangingRequestStatus;
- (void)configureForCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)handleError:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)reportRangingRequestStatusUpdate:(unint64_t)a3;
- (void)setCompanion:(id)a3;
- (void)setPeerDescriptor:(optional<rose::RoseDeviceDescriptor> *)a3;
- (void)startCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5;
- (void)startRangingMangager;
- (void)stopCompanionRanging:(id)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRCompanionRangingClientProxy

- (PRCompanionRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
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
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v23 handleFailureInMethod:a2, self, @"PRCompanionRangingClientProxy.mm", 110, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v24 handleFailureInMethod:a2, self, @"PRCompanionRangingClientProxy.mm", 111, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PRCompanionRangingClientProxy;
  v10 = -[PRCompanionRangingClientProxy init](&v27, "init");
  v11 = v10;
  if (v10)
  {
    *(void *)&v10->_localRangingState = 0LL;
    *(void *)&v10->_companionRoseState = 0LL;
    v10->_clientRequestState = 0;
    startOptions = v10->_startOptions;
    v10->_startOptions = 0LL;

    v13 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  v7);
    connWrapper = v11->_connWrapper;
    v11->_connWrapper = (PRRangingClientProtocol *)v13;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_initWeak(&location, v11);
    sub_1000123E8(&location, &buf);
    sub_10000EE54((uint64_t)&v11->_rangingManagerClient, &buf);
    v15 = (std::__shared_weak_count *)*((void *)&buf + 1);
    if (*((void *)&buf + 1))
    {
      v16 = (unint64_t *)(*((void *)&buf + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    companion = v11->_companion;
    v11->_companion = 0LL;

    if (v11->_peerDescriptor.__engaged_) {
      v11->_peerDescriptor.__engaged_ = 0;
    }
    value = v11->_rangingRequest.__ptr_.__value_;
    v11->_rangingRequest.__ptr_.__value_ = 0LL;
    if (value) {
      operator delete(value);
    }
    v11->_p2pServiceId = 0;
    *(_WORD *)&v11->_cleaningUponDidFail = 0;
    v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "_companionRangingManager initWithDelegate #companion-retry",  (uint8_t *)&buf,  2u);
    }

    objc_destroyWeak(&location);
  }

  v21 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRangingClientProxy init",  (uint8_t *)&buf,  2u);
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: XPC connection created. Process name: %@, pid: %d",  (uint8_t *)&v9,  0x12u);
  }

  objc_storeStrong((id *)&self->_clientInfo, a3);
  -[PRCompanionRangingClientProxy activate](self, "activate");
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRCompanionRangingClientProxy dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PRCompanionRangingClientProxy;
  -[PRCompanionRangingClientProxy dealloc](&v4, "dealloc");
}

- (void)activate
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager connect probe #companion-retry",  buf,  2u);
  }

  objc_super v4 = sub_100288340();
  sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  __int128 v20 = *(_OWORD *)buf;
  memset(buf, 0, sizeof(buf));
  sub_10028CA60((uint64_t)v4, (unint64_t *)&v20);
  id v5 = (std::__shared_weak_count *)*((void *)&v20 + 1);
  if (*((void *)&v20 + 1))
  {
    v6 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  id v8 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    int v9 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  __int16 v11 = sub_100288340();
  sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v17 = *(void *)buf;
  v18 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    unsigned int v12 = (unint64_t *)(*(void *)&buf[8] + 16LL);
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  sub_1002889DC((uint64_t)v11, &v17);
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
  v14 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v15 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)terminate
{
  if (self->_companion)
  {
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      companion = self->_companion;
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v17 = companion;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Tearing down companion ranging session. Companion: %@",  buf,  0xCu);
    }
  }

  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager disconnect #companion-retry",  buf,  2u);
  }

  v6 = sub_100288340();
  cntrl = self->_rangingManagerClient.__cntrl_;
  ptr = self->_rangingManagerClient.__ptr_;
  v15 = cntrl;
  if (cntrl)
  {
    id v8 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  sub_10028CB38((uint64_t)v6, (unint64_t *)&ptr);
  unint64_t v10 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    __int16 v11 = (unint64_t *)((char *)v15 + 8);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  -[PRRangingClientProtocol invalidate](self->_connWrapper, "invalidate", ptr);
  voucher = self->_clientVoucher.voucher;
  self->_clientVoucher.voucher = 0LL;
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  -[PRCompanionRangingClientProxy cleanupRangingManagerAndCompanionAfterError:]( self,  "cleanupRangingManagerAndCompanionAfterError:",  v4);
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F4A8;
  v7[3] = &unk_1007A2038;
  id v6 = v4;
  id v8 = v6;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#companion-retry didFailWithError: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F668;
  v8[3] = &unk_1007A2060;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v4 = a3;
  voucher = self->_clientVoucher.voucher;
  v10[0] = &self->_clientVoucher;
  v10[1] = voucher_adopt(voucher);
  connWrapper = self->_connWrapper;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F77C;
  v8[3] = &unk_1007A2038;
  id v9 = v4;
  id v7 = v4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v8);

  sub_100012358((uint64_t)v10);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F85C;
  v5[3] = &unk_1007A2080;
  v5[4] = a3;
  v5[5] = a4;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v5);
}

- (void)reportRangingRequestStatusUpdate:(unint64_t)a3
{
  p_clientVoucher = &self->_clientVoucher;
  voucher = self->_clientVoucher.voucher;
  v8[0] = &self->_clientVoucher;
  v8[1] = voucher_adopt(voucher);
  id v6 = p_clientVoucher[-11].voucher;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F97C;
  v7[3] = &unk_1007A20A0;
  void v7[4] = a3;
  -[OS_voucher actOnRemoteObjectAndScheduleBarrierBlock:](v6, "actOnRemoteObjectAndScheduleBarrierBlock:", v7);
  sub_100012358((uint64_t)v8);
}

- (void)combineAndReportLocalAndCompanionRangingRequestStatus
{
  int localRangingState = self->_localRangingState;
  if (localRangingState == 4)
  {
    if (self->_companionRangingState != 5) {
      return;
    }
    int clientRequestState = self->_clientRequestState;
    if (clientRequestState == 4)
    {
      unint64_t v13 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRangingClientProxy absorbing PRRangingRequestStatusDidStart from a retry.  ",  v17,  2u);
      }
    }

    else
    {
      if (clientRequestState == 3)
      {
        self->_int clientRequestState = 4;
        uint64_t v5 = 1LL;
        goto LABEL_11;
      }

      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      __int128 v20 = @"Unexpected new status PRRangingRequestStatusDidStart";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      id v15 = PRErrorWithCodeAndUserInfo(999LL, v14);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v16);
    }
  }

  else if (localRangingState == 1 && self->_companionRangingState == 1)
  {
    int v4 = self->_clientRequestState;
    if (v4 == 4)
    {
      id v18 = 0LL;
      unsigned __int8 v7 = -[PRCompanionRangingClientProxy startRangingMangagerAndCompanion:]( self,  "startRangingMangagerAndCompanion:",  &v18);
      id v8 = v18;
      id v9 = v8;
      if ((v7 & 1) != 0)
      {
      }

      else
      {
        -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v8);
      }
    }

    else
    {
      if (v4 == 5)
      {
        self->_int clientRequestState = 6;
        uint64_t v5 = 2LL;
LABEL_11:
        -[PRCompanionRangingClientProxy reportRangingRequestStatusUpdate:]( self,  "reportRangingRequestStatusUpdate:",  v5);
        return;
      }

      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      v22 = @"Unexpected new status PRRangingRequestStatusStopped";
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      id v11 = PRErrorWithCodeAndUserInfo(999LL, v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v12);
    }
  }

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000FD40;
  v6[3] = &unk_1007A20C8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  v6[4] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100010298;
  v9[3] = &unk_1007A20F0;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  -[PRRangingClientProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (void)configureForCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v83 = a3;
  id v9 = (NSMutableDictionary *)a4;
  id v10 = (void (**)(id, void, void *))a5;
  int64_t v11 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v13 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: XPC command - configureForCompanionRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v14 dictionaryRepresentation]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKey:@"R1Preamble"]);
  unint64_t v16 = v15;
  if (v15)
  {
    id v17 = [v15 integerValue];
    id v18 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting special R1 preamble %lli", buf, 0xCu);
    }

    v109[0] = PRP2PArgsRxPreamble;
    NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17));
    v110[0] = v19;
    v109[1] = PRP2PArgsTxPreamble;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17));
    v110[1] = v20;
    NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  2LL));

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary addEntriesFromDictionary:](v22, "addEntriesFromDictionary:", v21);
    if (v9) {
      -[NSMutableDictionary addEntriesFromDictionary:](v22, "addEntriesFromDictionary:", v9);
    }

    id v9 = v22;
  }

  else
  {
    v23 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using normal R1 preamble", buf, 2u);
    }
  }

  if (!self->_p2pServiceId) {
    goto LABEL_24;
  }
  v24 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager unregisterForService #companion-retry",  buf,  2u);
  }

  self->_int localRangingState = 0;
  v25 = sub_100288340();
  sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v94 = *(void *)buf;
  v95 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v26 = (unint64_t *)(*(void *)&buf[8] + 16LL);
    do
      unint64_t v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }

  BOOL v28 = sub_1002891C8((uint64_t)v25, &v94, self->_p2pServiceId);
  if (v95) {
    std::__shared_weak_count::__release_weak(v95);
  }
  v29 = *(std::__shared_weak_count **)&buf[8];
  if (!*(void *)&buf[8]) {
    goto LABEL_23;
  }
  v30 = (unint64_t *)(*(void *)&buf[8] + 8LL);
  do
    unint64_t v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (v31)
  {
LABEL_23:
    if (v28) {
      goto LABEL_24;
    }
LABEL_64:
    NSErrorUserInfoKey v107 = NSLocalizedDescriptionKey;
    v108 = @"Failed to override P2P job.";
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v108,  &v107,  1LL));
    id v69 = PRErrorWithCodeAndUserInfo(999LL, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

    v10[2](v10, 0LL, v70);
    goto LABEL_80;
  }

  ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
  std::__shared_weak_count::__release_weak(v29);
  if (!v28) {
    goto LABEL_64;
  }
LABEL_24:
  if ([v83 deviceType] == (id)3)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v83 UUID]);
    BOOL v33 = v32 == 0LL;

    if (!v33)
    {
      objc_storeStrong((id *)&self->_companion, a3);
      $6F37327912F9327032CB5E18EB557B26 v104 = 0LL;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice roseMACAddress](self->_companion, "roseMACAddress"));
      objc_msgSend(v34, "getBytes:range:", &v104, 0, 8);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
      [v35 getUUIDBytes:&v103];

      $6F37327912F9327032CB5E18EB557B26 v36 = v104;
      self->_peerDescriptor.var0.__val_.type = 3;
      BOOL engaged = self->_peerDescriptor.__engaged_;
      self->_peerDescriptor.var0.__val_.uuid.var0 = v103;
      self->_peerDescriptor.var0.__val_.uuid.__engaged_ = 1;
      self->_peerDescriptor.var0.__val_.rose_mac_address.var0 = v36;
      *(_WORD *)&self->_peerDescriptor.var0.__val_.rose_mac_address.__engaged_ = 1;
      self->_peerDescriptor.var0.__val_.bt_adv_address.__engaged_ = 0;
      if (!engaged) {
        self->_peerDescriptor.__engaged_ = 1;
      }
      __int16 v91 = 0;
      p_peerDescriptor = &self->_peerDescriptor;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      __int16 v93 = 1;
      HIBYTE(v93) = 0;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", @"GattRanging"));
      v40 = v39;
      if (v39)
      {
        HIBYTE(v93) = [v39 BOOLValue];
        v41 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          if (HIBYTE(v93)) {
            v42 = "YES";
          }
          else {
            v42 = "NO";
          }
          *(_DWORD *)__int128 buf = 136315138;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Setting gatt ranging interval use to %s",  buf,  0xCu);
        }
      }

      v43 = sub_100288340();
      v44 = (void *)*((void *)v43 + 406);
      v45 = (std::__shared_weak_count *)*((void *)v43 + 407);
      v88[1] = v44;
      v89 = v45;
      if (v45)
      {
        p_shared_owners = (unint64_t *)&v45->__shared_owners_;
        do
          unint64_t v47 = __ldxr(p_shared_owners);
        while (__stxr(v47 + 1, p_shared_owners));
      }

      if (v44)
      {
        v81 = v40;
        v48 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager prepareRangingServiceRequest #companion-retry",  buf,  2u);
        }

        v40 = v81;
        if (sub_100266E04((uint64_t)v44, &v90, (unsigned __int8 *)&v91, 0))
        {
          sub_100140024(&v90, (uint64_t)buf);
          if (v9)
          {
            v88[0] = 0LL;
            char v49 = sub_10000B858(v9, &buf[96], v88);
            id v50 = v88[0];
            v51 = v50;
            if ((v49 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_100389470();
              }
              v10[2](v10, 0LL, v51);
              goto LABEL_73;
            }
          }

          v52 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v84 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager registerForService #companion-retry",  v84,  2u);
          }

          v53 = (std::__shared_weak_count *)sub_100288340();
          sub_1000122E4(v84, (void *)self->_rangingManagerClient.__ptr_ + 1);
          uint64_t v86 = *(void *)v84;
          v87 = v85;
          if (v85)
          {
            p_shared_weak_owners = (unint64_t *)&v85->__shared_weak_owners_;
            do
              unint64_t v55 = __ldxr(p_shared_weak_owners);
            while (__stxr(v55 + 1, p_shared_weak_owners));
          }

          int v56 = sub_100288B90(v53, &v86, (uint64_t)buf);
          if (v87) {
            std::__shared_weak_count::__release_weak(v87);
          }
          v57 = v85;
          if (v85)
          {
            v58 = (unint64_t *)&v85->__shared_owners_;
            do
              unint64_t v59 = __ldaxr(v58);
            while (__stlxr(v59 - 1, v58));
            if (!v59)
            {
              ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
              std::__shared_weak_count::__release_weak(v57);
            }
          }

          if ((v56 & 0xFF0000) != 0)
          {
            self->_int localRangingState = 1;
            -[PRCompanionRangingClientProxy combineAndReportLocalAndCompanionRangingRequestStatus]( self,  "combineAndReportLocalAndCompanionRangingRequestStatus");
            v60 = self;
            objc_sync_enter(v60);
            self->_p2pServiceId = v56;
            v61 = (RoseServiceRequest *)operator new(0x1F8uLL);
            memcpy(v61, buf, 0x1F8uLL);
            value = v60->_rangingRequest.__ptr_.__value_;
            v60->_rangingRequest.__ptr_.__value_ = v61;
            if (value) {
              operator delete(value);
            }
            objc_sync_exit(v60);

            uint64_t v63 = voucher_copy();
            voucher = v60->_clientVoucher.voucher;
            v60->_clientVoucher.voucher = (OS_voucher *)v63;

            v10[2](v10, 1LL, 0LL);
LABEL_74:
            v45 = v89;
            if (v89) {
              goto LABEL_75;
            }
            goto LABEL_79;
          }

          NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
          v97 = @"Register for service failed";
          v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
          id v78 = PRErrorWithCodeAndUserInfo(999LL, v77);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v78);

          v10[2](v10, 0LL, v51);
LABEL_73:

          goto LABEL_74;
        }

        NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
        v100 = @"Failed to prepare service request.";
        v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
        id v75 = PRErrorWithCodeAndUserInfo(999LL, v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);

        v10[2](v10, 0LL, v76);
      }

      else
      {
        NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
        v102 = @"Configuration Manager Error.";
        v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
        id v72 = PRErrorWithCodeAndUserInfo(999LL, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);

        v10[2](v10, 0LL, v73);
      }

      if (v45)
      {
LABEL_75:
        v79 = (unint64_t *)&v45->__shared_owners_;
        do
          unint64_t v80 = __ldaxr(v79);
        while (__stlxr(v80 - 1, v79));
        if (!v80)
        {
          ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
          std::__shared_weak_count::__release_weak(v45);
        }
      }

- (void)startCompanionRanging:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, void))a5;
  int64_t v11 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    id v44 = v12;
    __int16 v45 = 1024;
    unsigned int v46 = [v13 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: XPC command - startCompanionRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if ([v8 deviceType] == (id)3
    && (v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID])) != 0
    && (BOOL v15 = !self->_peerDescriptor.__engaged_, v14, !v15))
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PRRemoteDevice UUID](self->_companion, "UUID"));
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) != 0)
    {
      if (self->_p2pServiceId)
      {
        if (self->_localRangingState == 1)
        {
          if (self->_companionRangingState == 1)
          {
            objc_storeStrong((id *)&self->_startOptions, a4);
            id v32 = 0LL;
            BOOL v19 = -[PRCompanionRangingClientProxy startRangingMangagerAndCompanion:]( self,  "startRangingMangagerAndCompanion:",  &v32);
            id v20 = v32;
            id v21 = v20;
            if (v19)
            {
              id v21 = 0LL;
              self->_int clientRequestState = 3;
            }

            ((void (**)(id, BOOL, id))v10)[2](v10, v19, v21);
          }

          else
          {
            NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
            v34 = @"Companion ranging is not stopped, cannot start.  ";
            v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
            id v31 = PRErrorWithCodeAndUserInfo(102LL, v30);
            id v20 = (id)objc_claimAutoreleasedReturnValue(v31);

            ((void (**)(id, BOOL, id))v10)[2](v10, 0LL, v20);
          }
        }

        else
        {
          NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
          $6F37327912F9327032CB5E18EB557B26 v36 = @"Local ranging is not stopped, cannot start.  ";
          BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
          id v29 = PRErrorWithCodeAndUserInfo(102LL, v28);
          id v20 = (id)objc_claimAutoreleasedReturnValue(v29);

          ((void (**)(id, BOOL, id))v10)[2](v10, 0LL, v20);
        }
      }

      else
      {
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        v38 = @"Asked to start ranging with invalid ticket id. Was ranging configured first?";
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
        id v27 = PRErrorWithCodeAndUserInfo(102LL, v26);
        id v20 = (id)objc_claimAutoreleasedReturnValue(v27);

        ((void (**)(id, BOOL, id))v10)[2](v10, 0LL, v20);
      }
    }

    else
    {
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      v40 = @"Asked to start ranging with a companion with a different UUID than the one configured for ranging.";
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
      id v25 = PRErrorWithCodeAndUserInfo(100LL, v24);
      id v20 = (id)objc_claimAutoreleasedReturnValue(v25);

      ((void (**)(id, BOOL, id))v10)[2](v10, 0LL, v20);
    }
  }

  else
  {
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    v42 = @"Remote device must be PRDeviceTypeCompanion and have a valid UUID.";
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    id v23 = PRErrorWithCodeAndUserInfo(100LL, v22);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v23);

    ((void (**)(id, BOOL, id))v10)[2](v10, 0LL, v20);
  }
}

- (BOOL)startRangingMangagerAndCompanion:(id *)a3
{
  int companionRangingState = self->_companionRangingState;
  if (companionRangingState == 1)
  {
    self->_int companionRangingState = 2;
  }

  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    id v10 = @"startRangingMangagerAndCompanion failed, not in stopped state";
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v6 = PRErrorWithCodeAndUserInfo(102LL, v5);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v7);
  }

  return companionRangingState == 1;
}

- (void)startRangingMangager
{
  if (self->_lastStartScheduledTooSoon)
  {
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: using conservative start time offset",  buf,  2u);
    }

    self->_lastStartScheduledTooSoon = 0;
    unint64_t v4 = 1500000LL;
  }

  else
  {
    unint64_t v4 = 510000LL;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"TimeSyncPathListeningWindowMSec"]);
  unsigned __int8 v7 = v6;
  if (v6)
  {
    unsigned int v8 = 1000 * [v6 intValue];
    NSErrorUserInfoKey v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: listeningWindowSizeUsec overridden by user to %u",  buf,  8u);
    }
  }

  else
  {
    unsigned int v8 = 3000;
  }

  startOptions = self->_startOptions;
  if (startOptions)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](startOptions, "objectForKey:", PRP2PArgsStartTimeOffsetUsec));
    if (v12)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        unint64_t v4 = (int)[v12 intValue];
        v14 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134217984;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: startCompanionRanging override startTimeOffsetUsec: %llu",  buf,  0xCu);
        }
      }
    }

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_startOptions,  "objectForKey:",  PRP2PArgsListeningWindowSizeUsec));
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        unsigned int v8 = [v16 intValue];
        unsigned __int8 v18 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: startCompanionRanging override listeningWindowSizeUsec: %u",  buf,  8u);
        }
      }
    }
  }

  if (!self->_peerDescriptor.__engaged_) {
    sub_100006080();
  }
  __int128 v19 = *(__int128 *)((char *)&self->_peerDescriptor.var0.__val_.uuid.var0 + 12);
  *(_OWORD *)__int128 buf = *(_OWORD *)&self->_peerDescriptor.var0.__null_state_;
  __int128 v38 = v19;
  uint64_t v39 = *(void *)&self->_peerDescriptor.var0.__val_.bt_adv_address.var0.__val_.__elems_[2];
  char v40 = 1;
  uint64_t v41 = 30000 * vcvtad_u64_f64((double)v4 / 30000.0);
  char v42 = 2;
  unsigned int v43 = v8;
  uint64_t v44 = 0LL;
  uint64_t v45 = 0x10000001ELL;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v20 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager startUserTriggeredRanging #companion-retry",  (uint8_t *)&v31,  2u);
  }

  id v21 = sub_100288340();
  sub_1000122E4(&v31, (void *)self->_rangingManagerClient.__ptr_ + 1);
  uint64_t v33 = v31;
  v34 = v32;
  if (v32)
  {
    p_shared_weak_owners = (unint64_t *)&v32->__shared_weak_owners_;
    do
      unint64_t v23 = __ldxr(p_shared_weak_owners);
    while (__stxr(v23 + 1, p_shared_weak_owners));
  }

  unsigned __int8 v24 = sub_1002898F4((uint64_t)v21, &v33, self->_p2pServiceId, (uint64_t)buf);
  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  id v25 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
      if ((v24 & 1) != 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }

  if ((v24 & 1) == 0)
  {
LABEL_33:
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    $6F37327912F9327032CB5E18EB557B26 v36 = @"Initate user triggered ranging failed";
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    id v29 = PRErrorWithCodeAndUserInfo(102LL, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    -[PRCompanionRangingClientProxy handleError:](self, "handleError:", v30);
  }

- (void)stopCompanionRanging:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, BOOL, void))a4;
  unsigned int v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessNameKey));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_clientInfo, "objectForKey:", PRProcessIdentifierKey));
    *(_DWORD *)__int128 buf = 138412546;
    id v22 = v9;
    __int16 v23 = 1024;
    unsigned int v24 = [v10 intValue];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PRCompanionRanging: XPC command - stopCompanionRanging. Process name: %@, pid: %d",  buf,  0x12u);
  }

  if ([v6 deviceType] == (id)3
    && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID])) != 0
    && (BOOL v12 = !self->_peerDescriptor.__engaged_, v11, !v12))
  {
    id v18 = 0LL;
    BOOL v13 = -[PRCompanionRangingClientProxy stopRangingMangagerAndCompanion:]( self,  "stopRangingMangagerAndCompanion:",  &v18);
    id v14 = v18;
    id v15 = v14;
    if (v13)
    {
      id v15 = 0LL;
      self->_int clientRequestState = 5;
    }

    ((void (**)(id, BOOL, id))v7)[2](v7, v13, v15);
  }

  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = @"Remote device must be PRDeviceTypeCompanion and have a valid UUID.";
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v17 = PRErrorWithCodeAndUserInfo(100LL, v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v17);

    ((void (**)(id, BOOL, id))v7)[2](v7, 0LL, v14);
  }
}

- (BOOL)stopRangingMangagerAndCompanion:(id *)a3
{
  int localRangingState = self->_localRangingState;
  if ((localRangingState - 2) < 2)
  {
    if (a3)
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      v30 = @"Received stopCompanionRanging while Local ranging is starting.  ";
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      id v8 = PRErrorWithCodeAndUserInfo(103LL, v5);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
      goto LABEL_8;
    }

    return 0;
  }

  if (localRangingState == 4)
  {
    if (!self->_p2pServiceId)
    {
      if (!a3) {
        return 0;
      }
      v27[0] = NSLocalizedDescriptionKey;
      v27[1] = NSLocalizedFailureReasonErrorKey;
      v28[0] = @"Failed to stop ranging";
      v28[1] = @"No service request.";
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
      id v19 = PRErrorWithCodeAndUserInfo(103LL, v5);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_8;
    }

    uint64_t v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager stopUserTriggeredRanging #companion-retry",  (uint8_t *)&v21,  2u);
    }

    self->_int localRangingState = 5;
    BOOL v12 = sub_100288340();
    sub_1000122E4(&v21, (void *)self->_rangingManagerClient.__ptr_ + 1);
    uint64_t v23 = v21;
    unsigned int v24 = v22;
    if (v22)
    {
      p_shared_weak_owners = (unint64_t *)&v22->__shared_weak_owners_;
      do
        unint64_t v14 = __ldxr(p_shared_weak_owners);
      while (__stxr(v14 + 1, p_shared_weak_owners));
    }

    char v15 = sub_10028A508((uint64_t)v12, &v23, self->_p2pServiceId);
    if (v24) {
      std::__shared_weak_count::__release_weak(v24);
    }
    unint64_t v16 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    if ((v15 & 1) == 0)
    {
      if (!a3) {
        return 0;
      }
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = NSLocalizedFailureReasonErrorKey;
      v26[0] = @"Failed to stop ranging";
      v26[1] = @"Stop ranging failed.";
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
      id v20 = PRErrorWithCodeAndUserInfo(103LL, v5);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v20);
      goto LABEL_8;
    }
  }

  else if (!localRangingState)
  {
    if (a3)
    {
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      id v32 = @"Local ranging state is not valid, cannot stop.  ";
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      id v6 = PRErrorWithCodeAndUserInfo(103LL, v5);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_8:
      *a3 = v7;

      return 0;
    }

    return 0;
  }

  return 1;
}

- (void)cleanupRangingManagerAndCompanionAfterError:(id)a3
{
  id v4 = a3;
  BOOL cleaningUponDidFail = self->_cleaningUponDidFail;
  id v6 = (os_log_s *)qword_1008000A0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (cleaningUponDidFail)
  {
    if (v7)
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received an error while cleaning up: %@",  buf,  0xCu);
    }
  }

  else
  {
    if (v7)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleanup companionRangingManager and Companion After Error #companion-retry",  buf,  2u);
    }

    self->_BOOL cleaningUponDidFail = 1;
    id v17 = 0LL;
    -[PRCompanionRangingClientProxy stopRangingMangagerAndCompanion:](self, "stopRangingMangagerAndCompanion:", &v17);
    id v8 = v17;
    if (self->_p2pServiceId)
    {
      id v9 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PRRangingManager unregisterForService #companion-retry",  buf,  2u);
      }

      self->_int localRangingState = 0;
      id v10 = sub_100288340();
      sub_1000122E4(buf, (void *)self->_rangingManagerClient.__ptr_ + 1);
      __int128 v16 = *(_OWORD *)buf;
      if (*(void *)&buf[8])
      {
        uint64_t v11 = (unint64_t *)(*(void *)&buf[8] + 16LL);
        do
          unint64_t v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }

      sub_1002891C8((uint64_t)v10, (uint64_t *)&v16, self->_p2pServiceId);
      if (*((void *)&v16 + 1)) {
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
      }
      BOOL v13 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        unint64_t v14 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }

      self->_p2pServiceId = 0;
    }

    self->_BOOL cleaningUponDidFail = 0;
  }
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (PRRemoteDevice)companion
{
  return (PRRemoteDevice *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCompanion:(id)a3
{
}

- (optional<rose::RoseDeviceDescriptor>)peerDescriptor
{
  return result;
}

- (void)setPeerDescriptor:(optional<rose::RoseDeviceDescriptor> *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startOptions, 0LL);
  objc_storeStrong((id *)&self->_clientInfo, 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
  value = self->_rangingRequest.__ptr_.__value_;
  self->_rangingRequest.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  sub_100012390((uint64_t)&self->_rangingManagerClient);
  objc_storeStrong((id *)&self->_connWrapper, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 5) = 0LL;
  *((void *)self + 12) = 0LL;
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 152) = 0;
  return self;
}

@end