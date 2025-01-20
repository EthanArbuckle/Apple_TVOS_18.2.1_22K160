@interface RBAssertionBatchContext
+ (id)contextForProcess:(id)a3 acquisitionCompletionPolicy:(unint64_t)a4 withDescriptorsToAcquire:(id)a5 identifiersToInvalidate:(id)a6 daemonContext:(id)a7;
+ (id)contextForProcess:(id)a3 withDescriptorsToAcquire:(id)a4 identifiersToInvalidate:(id)a5 daemonContext:(id)a6;
- (BOOL)allowAbstractTarget;
- (BOOL)unitTesting;
- (NSArray)descriptorsToAcquire;
- (NSArray)identifiersToInvalidate;
- (RBDaemonContextProviding)daemonContext;
- (RBProcess)process;
- (id)_init;
- (id)acquisitionContextForDescriptor:(id)a3;
- (id)holdToken;
- (unint64_t)acquisitionPolicy;
- (void)setAcquisitionPolicy:(unint64_t)a3;
- (void)setAllowAbstractTarget:(BOOL)a3;
- (void)setHoldToken:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation RBAssertionBatchContext

+ (id)contextForProcess:(id)a3 withDescriptorsToAcquire:(id)a4 identifiersToInvalidate:(id)a5 daemonContext:(id)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_18:
    [MEMORY[0x1896077D8] currentHandler];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 262, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 261, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

  if (!v12) {
    goto LABEL_18;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_19:
  [MEMORY[0x1896077D8] currentHandler];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 263, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

LABEL_4:
  v29 = v13;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  v11,  *(void *)(*((void *)&v30 + 1) + 8 * i),  v14);
        unint64_t v22 = [v21 acquisitionPolicy];
        if (v22 > v18)
        {
          unint64_t v23 = v22;
        }
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v17);
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  [a1 contextForProcess:v11 acquisitionCompletionPolicy:v18 withDescriptorsToAcquire:v15 identifiersToInvalidate:v29 daemonContext:v14];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)contextForProcess:(id)a3 acquisitionCompletionPolicy:(unint64_t)a4 withDescriptorsToAcquire:(id)a5 identifiersToInvalidate:(id)a6 daemonContext:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1896077D8] currentHandler];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 290, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 291, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 289, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v17 = -[RBAssertionBatchContext _init](objc_alloc(&OBJC_CLASS___RBAssertionBatchContext), "_init");
  unint64_t v18 = (void *)v17[2];
  v17[2] = v13;
  id v19 = v13;

  uint64_t v20 = [v14 copy];
  v21 = (void *)v17[3];
  v17[3] = v20;

  uint64_t v22 = [v15 copy];
  unint64_t v23 = (void *)v17[4];
  v17[4] = v22;

  v17[5] = a4;
  return v17;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBAssertionBatchContext;
  return -[RBAssertionBatchContext init](&v3, sel_init);
}

- (id)acquisitionContextForDescriptor:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setHoldToken:self->_holdToken];
  [v4 setUnitTesting:self->_unitTesting];
  [v4 setAllowAbstractTarget:self->_allowAbstractTarget];
  [v4 setAcquisitionPolicy:self->_acquisitionPolicy];
  return v4;
}

- (RBProcess)process
{
  return self->_process;
}

- (NSArray)descriptorsToAcquire
{
  return self->_descriptorsToAcquire;
}

- (NSArray)identifiersToInvalidate
{
  return self->_identifiersToInvalidate;
}

- (BOOL)allowAbstractTarget
{
  return self->_allowAbstractTarget;
}

- (void)setAllowAbstractTarget:(BOOL)a3
{
  self->_allowAbstractTarget = a3;
}

- (unint64_t)acquisitionPolicy
{
  return self->_acquisitionPolicy;
}

- (void)setAcquisitionPolicy:(unint64_t)a3
{
  self->_acquisitionPolicy = a3;
}

- (id)holdToken
{
  return self->_holdToken;
}

- (void)setHoldToken:(id)a3
{
}

- (RBDaemonContextProviding)daemonContext
{
  return self->_daemonContext;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void).cxx_destruct
{
}

@end