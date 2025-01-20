@interface W5PeerDatabaseListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5DatabaseManager)databaseManager;
- (W5PeerDatabaseListener)initWithDatabaseAccessManager:(id)a3;
- (int64_t)currentVersion;
- (void)setDatabaseManager:(id)a3;
@end

@implementation W5PeerDatabaseListener

- (W5PeerDatabaseListener)initWithDatabaseAccessManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___W5PeerDatabaseListener;
  v6 = -[W5PeerDatabaseListener init](&v13, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_databaseManager, a3), !v7->_databaseManager))
  {

    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 0;
      int v11 = 2;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] init error!",  v12,  v11);
    }

    v7 = 0LL;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315906;
      *(void *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v4;
      *(_WORD *)&v21[22] = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s: incoming request='%@', payload='%@' version='%@'",  v21,  42);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___W5PeerDatabaseResponsePayload);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerDatabaseListener currentVersion](self, "currentVersion")));
    -[W5PeerDatabaseResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerDatabaseResponsePayload setStatus:](v10, "setStatus:", 1LL);
    if ([v7 integerValue] == (id)1 || objc_msgSend(v7, "integerValue") == (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRequest]);

      if (v12)
      {
        databaseManager = self->_databaseManager;
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 fetchRequest]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](databaseManager, "performFetch:", v14));
        -[W5PeerDatabaseResponsePayload setFetchedResults:](v10, "setFetchedResults:", v15);
      }

      else
      {
        uint64_t v16 = sub_10008C90C();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315394;
          *(void *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
          *(_WORD *)&v21[12] = 2112;
          *(void *)&v21[14] = v4;
          LODWORD(v20) = 22;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s: invalid fetchRequest %@",  v21,  v20,  *(_OWORD *)v21,  *(void *)&v21[16]);
        }
      }
    }

    else
    {
      uint64_t v17 = sub_10008C90C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315394;
        *(void *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
        *(_WORD *)&v21[12] = 2112;
        *(void *)&v21[14] = v7;
        LODWORD(v20) = 22;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s: Unsupported W5PeerDatabaseRequestVersion %@",  v21,  v20,  *(_OWORD *)v21,  *(void *)&v21[16]);
      }
    }

    v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
    ((void (**)(void, W5PeerDatabaseResponsePayload *, void))v18)[2](v18, v10, 0LL);
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDatabaseRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.dbQuery";
}

- (int64_t)currentVersion
{
  return 2LL;
}

- (W5DatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end