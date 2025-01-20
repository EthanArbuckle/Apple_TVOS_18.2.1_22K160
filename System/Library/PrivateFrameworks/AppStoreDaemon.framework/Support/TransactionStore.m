@interface TransactionStore
- (void)dealloc;
- (void)init;
@end

@implementation TransactionStore

- (void)init
{
  if (!a1) {
    return 0LL;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_CLASS___TransactionStore;
  v1 = objc_msgSendSuper2(&v14, "init");
  if (v1)
  {
    dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreFoundation.TransactionStore", v3);
    v5 = (void *)v1[1];
    v1[1] = v4;

    v1[3] = 5000000000LL;
    v6 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    v7 = (void *)v1[4];
    v1[4] = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9 = (void *)v1[5];
    v1[5] = v8;

    uint64_t v10 = v1[1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10027D89C;
    v12[3] = &unk_1003EF9E0;
    v1 = v1;
    id v13 = v1;
    v1[2] = os_state_add_handler(v10, v12);
  }

  return v1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransactionStore;
  -[TransactionStore dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end