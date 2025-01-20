@interface VoucherStore
+ (VoucherStore)sharedInstance;
- (VoucherStore)init;
- (void)insertVoucher:(id)a3 forExternalID:(id)a4;
- (void)removeVoucherForExternalID:(id)a3;
- (void)usingVoucherForExternalID:(id)a3 applyQOSClass:(unsigned int)a4 executeBlock:(id)a5;
@end

@implementation VoucherStore

+ (VoucherStore)sharedInstance
{
  if (qword_10032E548 != -1) {
    dispatch_once(&qword_10032E548, &stru_1002E8C78);
  }
  return (VoucherStore *)(id)qword_10032E550;
}

- (VoucherStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VoucherStore;
  v2 = -[VoucherStore init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    vouchers = v2->_vouchers;
    v2->_vouchers = v3;
  }

  return v2;
}

- (void)insertVoucher:(id)a3 forExternalID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E5A0 != -1) {
    dispatch_once(&qword_10032E5A0, &stru_1002E8C98);
  }
  v8 = (os_log_s *)qword_10032E558;
  if (os_log_type_enabled((os_log_t)qword_10032E558, OS_LOG_TYPE_DEBUG)) {
    sub_10025FCEC((uint64_t)v7, (uint64_t)v6, v8);
  }
  v9 = self;
  objc_sync_enter(v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_vouchers, "setObject:forKeyedSubscript:", v6, v7);
  objc_sync_exit(v9);
}

- (void)removeVoucherForExternalID:(id)a3
{
  id v4 = a3;
  if (qword_10032E5A0 != -1) {
    dispatch_once(&qword_10032E5A0, &stru_1002E8C98);
  }
  v5 = (os_log_s *)qword_10032E558;
  if (os_log_type_enabled((os_log_t)qword_10032E558, OS_LOG_TYPE_DEBUG)) {
    sub_10025FD70((uint64_t)v4, v5);
  }
  id v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_vouchers, "setObject:forKeyedSubscript:", 0LL, v4);
  objc_sync_exit(v6);
}

- (void)usingVoucherForExternalID:(id)a3 applyQOSClass:(unsigned int)a4 executeBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_vouchers, "objectForKeyedSubscript:", v8));
  objc_sync_exit(v10);

  if (qword_10032E5A0 != -1) {
    dispatch_once(&qword_10032E5A0, &stru_1002E8C98);
  }
  v12 = (os_log_s *)qword_10032E558;
  if (os_log_type_enabled((os_log_t)qword_10032E558, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 1024;
    int v20 = v6;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "(VoucherStore) Executing block for externalID: %@, QOS(0x%x) Voucher %@",  buf,  0x1Cu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100043830;
  v15[3] = &unk_1002E6A50;
  id v16 = v9;
  id v13 = v9;
  v14 = (void (**)(void))dispatch_block_create_with_voucher_and_qos_class(0LL, v11, v6, 0LL, v15);
  v14[2]();
}

- (void).cxx_destruct
{
}

@end