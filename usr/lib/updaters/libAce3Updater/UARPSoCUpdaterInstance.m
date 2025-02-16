@interface UARPSoCUpdaterInstance
- (BOOL)applyStagedFirmware;
- (BOOL)initUARP;
- (BOOL)initUARPWithFirmware:(id)a3;
- (BOOL)isDone;
- (BOOL)offerFirmwareData:(id)a3;
- (BOOL)offerPersonalizationResponse:(id)a3;
- (BOOL)receievePersonalizationRequestByOfferFirmwareData:(id)a3;
- (BOOL)skipApplyStage;
- (BOOL)skipSameVersion;
- (BOOL)useLocalSigning;
- (NSDictionary)personalizationRequestDict;
- (NSString)firmwareTagName;
- (NSString)manifestPrefix;
- (NSString)ticketName;
- (SoCUpdaterHelper)log;
- (UARPSoCUpdaterInstance)initWithHelper:(id)a3 options:(id)a4;
- (UARPSoCUpdaterInstance)initWithLogicUnitNumber:(unsigned int)a3 helper:(id)a4 options:(id)a5;
- (UARPSoCUpdaterInstance)initWithRouterID:(unsigned __int8)a3 helper:(id)a4 options:(id)a5;
- (const)namePrefix;
- (const)uarpRestoreQueueName;
- (id)name;
- (int)updaterMode;
- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks;
- (unsigned)applyFlags;
- (unsigned)logicUnitNumber;
- (unsigned)routerID;
- (unsigned)stagingStatus;
- (unsigned)stagingStatusReason;
- (void)applyAssetComplete;
- (void)assetTransferUARPComplete;
- (void)initUARPComplete;
- (void)printUpdaterMode;
- (void)setApplyFlags:(unsigned int)a3;
- (void)setLog:(id)a3;
- (void)setStagingStatus:(unsigned int)a3;
- (void)setStagingStatusReason:(unsigned int)a3;
- (void)stagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4;
- (void)tssRequestWithOptions:(id)a3 serverURL:(id)a4 assetCtx:(void *)a5 siliconCtx:(_UARPSiliconContext *)a6;
- (void)uarpRestoreInitOptions;
- (void)updateAppleProperty:(unsigned int)a3 siliconCtx:(_UARPSiliconContext *)a4;
- (void)updateStagingProgressWithBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
@end

@implementation UARPSoCUpdaterInstance

- (UARPSoCUpdaterInstance)initWithHelper:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___UARPSoCUpdaterInstance;
  v9 = -[UARPSoCUpdaterInstance init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_log, a3);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    initUARPSemaphore = v10->_initUARPSemaphore;
    v10->_initUARPSemaphore = (OS_dispatch_semaphore *)v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
    assetTransferUARPSemaphore = v10->_assetTransferUARPSemaphore;
    v10->_assetTransferUARPSemaphore = (OS_dispatch_semaphore *)v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    applyAssetUARPSemaphore = v10->_applyAssetUARPSemaphore;
    v10->_applyAssetUARPSemaphore = (OS_dispatch_semaphore *)v15;

    v10->_updaterMode = SoCUpdaterGetMode(v8);
    v10->_uarpContext = 0LL;
    v10->_isDone = 0;
    tssRequest = v10->_tssRequest;
    v10->_tssRequest = 0LL;

    tssRequestServerURL = v10->_tssRequestServerURL;
    v10->_tssRequestServerURL = 0LL;

    v10->_pAssetContext = 0LL;
    v10->_endpoint = 0LL;
    manifestPrefixName = v10->_manifestPrefixName;
    v10->_manifestPrefixName = 0LL;

    ticketLongName = v10->_ticketLongName;
    v10->_ticketLongName = 0LL;

    v10->_requiresPersonalization = 0;
    v10->_logicUnitNumberFromDevice = -1;
    *(_WORD *)&v10->_prefixNeedsLogicalUnitNumber = 0;
    v10->_skipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
    if (!-[UARPSoCUpdaterInstance uarpRestoreInitOptions](v10, "uarpRestoreInitOptions")
      || !-[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks](v10, "uarpRestoreLayer4Callbacks")
      || !-[UARPSoCUpdaterInstance uarpRestoreQueueName](v10, "uarpRestoreQueueName"))
    {
      v24 = 0LL;
      goto LABEL_8;
    }

    id v21 = objc_msgSend( NSString,  "stringWithFormat:",  @"%s.queue",  -[UARPSoCUpdaterInstance uarpRestoreQueueName](v10, "uarpRestoreQueueName"));
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v22;
  }

  v24 = v10;
LABEL_8:

  return v24;
}

- (UARPSoCUpdaterInstance)initWithLogicUnitNumber:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  v6 = -[UARPSoCUpdaterInstance initWithHelper:options:](self, "initWithHelper:options:", a4, a5);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_logicUnitNumber = a3;
    v6->_routerID = -1;
    if (!-[UARPSoCUpdaterInstance initUARPRestoreQueryInfo](v6, "initUARPRestoreQueryInfo"))
    {
      objc_msgSend( p_isa[20],  "log:",  @"%s: Failed to init Restore UARP Query Info.",  "-[UARPSoCUpdaterInstance initWithLogicUnitNumber:helper:options:]");
      id v8 = 0LL;
      goto LABEL_6;
    }

    [p_isa printUpdaterMode];
  }

  id v8 = p_isa;
LABEL_6:

  return v8;
}

- (UARPSoCUpdaterInstance)initWithRouterID:(unsigned __int8)a3 helper:(id)a4 options:(id)a5
{
  v6 = -[UARPSoCUpdaterInstance initWithHelper:options:](self, "initWithHelper:options:", a4, a5);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_routerID = a3;
    v6->_logicUnitNumber = -1;
    if (!-[UARPSoCUpdaterInstance initUARPRestoreQueryInfo](v6, "initUARPRestoreQueryInfo"))
    {
      objc_msgSend( p_isa[20],  "log:",  @"%s: Failed to init Restore UARP Query Info.",  "-[UARPSoCUpdaterInstance initWithRouterID:helper:options:]");
      id v8 = 0LL;
      goto LABEL_6;
    }

    [p_isa printUpdaterMode];
  }

  id v8 = p_isa;
LABEL_6:

  return v8;
}

- (BOOL)receievePersonalizationRequestByOfferFirmwareData:(id)a3
{
  log = self->_log;
  id v5 = a3;
  -[SoCUpdaterHelper verboseLog:]( log,  "verboseLog:",  @"%s: data = %@",  "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]",  v5);
  tssRequest = self->_tssRequest;
  self->_tssRequest = 0LL;

  tssRequestServerURL = self->_tssRequestServerURL;
  self->_tssRequestServerURL = 0LL;

  self->_pAssetContext = 0LL;
  self->_endpoint = 0LL;
  id v8 = self->_log;
  v9 = -[UARPSoCUpdaterInstance name](self, "name");
  -[SoCUpdaterHelper log:]( v8,  "log:",  @"%s: %@ Offering Firmware",  "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]",  v9);

  LOBYTE(v8) = -[UARPSoCUpdaterInstance initUARPWithFirmware:](self, "initUARPWithFirmware:", v5);
  if ((v8 & 1) != 0)
  {
    self->_stagingResult = 0;
    v10 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v10, "log:", @"%@: Waiting for staging to complete...", v11);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTransferUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v12 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v12, "log:", @"%@: Continuing after staging.", v13);

    v14 = self->_tssRequest;
    if (v14)
    {
LABEL_5:
      -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Success. tssOptions:%@, tssServer:%@ ",  "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]",  v14,  self->_tssRequestServerURL);
      return self->_stagingResult;
    }

    if (-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
    {
      v14 = self->_tssRequest;
      goto LABEL_5;
    }

    -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Failed to receive tssOptions.",  "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]");
  }

  else
  {
    -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Failed to init Restore UARP.",  "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]");
  }

  return 0;
}

- (BOOL)offerFirmwareData:(id)a3
{
  return self->_tssRequest
      || -[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]( self,  "receievePersonalizationRequestByOfferFirmwareData:",  a3);
}

- (BOOL)offerPersonalizationResponse:(id)a3
{
  v4 = (const __CFDictionary *)a3;
  -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Tss Response: %@",  "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]",  v4);
  if (-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
  {
    -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Local Signing is enabled, no personalization data expected.",  "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
  }

  else
  {
    if (!v4 && !-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
    {
      -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Personalization data is expected but empty.",  "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
      BOOL v15 = 0;
      goto LABEL_7;
    }

    tssRequest = self->_tssRequest;
    -[SoCUpdaterHelper log:]( self->_log,  "log:",  @"%s: Offering Tss Response",  "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
    CoreUARPRestorePersonalizationTssResponse( (uint64_t)self->_endpoint,  (uint64_t)self->_pAssetContext,  (int)tssRequest,  v4,  v6,  v7,  v8,  v9);
    v10 = self->_tssRequest;
    self->_tssRequest = 0LL;

    log = self->_log;
    v12 = -[UARPSoCUpdaterInstance name](self, "name");
    -[SoCUpdaterHelper log:](log, "log:", @"%@: Waiting for TSS offer to complete...", v12);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTransferUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v13 = self->_log;
    v14 = -[UARPSoCUpdaterInstance name](self, "name");
    -[SoCUpdaterHelper log:](v13, "log:", @"%@: Continuing after TSS offer.", v14);
  }

  BOOL v15 = 1;
LABEL_7:

  return v15;
}

- (BOOL)applyStagedFirmware
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "verboseLog:", @"%s", "-[UARPSoCUpdaterInstance applyStagedFirmware]");

  self->_isDone = self->_tssRequest == 0LL;
  if (-[UARPSoCUpdaterInstance skipApplyStage](self, "skipApplyStage"))
  {
    v4 = -[UARPSoCUpdaterInstance log](self, "log");
    objc_msgSend( v4,  "verboseLog:",  @"%s: Skipping Apply for Updater(LUN:%d,RouterID:%d)",  "-[UARPSoCUpdaterInstance applyStagedFirmware]",  -[UARPSoCUpdaterInstance logicUnitNumber](self, "logicUnitNumber"),  -[UARPSoCUpdaterInstance routerID](self, "routerID"));

    return 1;
  }

  log = self->_log;
  if (self->_uarpContext)
  {
    -[SoCUpdaterHelper log:]( log,  "log:",  @"%s: Applying Staged Assets",  "-[UARPSoCUpdaterInstance applyStagedFirmware]");
    UarpRestoreApplyStagedAssets((dispatch_queue_t *)self->_uarpContext);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_applyAssetUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[SoCUpdaterHelper verboseLog:]( self->_log,  "verboseLog:",  @"%s: Success.",  "-[UARPSoCUpdaterInstance applyStagedFirmware]");
    return 1;
  }

  -[SoCUpdaterHelper log:]( log,  "log:",  @"%s: There is no asset to apply.",  "-[UARPSoCUpdaterInstance applyStagedFirmware]");
  return 0;
}

- (NSDictionary)personalizationRequestDict
{
  return self->_tssRequest;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)initUARPComplete
{
}

- (void)assetTransferUARPComplete
{
}

- (void)applyAssetComplete
{
}

- (void)tssRequestWithOptions:(id)a3 serverURL:(id)a4 assetCtx:(void *)a5 siliconCtx:(_UARPSiliconContext *)a6
{
  id v19 = a3;
  id v10 = a4;
  dispatch_semaphore_t v11 = v19;
  if (v19)
  {
    v12 = -[UARPSoCUpdaterInstance log](self, "log");
    objc_msgSend( v12,  "log:",  @"%s: Received Invalid tssOptions",  "-[UARPSoCUpdaterInstance tssRequestWithOptions:serverURL:assetCtx:siliconCtx:]");

    dispatch_semaphore_t v11 = v19;
  }

  if (self->_tssRequest)
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v13,  "log:",  @"%s: Error: Multiple payload needs personalization",  "-[UARPSoCUpdaterInstance tssRequestWithOptions:serverURL:assetCtx:siliconCtx:]");
  }

  else
  {
    var4 = a6->var4;
    self->_pAssetContext = a5;
    self->_endpoint = var4;
    BOOL v15 = (NSDictionary *)[v11 copy];
    tssRequest = self->_tssRequest;
    self->_tssRequest = v15;

    objc_storeStrong((id *)&self->_tssRequestServerURL, a4);
    log = self->_log;
    v18 = -[UARPSoCUpdaterInstance name](self, "name");
    -[SoCUpdaterHelper log:](log, "log:", @"%@: TSS request signal waiting callbacks", v18);

    self->_stagingResult = 1;
    -[UARPSoCUpdaterInstance assetTransferUARPComplete](self, "assetTransferUARPComplete");
  }
}

- (void)updateAppleProperty:(unsigned int)a3 siliconCtx:(_UARPSiliconContext *)a4
{
  switch(a3)
  {
    case 0xEu:
      self->_prefixNeedsLogicalUnitNumber = UarpRestoreInfoPropertyPrefixNeedsLUN((uint64_t)a4) != 0;
      break;
    case 0xFu:
      self->_suffixNeedsLogicalUnitNumber = UarpRestoreInfoPropertySuffixNeedsLUN((uint64_t)a4) != 0;
      break;
    case 0x10u:
      self->_logicUnitNumberFromDevice = UarpRestoreInfoPropertyLogicalUnitNumber((uint64_t)a4);
      break;
    case 0x11u:
      [NSString stringWithUTF8String:UarpRestoreInfoPropertyTicketLongName((uint64_t)a4)];
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      ticketLongName = self->_ticketLongName;
      self->_ticketLongName = v7;
      goto LABEL_8;
    case 0x12u:
      self->_requiresPersonalization = UarpRestoreInfoPropertyRequiresPersonalization((uint64_t)a4) != 0;
      break;
    default:
      if (a3 == 3)
      {
        [NSString stringWithUTF8String:UarpRestoreInfoPropertyManifestPrefix((uint64_t)a4)];
        id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        ticketLongName = self->_manifestPrefixName;
        self->_manifestPrefixName = v5;
LABEL_8:
      }

      break;
  }

- (NSString)firmwareTagName
{
  uint64_t logicUnitNumberFromDevice = self->_logicUnitNumberFromDevice;
  if (self->_prefixNeedsLogicalUnitNumber)
  {
    [NSString stringWithFormat:@"%@%d", self->_manifestPrefixName, logicUnitNumberFromDevice];
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = self->_manifestPrefixName;
  }

  id v5 = v4;
  if (self->_suffixNeedsLogicalUnitNumber)
  {
    [NSString stringWithFormat:@"%@%d", self->_ticketLongName, logicUnitNumberFromDevice];
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = self->_ticketLongName;
  }

  uint64_t v7 = v6;
  [NSString stringWithFormat:@"%@,%@", v5, v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)ticketName
{
  uint64_t logicUnitNumberFromDevice = self->_logicUnitNumberFromDevice;
  if (self->_prefixNeedsLogicalUnitNumber)
  {
    [NSString stringWithFormat:@"%@%d", self->_manifestPrefixName, logicUnitNumberFromDevice];
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = self->_manifestPrefixName;
  }

  id v5 = v4;
  BOOL suffixNeedsLogicalUnitNumber = self->_suffixNeedsLogicalUnitNumber;
  uint64_t v7 = @"Ticket";
  if (suffixNeedsLogicalUnitNumber)
  {
    [NSString stringWithFormat:@"%@%d", @"Ticket", logicUnitNumberFromDevice];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  [NSString stringWithFormat:@"%@,%@", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)useLocalSigning
{
  return !self->_requiresPersonalization;
}

- (NSString)manifestPrefix
{
  return (NSString *)[NSString stringWithString:self->_manifestPrefixName];
}

- (BOOL)skipApplyStage
{
  return 0;
}

- (void)uarpRestoreInitOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "log:",  @"%s: error subclass needs to override this property",  "-[UARPSoCUpdaterInstance uarpRestoreInitOptions]");

  return 0LL;
}

- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "log:",  @"%s: error subclass needs to override this property",  "-[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks]");

  return 0LL;
}

- (const)uarpRestoreQueueName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "log:",  @"%s: error subclass needs to override this property",  "-[UARPSoCUpdaterInstance uarpRestoreQueueName]");

  return 0LL;
}

- (BOOL)initUARP
{
  if (self->_uarpContext) {
    goto LABEL_2;
  }
  v2 = -[UARPSoCUpdaterInstance uarpRestoreInitOptions](self, "uarpRestoreInitOptions");
  if (v2)
  {
    uint64_t v4 = (uint64_t)v2;
    v2 = -[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks](self, "uarpRestoreLayer4Callbacks");
    if (v2)
    {
      if (!v2->var9) {
        v2->var9 = UARPSoCUpdaterLayer4UARPPropertyUpdate;
      }
      if (!v2->var10) {
        v2->var10 = UARPSoCUpdaterLayer4ApplePropertyUpdate;
      }
      if (!v2->var11) {
        v2->var11 = UARPSoCUpdaterLayer4PropertiesComplete;
      }
      if (!v2->var5) {
        v2->var5 = UARPSoCUpdaterStagingProgress;
      }
      if (!v2->var6) {
        v2->var6 = UARPSoCUpdaterStagingComplete;
      }
      if (!v2->var7) {
        v2->var7 = UARPSoCUpdaterApplyComplete;
      }
      if (!v2->var8) {
        v2->var8 = UARPSoCUpdaterFirmwareTssRequest;
      }
      if (!v2->var13) {
        v2->var13 = UARPSoCUpdaterFirmwareLogCommon;
      }
      if (!v2->var14) {
        v2->var14 = UARPSoCUpdaterFirmwareLogCommon;
      }
      if (!v2->var15) {
        v2->var15 = UARPSoCUpdaterFirmwareLogCommon;
      }
      if (!v2->var16) {
        v2->var16 = UARPSoCUpdaterFirmwareLogCommon;
      }
      id v5 = UarpRestoreInitializeEndpoint( (uint64_t)self,  v4,  (uint64_t)v2,  -[UARPSoCUpdaterInstance uarpRestoreQueueName](self, "uarpRestoreQueueName"));
      self->_uarpContext = v5;
      if (v5)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __34__UARPSoCUpdaterInstance_initUARP__block_invoke;
        block[3] = &unk_18A3BEAE8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)queue, block);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_initUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
LABEL_2:
        LOBYTE(v2) = 1;
        return (char)v2;
      }

      -[UARPSoCUpdaterInstance log](self, "log");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v7,  "log:",  @"%s: UarpRestoreInitializeEndpoint() returns NULL.",  "-[UARPSoCUpdaterInstance initUARP]");

      LOBYTE(v2) = 0;
    }
  }

  return (char)v2;
}

uint64_t __34__UARPSoCUpdaterInstance_initUARP__block_invoke(uint64_t a1)
{
  return UarpRestoreInfoQueries( *(dispatch_queue_t **)(*(void *)(a1 + 32) + 48LL),  0LL,  0,  &initUARP_applePropertyArray,  6);
}

- (BOOL)initUARPWithFirmware:(id)a3
{
  id v4 = a3;
  if (-[UARPSoCUpdaterInstance initUARP](self, "initUARP"))
  {
    uarpContext = self->_uarpContext;
    id v6 = v4;
    uint64_t v7 = (const void *)[v6 bytes];
    size_t v8 = [v6 length];
    uint64_t v14 = UarpRestoreStageFirmwareDataBuffer((uint64_t)uarpContext, v7, v8, v9, v10, v11, v12, v13);
    if (!(_DWORD)v14)
    {
      BOOL v17 = 1;
      goto LABEL_6;
    }

    uint64_t v15 = v14;
    v16 = -[UARPSoCUpdaterInstance log](self, "log");
    objc_msgSend( v16,  "log:",  @"%s: UarpRestoreStageFirmwareDataBuffer() returns %u.",  "-[UARPSoCUpdaterInstance initUARPWithFirmware:]",  v15);
  }

  BOOL v17 = 0;
LABEL_6:

  return v17;
}

- (void)printUpdaterMode
{
  log = self->_log;
  -[UARPSoCUpdaterInstance name](self, "name");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SoCUpdaterHelper log:]( log,  "log:",  @"%@: Detected updater mode %s",  v4,  StringForSoCRestoreUpdateMode(self->_updaterMode));
}

- (const)namePrefix
{
  return "uarp";
}

- (id)name
{
  if (!self->_name)
  {
    if (self->_routerID == 255)
    {
      unsigned int logicUnitNumber = self->_logicUnitNumber;
      id v4 = (void *)NSString;
      id v5 = -[UARPSoCUpdaterInstance namePrefix](self, "namePrefix");
      if (logicUnitNumber == -1)
      {
        [v4 stringWithUTF8String:v5];
        id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }

      objc_msgSend(v4, "stringWithFormat:", @"%s[%u]", v5, self->_logicUnitNumber);
    }

    else
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s[%u]",  -[UARPSoCUpdaterInstance namePrefix](self, "namePrefix"),  self->_routerID);
    }

    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    name = self->_name;
    self->_name = v6;
  }

  return self->_name;
}

- (void)updateStagingProgressWithBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  unsigned int v4 = ((float)((float)a3 / (float)a4) * 100.0);
  self->_lastPercentComplete = v4;
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", @"%@ Update: %u%%", v7, self->_lastPercentComplete);

    self->_nextUpdateProgressReportPercentThreshold = self->_lastPercentComplete + 10;
  }

- (void)stagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (self->_lastPercentComplete <= 0x63)
  {
    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", @"%@ Update: 100%%", v8);
  }

  if ((_DWORD)v5 == 1)
  {
    uint64_t v9 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v9, "log:", @"%@ Staging Complete", v10);

    self->_stagingResult = 1;
  }

  else
  {
    uint64_t v11 = uarpProcessingStatusToString((unsigned __int16)v5);
    uint64_t v12 = uarpProcessingFlagsToString((unsigned __int16)v4);
    uint64_t v13 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:]( v13,  "log:",  @"%@: Firmware staging failed. Status: 0x%08x (%s), Reason: 0x%08x (%s)",  v14,  v5,  v11,  v4,  v12);
  }

  uint64_t v15 = self->_log;
  v16 = -[UARPSoCUpdaterInstance name](self, "name");
  -[SoCUpdaterHelper log:](v15, "log:", @"%@: staging complete signaling waiting callbacks", v16);

  -[UARPSoCUpdaterInstance assetTransferUARPComplete](self, "assetTransferUARPComplete");
}

- (SoCUpdaterHelper)log
{
  return (SoCUpdaterHelper *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setLog:(id)a3
{
}

- (unsigned)routerID
{
  return self->_routerID;
}

- (unsigned)logicUnitNumber
{
  return self->_logicUnitNumber;
}

- (unsigned)stagingStatus
{
  return self->_stagingStatus;
}

- (void)setStagingStatus:(unsigned int)a3
{
  self->_stagingStatus = a3;
}

- (unsigned)stagingStatusReason
{
  return self->_stagingStatusReason;
}

- (void)setStagingStatusReason:(unsigned int)a3
{
  self->_stagingStatusReason = a3;
}

- (unsigned)applyFlags
{
  return self->_applyFlags;
}

- (void)setApplyFlags:(unsigned int)a3
{
  self->_applyFlags = a3;
}

- (BOOL)skipSameVersion
{
  return self->_skipSameVersion;
}

- (int)updaterMode
{
  return self->_updaterMode;
}

- (void).cxx_destruct
{
}

@end