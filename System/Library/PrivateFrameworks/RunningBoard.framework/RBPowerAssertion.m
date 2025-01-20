@interface RBPowerAssertion
+ (__CFString)_nameForPreventIdleSleepIdentifiers:(uint64_t)a1;
- (RBPowerAssertion)init;
- (id)_calculateNewName;
- (id)_preventIdleSleepIdentifiers;
- (id)description;
- (int)_targetPid;
- (void)dealloc;
- (void)invalidateWithHandler:(uint64_t)a1;
- (void)updateWithAcquisitionHandler:(void *)a3 invalidationHander:;
@end

@implementation RBPowerAssertion

- (RBPowerAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBPowerAssertion;
  result = -[RBPowerAssertion init](&v3, sel_init);
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (__CFString)_nameForPreventIdleSleepIdentifiers:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if ([v2 count])
  {
    if ([v2 count] == 1)
    {
      [v2 anyObject];
      objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v5 = v2;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          uint64_t v9 = 0LL;
          do
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * v9) description];
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 addObject:v10];

            ++v9;
          }

          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v7);
      }

      [v4 sortUsingComparator:&__block_literal_global_1];
      unint64_t v11 = [v4 count];
      if (v11 >= 0x14) {
        uint64_t v12 = 20LL;
      }
      else {
        uint64_t v12 = v11;
      }
      [MEMORY[0x189607940] string];
      objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          [v4 objectAtIndexedSubscript:i];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v3, "appendFormat:", @";%@", v14);
        }
      }
    }
  }

  else
  {
    objc_super v3 = &stru_18A257E48;
  }

  return v3;
}

uint64_t __56__RBPowerAssertion__nameForPreventIdleSleepIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_calculateNewName
{
  id v1 = a1;
  if (a1)
  {
    id v2 = (__CFString *)a1[4];
    if (!v2) {
      id v2 = @"unknown";
    }
    objc_super v3 = v2;
    [v1 _preventIdleSleepIdentifiers];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBPowerAssertion _nameForPreventIdleSleepIdentifiers:]((uint64_t)&OBJC_CLASS___RBPowerAssertion, v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v5);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (int)_targetPid
{
  return 0;
}

- (id)_preventIdleSleepIdentifiers
{
  return 0LL;
}

- (void)updateWithAcquisitionHandler:(void *)a3 invalidationHander:
{
  v34[2] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    uint64_t v7 = [(id)a1 _targetPid];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    if ((int)v7 < 1 || *(_BYTE *)(a1 + 40))
    {
      uint64_t v9 = (IOPMAssertionID *)(a1 + 8);
      IOPMAssertionID v8 = *(_DWORD *)(a1 + 8);
      if (v8)
      {
        if (v6)
        {
          v6[2](v6);
          IOPMAssertionID v8 = *v9;
        }

        if (IOPMAssertionRelease(v8))
        {
          rbs_power_log();
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.3();
          }
        }

        else
        {
          rbs_ttl_log();
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            IOPMAssertionID v16 = *v9;
            *(_DWORD *)buf = 67240192;
            IOPMAssertionID v28 = v16;
            _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Released power assertion with ID %{public}d",  buf,  8u);
          }
        }

        *(_DWORD *)(a1 + 8) = 0;
        __int128 v17 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = 0LL;

        __int128 v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0LL;
      }
    }

    else
    {
      if (*(_DWORD *)(a1 + 8))
      {
        -[RBPowerAssertion _calculateNewName]((void *)a1);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (([*(id *)(a1 + 24) isEqualToString:v11] & 1) == 0)
        {
          rbs_ttl_log();
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            IOPMAssertionID v13 = *(_DWORD *)(a1 + 8);
            uint64_t v14 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 67240706;
            IOPMAssertionID v28 = v13;
            __int16 v29 = 2114;
            uint64_t v30 = v14;
            __int16 v31 = 2114;
            v32 = v11;
            _os_log_impl( &dword_188634000,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to rename power assertion %{public}d for target %{public}@ to %{public}@",  buf,  0x1Cu);
          }

          if (IOPMAssertionSetProperty(*(_DWORD *)(a1 + 8), @"AssertName", v11))
          {
            rbs_power_log();
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.2();
            }
          }

          objc_storeStrong((id *)(a1 + 24), v11);
        }
      }

      else
      {
        -[RBPowerAssertion _calculateNewName]((void *)a1);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603FC8] dictionary];
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = @"AssertName";
        v33[1] = @"AssertionOnBehalfOfPID";
        v34[0] = v11;
        [MEMORY[0x189607968] numberWithInt:v7];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v20;
        [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 addEntriesFromDictionary:v21];

        uint64_t v22 = IOPMAssertionDeclareSystemActivityWithProperties();
        if ((_DWORD)v22)
        {
          uint64_t v23 = v22;
          rbs_power_log();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.1(v7, v23, v24);
          }
        }

        else
        {
          rbs_power_log();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240448;
            IOPMAssertionID v28 = 0;
            __int16 v29 = 1026;
            LODWORD(v30) = v7;
            _os_log_impl( &dword_188634000,  v25,  OS_LOG_TYPE_DEFAULT,  "Acquired process power assertion with ID %{public}d for pid %{public}d",  buf,  0xEu);
          }

          uint64_t v26 = [MEMORY[0x189603F50] date];
          v24 = *(os_log_s **)(a1 + 16);
          *(void *)(a1 + 16) = v26;
        }
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  }
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2 object:self file:@"RBPowerAssertionManager.m" lineNumber:207 description:@"invalidate not called"];
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBPowerAssertion;
  -[RBPowerAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidateWithHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && !*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 1;
    id v4 = v3;
    -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:](a1, 0LL, v3);
    id v3 = v4;
  }
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v4 initWithFormat:@"<%@| id:%u name:%@ acquisitionDate:%@>", v5, self->_identifier, self->_name, self->_acquisitionDate];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
}

- (void)updateWithAcquisitionHandler:(os_log_s *)a3 invalidationHander:.cold.1( int a1,  uint64_t a2,  os_log_s *a3)
{
  LODWORD(v3) = 67240448;
  HIDWORD(v3) = a1;
  LOWORD(v4) = 1026;
  *(_DWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_0_2( &dword_188634000,  a2,  a3,  "Error acquiring process power assertion for pid %{public}d: 0x%{public}x",  v3,  v4);
  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithAcquisitionHandler:invalidationHander:.cold.2()
{
}

- (void)updateWithAcquisitionHandler:invalidationHander:.cold.3()
{
}

@end