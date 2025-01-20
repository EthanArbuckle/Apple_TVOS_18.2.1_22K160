@interface CKAlarmInteractionProcessor
- (BOOL)processInteraction:(id)a3 bundleId:(id)a4;
- (BOOL)supportsSiriDonations;
- (id)bundleIdPredicate;
- (id)supportedTypes;
@end

@implementation CKAlarmInteractionProcessor

- (BOOL)supportsSiriDonations
{
  return 0;
}

- (id)bundleIdPredicate
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF MATCHES %@",  @"com.apple.*");
}

- (id)supportedTypes
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100019398);
}

- (BOOL)processInteraction:(id)a3 bundleId:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 intent]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 verb]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 parametersByName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"repeat"]);
  id v10 = [v9 count];

  if (!v10)
  {
    v11 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]";
      v12 = "%s Ignoring non-Recurring events";
      goto LABEL_14;
    }

@end