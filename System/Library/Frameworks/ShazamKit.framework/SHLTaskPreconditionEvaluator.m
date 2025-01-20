@interface SHLTaskPreconditionEvaluator
+ (void)evaluatePreconditions:(id)a3 withCompletion:(id)a4;
@end

@implementation SHLTaskPreconditionEvaluator

+ (void)evaluatePreconditions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002D24C;
    v10[3] = &unk_10006D9B0;
    id v12 = v7;
    id v11 = v6;
    id v13 = a1;
    [v8 evaluatePreconditionWithCompletion:v10];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHLTaskPreconditionResult fulfilledResult]( &OBJC_CLASS___SHLTaskPreconditionResult,  "fulfilledResult"));
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

@end