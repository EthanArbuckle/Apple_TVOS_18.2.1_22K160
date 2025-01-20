@interface AssertionManager
- (AssertionManager)init;
- (id)acquireKeepAliveAssertion;
- (id)createInstance;
- (void)invalidateKeepAliveAssertion;
@end

@implementation AssertionManager

- (AssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AssertionManager;
  v2 = -[AssertionManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    keepAliveAssertion = v2->_keepAliveAssertion;
    v2->_keepAliveAssertion = 0LL;

    v3->_assertionLock._os_unfair_lock_opaque = 0;
  }

  return v3;
}

- (id)acquireKeepAliveAssertion
{
  p_keepAliveAssertion = (id *)&self->_keepAliveAssertion;
  keepAliveAssertion = self->_keepAliveAssertion;
  if (keepAliveAssertion) {
    return keepAliveAssertion;
  }
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  objc_super v6 = (RBSAssertion *)objc_claimAutoreleasedReturnValue(-[AssertionManager createInstance](self, "createInstance"));
  v7 = self->_keepAliveAssertion;
  self->_keepAliveAssertion = v6;

  os_unfair_lock_unlock(p_assertionLock);
  v8 = self->_keepAliveAssertion;
  id v16 = 0LL;
  unsigned __int8 v9 = -[RBSAssertion acquireWithError:](v8, "acquireWithError:", &v16);
  id v10 = v16;
  id v11 = sub_10000A4EC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = *p_keepAliveAssertion;
      *(_DWORD *)buf = 134217984;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Acquired render assertion: %p", buf, 0xCu);
    }

    keepAliveAssertion = (RBSAssertion *)*p_keepAliveAssertion;
    return keepAliveAssertion;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100015FA0(p_keepAliveAssertion, (uint64_t)v10, v13);
  }

  return 0LL;
}

- (void)invalidateKeepAliveAssertion
{
  if (self->_keepAliveAssertion)
  {
    p_assertionLock = &self->_assertionLock;
    os_unfair_lock_lock(&self->_assertionLock);
    -[RBSAssertion invalidate](self->_keepAliveAssertion, "invalidate");
    id v4 = sub_10000A4EC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      keepAliveAssertion = self->_keepAliveAssertion;
      int v8 = 134217984;
      unsigned __int8 v9 = keepAliveAssertion;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Invalidated render assertion: %p",  (uint8_t *)&v8,  0xCu);
    }

    v7 = self->_keepAliveAssertion;
    self->_keepAliveAssertion = 0LL;

    os_unfair_lock_unlock(p_assertionLock);
  }

- (id)createInstance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.frontboard",  @"SystemShell"));
  v3 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityOfCurrentProcess]( &OBJC_CLASS___RBSProcessIdentity,  "identityOfCurrentProcess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentity:", v4));
  v15 = v2;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v7 = -[RBSAssertion initWithExplanation:target:attributes:]( v3,  "initWithExplanation:target:attributes:",  @"HangHUD is rendering HUD",  v5,  v6);

  id v8 = sub_10000A4EC();
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 134218242;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Created render assertion: %p withAttributes: %@",  (uint8_t *)&v11,  0x16u);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end