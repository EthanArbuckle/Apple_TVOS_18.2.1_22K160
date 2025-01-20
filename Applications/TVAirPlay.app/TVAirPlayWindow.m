@interface TVAirPlayWindow
- (void)sendEvent:(id)a3;
@end

@implementation TVAirPlayWindow

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVAirPlayWindow;
  -[TVAirPlayWindow sendEvent:](&v10, "sendEvent:", v4);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIPressesEvent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = sub_100004020();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayWindow rootViewController](self, "rootViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayWindow firstResponder](self, "firstResponder"));
      *(_DWORD *)buf = 138412802;
      id v12 = v4;
      __int16 v13 = 2112;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "TVAirPlay sending event %@, rootViewController %@, firstResponder %@",  buf,  0x20u);
    }
  }
}

@end