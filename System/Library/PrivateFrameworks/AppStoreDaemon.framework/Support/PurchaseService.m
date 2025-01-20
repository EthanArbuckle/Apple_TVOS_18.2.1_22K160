@interface PurchaseService
- (PurchaseService)init;
- (void)adopt:(id)a3 withReplyHandler:(id)a4;
- (void)adoptableBundleIdentifiersWithReplyHandler:(id)a3;
- (void)checkStoreQueue:(int64_t)a3;
- (void)notifyDialogCompleteForPurchaseID:(id)a3 result:(BOOL)a4 selectedButton:(int64_t)a5 withResultHandler:(id)a6;
- (void)processPurchase:(id)a3 withReplyHandler:(id)a4;
- (void)processPurchases:(id)a3 withReplyHandler:(id)a4;
- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5;
- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5;
- (void)startPurchase:(id)a3 withReplyHandler:(id)a4;
@end

@implementation PurchaseService

- (PurchaseService)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PurchaseService;
  v2 = -[PurchaseService init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppStoreDaemon.PurchaseService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    id v7 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    purchaseInterface = v2->_purchaseInterface;
    v2->_purchaseInterface = (PurchaseManagerInterface *)v8;
  }

  return v2;
}

- (void)adopt:(id)a3 withReplyHandler:(id)a4
{
  dispatch_queue_t v5 = (void (**)(id, void *))a4;
  v6 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_opt_class(self, v10);
    id v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 processInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    int v16 = 138412802;
    v17 = v12;
    __int16 v18 = 2114;
    v19 = v7;
    __int16 v20 = 2114;
    v21 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%@]: %{public}@ Adoption requested by %{public}@ but is not supported on this platform",  (uint8_t *)&v16,  0x20u);
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  909LL,  0LL));
  v5[2](v5, v11);
}

- (void)adoptableBundleIdentifiersWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (void *)objc_opt_class(self, v9);
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v14 = 138412802;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 2114;
    v19 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@]: %{public}@ Adoptable bundle identifiers requested by %{public}@ but is not supported on this platform",  (uint8_t *)&v14,  0x20u);
  }

  v4[2](v4, &__NSArray0__struct);
}

- (void)checkStoreQueue:(int64_t)a3
{
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10030BC48;
  v9[3] = &unk_1003EC880;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  sub_10022ED10(dispatchQueue, v9);
}

- (void)notifyDialogCompleteForPurchaseID:(id)a3 result:(BOOL)a4 selectedButton:(int64_t)a5 withResultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  dispatchQueue = self->_dispatchQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10030BED4;
  v18[3] = &unk_1003F2EA8;
  v18[4] = self;
  id v19 = v10;
  BOOL v23 = a4;
  id v21 = v11;
  int64_t v22 = a5;
  id v20 = v13;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  sub_10022ED10(dispatchQueue, v18);
}

- (void)processPurchase:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10030C3A4;
  v14[3] = &unk_1003EA5C0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)processPurchases:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10030C75C;
  v14[3] = &unk_1003EA5C0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  dispatchQueue = self->_dispatchQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10030CAE0;
  v18[3] = &unk_1003EA5C0;
  id v19 = v12;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v12;
  sub_10022ED10(dispatchQueue, v18);
}

- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  dispatchQueue = self->_dispatchQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10030CE90;
  v18[3] = &unk_1003EA5C0;
  id v19 = v8;
  id v20 = v12;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v12;
  id v17 = v8;
  sub_10022ED10(dispatchQueue, v18);
}

- (void)startPurchase:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10030D234;
  v14[3] = &unk_1003EA5C0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void).cxx_destruct
{
}

@end