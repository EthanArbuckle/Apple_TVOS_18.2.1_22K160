@interface AssetRequestProperties
- (AssetRequestProperties)init;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation AssetRequestProperties

- (AssetRequestProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AssetRequestProperties;
  v2 = -[AssetRequestProperties init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v4 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v3;

    *(_DWORD *)(v2 + 9) = 16843009;
  }

  return (AssetRequestProperties *)v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = -[AssetRequestProperties init]( +[AssetRequestProperties allocWithZone:](&OBJC_CLASS___AssetRequestProperties, "allocWithZone:"),  "init");
  v5->_allowsAuthentication = self->_allowsAuthentication;
  v5->_allowsCellularAccess = self->_allowsCellularAccess;
  v5->_allowsConstrainedNetworkAccess = self->_allowsConstrainedNetworkAccess;
  v5->_allowsExpensiveNetworkAccess = self->_allowsExpensiveNetworkAccess;
  v5->_allowsWatchCellularAccess = self->_allowsWatchCellularAccess;
  v5->_assetSource = self->_assetSource;
  objc_super v6 = (NSString *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = v6;

  v8 = (NSNumber *)-[NSNumber copyWithZone:](self->_bytesPerSecondLimit, "copyWithZone:", a3);
  bytesPerSecondLimit = v5->_bytesPerSecondLimit;
  v5->_bytesPerSecondLimit = v8;

  objc_storeStrong((id *)&v5->_clientIdentifier, self->_clientIdentifier);
  v5->_connectionPool = self->_connectionPool;
  objc_storeStrong((id *)&v5->_dataConsumer, self->_dataConsumer);
  v5->_discretionaryType = self->_discretionaryType;
  v10 = (NSString *)-[NSString copyWithZone:](self->_duetBudgetingIdentifier, "copyWithZone:", a3);
  duetBudgetingIdentifier = v5->_duetBudgetingIdentifier;
  v5->_duetBudgetingIdentifier = v10;

  v5->_enforceATS = self->_enforceATS;
  objc_storeStrong((id *)&v5->_externalID, self->_externalID);
  v5->_expectedContentLength = self->_expectedContentLength;
  v5->_expectedDiskUsage = self->_expectedDiskUsage;
  v12 = (NSNumber *)-[NSNumber copyWithZone:](self->_loadingPriority, "copyWithZone:", a3);
  loadingPriority = v5->_loadingPriority;
  v5->_loadingPriority = v12;

  v14 = (NSDictionary *)-[NSDictionary copyWithZone:](self->_loadURLMetricsOverlay, "copyWithZone:", a3);
  loadURLMetricsOverlay = v5->_loadURLMetricsOverlay;
  v5->_loadURLMetricsOverlay = v14;

  v5->_locateAssetCache = self->_locateAssetCache;
  objc_storeStrong((id *)&v5->_logKey, self->_logKey);
  v16 = (NSNumber *)-[NSNumber copyWithZone:](self->_maximumWatchCellularTransferSize, "copyWithZone:", a3);
  maximumWatchCellularTransferSize = v5->_maximumWatchCellularTransferSize;
  v5->_maximumWatchCellularTransferSize = v16;

  v18 = (NSString *)-[NSString copyWithZone:](self->_networkBudgetingIdentifier, "copyWithZone:", a3);
  networkBudgetingIdentifier = v5->_networkBudgetingIdentifier;
  v5->_networkBudgetingIdentifier = v18;

  v20 = (NSArray *)-[NSArray copyWithZone:](self->_protocolClasses, "copyWithZone:", a3);
  protocolClasses = v5->_protocolClasses;
  v5->_protocolClasses = v20;

  v5->_qosClass = self->_qosClass;
  v5->_rangeOffset = self->_rangeOffset;
  v5->_requiresPowerPluggedIn = self->_requiresPowerPluggedIn;
  v5->_requestReason = self->_requestReason;
  objc_storeStrong((id *)&v5->_requestUUID, self->_requestUUID);
  v22 = (NSNumber *)-[NSNumber copyWithZone:](self->_taskPriority, "copyWithZone:", a3);
  taskPriority = v5->_taskPriority;
  v5->_taskPriority = v22;

  v24 = (NSString *)-[NSString copyWithZone:](self->_variantID, "copyWithZone:", a3);
  variantID = v5->_variantID;
  v5->_variantID = v24;

  return v5;
}

- (void).cxx_destruct
{
}

@end