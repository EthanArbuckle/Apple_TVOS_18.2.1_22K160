@interface _DASDefaultsBudgetPersistence
+ (id)persistence;
- (NSDate)lastModulationDate;
- (NSMutableDictionary)budgetsInfo;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASDefaultsBudgetPersistence)init;
- (id)convertNameFromCompactToFull:(id)a3;
- (id)convertNameFromFullToCompact:(id)a3;
- (id)loadBudgetsWithExpectedNames:(id)a3;
- (void)saveBudgets:(id)a3;
- (void)saveModulationDate:(id)a3;
- (void)setBudgetsInfo:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLastModulationDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASDefaultsBudgetPersistence

- (_DASDefaultsBudgetPersistence)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASDefaultsBudgetPersistence;
  v2 = -[_DASDefaultsBudgetPersistence init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.dasd.budgetPersistence.defaultsqueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create("com.apple.duetactivityscheduler", "budgetDefaults");
    log = v2->_log;
    v2->_log = v7;

    v9 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.widgetRefreshBudgets");
    defaults = v2->_defaults;
    v2->_defaults = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"budgets"));
    v12 = (NSMutableDictionary *)[v11 mutableCopy];
    budgetsInfo = v2->_budgetsInfo;
    v2->_budgetsInfo = v12;

    if (!v2->_budgetsInfo)
    {
      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v15 = v2->_budgetsInfo;
      v2->_budgetsInfo = v14;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"lastModulation"));
    lastModulationDate = v2->_lastModulationDate;
    v2->_lastModulationDate = (NSDate *)v16;
  }

  return v2;
}

+ (id)persistence
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010FC8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001574F8 != -1) {
    dispatch_once(&qword_1001574F8, block);
  }
  return (id)qword_100157500;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000110A8;
  block[3] = &unk_100115120;
  block[4] = self;
  id v13 = v4;
  os_log_t v7 = v5;
  v14 = v7;
  id v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)saveBudgets:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000113C4;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)updateBudget:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000115C0;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)saveModulationDate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000116CC;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (NSDate)lastModulationDate
{
  uint64_t v6 = 0LL;
  os_log_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000117B8;
  v10 = sub_1000117C8;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000117D0;
  v5[3] = &unk_100115170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (id)convertNameFromFullToCompact:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  if ([v3 hasPrefix:@"com.apple.dasd.widget"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"com.apple.dasd.widget", "length")));

    id v4 = (id)v5;
  }

  return v4;
}

- (id)convertNameFromCompactToFull:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.dasd.widget",  a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)budgetsInfo
{
  return self->_budgetsInfo;
}

- (void)setBudgetsInfo:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setLastModulationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end