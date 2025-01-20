@interface DMDTaskOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (NSArray)requiredEntitlements;
+ (NSSet)whitelistedClassesForRequest;
- (BOOL)isAsynchronous;
- (BOOL)runConcurrently;
- (BOOL)runOnMainThread;
- (DMDConfigurationEngine)configurationEngine;
- (DMDTaskOperation)initWithRequest:(id)a3;
- (DMDTaskOperationContext)context;
- (OS_os_transaction)transaction;
- (unint64_t)queueGroup;
- (void)dealloc;
- (void)endOperationWithDMFErrorCode:(int64_t)a3;
- (void)main;
- (void)operationDidFinish;
- (void)operationWillFinish;
- (void)operationWillStart;
- (void)runWithRequest:(id)a3;
- (void)setConfigurationEngine:(id)a3;
- (void)setContext:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDTaskOperation

- (void)dealloc
{
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = nullsub_4;
  block[3] = &unk_10009E070;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, &_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDTaskOperation;
  -[DMDTaskOperation dealloc](&v6, "dealloc");
}

- (DMDTaskOperation)initWithRequest:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDTaskOperation;
  v3 = -[DMDTaskOperation initWithRequest:](&v8, "initWithRequest:", a3);
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%p", v3));
    uint64_t v5 = os_transaction_create([v4 UTF8String]);
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }

  return v3;
}

- (void)operationWillStart
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Operation will start: %{public}@",  buf,  0xCu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDTaskOperation;
  -[DMDTaskOperation operationWillStart](&v3, "operationWillStart");
}

- (void)operationWillFinish
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Operation will finish: %{public}@",  buf,  0xCu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDTaskOperation;
  -[DMDTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[DMDTaskOperation setTransaction:](self, "setTransaction:", 0LL);
}

- (void)operationDidFinish
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100066F14((uint64_t)self);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDTaskOperation;
  -[DMDTaskOperation operationDidFinish](&v3, "operationDidFinish");
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDTaskOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 whitelistedClassesForRequest]);
  unsigned __int8 v8 = [v7 containsObject:objc_opt_class(v6)];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v13 = DMFInvalidParameterErrorKey;
    v14 = @"request";
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(1LL, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v10);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }

  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  if (-[DMDTaskOperation runOnMainThread](self, "runOnMainThread")
    && !+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    -[DMDTaskOperation performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  a2,  0LL,  -[DMDTaskOperation isAsynchronous](self, "isAsynchronous") ^ 1);
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation request](self, "request"));
    -[DMDTaskOperation runWithRequest:](self, "runWithRequest:", v4);
  }

+ (NSArray)requiredEntitlements
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSSet)whitelistedClassesForRequest
{
  return 0LL;
}

- (unint64_t)queueGroup
{
  return 0LL;
}

- (BOOL)runConcurrently
{
  return 0;
}

- (BOOL)runOnMainThread
{
  return 0;
}

- (void)runWithRequest:(id)a3
{
}

- (void)endOperationWithDMFErrorCode:(int64_t)a3
{
  uint64_t v4 = DMFErrorWithCodeAndUserInfo(a3, 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[DMDTaskOperation endOperationWithError:](self, "endOperationWithError:", v5);
}

- (DMDTaskOperationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (void)setConfigurationEngine:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end