@interface UARPDynamicAssetCmapEvent
+ (BOOL)supportsSecureCoding;
+ (id)encodedClasses;
- (BOOL)decodeCrash:(id)a3 inDictionary:(id)a4;
- (BOOL)isSection:(id)a3;
- (UARPDynamicAssetCmapEvent)init;
- (UARPDynamicAssetCmapEvent)initWithCoder:(id)a3;
- (UARPDynamicAssetCmapEvent)initWithSectionName:(id)a3 decoderId:(unsigned int)a4 inputDictionary:(id)a5;
- (unsigned)decoderId;
- (unsigned)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetCmapEvent

- (UARPDynamicAssetCmapEvent)init
{
  return 0LL;
}

- (UARPDynamicAssetCmapEvent)initWithSectionName:(id)a3 decoderId:(unsigned int)a4 inputDictionary:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCmapEvent;
  v10 = -[UARPDynamicAssetCmapEvent init](&v30, sel_init);
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    sectionName = v10->_sectionName;
    v10->_sectionName = (NSString *)v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v10->_log;
    v10->_log = v13;

    v10->_decoderId = a4;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    input = v10->_input;
    v10->_input = v15;

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    objc_msgSend(v9, "allKeys", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v23 = v10->_input;
          [v9 objectForKeyedSubscript:v22];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setValue:forKey:](v23, "setValue:forKey:", v24, v22);
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v19);
    }
  }

  return v10;
}

- (UARPDynamicAssetCmapEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCmapEvent;
  v5 = -[UARPDynamicAssetCmapEvent init](&v18, sel_init);
  if (v5)
  {
    v5->_decoderId = [v4 decodeIntForKey:@"decoderId"];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    input = v5->_input;
    v5->_input = v6;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPDynamicAssetCmapEvent encodedClasses](&OBJC_CLASS___UARPDynamicAssetCmapEvent, "encodedClasses");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [MEMORY[0x189607908] unarchivedObjectOfClasses:v9 fromData:v8 error:0];
    uint64_t v11 = v5->_input;
    v5->_input = (NSMutableDictionary *)v10;

    if (!v5->_input && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapEvent initWithCoder:].cold.1();
    }
    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SectionName"];
    sectionName = v5->_sectionName;
    v5->_sectionName = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t decoderId = self->_decoderId;
  id v5 = a3;
  [v5 encodeInt:decoderId forKey:@"decoderId"];
  [MEMORY[0x1896078F8] archivedDataWithRootObject:self->_input requiringSecureCoding:1 error:0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"input"];
  [v5 encodeObject:self->_sectionName forKey:@"SectionName"];
}

- (BOOL)isSection:(id)a3
{
  return -[NSString isEqualToString:](self->_sectionName, "isEqualToString:", a3);
}

- (BOOL)decodeCrash:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[UARPDynamicAssetCrashLogDecoder initWithDecoderId:sectionName:inputDictionary:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCrashLogDecoder),  "initWithDecoderId:sectionName:inputDictionary:",  self->_decoderId,  self->_sectionName,  self->_input);
  BOOL v9 = -[UARPDynamicAssetCrashLogDecoder decodeCrashLog:inDictionary:](v8, "decodeCrashLog:inDictionary:", v7, v6);

  return v9;
}

+ (id)encodedClasses
{
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [MEMORY[0x189604010] setWithArray:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)uuid
{
  return self->_uuid;
}

- (unsigned)decoderId
{
  return self->_decoderId;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_187DC0000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "CMAP input is NULL", v0, 2u);
}

@end