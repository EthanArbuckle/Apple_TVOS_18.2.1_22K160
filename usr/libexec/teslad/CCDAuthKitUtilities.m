@interface CCDAuthKitUtilities
+ (BOOL)shouldActivateAnisette;
+ (void)midWithCompletion:(id)a3;
@end

@implementation CCDAuthKitUtilities

+ (BOOL)shouldActivateAnisette
{
  return 0;
}

+ (void)midWithCompletion:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = *(os_log_s **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ignoring mid on this platform", v5, 2u);
  }

  if (v3) {
    v3[2](v3);
  }
}

@end