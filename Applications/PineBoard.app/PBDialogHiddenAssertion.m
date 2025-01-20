@interface PBDialogHiddenAssertion
- (BSSimpleAssertion)assertion;
- (NSString)reason;
- (PBDialogHiddenAssertion)initWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PBDialogHiddenAssertion

- (PBDialogHiddenAssertion)initWithReason:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBDialogHiddenAssertion;
  v5 = -[PBDialogHiddenAssertion init](&v20, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    reason = v5->_reason;
    v5->_reason = v6;

    v8 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
    v9 = (objc_class *)objc_opt_class(v5);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v5->_reason;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100149AEC;
    v18[3] = &unk_1003D25C0;
    v13 = v5;
    v19 = v13;
    v14 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( v8,  "initWithIdentifier:forReason:invalidationBlock:",  v11,  v12,  v18);
    assertion = v13->_assertion;
    v13->_assertion = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v16 _registerDialogHiddenAssertion:v13];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBDialogHiddenAssertion;
  -[PBDialogHiddenAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
}

- (NSString)reason
{
  return self->_reason;
}

- (BSSimpleAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
}

@end