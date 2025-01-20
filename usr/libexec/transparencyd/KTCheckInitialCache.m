@interface KTCheckInitialCache
- (KTCheckInitialCache)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 stateMachine:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (void)setNextState:(id)a3;
- (void)setPendingFlag:(id)a3 stateMachine:(id)a4;
@end

@implementation KTCheckInitialCache

- (void)setPendingFlag:(id)a3 stateMachine:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  v6,  2LL,  60.0);

  [v5 _onqueueHandlePendingFlagLater:v7];
}

- (KTCheckInitialCache)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 stateMachine:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTCheckInitialCache;
  v12 = -[KTGroupOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    -[KTCheckInitialCache setNextState:](v12, "setNextState:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 smDataStore]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013F880;
    v18[3] = &unk_100283A28;
    v15 = v13;
    v19 = v15;
    id v20 = v11;
    [v14 fetchIDMSDeviceList:v18];

    v16 = v15;
  }

  return v13;
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end