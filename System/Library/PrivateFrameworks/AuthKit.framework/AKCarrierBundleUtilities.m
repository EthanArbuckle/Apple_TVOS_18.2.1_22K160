@interface AKCarrierBundleUtilities
+ (AKCarrierBundleUtilities)sharedInstance;
- (AKCarrierBundleUtilities)init;
- (id)phoneBundleInfoWithAdditionalInfo:(id)a3 error:(id *)a4;
@end

@implementation AKCarrierBundleUtilities

- (AKCarrierBundleUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AKCarrierBundleUtilities;
  return -[AKCarrierBundleUtilities init](&v3, "init");
}

+ (AKCarrierBundleUtilities)sharedInstance
{
  if (qword_10020F3E8 != -1) {
    dispatch_once(&qword_10020F3E8, &stru_1001C7CF8);
  }
  return (AKCarrierBundleUtilities *)(id)qword_10020F3E0;
}

- (id)phoneBundleInfoWithAdditionalInfo:(id)a3 error:(id *)a4
{
  uint64_t v6 = _AKLogSystem(self);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100132298((uint64_t)self, v7, v8, v9);
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  }
  return 0LL;
}

@end