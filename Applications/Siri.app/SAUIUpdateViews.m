@interface SAUIUpdateViews
- (id)sr_sirilandShim;
@end

@implementation SAUIUpdateViews

- (id)sr_sirilandShim
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIUpdateViews views](self, "views"));
  id v4 = sub_100034C38(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v3 == v5)
  {
    v6 = self;
  }

  else
  {
    v6 = (SAUIUpdateViews *)-[SAUIUpdateViews copy](self, "copy");
    -[SAUIUpdateViews setViews:](v6, "setViews:", v5);
    v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "-[SAUIUpdateViews(Siriland) sr_sirilandShim]";
      __int16 v11 = 2112;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Successfully shimmed UpdateViews for the Siriland presentation:\n UpdateViews: %@\n Shimmed UpdateViews: %@",  (uint8_t *)&v9,  0x20u);
    }
  }

  return v6;
}

@end