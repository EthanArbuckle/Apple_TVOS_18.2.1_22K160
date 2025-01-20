@interface NWStatsEntityMapperNEHelper
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
@end

@implementation NWStatsEntityMapperNEHelper

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    int v11 = 0;
    v12 = 0LL;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  [v5 getUUIDBytes:v16];
  uint64_t v7 = NEHelperCacheCopySigningIdentifierMapping();
  v8 = (void *)v7;
  if (!v7) {
    goto LABEL_8;
  }
  if (MEMORY[0x1895BB4D4](v7) != MEMORY[0x1895F92E8])
  {
    NStatGetLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

LABEL_8:
      int v11 = 0;
      v12 = 0LL;
      goto LABEL_9;
    }

    *(_WORD *)v15 = 0;
    v10 = "xpc get type does not give a string";
LABEL_6:
    _os_log_impl(&dword_187FF5000, (os_log_t)v9, OS_LOG_TYPE_ERROR, v10, v15, 2u);
    goto LABEL_7;
  }

  uint64_t v14 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v8)];
  if (!v14)
  {
    NStatGetLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)v15 = 0;
    v10 = "NEHelper signing id is string but no identifier";
    goto LABEL_6;
  }

  v12 = (void *)v14;
  int v11 = 4;
LABEL_9:

  if (a4) {
LABEL_10:
  }
    *a4 = v11;
LABEL_11:

  return v12;
}

@end