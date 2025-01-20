@interface AMSDLeaveMultiUserHomeTask
- (AMSDLeaveMultiUserHomeTask)initWithHomeIdentifier:(id)a3;
- (NSUUID)homeIdentifier;
- (id)_generateAppProvidedData;
- (id)performTask;
@end

@implementation AMSDLeaveMultiUserHomeTask

- (AMSDLeaveMultiUserHomeTask)initWithHomeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDLeaveMultiUserHomeTask;
  v6 = -[AMSDLeaveMultiUserHomeTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeIdentifier, a3);
  }

  return v7;
}

- (id)performTask
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002584C;
  v5[3] = &unk_1000D6CA0;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDLeaveMultiUserHomeTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v5));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_generateAppProvidedData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDLeaveMultiUserHomeTask homeIdentifier](self, "homeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAuthenticateOptions amsd_createAppProvidedDataWithMultiUserAction:homeIdentifier:]( &OBJC_CLASS___AMSAuthenticateOptions,  "amsd_createAppProvidedDataWithMultiUserAction:homeIdentifier:",  @"leave",  v2));

  return v3;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
}

@end