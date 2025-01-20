@interface PPSRounding(JSON)
@end

@implementation PPSRounding(JSON)

+ (void)isValidRoundingJSON:()JSON .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Rounding type is invalid %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRoundingJSON:()JSON .cold.2(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Rounding value not provided for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRoundingJSON:()JSON .cold.3(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Rounding value is not valid %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRoundingJSON:()JSON .cold.4(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Rounding value is not a number: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRoundingJSON:()JSON .cold.5(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_188807000, v2, v3, "Rounding type is not a number: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)isValidRoundingJSON:()JSON .cold.6()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_188807000, v0, v1, "Rounding json is not a dictionary: %@", v2);
  OUTLINED_FUNCTION_6();
}

@end