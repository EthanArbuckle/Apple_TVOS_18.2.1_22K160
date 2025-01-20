@interface CKKSCuttlefishAdapter
- (CKKSCuttlefishAdapter)initWithConnection:(id)a3;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (void)fetchCurrentItem:(id)a3 items:(id)a4 reply:(id)a5;
- (void)fetchPCSIdentityByKey:(id)a3 pcsservices:(id)a4 reply:(id)a5;
- (void)fetchRecoverableTLKShares:(id)a3 peerID:(id)a4 contextID:(id)a5 reply:(id)a6;
- (void)setCuttlefishXPCWrapper:(id)a3;
@end

@implementation CKKSCuttlefishAdapter

- (CKKSCuttlefishAdapter)initWithConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSCuttlefishAdapter;
  v5 = -[CKKSCuttlefishAdapter init](&v9, "init");
  if (v5)
  {
    v6 = -[CuttlefishXPCWrapper initWithCuttlefishXPCConnection:]( objc_alloc(&OBJC_CLASS___CuttlefishXPCWrapper),  "initWithCuttlefishXPCConnection:",  v4);
    cuttlefishXPCWrapper = v5->_cuttlefishXPCWrapper;
    v5->_cuttlefishXPCWrapper = v6;
  }

  return v5;
}

- (void)fetchCurrentItem:(id)a3 items:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCuttlefishAdapter cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003B108;
  v14[3] = &unk_100283F00;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [v11 fetchCurrentItemWithSpecificUser:v10 items:v12 reply:v14];
}

- (void)fetchPCSIdentityByKey:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCuttlefishAdapter cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003AFA4;
  v14[3] = &unk_100283F00;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [v11 fetchPCSIdentityByPublicKeyWithSpecificUser:v10 pcsservices:v12 reply:v14];
}

- (void)fetchRecoverableTLKShares:(id)a3 peerID:(id)a4 contextID:(id)a5 reply:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCuttlefishAdapter cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003AD8C;
  v17[3] = &unk_100283E38;
  id v18 = v10;
  id v19 = v11;
  id v15 = v10;
  id v16 = v11;
  [v14 fetchRecoverableTLKSharesWithSpecificUser:v13 peerID:v12 reply:v17];
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCuttlefishXPCWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end