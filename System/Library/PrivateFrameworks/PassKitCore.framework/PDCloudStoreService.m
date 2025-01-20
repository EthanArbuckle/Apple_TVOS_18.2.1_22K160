@interface PDCloudStoreService
- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator;
- (PDCloudStoreService)initWithConnection:(id)a3;
- (PDCloudStoreService)initWithConnection:(id)a3 server:(id)a4;
- (PDCloudStoreTransactionSourceController)transactionSourceController;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4;
- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4;
- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4;
- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5;
- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3;
- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4;
- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5;
- (void)setCloudStoreNotificationCoordinator:(id)a3;
- (void)setTransactionSourceController:(id)a3;
- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4;
- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4;
- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6;
@end

@implementation PDCloudStoreService

- (PDCloudStoreService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDCloudStoreService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDCloudStoreService;
  v6 = -[PDCloudStoreService initWithConnection:](&v14, "initWithConnection:", v5);
  if (v6)
  {
    v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    uint64_t v9 = PKCloudStoreServiceInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setRemoteObjectInterface:v10];

    uint64_t v11 = PDCloudStoreServiceInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000680A8;
    v11[3] = &unk_100639AF0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000684AC;
    v18[3] = &unk_10063D9F8;
    v18[4] = self;
    unint64_t v22 = a3;
    id v19 = v12;
    id v20 = v13;
    BOOL v23 = a6;
    id v21 = v14;
    v17 = v18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v25 = v17;
    dispatch_async(v16, block);
  }
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000688C8;
    v17[3] = &unk_10063CD88;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    v16 = v17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v23 = v16;
    dispatch_async(v15, block);
  }
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100068C80;
    v12[3] = &unk_10063C478;
    v12[4] = self;
    unint64_t v14 = a3;
    BOOL v15 = a4;
    id v13 = v8;
    id v11 = v12;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v17 = v11;
    dispatch_async(v10, block);
  }
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100069070;
    v14[3] = &unk_10063B440;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    id v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v19 = v13;
    dispatch_async(v12, block);
  }
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100069450;
    v15[3] = &unk_10063DA20;
    v15[4] = self;
    unint64_t v18 = a3;
    id v16 = v10;
    int64_t v19 = a5;
    id v17 = v11;
    unint64_t v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v21 = v14;
    dispatch_async(v13, block);
  }
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100069838;
    v15[3] = &unk_10063DA20;
    v15[4] = self;
    unint64_t v18 = a3;
    id v16 = v10;
    int64_t v19 = a5;
    id v17 = v11;
    unint64_t v14 = v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v21 = v14;
    dispatch_async(v13, block);
  }
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100069C08;
    v11[3] = &unk_100639AF0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100069FF4;
  v17[3] = &unk_10063B440;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A3C4;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006A798;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006AB5C;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006AF78;
  v19[3] = &unk_10063DA48;
  v19[4] = self;
  id v20 = v10;
  BOOL v23 = a5;
  id v21 = v11;
  id v22 = v12;
  id v15 = v19;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v25 = v15;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B38C;
  v17[3] = &unk_10063B440;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006B77C;
  v17[3] = &unk_10063B440;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006BB6C;
  v17[3] = &unk_10063B440;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v13 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v22 = v13;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006BF8C;
  v23[3] = &unk_10063DA98;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int64_t v28 = a6;
  id v18 = v23;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v30 = v18;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, block);
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006C3B0;
  v23[3] = &unk_10063DA98;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int64_t v28 = a6;
  id v18 = v23;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v30 = v18;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, block);
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006C7B4;
  v19[3] = &unk_10063B150;
  v19[4] = self;
  id v20 = v10;
  id v22 = v12;
  int64_t v23 = a5;
  id v21 = v11;
  id v15 = v19;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v25 = v15;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006CB84;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006CF50;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006D320;
  v15[3] = &unk_10063C928;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  int64_t v18 = a3;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006D6E8;
  v13[3] = &unk_100639AF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006DA88;
  v9[3] = &unk_10063AC90;
  v9[4] = self;
  id v10 = v4;
  id v7 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v12 = v7;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006DE4C;
  v13[3] = &unk_10063C450;
  id v14 = v6;
  id v15 = v7;
  v13[4] = self;
  id v10 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E8C0;
  block[3] = &unk_10063A830;
  id v17 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v9, block);
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006E26C;
    v11[3] = &unk_100639AF0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006E440;
    v11[3] = &unk_100639AF0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    id v10 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v15 = v10;
    dispatch_async(v9, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006E5E8;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[PKEntitlementWhitelist peerPaymentAllAccess](self->_whitelist, "peerPaymentAllAccess"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006E784;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    id v7 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006E8C0;
    block[3] = &unk_10063A830;
    id v11 = v7;
    dispatch_async(v6, block);
  }

  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

- (PDCloudStoreNotificationCoordinator)cloudStoreNotificationCoordinator
{
  return self->_cloudStoreNotificationCoordinator;
}

- (void)setCloudStoreNotificationCoordinator:(id)a3
{
}

- (PDCloudStoreTransactionSourceController)transactionSourceController
{
  return self->_transactionSourceController;
}

- (void)setTransactionSourceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end