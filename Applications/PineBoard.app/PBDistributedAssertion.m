@interface PBDistributedAssertion
+ (id)distributedAssertionForDomain:(id)a3;
- (BOOL)isActive;
- (NSOrderedSet)orderedContext;
- (NSOrderedSet)orderedReasons;
- (NSSet)context;
- (NSSet)reasons;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)domain;
- (OS_os_log)log;
- (PBDistributedAssertion)initWithDomain:(id)a3;
- (PBDistributedAssertion)initWithParentAssertion:(id)a3;
- (PBDistributedAssertion)requireFocusedProcess;
- (PBDistributedAssertionDelegate)childAssertion;
- (PBDistributedAssertionDelegate)delegate;
- (id)_requireFocusedProcessUsingSceneManager:(id)a3 processStateInfoProvider:(id)a4;
- (id)acquireForReason:(id)a3 withConnection:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_handleStateChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation PBDistributedAssertion

- (PBDistributedAssertion)initWithDomain:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBDistributedAssertion;
  v5 = -[PBDistributedAssertion init](&v19, "init");
  v6 = sub_10003A714(v5, v4);
  objc_claimAutoreleasedReturnValue(v6);

  if (v5)
  {
    objc_initWeak(&location, v5);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    v15 = sub_10003A8D8;
    v16 = &unk_1003D1970;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v4,  &v13));
    compoundAssertion = v5->_compoundAssertion;
    v5->_compoundAssertion = (BSCompoundAssertion *)v7;

    v9 = v5->_compoundAssertion;
    id v10 = sub_1000F6CF4();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[BSCompoundAssertion setLog:](v9, "setLog:", v11, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (PBDistributedAssertion)initWithParentAssertion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBDistributedAssertion;
  v5 = -[PBDistributedAssertion init](&v9, "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  uint64_t v7 = sub_10003A714(v5, v6);
  objc_claimAutoreleasedReturnValue(v7);

  if (v5) {
    objc_storeWeak((id *)&v5->_parentAssertion, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBDistributedAssertion;
  -[PBDistributedAssertion dealloc](&v3, "dealloc");
}

- (id)acquireForReason:(id)a3 withConnection:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 remoteProcess]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( self->_compoundAssertion,  "acquireForReason:withContext:",  v6,  v7));

  return v8;
}

- (BOOL)isActive
{
  return -[BSCompoundAssertion isActive](self->_compoundAssertion, "isActive");
}

- (NSSet)context
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_compoundAssertion, "context"));
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (NSOrderedSet)orderedContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion orderedContext](self->_compoundAssertion, "orderedContext"));
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet"));
  }
  v5 = v4;

  return (NSOrderedSet *)v5;
}

- (NSSet)reasons
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion reasons](self->_compoundAssertion, "reasons"));
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (NSOrderedSet)orderedReasons
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion orderedReasons](self->_compoundAssertion, "orderedReasons"));
  objc_super v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet"));
  }
  v5 = v4;

  return (NSOrderedSet *)v5;
}

- (id)stateDumpBuilder
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_childAssertion = self->_lock_childAssertion;
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v6 = [v5 appendString:self->_domain withKey:@"domain"];
  id v7 =  objc_msgSend( v5,  "appendBool:withKey:",  -[PBDistributedAssertion isActive](self, "isActive"),  @"isActive");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAssertion);
  id v9 = [v5 appendPointer:WeakRetained withKey:@"parentAssertion"];

  id v10 = [v5 appendPointer:lock_childAssertion withKey:@"childAssertion"];
  return v5;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBDistributedAssertion succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBDistributedAssertion descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDistributedAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_domain withName:0];
  id v4 =  objc_msgSend( v3,  "appendBool:withName:",  -[PBDistributedAssertion isActive](self, "isActive"),  @"isActive");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDistributedAssertion descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDistributedAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = self->_lock_childAssertion;
  os_unfair_lock_unlock(&self->_lock);
  unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&self->_parentAssertion);
  if (v6 | WeakRetained)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003AECC;
    v10[3] = &unk_1003D1998;
    v10[4] = v6;
    id v11 = v5;
    v12 = self;
    id v13 = (id)WeakRetained;
    [v11 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];
  }

  id v8 = v5;

  return v8;
}

+ (id)distributedAssertionForDomain:(id)a3
{
  id v3 = sub_10003AF84((uint64_t)&OBJC_CLASS____PBDistributedAssertionRegistry, a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (PBDistributedAssertionDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PBDistributedAssertionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)log
{
  return (OS_os_log *)(id)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion log](self->_compoundAssertion, "log"));
}

- (void)setLog:(id)a3
{
}

- (PBDistributedAssertion)requireFocusedProcess
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_childAssertion = self->_lock_childAssertion;
  if (!lock_childAssertion)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    unint64_t v6 = -[_PBDistributedAssertionRequireFocusedProcess initWithParentAssertion:sceneManager:processStateInfoProvider:]( objc_alloc(&OBJC_CLASS____PBDistributedAssertionRequireFocusedProcess),  "initWithParentAssertion:sceneManager:processStateInfoProvider:",  self,  v5,  &stru_1003D1948);
    id v7 = self->_lock_childAssertion;
    self->_lock_childAssertion = (PBDistributedAssertionDelegate *)v6;

    lock_childAssertion = self->_lock_childAssertion;
  }

  id v8 = lock_childAssertion;
  os_unfair_lock_unlock(p_lock);
  return (PBDistributedAssertion *)v8;
}

- (id)_requireFocusedProcessUsingSceneManager:(id)a3 processStateInfoProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_childAssertion)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_lock_childAssertion == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273540();
    }
    id result = (id) _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

  else
  {
    id v9 = -[_PBDistributedAssertionRequireFocusedProcess initWithParentAssertion:sceneManager:processStateInfoProvider:]( objc_alloc(&OBJC_CLASS____PBDistributedAssertionRequireFocusedProcess),  "initWithParentAssertion:sceneManager:processStateInfoProvider:",  self,  v6,  v7);
    lock_childAssertion = self->_lock_childAssertion;
    self->_lock_childAssertion = (PBDistributedAssertionDelegate *)v9;

    id v11 = self->_lock_childAssertion;
    os_unfair_lock_unlock(p_lock);

    return v11;
  }

  return result;
}

- (void)_handleStateChange:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  id v7 = self->_lock_childAssertion;
  os_unfair_lock_unlock(p_lock);
  [WeakRetained distributedAssertion:self didChangeState:v5];
  -[PBDistributedAssertionDelegate distributedAssertion:didChangeState:]( v7,  "distributedAssertion:didChangeState:",  self,  v5);
}

- (PBDistributedAssertionDelegate)childAssertion
{
  return self->_lock_childAssertion;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end