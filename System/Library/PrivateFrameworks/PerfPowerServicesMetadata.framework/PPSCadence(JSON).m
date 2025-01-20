@interface PPSCadence(JSON)
@end

@implementation PPSCadence(JSON)

+ (void)cadenceWithJSONObject:()JSON .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Cadence Tuples malformed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidCadenceJSON:()JSON .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Cadences is not an array: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidCadenceJSON:()JSON .cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Cadence json is not a dictionary: %@", v2);
  OUTLINED_FUNCTION_6();
}

@end