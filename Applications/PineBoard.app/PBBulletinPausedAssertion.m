@interface PBBulletinPausedAssertion
- (BSSimpleAssertion)assertion;
- (NSString)description;
- (NSString)reason;
- (PBBulletinPausedAssertion)initWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PBBulletinPausedAssertion

- (PBBulletinPausedAssertion)initWithReason:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBBulletinPausedAssertion;
  v5 = -[PBBulletinPausedAssertion init](&v17, "init");
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100060FFC;
    v15[3] = &unk_1003D25C0;
    v10 = v5;
    v16 = v10;
    v11 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( v6,  "initWithIdentifier:forReason:invalidationBlock:",  v9,  v4,  v15);
    assertion = v10->_assertion;
    v10->_assertion = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
    [v13 _registerBulletinPausedAssertion:v10];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBBulletinPausedAssertion;
  -[PBBulletinPausedAssertion dealloc](&v3, "dealloc");
}

- (NSString)reason
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[BSSimpleAssertion reason](self->_assertion, "reason"));
}

- (NSString)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBBulletinPausedAssertion reason](self, "reason"));
  [v3 appendString:v4 withName:0 skipIfEmpty:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v5;
}

- (void)invalidate
{
}

- (BSSimpleAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
}

@end