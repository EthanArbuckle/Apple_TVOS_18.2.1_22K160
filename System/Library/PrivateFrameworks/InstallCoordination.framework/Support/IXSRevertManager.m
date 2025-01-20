@interface IXSRevertManager
+ (void)revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5;
- (IXSRevertManager)init;
- (IXSTerminationAssertion)terminationAssertion;
- (OS_dispatch_queue)internalQueue;
- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4;
- (void)_revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)setInternalQueue:(id)a3;
- (void)setTerminationAssertion:(id)a3;
@end

@implementation IXSRevertManager

- (IXSRevertManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXSRevertManager;
  v2 = -[IXSRevertManager init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordination.revertManager", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)setTerminationAssertion:(id)a3
{
  dispatch_queue_t v5 = (IXSTerminationAssertion *)a3;
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSRevertManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  terminationAssertion = self->_terminationAssertion;
  if (v5 && terminationAssertion == v5)
  {
    objc_super v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1000793BC();
    }
  }

  else
  {
    if (terminationAssertion) {
      -[IXSTerminationAssertion invalidate](terminationAssertion, "invalidate");
    }
    objc_storeStrong((id *)&self->_terminationAssertion, a3);
  }
}

- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IX terminating appIdentity for reverting %@",  v5));

  objc_super v8 = objc_alloc(&OBJC_CLASS___IXSTerminationAssertion);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
  id v16 = 0LL;
  id v10 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( v8,  "initForBundleIDs:description:terminationResistance:error:",  v9,  v7,  50LL,  &v16);
  id v11 = v16;

  if (!v10)
  {
    id v13 = v11;
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }

  id v15 = v11;
  unsigned __int8 v12 = [v10 acquireAssertion:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    [v10 invalidate];

    if (a4)
    {
LABEL_4:
      id v13 = v13;
      id v10 = 0LL;
      *a4 = v13;
      goto LABEL_7;
    }

- (void)_revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100006E10;
  v12[3] = &unk_1000CCE80;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  id v14 = v7;
  id v15 = self;
  id v16 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v13;
  [v11 performCreationBlockingOperation:v12];
}

+ (void)revertAppWithIdentity:(id)a3 forClientWithName:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___IXSRevertManager);
  -[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]( v10,  "_revertAppWithIdentity:forClientWithName:completion:",  v9,  v8,  v7);
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSRevertManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007258;
  block[3] = &unk_1000CCE58;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSRevertManager;
  -[IXSRevertManager dealloc](&v4, "dealloc");
}

- (IXSTerminationAssertion)terminationAssertion
{
  return self->_terminationAssertion;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end