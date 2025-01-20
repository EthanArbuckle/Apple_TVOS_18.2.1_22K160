@interface SHPrivacyDisclosureManager
- (BOOL)privacyDisclosureAcknowledgementRequired;
@end

@implementation SHPrivacyDisclosureManager

- (BOOL)privacyDisclosureAcknowledgementRequired
{
  uint64_t v2 = sh_log_object(self, a2);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Privacy acknowledgment status %i",  (uint8_t *)v5,  8u);
  }

  return 0;
}

@end