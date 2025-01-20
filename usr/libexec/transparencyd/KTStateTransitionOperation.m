@interface KTStateTransitionOperation
+ (id)named:(id)a3 entering:(id)a4;
+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (id)description;
- (id)initIntending:(id)a3 errorState:(id)a4;
- (void)setNextState:(id)a3;
@end

@implementation KTStateTransitionOperation

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___KTStateTransitionOperation;
  id v9 = -[KTResultOperation init](&v12, "init");
  v10 = (id *)v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 9, a4);
    objc_storeStrong(v10 + 10, a3);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation intendedState](self, "intendedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation nextState](self, "nextState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTStateTransitionOperation(%@): intended:%@ actual:%@>",  v3,  v4,  v5));

  return v6;
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initIntending:v11 errorState:v12];
  id location = 0LL;
  objc_initWeak(&location, v14);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100141470;
  v17[3] = &unk_10027A860;
  objc_copyWeak(&v19, &location);
  id v15 = v13;
  id v18 = v15;
  [v14 addExecutionBlock:v17];
  [v14 setName:v10];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

+ (id)named:(id)a3 entering:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initIntending:v6 errorState:v6];

  [v8 setName:v7];
  return v8;
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

@end