@interface IDSGroupServerKeyElectionStore
- (void)storeItem:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSGroupServerKeyElectionStore

- (void)storeItem:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)SecKeyCopySubjectPublicKeyInfo([v5 newPg]);
  v8 = objc_alloc_init(&OBJC_CLASS___IDSGroupServer);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountBlob]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 signature]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 forwardingTicket]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 ENID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 parentVersion]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003AF674;
  v16[3] = &unk_100902F68;
  id v17 = v5;
  id v18 = v6;
  id v14 = v5;
  id v15 = v6;
  -[IDSGroupServer publishGroupForKey:data:signature:forwardingSig:ENID:version:completion:]( v8,  "publishGroupForKey:data:signature:forwardingSig:ENID:version:completion:",  v7,  v9,  v10,  v11,  v12,  v13,  v16);
}

@end