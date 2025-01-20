@interface CLSignificantVisitManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)armed;
- (BOOL)clientInterestStoreGetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int *)a5;
- (BOOL)clientInterestStoreSetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int)a5;
- (BOOL)interestForClientKey:(const char *)a3 outInterest:(int *)a4;
- (BOOL)interestTypeForClientKey:(const char *)a3 outType:(int *)a4;
- (BOOL)isClientWithKeyInterested:(id)a3;
- (BOOL)leeching;
- (BOOL)monitoring;
- (CLClientAuthorizationCacheProtocol)clientAuthorizationCache;
- (CLClientManagerPublicProtocol)clientManager;
- (CLRoutineMonitorServiceProtocol)routineMonitor;
- (CLSignificantVisitManager)init;
- (NSMutableArray)recentVisits;
- (id).cxx_construct;
- (id)authorizationDateForClientWithKey:(id)a3;
- (id)keyForClient:(id)a3;
- (unint64_t)currentJournalIdentifier;
- (void)actOnPendingDeleteForClientKey:(id)a3;
- (void)beginService;
- (void)checkForMonitoring;
- (void)clientAuthDate;
- (void)clientInterest;
- (void)connectClient:(id)a3 withKey:(id)a4;
- (void)deliverVisit:(id)a3 toClient:(id)a4;
- (void)disconnectClient:(id)a3;
- (void)endService;
- (void)ensureMonitoringWithType:(int)a3;
- (void)ensureStop;
- (void)flushAll;
- (void)flushAuthDates;
- (void)flushInterest;
- (void)migrateClientInterestData;
- (void)notifyClientsOfVisit:(id)a3;
- (void)onAuthDateStoreTimer;
- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onInterestStoreTimer;
- (void)onVisit:(id)a3;
- (void)performBlockWhenArmed:(id)a3;
- (void)removeInterestForClientKey:(id)a3;
- (void)removeOldVisits;
- (void)sendVisitsToClient:(id)a3;
- (void)setArmed:(BOOL)a3;
- (void)setClientAuthDate:(void *)a3;
- (void)setClientAuthorizationCache:(id)a3;
- (void)setClientInterest:(void *)a3;
- (void)setClientManager:(id)a3;
- (void)setCurrentJournalIdentifier:(unint64_t)a3;
- (void)setLeeching:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setRecentVisits:(id)a3;
- (void)setRoutineMonitor:(id)a3;
- (void)settingsDidChange:(id)a3;
- (void)simulateVisit:(id)a3;
- (void)startMonitoringSignificantVisitsForClient:(id)a3 type:(int)a4;
- (void)stopMonitoringSignificantVisitsForClient:(id)a3;
@end

@implementation CLSignificantVisitManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101996E68 != -1) {
    dispatch_once(&qword_101996E68, &stru_101840CB8);
  }
  return (id)qword_101996E60;
}

+ (BOOL)isSupported
{
  return 0;
}

- (CLSignificantVisitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSignificantVisitManager;
  return -[CLSignificantVisitManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSignificantVisitManagerProtocol,  &OBJC_PROTOCOL___CLSignificantVisitManagerClientProtocol);
}

- (void)beginService
{
  objc_super v3 = (CLSettingsMirror *)-[CLSettingsMirror initInUniverse:]( objc_alloc(&OBJC_CLASS___CLSettingsMirror),  "initInUniverse:",  -[CLSignificantVisitManager universe](self, "universe"));
  self->fSettings = v3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100591840;
  v28[3] = &unk_10183F200;
  v28[4] = self;
  -[CLSettingsMirror setSettingsChangeHandler:](v3, "setSettingsChangeHandler:", v28);
  sub_100583844((uint64_t)sub_10059184C, (uint64_t)self, -[CLSignificantVisitManager universe](self, "universe"), buf);
  v4 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v6 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  memset(&v27, 0, sizeof(v27));
  std::string::operator=(&v27, &stru_101996E48);
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_10120E548((uint64_t)&v27)];
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:1 registrationInfo:0];
  if (-[CLSettingsMirror BOOLForKey:defaultValue:]( self->fSettings,  "BOOLForKey:defaultValue:",  @"CLSignificantVisitManagerMemoryOnlyPersistence",  0LL)) {
    int v7 = 3;
  }
  else {
    int v7 = 0;
  }
  v8 = operator new(0x80uLL);
  sub_10030ABE8( (uint64_t)v8,  (uint64_t)-[CLSignificantVisitManager universe](self, "universe"),  "significantVisitInterest",  1,  v7,  2);
  -[CLSignificantVisitManager setClientInterest:](self, "setClientInterest:", v8);
  v9 = operator new(0x80uLL);
  sub_10030ABE8( (uint64_t)v9,  (uint64_t)-[CLSignificantVisitManager universe](self, "universe"),  "significantVisitAuth",  1,  v7,  2);
  -[CLSignificantVisitManager setClientAuthDate:](self, "setClientAuthDate:", v9);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100591928;
  v26[3] = &unk_10181A288;
  v26[4] = self;
  sub_10030B614( (uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"),  &dbl_1012F11F8,  (uint64_t)v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100591990;
  v25[3] = &unk_10181A288;
  v25[4] = self;
  sub_10030B614( (uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"),  &dbl_1012F11F8,  (uint64_t)v25);
  -[CLSignificantVisitManager setRecentVisits:]( self,  "setRecentVisits:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[CLSignificantVisitManager setClientAuthorizationCache:]( self,  "setClientAuthorizationCache:",  objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "vendor"),  "proxyForService:forClient:",  @"CLClientAuthorizationCache",  @"CLSignificantVisitManager"));
  -[CLSignificantVisitManager setRoutineMonitor:]( self,  "setRoutineMonitor:",  objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "vendor"),  "proxyForService:forClient:",  @"CLRoutineMonitor",  @"CLSignificantVisitManager"));
  -[CLSignificantVisitManager setClientManager:]( self,  "setClientManager:",  objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "vendor"),  "proxyForService:forClient:",  @"CLClientManager",  @"CLSignificantVisitManager"));
  -[CLSignificantVisitManager migrateClientInterestData](self, "migrateClientInterestData");
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  sub_1002A6CEC((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), &v22);
  uint64_t v11 = v22;
  uint64_t v12 = v23;
  if (v22 != v23)
  {
    *(void *)&__int128 v10 = 68289282LL;
    __int128 v19 = v10;
    do
    {
      int v21 = 0;
      uint64_t v13 = v11;
      if (-[CLSignificantVisitManager interestForClientKey:outInterest:]( self,  "interestForClientKey:outInterest:",  v13,  &v21,  v19))
      {
        if (v21 == 2)
        {
          uint64_t v14 = v11;
          -[CLSignificantVisitManager actOnPendingDeleteForClientKey:]( self,  "actOnPendingDeleteForClientKey:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
        }
      }

      else
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840D40);
        }
        v15 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
        {
          uint64_t v16 = v11;
          *(void *)buf = v19;
          __int16 v30 = 2082;
          v31 = "";
          __int16 v32 = 2082;
          uint64_t v33 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv key not found after we were told it was there, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101840D40);
          }
        }

        v17 = (os_log_s *)qword_101934988;
        if (os_signpost_enabled((os_log_t)qword_101934988))
        {
          uint64_t v18 = v11;
          *(void *)buf = v19;
          __int16 v30 = 2082;
          v31 = "";
          __int16 v32 = 2082;
          uint64_t v33 = v18;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv key not found after we were told it was there",  "{msg%{public}.0s:#slv key not found after we were told it was there, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
        }
      }

      v11 += 24LL;
    }

    while (v11 != v12);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1005919F8;
  v20[3] = &unk_10181A288;
  v20[4] = self;
  -[CLClientAuthorizationCacheProtocol notifyWhenCacheIsPopulatedWithReply:]( -[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"),  "notifyWhenCacheIsPopulatedWithReply:",  v20);
  *(void *)buf = &v22;
  sub_1000129D4((void ***)buf);
}

- (void)endService
{
  objc_super v3 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  (*(void (**)(void *))(*(void *)v3 + 960LL))(v3);
  v4 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  (*(void (**)(void *))(*(void *)v4 + 960LL))(v4);
  -[CLSignificantVisitManager flushAll](self, "flushAll");
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v6 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  if (v6) {
    (*(void (**)(void *))(*(void *)v6 + 8LL))(v6);
  }
  -[CLSignificantVisitManager setClientInterest:](self, "setClientInterest:", 0LL);
  int v7 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  if (v7) {
    (*(void (**)(void *))(*(void *)v7 + 8LL))(v7);
  }
  -[CLSignificantVisitManager setClientAuthDate:](self, "setClientAuthDate:", 0LL);
  -[CLSignificantVisitManager setClientAuthorizationCache:](self, "setClientAuthorizationCache:", 0LL);
  -[CLSignificantVisitManager setRecentVisits:](self, "setRecentVisits:", 0LL);
  -[CLSignificantVisitManager setRoutineMonitor:](self, "setRoutineMonitor:", 0LL);
  p_pair1 = &self->_clientToKey.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)self->_clientToKey.__tree_.__begin_node_;
  if (begin_node != &self->_clientToKey.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v11 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)left->__value_.__left_;
        }

        while (left);
      }

      else
      {
        do
        {
          uint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v12 = v11->__value_.__left_ == begin_node;
          begin_node = v11;
        }

        while (!v12);
      }

      begin_node = v11;
    }

    while (v11 != p_pair1);
  }

  sub_100008390((uint64_t)&self->_clientToKey, (void *)self->_clientToKey.__tree_.__pair1_.__value_.__left_);
  self->_clientToKey.__tree_.__pair1_.__value_.__left_ = 0LL;
  self->_clientToKey.__tree_.__pair3_.__value_ = 0LL;
  self->_clientToKey.__tree_.__begin_node_ = p_pair1;
}

- (void)flushAuthDates
{
  v2 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  if (((*(uint64_t (**)(void *))(*(void *)v2 + 944LL))(v2) & 1) == 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    objc_super v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#slv Could not store client auth dates}",  (uint8_t *)&v5,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    v4 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Could not store client auth dates",  "{msg%{public}.0s:#slv Could not store client auth dates}",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)flushInterest
{
  v2 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  if (((*(uint64_t (**)(void *))(*(void *)v2 + 944LL))(v2) & 1) == 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    objc_super v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#slv Could not store significant location visit clients}",  (uint8_t *)&v5,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    v4 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Could not store significant location visit clients",  "{msg%{public}.0s:#slv Could not store significant location visit clients}",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)flushAll
{
}

- (void)ensureMonitoringWithType:(int)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840D40);
  }
  int v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 68289794;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 1026;
    int v19 = a3;
    __int16 v20 = 1026;
    unsigned int v21 = -[CLSignificantVisitManager monitoring](self, "monitoring");
    __int16 v22 = 1026;
    unsigned int v23 = -[CLSignificantVisitManager leeching](self, "leeching");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv ensureMonitoringWithType, type:%{public}d, monitoring:%{public}hhd, leechi ng:%{public}hhd}",  (uint8_t *)&v14,  0x24u);
  }

  if (a3 == 1)
  {
    if (!-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      uint64_t v11 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:]( v11,  "startLeechingVisitsForClient:",  CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 1LL);
      if (-[CLSignificantVisitManager monitoring](self, "monitoring"))
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840D40);
        }
        BOOL v12 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          v17 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Currently monitoring. Stop monitoring and switch to leeching}",  (uint8_t *)&v14,  0x12u);
        }

        uint64_t v13 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
        -[CLRoutineMonitorServiceProtocol stopMonitoringVisitsForClient:]( v13,  "stopMonitoringVisitsForClient:",  CLISP_ME_TOKEN);
        -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 0LL);
      }

      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      v9 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        __int128 v10 = "{msg%{public}.0s:#slv Begin leeching}";
        goto LABEL_29;
      }
    }
  }

  else if (!a3 && !-[CLSignificantVisitManager monitoring](self, "monitoring"))
  {
    int v6 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
    -[CLRoutineMonitorServiceProtocol startMonitoringVisitsForClient:]( v6,  "startMonitoringVisitsForClient:",  CLISP_ME_TOKEN);
    -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 1LL);
    if (-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      __int16 v7 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Currently leeching. Stop leeching and switch to monitoring}",  (uint8_t *)&v14,  0x12u);
      }

      v8 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( v8,  "stopLeechingVisitsForClient:",  CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 0LL);
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int128 v10 = "{msg%{public}.0s:#slv Begin monitoring}";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x12u);
    }
  }

- (void)ensureStop
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840D40);
  }
  objc_super v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    BOOL v12 = "";
    __int16 v13 = 1026;
    unsigned int v14 = -[CLSignificantVisitManager monitoring](self, "monitoring");
    __int16 v15 = 1026;
    unsigned int v16 = -[CLSignificantVisitManager leeching](self, "leeching");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv ensureStop, monitoring:%{public}hhd, leeching:%{public}hhd}",  buf,  0x1Eu);
  }

  if (-[CLSignificantVisitManager monitoring](self, "monitoring")
    || -[CLSignificantVisitManager leeching](self, "leeching"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    v4 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#slv Stop monitoring or leeching", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      v8[0] = 0;
      __int16 v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#slv Stop monitoring or leeching",  v8,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSignificantVisitManager ensureStop]", "%s\n", v7);
    }

    -[CLSignificantVisitManager setRecentVisits:]( self,  "setRecentVisits:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (-[CLSignificantVisitManager monitoring](self, "monitoring"))
    {
      int v5 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopMonitoringVisitsForClient:]( v5,  "stopMonitoringVisitsForClient:",  CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 0LL);
    }

    if (-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      int v6 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:]( v6,  "stopLeechingVisitsForClient:",  CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 0LL);
    }
  }

- (void)removeOldVisits
{
}

- (BOOL)isClientWithKeyInterested:(id)a3
{
  int v10 = 0;
  if (!-[CLSignificantVisitManager interestForClientKey:outInterest:]( self,  "interestForClientKey:outInterest:",  [a3 UTF8String],  &v10)
    || v10)
  {
    LOBYTE(v7) = v10 == 1;
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    v4 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      id v5 = [a3 UTF8String];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      unsigned int v14 = "";
      __int16 v15 = 2082;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Client in store with no interest, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    int v6 = (os_log_s *)qword_101934988;
    BOOL v7 = os_signpost_enabled((os_log_t)qword_101934988);
    if (v7)
    {
      id v8 = [a3 UTF8String];
      *(_DWORD *)buf = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      unsigned int v14 = "";
      __int16 v15 = 2082;
      id v16 = v8;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Client in store with no interest",  "{msg%{public}.0s:#slv Client in store with no interest, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)sendVisitsToClient:(id)a3
{
  id v5 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v5)
  {
    int v6 = v5;
    if (-[CLSignificantVisitManager isClientWithKeyInterested:](self, "isClientWithKeyInterested:", v5))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      BOOL v7 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 68289282LL;
        __int16 v22 = 2082;
        unsigned int v23 = "";
        __int16 v24 = 2082;
        id v25 = [v6 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#slv Client is interested, key:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x1Cu);
      }

      -[CLSignificantVisitManager removeOldVisits](self, "removeOldVisits");
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v8 = -[CLSignificantVisitManager recentVisits](self, "recentVisits", 0LL);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            -[CLSignificantVisitManager deliverVisit:toClient:]( self,  "deliverVisit:toClient:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  a3);
          }

          id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        }

        while (v10);
      }
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      __int16 v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 68289282LL;
        __int16 v22 = 2082;
        unsigned int v23 = "";
        __int16 v24 = 2082;
        id v25 = [v6 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#slv Client has no interest, key:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x1Cu);
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    __int16 v13 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289026LL;
      __int16 v22 = 2082;
      unsigned int v23 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Can't deliver visit to client that hasn't connected}",  (uint8_t *)&buf,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    unsigned int v14 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      uint64_t buf = 68289026LL;
      __int16 v22 = 2082;
      unsigned int v23 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Can't deliver visit to client that hasn't connected",  "{msg%{public}.0s:#slv Can't deliver visit to client that hasn't connected}",  (uint8_t *)&buf,  0x12u);
    }
  }

- (void)deliverVisit:(id)a3 toClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100592C5C;
  v7[3] = &unk_10181A2D8;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  -[CLSignificantVisitManager performBlockWhenArmed:](self, "performBlockWhenArmed:", v7);
}

- (void)performBlockWhenArmed:(id)a3
{
  if (-[CLSignificantVisitManager armed](self, "armed")) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else {
    -[CLClientAuthorizationCacheProtocol notifyWhenCacheIsPopulatedWithReply:]( -[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"),  "notifyWhenCacheIsPopulatedWithReply:",  a3);
  }
}

- (id)keyForClient:(id)a3
{
  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return 0LL;
  }
  p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
  do
  {
    unint64_t value = left->_clientToKey.__tree_.__pair3_.__value_;
    BOOL v8 = value >= (unint64_t)a3;
    else {
      p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
    }
    if (v8) {
      p_pair1 = left;
    }
    left = *p_clientManagerClient;
  }

  while (*p_clientManagerClient);
  if (p_pair1 != (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
    && p_pair1->_clientToKey.__tree_.__pair3_.__value_ <= (unint64_t)a3)
  {
    return p_pair1->fSettings;
  }

  else
  {
    return 0LL;
  }

- (void)connectClient:(id)a3 withKey:(id)a4
{
  id v15 = a3;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840D40);
  }
  BOOL v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v17 = 2082;
    __int128 v18 = "";
    __int16 v19 = 2082;
    id v20 = [a4 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#slv Client is connecting, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
    do
    {
      unint64_t value = left->_clientToKey.__tree_.__pair3_.__value_;
      BOOL v11 = value >= (unint64_t)a3;
      else {
        p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
      }
      if (v11) {
        p_pair1 = left;
      }
      left = *p_clientManagerClient;
    }

    while (*p_clientManagerClient);
    if (p_pair1 != (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
      && p_pair1->_clientToKey.__tree_.__pair3_.__value_ <= (unint64_t)a3)
    {
    }
  }

  *(void *)uint64_t buf = &v15;
  sub_100595AA4((uint64_t **)&self->_clientToKey, (unint64_t *)&v15, (uint64_t)&unk_1012CF090, (uint64_t **)buf)[5] = (uint64_t)a4;
  id v13 = v15;
  id v14 = a4;
  -[CLSignificantVisitManager sendVisitsToClient:](self, "sendVisitsToClient:", v15);
}

- (void)startMonitoringSignificantVisitsForClient:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  id v7 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v7)
  {
    BOOL v8 = v7;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    id v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      __int16 v16 = 2082;
      v17[0] = [v8 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Client start, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }

    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:]( self,  "clientInterestStoreSetValueForClientKey:parameterKey:value:",  [v8 UTF8String],  "interest",  1);
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:]( self,  "clientInterestStoreSetValueForClientKey:parameterKey:value:",  [v8 UTF8String],  "type",  v4);
    -[CLSignificantVisitManager flushInterest](self, "flushInterest");
    if (-[CLSignificantVisitManager authorizationDateForClientWithKey:](self, "authorizationDateForClientWithKey:", v8))
    {
      sub_1010DDBC0(&__p, (char *)[v8 UTF8String]);
      sub_100FE3188(&__p, (uint64_t)buf);
      sub_100575260((uint64_t)self->_clientManagerClient.__ptr_.__value_, (__int128 *)buf, 1LL);
      -[CLSignificantVisitManager checkForMonitoring](self, "checkForMonitoring");
      if (v28 < 0) {
        operator delete(v27);
      }
      if (v26 < 0) {
        operator delete(v25);
      }
      if (v24 < 0) {
        operator delete(v23);
      }
      if (v22 < 0) {
        operator delete(v21);
      }
      if (v20 < 0) {
        operator delete(v19);
      }
      if (v18 < 0) {
        operator delete(*(void **)((char *)v17 + 4));
      }
      if (SBYTE3(v17[0]) < 0) {
        operator delete(*(void **)buf);
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    id v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Tried to start monitoring for a client that isn't connected}",  buf,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    BOOL v11 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v14 = 2082;
      id v15 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Tried to start monitoring for a client that isn't connected",  "{msg%{public}.0s:#slv Tried to start monitoring for a client that isn't connected}",  buf,  0x12u);
    }
  }

- (void)stopMonitoringSignificantVisitsForClient:(id)a3
{
  id v5 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v5)
  {
    int v6 = v5;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    id v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      __int16 v14 = 2082;
      id v15 = [v6 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv client stop, key:%{public, location:escape_only}s}",  (uint8_t *)&v10,  0x1Cu);
    }

    -[CLSignificantVisitManager removeInterestForClientKey:](self, "removeInterestForClientKey:", v6);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    BOOL v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Tried to stop monitoring for a client that isn't connected}",  (uint8_t *)&v10,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    id v9 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v10 = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Tried to stop monitoring for a client that isn't connected",  "{msg%{public}.0s:#slv Tried to stop monitoring for a client that isn't connected}",  (uint8_t *)&v10,  0x12u);
    }
  }

- (void)removeInterestForClientKey:(id)a3
{
  int v5 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:]( self,  "interestForClientKey:outInterest:",  [a3 UTF8String],  &v5);
  if (v5 == 1)
  {
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:]( self,  "clientInterestStoreSetValueForClientKey:parameterKey:value:",  [a3 UTF8String],  "interest",  2);
    -[CLSignificantVisitManager flushAll](self, "flushAll");
    -[CLSignificantVisitManager actOnPendingDeleteForClientKey:](self, "actOnPendingDeleteForClientKey:", a3);
    -[CLSignificantVisitManager checkForMonitoring](self, "checkForMonitoring");
  }

- (void)actOnPendingDeleteForClientKey:(id)a3
{
  int v7 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:]( self,  "interestForClientKey:outInterest:",  [a3 UTF8String],  &v7);
  if (v7 != 2) {
    sub_10123F3E4();
  }
  v5[5] = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100593990;
  v6[3] = &unk_101840D20;
  v6[4] = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1005939CC;
  v5[3] = &unk_10181A328;
  v5[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLSignificantVisitManager clientManager](self, "clientManager"),  "doAsync:withReply:",  v6,  v5);
}

- (void)simulateVisit:(id)a3
{
  if (qword_1019349F0 != -1) {
    dispatch_once(&qword_1019349F0, &stru_101840D60);
  }
  int v5 = (os_log_s *)qword_1019349F8;
  if (os_log_type_enabled((os_log_t)qword_1019349F8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    BOOL v8 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Sending simulated visit to clients}",  (uint8_t *)v6,  0x12u);
  }

  -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", a3);
}

- (void)disconnectClient:(id)a3
{
  p_clientToKey = &self->_clientToKey;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)p_clientToKey->__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &p_clientToKey->__tree_.__pair1_;
    do
    {
      unint64_t v8 = (unint64_t)left[4].__value_.__left_;
      BOOL v9 = v8 >= (unint64_t)a3;
      else {
        int v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **)&left[1];
      }
      if (v9) {
        p_pair1 = left;
      }
      left = *v10;
    }

    while (*v10);
    if (p_pair1 != &p_clientToKey->__tree_.__pair1_)
    {
      id v11 = p_pair1[4].__value_.__left_;
      if (v11 <= a3)
      {

        sub_1000087E8((uint64_t **)p_clientToKey, (uint64_t *)p_pair1);
        operator delete(p_pair1);
      }
    }
  }

- (void)notifyClientsOfVisit:(id)a3
{
  if (!a3) {
    sub_10123F550();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100593C74;
  v5[3] = &unk_10181A328;
  v5[4] = a3;
  v5[5] = self;
  -[CLSignificantVisitManager performBlockWhenArmed:](self, "performBlockWhenArmed:", v5);
}

- (id)authorizationDateForClientWithKey:(id)a3
{
  if (!-[CLSignificantVisitManager armed](self, "armed"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    int v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv #warning Can't produce a meaningful authorization date before arming is complete.  Returning nil}",  buf,  0x12u);
    }

    return 0LL;
  }

  if ((objc_msgSend( -[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:]( -[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"),  "syncgetAuthorizationContextIfClientIsNonZonal:",  a3),  "isAuthorizedForServiceTypeMask:",  64) & 1) == 0)
  {
    sub_1002A667C( (uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"),  (const char *)[a3 UTF8String],  0xFFFFFFFFLL);
    -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
    return 0LL;
  }

  if (sub_1002A82BC( (uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"),  (const char *)[a3 UTF8String],  buf)) {
    return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  *(double *)buf);
  }
  objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"),  "currentLatchedAbsoluteTimestamp");
  int v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
  unint64_t v8 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  BOOL v9 = (const char *)[a3 UTF8String];
  -[NSDate timeIntervalSinceReferenceDate](v5, "timeIntervalSinceReferenceDate");
  uint64_t v11 = v10;
  sub_1002AC7B8((uint64_t)v8, v9, &v11);
  -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
  return v5;
}

- (void)checkForMonitoring
{
  if (-[CLSignificantVisitManager armed](self, "armed"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    objc_super v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v39 = 2082;
      v40 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv Checking if SLV should be active}",  buf,  0x12u);
    }

    v35 = 0LL;
    v36 = 0LL;
    uint64_t v37 = 0LL;
    sub_1002A6CEC((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), (uint64_t *)&v35);
    uint64_t v4 = v35;
    if (v35 != v36)
    {
      char v5 = 0;
      char v6 = 0;
      do
      {
        __int16 v7 = v4;
        unsigned int v8 = -[CLSignificantVisitManager isClientWithKeyInterested:]( self,  "isClientWithKeyInterested:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        sub_100FE3188(v4, (uint64_t)v21);
        if (!v8) {
          goto LABEL_19;
        }
        BOOL v9 = v4;
        if (-[CLSignificantVisitManager authorizationDateForClientWithKey:]( self,  "authorizationDateForClientWithKey:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9)))
        {
          int v20 = 0;
          uint64_t v10 = v4;
          -[CLSignificantVisitManager interestTypeForClientKey:outType:]( self,  "interestTypeForClientKey:outType:",  v10,  &v20);
          if (v20)
          {
            if (v20 == 1)
            {
              char v6 = 1;
            }

            else
            {
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101840D40);
              }
              uint64_t v11 = (os_log_s *)qword_101934988;
              if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)uint64_t buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "#slv Invalid interest type", buf, 2u);
              }

              if (sub_1002921D0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_101934980 != -1) {
                  dispatch_once(&qword_101934980, &stru_101840D40);
                }
                v19[0] = 0;
                LODWORD(v18) = 2;
                __int16 v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  17LL,  "#slv Invalid interest type",  v19,  v18);
                sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLSignificantVisitManager checkForMonitoring]", "%s\n", v12);
              }
            }
          }

          else
          {
            char v5 = 1;
          }

          sub_100575260((uint64_t)self->_clientManagerClient.__ptr_.__value_, (__int128 *)v21, 1LL);
        }

        else
        {
LABEL_19:
          sub_100575260((uint64_t)self->_clientManagerClient.__ptr_.__value_, (__int128 *)v21, 0LL);
        }

        if (v34 < 0) {
          operator delete(__p);
        }
        if (v32 < 0) {
          operator delete(v31);
        }
        if (v30 < 0) {
          operator delete(v29);
        }
        if (v28 < 0) {
          operator delete(v27);
        }
        if (v26 < 0) {
          operator delete(v25);
        }
        if (v24 < 0) {
          operator delete(v23);
        }
        if (v22 < 0) {
          operator delete(v21[0]);
        }
        ++v4;
      }

      while (v4 != v36);
      if ((v5 & 1) != 0)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840D40);
        }
        __int16 v14 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v39 = 2082;
          v40 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv should be monitoring}",  buf,  0x12u);
        }

        uint64_t v15 = 0LL;
LABEL_63:
        -[CLSignificantVisitManager ensureMonitoringWithType:](self, "ensureMonitoringWithType:", v15);
LABEL_69:
        *(void *)uint64_t buf = &v35;
        sub_1000129D4((void ***)buf);
        return;
      }

      if ((v6 & 1) != 0)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840D40);
        }
        __int16 v16 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v39 = 2082;
          v40 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv should be leeching}",  buf,  0x12u);
        }

        uint64_t v15 = 1LL;
        goto LABEL_63;
      }
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    __int16 v17 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v39 = 2082;
      v40 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv should be off}",  buf,  0x12u);
    }

    -[CLSignificantVisitManager ensureStop](self, "ensureStop");
    goto LABEL_69;
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101840D40);
  }
  __int16 v13 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v39 = 2082;
    v40 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#slv Not checking for monitoring... not armed}",  buf,  0x12u);
  }

- (void)migrateClientInterestData
{
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  if ((sub_1002A6CEC((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), &v26) & 1) != 0)
  {
    uint64_t v5 = v26;
    uint64_t v4 = v27;
    if (v26 != v27)
    {
      *(void *)&__int128 v3 = 68289026LL;
      __int128 v23 = v3;
      do
      {
        CFTypeRef cf = 0LL;
        char v6 = -[CLSignificantVisitManager clientInterest](self, "clientInterest", v23);
        __int16 v7 = (const char *)v5;
        if ((sub_1002A6E78((uint64_t)v6, v7, &cf, 0xFFFFFFFFLL) & 1) != 0)
        {
          CFTypeID v8 = CFGetTypeID(cf);
          if (v8 == CFNumberGetTypeID())
          {
            sub_1002A5370(v24);
            sub_1002AB370((uint64_t)v24, "interest", (uint64_t)cf);
            *(_DWORD *)uint64_t buf = 0;
            sub_1002AC220((uint64_t)v24, "type", buf);
            BOOL v9 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
            uint64_t v10 = (const char *)v5;
            sub_1002ACE6C((uint64_t)v9, v10, (uint64_t)v24);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101840D40);
            }
            uint64_t v11 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
            {
              __int16 v12 = (const char *)v5;
              *(_DWORD *)uint64_t buf = 68289282;
              *(_DWORD *)&uint8_t buf[4] = 0;
              __int16 v30 = 2082;
              v31 = "";
              __int16 v32 = 2082;
              uint64_t v33 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#slv Migrated value for key to a dictionary, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
            }

            sub_1002A5590(v24);
          }

          else if (v8 != CFDictionaryGetTypeID())
          {
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101840D40);
            }
            __int16 v17 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)uint64_t buf = v23;
              *(_DWORD *)&uint8_t buf[4] = 0;
              __int16 v30 = 2082;
              v31 = "";
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv invalid value found in plist}",  buf,  0x12u);
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101840D40);
              }
            }

            uint64_t v18 = (os_log_s *)qword_101934988;
            if (os_signpost_enabled((os_log_t)qword_101934988))
            {
              *(_DWORD *)uint64_t buf = v23;
              *(_DWORD *)&uint8_t buf[4] = 0;
              __int16 v30 = 2082;
              v31 = "";
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv invalid value found in plist",  "{msg%{public}.0s:#slv invalid value found in plist}",  buf,  0x12u);
            }

            __int16 v19 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
            int v20 = (const char *)v5;
            sub_1002A667C((uint64_t)v19, v20, 0xFFFFFFFFLL);
          }
        }

        else
        {
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101840D40);
          }
          __int16 v13 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
          {
            __int16 v14 = (const char *)v5;
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v30 = 2082;
            v31 = "";
            __int16 v32 = 2082;
            uint64_t v33 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv key not found after we were told it was there, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101840D40);
            }
          }

          uint64_t v15 = (os_log_s *)qword_101934988;
          if (os_signpost_enabled((os_log_t)qword_101934988))
          {
            __int16 v16 = (const char *)v5;
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v30 = 2082;
            v31 = "";
            __int16 v32 = 2082;
            uint64_t v33 = v16;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv key not found after we were told it was there",  "{msg%{public}.0s:#slv key not found after we were told it was there, key:%{public, location:escape_only}s}",  buf,  0x1Cu);
          }
        }

        v5 += 24LL;
      }

      while (v5 != v4);
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    unsigned int v21 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v30 = 2082;
      v31 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Couldn't get list of clients}",  buf,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    char v22 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v30 = 2082;
      v31 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Couldn't get list of clients",  "{msg%{public}.0s:#slv Couldn't get list of clients}",  buf,  0x12u);
    }
  }

  *(void *)uint64_t buf = &v26;
  sub_1000129D4((void ***)buf);
}

- (BOOL)interestForClientKey:(const char *)a3 outInterest:(int *)a4
{
  return -[CLSignificantVisitManager clientInterestStoreGetValueForClientKey:parameterKey:value:]( self,  "clientInterestStoreGetValueForClientKey:parameterKey:value:",  a3,  "interest",  a4);
}

- (BOOL)interestTypeForClientKey:(const char *)a3 outType:(int *)a4
{
  return -[CLSignificantVisitManager clientInterestStoreGetValueForClientKey:parameterKey:value:]( self,  "clientInterestStoreGetValueForClientKey:parameterKey:value:",  a3,  "type",  a4);
}

- (BOOL)clientInterestStoreGetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int *)a5
{
  else {
    char v9 = 0;
  }
  sub_1002A5590(v11);
  return v9;
}

- (BOOL)clientInterestStoreSetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int)a5
{
  int v11 = a5;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  sub_1002A5370(v10);
  sub_1002A8F8C((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), a3, v10);
  sub_1002A5590(v10);
  return v8;
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    uint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Received visit from routined, visit:%{private, location:escape_only}@}",  (uint8_t *)&v8,  0x1Cu);
    }

    -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", a3);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    char v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Attempting to notify nil visit}",  (uint8_t *)&v8,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
    }

    __int16 v7 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Attempting to notify nil visit",  "{msg%{public}.0s:#slv Attempting to notify nil visit}",  (uint8_t *)&v8,  0x12u);
    }
  }

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  switch(a3)
  {
    case 0:
    case 4:
      if (*((_DWORD *)a4 + 47) != 1)
      {
        sub_1002A5EAC((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"));
        -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
        -[CLSignificantVisitManager ensureStop](self, "ensureStop");
      }

      break;
    case 1:
      sub_100FE3FB4((uint64_t)a4, (uint64_t)&__p);
      if (v15 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      -[CLSignificantVisitManager removeInterestForClientKey:]( self,  "removeInterestForClientKey:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
      if (SHIBYTE(v15) < 0) {
        operator delete(__p);
      }
      break;
    case 2:
      -[CLSignificantVisitManager checkForMonitoring](self, "checkForMonitoring");
      break;
    default:
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101840D40);
      }
      int v9 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        std::string __p = (void *)68289282;
        __int16 v12 = 2082;
        id v13 = "";
        __int16 v14 = 1026;
        int v15 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv received unhandled notification, notification:%{public}d}",  (uint8_t *)&__p,  0x18u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101840D40);
        }
      }

      __int16 v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        std::string __p = (void *)68289282;
        __int16 v12 = 2082;
        id v13 = "";
        __int16 v14 = 1026;
        int v15 = a3;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv received unhandled notification",  "{msg%{public}.0s:#slv received unhandled notification, notification:%{public}d}",  (uint8_t *)&__p,  0x18u);
      }

      break;
  }

- (void)onInterestStoreTimer
{
}

- (void)onAuthDateStoreTimer
{
}

- (void)settingsDidChange:(id)a3
{
  if ([a3 dictionaryForKey:@"SpoofSignificantVisit" defaultValue:0])
  {
    [a3 doubleForKey:@"Latitude" defaultValue:34.076452];
    CLLocationDegrees v6 = v5;
    [a3 doubleForKey:@"Longitude" defaultValue:-118.429474];
    CLLocationDegrees v8 = v7;
    [a3 doubleForKey:@"Accuracy" defaultValue:54.321];
    double v10 = v9;
    objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"),  "currentLatchedAbsoluteTimestamp");
    int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    __int16 v12 = +[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture");
    objc_msgSend( objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"),  "currentLatchedAbsoluteTimestamp");
    id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    [a3 doubleForKey:@"ArrivalTimestamp" defaultValue:0.0];
    if (v14 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    }
    [a3 doubleForKey:@"DepartureTimestamp" defaultValue:0.0];
    if (v15 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    }
    [a3 doubleForKey:@"DetectionTimestamp" defaultValue:0.0];
    if (v16 != 0.0) {
      int v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    }
    __int16 v17 = objc_alloc(&OBJC_CLASS___CLVisit);
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v6, v8);
    __int16 v19 = -[CLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:]( v17,  "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:",  v11,  v12,  v13,  v18.latitude,  v18.longitude,  v10);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101840D40);
    }
    int v20 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 68289283;
      v21[1] = 0;
      __int16 v22 = 2082;
      __int128 v23 = "";
      __int16 v24 = 2113;
      id v25 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#slv Spoofing a Significant Visit, visit:%{private, location:escape_only}@}",  (uint8_t *)v21,  0x1Cu);
    }

    -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", v19);
  }

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (BOOL)leeching
{
  return self->_leeching;
}

- (void)setLeeching:(BOOL)a3
{
  self->_leeching = a3;
}

- (void)clientInterest
{
  return self->_clientInterest;
}

- (void)setClientInterest:(void *)a3
{
  self->_clientInterest = a3;
}

- (void)clientAuthDate
{
  return self->_clientAuthDate;
}

- (void)setClientAuthDate:(void *)a3
{
  self->_clientAuthDate = a3;
}

- (CLClientAuthorizationCacheProtocol)clientAuthorizationCache
{
  return self->_clientAuthorizationCache;
}

- (void)setClientAuthorizationCache:(id)a3
{
}

- (NSMutableArray)recentVisits
{
  return self->_recentVisits;
}

- (void)setRecentVisits:(id)a3
{
}

- (CLRoutineMonitorServiceProtocol)routineMonitor
{
  return self->_routineMonitor;
}

- (void)setRoutineMonitor:(id)a3
{
}

- (CLClientManagerPublicProtocol)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
}

- (BOOL)armed
{
  return self->_armed;
}

- (void)setArmed:(BOOL)a3
{
  self->_armed = a3;
}

- (unint64_t)currentJournalIdentifier
{
  return self->_currentJournalIdentifier;
}

- (void)setCurrentJournalIdentifier:(unint64_t)a3
{
  self->_currentJournalIdentifier = a3;
}

- (void).cxx_destruct
{
  unint64_t value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end