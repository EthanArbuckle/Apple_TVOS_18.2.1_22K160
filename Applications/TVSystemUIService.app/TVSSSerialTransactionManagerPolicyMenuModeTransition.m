@interface TVSSSerialTransactionManagerPolicyMenuModeTransition
- (id)resultingQueueAfterAddingTransaction:(id)a3 inCurrentQueue:(id)a4;
- (int64_t)actionOnRunningTransaction:(id)a3 afterAddingTransaction:(id)a4;
@end

@implementation TVSSSerialTransactionManagerPolicyMenuModeTransition

- (int64_t)actionOnRunningTransaction:(id)a3 afterAddingTransaction:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return 1LL;
}

- (id)resultingQueueAfterAddingTransaction:(id)a3 inCurrentQueue:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v6 = [v14 arrayByAddingObject:location[0]];
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_100054B78;
  v12 = &unk_1001B7DB8;
  id v13 = location[0];
  id v7 = objc_msgSend(v6, "bs_filter:");
  objc_storeStrong(&v13, 0LL);

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

@end