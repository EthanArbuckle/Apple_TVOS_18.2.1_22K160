@interface AXSimpleAssetTaskBase
+ (BOOL)synchronous;
+ (id)taskGroupIdentifier;
+ (id)taskIdentifier;
+ (id)triggers;
+ (void)invokeWithArguments:(id)a3;
- (AXSimpleAssetTaskBase)initWithTrigger:(id)a3;
- (AXSimpleAssetTaskTrigger)trigger;
- (NSString)description;
- (OS_os_transaction)transaction;
- (unint64_t)completionStatus;
- (void)dealloc;
- (void)setCompletionStatus:(unint64_t)a3;
- (void)setTransaction:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation AXSimpleAssetTaskBase

- (AXSimpleAssetTaskBase)initWithTrigger:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXSimpleAssetTaskBase;
  v5 = -[AXSimpleAssetTaskBase init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[AXSimpleAssetTaskBase setCompletionStatus:](v5, "setCompletionStatus:", 0LL);
    -[AXSimpleAssetTaskBase setTrigger:](v6, "setTrigger:", v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = AXLogAssetDaemon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100015244(self, v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXSimpleAssetTaskBase;
  -[AXSimpleAssetTaskBase dealloc](&v5, "dealloc");
}

+ (id)taskGroupIdentifier
{
  return 0LL;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (id)triggers
{
  return &__NSArray0__struct;
}

+ (BOOL)synchronous
{
  return 1;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "taskIdentifier");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "taskGroupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p> ID=%@ Group=%@ Trigger=%@",  v5,  self,  v8,  v11,  v12));

  return (NSString *)v13;
}

+ (void)invokeWithArguments:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "taskIdentifier");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v8 invokeTaskById:v7 arguments:v4];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (AXSimpleAssetTaskTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (unint64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(unint64_t)a3
{
  self->_completionStatus = a3;
}

- (void).cxx_destruct
{
}

@end