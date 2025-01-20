@interface TransparencyDeviceList
- (NSArray)cachedDevices;
- (NSArray)devices;
- (TransparencyDeviceList)init;
- (id)_authController;
- (id)updateDevicesList:(id)a3;
- (os_unfair_lock_s)lock;
- (void)refreshDeviceList:(id)a3 complete:(id)a4;
- (void)setCachedDevices:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation TransparencyDeviceList

- (TransparencyDeviceList)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TransparencyDeviceList;
  v2 = -[TransparencyDeviceList init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TransparencyDeviceList setLock:](v2, "setLock:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (NSArray)devices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDeviceList cachedDevices](self, "cachedDevices"));
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)updateDevicesList:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        v12 = objc_alloc(&OBJC_CLASS___KTIDMSDevice);
        v13 = -[KTIDMSDevice initWithAKRemoteDevice:](v12, "initWithAKRemoteDevice:", v11, (void)v15);
        if (v13) {
          [v5 addObject:v13];
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  -[TransparencyDeviceList setCachedDevices:](self, "setCachedDevices:", v5);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)refreshDeviceList:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v8 = (void (**)(id, void, uint64_t))a4;
  if (!v6)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError aa_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "aa_errorWithCode:underlyingError:",  -3LL,  0LL));
LABEL_13:
    uint64_t v11 = (void *)v14;
    v8[2](v8, 0LL, v14);
    goto LABEL_25;
  }

  if (!objc_opt_class(&OBJC_CLASS___AKDeviceListRequestContext, v7)
    || !objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationController, v9))
  {
    if (qword_1002EEE00 != -1) {
      dispatch_once(&qword_1002EEE00, &stru_100288F60);
    }
    v13 = (os_log_s *)qword_1002EEE08;
    if (os_log_type_enabled((os_log_t)qword_1002EEE08, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "AuthKit not available", buf, 2u);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -333LL,  @"AuthKit not available"));
    goto LABEL_13;
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setAltDSID:v6];
    v12 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    if (v12)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1001B93A8;
      v18[3] = &unk_100288FC8;
      v18[4] = self;
      v19 = v8;
      -[AKAppleIDAuthenticationController deviceListWithContext:completion:]( v12,  "deviceListWithContext:completion:",  v11,  v18);
    }

    else
    {
      if (qword_1002EEE00 != -1) {
        dispatch_once(&qword_1002EEE00, &stru_100288FA0);
      }
      __int128 v16 = (os_log_s *)qword_1002EEE08;
      if (os_log_type_enabled((os_log_t)qword_1002EEE08, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "AKAppleIDAuthenticationController not available",  buf,  2u);
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -335LL,  @"can't get authController"));
      v8[2](v8, 0LL, (uint64_t)v17);
    }
  }

  else
  {
    if (qword_1002EEE00 != -1) {
      dispatch_once(&qword_1002EEE00, &stru_100288F80);
    }
    __int128 v15 = (os_log_s *)qword_1002EEE08;
    if (os_log_type_enabled((os_log_t)qword_1002EEE08, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "AKDeviceListRequestContext not available",  buf,  2u);
    }

    v12 = (AKAppleIDAuthenticationController *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -334LL,  @"can't get AKDeviceListRequestContextClass"));
    v8[2](v8, 0LL, (uint64_t)v12);
  }

LABEL_25:
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSArray)cachedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCachedDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end