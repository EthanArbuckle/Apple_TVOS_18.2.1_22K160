@interface CLDaemonCircularGeographicCondition
- (BOOL)isAuthorized;
- (BOOL)valid;
- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9;
- (unint64_t)diagnosticMaskIfNonFunctional;
- (void)dealloc;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLDaemonCircularGeographicCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  BOOL v9 = a8;
  [a3 center];
  double v17 = v16;
  double v19 = v18;
  [a3 radius];
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CLDaemonCircularGeographicCondition;
  v21 = -[CLDaemonCircularGeographicCondition initWithCenter:radius:](&v30, "initWithCenter:radius:", v17, v19, v20);
  if (v21)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018775C8);
    }
    v22 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      -[CLDaemonCircularGeographicCondition center](v21, "center");
      uint64_t v24 = v23;
      -[CLDaemonCircularGeographicCondition center](v21, "center");
      uint64_t v26 = v25;
      -[CLDaemonCircularGeographicCondition radius](v21, "radius");
      *(_DWORD *)buf = 68290563;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      __int16 v35 = 2049;
      uint64_t v36 = v24;
      __int16 v37 = 2049;
      uint64_t v38 = v26;
      __int16 v39 = 2050;
      uint64_t v40 = v27;
      __int16 v41 = 2114;
      id v42 = a7;
      __int16 v43 = 1026;
      BOOL v44 = v9;
      __int16 v45 = 2050;
      v46 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#circularGeographicCondition created, lat:%{private}.08f, lon:%{private}. 08f, radius:%{public}f, identifier:%{public, location:escape_only}@, removePersistingFenceFromMo nitoring:%{public}hhd, self:%{public}p}",  buf,  0x4Au);
    }

    -[CLDaemonCircularGeographicCondition setAuthorizationContext:](v21, "setAuthorizationContext:", a5);
    -[CLDaemonCircularGeographicCondition setOnConditionUpdateCallbackHandler:]( v21,  "setOnConditionUpdateCallbackHandler:",  a9);
    -[CLDaemonCircularGeographicCondition setUniverse:](v21, "setUniverse:", a6);
    -[CLDaemonCircularGeographicCondition setCkp:](v21, "setCkp:", a4);
    -[CLDaemonCircularGeographicCondition setLastMonitoringState:](v21, "setLastMonitoringState:", 0LL);
    v28 = (CLFenceManagerProtocol *) objc_msgSend( objc_msgSend(a6, "vendor"),  "proxyForService:",  @"CLFenceManager");
    v21->_fenceManagerProxy = v28;
    -[CLFenceManagerProtocol registerDelegate:inSilo:]( v28,  "registerDelegate:inSilo:",  v21,  objc_msgSend(-[CLDaemonCircularGeographicCondition universe](v21, "universe"), "silo"));
    -[CLFenceManagerProtocol setDelegateEntityName:]( v21->_fenceManagerProxy,  "setDelegateEntityName:",  -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-DaemonCircularGeographicCondition",  a7),  "UTF8String"));
    -[CLDaemonCircularGeographicCondition setValid:](v21, "setValid:", 1LL);
    -[CLDaemonCircularGeographicCondition setIdentifier:](v21, "setIdentifier:", a7);
    if (v9) {
      -[CLDaemonCircularGeographicCondition stopMonitoring](v21, "stopMonitoring");
    }
    else {
      -[CLDaemonCircularGeographicCondition startMonitoring](v21, "startMonitoring");
    }
  }

  return v21;
}

- (void)dealloc
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018775C8);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2050;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#circularGeographicCondition dealloc, self:%{public}p}",  buf,  0x1Cu);
  }

  -[CLDaemonCircularGeographicCondition stopMonitoring](self, "stopMonitoring");

  self->_fenceManagerProxy = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLDaemonCircularGeographicCondition;
  -[CLDaemonCircularGeographicCondition dealloc](&v4, "dealloc");
}

- (BOOL)isAuthorized
{
  return objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  524290);
}

- (void)startMonitoring
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018775C8);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v40 = 2082;
    __int16 v41 = "";
    __int16 v42 = 2050;
    *(void *)__int16 v43 = self;
    *(_WORD *)&v43[8] = 2114;
    *(void *)&v43[10] = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
    __int16 v44 = 1026;
    unsigned int v45 = -[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized");
    __int16 v46 = 1026;
    *(_DWORD *)v47 = -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #circularGeographicCondition startMonitoring, self:%{public}p, name: %{public, location:escape_only}@, isAuthorized:%{public}d, isMonitoring:%{public}d}",  buf,  0x32u);
  }

  if ((-[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring") & 1) == 0)
  {
    if (-[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized"))
    {
      -[CLDaemonCircularGeographicCondition setIsMonitoring:](self, "setIsMonitoring:", 1LL);
      sub_1010DDBC0( v29,  (char *)objc_msgSend( objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey"),  "UTF8String"));
      -[CLFenceManagerProtocol register:forNotification:registrationInfo:]( self->_fenceManagerProxy,  "register:forNotification:registrationInfo:",  self,  8LL,  sub_100BE9A58((uint64_t)v29));
      -[CLFenceManagerProtocol register:forNotification:registrationInfo:]( self->_fenceManagerProxy,  "register:forNotification:registrationInfo:",  self,  1LL,  sub_100BE9A58((uint64_t)v29));
      -[CLFenceManagerProtocol register:forNotification:registrationInfo:]( self->_fenceManagerProxy,  "register:forNotification:registrationInfo:",  self,  0LL,  sub_100BE9A58((uint64_t)v29));
      -[CLFenceManagerProtocol register:forNotification:registrationInfo:]( self->_fenceManagerProxy,  "register:forNotification:registrationInfo:",  self,  4LL,  sub_100BE9A58((uint64_t)v29));
      -[CLFenceManagerProtocol register:forNotification:registrationInfo:]( self->_fenceManagerProxy,  "register:forNotification:registrationInfo:",  self,  7LL,  sub_100BE9A58((uint64_t)v29));
      sub_1010DDBC0( &v27,  (char *)objc_msgSend( objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey"),  "UTF8String"));
      sub_1010DDBC0( &v25,  (char *)objc_msgSend(-[CLDaemonCircularGeographicCondition identifier](self, "identifier"), "UTF8String"));
      sub_1010DDBC0(&v23, "");
      -[CLDaemonCircularGeographicCondition center](self, "center");
      -[CLDaemonCircularGeographicCondition center](self, "center");
      -[CLDaemonCircularGeographicCondition radius](self, "radius");
      sub_1010DDBC0(&__p, "");
      sub_100922EB8(buf);
      if (v22 < 0) {
        operator delete(__p);
      }
      if (v24 < 0) {
        operator delete(v23);
      }
      if (v26 < 0) {
        operator delete(v25);
      }
      if (v28 < 0) {
        operator delete(v27);
      }
      uint64_t v49 = 259LL;
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018775C8);
      }
      objc_super v4 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        sub_100923668((uint64_t)buf, &v20);
        v5 = (v20.__r_.__value_.__s.__size_ & 0x80u) == 0
           ? &v20
           : (std::stringbuf::string_type *)v20.__r_.__value_.__r.__words[0];
        *(_DWORD *)v31 = 68289539;
        int v32 = 0;
        __int16 v33 = 2082;
        v34 = "";
        __int16 v35 = 2081;
        uint64_t v36 = v5;
        __int16 v37 = 2050;
        uint64_t v38 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #circularGeographicCondition startMonitoring, fence:%{private, location: escape_only}s, self:%{public}p}",  v31,  0x26u);
      }

      fenceManagerProxy = self->_fenceManagerProxy;
      sub_1002718F0((char *)__dst, (__int128 *)buf);
      -[CLFenceManagerProtocol addFence:](fenceManagerProxy, "addFence:", sub_10026ECB8((__int128 *)__dst));
      if (v18)
      {
        double v19 = v18;
        operator delete(v18);
      }

      if (v16 < 0) {
        operator delete(v15);
      }
      if (v14 < 0) {
        operator delete(v13);
      }
      if (v12 < 0) {
        operator delete(v11);
      }
      if (v10 < 0) {
        operator delete(__dst[0]);
      }
      if (v53)
      {
        v54 = v53;
        operator delete(v53);
      }

      if (v51 < 0) {
        operator delete(v50);
      }
      if (v48 < 0) {
        operator delete(*(void **)&v47[2]);
      }
      if ((v47[1] & 0x80000000) != 0) {
        operator delete(*(void **)&v43[4]);
      }
      if ((v43[3] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (v30 < 0) {
        operator delete(v29[0]);
      }
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018775C8);
      }
      __int16 v7 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        __int16 v40 = 2082;
        __int16 v41 = "";
        __int16 v42 = 2050;
        *(void *)__int16 v43 = self;
        *(_WORD *)&v43[8] = 2114;
        *(void *)&v43[10] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #circularGeographicCondition startMonitoring not authorized, self:%{pu blic}p, name:%{public, location:escape_only}@}",  buf,  0x26u);
      }
    }
  }

- (void)stopMonitoring
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018775C8);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v23 = 2082;
    char v24 = "";
    __int16 v25 = 2050;
    *(void *)char v26 = self;
    *(_WORD *)&v26[8] = 2114;
    *(void *)&v26[10] = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
    __int16 v27 = 1026;
    unsigned int v28 = -[CLDaemonCircularGeographicCondition isAuthorized](self, "isAuthorized");
    __int16 v29 = 1026;
    *(_DWORD *)char v30 = -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #circularGeographicCondition stopMonitoring, self:%{public}p, name:% {public, location:escape_only}@, isAuthorized:%{public}d, isMonitoring:%{public}d}",  buf,  0x32u);
  }

  if (-[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring"))
  {
    sub_1010DDBC0( v20,  (char *)objc_msgSend( objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey"),  "UTF8String"));
    sub_1010DDBC0( v18,  (char *)objc_msgSend(-[CLDaemonCircularGeographicCondition identifier](self, "identifier"), "UTF8String"));
    sub_1010DDBC0(__p, "");
    sub_100922A7C((char *)buf, (uint64_t)v20, (uint64_t)v18, (uint64_t)__p);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
    fenceManagerProxy = self->_fenceManagerProxy;
    sub_1002718F0((char *)v5, (__int128 *)buf);
    -[CLFenceManagerProtocol removeFence:](fenceManagerProxy, "removeFence:", sub_10026ECB8((__int128 *)v5));
    if (v14)
    {
      v15 = v14;
      operator delete(v14);
    }

    if (v12 < 0) {
      operator delete(v11);
    }
    if (v10 < 0) {
      operator delete(v9);
    }
    if (v8 < 0) {
      operator delete(v7);
    }
    if (v6 < 0) {
      operator delete(v5[0]);
    }
    -[CLFenceManagerProtocol unregister:forNotification:]( self->_fenceManagerProxy,  "unregister:forNotification:",  self,  8LL);
    -[CLFenceManagerProtocol unregister:forNotification:]( self->_fenceManagerProxy,  "unregister:forNotification:",  self,  1LL);
    -[CLFenceManagerProtocol unregister:forNotification:]( self->_fenceManagerProxy,  "unregister:forNotification:",  self,  0LL);
    -[CLFenceManagerProtocol unregister:forNotification:]( self->_fenceManagerProxy,  "unregister:forNotification:",  self,  4LL);
    -[CLFenceManagerProtocol unregister:forNotification:]( self->_fenceManagerProxy,  "unregister:forNotification:",  self,  7LL);
    -[CLDaemonCircularGeographicCondition setIsMonitoring:](self, "setIsMonitoring:", 0LL);
    -[CLDaemonCircularGeographicCondition setLastMonitoringState:](self, "setLastMonitoringState:", 0LL);
    -[CLDaemonCircularGeographicCondition setRefinement:](self, "setRefinement:", 0LL);
    if (v35)
    {
      uint64_t v36 = v35;
      operator delete(v35);
    }

    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(*(void **)&v30[2]);
    }
    if ((v30[1] & 0x80000000) != 0) {
      operator delete(*(void **)&v26[4]);
    }
    if ((v26[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
  }

- (unint64_t)diagnosticMaskIfNonFunctional
{
  if ((int)objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "inUseLevel") <= 0) {
    unint64_t v3 = 16LL
  }
       * (objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "transientAwareRegistrationResult") != 0);
  else {
    unint64_t v3 = 0LL;
  }
  if (!objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceType:",  12)) {
    v3 |= 0x40uLL;
  }
  unint64_t v4 = v3 | 0x1000;
  if (objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  2)) {
    v3 |= 0x1000uLL;
  }
  if ((objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "isAuthorizedForServiceTypeMask:",  0x100000) & 1) == 0 && objc_msgSend( -[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"),  "transientAwareRegistrationResult") == 4)
  {
    return v4;
  }

  return v3;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  char v6 = (char *)sub_100668E3C(a4);
  int v7 = *((_DWORD *)v6 + 163);
  id v8 = -[CLDaemonCircularGeographicCondition identifier](self, "identifier");
  __int16 v9 = v6 + 24;
  if (v6[47] < 0) {
    __int16 v9 = (void *)*v9;
  }
  if (objc_msgSend( v8,  "isEqualToString:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9)))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018775C8);
    }
    char v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      sub_100923668((uint64_t)v6, &__p);
      v11 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
          ? &__p
          : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 68290051;
      int v20 = 0;
      __int16 v21 = 2082;
      char v22 = "";
      __int16 v23 = 2050;
      char v24 = (CLDaemonCircularGeographicCondition *)a3;
      __int16 v25 = 2081;
      uint64_t v26 = (uint64_t)v11;
      __int16 v27 = 2050;
      unsigned int v28 = self;
      __int16 v29 = 2049;
      uint64_t v30 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#circularGeographicCondition received notification, notification:%{public, location :CLFenceManager_Type::Notification}lld, fence:%{private, location:escape_only}s, self:%{public}p,  status:%{private, location:CLFenceManager_Type::FenceStatus}lld}",  buf,  0x3Au);
    }

    CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(*((CLLocationDegrees *)v6 + 9), *((CLLocationDegrees *)v6 + 10));
    id v13 =  -[CLCircularGeographicCondition initWithCenter:radius:]( objc_alloc(&OBJC_CLASS___CLCircularGeographicCondition),  "initWithCenter:radius:",  v12.latitude,  v12.longitude,  *((double *)v6 + 11));
    uint64_t v14 = 2LL;
    if (a3 != 1 && v7 != 1)
    {
      uint64_t v14 = 1LL;
      if (a3)
      {
        if (v7)
        {
          if (a3 == 4 || a3 == 7) {
            uint64_t v14 = 3LL;
          }
          else {
            uint64_t v14 = 0LL;
          }
        }
      }
    }

    if (-[CLDaemonCircularGeographicCondition isEqual:](self, "isEqual:", v13)
      && -[CLDaemonCircularGeographicCondition isMonitoring](self, "isMonitoring"))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018775C8);
      }
      char v16 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        int v20 = 0;
        __int16 v21 = 2082;
        char v22 = "";
        __int16 v23 = 2113;
        char v24 = self;
        __int16 v25 = 2050;
        uint64_t v26 = v14;
        __int16 v27 = 2050;
        unsigned int v28 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#circularGeographicCondition received state update, condition:%{private, location :escape_only}@, monitoringState:%{public, location:CLMonitoringState}lld, self:%{public}p}",  buf,  0x30u);
      }

      -[CLDaemonCircularGeographicCondition setLastMonitoringState:](self, "setLastMonitoringState:", v14);
      if (-[CLDaemonCircularGeographicCondition onConditionUpdateCallbackHandler]( self,  "onConditionUpdateCallbackHandler"))
      {
        char v17 = (void (**)(id, id, CLDaemonCircularGeographicCondition *, uint64_t, void))-[CLDaemonCircularGeographicCondition onConditionUpdateCallbackHandler](self, "onConditionUpdateCallbackHandler");
        v17[2]( v17,  -[CLDaemonCircularGeographicCondition monitoredIdentifier](self, "monitoredIdentifier"),  self,  v14,  0LL);
      }
    }
  }

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end