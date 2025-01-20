@interface IDSPeerIDQueryDataSource
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasQueryResultsForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (IDSIDStatusQueryController)IDStatusQueryController;
- (IDSPeerIDManagerProtocol)peerIDManager;
- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3;
- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3 IDStatusQueryController:(id)a4;
- (void)setIDStatusQueryController:(id)a3;
- (void)setPeerIDManager:(id)a3;
@end

@implementation IDSPeerIDQueryDataSource

- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3
{
  return -[IDSPeerIDQueryDataSource initWithPeerIDManager:IDStatusQueryController:]( self,  "initWithPeerIDManager:IDStatusQueryController:",  a3,  0LL);
}

- (IDSPeerIDQueryDataSource)initWithPeerIDManager:(id)a3 IDStatusQueryController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSPeerIDQueryDataSource;
  v8 = -[IDSPeerIDQueryDataSource init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_peerIDManager, v6);
    objc_storeStrong((id *)&v9->_IDStatusQueryController, a4);
  }

  return v9;
}

- (IDSIDStatusQueryController)IDStatusQueryController
{
  IDStatusQueryController = self->_IDStatusQueryController;
  if (!IDStatusQueryController)
  {
    v4 = (IDSIDStatusQueryController *)objc_claimAutoreleasedReturnValue( +[IDSIDStatusQueryController sharedInstance]( &OBJC_CLASS___IDSIDStatusQueryController,  "sharedInstance"));
    v5 = self->_IDStatusQueryController;
    self->_IDStatusQueryController = v4;

    IDStatusQueryController = self->_IDStatusQueryController;
  }

  return IDStatusQueryController;
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDQueryDataSource peerIDManager](self, "peerIDManager"));
  unsigned __int8 v12 = [v11 hasPeerTokensForURI:v10 fromURI:v9 service:v8];

  return v12;
}

- (BOOL)hasQueryResultsForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDQueryDataSource peerIDManager](self, "peerIDManager"));
  unsigned __int8 v12 = [v11 hasPeerTokensForURI:v8 fromURI:v9 service:v10];

  if ((v12 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDQueryDataSource IDStatusQueryController](self, "IDStatusQueryController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenFreeURI]);
    unsigned int v16 = [v14 cachedIDStatusForID:v15 fromURI:v9 fromService:v10 respectExpiry:1];

    if (v16 != 2)
    {
      BOOL v13 = 0;
      goto LABEL_10;
    }

    uint64_t v17 = OSLogHandleForIDSCategory("PeerLookup");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenFreeURI]);
      *(_DWORD *)buf = 138413058;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Already have cached invalid results {uri: %@, fromURI: %@, strippedURI: %@, service: %@}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"PeerLookup"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenFreeURI]);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"Already have cached invalid results {uri: %@, fromURI: %@, strippedURI: %@, service: %@}");
    }
  }

  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (IDSPeerIDManagerProtocol)peerIDManager
{
  return (IDSPeerIDManagerProtocol *)objc_loadWeakRetained((id *)&self->_peerIDManager);
}

- (void)setPeerIDManager:(id)a3
{
}

- (void)setIDStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end