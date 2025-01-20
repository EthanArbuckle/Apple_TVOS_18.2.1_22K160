@interface NIServerRangingAuthSession
- (BOOL)supportsBackgroundedClients;
- (NIRangingAuthConfiguration)configuration;
- (NIServerRangingAuthSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)configure;
- (id)disableAllServices;
- (id)generateRandomSecureKey;
- (id)lastConfiguration;
- (id)pause;
- (id)run;
- (void)invalidate;
- (void)wifiRangingRangeError:(const int *)a3;
- (void)wifiRangingRangeResults:(const void *)a3;
- (void)wifiRangingReadiness:(const int *)a3;
@end

@implementation NIServerRangingAuthSession

- (NIServerRangingAuthSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NIRangingAuthConfiguration, v13))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v28 handleFailureInMethod:a2 object:self file:@"NIServerRangingAuthSession.mm" lineNumber:49 description:@"NIServerRangingAuthSession given invalid configuration."];
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v30,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    clientQueue = v14->_clientQueue;
    v14->_clientQueue = (OS_dispatch_queue *)v15;

    v17 = (NIRangingAuthConfiguration *)[v10 copy];
    configuration = v14->_configuration;
    v14->_configuration = v17;

    if (v9) {
      [v9 protobufLogger];
    }
    else {
      __int128 v29 = 0uLL;
    }
    sub_10000EE54((uint64_t)&v14->_pbLogger, &v29);
    v19 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1))
    {
      v20 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    v22 = operator new(0x88uLL);
    v22[1] = 0LL;
    v22[2] = 0LL;
    void *v22 = off_1007B16C0;
    *(void *)&__int128 v29 = sub_10026E70C((_BYTE *)v22 + 24);
    *((void *)&v29 + 1) = v22;
    sub_10000EE54((uint64_t)&v14->_caManager, &v29);
    v23 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1))
    {
      v24 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    v26 = v14;
  }

  return v14;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000LL;
}

- (void)invalidate
{
  if (self->_wifiRangingSession.__ptr_)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerRangingAuthSession disableAllServices](self, "disableAllServices"));
    v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,Invalidate. Error: %@",  buf,  0xCu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  -[NIServerBaseSession invalidate](&v5, "invalidate");
}

- (id)disableAllServices
{
  p_wifiRangingSession = &self->_wifiRangingSession;
  ptr = self->_wifiRangingSession.__ptr_;
  if (ptr)
  {
    sub_100024930((const std::string *)ptr);
    sub_10015D394(p_wifiRangingSession);
    __int128 v8 = 0uLL;
    sub_10000EE54((uint64_t)p_wifiRangingSession, &v8);
    v4 = (std::__shared_weak_count *)*((void *)&v8 + 1);
    if (*((void *)&v8 + 1))
    {
      objc_super v5 = (unint64_t *)(*((void *)&v8 + 1) + 8LL);
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

  return 0LL;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_100391140();
  }
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  v3 = -[NIServerBaseSession resourcesManager](&v43, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ([v4 entitlementGranted:8])
  {
    objc_super v5 = self;
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serverSessionIdentifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    id v8 = v7;
    sub_1000065CC(__p, (char *)[v8 UTF8String]);
    id v9 = operator new(0x198uLL);
    id v10 = v5;
    *(void *)buf = off_1007B1710;
    v55 = v10;
    v56 = buf;
    uint64_t v11 = v10;
    v52[0] = off_1007B17A0;
    v52[1] = v11;
    v53 = v52;
    uint64_t v12 = v11;
    v50[0] = off_1007B1830;
    v50[1] = v12;
    v51 = v50;
    clientQueue = v5->_clientQueue;
    ptr = v5->_pbLogger.__ptr_;
    cntrl = v5->_pbLogger.__cntrl_;
    v47 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      uint64_t v15 = (unint64_t *)((char *)cntrl + 8);
      do
        unint64_t v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }

    v44 = v5->_caManager.__ptr_;
    v17 = v5->_caManager.__cntrl_;
    v45 = (std::__shared_weak_count *)v17;
    if (v17)
    {
      v18 = (unint64_t *)((char *)v17 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }

    sub_100024764((uint64_t)v9, (__int128 *)__p, (uint64_t)buf, (uint64_t)v52, (uint64_t)v50, clientQueue, &ptr, &v44);
    uint64_t v40 = (uint64_t)v9;
    v20 = v45;
    if (v45)
    {
      p_shared_owners = (unint64_t *)&v45->__shared_owners_;
      do
        unint64_t v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    v23 = v47;
    if (v47)
    {
      v24 = (unint64_t *)&v47->__shared_owners_;
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    v26 = v51;
    if (v51 == v50)
    {
      uint64_t v27 = 4LL;
      v26 = v50;
    }

    else
    {
      if (!v51) {
        goto LABEL_27;
      }
      uint64_t v27 = 5LL;
    }

    (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_27:
    v32 = v53;
    if (v53 == v52)
    {
      uint64_t v33 = 4LL;
      v32 = v52;
    }

    else
    {
      if (!v53) {
        goto LABEL_32;
      }
      uint64_t v33 = 5LL;
    }

    (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_32:
    v34 = v56;
    if (v56 == buf)
    {
      uint64_t v35 = 4LL;
      v34 = buf;
    }

    else
    {
      if (!v56)
      {
LABEL_37:
        sub_10015D948(&v12->_wifiRangingSession.__ptr_, &v40);
        uint64_t v36 = v40;
        uint64_t v40 = 0LL;
        if (v36)
        {
          v37 = (void *)sub_100024A24(v36);
          operator delete(v37);
        }

        v38 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,Secure Ranging Session Created",  buf,  2u);
        }

        if (v42 < 0) {
          operator delete(__p[0]);
        }

        v31 = 0LL;
        goto LABEL_44;
      }

      uint64_t v35 = 5LL;
    }

    (*(void (**)(void))(*(void *)v34 + 8 * v35))();
    goto LABEL_37;
  }

  v28 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100391168(v28, v29, v30);
  }
  NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
  v49 = @"Missing entitlement";
  uint64_t v12 = (NIServerRangingAuthSession *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v12));
LABEL_44:

  return v31;
}

- (id)run
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  v3 = -[NIServerBaseSession resourcesManager](&v47, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lifecycleSupervisor]);
  [v5 runWithConfigurationCalled];

  unint64_t v6 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  secureRangingKey = self->_secureRangingKey;
  self->_secureRangingKey = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration peerToken](self->_configuration, "peerToken"));
  id v9 = sub_100252128(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_1007D2358]);
    if (v12 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_1007D2370]);
      if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
      {
        v17 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration peerToken](self->_configuration, "peerToken"));
        peerToken = self->_peerToken;
        self->_peerToken = v17;

        objc_storeStrong((id *)&self->_peerMacAddress, v12);
        objc_storeStrong((id *)&self->_secureRangingKey, v15);
        if (self->_wifiRangingSession.__ptr_)
        {
          if (-[NIRangingAuthConfiguration isResponder](self->_configuration, "isResponder")) {
            int v19 = 2;
          }
          else {
            int v19 = 1;
          }
          sub_100024394((uint64_t)v44, self->_peerMacAddress, v19, self->_secureRangingKey);
          sub_100024E24((uint64_t)self->_wifiRangingSession.__ptr_, (uint64_t)v44);
        }

        else
        {
          v37 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_100391244(v37, v38, v39);
          }
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v4 remote]);
          NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
          v49 = @"Failed to start WiFi service. session is nil";
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
          char v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v41));
          [v40 uwbSessionDidFailWithError:v42];
        }

        v28 = 0LL;
      }

      else
      {
        uint64_t v29 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100391210(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  0LL));
      }
    }

    else
    {
      v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003911DC(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  0LL));
    }
  }

  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  0LL));
  }

  return v28;
}

- (id)pause
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerRangingAuthSession disableAllServices](self, "disableAllServices"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  v4 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lifecycleSupervisor]);
  [v6 pauseCalled];

  return v3;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
  objc_super v5 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", self->_peerToken);
  __p = 0LL;
  v58 = 0LL;
  v59 = 0LL;
  uint64_t v7 = *(void *)a3;
  uint64_t v51 = *((void *)a3 + 1);
  v52 = v5;
  if (*(void *)a3 != v51)
  {
    *(void *)&__int128 v6 = 136315138LL;
    __int128 v50 = v6;
    do
    {
      uint64_t v8 = *(void *)(v7 + 24);
      if (*(void *)(v7 + 32) != v8)
      {
        unint64_t v9 = 0LL;
        do
        {
          uint64_t v10 = v8 + 24 * v9;
          int v11 = *(_DWORD *)v10;
          uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
          uint64_t v13 = *(unsigned __int8 *)(v10 + 9);
          double v14 = sub_100023BEC(*(void *)(v10 + 16));
          float v15 = (double)v11 * 0.0149896229;
          uint64_t v16 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&uint8_t buf[4] = v15;
            __int16 v61 = 1024;
            int v62 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,Wifi RTT measurement: %f, CoreID: %i",  buf,  0x12u);
          }

          -[NSData getBytes:length:](self->_peerMacAddress, "getBytes:length:", buf, 8LL, v50);
          uint64_t v17 = *(void *)buf;
          unint64_t v18 = v12 | (unint64_t)&_mh_execute_header;
          unint64_t v19 = v13 | (unint64_t)&_mh_execute_header;
          v20 = v58;
          if (v58 >= v59)
          {
            unint64_t v22 = 0xD37A6F4DE9BD37A7LL * ((v58 - (_BYTE *)__p) >> 3);
            unint64_t v23 = v22 + 1;
            if (v22 + 1 > 0x1642C8590B21642LL) {
              sub_10001E11C();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((v59 - (_BYTE *)__p) >> 3) > v23) {
              unint64_t v23 = 0xA6F4DE9BD37A6F4ELL * ((v59 - (_BYTE *)__p) >> 3);
            }
            if (0xD37A6F4DE9BD37A7LL * ((v59 - (_BYTE *)__p) >> 3) >= 0xB21642C8590B21LL) {
              unint64_t v24 = 0x1642C8590B21642LL;
            }
            else {
              unint64_t v24 = v23;
            }
            if (v24) {
              uint64_t v25 = (char *)sub_10015F4D8((uint64_t)&v59, v24);
            }
            else {
              uint64_t v25 = 0LL;
            }
            uint64_t v26 = &v25[184 * v22];
            *(void *)uint64_t v26 = v17;
            *((double *)v26 + 1) = v14;
            *((float *)v26 + 4) = v15;
            *((_DWORD *)v26 + 5) = 2;
            v26[24] = 0;
            v26[36] = 0;
            *((void *)v26 + 6) = v18;
            *((void *)v26 + 7) = v19;
            v26[64] = 0;
            v26[72] = 0;
            *((_WORD *)v26 + 40) = 0;
            v26[88] = 0;
            v26[96] = 0;
            v26[104] = 0;
            v26[112] = 0;
            *((_DWORD *)v26 + 30) = 0;
            v26[128] = 0;
            v26[152] = 0;
            v26[160] = 0;
            v26[168] = 0;
            v26[176] = 0;
            v26[178] = 0;
            *((_DWORD *)v26 + 45) = 0;
            v28 = (char *)__p;
            uint64_t v27 = v58;
            uint64_t v29 = v26;
            if (v58 != __p)
            {
              do
              {
                __int128 v30 = *(_OWORD *)(v27 - 184);
                __int128 v31 = *(_OWORD *)(v27 - 168);
                __int128 v32 = *(_OWORD *)(v27 - 152);
                *(_OWORD *)(v29 - 136) = *(_OWORD *)(v27 - 136);
                *(_OWORD *)(v29 - 152) = v32;
                *(_OWORD *)(v29 - 168) = v31;
                *(_OWORD *)(v29 - 184) = v30;
                __int128 v33 = *(_OWORD *)(v27 - 120);
                __int128 v34 = *(_OWORD *)(v27 - 104);
                __int128 v35 = *(_OWORD *)(v27 - 88);
                *(_OWORD *)(v29 - 72) = *(_OWORD *)(v27 - 72);
                *(_OWORD *)(v29 - 88) = v35;
                *(_OWORD *)(v29 - 104) = v34;
                *(_OWORD *)(v29 - 120) = v33;
                __int128 v36 = *(_OWORD *)(v27 - 56);
                __int128 v37 = *(_OWORD *)(v27 - 40);
                __int128 v38 = *(_OWORD *)(v27 - 24);
                *((void *)v29 - 1) = *((void *)v27 - 1);
                *(_OWORD *)(v29 - 24) = v38;
                *(_OWORD *)(v29 - 40) = v37;
                *(_OWORD *)(v29 - 56) = v36;
                v29 -= 184;
                v27 -= 184;
              }

              while (v27 != v28);
              uint64_t v27 = v28;
            }

            uint64_t v21 = v26 + 184;
            __p = v29;
            v58 = v26 + 184;
            v59 = &v25[184 * v24];
            if (v27) {
              operator delete(v27);
            }
          }

          else
          {
            *(void *)v58 = *(void *)buf;
            *((double *)v20 + 1) = v14;
            *((float *)v20 + 4) = v15;
            *((_DWORD *)v20 + 5) = 2;
            v20[24] = 0;
            v20[36] = 0;
            *((void *)v20 + 6) = v18;
            *((void *)v20 + 7) = v19;
            v20[64] = 0;
            v20[72] = 0;
            *((_WORD *)v20 + 40) = 0;
            v20[88] = 0;
            v20[96] = 0;
            v20[104] = 0;
            v20[112] = 0;
            *((_DWORD *)v20 + 30) = 0;
            v20[128] = 0;
            v20[152] = 0;
            v20[160] = 0;
            v20[168] = 0;
            v20[176] = 0;
            v20[178] = 0;
            uint64_t v21 = v20 + 184;
            *((_DWORD *)v20 + 45) = 0;
          }

          v58 = v21;
          ++v9;
          uint64_t v8 = *(void *)(v7 + 24);
        }

        while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v7 + 32) - v8) >> 3) > v9);
      }

      double v39 = sub_10002895C();
      double v40 = sub_100028C98();
      v41 = (double *)operator new(0x28uLL);
      sub_1002F3CF8((uint64_t)v41, v39, v40);
      BOOL v42 = sub_1002E2ED8(v41, (__int128 **)&__p);
      objc_super v43 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        v44 = "no";
        if (v42) {
          v44 = "yes";
        }
        *(_DWORD *)buf = v50;
        *(void *)&uint8_t buf[4] = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,Sending ranging recommendation to client, shouldUnlock: %s",  buf,  0xCu);
      }

      clientQueue = (dispatch_queue_s *)self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10015E4F4;
      block[3] = &unk_1007B1690;
      block[4] = self;
      BOOL v56 = v42;
      v55 = v52;
      dispatch_async(clientQueue, block);

      (*(void (**)(double *))(*(void *)v41 + 8LL))(v41);
      v7 += 56LL;
    }

    while (v7 != v51);
  }

  id v46 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,One-shot ranging session complete, invalidating session...",  buf,  2u);
  }

  -[NIServerRangingAuthSession invalidate](self, "invalidate", (void)v50);
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___NIServerRangingAuthSession;
  id v47 = -[NIServerBaseSession invalidationHandler](&v53, "invalidationHandler");
  NSErrorUserInfoKey v48 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10008LL,  0LL));
  ((void (**)(void, void *))v48)[2](v48, v49);

  if (__p)
  {
    v58 = (char *)__p;
    operator delete(__p);
  }
}

- (void)wifiRangingRangeError:(const int *)a3
{
  if (v16 >= 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  __int128 v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003912B8(&v16, __p, v6);
  }
  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  unint64_t v18 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v7));

  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015E790;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v10 = v8;
  id v14 = v10;
  dispatch_async(clientQueue, block);
  int v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,One-shot ranging session error, invalidating session...",  v12,  2u);
  }

  if (v16 < 0) {
    operator delete(__p[0]);
  }
}

- (void)wifiRangingReadiness:(const int *)a3
{
  v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_100025844(*a3, __p);
    if (v7 >= 0) {
      objc_super v5 = __p;
    }
    else {
      objc_super v5 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-secure-ranging,Readiness update: %s",  buf,  0xCu);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (id)generateRandomSecureKey
{
  int v2 = 64;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 64LL));
  while (!SecRandomCopyBytes(kSecRandomDefault, 1uLL, &bytes))
  {
    [v3 appendBytes:&bytes length:1];
    if (!--v2)
    {
      id v4 = v3;
      goto LABEL_6;
    }
  }

  id v4 = 0LL;
LABEL_6:

  return v4;
}

- (BOOL)supportsBackgroundedClients
{
  return 1;
}

- (NIRangingAuthConfiguration)configuration
{
  return (NIRangingAuthConfiguration *)objc_getProperty(self, a2, 136LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 9) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  return self;
}

@end