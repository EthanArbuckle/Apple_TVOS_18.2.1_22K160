@interface PPSClientInterface
+ (id)getAllFrameworkSubsystem;
+ (id)getAllSubsystem;
+ (id)getMetadataByCategoryForSubsystem:(id)a3;
+ (id)getMetadataByNameForSubsystem:(id)a3 category:(id)a4;
+ (id)getMetadataForSubsystem:(id)a3;
+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4;
+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (id)getSubsystemsForFilepath:(id)a3;
+ (void)buildDeviceMetadata;
@end

@implementation PPSClientInterface

+ (id)getAllSubsystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 getAllSubsystem];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getAllFrameworkSubsystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 getAllFrameworkSubsystem];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getMetadataForSubsystem:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[PPSMetadataStore sharedStore](&OBJC_CLASS___PPSMetadataStore, "sharedStore");
    [v4 getMetadataForSubsystem:v3];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189603FA8] array];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 allValues];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __46__PPSClientInterface_getMetadataForSubsystem___block_invoke;
    v19[3] = &unk_18A291318;
    id v8 = v6;
    id v20 = v8;
    [v7 enumerateObjectsUsingBlock:v19];

    if ([v8 count]) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    PPSClientInterfaceLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getMetadataForSubsystem:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    id v9 = 0LL;
  }

  return v9;
}

void __46__PPSClientInterface_getMetadataForSubsystem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 allValues];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];
}

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PPSMetadataStore sharedStore](&OBJC_CLASS___PPSMetadataStore, "sharedStore");
  [v7 getMetadataForSubsystem:v6 category:v5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 allValues];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getMetadataByNameForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[PPSMetadataStore sharedStore](&OBJC_CLASS___PPSMetadataStore, "sharedStore");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 getMetadataForSubsystem:v5 category:v7];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    PPSClientInterfaceLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getMetadataByNameForSubsystem:category:].cold.1((uint64_t)v5, (uint64_t)v7, v10);
    }

    id v9 = 0LL;
  }

  return v9;
}

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    +[PPSMetadataStore sharedStore](&OBJC_CLASS___PPSMetadataStore, "sharedStore");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 getMetadataForSubsystem:v7 category:v8 name:v10];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    PPSClientInterfaceLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl( &dword_188807000,  v13,  OS_LOG_TYPE_ERROR,  "Invalid Input: subsystem=%@, category=%@, name=%@",  (uint8_t *)&v15,  0x20u);
    }

    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (v9 && v10 && v11 && v12)
  {
    [v9 path];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetadataStore getMetadataHistoryForFilepath:subsystem:category:name:]( &OBJC_CLASS___PPSMetadataStore,  "getMetadataHistoryForFilepath:subsystem:category:name:",  v14,  v10,  v11,  v13);
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    PPSClientInterfaceLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138413058;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_error_impl( &dword_188807000,  v16,  OS_LOG_TYPE_ERROR,  "Invalid Input: filepath=%@, subsystem=%@, category=%@, name=%@",  (uint8_t *)&v18,  0x2Au);
    }

    int v15 = 0LL;
  }

  return v15;
}

+ (id)getSubsystemsForFilepath:(id)a3
{
  if (a3)
  {
    [a3 path];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PPSSQLMetadataStore querySubsystemsForFilepath:]( &OBJC_CLASS___PPSSQLMetadataStore,  "querySubsystemsForFilepath:",  v3);
  }

  else
  {
    PPSClientInterfaceLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getSubsystemsForFilepath:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    v4 = 0LL;
  }

  return v4;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7 && v8 && v9)
  {
    [v7 path];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSMetadataStore getMetadataHistoryForFilepath:subsystem:category:]( &OBJC_CLASS___PPSMetadataStore,  "getMetadataHistoryForFilepath:subsystem:category:",  v11,  v8,  v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    PPSClientInterfaceLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_error_impl( &dword_188807000,  v13,  OS_LOG_TYPE_ERROR,  "Invalid Input: filepath=%@, subsystem=%@, category=%@",  (uint8_t *)&v15,  0x20u);
    }

    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (void)buildDeviceMetadata
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 buildDeviceMetadata];
}

+ (id)getMetadataByCategoryForSubsystem:(id)a3
{
  id v3 = a3;
  v4 = +[PPSMetadataStore sharedStore](&OBJC_CLASS___PPSMetadataStore, "sharedStore");
  [v4 getMetadataForSubsystem:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)getMetadataForSubsystem:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_188807000, a1, a3, "Invalid Input: subsystem=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

+ (void)getMetadataByNameForSubsystem:(os_log_t)log category:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_188807000,  log,  OS_LOG_TYPE_ERROR,  "Invalid Input: subsystem=%@, category=%@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_6();
}

+ (void)getSubsystemsForFilepath:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_188807000, a1, a3, "Invalid Input: filepath=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end