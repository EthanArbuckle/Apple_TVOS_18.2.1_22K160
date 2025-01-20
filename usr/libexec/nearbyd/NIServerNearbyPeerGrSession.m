@interface NIServerNearbyPeerGrSession
- (BOOL)shouldBypassBleDiscovery;
- (NIServerNearbyPeerGrSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5;
- (id).cxx_construct;
- (id)_triggerRanging:(id)a3;
- (id)configure;
- (id)run;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequest;
- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3;
- (unint64_t)sipHashForIRK:(id)a3;
- (void)_grSessionInvalidatedWithReason:(int)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)invalidate;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatePeerData:(const void *)a3;
@end

@implementation NIServerNearbyPeerGrSession

- (NIServerNearbyPeerGrSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerGrSession;
  v11 = -[NIServerNearbyPeerGrSession init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_clientQueue, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 getResourcesManager]);
    v14 = v13;
    if (v13) {
      [v13 protobufLogger];
    }
    else {
      __int128 v20 = 0uLL;
    }
    sub_10000EE54((uint64_t)&v12->_pbLogger, &v20);
    v15 = (std::__shared_weak_count *)*((void *)&v20 + 1);
    if (*((void *)&v20 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = v12;
  }

  return v12;
}

- (id)configure
{
  p_grSession = &self->_grSession;
  if (self->_grSession.__ptr_) {
    goto LABEL_10;
  }
  -[NIServerNearbyPeerGrSession _prepareServiceRequest](self, "_prepareServiceRequest");
  if (v10[504])
  {
    -[NIServerNearbyPeerGrSession _buildRoseSession:](self, "_buildRoseSession:", v10);
    sub_10000EE54((uint64_t)&self->_grSession, &v9);
    v4 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }

  else
  {
    sub_10015D394(&self->_grSession.__ptr_);
  }

  if (p_grSession->__ptr_) {
LABEL_10:
  }
    v7 = 0LL;
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }
  return v7;
}

- (id)run
{
  if (self->_grSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
    [v5 startAdvertising];

    if ([v4 isBackgroundOperationAllowed])
    {
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
      [v6 allowScreenOffOperation:1];
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
    [v7 startScanning];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
    [v8 runWithConfigurationCalled];

    __int128 v9 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395CDC();
    }
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
  }

  return v9;
}

- (BOOL)shouldBypassBleDiscovery
{
  return 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  if (self->_pbLogger.__ptr_)
  {
    double v5 = sub_100023CC4();
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NINearbyObject objectFromBluetoothDevice:]( &OBJC_CLASS___NINearbyObject,  "objectFromBluetoothDevice:",  v4));
    if (v6)
    {
      ptr = self->_pbLogger.__ptr_;
      id v8 = [v4 u64Identifier];
      sub_100230924(v6, (uint64_t)__p);
      sub_100239E68((uint64_t)ptr, (uint64_t)v8, (uint64_t)__p, v5);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }

  id v9 = -[NIServerNearbyPeerGrSession _triggerRanging:](self, "_triggerRanging:", v4);
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v9 = [v7 u64Identifier];
  id v10 = [v6 u64Identifier];
  v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lifecycleSupervisor]);
  unsigned int v13 = [v12 doesClientWantSessionToRun];

  ptr = self->_grSession.__ptr_;
  if (ptr) {
    BOOL v15 = *((_BYTE *)ptr + 33) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  unsigned int v16 = [WeakRetained isLongRangeEnabled];
  if (ptr) {
    char v17 = v13;
  }
  else {
    char v17 = 0;
  }
  if ((v17 & 1) != 0)
  {
    unsigned int v18 = v16;
    if (v16) {
      BOOL v19 = v9 != v10;
    }
    else {
      BOOL v19 = v15;
    }
    __int128 v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v21 = @"NO";
      int v29 = 138413570;
      if (v19) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      v30 = v22;
      __int16 v31 = 2112;
      if (v9 == v10) {
        v23 = @"NO";
      }
      else {
        v23 = @"YES";
      }
      v32 = v23;
      __int16 v33 = 2112;
      if (v15) {
        v24 = @"YES";
      }
      else {
        v24 = @"NO";
      }
      v34 = @"YES";
      if (!v18) {
        objc_super v21 = @"YES";
      }
      __int16 v35 = 2112;
      v36 = @"YES";
      __int16 v37 = 2112;
      v38 = v24;
      __int16 v39 = 2112;
      v40 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,#restart ranging restart decision: %@. adr:%@,run:%@,has:%@,rsp:%@,uap:%@",  (uint8_t *)&v29,  0x3Eu);
    }

    if (v19) {
      id v25 = -[NIServerNearbyPeerGrSession _triggerRanging:](self, "_triggerRanging:", v7);
    }
  }

  else
  {
    v26 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      v27 = @"NO";
      if (v13) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      if (ptr) {
        v27 = @"YES";
      }
      int v29 = 138412546;
      v30 = v28;
      __int16 v31 = 2112;
      v32 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,#restart early return. run: %@, has: %@",  (uint8_t *)&v29,  0x16u);
    }
  }
}

- (void)updatePeerData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100395D08();
  }
  if (self->_grSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned __int8 v6 = [WeakRetained isLongRangeEnabled];

    if ((v6 & 1) == 0) {
      sub_1002732D0((uint64_t)self->_grSession.__ptr_, (uint64_t)a3);
    }
  }

- (void)didReceiveNewSolution:(const void *)a3
{
  v3 = (int *)((char *)a3 + 32);
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    unsigned __int8 v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395D40(v3, v6);
    }
  }

  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveNewSolution:a3];
  }

- (void)didReceiveRemoteData:(const void *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveRemoteData:a3];
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unsigned int var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didServiceRequestUpdateStatus:", v4, var2);
}

- (void)invalidate
{
  ptr = self->_grSession.__ptr_;
  p_grSession = &self->_grSession;
  uint64_t v3 = (uint64_t)ptr;
  if (ptr)
  {
    sub_10026FAA8(v3);
    sub_10015D394(p_grSession);
  }

- (void)_grSessionInvalidatedWithReason:(int)a3
{
  double v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100275E00(a3, v7);
    sub_100395DB4();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInvalidateUWBSession];
}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  unsigned __int8 v6 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v8 = self;
  id v9 = objc_claimAutoreleasedReturnValue([WeakRetained getContainerUniqueIdentifier]);
  sub_1000065CC(__p, (char *)[v9 UTF8String]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
  v11 = v10;
  if (v10) {
    [v10 protobufLogger];
  }
  else {
    __int128 v47 = 0uLL;
  }
  v12 = operator new(0x5D8uLL);
  v12[1] = 0LL;
  v12[2] = 0LL;
  void *v12 = off_1007B39C8;
  unsigned int v13 = v8;
  *(void *)buf = off_1007B3A18;
  v69 = v13;
  v70 = buf;
  v14 = v13;
  v66[0] = off_1007B3A98;
  v66[1] = v14;
  v67 = v66;
  BOOL v15 = v14;
  v64[0] = off_1007B3B60;
  v64[1] = v15;
  v65 = v64;
  unsigned int v16 = v15;
  v62[0] = off_1007B3C28;
  v62[1] = v16;
  v63 = v62;
  v61 = 0LL;
  char v17 = v16;
  v58[0] = off_1007B3CA8;
  v58[1] = v17;
  v59 = v58;
  v57 = 0LL;
  v55 = 0LL;
  v53 = 0LL;
  __int128 v51 = v47;
  sub_10026F104( (uint64_t)(v12 + 3),  (__int128 *)__p,  (void *)a3,  (uint64_t)buf,  (uint64_t)v66,  (uint64_t)v64,  (uint64_t)v62,  (uint64_t)v60,  (uint64_t)v58,  (uint64_t)v56,  (uint64_t)v54,  (uint64_t)v52,  &v51);
  v12[3] = off_1007B3D38;
  v12[4] = off_1007B3E00;
  unsigned int v18 = (std::__shared_weak_count *)*((void *)&v51 + 1);
  if (*((void *)&v51 + 1))
  {
    BOOL v19 = (unint64_t *)(*((void *)&v51 + 1) + 8LL);
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  objc_super v21 = v53;
  if (v53 == v52)
  {
    uint64_t v22 = 4LL;
    objc_super v21 = v52;
  }

  else
  {
    if (!v53) {
      goto LABEL_14;
    }
    uint64_t v22 = 5LL;
  }

  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  v23 = v55;
  if (v55 == v54)
  {
    uint64_t v24 = 4LL;
    v23 = v54;
  }

  else
  {
    if (!v55) {
      goto LABEL_19;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  id v25 = v57;
  if (v57 == v56)
  {
    uint64_t v26 = 4LL;
    id v25 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_24;
    }
    uint64_t v26 = 5LL;
  }

  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  v27 = v59;
  if (v59 == v58)
  {
    uint64_t v28 = 4LL;
    v27 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_29;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  int v29 = v61;
  if (v61 == v60)
  {
    uint64_t v30 = 4LL;
    int v29 = v60;
  }

  else
  {
    if (!v61) {
      goto LABEL_34;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  __int16 v31 = v63;
  if (v63 == v62)
  {
    uint64_t v32 = 4LL;
    __int16 v31 = v62;
  }

  else
  {
    if (!v63) {
      goto LABEL_39;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  __int16 v33 = v65;
  if (v65 == v64)
  {
    uint64_t v34 = 4LL;
    __int16 v33 = v64;
  }

  else
  {
    if (!v65) {
      goto LABEL_44;
    }
    uint64_t v34 = 5LL;
  }

  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_44:
  __int16 v35 = v67;
  if (v67 == v66)
  {
    uint64_t v36 = 4LL;
    __int16 v35 = v66;
  }

  else
  {
    if (!v67) {
      goto LABEL_49;
    }
    uint64_t v36 = 5LL;
  }

  (*(void (**)(void))(*v35 + 8 * v36))();
LABEL_49:
  __int16 v37 = v70;
  if (v70 == buf)
  {
    uint64_t v38 = 4LL;
    __int16 v37 = buf;
  }

  else
  {
    if (!v70) {
      goto LABEL_54;
    }
    uint64_t v38 = 5LL;
  }

  (*(void (**)(void))(*(void *)v37 + 8 * v38))();
LABEL_54:
  *(void *)&__int128 v48 = v12 + 3;
  *((void *)&v48 + 1) = v12;
  sub_100012538((uint64_t)&v48, v12 + 5, (uint64_t)(v12 + 3));

  __int16 v39 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,Registering for UWB service.",  buf,  2u);
  }

  int v40 = sub_10026FF14(v48);
  if (v40)
  {
    v41 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v40, buf);
      sub_100395E00();
    }

    *unsigned __int8 v6 = 0LL;
    v6[1] = 0LL;
    v42 = (std::__shared_weak_count *)*((void *)&v48 + 1);
    if (*((void *)&v48 + 1))
    {
      v43 = (unint64_t *)(*((void *)&v48 + 1) + 8LL);
      do
        unint64_t v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
  }

  else
  {
    *(_OWORD *)unsigned __int8 v6 = v48;
  }

  if (v50 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v46;
  result.__ptr_ = v45;
  return result;
}

- (unint64_t)sipHashForIRK:(id)a3
{
  id v3 = a3;
  unint64_t v4 = SipHash([v3 bytes], &unk_1004255C8, 8);

  return v4;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
  id v7 = [v6 copy];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
  if (v8
    && (id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"enableAdditionalUWBSignalFeatures"]),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"enableAdditionalUWBSignalFeatures"]);

    if (v12)
    {
      else {
        int v13 = 4;
      }
    }

    else
    {
      int v13 = 4;
    }
  }

  else
  {
    int v13 = 4;
  }

  v14 = (char *)[v7 backgroundMode] - 3;
  BOOL v15 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([WeakRetained getContainerUniqueIdentifier]);
    char v17 = (void *)v16;
    unsigned int v18 = @"yes";
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,Prepare service request. avoidDedicatedAntennas = [%@], Container ID: %@. ",  buf,  0x16u);
  }

  __int16 v74 = 0;
  char v75 = 0;
  int v76 = 68354305;
  char v77 = 0;
  char v78 = 0;
  char v79 = 0;
  char v80 = 0;
  int v81 = 3;
  int v82 = v13;
  int v83 = 3;
  uint64_t v85 = 0LL;
  uint64_t v84 = 0LL;
  __int16 v86 = 0;
  int v87 = 1;
  char v88 = 1;
  BOOL v89 = (unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL;
  int v90 = 0;
  char v91 = 0;
  int v92 = 6;
  BOOL v19 = sub_100288340();
  unint64_t v20 = (void *)*((void *)v19 + 406);
  objc_super v21 = (std::__shared_weak_count *)*((void *)v19 + 407);
  v70[1] = v20;
  v70[2] = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }

  if (v20)
  {
    if (sub_100266E04((uint64_t)v20, (char *)&v74, (unsigned __int8 *)&v74 + 1, 0))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
      if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"forceAntennaDiversity"]);
        BOOL v27 = v26 == 0LL;

        if (!v27)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
          int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"forceAntennaDiversity"]);
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v30);
          char isKindOfClass = objc_opt_isKindOfClass(v29, v31);

          if ((isKindOfClass & 1) != 0)
          {
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v7 debugParameters]);
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"forceAntennaDiversity"]);
            unsigned int v35 = [v34 BOOLValue];

            if (v35)
            {
              uint64_t v36 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,* Antenna diversity turned ON from default writes.",  buf,  2u);
              }

              LOWORD(v90) = 257;
            }
          }
        }
      }

      if ([WeakRetained isLongRangeEnabled])
      {
        __int16 v37 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#peer-gr,Long range enabled.", buf, 2u);
        }

        HIBYTE(v76) = 5;
        BYTE1(v76) = 0;
        BYTE2(v90) = 1;
        int v87 = 1;
      }

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 discoveryToken]);

      if (!v39)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100395EC0();
        }
        id v42 = 0LL;
        goto LABEL_43;
      }

      int v40 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDiscoveryToken]);
      v70[0] = 0LL;
      unsigned int v41 = [WeakRetained shouldInitiate:v39 peerDiscoveryToken:v40 error:v70];
      id v42 = v70[0];

      v43 = (os_log_s *)qword_1008000A0;
      if (v42)
      {
        unint64_t v44 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v66 = objc_claimAutoreleasedReturnValue([v42 description]);
          id v67 = [v66 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v67;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "#peer-gr,unable to determine initiator: %s",  buf,  0xCu);
        }

LABEL_43:
        retstr->var0.__null_state_ = 0;
        retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
LABEL_67:

        goto LABEL_68;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        v45 = @"No";
        if (v41) {
          v45 = @"Yes";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#peer-gr,Should initiate: %@.", buf, 0xCu);
      }

      if (v41) {
        sub_100140AE8((char *)&v74, (uint64_t)buf);
      }
      else {
        sub_100140FFC((char *)&v74, (uint64_t)buf);
      }
      v46 = (unsigned __int8 *)operator new(0x1F8uLL);
      memcpy(v46, buf, 0x1F8uLL);
      *(void *)buf = 0LL;
      *(void *)&uint8_t buf[8] = 0LL;
      if (([WeakRetained isLegacyDiscoveryToken:v39] & 1) != 0
        || (__int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDiscoveryToken]),
            unsigned int v48 = [WeakRetained isLegacyDiscoveryToken:v47],
            v47,
            v48))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDiscoveryToken]);
        v68 = (void *)objc_claimAutoreleasedReturnValue([v49 rawToken]);

        char v50 = (void *)objc_claimAutoreleasedReturnValue([v39 rawToken]);
        __int128 v51 = v50;
        if (v41)
        {
          objc_msgSend(v50, "getBytes:range:", buf, 7, 8);
          v52 = v68;
        }

        else
        {
          objc_msgSend(v68, "getBytes:range:", buf, 7, 8);
          v52 = v51;
        }

        objc_msgSend(v52, "getBytes:range:", &buf[8], 7, 8, v68);
      }

      else
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue([v39 getIRK]);
        v61 = (void *)objc_claimAutoreleasedReturnValue([v7 peerDiscoveryToken]);
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v61 getIRK]);

        if ([v69 length] != (id)16 || objc_msgSend(v51, "length") != (id)16)
        {
          retstr->var0.__null_state_ = 0;
          retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

LABEL_66:
          operator delete(v46);
          id v42 = 0LL;
          goto LABEL_67;
        }

        unint64_t v62 = -[NIServerNearbyPeerGrSession sipHashForIRK:](self, "sipHashForIRK:", v69);
        unint64_t v63 = -[NIServerNearbyPeerGrSession sipHashForIRK:](self, "sipHashForIRK:", v51);
        if (v41) {
          unint64_t v64 = v62;
        }
        else {
          unint64_t v64 = v63;
        }
        if (v41) {
          unint64_t v65 = v63;
        }
        else {
          unint64_t v65 = v62;
        }
        *(void *)buf = v64;
        *(void *)&uint8_t buf[8] = v65;
      }

      int v53 = v46[234];
      *(_OWORD *)(v46 + 218) = *(_OWORD *)buf;
      if (!v53) {
        v46[234] = 1;
      }
      id v54 = [v7 backgroundMode];
      int v55 = *((_DWORD *)v46 + 17);
      if (v54 == (id)1)
      {
        v55 |= 5u;
        *((_DWORD *)v46 + 17) = v55;
        *((void *)v46 + 9) = -4275240961LL;
        *((_WORD *)v46 + 40) = -1;
        v46[82] = 0;
        *(_WORD *)(v46 + 83) = -1;
      }

      if ((v55 & 1) != 0)
      {
        v56 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getContainerUniqueIdentifier]);
          *(_DWORD *)v71 = 138412290;
          v72 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#peer-gr,AP asleep operation enabled for session container %@.",  v71,  0xCu);
        }
      }

      memcpy(retstr, v46, 0x1F8uLL);
      retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
      goto LABEL_66;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100395EEC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100395E94();
  }

  retstr->var0.__null_state_ = 0;
  retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
LABEL_68:
  if (v21)
  {
    v58 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return result;
}

- (id)_triggerRanging:(id)a3
{
  id v4 = a3;
  ptr = self->_grSession.__ptr_;
  if (ptr)
  {
    if (sub_10027034C((uint64_t)ptr))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
      if ([WeakRetained isLongRangeEnabled])
      {
        id v7 = [v4 btAdvertisingAddress];
        int v17 = (int)v7;
        __int16 v18 = WORD2(v7);
        LODWORD(v14) = 2;
        BYTE4(v14) = 0;
        __int16 v15 = 0;
        char v16 = 0;
        char v19 = 1;
        char v20 = 1;
      }

      else
      {
        LOBYTE(v14) = 0;
        char v20 = 0;
      }

      uint64_t v21 = 0LL;
      char v22 = 0;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v26 = 0;
      int v10 = sub_100272BA0((uint64_t)self->_grSession.__ptr_, &v14);
    }

    else
    {
      id v9 = [v4 btAdvertisingAddress];
      int v17 = (int)v9;
      __int16 v18 = WORD2(v9);
      LODWORD(v14) = 2;
      BYTE4(v14) = 0;
      __int16 v15 = 0;
      char v16 = 0;
      char v19 = 1;
      char v20 = 1;
      uint64_t v21 = 0LL;
      char v22 = 0;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      int v26 = 0;
      int v10 = sub_100272BA0((uint64_t)self->_grSession.__ptr_, &v14);
    }

    if (!v10)
    {
      v12 = 0LL;
      goto LABEL_15;
    }

    v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v10, &v14);
      sub_100395F18();
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }

  v12 = (void *)v8;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end