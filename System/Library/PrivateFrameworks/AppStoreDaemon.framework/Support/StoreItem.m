@interface StoreItem
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation StoreItem

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[StoreItem init](+[StoreItem allocWithZone:](&OBJC_CLASS___StoreItem, "allocWithZone:"), "init");
  v6 = (NSData *)-[NSData copyWithZone:](self->_appReceiptData, "copyWithZone:", a3);
  appReceiptData = v5->_appReceiptData;
  v5->_appReceiptData = v6;

  v8 = (NSString *)-[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  artistName = v5->_artistName;
  v5->_artistName = v8;

  v10 = (NSString *)-[NSString copyWithZone:](self->_artworkURL, "copyWithZone:", a3);
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = v10;

  v12 = (NSArray *)-[NSArray copyWithZone:](self->_assetDeltaPackages, "copyWithZone:", a3);
  assetDeltaPackages = v5->_assetDeltaPackages;
  v5->_assetDeltaPackages = v12;

  objc_storeStrong((id *)&v5->_assetFullPackage, self->_assetFullPackage);
  v5->_automatic = self->_automatic;
  v14 = (NSNumber *)-[NSNumber copyWithZone:](self->_betaExternalVersionID, "copyWithZone:", a3);
  betaExternalVersionID = v5->_betaExternalVersionID;
  v5->_betaExternalVersionID = v14;

  v16 = (NSString *)-[NSString copyWithZone:](self->_bundleDisplayName, "copyWithZone:", a3);
  bundleDisplayName = v5->_bundleDisplayName;
  v5->_bundleDisplayName = v16;

  v18 = (NSString *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = v18;

  v20 = (NSString *)-[NSString copyWithZone:](self->_bundleShortVersion, "copyWithZone:", a3);
  bundleShortVersion = v5->_bundleShortVersion;
  v5->_bundleShortVersion = v20;

  v22 = (NSString *)-[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = v22;

  v24 = (NSString *)-[NSString copyWithZone:](self->_cancelDownloadURL, "copyWithZone:", a3);
  cancelDownloadURL = v5->_cancelDownloadURL;
  v5->_cancelDownloadURL = v24;

  v26 = (NSDictionary *)-[NSDictionary copyWithZone:](self->_capabilities, "copyWithZone:", a3);
  capabilities = v5->_capabilities;
  v5->_capabilities = v26;

  v28 = (NSDictionary *)-[NSDictionary copyWithZone:](self->_capabilityOptions, "copyWithZone:", a3);
  capabilityOptions = v5->_capabilityOptions;
  v5->_capabilityOptions = v28;

  v30 = (NSNumber *)-[NSNumber copyWithZone:](self->_evid, "copyWithZone:", a3);
  evid = v5->_evid;
  v5->_evid = v30;

  v5->_gameCenterEnabled = self->_gameCenterEnabled;
  v5->_gameCenterEverEnabled = self->_gameCenterEverEnabled;
  v32 = (NSString *)-[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  genre = v5->_genre;
  v5->_genre = v32;

  v34 = (NSNumber *)-[NSNumber copyWithZone:](self->_genreID, "copyWithZone:", a3);
  genreID = v5->_genreID;
  v5->_genreID = v34;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  objc_storeStrong((id *)&v5->_hasOrEverHasHadIAP, self->_hasOrEverHasHadIAP);
  v5->_hasWatchApp = self->_hasWatchApp;
  v5->_hasWatchIndependentApp = self->_hasWatchIndependentApp;
  v5->_hasWatchOnlyApp = self->_hasWatchOnlyApp;
  v36 = (NSNumber *)-[NSNumber copyWithZone:](self->_iAdAttribution, "copyWithZone:", a3);
  iAdAttribution = v5->_iAdAttribution;
  v5->_iAdAttribution = v36;

  v38 = (NSString *)-[NSString copyWithZone:](self->_iAdConversionString, "copyWithZone:", a3);
  iAdConversionString = v5->_iAdConversionString;
  v5->_iAdConversionString = v38;

  v40 = (NSString *)-[NSString copyWithZone:](self->_iAdImpressionString, "copyWithZone:", a3);
  iAdImpressionString = v5->_iAdImpressionString;
  v5->_iAdImpressionString = v40;

  v42 = (NSString *)-[NSString copyWithZone:](self->_installVerificationToken, "copyWithZone:", a3);
  installVerificationToken = v5->_installVerificationToken;
  v5->_installVerificationToken = v42;

  v5->_isRedownload = self->_isRedownload;
  v44 = (NSNumber *)-[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = v44;

  v46 = (NSString *)-[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v5->_itemName;
  v5->_itemName = v46;

  v48 = (NSString *)-[NSString copyWithZone:](self->_kind, "copyWithZone:", a3);
  kind = v5->_kind;
  v5->_kind = v48;

  v5->_launchProhibited = self->_launchProhibited;
  v50 = (NSString *)-[NSString copyWithZone:](self->_messagesArtworkURL, "copyWithZone:", a3);
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = v50;

  objc_storeStrong((id *)&v5->_nameTranscriptions, self->_nameTranscriptions);
  v52 = -[TimeWindow copyWithZone:](self->_optimalDownloadWindow, "copyWithZone:", a3);
  optimalDownloadWindow = v5->_optimalDownloadWindow;
  v5->_optimalDownloadWindow = v52;

  v54 = (NSURL *)-[NSURL copyWithZone:](self->_preflightPackageURL, "copyWithZone:", a3);
  preflightPackageURL = v5->_preflightPackageURL;
  v5->_preflightPackageURL = v54;

  v56 = (NSString *)-[NSString copyWithZone:](self->_purchaseDate, "copyWithZone:", a3);
  purchaseDate = v5->_purchaseDate;
  v5->_purchaseDate = v56;

  v5->_purchasedRedownload = self->_purchasedRedownload;
  v58 = (NSString *)-[NSString copyWithZone:](self->_ratingLabel, "copyWithZone:", a3);
  ratingLabel = v5->_ratingLabel;
  v5->_ratingLabel = v58;

  v60 = (NSNumber *)-[NSNumber copyWithZone:](self->_ratingRank, "copyWithZone:", a3);
  ratingRank = v5->_ratingRank;
  v5->_ratingRank = v60;

  v62 = (NSString *)-[NSString copyWithZone:](self->_redownloadParams, "copyWithZone:", a3);
  redownloadParams = v5->_redownloadParams;
  v5->_redownloadParams = v62;

  v64 = (NSString *)-[NSString copyWithZone:](self->_releaseDate, "copyWithZone:", a3);
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = v64;

  v5->_softwarePlatform = self->_softwarePlatform;
  v66 = (NSString *)-[NSString copyWithZone:](self->_storeCohort, "copyWithZone:", a3);
  storeCohort = v5->_storeCohort;
  v5->_storeCohort = v66;

  v68 = (NSString *)-[NSString copyWithZone:](self->_storefront, "copyWithZone:", a3);
  storefront = v5->_storefront;
  v5->_storefront = v68;

  v70 = (NSString *)-[NSString copyWithZone:](self->_storeTransactionID, "copyWithZone:", a3);
  storeTransactionID = v5->_storeTransactionID;
  v5->_storeTransactionID = v70;

  v72 = (NSArray *)-[NSArray copyWithZone:](self->_subGenres, "copyWithZone:", a3);
  subGenres = v5->_subGenres;
  v5->_subGenres = v72;

  v5->_supports32BitOnly = self->_supports32BitOnly;
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StoreItem;
  id v3 = -[StoreItem description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: {bundleID = %@; itemID = %@; itemName = %@; EVID = %@}",
                   v4,
                   self->_bundleID,
                   self->_itemID,
                   self->_itemName,
                   self->_evid));

  return v5;
}

- (void).cxx_destruct
{
}

@end