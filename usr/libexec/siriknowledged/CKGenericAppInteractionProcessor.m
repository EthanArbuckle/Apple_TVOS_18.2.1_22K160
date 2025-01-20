@interface CKGenericAppInteractionProcessor
- (BOOL)processInteraction:(id)a3 bundleId:(id)a4;
- (BOOL)supportsSiriDonations;
- (id)bundleIdPredicate;
- (id)supportedTypes;
@end

@implementation CKGenericAppInteractionProcessor

- (BOOL)supportsSiriDonations
{
  return 0;
}

- (id)bundleIdPredicate
{
  return +[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL);
}

- (id)supportedTypes
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &__NSArray0__struct);
}

- (BOOL)processInteraction:(id)a3 bundleId:(id)a4
{
  v4 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    v7 = "-[CKGenericAppInteractionProcessor processInteraction:bundleId:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Duet monitors are disabled",  (uint8_t *)&v6,  0xCu);
  }

  return 0;
}

@end