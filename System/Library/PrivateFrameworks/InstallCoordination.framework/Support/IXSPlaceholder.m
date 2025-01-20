@interface IXSPlaceholder
+ (BOOL)supportsSecureCoding;
+ (id)_metadataFromPromise:(id)a3;
- (BOOL)_internal_checkInitWithSeed:(id)a3 error:(id *)a4;
- (BOOL)_isReadyToMaterialize;
- (BOOL)_materialize;
- (BOOL)_validateClientEntitlements:(id *)a3;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)configurationComplete;
- (BOOL)creatorHadWebPlaceholderInstallEntitlement;
- (BOOL)isComplete;
- (BOOL)sentDidBegin;
- (IXPlaceholderAttributes)attributes;
- (IXSOwnedDataPromise)entitlements;
- (IXSOwnedDataPromise)icon;
- (IXSOwnedDataPromise)infoPlistLoctable;
- (IXSPlaceholder)initWithCoder:(id)a3;
- (IXSPlaceholder)initWithSeed:(id)a3 fromConnection:(id)a4 error:(id *)a5;
- (IXSPromisedInMemoryData)metadataPromise;
- (IXSPromisedInMemoryData)sinfPromise;
- (IXSPromisedInMemoryDictionary)infoPlistIconContentPromise;
- (IXSPromisedInMemoryDictionary)localizationDictionaryPromise;
- (IXSPromisedTransferToPath)iconResourcesPromise;
- (MIStoreMetadata)metadata;
- (NSArray)appExtensionPlaceholders;
- (NSArray)appExtensionPlaceholdersPromiseUUIDs;
- (NSData)sinfData;
- (NSDictionary)localizationDictionary;
- (NSError)awakeningError;
- (NSString)bundleID;
- (NSString)bundleName;
- (NSString)description;
- (NSUUID)entitlementsPromiseUUID;
- (NSUUID)iconPromiseUUID;
- (NSUUID)iconResourcesPromiseUUID;
- (NSUUID)infoPlistIconContentPromiseUUID;
- (NSUUID)infoPlistLoctablePromiseUUID;
- (NSUUID)localizationDictionaryPromiseUUID;
- (NSUUID)metadataPromiseUUID;
- (NSUUID)sinfPromiseUUID;
- (double)percentComplete;
- (id)_promiseUUIDsForPromise:(id)a3;
- (id)subPromiseUUIDs;
- (unint64_t)installType;
- (unint64_t)totalBytesNeededOnDisk;
- (void)_cancelPromise:(id)a3 forReason:(id)a4 client:(unint64_t)a5;
- (void)_decommissionPromise:(id)a3;
- (void)_materializeIfReady;
- (void)_remote_getAppExtensionPlaceholderPromises:(id)a3;
- (void)_remote_getAttributesWithCompletion:(id)a3;
- (void)_remote_getEntitlementsPromise:(id)a3;
- (void)_remote_getIconPromise:(id)a3;
- (void)_remote_getIconResourcesPromiseAndInfoPlistContent:(id)a3;
- (void)_remote_getInfoPlistLoctablePromise:(id)a3;
- (void)_remote_getLaunchProhibitedWithCompletion:(id)a3;
- (void)_remote_getLocalizationDictionary:(id)a3;
- (void)_remote_getMetadataWithCompletion:(id)a3;
- (void)_remote_getSinfDataWithCompletion:(id)a3;
- (void)_remote_hasAppExtensionPlaceholderPromises:(id)a3;
- (void)_remote_hasEntitlementsPromise:(id)a3;
- (void)_remote_hasIconPromise:(id)a3;
- (void)_remote_hasIconResourcesPromise:(id)a3;
- (void)_remote_hasInfoPlistLoctablePromise:(id)a3;
- (void)_remote_setAppExtensionPlaceholderPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setAttributes:(id)a3 completion:(id)a4;
- (void)_remote_setConfigurationCompleteWithCompletion:(id)a3;
- (void)_remote_setEntitlementsPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setIconPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setIconResourcesPromiseUUID:(id)a3 infoPlistIconContentPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_setInfoPlistLoctablePromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setLaunchProhibited:(BOOL)a3 completion:(id)a4;
- (void)_remote_setLocalizationPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setMetadataPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5;
- (void)_remote_setSinfPromiseUUID:(id)a3 completion:(id)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)promiseDidReset:(id)a3;
- (void)setAppExtensionPlaceholders:(id)a3;
- (void)setAppExtensionPlaceholdersPromiseUUIDs:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setAwakeningError:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setConfigurationComplete:(BOOL)a3;
- (void)setEntitlements:(id)a3;
- (void)setEntitlementsPromiseUUID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconPromiseUUID:(id)a3;
- (void)setIconResourcesPromise:(id)a3;
- (void)setIconResourcesPromise:(id)a3 andInfoPlistIconContentPromise:(id)a4;
- (void)setIconResourcesPromiseUUID:(id)a3;
- (void)setInfoPlistIconContentPromise:(id)a3;
- (void)setInfoPlistIconContentPromiseUUID:(id)a3;
- (void)setInfoPlistLoctable:(id)a3;
- (void)setInfoPlistLoctablePromiseUUID:(id)a3;
- (void)setLocalizationDictionaryPromise:(id)a3;
- (void)setLocalizationDictionaryPromiseUUID:(id)a3;
- (void)setMetadataPromise:(id)a3;
- (void)setMetadataPromiseUUID:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSentDidBegin:(BOOL)a3;
- (void)setSinfPromise:(id)a3;
- (void)setSinfPromiseUUID:(id)a3;
@end

@implementation IXSPlaceholder

- (BOOL)_internal_checkInitWithSeed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleName]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);

    if (v7)
    {
      id v8 = 0LL;
      BOOL v9 = 1;
      goto LABEL_13;
    }

    v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10007B208();
    }

    v13 = @"Attempting to initialize IXSPlaceholder with seed that has a nil bundleID; failing.";
    uint64_t v14 = 87LL;
  }

  else
  {
    v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10007B198();
    }

    v13 = @"Attempting to initialize IXSPlaceholder with seed that has a nil bundleName; failing.";
    uint64_t v14 = 82LL;
  }

  id v17 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _internal_checkInitWithSeed:error:]",  v14,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  v13,  v12,  v19);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v17);
  if (a4)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a4 = v8;
  }

  else
  {
    BOOL v9 = 0;
  }

- (IXSPlaceholder)initWithSeed:(id)a3 fromConnection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IXSPlaceholder;
  v10 = -[IXSOwnedDataPromise initWithSeed:error:](&v14, "initWithSeed:error:", v8, a5);
  v11 = v10;
  if (v10)
  {
    if (!-[IXSPlaceholder _internal_checkInitWithSeed:error:](v10, "_internal_checkInitWithSeed:error:", v8, a5))
    {
      uint64_t v12 = 0LL;
      goto LABEL_6;
    }

    v11->_creatorHadWebPlaceholderInstallEntitlement = sub_10000C398( v9,  (uint64_t)@"com.apple.private.appinstall.install-webkit-push-placeholder");
  }

  uint64_t v12 = v11;
LABEL_6:

  return v12;
}

- (IXSPlaceholder)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___IXSPlaceholder;
  id v5 = -[IXSOwnedDataPromise initWithCoder:](&v41, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"iconPromiseUUID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    iconPromiseUUID = v5->_iconPromiseUUID;
    v5->_iconPromiseUUID = (NSUUID *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"iconResourcesPromiseUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    iconResourcesPromiseUUID = v5->_iconResourcesPromiseUUID;
    v5->_iconResourcesPromiseUUID = (NSUUID *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"infoPlistIconContentPromiseUUID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    infoPlistIconContentPromiseUUID = v5->_infoPlistIconContentPromiseUUID;
    v5->_infoPlistIconContentPromiseUUID = (NSUUID *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"entitlementsPromiseUUID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    entitlementsPromiseUUID = v5->_entitlementsPromiseUUID;
    v5->_entitlementsPromiseUUID = (NSUUID *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"infoPlistLoctablePromiseUUID"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    infoPlistLoctablePromiseUUID = v5->_infoPlistLoctablePromiseUUID;
    v5->_infoPlistLoctablePromiseUUID = (NSUUID *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"metadataPromiseUUID"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    metadataPromiseUUID = v5->_metadataPromiseUUID;
    v5->_metadataPromiseUUID = (NSUUID *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"sinfPromiseUUID"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    sinfPromiseUUID = v5->_sinfPromiseUUID;
    v5->_sinfPromiseUUID = (NSUUID *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"localizationDictionaryPromiseUUID"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    localizationDictionaryPromiseUUID = v5->_localizationDictionaryPromiseUUID;
    v5->_localizationDictionaryPromiseUUID = (NSUUID *)v28;

    unsigned int v30 = [v4 containsValueForKey:@"appExtensionPlaceholdersPromiseUUIDs"];
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
    v32 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v31,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    if (v30) {
      v34 = @"appExtensionPlaceholdersPromiseUUIDs";
    }
    else {
      v34 = @"plugInPlaceholdersPromiseUUIDs";
    }
    uint64_t v35 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v33 forKey:v34]);
    appExtensionPlaceholdersPromiseUUIDs = v5->_appExtensionPlaceholdersPromiseUUIDs;
    v5->_appExtensionPlaceholdersPromiseUUIDs = (NSArray *)v35;

    v5->_sentDidBegin = [v4 decodeBoolForKey:@"sentDidBegin"];
    v5->_configurationComplete = [v4 decodeBoolForKey:@"configurationComplete"];
    id v37 = [v4 decodeObjectOfClass:objc_opt_class(IXPlaceholderAttributes) forKey:@"attributes"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    attributes = v5->_attributes;
    v5->_attributes = (IXPlaceholderAttributes *)v38;

    v5->_creatorHadWebPlaceholderInstallEntitlement = [v4 decodeBoolForKey:@"creatorHadWebPlaceholderInstallEntitlement"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IXSPlaceholder;
  -[IXSOwnedDataPromise encodeWithCoder:](&v16, "encodeWithCoder:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconPromiseUUID](self, "iconPromiseUUID"));
  [v4 encodeObject:v6 forKey:@"iconPromiseUUID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
  [v4 encodeObject:v7 forKey:@"iconResourcesPromiseUUID"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromiseUUID](self, "infoPlistIconContentPromiseUUID"));
  [v4 encodeObject:v8 forKey:@"infoPlistIconContentPromiseUUID"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlementsPromiseUUID](self, "entitlementsPromiseUUID"));
  [v4 encodeObject:v9 forKey:@"entitlementsPromiseUUID"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctablePromiseUUID](self, "infoPlistLoctablePromiseUUID"));
  [v4 encodeObject:v10 forKey:@"infoPlistLoctablePromiseUUID"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromiseUUID](self, "metadataPromiseUUID"));
  [v4 encodeObject:v11 forKey:@"metadataPromiseUUID"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromiseUUID](self, "sinfPromiseUUID"));
  [v4 encodeObject:v12 forKey:@"sinfPromiseUUID"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromiseUUID](self, "localizationDictionaryPromiseUUID"));
  [v4 encodeObject:v13 forKey:@"localizationDictionaryPromiseUUID"];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholdersPromiseUUIDs](self, "appExtensionPlaceholdersPromiseUUIDs"));
  [v4 encodeObject:v14 forKey:@"appExtensionPlaceholdersPromiseUUIDs"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSPlaceholder sentDidBegin](self, "sentDidBegin"), @"sentDidBegin");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSPlaceholder configurationComplete](self, "configurationComplete"),  @"configurationComplete");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder attributes](self, "attributes"));
  [v4 encodeObject:v15 forKey:@"attributes"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSPlaceholder creatorHadWebPlaceholderInstallEntitlement](self, "creatorHadWebPlaceholderInstallEntitlement"),  @"creatorHadWebPlaceholderInstallEntitlement");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  v200 = (uint64_t (**)(id, void *, uint64_t))a3;
  uint64_t v236 = 0LL;
  v237 = &v236;
  uint64_t v238 = 0x3032000000LL;
  v239 = sub_100019590;
  v240 = sub_1000195A0;
  id v241 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);
  v199 = self;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder awakeningError](self, "awakeningError"));
  if (!v6)
  {
    if (!-[IXSDataPromise isTracked](self, "isTracked") || -[IXSDataPromise didAwake](self, "didAwake")) {
      goto LABEL_101;
    }
    -[IXSDataPromise setDidAwake:](self, "setDidAwake:", 1LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconPromiseUUID](self, "iconPromiseUUID"));

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconPromiseUUID](self, "iconPromiseUUID"));
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___IXSOwnedDataPromise);
      uint64_t v11 = v200[2](v200, v9, v10);
      id v12 = (IXSOwnedDataPromise *)objc_claimAutoreleasedReturnValue(v11);
      icon = self->_icon;
      self->_icon = v12;

      objc_super v14 = self->_icon;
      if (v14)
      {
        id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v14, "accessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000195A8;
        block[3] = &unk_1000CD290;
        block[4] = self;
        v234 = v200;
        v235 = &v236;
        dispatch_sync(v15, block);
      }

      else
      {
        objc_super v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
          objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconPromiseUUID](self, "iconPromiseUUID"));
          sub_10007B520();
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
        v188 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconPromiseUUID](self, "iconPromiseUUID"));
        id v20 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  195LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate icon promise with UUID %@",  v19,  (uint64_t)v18);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

        uint64_t v22 = (void *)v237[5];
        v237[5] = v21;

        -[IXSPlaceholder setIconPromiseUUID:](self, "setIconPromiseUUID:", 0LL);
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___IXSPromisedTransferToPath);
      uint64_t v26 = v200[2](v200, v24, v25);
      id v27 = (IXSPromisedTransferToPath *)objc_claimAutoreleasedReturnValue(v26);
      iconResourcesPromise = self->_iconResourcesPromise;
      self->_iconResourcesPromise = v27;

      v29 = self->_iconResourcesPromise;
      if (v29)
      {
        unsigned int v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v29, "accessQueue"));
        v230[0] = _NSConcreteStackBlock;
        v230[1] = 3221225472LL;
        v230[2] = sub_100019650;
        v230[3] = &unk_1000CD290;
        v230[4] = self;
        v231 = v200;
        v232 = &v236;
        dispatch_sync(v30, v230);
      }

      else
      {
        uint64_t v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
          objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
          sub_10007B4D4();
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
        v189 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
        id v35 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  214LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate icon resources promise with UUID %@",  v34,  (uint64_t)v33);
        uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);

        id v37 = (void *)v237[5];
        v237[5] = v36;

        -[IXSPlaceholder setIconResourcesPromiseUUID:](self, "setIconResourcesPromiseUUID:", 0LL);
      }
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromiseUUID](self, "infoPlistIconContentPromiseUUID"));

    v39 = self;
    if (v38)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromiseUUID](self, "infoPlistIconContentPromiseUUID"));
      uint64_t v41 = objc_opt_class(&OBJC_CLASS___IXSPromisedInMemoryDictionary);
      uint64_t v42 = v200[2](v200, v40, v41);
      v43 = (IXSPromisedInMemoryDictionary *)objc_claimAutoreleasedReturnValue(v42);
      infoPlistIconContentPromise = self->_infoPlistIconContentPromise;
      self->_infoPlistIconContentPromise = v43;

      v45 = self->_infoPlistIconContentPromise;
      if (v45)
      {
        v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v45, "accessQueue"));
        v227[0] = _NSConcreteStackBlock;
        v227[1] = 3221225472LL;
        v227[2] = sub_1000196F8;
        v227[3] = &unk_1000CD290;
        v227[4] = self;
        v228 = v200;
        v229 = &v236;
        dispatch_sync(v46, v227);

        v39 = self;
      }

      else
      {
        v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
          objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
          sub_10007B4D4();
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
        v190 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromiseUUID](self, "iconResourcesPromiseUUID"));
        id v51 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  233LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate icon resources promise with UUID %@",  v50,  (uint64_t)v49);
        uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);

        v53 = (void *)v237[5];
        v237[5] = v52;

        v39 = self;
        -[IXSPlaceholder setInfoPlistIconContentPromiseUUID:](self, "setInfoPlistIconContentPromiseUUID:", 0LL);
      }
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](v39, "iconResourcesPromise"));
    if (v54
      && (v55 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](v39, "infoPlistIconContentPromise")),
          BOOL v56 = v55 == 0LL,
          v55,
          v54,
          v39 = v199,
          v56))
    {
      -[IXSPlaceholder setIconResourcesPromise:](v199, "setIconResourcesPromise:", 0LL);
      -[IXSPlaceholder setIconResourcesPromiseUUID:](v199, "setIconResourcesPromiseUUID:", 0LL);
      v65 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_10007B464();
      }

      id v68 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  252LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Found icon resources promise but not info plist icon content promise",  v67,  (uint64_t)v199);
      uint64_t v64 = objc_claimAutoreleasedReturnValue(v68);
    }

    else
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](v39, "iconResourcesPromise"));
      if (v57)
      {
LABEL_36:

LABEL_37:
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlementsPromiseUUID](v199, "entitlementsPromiseUUID"));

        v71 = v199;
        if (v70)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlementsPromiseUUID](v199, "entitlementsPromiseUUID"));
          uint64_t v73 = objc_opt_class(&OBJC_CLASS___IXSOwnedDataPromise);
          uint64_t v74 = v200[2](v200, v72, v73);
          uint64_t v75 = objc_claimAutoreleasedReturnValue(v74);
          entitlements = v199->_entitlements;
          v199->_entitlements = (IXSOwnedDataPromise *)v75;

          v77 = v199->_entitlements;
          if (v77)
          {
            v78 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v77, "accessQueue"));
            v224[0] = _NSConcreteStackBlock;
            v224[1] = 3221225472LL;
            v224[2] = sub_1000197A0;
            v224[3] = &unk_1000CD290;
            v224[4] = v199;
            v225 = v200;
            v226 = &v236;
            dispatch_sync(v78, v224);

            v71 = v199;
          }

          else
          {
            v79 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
              objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlementsPromiseUUID](v199, "entitlementsPromiseUUID"));
              sub_10007B3A8();
            }

            v81 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
            v191 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlementsPromiseUUID](v199, "entitlementsPromiseUUID"));
            id v83 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  262LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate entitlements promise with UUID %@",  v82,  (uint64_t)v81);
            uint64_t v84 = objc_claimAutoreleasedReturnValue(v83);

            v85 = (void *)v237[5];
            v237[5] = v84;

            v71 = v199;
            -[IXSPlaceholder setEntitlementsPromiseUUID:](v199, "setEntitlementsPromiseUUID:", 0LL);
          }
        }

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctablePromiseUUID](v71, "infoPlistLoctablePromiseUUID"));

        v87 = v199;
        if (v86)
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctablePromiseUUID](v199, "infoPlistLoctablePromiseUUID"));
          uint64_t v89 = objc_opt_class(&OBJC_CLASS___IXSOwnedDataPromise);
          uint64_t v90 = v200[2](v200, v88, v89);
          uint64_t v91 = objc_claimAutoreleasedReturnValue(v90);
          infoPlistLoctable = v199->_infoPlistLoctable;
          v199->_infoPlistLoctable = (IXSOwnedDataPromise *)v91;

          v93 = v199->_infoPlistLoctable;
          if (v93)
          {
            v94 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v93, "accessQueue"));
            v221[0] = _NSConcreteStackBlock;
            v221[1] = 3221225472LL;
            v221[2] = sub_100019848;
            v221[3] = &unk_1000CD290;
            v221[4] = v199;
            v222 = v200;
            v223 = &v236;
            dispatch_sync(v94, v221);

            v87 = v199;
          }

          else
          {
            v95 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
              objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctablePromiseUUID](v199, "infoPlistLoctablePromiseUUID"));
              sub_10007B35C();
            }

            v97 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
            v192 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctablePromiseUUID](v199, "infoPlistLoctablePromiseUUID"));
            id v99 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  281LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate loctable promise with UUID %@",  v98,  (uint64_t)v97);
            uint64_t v100 = objc_claimAutoreleasedReturnValue(v99);

            v101 = (void *)v237[5];
            v237[5] = v100;

            v87 = v199;
            -[IXSPlaceholder setInfoPlistLoctablePromiseUUID:](v199, "setInfoPlistLoctablePromiseUUID:", 0LL);
          }
        }

        v102 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromiseUUID](v87, "metadataPromiseUUID"));

        v103 = v199;
        if (v102)
        {
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromiseUUID](v199, "metadataPromiseUUID"));
          uint64_t v105 = objc_opt_class(&OBJC_CLASS___IXSPromisedInMemoryData);
          uint64_t v106 = v200[2](v200, v104, v105);
          uint64_t v107 = objc_claimAutoreleasedReturnValue(v106);
          metadataPromise = v199->_metadataPromise;
          v199->_metadataPromise = (IXSPromisedInMemoryData *)v107;

          v109 = v199->_metadataPromise;
          if (v109)
          {
            v110 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v109, "accessQueue"));
            v218[0] = _NSConcreteStackBlock;
            v218[1] = 3221225472LL;
            v218[2] = sub_1000198F0;
            v218[3] = &unk_1000CD290;
            v218[4] = v199;
            v219 = v200;
            v220 = &v236;
            dispatch_sync(v110, v218);

            v103 = v199;
          }

          else
          {
            v111 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
              objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromiseUUID](v199, "metadataPromiseUUID"));
              sub_10007B310();
            }

            v113 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
            v193 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromiseUUID](v199, "metadataPromiseUUID"));
            id v115 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  300LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate metadata promise with UUID %@",  v114,  (uint64_t)v113);
            uint64_t v116 = objc_claimAutoreleasedReturnValue(v115);

            v117 = (void *)v237[5];
            v237[5] = v116;

            v103 = v199;
            -[IXSPlaceholder setMetadataPromiseUUID:](v199, "setMetadataPromiseUUID:", 0LL);
          }
        }

        v118 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromiseUUID](v103, "sinfPromiseUUID"));

        v119 = v199;
        if (v118)
        {
          v120 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromiseUUID](v199, "sinfPromiseUUID"));
          uint64_t v121 = objc_opt_class(&OBJC_CLASS___IXSPromisedInMemoryData);
          uint64_t v122 = v200[2](v200, v120, v121);
          uint64_t v123 = objc_claimAutoreleasedReturnValue(v122);
          sinfPromise = v199->_sinfPromise;
          v199->_sinfPromise = (IXSPromisedInMemoryData *)v123;

          v125 = v199->_sinfPromise;
          if (v125)
          {
            v126 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v125, "accessQueue"));
            v215[0] = _NSConcreteStackBlock;
            v215[1] = 3221225472LL;
            v215[2] = sub_100019998;
            v215[3] = &unk_1000CD290;
            v215[4] = v199;
            v216 = v200;
            v217 = &v236;
            dispatch_sync(v126, v215);

            v119 = v199;
          }

          else
          {
            v127 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
              objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromiseUUID](v199, "sinfPromiseUUID"));
              sub_10007B310();
            }

            v129 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
            v194 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromiseUUID](v199, "sinfPromiseUUID"));
            id v131 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  319LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate metadata promise with UUID %@",  v130,  (uint64_t)v129);
            uint64_t v132 = objc_claimAutoreleasedReturnValue(v131);

            v133 = (void *)v237[5];
            v237[5] = v132;

            v119 = v199;
            -[IXSPlaceholder setSinfPromiseUUID:](v199, "setSinfPromiseUUID:", 0LL);
          }
        }

        v134 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromiseUUID](v119, "localizationDictionaryPromiseUUID"));

        v135 = v199;
        if (v134)
        {
          v136 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder localizationDictionaryPromiseUUID]( v199,  "localizationDictionaryPromiseUUID"));
          uint64_t v137 = objc_opt_class(&OBJC_CLASS___IXSPromisedInMemoryDictionary);
          uint64_t v138 = v200[2](v200, v136, v137);
          uint64_t v139 = objc_claimAutoreleasedReturnValue(v138);
          localizationDictionaryPromise = v199->_localizationDictionaryPromise;
          v199->_localizationDictionaryPromise = (IXSPromisedInMemoryDictionary *)v139;

          v141 = v199->_localizationDictionaryPromise;
          if (v141)
          {
            v142 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v141, "accessQueue"));
            v212[0] = _NSConcreteStackBlock;
            v212[1] = 3221225472LL;
            v212[2] = sub_100019A40;
            v212[3] = &unk_1000CD290;
            v212[4] = v199;
            v213 = v200;
            v214 = &v236;
            dispatch_sync(v142, v212);

            v135 = v199;
          }

          else
          {
            v143 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
            if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
              objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromiseUUID](v199, "localizationDictionaryPromiseUUID"));
              sub_10007B2C4();
            }

            v145 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
            v195 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder localizationDictionaryPromiseUUID]( v199,  "localizationDictionaryPromiseUUID"));
            id v147 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  338LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate localization dictionary promise with UUID %@",  v146,  (uint64_t)v145);
            uint64_t v148 = objc_claimAutoreleasedReturnValue(v147);

            v149 = (void *)v237[5];
            v237[5] = v148;

            v135 = v199;
            -[IXSPlaceholder setLocalizationDictionaryPromiseUUID:](v199, "setLocalizationDictionaryPromiseUUID:", 0LL);
          }
        }

        v150 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder appExtensionPlaceholdersPromiseUUIDs]( v135,  "appExtensionPlaceholdersPromiseUUIDs"));

        if (v150)
        {
          v198 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          v151 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          __int128 v210 = 0u;
          __int128 v211 = 0u;
          __int128 v208 = 0u;
          __int128 v209 = 0u;
          v152 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder appExtensionPlaceholdersPromiseUUIDs]( v199,  "appExtensionPlaceholdersPromiseUUIDs"));
          id v153 = [v152 countByEnumeratingWithState:&v208 objects:v250 count:16];
          if (v153)
          {
            uint64_t v154 = *(void *)v209;
            do
            {
              for (i = 0LL; i != v153; i = (char *)i + 1)
              {
                if (*(void *)v209 != v154) {
                  objc_enumerationMutation(v152);
                }
                v156 = *(void **)(*((void *)&v208 + 1) + 8LL * (void)i);
                uint64_t v157 = objc_opt_class(&OBJC_CLASS___IXSPlaceholder);
                uint64_t v158 = v200[2](v200, v156, v157);
                v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
                if (v159)
                {
                  -[NSMutableArray addObject:](v198, "addObject:", v159);
                  v160 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v159 accessQueue]);
                  v201[0] = _NSConcreteStackBlock;
                  v201[1] = 3221225472LL;
                  v201[2] = sub_100019AE8;
                  v201[3] = &unk_1000CD2B8;
                  id v202 = v159;
                  v161 = v200;
                  v203 = v199;
                  v206 = v161;
                  v207 = &v236;
                  v204 = v151;
                  v205 = v156;
                  dispatch_sync(v160, v201);
                }

                else
                {
                  v162 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  v163 = (os_log_s *)objc_claimAutoreleasedReturnValue(v162);
                  if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
                  {
                    v169 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
                    *(_DWORD *)buf = 136315906;
                    v243 = "-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]";
                    __int16 v244 = 2112;
                    v245 = v169;
                    __int16 v246 = 2112;
                    v247 = v156;
                    __int16 v248 = 2112;
                    uint64_t v249 = 0LL;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v163,  OS_LOG_TYPE_ERROR,  "%s: %@: Failed to locate placeholder promise with UUID %@ : %@",  buf,  0x2Au);
                  }

                  v164 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](v199, "name"));
                  id v166 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  372LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate placeholder promise with UUID %@",  v165,  (uint64_t)v164);
                  uint64_t v167 = objc_claimAutoreleasedReturnValue(v166);

                  v168 = (void *)v237[5];
                  v237[5] = v167;

                  -[NSMutableArray addObject:](v151, "addObject:", v156);
                }
              }

              id v153 = [v152 countByEnumeratingWithState:&v208 objects:v250 count:16];
            }

            while (v153);
          }

          v170 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder appExtensionPlaceholdersPromiseUUIDs]( v199,  "appExtensionPlaceholdersPromiseUUIDs"));
          id v171 = [v170 mutableCopy];

          [v171 removeObjectsInArray:v151];
          if ([v171 count])
          {
            id v172 = [v171 copy];
            -[IXSPlaceholder setAppExtensionPlaceholdersPromiseUUIDs:]( v199,  "setAppExtensionPlaceholdersPromiseUUIDs:",  v172);
          }

          else
          {
            -[IXSPlaceholder setAppExtensionPlaceholdersPromiseUUIDs:]( v199,  "setAppExtensionPlaceholdersPromiseUUIDs:",  0LL);
          }

          if (-[NSMutableArray count](v198, "count")) {
            objc_storeStrong((id *)&v199->_appExtensionPlaceholders, v198);
          }
        }

        v173 = v199;
        if (!v237[5]
          && -[IXSPlaceholder isComplete](v199, "isComplete")
          && !-[IXSOwnedDataPromise stagedPathMayNotExistWhenAwakening](v199, "stagedPathMayNotExistWhenAwakening"))
        {
          v174 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](v199, "stagedPath"));
          v175 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise targetLastPathComponent](v199, "targetLastPathComponent"));
          if (v175)
          {
            uint64_t v176 = objc_claimAutoreleasedReturnValue([v174 URLByAppendingPathComponent:v175 isDirectory:1]);

            v174 = (void *)v176;
          }

          v177 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          unsigned __int8 v178 = [v177 itemExistsAtURL:v174];

          if ((v178 & 1) == 0)
          {
            v179 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
            if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v199, "uniqueIdentifier"));
              objc_claimAutoreleasedReturnValue([v174 path]);
              sub_10007B278();
            }

            v181 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v199, "uniqueIdentifier"));
            v196 = (void *)objc_claimAutoreleasedReturnValue([v174 path]);
            id v183 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  402LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"IXSPlaceholderPromise with UUID %@ was complete but found nothing at %@",  v182,  (uint64_t)v181);
            uint64_t v184 = objc_claimAutoreleasedReturnValue(v183);

            v185 = (void *)v237[5];
            v237[5] = v184;
          }

          v173 = v199;
        }

        v186 = (void *)v237[5];
        if (a4 && v186)
        {
          *a4 = v186;
          v186 = (void *)v237[5];
          v173 = v199;
        }

        if (v186)
        {
          -[IXSPlaceholder setAwakeningError:](v173, "setAwakeningError:");
          -[IXSPlaceholder cancelForReason:client:error:](v173, "cancelForReason:client:error:", v237[5], 15LL, 0LL);
          BOOL v7 = v237[5] == 0;
          goto LABEL_102;
        }

- (void)setIcon:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_icon = &self->_icon;
  if (self->_icon != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setIcon:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting icon promise to %@",  buf,  0x20u);
    }

    if (*p_icon)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_icon, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100019D68;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_icon, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100019D7C;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setIconPromiseUUID:](self, "setIconPromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
    -[IXSPlaceholder _materializeIfReady](self, "_materializeIfReady");
  }
}

- (void)setIconResourcesPromise:(id)a3
{
  id v5 = (IXSPromisedTransferToPath *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_iconResourcesPromise = &self->_iconResourcesPromise;
  if (self->_iconResourcesPromise != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setIconResourcesPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting icon resources promise to %@",  buf,  0x20u);
    }

    if (*p_iconResourcesPromise)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_iconResourcesPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100019F98;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_iconResourcesPromise, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100019FAC;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setIconResourcesPromiseUUID:](self, "setIconResourcesPromiseUUID:", v12);
  }
}

- (void)setInfoPlistIconContentPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryDictionary *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_infoPlistIconContentPromise = &self->_infoPlistIconContentPromise;
  if (self->_infoPlistIconContentPromise != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setInfoPlistIconContentPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting Info.plist icon content promise to %@",  buf,  0x20u);
    }

    if (*p_infoPlistIconContentPromise)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_infoPlistIconContentPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001A1C8;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_infoPlistIconContentPromise, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001A1DC;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setInfoPlistIconContentPromiseUUID:](self, "setInfoPlistIconContentPromiseUUID:", v12);
  }
}

- (void)setIconResourcesPromise:(id)a3 andInfoPlistIconContentPromise:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v8);

  -[IXSPlaceholder setIconResourcesPromise:](self, "setIconResourcesPromise:", v7);
  -[IXSPlaceholder setInfoPlistIconContentPromise:](self, "setInfoPlistIconContentPromise:", v6);

  -[IXSDataPromise saveState](self, "saveState");
  -[IXSPlaceholder _materializeIfReady](self, "_materializeIfReady");
}

- (void)setMetadataPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryData *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_metadataPromise = &self->_metadataPromise;
  if (self->_metadataPromise != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setMetadataPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting metadata promise to %@",  buf,  0x20u);
    }

    if (*p_metadataPromise)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_metadataPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001A47C;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_metadataPromise, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001A490;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setMetadataPromiseUUID:](self, "setMetadataPromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
  }
}

- (void)setSinfPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryData *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_sinfPromise = &self->_sinfPromise;
  if (self->_sinfPromise != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setSinfPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting sinf promise to %@",  buf,  0x20u);
    }

    if (*p_sinfPromise)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_sinfPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001A6B4;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_sinfPromise, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001A6C8;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setSinfPromiseUUID:](self, "setSinfPromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
  }
}

- (void)setLocalizationDictionaryPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryDictionary *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_localizationDictionaryPromise = &self->_localizationDictionaryPromise;
  if (self->_localizationDictionaryPromise != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setLocalizationDictionaryPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting localization dict promise to %@",  buf,  0x20u);
    }

    if (*p_localizationDictionaryPromise)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_localizationDictionaryPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001A8EC;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_localizationDictionaryPromise, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001A900;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setLocalizationDictionaryPromiseUUID:](self, "setLocalizationDictionaryPromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
  }
}

- (void)setEntitlements:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_entitlements = &self->_entitlements;
  if (self->_entitlements != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setEntitlements:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting entitlements promise to %@",  buf,  0x20u);
    }

    if (*p_entitlements)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_entitlements, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001AB2C;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_entitlements, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001AB40;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setEntitlementsPromiseUUID:](self, "setEntitlementsPromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
    -[IXSPlaceholder _materializeIfReady](self, "_materializeIfReady");
  }
}

- (void)setInfoPlistLoctable:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  p_infoPlistLoctable = &self->_infoPlistLoctable;
  if (self->_infoPlistLoctable != v5)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSPlaceholder setInfoPlistLoctable:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting loctable promise to %@",  buf,  0x20u);
    }

    if (*p_infoPlistLoctable)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_infoPlistLoctable, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001AD6C;
      block[3] = &unk_1000CCE58;
      block[4] = self;
      dispatch_sync(v10, block);
    }

    objc_storeStrong((id *)&self->_infoPlistLoctable, a3);
    if (v5)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001AD80;
      v13[3] = &unk_1000CCCB8;
      objc_super v14 = v5;
      id v15 = self;
      dispatch_sync(v11, v13);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    -[IXSPlaceholder setInfoPlistLoctablePromiseUUID:](self, "setInfoPlistLoctablePromiseUUID:", v12);

    -[IXSDataPromise saveState](self, "saveState");
    -[IXSPlaceholder _materializeIfReady](self, "_materializeIfReady");
  }
}

- (void)setAppExtensionPlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", v7));

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v8 = (NSArray *)v4;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v36,  v47,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        objc_super v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 accessQueue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10001B130;
        block[3] = &unk_1000CD2E0;
        block[4] = v13;
        id v33 = v25;
        uint64_t v34 = self;
        id v35 = v26;
        dispatch_sync(v14, block);
      }

      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v36,  v47,  16LL);
    }

    while (v10);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v15 = self->_appExtensionPlaceholders;
  id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v46,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
        if (!-[NSArray containsObject:](v8, "containsObject:", v20))
        {
          __int16 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v20 accessQueue]);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_10001B304;
          v27[3] = &unk_1000CCE58;
          v27[4] = v20;
          dispatch_sync(v21, v27);
        }
      }

      id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v46,  16LL);
    }

    while (v17);
  }

  uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v41 = "-[IXSPlaceholder setAppExtensionPlaceholders:]";
    __int16 v42 = 2112;
    v43 = v6;
    __int16 v44 = 2112;
    v45 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting app extension placeholder promises to %@",  buf,  0x20u);
  }

  appExtensionPlaceholders = v6->_appExtensionPlaceholders;
  v6->_appExtensionPlaceholders = v8;

  -[IXSPlaceholder setAppExtensionPlaceholdersPromiseUUIDs:](v6, "setAppExtensionPlaceholdersPromiseUUIDs:", v26);
  -[IXSDataPromise saveState](v6, "saveState");
  -[IXSPlaceholder _materializeIfReady](v6, "_materializeIfReady");
}

- (void)setConfigurationComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_configurationComplete != v3)
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      id v10 = "-[IXSPlaceholder setConfigurationComplete:]";
      if (v3) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      __int16 v11 = 2112;
      id v12 = self;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting configuration complete to %c",  (uint8_t *)&v9,  0x1Cu);
    }

    self->_configurationComplete = v3;
    -[IXSDataPromise saveState](self, "saveState");
    -[IXSPlaceholder _materializeIfReady](self, "_materializeIfReady");
  }

- (void)setAttributes:(id)a3
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v6);

  if (!self->_attributes || (objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      id v10 = "-[IXSPlaceholder setAttributes:]";
      __int16 v11 = 2112;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting placeholder attributes to %@",  (uint8_t *)&v9,  0x20u);
    }

    objc_storeStrong((id *)&self->_attributes, a3);
    -[IXSDataPromise saveState](self, "saveState");
  }
}

+ (id)_metadataFromPromise:(id)a3
{
  id v3 = a3;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  __int128 v30 = sub_100019590;
  __int128 v31 = sub_1000195A0;
  id v32 = 0LL;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 accessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B850;
  block[3] = &unk_1000CCEF8;
  uint64_t v26 = &v27;
  id v5 = v3;
  id v25 = v5;
  dispatch_sync(v4, block);

  if (!v28[5])
  {
    id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
      sub_10007B56C(v17, buf, v16);
    }

    id v7 = 0LL;
    id v11 = 0LL;
    goto LABEL_13;
  }

  id v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___MIStoreMetadata),  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  uint64_t v9 = v28[5];
  id v23 = 0LL;
  id v10 = -[NSKeyedUnarchiver initForReadingFromData:error:](v8, "initForReadingFromData:error:", v9, &v23);
  id v11 = v23;
  if (!v10)
  {
    uint64_t v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
      sub_10007B5D0(v19, (uint64_t)v11, buf);
    }

- (MIStoreMetadata)metadata
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromise](self, "metadataPromise"));
  if (v4)
  {
    id v5 = [(id)objc_opt_class(self) _metadataFromPromise:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return (MIStoreMetadata *)v6;
}

- (NSData)sinfData
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100019590;
  uint64_t v18 = sub_1000195A0;
  id v19 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 accessQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001BAF4;
    v13[3] = &unk_1000CCEF8;
    void v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(v6, v13);

    if (!v15[5])
    {
      id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
        *(_DWORD *)buf = 136315394;
        id v21 = "-[IXSPlaceholder sinfData]";
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: No data on the sinf promise %@",  buf,  0x16u);
      }
    }
  }

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSData *)v11;
}

- (NSDictionary)localizationDictionary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100019590;
  uint64_t v18 = sub_1000195A0;
  id v19 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 accessQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001BD48;
    v13[3] = &unk_1000CCEF8;
    void v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(v6, v13);

    if (!v15[5])
    {
      id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
        *(_DWORD *)buf = 136315394;
        id v21 = "-[IXSPlaceholder localizationDictionary]";
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: No dictionary on the localization dict promise %@",  buf,  0x16u);
      }
    }
  }

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSDictionary *)v11;
}

- (BOOL)_isReadyToMaterialize
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise error](self, "error"));
  if (v4)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10007B700(self);
    }
LABEL_25:
    BOOL v27 = 0;
    goto LABEL_26;
  }

  if (!-[IXSPlaceholder configurationComplete](self, "configurationComplete"))
  {
    __int128 v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10007B674(self);
    }
    goto LABEL_25;
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  id v6 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[os_log_s accessQueue](v7, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C2E0;
  block[3] = &unk_1000CD308;
  uint64_t v9 = v6;
  __int16 v44 = self;
  v45 = &v46;
  v43 = v9;
  dispatch_sync(v8, block);

  LOBYTE(v8) = *((_BYTE *)v47 + 24) == 0;
  _Block_object_dispose(&v46, 8);
  if ((v8 & 1) != 0)
  {
    BOOL v27 = 0;
    id v6 = v9;
  }

  else
  {
LABEL_7:
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
    if (v30)
    {
      uint64_t v46 = 0LL;
      v47 = &v46;
      uint64_t v48 = 0x2020000000LL;
      char v49 = 0;
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v30 accessQueue]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10001C370;
      v38[3] = &unk_1000CD308;
      v40 = self;
      uint64_t v41 = &v46;
      id v39 = v30;
      dispatch_sync(v10, v38);

      BOOL v11 = *((_BYTE *)v47 + 24) == 0;
      _Block_object_dispose(&v46, 8);
      if (v11) {
        goto LABEL_27;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements", v30));

    if (v12)
    {
      uint64_t v46 = 0LL;
      v47 = &v46;
      uint64_t v48 = 0x2020000000LL;
      char v49 = 0;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 accessQueue]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10001C400;
      v37[3] = &unk_1000CD080;
      v37[4] = self;
      v37[5] = &v46;
      dispatch_sync(v14, v37);

      int v15 = *((unsigned __int8 *)v47 + 24);
      _Block_object_dispose(&v46, 8);
      if (!v15) {
        goto LABEL_27;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));

    if (!v16) {
      goto LABEL_13;
    }
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    char v49 = 0;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 accessQueue]);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10001C498;
    v36[3] = &unk_1000CD080;
    v36[4] = self;
    v36[5] = &v46;
    dispatch_sync(v18, v36);

    int v19 = *((unsigned __int8 *)v47 + 24);
    _Block_object_dispose(&v46, 8);
    if (!v19)
    {
LABEL_27:
      BOOL v27 = 0;
    }

    else
    {
LABEL_13:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));

      if (v20)
      {
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
        id v22 = [v21 countByEnumeratingWithState:&v32 objects:v50 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v33;
          while (2)
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v21);
              }
              id v25 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
              uint64_t v46 = 0LL;
              v47 = &v46;
              uint64_t v48 = 0x2020000000LL;
              char v49 = 0;
              uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v25 accessQueue]);
              v31[0] = _NSConcreteStackBlock;
              v31[1] = 3221225472LL;
              v31[2] = sub_10001C530;
              v31[3] = &unk_1000CD308;
              v31[5] = self;
              v31[6] = &v46;
              v31[4] = v25;
              dispatch_sync(v26, v31);

              LODWORD(v25) = *((unsigned __int8 *)v47 + 24);
              _Block_object_dispose(&v46, 8);
              if (!(_DWORD)v25)
              {
                BOOL v27 = 0;
                goto LABEL_30;
              }
            }

            id v22 = [v21 countByEnumeratingWithState:&v32 objects:v50 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        BOOL v27 = 1;
LABEL_30:
      }

      else
      {
        BOOL v27 = 1;
      }
    }
  }

- (void)_materializeIfReady
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[IXSPlaceholder _isReadyToMaterialize](self, "_isReadyToMaterialize"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));

    if (!v4)
    {
      if (-[IXSPlaceholder _materialize](self, "_materialize"))
      {
        uint64_t v5 = objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegate](self, "delegate"));
        id v6 = (void *)v5;
        if (v5)
        {
          if ((objc_opt_respondsToSelector(v5, "promiseDidComplete:") & 1) != 0)
          {
            id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
            v8[0] = _NSConcreteStackBlock;
            v8[1] = 3221225472LL;
            v8[2] = sub_10001C6B0;
            v8[3] = &unk_1000CCCB8;
            id v9 = v6;
            id v10 = self;
            sub_10005A8F0(v7, v8);
          }
        }
      }
    }
  }

- (BOOL)isComplete
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[IXSPlaceholder _isReadyToMaterialize](self, "_isReadyToMaterialize")) {
    return 0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (void)setComplete:(BOOL)a3
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_V2(v3);
}

- (double)percentComplete
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise error](self, "error"));
  double v5 = 0.0;
  if (!v4 && -[IXSPlaceholder configurationComplete](self, "configurationComplete"))
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
    id v6 = v28;
    if (v28 || (id v6 = v27) != 0LL)
    {
      id v7 = v6;
      uint64_t v42 = 0LL;
      v43 = (double *)&v42;
      uint64_t v44 = 0x2020000000LL;
      uint64_t v45 = 0LL;
      int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001CB58;
      block[3] = &unk_1000CCEF8;
      uint64_t v41 = &v42;
      id v25 = v7;
      id v40 = v25;
      dispatch_sync(v8, block);

      double v9 = v43[3];
      double v10 = v9 + 0.0;
      _Block_object_dispose(&v42, 8);
      BOOL v11 = -[IXSPlaceholder entitlements](self, "entitlements", v25);
    }

    else
    {
      double v10 = 0.300000012;
      BOOL v11 = -[IXSPlaceholder entitlements](self, "entitlements", 0LL);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      uint64_t v42 = 0LL;
      v43 = (double *)&v42;
      uint64_t v44 = 0x2020000000LL;
      uint64_t v45 = 0LL;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
      uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 accessQueue]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10001CB94;
      v38[3] = &unk_1000CCEF8;
      void v38[4] = self;
      v38[5] = &v42;
      dispatch_sync(v14, v38);

      double v15 = v43[3];
      _Block_object_dispose(&v42, 8);
    }

    else
    {
      double v15 = 0.200000003;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));

    if (v16)
    {
      uint64_t v42 = 0LL;
      v43 = (double *)&v42;
      uint64_t v44 = 0x2020000000LL;
      uint64_t v45 = 0LL;
      uint64_t v34 = 0LL;
      __int128 v35 = (double *)&v34;
      uint64_t v36 = 0x2020000000LL;
      uint64_t v37 = 0LL;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
      id v18 = [v17 countByEnumeratingWithState:&v30 objects:v46 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v21 accessQueue]);
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472LL;
            v29[2] = sub_10001CBE8;
            v29[3] = &unk_1000CD330;
            v29[4] = v21;
            v29[5] = &v42;
            v29[6] = &v34;
            dispatch_sync(v22, v29);
          }

          id v18 = [v17 countByEnumeratingWithState:&v30 objects:v46 count:16];
        }

        while (v18);
      }

      double v23 = v43[3] / v35[3] * 0.5;
      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v42, 8);
    }

    else
    {
      double v23 = 0.5;
    }

    if (v10 + v15 + v23 <= 1.0) {
      double v5 = v10 + v15 + v23;
    }
    else {
      double v5 = 1.0;
    }
  }

  return v5;
}

- (void)setPercentComplete:(double)a3
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_V2(v3);
}

- (void)_cancelPromise:(id)a3 forReason:(id)a4 client:(unint64_t)a5
{
  id v9 = a3;
  id v7 = a4;
  if (v9)
  {
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CD24;
    block[3] = &unk_1000CD358;
    id v11 = v9;
    id v12 = v7;
    unint64_t v13 = a5;
    dispatch_sync(v8, block);
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    uint64_t v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10007BA80();
    }

    uint64_t v29 = @"Reason passed to -[IXSPlaceholder cancelForReason:] was nil";
    uint64_t v30 = 1059LL;
LABEL_20:
    id v33 = sub_10003556C( (uint64_t)"-[IXSPlaceholder cancelForReason:client:error:]",  v30,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  v29,  v28,  v35);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v33);
    BOOL v24 = 0;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  if (!a4)
  {
    __int128 v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10007BAF0();
    }

    uint64_t v29 = @"Client passed to -[IXSPlaceholder cancelForReason:] was IXClientNone (0)";
    uint64_t v30 = 1064LL;
    goto LABEL_20;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v10, v8, a4);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v11, v8, a4);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](self, "infoPlistIconContentPromise"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v12, v8, a4);

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v13, v8, a4);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v14, v8, a4);

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromise](self, "metadataPromise"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v15, v8, a4);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v16, v8, a4);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
  -[IXSPlaceholder _cancelPromise:forReason:client:](self, "_cancelPromise:forReason:client:", v17, v8, a4);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
  if (v18)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
    id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          -[IXSPlaceholder _cancelPromise:forReason:client:]( self,  "_cancelPromise:forReason:client:",  *(void *)(*((void *)&v38 + 1) + 8LL * (void)i),  v8,  a4);
        }

        id v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }

      while (v21);
    }
  }

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___IXSPlaceholder;
  id v37 = 0LL;
  BOOL v24 = -[IXSOwnedDataPromise cancelForReason:client:error:](&v36, "cancelForReason:client:error:", v8, a4, &v37);
  id v25 = v37;
  if (a5)
  {
LABEL_21:
    if (!v24) {
      *a5 = v25;
    }
  }

- (NSString)bundleName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleName]);
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (NSString)bundleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (unint64_t)installType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = [v2 installType];

  return (unint64_t)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  unint64_t v23 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  sub_10001D410(v4, (uint64_t)&v23);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
  sub_10001D410(v5, (uint64_t)&v23);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](self, "infoPlistIconContentPromise"));
  sub_10001D410(v6, (uint64_t)&v23);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  sub_10001D410(v7, (uint64_t)&v23);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
  sub_10001D410(v8, (uint64_t)&v23);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromise](self, "metadataPromise"));
  sub_10001D410(v9, (uint64_t)&v23);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
  sub_10001D410(v10, (uint64_t)&v23);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
  sub_10001D410(v11, (uint64_t)&v23);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
  if (v12)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders", 0LL));
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          sub_10001D410(*(void **)(*((void *)&v19 + 1) + 8LL * (void)v17), (uint64_t)&v23);
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v15);
    }
  }

  return v23;
}

- (id)_promiseUUIDsForPromise:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_100019590;
  id v17 = sub_1000195A0;
  id v18 = 0LL;
  if (v3)
  {
    double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 accessQueue]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001D5C4;
    v10[3] = &unk_1000CCEF8;
    id v12 = &v13;
    id v11 = v4;
    dispatch_sync(v5, v10);

    id v6 = v11;
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)subPromiseUUIDs
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v5));
  -[NSMutableSet unionSet:](v4, "unionSet:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v7));
  -[NSMutableSet unionSet:](v4, "unionSet:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](self, "infoPlistIconContentPromise"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v9));
  -[NSMutableSet unionSet:](v4, "unionSet:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v11));
  -[NSMutableSet unionSet:](v4, "unionSet:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v13));
  -[NSMutableSet unionSet:](v4, "unionSet:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromise](self, "metadataPromise"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v15));
  -[NSMutableSet unionSet:](v4, "unionSet:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v17));
  -[NSMutableSet unionSet:](v4, "unionSet:", v18);

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder _promiseUUIDsForPromise:](self, "_promiseUUIDsForPromise:", v19));
  -[NSMutableSet unionSet:](v4, "unionSet:", v20);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
  if (v21)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders", 0LL));
    id v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0LL;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( -[IXSPlaceholder _promiseUUIDsForPromise:]( self,  "_promiseUUIDsForPromise:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v26)));
          -[NSMutableSet unionSet:](v4, "unionSet:", v27);

          uint64_t v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v24);
    }
  }

  id v28 = -[NSMutableSet copy](v4, "copy");

  return v28;
}

- (void)_decommissionPromise:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D9E4;
    block[3] = &unk_1000CCE58;
    id v7 = v5;
    dispatch_sync(v4, block);

    id v3 = v5;
  }
}

- (void)decommission
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](self, "infoPlistIconContentPromise"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder metadataPromise](self, "metadataPromise"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v9);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder sinfPromise](self, "sinfPromise"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionaryPromise](self, "localizationDictionaryPromise"));
  -[IXSPlaceholder _decommissionPromise:](self, "_decommissionPromise:", v11);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[IXSPlaceholder _decommissionPromise:]( self,  "_decommissionPromise:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v16));
        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IXSPlaceholder;
  -[IXSOwnedDataPromise decommission](&v17, "decommission");
}

- (BOOL)_validateClientEntitlements:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 accessQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedPath]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v8,  0LL));
  double v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"com.apple.private.webkit.pushbundle"]);
  unsigned __int8 v12 = sub_100072D10(v11, 0LL);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  id v15 = v13;
  if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if ((v12 & 1) == 0 && ![v16 isEqualToString:@"com.apple.WebKit.PushBundles"]
    || -[IXSPlaceholder creatorHadWebPlaceholderInstallEntitlement](self, "creatorHadWebPlaceholderInstallEntitlement"))
  {

LABEL_9:
    id v17 = 0LL;
    BOOL v18 = 1;
    goto LABEL_10;
  }

  __int128 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10007BB60(self, v21);
  }

  __int128 v22 = IXStringForClientID(-[IXSDataPromise creatorIdentifier](self, "creatorIdentifier"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v25 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _validateClientEntitlements:]",  1228LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"The creator of placeholder %@ is missing the entitlement %@ = TRUE which is required to create a web notification placeholder.",  v24,  (uint64_t)v23);
  id v17 = (id)objc_claimAutoreleasedReturnValue(v25);

  if (a3)
  {
    id v17 = v17;
    BOOL v18 = 0;
    *a3 = v17;
  }

  else
  {
    BOOL v18 = 0;
  }

- (BOOL)_materialize
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder icon](self, "icon"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder iconResourcesPromise](self, "iconResourcesPromise"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](self, "infoPlistIconContentPromise"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  unsigned __int8 v6 = [v5 isAppExtension];

  if ((v6 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.appex", v7));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleName](self, "bundleName"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByTrimmingCharactersInSet:v10]);

    if (![v11 length])
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));

      id v11 = (void *)v12;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@"/" withString:@":"]);

    uint64_t v14 = v13;
    if (strlen((const char *)-[__CFString fileSystemRepresentation](v14, "fileSystemRepresentation")) - 251 <= 0xFFFFFFFFFFFFFF00LL)
    {
      id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007BD4C();
      }

      CFStringRef v17 = sub_100011BA8(v14, 250LL);
      uint64_t v14 = (__CFString *)v17;
      if (!v17) {
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.app", v14));
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagingBaseDir](self, "stagingBaseDir"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 URLByAppendingPathComponent:v8 isDirectory:1]);

  uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:@"Info.plist" isDirectory:0]);
  v93 = (void *)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:@"Icon.png" isDirectory:0]);
  v94 = (void *)objc_claimAutoreleasedReturnValue( [v19 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);
  v92 = (void *)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0]);
  __int128 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagingBaseDir](self, "stagingBaseDir"));
    id v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v22 path]);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[IXSPlaceholder _materialize]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v158 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Materializing placeholder at %@",  buf,  0x20u);
  }

  id v149 = 0LL;
  unsigned __int8 v24 = [v4 createDirectoryAtURL:v19 withIntermediateDirectories:1 mode:493 class:4 error:&v149];
  id v25 = v149;
  if ((v24 & 1) == 0)
  {
    __int128 v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10007BCB4(v19, (uint64_t)v25, v32);
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    id v35 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _materialize]",  1292LL,  @"IXErrorDomain",  0x14uLL,  v25,  0LL,  @"Failed to create bundle directory at %@",  v34,  (uint64_t)v33);
    id v36 = (id)objc_claimAutoreleasedReturnValue(v35);
    __int128 v30 = 0LL;
    goto LABEL_38;
  }

  if (v97)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v158 = sub_100019590;
    v159 = sub_1000195A0;
    id v160 = 0LL;
    uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v96 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001EF24;
    block[3] = &unk_1000CCEF8;
    uint64_t v148 = buf;
    id v147 = v96;
    dispatch_sync(v26, block);

    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      BOOL v27 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v151 = 136315650;
        *(void *)&v151[4] = "-[IXSPlaceholder _materialize]";
        *(_WORD *)&v151[12] = 2112;
        *(void *)&v151[14] = self;
        *(_WORD *)&v151[22] = 2112;
        v152 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Using Info.plist icon content: %@",  v151,  0x20u);
      }

      __int128 v30 = (NSMutableDictionary *)[*(id *)(*(void *)&buf[8] + 40) mutableCopy];
    }

    else
    {
      __int128 v30 = 0LL;
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    __int128 v30 = 0LL;
  }

  if (v95)
  {
    uint64_t v155 = _kCFBundleIconFileKey;
    v156 = @"Icon";
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v156,  &v155,  1LL));
    __int128 v38 = (NSMutableDictionary *)[v37 mutableCopy];

    __int128 v30 = v38;
  }

  if (!v30) {
    __int128 v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v39, kCFBundleIdentifierKey);

  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleName](self, "bundleName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v40, kCFBundleNameKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  @"Executable",  kCFBundleExecutableKey);
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleName](self, "bundleName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v41,  _kCFBundleDisplayNameKey);

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder attributes](self, "attributes"));
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder attributes](self, "attributes"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 infoPlistContent]);
    -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v44);
  }

  id v145 = v25;
  unsigned __int8 v45 = -[NSMutableDictionary IX_writeToURL:format:options:error:]( v30,  "IX_writeToURL:format:options:error:",  v98,  200LL,  1LL,  &v145);
  id v46 = v145;

  if ((v45 & 1) == 0)
  {
    char v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10007BC1C(v98, (uint64_t)v46, v50);
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v98 path]);
    id v52 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _materialize]",  1327LL,  @"IXErrorDomain",  0x14uLL,  v46,  0LL,  @"Failed to write bundle Info.plist to %@",  v51,  (uint64_t)v33);
    id v36 = (id)objc_claimAutoreleasedReturnValue(v52);
    id v25 = v46;
LABEL_38:

    goto LABEL_39;
  }

  if (v97)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v158 = sub_100019590;
    v159 = sub_1000195A0;
    id v160 = 0LL;
    v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v97 accessQueue]);
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472LL;
    v139[2] = sub_10001EF5C;
    v139[3] = &unk_1000CD380;
    id v140 = v97;
    id v141 = v4;
    v144 = buf;
    id v142 = v19;
    v143 = self;
    dispatch_sync(v47, v139);

    uint64_t v48 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v48)
    {
      id v36 = v48;
    }

    else
    {
      id v36 = v46;
    }

    _Block_object_dispose(buf, 8);
    if (!v48) {
      goto LABEL_51;
    }
LABEL_39:
    v53 = 0LL;
    goto LABEL_40;
  }

  if (v95)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v158 = sub_100019590;
    v159 = sub_1000195A0;
    id v160 = 0LL;
    BOOL v56 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v95 accessQueue]);
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472LL;
    v133[2] = sub_10001F418;
    v133[3] = &unk_1000CD3A8;
    id v134 = v95;
    id v135 = v4;
    id v136 = v93;
    uint64_t v137 = self;
    uint64_t v138 = buf;
    dispatch_sync(v56, v133);

    v57 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v57)
    {
      id v36 = v57;
    }

    else
    {
      id v36 = v46;
    }

    _Block_object_dispose(buf, 8);
    if (!v57) {
      goto LABEL_51;
    }
    goto LABEL_39;
  }

  id v36 = v46;
LABEL_51:
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));

  if (v58)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v158 = sub_100019590;
    v159 = sub_1000195A0;
    id v160 = 0LL;
    BOOL v59 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder entitlements](self, "entitlements"));
    v60 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v59 accessQueue]);
    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472LL;
    v128[2] = sub_10001F748;
    v128[3] = &unk_1000CD3A8;
    v128[4] = self;
    id v129 = v4;
    id v130 = v94;
    id v36 = v36;
    id v131 = v36;
    uint64_t v132 = buf;
    dispatch_sync(v60, v128);

    v61 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v61)
    {
      id v62 = v61;

      id v36 = v62;
    }

    _Block_object_dispose(buf, 8);
    if (v61) {
      goto LABEL_39;
    }
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistLoctable](self, "infoPlistLoctable"));
  v53 = v63;
  if (!v63) {
    goto LABEL_60;
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v158 = sub_100019590;
  v159 = sub_1000195A0;
  id v160 = 0LL;
  uint64_t v64 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v63 accessQueue]);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472LL;
  v122[2] = sub_10001FAF4;
  v122[3] = &unk_1000CD3A8;
  id v123 = v4;
  id v65 = v53;
  id v124 = v65;
  id v125 = v92;
  v126 = self;
  v127 = buf;
  dispatch_sync(v64, v122);

  v66 = *(void **)(*(void *)&buf[8] + 40LL);
  if (v66)
  {
    id v67 = v66;

    id v36 = v67;
  }

  _Block_object_dispose(buf, 8);
  if (v66)
  {
    v53 = v65;
  }

  else
  {
LABEL_60:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v158 = sub_100019590;
    v159 = sub_1000195A0;
    id v160 = 0LL;
    id v68 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder localizationDictionary](self, "localizationDictionary"));
    uint64_t v69 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = v68;
      v72 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v68 allKeys]);
      *(_DWORD *)v151 = 136315650;
      *(void *)&v151[4] = "-[IXSPlaceholder _materialize]";
      *(_WORD *)&v151[12] = 2112;
      *(void *)&v151[14] = self;
      *(_WORD *)&v151[22] = 2112;
      v152 = v72;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Including lproj localizations for %@",  v151,  0x20u);

      id v68 = v71;
    }

    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472LL;
    v117[2] = sub_10001FE10;
    v117[3] = &unk_1000CD3D0;
    id v91 = v19;
    id v118 = v91;
    id v90 = v4;
    id v119 = v90;
    v120 = buf;
    BOOL v121 = v53 != 0LL;
    [v68 enumerateKeysAndObjectsUsingBlock:v117];
    uint64_t v73 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v73)
    {
      id v74 = v73;

      id v36 = v74;
    }

    _Block_object_dispose(buf, 8);
    if (!v73)
    {
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
      if ([v75 isAppExtension])
      {
      }

      else
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
        BOOL v77 = [v76 count] == 0;

        if (!v77)
        {
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          uint64_t v158 = sub_100019590;
          v159 = sub_1000195A0;
          id v160 = 0LL;
          *(void *)v151 = 0LL;
          *(void *)&v151[8] = v151;
          *(void *)&v151[16] = 0x3032000000LL;
          v152 = sub_100019590;
          id v153 = sub_1000195A0;
          id v154 = 0LL;
          __int128 v113 = 0u;
          __int128 v114 = 0u;
          __int128 v115 = 0u;
          __int128 v116 = 0u;
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder appExtensionPlaceholders](self, "appExtensionPlaceholders"));
          id v79 = [v78 countByEnumeratingWithState:&v113 objects:v150 count:16];
          if (v79)
          {
            id obj = v78;
            v87 = v4;
            uint64_t v88 = *(void *)v114;
LABEL_70:
            uint64_t v80 = 0LL;
            id v86 = v79;
            while (1)
            {
              if (*(void *)v114 != v88) {
                objc_enumerationMutation(obj);
              }
              v81 = *(void **)(*((void *)&v113 + 1) + 8 * v80);
              uint64_t v107 = 0LL;
              v108 = &v107;
              uint64_t v109 = 0x3032000000LL;
              v110 = sub_100019590;
              v111 = sub_1000195A0;
              id v112 = 0LL;
              uint64_t v82 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v81 accessQueue]);
              v99[0] = _NSConcreteStackBlock;
              v99[1] = 3221225472LL;
              v99[2] = sub_100020098;
              v99[3] = &unk_1000CD3F8;
              v99[4] = v81;
              v104 = v151;
              id v100 = v91;
              uint64_t v105 = buf;
              uint64_t v106 = &v107;
              id v101 = v90;
              v102 = self;
              id v36 = v36;
              id v103 = v36;
              dispatch_sync(v82, v99);

              id v4 = v87;
              id v83 = (void *)v108[5];
              if (v83)
              {
                id v84 = v83;

                int v89 = 2;
                id v36 = v84;
              }

              else
              {
                int v89 = 0;
              }

              _Block_object_dispose(&v107, 8);
              if (v83) {
                break;
              }
              if (v86 == (id)++v80)
              {
                id v79 = [obj countByEnumeratingWithState:&v113 objects:v150 count:16];
                if (v79) {
                  goto LABEL_70;
                }
                int v89 = 0;
                break;
              }
            }

            v78 = obj;
          }

          else
          {
            int v89 = 0;
          }

          _Block_object_dispose(v151, 8);
          _Block_object_dispose(buf, 8);

          if (v89) {
            goto LABEL_40;
          }
        }
      }

      -[IXSOwnedDataPromise setStagedPath:](self, "setStagedPath:", v91);
      char v54 = 1;
      goto LABEL_41;
    }
  }

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
  id v7 = IXStringForClientID(-[IXSDataPromise creatorIdentifier](self, "creatorIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@(%p) Name:%@ Creator:%@ UUID:%@>",  v5,  self,  v6,  v8,  v9));

  return (NSString *)v10;
}

- (void)promiseDidBegin:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_not_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000207B0;
  v6[3] = &unk_1000CCE58;
  v6[4] = self;
  sub_10005A8F0(v5, v6);
}

- (void)promiseDidComplete:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_not_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100020910;
  v6[3] = &unk_1000CCE58;
  v6[4] = self;
  sub_10005A8F0(v5, v6);
}

- (void)promiseDidReset:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3));
  dispatch_assert_queue_not_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002099C;
  v6[3] = &unk_1000CCE58;
  v6[4] = self;
  sub_10005A8F0(v5, v6);
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3, a4));
  dispatch_assert_queue_not_V2(v5);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020AE4;
  v7[3] = &unk_1000CCE58;
  v7[4] = self;
  sub_10005A8F0(v6, v7);
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100020CA4;
  v14[3] = &unk_1000CD1C8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a5;
  id v12 = v9;
  id v13 = v8;
  sub_10005A8F0(v11, v14);
}

- (NSUUID)iconPromiseUUID
{
  return self->_iconPromiseUUID;
}

- (void)setIconPromiseUUID:(id)a3
{
}

- (NSUUID)iconResourcesPromiseUUID
{
  return self->_iconResourcesPromiseUUID;
}

- (void)setIconResourcesPromiseUUID:(id)a3
{
}

- (NSUUID)infoPlistIconContentPromiseUUID
{
  return self->_infoPlistIconContentPromiseUUID;
}

- (void)setInfoPlistIconContentPromiseUUID:(id)a3
{
}

- (NSUUID)entitlementsPromiseUUID
{
  return self->_entitlementsPromiseUUID;
}

- (void)setEntitlementsPromiseUUID:(id)a3
{
}

- (NSUUID)infoPlistLoctablePromiseUUID
{
  return self->_infoPlistLoctablePromiseUUID;
}

- (void)setInfoPlistLoctablePromiseUUID:(id)a3
{
}

- (NSUUID)metadataPromiseUUID
{
  return self->_metadataPromiseUUID;
}

- (void)setMetadataPromiseUUID:(id)a3
{
}

- (NSUUID)sinfPromiseUUID
{
  return self->_sinfPromiseUUID;
}

- (void)setSinfPromiseUUID:(id)a3
{
}

- (NSArray)appExtensionPlaceholdersPromiseUUIDs
{
  return self->_appExtensionPlaceholdersPromiseUUIDs;
}

- (void)setAppExtensionPlaceholdersPromiseUUIDs:(id)a3
{
}

- (NSUUID)localizationDictionaryPromiseUUID
{
  return self->_localizationDictionaryPromiseUUID;
}

- (void)setLocalizationDictionaryPromiseUUID:(id)a3
{
}

- (BOOL)sentDidBegin
{
  return self->_sentDidBegin;
}

- (void)setSentDidBegin:(BOOL)a3
{
  self->_sentDidBegin = a3;
}

- (BOOL)configurationComplete
{
  return self->_configurationComplete;
}

- (IXSOwnedDataPromise)icon
{
  return self->_icon;
}

- (IXSPromisedTransferToPath)iconResourcesPromise
{
  return self->_iconResourcesPromise;
}

- (IXSPromisedInMemoryDictionary)infoPlistIconContentPromise
{
  return self->_infoPlistIconContentPromise;
}

- (IXSOwnedDataPromise)entitlements
{
  return self->_entitlements;
}

- (IXSOwnedDataPromise)infoPlistLoctable
{
  return self->_infoPlistLoctable;
}

- (NSArray)appExtensionPlaceholders
{
  return self->_appExtensionPlaceholders;
}

- (IXPlaceholderAttributes)attributes
{
  return self->_attributes;
}

- (IXSPromisedInMemoryData)metadataPromise
{
  return self->_metadataPromise;
}

- (IXSPromisedInMemoryData)sinfPromise
{
  return self->_sinfPromise;
}

- (IXSPromisedInMemoryDictionary)localizationDictionaryPromise
{
  return self->_localizationDictionaryPromise;
}

- (NSError)awakeningError
{
  return self->_awakeningError;
}

- (void)setAwakeningError:(id)a3
{
}

- (BOOL)creatorHadWebPlaceholderInstallEntitlement
{
  return self->_creatorHadWebPlaceholderInstallEntitlement;
}

- (void).cxx_destruct
{
}

- (void)_remote_setMetadataPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, id))a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v11);

  if (v8)
  {
    uint64_t v54 = 0LL;
    v55 = &v54;
    uint64_t v56 = 0x2020000000LL;
    char v57 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class(IXSPromisedInMemoryData)];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100021774;
      block[3] = &unk_1000CCEF8;
      v53 = &v54;
      id v16 = v14;
      id v52 = v16;
      dispatch_sync(v15, block);

      if (*((_BYTE *)v55 + 24))
      {
        id v17 = [(id)objc_opt_class(self) _metadataFromPromise:v16];
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        __int128 v19 = v18;
        if (v18)
        {
          id v50 = 0LL;
          id v20 = sub_10000C700(v18, v9, @"placeholder metadata", &v50);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = v50;
          if (v21)
          {
            if (([v21 isEqual:v19] & 1) == 0)
            {
              id v49 = v22;
              id v23 = sub_100035028(v21, &v49);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v23);
              id v24 = v49;

              if (v43)
              {
                id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 accessQueue]);
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472LL;
                v47[2] = sub_1000217A4;
                v47[3] = &unk_1000CCE58;
                id v42 = v16;
                id v48 = v42;
                dispatch_sync(v25, v47);

                uint64_t v26 = objc_alloc(&OBJC_CLASS___IXSPromisedInMemoryData);
                id v46 = v24;
                id v16 = (id)objc_claimAutoreleasedReturnValue( -[IXSPromisedInMemoryData updatedPromiseWithData:error:]( v26,  "updatedPromiseWithData:error:",  v43,  &v46));
                id v22 = v46;

                if (v16)
                {

                  goto LABEL_10;
                }
              }

              else
              {
                id v22 = v24;
              }

              id v28 = v43;
              goto LABEL_27;
            }

- (void)_remote_getMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  unsigned __int8 v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000218C0;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setSinfPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  if (!v6)
  {
    id v11 = 0LL;
    goto LABEL_7;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class(IXSOwnedDataPromise)];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
LABEL_7:
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100021AA4;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v19 = v11;
    id v16 = v11;
    dispatch_sync(v17, block);

    v7[2](v7, 0LL);
    goto LABEL_8;
  }

  id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10007C138();
  }

  id v15 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setSinfPromiseUUID:completion:]",  1738LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find sinf promise with UUID %@",  v14,  (uint64_t)v6);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  ((void (**)(id, id))v7)[2](v7, v16);
LABEL_8:
}

- (void)_remote_getSinfDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021BB8;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setLaunchProhibited:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100021CA4;
  v9[3] = &unk_1000CD420;
  v9[4] = self;
  BOOL v10 = a3;
  dispatch_sync(v8, v9);

  v6[2](v6, 0LL);
}

- (void)_remote_getLaunchProhibitedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021E08;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021F20;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_sync(v9, block);

  v7[2](v7, 0LL);
}

- (void)_remote_getAttributesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022034;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIconPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class(IXSOwnedDataPromise)];
  char v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100022218;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v19 = v11;
    dispatch_sync(v12, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007C1A8();
    }

    id v16 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconPromiseUUID:completion:]",  1820LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find icon promise with UUID %@",  v15,  (uint64_t)v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)_remote_hasIconPromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022310;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getIconPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022458;
  v7[3] = &unk_1000CD080;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIconResourcesPromiseUUID:(id)a3 infoPlistIconContentPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  char v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class(IXSPromisedTransferToPath)];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    id v16 = [v15 promiseForUUID:v9 ofType:objc_opt_class(IXSPromisedInMemoryDictionary)];
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);

    if (v17)
    {
      BOOL v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000227CC;
      block[3] = &unk_1000CCF90;
      void block[4] = self;
      id v29 = v14;
      id v17 = v17;
      id v30 = v17;
      dispatch_sync(v18, block);

      v10[2](v10, 0LL);
    }

    else
    {
      id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10007C288();
      }

      id v26 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconResourcesPromiseUUID:infoPlistIconConte ntPromiseUUID:completion:]",  1873LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find Info.plist icon content promise with UUID %@",  v25,  (uint64_t)v9);
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      ((void (**)(id, void *))v10)[2](v10, v27);
    }
  }

  else
  {
    id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10007C218();
    }

    id v22 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconResourcesPromiseUUID:infoPlistIconContent PromiseUUID:completion:]",  1866LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find icon resources promise with UUID %@",  v21,  (uint64_t)v8);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v22);
    ((void (**)(id, id))v10)[2](v10, v17);
  }
}

- (void)_remote_hasIconResourcesPromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000228CC;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getIconResourcesPromiseAndInfoPlistContent:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100019590;
  BOOL v18 = sub_1000195A0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022A5C;
  block[3] = &unk_1000CD448;
  void block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5], 0LL);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (void)_remote_setLocalizationPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class(IXSPromisedInMemoryDictionary)];
  char v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100022DC0;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v19 = v11;
    dispatch_sync(v12, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007C2F8();
    }

    id v16 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setLocalizationPromiseUUID:completion:]",  1931LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find localization dictionary promise with UUID %@",  v15,  (uint64_t)v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)_remote_getLocalizationDictionary:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022ED4;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setEntitlementsPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class(IXSOwnedDataPromise)];
  char v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000230B8;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v19 = v11;
    dispatch_sync(v12, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007C368();
    }

    id v16 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setEntitlementsPromiseUUID:completion:]",  1961LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find entitlements promise with UUID %@",  v15,  (uint64_t)v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)_remote_hasEntitlementsPromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000231B0;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getEntitlementsPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000232F8;
  v7[3] = &unk_1000CD080;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setInfoPlistLoctablePromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class(IXSOwnedDataPromise)];
  char v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002357C;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v19 = v11;
    dispatch_sync(v12, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007C3D8();
    }

    id v16 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setInfoPlistLoctablePromiseUUID:completion:]",  2006LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find loctable promise with UUID %@",  v15,  (uint64_t)v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    ((void (**)(id, void *))v7)[2](v7, v17);
  }
}

- (void)_remote_hasInfoPlistLoctablePromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023674;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getInfoPlistLoctablePromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  id v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000237BC;
  v7[3] = &unk_1000CD080;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setAppExtensionPlaceholderPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v8);

  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v62;
    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
    uint64_t v14 = &OBJC_IVAR___IXGlobalConfiguration__dynamicPropertyLock;
    v53 = v9;
    uint64_t v54 = v7;
    id v52 = v10;
    uint64_t v49 = *(void *)v62;
    id v50 = self;
LABEL_3:
    uint64_t v15 = 0LL;
    id v51 = v11;
    while (1)
    {
      if (*(void *)v62 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([p_info + 171 sharedInstance]);
      id v18 = [v17 promiseForUUID:v16 ofType:objc_opt_class(v14 + 666)];
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (!v19) {
        break;
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](self, "bundleID"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", v20));

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
      unsigned __int8 v23 = [v22 hasPrefix:v21];

      if ((v23 & 1) == 0)
      {
        id v43 = v10;
        uint64_t v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10007C54C();
        }

        id v46 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
        id v48 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]",  2059LL,  @"IXErrorDomain",  8uLL,  0LL,  0LL,  @"Cannot complete attempt to set app extension placeholder with bundle ID %@ because it does not have the parent placeholder's required bundle ID prefix of %@",  v47,  (uint64_t)v46);
        id v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v48);

        v7[2](v7, v24);
        id v10 = v43;
LABEL_22:

        goto LABEL_23;
      }

      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v24 = v9;
      id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v58;
        while (2)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v58 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)i) bundleID]);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
            unsigned int v31 = [v29 isEqualToString:v30];

            if (v31)
            {
              id v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
              uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              id v7 = v54;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                sub_10007C4B8(v19, v34);
              }

              id v35 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
              id v37 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]",  2066LL,  @"IXErrorDomain",  9uLL,  0LL,  0LL,  @"App extension placeholders array has multiple placeholders with the same bundleID of %@",  v36,  (uint64_t)v35);
              unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

              v54[2](v54, v38);
              id v10 = v52;
              id v9 = v53;
              goto LABEL_22;
            }
          }

          id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
          if (v26) {
            continue;
          }
          break;
        }
      }

      -[NSMutableArray addObject:](v24, "addObject:", v19);
      uint64_t v15 = (char *)v15 + 1;
      id v10 = v52;
      id v9 = v53;
      id v7 = v54;
      uint64_t v12 = v49;
      self = v50;
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___IXSInstallProgressServer + 32);
      uint64_t v14 = &OBJC_IVAR___IXGlobalConfiguration__dynamicPropertyLock;
      if (v15 == v51)
      {
        id v11 = [v52 countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }

    __int128 v39 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10007C448();
    }

    id v42 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]",  2053LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find placeholder promise with UUID %@",  v41,  v16);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v7[2](v7, v19);
LABEL_23:

    goto LABEL_24;
  }

- (void)_remote_hasAppExtensionPlaceholderPromises:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023EB0;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getAppExtensionPlaceholderPromises:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = sub_100019590;
  uint64_t v12 = sub_1000195A0;
  id v13 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023FF8;
  v7[3] = &unk_1000CD080;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setConfigurationCompleteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024298;
  block[3] = &unk_1000CCE58;
  void block[4] = self;
  dispatch_sync(v6, block);

  v4[2](v4, 0LL);
}

@end