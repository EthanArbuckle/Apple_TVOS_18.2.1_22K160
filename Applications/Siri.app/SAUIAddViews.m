@interface SAUIAddViews
- (id)sr_sirilandShim;
@end

@implementation SAUIAddViews

- (id)sr_sirilandShim
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAddViews views](self, "views"));
  id v4 = sub_100034C38(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v3 == v5)
  {
    v6 = self;
  }

  else
  {
    v6 = (SAUIAddViews *)-[SAUIAddViews copy](self, "copy");
    -[SAUIAddViews setViews:](v6, "setViews:", v5);
    v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "-[SAUIAddViews(Siriland) sr_sirilandShim]";
      __int16 v11 = 2112;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Successfully shimmed AddViews for the Siriland presentation:\n    AddViews: %@\n    Shimmed AddViews: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  return v6;
}

@end