@interface MADActivityCommandRequest
- (BOOL)cleanupInFlightDownloads;
- (BOOL)doNotBlockBeforeFirstUnlock;
- (BOOL)doNotBlockOnNetworkStatus;
- (BOOL)pallasEnabled;
- (MAAbsoluteAssetId)absoluteId;
- (MAAssetDiff)allowDifferences;
- (MADownloadConfig)downloadConfig;
- (MADownloadOptions)downloadOptions;
- (NSArray)assetTypesList;
- (NSData)clientExtractorData;
- (NSDictionary)assetIdsToPreserve;
- (NSDictionary)queryParams;
- (NSString)action;
- (NSString)assetId;
- (NSString)assetType;
- (NSString)baseUrl;
- (NSString)clientName;
- (NSString)connectionIdentifier;
- (NSString)pallasAudience;
- (NSString)pallasUrl;
- (NSString)purpose;
- (NSString)relativeUrl;
- (NSString)serverUrl;
- (id)initForClient:(id)a3 requestingAction:(id)a4;
- (int64_t)assetState;
- (int64_t)returnTypes;
- (int64_t)unarchiveSize;
- (unint64_t)clientExtractorLen;
- (unint64_t)downloadSize;
- (unint64_t)gcOverrideDays;
- (unint64_t)notificationInterval;
- (void)associateAbsoluteId:(id)a3;
- (void)associateAllowDifferences:(id)a3;
- (void)associateAssetId:(id)a3;
- (void)associateAssetIdsToPreserve:(id)a3;
- (void)associateAssetState:(int64_t)a3;
- (void)associateAssetType:(id)a3;
- (void)associateAssetTypesList:(id)a3;
- (void)associateBaseUrl:(id)a3;
- (void)associateCleanupInFlightDownloads:(BOOL)a3;
- (void)associateClientExtractorData:(id)a3 ofLength:(unint64_t)a4;
- (void)associateConnectionIdentifier:(id)a3;
- (void)associateDoNotBlockBeforeFirstUnlock:(BOOL)a3;
- (void)associateDoNotBlockOnNetworkStatus:(BOOL)a3;
- (void)associateDownloadConfig:(id)a3;
- (void)associateDownloadOptions:(id)a3;
- (void)associateDownloadSize:(unint64_t)a3;
- (void)associateGCOverrideDays:(unint64_t)a3;
- (void)associateNotificationInterval:(unint64_t)a3;
- (void)associatePallasAudience:(id)a3;
- (void)associatePallasEnabled:(BOOL)a3;
- (void)associatePallasUrl:(id)a3;
- (void)associatePurpose:(id)a3;
- (void)associateQueryParams:(id)a3;
- (void)associateRelativeUrl:(id)a3;
- (void)associateServerUrl:(id)a3;
- (void)associateUnarchiveSize:(int64_t)a3;
- (void)setAbsoluteId:(id)a3;
- (void)setAllowDifferences:(id)a3;
- (void)setAssetId:(id)a3;
- (void)setAssetIdsToPreserve:(id)a3;
- (void)setAssetState:(int64_t)a3;
- (void)setAssetType:(id)a3;
- (void)setAssetTypesList:(id)a3;
- (void)setBaseUrl:(id)a3;
- (void)setCleanupInFlightDownloads:(BOOL)a3;
- (void)setClientExtractorData:(id)a3;
- (void)setClientExtractorLen:(unint64_t)a3;
- (void)setConnectionIdentifier:(id)a3;
- (void)setDoNotBlockBeforeFirstUnlock:(BOOL)a3;
- (void)setDoNotBlockOnNetworkStatus:(BOOL)a3;
- (void)setDownloadConfig:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setGcOverrideDays:(unint64_t)a3;
- (void)setNotificationInterval:(unint64_t)a3;
- (void)setPallasAudience:(id)a3;
- (void)setPallasEnabled:(BOOL)a3;
- (void)setPallasUrl:(id)a3;
- (void)setPurpose:(id)a3;
- (void)setQueryParams:(id)a3;
- (void)setRelativeUrl:(id)a3;
- (void)setReturnTypes:(int64_t)a3;
- (void)setServerUrl:(id)a3;
- (void)setUnarchiveSize:(int64_t)a3;
@end

@implementation MADActivityCommandRequest

- (id)initForClient:(id)a3 requestingAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MADActivityCommandRequest;
  v9 = -[MADActivityCommandRequest init](&v28, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientName, a3);
    objc_storeStrong((id *)&v10->_action, a4);
    assetType = v10->_assetType;
    v10->_assetType = 0LL;

    assetId = v10->_assetId;
    v10->_assetId = 0LL;

    v10->_returnTypes = 0LL;
    *(_WORD *)&v10->_doNotBlockBeforeFirstUnlock = 0;
    relativeUrl = v10->_relativeUrl;
    v10->_relativeUrl = 0LL;

    downloadOptions = v10->_downloadOptions;
    v10->_downloadOptions = 0LL;

    v10->_downloadSize = 0LL;
    v10->_notificationInterval = 0LL;
    downloadConfig = v10->_downloadConfig;
    v10->_downloadConfig = 0LL;

    assetTypesList = v10->_assetTypesList;
    v10->_assetTypesList = 0LL;

    assetIdsToPreserve = v10->_assetIdsToPreserve;
    v10->_assetState = 0LL;
    v10->_assetIdsToPreserve = 0LL;

    v10->_pallasEnabled = 0;
    serverUrl = v10->_serverUrl;
    v10->_serverUrl = 0LL;

    pallasUrl = v10->_pallasUrl;
    v10->_pallasUrl = 0LL;

    pallasAudience = v10->_pallasAudience;
    v10->_pallasAudience = 0LL;

    absoluteId = v10->_absoluteId;
    v10->_absoluteId = 0LL;

    v10->_cleanupInFlightDownloads = 0;
    v10->_unarchiveSize = 0LL;
    v10->_gcOverrideDays = 0LL;
    connectionIdentifier = v10->_connectionIdentifier;
    v10->_connectionIdentifier = 0LL;

    purpose = v10->_purpose;
    v10->_purpose = 0LL;

    baseUrl = v10->_baseUrl;
    v10->_baseUrl = 0LL;

    clientExtractorData = v10->_clientExtractorData;
    v10->_clientExtractorData = 0LL;

    allowDifferences = v10->_allowDifferences;
    v10->_clientExtractorLen = 0LL;
    v10->_allowDifferences = 0LL;
  }

  return v10;
}

- (void)associateAssetType:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest assetType](self, "assetType"));

  if (!v4) {
    -[MADActivityCommandRequest setAssetType:](self, "setAssetType:", v5);
  }
}

- (void)associateAssetId:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest assetId](self, "assetId"));

  if (!v4) {
    -[MADActivityCommandRequest setAssetId:](self, "setAssetId:", v5);
  }
}

- (void)associateDoNotBlockBeforeFirstUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MADActivityCommandRequest doNotBlockBeforeFirstUnlock](self, "doNotBlockBeforeFirstUnlock")) {
    -[MADActivityCommandRequest setDoNotBlockBeforeFirstUnlock:](self, "setDoNotBlockBeforeFirstUnlock:", v3);
  }
}

- (void)associateDoNotBlockOnNetworkStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MADActivityCommandRequest doNotBlockOnNetworkStatus](self, "doNotBlockOnNetworkStatus")) {
    -[MADActivityCommandRequest setDoNotBlockOnNetworkStatus:](self, "setDoNotBlockOnNetworkStatus:", v3);
  }
}

- (void)associateQueryParams:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest queryParams](self, "queryParams"));

  if (!v4) {
    -[MADActivityCommandRequest setQueryParams:](self, "setQueryParams:", v5);
  }
}

- (void)associateRelativeUrl:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest relativeUrl](self, "relativeUrl"));

  if (!v4) {
    -[MADActivityCommandRequest setRelativeUrl:](self, "setRelativeUrl:", v5);
  }
}

- (void)associateDownloadOptions:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest downloadOptions](self, "downloadOptions"));

  if (!v4) {
    -[MADActivityCommandRequest setDownloadOptions:](self, "setDownloadOptions:", v5);
  }
}

- (void)associateDownloadSize:(unint64_t)a3
{
  if (!-[MADActivityCommandRequest downloadSize](self, "downloadSize")) {
    -[MADActivityCommandRequest setDownloadSize:](self, "setDownloadSize:", a3);
  }
}

- (void)associateNotificationInterval:(unint64_t)a3
{
  if (!-[MADActivityCommandRequest notificationInterval](self, "notificationInterval")) {
    -[MADActivityCommandRequest setNotificationInterval:](self, "setNotificationInterval:", a3);
  }
}

- (void)associateDownloadConfig:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest downloadConfig](self, "downloadConfig"));

  if (!v4) {
    -[MADActivityCommandRequest setDownloadConfig:](self, "setDownloadConfig:", v5);
  }
}

- (void)associateAssetTypesList:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest assetTypesList](self, "assetTypesList"));

  if (!v4) {
    -[MADActivityCommandRequest setAssetTypesList:](self, "setAssetTypesList:", v5);
  }
}

- (void)associateAssetState:(int64_t)a3
{
  if (!-[MADActivityCommandRequest assetState](self, "assetState")) {
    -[MADActivityCommandRequest setAssetState:](self, "setAssetState:", a3);
  }
}

- (void)associateAssetIdsToPreserve:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest assetIdsToPreserve](self, "assetIdsToPreserve"));

  if (!v4) {
    -[MADActivityCommandRequest setAssetIdsToPreserve:](self, "setAssetIdsToPreserve:", v5);
  }
}

- (void)associatePallasEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MADActivityCommandRequest pallasEnabled](self, "pallasEnabled")) {
    -[MADActivityCommandRequest setPallasEnabled:](self, "setPallasEnabled:", v3);
  }
}

- (void)associateServerUrl:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest serverUrl](self, "serverUrl"));

  if (!v4) {
    -[MADActivityCommandRequest setServerUrl:](self, "setServerUrl:", v5);
  }
}

- (void)associatePallasUrl:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest pallasUrl](self, "pallasUrl"));

  if (!v4) {
    -[MADActivityCommandRequest setPallasUrl:](self, "setPallasUrl:", v5);
  }
}

- (void)associatePallasAudience:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest pallasAudience](self, "pallasAudience"));

  if (!v4) {
    -[MADActivityCommandRequest setPallasAudience:](self, "setPallasAudience:", v5);
  }
}

- (void)associateUnarchiveSize:(int64_t)a3
{
  if (!-[MADActivityCommandRequest unarchiveSize](self, "unarchiveSize")) {
    -[MADActivityCommandRequest setUnarchiveSize:](self, "setUnarchiveSize:", a3);
  }
}

- (void)associateGCOverrideDays:(unint64_t)a3
{
  if (!-[MADActivityCommandRequest gcOverrideDays](self, "gcOverrideDays")) {
    -[MADActivityCommandRequest setGcOverrideDays:](self, "setGcOverrideDays:", a3);
  }
}

- (void)associateCleanupInFlightDownloads:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MADActivityCommandRequest cleanupInFlightDownloads](self, "cleanupInFlightDownloads")) {
    -[MADActivityCommandRequest setCleanupInFlightDownloads:](self, "setCleanupInFlightDownloads:", v3);
  }
}

- (void)associateConnectionIdentifier:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest connectionIdentifier](self, "connectionIdentifier"));

  if (!v4) {
    -[MADActivityCommandRequest setConnectionIdentifier:](self, "setConnectionIdentifier:", v5);
  }
}

- (void)associatePurpose:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest purpose](self, "purpose"));

  if (!v4) {
    -[MADActivityCommandRequest setPurpose:](self, "setPurpose:", v5);
  }
}

- (void)associateBaseUrl:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest baseUrl](self, "baseUrl"));

  if (!v4) {
    -[MADActivityCommandRequest setBaseUrl:](self, "setBaseUrl:", v5);
  }
}

- (void)associateClientExtractorData:(id)a3 ofLength:(unint64_t)a4
{
  id v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest clientExtractorData](self, "clientExtractorData"));

  if (!v6)
  {
    -[MADActivityCommandRequest setClientExtractorData:](self, "setClientExtractorData:", v7);
    -[MADActivityCommandRequest setClientExtractorLen:](self, "setClientExtractorLen:", a4);
  }
}

- (void)associateAbsoluteId:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest absoluteId](self, "absoluteId"));

  if (!v4) {
    -[MADActivityCommandRequest setAbsoluteId:](self, "setAbsoluteId:", v5);
  }
}

- (void)associateAllowDifferences:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADActivityCommandRequest allowDifferences](self, "allowDifferences"));

  if (!v4) {
    -[MADActivityCommandRequest setAllowDifferences:](self, "setAllowDifferences:", v5);
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
}

- (int64_t)returnTypes
{
  return self->_returnTypes;
}

- (void)setReturnTypes:(int64_t)a3
{
  self->_returnTypes = a3;
}

- (BOOL)doNotBlockBeforeFirstUnlock
{
  return self->_doNotBlockBeforeFirstUnlock;
}

- (void)setDoNotBlockBeforeFirstUnlock:(BOOL)a3
{
  self->_doNotBlockBeforeFirstUnlock = a3;
}

- (BOOL)doNotBlockOnNetworkStatus
{
  return self->_doNotBlockOnNetworkStatus;
}

- (void)setDoNotBlockOnNetworkStatus:(BOOL)a3
{
  self->_doNotBlockOnNetworkStatus = a3;
}

- (NSDictionary)queryParams
{
  return self->_queryParams;
}

- (void)setQueryParams:(id)a3
{
}

- (NSString)relativeUrl
{
  return self->_relativeUrl;
}

- (void)setRelativeUrl:(id)a3
{
}

- (MADownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (unint64_t)notificationInterval
{
  return self->_notificationInterval;
}

- (void)setNotificationInterval:(unint64_t)a3
{
  self->_notificationInterval = a3;
}

- (MADownloadConfig)downloadConfig
{
  return self->_downloadConfig;
}

- (void)setDownloadConfig:(id)a3
{
}

- (NSArray)assetTypesList
{
  return self->_assetTypesList;
}

- (void)setAssetTypesList:(id)a3
{
}

- (int64_t)assetState
{
  return self->_assetState;
}

- (void)setAssetState:(int64_t)a3
{
  self->_assetState = a3;
}

- (NSDictionary)assetIdsToPreserve
{
  return self->_assetIdsToPreserve;
}

- (void)setAssetIdsToPreserve:(id)a3
{
}

- (BOOL)pallasEnabled
{
  return self->_pallasEnabled;
}

- (void)setPallasEnabled:(BOOL)a3
{
  self->_pallasEnabled = a3;
}

- (NSString)serverUrl
{
  return self->_serverUrl;
}

- (void)setServerUrl:(id)a3
{
}

- (NSString)pallasUrl
{
  return self->_pallasUrl;
}

- (void)setPallasUrl:(id)a3
{
}

- (NSString)pallasAudience
{
  return self->_pallasAudience;
}

- (void)setPallasAudience:(id)a3
{
}

- (MAAbsoluteAssetId)absoluteId
{
  return self->_absoluteId;
}

- (void)setAbsoluteId:(id)a3
{
}

- (int64_t)unarchiveSize
{
  return self->_unarchiveSize;
}

- (void)setUnarchiveSize:(int64_t)a3
{
  self->_unarchiveSize = a3;
}

- (unint64_t)gcOverrideDays
{
  return self->_gcOverrideDays;
}

- (void)setGcOverrideDays:(unint64_t)a3
{
  self->_gcOverrideDays = a3;
}

- (BOOL)cleanupInFlightDownloads
{
  return self->_cleanupInFlightDownloads;
}

- (void)setCleanupInFlightDownloads:(BOOL)a3
{
  self->_cleanupInFlightDownloads = a3;
}

- (NSString)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void)setConnectionIdentifier:(id)a3
{
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (NSString)baseUrl
{
  return self->_baseUrl;
}

- (void)setBaseUrl:(id)a3
{
}

- (NSData)clientExtractorData
{
  return self->_clientExtractorData;
}

- (void)setClientExtractorData:(id)a3
{
}

- (unint64_t)clientExtractorLen
{
  return self->_clientExtractorLen;
}

- (void)setClientExtractorLen:(unint64_t)a3
{
  self->_clientExtractorLen = a3;
}

- (MAAssetDiff)allowDifferences
{
  return self->_allowDifferences;
}

- (void)setAllowDifferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end