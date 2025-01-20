@interface DMDEffectivePolicy
- (NSSet)excludedIdentifiers;
- (void)setExcludedIdentifiers:(id)a3;
@end

@implementation DMDEffectivePolicy

- (NSSet)excludedIdentifiers
{
  return 0LL;
}

- (void)setExcludedIdentifiers:(id)a3
{
  uint64_t v3 = DMFPolicyLog(self, a2, a3);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_10006384C(v4);
  }
}

@end