@interface PPSMetricType
+ (BOOL)isValidMetricType:(int)a3 value:(unint64_t)a4;
+ (BOOL)isValidMetricTypeJSON:(id)a3;
+ (PPSMetricType)metricTypeWithJSONObject:(id)a3;
+ (PPSMetricType)metricTypeWithProto:(id)a3;
+ (id)absoluteMeasure;
+ (id)accumulatedNegativeMeasure;
+ (id)accumulatedPositiveMeasure;
+ (id)deltaMeasure;
+ (id)genericDimension;
+ (id)stateDimension;
- (PPSMetricType)initWithCategory:(int)a3 value:(unint64_t)a4;
- (id)json;
- (id)proto;
- (int)category;
- (unint64_t)value;
@end

@implementation PPSMetricType

- (id)json
{
  v8[2] = *MEMORY[0x1895F89C0];
  v7[0] = @"category";
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[PPSMetricType category](self, "category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = @"value";
  v8[0] = v3;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[PPSMetricType value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PPSMetricType)metricTypeWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSMetricType isValidMetricTypeJSON:](&OBJC_CLASS___PPSMetricType, "isValidMetricTypeJSON:", v3))
  {
    v4 = objc_alloc(&OBJC_CLASS___PPSMetricType);
    [v3 objectForKeyedSubscript:@"category"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 unsignedIntValue];
    [v3 objectForKeyedSubscript:@"value"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSMetricType initWithCategory:value:]( v4,  "initWithCategory:value:",  v6,  [v7 unsignedIntegerValue]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidMetricTypeJSON:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.6();
    }
    goto LABEL_22;
  }

  [v3 objectForKeyedSubscript:@"category"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.5(v3);
    }
    goto LABEL_22;
  }

  [v3 objectForKeyedSubscript:@"category"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v6 unsignedIntValue])
  {

LABEL_20:
    PPSMetricLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.1(v3);
    }
    goto LABEL_22;
  }

  [v3 objectForKeyedSubscript:@"type"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = [v7 unsignedIntValue];

  if (v8 >= 3) {
    goto LABEL_20;
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
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.4(v3);
      }
      goto LABEL_22;
    }
  }

  [v3 objectForKeyedSubscript:@"category"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 unsignedIntValue];

  if (v14 == 1)
  {
    [v3 objectForKeyedSubscript:@"value"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 unsignedIntValue])
    {
      [v3 objectForKeyedSubscript:@"value"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v17 = [v16 unsignedIntValue];

      if (v17 < 3) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    PPSStorageLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.2();
    }
    goto LABEL_22;
  }

+ (PPSMetricType)metricTypeWithProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___PPSMetricType);
  uint64_t v5 = [v3 category];
  uint64_t v6 = [v3 value];

  return -[PPSMetricType initWithCategory:value:](v4, "initWithCategory:value:", v5, v6);
}

- (id)proto
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PPSPBMetricType);
  -[PPSPBMetricType setCategory:](v3, "setCategory:", -[PPSMetricType category](self, "category"));
  -[PPSPBMetricType setValue:](v3, "setValue:", -[PPSMetricType value](self, "value"));
  return v3;
}

- (PPSMetricType)initWithCategory:(int)a3 value:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (+[PPSMetricType isValidMetricType:value:](&OBJC_CLASS___PPSMetricType, "isValidMetricType:value:"))
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___PPSMetricType;
    v7 = -[PPSMetricType init](&v17, sel_init);
    if (v7)
    {
      v7->_category = v5;
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
      -[PPSMetricType initWithCategory:value:].cold.1(v5, v9, v10, v11, v12, v13, v14, v15);
    }

    unsigned int v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidMetricType:(int)a3 value:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    PPSMetricLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType isValidMetricType:value:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_4:

    return 0;
  }

  if (a3 == 1)
  {
    if (!a4)
    {
      PPSMetricLog();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
      }
      goto LABEL_4;
    }

    if (a4 >= 3)
    {
      PPSMetricLog();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.3();
      }
      goto LABEL_4;
    }
  }

  else
  {
    if (!a4)
    {
      PPSMetricLog();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.4(v5, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_4;
    }

    if (a4 >= 5)
    {
      PPSMetricLog();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[PPSMetricType isValidMetricType:value:].cold.5();
      }
      goto LABEL_4;
    }
  }

  return 1;
}

+ (id)genericDimension
{
  if (genericDimension_onceToken != -1) {
    dispatch_once(&genericDimension_onceToken, &__block_literal_global_3);
  }
  return (id)genericDimension__genericDimension;
}

void __33__PPSMetricType_genericDimension__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  1LL,  1LL);
  v1 = (void *)genericDimension__genericDimension;
  genericDimension__genericDimension = (uint64_t)v0;
}

+ (id)stateDimension
{
  if (stateDimension_onceToken != -1) {
    dispatch_once(&stateDimension_onceToken, &__block_literal_global_1);
  }
  return (id)stateDimension__stateDimension;
}

void __31__PPSMetricType_stateDimension__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  1LL,  2LL);
  v1 = (void *)stateDimension__stateDimension;
  stateDimension__stateDimension = (uint64_t)v0;
}

+ (id)absoluteMeasure
{
  if (absoluteMeasure_onceToken != -1) {
    dispatch_once(&absoluteMeasure_onceToken, &__block_literal_global_2);
  }
  return (id)absoluteMeasure__absoluteMeasure;
}

void __32__PPSMetricType_absoluteMeasure__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  2LL,  1LL);
  v1 = (void *)absoluteMeasure__absoluteMeasure;
  absoluteMeasure__absoluteMeasure = (uint64_t)v0;
}

+ (id)accumulatedNegativeMeasure
{
  if (accumulatedNegativeMeasure_onceToken != -1) {
    dispatch_once(&accumulatedNegativeMeasure_onceToken, &__block_literal_global_3_0);
  }
  return (id)accumulatedNegativeMeasure__accumulatedNegativeMeasure;
}

void __43__PPSMetricType_accumulatedNegativeMeasure__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  2LL,  2LL);
  v1 = (void *)accumulatedNegativeMeasure__accumulatedNegativeMeasure;
  accumulatedNegativeMeasure__accumulatedNegativeMeasure = (uint64_t)v0;
}

+ (id)accumulatedPositiveMeasure
{
  if (accumulatedPositiveMeasure_onceToken != -1) {
    dispatch_once(&accumulatedPositiveMeasure_onceToken, &__block_literal_global_4);
  }
  return (id)accumulatedPositiveMeasure__accumulatedPositiveMeasure;
}

void __43__PPSMetricType_accumulatedPositiveMeasure__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  2LL,  3LL);
  v1 = (void *)accumulatedPositiveMeasure__accumulatedPositiveMeasure;
  accumulatedPositiveMeasure__accumulatedPositiveMeasure = (uint64_t)v0;
}

+ (id)deltaMeasure
{
  if (deltaMeasure_onceToken != -1) {
    dispatch_once(&deltaMeasure_onceToken, &__block_literal_global_5_0);
  }
  return (id)deltaMeasure__deltaMeasure;
}

void __29__PPSMetricType_deltaMeasure__block_invoke()
{
  v0 = -[PPSMetricType initWithCategory:value:]( objc_alloc(&OBJC_CLASS___PPSMetricType),  "initWithCategory:value:",  2LL,  4LL);
  v1 = (void *)deltaMeasure__deltaMeasure;
  deltaMeasure__deltaMeasure = (uint64_t)v0;
}

- (int)category
{
  return self->_category;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)initWithCategory:(uint64_t)a3 value:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidMetricType:value:.cold.3()
{
}

+ (void)isValidMetricType:(uint64_t)a3 value:(uint64_t)a4 .cold.4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)isValidMetricType:value:.cold.5()
{
}

@end