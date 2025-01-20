@interface AppleTypeCRetimerUARPUpdaterController
- (AppleTypeCRetimerUARPUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6;
- (BOOL)initDebugFlags:(id)a3;
- (BOOL)initializeUpdaterInstancesForcingPower:(BOOL)a3;
- (BOOL)isDone;
- (BOOL)performReset;
- (BOOL)performUpdateWithDictionary:(id)a3;
- (id)queryInfo;
@end

@implementation AppleTypeCRetimerUARPUpdaterController

- (AppleTypeCRetimerUARPUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 forcingPower:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUARPUpdaterController;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:]( &v20,  sel_initWithOptions_logFunction_logContext_,  v10,  a4,  a5);
  if (v11)
  {
    uint64_t v12 = +[ATCRTAPHardwareID query](&OBJC_CLASS___ATCRTAPHardwareID, "query");
    apHardwareID = v11->_apHardwareID;
    v11->_apHardwareID = (ATCRTAPHardwareID *)v12;

    if (v11->_apHardwareID)
    {
      if (-[AppleTypeCRetimerUARPUpdaterController initializeUpdaterInstancesForcingPower:]( v11,  "initializeUpdaterInstancesForcingPower:",  v6))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AppleTypeCRetimerUpdaterHelper verboseLog:](v11, "verboseLog:", @"%@: options = %@", v15, v10);

        if (-[AppleTypeCRetimerUARPUpdaterController initDebugFlags:](v11, "initDebugFlags:", v10))
        {
          int ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v10);
          v11->_skipSameVersion = ShouldSkipSameVersion;
          v17 = "No";
          if (ShouldSkipSameVersion) {
            v17 = "Yes";
          }
          -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", @"Skip same version: %s", v17);
          goto LABEL_8;
        }
      }
    }

    else
    {
      -[AppleTypeCRetimerUpdaterHelper log:](v11, "log:", @"Failed to query AP hardware information");
    }

    v18 = 0LL;
    goto LABEL_11;
  }

- (BOOL)initializeUpdaterInstancesForcingPower:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  updaterInstances = self->_updaterInstances;
  self->_updaterInstances = v5;

  AppleTypeCRetimerGetRouterIDsForIicPrefix(@"uatcrt");
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
        v13 = -[AppleTypeCRetimerUARPUpdaterInstance initWithRouterID:delegate:forcePower:]( [AppleTypeCRetimerUARPUpdaterInstance alloc],  "initWithRouterID:delegate:forcePower:",  [v12 unsignedCharValue],  self,  v3);
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

- (BOOL)initDebugFlags:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"DebugFlags"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)queryInfo
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  obj = self->_updaterInstances;
  uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v24)
  {
    uint64_t v23 = *(void *)v27;
    uint64_t v25 = 1LL;
    LODWORD(v4) = 1;
    while (2)
    {
      for (uint64_t i = 0LL; i != v24; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v7 = [v6 queryHardwareID];
        if (!v7)
        {
          -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to query hardware ID for router ID %u",  [v6 routerID]);
          v14 = 0LL;
          goto LABEL_16;
        }

        unint64_t v8 = (void *)v7;
        BOOL v9 = v3;
        uint64_t v4 = [v6 useLocalSigning] & v4;
        objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer%u,Ticket",  @"%u",  0,  v25 + i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = @"HardwareID";
        [v8 dictionary];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v11;
        v33[1] = v10;
        v32[1] = @"TicketName";
        v32[2] = @"TagNumber";
        [MEMORY[0x189607968] numberWithUnsignedInt:v25 + i];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v12;
        [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:3];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        BOOL v3 = v9;
        [v9 addObject:v13];
        -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: %@",  [v6 routerID],  v8);
        -[AppleTypeCRetimerUpdaterHelper verboseLog:]( self,  "verboseLog:",  @"ATCRT %u: info = %@",  [v6 routerID],  v13);
      }

      uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
      uint64_t v25 = (v25 + i);
      if (v24) {
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
    BOOL v15 = "No";
    if ((_DWORD)v4) {
      BOOL v15 = "Yes";
    }
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Using local signing: %s", v15);
    v16 = (void *)MEMORY[0x189603FC8];
    v30[0] = @"InfoArray";
    [MEMORY[0x189603F18] arrayWithArray:v3];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v17;
    v30[1] = @"LocalSigningID";
    [MEMORY[0x189607968] numberWithBool:v4];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v18;
    [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:2];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v16 dictionaryWithDictionary:v19];

    obj = (NSMutableArray *)v20;
    [MEMORY[0x189603F68] dictionaryWithDictionary:v20];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (BOOL)performUpdateWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[AppleTypeCRetimerUpdaterHelper verboseLog:](self, "verboseLog:", @"Perform update input = %@", v4);
  v34 = v4;
  [v4 objectForKeyedSubscript:@"FirmwareData"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinary),  "initWithData:delegate:delegateQueue:",  v5,  0LL,  0LL);
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = -[UARPSuperBinary getBver](v6, "getBver");
      BOOL v9 = (void *)v8;
      if (v8)
      {
        __int128 v28 = v7;
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Candidate retimer firmware version: %@", v8);
        group = dispatch_group_create();
        [MEMORY[0x189603FA8] array];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self;
        id v32 = objc_alloc_init(MEMORY[0x189607910]);
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        obuint64_t j = self->_updaterInstances;
        uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v49;
          int v13 = 1;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(obj);
              }
              BOOL v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v16 = (void *)NSString;
              [v15 name];
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 stringWithFormat:@"com.apple.%@.updater", v17];
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

              id v19 = v18;
              uint64_t v20 = dispatch_queue_create((const char *)[v19 UTF8String], 0);
              block[0] = MEMORY[0x1895F87A8];
              block[1] = 3221225472LL;
              block[2] = __70__AppleTypeCRetimerUARPUpdaterController_performUpdateWithDictionary___block_invoke;
              block[3] = &unk_18A3C1790;
              int v47 = v13 + i;
              id v40 = v34;
              v41 = v31;
              v42 = v15;
              id v43 = v5;
              id v44 = v9;
              id v45 = v32;
              id v46 = v30;
              dispatch_group_async(group, v20, block);
            }

            uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
            v13 += i;
          }

          while (v11);
        }

        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        BOOL v21 = 1;
        v31->_isDone = 1;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v22 = v30;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v36;
          while (2)
          {
            for (uint64_t j = 0LL; j != v24; ++j)
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              if (![*(id *)(*((void *)&v35 + 1) + 8 * j) BOOLValue])
              {
                BOOL v21 = 0;
                goto LABEL_23;
              }
            }

            uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v52 count:16];
            if (v24) {
              continue;
            }
            break;
          }

          BOOL v21 = 1;
        }

void __70__AppleTypeCRetimerUARPUpdaterController_performUpdateWithDictionary___block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    [*(id *)(a1 + 40) log:@"Warning: Unable to locate manifest for '%@'", v6];
  }
  uint64_t v3 = [*(id *)(a1 + 48) performUpdateForSuperBinaryData:*(void *)(a1 + 56) manifestData:v2 apHardwareID:*(void *)(*(void *)(a1 + 40) + 48) skipSameVersion:*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) debugFlags:*(void *)(*(void *)(a1 + 40) + 56) bver:*(void *)(a1 + 64)];
  if ((v3 & 1) == 0) {
    objc_msgSend( *(id *)(a1 + 40),  "log:",  @"Update failed for router ID %u",  objc_msgSend(*(id *)(a1 + 48), "routerID"));
  }
  [*(id *)(a1 + 72) lock];
  id v4 = *(void **)(a1 + 80);
  [MEMORY[0x189607968] numberWithBool:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v5];

  [*(id *)(a1 + 72) unlock];
}

- (BOOL)performReset
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  group = dispatch_group_create();
  [MEMORY[0x189603FA8] array];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = objc_alloc_init(MEMORY[0x189607910]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v4 = self;
  obuint64_t j = self->_updaterInstances;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v10 = (void *)NSString;
        [v9 name];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringWithFormat:@"com.apple.%@.apply", v11];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        id v13 = v12;
        v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __54__AppleTypeCRetimerUARPUpdaterController_performReset__block_invoke;
        block[3] = &unk_18A3C17B8;
        void block[4] = v9;
        block[5] = v4;
        id v39 = v28;
        id v40 = v3;
        dispatch_group_async(group, v14, block);
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
    }

    while (v6);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  -[AppleTypeCRetimerUpdaterHelper log:](v4, "log:", @"Wait %u seconds for retimer(s) to reboot.", 2LL);
  sleep(2u);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  BOOL v15 = v3;
  uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        if (![*(id *)(*((void *)&v34 + 1) + 8 * j) BOOLValue])
        {
          LOBYTE(v24) = 0;
          uint64_t v20 = v15;
          goto LABEL_25;
        }
      }

      uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
      if (v17) {
        continue;
      }
      break;
    }
  }

  -[AppleTypeCRetimerUpdaterHelper log:](v4, "log:", @"Verifying retimer(s) booted version.");
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v20 = v4->_updaterInstances;
  uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v30,  v45,  16LL);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    int v24 = 1;
    do
    {
      for (uint64_t k = 0LL; k != v22; ++k)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v24 &= [*(id *)(*((void *)&v30 + 1) + 8 * k) printVersions];
      }

      uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v30,  v45,  16LL);
    }

    while (v22);
  }

  else
  {
    LOBYTE(v24) = 1;
  }

uint64_t __54__AppleTypeCRetimerUARPUpdaterController_performReset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applyFirmware];
  if ((v2 & 1) == 0) {
    objc_msgSend( *(id *)(a1 + 40),  "log:",  @"Apply failed for router ID %u",  objc_msgSend(*(id *)(a1 + 32), "routerID"));
  }
  [*(id *)(a1 + 48) lock];
  uint64_t v3 = *(void **)(a1 + 56);
  [MEMORY[0x189607968] numberWithBool:v2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];

  return [*(id *)(a1 + 48) unlock];
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void).cxx_destruct
{
}

@end