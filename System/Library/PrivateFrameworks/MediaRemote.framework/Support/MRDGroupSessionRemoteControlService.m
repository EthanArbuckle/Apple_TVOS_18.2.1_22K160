@interface MRDGroupSessionRemoteControlService
- (MRDGroupSessionRemoteControlService)initWithGroupSessionManager:(id)a3 delegate:(id)a4;
- (MRDGroupSessionRemoteControlServiceDelegate)delegate;
- (NSMapTable)connections;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
@end

@implementation MRDGroupSessionRemoteControlService

- (MRDGroupSessionRemoteControlService)initWithGroupSessionManager:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDGroupSessionRemoteControlService;
  v8 = -[MRDGroupSessionRemoteControlService init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    connections = v9->_connections;
    v9->_connections = (NSMapTable *)v10;

    [v6 addObserver:v9];
    uint64_t v13 = _MRLogForCategory(12LL, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionRemoteControlService] <%@> Initialized",  buf,  0xCu);
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionRemoteControlService] <%@> Dealloc",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDGroupSessionRemoteControlService;
  -[MRDGroupSessionRemoteControlService dealloc](&v5, "dealloc");
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v7 = a4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  [v5 setObject:v6 forKey:v7];

  [v7 addObserver:self];
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v6 = a4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
  [v5 removeObjectForKey:v6];

  [v6 removeObserver:self];
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_compactMap:", &stru_10039C980));
  v56 = v7;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_compactMap:", &stru_10039C9A0));
  v52 = (void *)v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v8));
  v51 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v9));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 leader]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  [v10 removeObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 leader]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  v49 = v11;
  [v11 removeObject:v15];

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v6]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 keyEnumerator]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v19));

  id v53 = [v10 mutableCopy];
  [v53 minusSet:v20];
  v48 = v20;
  id v21 = [v20 mutableCopy];
  v50 = v10;
  [v21 minusSet:v10];
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = v21;
  id v22 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v63 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)i);
        uint64_t v28 = _MRLogForCategory(12LL, v23);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v67 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionRemoteControlService] Disconnecting removed participant: %@",  buf,  0xCu);
        }

        v30 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  104LL,  @"Participant removed");
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v6]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:v27]);
        [v33 closeWithError:v30];

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:v6]);
        [v35 removeObjectForKey:v27];
      }

      id v24 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    }

    while (v24);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v54 = v53;
  id v36 = [v54 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      v39 = 0LL;
      do
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v54);
        }
        uint64_t v40 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v39);
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472LL;
        v57[2] = sub_10006E5D0;
        v57[3] = &unk_10039C9C8;
        v57[4] = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "msv_firstWhere:", v57));
        if (v42)
        {
          v43 = -[MRDGroupSessionTransportConnection initWithGroupSession:participant:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionTransportConnection),  "initWithGroupSession:participant:",  v6,  v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService connections](self, "connections"));
          v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v6]);
          [v45 setObject:v43 forKey:v40];

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionRemoteControlService delegate](self, "delegate"));
          [v46 groupSessionRemoteControlService:self didAcceptConnection:v43];
        }

        else
        {
          uint64_t v47 = _MRLogForCategory(12LL, v41);
          v43 = (MRDGroupSessionTransportConnection *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v67 = v40;
            __int16 v68 = 2112;
            id v69 = v6;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v43,  OS_LOG_TYPE_ERROR,  "[MRDGroupSessionRemoteControlService] Could not find added participant with identifier: %@ on session: %@",  buf,  0x16u);
          }
        }

        v39 = (char *)v39 + 1;
      }

      while (v37 != v39);
      id v37 = [v54 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }

    while (v37);
  }
}

- (MRDGroupSessionRemoteControlServiceDelegate)delegate
{
  return (MRDGroupSessionRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMapTable)connections
{
  return self->_connections;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end