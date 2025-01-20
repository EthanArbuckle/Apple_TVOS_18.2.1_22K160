@interface SHLCloudAccountStatusPrecondition
- (SHLCloudAccountStatusPrecondition)initWithContainer:(id)a3;
- (SHLCloudBackedContainer)cloudContainer;
- (void)evaluatePreconditionWithCompletion:(id)a3;
- (void)setCloudContainer:(id)a3;
@end

@implementation SHLCloudAccountStatusPrecondition

- (SHLCloudAccountStatusPrecondition)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHLCloudAccountStatusPrecondition;
  v6 = -[SHLCloudAccountStatusPrecondition init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudContainer, a3);
  }

  return v7;
}

- (void)evaluatePreconditionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudAccountStatusPrecondition cloudContainer](self, "cloudContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 container]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002D934;
  v8[3] = &unk_10006DA00;
  id v9 = v4;
  id v7 = v4;
  [v6 accountStatusWithCompletionHandler:v8];
}

- (SHLCloudBackedContainer)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end