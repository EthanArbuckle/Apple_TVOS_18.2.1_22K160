@interface KTOptInStateHolder
- (KTOptInStateHolder)init;
- (NSMutableDictionary)currentStates;
- (NSMutableDictionary)targetOptInStates;
- (NSString)currentTarget;
- (void)completedCurrentTarget;
- (void)setCurrentStates:(id)a3;
- (void)setCurrentTarget:(id)a3;
- (void)setTargetOptInStates:(id)a3;
@end

@implementation KTOptInStateHolder

- (KTOptInStateHolder)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___KTOptInStateHolder;
  v2 = -[KTOptInStateHolder init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTOptInStateHolder setTargetOptInStates:](v2, "setTargetOptInStates:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[KTOptInStateHolder setCurrentStates:](v2, "setCurrentStates:", v4);

    v5 = v2;
  }

  return v2;
}

- (void)completedCurrentTarget
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder targetOptInStates](self, "targetOptInStates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder currentTarget](self, "currentTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 targetResolved]);
    [v6 fulfill];

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder targetOptInStates](self, "targetOptInStates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInStateHolder currentTarget](self, "currentTarget"));
    [v7 setObject:0 forKeyedSubscript:v8];

    -[KTOptInStateHolder setCurrentTarget:](self, "setCurrentTarget:", 0LL);
  }

  else
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A958);
    }
    v9 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "asked to complete target, but didn't have one",  v10,  2u);
    }
  }
}

- (NSMutableDictionary)targetOptInStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTargetOptInStates:(id)a3
{
}

- (NSMutableDictionary)currentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentStates:(id)a3
{
}

- (NSString)currentTarget
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCurrentTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end