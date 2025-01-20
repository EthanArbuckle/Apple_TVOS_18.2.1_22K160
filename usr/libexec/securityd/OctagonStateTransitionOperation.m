@interface OctagonStateTransitionOperation
+ (id)named:(id)a3 entering:(id)a4;
+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (id)initIntending:(id)a3 errorState:(id)a4;
- (void)setNextState:(id)a3;
@end

@implementation OctagonStateTransitionOperation

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionOperation;
  v9 = -[CKKSResultOperation init](&v12, "init");
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._descriptionUnderlyingError, a4);
    objc_storeStrong(p_isa + 11, a3);
  }

  return p_isa;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionOperation name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionOperation intendedState](self, "intendedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionOperation nextState](self, "nextState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OctagonStateTransitionOperation(%@): intended:%@ actual:%@>",  v3,  v4,  v5));

  return v6;
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initIntending:v11 errorState:v12];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v14);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100163DD8;
  v17[3] = &unk_100290F30;
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

@end