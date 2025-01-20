@interface PDHomeShareManagementService
- (PDHomeShareManagementService)init;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
@end

@implementation PDHomeShareManagementService

- (PDHomeShareManagementService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDHomeShareManagementService;
  return -[PDHomeShareManagementService init](&v3, "init");
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 homeInvite]);
  uint64_t v49 = 0LL;
  v50 = (id *)&v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_10003DA70;
  v53 = sub_10003DA80;
  id v54 = 0LL;
  Class v14 = off_1007047D8();
  uint64_t v16 = objc_opt_class(v14, v15);
  v17 = v50;
  id v48 = v50[5];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v16,  v13,  &v48));
  objc_storeStrong(v17 + 5, v48);
  if (!v18 || v50[5])
  {
    uint64_t v24 = PDBasicError(@"SharingManagementService: Missing home invite. error: %@");
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    (*((void (**)(id, void, void, id))v12 + 2))(v12, 0LL, 0LL, v19);
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    v46[0] = 0LL;
    v46[1] = v46;
    v46[2] = 0x3032000000LL;
    v46[3] = sub_10003DA70;
    v46[4] = sub_10003DA80;
    id v47 = 0LL;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10003DA88;
    v43[3] = &unk_10063BBC8;
    id v20 = objc_alloc_init(&OBJC_CLASS___PKHMHomeManager);
    id v44 = v20;
    v45 = v46;
    [v19 addOperation:v43];
    v41[0] = 0LL;
    v41[1] = v41;
    v41[2] = 0x3032000000LL;
    v41[3] = sub_10003DA70;
    v41[4] = sub_10003DA80;
    id v42 = 0LL;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10003DB8C;
    v36[3] = &unk_10063BC18;
    v38 = v46;
    id v37 = v18;
    v39 = v41;
    v40 = &v49;
    [v19 addOperation:v36];
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x3032000000LL;
    v34[3] = sub_10003DA70;
    v34[4] = sub_10003DA80;
    id v35 = 0LL;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10003DD50;
    v30[3] = &unk_10063BC40;
    v32 = v34;
    id v31 = v9;
    v33 = v41;
    [v19 addOperation:v30];
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10003DE2C;
    v25[3] = &unk_10063BC68;
    v28 = &v49;
    v29 = v34;
    id v27 = v12;
    id v22 = v20;
    id v26 = v22;
    id v23 = [v19 evaluateWithInput:v21 completion:v25];

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v41, 8);

    _Block_object_dispose(v46, 8);
  }

  _Block_object_dispose(&v49, 8);
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
}

- (void)updateShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
}

@end