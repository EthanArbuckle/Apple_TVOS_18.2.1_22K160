@interface ADSessionRemoteServerLimited
- (BOOL)_sessionRequiresConnection;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10;
- (void)_saCommandFailed:(id)a3;
- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7;
@end

@implementation ADSessionRemoteServerLimited

- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServerLimited;
  id v10 = -[ADSessionRemoteServer initOnQueue:withAccount:hubAccount:languageCode:connectionMode:sharedUserIdentifier:loggingSharedUserIdentifier:instanceContext:]( &v17,  "initOnQueue:withAccount:hubAccount:languageCode:connectionMode:sharedUserIdentifier:loggingSharedUserIdentifie r:instanceContext:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
  v11 = v10;
  if (v10)
  {
    [v10 setSessionType:1];
    v12 = objc_alloc(&OBJC_CLASS___NSString);
    v13 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[NSString initWithFormat:](v12, "initWithFormat:", @"%@.%@", &off_1005135A0, v14);
    [v11 _setSessionId:v15];
  }

  return v11;
}

- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer connection](self, "connection"));
  if ((id)v17 == v12)
  {
  }

  else
  {
    v18 = (void *)v17;
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[ADSessionRemoteServer siriNetworkConnection](self, "siriNetworkConnection"));

    if (v19 != v13) {
      goto LABEL_18;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
  else {
    BOOL v21 = 0;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
  else {
    BOOL v23 = 0;
  }

  if (!v21 && !v23) {
    goto LABEL_17;
  }
  unsigned int v24 = -[ADSessionRemoteServerLimited _sessionRequiresConnection](self, "_sessionRequiresConnection");
  v25 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    v26 = @"not ";
    if (v24) {
      v26 = &stru_1004FECA0;
    }
    *(_DWORD *)buf = 136315394;
    v29 = "-[ADSessionRemoteServerLimited _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:si"
          "riNetworkAnalysisInfo:]";
    __int16 v30 = 2112;
    v31 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s Server connection %@required for connection open timeout",  buf,  0x16u);
  }

  if (v24)
  {
LABEL_17:
    v27.receiver = self;
    v27.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServerLimited;
    -[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siriNetworkAnalysisInfo:]( &v27,  "_siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siriNetworkAnalysisInfo:",  v12,  v13,  v14,  v15,  v16);
  }

- (void)_saCommandFailed:(id)a3
{
  v4 = (__CFString *)a3;
  unsigned int v5 = -[ADSessionRemoteServerLimited _sessionRequiresConnection](self, "_sessionRequiresConnection");
  v6 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    v7 = @"not ";
    *(_DWORD *)buf = 136315650;
    v11 = "-[ADSessionRemoteServerLimited _saCommandFailed:]";
    __int16 v12 = 2112;
    if (v5) {
      v7 = &stru_1004FECA0;
    }
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Server connection %@required for %@",  buf,  0x20u);
  }

  if ((v5 & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServerLimited;
    -[ADSessionRemoteServer _saCommandFailed:](&v9, "_saCommandFailed:", v4);
  }

  else
  {
    v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[ADSessionRemoteServerLimited _saCommandFailed:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Ignoring %@ from server", buf, 0x16u);
    }
  }
}

- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  unsigned int v8 = -[ADSessionRemoteServerLimited _sessionRequiresConnection](self, "_sessionRequiresConnection");
  objc_super v9 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v10 = @"not ";
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[ADSessionRemoteServerLimited _siriConnection:didEncounterIntermediateError:]";
    __int16 v15 = 2112;
    if (v8) {
      id v10 = &stru_1004FECA0;
    }
    id v16 = v10;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Server connection %@required for intermediate error %@",  buf,  0x20u);
  }

  if ((v8 & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___ADSessionRemoteServerLimited;
    -[ADSessionRemoteServer _siriConnection:didEncounterIntermediateError:]( &v12,  "_siriConnection:didEncounterIntermediateError:",  v6,  v7);
  }

  else
  {
    v11 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[ADSessionRemoteServerLimited _siriConnection:didEncounterIntermediateError:]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Ignoring intermediate error %@ from server",  buf,  0x16u);
    }
  }
}

- (BOOL)_sessionRequiresConnection
{
  unsigned __int8 v3 = -[ADSession sessionRequiresServerConnection](self, "sessionRequiresServerConnection");
  unsigned int v4 = -[ADSession sessionRequiresSync](self, "sessionRequiresSync");
  if ((v3 & 1) == 0 && v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _requestId](self, "_requestId"));
    unsigned __int8 v3 = v5 == 0LL;
  }

  return v3;
}

@end