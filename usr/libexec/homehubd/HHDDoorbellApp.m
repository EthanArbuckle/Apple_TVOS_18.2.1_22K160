@interface HHDDoorbellApp
- (HHDDoorbellApp)initWithQueue:(id)a3 delegate:(id)a4;
- (id)applicationConfigurations;
- (id)applicationIdentifier;
- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5;
@end

@implementation HHDDoorbellApp

- (HHDDoorbellApp)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HHDDoorbellApp;
  v9 = -[HHDDoorbellApp init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)applicationIdentifier
{
  return @"com.apple.doorbell";
}

- (id)applicationConfigurations
{
  id v3 = objc_alloc(&OBJC_CLASS___SIBSApplicationConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HHDDoorbellApp applicationIdentifier](self, "applicationIdentifier"));
  id v5 = [v3 initWithApplicationIdentifier:v4];

  [v5 setAudioCategory:0];
  [v5 setAudioMode:0];
  [v5 setLedAnimation:2];
  id v6 = [[SIBSApplicationColor alloc] initWithRed:255 green:255 blue:255];
  [v5 setLedColor:v6];
  id v9 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (void)didReceiveButtonNotificationForEndpoint:(id)a3 buttonAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_10002E5E0 != -1) {
    dispatch_once(&qword_10002E5E0, &stru_100024848);
  }
  v10 = (os_log_s *)(id)qword_10002E5D8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@Forwarding button notification to delegate",  (uint8_t *)&v12,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained application:self didReceiveButtonAction:a4 endpoint:v8 completion:v9];
}

- (void).cxx_destruct
{
}

@end