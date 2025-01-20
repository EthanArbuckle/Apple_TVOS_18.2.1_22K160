@interface MSDSignedManifest
+ (MSDSignedManifest)signedManifest;
+ (id)appsPrefixForManifestVersion:(id)a3;
+ (id)getComponentFromPath:(id)a3 forManifestVersion:(id)a4;
+ (id)signedManifestFromManifestData:(id)a3;
+ (void)setSignedManifest:(id)a3;
- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3;
- (BOOL)isContainerizedComponent:(id)a3;
- (BOOL)isItemApp:(id)a3;
- (BOOL)isItemBackup:(id)a3;
- (BOOL)isItemBaseBackup:(id)a3;
- (BOOL)isItemConfigurationProfile:(id)a3;
- (BOOL)isItemConfigurationProfileBackup:(id)a3;
- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3;
- (BOOL)isItemDeviceSettings:(id)a3;
- (BOOL)isItemGreyMatterBackup:(id)a3;
- (BOOL)isItemProvisioningProfileBackup:(id)a3;
- (BOOL)isItemStandAlonePackage:(id)a3;
- (BOOL)isItemSystemAppData:(id)a3;
- (BOOL)isItemSystemContainerBackup:(id)a3;
- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3;
- (BOOL)parseBundleID:(id)a3;
- (BOOL)staggeredContentUpdateEnabled;
- (BOOL)validateInstallationOrder;
- (MSDDemoManifestCheck)manifestVerifier;
- (MSDSignedManifest)initWithManifestData:(id)a3;
- (NSArray)criticalComponents;
- (NSArray)installationOrder;
- (NSDictionary)getAppDataList;
- (NSDictionary)getAppList;
- (NSDictionary)getBackup;
- (NSDictionary)getBackupList;
- (NSDictionary)getGroupDataList;
- (NSDictionary)getInfo;
- (NSDictionary)getPlugInDataList;
- (NSDictionary)getSharedDataList;
- (NSDictionary)getSystemAppDataList;
- (NSDictionary)getUserDataList;
- (NSDictionary)payload;
- (NSSet)getAllFileHash;
- (NSString)bundleID;
- (NSString)getInstallationOrderAppsPrefix;
- (NSString)getInstallationOrderSystemApps;
- (NSString)getLocaleCode;
- (NSString)signingKey;
- (_NSRange)rangeOfGroupedBackups:(int64_t)a3;
- (id)allContentRootPaths;
- (id)appIdentifierFromOrderItem:(id)a3;
- (id)configurationProfileIdentifierFromOrderItem:(id)a3;
- (id)getAppDependecies:(id)a3;
- (id)getAppFileSize:(id)a3;
- (id)getAppManifest:(id)a3;
- (id)getAppPrivacyPermissions:(id)a3;
- (id)getAppRealSize:(id)a3;
- (id)getBackupSectionName;
- (id)getComponentDataList:(id)a3;
- (id)getComponentVersion:(id)a3;
- (id)getContainerTypeFromComponentName:(id)a3;
- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getDataSectionKeys;
- (id)getDictFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getManifestFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getOriginServerFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getStandAlonePackageFileSize:(id)a3;
- (id)getStandAlonePackageRealSize:(id)a3;
- (id)getStandAlonePackageVersion:(id)a3;
- (id)getSystemAppDependecies:(id)a3;
- (id)getSystemAppPrivacyPermissions:(id)a3;
- (id)itemAtIndexInManifest:(int64_t)a3;
- (id)mergedBackupManifest:(_NSRange)a3;
- (id)originServerForApp:(id)a3;
- (id)originServerForBackupManifest:(_NSRange)a3;
- (id)standAlonePackageIdentifierFromOrderItem:(id)a3;
- (int)getVersion;
- (int64_t)getAppType:(id)a3;
- (void)dealloc;
- (void)parseInstallationOrder;
- (void)setBundleID:(id)a3;
- (void)setCriticalComponents:(id)a3;
- (void)setInstallationOrder:(id)a3;
- (void)setManifestVerifier:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setStaggeredContentUpdateEnabled:(BOOL)a3;
@end

@implementation MSDSignedManifest

+ (MSDSignedManifest)signedManifest
{
  return (MSDSignedManifest *)(id)qword_10004F828;
}

+ (void)setSignedManifest:(id)a3
{
}

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3 = a3;
  v4 = -[MSDSignedManifest initWithManifestData:]( objc_alloc(&OBJC_CLASS___MSDSignedManifest),  "initWithManifestData:",  v3);

  return v4;
}

- (MSDSignedManifest)initWithManifestData:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v105.receiver = self;
  v105.super_class = (Class)&OBJC_CLASS___MSDSignedManifest;
  v6 = -[MSDSignedManifest init](&v105, "init");
  if (!v6)
  {
    v8 = 0LL;
    v16 = 0LL;
    v7 = 0LL;
    goto LABEL_12;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Version"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Info"]);
  if (!v8 || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    id v47 = sub_100021D84();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100027C88(v10, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_63;
  }

  if (+[MSDPlatform iOSHub](&OBJC_CLASS___MSDPlatform, "iOSHub"))
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Product"]);
    if (!v10 || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v10, v11) & 1) == 0))
    {
      id v64 = sub_100021D84();
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_100027CF8(v65, v66, v67, v68, v69, v70, v71, v72);
      }

      goto LABEL_63;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    [v12 setPlatformWithManifestProductList:v10];

    Class v13 = NSClassFromString(@"MSDHubTestConfiguration");
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v13, "sharedInstance"));
      if ((objc_opt_respondsToSelector(v14, "shouldRunManifestRigorousTest") & 1) != 0
        && ([v14 shouldRunManifestRigorousTest] & 1) == 0)
      {
        id v18 = sub_100021D84();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v109 = "-[MSDSignedManifest initWithManifestData:]";
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s - Will not run rigorous testing on iOS hub.",  buf,  0xCu);
        }

        v15 = &__kCFBooleanFalse;
      }

      else
      {
        v15 = 0LL;
      }
    }

    else
    {
      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](&OBJC_CLASS___MSDDemoManifestCheck, "sharedInstance"));
  -[MSDSignedManifest setManifestVerifier:](v6, "setManifestVerifier:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
  if (!v21)
  {
    id v73 = sub_100021D84();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100027D68();
    }
LABEL_63:
    v16 = 0LL;
LABEL_75:
    v17 = 0LL;
    goto LABEL_51;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v6, "manifestVerifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getDataSectionKeys](v6, "getDataSectionKeys"));
  v106 = @"RigorousTestingOverride";
  v107 = v15;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v107,  &v106,  1LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v22 verifyManifestSignature:v4 forDataSectionKeys:v23 withOptions:v24]);

  if (v16)
  {
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v25) & 1) == 0)
    {
      id v74 = sub_100021D84();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100027F68(v10, v75, v76, v77, v78, v79, v80, v81);
      }
      goto LABEL_75;
    }

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"InstallationOrder"]);
    if (v10)
    {
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v10, v26) & 1) == 0)
      {
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v27) & 1) == 0)
        {
          id v93 = sub_100021D84();
          v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
            sub_100027EF8(v83, v94, v95, v96, v97, v98, v99, v100);
          }
LABEL_74:

          goto LABEL_75;
        }
      }

      v104 = v8;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"Backup"]);
      if (!v28 || (uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v28, v29) & 1) == 0))
      {
        id v55 = sub_100021D84();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_100027DEC(v56, v57, v58, v59, v60, v61, v62, v63);
        }

        v17 = 0LL;
        goto LABEL_79;
      }

      v102 = v7;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"App"]);
      id v103 = v4;
      v31 = v5;
      if (v30)
      {
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v30, v32) & 1) == 0)
        {
          id v85 = sub_100021D84();
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            sub_100027E88(v44, v86, v87, v88, v89, v90, v91, v92);
          }
          goto LABEL_78;
        }

        v33 = (char *)[v30 count];
      }

      else
      {
        v33 = 0LL;
      }

      uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v34) & 1) != 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v10, "objectForKey:", @"CriticalComponents"));

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v10, "objectForKey:", @"CriticalComponents"));
          -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v36);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v10, "objectForKey:", @"Components"));

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v10, "objectForKey:", @"Components"));
          -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v38);
        }
      }

      else
      {
        uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v10, v39) & 1) != 0) {
          -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v10);
        }
      }

      unsigned int v40 = -[NSMutableArray containsObject:](v5, "containsObject:", @"systemappdata");
      v31 = v5;
      v41 = (char *)-[NSMutableArray count](v5, "count");
      v42 = (char *)[v28 count];
      if (v40)
      {
        if (v41 != &v42[(void)v33 + 1])
        {
          id v43 = sub_100021D84();
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            goto LABEL_77;
          }
          goto LABEL_78;
        }
      }

      else if (v41 != &v33[(void)v42])
      {
        id v101 = sub_100021D84();
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
LABEL_77:
        }
          sub_100027E5C();
LABEL_78:

        v17 = 0LL;
        v5 = v31;
        v7 = v102;
        id v4 = v103;
LABEL_79:
        v8 = v104;
        goto LABEL_51;
      }

      v7 = v102;
      id v4 = v103;
      v8 = v104;
    }

    if ((int)[v7 intValue] > 4)
    {
      -[MSDSignedManifest setSigningKey:](v6, "setSigningKey:", @"MultipleContentSignings");
    }

    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"SigningKey"]);
      -[MSDSignedManifest setSigningKey:](v6, "setSigningKey:", v45);
    }

    -[MSDSignedManifest setPayload:](v6, "setPayload:", v16);
    -[MSDSignedManifest parseInstallationOrder](v6, "parseInstallationOrder");
    if (-[MSDSignedManifest validateInstallationOrder](v6, "validateInstallationOrder"))
    {
      if (-[MSDSignedManifest parseBundleID:](v6, "parseBundleID:", v8))
      {
        +[MSDSignedManifest setSignedManifest:](&OBJC_CLASS___MSDSignedManifest, "setSignedManifest:", v6);
        v17 = v6;
LABEL_51:

        goto LABEL_52;
      }

      id v84 = sub_100021D84();
      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        sub_100027D94();
      }
    }

    else
    {
      id v82 = sub_100021D84();
      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        sub_100027DC0();
      }
    }

    goto LABEL_74;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSDSignedManifest;
  -[MSDSignedManifest dealloc](&v3, "dealloc");
}

- (NSString)getInstallationOrderAppsPrefix
{
  return (NSString *)@"app.";
}

- (NSString)getInstallationOrderSystemApps
{
  return (NSString *)@"systemappdata";
}

- (int)getVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Version"]);

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSString)getLocaleCode
{
  return 0LL;
}

- (NSDictionary)getInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Info"]);

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"App"]);

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"AppData"]);

  return (NSDictionary *)v3;
}

- (NSDictionary)getGroupDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"GroupData"]);

  return (NSDictionary *)v3;
}

- (NSDictionary)getPlugInDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ExtensionData"]);

  return (NSDictionary *)v3;
}

- (id)getAppDependecies:(id)a3
{
  return 0LL;
}

- (id)getSystemAppDependecies:(id)a3
{
  return 0LL;
}

- (int64_t)getAppType:(id)a3
{
  return 3LL;
}

- (id)getAppFileSize:(id)a3
{
  return 0LL;
}

- (id)getAppRealSize:(id)a3
{
  return 0LL;
}

- (id)getStandAlonePackageFileSize:(id)a3
{
  return 0LL;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  return 0LL;
}

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0LL;
}

- (NSDictionary)getSharedDataList
{
  return 0LL;
}

- (NSDictionary)getUserDataList
{
  return 0LL;
}

- (id)getComponentDataList:(id)a3
{
  return 0LL;
}

- (NSDictionary)getSystemAppDataList
{
  return 0LL;
}

- (NSSet)getAllFileHash
{
  return 0LL;
}

- (id)allContentRootPaths
{
  return 0LL;
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  return 0;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  return 0LL;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  return 0LL;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  return 0LL;
}

- (BOOL)isContainerizedComponent:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"AppData"] & 1) != 0
    || ([v3 isEqualToString:@"GroupData"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:@"ExtensionData"];
  }

  return v4;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0LL;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0LL;
}

- (id)getOriginServerFromSection:(id)a3 forIdentifier:(id)a4
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifest getDictFromSection:forIdentifier:]( self,  "getDictFromSection:forIdentifier:",  a3,  a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"OriginServer"]);

  return v5;
}

- (NSDictionary)getBackup
{
  if (-[MSDSignedManifest getVersion](self, "getVersion") >= 5)
  {
    id v6 = sub_100021D84();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100027FD8();
    }

    unsigned __int8 v4 = 0LL;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Backup"]);
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)getBackupList
{
  if (-[MSDSignedManifest getVersion](self, "getVersion") < 5)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackup](self, "getBackup"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  @"backup.BaseBackup"));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Backup"]);
  }

  v5 = (void *)v4;

  return (NSDictionary *)v5;
}

- (id)itemAtIndexInManifest:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);

  return v5;
}

- (_NSRange)rangeOfGroupedBackups:(int64_t)a3
{
  NSUInteger v4 = a3;
  NSUInteger v5 = 1LL;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion") <= 4) {
    return (id)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackup](self, "getBackup"));
  }
  id v7 = sub_100021D84();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v27.NSUInteger location = location;
    v27.NSUInteger length = length;
    uint64_t v9 = NSStringFromRange(v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Merging manifest item %{public}@", buf, 0xCu);
  }

  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  if (location < location + length)
  {
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:location]);
      Class v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackupList](self, "getBackupList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);

      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Manifest"]);
      v16 = v15;
      if (v15)
      {
        id v17 = v15;

        v14 = v17;
      }

      if (-[MSDSignedManifest isItemSystemContainerBackup:](self, "isItemSystemContainerBackup:", v12))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
        unsigned int v19 = [v18 watchOS];

        id v20 = sub_100021D84();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "System container backup only allowed on Watch devices.",  buf,  2u);
          }

          goto LABEL_17;
        }

        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "System container backup found. Start restoring UUID paths...",  buf,  2u);
        }

        uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSString restoreSystemContainerUUIDPathsInDict:]( &OBJC_CLASS___NSString,  "restoreSystemContainerUUIDPathsInDict:",  v14));
        v14 = (void *)v23;
      }

      [v24 addEntriesFromDictionary:v14];
LABEL_17:

      ++location;
      --length;
    }

    while (length);
  }

  return v24;
}

- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion") < 5) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v7 = [v6 watchOS];

  if (!v7) {
    return 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  uint64_t v9 = v8;
  NSUInteger v10 = location + length;
  if (location >= location + length)
  {
    BOOL v13 = 0;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:location]);
    unsigned __int8 v12 = [v11 isEqualToString:@"backup.SystemContainer"];

    if ((v12 & 1) != 0)
    {
      BOOL v13 = 1;
    }

    else
    {
      NSUInteger v14 = location + 1;
      NSUInteger v15 = length - 1;
      do
      {
        NSUInteger v16 = v14;
        if (!v15) {
          break;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v14]);
        unsigned int v18 = [v17 isEqualToString:@"backup.SystemContainer"];

        NSUInteger v14 = v16 + 1;
        --v15;
      }

      while (!v18);
      BOOL v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location = a3.location;
  if (-[MSDSignedManifest getVersion](self, "getVersion", a3.location, a3.length) >= 5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:location]);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getBackupList](self, "getBackupList"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"OriginServer"]);
  }

  else
  {
    NSUInteger v5 = 0LL;
  }

  return v5;
}

- (id)originServerForApp:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"OriginServer"]);
  }

  return v6;
}

- (BOOL)isItemBackup:(id)a3
{
  return [a3 hasPrefix:@"backup."];
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.BaseBackup"];
}

- (BOOL)isItemGreyMatterBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.SystemContainer"];
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.ProvisioningProfile"];
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return [a3 hasPrefix:@"systemappdata"];
}

- (BOOL)isItemApp:(id)a3
{
  return [a3 hasPrefix:@"app."];
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return 0;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return 0;
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  return 0;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if (-[MSDSignedManifest isItemApp:](self, "isItemApp:", v4)) {
    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"app.", "length")));
  }
  else {
    NSUInteger v5 = 0LL;
  }

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  return 0LL;
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  return 0LL;
}

+ (id)appsPrefixForManifestVersion:(id)a3
{
  unsigned int v3 = [a3 intValue];
  id v4 = @"/Apps/";
  if (v3 != 7) {
    id v4 = 0LL;
  }
  if (v3 == 6) {
    return @"app.";
  }
  else {
    return (id)v4;
  }
}

+ (id)getComponentFromPath:(id)a3 forManifestVersion:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 intValue];
  if (v6 == 7)
  {
LABEL_7:
    if ([v5 hasPrefix:@"/Apps/"])
    {
      unsigned int v7 = @"/Apps/";
      goto LABEL_15;
    }

    if ([v5 hasPrefix:@"/BackupData/"])
    {
      unsigned int v7 = @"/BackupData/";
      goto LABEL_15;
    }

    if ([v5 hasPrefix:@"/Packages/"])
    {
      unsigned int v7 = @"/Packages/";
      goto LABEL_15;
    }

    if ([v5 hasPrefix:@"/ConfigurationProfiles/"])
    {
      unsigned int v7 = @"/ConfigurationProfiles/";
      goto LABEL_15;
    }

    if ([v5 hasPrefix:@"/SystemApps"])
    {
      uint64_t v9 = v5;
      uint64_t v8 = 1LL;
      goto LABEL_16;
    }

- (id)getComponentVersion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"CFBundleShortVersionString"]);

  id v9 = sub_100021D84();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    NSUInteger v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "appName:%{public}@ componentVersion:%{public}@",  (uint8_t *)&v12,  0x16u);
  }

  return v8;
}

- (id)getAppManifest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest getAppList](self, "getAppList"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  return v7;
}

- (id)getBackupSectionName
{
  return @"Backup";
}

- (id)getStandAlonePackageVersion:(id)a3
{
  id v3 = sub_100021D84();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned int v7 = "-[MSDSignedManifest getStandAlonePackageVersion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s - getStandAlonePackageVersion is applicable to manifest V7 only.",  (uint8_t *)&v6,  0xCu);
  }

  return 0LL;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100049B10);
}

- (void)parseInstallationOrder
{
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"InstallationOrder"]);

  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      int v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CriticalComponents"]);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Components"]);
      if (v6)
      {
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
        {
          -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v6);
          -[MSDSignedManifest setStaggeredContentUpdateEnabled:](self, "setStaggeredContentUpdateEnabled:", 1LL);
          -[MSDSignedManifest setCriticalComponents:](self, "setCriticalComponents:", v6);
        }
      }

      if (v7)
      {
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
          -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v7);
        }
      }

      goto LABEL_12;
    }

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      int v6 = v11;
      uint64_t v11 = (NSMutableArray *)[v4 mutableCopy];
LABEL_12:
    }
  }

  -[MSDSignedManifest setInstallationOrder:](self, "setInstallationOrder:", v11);
}

- (BOOL)validateInstallationOrder
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v2 = v5;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (-[MSDSignedManifest isItemProvisioningProfileBackup:](self, "isItemProvisioningProfileBackup:", v9)
          || -[MSDSignedManifest isItemBaseBackup:](self, "isItemBaseBackup:", v9))
        {
          char v6 = 1;
        }

        else if (-[MSDSignedManifest isItemApp:](self, "isItemApp:", v9))
        {
          if ((v6 & 1) != 0)
          {
            char v10 = 0;
            LOBYTE(v2) = 1;
          }

          else
          {
            id v11 = sub_100021D84();
            int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int16 v14 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cannot place app before provisioning profile or base backup.",  v14,  2u);
            }

            LOBYTE(v2) = 0;
            char v10 = 0;
          }

          goto LABEL_18;
        }
      }

      id v2 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  char v10 = 1;
LABEL_18:

  return (v2 | v10) & 1;
}

- (id)getDictFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

  char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);
  return v10;
}

- (id)getManifestFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifest getDictFromSection:forIdentifier:]( self,  "getDictFromSection:forIdentifier:",  a3,  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Manifest"]);

  return v5;
}

- (BOOL)parseBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PartNumber"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Revision"]);

  if (!v5)
  {
    id v10 = sub_100021D84();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100028004(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }

  if (!v6)
  {
    id v19 = sub_100021D84();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100028074(v11, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:

    BOOL v8 = 0;
    goto LABEL_4;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@_%d",  v5,  [v6 intValue]));
  -[MSDSignedManifest setBundleID:](self, "setBundleID:", v7);

  BOOL v8 = 1;
LABEL_4:

  return v8;
}

- (NSString)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSArray)installationOrder
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInstallationOrder:(id)a3
{
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCriticalComponents:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPayload:(id)a3
{
}

- (MSDDemoManifestCheck)manifestVerifier
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setManifestVerifier:(id)a3
{
}

- (BOOL)staggeredContentUpdateEnabled
{
  return self->_staggeredContentUpdateEnabled;
}

- (void)setStaggeredContentUpdateEnabled:(BOOL)a3
{
  self->_staggeredContentUpdateEnabled = a3;
}

- (void).cxx_destruct
{
}

@end