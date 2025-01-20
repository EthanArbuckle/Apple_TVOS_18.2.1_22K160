@interface PPSMetricType(JSON)
@end

@implementation PPSMetricType(JSON)

+ (void)isValidMetricTypeJSON:()JSON .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "MetricType category is invalid %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricTypeJSON:()JSON .cold.2()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 objectForKeyedSubscript:@"category"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_188807000, v4, v5, "Dimension value is incorrect %@ for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_14();
}

+ (void)isValidMetricTypeJSON:()JSON .cold.3()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 objectForKeyedSubscript:@"category"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_188807000, v4, v5, "Measure value is incorrect %@ for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_14();
}

+ (void)isValidMetricTypeJSON:()JSON .cold.4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "MetricType category value is not a number: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricTypeJSON:()JSON .cold.5(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "MetricType category is not a number: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricTypeJSON:()JSON .cold.6()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "MetricType json is not a dictionary: %@", v2);
  OUTLINED_FUNCTION_6();
}

@end