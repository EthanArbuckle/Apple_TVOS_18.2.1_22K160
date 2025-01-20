@interface PDPassUpgradeController
- (PDPassUpgradeController)initWithWebService:(id)a3 cardFileManager:(id)a4;
- (void)dealloc;
- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6;
- (void)secureElementDidRunScriptsFromTSM;
@end

@implementation PDPassUpgradeController

- (PDPassUpgradeController)initWithWebService:(id)a3 cardFileManager:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001B3ACC;
  v10[3] = &unk_10064A058;
  id v6 = a4;
  id v11 = v6;
  v7 = -[PDPassUpgradeController initWithWebService:addPaymentPassToLibrary:]( self,  "initWithWebService:addPaymentPassToLibrary:",  a3,  v10);
  v8 = v7;
  if (v7) {
    PDNFSecureXPCRegisterSecureElementEventObserver(v7);
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDPassUpgradeController;
  -[PDPassUpgradeController dealloc](&v3, "dealloc");
}

- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
    v41[0] = 0LL;
    v41[1] = v41;
    v41[2] = 0x2810000000LL;
    v41[3] = &unk_10052E313;
    int v42 = 0;
    v39[0] = 0LL;
    v39[1] = v39;
    v39[2] = 0x3032000000LL;
    v39[3] = sub_1001B3F60;
    v39[4] = sub_1001B3F70;
    id v40 = (id)PDOSTransactionCreate("PDPassUpgradeController.upgrade");
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001B3F78;
    v35[3] = &unk_10064A080;
    v37 = v41;
    v38 = v39;
    id v15 = v14;
    id v36 = v15;
    id v16 = [v35 copy];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v18);

    dispatch_time_t v20 = dispatch_time(0LL, 300000000000LL);
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001B409C;
    handler[3] = &unk_100639AF0;
    v21 = v19;
    v32 = v21;
    id v22 = v15;
    id v33 = v22;
    id v23 = v16;
    id v34 = v23;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume(v21);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001B4158;
    v27[3] = &unk_10064A0A8;
    id v29 = v13;
    v24 = v21;
    v28 = v24;
    id v25 = v23;
    id v30 = v25;
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___PDPassUpgradeController;
    -[PDPassUpgradeController requestPassUpgrade:pass:diagnosticReason:completion:]( &v26,  "requestPassUpgrade:pass:diagnosticReason:completion:",  v10,  v11,  v12,  v27);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
  }
}

- (void)secureElementDidRunScriptsFromTSM
{
}

@end