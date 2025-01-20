@interface PPSUnit
+ (BOOL)isValidUnitJSON:(id)a3;
+ (id)bytes;
+ (id)celsius;
+ (id)dimensionless;
+ (id)grams;
+ (id)kilobytes;
+ (id)megabytes;
+ (id)microWattHours;
+ (id)microseconds;
+ (id)milliAmpereHours;
+ (id)milliAmperes;
+ (id)milliVolts;
+ (id)milliseconds;
+ (id)nanoseconds;
+ (id)seconds;
+ (id)unitWithJSONObject:(id)a3;
+ (id)unitWithProto:(id)a3;
+ (id)volts;
- (NSUnit)unit;
- (PPSUnit)initWithUnit:(id)a3;
- (id)json;
- (id)proto;
@end

@implementation PPSUnit

- (id)json
{
  v7[1] = *MEMORY[0x1895F89C0];
  v6 = @"symbol";
  v2 = -[PPSUnit unit](self, "unit");
  [v2 symbol];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)unitWithJSONObject:(id)a3
{
  id v3 = a3;
  if (+[PPSUnit isValidUnitJSON:](&OBJC_CLASS___PPSUnit, "isValidUnitJSON:", v3))
  {
    v4 = objc_alloc(&OBJC_CLASS___PPSUnit);
    id v5 = objc_alloc(MEMORY[0x189607AD0]);
    [v3 objectForKeyedSubscript:@"symbol"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)[v5 initWithSymbol:v6];
    v8 = -[PPSUnit initWithUnit:](v4, "initWithUnit:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (BOOL)isValidUnitJSON:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PPSStorageLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSUnit(JSON) isValidUnitJSON:].cold.2();
    }
    goto LABEL_8;
  }

  [v3 objectForKeyedSubscript:@"symbol"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    PPSStorageLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSUnit(JSON) isValidUnitJSON:].cold.1(v3);
    }
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }

  BOOL v6 = 1;
LABEL_9:

  return v6;
}

+ (id)unitWithProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___PPSUnit);
  id v5 = objc_alloc(MEMORY[0x189607AD0]);
  [v3 symbol];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)[v5 initWithSymbol:v6];
  v8 = -[PPSUnit initWithUnit:](v4, "initWithUnit:", v7);

  return v8;
}

- (id)proto
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PPSPBUnit);
  v4 = -[PPSUnit unit](self, "unit");
  [v4 symbol];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSPBUnit setSymbol:](v3, "setSymbol:", v5);

  return v3;
}

- (PPSUnit)initWithUnit:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___PPSUnit;
    BOOL v6 = -[PPSUnit init](&v11, sel_init);
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_unit, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    PPSMetricLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSUnit initWithUnit:].cold.1(v9);
    }

    v8 = 0LL;
  }

  return v8;
}

+ (id)dimensionless
{
  if (dimensionless_onceToken != -1) {
    dispatch_once(&dimensionless_onceToken, &__block_literal_global_2);
  }
  return (id)dimensionless__dimensionless;
}

void __24__PPSUnit_dimensionless__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x189607AD0]) initWithSymbol:&stru_18A292320];
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)dimensionless__dimensionless;
  dimensionless__dimensionless = (uint64_t)v0;
}

+ (id)milliseconds
{
  if (milliseconds_onceToken != -1) {
    dispatch_once(&milliseconds_onceToken, &__block_literal_global_3);
  }
  return (id)milliseconds__unitMilliSeconds;
}

void __23__PPSUnit_milliseconds__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)milliseconds__unitMilliSeconds;
  milliseconds__unitMilliSeconds = (uint64_t)v0;
}

+ (id)microseconds
{
  if (microseconds_onceToken != -1) {
    dispatch_once(&microseconds_onceToken, &__block_literal_global_5);
  }
  return (id)microseconds__unitMicroSeconds;
}

void __23__PPSUnit_microseconds__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)microseconds__unitMicroSeconds;
  microseconds__unitMicroSeconds = (uint64_t)v0;
}

+ (id)nanoseconds
{
  if (nanoseconds_onceToken != -1) {
    dispatch_once(&nanoseconds_onceToken, &__block_literal_global_6);
  }
  return (id)nanoseconds__unitNanoSeconds;
}

void __22__PPSUnit_nanoseconds__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)nanoseconds__unitNanoSeconds;
  nanoseconds__unitNanoSeconds = (uint64_t)v0;
}

+ (id)seconds
{
  if (seconds_onceToken != -1) {
    dispatch_once(&seconds_onceToken, &__block_literal_global_7);
  }
  return (id)seconds__unitSeconds;
}

void __18__PPSUnit_seconds__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)seconds__unitSeconds;
  seconds__unitSeconds = (uint64_t)v0;
}

+ (id)milliVolts
{
  if (milliVolts_onceToken != -1) {
    dispatch_once(&milliVolts_onceToken, &__block_literal_global_8);
  }
  return (id)milliVolts__unitVolts;
}

void __21__PPSUnit_milliVolts__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)milliVolts__unitVolts;
  milliVolts__unitVolts = (uint64_t)v0;
}

+ (id)volts
{
  if (volts_onceToken != -1) {
    dispatch_once(&volts_onceToken, &__block_literal_global_10);
  }
  return (id)volts__unitVolts;
}

void __16__PPSUnit_volts__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)volts__unitVolts;
  volts__unitVolts = (uint64_t)v0;
}

+ (id)celsius
{
  if (celsius_onceToken != -1) {
    dispatch_once(&celsius_onceToken, &__block_literal_global_11);
  }
  return (id)celsius__unitCelsius;
}

void __18__PPSUnit_celsius__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)celsius__unitCelsius;
  celsius__unitCelsius = (uint64_t)v0;
}

+ (id)milliAmpereHours
{
  if (milliAmpereHours_onceToken != -1) {
    dispatch_once(&milliAmpereHours_onceToken, &__block_literal_global_13);
  }
  return (id)milliAmpereHours__unitMAH;
}

void __27__PPSUnit_milliAmpereHours__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)milliAmpereHours__unitMAH;
  milliAmpereHours__unitMAH = (uint64_t)v0;
}

+ (id)milliAmperes
{
  if (milliAmperes_onceToken != -1) {
    dispatch_once(&milliAmperes_onceToken, &__block_literal_global_15);
  }
  return (id)milliAmperes__unitMA;
}

void __23__PPSUnit_milliAmperes__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)milliAmperes__unitMA;
  milliAmperes__unitMA = (uint64_t)v0;
}

+ (id)microWattHours
{
  if (microWattHours_onceToken != -1) {
    dispatch_once(&microWattHours_onceToken, &__block_literal_global_17);
  }
  return (id)microWattHours__unituWh;
}

void __25__PPSUnit_microWattHours__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x189607AD0]) initWithSymbol:@"µWh"];
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)microWattHours__unituWh;
  microWattHours__unituWh = (uint64_t)v0;
}

+ (id)grams
{
  if (grams_onceToken != -1) {
    dispatch_once(&grams_onceToken, &__block_literal_global_20);
  }
  return (id)grams__unitGram;
}

void __16__PPSUnit_grams__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)grams__unitGram;
  grams__unitGram = (uint64_t)v0;
}

+ (id)bytes
{
  if (bytes_onceToken != -1) {
    dispatch_once(&bytes_onceToken, &__block_literal_global_22);
  }
  return (id)bytes__unitByte;
}

void __16__PPSUnit_bytes__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)bytes__unitByte;
  bytes__unitByte = (uint64_t)v0;
}

+ (id)kilobytes
{
  if (kilobytes_onceToken != -1) {
    dispatch_once(&kilobytes_onceToken, &__block_literal_global_24);
  }
  return (id)kilobytes__unitKiloByte;
}

void __20__PPSUnit_kilobytes__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)kilobytes__unitKiloByte;
  kilobytes__unitKiloByte = (uint64_t)v0;
}

+ (id)megabytes
{
  if (megabytes_onceToken != -1) {
    dispatch_once(&megabytes_onceToken, &__block_literal_global_25);
  }
  return (id)megabytes__unitMegabyte;
}

void __20__PPSUnit_megabytes__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PPSUnit initWithUnit:](objc_alloc(&OBJC_CLASS___PPSUnit), "initWithUnit:", v2);
  v1 = (void *)megabytes__unitMegabyte;
  megabytes__unitMegabyte = (uint64_t)v0;
}

- (NSUnit)unit
{
  return (NSUnit *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithUnit:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = 0LL;
  _os_log_error_impl(&dword_188807000, log, OS_LOG_TYPE_ERROR, "Invalid unit: %@", (uint8_t *)&v1, 0xCu);
}

@end