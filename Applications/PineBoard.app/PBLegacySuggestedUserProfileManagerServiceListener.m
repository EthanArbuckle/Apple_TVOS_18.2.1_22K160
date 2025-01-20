@interface PBLegacySuggestedUserProfileManagerServiceListener
- (BSServiceConnectionListener)listener;
- (void)activate;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setListener:(id)a3;
@end

@implementation PBLegacySuggestedUserProfileManagerServiceListener

- (void)activate
{
  if (!self->_listener)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100071E00;
    v8[3] = &unk_1003D0EC8;
    v8[4] = self;
    v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v8));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
    id v5 = sub_100083FF0();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PBSuggestedUserProfileManagerServiceListener activated",  v7,  2u);
    }
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;

  id v4 = sub_100083FF0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PBSuggestedUserProfileManagerServiceListener invalidated",  v6,  2u);
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v5 = a4;
  if (_os_feature_enabled_impl("PineBoard", "SuggestedUserProfiles"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteProcess]);
    if ([v6 hasEntitlement:@"com.apple.appletv.pbs.user-profiles"])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100072044;
      v13[3] = &unk_1003D2DF0;
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[PBSuggestedUserProfileManager sharedInstance]( &OBJC_CLASS___PBSuggestedUserProfileManager,  "sharedInstance"));
      id v7 = v14;
      [v5 configureConnection:v13];
      [v5 activate];
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteTarget]);
      [v7 addObserver:v8];
    }

    else
    {
      id v11 = sub_100083FF0();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100276EE0(v6, v12);
      }

      [v5 invalidate];
    }
  }

  else
  {
    id v9 = sub_100083FF0();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100276F74(v10);
    }

    [v5 invalidate];
  }
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end