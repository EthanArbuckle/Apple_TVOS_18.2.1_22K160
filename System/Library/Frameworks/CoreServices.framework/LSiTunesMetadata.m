@interface LSiTunesMetadata
+ (BOOL)supportsSecureCoding;
+ (LSiTunesMetadata)new;
- (BOOL)isDeviceBasedVPP;
- (BOOL)isGameCenterEnabled;
- (BOOL)isPurchasedRedownload;
- (BOOL)wasGameCenterEverEnabled;
- (LSiTunesMetadata)init;
- (LSiTunesMetadata)initWithCoder:(id)a3;
- (MIStoreMetadataDistributor)distributorInfo;
- (NSArray)subgenres;
- (NSString)artistName;
- (NSString)genre;
- (NSString)itemName;
- (NSString)managementDeclarationIdentifier;
- (NSString)ratingLabel;
- (NSString)sourceApp;
- (NSString)storeCohort;
- (NSString)variantID;
- (id)_initWithContext:(LSContext *)a3 bundleData:(const LSBundleData *)a4;
- (id)storeCohortWithError:(id *)a3;
- (unint64_t)betaVersionIdentifier;
- (unint64_t)genreIdentifier;
- (unint64_t)ratingRank;
- (unint64_t)storeFront;
- (unint64_t)storeItemIdentifier;
- (unint64_t)versionIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)storeCohort;
@end

@implementation LSiTunesMetadata

- (id)_initWithContext:(LSContext *)a3 bundleData:(const LSBundleData *)a4
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___LSiTunesMetadata;
  v6 = -[LSiTunesMetadata init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_storeItemIdentifier = a4->compatibilityState;
    uint64_t v8 = _CSStringCopyCFString();
    artistName = v7->_artistName;
    v7->_artistName = (NSString *)v8;

    uint64_t v10 = _CSStringCopyCFString();
    itemName = v7->_itemName;
    v7->_itemName = (NSString *)v10;

    uint64_t v12 = 8LL;
    if ((*(void *)(&a4->_clas + 1) & 0x200000LL) == 0) {
      uint64_t v12 = 7LL;
    }
    (&v7->super.isa)[v12] = *(Class *)(&a4->itemName + 1);
    v7->_storeFront = *(unint64_t *)((char *)&a4->familyID + 4);
    uint64_t v13 = _CSStringCopyCFString();
    variantID = v7->_variantID;
    v7->_variantID = (NSString *)v13;

    uint64_t v15 = _CSStringCopyCFString();
    managementDeclarationIdentifier = v7->_managementDeclarationIdentifier;
    v7->_managementDeclarationIdentifier = (NSString *)v15;

    v7->_deviceBasedVPP = (*(void *)(&a4->_clas + 1) & 0x8000000000000LL) != 0;
    uint64_t v17 = _CSStringCopyCFString();
    genre = v7->_genre;
    v7->_genre = (NSString *)v17;

    v7->_genreIdentifier = *(void *)(&a4->managementDeclarationIdentifier + 1);
    v19 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  a4->base.infoDictionary);
    int bundleFlags_high = HIDWORD(a4->_bundleFlags);
    if ((bundleFlags_high & 0x4000) != 0)
    {
      uint64_t v21 = [v19 objectForKey:@"storeCohort" ofClass:objc_opt_class()];
      storeCohort = v7->_storeCohort;
      v7->_storeCohort = (NSString *)v21;

      int bundleFlags_high = HIDWORD(a4->_bundleFlags);
    }

    if ((bundleFlags_high & 0x20000) != 0)
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = [v19 objectForKey:@"subgenres" ofClass:v23 valuesOfClass:objc_opt_class()];
      subgenres = v7->_subgenres;
      v7->_subgenres = (NSArray *)v24;
    }

    if (!v7->_subgenres)
    {
      v7->_subgenres = (NSArray *)MEMORY[0x189604A58];
    }

    v7->_ratingRank = *(void *)&a4->sourceAppBundleID;
    uint64_t v26 = _CSStringCopyCFString();
    ratingLabel = v7->_ratingLabel;
    v7->_ratingLabel = (NSString *)v26;

    uint64_t v28 = _CSStringCopyCFString();
    sourceApp = v7->_sourceApp;
    v7->_sourceApp = (NSString *)v28;

    uint64_t v30 = *(void *)(&a4->_clas + 1);
    v7->_purchasedRedownload = (v30 & 0x400000) != 0;
    v7->_gameCenterEnabled = (v30 & 0x2000000000000LL) != 0;
    v7->_gameCenterEverEnabled = (v30 & 0x4000000000000LL) != 0;
    v31 = (void *)MEMORY[0x186E2A59C]();
    _LSPlistGet((uint64_t)a3->db, a4->ratingLabel);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSPlistDataGetDictionary(v32, 0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      uint64_t v34 = [objc_alloc(MEMORY[0x1896100C0]) initWithDictionary:v33];
      distributorInfo = v7->_distributorInfo;
      v7->_distributorInfo = (MIStoreMetadataDistributor *)v34;
    }

    objc_autoreleasePoolPop(v31);
  }

  return v7;
}

- (unint64_t)ratingRank
{
  return self->_ratingRank;
}

- (unint64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void).cxx_destruct
{
}

+ (LSiTunesMetadata)new
{
}

- (LSiTunesMetadata)init
{
}

- (MIStoreMetadataDistributor)distributorInfo
{
  return (MIStoreMetadataDistributor *)(id)-[MIStoreMetadataDistributor copy]( self->_distributorInfo,  "copy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSiTunesMetadata)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___LSiTunesMetadata;
  v4 = -[LSiTunesMetadata init](&v37, sel_init);
  if (v4)
  {
    v4->_storeItemIdentifier = [a3 decodeInt64ForKey:@"storeItemIdentifier"];
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"artistName");
    artistName = v4->_artistName;
    v4->_artistName = (NSString *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"itemName");
    itemName = v4->_itemName;
    v4->_itemName = (NSString *)v7;

    v4->_versionIdentifier = [a3 decodeInt64ForKey:@"versionIdentifier"];
    v4->_betaVersionIdentifier = [a3 decodeInt64ForKey:@"betaVersionIdentifier"];
    v4->_storeFront = [a3 decodeInt64ForKey:@"storeFront"];
    uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"storeCohort");
    storeCohort = v4->_storeCohort;
    v4->_storeCohort = (NSString *)v9;

    uint64_t v11 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"variantID");
    variantID = v4->_variantID;
    v4->_variantID = (NSString *)v11;

    v4->_deviceBasedVPP = [a3 decodeBoolForKey:@"deviceBasedVPP"];
    uint64_t v13 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"genre");
    genre = v4->_genre;
    v4->_genre = (NSString *)v13;

    v4->_genreIdentifier = [a3 decodeInt64ForKey:@"genreIdentifier"];
    XNSGetPropertyListClasses();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "ls_decodeObjectOfClasses:forKey:", v15, @"subgenres");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", objc_opt_class(), 0);
    int v18 = _LSIsArrayWithValuesOfClasses(v16, v17);

    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:", objc_opt_class(), 0);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        while (2)
        {
          uint64_t v23 = 0LL;
          do
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v20);
            }
            if ((_LSIsDictionaryWithKeysAndValuesOfClasses(*(void **)(*((void *)&v33 + 1) + 8 * v23), v19, 0LL) & 1) == 0)
            {

              goto LABEL_13;
            }

            ++v23;
          }

          while (v21 != v23);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      uint64_t v24 = (NSArray *)v20;
      subgenres = v4->_subgenres;
      v4->_subgenres = v24;
    }

    else
    {
LABEL_13:
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[LSiTunesMetadata initWithCoder:]",  229LL,  0LL);
      subgenres = (void *)objc_claimAutoreleasedReturnValue();
      [a3 failWithError:subgenres];
    }

    v4->_ratingRank = [a3 decodeInt64ForKey:@"ratingRank"];
    uint64_t v26 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"ratingLabel");
    ratingLabel = v4->_ratingLabel;
    v4->_ratingLabel = (NSString *)v26;

    uint64_t v28 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sourceApp");
    sourceApp = v4->_sourceApp;
    v4->_sourceApp = (NSString *)v28;

    v4->_purchasedRedownload = [a3 decodeBoolForKey:@"purchasedRedownload"];
    v4->_gameCenterEnabled = [a3 decodeBoolForKey:@"gameCenterEnabled"];
    v4->_gameCenterEverEnabled = [a3 decodeBoolForKey:@"gameCenterEverEnabled"];
    uint64_t v30 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"distributorInfo");
    distributorInfo = v4->_distributorInfo;
    v4->_distributorInfo = (MIStoreMetadataDistributor *)v30;
  }

  return v4;
}

- (id)storeCohortWithError:(id *)a3
{
  v4 = self->_storeCohort;
  if (v4)
  {
    id v5 = 0LL;
  }

  else
  {
    _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  113LL,  (uint64_t)"-[LSiTunesMetadata storeCohortWithError:]",  259LL,  0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  return v4;
}

- (NSString)storeCohort
{
  id v9 = 0LL;
  v2 = -[LSiTunesMetadata storeCohortWithError:](self, "storeCohortWithError:", &v9);
  id v3 = v9;
  v4 = v3;
  if (!v2)
  {
    [v3 domain];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqual:@"LSApplicationWorkspaceErrorDomain"])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 113) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSiTunesMetadata storeCohort].cold.1((uint64_t)v4, v7);
    }
  }

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (unint64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (unint64_t)betaVersionIdentifier
{
  return self->_betaVersionIdentifier;
}

- (unint64_t)storeFront
{
  return self->_storeFront;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (NSString)genre
{
  return self->_genre;
}

- (unint64_t)genreIdentifier
{
  return self->_genreIdentifier;
}

- (NSArray)subgenres
{
  return self->_subgenres;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (BOOL)isPurchasedRedownload
{
  return self->_purchasedRedownload;
}

- (BOOL)isGameCenterEnabled
{
  return self->_gameCenterEnabled;
}

- (BOOL)wasGameCenterEverEnabled
{
  return self->_gameCenterEverEnabled;
}

- (NSString)managementDeclarationIdentifier
{
  return self->_managementDeclarationIdentifier;
}

- (void)storeCohort
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Because a caller called the deprecated method storeCohort, the error %@ is being dropped on the floor. That caller s hould use storeCohortWithError: instead.",  (uint8_t *)&v2,  0xCu);
}

@end