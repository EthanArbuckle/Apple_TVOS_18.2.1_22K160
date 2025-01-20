@interface PPSMetricManager
+ (id)allDeclMetrics;
+ (id)allDeclMetricsForSubsystem:(id)a3;
+ (id)allDeclSubsystem;
+ (id)metricDeclMap;
+ (void)metricDeclMap;
@end

@implementation PPSMetricManager

+ (id)metricDeclMap
{
  if (metricDeclMap_onceToken != -1) {
    dispatch_once(&metricDeclMap_onceToken, &__block_literal_global_0);
  }
  logHandle();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[PPSMetricManager metricDeclMap].cold.1();
  }

  return (id)metricDeclMap_subsystemToDeclClassMap;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke()
{
  v0 = (void *)objc_opt_new();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__PPSMetricManager_metricDeclMap__block_invoke_2;
  block[3] = &unk_18A290DC8;
  id v5 = v0;
  id v3 = v0;
  objc_enumerateClasses(0LL, 0LL, (Protocol *)&unk_18C72A6B8, 0LL, block);
  uint64_t v1 = [v3 copy];
  v2 = (void *)metricDeclMap_subsystemToDeclClassMap;
  metricDeclMap_subsystemToDeclClassMap = v1;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  [a2 subsystem];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:a2 forKeyedSubscript:v4];

  logHandle();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(a2);
  }
}

+ (id)allDeclSubsystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allDeclMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 metricDeclMap];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allValues];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __34__PPSMetricManager_allDeclMetrics__block_invoke;
  v8[3] = &unk_18A290DF0;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __34__PPSMetricManager_allDeclMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_18C72A6B8])
  {
    id v3 = *(void **)(a1 + 32);
    [v5 allDeclMetrics];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObjectsFromArray:v4];
  }
}

+ (id)allDeclMetricsForSubsystem:(id)a3
{
  id v4 = a3;
  [a1 metricDeclMap];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && ([v6 conformsToProtocol:&unk_18C72A6B8] & 1) != 0)
  {
    [v6 allDeclMetrics];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    logHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[PPSMetricManager allDeclMetricsForSubsystem:].cold.1((uint64_t)v4, v8);
    }

    v7 = 0LL;
  }

  return v7;
}

+ (void)metricDeclMap
{
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_188807000, v2, v3, "subsystemToDeclClassMap class name %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)allDeclMetricsForSubsystem:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_188807000,  a2,  OS_LOG_TYPE_DEBUG,  "No static declaration available for subsystem: %@",  (uint8_t *)&v2,  0xCu);
}

@end