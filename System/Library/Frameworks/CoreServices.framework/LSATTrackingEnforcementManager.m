@interface LSATTrackingEnforcementManager
+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3;
@end

@implementation LSATTrackingEnforcementManager

+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3
{
  if (getATTrackingEnforcementManagerClass()) {
    return -[objc_class shouldEnforceTrackingWithReasonCode:]( getATTrackingEnforcementManagerClass(),  "shouldEnforceTrackingWithReasonCode:",  a3);
  }
  _LSDefaultLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    +[LSATTrackingEnforcementManager shouldEnforceTrackingWithReasonCode:].cold.1(v5);
  }

  if (a3) {
    *a3 = 0LL;
  }
  return 1;
}

+ (void)shouldEnforceTrackingWithReasonCode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "Class ATTrackingEnforcementManager not found. Enforcing tracking restrictions.",  v1,  2u);
}

@end