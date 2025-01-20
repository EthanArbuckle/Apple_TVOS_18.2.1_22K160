@interface LSServerCleanEphemeralMobileContainersForFirstBoot
@end

@implementation LSServerCleanEphemeralMobileContainersForFirstBoot

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  _LSAliasGetPath(**(void ***)(a1 + 40), *(_DWORD *)(a3 + 12));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v14 = 0LL;
    v6 = -[FSNode initWithPath:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithPath:flags:error:",  v5,  0LL,  &v14);
    id v7 = v14;
    if (v6)
    {
      v8 = +[FSNode rootVolumeNode](&OBJC_CLASS___FSNode, "rootVolumeNode");
      if (!-[FSNode isEqual:](v6, "isEqual:", v8))
      {
        v9 = +[FSNode systemDataVolumeNode](&OBJC_CLASS___FSNode, "systemDataVolumeNode");
        if (-[FSNode isEqual:](v6, "isEqual:", v9))
        {
        }

        else
        {
          v10 = +[FSNode prebootVolumeNode](&OBJC_CLASS___FSNode, "prebootVolumeNode");
          BOOL v11 = -[FSNode isEqual:](v6, "isEqual:", v10);

          if (v11) {
            goto LABEL_9;
          }
          _LSDefaultLog();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v5;
            _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Marking container at %{public}@ for removal",  buf,  0xCu);
          }

          v13 = *(void **)(a1 + 32);
          [MEMORY[0x189607968] numberWithUnsignedInt:a2];
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v8];
        }
      }
    }

    else
    {
      _LSDefaultLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1();
      }
    }

LABEL_9:
  }
}

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3_8();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  v1,  (uint64_t)v1,  "Could not create node for container with path %{public}@: %@",  v2);
  OUTLINED_FUNCTION_1();
}

@end