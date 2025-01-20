@interface PurchaseInfo
- (ACAccount)account;
- (AMSBuyParams)buyParams;
- (AMSProcessInfo)clientInfo;
- (ASDPurchase)purchase;
- (BOOL)didShowPaymentSheet;
- (BOOL)disableBoosting;
- (BOOL)discoveredUpdate;
- (BOOL)generatedVendorID;
- (BOOL)ignoreRequirePasswordRestriction;
- (BOOL)isArcade;
- (BOOL)isDiscretionary;
- (BOOL)isMachineBased;
- (BOOL)isRemoteInstall;
- (BOOL)isUserInitiated;
- (BOOL)purchaseOnly;
- (BOOL)requireUniversal;
- (BOOL)requireVendorID;
- (BOOL)shouldCollectMetrics;
- (BOOL)suppressDialogs;
- (BOOL)suppressEvaluatorDialogs;
- (BOOL)useJSONContentType;
- (BOOL)useLocalAuthAndInteractiveDialogs;
- (BOOL)useLocalAuthAndSystemDialogs;
- (IXAppInstallCoordinator)coordinator;
- (NSArray)appCapabilities;
- (NSDictionary)additionalHeaders;
- (NSDictionary)metricsOverlay;
- (NSDictionary)qosMetricsFields;
- (NSNumber)holePunchSize;
- (NSNumber)installedAppSize;
- (NSNumber)installedExternalVersionID;
- (NSNumber)itemID;
- (NSNumber)metricsType;
- (NSNumber)originalPurchaserDSID;
- (NSNumber)purchaseID;
- (NSNumber)recoveryCount;
- (NSNumber)refreshInstallID;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)companionBundleID;
- (NSString)installedVariantID;
- (NSString)itemName;
- (NSString)logCode;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)referrerName;
- (NSString)referrerURL;
- (NSString)temporaryBundleID;
- (NSString)vendorName;
- (NSURL)bundleURL;
- (NSURL)preflightURL;
- (NSUUID)externalID;
- (PurchaseInfo)init;
- (RequestPresenter)requestPresenter;
- (StoreItemResponse)itemResponse;
- (XDCDevice)device;
- (XPCRequestToken)requestToken;
- (_TtC9appstored6LogKey)batchLogKey;
- (_TtC9appstored6LogKey)logKey;
- (int64_t)clientType;
- (int64_t)expectedSoftwarePlatform;
- (int64_t)priority;
- (int64_t)purchaseState;
- (int64_t)purchaseType;
- (int64_t)updateType;
- (unint64_t)autoInstallOverride;
- (unint64_t)coordinatorImportance;
- (unint64_t)coordinatorIntent;
- (unint64_t)signpostID;
- (void)setAccount:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAppCapabilities:(id)a3;
- (void)setAppName:(id)a3;
- (void)setArcade:(BOOL)a3;
- (void)setAutoInstallOverride:(unint64_t)a3;
- (void)setBatchLogKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setCompanionBundleID:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setCoordinatorImportance:(unint64_t)a3;
- (void)setCoordinatorIntent:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDidShowPaymentSheet:(BOOL)a3;
- (void)setDisableBoosting:(BOOL)a3;
- (void)setDiscoveredUpdate:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setExpectedSoftwarePlatform:(int64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setGeneratedVendorID:(BOOL)a3;
- (void)setHolePunchSize:(id)a3;
- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3;
- (void)setInstalledAppSize:(id)a3;
- (void)setInstalledExternalVersionID:(id)a3;
- (void)setInstalledVariantID:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setItemResponse:(id)a3;
- (void)setLogCode:(id)a3;
- (void)setMachineBased:(BOOL)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setMetricsType:(id)a3;
- (void)setOriginalPurchaserDSID:(id)a3;
- (void)setPreflightURL:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setPurchase:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setPurchaseOnly:(BOOL)a3;
- (void)setPurchaseState:(int64_t)a3;
- (void)setPurchaseType:(int64_t)a3;
- (void)setQosMetricsFields:(id)a3;
- (void)setRecoveryCount:(id)a3;
- (void)setReferrerName:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setRefreshInstallID:(id)a3;
- (void)setRemoteInstall:(BOOL)a3;
- (void)setRequestToken:(id)a3;
- (void)setRequireUniversal:(BOOL)a3;
- (void)setRequireVendorID:(BOOL)a3;
- (void)setShouldCollectMetrics:(BOOL)a3;
- (void)setSuppressDialogs:(BOOL)a3;
- (void)setSuppressEvaluatorDialogs:(BOOL)a3;
- (void)setTemporaryBundleID:(id)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)setUseJSONContentType:(BOOL)a3;
- (void)setUseLocalAuthAndInteractiveDialogs:(BOOL)a3;
- (void)setUseLocalAuthAndSystemDialogs:(BOOL)a3;
- (void)setVendorName:(id)a3;
- (void)updateGeneratedProperties;
- (void)updateLogKey;
@end

@implementation PurchaseInfo

- (ACAccount)account
{
  return (ACAccount *)sub_1002269B4((os_unfair_lock_s *)self, @"account");
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return (NSDictionary *)sub_1002269B4((os_unfair_lock_s *)self, @"additionalHeaders");
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (NSArray)appCapabilities
{
  return (NSArray *)sub_1002269B4((os_unfair_lock_s *)self, @"appCapabilities");
}

- (void)setAppCapabilities:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"appName");
}

- (void)setAppName:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"bundleID");
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)bundleURL
{
  return (NSURL *)sub_1002269B4((os_unfair_lock_s *)self, @"bundleURL");
}

- (void)setBundleURL:(id)a3
{
}

- (AMSBuyParams)buyParams
{
  return (AMSBuyParams *)sub_1002269B4((os_unfair_lock_s *)self, @"buyParams");
}

- (void)setBuyParams:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return (AMSProcessInfo *)sub_1002269B4((os_unfair_lock_s *)self, @"clientInfo");
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)companionBundleID
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"companionBundleID");
}

- (void)setCompanionBundleID:(id)a3
{
}

- (XDCDevice)device
{
  return (XDCDevice *)sub_1002269B4((os_unfair_lock_s *)self, @"device");
}

- (void)setDevice:(id)a3
{
}

- (NSUUID)externalID
{
  return (NSUUID *)sub_1002269B4((os_unfair_lock_s *)self, @"externalID");
}

- (void)setExternalID:(id)a3
{
}

- (NSNumber)holePunchSize
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"holePunchSize");
}

- (void)setHolePunchSize:(id)a3
{
}

- (NSString)itemName
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"itemName");
}

- (void)setItemName:(id)a3
{
}

- (StoreItemResponse)itemResponse
{
  return (StoreItemResponse *)sub_1002269B4((os_unfair_lock_s *)self, @"itemResponse");
}

- (void)setItemResponse:(id)a3
{
}

- (NSNumber)installedAppSize
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"installedAppSize");
}

- (void)setInstalledAppSize:(id)a3
{
}

- (NSNumber)installedExternalVersionID
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"installedExternalVersionID");
}

- (void)setInstalledExternalVersionID:(id)a3
{
}

- (NSString)installedVariantID
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"installedVariantID");
}

- (void)setInstalledVariantID:(id)a3
{
}

- (NSNumber)itemID
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"itemID");
}

- (void)setItemID:(id)a3
{
}

- (NSString)logCode
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"logCode");
}

- (void)setLogCode:(id)a3
{
}

- (_TtC9appstored6LogKey)logKey
{
  return (_TtC9appstored6LogKey *)sub_1002269B4((os_unfair_lock_s *)self, @"logKey");
}

- (NSNumber)metricsType
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"metricsType");
}

- (void)setMetricsType:(id)a3
{
}

- (NSDictionary)qosMetricsFields
{
  return (NSDictionary *)sub_1002269B4((os_unfair_lock_s *)self, @"qosMetricsFields");
}

- (void)setQosMetricsFields:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return (NSDictionary *)sub_1002269B4((os_unfair_lock_s *)self, @"metricsOverlay");
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSNumber)originalPurchaserDSID
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"originalPurchaserDSID");
}

- (void)setOriginalPurchaserDSID:(id)a3
{
}

- (NSURL)preflightURL
{
  return (NSURL *)sub_1002269B4((os_unfair_lock_s *)self, @"preflightURL");
}

- (void)setPreflightURL:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"presentingSceneBundleIdentifier");
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"presentingSceneIdentifier");
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (ASDPurchase)purchase
{
  return (ASDPurchase *)sub_1002269B4((os_unfair_lock_s *)self, @"purchase");
}

- (void)setPurchase:(id)a3
{
}

- (NSNumber)purchaseID
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"purchaseID");
}

- (void)setPurchaseID:(id)a3
{
}

- (NSNumber)recoveryCount
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"recoveryCount");
}

- (void)setRecoveryCount:(id)a3
{
}

- (NSString)referrerName
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"referrerName");
}

- (void)setReferrerName:(id)a3
{
}

- (NSString)referrerURL
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"referrerURL");
}

- (void)setReferrerURL:(id)a3
{
}

- (NSNumber)refreshInstallID
{
  return (NSNumber *)sub_1002269B4((os_unfair_lock_s *)self, @"refreshInstallID");
}

- (void)setRefreshInstallID:(id)a3
{
}

- (XPCRequestToken)requestToken
{
  return (XPCRequestToken *)sub_1002269B4((os_unfair_lock_s *)self, @"requestToken");
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)temporaryBundleID
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"temporaryBundleID");
}

- (void)setTemporaryBundleID:(id)a3
{
}

- (NSString)vendorName
{
  return (NSString *)sub_1002269B4((os_unfair_lock_s *)self, @"vendorName");
}

- (void)setVendorName:(id)a3
{
}

- (int64_t)clientType
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"clientType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setClientType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"clientType");
}

- (BOOL)didShowPaymentSheet
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"didShowPaymentSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDidShowPaymentSheet:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"didShowPaymentSheet");
}

- (BOOL)disableBoosting
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"disableBoosting");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDisableBoosting:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"disableBoosting");
}

- (BOOL)discoveredUpdate
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"discoveredUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDiscoveredUpdate:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"discoveredUpdate");
}

- (BOOL)isDiscretionary
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"isDiscretionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDiscretionary:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"isDiscretionary");
}

- (int64_t)expectedSoftwarePlatform
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"expectedSoftwarePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setExpectedSoftwarePlatform:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"expectedSoftwarePlatform");
}

- (BOOL)generatedVendorID
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"generatedVendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setGeneratedVendorID:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"generatedVendorID");
}

- (BOOL)ignoreRequirePasswordRestriction
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"ignoreRequirePasswordRestriction");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setIgnoreRequirePasswordRestriction:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"ignoreRequirePasswordRestriction");
}

- (BOOL)isMachineBased
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"isMachineBased");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setMachineBased:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"isMachineBased");
}

- (int64_t)priority
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"priority");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setPriority:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"priority");
}

- (BOOL)purchaseOnly
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"purchaseOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setPurchaseOnly:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"purchaseOnly");
}

- (int64_t)purchaseState
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"purchaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setPurchaseState:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"purchaseState");
}

- (int64_t)purchaseType
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"purchaseType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setPurchaseType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"purchaseType");
}

- (BOOL)isRemoteInstall
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"isRemoteInstall");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setRemoteInstall:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"isRemoteInstall");
}

- (BOOL)requireUniversal
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"requireUniversal");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setRequireUniversal:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"requireUniversal");
}

- (BOOL)shouldCollectMetrics
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"shouldCollectMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setShouldCollectMetrics:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"shouldCollectMetrics");
}

- (BOOL)suppressDialogs
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"suppressDialogs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSuppressDialogs:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"suppressDialogs");
}

- (BOOL)suppressEvaluatorDialogs
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"suppressEvaluatorDialogs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSuppressEvaluatorDialogs:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"suppressEvaluatorDialogs");
}

- (int64_t)updateType
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"updateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setUpdateType:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"updateType");
}

- (BOOL)useJSONContentType
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"useJSONContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setUseJSONContentType:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"useJSONContentType");
}

- (BOOL)useLocalAuthAndSystemDialogs
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"useLocalAuthAndSystemDialogs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setUseLocalAuthAndSystemDialogs:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  sub_100226A14((uint64_t)self, v4, @"useLocalAuthAndSystemDialogs");
}

- (IXAppInstallCoordinator)coordinator
{
  return (IXAppInstallCoordinator *)sub_1002269B4((os_unfair_lock_s *)self, @"coordinator");
}

- (void)setCoordinator:(id)a3
{
}

- (unint64_t)autoInstallOverride
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"autoInstallOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"autoInstallOverride");
}

- (unint64_t)coordinatorImportance
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"coordinatorImportance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (void)setCoordinatorImportance:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"coordinatorImportance");
}

- (unint64_t)coordinatorIntent
{
  id v2 = sub_1002269B4((os_unfair_lock_s *)self, @"coordinatorIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (void)setCoordinatorIntent:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100226A14((uint64_t)self, v4, @"coordinatorIntent");
}

- (PurchaseInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PurchaseInfo;
  id v2 = -[ContextObject init](&v4, "init");
  if (v2) {
    -[PurchaseInfo setShouldCollectMetrics:]( v2,  "setShouldCollectMetrics:",  +[QOSMetrics shouldCollectMetrics](&OBJC_CLASS____TtC9appstored10QOSMetrics, "shouldCollectMetrics"));
  }
  return v2;
}

- (RequestPresenter)requestPresenter
{
  if (-[PurchaseInfo suppressDialogs](self, "suppressDialogs"))
  {
    v3 = objc_opt_new(&OBJC_CLASS___SilentRequestPresenter);
  }

  else
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo requestToken](self, "requestToken"));
    v5 = v4;
    if (v4 && ![v4 isInternal])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationClient]);
      v7 = sub_100277570((uint64_t)&OBJC_CLASS___CallerRequestPresenter, v6);
      v3 = (SilentRequestPresenter *)objc_claimAutoreleasedReturnValue(v7);
    }

    else
    {
      v3 = objc_opt_new(&OBJC_CLASS___InteractiveRequestPresenter);
    }
  }

  return (RequestPresenter *)v3;
}

- (void)updateGeneratedProperties
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo additionalHeaders](self, "additionalHeaders"));
  objc_super v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4) {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v5 = AMSHTTPHeaderUserAgent;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", AMSHTTPHeaderUserAgent));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo clientInfo](self, "clientInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserAgent userAgentForProcessInfo:](&OBJC_CLASS___AMSUserAgent, "userAgentForProcessInfo:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, v5);
  }

  id v9 = -[NSMutableDictionary copy](v4, "copy");
  -[PurchaseInfo setAdditionalHeaders:](self, "setAdditionalHeaders:", v9);

  -[PurchaseInfo updateLogKey](self, "updateLogKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo buyParams](self, "buyParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 parameterForKey:@"ForceAppDRMMode"]);

  if (!v11)
  {
    CFPropertyListRef v12 = sub_1002FA4B4((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v13
      && (([v13 isEqualToNumber:&off_10040CE80] & 1) != 0
       || [v14 isEqualToNumber:&off_10040CE98]))
    {
      uint64_t v15 = ASDLogHandleForCategory(25LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo logKey](self, "logKey"));
        *(_DWORD *)v21 = 138412546;
        *(void *)&v21[4] = v17;
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = [v14 intValue];
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] Setting ForceAppDRMMode: %d",  v21,  0x12u);
      }

      [v10 setParameter:v14 forKey:@"ForceAppDRMMode"];
    }
  }

  -[PurchaseInfo setBuyParams:](self, "setBuyParams:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo externalID](self, "externalID"));
  v19 = v18;
  if (v18)
  {
    *(void *)v21 = 0LL;
    *(void *)&v21[8] = 0LL;
    [v18 getUUIDBytes:v21];
    v20 = *(_TtC9appstored6LogKey **)v21;
  }

  else
  {
    v20 = 0LL;
  }

  *(_TtC9appstored6LogKey **)((char *)&self->_batchLogKey + 4) = v20;
}

- (BOOL)isUserInitiated
{
  BOOL result = (!os_variant_has_internal_content("com.apple.appstored")
         || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo clientInfo](self, "clientInfo")),
             objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]),
             unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.asclient"],
             v4,
             v3,
             (v5 & 1) == 0))
        && !-[PurchaseInfo isDiscretionary](self, "isDiscretionary")
        && !-[PurchaseInfo suppressDialogs](self, "suppressDialogs");
  return result;
}

- (void)updateLogKey
{
  v3 = objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[PurchaseInfo batchLogKey](self, "batchLogKey"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo logCode](self, "logCode"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo externalID](self, "externalID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo bundleID](self, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo itemID](self, "itemID"));
  v8 = -[LogKey initWithBatchLogKey:logCode:externalID:bundleID:itemID:]( v3,  "initWithBatchLogKey:logCode:externalID:bundleID:itemID:",  v9,  v4,  v5,  v6,  v7);
  if (self) {
    sub_100226A14((uint64_t)self, v8, @"logKey");
  }
}

- (BOOL)isArcade
{
  return *(_BYTE *)(&self->super._lock + 1) & 1;
}

- (void)setArcade:(BOOL)a3
{
  *((_BYTE *)&self->super._lock + 4) = a3;
}

- (_TtC9appstored6LogKey)batchLogKey
{
  return (_TtC9appstored6LogKey *)objc_getProperty(self, a2, 28LL, 1);
}

- (void)setBatchLogKey:(id)a3
{
}

- (BOOL)requireVendorID
{
  return *((_BYTE *)&self->super._lock + 5) & 1;
}

- (void)setRequireVendorID:(BOOL)a3
{
  *((_BYTE *)&self->super._lock + 5) = a3;
}

- (unint64_t)signpostID
{
  return *(unint64_t *)((char *)&self->_batchLogKey + 4);
}

- (BOOL)useLocalAuthAndInteractiveDialogs
{
  return *((_BYTE *)&self->super._lock + 6) & 1;
}

- (void)setUseLocalAuthAndInteractiveDialogs:(BOOL)a3
{
  *((_BYTE *)&self->super._lock + 6) = a3;
}

- (void).cxx_destruct
{
}

@end