@interface PurchaseHistoryService
- (void)executeQuery:(id)a3 withReplyHandler:(id)a4;
- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withReplyHandler:(id)a5;
- (void)showAllWithReplyHandler:(id)a3;
- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withReplyHandler:(id)a5;
- (void)updateWithContext:(unint64_t)a3 withReplyHandler:(id)a4;
@end

@implementation PurchaseHistoryService

- (void)executeQuery:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    if (self)
    {
      v13 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 processInfo]);
      self = (PurchaseHistoryService *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
    }

    int v18 = 138543618;
    v19 = v11;
    __int16 v20 = 2114;
    v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] executeQuery for client: %{public}@",  (uint8_t *)&v18,  0x16u);
  }

  id v16 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  sub_1001C6D2C((uint64_t)v17, v7, v6);
}

- (void)setHidden:(BOOL)a3 forStoreItemID:(int64_t)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  sub_1001C719C((uint64_t)v11, a3, a4, v10, v7);
}

- (void)showAllWithReplyHandler:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_1001C75D8((uint64_t)v7, v6, v3);
}

- (void)updateForAccountID:(int64_t)a3 withContext:(unint64_t)a4 withReplyHandler:(id)a5
{
  id v7 = a5;
  id v8 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  sub_1001C7C58((uint64_t)v11, a3, a4, v10, v7);
}

- (void)updateWithContext:(unint64_t)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  sub_1001C7520((uint64_t)v9, a3, v8, v5);
}

@end