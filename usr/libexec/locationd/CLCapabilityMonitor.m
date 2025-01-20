@interface CLCapabilityMonitor
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)hasCapability:(id)a3;
- (BOOL)iCloudManagedAppleID;
- (BOOL)iTunesManagedAppleID;
- (BOOL)installedEducationProfile;
- (BOOL)stewieSupported;
- (BOOL)supervised;
- (BOOL)syncgetForceCacheUpdate;
- (CLCapabilityMonitor)init;
- (NSMutableSet)capabilityChangeClients;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onCapabilityChange;
- (void)onDarwinNotification:(int)a3 data:(id)a4;
- (void)onTelephonyNotification:(int)a3 data:;
- (void)setCapabilityChangeClients:(id)a3;
- (void)setICloudManagedAppleID:(BOOL)a3;
- (void)setITunesManagedAppleID:(BOOL)a3;
- (void)setInstalledEducationProfile:(BOOL)a3;
- (void)setStewieSupported:(BOOL)a3;
- (void)setSupervised:(BOOL)a3;
- (void)startMonitoringCapabilityChangeForClient:(id)a3;
- (void)stopMonitoringCapabilityChangeForClient:(id)a3;
- (void)updateICloudManagedAppleID;
- (void)updateITunesManagedAppleID;
- (void)updateInstalledEducationProfile;
- (void)updateLocationDictionaryCachedCapabilities;
- (void)updateSupervised;
@end

@implementation CLCapabilityMonitor

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999368 != -1) {
    dispatch_once(&qword_101999368, &stru_101861918);
  }
  return (id)qword_101999360;
}

- (CLCapabilityMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCapabilityMonitor;
  return -[CLCapabilityMonitor initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCapabilityMonitorServiceProtocol,  &OBJC_PROTOCOL___CLCapabilityMonitorClientProtocol);
}

- (void)beginService
{
  objc_super v3 = (Client *)v9;
  v9 = 0LL;
  value = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    unint64_t v5 = v9;
    v9 = 0LL;
    if (v5) {
      (*((void (**)(id *))*v5 + 1))(v5);
    }
  }

  [*((id *)self->_darwinClient.__ptr_.__value_ + 2) register:*((void *)self->_darwinClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  [*((id *)self->_darwinClient.__ptr_.__value_ + 2) register:*((void *)self->_darwinClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
  [*((id *)self->_darwinClient.__ptr_.__value_ + 2) register:*((void *)self->_darwinClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
  [*((id *)self->_darwinClient.__ptr_.__value_ + 2) register:*((void *)self->_darwinClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
  sub_100328B0C((uint64_t)sub_100939B58, (uint64_t)self, -[CLCapabilityMonitor universe](self, "universe"), &v9);
  v6 = (Client *)v9;
  v9 = 0LL;
  v7 = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = v6;
  if (v7)
  {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
    v8 = v9;
    v9 = 0LL;
    if (v8) {
      (*((void (**)(id *))*v8 + 1))(v8);
    }
  }

  -[CLCapabilityMonitor updateSupervised](self, "updateSupervised");
  -[CLCapabilityMonitor updateICloudManagedAppleID](self, "updateICloudManagedAppleID");
  -[CLCapabilityMonitor updateITunesManagedAppleID](self, "updateITunesManagedAppleID");
  -[CLCapabilityMonitor updateInstalledEducationProfile](self, "updateInstalledEducationProfile");
  -[CLCapabilityMonitor updateLocationDictionaryCachedCapabilities](self, "updateLocationDictionaryCachedCapabilities");
}

- (void)endService
{
  value = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v4 = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  -[CLCapabilityMonitor setSupervised:](self, "setSupervised:", 0LL);
  -[CLCapabilityMonitor setICloudManagedAppleID:](self, "setICloudManagedAppleID:", 0LL);
  -[CLCapabilityMonitor setITunesManagedAppleID:](self, "setITunesManagedAppleID:", 0LL);
  -[CLCapabilityMonitor setInstalledEducationProfile:](self, "setInstalledEducationProfile:", 0LL);
  -[CLCapabilityMonitor setCapabilityChangeClients:](self, "setCapabilityChangeClients:", 0LL);
  -[CLCapabilityMonitor setStewieSupported:](self, "setStewieSupported:", 0LL);
}

- (void)updateSupervised
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v4) {
    id v5 = objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", v3),  "isSupervised");
  }
  else {
    id v5 = 0LL;
  }
  -[CLCapabilityMonitor setSupervised:](self, "setSupervised:", v5);
}

- (void)setSupervised:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_supervised != v3)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101861A40);
    }
    id v5 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      BOOL supervised = self->_supervised;
      *(_DWORD *)buf = 67109376;
      BOOL v14 = supervised;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "supervised capability changed from, %d, to, %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101861A40);
      }
      BOOL v7 = self->_supervised;
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "supervised capability changed from, %d, to, %d",  v10,  14);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCapabilityMonitor setSupervised:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    self->_BOOL supervised = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }

- (void)updateICloudManagedAppleID
{
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100939F38;
    v4[3] = &unk_101861990;
    id v5 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    v6 = self;
    -[ACAccountStore accountTypeWithIdentifier:completion:]( v5,  "accountTypeWithIdentifier:completion:",  ACAccountTypeIdentifierAppleAccount,  v4);
  }

- (void)setICloudManagedAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_iCloudManagedAppleID != v3)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101861A40);
    }
    id v5 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      BOOL iCloudManagedAppleID = self->_iCloudManagedAppleID;
      *(_DWORD *)buf = 67109376;
      BOOL v14 = iCloudManagedAppleID;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "iCloud managed apple ID capability changed from, %d, to, %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101861A40);
      }
      BOOL v7 = self->_iCloudManagedAppleID;
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "iCloud managed apple ID capability changed from, %d, to, %d",  v10,  14);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCapabilityMonitor setICloudManagedAppleID:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    self->_BOOL iCloudManagedAppleID = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }

- (void)updateInstalledEducationProfile
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10093A3E0;
    v5[3] = &unk_1018619E0;
    v5[4] = &v6;
    objc_msgSend( objc_msgSend( +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", v3),  "installedProfileIdentifiers"),  "enumerateObjectsUsingBlock:",  v5);
  }

  -[CLCapabilityMonitor setInstalledEducationProfile:]( self,  "setInstalledEducationProfile:",  *((unsigned __int8 *)v7 + 24),  v3);
  _Block_object_dispose(&v6, 8);
}

- (void)setInstalledEducationProfile:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_installedEducationProfile != v3)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101861A40);
    }
    id v5 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      BOOL installedEducationProfile = self->_installedEducationProfile;
      *(_DWORD *)buf = 67109376;
      BOOL v14 = installedEducationProfile;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "installed education profile capability changed from, %d, to, %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101861A40);
      }
      BOOL v7 = self->_installedEducationProfile;
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "installed education profile capability changed from, %d, to, %d",  v10,  14);
      char v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCapabilityMonitor setInstalledEducationProfile:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    self->_BOOL installedEducationProfile = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }

- (void)updateITunesManagedAppleID
{
  id v3 = objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (&_SSActiveAccountIsManagedAppleID) {
    -[CLCapabilityMonitor setITunesManagedAppleID:]( self,  "setITunesManagedAppleID:",  SSActiveAccountIsManagedAppleID(v3));
  }
}

- (void)setITunesManagedAppleID:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if (self->_iTunesManagedAppleID != v3)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101861A40);
    }
    id v5 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      BOOL iTunesManagedAppleID = self->_iTunesManagedAppleID;
      *(_DWORD *)buf = 67109376;
      BOOL v14 = iTunesManagedAppleID;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "iTunes managed apple ID capability changed from, %d, to, %d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101861A40);
      }
      BOOL v7 = self->_iTunesManagedAppleID;
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "iTunes managed apple ID capability changed from, %d, to, %d",  v10,  14);
      char v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCapabilityMonitor setITunesManagedAppleID:]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
    }

    self->_BOOL iTunesManagedAppleID = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  switch(a3)
  {
    case 2:
      -[CLCapabilityMonitor updateSupervised](self, "updateSupervised");
      break;
    case 3:
      -[CLCapabilityMonitor updateICloudManagedAppleID](self, "updateICloudManagedAppleID");
      break;
    case 4:
      -[CLCapabilityMonitor updateInstalledEducationProfile](self, "updateInstalledEducationProfile");
      break;
    case 5:
      -[CLCapabilityMonitor updateITunesManagedAppleID](self, "updateITunesManagedAppleID");
      break;
    default:
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101861A40);
      }
      uint64_t v6 = (os_log_s *)qword_101934A78;
      if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        int v11 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "received unhandled notification, %{public}d",  buf,  8u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_101861A40);
        }
        v9[0] = 67240192;
        v9[1] = a3;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  17LL,  "received unhandled notification, %{public}d",  v9,  8);
        uint64_t v8 = (uint8_t *)v7;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLCapabilityMonitor onDarwinNotification:data:]", "%s\n", v7);
        if (v8 != buf) {
          free(v8);
        }
      }

      break;
  }

- (void)setStewieSupported:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[CLCapabilityMonitor universe](self, "universe"), "silo");
  if ((_os_feature_enabled_impl("CoreTelephony", "Bifrost") & 1) != 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101861A60);
    }
    id v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      BOOL stewieSupported = self->_stewieSupported;
      v7[0] = 68289538;
      v7[1] = 0;
      __int16 v8 = 2082;
      char v9 = "";
      __int16 v10 = 1026;
      BOOL v11 = stewieSupported;
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CapabilityMonitor update stewieSupported, old:%{public}hhd, new:%{public}hhd}",  (uint8_t *)v7,  0x1Eu);
    }
  }

  if (self->_stewieSupported != v3)
  {
    self->_BOOL stewieSupported = v3;
    -[CLCapabilityMonitor onCapabilityChange](self, "onCapabilityChange");
  }

- (void)onTelephonyNotification:(int)a3 data:
{
  int v7 = a3;
  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101861A60);
  }
  BOOL v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (const __CFString *)sub_100320878(&v7);
    sub_1002A6C50(v4, &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    BOOL v11 = "";
    __int16 v12 = 2082;
    BOOL v13 = p_p;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CapabilityMonitor onTelephonyNotification, notification:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

- (BOOL)hasCapability:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 isEqualToString:@"CLNONEDU"])
  {
    unsigned __int8 v5 = sub_1004F9FF4();
    return v5 ^ 1;
  }

  if ([a3 isEqualToString:@"CLNonSupervised"])
  {
    unsigned __int8 v5 = -[CLCapabilityMonitor supervised](self, "supervised");
    return v5 ^ 1;
  }

  if ([a3 isEqualToString:@"CLNonManagedAppleID"])
  {
    if (!-[CLCapabilityMonitor iCloudManagedAppleID](self, "iCloudManagedAppleID"))
    {
      unsigned __int8 v5 = -[CLCapabilityMonitor iTunesManagedAppleID](self, "iTunesManagedAppleID");
      return v5 ^ 1;
    }

    return 0;
  }

  if ([a3 isEqualToString:@"CLSystemCustomization"])
  {
    if ((sub_1004F7858() & 1) == 0)
    {
      unsigned __int8 v5 = sub_1004F76B8();
      return v5 ^ 1;
    }

    return 0;
  }

  else {
    return sub_100AE07D0((uint64_t)a3);
  }
}

- (void)updateLocationDictionaryCachedCapabilities
{
  v5[0] = @"CLNONEDU";
  v6[0] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1004F9FF4() ^ 1);
  v5[1] = @"CLSupervised";
  v6[1] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CLCapabilityMonitor supervised](self, "supervised"));
  v5[2] = @"CLNonSupervised";
  v6[2] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CLCapabilityMonitor supervised](self, "supervised") ^ 1);
  v5[3] = @"CLInstalledProfileEducation";
  v6[3] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CLCapabilityMonitor installedEducationProfile](self, "installedEducationProfile"));
  v5[4] = @"CLNonManagedAppleID";
  if (-[CLCapabilityMonitor iCloudManagedAppleID](self, "iCloudManagedAppleID")) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = -[CLCapabilityMonitor iTunesManagedAppleID](self, "iTunesManagedAppleID") ^ 1;
  }
  v6[4] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3);
  void v5[5] = @"CLHeadingCompass";
  v6[5] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1004FAB40() & 1);
  v5[6] = @"CLSystemCustomization";
  if ((sub_1004F7858() & 1) != 0) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = sub_1004F76B8() ^ 1;
  }
  v6[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4);
  v5[7] = @"CLBifrostSupported";
  v6[7] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CLCapabilityMonitor stewieSupported](self, "stewieSupported"));
  sub_100AE0780( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  8LL));
}

- (void)onCapabilityChange
{
}

- (void)startMonitoringCapabilityChangeForClient:(id)a3
{
}

- (void)stopMonitoringCapabilityChangeForClient:(id)a3
{
}

- (BOOL)syncgetForceCacheUpdate
{
  return 1;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (BOOL)iCloudManagedAppleID
{
  return self->_iCloudManagedAppleID;
}

- (BOOL)iTunesManagedAppleID
{
  return self->_iTunesManagedAppleID;
}

- (BOOL)installedEducationProfile
{
  return self->_installedEducationProfile;
}

- (BOOL)stewieSupported
{
  return self->_stewieSupported;
}

- (NSMutableSet)capabilityChangeClients
{
  return self->_capabilityChangeClients;
}

- (void)setCapabilityChangeClients:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_telephonyClient.__ptr_.__value_;
  self->_telephonyClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  uint64_t v4 = self->_darwinClient.__ptr_.__value_;
  self->_darwinClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end