@interface AppUpdateMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (AppUpdateMemoryEntity)init;
- (AppUpdateMemoryEntity)initWithUpdateDictionary:(id)a3;
- (BOOL)isAppClip;
- (BOOL)isBackground;
- (BOOL)isCodeSignatureUpdate;
- (BOOL)isOffloaded;
- (BOOL)isPerDevice;
- (NSDate)currentVersionReleaseDate;
- (NSDate)installDate;
- (NSDate)releaseDate;
- (NSNumber)evid;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)description;
- (NSString)parentalControlsName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (id)purchase_purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (id)rawUpdateDictionary;
- (int64_t)packageType;
- (int64_t)parentalControlsRank;
- (int64_t)softwarePlatform;
- (void)setBackground:(BOOL)a3;
- (void)setCodeSignatureUpdate:(BOOL)a3;
- (void)setInstallDate:(id)a3;
- (void)setMetricsData:(id)a3;
- (void)setOffloaded:(BOOL)a3;
- (void)setPerDevice:(BOOL)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation AppUpdateMemoryEntity

- (AppUpdateMemoryEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppUpdateMemoryEntity;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (AppUpdateMemoryEntity)initWithUpdateDictionary:(id)a3
{
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)&OBJC_CLASS___AppUpdateMemoryEntity;
  v5 = -[SQLiteMemoryEntity init](&v85, "init");
  if (v5)
  {
    id v6 = v4;
    if (!v6)
    {
LABEL_73:

      goto LABEL_74;
    }

    -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v6, @"store_item_data");
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"bundleId"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (NSString *)[v7 copy];
      bundleID = v5->_bundleID;
      v5->_bundleID = v10;
      v12 = v7;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"bundle-id"]);

      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
      if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0) {
        goto LABEL_8;
      }
      v15 = (NSString *)[v12 copy];
      bundleID = v5->_bundleID;
      v5->_bundleID = v15;
    }

LABEL_8:
    v16 = v5->_bundleID;
    if (v16) {
      -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v16, @"bundle_id");
    }
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"currentVersionReleaseDateTime"]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v20, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ss'Z'");
      -[NSDateFormatter setLenient:](v20, "setLenient:", 1LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneForSecondsFromGMT:]( &OBJC_CLASS___NSTimeZone,  "timeZoneForSecondsFromGMT:",  0LL));
      -[NSDateFormatter setTimeZone:](v20, "setTimeZone:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v20, "dateFromString:", v17));
      if (v22) {
        -[SQLiteMemoryEntity setValue:forProperty:]( v5,  "setValue:forProperty:",  v22,  @"current_version_release_date");
      }
    }

    v80 = (void *)v17;
    id v81 = v6;
    id v23 = v6;
    id v24 = (id)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"externalId"]);
    v25 = &_ss28__ContiguousArrayStorageBaseCMa_ptr;
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v26);
    if ((objc_opt_isKindOfClass(v24, v27) & 1) != 0)
    {
      id v24 = v24;
      v28 = v24;
LABEL_27:

      if (v28)
      {
        v41 = (NSNumber *)[v28 copy];
        evid = v5->_evid;
        v5->_evid = v41;

        -[SQLiteMemoryEntity setValue:forProperty:]( v5,  "setValue:forProperty:",  v5->_evid,  @"store_software_version_id");
      }

      v83 = v28;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"id"]);

      if ((objc_opt_respondsToSelector(v43, "longLongValue") & 1) != 0)
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25[502], "numberWithLongLong:", objc_msgSend(v43, "longLongValue")));
        itemID = v5->_itemID;
        v5->_itemID = (NSNumber *)v44;

        -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v5->_itemID, @"store_item_id");
      }

      v82 = v43;
      v84 = v23;
      id v46 = sub_1001DEC94(v23, @"deviceFamilies");
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      id v48 = [v47 countByEnumeratingWithState:&v86 objects:v90 count:16];
      if (v48)
      {
        id v49 = v48;
        unint64_t v50 = 0LL;
        uint64_t v51 = *(void *)v87;
        do
        {
          for (i = 0LL; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v87 != v51) {
              objc_enumerationMutation(v47);
            }
            v53 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
            if ((unint64_t)[v53 length] >= 3)
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue([v53 substringToIndex:3]);
              v55 = (void *)objc_claimAutoreleasedReturnValue([v54 lowercaseString]);

              if ([v55 isEqualToString:@"ipa"])
              {
                uint64_t v56 = 2LL;
              }

              else if ([v55 isEqualToString:@"iph"])
              {
                uint64_t v56 = 4LL;
              }

              else if ([v55 isEqualToString:@"ipo"])
              {
                uint64_t v56 = 8LL;
              }

              else if ([v55 isEqualToString:@"tvo"])
              {
                uint64_t v56 = 16LL;
              }

              else if ([v55 isEqualToString:@"wat"])
              {
                uint64_t v56 = 32LL;
              }

              else
              {
                uint64_t v56 = [v55 isEqualToString:@"mac"];
              }

              v50 |= v56;
            }
          }

          id v49 = [v47 countByEnumeratingWithState:&v86 objects:v90 count:16];
        }

        while (v49);
      }

      else
      {
        unint64_t v50 = 0LL;
      }

      if (v50 <= 1) {
        uint64_t v57 = 1LL;
      }
      else {
        uint64_t v57 = v50;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v57));
      -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v58, @"device_families");

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
      -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v59, @"software_platform");

      id v60 = sub_100232E24(v84);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKey:@"value"]);
      else {
        id v63 = 0LL;
      }
      id v6 = v81;

      v5->_parentalControlsRank = (int64_t)v63;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKey:@"releaseDate"]);

      uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSString, v65);
      if ((objc_opt_isKindOfClass(v64, v66) & 1) != 0 && [v64 length])
      {
        v67 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
        -[NSDateFormatter setDateStyle:](v67, "setDateStyle:", 2LL);
        -[NSDateFormatter setTimeStyle:](v67, "setTimeStyle:", 0LL);
        uint64_t v68 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v67, "dateFromString:", v64));
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = (NSDate *)v68;
      }

      v70 = v5->_releaseDate;
      if (v70) {
        -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v70, @"release_date");
      }
      v71 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_app_clip"]);

      if (v71)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_app_clip"]);
        -[SQLiteMemoryEntity setValue:forExternalProperty:]( v5,  "setValue:forExternalProperty:",  v72,  @"is_app_clip");
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_offloaded"]);

      if (v73)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_offloaded"]);
        -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v74, @"is_offloaded");
      }

      v75 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_per_device"]);

      if (v75)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_per_device"]);
        -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v76, @"is_per_device");
      }

      v77 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_b2b_custom_app"]);

      if (v77)
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"is_b2b_custom_app"]);
        -[SQLiteMemoryEntity setValue:forProperty:](v5, "setValue:forProperty:", v78, @"is_b2b_custom_app");
      }

      goto LABEL_73;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"offers"]);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray, v30);
    if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0 && [v29 count])
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"version"]);
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary, v34);
      if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"externalId"]);
        uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSNumber, v36);
        if ((objc_opt_isKindOfClass(v28, v37) & 1) != 0)
        {

          v25 = &_ss28__ContiguousArrayStorageBaseCMa_ptr;
LABEL_26:

          goto LABEL_27;
        }
      }

      v25 = &_ss28__ContiguousArrayStorageBaseCMa_ptr;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"versionId"]);

    uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSNumber, v39);
    if ((objc_opt_isKindOfClass(v38, v40) & 1) != 0)
    {
      id v24 = v38;
      v28 = v24;
    }

    else
    {
      v28 = 0LL;
      id v24 = v38;
    }

    goto LABEL_26;
  }

- (NSString)bundleID
{
  return (NSString *)sub_1001E26D0(self, (uint64_t)@"bundle_id");
}

- (NSString)buyParams
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity rawUpdateDictionary](self, "rawUpdateDictionary"));
  id v4 = v3;
  if (!self)
  {
    v12 = 0LL;
    goto LABEL_20;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"buyParams"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"action-params"]);

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      id v8 = v9;
      goto LABEL_6;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"offers"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0)
    {
      v12 = 0LL;
LABEL_18:

      goto LABEL_19;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) == 0)
    {
      v12 = 0LL;
LABEL_17:

      goto LABEL_18;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForKey:@"buyParams"]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
    if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0)
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"action-params"]);

      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
      if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
      {
        v12 = 0LL;
        goto LABEL_16;
      }

      uint64_t v19 = v22;
    }

    id v22 = v19;
    v12 = v22;
LABEL_16:

    goto LABEL_17;
  }

  id v8 = v5;
LABEL_6:
  uint64_t v9 = v8;
  v12 = v8;
LABEL_19:

LABEL_20:
  return (NSString *)v12;
}

- (NSDate)currentVersionReleaseDate
{
  return (NSDate *)-[SQLiteMemoryEntity valueForProperty:]( self,  "valueForProperty:",  @"current_version_release_date");
}

- (NSNumber)evid
{
  return (NSNumber *)sub_1001E25D0(self, (uint64_t)@"store_software_version_id");
}

- (NSDate)installDate
{
  return (NSDate *)-[SQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", @"install_date");
}

- (NSNumber)itemID
{
  return (NSNumber *)sub_1001E25D0(self, (uint64_t)@"store_item_id");
}

- (BOOL)isAppClip
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SQLiteMemoryEntity valueForExternalProperty:]( self,  "valueForExternalProperty:",  @"is_app_clip"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isBackground
{
  return sub_1001E2598(self, (uint64_t)@"is_background");
}

- (BOOL)isCodeSignatureUpdate
{
  return sub_1001E2598(self, (uint64_t)@"is_code_signature_update");
}

- (BOOL)isOffloaded
{
  return sub_1001E2598(self, (uint64_t)@"is_offloaded");
}

- (BOOL)isPerDevice
{
  return sub_1001E2598(self, (uint64_t)@"is_per_device");
}

- (int64_t)packageType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", @"package_type"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)parentalControlsName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity rawUpdateDictionary](self, "rawUpdateDictionary"));
  id v4 = v3;
  if (self)
  {
    id v5 = sub_100232E24(v3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"name"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
      id v10 = v7;
    }
    else {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return (NSString *)v10;
}

- (id)rawUpdateDictionary
{
  return -[SQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", @"store_item_data");
}

- (void)setOffloaded:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_offloaded");
}

- (void)setBackground:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_background");
}

- (void)setCodeSignatureUpdate:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_code_signature_update");
}

- (void)setInstallDate:(id)a3
{
}

- (void)setMetricsData:(id)a3
{
}

- (void)setPerDevice:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_per_device");
}

- (void)setUpdateState:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"update_state");
}

- (int64_t)softwarePlatform
{
  return 1LL;
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity bundleID](self, "bundleID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity itemID](self, "itemID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity evid](self, "evid"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity currentVersionReleaseDate](self, "currentVersionReleaseDate"));
  id v7 = sub_1001E83D8(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ bundleID: %@ itemID: %@ evid: %@ currentReleaseDate: %@ }",  v3,  v4,  v5,  v8));

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppUpdateMemoryEntity;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppUpdateEntity, a2);
}

+ (id)defaultProperties
{
  return sub_1001BFBBC((uint64_t)&OBJC_CLASS___AppUpdateEntity);
}

- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  return -[AppUpdateMemoryEntity purchase_purchaseInfoForUpdateUserInitiated:]( self,  "purchase_purchaseInfoForUpdateUserInitiated:",  a3);
}

- (int64_t)parentalControlsRank
{
  return self->_parentalControlsRank;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void).cxx_destruct
{
}

- (id)purchase_purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___PurchaseInfo);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity bundleID](self, "bundleID"));
  -[PurchaseInfo setBundleID:](v5, "setBundleID:", v6);

  id v7 = -[AMSProcessInfo initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___AMSProcessInfo),  "initWithBundleIdentifier:",  @"com.apple.TVAppStore");
  -[PurchaseInfo setClientInfo:](v5, "setClientInfo:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[PurchaseInfo setExternalID:](v5, "setExternalID:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity itemID](self, "itemID"));
  -[PurchaseInfo setItemID:](v5, "setItemID:", v9);

  -[PurchaseInfo setDiscoveredUpdate:](v5, "setDiscoveredUpdate:", 1LL);
  -[PurchaseInfo setDisableBoosting:](v5, "setDisableBoosting:", 1LL);
  if (v3)
  {
    -[PurchaseInfo setPriority:](v5, "setPriority:", 0LL);
    -[PurchaseInfo setUpdateType:](v5, "setUpdateType:", 2LL);
    -[PurchaseInfo setLogCode:](v5, "setLogCode:", @"UPD");
    -[PurchaseInfo setMetricsType:](v5, "setMetricsType:", &off_10040CE08);
    -[PurchaseInfo setPurchaseType:](v5, "setPurchaseType:", 4LL);
    -[PurchaseInfo setSuppressEvaluatorDialogs:](v5, "setSuppressEvaluatorDialogs:", 1LL);
  }

  else
  {
    -[PurchaseInfo setPriority:](v5, "setPriority:", -2LL);
    -[PurchaseInfo setUpdateType:](v5, "setUpdateType:", 1LL);
    -[PurchaseInfo setDiscretionary:](v5, "setDiscretionary:", 1LL);
    -[PurchaseInfo setSuppressDialogs:](v5, "setSuppressDialogs:", 1LL);
    -[PurchaseInfo setSuppressEvaluatorDialogs:](v5, "setSuppressEvaluatorDialogs:", 1LL);
    -[PurchaseInfo setLogCode:](v5, "setLogCode:", @"UPA");
    -[PurchaseInfo setMetricsType:](v5, "setMetricsType:", &off_10040CE20);
    -[PurchaseInfo setPurchaseType:](v5, "setPurchaseType:", 1LL);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity buyParams](self, "buyParams"));
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](&OBJC_CLASS___AMSBuyParams, "buyParamsWithString:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity parentalControlsName](self, "parentalControlsName"));
    if (v12) {
      [v11 setParameter:v12 forKey:@"installedSoftwareRatingName"];
    }
    if (!v3) {
      [v11 setParameter:@"1" forKey:AMSBuyParamPropertyIsBackground];
    }
    -[PurchaseInfo setBuyParams:](v5, "setBuyParams:", v11);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity itemID](self, "itemID"));
  unsigned int v14 = +[UpdatesManager isTVProviderApp:]( UpdatesManager,  "isTVProviderApp:",  [v13 integerValue]);

  uint64_t v15 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppUpdateMemoryEntity itemID](self, "itemID"));
  uint64_t v17 = -[LSApplicationRecord initWithStoreItemIdentifier:error:]( v15,  "initWithStoreItemIdentifier:error:",  [v16 unsignedLongLongValue],  0);

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v17, "iTunesMetadata"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 itemName]);
    -[PurchaseInfo setItemName:](v5, "setItemName:", v19);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v17, "iTunesMetadata"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 artistName]);
    -[PurchaseInfo setVendorName:](v5, "setVendorName:", v21);

    id v22 = -[LSApplicationRecord applicationDSID](v17, "applicationDSID");
    if (!v14
      || (-[LSApplicationRecord isProfileValidated](v17, "isProfileValidated") & 1) != 0
      || (-[LSApplicationRecord applicationHasMIDBasedSINF](v17, "applicationHasMIDBasedSINF") & 1) == 0)
    {
      goto LABEL_22;
    }
  }

  else
  {
    id v22 = 0LL;
    if (!v14) {
      goto LABEL_22;
    }
  }

  -[PurchaseInfo setLogCode:](v5, "setLogCode:", @"PTV");
  -[PurchaseInfo setPurchaseType:](v5, "setPurchaseType:", 2LL);
  -[PurchaseInfo setMetricsType:](v5, "setMetricsType:", &off_10040CE38);
  if (!v17) {
    -[PurchaseInfo setUpdateType:](v5, "setUpdateType:", 0LL);
  }
  -[PurchaseInfo setMachineBased:](v5, "setMachineBased:", 1LL);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo buyParams](v5, "buyParams"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 parameterForKey:AMSBuyParamPropertyAppExtVrsId]);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo buyParams](v5, "buyParams"));
  uint64_t v26 = AMSBuyParamPropertyExternalVersionId;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 parameterForKey:AMSBuyParamPropertyExternalVersionId]);

  if (!v27 && v24)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo buyParams](v5, "buyParams"));
    [v28 setParameter:v24 forKey:v26];
  }

LABEL_22:
  -[PurchaseInfo setExpectedSoftwarePlatform:]( v5,  "setExpectedSoftwarePlatform:",  -[AppUpdateMemoryEntity softwarePlatform](self, "softwarePlatform"));
  uint64_t v29 = ASDLogHandleForCategory(40LL);
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v36 = 134218240;
    uint64_t v37 = self;
    __int16 v38 = 2048;
    int64_t v39 = -[PurchaseInfo expectedSoftwarePlatform](v5, "expectedSoftwarePlatform");
    _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "(AppUpdateMemoryEntity) [%p] expectedSoftwarePlatform=%lu",  (uint8_t *)&v36,  0x16u);
  }

  if ((id)-[PurchaseInfo expectedSoftwarePlatform](v5, "expectedSoftwarePlatform") != (id)2)
  {
    uint64_t v31 = 2LL;
    -[PurchaseInfo setCoordinatorIntent:](v5, "setCoordinatorIntent:", 2LL);
    if (!v3)
    {
      else {
        uint64_t v31 = 1LL;
      }
    }

    -[PurchaseInfo setCoordinatorImportance:](v5, "setCoordinatorImportance:", v31);
  }

  -[PurchaseInfo updateGeneratedProperties](v5, "updateGeneratedProperties");
  if (v22)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v22));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_iTunesAccountWithDSID:", v33));

    if (v34) {
      -[PurchaseInfo setAccount:](v5, "setAccount:", v34);
    }
  }

  return v5;
}

@end