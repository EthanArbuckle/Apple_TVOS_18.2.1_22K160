@interface UARPAccessory
+ (id)logger;
- (BOOL)assetTransfersPaused;
- (BOOL)autoDownloadAllowed;
- (BOOL)clientQueryPendingForProperty:(unint64_t)a3;
- (BOOL)downloadOnCellularAllowed;
- (BOOL)enableFirmwareDownloadOnDemand;
- (BOOL)isEqual:(id)a3;
- (BOOL)reachable;
- (BOOL)suppressAutomaticDynamicAssets;
- (BOOL)suppressInfoQueries;
- (BOOL)userInitiatedFirmwareApply;
- (BOOL)userInitiatedFirmwareStaging;
- (NSString)availableFirmwareVersion;
- (NSString)filepathCurrentAsset;
- (NSString)firmwareVersion;
- (NSString)friendlyName;
- (NSString)hwFusingType;
- (NSString)hwRevision;
- (NSString)manufacturer;
- (NSString)modelName;
- (NSString)modelNumber;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSString)serialNumber;
- (NSString)stagedFirmwareVersion;
- (NSUUID)uuid;
- (UARPAccessory)initWithHardwareID:(id)a3 uuid:(id)a4;
- (UARPAccessory)initWithID:(id)a3;
- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6;
- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8;
- (UARPAccessory)initWithModelNumber:(id)a3;
- (UARPAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 uuid:(id)a5;
- (id)bsdNotifications;
- (id)description;
- (id)getID;
- (id)partnerSerialNumbers;
- (id)pendingAssets;
- (id)serviceBsdNotifications;
- (int64_t)transport;
- (unint64_t)capability;
- (unint64_t)uarpVersion;
- (unsigned)firmwareUpdateBytesTotal;
- (unsigned)firmwareUpdateBytesTransferred;
- (void)addPendingAsset:(id)a3;
- (void)addPendingClientPropertyQuery:(unint64_t)a3;
- (void)removePendingAsset:(id)a3;
- (void)removePendingClientPropertyQuery:(unint64_t)a3;
- (void)setAssetTransfersPaused:(BOOL)a3;
- (void)setAutoDownloadAllowed:(BOOL)a3;
- (void)setAvailableFirmwareVersion:(id)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setDownloadOnCellularAllowed:(BOOL)a3;
- (void)setEnableFirmwareDownloadOnDemand:(BOOL)a3;
- (void)setFilepathCurrentAsset:(id)a3;
- (void)setFirmwareUpdateBytesTotal:(unsigned int)a3;
- (void)setFirmwareUpdateBytesTransferred:(unsigned int)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHwFusingType:(id)a3;
- (void)setHwRevision:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setPartnerSerialNumbers:(id)a3;
- (void)setProductGroup:(id)a3;
- (void)setProductNumber:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3;
- (void)setSuppressInfoQueries:(BOOL)a3;
- (void)setTransport:(int64_t)a3;
- (void)setUarpVersion:(unint64_t)a3;
- (void)setUserInitiatedFirmwareApply:(BOOL)a3;
- (void)setUserInitiatedFirmwareStaging:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation UARPAccessory

- (UARPAccessory)initWithID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UARPAccessory;
  v6 = -[UARPAccessory init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_id, a3);
    uint64_t v8 = [MEMORY[0x189603FA8] array];
    internalPendingAssets = v7->_internalPendingAssets;
    v7->_internalPendingAssets = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x189603FE0] set];
    pendingClientPropertyQueries = v7->_pendingClientPropertyQueries;
    v7->_pendingClientPropertyQueries = (NSMutableSet *)v10;
  }

  return v7;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryID),  "initWithManufacturer:modelName:serialNumber:firmwareVersion:",  v13,  v12,  v11,  v10);

  v15 = -[UARPAccessory initWithID:](self, "initWithID:", v14);
  return v15;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]( objc_alloc(&OBJC_CLASS___UARPAccessoryID),  "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:",  v19,  v18,  v17,  v16,  v15,  v14);

  v21 = -[UARPAccessory initWithID:](self, "initWithID:", v20);
  return v21;
}

- (UARPAccessory)initWithModelNumber:(id)a3
{
  id v4 = a3;
  id v5 = -[UARPAccessoryID initWithModelNumber:](objc_alloc(&OBJC_CLASS___UARPAccessoryID), "initWithModelNumber:", v4);

  v6 = -[UARPAccessory initWithID:](self, "initWithID:", v5);
  return v6;
}

- (UARPAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]( objc_alloc(&OBJC_CLASS___UARPAccessoryID),  "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:",  0LL,  0LL,  0LL,  0LL,  v10,  v9);

  -[UARPAccessoryID setUuid:](v11, "setUuid:", v8);
  id v12 = -[UARPAccessory initWithID:](self, "initWithID:", v11);

  return v12;
}

- (UARPAccessory)initWithHardwareID:(id)a3 uuid:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  +[UARPAccessory logger](&OBJC_CLASS___UARPAccessory, "logger");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    +[UARPSupportedAccessory supportedAccessories](&OBJC_CLASS___UARPSupportedAccessory, "supportedAccessories");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v37 = 138412290;
    v38 = v9;
    _os_log_impl(&dword_187DC0000, v8, OS_LOG_TYPE_INFO, "Supported accessories %@", (uint8_t *)&v37, 0xCu);
  }

  +[UARPSupportedAccessory findByHardwareID:](&OBJC_CLASS___UARPSupportedAccessory, "findByHardwareID:", v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (!v10)
  {
    +[UARPAccessory logger](&OBJC_CLASS___UARPAccessory, "logger");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPAccessory initWithHardwareID:uuid:].cold.1((uint64_t)v6, v16, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_18;
  }

  [v10 appleModelNumber];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    uint64_t v24 = [v11 productGroup];
    if (v24)
    {
      v25 = (void *)v24;
      [v11 productNumber];
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        +[UARPAccessory logger](&OBJC_CLASS___UARPAccessory, "logger");
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412290;
          v38 = v11;
          _os_log_impl(&dword_187DC0000, v27, OS_LOG_TYPE_INFO, "PG/PN based accessory %@", (uint8_t *)&v37, 0xCu);
        }

        v28 = objc_alloc(&OBJC_CLASS___UARPAccessoryID);
        [v11 productGroup];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 productNumber];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        id v16 = -[UARPAccessoryID initWithProductGroup:productNumber:]( v28,  "initWithProductGroup:productNumber:",  v15,  v29);

        goto LABEL_8;
      }
    }

    +[UARPAccessory logger](&OBJC_CLASS___UARPAccessory, "logger");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPAccessory initWithHardwareID:uuid:].cold.2((uint64_t)v11, v16, v30, v31, v32, v33, v34, v35);
    }
LABEL_18:
    id v17 = 0LL;
    goto LABEL_19;
  }

  +[UARPAccessory logger](&OBJC_CLASS___UARPAccessory, "logger");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v37 = 138412290;
    v38 = v11;
    _os_log_impl( &dword_187DC0000,  v13,  OS_LOG_TYPE_INFO,  "Apple Model Number based accessory %@",  (uint8_t *)&v37,  0xCu);
  }

  id v14 = objc_alloc(&OBJC_CLASS___UARPAccessoryID);
  [v11 appleModelNumber];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = -[UARPAccessoryID initWithModelNumber:](v14, "initWithModelNumber:", v15);
LABEL_8:

  -[os_log_s setUuid:](v16, "setUuid:", v7);
  -[os_log_s setTransport:](v16, "setTransport:", [v6 transport]);
  self = -[UARPAccessory initWithID:](self, "initWithID:", v16);
  id v17 = self;
LABEL_19:

  return v17;
}

- (NSString)serialNumber
{
  return -[UARPAccessoryID serialNumber](self->_id, "serialNumber");
}

- (NSString)modelName
{
  return -[UARPAccessoryID modelName](self->_id, "modelName");
}

- (NSString)modelNumber
{
  return -[UARPAccessoryID modelNumber](self->_id, "modelNumber");
}

- (NSString)manufacturer
{
  return -[UARPAccessoryID manufacturer](self->_id, "manufacturer");
}

- (id)getID
{
  return self->_id;
}

- (id)description
{
  return -[UARPAccessoryID description](self->_id, "description");
}

- (NSString)firmwareVersion
{
  return -[UARPAccessoryID firmwareVersion](self->_id, "firmwareVersion");
}

- (NSString)productNumber
{
  return -[UARPAccessoryID productNumber](self->_id, "productNumber");
}

- (NSString)productGroup
{
  return -[UARPAccessoryID productGroup](self->_id, "productGroup");
}

- (NSString)stagedFirmwareVersion
{
  return -[UARPAccessoryID stagedFirmwareVersion](self->_id, "stagedFirmwareVersion");
}

- (BOOL)downloadOnCellularAllowed
{
  return -[UARPAccessoryID downloadOnCellularAllowed](self->_id, "downloadOnCellularAllowed");
}

- (BOOL)autoDownloadAllowed
{
  return -[UARPAccessoryID autoDownloadAllowed](self->_id, "autoDownloadAllowed");
}

- (NSString)hwFusingType
{
  return -[UARPAccessoryID hwFusingType](self->_id, "hwFusingType");
}

- (NSString)hwRevision
{
  return -[UARPAccessoryID hwRevision](self->_id, "hwRevision");
}

- (BOOL)suppressAutomaticDynamicAssets
{
  return -[UARPAccessoryID suppressAutomaticDynamicAssets](self->_id, "suppressAutomaticDynamicAssets");
}

- (BOOL)suppressInfoQueries
{
  return -[UARPAccessoryID suppressInfoQueries](self->_id, "suppressInfoQueries");
}

- (NSString)friendlyName
{
  return -[UARPAccessoryID friendlyName](self->_id, "friendlyName");
}

- (unint64_t)uarpVersion
{
  return -[UARPAccessoryID uarpVersion](self->_id, "uarpVersion");
}

- (void)setDownloadOnCellularAllowed:(BOOL)a3
{
}

- (void)setAutoDownloadAllowed:(BOOL)a3
{
}

- (void)setSerialNumber:(id)a3
{
}

- (void)setModelName:(id)a3
{
}

- (void)setModelNumber:(id)a3
{
}

- (void)setManufacturer:(id)a3
{
}

- (void)setFirmwareVersion:(id)a3
{
}

- (void)setProductGroup:(id)a3
{
}

- (void)setProductNumber:(id)a3
{
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void)setHwFusingType:(id)a3
{
}

- (void)setHwRevision:(id)a3
{
}

- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3
{
}

- (void)setSuppressInfoQueries:(BOOL)a3
{
}

- (void)setFriendlyName:(id)a3
{
}

- (void)setUarpVersion:(unint64_t)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAccessory *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v5 = self == v4 || -[UARPAccessoryID isEqual:](self->_id, "isEqual:", v4->_id);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addPendingAsset:(id)a3
{
}

- (void)removePendingAsset:(id)a3
{
}

- (id)pendingAssets
{
  return (id)[MEMORY[0x189603F18] arrayWithArray:self->_internalPendingAssets];
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setAssetTransfersPaused:(BOOL)a3
{
  self->_assetTransfersPaused = a3;
}

- (BOOL)assetTransfersPaused
{
  return self->_assetTransfersPaused;
}

- (void)setTransport:(int64_t)a3
{
}

- (int64_t)transport
{
  return -[UARPAccessoryID transport](self->_id, "transport");
}

- (NSUUID)uuid
{
  return (NSUUID *)-[UARPAccessoryID uuid](self->_id, "uuid");
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)capability
{
  return -[UARPAccessoryID capability](self->_id, "capability");
}

- (void)setCapability:(unint64_t)a3
{
}

- (void)addPendingClientPropertyQuery:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](pendingClientPropertyQueries, "addObject:", v4);
}

- (void)removePendingClientPropertyQuery:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](pendingClientPropertyQueries, "removeObject:", v4);
}

- (BOOL)clientQueryPendingForProperty:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pendingClientPropertyQueries) = -[NSMutableSet containsObject:]( pendingClientPropertyQueries,  "containsObject:",  v4);

  return (char)pendingClientPropertyQueries;
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global_2);
  }
  return (id)logger_myLog;
}

void __23__UARPAccessory_logger__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.accessoryupdater.uarp", "uarpAccessory");
  v1 = (void *)logger_myLog;
  logger_myLog = (uint64_t)v0;
}

- (id)bsdNotifications
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UARPSupportedAccessory findByAppleModelNumber:](&OBJC_CLASS___UARPSupportedAccessory, "findByAppleModelNumber:", v2);
  [v3 bsdNotifications];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceBsdNotifications
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UARPSupportedAccessory findByAppleModelNumber:](&OBJC_CLASS___UARPSupportedAccessory, "findByAppleModelNumber:", v2);
  [v3 serviceBsdNotifications];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPartnerSerialNumbers:(id)a3
{
  id v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  partnerSerialNumbers = obj->_partnerSerialNumbers;
  obj->_partnerSerialNumbers = v4;

  objc_sync_exit(obj);
}

- (id)partnerSerialNumbers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_partnerSerialNumbers;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)availableFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAvailableFirmwareVersion:(id)a3
{
}

- (BOOL)userInitiatedFirmwareStaging
{
  return self->_userInitiatedFirmwareStaging;
}

- (void)setUserInitiatedFirmwareStaging:(BOOL)a3
{
  self->_userInitiatedFirmwareStaging = a3;
}

- (BOOL)userInitiatedFirmwareApply
{
  return self->_userInitiatedFirmwareApply;
}

- (void)setUserInitiatedFirmwareApply:(BOOL)a3
{
  self->_userInitiatedFirmwareApply = a3;
}

- (unsigned)firmwareUpdateBytesTransferred
{
  return self->_firmwareUpdateBytesTransferred;
}

- (void)setFirmwareUpdateBytesTransferred:(unsigned int)a3
{
  self->_firmwareUpdateBytesTransferred = a3;
}

- (unsigned)firmwareUpdateBytesTotal
{
  return self->_firmwareUpdateBytesTotal;
}

- (void)setFirmwareUpdateBytesTotal:(unsigned int)a3
{
  self->_firmwareUpdateBytesTotal = a3;
}

- (NSString)filepathCurrentAsset
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setFilepathCurrentAsset:(id)a3
{
}

- (BOOL)enableFirmwareDownloadOnDemand
{
  return self->_enableFirmwareDownloadOnDemand;
}

- (void)setEnableFirmwareDownloadOnDemand:(BOOL)a3
{
  self->_enableFirmwareDownloadOnDemand = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithHardwareID:(uint64_t)a3 uuid:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithHardwareID:(uint64_t)a3 uuid:(uint64_t)a4 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end