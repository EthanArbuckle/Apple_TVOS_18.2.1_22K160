@interface MZTaskAssertion
+ (id)newBackgroundTaskWithExpirationHandler:(id)a3 debugInfo:(id)a4;
- (MZTaskAssertion)initWithExpirationHandler:(id)a3 debugInfo:(id)a4;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)performExpirationHandler;
@end

@implementation MZTaskAssertion

- (MZTaskAssertion)initWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MZTaskAssertion;
  v8 = -[MZTaskAssertion init](&v20, "init");
  if (v8)
  {
    id v9 = [v6 copy];
    id expireHandler = v8->_expireHandler;
    v8->_id expireHandler = v9;

    v11 = (NSString *)[v7 copy];
    debugInfo = v8->_debugInfo;
    v8->_debugInfo = v11;

    v13 = objc_alloc(&OBJC_CLASS___MZProcessAssertion);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000592E8;
    v18[3] = &unk_10023FF98;
    v14 = v8;
    v19 = v14;
    v15 = -[MZProcessAssertion initWithExpirationBlock:debugDescription:]( v13,  "initWithExpirationBlock:debugDescription:",  v18,  v8->_debugInfo);
    id v16 = v14[3];
    v14[3] = v15;

    [v14[3] identifier];
  }

  return v8;
}

+ (id)newBackgroundTaskWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[MZTaskAssertion initWithExpirationHandler:debugInfo:]( objc_alloc(&OBJC_CLASS___MZTaskAssertion),  "initWithExpirationHandler:debugInfo:",  v6,  v5);

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MZTaskAssertion;
  -[MZTaskAssertion dealloc](&v3, "dealloc");
}

- (void)performExpirationHandler
{
  uint64_t v3 = _MTLogCategoryAsyncTask(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Background time expired. App will sleep soon. Assertion: %@",  buf,  0xCu);
  }

  id expireHandler = (void (**)(void))self->_expireHandler;
  if (expireHandler)
  {
    if (self->_processAssertion)
    {
      expireHandler[2]();
      dispatch_time_t v6 = dispatch_time(0LL, 100000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005949C;
      block[3] = &unk_10023FF98;
      block[4] = self;
      dispatch_after(v6, &_dispatch_main_q, block);
    }
  }

- (void)invalidate
{
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    -[MZProcessAssertion identifier](processAssertion, "identifier");
    -[MZProcessAssertion invalidate](self->_processAssertion, "invalidate");
    v4 = self->_processAssertion;
    self->_processAssertion = 0LL;
  }

  id expireHandler = self->_expireHandler;
  self->_id expireHandler = 0LL;
}

- (id)description
{
  processAssertion = self->_processAssertion;
  v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)v6;
  v8 = @"YES";
  if (!processAssertion) {
    v8 = @"NO ";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p; held=%@; info='%@', underlying assertion = %@>",
                   v6,
                   self,
                   v8,
                   self->_debugInfo,
                   self->_processAssertion));

  return v9;
}

- (void).cxx_destruct
{
}

@end