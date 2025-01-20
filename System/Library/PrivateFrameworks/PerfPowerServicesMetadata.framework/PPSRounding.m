@interface PPSRounding
+ (BOOL)isValidRounding:(int)a3 value:(unint64_t)a4;
+ (BOOL)isValidRoundingJSON:(id)a3;
+ (PPSRounding)roundingWithJSONObject:(id)a3;
+ (PPSRounding)roundingWithProto:(id)a3;
+ (id)roundDown;
+ (id)roundNearest;
+ (id)roundUp;
- (PPSRounding)initWithType:(int)a3 value:(unint64_t)a4;
- (id)json;
- (id)proto;
- (int)type;
- (unint64_t)value;
@end

@implementation PPSRounding

- (id)json
{
  v8[2] = *MEMORY[0x1895F89C0];
  v7[0] = @"type";
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[PPSRounding type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = @"value";
  v8[0] = v3;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[PPSRounding value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PPSRounding)roundingWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSRounding isValidRoundingJSON:](&OBJC_CLASS___PPSRounding, "isValidRoundingJSON:", v3))
  {
    v4 = objc_alloc(&OBJC_CLASS___PPSRounding);
    [v3 objectForKeyedSubscript:@"type"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 unsignedIntValue];
    [v3 objectForKeyedSubscript:@"value"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSRounding initWithType:value:](v4, "initWithType:value:", v6, [v7 unsignedIntegerValue]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidRoundingJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.6();
    }
    goto LABEL_17;
  }

  [v3 objectForKeyedSubscript:@"type"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.5(v3);
    }
    goto LABEL_17;
  }

  [v3 objectForKeyedSubscript:@"type"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v6 unsignedIntValue])
  {

LABEL_15:
    PPSMetricLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.1(v3);
    }
    goto LABEL_17;
  }

  [v3 objectForKeyedSubscript:@"type"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 unsignedIntValue];

  if (v8 >= 6) {
    goto LABEL_15;
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"value"];
  if (v9)
  {
    v10 = (void *)v9;
    [v3 objectForKeyedSubscript:@"value"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
      PPSStorageLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[PPSRounding(JSON) isValidRoundingJSON:].cold.4(v3);
      }
      goto LABEL_17;
    }
  }

  [v3 objectForKeyedSubscript:@"type"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v13 unsignedIntValue] == 4)
  {
  }

  else
  {
    [v3 objectForKeyedSubscript:@"type"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = [v16 unsignedIntValue];

    if (v17 != 5) {
      goto LABEL_20;
    }
  }

  [v3 objectForKeyedSubscript:@"value"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    PPSStorageLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding(JSON) isValidRoundingJSON:].cold.2(v3);
    }
    goto LABEL_17;
  }

+ (PPSRounding)roundingWithProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___PPSRounding);
  uint64_t v5 = [v3 type];
  uint64_t v6 = [v3 value];

  return -[PPSRounding initWithType:value:](v4, "initWithType:value:", v5, v6);
}

- (id)proto
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PPSPBRounding);
  -[PPSPBRounding setType:](v3, "setType:", -[PPSRounding type](self, "type"));
  -[PPSPBRounding setValue:](v3, "setValue:", -[PPSRounding value](self, "value"));
  return v3;
}

- (PPSRounding)initWithType:(int)a3 value:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (+[PPSRounding isValidRounding:value:](&OBJC_CLASS___PPSRounding, "isValidRounding:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___PPSRounding;
    v7 = -[PPSRounding init](&v17, sel_init);
    if (v7)
    {
      v7->_type = v5;
      v7->_value = a4;
    }

    self = v7;
    unsigned int v8 = self;
  }

  else
  {
    PPSMetricLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSRounding initWithType:value:].cold.1(v5, v9, v10, v11, v12, v13, v14, v15);
    }

    unsigned int v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidRounding:(int)a3 value:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  if ((a3 - 6) <= 0xFFFFFFFA)
  {
    PPSMetricLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PPSRounding initWithType:value:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_8:

    return 0;
  }

  BOOL result = 1;
  if ((a3 & 0xFFFFFFFE) == 4 && !a4)
  {
    PPSMetricLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSRounding isValidRounding:value:].cold.2(v4, v5, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_8;
  }

  return result;
}

+ (id)roundNearest
{
  if (roundNearest_onceToken != -1) {
    dispatch_once(&roundNearest_onceToken, &__block_literal_global_5);
  }
  return (id)roundNearest__nearest;
}

void __27__PPSRounding_roundNearest__block_invoke()
{
  v0 = -[PPSRounding initWithType:value:](objc_alloc(&OBJC_CLASS___PPSRounding), "initWithType:value:", 3LL, 0LL);
  v1 = (void *)roundNearest__nearest;
  roundNearest__nearest = (uint64_t)v0;
}

+ (id)roundDown
{
  if (roundDown_onceToken != -1) {
    dispatch_once(&roundDown_onceToken, &__block_literal_global_1_0);
  }
  return (id)roundDown__down;
}

void __24__PPSRounding_roundDown__block_invoke()
{
  v0 = -[PPSRounding initWithType:value:](objc_alloc(&OBJC_CLASS___PPSRounding), "initWithType:value:", 1LL, 0LL);
  v1 = (void *)roundDown__down;
  roundDown__down = (uint64_t)v0;
}

+ (id)roundUp
{
  if (roundUp_onceToken != -1) {
    dispatch_once(&roundUp_onceToken, &__block_literal_global_2_0);
  }
  return (id)roundUp__up;
}

void __22__PPSRounding_roundUp__block_invoke()
{
  v0 = -[PPSRounding initWithType:value:](objc_alloc(&OBJC_CLASS___PPSRounding), "initWithType:value:", 2LL, 0LL);
  v1 = (void *)roundUp__up;
  roundUp__up = (uint64_t)v0;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithType:(uint64_t)a3 value:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidRounding:(uint64_t)a3 value:(uint64_t)a4 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end