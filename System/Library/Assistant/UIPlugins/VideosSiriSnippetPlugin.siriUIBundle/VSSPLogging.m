@interface VSSPLogging
+ (void)debugLog:(id)a3;
+ (void)errorLog:(id)a3;
+ (void)log:(id)a3;
@end

@implementation VSSPLogging

+ (void)log:(id)a3
{
  id v3 = a3;
  id v4 = sub_6210();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)errorLog:(id)a3
{
  id v3 = a3;
  id v4 = sub_6210();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_B3D0((uint64_t)v3, v5);
  }
}

+ (void)debugLog:(id)a3
{
  id v3 = a3;
  id v4 = sub_6210();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
}

@end