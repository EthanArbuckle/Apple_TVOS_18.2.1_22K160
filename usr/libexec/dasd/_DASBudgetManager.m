@interface _DASBudgetManager
+ (id)sharedInstance;
- (BOOL)isWidgetRefreshBudget:(id)a3;
- (NSDictionary)budgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBudgetManager)init;
- (_DASSystemBudgetManager)systemBudgetManager;
- (_DASWidgetRefreshBudgetManager)widgetRefreshBudgetManager;
- (double)balanceForBudgetWithName:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)budgetKeyPathForBudgetName:(id)a3;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)reinstantiateConfiguredBudgets;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityNoLongerRunningWithParameters:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)reportActivityRunningWithParameters:(id)a3;
- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBudgets:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSystemBudgetManager:(id)a3;
- (void)setWidgetRefreshBudgetManager:(id)a3;
@end

@implementation _DASBudgetManager

- (_DASBudgetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASBudgetManager;
  v2 = -[_DASBudgetManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASSystemBudgetManager sharedInstance](&OBJC_CLASS____DASSystemBudgetManager, "sharedInstance"));
    systemBudgetManager = v2->_systemBudgetManager;
    v2->_systemBudgetManager = (_DASSystemBudgetManager *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager sharedInstance]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "sharedInstance"));
    widgetRefreshBudgetManager = v2->_widgetRefreshBudgetManager;
    v2->_widgetRefreshBudgetManager = (_DASWidgetRefreshBudgetManager *)v5;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058F24;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B10 != -1) {
    dispatch_once(&qword_100157B10, block);
  }
  return (id)qword_100157B18;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  return -[_DASSystemBudgetManager budgetKeyPathForBudgetName:]( self->_systemBudgetManager,  "budgetKeyPathForBudgetName:",  a3);
}

- (id)allBudgets
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSystemBudgetManager allBudgets](self->_systemBudgetManager, "allBudgets"));
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager allBudgets](self->_widgetRefreshBudgetManager, "allBudgets"));
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v5 = a3;
  unsigned int v6 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:]( widgetRefreshBudgetManager,  "managesBudgetWithName:",  v5);
  uint64_t v7 = 1LL;
  if (v6) {
    uint64_t v7 = 2LL;
  }
  -[objc_class balanceForBudgetWithName:]((&self->super.isa)[v7], "balanceForBudgetWithName:", v5);
  double v9 = v8;

  return v9;
}

- (double)capacityForBudgetWithName:(id)a3
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v5 = a3;
  unsigned int v6 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:]( widgetRefreshBudgetManager,  "managesBudgetWithName:",  v5);
  uint64_t v7 = 1LL;
  if (v6) {
    uint64_t v7 = 2LL;
  }
  -[objc_class capacityForBudgetWithName:]((&self->super.isa)[v7], "capacityForBudgetWithName:", v5);
  double v9 = v8;

  return v9;
}

- (void)reinstantiateConfiguredBudgets
{
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0) {
    -[_DASWidgetRefreshBudgetManager reinstantiateConfiguredBudgets]( self->_widgetRefreshBudgetManager,  "reinstantiateConfiguredBudgets");
  }
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0) {
    -[_DASSystemBudgetManager reinstantiateConfiguredBudgets]( self->_systemBudgetManager,  "reinstantiateConfiguredBudgets");
  }
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:]( widgetRefreshBudgetManager,  "managesBudgetWithName:",  v9);
  uint64_t v8 = 1LL;
  if (v7) {
    uint64_t v8 = 2LL;
  }
  -[objc_class setBalance:forBudgetWithName:]((&self->super.isa)[v8], "setBalance:forBudgetWithName:", v9, a3);
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:]( widgetRefreshBudgetManager,  "managesBudgetWithName:",  v9);
  uint64_t v8 = 1LL;
  if (v7) {
    uint64_t v8 = 2LL;
  }
  -[objc_class decrementBy:forBudgetWithName:]((&self->super.isa)[v8], "decrementBy:forBudgetWithName:", v9, a3);
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = -[_DASWidgetRefreshBudgetManager managesBudgetWithName:]( widgetRefreshBudgetManager,  "managesBudgetWithName:",  v9);
  uint64_t v8 = 1LL;
  if (v7) {
    uint64_t v8 = 2LL;
  }
  -[objc_class setCapacity:forBudgetWithName:]((&self->super.isa)[v8], "setCapacity:forBudgetWithName:", v9, a3);
}

- (BOOL)isWidgetRefreshBudget:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS____DASWidgetRefreshBudget);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)reportActivityRunning:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 widgetBudgetID]);

  if (v4) {
    -[_DASWidgetRefreshBudgetManager reportActivityRunning:]( self->_widgetRefreshBudgetManager,  "reportActivityRunning:",  v5);
  }
  -[_DASSystemBudgetManager reportActivityRunning:](self->_systemBudgetManager, "reportActivityRunning:", v5);
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 widgetBudgetID]);

  if (v4) {
    -[_DASWidgetRefreshBudgetManager reportActivityNoLongerRunning:]( self->_widgetRefreshBudgetManager,  "reportActivityNoLongerRunning:",  v5);
  }
  -[_DASSystemBudgetManager reportActivityNoLongerRunning:]( self->_systemBudgetManager,  "reportActivityNoLongerRunning:",  v5);
}

- (void)reportActivityRunningWithParameters:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0) {
    -[_DASWidgetRefreshBudgetManager reportActivityRunningWithParameters:]( self->_widgetRefreshBudgetManager,  "reportActivityRunningWithParameters:",  v5);
  }
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0) {
    -[_DASSystemBudgetManager reportActivityRunningWithParameters:]( self->_systemBudgetManager,  "reportActivityRunningWithParameters:",  v5);
  }
}

- (void)reportActivityNoLongerRunningWithParameters:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0) {
    -[_DASWidgetRefreshBudgetManager reportActivityNoLongerRunningWithParameters:]( self->_widgetRefreshBudgetManager,  "reportActivityNoLongerRunningWithParameters:",  v5);
  }
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0) {
    -[_DASSystemBudgetManager reportActivityNoLongerRunningWithParameters:]( self->_systemBudgetManager,  "reportActivityNoLongerRunningWithParameters:",  v5);
  }
}

- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector(self->_widgetRefreshBudgetManager, a2) & 1) != 0) {
    -[_DASWidgetRefreshBudgetManager reportUpdateForActivity:withDataConsumed:]( self->_widgetRefreshBudgetManager,  "reportUpdateForActivity:withDataConsumed:",  v8,  v7);
  }
  if ((objc_opt_respondsToSelector(self->_systemBudgetManager, a2) & 1) != 0) {
    -[_DASSystemBudgetManager reportUpdateForActivity:withDataConsumed:]( self->_systemBudgetManager,  "reportUpdateForActivity:withDataConsumed:",  v8,  v7);
  }
}

- (_DASSystemBudgetManager)systemBudgetManager
{
  return self->_systemBudgetManager;
}

- (void)setSystemBudgetManager:(id)a3
{
}

- (_DASWidgetRefreshBudgetManager)widgetRefreshBudgetManager
{
  return self->_widgetRefreshBudgetManager;
}

- (void)setWidgetRefreshBudgetManager:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end