@interface DTAssertionManager
+ (id)sharedInstance;
+ (void)defaultAssertionFactories:(id *)a3 andDisableKeys:(id *)a4;
- (DTAssertionManager)init;
- (DTAssertionManager)initWithAssertionFactories:(id)a3 andDisableKeys:(id)a4;
- (void)removeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4;
- (void)removeClaimsHeldByClient:(id)a3;
- (void)takeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4 withOptions:(id)a5;
@end

@implementation DTAssertionManager

+ (void)defaultAssertionFactories:(id *)a3 andDisableKeys:(id *)a4
{
  if (qword_1000196B0 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  dispatch_once(&qword_1000196B0, &stru_100015180);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) qword_1000196B8;
LABEL_4:
  if (a4) {
    *a4 = (id) qword_1000196C0;
  }
}

+ (id)sharedInstance
{
  if (qword_1000196C8 != -1) {
    dispatch_once(&qword_1000196C8, &stru_1000151A0);
  }
  return (id)qword_1000196D0;
}

- (DTAssertionManager)init
{
  id v7 = 0LL;
  id v8 = 0LL;
  +[DTAssertionManager defaultAssertionFactories:andDisableKeys:]( &OBJC_CLASS___DTAssertionManager,  "defaultAssertionFactories:andDisableKeys:",  &v8,  &v7);
  id v3 = v8;
  id v4 = v7;
  v5 = -[DTAssertionManager initWithAssertionFactories:andDisableKeys:]( self,  "initWithAssertionFactories:andDisableKeys:",  v3,  v4);

  return v5;
}

- (DTAssertionManager)initWithAssertionFactories:(id)a3 andDisableKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DTAssertionManager;
  id v8 = -[DTAssertionManager init](&v18, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    assertionFactories = v8->_assertionFactories;
    v8->_assertionFactories = v9;

    v11 = (NSArray *)[v7 copy];
    disableKeys = v8->_disableKeys;
    v8->_disableKeys = v11;

    dispatch_queue_t v13 = dispatch_queue_create("DTAssertionManager", 0LL);
    guard = v8->_guard;
    v8->_guard = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    pidInfosByPid = v8->_pidInfosByPid;
    v8->_pidInfosByPid = v15;
  }

  return v8;
}

- (void)takeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4 withOptions:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if (v10)
  {
    guard = self->_guard;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000D3E8;
    block[3] = &unk_1000150F0;
    int v14 = a3;
    block[4] = self;
    id v12 = v10;
    id v13 = v8;
    dispatch_sync((dispatch_queue_t)guard, block);
  }
}

- (void)removeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    guard = self->_guard;
    block[1] = 3221225472LL;
    block[2] = sub_10000D854;
    block[3] = &unk_1000151F0;
    int v11 = a3;
    block[4] = self;
    id v8 = v6;
    block[0] = _NSConcreteStackBlock;
    id v10 = v6;
    dispatch_sync((dispatch_queue_t)guard, block);

    id v6 = v8;
  }
}

- (void)removeClaimsHeldByClient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    guard = self->_guard;
    block[1] = 3221225472LL;
    block[2] = sub_10000D968;
    block[3] = &unk_100015240;
    block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync((dispatch_queue_t)guard, block);

    id v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end