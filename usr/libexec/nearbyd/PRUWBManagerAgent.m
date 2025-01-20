@interface PRUWBManagerAgent
- (PRUWBDeviceCapabilities)deviceCapabilities;
- (PRUWBManagerAgent)initWithClientReference:(shared_ptr<PRRangingManagerClient>)a3;
- (RoseServiceStateUpdate)currentServiceState;
- (id).cxx_construct;
- (id)getQueue;
- (shared_ptr<PRConfigurationManager>)configurationManager;
- (void)connect;
- (void)disconnect;
- (void)requestAsyncServiceStatusUpdate;
@end

@implementation PRUWBManagerAgent

- (PRUWBManagerAgent)initWithClientReference:(shared_ptr<PRRangingManagerClient>)a3
{
  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PRUWBManagerAgent;
  v4 = -[PRUWBManagerAgent init](&v7, "init", a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4) {
    sub_100018E60(&v4->_clientReference.__ptr_, ptr);
  }
  return v5;
}

- (id)getQueue
{
  return *((id *)sub_100288340() + 7);
}

- (PRUWBDeviceCapabilities)deviceCapabilities
{
  v2 = sub_100005150();
  BOOL v3 = sub_100355250((uint64_t)v2);
  v4 = sub_100005150();
  int v5 = sub_100355258((uint64_t)v4);
  v6 = sub_100005150();
  BOOL v7 = sub_1003552C4((uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v9 = [v8 BOOLForKey:@"NI_SimulateUnsupportedPlatform"];
  int v10 = (v9 ^ 1) & v3;
  int v11 = (v9 ^ 1) & v5;
  int v12 = (v9 ^ 1) & v7;
  v13 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    v14 = @"NO";
    if (v10) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    if (v11) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    int v21 = 138413058;
    v22 = v15;
    if (v12) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    __int16 v23 = 2112;
    v24 = v16;
    __int16 v25 = 2112;
    v26 = v17;
    if (v9) {
      v14 = @"YES";
    }
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[UWBAgent] query device capabilities. Supports UWB: %@, Supports AoA: %@, Supports NMI: %@, Simulated: %@",  (uint8_t *)&v21,  0x2Au);
  }

  if (v12) {
    int v18 = 0x10000;
  }
  else {
    int v18 = 0;
  }
  if (v11) {
    int v19 = 256;
  }
  else {
    int v19 = 0;
  }
  return (PRUWBDeviceCapabilities)(v18 | v19 | v10);
}

- (shared_ptr<PRConfigurationManager>)configurationManager
{
  BOOL v3 = v2;
  v4 = (PRConfigurationManager *)sub_100288340();
  uint64_t v6 = *((void *)v4 + 407);
  *BOOL v3 = *((void *)v4 + 406);
  v3[1] = v6;
  if (v6)
  {
    BOOL v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)connect
{
  BOOL v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[UWBAgent] connect with client reference",  (uint8_t *)&v11,  2u);
  }

  v4 = sub_100288340();
  sub_1000122E4(&v11, (void *)self->_clientReference.__ptr_ + 1);
  __int128 v12 = v11;
  __int128 v11 = 0uLL;
  sub_10028CA60((uint64_t)v4, (unint64_t *)&v12);
  int v5 = (std::__shared_weak_count *)*((void *)&v12 + 1);
  if (*((void *)&v12 + 1))
  {
    uint64_t v6 = (unint64_t *)(*((void *)&v12 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  unint64_t v8 = (std::__shared_weak_count *)*((void *)&v11 + 1);
  if (*((void *)&v11 + 1))
  {
    unsigned int v9 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

- (void)disconnect
{
  BOOL v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[UWBAgent] disconnect", (uint8_t *)&v11, 2u);
  }

  v4 = sub_100288340();
  sub_1000122E4(&v11, (void *)self->_clientReference.__ptr_ + 1);
  __int128 v12 = v11;
  __int128 v11 = 0uLL;
  sub_10028CB38((uint64_t)v4, (unint64_t *)&v12);
  int v5 = (std::__shared_weak_count *)*((void *)&v12 + 1);
  if (*((void *)&v12 + 1))
  {
    uint64_t v6 = (unint64_t *)(*((void *)&v12 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  unint64_t v8 = (std::__shared_weak_count *)*((void *)&v11 + 1);
  if (*((void *)&v11 + 1))
  {
    unsigned int v9 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

- (void)requestAsyncServiceStatusUpdate
{
  BOOL v3 = sub_100288340();
  sub_1000122E4(&v9, (void *)self->_clientReference.__ptr_ + 1);
  uint64_t v11 = v9;
  __int128 v12 = v10;
  if (v10)
  {
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      unint64_t v5 = __ldxr(p_shared_weak_owners);
    while (__stxr(v5 + 1, p_shared_weak_owners));
  }

  sub_1002889DC((uint64_t)v3, &v11);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  uint64_t v6 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

- (RoseServiceStateUpdate)currentServiceState
{
  v2 = (void **)sub_100288340();
  return (RoseServiceStateUpdate)(*(uint64_t (**)(void *))(*v2[808] + 72LL))(v2[808]);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end