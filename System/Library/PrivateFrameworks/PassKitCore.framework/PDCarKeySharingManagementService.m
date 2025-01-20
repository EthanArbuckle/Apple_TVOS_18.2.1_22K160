@interface PDCarKeySharingManagementService
- (PDCarKeySharingManagementService)init;
- (PDCarKeySharingManagementService)initWithWebServiceCoordinator:(id)a3 cardFileManager:(id)a4 cloudStoreDelegate:(id)a5 delegate:(id)a6;
- (void)acceptStatefulSharingMessage:(id)a3 transportIdentifier:(id)a4 activationCode:(id)a5 completion:(id)a6;
- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)handleIncomingMessage:(id)a3 transportIdentifier:(id)a4 share:(id)a5 completion:(id)a6;
- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4;
- (void)rejectInvitation:(id)a3 completion:(id)a4;
- (void)retryActivationCodeForShare:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
@end

@implementation PDCarKeySharingManagementService

- (PDCarKeySharingManagementService)init
{
  return 0LL;
}

- (PDCarKeySharingManagementService)initWithWebServiceCoordinator:(id)a3 cardFileManager:(id)a4 cloudStoreDelegate:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDCarKeySharingManagementService;
  v15 = -[PDCarKeySharingManagementService init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_cardFileManager, a4);
    objc_storeStrong((id *)&v16->_delegate, a6);
    v17 = objc_alloc_init(&OBJC_CLASS___PKDAManager);
    daManager = v16->_daManager;
    v16->_daManager = v17;

    objc_storeStrong((id *)&v16->_cloudStoreDelegate, a5);
  }

  return v16;
}

- (void)createShareInvitationFromShare:(id)a3 forPass:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v6 = a6;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Car key sharing not supported.",  v9,  2u);
  }

  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0LL, 0LL, 0LL);
}

- (void)revokeShares:(id)a3 forPass:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 subcredentials]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);

  BOOL v16 = (unint64_t)[v15 carKeyServerVersion] > 1;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
    objc_super v20 = @"No";
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    if (v7) {
      objc_super v20 = @"Yes";
    }
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    v54 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: [Revoke] revoking shares on %@ with shouldCascade: %@, shares: %@",  buf,  0x20u);
  }

  id v21 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v54 = sub_100229D40;
  v55 = sub_100229D50;
  id v56 = 0LL;
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x3032000000LL;
  v51[3] = sub_100229D40;
  v51[4] = sub_100229D50;
  v28 = v10;
  v52 = v28;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x3032000000LL;
  v49[3] = sub_100229D40;
  v49[4] = sub_100229D50;
  id v50 = 0LL;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100229D58;
  v45[3] = &unk_100643568;
  v45[4] = self;
  v47 = v51;
  id v22 = v15;
  id v46 = v22;
  v48 = buf;
  [v21 addOperation:v45];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10022A1B0;
  v39[3] = &unk_10064D9A0;
  BOOL v43 = v16;
  v39[4] = self;
  v41 = v51;
  id v23 = v22;
  BOOL v44 = v7;
  id v40 = v23;
  v42 = v49;
  [v21 addOperation:v39];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10022A724;
  v34[3] = &unk_10064D9C8;
  v34[4] = self;
  v36 = v51;
  id v24 = v23;
  BOOL v38 = v16;
  id v35 = v24;
  v37 = v49;
  [v21 addOperation:v34];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10022ACC8;
  v33[3] = &unk_100639728;
  v33[4] = self;
  v33[5] = v49;
  [v21 addOperation:v33];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10022AF34;
  v29[3] = &unk_10063C888;
  v31 = v51;
  id v26 = v12;
  id v30 = v26;
  v32 = buf;
  id v27 = [v21 evaluateWithInput:v25 completion:v29];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(buf, 8);
}

- (void)prewarmCreateShareForPass:(id)a3 completion:(id)a4
{
}

- (void)handleIncomingMessage:(id)a3 transportIdentifier:(id)a4 share:(id)a5 completion:(id)a6
{
  id v6 = (void (**)(id, uint64_t))a6;
  uint64_t Object = PKLogFacilityTypeGetObject(33LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SharingManagementService: Car key messages not supported.",  v9,  2u);
  }

  v6[2](v6, 1LL);
}

- (void)acceptStatefulSharingMessage:(id)a3 transportIdentifier:(id)a4 activationCode:(id)a5 completion:(id)a6
{
  id v7 = a6;
  uint64_t v8 = PDBasicError(@"KML not supported on this platform");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v9);
}

- (void)retryActivationCodeForShare:(id)a3 activationCode:(id)a4 completion:(id)a5
{
}

- (void)rejectInvitation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PDBasicError(@"KML not available");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void).cxx_destruct
{
}

@end