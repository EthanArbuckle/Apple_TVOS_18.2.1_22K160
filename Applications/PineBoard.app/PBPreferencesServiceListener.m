@interface PBPreferencesServiceListener
+ (BOOL)_clientIsEntitledForReading:(id)a3;
- (BSServiceConnectionListener)listener;
- (NSNumber)secureHomeKitAccessoryAllowedRemotes;
- (PBPreferencesServiceListener)init;
- (PBPreferencesServiceListener)initWithPBSPreferences:(id)a3;
- (PBSPreferences)pineboardServicesPreferences;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBPreferencesServiceListener

- (PBPreferencesServiceListener)initWithPBSPreferences:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBPreferencesServiceListener;
    v8 = -[PBPreferencesServiceListener init](&v12, "init");
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_pineboardServicesPreferences, a3);
    }

    return v9;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"pineboardServicesPreferences != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028A608(a2);
    }
    result = (PBPreferencesServiceListener *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBPreferencesServiceListener)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSPreferences sharedInstance](&OBJC_CLASS___PBSPreferences, "sharedInstance"));
  v4 = -[PBPreferencesServiceListener initWithPBSPreferences:](self, "initWithPBSPreferences:", v3);

  return v4;
}

- (void)dealloc
{
  if (self->_listener)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028A6C4(a2);
    }
    _bs_set_crash_log_message([v3 UTF8String]);
    __break(0);
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___PBPreferencesServiceListener;
    -[PBPreferencesServiceListener dealloc](&v4, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10019A828;
    v5[3] = &unk_1003D0EC8;
    v5[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v5));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.preferences-service.read-only"]);
  if ([v8 count])
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_10019AA44;
    v17 = &unk_1003D1070;
    v18 = self;
    id v9 = v7;
    id v19 = v9;
    [v6 configureConnection:&v14];
    id v10 = sub_1000835DC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Activating connection {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    objc_msgSend(v6, "activate", v14, v15, v16, v17, v18);
  }

  else
  {
    id v12 = sub_1000835DC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100276694((uint64_t)v7, v13);
    }

    [v6 invalidate];
  }
}

- (NSNumber)secureHomeKitAccessoryAllowedRemotes
{
  if ([(id)objc_opt_class(self) _clientIsEntitledForReading:@"secure-accessory-allowed-remotes"])
  {
    uint64_t v4 = (uint64_t)-[PBSPreferences secureHomeKitAccessoryAllowedRemotes]( self->_pineboardServicesPreferences,  "secureHomeKitAccessoryAllowedRemotes");
  }

  else
  {
    id v5 = sub_1000835DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10028A780(a2, v6);
    }

    uint64_t v4 = -1LL;
  }

  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v4));
}

+ (BOOL)_clientIsEntitledForReading:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteProcess]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.appletv.pbs.preferences-service.read-only"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v3]);

  if ((objc_opt_respondsToSelector(v7, "BOOLValue") & 1) != 0) {
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (PBSPreferences)pineboardServicesPreferences
{
  return self->_pineboardServicesPreferences;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
}

@end