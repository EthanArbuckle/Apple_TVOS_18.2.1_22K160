@interface PPSCadenceTuple
+ (BOOL)isValidCadenceTupleJSON:(id)a3;
+ (id)cadenceTupleWithJSONObject:(id)a3;
- (PPSCadenceTuple)initWithCadenceType:(int)a3 value:(unint64_t)a4;
- (int)type;
- (unint64_t)value;
@end

@implementation PPSCadenceTuple

+ (id)cadenceTupleWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSCadenceTuple isValidCadenceTupleJSON:](&OBJC_CLASS___PPSCadenceTuple, "isValidCadenceTupleJSON:", v3))
  {
    v4 = objc_alloc(&OBJC_CLASS___PPSCadenceTuple);
    [v3 objectForKeyedSubscript:@"type"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 unsignedIntValue];
    [v3 objectForKeyedSubscript:@"value"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSCadenceTuple initWithCadenceType:value:]( v4,  "initWithCadenceType:value:",  v6,  [v7 unsignedIntegerValue]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidCadenceTupleJSON:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.4();
    }
    goto LABEL_14;
  }

  [v3 objectForKeyedSubscript:@"type"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.3(v3);
    }
    goto LABEL_14;
  }

  [v3 objectForKeyedSubscript:@"value"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    PPSStorageLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.2(v3);
    }
    goto LABEL_14;
  }

  [v3 objectForKeyedSubscript:@"value"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 integerValue];

  if (v9 < 0)
  {
    PPSStorageLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[PPSCadenceTuple(JSON) isValidCadenceTupleJSON:].cold.1(v3);
    }
LABEL_14:

    BOOL v10 = 0;
    goto LABEL_15;
  }

  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (PPSCadenceTuple)initWithCadenceType:(int)a3 value:(unint64_t)a4
{
  v5 = self;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    PPSMetricLog();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:].cold.1(a3, v6);
    }
LABEL_4:

LABEL_14:
    uint64_t v9 = 0LL;
    goto LABEL_15;
  }

  if (a3 == 4 && a4)
  {
    PPSMetricLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:].cold.2();
    }
LABEL_13:

    goto LABEL_14;
  }

  if (a3 == 3 && a4 - 12 <= 0xFFFFFFFFFFFFFFF4LL)
  {
    PPSMetricLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:].cold.3();
    }
    goto LABEL_13;
  }

  if (a3 == 5 && !a4)
  {
    PPSMetricLog();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PPSCadenceTuple initWithCadenceType:value:].cold.4(v6);
    }
    goto LABEL_4;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PPSCadenceTuple;
  v11 = -[PPSCadenceTuple init](&v12, sel_init);
  if (v11)
  {
    v11->_type = a3;
    v11->_value = a4;
  }

  v5 = v11;
  uint64_t v9 = v5;
LABEL_15:

  return v9;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCadenceType:(int)a1 value:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_188807000, a2, OS_LOG_TYPE_ERROR, "Invalid cadence type %d", (uint8_t *)v2, 8u);
}

- (void)initWithCadenceType:value:.cold.2()
{
}

- (void)initWithCadenceType:value:.cold.3()
{
}

- (void)initWithCadenceType:(os_log_t)log value:.cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 134217984;
  uint64_t v2 = 0LL;
  _os_log_error_impl(&dword_188807000, log, OS_LOG_TYPE_ERROR, "Invalid XPC cadence type  %llu", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

@end