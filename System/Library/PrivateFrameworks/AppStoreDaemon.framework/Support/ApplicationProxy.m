@interface ApplicationProxy
+ (id)proxyForBundle:(id)a3;
+ (id)proxyForBundleID:(id)a3;
+ (id)proxyForBundleURL:(id)a3;
+ (id)proxyForItemID:(id)a3;
+ (id)proxyMatchingBundleID:(id)a3 orItemID:(id)a4;
+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4;
- (ApplicationProxy)initWithBundle:(id)a3;
- (ApplicationProxy)initWithBundleID:(id)a3;
- (ApplicationProxy)initWithBundleID:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (ApplicationProxy)initWithBundlePath:(id)a3;
- (ApplicationProxy)initWithBundleURL:(id)a3;
- (ApplicationProxy)initWithBundleURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
- (ApplicationProxy)initWithItemID:(id)a3 error:(id *)a4;
- (BOOL)appClipIsConfiguredForIAP;
- (BOOL)hasMIDBasedSINF;
- (BOOL)hasUnknownDistributor;
- (BOOL)isAppClip;
- (BOOL)isAppleSigned;
- (BOOL)isArcade;
- (BOOL)isB2BCustomApp;
- (BOOL)isBeta;
- (BOOL)isConfiguratorInstall;
- (BOOL)isFactoryInstall;
- (BOOL)isInstalled;
- (BOOL)isManagedAccount;
- (BOOL)isOffloaded;
- (BOOL)isPlaceholder;
- (BOOL)isProfileValidated;
- (BOOL)isStoreOriginated;
- (BOOL)missingRequiredSINF;
- (BOOL)validateEligibilityForUpdatesWithLogKey:(id)a3;
- (IXApplicationIdentity)applicationIdentity;
- (LSApplicationRecord)record;
- (MIStoreMetadata)storeMetadata;
- (NSArray)extensionReceiptURLs;
- (NSData)sinf;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (NSNumber)installFailureReason;
- (NSNumber)purchaserDSID;
- (NSNumber)ratingRank;
- (NSNumber)storefront;
- (NSString)appStoreToolsBuildVersion;
- (NSString)bundleID;
- (NSString)bundlePath;
- (NSString)bundleVersion;
- (NSString)canonicalExecutablePath;
- (NSString)deviceIdentifierForVendor;
- (NSString)localizedName;
- (NSString)md5;
- (NSString)parentApplicationBundleID;
- (NSString)shortDescription;
- (NSString)shortVersionString;
- (NSString)sinfPath;
- (NSString)storeCohort;
- (NSString)thinningVariantID;
- (NSString)vendorName;
- (NSURL)bundleURL;
- (NSURL)receiptURL;
- (id)description;
- (int64_t)betaExternalVersionID;
- (int64_t)softwarePlatform;
- (int64_t)storeExternalVersionID;
- (int64_t)storeItemID;
- (unint64_t)appPlatform;
- (unint64_t)applicationType;
- (unsigned)codeSignatureVersion;
- (void)setAppClip:(BOOL)a3;
- (void)setAppClipIsConfiguredForIAP:(BOOL)a3;
- (void)setAppPlatform:(unint64_t)a3;
- (void)setAppleSigned:(BOOL)a3;
- (void)setApplicationType:(unint64_t)a3;
- (void)setArcade:(BOOL)a3;
- (void)setBeta:(BOOL)a3;
- (void)setBetaExternalVersionID:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCanonicalExecutablePath:(id)a3;
- (void)setDeviceIdentifierForVendor:(id)a3;
- (void)setDownloaderDSID:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setHasMIDBasedSINF:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMissingRequiredSINF:(BOOL)a3;
- (void)setOffloaded:(BOOL)a3;
- (void)setParentApplicationBundleID:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
- (void)setPurchaserDSID:(id)a3;
- (void)setShortVersionString:(id)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStoreExternalVersionID:(int64_t)a3;
- (void)setStoreItemID:(int64_t)a3;
- (void)setStoreOriginated:(BOOL)a3;
- (void)setStorefront:(id)a3;
- (void)setThinningVariantID:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ApplicationProxy

+ (id)proxyMatchingBundleID:(id)a3 orItemID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_7;
  }
  v7 = -[ApplicationProxy initWithBundleID:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___ApplicationProxy),  "initWithBundleID:allowPlaceholder:error:",  v5,  0LL,  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy validLocationProxy](v7, "validLocationProxy"));

  if (v6)
  {
    id v9 = [v8 storeItemID];
    if (v9 != [v6 longLongValue]) {
      goto LABEL_6;
    }
    if (v8)
    {
      v10 = -[ApplicationProxy initWithItemID:error:]( objc_alloc(&OBJC_CLASS___ApplicationProxy),  "initWithItemID:error:",  v6,  0LL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy validLocationProxy](v10, "validLocationProxy"));

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
      LOBYTE(v10) = [v12 isEqualToString:v5];

      v8 = v11;
      if ((v10 & 1) == 0)
      {
LABEL_6:

LABEL_7:
        v8 = 0LL;
      }
    }
  }

  if (([v8 isInstalled] & 1) == 0)
  {

    v8 = 0LL;
  }

  return v8;
}

- (ApplicationProxy)initWithBundleID:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v16 = 0LL;
  id v9 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v8,  v6,  &v16);
  id v10 = v16;
  v11 = v10;
  if (v9)
  {
    self = sub_1002F6528((id *)&self->super.isa, v9);
    v12 = self;
  }

  else if (a5)
  {
    v12 = 0LL;
    *a5 = v10;
  }

  else
  {
    uint64_t v13 = ASDLogHandleForCategory(14LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2114;
      v20 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "No record found for %{public}@: %{public}@",  buf,  0x16u);
    }

    v12 = 0LL;
  }

  return v12;
}

- (BOOL)validateEligibilityForUpdatesWithLogKey:(id)a3
{
  id v4 = a3;
  if (!-[ApplicationProxy storeItemID](self, "storeItemID")) {
    goto LABEL_18;
  }
  if (!-[ApplicationProxy hasMIDBasedSINF](self, "hasMIDBasedSINF"))
  {
    if (-[ApplicationProxy isBeta](self, "isBeta")
      || -[ApplicationProxy isProfileValidated](self, "isProfileValidated"))
    {
      goto LABEL_18;
    }

    goto LABEL_9;
  }

  if (!-[ApplicationProxy isPlaceholder](self, "isPlaceholder"))
  {
LABEL_9:
    if (-[ApplicationProxy isPlaceholder](self, "isPlaceholder"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy installFailureReason](self, "installFailureReason"));
      BOOL v6 = v9;
    }

    if (!-[ApplicationProxy isInstalled](self, "isInstalled")
      || !-[ApplicationProxy missingRequiredSINF](self, "missingRequiredSINF"))
    {
      BOOL v11 = 1;
      goto LABEL_19;
    }

    uint64_t v10 = ASDLogHandleForCategory(40LL);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self, "bundleID"));
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v7;
    id v8 = "[%@] Skipping unclaimed application: %{public}@";
    goto LABEL_6;
  }

  uint64_t v5 = ASDLogHandleForCategory(40LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self, "bundleID"));
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v7;
    id v8 = "[%@] Skipping per device app with bundle ID: %{public}@";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x16u);
  }

- (ApplicationProxy)initWithBundleURL:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v17 = 0LL;
  id v9 = -[LSApplicationRecord initWithURL:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithURL:allowPlaceholder:error:",  v8,  v6,  &v17);
  id v10 = v17;
  BOOL v11 = v10;
  if (v9)
  {
    self = sub_1002F6528((id *)&self->super.isa, v9);
    v12 = self;
  }

  else if (a5)
  {
    v12 = 0LL;
    *a5 = v10;
  }

  else
  {
    uint64_t v13 = ASDLogHandleForCategory(14LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "No record found at %{public}@: %{public}@",  buf,  0x16u);
    }

    v12 = 0LL;
  }

  return v12;
}

- (ApplicationProxy)initWithItemID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0LL;
  v7 = -[LSApplicationRecord initWithStoreItemIdentifier:error:]( [LSApplicationRecord alloc],  "initWithStoreItemIdentifier:error:",  [v6 unsignedLongLongValue],  &v14);
  id v8 = v14;
  id v9 = v8;
  if (v7)
  {
    self = sub_1002F6528((id *)&self->super.isa, v7);
    id v10 = self;
  }

  else if (a4)
  {
    id v10 = 0LL;
    *a4 = v8;
  }

  else
  {
    uint64_t v11 = ASDLogHandleForCategory(14LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "No record found for %{public}@: %{public}@",  buf,  0x16u);
    }

    id v10 = 0LL;
  }

  return v10;
}

+ (id)proxyForBundle:(id)a3
{
  id v3 = a3;
  id v4 = -[ApplicationProxy initWithBundle:](objc_alloc(&OBJC_CLASS___ApplicationProxy), "initWithBundle:", v3);

  return v4;
}

+ (id)proxyForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = -[ApplicationProxy initWithBundleID:](objc_alloc(&OBJC_CLASS___ApplicationProxy), "initWithBundleID:", v3);

  return v4;
}

+ (id)proxyForItemID:(id)a3
{
  id v3 = a3;
  id v14 = 0LL;
  id v4 = -[LSApplicationRecord initWithStoreItemIdentifier:error:]( [LSApplicationRecord alloc],  "initWithStoreItemIdentifier:error:",  [v3 unsignedLongLongValue],  &v14);
  id v5 = v14;
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == (id)-10814
      && (v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]),
          unsigned int v8 = [v7 isEqualToString:NSOSStatusErrorDomain],
          v7,
          v8))
    {
      uint64_t v9 = ASDLogHandleForCategory(14LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v11 = ASDLogHandleForCategory(14LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v3;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "No record found for %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    v12 = 0LL;
  }

  else
  {
    v12 = sub_1002F6528((id *)objc_alloc(&OBJC_CLASS___ApplicationProxy), v4);
  }

  return v12;
}

+ (id)proxyForBundleURL:(id)a3
{
  id v3 = a3;
  id v14 = 0LL;
  id v4 = -[LSApplicationRecord initWithURL:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithURL:allowPlaceholder:error:",  v3,  1LL,  &v14);
  id v5 = v14;
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == (id)-10814
      && (v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]),
          unsigned int v8 = [v7 isEqualToString:NSOSStatusErrorDomain],
          v7,
          v8))
    {
      uint64_t v9 = ASDLogHandleForCategory(14LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v11 = ASDLogHandleForCategory(14LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v16 = v3;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "No record found for %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    v12 = 0LL;
  }

  else
  {
    v12 = sub_1002F6528((id *)objc_alloc(&OBJC_CLASS___ApplicationProxy), v4);
  }

  return v12;
}

- (ApplicationProxy)initWithBundle:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = -[ApplicationProxy initWithBundleID:](self, "initWithBundleID:", v4);

  return v5;
}

- (ApplicationProxy)initWithBundleID:(id)a3
{
  id v4 = a3;
  id v15 = 0LL;
  id v5 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v4,  1LL,  &v15);
  id v6 = v15;
  v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)-10814
      && (unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]),
          unsigned int v9 = [v8 isEqualToString:NSOSStatusErrorDomain],
          v8,
          v9))
    {
      uint64_t v10 = ASDLogHandleForCategory(14LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No record found for %{public}@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v12 = ASDLogHandleForCategory(14LL);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v17 = v4;
        __int16 v18 = 2114;
        __int16 v19 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "No record found for %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    uint64_t v13 = 0LL;
  }

  else
  {
    self = sub_1002F6528((id *)&self->super.isa, v5);
    uint64_t v13 = self;
  }

  return v13;
}

- (ApplicationProxy)initWithBundlePath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3));
  id v5 = -[ApplicationProxy initWithBundleURL:](self, "initWithBundleURL:", v4);

  return v5;
}

- (ApplicationProxy)initWithBundleURL:(id)a3
{
  id v4 = a3;
  id v26 = 0LL;
  id v5 = -[LSApplicationRecord initWithURL:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithURL:allowPlaceholder:error:",  v4,  1LL,  &v26);
  id v6 = (LSApplicationRecord *)v26;
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = ASDLogHandleForCategory(14LL);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v4;
      __int16 v29 = 2114;
      v30 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "No record found for %{public}@: %{public}@. Checking for extensions.",  buf,  0x16u);
    }
  }

  if (v5) {
    goto LABEL_6;
  }
  id v25 = 0LL;
  uint64_t v11 = -[LSApplicationExtensionRecord initWithURL:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "initWithURL:error:",  v4,  &v25);
  uint64_t v12 = (LSApplicationRecord *)v25;
  id v5 = v12;
  if (v12)
  {
    if (-[LSApplicationRecord code](v12, "code") == (id)-10814LL
      && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord domain](v5, "domain")),
          unsigned int v14 = [v13 isEqualToString:NSOSStatusErrorDomain],
          v13,
          v14))
    {
      uint64_t v15 = ASDLogHandleForCategory(14LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "No extension record found for %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v17 = ASDLogHandleForCategory(14LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = v4;
        __int16 v29 = 2114;
        v30 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "No extension record found for %{public}@: %{public}@",  buf,  0x16u);
      }
    }

- (NSString)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%lld",  self->_bundleID,  self->_storeItemID);
}

- (NSNumber)downloaderDSID
{
  if (!self->_downloaderDSID)
  {
    id v3 = -[LSApplicationRecord applicationDownloaderDSID](self->_record, "applicationDownloaderDSID");
    if (v3)
    {
      id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v3));
      downloaderDSID = self->_downloaderDSID;
      self->_downloaderDSID = v4;
    }
  }

  return self->_downloaderDSID;
}

- (NSNumber)familyID
{
  if (!self->_familyID)
  {
    id v3 = -[LSApplicationRecord applicationFamilyID](self->_record, "applicationFamilyID");
    if (v3)
    {
      id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v3));
      familyID = self->_familyID;
      self->_familyID = v4;
    }
  }

  return self->_familyID;
}

- (BOOL)isManagedAccount
{
  v2 = self;
  if (self)
  {
    account = self->_account;
    if (!account)
    {
      id v4 = sub_1003261E8(self->_record);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      id v6 = v5;
      if (v5)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v5 DSPersonID]);
        if (v7)
        {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
          unsigned int v9 = v8;
          if (v8)
          {
            uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_iTunesAccountWithDSID:", v7));
            uint64_t v11 = v2->_account;
            v2->_account = (ACAccount *)v10;
          }
        }
      }

      account = v2->_account;
    }

    v2 = account;
  }

  unsigned __int8 v12 = -[ApplicationProxy ams_isManagedAppleID](v2, "ams_isManagedAppleID");

  return v12;
}

- (NSNumber)purchaserDSID
{
  if (!self->_purchaserDSID && -[LSApplicationRecord applicationDSID](self->_record, "applicationDSID"))
  {
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LSApplicationRecord applicationDSID](self->_record, "applicationDSID")));
    purchaserDSID = self->_purchaserDSID;
    self->_purchaserDSID = v3;
  }

  return self->_purchaserDSID;
}

- (BOOL)isAppClip
{
  return 0;
}

- (NSString)parentApplicationBundleID
{
  return 0LL;
}

- (BOOL)appClipIsConfiguredForIAP
{
  return 0;
}

- (unint64_t)appPlatform
{
  return -[LSApplicationRecord platform](self->_record, "platform");
}

- (NSString)bundleID
{
  return (NSString *)-[LSApplicationRecord bundleIdentifier](self->_record, "bundleIdentifier");
}

- (NSString)bundlePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord URL](self->_record, "URL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return (NSString *)v3;
}

- (NSURL)bundleURL
{
  return (NSURL *)-[LSApplicationRecord URL](self->_record, "URL");
}

- (NSString)bundleVersion
{
  return (NSString *)-[LSApplicationRecord exactBundleVersion](self->_record, "exactBundleVersion");
}

- (NSString)canonicalExecutablePath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord executableURL](self->_record, "executableURL"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord executableURL](self->_record, "executableURL"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByResolvingSymlinksInPath]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  }

  else
  {
    uint64_t v7 = ASDLogHandleForCategory(14LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Can't generate canonical executable path for app with no executable URL: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    id v6 = 0LL;
  }

  return (NSString *)v6;
}

- (NSString)localizedName
{
  return (NSString *)-[LSApplicationRecord localizedName](self->_record, "localizedName");
}

- (NSString)shortVersionString
{
  return (NSString *)-[LSApplicationRecord shortVersionString](self->_record, "shortVersionString");
}

- (NSString)vendorName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 artistName]);

  return (NSString *)v3;
}

- (BOOL)isAppleSigned
{
  unsigned __int16 signingFlags = self->_signingFlags;
  if ((signingFlags & 2) != 0) {
    return signingFlags & 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self, "bundleID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v4,  1LL,  0LL));

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 containingBundleRecord]);

    id v5 = (void *)v8;
  }

  if (v5)
  {
    unsigned int v9 = [v5 isProfileValidated];
    char v10 = v9 ^ 1;
    if (v9) {
      __int16 v11 = 2;
    }
    else {
      __int16 v11 = 3;
    }
    unsigned __int16 v12 = v11 | self->_signingFlags;
  }

  else
  {
    char v10 = 0;
    unsigned __int16 v12 = self->_signingFlags | 2;
  }

  self->_unsigned __int16 signingFlags = v12;

  return v10;
}

- (BOOL)isProfileValidated
{
  return -[LSApplicationRecord isProfileValidated](self->_record, "isProfileValidated");
}

- (unsigned)codeSignatureVersion
{
  return -[LSApplicationRecord codeSignatureVersion](self->_record, "codeSignatureVersion");
}

- (NSString)md5
{
  return 0LL;
}

- (BOOL)hasMIDBasedSINF
{
  return -[LSApplicationRecord applicationHasMIDBasedSINF](self->_record, "applicationHasMIDBasedSINF");
}

- (BOOL)missingRequiredSINF
{
  return -[LSApplicationRecord applicationMissingRequiredSINF]( self->_record,  "applicationMissingRequiredSINF");
}

- (NSString)sinfPath
{
  return 0LL;
}

- (NSData)sinf
{
  return 0LL;
}

- (IXApplicationIdentity)applicationIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](self->_record, "bundleIdentifier"));
  if (v2) {
    id v3 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v2);
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (NSNumber)installFailureReason
{
  id v3 = -[LSApplicationRecord placeholderFailureReason](self->_record, "placeholderFailureReason");
  if (v3) {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[LSApplicationRecord placeholderFailureReason](self->_record, "placeholderFailureReason")));
  }
  return (NSNumber *)v3;
}

- (unint64_t)applicationType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord typeForInstallMachinery](self->_record, "typeForInstallMachinery"));
  if ([v2 isEqualToString:LSUserApplicationType])
  {
    unint64_t v3 = 0LL;
  }

  else if ([v2 isEqualToString:LSSystemApplicationType])
  {
    unint64_t v3 = 1LL;
  }

  else if ([v2 isEqualToString:LSInternalApplicationType])
  {
    unint64_t v3 = 2LL;
  }

  else
  {
    unint64_t v3 = 99999LL;
  }

  return v3;
}

- (BOOL)isInstalled
{
  return -[LSApplicationRecord isPlaceholder](self->_record, "isPlaceholder") ^ 1;
}

- (BOOL)isOffloaded
{
  return (char *)-[LSApplicationRecord installType](self->_record, "installType") - 7 < (char *)3;
}

- (BOOL)isPlaceholder
{
  return -[LSApplicationRecord isPlaceholder](self->_record, "isPlaceholder");
}

- (NSString)appStoreToolsBuildVersion
{
  return (NSString *)-[LSApplicationRecord appStoreToolsBuildVersion](self->_record, "appStoreToolsBuildVersion");
}

- (BOOL)hasUnknownDistributor
{
  return 0;
}

- (BOOL)isArcade
{
  if ((-[LSApplicationRecord isArcadeApp](self->_record, "isArcadeApp") & 1) != 0)
  {
    LOBYTE(has_internal_content) = 1;
  }

  else
  {
    int has_internal_content = os_variant_has_internal_content("com.apple.appstored");
    if (has_internal_content)
    {
      if (self->_bundleID)
      {
        CFPropertyListRef v4 = sub_1002F9344((uint64_t)&OBJC_CLASS___AppDefaultsManager);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        unsigned __int8 v6 = [v5 containsObject:self->_bundleID];

        LOBYTE(has_internal_content) = v6;
      }

      else
      {
        LOBYTE(has_internal_content) = 0;
      }
    }
  }

  return has_internal_content;
}

- (BOOL)isBeta
{
  return -[LSApplicationRecord isBeta](self->_record, "isBeta");
}

- (int64_t)betaExternalVersionID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = [v2 betaVersionIdentifier];

  return (int64_t)v3;
}

- (NSString)deviceIdentifierForVendor
{
  deviceIdentifierForVendor = self->_deviceIdentifierForVendor;
  if (!deviceIdentifierForVendor)
  {
    CFPropertyListRef v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord deviceIdentifierForVendor](self->_record, "deviceIdentifierForVendor"));
    id v5 = v4;
    if (v4)
    {
      unsigned __int8 v6 = (NSString *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      uint64_t v7 = self->_deviceIdentifierForVendor;
      self->_deviceIdentifierForVendor = v6;
    }

    deviceIdentifierForVendor = self->_deviceIdentifierForVendor;
  }

  return deviceIdentifierForVendor;
}

- (NSArray)extensionReceiptURLs
{
  extensionReceiptURLs = self->_extensionReceiptURLs;
  if (!extensionReceiptURLs)
  {
    CFPropertyListRef v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationExtensionRecords](self->_record, "applicationExtensionRecords"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectEnumerator]);
    id v6 = sub_10031D77C(v5, &stru_1003F26C8);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    uint64_t v8 = sub_1002B5E74((uint64_t)&OBJC_CLASS___Optional, v7);
    unsigned int v9 = (Optional *)objc_claimAutoreleasedReturnValue(v8);
    char v10 = self->_extensionReceiptURLs;
    self->_extensionReceiptURLs = v9;

    extensionReceiptURLs = self->_extensionReceiptURLs;
  }

  return (NSArray *)sub_1002B5EC8(extensionReceiptURLs, &__NSArray0__struct);
}

- (BOOL)isB2BCustomApp
{
  id v2 = sub_1003261E8(self->_record);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 isB2BCustomApp];

  return v4;
}

- (NSNumber)ratingRank
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v2 ratingRank]));

  return (NSNumber *)v3;
}

- (NSURL)receiptURL
{
  return (NSURL *)sub_1002EAD00(self->_record);
}

- (NSString)storeCohort
{
  p_storeCohort = &self->_storeCohort;
  storeCohort = self->_storeCohort;
  if (!storeCohort)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeCohort]);

    if (v6 && [v6 length]) {
      objc_storeStrong((id *)p_storeCohort, v6);
    }

    storeCohort = *p_storeCohort;
  }

  return storeCohort;
}

- (int64_t)storeExternalVersionID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = [v2 versionIdentifier];

  return (int64_t)v3;
}

- (NSNumber)storefront
{
  if (!self->_storefront)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
    id v4 = [v3 storeFront];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
      id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 storeFront]));
      storefront = self->_storefront;
      self->_storefront = v6;
    }
  }

  return self->_storefront;
}

- (int64_t)storeItemID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = [v2 storeItemIdentifier];

  return (int64_t)v3;
}

- (MIStoreMetadata)storeMetadata
{
  storeMetadata = self->_storeMetadata;
  if (storeMetadata) {
    goto LABEL_6;
  }
  id v4 = sub_1003261E8(self->_record);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5
  uint64_t v7 = (Optional *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = self->_storeMetadata;
  self->_storeMetadata = v7;

  storeMetadata = self->_storeMetadata;
  if (storeMetadata)
  {
LABEL_6:
    if (storeMetadata->_hasValue) {
      storeMetadata = (Optional *)objc_getProperty(storeMetadata, a2, 16LL, 1);
    }
    else {
      storeMetadata = 0LL;
    }
  }

  return (MIStoreMetadata *)storeMetadata;
}

- (BOOL)isStoreOriginated
{
  return -[ApplicationProxy storeItemID](self, "storeItemID") > 0;
}

- (NSString)thinningVariantID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](self->_record, "iTunesMetadata"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 variantID]);

  return (NSString *)v3;
}

- (BOOL)isConfiguratorInstall
{
  return 0;
}

- (BOOL)isFactoryInstall
{
  return 0;
}

+ (void)enumerateApplicationsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  id v5 = a4;
  if (a3 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
    uint64_t v7 = &stru_1003F2728;
  }

  else if (a3 == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  1LL));
    uint64_t v7 = &stru_1003F2708;
  }

  else
  {
    if (a3)
    {
      id v9 = 0LL;
      goto LABEL_9;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
    uint64_t v7 = &stru_1003F26E8;
  }

  objc_msgSend(v6, "setFilter:", v7, v6);
LABEL_9:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002F810C;
  v10[3] = &unk_1003F2750;
  id v11 = v5;
  id v8 = v5;
  sub_10031D48C(v9, v10);
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ApplicationProxy;
  id v3 = -[ApplicationProxy description](&v12, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self, "bundleID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy shortVersionString](self, "shortVersionString"));
  int64_t v7 = -[ApplicationProxy storeItemID](self, "storeItemID");
  int64_t v8 = -[ApplicationProxy storeExternalVersionID](self, "storeExternalVersionID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundlePath](self, "bundlePath"));
  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: (%@, %@, %lld:%lld %@) ",  v4,  v5,  v6,  v7,  v8,  v9));

  return v10;
}

- (LSApplicationRecord)record
{
  return self->_record;
}

- (void)setDownloaderDSID:(id)a3
{
}

- (void)setFamilyID:(id)a3
{
}

- (void)setPurchaserDSID:(id)a3
{
}

- (void)setAppClip:(BOOL)a3
{
  self->_appClip = a3;
}

- (void)setParentApplicationBundleID:(id)a3
{
}

- (void)setAppClipIsConfiguredForIAP:(BOOL)a3
{
  self->_appClipIsConfiguredForIAP = a3;
}

- (void)setAppPlatform:(unint64_t)a3
{
  self->_appPlatform = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setBundlePath:(id)a3
{
}

- (void)setBundleURL:(id)a3
{
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setCanonicalExecutablePath:(id)a3
{
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setShortVersionString:(id)a3
{
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setVendorName:(id)a3
{
}

- (void)setAppleSigned:(BOOL)a3
{
  self->_appleSigned = a3;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (void)setMissingRequiredSINF:(BOOL)a3
{
  self->_missingRequiredSINF = a3;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (void)setOffloaded:(BOOL)a3
{
  self->_offloaded = a3;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setArcade:(BOOL)a3
{
  self->_arcade = a3;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (void)setBetaExternalVersionID:(int64_t)a3
{
  self->_betaExternalVersionID = a3;
}

- (void)setDeviceIdentifierForVendor:(id)a3
{
}

- (void)setStoreCohort:(id)a3
{
}

- (void)setStoreExternalVersionID:(int64_t)a3
{
  self->_storeExternalVersionID = a3;
}

- (void)setStorefront:(id)a3
{
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (void)setStoreOriginated:(BOOL)a3
{
  self->_storeOriginated = a3;
}

- (void)setThinningVariantID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end