@interface OctagonCKKSPeerAdapter
- (BOOL)essential;
- (CKKSListenerCollection)peerChangeListeners;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSString)description;
- (NSString)peerID;
- (NSString)providerID;
- (OTPersonaAdapter)personaAdapter;
- (OctagonCKKSPeerAdapter)initWithPeerID:(id)a3 specificUser:(id)a4 personaAdapter:(id)a5 cuttlefishXPC:(id)a6;
- (TPSpecificUser)specificUser;
- (id)currentState;
- (id)fetchIdentity:(id)a3 error:(id *)a4;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (void)registerForPeerChangeUpdates:(id)a3;
- (void)sendSelfPeerChangedUpdate;
- (void)sendTrustedPeerSetChangedUpdate;
- (void)setEssential:(BOOL)a3;
- (void)setPeerChangeListeners:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPersonaAdapter:(id)a3;
@end

@implementation OctagonCKKSPeerAdapter

- (OctagonCKKSPeerAdapter)initWithPeerID:(id)a3 specificUser:(id)a4 personaAdapter:(id)a5 cuttlefishXPC:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OctagonCKKSPeerAdapter;
  v15 = -[OctagonCKKSPeerAdapter init](&v21, "init");
  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[OctagonCKKSPeerAdapter:%@]",  v11));
    providerID = v15->_providerID;
    v15->_providerID = (NSString *)v16;

    objc_storeStrong((id *)&v15->_peerID, a3);
    objc_storeStrong((id *)&v15->_specificUser, a4);
    objc_storeStrong((id *)&v15->_personaAdapter, a5);
    objc_storeStrong((id *)&v15->_cuttlefishXPCWrapper, a6);
    v18 = -[CKKSListenerCollection initWithName:]( objc_alloc(&OBJC_CLASS___CKKSListenerCollection),  "initWithName:",  @"ckks-sos");
    peerChangeListeners = v15->_peerChangeListeners;
    v15->_peerChangeListeners = v18;

    v15->_essential = 1;
  }

  return v15;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter peerID](self, "peerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OctagonCKKSPeerAdapter: %@ e:%d>",  v3,  -[OctagonCKKSPeerAdapter essential](self, "essential")));

  return (NSString *)v4;
}

- (id)fetchIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10003BE54;
  objc_super v21 = sub_10003BE64;
  id v22 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003C6A8;
  v13[3] = &unk_1002939C8;
  id v10 = v6;
  id v14 = v10;
  v15 = &v17;
  uint64_t v16 = a4;
  [v7 performBlockWithPersonaIdentifier:v9 block:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)fetchSelfPeers:(id *)a3
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_10003BE54;
  v15 = sub_10003BE64;
  id v16 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003C418;
  v10[3] = &unk_1002939C8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v5 performBlockWithPersonaIdentifier:v7 block:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchTrustedPeers:(id *)a3
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_10003BE54;
  v15 = sub_10003BE64;
  id v16 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003BFEC;
  v10[3] = &unk_1002939C8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  [v5 performBlockWithPersonaIdentifier:v7 block:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003BFAC;
  v9[3] = &unk_100290788;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 performBlockWithPersonaIdentifier:v7 block:v9];
}

- (void)sendSelfPeerChangedUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003BF2C;
  v6[3] = &unk_1002927F0;
  v6[4] = self;
  [v3 performBlockWithPersonaIdentifier:v5 block:v6];
}

- (void)sendTrustedPeerSetChangedUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003BEAC;
  v6[3] = &unk_1002927F0;
  v6[4] = self;
  [v3 performBlockWithPersonaIdentifier:v5 block:v6];
}

- (id)currentState
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_10003BE54;
  uint64_t v13 = sub_10003BE64;
  id v14 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter personaAdapter](self, "personaAdapter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCKKSPeerAdapter specificUser](self, "specificUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003BE6C;
  v8[3] = &unk_1002916D0;
  v8[4] = self;
  v8[5] = &v9;
  [v3 performBlockWithPersonaIdentifier:v5 block:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (TPSpecificUser)specificUser
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 32LL, 1);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 40LL, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPeerChangeListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end