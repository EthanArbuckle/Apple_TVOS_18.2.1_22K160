@interface MZUPPBagContext
+ (double)defaultPollingInterval;
+ (void)loadBagContextFromIMURLBag:(id)a3 completionBlock:(id)a4;
- (BOOL)UPPDisabled;
- (IMURLBag)bag;
- (NSString)domain;
- (NSURL)baseURLForGETAll;
- (NSURL)baseURLForPUTAll;
- (double)pollingInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBag:(id)a3;
- (void)setBaseURLForGETAll:(id)a3;
- (void)setBaseURLForPUTAll:(id)a3;
- (void)setPollingInterval:(double)a3;
@end

@implementation MZUPPBagContext

+ (double)defaultPollingInterval
{
  return 1800.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext bag](self, "bag"));
  [v4 setBag:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext baseURLForGETAll](self, "baseURLForGETAll"));
  [v4 setBaseURLForGETAll:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext baseURLForPUTAll](self, "baseURLForPUTAll"));
  [v4 setBaseURLForPUTAll:v7];

  return v4;
}

- (double)pollingInterval
{
  double result = self->_pollingInterval;
  if (fabs(result) <= 2.22044605e-16) {
    return 1800.0;
  }
  return result;
}

- (NSString)domain
{
  return (NSString *)@"com.apple.upp";
}

+ (void)loadBagContextFromIMURLBag:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v37[0] = 0LL;
      v37[1] = v37;
      v37[2] = 0x3032000000LL;
      v37[3] = sub_10003D584;
      v37[4] = sub_10003D594;
      v38 = objc_alloc_init(&OBJC_CLASS___MZUPPBagContext);
      v35[0] = 0LL;
      v35[1] = v35;
      v35[2] = 0x3032000000LL;
      v35[3] = sub_10003D584;
      v35[4] = sub_10003D594;
      id v36 = 0LL;
      dispatch_group_t v7 = dispatch_group_create();
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10003D59C;
      v30[3] = &unk_1002416F0;
      v8 = dispatch_queue_create(0LL, 0LL);
      v31 = v8;
      v33 = v37;
      v34 = v35;
      v9 = v7;
      v32 = v9;
      v10 = objc_retainBlock(v30);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10003D6F0;
      v25[3] = &unk_100241768;
      v11 = v9;
      v26 = v11;
      id v27 = v5;
      v12 = v8;
      v28 = v12;
      v13 = v10;
      id v29 = v13;
      v14 = objc_retainBlock(v25);
      ((void (*)(void *, void, Block_layout *, void, void))v14[2])( v14,  kMTBaseURLForGETAll,  &stru_1002417A8,  kMTSyncGetAllUPP,  kMTSyncGetAll);
      ((void (*)(void *, void, Block_layout *, void, void))v14[2])( v14,  kMTBaseURLForPUTAll,  &stru_1002417A8,  kMTSyncPutAllUPP,  kMTSyncPutAll);
      ((void (*)(void *, void, Block_layout *, void, void))v14[2])( v14,  kMTUPPDisabledBagContext,  &stru_1002417C8,  kMTUPPDisabled,  0LL);
      ((void (*)(void *, void, Block_layout *, void, void))v14[2])( v14,  kMTPollingIntervalBagContext,  &stru_1002417E8,  kMTUPPPollingInterval,  0LL);
      v15 = dispatch_queue_create(0LL, 0LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003D918;
      block[3] = &unk_100241810;
      v21 = v11;
      v23 = v35;
      v24 = v37;
      id v22 = v6;
      v16 = v11;
      dispatch_async(v15, block);

      _Block_object_dispose(v35, 8);
      _Block_object_dispose(v37, 8);
    }

    else
    {
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not load bag context due to invalid bag."));
      v40 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  100LL,  v18));

      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v19);
    }
  }
}

- (IMURLBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSURL)baseURLForGETAll
{
  return self->_baseURLForGETAll;
}

- (void)setBaseURLForGETAll:(id)a3
{
}

- (NSURL)baseURLForPUTAll
{
  return self->_baseURLForPUTAll;
}

- (void)setBaseURLForPUTAll:(id)a3
{
}

- (BOOL)UPPDisabled
{
  return self->_UPPDisabled;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (void).cxx_destruct
{
}

@end