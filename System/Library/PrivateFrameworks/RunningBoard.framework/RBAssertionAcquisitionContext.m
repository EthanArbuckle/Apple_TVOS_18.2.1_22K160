@interface RBAssertionAcquisitionContext
+ (id)contextForProcess:(id)a3 withDescriptor:(id)a4 daemonContext:(id)a5;
- (BOOL)allowAbstractTarget;
- (BOOL)unitTesting;
- (RBDaemonContextProviding)daemonContext;
- (RBProcess)process;
- (RBSAssertionDescriptor)descriptor;
- (id)holdToken;
- (unint64_t)acquisitionPolicy;
- (void)setAcquisitionPolicy:(unint64_t)a3;
- (void)setAllowAbstractTarget:(BOOL)a3;
- (void)setHoldToken:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation RBAssertionAcquisitionContext

+ (id)contextForProcess:(id)a3 withDescriptor:(id)a4 daemonContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 234, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 235, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

LABEL_3:
  v13 = objc_alloc_init(&OBJC_CLASS___RBAssertionAcquisitionContext);
  objc_storeStrong((id *)&v13->_process, a3);
  objc_storeStrong((id *)&v13->_descriptor, a4);
  objc_storeStrong((id *)&v13->_daemonContext, a5);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  [v11 attributes];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v18++) applyToAcquisitionContext:v13];
      }

      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v16);
  }

  return v13;
}

- (RBProcess)process
{
  return self->_process;
}

- (RBSAssertionDescriptor)descriptor
{
  return self->_descriptor;
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