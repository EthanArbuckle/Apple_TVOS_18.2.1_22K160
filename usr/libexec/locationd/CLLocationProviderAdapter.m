@interface CLLocationProviderAdapter
- (BOOL)syncgetIsSimulationEnabled;
- (BOOL)syncgetLocation:(id *)a3;
- (BOOL)syncgetLocationPrivate:(void *)a3;
- (BOOL)syncgetLocationUnavailable;
- (BOOL)syncgetNotification:(const int *)a3 data:(void *)a4;
- (id)syncgetName;
- (void)fetchLocationWithReply:(id)a3;
- (void)locationProvider;
- (void)register:(id)a3 forNotification:(int)a4 distanceFilter:(double)a5;
- (void)sendSimulatedLocation:(id)a3;
- (void)sendSimulatedLocationUnavailable;
- (void)setSimulationEnabled:(BOOL)a3;
- (void)shutdown;
- (void)start;
- (void)updateNotification:(int)a3 withRegistrationInfo:(id)a4 forClient:(id)a5;
@end

@implementation CLLocationProviderAdapter

- (void)locationProvider
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)updateNotification:(int)a3 withRegistrationInfo:(id)a4 forClient:(id)a5
{
  id v8 = sub_10024769C(a4);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a5);
    v11 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    v12 = v11;
    int v15 = a3;
    if (!v11
      || ((*(uint64_t (**)(void *, uint64_t, int *, id))(*(void *)v11 + 216LL))(v11, v10, &v15, v9) & 1) == 0)
    {
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183B460);
      }
      v13 = (os_log_s *)qword_101934838;
      if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v21 = v12;
        __int16 v22 = 1024;
        int v23 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "LocationProvider,Failed to updateRegistrationInfoForClient %p (%d)",  buf,  0x12u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934830 != -1) {
          dispatch_once(&qword_101934830, &stru_10183B460);
        }
        int v16 = 134218240;
        v17 = v12;
        __int16 v18 = 1024;
        int v19 = v10;
        v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  2LL,  "LocationProvider,Failed to updateRegistrationInfoForClient %p (%d)",  &v16,  18);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationProviderAdapter updateNotification:withRegistrationInfo:forClient:]",  "%s\n",  v14);
      }
    }
  }

- (void)register:(id)a3 forNotification:(int)a4 distanceFilter:(double)a5
{
  double v13 = a5;
  uint64_t v7 = -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3);
  id v8 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  id v9 = v8;
  int v12 = a4;
  if (!v8
    || ((*(uint64_t (**)(void *, uint64_t, int *, double *))(*(void *)v8 + 224LL))(v8, v7, &v12, &v13) & 1) == 0)
  {
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10183B460);
    }
    uint64_t v10 = (os_log_s *)qword_101934838;
    if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349824;
      int v23 = v9;
      __int16 v24 = 1026;
      int v25 = v7;
      __int16 v26 = 1026;
      int v27 = a4;
      __int16 v28 = 2050;
      double v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "LocationProvider,Failed to registerForFilteredLocation %{public}p (%{public}d, %{public}d, %{public}f)",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934830 != -1) {
        dispatch_once(&qword_101934830, &stru_10183B460);
      }
      int v14 = 134349824;
      int v15 = v9;
      __int16 v16 = 1026;
      int v17 = v7;
      __int16 v18 = 1026;
      int v19 = a4;
      __int16 v20 = 2050;
      double v21 = v13;
      v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  17LL,  "LocationProvider,Failed to registerForFilteredLocation %{public}p (%{public}d, %{public}d, %{public}f)",  &v14,  34);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLLocationProviderAdapter register:forNotification:distanceFilter:]",  "%s\n",  v11);
    }
  }

- (void)start
{
  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v3 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *))(*(void *)v3 + 208LL))(v3);
  }

- (void)shutdown
{
  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v3 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *))(*(void *)v3 + 16LL))(v3);
  }

- (void)setSimulationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v5 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *, BOOL))(*(void *)v5 + 280LL))(v5, v3);
  }

- (void)sendSimulatedLocation:(id)a3
{
  v24[0] = v5;
  objc_msgSend(objc_msgSend(a3, "gnssOdometerInfo"), "deltaDistance");
  v24[1] = v6;
  objc_msgSend(objc_msgSend(a3, "gnssOdometerInfo"), "deltaDistanceAccuracy");
  v24[2] = v7;
  [a3 trustedTimestamp];
  v24[3] = v8;
  id v9 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  if (a3)
  {
    [a3 clientLocation];
  }

  else
  {
    __int128 v20 = 0u;
    memset(v21, 0, 28);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v13 = 0u;
  }

  v22[4] = v17;
  v22[5] = v18;
  v22[2] = v15;
  v22[3] = v16;
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v21 + 12);
  v22[7] = v20;
  v23[0] = v21[0];
  v22[6] = v19;
  v22[0] = v13;
  v22[1] = v14;
  (*(void (**)(void *, _OWORD *, void *))(*(void *)v9 + 264LL))(v9, v22, v24);
  uint64_t v10 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

- (void)sendSimulatedLocationUnavailable
{
  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  (*(void (**)(void *))(*(void *)v2 + 272LL))(v2);
}

- (BOOL)syncgetNotification:(const int *)a3 data:(void *)a4
{
  uint64_t v6 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, const int *, void *))(*(void *)v6 + 128LL))(v6, a3, a4);
}

- (BOOL)syncgetLocation:(id *)a3
{
  v4 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, $B98CF119BE76F9B1D55E838CB531FC09 *))(*(void *)v4 + 232LL))(v4, a3);
}

- (BOOL)syncgetLocationPrivate:(void *)a3
{
  v4 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, void *))(*(void *)v4 + 240LL))(v4, a3);
}

- (void)fetchLocationWithReply:(id)a3
{
  *(_DWORD *)v11 = 0xFFFF;
  *(_OWORD *)&v11[4] = 0uLL;
  *(_OWORD *)&v11[20] = xmmword_1012E0070;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)&v11[36] = _Q0;
  *(_OWORD *)&v11[52] = _Q0;
  *(_OWORD *)&v11[68] = _Q0;
  *(_DWORD *)&v11[84] = 0;
  *(void *)&v11[88] = 0xBFF0000000000000LL;
  __int128 v12 = 0uLL;
  LODWORD(v13) = 0;
  *(void *)((char *)&v13 + 4) = 0xBFF0000000000000LL;
  HIDWORD(v13) = 0x7FFFFFFF;
  memset(v14, 0, 25);
  id v9 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  uint64_t v10 = (*(uint64_t (**)(void *, _BYTE *))(*(void *)v9 + 248LL))(v9, v11);
  __int128 v22 = v12;
  __int128 v23 = v13;
  v24[0] = *(_OWORD *)v14;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&v14[12];
  __int128 v18 = *(_OWORD *)&v11[32];
  __int128 v19 = *(_OWORD *)&v11[48];
  __int128 v20 = *(_OWORD *)&v11[64];
  __int128 v21 = *(_OWORD *)&v11[80];
  __int128 v16 = *(_OWORD *)v11;
  __int128 v17 = *(_OWORD *)&v11[16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10047DCD0;
  v15[3] = &unk_101839070;
  (*((void (**)(id, uint64_t, id))a3 + 2))(a3, v10, [v15 copy]);
}

- (BOOL)syncgetLocationUnavailable
{
  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 256LL))(v2);
}

- (BOOL)syncgetIsSimulationEnabled
{
  return *((_BYTE *)-[CLLocationProviderAdapter locationProvider](self, "locationProvider") + 109);
}

- (id)syncgetName
{
  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  if (v2[31] < 0)
  {
    sub_1010DD48C(__p, *((void **)v2 + 1), *((void *)v2 + 2));
  }

  else
  {
    __int128 v3 = *(_OWORD *)(v2 + 8);
    uint64_t v8 = *((void *)v2 + 3);
    *(_OWORD *)__p = v3;
  }

  if (v8 >= 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  uint64_t v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4, __p[0], __p[1], v8);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

@end