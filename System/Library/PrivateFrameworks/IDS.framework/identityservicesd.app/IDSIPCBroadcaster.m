@interface IDSIPCBroadcaster
- (IDSIPCBroadcaster)init;
- (IDSNWBroadcaster)nwBroadcaster;
- (IMRemoteObjectBroadcaster)xpcBroadcaster;
- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5;
- (void)setNwBroadcaster:(id)a3;
- (void)setXpcBroadcaster:(id)a3;
@end

@implementation IDSIPCBroadcaster

- (IDSIPCBroadcaster)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSIPCBroadcaster;
  v2 = -[IDSIPCBroadcaster init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[IMRemoteObjectBroadcaster defaultBroadcaster]( &OBJC_CLASS___IMRemoteObjectBroadcaster,  "defaultBroadcaster"));
    xpcBroadcaster = v2->_xpcBroadcaster;
    v2->_xpcBroadcaster = (IMRemoteObjectBroadcaster *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___IDSNWBroadcaster);
    nwBroadcaster = v2->_nwBroadcaster;
    v2->_nwBroadcaster = v5;
  }

  return v2;
}

- (id)broadcastProxyForTargets:(id)a3 messageContext:(id)a4 protocol:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v18 = [v17 type];
        if (v18 == (id)1)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 remoteObject]);
          v20 = v11;
        }

        else
        {
          if (v18) {
            continue;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 remoteObject]);
          v20 = v10;
        }

        -[NSMutableArray addObject:](v20, "addObject:", v19);
      }

      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v14);
  }

  v21 = objc_alloc(&OBJC_CLASS___IDSIPCBroadcastProxy);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcaster xpcBroadcaster](self, "xpcBroadcaster"));
  id v23 = -[NSMutableArray copy](v10, "copy");
  v29 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 broadcastProxyForTargets:v23 messageContext:v9 protocol:v30]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcaster nwBroadcaster](self, "nwBroadcaster"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 broadcastProxyForTargets:v11]);
  v27 = -[IDSIPCBroadcastProxy initWithProtocol:xpcProxy:nwProxy:]( v21,  "initWithProtocol:xpcProxy:nwProxy:",  v30,  v24,  v26);

  return v27;
}

- (IMRemoteObjectBroadcaster)xpcBroadcaster
{
  return self->_xpcBroadcaster;
}

- (void)setXpcBroadcaster:(id)a3
{
}

- (IDSNWBroadcaster)nwBroadcaster
{
  return self->_nwBroadcaster;
}

- (void)setNwBroadcaster:(id)a3
{
}

- (void).cxx_destruct
{
}

@end