@interface CKKSSecDbAdapter
- (BOOL)dispatchSyncWithConnection:(__OpaqueSecDbConnection *)a3 readWriteTxion:(BOOL)a4 block:(id)a5;
- (BOOL)insideSQLTransaction;
- (CKKSSecDbAdapter)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3;
- (void)dispatchSyncWithSQLTransaction:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CKKSSecDbAdapter

- (CKKSSecDbAdapter)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSSecDbAdapter;
  v6 = -[CKKSSecDbAdapter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)dispatchSyncWithConnection:(__OpaqueSecDbConnection *)a3 readWriteTxion:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  CFTypeRef cf = 0LL;
  if (v5) {
    uint64_t v9 = 5LL;
  }
  else {
    uint64_t v9 = 3LL;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100099E04;
  v16[3] = &unk_100284AD8;
  BOOL v18 = v5;
  v16[4] = self;
  id v10 = v8;
  id v17 = v10;
  BOOL v11 = sub_100105354((uint64_t)a3, v9, &cf, (uint64_t)v16);
  if (cf)
  {
    id v12 = sub_1000AA6AC(@"ckks", 0LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v21 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "error doing database transaction, major problems ahead: %@",  buf,  0xCu);
    }

    CFTypeRef v14 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v14);
    }
  }

  return v11;
}

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)os_transaction_create("com.apple.securityd.ckks");
  CFTypeRef cf = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100099DF0;
  v10[3] = &unk_100284B00;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  sub_100110ECC(1, 1, 0LL, (uint64_t)&cf, (uint64_t)v10);
  if (cf)
  {
    id v7 = sub_1000AA6AC(@"ckks", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v14 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "error getting database connection, major problems ahead: %@",  buf,  0xCu);
    }

    CFTypeRef v9 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v9);
    }
  }
}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)os_transaction_create("com.apple.securityd.ckks");
  CFTypeRef cf = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100099D50;
  v10[3] = &unk_100284B00;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  sub_100110ECC(0, 1, 0LL, (uint64_t)&cf, (uint64_t)v10);
  if (cf)
  {
    id v7 = sub_1000AA6AC(@"ckks", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v14 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "error getting database connection, major problems ahead: %@",  buf,  0xCu);
    }

    CFTypeRef v9 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v9);
    }
  }
}

- (BOOL)insideSQLTransaction
{
  return *v2;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end