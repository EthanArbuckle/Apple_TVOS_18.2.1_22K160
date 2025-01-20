@interface DemotedApplication
- (DemotedApplication)initWithApplication:(id)a3;
- (DemotedApplication)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)downloaderIdentifier;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)familyIdentifier;
- (NSNumber)itemIdentifier;
- (NSNumber)purchaserIdentifier;
- (NSNumber)storeFrontIdentifier;
- (NSString)accountIdentifier;
- (NSString)vendorIdentifier;
- (RestoreDownloadItem)restoreDownloadItem;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDownloaderIdentifier:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setFamilyIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPurchaserIdentifier:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation DemotedApplication

- (DemotedApplication)initWithApplication:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DemotedApplication;
  v5 = -[DemotedApplication init](&v24, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 applicationDSID]);
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 downloaderDSID]);
    downloaderIdentifier = v5->_downloaderIdentifier;
    v5->_downloaderIdentifier = (NSNumber *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 externalVersionIdentifier]);
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 familyID]);
    familyIdentifier = v5->_familyIdentifier;
    v5->_familyIdentifier = (NSNumber *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 itemID]);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 purchaserDSID]);
    purchaserIdentifier = v5->_purchaserIdentifier;
    v5->_purchaserIdentifier = (NSNumber *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 storeFront]);
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSNumber *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifierForVendor]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    vendorIdentifier = v5->_vendorIdentifier;
    v5->_vendorIdentifier = (NSString *)v21;
  }

  return v5;
}

- (DemotedApplication)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DemotedApplication;
  v5 = -[DemotedApplication init](&v23, "init");
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"accountId"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      objc_storeStrong((id *)&v5->_accountIdentifier, v6);
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"downloaderId"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      objc_storeStrong((id *)&v5->_downloaderIdentifier, v8);
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"softwareVersionExternalIdentifier"]);

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      objc_storeStrong((id *)&v5->_externalVersionIdentifier, v10);
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"familyId"]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
      objc_storeStrong((id *)&v5->_familyIdentifier, v12);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"itemId"]);

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
      objc_storeStrong((id *)&v5->_itemIdentifier, v14);
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"purchaserId"]);

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
      objc_storeStrong((id *)&v5->_purchaserIdentifier, v16);
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"s"]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
      objc_storeStrong((id *)&v5->_storeFrontIdentifier, v18);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"vid"]);

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
      objc_storeStrong((id *)&v5->_vendorIdentifier, v20);
    }
  }

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  externalVersionIdentifier = self->_externalVersionIdentifier;
  if (externalVersionIdentifier) {
    [v3 setObject:externalVersionIdentifier forKey:@"softwareVersionExternalIdentifier"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v4 setObject:itemIdentifier forKey:@"itemId"];
  }
  storeFrontIdentifier = self->_storeFrontIdentifier;
  if (storeFrontIdentifier) {
    [v4 setObject:storeFrontIdentifier forKey:@"s"];
  }
  vendorIdentifier = self->_vendorIdentifier;
  if (vendorIdentifier) {
    [v4 setObject:vendorIdentifier forKey:@"vid"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountId"];
  }
  downloaderIdentifier = self->_downloaderIdentifier;
  if (downloaderIdentifier) {
    [v4 setObject:downloaderIdentifier forKey:@"downloaderId"];
  }
  familyIdentifier = self->_familyIdentifier;
  if (familyIdentifier) {
    [v4 setObject:familyIdentifier forKey:@"familyId"];
  }
  purchaserIdentifier = self->_purchaserIdentifier;
  if (purchaserIdentifier) {
    [v4 setObject:purchaserIdentifier forKey:@"purchaserId"];
  }
  return (NSDictionary *)v4;
}

- (RestoreDownloadItem)restoreDownloadItem
{
  v3 = objc_alloc_init(&OBJC_CLASS___RestoreDownloadItem);
  -[RestoreDownloadItem setDownloadKind:](v3, "setDownloadKind:", SSDownloadKindSoftwareApplication);
  -[RestoreDownloadItem setHasRestoreData:](v3, "setHasRestoreData:", 0LL);
  -[RestoreDownloadItem setRestoreDataSize:](v3, "setRestoreDataSize:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_storeFrontIdentifier, "stringValue"));
  -[RestoreDownloadItem setStoreFrontID:](v3, "setStoreFrontID:", v4);

  -[RestoreDownloadItem setStoreItemID:](v3, "setStoreItemID:", self->_itemIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_externalVersionIdentifier, "stringValue"));
  -[RestoreDownloadItem setStoreSoftwareVersionID:](v3, "setStoreSoftwareVersionID:", v5);

  -[RestoreDownloadItem setVendorIdentifier:](v3, "setVendorIdentifier:", self->_vendorIdentifier);
  if (-[NSNumber longLongValue](self->_familyIdentifier, "longLongValue"))
  {
    -[RestoreDownloadItem setStoreAccountID:](v3, "setStoreAccountID:", self->_downloaderIdentifier);
    -[RestoreDownloadItem setStoreOriginalPurchaserAccountID:]( v3,  "setStoreOriginalPurchaserAccountID:",  self->_purchaserIdentifier);
  }

  else
  {
    uint64_t UniqueIdentifierFromValue = SSAccountGetUniqueIdentifierFromValue(self->_accountIdentifier);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(UniqueIdentifierFromValue);
    -[RestoreDownloadItem setStoreAccountID:](v3, "setStoreAccountID:", v7);
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setDownloaderIdentifier:self->_downloaderIdentifier];
  [v4 setExternalVersionIdentifier:self->_externalVersionIdentifier];
  [v4 setFamilyIdentifier:self->_familyIdentifier];
  [v4 setItemIdentifier:self->_itemIdentifier];
  [v4 setPurchaserIdentifier:self->_purchaserIdentifier];
  [v4 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [v4 setVendorIdentifier:self->_vendorIdentifier];
  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)downloaderIdentifier
{
  return self->_downloaderIdentifier;
}

- (void)setDownloaderIdentifier:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSNumber)familyIdentifier
{
  return self->_familyIdentifier;
}

- (void)setFamilyIdentifier:(id)a3
{
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSNumber)purchaserIdentifier
{
  return self->_purchaserIdentifier;
}

- (void)setPurchaserIdentifier:(id)a3
{
}

- (NSNumber)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end