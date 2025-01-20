@interface RBProcessStateChange
- (RBProcessState)originalState;
- (RBProcessState)updatedState;
- (RBProcessStateChange)initWithIdentity:(id)a3 originalState:(id)a4 updatedState:(id)a5;
- (RBSProcessIdentity)identity;
- (id)changeByApplyingChange:(id)a3;
@end

@implementation RBProcessStateChange

- (RBProcessStateChange)initWithIdentity:(id)a3 originalState:(id)a4 updatedState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RBProcessStateChange;
  v12 = -[RBProcessStateChange init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identity, a3);
    objc_storeStrong((id *)&v13->_originalState, a4);
    objc_storeStrong((id *)&v13->_updatedState, a5);
  }

  return v13;
}

- (id)changeByApplyingChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 updatedState];
  v6 = (void *)v5;
  originalState = self->_originalState;
  if (originalState == (RBProcessState *)v5
    || v5
    && originalState
    && ([v4 updatedState],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v9 = -[RBProcessState isEqual:](originalState, "isEqual:", v8),
        v8,
        v9))
  {
    id v10 = 0LL;
  }

  else
  {
    id v10 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]( objc_alloc(&OBJC_CLASS___RBProcessStateChange),  "initWithIdentity:originalState:updatedState:",  self->_identity,  self->_originalState,  v6);
  }

  return v10;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (RBProcessState)originalState
{
  return self->_originalState;
}

- (RBProcessState)updatedState
{
  return self->_updatedState;
}

- (void).cxx_destruct
{
}

@end