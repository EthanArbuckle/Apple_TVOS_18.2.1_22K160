@interface CLHarvesterService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLHarvesterService)init;
- (NSString)lastCountryCode;
- (id).cxx_construct;
- (id)jsonObject;
- (void)beginService;
- (void)constructController;
- (void)constructMonitors;
- (void)constructPolicies;
- (void)constructSubHarvesters;
- (void)endService;
- (void)fetchStateWithReply:(id)a3;
- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5;
- (void)setHarvestingEnabled:(BOOL)a3;
- (void)setLastCountryCode:(id)a3;
- (void)setPrivateMode:(BOOL)a3;
- (void)shutdown;
- (void)submitSample:(id)a3;
@end

@implementation CLHarvesterService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993E78 != -1) {
    dispatch_once(&qword_101993E78, &stru_10182D1F8);
  }
  return (id)qword_101993E70;
}

+ (BOOL)isSupported
{
  if (qword_101993E80 != -1) {
    dispatch_once(&qword_101993E80, &stru_10182D218);
  }
  return 0;
}

- (CLHarvesterService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHarvesterService;
  return -[CLHarvesterService initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLHarvesterProtocol,  &OBJC_PROTOCOL___CLHarvesterClientProtocol);
}

- (void)constructController
{
  id v11 = -[CLHarvesterService universe](self, "universe");
  id v9 = -[CLHarvesterService universe](self, "universe");
  sub_10027B260(&v9, &v10);
  sub_10027B350((uint64_t *)&v11, &v10, &v12);
  sub_10005F550((uint64_t)&self->_harvestController, &v12);
  objc_super v3 = (std::__shared_weak_count *)*((void *)&v12 + 1);
  if (*((void *)&v12 + 1))
  {
    v4 = (unint64_t *)(*((void *)&v12 + 1) + 8LL);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  v6 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1))
  {
    v7 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
    do
      unint64_t v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

- (void)constructMonitors
{
  p_harvestController = (uint64_t *)&self->_harvestController;
  if (self->_harvestController.__ptr_)
  {
    id v14 = -[CLHarvesterService universe](self, "universe");
    id v12 = -[CLHarvesterService universe](self, "universe");
    sub_10027B4E4(&v12, &v13);
    sub_10027B5D4((uint64_t *)&v14, &v13, p_harvestController, p_harvestController, buf);
    sub_10005F550((uint64_t)&self->_monitorGps, (__int128 *)buf);
    v4 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      unint64_t v5 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }

    v7 = (std::__shared_weak_count *)*((void *)&v13 + 1);
    if (*((void *)&v13 + 1))
    {
      unint64_t v8 = (unint64_t *)(*((void *)&v13 + 1) + 8LL);
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10182D2C0);
    }
    __int128 v10 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "Service attempting to construct monitors without controller",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_10182D2C0);
      }
      LOWORD(v13) = 0;
      id v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  17LL,  "Service attempting to construct monitors without controller",  &v13,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHarvesterService constructMonitors]", "%s\n", v11);
    }
  }

- (void)constructPolicies
{
  p_harvestController = (uint64_t *)&self->_harvestController;
  if (!self->_harvestController.__ptr_) {
    sub_101232120();
  }
  p_monitorGps = (uint64_t *)&self->_monitorGps;
  if (!self->_monitorGps.__ptr_) {
    sub_101232294();
  }
  id v19 = -[CLHarvesterService universe](self, "universe");
  id v17 = -[CLHarvesterService universe](self, "universe");
  sub_10027B85C(&v17, &v18);
  sub_10027B94C( (uint64_t *)&v19,  &v18,  p_harvestController,  p_harvestController,  p_monitorGps,  p_harvestController,  &v20);
  sub_10005F550((uint64_t)&self->_policyProactive, &v20);
  unint64_t v5 = (std::__shared_weak_count *)*((void *)&v20 + 1);
  if (*((void *)&v20 + 1))
  {
    unint64_t v6 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  unint64_t v8 = (std::__shared_weak_count *)*((void *)&v18 + 1);
  if (*((void *)&v18 + 1))
  {
    unint64_t v9 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  id v19 = -[CLHarvesterService universe](self, "universe");
  sub_10027BCC8((uint64_t *)&v19, &v18);
  sub_10027BDB8(&v18, p_harvestController, p_monitorGps, (uint64_t *)&self->_policyProactive, &v20);
  sub_10005F550((uint64_t)&self->_policyTrip, &v20);
  id v11 = (std::__shared_weak_count *)*((void *)&v20 + 1);
  if (*((void *)&v20 + 1))
  {
    id v12 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  id v14 = (std::__shared_weak_count *)*((void *)&v18 + 1);
  if (*((void *)&v18 + 1))
  {
    v15 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)constructSubHarvesters
{
  if (self->_harvestController.__ptr_)
  {
    if (self->_monitorGps.__ptr_)
    {
      if (!self->_policyProactive.__ptr_ || !self->_policyTrip.__ptr_)
      {
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_10182D2C0);
        }
        v2 = (os_log_s *)qword_1019349B8;
        if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "Service attempting to construct subharvesters without policies",  buf,  2u);
        }

        if (sub_1002921D0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019349B0 != -1) {
            dispatch_once(&qword_1019349B0, &stru_10182D2C0);
          }
          LOWORD(v7[0]) = 0;
          objc_super v3 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  17LL,  "Service attempting to construct subharvesters without policies",  v7,  2,  v7[0]);
LABEL_30:
          unint64_t v6 = (uint8_t *)v3;
          sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHarvesterService constructSubHarvesters]", "%s\n", v3);
          if (v6 != buf) {
            free(v6);
          }
        }
      }
    }

    else
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_10182D2C0);
      }
      unint64_t v5 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "Service attempting to construct subharvesters without gps monitor",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_10182D2C0);
        }
        LOWORD(v7[0]) = 0;
        objc_super v3 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  17LL,  "Service attempting to construct subharvesters without gps monitor",  v7,  2,  v7[0]);
        goto LABEL_30;
      }
    }
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10182D2C0);
    }
    v4 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "Service attempting to construct subharvesters without controller",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_10182D2C0);
      }
      LOWORD(v7[0]) = 0;
      objc_super v3 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  17LL,  "Service attempting to construct subharvesters without controller",  v7,  2,  v7[0]);
      goto LABEL_30;
    }
  }

- (void)beginService
{
  objc_super v3 = (dispatch_queue_s *)objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "queue");
  -[CLHarvesterService constructController](self, "constructController");
  -[CLHarvesterService constructMonitors](self, "constructMonitors");
  self->_endpointSelector = objc_alloc_init(&OBJC_CLASS___CLHEndpointSelector);
  v4 = -[CLHNetworkController initWithQueue:](objc_alloc(&OBJC_CLASS___CLHNetworkController), "initWithQueue:", v3);
  self->_networkController = v4;
  -[CLHNetworkController setEndpointSelector:](v4, "setEndpointSelector:", self->_endpointSelector);
  unint64_t v5 = -[CLHLocationClassifier initInUniverse:]( objc_alloc(&OBJC_CLASS___CLHLocationClassifier),  "initInUniverse:",  -[CLHarvesterService universe](self, "universe"));
  self->_classifier = v5;
  -[CLHLocationClassifier fetchLocationsOfInterestIfPossibleWithCompletionHandler:]( v5,  "fetchLocationsOfInterestIfPossibleWithCompletionHandler:",  &stru_10182D238);
  unint64_t v6 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  @"/var/root/Library/Caches/locationd/harvest/",  1LL);
  self->_requestStore = -[CLHRequestStore initWithRootDirectory:classifier:]( objc_alloc(&OBJC_CLASS___CLHRequestStore),  "initWithRootDirectory:classifier:",  v6,  self->_classifier);

  self->_mescalSigner = (CLMescalSigner *)-[CLMescalSigner initInSilo:]( [CLMescalSigner alloc],  "initInSilo:",  objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"));
  -[CLHarvesterService constructPolicies](self, "constructPolicies");
  -[CLHarvesterService constructSubHarvesters](self, "constructSubHarvesters");
  sub_1004F2598();
  +[CLPMeta updateRegulatoryDomainEstimates](&OBJC_CLASS___CLPMeta, "updateRegulatoryDomainEstimates");
  ptr = self->_harvestController.__ptr_;
  cntrl = self->_monitorGps.__cntrl_;
  v34 = self->_monitorGps.__ptr_;
  v35 = cntrl;
  if (cntrl)
  {
    unint64_t v9 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  id v11 = self->_policyProactive.__cntrl_;
  v32 = self->_policyProactive.__ptr_;
  v33 = v11;
  if (v11)
  {
    id v12 = (unint64_t *)((char *)v11 + 8);
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  id v14 = self->_policyTrip.__cntrl_;
  v30 = self->_policyTrip.__ptr_;
  v31 = v14;
  if (v14)
  {
    v15 = (unint64_t *)((char *)v14 + 8);
    do
      unint64_t v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }

  memset(v29, 0, sizeof(v29));
  sub_10027C094( (char *)v29,  (void *)self->_subHarvesters.__begin_,  (void *)self->_subHarvesters.__end_,  ((char *)self->_subHarvesters.__end_ - (char *)self->_subHarvesters.__begin_) >> 4);
  sub_100314BD4(ptr, (uint64_t *)&v34, (uint64_t *)&v32, (uint64_t *)&v30, v29);
  *(void *)out_token = v29;
  sub_10004CC28((void ***)out_token);
  id v17 = (std::__shared_weak_count *)v31;
  if (v31)
  {
    __int128 v18 = (unint64_t *)((char *)v31 + 8);
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  __int128 v20 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v21 = (unint64_t *)((char *)v33 + 8);
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  v23 = (std::__shared_weak_count *)v35;
  if (v35)
  {
    v24 = (unint64_t *)((char *)v35 + 8);
    do
      unint64_t v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  v26 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.locationd.harvester");
  self->_listener = v26;
  -[NSXPCListener _setQueue:](v26, "_setQueue:", v3);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10027A808;
  handler[3] = &unk_10182D2A0;
  handler[4] = self;
  notify_register_dispatch( GEOCountryConfigurationCountryCodeChangedDarwinNotification,  &self->_countryCodeNotificationToken,  v3,  handler);
  v27 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  @"/var/root/Library/Caches/locationd/streaming_archives/",  1LL);
  -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v27,  0LL);
}

- (void)endService
{
  notify_cancel(self->_countryCodeNotificationToken);
  dispatch_queue_set_specific( (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "queue"),  &unk_101993E88,  &unk_101993E88,  0);
  if (dispatch_get_specific(&unk_101993E88) == &unk_101993E88)
  {
    sub_1000F0D38(&self->_harvestController.__ptr_);
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10027AA28;
    v6[3] = &unk_10181A288;
    v6[4] = self;
    objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "sync:", v6);
  }

  sub_1000F0D38(&self->_monitorGps.__ptr_);
  sub_1000F0D38(&self->_policyTrip.__ptr_);
  sub_1000F0D38(&self->_policyProactive.__ptr_);
  p_subHarvesters = &self->_subHarvesters;
  begin = p_subHarvesters->__begin_;
  p_subHarvesters->__end_ = begin;
}

- (void)setPrivateMode:(BOOL)a3
{
}

- (void)setHarvestingEnabled:(BOOL)a3
{
}

- (void)shutdown
{
}

- (id)jsonObject
{
  v5[0] = @"endpointSelector";
  id v3 = -[CLHEndpointSelector jsonObject](self->_endpointSelector, "jsonObject");
  v5[1] = @"locationClassifier";
  v6[0] = v3;
  v6[1] = -[CLHLocationClassifier jsonObject](self->_classifier, "jsonObject");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL);
}

- (void)submitSample:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10182D2C0);
  }
  id v3 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    unint64_t v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:-submitSample: called}",  (uint8_t *)v4,  0x12u);
  }

  sub_10027AC04( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  (uint64_t)@"com.apple.locationd.harvest.contribute");
}

- (void)fetchStateWithReply:(id)a3
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10182D2C0);
  }
  __int16 v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:-fetchStateWithReply: called}",  buf,  0x12u);
  }

  if (sub_10027AC04( +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"),  (uint64_t)@"com.apple.locationd.harvest.introspection"))
  {
    v7[0] = -[CLHEndpointSelector jsonObject](self->_endpointSelector, "jsonObject", @"endpointSelector");
    v6[1] = @"classifier";
    v7[1] = -[CLHLocationClassifier jsonObject](self->_classifier, "jsonObject");
    void v6[2] = @"requestStore";
    void v7[2] = -[CLHRequestStore jsonObject](self->_requestStore, "jsonObject");
    (*((void (**)(id, NSDictionary *))a3 + 2))( a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_10182D2C0);
  }
  __int16 v5 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received connection request", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10182D2C0);
    }
    v8[0] = 0;
    unint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  0LL,  "received connection request",  v8,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHarvesterService listener:shouldAcceptNewConnection:]", "%s\n", v7);
  }

  sub_10027AC04(a4, (uint64_t)@"com.apple.locationd.harvest.introspection");
  sub_10027AC04(a4, (uint64_t)@"com.apple.locationd.harvest.contribute");
  return 0;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  p_subHarvesters = &self->_subHarvesters;
  sub_10004CC28((void ***)&p_subHarvesters);
  sub_10000AE14((uint64_t)&self->_policyProactive);
  sub_10000AE14((uint64_t)&self->_policyTrip);
  sub_10000AE14((uint64_t)&self->_monitorGps);
  sub_10000AE14((uint64_t)&self->_harvestController);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 15) = 0LL;
  *((void *)self + 17) = 0LL;
  *((void *)self + 18) = 0LL;
  *((void *)self + 16) = 0LL;
  return self;
}

@end