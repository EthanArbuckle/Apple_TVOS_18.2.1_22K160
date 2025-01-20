@interface _TVSSAttentionTimeoutDisabledAssertion
- (BSSimpleAssertion)assertion;
- (NSString)reason;
- (NSString)token;
- (TVSSAttentionMonitor)attentionMonitor;
- (_TVSSAttentionTimeoutDisabledAssertion)initWithAttentionMonitor:(id)a3 reason:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _TVSSAttentionTimeoutDisabledAssertion

- (_TVSSAttentionTimeoutDisabledAssertion)initWithAttentionMonitor:(id)a3 reason:(id)a4
{
  v33 = self;
  SEL v32 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v30 = 0LL;
  objc_storeStrong(&v30, a4);
  v4 = v33;
  v33 = 0LL;
  v29.receiver = v4;
  v29.super_class = (Class)&OBJC_CLASS____TVSSAttentionTimeoutDisabledAssertion;
  v20 = -[_TVSSAttentionTimeoutDisabledAssertion init](&v29, "init");
  v33 = v20;
  objc_storeStrong((id *)&v33, v20);
  if (v20)
  {
    if (!location)
    {
      v18 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v18,  "handleFailureInMethod:object:file:lineNumber:description:",  v32,  v33,  @"TVSSAttentionMonitor.m",  201LL,  @"'attentionMonitor' must be non-null");
    }

    if (!v30)
    {
      v17 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v17,  "handleFailureInMethod:object:file:lineNumber:description:",  v32,  v33,  @"TVSSAttentionMonitor.m",  202LL,  @"'reason' must be non-null");
    }

    objc_storeStrong((id *)&v33->_attentionMonitor, location);
    v5 = (NSString *)[v30 copy];
    reason = v33->_reason;
    v33->_reason = v5;

    v13 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    v12 = -[NSUUID UUIDString](v13, "UUIDString");
    v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v12,  v33->_reason);

    objc_storeStrong((id *)&v33->_token, v28);
    v15 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
    v7 = (objc_class *)objc_opt_class(v33);
    v16 = NSStringFromClass(v7);
    v14 = v33->_reason;
    v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    v24 = sub_1000C9288;
    v25 = &unk_1001BA058;
    id v26 = location;
    v27 = v28;
    v8 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( v15,  "initWithIdentifier:forReason:invalidationBlock:",  v16,  v14,  &v21);
    assertion = v33->_assertion;
    v33->_assertion = v8;

    [location _registerAssertion:v33];
    objc_storeStrong((id *)&v27, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong((id *)&v28, 0LL);
  }

  v11 = v33;
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  return v11;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSSimpleAssertion invalidate](self->_assertion, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS____TVSSAttentionTimeoutDisabledAssertion;
  -[_TVSSAttentionTimeoutDisabledAssertion dealloc](&v2, "dealloc");
}

- (void)invalidate
{
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)token
{
  return self->_token;
}

- (BSSimpleAssertion)assertion
{
  return self->_assertion;
}

- (TVSSAttentionMonitor)attentionMonitor
{
  return self->_attentionMonitor;
}

- (void).cxx_destruct
{
}

@end