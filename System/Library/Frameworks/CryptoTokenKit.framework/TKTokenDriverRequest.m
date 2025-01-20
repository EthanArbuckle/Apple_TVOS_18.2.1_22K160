@interface TKTokenDriverRequest
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation TKTokenDriverRequest

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"TKToken.m" lineNumber:270 description:@"Unexpected TKTokenDriverRequest context type"];
  }

  id v6 = v5;
  [v6 setup];
  TK_LOG_token();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[TKTokenDriverRequest beginRequestWithExtensionContext:].cold.1(v6, v7);
  }
}

- (void)beginRequestWithExtensionContext:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 driver];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 classID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "%{public}@: new beginRequest for token driver", v6);

  OUTLINED_FUNCTION_2();
}

@end