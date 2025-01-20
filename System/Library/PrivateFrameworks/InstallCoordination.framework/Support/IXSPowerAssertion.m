@interface IXSPowerAssertion
- (IXSPowerAssertion)initWithAssertionName:(id)a3 details:(id)a4;
- (NSString)assertionName;
- (id)description;
- (unsigned)assertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation IXSPowerAssertion

- (IXSPowerAssertion)initWithAssertionName:(id)a3 details:(id)a4
{
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IXSPowerAssertion;
  v8 = -[IXSPowerAssertion init](&v18, "init");
  if (v8)
  {
    v9 = (NSString *)-[__CFString copy](v6, "copy");
    assertionName = v8->_assertionName;
    v8->_assertionName = v9;

    IOPMAssertionID AssertionID = 0;
    IOReturn v11 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  v6,  v7,  0LL,  0LL,  0.0,  0LL,  &AssertionID);
    v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100079324((uint64_t)v6, v11, v14);
      }

      IOPMAssertionID v15 = 0;
    }

    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[IXSPowerAssertion initWithAssertionName:details:]";
        __int16 v21 = 2112;
        v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Acquired power assertion %@",  buf,  0x16u);
      }

      IOPMAssertionID v15 = AssertionID;
    }

    v8->_assertion = v15;
  }

  return v8;
}

- (void)invalidate
{
  IOPMAssertionID assertion = self->_assertion;
  if (assertion)
  {
    IOReturn v4 = IOPMAssertionRelease(assertion);
    if (v4)
    {
      IOReturn v5 = v4;
      v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        v12 = "-[IXSPowerAssertion invalidate]";
        __int16 v13 = 1024;
        LODWORD(v14) = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: IOPMAssertionRelease returned %d",  (uint8_t *)&v11,  0x12u);
      }
    }

    v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      assertionName = self->_assertionName;
      int v11 = 136315394;
      v12 = "-[IXSPowerAssertion invalidate]";
      __int16 v13 = 2112;
      v14 = assertionName;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Released power assertion %@",  (uint8_t *)&v11,  0x16u);
    }

    self->_IOPMAssertionID assertion = 0;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXSPowerAssertion;
  -[IXSPowerAssertion dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  IOReturn v4 = NSStringFromClass(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  uint64_t v7 = 89LL;
  if (!self->_assertion) {
    uint64_t v7 = 78LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> %@ valid:%c>",  v5,  self,  self->_assertionName,  v7));

  return v8;
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (NSString)assertionName
{
  return self->_assertionName;
}

- (void).cxx_destruct
{
}

@end