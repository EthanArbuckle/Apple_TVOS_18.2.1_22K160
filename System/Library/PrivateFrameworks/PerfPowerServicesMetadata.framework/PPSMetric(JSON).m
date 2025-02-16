@interface PPSMetric(JSON)
@end

@implementation PPSMetric(JSON)

+ (void)metricWithJSONObject:()JSON .cold.1()
{
}

+ (void)metricWithJSONObject:()JSON .cold.2()
{
}

+ (void)metricWithJSONObject:()JSON .cold.3()
{
}

+ (void)metricWithJSONObject:()JSON .cold.4()
{
}

+ (void)metricsWithJSONData:()JSON .cold.1(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = 0LL;
  OUTLINED_FUNCTION_1_1(&dword_188807000, a1, a3, "Invalid JSON data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

+ (void)metricsWithJSONData:()JSON .cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "JSON object not of class NSArray: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)metricsWithJSONData:()JSON .cold.3()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Invalid JSON object: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)metricsWithJSONData:()JSON .cold.4()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "JSONObjectWithData failed with error: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)jsonDataWithMetrics:()JSON .cold.1(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = 0LL;
  OUTLINED_FUNCTION_1_1(&dword_188807000, a1, a3, "[JSON] Invalid metrics: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

+ (void)jsonDataWithMetrics:()JSON .cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Could not serialize json object: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidMetricJSON:()JSON .cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'metricDescription' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'exampleValue' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'dmaCompliant' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'filterEntryLogging' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.5()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'auxiliaryType' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.6()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'privacyClassification' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.7()
{
}

+ (void)isValidMetricJSON:()JSON .cold.8()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'obfuscation' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.9()
{
}

+ (void)isValidMetricJSON:()JSON .cold.10()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'deviceCapability' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.11()
{
}

+ (void)isValidMetricJSON:()JSON .cold.12()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'enabledPopulation' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.13()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'mode' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.14()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'timeToLive' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.15()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'storage' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.16()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1( &dword_188807000,  v2,  v3,  "Metric json property 'directionality' is not a %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.17()
{
}

+ (void)isValidMetricJSON:()JSON .cold.18()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'datatype' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.19()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'version' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.20()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'category' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.21()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'subsystem' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.22()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Metric json property 'name' is not a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidMetricJSON:()JSON .cold.23()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Metric json object not of class NSDictionary: %@", v2);
  OUTLINED_FUNCTION_6();
}

+ (void)isValidEnumDeclarationJSON:()JSON .cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Enum Map not a dictionary %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidSourceJSON:()JSON .cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Source is not a string %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidGroupingDimensionsJSON:()JSON .cold.1()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4( &dword_188807000,  v2,  v3,  "Grouping Dimension expects String, found key %@[%@]",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidGroupingDimensionsJSON:()JSON .cold.2()
{
  v0 = (void *)OUTLINED_FUNCTION_12();
  id v1 = OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_4(&dword_188807000, v2, v3, "Grouping Dimensions not an array %@[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end