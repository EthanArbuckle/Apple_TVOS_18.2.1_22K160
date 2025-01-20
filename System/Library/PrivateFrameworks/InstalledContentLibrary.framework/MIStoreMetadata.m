@interface MIStoreMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataForBundleContainerURL:(id)a3 error:(id *)a4;
+ (id)metadataFromDictionary:(id)a3;
+ (id)metadataFromPlistAtURL:(id)a3 error:(id *)a4;
+ (id)metadataFromPlistData:(id)a3 error:(id *)a4;
- (BOOL)deviceBasedVPP;
- (BOOL)gameCenterEverEnabled;
- (BOOL)hasMessagesExtension;
- (BOOL)isAutoDownload;
- (BOOL)isB2BCustomApp;
- (BOOL)isEligibleForWatchAppInstall;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFactoryInstall;
- (BOOL)isGameCenterEnabled;
- (BOOL)isLaunchProhibited;
- (BOOL)isPurchasedRedownload;
- (BOOL)sideLoadedDeviceBasedVPP;
- (MIStoreMetadata)initWithCoder:(id)a3;
- (MIStoreMetadata)initWithDictionary:(id)a3;
- (MIStoreMetadataDistributor)distributorInfo;
- (NSArray)categories;
- (NSArray)subGenres;
- (NSData)protectedMetadata;
- (NSDictionary)nameTranscriptions;
- (NSNumber)DSPersonID;
- (NSNumber)betaExternalVersionIdentifier;
- (NSNumber)downloaderID;
- (NSNumber)familyID;
- (NSNumber)genreID;
- (NSNumber)hasOrEverHasHadIAP;
- (NSNumber)initialODRSize;
- (NSNumber)itemID;
- (NSNumber)purchaserID;
- (NSNumber)ratingRank;
- (NSNumber)softwareVersionExternalIdentifier;
- (NSNumber)storefront;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)artistName;
- (NSString)assetToken;
- (NSString)betaBuildGroupID;
- (NSString)bundleShortVersionString;
- (NSString)bundleVersion;
- (NSString)enterpriseInstallURL;
- (NSString)genre;
- (NSString)iAdAttribution;
- (NSString)iAdConversionDate;
- (NSString)iAdImpressionDate;
- (NSString)itemName;
- (NSString)kind;
- (NSString)label;
- (NSString)managementDeclarationIdentifier;
- (NSString)md5;
- (NSString)purchaseDate;
- (NSString)ratingLabel;
- (NSString)redownloadParams;
- (NSString)referrerApp;
- (NSString)referrerURL;
- (NSString)releaseDate;
- (NSString)shortItemName;
- (NSString)softwareVersionBundleID;
- (NSString)sourceApp;
- (NSString)storeCohort;
- (NSString)storefrontCountryCode;
- (NSString)variantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertyListDataWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAssetToken:(id)a3;
- (void)setBetaBuildGroupID:(id)a3;
- (void)setBetaExternalVersionIdentifier:(id)a3;
- (void)setBundleShortVersionString:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCategories:(id)a3;
- (void)setDSPersonID:(id)a3;
- (void)setDeviceBasedVPP:(BOOL)a3;
- (void)setDistributorInfo:(id)a3;
- (void)setDownloaderID:(id)a3;
- (void)setEnterpriseInstallURL:(id)a3;
- (void)setFactoryInstall:(BOOL)a3;
- (void)setFamilyID:(id)a3;
- (void)setGameCenterEnabled:(BOOL)a3;
- (void)setGameCenterEverEnabled:(BOOL)a3;
- (void)setGenre:(id)a3;
- (void)setGenreID:(id)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setHasOrEverHasHadIAP:(id)a3;
- (void)setIAdAttribution:(id)a3;
- (void)setIAdConversionDate:(id)a3;
- (void)setIAdImpressionDate:(id)a3;
- (void)setInitialODRSize:(id)a3;
- (void)setIsAutoDownload:(BOOL)a3;
- (void)setIsB2BCustomApp:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setKind:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setManagementDeclarationIdentifier:(id)a3;
- (void)setMd5:(id)a3;
- (void)setNameTranscriptions:(id)a3;
- (void)setProtectedMetadata:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setPurchasedRedownload:(BOOL)a3;
- (void)setPurchaserID:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingRank:(id)a3;
- (void)setRedownloadParams:(id)a3;
- (void)setReferrerApp:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setShortItemName:(id)a3;
- (void)setSideLoadedDeviceBasedVPP:(BOOL)a3;
- (void)setSoftwareVersionBundleID:(id)a3;
- (void)setSoftwareVersionExternalIdentifier:(id)a3;
- (void)setSourceApp:(id)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setStorefrontCountryCode:(id)a3;
- (void)setSubGenres:(id)a3;
- (void)setVariantID:(id)a3;
@end

@implementation MIStoreMetadata

- (MIStoreMetadata)initWithDictionary:(id)a3
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[MIStoreMetadata init](self, "init");

  if (!v5) {
    goto LABEL_406;
  }
  [v4 objectForKeyedSubscript:iAdAttribution];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdAttribution:](v5, "setIAdAttribution:", v6);
  }

  else if (v6 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = iAdAttribution;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:iAdConversionDate];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdConversionDate:](v5, "setIAdConversionDate:", v7);
  }

  else if (v7 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = iAdConversionDate;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:iAdImpressionDate];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIAdImpressionDate:](v5, "setIAdImpressionDate:", v8);
  }

  else if (v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = iAdImpressionDate;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:artistName];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setArtistName:](v5, "setArtistName:", v9);
  }

  else if (v9 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = artistName;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:betaExternalVersionIdentifier];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBetaExternalVersionIdentifier:](v5, "setBetaExternalVersionIdentifier:", v10);
  }

  else if (v10 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = betaExternalVersionIdentifier;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:bundleVersion];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBundleVersion:](v5, "setBundleVersion:", v11);
  }

  else if (v11 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = bundleVersion;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:bundleShortVersionString];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBundleShortVersionString:](v5, "setBundleShortVersionString:", v12);
  }

  else if (v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = bundleShortVersionString;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:downloadInfoDict];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v14 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v15 = v14;
  }
  else {
    id v15 = 0LL;
  }

  if (v15)
  {
    [v14 objectForKeyedSubscript:purchaseDate];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setPurchaseDate:](v5, "setPurchaseDate:", v16);
    }

    else if (v16 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v99 = purchaseDate;
      MOLogWrite();
    }

    [v14 objectForKeyedSubscript:accountInfoDict];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v18 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v19 = v18;
    }
    else {
      id v19 = 0LL;
    }

    if (v19)
    {
      [v18 objectForKeyedSubscript:appleID];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setAppleID:](v5, "setAppleID:", v20);
      }

      else if (v20 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = appleID;
        MOLogWrite();
      }

      [v18 objectForKeyedSubscript:DSPersonID];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setDSPersonID:](v5, "setDSPersonID:", v21);
      }

      else if (v21 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = DSPersonID;
        MOLogWrite();
      }

      [v18 objectForKeyedSubscript:downloaderID];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setDownloaderID:](v5, "setDownloaderID:", v22);
      }

      else if (v22 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = downloaderID;
        MOLogWrite();
      }

      [v18 objectForKeyedSubscript:familyID];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setFamilyID:](v5, "setFamilyID:", v23);
      }

      else if (v23 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = familyID;
        MOLogWrite();
      }

      [v18 objectForKeyedSubscript:purchaserID];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setPurchaserID:](v5, "setPurchaserID:", v24);
      }

      else if (v24 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = purchaserID;
        MOLogWrite();
      }

      [v18 objectForKeyedSubscript:altDSID];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MIStoreMetadata setAltDSID:](v5, "setAltDSID:", v25);
      }

      else if (v25 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        uint64_t v99 = altDSID;
        MOLogWrite();
      }
    }

    else if (v18 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v99 = accountInfoDict;
      uint64_t v105 = downloadInfoDict;
      MOLogWrite();
    }
  }

  else if (v14 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v99 = downloadInfoDict;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", hasMessagesExtension, v99, v105);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setHasMessagesExtension:](v5, "setHasMessagesExtension:", [v26 BOOLValue]);
  }

  else if (v26 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = hasMessagesExtension;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:initialODRSize];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setInitialODRSize:](v5, "setInitialODRSize:", v27);
  }

  else if (v27 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = initialODRSize;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:purchasedRedownload];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setPurchasedRedownload:](v5, "setPurchasedRedownload:", [v28 BOOLValue]);
  }

  else if (v28 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = purchasedRedownload;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:itemID];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setItemID:](v5, "setItemID:", v29);
  }

  else if (v29 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = itemID;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:itemName];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setItemName:](v5, "setItemName:", v30);
  }

  else if (v30 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = itemName;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:shortItemName];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setShortItemName:](v5, "setShortItemName:", v31);
  }

  else if (v31 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = shortItemName;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:kind];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setKind:](v5, "setKind:", v32);
  }

  else if (v32 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = kind;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:label];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setLabel:](v5, "setLabel:", v33);
  }

  else if (v33 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = label;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:launchProhibited];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setLaunchProhibited:](v5, "setLaunchProhibited:", [v34 BOOLValue]);
  }

  else if (v34 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = launchProhibited;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:ratingDict];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v36 = v35;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v37 = v36;
  }
  else {
    id v37 = 0LL;
  }

  if (v37)
  {
    [v36 objectForKeyedSubscript:ratingLabel];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setRatingLabel:](v5, "setRatingLabel:", v38);
    }

    else if (v38 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v100 = ratingLabel;
      MOLogWrite();
    }

    [v36 objectForKeyedSubscript:ratingRank];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadata setRatingRank:](v5, "setRatingRank:", v39);
    }

    else if (v39 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v100 = ratingRank;
      MOLogWrite();
    }
  }

  else if (v36 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v100 = ratingDict;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", releaseDate, v100);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReleaseDate:](v5, "setReleaseDate:", v40);
  }

  else if (v40 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = releaseDate;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:softwareVersionBundleID];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSoftwareVersionBundleID:](v5, "setSoftwareVersionBundleID:", v41);
  }

  else if (v41 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = softwareVersionBundleID;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:softwareVersionExternalIdentifier];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSoftwareVersionExternalIdentifier:](v5, "setSoftwareVersionExternalIdentifier:", v42);
  }

  else if (v42 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = softwareVersionExternalIdentifier;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:sourceApp];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSourceApp:](v5, "setSourceApp:", v43);
  }

  else if (v43 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = sourceApp;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:storeCohort];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStoreCohort:](v5, "setStoreCohort:", v44);
  }

  else if (v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = storeCohort;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:storefront];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStorefront:](v5, "setStorefront:", v45);
  }

  else if (v45 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = storefront;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:storefrontCountryCode];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setStorefrontCountryCode:](v5, "setStorefrontCountryCode:", v46);
  }

  else if (v46 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = storefrontCountryCode;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:assetToken];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setAssetToken:](v5, "setAssetToken:", v47);
  }

  else if (v47 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = assetToken;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:variantID];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setVariantID:](v5, "setVariantID:", v48);
  }

  else if (v48 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = variantID;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:betaBuildGroupID];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setBetaBuildGroupID:](v5, "setBetaBuildGroupID:", v49);
  }

  else if (v49 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = betaBuildGroupID;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:genre];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGenre:](v5, "setGenre:", v50);
  }

  else if (v50 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = genre;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:genreID];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGenreID:](v5, "setGenreID:", v51);
  }

  else if (v51 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v101 = genreID;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:subGenres];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    [v4 objectForKeyedSubscript:@"subgenre"];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_opt_class();
  id v53 = v52;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v54 = v53;
  }
  else {
    id v54 = 0LL;
  }

  if (v54)
  {
    id v108 = v36;
    id v109 = v14;
    v110 = v5;
    id v111 = v4;
    v112 = (void *)objc_opt_new();
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    id v55 = v53;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v113 objects:v117 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v114;
      do
      {
        for (uint64_t i = 0LL; i != v57; ++i)
        {
          if (*(void *)v114 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v113 + 1) + 8 * i);
          objc_opt_class();
          id v61 = v60;
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            id v62 = v61;
          }
          else {
            id v62 = 0LL;
          }

          if (v62)
          {
            [v61 objectForKeyedSubscript:genre];
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            id v64 = v63;
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              id v65 = v64;
            }
            else {
              id v65 = 0LL;
            }

            [v61 objectForKeyedSubscript:genreID];
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            id v67 = v66;
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              id v68 = v67;
            }
            else {
              id v68 = 0LL;
            }

            if (v65 && v68)
            {
              v69 = -[MIStoreMetadataSubGenre initWithGenre:genreID:]( objc_alloc(&OBJC_CLASS___MIStoreMetadataSubGenre),  "initWithGenre:genreID:",  v65,  v68);
              if (v69)
              {
                [v112 addObject:v69];
              }

              else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                MOLogWrite();
              }
            }

            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              uint64_t v106 = genreID;
              id v107 = v61;
              uint64_t v101 = genre;
              MOLogWrite();
            }
          }

          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            uint64_t v101 = (uint64_t)v61;
            MOLogWrite();
          }
        }

        uint64_t v57 = [v55 countByEnumeratingWithState:&v113 objects:v117 count:16];
      }

      while (v57);
    }

    v5 = v110;
    if ([v112 count])
    {
      v70 = (void *)[v112 copy];
      -[MIStoreMetadata setSubGenres:](v110, "setSubGenres:", v70);
    }

    id v4 = v111;
    id v36 = v108;
    id v14 = v109;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", categories, v101, v106, v107);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_opt_class();
    id v72 = v71;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v73 = v72;

      objc_opt_class();
      int v74 = MIArrayContainsOnlyClass(v73);

      if (v74)
      {
        -[MIStoreMetadata setCategories:](v5, "setCategories:", v73);
        goto LABEL_300;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v102 = v72;
      MOLogWrite();
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  v6 = (void *)[v5 copy];
  [v4 setIAdAttribution:v6];
  v7 = -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  v8 = (void *)[v7 copy];
  [v4 setIAdConversionDate:v8];
  v9 = -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  v10 = (void *)[v9 copy];
  [v4 setIAdImpressionDate:v10];
  v11 = -[MIStoreMetadata artistName](self, "artistName");
  v12 = (void *)[v11 copy];
  [v4 setArtistName:v12];
  v13 = -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  id v14 = (void *)[v13 copy];
  [v4 setBetaExternalVersionIdentifier:v14];

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)[v15 copy];
  [v4 setBundleVersion:v16];
  v17 = -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  id v18 = (void *)[v17 copy];
  [v4 setBundleShortVersionString:v18];

  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)[v19 copy];
  [v4 setPurchaseDate:v20];
  v21 = -[MIStoreMetadata appleID](self, "appleID");
  v22 = (void *)[v21 copy];
  [v4 setAppleID:v22];
  v23 = -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  v24 = (void *)[v23 copy];
  [v4 setDSPersonID:v24];
  v25 = -[MIStoreMetadata downloaderID](self, "downloaderID");
  v26 = (void *)[v25 copy];
  [v4 setDownloaderID:v26];
  v27 = -[MIStoreMetadata familyID](self, "familyID");
  v28 = (void *)[v27 copy];
  [v4 setFamilyID:v28];
  v29 = -[MIStoreMetadata purchaserID](self, "purchaserID");
  v30 = (void *)[v29 copy];
  [v4 setPurchaserID:v30];
  v31 = -[MIStoreMetadata altDSID](self, "altDSID");
  v32 = (void *)[v31 copy];
  [v4 setAltDSID:v32];

  objc_msgSend(v4, "setHasMessagesExtension:", -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"));
  v33 = -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  v34 = (void *)[v33 copy];
  [v4 setInitialODRSize:v34];

  objc_msgSend(v4, "setPurchasedRedownload:", -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"));
  v35 = -[MIStoreMetadata itemID](self, "itemID");
  id v36 = (void *)[v35 copy];
  [v4 setItemID:v36];

  -[MIStoreMetadata itemName](self, "itemName");
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)[v37 copy];
  [v4 setItemName:v38];
  v39 = -[MIStoreMetadata shortItemName](self, "shortItemName");
  v40 = (void *)[v39 copy];
  [v4 setShortItemName:v40];
  v41 = -[MIStoreMetadata kind](self, "kind");
  v42 = (void *)[v41 copy];
  [v4 setKind:v42];
  v43 = -[MIStoreMetadata label](self, "label");
  v44 = (void *)[v43 copy];
  [v4 setLabel:v44];

  objc_msgSend(v4, "setLaunchProhibited:", -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"));
  v45 = -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  v46 = (void *)[v45 copy];
  [v4 setRatingLabel:v46];
  v47 = -[MIStoreMetadata ratingRank](self, "ratingRank");
  v48 = (void *)[v47 copy];
  [v4 setRatingRank:v48];
  v49 = -[MIStoreMetadata releaseDate](self, "releaseDate");
  v50 = (void *)[v49 copy];
  [v4 setReleaseDate:v50];
  v51 = -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  v52 = (void *)[v51 copy];
  [v4 setSoftwareVersionBundleID:v52];

  -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  id v54 = (void *)[v53 copy];
  [v4 setSoftwareVersionExternalIdentifier:v54];

  -[MIStoreMetadata sourceApp](self, "sourceApp");
  id v55 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = (void *)[v55 copy];
  [v4 setSourceApp:v56];

  -[MIStoreMetadata storeCohort](self, "storeCohort");
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v58 = (void *)[v57 copy];
  [v4 setStoreCohort:v58];
  v59 = -[MIStoreMetadata storefront](self, "storefront");
  v60 = (void *)[v59 copy];
  [v4 setStorefront:v60];

  -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  id v61 = (void *)objc_claimAutoreleasedReturnValue();
  id v62 = (void *)[v61 copy];
  [v4 setStorefrontCountryCode:v62];
  v63 = -[MIStoreMetadata assetToken](self, "assetToken");
  id v64 = (void *)[v63 copy];
  [v4 setAssetToken:v64];

  -[MIStoreMetadata variantID](self, "variantID");
  id v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)[v65 copy];
  [v4 setVariantID:v66];

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  id v67 = (void *)objc_claimAutoreleasedReturnValue();
  id v68 = (void *)[v67 copy];
  [v4 setBetaBuildGroupID:v68];
  v69 = -[MIStoreMetadata genre](self, "genre");
  v70 = (void *)[v69 copy];
  [v4 setGenre:v70];
  v71 = -[MIStoreMetadata genreID](self, "genreID");
  id v72 = (void *)[v71 copy];
  [v4 setGenreID:v72];

  -[MIStoreMetadata subGenres](self, "subGenres");
  id v73 = (void *)objc_claimAutoreleasedReturnValue();
  int v74 = (void *)[v73 copy];
  [v4 setSubGenres:v74];
  v75 = -[MIStoreMetadata categories](self, "categories");
  v76 = (void *)[v75 copy];
  [v4 setCategories:v76];

  objc_msgSend(v4, "setGameCenterEnabled:", -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"));
  objc_msgSend(v4, "setGameCenterEverEnabled:", -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"));
  objc_msgSend(v4, "setIsAutoDownload:", -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"));
  v77 = -[MIStoreMetadata referrerURL](self, "referrerURL");
  v78 = (void *)[v77 copy];
  [v4 setReferrerURL:v78];
  v79 = -[MIStoreMetadata referrerApp](self, "referrerApp");
  v80 = (void *)[v79 copy];
  [v4 setReferrerApp:v80];

  objc_msgSend( v4,  "setSideLoadedDeviceBasedVPP:",  -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"));
  objc_msgSend(v4, "setDeviceBasedVPP:", -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"));
  objc_msgSend(v4, "setIsB2BCustomApp:", -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"));
  v81 = -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  v82 = (void *)[v81 copy];
  [v4 setEnterpriseInstallURL:v82];
  v83 = -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  v84 = (void *)[v83 copy];
  [v4 setRedownloadParams:v84];
  v85 = -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  v86 = (void *)[v85 copy];
  [v4 setNameTranscriptions:v86];

  objc_msgSend(v4, "setFactoryInstall:", -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"));
  v87 = -[MIStoreMetadata md5](self, "md5");
  v88 = (void *)[v87 copy];
  [v4 setMd5:v88];
  v89 = -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  v90 = (void *)[v89 copy];
  [v4 setProtectedMetadata:v90];
  v91 = -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  id v92 = (void *)[v91 copy];
  [v4 setHasOrEverHasHadIAP:v92];

  -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  id v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)[v93 copy];
  [v4 setDistributorInfo:v94];
  v95 = -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  v96 = (void *)[v95 copy];
  [v4 setManagementDeclarationIdentifier:v96];

  return v4;
}

- (MIStoreMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStoreMetadata init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdAttribution"];
    iAdAttribution = v5->_iAdAttribution;
    v5->_iAdAttribution = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdConversionDate"];
    iAdConversionDate = v5->_iAdConversionDate;
    v5->_iAdConversionDate = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdImpressionDate"];
    iAdImpressionDate = v5->_iAdImpressionDate;
    v5->_iAdImpressionDate = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artistName"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"betaExternalVersionIdentifier"];
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleShortVersionString"];
    bundleShortVersionString = v5->_bundleShortVersionString;
    v5->_bundleShortVersionString = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseDate"];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DSPersonID"];
    DSPersonID = v5->_DSPersonID;
    v5->_DSPersonID = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloaderID"];
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyID"];
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaserID"];
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v32;

    v5->_hasMessagesExtension = [v4 decodeBoolForKey:@"hasMessagesExtension"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialODRSize"];
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v34;

    v5->_purchasedRedownload = [v4 decodeBoolForKey:@"purchasedRedownload"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortItemName"];
    shortItemName = v5->_shortItemName;
    v5->_shortItemName = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v44;

    v5->_launchProhibited = [v4 decodeBoolForKey:@"launchProhibited"];
    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingLabel"];
    ratingLabel = v5->_ratingLabel;
    v5->_ratingLabel = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingRank"];
    ratingRank = v5->_ratingRank;
    v5->_ratingRank = (NSNumber *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSString *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"softwareVersionBundleID"];
    softwareVersionBundleID = v5->_softwareVersionBundleID;
    v5->_softwareVersionBundleID = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"softwareVersionExternalIdentifier"];
    softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
    v5->_softwareVersionExternalIdentifier = (NSNumber *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApp"];
    sourceApp = v5->_sourceApp;
    v5->_sourceApp = (NSString *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeCohort"];
    storeCohort = v5->_storeCohort;
    v5->_storeCohort = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefront = v5->_storefront;
    v5->_storefront = (NSNumber *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefrontCountryCode"];
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetToken"];
    assetToken = v5->_assetToken;
    v5->_assetToken = (NSString *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantID"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v66;

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"betaBuildGroupID"];
    betaBuildGroupID = v5->_betaBuildGroupID;
    v5->_betaBuildGroupID = (NSString *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    genre = v5->_genre;
    v5->_genre = (NSString *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genreID"];
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v72;

    int v74 = (void *)MEMORY[0x189604010];
    uint64_t v75 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v77 = [v4 decodeObjectOfClasses:v76 forKey:@"subGenres"];
    subGenres = v5->_subGenres;
    v5->_subGenres = (NSArray *)v77;

    v79 = (void *)MEMORY[0x189604010];
    uint64_t v80 = objc_opt_class();
    objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = [v4 decodeObjectOfClasses:v81 forKey:@"categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v82;

    v5->_gameCenterEnabled = [v4 decodeBoolForKey:@"gameCenterEnabled"];
    v5->_gameCenterEverEnabled = [v4 decodeBoolForKey:@"gameCenterEverEnabled"];
    v5->_isAutoDownload = [v4 decodeBoolForKey:@"isAutoDownload"];
    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerURL"];
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSString *)v84;

    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerApp"];
    referrerApp = v5->_referrerApp;
    v5->_referrerApp = (NSString *)v86;

    v5->_sideLoadedDeviceBasedVPP = [v4 decodeBoolForKey:@"sideLoadedDeviceBasedVPP"];
    v5->_deviceBasedVPP = [v4 decodeBoolForKey:@"deviceBasedVPP"];
    v5->_isB2BCustomApp = [v4 decodeBoolForKey:@"isB2BCustomApp"];
    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enterpriseInstallURL"];
    enterpriseInstallURL = v5->_enterpriseInstallURL;
    v5->_enterpriseInstallURL = (NSString *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redownloadParams"];
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v90;

    v5->_factoryInstall = [v4 decodeBoolForKey:@"factoryInstall"];
    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"md5"];
    md5 = v5->_md5;
    v5->_md5 = (NSString *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protectedMetadata"];
    protectedMetadata = v5->_protectedMetadata;
    v5->_protectedMetadata = (NSData *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasOrEverHasHadIAP"];
    hasOrEverHasHadIAP = v5->_hasOrEverHasHadIAP;
    v5->_hasOrEverHasHadIAP = (NSNumber *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distributorInfo"];
    distributorInfo = v5->_distributorInfo;
    v5->_distributorInfo = (MIStoreMetadataDistributor *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementDeclarationIdentifier"];
    managementDeclarationIdentifier = v5->_managementDeclarationIdentifier;
    v5->_managementDeclarationIdentifier = (NSString *)v100;

    id v102 = (void *)MEMORY[0x189604010];
    uint64_t v103 = objc_opt_class();
    uint64_t v104 = objc_opt_class();
    objc_msgSend(v102, "setWithObjects:", v103, v104, objc_opt_class(), 0);
    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClasses:v105 forKey:@"nameTranscriptions"];
    uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106 && !_IsDictionaryWithKeyStringAndValueArrayOfString(v106))
    {
    }

    else
    {
      -[MIStoreMetadata setNameTranscriptions:](v5, "setNameTranscriptions:", v106);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  [v4 encodeObject:v5 forKey:@"iAdAttribution"];

  -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"iAdConversionDate"];
  v7 = -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  [v4 encodeObject:v7 forKey:@"iAdImpressionDate"];

  -[MIStoreMetadata artistName](self, "artistName");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"artistName"];
  v9 = -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  [v4 encodeObject:v9 forKey:@"betaExternalVersionIdentifier"];

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"bundleVersion"];
  v11 = -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  [v4 encodeObject:v11 forKey:@"bundleShortVersionString"];

  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"purchaseDate"];
  v13 = -[MIStoreMetadata appleID](self, "appleID");
  [v4 encodeObject:v13 forKey:@"appleID"];

  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"DSPersonID"];

  -[MIStoreMetadata downloaderID](self, "downloaderID");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v15 forKey:@"downloaderID"];

  -[MIStoreMetadata familyID](self, "familyID");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v16 forKey:@"familyID"];
  v17 = -[MIStoreMetadata purchaserID](self, "purchaserID");
  [v4 encodeObject:v17 forKey:@"purchaserID"];

  -[MIStoreMetadata altDSID](self, "altDSID");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v18 forKey:@"altDSID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"),  @"hasMessagesExtension");
  -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v19 forKey:@"initialODRSize"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"),  @"purchasedRedownload");
  -[MIStoreMetadata itemID](self, "itemID");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v20 forKey:@"itemID"];
  v21 = -[MIStoreMetadata itemName](self, "itemName");
  [v4 encodeObject:v21 forKey:@"itemName"];

  -[MIStoreMetadata shortItemName](self, "shortItemName");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v22 forKey:@"shortItemName"];
  v23 = -[MIStoreMetadata kind](self, "kind");
  [v4 encodeObject:v23 forKey:@"kind"];

  -[MIStoreMetadata label](self, "label");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v24 forKey:@"label"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"),  @"launchProhibited");
  v25 = -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  [v4 encodeObject:v25 forKey:@"ratingLabel"];

  -[MIStoreMetadata ratingRank](self, "ratingRank");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v26 forKey:@"ratingRank"];
  v27 = -[MIStoreMetadata releaseDate](self, "releaseDate");
  [v4 encodeObject:v27 forKey:@"releaseDate"];

  -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v28 forKey:@"softwareVersionBundleID"];
  v29 = -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  [v4 encodeObject:v29 forKey:@"softwareVersionExternalIdentifier"];

  -[MIStoreMetadata sourceApp](self, "sourceApp");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v30 forKey:@"sourceApp"];
  v31 = -[MIStoreMetadata storeCohort](self, "storeCohort");
  [v4 encodeObject:v31 forKey:@"storeCohort"];

  -[MIStoreMetadata storefront](self, "storefront");
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v32 forKey:@"storefront"];
  v33 = -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  [v4 encodeObject:v33 forKey:@"storefrontCountryCode"];

  -[MIStoreMetadata assetToken](self, "assetToken");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v34 forKey:@"assetToken"];
  v35 = -[MIStoreMetadata variantID](self, "variantID");
  [v4 encodeObject:v35 forKey:@"variantID"];

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v36 forKey:@"betaBuildGroupID"];

  -[MIStoreMetadata genre](self, "genre");
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v37 forKey:@"genre"];

  -[MIStoreMetadata genreID](self, "genreID");
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v38 forKey:@"genreID"];
  v39 = -[MIStoreMetadata subGenres](self, "subGenres");
  [v4 encodeObject:v39 forKey:@"subGenres"];

  -[MIStoreMetadata categories](self, "categories");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v40 forKey:@"categories"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"),  @"gameCenterEnabled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"),  @"gameCenterEverEnabled");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"),  @"isAutoDownload");
  v41 = -[MIStoreMetadata referrerURL](self, "referrerURL");
  [v4 encodeObject:v41 forKey:@"referrerURL"];

  -[MIStoreMetadata referrerApp](self, "referrerApp");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v42 forKey:@"referrerApp"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"),  @"sideLoadedDeviceBasedVPP");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"),  @"deviceBasedVPP");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"),  @"isB2BCustomApp");
  v43 = -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  [v4 encodeObject:v43 forKey:@"enterpriseInstallURL"];

  -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v44 forKey:@"redownloadParams"];
  v45 = -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  [v4 encodeObject:v45 forKey:@"nameTranscriptions"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"),  @"factoryInstall");
  -[MIStoreMetadata md5](self, "md5");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v46 forKey:@"md5"];
  v47 = -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  [v4 encodeObject:v47 forKey:@"protectedMetadata"];

  -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v48 forKey:@"hasOrEverHasHadIAP"];
  v49 = -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  [v4 encodeObject:v49 forKey:@"distributorInfo"];

  -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v50 forKey:@"managementDeclarationIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)metadataFromPlistData:(id)a3 error:(id *)a4
{
  id v17 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:a3 options:0 format:0 error:&v17];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v17;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [a1 metadataFromDictionary:v6];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_10;
      }
    }

    else
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"+[MIStoreMetadata metadataFromPlistData:error:]",  933LL,  @"MIInstallerErrorDomain",  78LL,  0LL,  &unk_189D64D30,  @"iTunesMetadata.plist was not a dictionary; found class %@",
        v13,
      uint64_t v14 = (uint64_t)v12);

      v9 = 0LL;
      id v8 = (id)v14;
      if (!a4) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v10 = _CreateAndLogError( (uint64_t)"+[MIStoreMetadata metadataFromPlistData:error:]",  928LL,  @"MIInstallerErrorDomain",  78LL,  v8,  &unk_189D64D08,  @"Unable to deserialize iTunesMetadata.plist data",  v7,  v16);

    v9 = 0LL;
    id v8 = (id)v10;
    if (!a4) {
      goto LABEL_10;
    }
  }

  if (!v9) {
    *a4 = v8;
  }
LABEL_10:

  return v9;
}

+ (id)metadataFromPlistAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v14 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v5 options:3 error:&v14];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v14;
  if (v6)
  {
    id v13 = v7;
    [(id)objc_opt_class() metadataFromPlistData:v6 error:&v13];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v13;
  }

  else
  {
    uint64_t v10 = [v5 path];
    _CreateError( (uint64_t)"+[MIStoreMetadata metadataFromPlistAtURL:error:]",  952LL,  @"MIInstallerErrorDomain",  78LL,  v7,  &unk_189D64D58,  @"Failed to read iTunesMetadata.plist from %@",  v11,  v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = 0LL;
    id v7 = (id)v10;
  }

  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

+ (id)metadataFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v3];

  return v4;
}

+ (id)metadataForBundleContainerURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 metadataFromPlistAtURL:v6 error:a4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionaryRepresentation
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  id v3 = (void *)objc_opt_new();
  -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:iAdAttribution];
  }

  -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:iAdConversionDate];
  }

  -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:iAdImpressionDate];
  }

  -[MIStoreMetadata artistName](self, "artistName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:artistName];
  }

  -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:betaExternalVersionIdentifier];
  }

  -[MIStoreMetadata bundleVersion](self, "bundleVersion");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:bundleVersion];
  }

  -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:bundleShortVersionString];
  }

  uint64_t v11 = (void *)objc_opt_new();
  -[MIStoreMetadata purchaseDate](self, "purchaseDate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MIStoreMetadata purchaseDate](self, "purchaseDate");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v13 forKeyedSubscript:purchaseDate];
  }

  -[MIStoreMetadata appleID](self, "appleID");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    goto LABEL_22;
  }
  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (-[MIStoreMetadata downloaderID](self, "downloaderID"), (id v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    || (-[MIStoreMetadata familyID](self, "familyID"), (id v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    || (-[MIStoreMetadata purchaserID](self, "purchaserID"), (id v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
LABEL_22:
  }

  else
  {
    v87 = -[MIStoreMetadata altDSID](self, "altDSID");
    if (!v87) {
      goto LABEL_36;
    }
  }

  id v15 = (void *)objc_opt_new();
  -[MIStoreMetadata appleID](self, "appleID");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MIStoreMetadata appleID](self, "appleID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v17 forKeyedSubscript:appleID];
  }

  -[MIStoreMetadata DSPersonID](self, "DSPersonID");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MIStoreMetadata DSPersonID](self, "DSPersonID");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v19 forKeyedSubscript:DSPersonID];
  }

  -[MIStoreMetadata downloaderID](self, "downloaderID");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = -[MIStoreMetadata downloaderID](self, "downloaderID");
    [v15 setObject:v21 forKeyedSubscript:downloaderID];
  }

  -[MIStoreMetadata familyID](self, "familyID");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = -[MIStoreMetadata familyID](self, "familyID");
    [v15 setObject:v23 forKeyedSubscript:familyID];
  }

  -[MIStoreMetadata purchaserID](self, "purchaserID");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = -[MIStoreMetadata purchaserID](self, "purchaserID");
    [v15 setObject:v25 forKeyedSubscript:purchaserID];
  }

  -[MIStoreMetadata altDSID](self, "altDSID");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = -[MIStoreMetadata altDSID](self, "altDSID");
    [v15 setObject:v27 forKeyedSubscript:altDSID];
  }

  uint64_t v28 = (void *)[v15 copy];
  [v11 setObject:v28 forKeyedSubscript:accountInfoDict];

LABEL_36:
  if ([v11 count])
  {
    v29 = (void *)[v11 copy];
    [v3 setObject:v29 forKeyedSubscript:downloadInfoDict];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v30 forKeyedSubscript:hasMessagesExtension];
  v31 = -[MIStoreMetadata initialODRSize](self, "initialODRSize");
  if (v31) {
    [v3 setObject:v31 forKeyedSubscript:initialODRSize];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v32 forKeyedSubscript:purchasedRedownload];
  v33 = -[MIStoreMetadata itemID](self, "itemID");
  if (v33) {
    [v3 setObject:v33 forKeyedSubscript:itemID];
  }

  -[MIStoreMetadata itemName](self, "itemName");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34) {
    [v3 setObject:v34 forKeyedSubscript:itemName];
  }
  v35 = -[MIStoreMetadata shortItemName](self, "shortItemName");
  if (v35) {
    [v3 setObject:v35 forKeyedSubscript:shortItemName];
  }

  -[MIStoreMetadata kind](self, "kind");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36) {
    [v3 setObject:v36 forKeyedSubscript:kind];
  }

  -[MIStoreMetadata label](self, "label");
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37) {
    [v3 setObject:v37 forKeyedSubscript:label];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited"));
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v38 forKeyedSubscript:launchProhibited];

  v39 = (void *)objc_opt_new();
  -[MIStoreMetadata ratingLabel](self, "ratingLabel");
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = -[MIStoreMetadata ratingLabel](self, "ratingLabel");
    [v39 setObject:v41 forKeyedSubscript:ratingLabel];
  }

  -[MIStoreMetadata ratingRank](self, "ratingRank");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = -[MIStoreMetadata ratingRank](self, "ratingRank");
    [v39 setObject:v43 forKeyedSubscript:ratingRank];
  }

  if ([v39 count]) {
    [v3 setObject:v39 forKeyedSubscript:ratingDict];
  }
  -[MIStoreMetadata releaseDate](self, "releaseDate");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44) {
    [v3 setObject:v44 forKeyedSubscript:releaseDate];
  }
  v45 = -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
  if (v45) {
    [v3 setObject:v45 forKeyedSubscript:softwareVersionBundleID];
  }

  -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46) {
    [v3 setObject:v46 forKeyedSubscript:softwareVersionExternalIdentifier];
  }
  v47 = -[MIStoreMetadata sourceApp](self, "sourceApp");
  if (v47) {
    [v3 setObject:v47 forKeyedSubscript:sourceApp];
  }

  -[MIStoreMetadata storeCohort](self, "storeCohort");
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48) {
    [v3 setObject:v48 forKeyedSubscript:storeCohort];
  }
  v49 = -[MIStoreMetadata storefront](self, "storefront");
  if (v49) {
    [v3 setObject:v49 forKeyedSubscript:storefront];
  }

  -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
  id v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50) {
    [v3 setObject:v50 forKeyedSubscript:storefrontCountryCode];
  }
  v51 = -[MIStoreMetadata assetToken](self, "assetToken");
  if (v51) {
    [v3 setObject:v51 forKeyedSubscript:assetToken];
  }

  -[MIStoreMetadata variantID](self, "variantID");
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52) {
    [v3 setObject:v52 forKeyedSubscript:variantID];
  }

  -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
  id v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53) {
    [v3 setObject:v53 forKeyedSubscript:betaBuildGroupID];
  }
  uint64_t v54 = v11;

  -[MIStoreMetadata genre](self, "genre");
  id v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55) {
    [v3 setObject:v55 forKeyedSubscript:genre];
  }

  -[MIStoreMetadata genreID](self, "genreID");
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56) {
    [v3 setObject:v56 forKeyedSubscript:genreID];
  }

  uint64_t v57 = (void *)objc_opt_new();
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  -[MIStoreMetadata subGenres](self, "subGenres", 0LL);
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [v58 countByEnumeratingWithState:&v88 objects:v92 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v89;
    do
    {
      uint64_t v62 = 0LL;
      do
      {
        if (*(void *)v89 != v61) {
          objc_enumerationMutation(v58);
        }
        [*(id *)(*((void *)&v88 + 1) + 8 * v62) dictionaryRepresentation];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v57 addObject:v63];

        ++v62;
      }

      while (v60 != v62);
      uint64_t v60 = [v58 countByEnumeratingWithState:&v88 objects:v92 count:16];
    }

    while (v60);
  }

  uint64_t v64 = (void *)[v57 copy];
  [v3 setObject:v64 forKeyedSubscript:subGenres];

  -[MIStoreMetadata categories](self, "categories");
  id v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65) {
    [v3 setObject:v65 forKeyedSubscript:categories];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled"));
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v66 forKeyedSubscript:gameCenterEnabled];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled"));
  id v67 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v67 forKeyedSubscript:gameCenterEverEnabled];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MIStoreMetadata isAutoDownload](self, "isAutoDownload"));
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v68 forKeyedSubscript:isAutoDownload];
  v69 = -[MIStoreMetadata referrerURL](self, "referrerURL");
  if (v69) {
    [v3 setObject:v69 forKeyedSubscript:referrerURL];
  }

  -[MIStoreMetadata referrerApp](self, "referrerApp");
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70) {
    [v3 setObject:v70 forKeyedSubscript:referrerApp];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v71 forKeyedSubscript:sideLoadedDeviceBasedVPP];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP"));
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v72 forKeyedSubscript:deviceBasedVPP];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp"));
  id v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v73 forKeyedSubscript:isB2BCustomApp];

  -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
  int v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74) {
    [v3 setObject:v74 forKeyedSubscript:enterpriseInstallURL];
  }

  -[MIStoreMetadata redownloadParams](self, "redownloadParams");
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75) {
    [v3 setObject:v75 forKeyedSubscript:redownloadParams];
  }
  v76 = -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
  if (v76) {
    [v3 setObject:v76 forKeyedSubscript:nameTranscriptions];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall"));
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v77 forKeyedSubscript:factoryInstall];
  v78 = -[MIStoreMetadata md5](self, "md5");
  if (v78) {
    [v3 setObject:v78 forKeyedSubscript:md5];
  }
  v79 = -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
  if (v79) {
    [v3 setObject:v79 forKeyedSubscript:protectedMetadata];
  }

  -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80) {
    [v3 setObject:v80 forKeyedSubscript:hasOrEverHasHadIAP];
  }
  v81 = -[MIStoreMetadata distributorInfo](self, "distributorInfo");
  uint64_t v82 = v81;
  if (v81)
  {
    [v81 dictionaryRepresentation];
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v83 forKeyedSubscript:distributorInfo];
  }

  -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84) {
    [v3 setObject:v84 forKeyedSubscript:managementDeclarationIdentifier];
  }

  v85 = (void *)[v3 copy];
  return v85;
}

- (id)propertyListDataWithError:(id *)a3
{
  id v4 = (void *)MEMORY[0x1896079E8];
  -[MIStoreMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStoreMetadata *)a3;
  if (v4 == self)
  {
    BOOL v153 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      -[MIStoreMetadata iAdAttribution](self, "iAdAttribution");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdAttribution](v5, "iAdAttribution");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = MICompareObjects(v6, v7);

      if (!v8) {
        goto LABEL_61;
      }
      -[MIStoreMetadata iAdConversionDate](self, "iAdConversionDate");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdConversionDate](v5, "iAdConversionDate");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v11 = MICompareObjects(v9, v10);

      if (!v11) {
        goto LABEL_61;
      }
      -[MIStoreMetadata iAdImpressionDate](self, "iAdImpressionDate");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata iAdImpressionDate](v5, "iAdImpressionDate");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = MICompareObjects(v12, v13);

      if (!v14) {
        goto LABEL_61;
      }
      -[MIStoreMetadata artistName](self, "artistName");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata artistName](v5, "artistName");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v17 = MICompareObjects(v15, v16);

      if (!v17) {
        goto LABEL_61;
      }
      -[MIStoreMetadata betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata betaExternalVersionIdentifier](v5, "betaExternalVersionIdentifier");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = MICompareObjects(v18, v19);

      if (!v20) {
        goto LABEL_61;
      }
      v21 = -[MIStoreMetadata bundleVersion](self, "bundleVersion");
      -[MIStoreMetadata bundleVersion](v5, "bundleVersion");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v23 = MICompareObjects(v21, v22);

      if (!v23) {
        goto LABEL_61;
      }
      -[MIStoreMetadata bundleShortVersionString](self, "bundleShortVersionString");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MIStoreMetadata bundleShortVersionString](v5, "bundleShortVersionString");
      BOOL v26 = MICompareObjects(v24, v25);

      if (!v26) {
        goto LABEL_61;
      }
      v27 = -[MIStoreMetadata purchaseDate](self, "purchaseDate");
      -[MIStoreMetadata purchaseDate](v5, "purchaseDate");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v29 = MICompareObjects(v27, v28);

      if (!v29) {
        goto LABEL_61;
      }
      -[MIStoreMetadata appleID](self, "appleID");
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[MIStoreMetadata appleID](v5, "appleID");
      BOOL v32 = MICompareObjects(v30, v31);

      if (!v32) {
        goto LABEL_61;
      }
      v33 = -[MIStoreMetadata DSPersonID](self, "DSPersonID");
      -[MIStoreMetadata DSPersonID](v5, "DSPersonID");
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v35 = MICompareObjects(v33, v34);

      if (!v35) {
        goto LABEL_61;
      }
      -[MIStoreMetadata downloaderID](self, "downloaderID");
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata downloaderID](v5, "downloaderID");
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v38 = MICompareObjects(v36, v37);

      if (!v38) {
        goto LABEL_61;
      }
      v39 = -[MIStoreMetadata familyID](self, "familyID");
      -[MIStoreMetadata familyID](v5, "familyID");
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v41 = MICompareObjects(v39, v40);

      if (!v41) {
        goto LABEL_61;
      }
      -[MIStoreMetadata purchaserID](self, "purchaserID");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[MIStoreMetadata purchaserID](v5, "purchaserID");
      BOOL v44 = MICompareObjects(v42, v43);

      if (!v44) {
        goto LABEL_61;
      }
      v45 = -[MIStoreMetadata altDSID](self, "altDSID");
      -[MIStoreMetadata altDSID](v5, "altDSID");
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v47 = MICompareObjects(v45, v46);

      if (!v47) {
        goto LABEL_61;
      }
      BOOL v48 = -[MIStoreMetadata hasMessagesExtension](self, "hasMessagesExtension");
      if (v48 != -[MIStoreMetadata hasMessagesExtension](v5, "hasMessagesExtension")) {
        goto LABEL_61;
      }
      v49 = -[MIStoreMetadata initialODRSize](self, "initialODRSize");
      -[MIStoreMetadata initialODRSize](v5, "initialODRSize");
      id v50 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v51 = MICompareObjects(v49, v50);

      if (!v51) {
        goto LABEL_61;
      }
      BOOL v52 = -[MIStoreMetadata isPurchasedRedownload](self, "isPurchasedRedownload");
      if (v52 != -[MIStoreMetadata isPurchasedRedownload](v5, "isPurchasedRedownload")) {
        goto LABEL_61;
      }
      -[MIStoreMetadata itemID](self, "itemID");
      id v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata itemID](v5, "itemID");
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v55 = MICompareObjects(v53, v54);

      if (!v55) {
        goto LABEL_61;
      }
      -[MIStoreMetadata itemName](self, "itemName");
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata itemName](v5, "itemName");
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v58 = MICompareObjects(v56, v57);

      if (!v58) {
        goto LABEL_61;
      }
      -[MIStoreMetadata shortItemName](self, "shortItemName");
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata shortItemName](v5, "shortItemName");
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v61 = MICompareObjects(v59, v60);

      if (!v61) {
        goto LABEL_61;
      }
      -[MIStoreMetadata kind](self, "kind");
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[MIStoreMetadata kind](v5, "kind");
      BOOL v64 = MICompareObjects(v62, v63);

      if (!v64) {
        goto LABEL_61;
      }
      -[MIStoreMetadata label](self, "label");
      id v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata label](v5, "label");
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v67 = MICompareObjects(v65, v66);

      if (!v67) {
        goto LABEL_61;
      }
      BOOL v68 = -[MIStoreMetadata isLaunchProhibited](self, "isLaunchProhibited");
      if (v68 != -[MIStoreMetadata isLaunchProhibited](v5, "isLaunchProhibited")) {
        goto LABEL_61;
      }
      v69 = -[MIStoreMetadata ratingLabel](self, "ratingLabel");
      -[MIStoreMetadata ratingLabel](v5, "ratingLabel");
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v71 = MICompareObjects(v69, v70);

      if (!v71) {
        goto LABEL_61;
      }
      -[MIStoreMetadata ratingRank](self, "ratingRank");
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata ratingRank](v5, "ratingRank");
      id v73 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v74 = MICompareObjects(v72, v73);

      if (!v74) {
        goto LABEL_61;
      }
      -[MIStoreMetadata releaseDate](self, "releaseDate");
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[MIStoreMetadata releaseDate](v5, "releaseDate");
      BOOL v77 = MICompareObjects(v75, v76);

      if (!v77) {
        goto LABEL_61;
      }
      v78 = -[MIStoreMetadata softwareVersionBundleID](self, "softwareVersionBundleID");
      v79 = -[MIStoreMetadata softwareVersionBundleID](v5, "softwareVersionBundleID");
      BOOL v80 = MICompareObjects(v78, v79);

      if (!v80) {
        goto LABEL_61;
      }
      v81 = -[MIStoreMetadata softwareVersionExternalIdentifier](self, "softwareVersionExternalIdentifier");
      -[MIStoreMetadata softwareVersionExternalIdentifier](v5, "softwareVersionExternalIdentifier");
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v83 = MICompareObjects(v81, v82);

      if (!v83) {
        goto LABEL_61;
      }
      -[MIStoreMetadata sourceApp](self, "sourceApp");
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = -[MIStoreMetadata sourceApp](v5, "sourceApp");
      BOOL v86 = MICompareObjects(v84, v85);

      if (!v86) {
        goto LABEL_61;
      }
      v87 = -[MIStoreMetadata storeCohort](self, "storeCohort");
      -[MIStoreMetadata storeCohort](v5, "storeCohort");
      __int128 v88 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v89 = MICompareObjects(v87, v88);

      if (!v89) {
        goto LABEL_61;
      }
      -[MIStoreMetadata storefront](self, "storefront");
      __int128 v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata storefront](v5, "storefront");
      __int128 v91 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v92 = MICompareObjects(v90, v91);

      if (!v92) {
        goto LABEL_61;
      }
      -[MIStoreMetadata storefrontCountryCode](self, "storefrontCountryCode");
      uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata storefrontCountryCode](v5, "storefrontCountryCode");
      uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v95 = MICompareObjects(v93, v94);

      if (!v95) {
        goto LABEL_61;
      }
      -[MIStoreMetadata assetToken](self, "assetToken");
      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = -[MIStoreMetadata assetToken](v5, "assetToken");
      BOOL v98 = MICompareObjects(v96, v97);

      if (!v98) {
        goto LABEL_61;
      }
      -[MIStoreMetadata variantID](self, "variantID");
      uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata variantID](v5, "variantID");
      uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v101 = MICompareObjects(v99, v100);

      if (!v101) {
        goto LABEL_61;
      }
      -[MIStoreMetadata betaBuildGroupID](self, "betaBuildGroupID");
      id v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata betaBuildGroupID](v5, "betaBuildGroupID");
      uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v104 = MICompareObjects(v102, v103);

      if (!v104) {
        goto LABEL_61;
      }
      -[MIStoreMetadata genre](self, "genre");
      uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata genre](v5, "genre");
      uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v107 = MICompareObjects(v105, v106);

      if (!v107) {
        goto LABEL_61;
      }
      -[MIStoreMetadata genreID](self, "genreID");
      id v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata genreID](v5, "genreID");
      id v109 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v110 = MICompareObjects(v108, v109);

      if (!v110) {
        goto LABEL_61;
      }
      -[MIStoreMetadata subGenres](self, "subGenres");
      id v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = -[MIStoreMetadata subGenres](v5, "subGenres");
      BOOL v113 = MICompareObjects(v111, v112);

      if (!v113) {
        goto LABEL_61;
      }
      -[MIStoreMetadata categories](self, "categories");
      __int128 v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadata categories](v5, "categories");
      __int128 v115 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v116 = MICompareObjects(v114, v115);

      if (!v116) {
        goto LABEL_61;
      }
      BOOL v117 = -[MIStoreMetadata isGameCenterEnabled](self, "isGameCenterEnabled");
      if (v117 != -[MIStoreMetadata isGameCenterEnabled](v5, "isGameCenterEnabled")) {
        goto LABEL_61;
      }
      BOOL v118 = -[MIStoreMetadata gameCenterEverEnabled](self, "gameCenterEverEnabled");
      if (v118 != -[MIStoreMetadata gameCenterEverEnabled](v5, "gameCenterEverEnabled")) {
        goto LABEL_61;
      }
      BOOL v119 = -[MIStoreMetadata isAutoDownload](self, "isAutoDownload");
      if (v119 != -[MIStoreMetadata isAutoDownload](v5, "isAutoDownload")) {
        goto LABEL_61;
      }
      v120 = -[MIStoreMetadata referrerURL](self, "referrerURL");
      v121 = -[MIStoreMetadata referrerURL](v5, "referrerURL");
      BOOL v122 = MICompareObjects(v120, v121);

      if (!v122) {
        goto LABEL_61;
      }
      v123 = -[MIStoreMetadata referrerApp](self, "referrerApp");
      v124 = -[MIStoreMetadata referrerApp](v5, "referrerApp");
      BOOL v125 = MICompareObjects(v123, v124);

      if (!v125) {
        goto LABEL_61;
      }
      BOOL v126 = -[MIStoreMetadata sideLoadedDeviceBasedVPP](self, "sideLoadedDeviceBasedVPP");
      if (v126 != -[MIStoreMetadata sideLoadedDeviceBasedVPP](v5, "sideLoadedDeviceBasedVPP")) {
        goto LABEL_61;
      }
      BOOL v127 = -[MIStoreMetadata deviceBasedVPP](self, "deviceBasedVPP");
      if (v127 != -[MIStoreMetadata deviceBasedVPP](v5, "deviceBasedVPP")) {
        goto LABEL_61;
      }
      BOOL v128 = -[MIStoreMetadata isB2BCustomApp](self, "isB2BCustomApp");
      if (v128 != -[MIStoreMetadata isB2BCustomApp](v5, "isB2BCustomApp")) {
        goto LABEL_61;
      }
      v129 = -[MIStoreMetadata enterpriseInstallURL](self, "enterpriseInstallURL");
      v130 = -[MIStoreMetadata enterpriseInstallURL](v5, "enterpriseInstallURL");
      BOOL v131 = MICompareObjects(v129, v130);

      if (!v131) {
        goto LABEL_61;
      }
      v132 = -[MIStoreMetadata redownloadParams](self, "redownloadParams");
      v133 = -[MIStoreMetadata redownloadParams](v5, "redownloadParams");
      BOOL v134 = MICompareObjects(v132, v133);

      if (!v134) {
        goto LABEL_61;
      }
      v135 = -[MIStoreMetadata nameTranscriptions](self, "nameTranscriptions");
      v136 = -[MIStoreMetadata nameTranscriptions](v5, "nameTranscriptions");
      BOOL v137 = MICompareObjects(v135, v136);

      if (!v137) {
        goto LABEL_61;
      }
      BOOL v138 = -[MIStoreMetadata isFactoryInstall](self, "isFactoryInstall");
      if (v138 != -[MIStoreMetadata isFactoryInstall](v5, "isFactoryInstall")) {
        goto LABEL_61;
      }
      v139 = -[MIStoreMetadata md5](self, "md5");
      v140 = -[MIStoreMetadata md5](v5, "md5");
      BOOL v141 = MICompareObjects(v139, v140);

      if (!v141) {
        goto LABEL_61;
      }
      v142 = -[MIStoreMetadata protectedMetadata](self, "protectedMetadata");
      v143 = -[MIStoreMetadata protectedMetadata](v5, "protectedMetadata");
      BOOL v144 = MICompareObjects(v142, v143);

      if (!v144) {
        goto LABEL_61;
      }
      v145 = -[MIStoreMetadata hasOrEverHasHadIAP](self, "hasOrEverHasHadIAP");
      v146 = -[MIStoreMetadata hasOrEverHasHadIAP](v5, "hasOrEverHasHadIAP");
      BOOL v147 = MICompareObjects(v145, v146);

      if (!v147) {
        goto LABEL_61;
      }
      v148 = -[MIStoreMetadata distributorInfo](self, "distributorInfo");
      v149 = -[MIStoreMetadata distributorInfo](v5, "distributorInfo");
      BOOL v150 = MICompareObjects(v148, v149);

      if (v150)
      {
        v151 = -[MIStoreMetadata managementDeclarationIdentifier](self, "managementDeclarationIdentifier");
        v152 = -[MIStoreMetadata managementDeclarationIdentifier](v5, "managementDeclarationIdentifier");
        BOOL v153 = MICompareObjects(v151, v152);
      }

      else
      {
LABEL_61:
        BOOL v153 = 0;
      }
    }

    else
    {
      BOOL v153 = 0;
    }
  }

  return v153;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEligibleForWatchAppInstall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 distributorID];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    char v4 = [v2 distributorIsFirstPartyApple];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (NSString)iAdAttribution
{
  return self->_iAdAttribution;
}

- (void)setIAdAttribution:(id)a3
{
}

- (NSString)iAdConversionDate
{
  return self->_iAdConversionDate;
}

- (void)setIAdConversionDate:(id)a3
{
}

- (NSString)iAdImpressionDate
{
  return self->_iAdImpressionDate;
}

- (void)setIAdImpressionDate:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (void)setBundleShortVersionString:(id)a3
{
}

- (NSString)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSNumber)DSPersonID
{
  return self->_DSPersonID;
}

- (void)setDSPersonID:(id)a3
{
}

- (NSNumber)downloaderID
{
  return self->_downloaderID;
}

- (void)setDownloaderID:(id)a3
{
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
}

- (NSNumber)purchaserID
{
  return self->_purchaserID;
}

- (void)setPurchaserID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
}

- (BOOL)isPurchasedRedownload
{
  return self->_purchasedRedownload;
}

- (void)setPurchasedRedownload:(BOOL)a3
{
  self->_purchasedRedownload = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSString)shortItemName
{
  return self->_shortItemName;
}

- (void)setShortItemName:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (NSNumber)ratingRank
{
  return self->_ratingRank;
}

- (void)setRatingRank:(id)a3
{
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)assetToken
{
  return self->_assetToken;
}

- (void)setAssetToken:(id)a3
{
}

- (NSString)softwareVersionBundleID
{
  return self->_softwareVersionBundleID;
}

- (void)setSoftwareVersionBundleID:(id)a3
{
}

- (NSNumber)softwareVersionExternalIdentifier
{
  return self->_softwareVersionExternalIdentifier;
}

- (void)setSoftwareVersionExternalIdentifier:(id)a3
{
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (void)setSourceApp:(id)a3
{
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (void)setStoreCohort:(id)a3
{
}

- (NSNumber)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void)setStorefrontCountryCode:(id)a3
{
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
}

- (NSString)betaBuildGroupID
{
  return self->_betaBuildGroupID;
}

- (void)setBetaBuildGroupID:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(id)a3
{
}

- (NSArray)subGenres
{
  return self->_subGenres;
}

- (void)setSubGenres:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (void)setGameCenterEnabled:(BOOL)a3
{
  self->_gameCenterEnabled = a3;
}

- (BOOL)gameCenterEverEnabled
{
  return self->_gameCenterEverEnabled;
}

- (void)setGameCenterEverEnabled:(BOOL)a3
{
  self->_gameCenterEverEnabled = a3;
}

- (BOOL)isAutoDownload
{
  return self->_isAutoDownload;
}

- (void)setIsAutoDownload:(BOOL)a3
{
  self->_isAutoDownload = a3;
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (NSString)referrerApp
{
  return self->_referrerApp;
}

- (void)setReferrerApp:(id)a3
{
}

- (BOOL)sideLoadedDeviceBasedVPP
{
  return self->_sideLoadedDeviceBasedVPP;
}

- (void)setSideLoadedDeviceBasedVPP:(BOOL)a3
{
  self->_sideLoadedDeviceBasedVPP = a3;
}

- (BOOL)deviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  self->_deviceBasedVPP = a3;
}

- (BOOL)isB2BCustomApp
{
  return self->_isB2BCustomApp;
}

- (void)setIsB2BCustomApp:(BOOL)a3
{
  self->_isB2BCustomApp = a3;
}

- (NSString)enterpriseInstallURL
{
  return self->_enterpriseInstallURL;
}

- (void)setEnterpriseInstallURL:(id)a3
{
}

- (NSString)redownloadParams
{
  return self->_redownloadParams;
}

- (void)setRedownloadParams:(id)a3
{
}

- (NSDictionary)nameTranscriptions
{
  return self->_nameTranscriptions;
}

- (void)setNameTranscriptions:(id)a3
{
}

- (BOOL)isFactoryInstall
{
  return self->_factoryInstall;
}

- (void)setFactoryInstall:(BOOL)a3
{
  self->_factoryInstall = a3;
}

- (NSString)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
}

- (NSData)protectedMetadata
{
  return self->_protectedMetadata;
}

- (void)setProtectedMetadata:(id)a3
{
}

- (NSNumber)hasOrEverHasHadIAP
{
  return self->_hasOrEverHasHadIAP;
}

- (void)setHasOrEverHasHadIAP:(id)a3
{
}

- (MIStoreMetadataDistributor)distributorInfo
{
  return self->_distributorInfo;
}

- (void)setDistributorInfo:(id)a3
{
}

- (NSString)managementDeclarationIdentifier
{
  return self->_managementDeclarationIdentifier;
}

- (void)setManagementDeclarationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end