@interface PS190UpdaterController
- (BOOL)allowNonceQueries;
- (BOOL)initializeUpdaterInstances;
- (BOOL)isDone;
- (BOOL)performUpdateForInstance:(id)a3 inputDict:(id)a4 firmwareFile:(id)a5;
- (BOOL)performUpdateWithDictionary:(id)a3;
- (BOOL)performUpdateWithDictionaryAggregate:(id)a3 firmwareFile:(id)a4;
- (BOOL)performUpdateWithDictionarySingleStep:(id)a3 firmwareFile:(id)a4;
- (BOOL)recoveryModeSupported;
- (NSString)globallySignedManifestPath;
- (PS190UpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (id)queryInfo;
- (id)queryInfoAggregate;
- (id)queryInfoForUpdaterInstance:(id)a3;
- (id)queryInfoSingleStep;
- (void)initAllowNonceQueries:(id)a3;
- (void)setGloballySignedManifestPath:(id)a3;
@end

@implementation PS190UpdaterController

- (PS190UpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PS190UpdaterController;
  v9 = -[SoCUpdaterHelper initWithOptions:logFunction:logContext:]( &v17,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  if (!v9) {
    goto LABEL_11;
  }
  int ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
  v9->_skipSameVersion = ShouldSkipSameVersion;
  v11 = ShouldSkipSameVersion ? "Yes" : "No";
  -[SoCUpdaterHelper log:](v9, "log:", @"Skip same version: %s", v11);
  -[PS190UpdaterController initAllowNonceQueries:](v9, "initAllowNonceQueries:", v8);
  if ((SoCUpdaterRunningInTetheredMode(v8) & 1) != 0)
  {
    BOOL allowNonceQueries = v9->_allowNonceQueries;
    v9->_recoveryModeSupported = allowNonceQueries;
    v13 = allowNonceQueries ? "Yes" : "No";
  }

  else
  {
    v9->_recoveryModeSupported = 0;
    v13 = "No";
  }

  -[SoCUpdaterHelper log:](v9, "log:", @"Recovery mode supported: %s", v13);
  globallySignedManifestPath = v9->_globallySignedManifestPath;
  v9->_globallySignedManifestPath = (NSString *)@"/usr/local/standalone/firmware/ps190/ps190.im4m";

  if (!-[PS190UpdaterController initializeUpdaterInstances](v9, "initializeUpdaterInstances")) {
    v15 = 0LL;
  }
  else {
LABEL_11:
  }
    v15 = v9;

  return v15;
}

- (void)initAllowNonceQueries:(id)a3
{
  id v4 = (id)[a3 objectForKeyedSubscript:@"Options"];
  id v5 = (id)[v4 objectForKeyedSubscript:@"PreflightTickets"];

  if (v5)
  {
    if (self->_allowNonceQueries) {
      v6 = "Yes";
    }
    else {
      v6 = "No";
    }
  }

  else
  {
    self->_BOOL allowNonceQueries = 1;
    v6 = "Yes";
  }

  -[SoCUpdaterHelper log:](self, "log:", @"Nonce queries allowed: %s", v6);
}

- (BOOL)initializeUpdaterInstances
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v44 = (id)[MEMORY[0x189603FA8] array];
  id v3 = +[PS190IICDevice allDevices](&OBJC_CLASS___PS190IICDevice, "allDevices");
  v42 = v3;
  if ([v3 count])
  {
    __int128 v55 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    updaterInstances = (NSArray *)v3;
    uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterInstances,  "countByEnumeratingWithState:objects:count:",  &v53,  v59,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v54;
      uint64_t v8 = 1LL;
      unint64_t v9 = 0x18A331000uLL;
      unint64_t v10 = 0x18A331000uLL;
      while (2)
      {
        uint64_t v11 = 0LL;
        uint64_t v43 = v6;
        do
        {
          if (*(void *)v54 != v7) {
            objc_enumerationMutation(updaterInstances);
          }
          v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
          v13 = (void *)[objc_alloc(*(Class *)(v9 + 3272)) initWithIICDevice:v12];
          v14 = v13;
          if (!v13)
          {
            id v40 = (id)[v12 serviceName];
            -[SoCUpdaterHelper log:](self, "log:", @"Failed to create updater instance for %@", v40);
LABEL_30:

            BOOL v39 = 0;
            goto LABEL_31;
          }

          if (([v13 enabled] & 1) == 0)
          {
            uint64_t v15 = v8;
            uint64_t v16 = v7;
            objc_super v17 = updaterInstances;
            unint64_t v18 = v10;
            unint64_t v19 = v9;
            id v20 = (id)[v12 serviceName];
            -[SoCUpdaterHelper log:](self, "log:", @"Applying power for %@", v20);
            v21 = v20;
            unint64_t v9 = v19;
            unint64_t v10 = v18;
            updaterInstances = v17;
            uint64_t v7 = v16;
            uint64_t v8 = v15;
            uint64_t v6 = v43;

            if (([v14 enable] & 1) == 0)
            {
              id v40 = (id)[v12 serviceName];
              -[SoCUpdaterHelper log:](self, "log:", @"Failed to apply power for %@", v40);
              goto LABEL_30;
            }
          }

          v22 = (void *)[objc_alloc(*(Class *)(v10 + 3392)) initWithInstance:v14 tag:v8 + v11 delegate:self];
          [v44 addObject:v22];

          ++v11;
        }

        while (v6 != v11);
        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterInstances,  "countByEnumeratingWithState:objects:count:",  &v53,  v59,  16LL);
        uint64_t v8 = (v8 + v11);
        if (v6) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    updaterInstances = (NSArray *)+[PS190IODPDevice allDevices](&OBJC_CLASS___PS190IODPDevice, "allDevices");
    uint64_t v23 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterInstances,  "countByEnumeratingWithState:objects:count:",  &v49,  v58,  16LL);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v50;
      uint64_t v26 = 1LL;
      do
      {
        for (uint64_t i = 0LL; i != v24; ++i)
        {
          if (*(void *)v50 != v25) {
            objc_enumerationMutation(updaterInstances);
          }
          v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v29 = objc_alloc(&OBJC_CLASS___PS190Instance);
          id v30 = (id)[v28 rootPath];
          v31 = -[PS190Instance initWithRootPath:](v29, "initWithRootPath:", v30);

          v32 = -[PS190UpdaterInstance initWithInstance:tag:delegate:]( objc_alloc(&OBJC_CLASS___PS190UpdaterInstance),  "initWithInstance:tag:delegate:",  v31,  v26 + i,  self);
          [v44 addObject:v32];
        }

        uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterInstances,  "countByEnumeratingWithState:objects:count:",  &v49,  v58,  16LL);
        uint64_t v26 = (v26 + i);
      }

      while (v24);
    }
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v33 = v44;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v46;
    do
    {
      for (uint64_t j = 0LL; j != v35; ++j)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v33);
        }
        -[SoCUpdaterHelper log:](self, "log:", @"Created %@", *(void *)(*((void *)&v45 + 1) + 8 * j));
      }

      uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }

    while (v35);
  }

  v38 = (NSArray *)(id)[MEMORY[0x189603F18] arrayWithArray:v33];
  updaterInstances = self->_updaterInstances;
  self->_updaterInstances = v38;
  BOOL v39 = 1;
LABEL_31:

  return v39;
}

- (id)queryInfoForUpdaterInstance:(id)a3
{
  v14[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (id)[v4 queryHardwareID];
  uint64_t v6 = v5;
  if (v5)
  {
    -[SoCUpdaterHelper verboseLog:](self, "verboseLog:", @"%@", v5);
    if ([v6 needsOTPProgramming]) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = [v6 requiresPersonalization] ^ 1;
    }
    [v4 setUseLocalSigning:v7];
    id v9 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"PCON%u,Ticket",  @"%u",  0,  objc_msgSend(v4, "tag"));
    v13[0] = @"HardwareID";
    id v10 = (id)[v6 dictionary];
    v14[0] = v10;
    v14[1] = v9;
    v13[1] = @"TicketName";
    v13[2] = @"TagNumber";
    id v11 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(v4, "tag"));
    v14[2] = v11;
    id v8 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)queryInfoSingleStep
{
  v14[2] = *MEMORY[0x1895F89C0];
  unint64_t updaterIndex = self->_updaterIndex;
  if (updaterIndex >= -[NSArray count](self->_updaterInstances, "count"))
  {
    -[SoCUpdaterHelper log:](self, "log:", @"Too many queryInfo calls!");
    return 0LL;
  }

  else
  {
    id v4 =  -[NSArray objectAtIndexedSubscript:]( self->_updaterInstances,  "objectAtIndexedSubscript:",  self->_updaterIndex);
    id v5 = -[PS190UpdaterController queryInfoForUpdaterInstance:](self, "queryInfoForUpdaterInstance:", v4);
    if (v5)
    {
      int v6 = [v4 useLocalSigning];
      uint64_t v7 = "No";
      if (v6) {
        uint64_t v7 = "Yes";
      }
      -[SoCUpdaterHelper log:](self, "log:", @"Using local signing: %s", v7);
      id v12 = v5;
      v13[0] = @"InfoArray";
      id v8 = (id)[MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
      v14[0] = v8;
      v13[1] = @"LocalSigningID";
      id v9 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(v4, "useLocalSigning"));
      v14[1] = v9;
      id v10 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
    }

    else
    {
      id v10 = 0LL;
    }

    return v10;
  }

- (id)queryInfoAggregate
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = (id)[MEMORY[0x189603FA8] array];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = self->_updaterInstances;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    LODWORD(v8) = 1;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = -[PS190UpdaterController queryInfoForUpdaterInstance:](self, "queryInfoForUpdaterInstance:", v10);
        if (!v11)
        {
          id v13 = 0LL;
          goto LABEL_16;
        }

        id v12 = v11;
        uint64_t v8 = [v10 useLocalSigning] & v8;
        [v3 addObject:v12];
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  if ([v3 count])
  {
    v14 = "No";
    if ((_DWORD)v8) {
      v14 = "Yes";
    }
    -[SoCUpdaterHelper log:](self, "log:", @"Using local signing: %s", v14);
    v21[0] = @"InfoArray";
    id v4 = (NSArray *)(id)[MEMORY[0x189603F18] arrayWithArray:v3];
    v22[0] = v4;
    v21[1] = @"LocalSigningID";
    id v15 = (id)[MEMORY[0x189607968] numberWithBool:v8];
    v22[1] = v15;
    id v13 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];

LABEL_16:
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)queryInfo
{
  if (self->_recoveryModeSupported) {
    id v2 = -[PS190UpdaterController queryInfoSingleStep](self, "queryInfoSingleStep");
  }
  else {
    id v2 = -[PS190UpdaterController queryInfoAggregate](self, "queryInfoAggregate");
  }
  id v3 = v2;
  if (v2)
  {
    id v4 = +[PS190APHardwareID query](&OBJC_CLASS___PS190APHardwareID, "query");
    if (v4)
    {
      id v5 = (id)[MEMORY[0x189603FC8] dictionaryWithDictionary:v3];
      id v6 = (id)[v4 personalizationParameters];
      [v5 setObject:v6 forKeyedSubscript:@"APInfo"];

      id v7 = (id)[MEMORY[0x189603F68] dictionaryWithDictionary:v5];
      id v3 = v7;
    }
  }

  return v3;
}

- (BOOL)performUpdateForInstance:(id)a3 inputDict:(id)a4 firmwareFile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"PCON%u,Ticket",  @"%u",  0,  objc_msgSend(v8, "tag"));
  id v12 = (id)[v9 objectForKeyedSubscript:v11];
  if (!v12)
  {
    -[SoCUpdaterHelper log:](self, "log:", @"Unable to locate manifest for %@: %@", v11, v9);
LABEL_11:
    char v17 = 0;
    goto LABEL_12;
  }

  id v13 = v12;
  if (![v12 length])
  {
    globallySignedManifestPath = self->_globallySignedManifestPath;
    id v21 = 0LL;
    id v15 = (id)[MEMORY[0x189603F48] dataWithContentsOfFile:globallySignedManifestPath options:0 error:&v21];
    id v16 = v21;

    if (!v15)
    {
      id v19 = (id)[v16 description];
      -[SoCUpdaterHelper log:](self, "log:", @"Failed to read globally signed manfist: %@", v19);

      __int128 v18 = v16;
      goto LABEL_10;
    }

    -[SoCUpdaterHelper log:](self, "log:", @"Loaded globally signed manifest");

    id v13 = v15;
  }

  if (([v10 setIMG4Data:v13] & 1) == 0)
  {
    -[SoCUpdaterHelper log:](self, "log:", @"Unable to add manifest to firmware file.");
    __int128 v18 = v13;
LABEL_10:

    goto LABEL_11;
  }

  char v17 = [v8 performUpdateForFirmwareFile:v10 inputDict:v9 skipSameVersion:self->_skipSameVersion];

LABEL_12:
  return v17;
}

- (BOOL)performUpdateWithDictionarySingleStep:(id)a3 firmwareFile:(id)a4
{
  updaterInstances = self->_updaterInstances;
  unint64_t updaterIndex = self->_updaterIndex;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[NSArray objectAtIndexedSubscript:](updaterInstances, "objectAtIndexedSubscript:", updaterIndex);
  BOOL v11 = -[PS190UpdaterController performUpdateForInstance:inputDict:firmwareFile:]( self,  "performUpdateForInstance:inputDict:firmwareFile:",  v10,  v9,  v8);

  return v11;
}

- (BOOL)performUpdateWithDictionaryAggregate:(id)a3 firmwareFile:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = self->_updaterInstances;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[PS190UpdaterController performUpdateForInstance:inputDict:firmwareFile:]( self,  "performUpdateForInstance:inputDict:firmwareFile:",  *(void *)(*((void *)&v15 + 1) + 8 * i),  v6,  v7,  (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }

      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)performUpdateWithDictionary:(id)a3
{
  id v4 = a3;
  -[SoCUpdaterHelper verboseLog:](self, "verboseLog:", @"Perform update input = %@", v4);
  id v5 = (id)[v4 objectForKeyedSubscript:@"FirmwareData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = (id)[v5 objectForKeyedSubscript:@"FirmwareData"];
    if (v6)
    {
      id v7 = -[PS190FirmwareFile initWithData:](objc_alloc(&OBJC_CLASS___PS190FirmwareFile), "initWithData:", v6);
      if (v7)
      {
        if (self->_recoveryModeSupported) {
          BOOL v8 = -[PS190UpdaterController performUpdateWithDictionarySingleStep:firmwareFile:]( self,  "performUpdateWithDictionarySingleStep:firmwareFile:",  v4,  v7);
        }
        else {
          BOOL v8 = -[PS190UpdaterController performUpdateWithDictionaryAggregate:firmwareFile:]( self,  "performUpdateWithDictionaryAggregate:firmwareFile:",  v4,  v7);
        }
        BOOL v9 = v8;
      }

      else
      {
        -[SoCUpdaterHelper log:]( self,  "log:",  @"%s: Unable to create PS190FirmwareFile from firmware data.",  "-[PS190UpdaterController performUpdateWithDictionary:]");
        BOOL v9 = 0;
      }
    }

    else
    {
      -[SoCUpdaterHelper log:]( self,  "log:",  @"%s: Unable to locate firmware data.",  "-[PS190UpdaterController performUpdateWithDictionary:]");
      BOOL v9 = 0;
    }
  }

  else
  {
    -[SoCUpdaterHelper log:]( self,  "log:",  @"%s: Unable to locate firmware dictionary.",  "-[PS190UpdaterController performUpdateWithDictionary:]");
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isDone
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = self->_updaterInstances;
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "complete", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }

      uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)recoveryModeSupported
{
  return self->_recoveryModeSupported;
}

- (BOOL)allowNonceQueries
{
  return self->_allowNonceQueries;
}

- (NSString)globallySignedManifestPath
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setGloballySignedManifestPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end