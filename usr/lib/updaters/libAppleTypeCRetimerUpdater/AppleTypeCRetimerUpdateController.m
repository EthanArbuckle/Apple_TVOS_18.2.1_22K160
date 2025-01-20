@interface AppleTypeCRetimerUpdateController
- (AppleTypeCRetimerUpdateController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6;
- (BOOL)initDebugFlags:(id)a3;
- (BOOL)initializeUpdaterInstancesForcingPower:(BOOL)a3;
- (BOOL)isDone;
- (BOOL)isDoneAggregate;
- (BOOL)isDoneSingleStep;
- (BOOL)performUpdateWithDictionary:(id)a3;
- (BOOL)performUpdateWithDictionaryAggregate:(id)a3;
- (BOOL)performUpdateWithDictionarySingleStep:(id)a3;
- (BOOL)shouldSkipSameVersion:(id)a3;
- (id)queryInfo;
- (id)queryInfoAggregate;
- (id)queryInfoSingleStep;
- (void)performReset;
@end

@implementation AppleTypeCRetimerUpdateController

- (AppleTypeCRetimerUpdateController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUpdateController;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:]( &v19,  sel_initWithOptions_logFunction_logContext_,  v10,  a4,  a5);
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = +[ATCRTAPHardwareID query](&OBJC_CLASS___ATCRTAPHardwareID, "query");
  apHardwareID = v11->_apHardwareID;
  v11->_apHardwareID = (ATCRTAPHardwareID *)v12;

  if (!v11->_apHardwareID)
  {
    -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", @"Failed to query AP hardware information");
    goto LABEL_11;
  }

  if (!-[AppleTypeCRetimerUpdateController initializeUpdaterInstancesForcingPower:]( v11,  "initializeUpdaterInstancesForcingPower:",  v6))
  {
LABEL_11:
    v17 = 0LL;
    goto LABEL_12;
  }

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](v11, "verboseLog:", @"%@: options = %@", v15, v10);

  [v10 objectForKeyedSubscript:@"SingleStepMode"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v11->_singleStepMode = [v16 BOOLValue];
  }
  if (!-[AppleTypeCRetimerUpdateController initDebugFlags:](v11, "initDebugFlags:", v10))
  {

    goto LABEL_11;
  }

  v11->_skipSameVersion = -[AppleTypeCRetimerUpdateController shouldSkipSameVersion:]( v11,  "shouldSkipSameVersion:",  v10);

LABEL_8:
  v17 = v11;
LABEL_12:

  return v17;
}

- (BOOL)initializeUpdaterInstancesForcingPower:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  updaterInstances = self->_updaterInstances;
  self->_updaterInstances = v5;

  +[AppleTypeCRetimerUpdaterIIC getRouterIDs](&OBJC_CLASS___AppleTypeCRetimerUpdaterIIC, "getRouterIDs");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = -[AppleTypeCRetimerUpdaterInstance initWithRouterID:delegate:forcePower:]( [AppleTypeCRetimerUpdaterInstance alloc],  "initWithRouterID:delegate:forcePower:",  [v12 unsignedCharValue],  self,  v3);
        if (!v13)
        {
          -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to create updater instance for router ID %@",  v12);
          BOOL v15 = 0;
          goto LABEL_11;
        }

        v14 = v13;
        -[NSMutableArray addObject:](self->_updaterInstances, "addObject:", v13);
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Created updater instance for router ID %@", v12);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)queryInfoSingleStep
{
  v16[4] = *MEMORY[0x1895F89C0];
  unint64_t updaterIndex = self->_updaterIndex;
  if (updaterIndex >= -[NSMutableArray count](self->_updaterInstances, "count"))
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Too many queryInfo calls!");
    return 0LL;
  }

  else
  {
    v4 = -[NSMutableArray objectAtIndexedSubscript:]( self->_updaterInstances,  "objectAtIndexedSubscript:",  self->_updaterIndex);
    [v4 queryHardwareID];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      uint64_t v6 = (LOBYTE(self->_updaterIndex) + 1);
      objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer%u,Ticket",  @"%u",  0,  v6);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = @"HardwareID";
      [v5 dictionary];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = v7;
      v15[1] = @"TicketName";
      v15[2] = @"TagNumber";
      [MEMORY[0x189607968] numberWithUnsignedChar:v6];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      v15[3] = @"LocalSigningID";
      objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v4, "useLocalSigning"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:4];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: %@",  [v4 routerID],  v5);
      -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: info = %@",  [v4 routerID],  v11);
      int v12 = [v4 useLocalSigning];
      v13 = "No";
      if (v12) {
        v13 = "Yes";
      }
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Using local signing: %s", v13);
    }

    else
    {
      -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to query hardware ID for router ID %u",  [v4 routerID]);
      v11 = 0LL;
    }

    return v11;
  }

- (id)queryInfoAggregate
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obj = self->_updaterInstances;
  uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v27)
  {
    uint64_t v26 = *(void *)v30;
    uint64_t v28 = 1LL;
    LODWORD(v4) = 1;
    while (2)
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        uint64_t v6 = v3;
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = [v7 queryHardwareID];
        if (!v8)
        {
          -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to query hardware ID for router ID %u",  [v7 routerID]);
          v14 = 0LL;
          BOOL v15 = obj;
          goto LABEL_18;
        }

        uint64_t v9 = (void *)v8;
        uint64_t v4 = [v7 useLocalSigning] & v4;
        objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer%u,Ticket",  @"%u",  0,  v28 + i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = @"HardwareID";
        [v9 dictionary];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v11;
        v36[1] = v10;
        v35[1] = @"TicketName";
        v35[2] = @"TagNumber";
        [MEMORY[0x189607968] numberWithUnsignedInt:v28 + i];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v12;
        [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:3];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        BOOL v3 = v6;
        [v6 addObject:v13];
        -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: %@",  [v7 routerID],  v9);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: info = %@",  [v7 routerID],  v13);
      }

      uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
      uint64_t v28 = (v28 + i);
      if (v27) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v4 = 1LL;
  }

  if ([v3 count])
  {
    v16 = "No";
    if ((_DWORD)v4) {
      v16 = "Yes";
    }
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Using local signing: %s", v16);
    __int128 v17 = (void *)MEMORY[0x189603FC8];
    v33[0] = @"InfoArray";
    [MEMORY[0x189603F18] arrayWithArray:v3];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v18;
    v33[1] = @"LocalSigningID";
    [MEMORY[0x189607968] numberWithBool:v4];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v19;
    [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 dictionaryWithDictionary:v20];
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[ATCRTAPHardwareID query](&OBJC_CLASS___ATCRTAPHardwareID, "query");
    uint64_t v22 = v21;
    if (v21)
    {
      [v21 personalizationParameters];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v23 forKeyedSubscript:@"APInfo"];
    }

    [MEMORY[0x189603F68] dictionaryWithDictionary:v15];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (id)queryInfo
{
  if (self->_singleStepMode) {
    -[AppleTypeCRetimerUpdateController queryInfoSingleStep](self, "queryInfoSingleStep");
  }
  else {
    -[AppleTypeCRetimerUpdateController queryInfoAggregate](self, "queryInfoAggregate");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSkipSameVersion:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"RestoreInternal"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 BOOLValue];
  [v4 objectForKeyedSubscript:@"SkipSameVersion"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v8 = [v7 BOOLValue];
  uint64_t v9 = "No";
  if ((v8 & 1) != 0 || !v6)
  {
    if (v7) {
      char v11 = v6;
    }
    else {
      char v11 = 1;
    }
    char v10 = v11 | v8;
  }

  else
  {
    char v10 = 0;
  }

  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Skip same version: %s", v9);

  return v10 & 1;
}

- (BOOL)initDebugFlags:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"DebugFlags"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Unexpected type for retimer debug flags: %@", v11);

LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }

  id v6 = v5;
  unint64_t v7 = strtoull((const char *)[v6 UTF8String], 0, 0);
  unint64_t v8 = v7;
  if (v7)
  {
    if (v7 != -1LL || *__error() != 34) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }

  if (*__error() == 22)
  {
LABEL_10:
    -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Unable to convert '%@' retimer debug flags string to a 64 bit number",  v6);
    goto LABEL_11;
  }

- (BOOL)performUpdateWithDictionaryAggregate:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", @"Perform update input = %@", v4);
  v23 = v4;
  [v4 objectForKeyedSubscript:@"FirmwareData"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  [MEMORY[0x189603FA8] array];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc_init(MEMORY[0x189607910]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  obuint64_t j = self->_updaterInstances;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    int v10 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        dispatch_get_global_queue(-2LL, 0LL);
        v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __74__AppleTypeCRetimerUpdateController_performUpdateWithDictionaryAggregate___block_invoke;
        block[3] = &unk_18A3C1600;
        int v36 = v10 + i;
        id v30 = v23;
        __int128 v31 = self;
        uint64_t v32 = v12;
        id v33 = v22;
        id v34 = v6;
        id v35 = v5;
        dispatch_group_async(group, v13, block);
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
      v10 += i;
    }

    while (v8);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0LL; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        if (![*(id *)(*((void *)&v25 + 1) + 8 * j) BOOLValue])
        {
          BOOL v19 = 0;
          goto LABEL_18;
        }
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  BOOL v19 = 1;
LABEL_18:

  return v19;
}

void __74__AppleTypeCRetimerUpdateController_performUpdateWithDictionaryAggregate___block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    [*(id *)(a1 + 40) log:@"Warning: Unable to locate manifest for '%@'", v6];
  }
  uint64_t v3 = [*(id *)(a1 + 48) performUpdateForFTABData:*(void *)(a1 + 56) manifestData:v2 apHardwareID:*(void *)(*(void *)(a1 + 40) + 64) skipSameVersion:*(unsigned __int8 *)(*(void *)(a1 + 40) + 57) debugFlags:*(void *)(*(void *)(a1 + 40) + 72)];
  if ((v3 & 1) == 0) {
    objc_msgSend( *(id *)(a1 + 40),  "log:",  @"Update failed for router ID %u",  objc_msgSend(*(id *)(a1 + 48), "routerID"));
  }
  [*(id *)(a1 + 64) lock];
  id v4 = *(void **)(a1 + 72);
  [MEMORY[0x189607968] numberWithBool:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];

  [*(id *)(a1 + 64) unlock];
}

- (BOOL)performUpdateWithDictionarySingleStep:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", @"Perform update input = %@", v4);
  [v4 objectForKeyedSubscript:@"FirmwareData"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 hasSuffix:@"Ticket"])
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  if (!v12) {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Warning: Unable to locate ticket name: %@", v6);
  }
  [v6 objectForKeyedSubscript:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13) {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Warning: Unable to locate manifest: %@", v6);
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_updaterInstances, "objectAtIndexedSubscript:", self->_updaterIndex);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v14 performUpdateForFTABData:v5 manifestData:v13 apHardwareID:self->_apHardwareID skipSameVersion:self->_skipSameVersion debugFlags:self->_debugFlags];
  if ((v15 & 1) == 0) {
    -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Update failed for router ID %u",  [v14 routerID]);
  }
  ++self->_updaterIndex;

  return v15;
}

- (BOOL)performUpdateWithDictionary:(id)a3
{
  if (self->_singleStepMode) {
    return -[AppleTypeCRetimerUpdateController performUpdateWithDictionarySingleStep:]( self,  "performUpdateWithDictionarySingleStep:",  a3);
  }
  self->_aggregateUpdateComplete = 1;
  return -[AppleTypeCRetimerUpdateController performUpdateWithDictionaryAggregate:]( self,  "performUpdateWithDictionaryAggregate:",  a3);
}

- (void)performReset
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v3 = self->_updaterInstances;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) performReset];
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
    }

    while (v5);
  }

  sleep(1u);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v8 = self->_updaterInstances;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "printVersions", (void)v13);
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v10);
  }
}

- (BOOL)isDoneSingleStep
{
  unint64_t updaterIndex = self->_updaterIndex;
  return updaterIndex == -[NSMutableArray count](self->_updaterInstances, "count");
}

- (BOOL)isDoneAggregate
{
  return self->_aggregateUpdateComplete;
}

- (BOOL)isDone
{
  if (self->_singleStepMode) {
    return -[AppleTypeCRetimerUpdateController isDoneSingleStep](self, "isDoneSingleStep");
  }
  else {
    return -[AppleTypeCRetimerUpdateController isDoneAggregate](self, "isDoneAggregate");
  }
}

- (void).cxx_destruct
{
}

@end