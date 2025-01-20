@interface LACBATS
+ (BOOL)_isBATSEnvironmentSet;
+ (id)sharedInstance;
- (BOOL)isRunningInBATS;
- (BOOL)wasLaunchedByBATS;
- (LACBATS)init;
@end

@implementation LACBATS

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  return (id)sharedInstance_sharedInstance_0;
}

void __25__LACBATS_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;
}

- (LACBATS)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACBATS;
  v2 = -[LACBATS init](&v6, sel_init);
  if (v2)
  {
    BOOL v3 = +[LACBATS _isBATSEnvironmentSet](&OBJC_CLASS___LACBATS, "_isBATSEnvironmentSet");
    v2->_wasLaunchedByBATS = v3;
    if (v3)
    {
      v2->_isRunningInBATS = 1;
      +[LACGlobalDomain setRunningInBATS:](&OBJC_CLASS___LACGlobalDomain, "setRunningInBATS:", MEMORY[0x189604A88]);
    }

    else
    {
      v4 = +[LACGlobalDomain runningInBATS](&OBJC_CLASS___LACGlobalDomain, "runningInBATS");
      v2->_isRunningInBATS = [v4 BOOLValue];
    }
  }

  return v2;
}

+ (BOOL)_isBATSEnvironmentSet
{
  int v2 = os_variant_allows_internal_security_policies();
  if (v2)
  {
    [MEMORY[0x1896079D8] processInfo];
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 environment];
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 objectForKeyedSubscript:@"BATS"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v5 isEqualToString:@"1"];

    LOBYTE(v2) = v6;
  }

  return v2;
}

- (BOOL)wasLaunchedByBATS
{
  return self->_wasLaunchedByBATS;
}

- (BOOL)isRunningInBATS
{
  return self->_isRunningInBATS;
}

@end