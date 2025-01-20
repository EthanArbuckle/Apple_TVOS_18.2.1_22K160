@interface RBEntitlements
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlementDomain:(unint64_t)a3;
- (NSString)description;
- (RBEntitlements)init;
- (id)_entitlementsForOption:(uint64_t)a1;
- (id)_initWithEntitlements:(id)a3;
@end

@implementation RBEntitlements

- (RBEntitlements)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBEntitlements.m" lineNumber:80 description:@"-init is not allowed on RBEntitlements"];

  return 0LL;
}

- (BOOL)hasEntitlement:(id)a3
{
  return -[NSSet containsObject:](self->_entitlements, "containsObject:", a3);
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v11 = (void (*)(void *))__39__RBEntitlements_hasEntitlementDomain___block_invoke;
  v12 = &unk_18A255AD8;
  v13 = self;
  v14 = &v15;
  v4 = v10;
  if (a3)
  {
    char v19 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unsigned int v7 = 0;
      do
      {
        if (((1 << v7) & a3) != 0)
        {
          v11(v4);
          if (v19) {
            break;
          }
          --v6;
        }

        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }

      while (v6 > 0);
    }
  }

  char v8 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __39__RBEntitlements_hasEntitlementDomain___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    unsigned int v7 = *(void **)(*(void *)(a1 + 32) + 8LL);
    v9 = v6;
    [MEMORY[0x189604010] setWithArray:v6];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 intersectsSet:v8];

    int v6 = v9;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      *a4 = 1;
    }
  }
}

- (id)_entitlementsForOption:(uint64_t)a1
{
  v19[3] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] != 1LL)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:sel__entitlementsForOption_ object:a1 file:@"RBEntitlements.m" lineNumber:130 description:@"use _entitlementsForOptions:"];
  }

  uint8x8_t v5 = 0LL;
  switch(a2)
  {
    case 1LL:
      v19[0] = @"com.apple.runningboard.process-state";
      v19[1] = @"com.apple.assertiond.app-state-monitor";
      v19[2] = @"com.apple.multitasking.termination";
      int v6 = (void *)MEMORY[0x189603F18];
      unsigned int v7 = v19;
      goto LABEL_10;
    case 2LL:
      v18[0] = @"com.apple.runningboard.launchprocess";
      v18[1] = @"com.apple.assertiond.system-shell";
      v18[2] = @"com.apple.private.xpc.launchd.app-server";
      int v6 = (void *)MEMORY[0x189603F18];
      unsigned int v7 = v18;
LABEL_10:
      uint64_t v8 = 3LL;
      goto LABEL_14;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
      goto LABEL_15;
    case 4LL:
      v17[0] = @"com.apple.runningboard.terminateprocess";
      v17[1] = @"com.apple.multitasking.termination";
      int v6 = (void *)MEMORY[0x189603F18];
      unsigned int v7 = v17;
      goto LABEL_13;
    case 8LL:
      v16[0] = @"com.apple.backboardd.debugapplications";
      v16[1] = @"com.apple.springboard.debugapplications";
      int v6 = (void *)MEMORY[0x189603F18];
      unsigned int v7 = v16;
LABEL_13:
      uint64_t v8 = 2LL;
      goto LABEL_14;
    default:
      if (a2 == 16)
      {
        uint64_t v15 = @"com.apple.runningboard.endowment-originator";
        [MEMORY[0x189603F18] arrayWithObjects:&v15 count:1];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[RBEntitlements _entitlementsForOption:](a1, 2LL);
        [v10 arrayByAddingObjectsFromArray:v11];
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        id result = v12;
      }

      else
      {
        if (a2 == 32)
        {
          v14[0] = @"com.apple.multitasking.unlimitedassertions";
          v14[1] = @"com.apple.multitasking.systemappassertions";
          v14[2] = @"com.apple.multitasking.newsstandassertions";
          v14[3] = @"com.apple.multitasking.voipassertions";
          v14[4] = @"com.apple.assertiond.system-shell";
          int v6 = (void *)MEMORY[0x189603F18];
          unsigned int v7 = v14;
          uint64_t v8 = 5LL;
LABEL_14:
          [v6 arrayWithObjects:v7 count:v8];
          uint8x8_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        }

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint8x8_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_entitlements, "allObjects");
  uint8x8_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsJoinedByString:@",\n\t\t\t"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = (void *)[v3 initWithFormat:@"<%@| [\n\t\t\t%@\n\t\t\t]>", v4, v6];

  return (NSString *)v7;
}

- (id)_initWithEntitlements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBEntitlements;
  uint8x8_t v5 = -[RBEntitlements init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSSet *)v6;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end