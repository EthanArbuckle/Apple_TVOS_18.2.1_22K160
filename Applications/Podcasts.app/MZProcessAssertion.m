@interface MZProcessAssertion
- (MZProcessAssertion)initWithExpirationBlock:(id)a3 debugDescription:(id)a4;
- (NSString)description;
- (NSString)explanation;
- (RBSAssertion)systemAssertion;
- (id)expirationBlock;
- (unint64_t)identifier;
- (void)_withLockSetAssertion:(id)a3;
- (void)assertionWillInvalidate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setExpirationBlock:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setSystemAssertion:(id)a3;
@end

@implementation MZProcessAssertion

- (MZProcessAssertion)initWithExpirationBlock:(id)a3 debugDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MZProcessAssertion;
  v8 = -[MZProcessAssertion init](&v21, "init");
  if (v8)
  {
    if (qword_1002B6998 != -1) {
      dispatch_once(&qword_1002B6998, &stru_100242100);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_1002B6990);
    uint64_t v9 = ++qword_1002B2E00;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1002B6990);
    v8->_identifier = v9;
    id v10 = [v6 copy];
    id expirationBlock = v8->_expirationBlock;
    v8->_id expirationBlock = v10;

    if ([v7 length]) {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"-%@", v7));
    }
    else {
      v12 = &stru_100248948;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.podcasts.storebookkeeper-%@",  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"FinishTaskInterruptable"));
    v15 = objc_alloc(&OBJC_CLASS___RBSAssertion);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget currentProcess](&OBJC_CLASS___RBSTarget, "currentProcess"));
    v22 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v18 = -[RBSAssertion initWithExplanation:target:attributes:]( v15,  "initWithExplanation:target:attributes:",  v13,  v16,  v17);
    systemAssertion = v8->_systemAssertion;
    v8->_systemAssertion = v18;

    -[RBSAssertion addObserver:](v8->_systemAssertion, "addObserver:", v8);
    -[RBSAssertion acquireWithInvalidationHandler:]( v8->_systemAssertion,  "acquireWithInvalidationHandler:",  &stru_1002420E0);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MZProcessAssertion;
  v3 = -[MZProcessAssertion description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, assertionID = %lu",  v4,  self->_identifier));

  return (NSString *)v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MZProcessAssertion;
  -[MZProcessAssertion dealloc](&v3, "dealloc");
}

- (void)_withLockSetAssertion:(id)a3
{
  id v5 = a3;
  p_systemAssertion = &self->_systemAssertion;
  if ((-[RBSAssertion isEqual:](self->_systemAssertion, "isEqual:", v5) & 1) == 0)
  {
    objc_super v7 = *p_systemAssertion;
    objc_storeStrong((id *)&self->_systemAssertion, a3);
    if (*p_systemAssertion) {
      -[RBSAssertion addObserver:](*p_systemAssertion, "addObserver:", self);
    }
    -[RBSAssertion removeObserver:](v7, "removeObserver:", self);
    dispatch_time_t v8 = dispatch_time(0LL, 500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100058FD0;
    block[3] = &unk_10023FF98;
    v11 = v7;
    uint64_t v9 = v7;
    dispatch_after(v8, &_dispatch_main_q, block);
  }
}

- (void)setSystemAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MZProcessAssertion _withLockSetAssertion:](self, "_withLockSetAssertion:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (RBSAssertion)systemAssertion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_systemAssertion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)assertionWillInvalidate:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZProcessAssertion expirationBlock](self, "expirationBlock")),
        v5,
        v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZProcessAssertion expirationBlock](self, "expirationBlock"));
    objc_super v7 = (void (**)(void))[v6 copy];

    -[MZProcessAssertion setExpirationBlock:](self, "setExpirationBlock:", 0LL);
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v7[2](v7);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
  }

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion) {
    -[MZProcessAssertion _withLockSetAssertion:](self, "_withLockSetAssertion:", 0LL);
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)expirationBlock
{
  return self->_expirationBlock;
}

- (void)setExpirationBlock:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end