@interface AccountEventCoordinator
- (AccountEventCoordinator)init;
- (id)description;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
@end

@implementation AccountEventCoordinator

- (AccountEventCoordinator)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AccountEventCoordinator;
  v2 = -[AccountEventCoordinator init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = sub_10019D5DC((uint64_t)v2);
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    accountsForWeekCache = v3->_accountsForWeekCache;
    v3->_accountsForWeekCache = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appstored.AccountEventCoordinator.dispatch", v8);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v3 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v12 timeIntervalSinceReferenceDate];
    v3->_lastCacheReset = v13;
  }

  return v3;
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019E60C;
  block[3] = &unk_1003E9880;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (id)description
{
  id v2 = sub_10019E434((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@",\n"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ events : [\n %@ \n] }",  v4));

  return v5;
}

- (void).cxx_destruct
{
}

@end