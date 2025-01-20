@interface CUKeychainItem(RPIdentity)
- (uint64_t)updateWithRPIdentity:()RPIdentity error:;
- (uint64_t)updateWithRPIdentity:()RPIdentity revisionUpdate:error:;
@end

@implementation CUKeychainItem(RPIdentity)

- (uint64_t)updateWithRPIdentity:()RPIdentity error:
{
  return [a1 updateWithRPIdentity:a3 revisionUpdate:0 error:a4];
}

- (uint64_t)updateWithRPIdentity:()RPIdentity revisionUpdate:error:
{
  id v8 = a3;
  [a1 metadata];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = a1;
  [a1 secrets];
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 accessGroups];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v10;
  v13 = v12;
  v250 = v12;
  int v222 = a4;
  v235 = a5;
  if (v11 == v12)
  {

    goto LABEL_6;
  }

  if ((v12 != 0LL) != (v11 == 0LL))
  {
    char v14 = [v11 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_12;
  }

LABEL_8:
  v17 = (void *)[v9 mutableCopy];
  v18 = v17;
  if (v17)
  {
    id v15 = v17;
  }

  else
  {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  [v15 setObject:v11 forKeyedSubscript:@"accessGroups"];
  uint64_t v16 = 0x80000LL;
LABEL_12:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 accountAltDSID];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v249 = v19;
  v252 = v20;
  if (![v20 length]) {
    goto LABEL_25;
  }
  id v21 = v20;
  id v22 = v19;
  v23 = v22;
  if (v21 == v22)
  {

    goto LABEL_25;
  }

  if ((v22 != 0LL) != (v21 == 0LL))
  {
    char v24 = [v21 isEqual:v22];

    if ((v24 & 1) != 0) {
      goto LABEL_25;
    }
    if (v15) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }

  if (!v15)
  {
LABEL_20:
    v25 = (void *)[v9 mutableCopy];
    v26 = v25;
    if (v25)
    {
      id v15 = v25;
    }

    else
    {
      id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
  }

@end