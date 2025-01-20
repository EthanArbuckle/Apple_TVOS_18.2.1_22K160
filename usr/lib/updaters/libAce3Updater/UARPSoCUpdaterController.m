@interface UARPSoCUpdaterController
- (BOOL)applyStagedFirmware;
- (BOOL)initializeUpdatersWithOptions:(id)a3;
- (BOOL)isDone;
- (BOOL)offerFirmwareDataWithDictionary:(id)a3;
- (BOOL)offerFirmwareForUpdater:(id)a3 inputDict:(id)a4;
- (BOOL)offerPersonalizationDataWithDictionary:(id)a3;
- (NSDictionary)personalizationRequests;
- (NSString)restorePartition;
- (UARPSoCUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5;
- (id)firmwareTags;
- (id)queryInfo;
- (id)ticketNameTags;
- (unsigned)numberOfAvailableUnits;
@end

@implementation UARPSoCUpdaterController

- (UARPSoCUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___UARPSoCUpdaterController;
  v9 = -[UARPSoCUpdaterController init](&v29, sel_init);
  if (v9)
  {
    v10 = -[SoCUpdaterHelper initWithOptions:logFunction:logContext:]( objc_alloc(&OBJC_CLASS___SoCUpdaterHelper),  "initWithOptions:logFunction:logContext:",  v8,  a4,  a5);
    log = v9->_log;
    v9->_log = v10;

    uint64_t v12 = objc_opt_new();
    updaters = v9->_updaters;
    v9->_updaters = (NSMutableArray *)v12;

    v9->_isDone = 0;
    if (!-[UARPSoCUpdaterController initializeUpdatersWithOptions:](v9, "initializeUpdatersWithOptions:", v8))
    {
      v27 = 0LL;
      goto LABEL_10;
    }

    int ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
    v9->_skipSameVersion = ShouldSkipSameVersion;
    v15 = "No";
    if (ShouldSkipSameVersion) {
      v15 = "Yes";
    }
    -[SoCUpdaterHelper log:](v9->_log, "log:", @"Ace3 skip same version: %s", v15);
    [v8 objectForKeyedSubscript:@"Options"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9->_log;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v17, "log:", @"%@: options = %@", v19, v16);

    uint64_t v20 = [v16 objectForKeyedSubscript:@"RestoreSystemPartition"];
    restorePartition = v9->_restorePartition;
    v9->_restorePartition = (NSString *)v20;

    if (!v9->_restorePartition)
    {
      v9->_restorePartition = (NSString *)&stru_18A3BF8B0;
    }

    [v16 objectForKeyedSubscript:@"ForceLocalSigning"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_forceLocalSigning = [v22 BOOLValue];

    v23 = v9->_log;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper verboseLog:]( v23,  "verboseLog:",  @"%@: _forceLocalSigning = %d",  v25,  v9->_forceLocalSigning);

    personalizationRequests = v9->_personalizationRequests;
    v9->_personalizationRequests = 0LL;
  }

  v27 = v9;
LABEL_10:

  return v27;
}

- (id)firmwareTags
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_updaters;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "firmwareTagName", (void)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  [MEMORY[0x189603F18] arrayWithArray:v3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ticketNameTags
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_updaters;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "ticketName", (void)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  [MEMORY[0x189603F18] arrayWithArray:v3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queryInfo
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!-[NSMutableArray count](self->_updaters, "count")) {
    return 0LL;
  }
  if (self->_forceLocalSigning)
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v5 = self->_updaters;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v9), "useLocalSigning", (void)v17))
          {
            uint64_t v3 = 1LL;
            goto LABEL_15;
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v3 = 0LL;
LABEL_15:
  }

  v22[0] = self;
  v21[0] = @"UpdaterRef";
  v21[1] = @"TicketName";
  v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_updaters, "objectAtIndexedSubscript:", 0LL, (void)v17);
  [v10 ticketName];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v21[2] = @"RestoreSystemPartition";
  -[UARPSoCUpdaterController restorePartition](self, "restorePartition");
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  v21[3] = @"LocalSigningID";
  [MEMORY[0x189607968] numberWithBool:v3];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v13;
  v21[4] = @"ManifestPrefix";
  -[NSMutableArray objectAtIndexedSubscript:](self->_updaters, "objectAtIndexedSubscript:", 0LL);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 manifestPrefix];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:5];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)offerFirmwareDataWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new();
  -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: options = %@",  "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]",  v4);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  personalizationRequests = self->_updaters;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( personalizationRequests,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(personalizationRequests);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 isDone])
        {
          -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Skipping Offer Firmware. Updater(LUN:%d,RouterID:%d) has finished.",  "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]",  [v11 logicUnitNumber],  objc_msgSend(v11, "routerID"));
        }

        else
        {
          if (!-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]( self,  "offerFirmwareForUpdater:inputDict:",  v11,  v4))
          {
            BOOL v14 = 0;
            goto LABEL_14;
          }

          [v11 personalizationRequestDict];
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addEntriesFromDictionary:v12];
        }
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( personalizationRequests,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

  [MEMORY[0x189603F68] dictionaryWithDictionary:v5];
  __int128 v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  personalizationRequests = (NSMutableArray *)self->_personalizationRequests;
  self->_personalizationRequests = v13;
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (BOOL)offerPersonalizationDataWithDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: %@",  "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]",  v4);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = self->_updaters;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isDone])
        {
          -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Skipping Offer Tss Response. Updater(LUN:%d,RouterID:%d) has finished.",  "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]",  [v10 logicUnitNumber],  objc_msgSend(v10, "routerID"));
        }

        else if (![v10 offerPersonalizationResponse:v4])
        {
          BOOL v11 = 0;
          goto LABEL_13;
        }
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)applyStagedFirmware
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  BOOL v3 = 1;
  self->_isDone = 1;
  -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s",  "-[UARPSoCUpdaterController applyStagedFirmware]");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = self->_updaters;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isDone])
        {
          -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Skipping Apply. Updater(LUN:%d,RouterID:%d) has finished.",  "-[UARPSoCUpdaterController applyStagedFirmware]",  [v9 logicUnitNumber],  objc_msgSend(v9, "routerID"));
        }

        else
        {
          if (![v9 applyStagedFirmware])
          {
            BOOL v3 = 0;
            goto LABEL_15;
          }

          if (([v9 isDone] & 1) == 0)
          {
            -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Updating is not finish yet for unit with LUN: %d, RouterID: %d",  "-[UARPSoCUpdaterController applyStagedFirmware]",  [v9 logicUnitNumber],  objc_msgSend(v9, "routerID"));
            self->_isDone = 0;
          }
        }
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        continue;
      }
      break;
    }

    BOOL v3 = 1;
  }

- (NSDictionary)personalizationRequests
{
  return self->_personalizationRequests;
}

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  return 0LL;
}

- (unsigned)numberOfAvailableUnits
{
  return 0;
}

- (BOOL)initializeUpdatersWithOptions:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[UARPSoCUpdaterController numberOfAvailableUnits](self, "numberOfAvailableUnits");
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = 1LL;
    while (1)
    {
      uint64_t v8 = -[UARPSoCUpdaterController createUpdaterInstanceFor:helper:options:]( self,  "createUpdaterInstanceFor:helper:options:",  v7,  self->_log,  v4);
      if (!v8) {
        break;
      }
      uint64_t v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_updaters, "addObject:", v8);
      -[SoCUpdaterHelper log:](self->_log, "log:", @"Created updater instance for LUN %d", v7);

      uint64_t v7 = (v7 + 1);
      if (v7 > v6)
      {
        BOOL v10 = 1;
        goto LABEL_9;
      }
    }

    log = self->_log;
    uint64_t v14 = v7;
    __int128 v12 = @"Failed to create updater instance for LUN %d";
  }

  else
  {
    log = self->_log;
    __int128 v12 = @"No available units to be updated";
  }

  -[SoCUpdaterHelper log:](log, "log:", v12, v14);
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)offerFirmwareForUpdater:(id)a3 inputDict:(id)a4
{
  id v6 = a3;
  log = self->_log;
  id v8 = a4;
  -[SoCUpdaterHelper verboseLog:]( log,  "verboseLog:",  @"%s: options = %@",  "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]",  v8);
  [v8 objectForKeyedSubscript:@"FirmwareData"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    char v10 = [v6 offerFirmwareData:v9];
  }

  else
  {
    -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Unable to locate firmware data.",  "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]");
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (NSString)restorePartition
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end