@interface MSDSignedManifestV7
+ (id)signedManifestFromManifestData:(id)a3;
- (BOOL)checkPlatformTypeForAllComponents;
- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3;
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
- (MSDSignedManifestV7)initWithManifestData:(id)a3;
- (NSSet)nonContainerizedContentRoots;
- (NSString)localeCodeStr;
- (id)appIdentifierFromOrderItem:(id)a3;
- (id)configurationProfileIdentifierFromOrderItem:(id)a3;
- (id)getAllFileHash;
- (id)getAppDependecies:(id)a3;
- (id)getAppFileSize:(id)a3;
- (id)getAppList;
- (id)getAppManifest:(id)a3;
- (id)getAppPrivacyPermissions:(id)a3;
- (id)getAppRealSize:(id)a3;
- (id)getBackupList;
- (id)getBackupSectionName;
- (id)getComponentDataList:(id)a3;
- (id)getComponentVersion:(id)a3;
- (id)getContainerTypeFromComponentName:(id)a3;
- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getDataSectionKeys;
- (id)getInstallationOrderAppsPrefix;
- (id)getInstallationOrderSystemApps;
- (id)getLocaleCode;
- (id)getManifestDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getManifestInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSharedDataList;
- (id)getStandAlonePackageFileSize:(id)a3;
- (id)getStandAlonePackageList;
- (id)getStandAlonePackageRealSize:(id)a3;
- (id)getStandAlonePackageVersion:(id)a3;
- (id)getSystemAppDataList;
- (id)getSystemAppDependecies:(id)a3;
- (id)getSystemAppPrivacyPermissions:(id)a3;
- (id)getUserDataList;
- (id)mergedBackupManifest:(_NSRange)a3;
- (id)originServerForBackupManifest:(_NSRange)a3;
- (id)parseAllFileHash;
- (id)parseSectionForContentRoot:(id)a3;
- (id)standAlonePackageIdentifierFromOrderItem:(id)a3;
- (int64_t)getAppType:(id)a3;
- (void)parseLocaleCode;
- (void)parseNonContainerizedContentRootSet;
- (void)setLocaleCodeStr:(id)a3;
- (void)setNonContainerizedContentRoots:(id)a3;
@end

@implementation MSDSignedManifestV7

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3 = a3;
  v4 = -[MSDSignedManifestV7 initWithManifestData:]( objc_alloc(&OBJC_CLASS___MSDSignedManifestV7),  "initWithManifestData:",  v3);

  return v4;
}

- (MSDSignedManifestV7)initWithManifestData:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v5);
  v151.receiver = self;
  v151.super_class = (Class)&OBJC_CLASS___MSDSignedManifestV7;
  v7 = -[MSDSignedManifestV7 init](&v151, "init");
  if (!v7)
  {
    v9 = 0LL;
    v18 = 0LL;
    v19 = 0LL;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Info"]);
  if (!v9 || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
  {
    id v53 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100090B74(v12, v54, v55, v56, v57, v58, v59, v60);
    }
    goto LABEL_95;
  }

  if (+[MSDPlatform iOSHub](&OBJC_CLASS___MSDPlatform, "iOSHub"))
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Product"]);
    if (!v12 || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v11), (objc_opt_isKindOfClass(v12, v13) & 1) == 0))
    {
      id v79 = sub_10003A95C();
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        sub_100090BE4(v80, v81, v82, v83, v84, v85, v86, v87);
      }

      goto LABEL_95;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    [v14 setPlatformWithManifestProductList:v12];

    Class v15 = NSClassFromString(@"MSDHubTestConfiguration");
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v15, "sharedInstance"));
      if ((objc_opt_respondsToSelector(v16, "shouldRunManifestRigorousTest") & 1) != 0
        && ([v16 shouldRunManifestRigorousTest] & 1) == 0)
      {
        id v21 = sub_10003A95C();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v153 = "-[MSDSignedManifestV7 initWithManifestData:]";
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s - Will not run rigorous testing on iOS hub.",  buf,  0xCu);
        }

        v17 = &__kCFBooleanFalse;
      }

      else
      {
        v17 = 0LL;
      }
    }

    else
    {
      v17 = 0LL;
    }
  }

  else
  {
    v17 = 0LL;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v7, "manifestVerifier"));

  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](&OBJC_CLASS___MSDDemoManifestCheck, "sharedInstance"));
    -[MSDSignedManifest setManifestVerifier:](v7, "setManifestVerifier:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v7, "manifestVerifier"));
    if (!v25)
    {
      id v136 = sub_10003A95C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100090C54(v12, v137, v138, v139, v140, v141, v142, v143);
      }
LABEL_95:
      v18 = 0LL;
      v19 = 0LL;
      goto LABEL_96;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Version"]);
  if (v17) {
    [v6 setObject:v17 forKey:@"RigorousTestingOverride"];
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest manifestVerifier](v7, "manifestVerifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](v7, "getDataSectionKeys"));
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 verifyManifestSignature:v4 forDataSectionKeys:v27 withOptions:v6]);

  if (v12)
  {
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary, v28);
    if ((objc_opt_isKindOfClass(v12, v29) & 1) != 0)
    {
      v150 = v19;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"InstallationOrder"));
      if (v31 && (uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary, v30), (objc_opt_isKindOfClass(v31, v32) & 1) != 0))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"CriticalComponents"]);
        v149 = v33;
        if (v33) {
          v34 = (char *)[v33 count];
        }
        else {
          v34 = 0LL;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"Components"]);
        v36 = v35;
        if (v35) {
          v34 = &v34[(void)[v35 count]];
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"BackupData"));
        if (v38)
        {
          uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSDictionary, v37);
          if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
          {
            v147 = v36;
            v148 = v6;
            v40 = (char *)[v38 count];
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"Apps"));
            v146 = v38;
            if (v18)
            {
              uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSDictionary, v41);
              if ((objc_opt_isKindOfClass(v18, v42) & 1) == 0)
              {
                id v100 = sub_10003A95C();
                v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
                  sub_100090FB8(v101, v102, v103, v104, v105, v106, v107, v108);
                }

                goto LABEL_87;
              }

              v40 = &v40[(void)[v18 count]];
            }

            v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"SystemApps"));
            if (v44)
            {
              uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSDictionary, v43);
              if ((objc_opt_isKindOfClass(v44, v45) & 1) == 0)
              {
                id v109 = sub_10003A95C();
                v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
                if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
                  sub_100090F48(v110, v111, v112, v113, v114, v115, v116, v117);
                }

LABEL_86:
LABEL_87:
                v20 = 0LL;
LABEL_92:
                v6 = v148;
                goto LABEL_52;
              }

              if ([v44 count]) {
                ++v40;
              }
            }

            v47 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"Packages"));
            id v145 = v4;
            if (!v47) {
              goto LABEL_45;
            }
            uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSDictionary, v46);
            if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
            {
              v40 = &v40[(void)[v47 count]];
LABEL_45:
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v12, "objectForKey:", @"ConfigurationProfiles"));
              if (v50)
              {
                uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSDictionary, v49);
                if ((objc_opt_isKindOfClass(v50, v51) & 1) == 0)
                {
                  id v127 = sub_10003A95C();
                  v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
                  if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
                    sub_100090E68(v128, v129, v130, v131, v132, v133, v134, v135);
                  }

LABEL_91:
                  v20 = 0LL;
                  id v4 = v145;
                  goto LABEL_92;
                }

                v40 = &v40[(void)[v50 count]];
              }

              if (v34 == v40)
              {
                -[MSDSignedManifest setSigningKey:](v7, "setSigningKey:", @"MultipleContentSignings");
                -[MSDSignedManifest setPayload:](v7, "setPayload:", v12);
                v6 = v148;
                if (-[MSDSignedManifestV7 checkPlatformTypeForAllComponents](v7, "checkPlatformTypeForAllComponents"))
                {
                  -[MSDSignedManifestV7 parseNonContainerizedContentRootSet](v7, "parseNonContainerizedContentRootSet");
                  -[MSDSignedManifest parseInstallationOrder](v7, "parseInstallationOrder");
                  -[MSDSignedManifest parseBundleID:](v7, "parseBundleID:", v9);
                  -[MSDSignedManifestV7 parseLocaleCode](v7, "parseLocaleCode");
                  +[MSDSignedManifest setSignedManifest:](&OBJC_CLASS___MSDSignedManifest, "setSignedManifest:", v7);
                  v20 = v7;
                }

                else
                {
                  id v98 = sub_10003A95C();
                  v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
                    sub_100090DA4(v99);
                  }

                  v20 = 0LL;
                }

                id v4 = v145;
                goto LABEL_52;
              }

              id v97 = sub_10003A95C();
              v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
                sub_100090DE4((uint64_t)v34, (uint64_t)v40, v144);
              }

              goto LABEL_91;
            }

            id v118 = sub_10003A95C();
            v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
              sub_100090ED8(v119, v120, v121, v122, v123, v124, v125, v126);
            }

            goto LABEL_86;
          }
        }

        id v70 = sub_10003A95C();
        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_100090D34(v71, v72, v73, v74, v75, v76, v77, v78);
        }
      }

      else
      {
        id v61 = sub_10003A95C();
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_100090CC4(v62, v63, v64, v65, v66, v67, v68, v69);
        }
      }

      v18 = 0LL;
      v20 = 0LL;
LABEL_52:
      v19 = v150;
LABEL_53:

      goto LABEL_54;
    }

    id v88 = sub_10003A95C();
    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_100091028(v89, v90, v91, v92, v93, v94, v95, v96);
    }

    v18 = 0LL;
LABEL_96:
    v20 = 0LL;
    goto LABEL_53;
  }

  v18 = 0LL;
LABEL_12:
  v20 = 0LL;
LABEL_54:

  return v20;
}

- (BOOL)isItemBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/"];
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/baseBackup"];
}

- (BOOL)isItemGreyMatterBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/greyMatter"];
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/systemContainer"];
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/provisioningProfile."];
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/configurationProfile"];
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return [a3 hasPrefix:@"criticalSystemPreferences"];
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return [a3 hasPrefix:@"/SystemApps"];
}

- (BOOL)isItemApp:(id)a3
{
  return [a3 hasPrefix:@"/Apps/"];
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return [a3 hasPrefix:@"/Packages/"];
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:]( self,  "getSettingsFromSection:forIdentifier:",  @"BackupData",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if (-[MSDSignedManifestV7 isItemApp:](self, "isItemApp:", v4)) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"/Apps/", "length")));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if (-[MSDSignedManifestV7 isItemStandAlonePackage:](self, "isItemStandAlonePackage:", v4)) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"/Packages/", "length")));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return [a3 hasPrefix:@"/ConfigurationProfiles/"];
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if (-[MSDSignedManifestV7 isItemConfigurationProfile:](self, "isItemConfigurationProfile:", v4)) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"/ConfigurationProfiles/", "length")));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)getLocaleCode
{
  return -[MSDSignedManifestV7 localeCodeStr](self, "localeCodeStr");
}

- (id)getBackupList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"BackupData"]);

  return v3;
}

- (id)getAppDependecies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Apps"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Dependencies"]);

  return v9;
}

- (id)getSystemAppDependecies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"SystemApps"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Dependencies"]);

  return v9;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Info"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"AppPrivacyPermissions"]);
  return v9;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getSystemAppDataList](self, "getSystemAppDataList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Manifest"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Info"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"AppPrivacyPermissions"]);

  return v9;
}

- (int64_t)getAppType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v6 = [v5 macOS];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Apps"]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Manifest"]);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Info"]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"AppType"]);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Info"]);
        Class v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"AppType"]);

        int64_t v16 = (int64_t)[v15 unsignedIntegerValue];
      }

      else
      {
        int64_t v16 = 0LL;
      }
    }

    else
    {
      int64_t v16 = 0LL;
    }
  }

  else
  {
    int64_t v16 = 2LL;
  }

  return v16;
}

- (id)getAppFileSize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Apps"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Size"]);
  return v10;
}

- (id)getAppRealSize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Apps"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);

  if (!v9)
  {
    id v14 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100091098();
    }
    goto LABEL_12;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"RealSize"]);
  if (!v10)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Size"]);
    v12 = v11;
    if (v11)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  2LL * (void)-[os_log_s unsignedLongLongValue](v11, "unsignedLongLongValue")));
LABEL_5:

      goto LABEL_6;
    }

    id v15 = sub_10003A95C();
    int64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100091104();
    }

LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_5;
  }

- (id)getStandAlonePackageFileSize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Packages"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Size"]);
  return v10;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Packages"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);

  if (!v9)
  {
    id v14 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100091170();
    }
    goto LABEL_12;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"RealSize"]);
  if (!v10)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Size"]);
    v12 = v11;
    if (v11)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  2LL * (void)-[os_log_s unsignedLongLongValue](v11, "unsignedLongLongValue")));
LABEL_5:

      goto LABEL_6;
    }

    id v15 = sub_10003A95C();
    int64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000911DC();
    }

LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_5;
  }

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifestV7 getManifestDataFromSection:forIdentifier:]( self,  "getManifestDataFromSection:forIdentifier:",  v6,  v7));
  v9 = v8;
  if (v8)
  {
    id v27 = v7;
    id v28 = v6;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v26 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          v17 = objc_autoreleasePoolPush();
          v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v16]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"MSDManifestFileAttributes"]);

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fileType]);
            unsigned int v21 = [v20 isEqualToString:NSFileTypeRegular];

            if (v21) {
              v13 += (uint64_t)[v19 fileSize];
            }
          }

          objc_autoreleasePoolPop(v17);
        }

        id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v12);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
    id v7 = v27;
    id v6 = v28;
    v9 = v26;
  }

  else
  {
    id v24 = sub_10003A95C();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100091248();
    }

    v22 = 0LL;
  }

  return v22;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27.NSUInteger location = location;
    v27.NSUInteger length = length;
    uint64_t v8 = NSStringFromRange(v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Merging manifest item %{public}@", buf, 0xCu);
  }

  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  if (location < location + length)
  {
    do
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:location]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(@"/BackupData/", "length")));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getBackupList](self, "getBackupList"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Manifest"]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Data"]);

      if (-[MSDSignedManifestV7 isItemSystemContainerBackup:](self, "isItemSystemContainerBackup:", v12))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
        unsigned int v18 = [v17 watchOS];

        id v19 = sub_10003A95C();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (!v18)
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "System container backup only allowed on Watch devices.",  buf,  2u);
          }

          goto LABEL_13;
        }

        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "System container backup found. Start restoring UUID paths...",  buf,  2u);
        }

        uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSString restoreSystemContainerUUIDPathsInDict:]( &OBJC_CLASS___NSString,  "restoreSystemContainerUUIDPathsInDict:",  v16));
        uint64_t v16 = (void *)v22;
      }

      [v24 addEntriesFromDictionary:v16];
LABEL_13:

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
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder"));
  v9 = v8;
  NSUInteger v10 = location + length;
  if (location >= location + length)
  {
    BOOL v13 = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:location]);
    unsigned __int8 v12 = [v11 isEqualToString:@"/BackupData/systemContainer"];

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
        v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v14]);
        unsigned int v18 = [v17 isEqualToString:@"/BackupData/systemContainer"];

        NSUInteger v14 = v16 + 1;
        --v15;
      }

      while (!v18);
      BOOL v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)getComponentVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v15 = sub_10003A95C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000912C0();
    }
    goto LABEL_12;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Info"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v8, "objectForKey:", @"CFBundleShortVersionString"));
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  unsigned __int8 v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009132C();
    }

LABEL_12:
    BOOL v13 = 0LL;
    goto LABEL_6;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    v17 = "-[MSDSignedManifestV7 getComponentVersion:]";
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    BOOL v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s - appName:%{public}@ componentVersion:%{public}@",  (uint8_t *)&v16,  0x20u);
  }

  BOOL v13 = v9;
  uint64_t v8 = v13;
LABEL_6:

  return v13;
}

- (id)getAppManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getAppList](self, "getAppList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Info"]);

  return v8;
}

- (id)getBackupSectionName
{
  return @"BackupData";
}

- (id)getStandAlonePackageVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getStandAlonePackageList](self, "getStandAlonePackageList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v15 = sub_10003A95C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100091398();
    }
    goto LABEL_12;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Info"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v8, "objectForKey:", @"Version"));
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  unsigned __int8 v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100091404();
    }

LABEL_12:
    BOOL v13 = 0LL;
    goto LABEL_6;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    v17 = "-[MSDSignedManifestV7 getStandAlonePackageVersion:]";
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    BOOL v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s - pkgName:%{public}@ pkgVersion:%{public}@",  (uint8_t *)&v16,  0x20u);
  }

  BOOL v13 = v9;
  uint64_t v8 = v13;
LABEL_6:

  return v13;
}

- (id)getStandAlonePackageList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Packages"]);

  return v3;
}

- (id)getAppList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Apps"]);

  return v3;
}

- (id)getInstallationOrderAppsPrefix
{
  return @"/Apps/";
}

- (id)getInstallationOrderSystemApps
{
  return @"/SystemApps";
}

- (BOOL)checkPlatformTypeForAllComponents
{
  if (+[MSDPlatform iOSHub](&OBJC_CLASS___MSDPlatform, "iOSHub")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v4 platformType]);

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  id v6 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = &AATermsEntryDevice_ptr;
    uint64_t v9 = *(void *)v49;
    uint64_t v41 = v5;
    uint64_t v38 = *(void *)v49;
    uint64_t v39 = self;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v10);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload", v38, v39));
        id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);
        uint64_t v15 = objc_opt_class(v8[195], v14);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0
          || ([v11 isEqualToString:@"Info"] & 1) != 0
          || ([v11 isEqualToString:@"InstallationOrder"] & 1) != 0)
        {
          goto LABEL_11;
        }

        unsigned __int8 v16 = [v11 isEqualToString:@"Certificates"];

        if ((v16 & 1) == 0)
        {
          id v42 = v7;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
          v40 = v11;
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v11]);

          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          id v13 = v18;
          id v19 = [v13 countByEnumeratingWithState:&v44 objects:v60 count:16];
          if (!v19)
          {
            unsigned __int8 v12 = v13;
            goto LABEL_28;
          }

          id v20 = v19;
          uint64_t v21 = *(void *)v45;
LABEL_17:
          uint64_t v22 = 0LL;
          while (1)
          {
            if (*(void *)v45 != v21) {
              objc_enumerationMutation(v13);
            }
            uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * v22);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v23]);
            v25 = @"Manifest";
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"Manifest"]);

            if (!v26)
            {
              v25 = @"Settings";
              NSRange v27 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"Settings"]);

              if (!v27) {
                break;
              }
            }

            id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v25]);
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"Info"]);

            if (!v29) {
              break;
            }
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"PlatformType"]);
            unsigned __int8 v31 = [v43 isEqualToString:v30];

            if ((v31 & 1) == 0)
            {
              id v35 = sub_10003A95C();
              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"PlatformType"]);
                *(_DWORD *)buf = 138544130;
                id v53 = v37;
                __int16 v54 = 2114;
                uint64_t v55 = v43;
                __int16 v56 = 2114;
                uint64_t v57 = v23;
                __int16 v58 = 2114;
                uint64_t v59 = v40;
                _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "PlatformType (%{public}@) in the manifest does not match the one that we are running on (%{public}@) f or item: %{public}@ under component: %{public}@",  buf,  0x2Au);
              }

LABEL_33:
              uint64_t v5 = v41;

              BOOL v3 = 0;
              goto LABEL_34;
            }

            if (v20 == (id)++v22)
            {
              id v20 = [v13 countByEnumeratingWithState:&v44 objects:v60 count:16];
              if (v20) {
                goto LABEL_17;
              }
              unsigned __int8 v12 = v13;
              uint64_t v5 = v41;
              uint64_t v9 = v38;
              self = v39;
              uint64_t v8 = &AATermsEntryDevice_ptr;
LABEL_28:
              id v7 = v42;
LABEL_11:

              goto LABEL_12;
            }
          }

          id v33 = sub_10003A95C();
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
            sub_100091470();
          }
          goto LABEL_33;
        }

- (id)getComponentDataList:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  }

  else
  {
    id v8 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000914D8(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (id)getSystemAppDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SystemApps"]);

  return v3;
}

- (id)getSharedDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SharedAppData"]);

  return v3;
}

- (id)getUserDataList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"UserData"]);

  return v3;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100105FA0);
}

- (id)getAllFileHash
{
  return -[MSDSignedManifestV7 parseAllFileHash](self, "parseAllFileHash");
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  id v4 = a3;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_10000D5B0;
  v12[4] = sub_10000D5C0;
  uint64_t v13 = &stru_1000FB848;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathComponents]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000D5C8;
  v7[3] = &unk_1000F9478;
  v7[4] = self;
  v7[5] = v12;
  v7[6] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);

  return (char)self;
}

- (id)getManifestDataFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifest getManifestFromSection:forIdentifier:]( self,  "getManifestFromSection:forIdentifier:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Data"]);

  return v5;
}

- (id)getManifestInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifest getManifestFromSection:forIdentifier:]( self,  "getManifestFromSection:forIdentifier:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Info"]);

  return v5;
}

- (id)getSettingsFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifest getDictFromSection:forIdentifier:]( self,  "getDictFromSection:forIdentifier:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Settings"]);

  return v5;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:]( self,  "getSettingsFromSection:forIdentifier:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Data"]);

  return v5;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifestV7 getSettingsFromSection:forIdentifier:]( self,  "getSettingsFromSection:forIdentifier:",  a3,  a4));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Info"]);

  return v5;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location = a3.location;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest installationOrder](self, "installationOrder", a3.location, a3.length));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:location]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getBackupList](self, "getBackupList"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"OriginServer"]);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"."]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](self, "getDataSectionKeys"));
  if ([v7 containsObject:v6])
  {
    id v8 = v6;
  }

  else
  {
    id v10 = sub_10003A95C();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100091548();
    }

    id v8 = 0LL;
  }

  return v8;
}

- (void)parseNonContainerizedContentRootSet
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 getDataSectionKeys](self, "getDataSectionKeys"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (!-[MSDSignedManifest isContainerizedComponent:](self, "isContainerizedComponent:", v11, (void)v16))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestV7 parseSectionForContentRoot:](self, "parseSectionForContentRoot:", v13));
          uint64_t v15 = v14;
          if (v14 && [v14 count]) {
            -[NSMutableSet unionSet:](v3, "unionSet:", v15);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  -[MSDSignedManifestV7 setNonContainerizedContentRoots:](self, "setNonContainerizedContentRoots:", v3);
}

- (id)parseSectionForContentRoot:(id)a3
{
  id v3 = a3;
  NSRange v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v24 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    id v4 = @"/";
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * v5)]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Manifest"]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Data"]);

        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v28 = v8;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            uint64_t v13 = 0LL;
            do
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v13);
              uint64_t v15 = objc_autoreleasePoolPush();
              if (([v14 isEqualToString:v4] & 1) == 0)
              {
                __int128 v16 = v4;
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v14]);
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"MSDManifestFileExtendedAttributes"]);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"MSDAnnotation"]);

                if (v19)
                {
                  id v20 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v19,  4LL);
                  if (-[NSString isEqualToString:](v20, "isEqualToString:", @"ContentRoot")) {
                    -[NSMutableSet addObject:](v27, "addObject:", v14);
                  }
                }

                id v4 = v16;
              }

              objc_autoreleasePoolPop(v15);
              uint64_t v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }

          while (v11);
        }

        uint64_t v5 = v26 + 1;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v25);
  }

  return v27;
}

- (void)parseLocaleCode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSignedManifestV7 getSettingsDataFromSection:forIdentifier:]( self,  "getSettingsDataFromSection:forIdentifier:",  @"BackupData",  @"locale"));
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"language"]);
    if (v5)
    {
      id v6 = (os_log_s *)v5;
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region"]);
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v6,  v7));
        -[MSDSignedManifestV7 setLocaleCodeStr:](self, "setLocaleCodeStr:", v9);
      }

      else
      {
        id v12 = sub_10003A95C();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000916A8();
        }
      }
    }

    else
    {
      id v11 = sub_10003A95C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009162C();
      }
    }
  }

  else
  {
    id v10 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000915B0();
    }
  }
}

- (id)parseAllFileHash
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, a2);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v54 = [&off_100105FB8 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v79;
    id v3 = @"Manifest";
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v79 != v52) {
          objc_enumerationMutation(&off_100105FB8);
        }
        uint64_t v58 = v4;
        uint64_t v5 = *(void *)(*((void *)&v78 + 1) + 8 * v4);
        context = objc_autoreleasePoolPush();
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v75;
          id v60 = v8;
          do
          {
            id v12 = 0LL;
            do
            {
              if (*(void *)v75 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)v12);
              uint64_t v14 = objc_autoreleasePoolPush();
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v13]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v3]);
              __int128 v17 = v16;
              if (v16)
              {
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"Info"]);
                __int128 v19 = v18;
                if (v18)
                {
                  id v20 = v10;
                  uint64_t v21 = v11;
                  uint64_t v22 = v3;
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"Hash"]);
                  if (v23) {
                    [v2 addObject:v23];
                  }

                  id v3 = v22;
                  uint64_t v11 = v21;
                  id v10 = v20;
                  id v8 = v60;
                }
              }

              objc_autoreleasePoolPop(v14);
              id v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v74 objects:v85 count:16];
          }

          while (v10);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v4 = v58 + 1;
      }

      while ((id)(v58 + 1) != v54);
      id v54 = [&off_100105FB8 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }

    while (v54);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v47 = [&off_100105FD0 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v71;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v71 != v46) {
          objc_enumerationMutation(&off_100105FD0);
        }
        uint64_t v49 = v24;
        uint64_t v25 = *(void *)(*((void *)&v70 + 1) + 8 * v24);
        __int128 v48 = objc_autoreleasePoolPush();
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifest payload](self, "payload"));
        NSRange v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v25]);

        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v28 = v27;
        id v55 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
        if (v55)
        {
          id v51 = v28;
          uint64_t v53 = *(void *)v67;
          do
          {
            __int128 v29 = 0LL;
            do
            {
              if (*(void *)v67 != v53) {
                objc_enumerationMutation(v28);
              }
              uint64_t v30 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)v29);
              __int128 v31 = objc_autoreleasePoolPush();
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v30]);
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"Manifest"]);
              if (v33)
              {
                uint64_t v59 = v32;
                id v61 = v31;
                contexta = v33;
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"Data"]);
                __int128 v62 = 0u;
                __int128 v63 = 0u;
                __int128 v64 = 0u;
                __int128 v65 = 0u;
                id v35 = v34;
                id v36 = [v35 countByEnumeratingWithState:&v62 objects:v82 count:16];
                if (v36)
                {
                  id v37 = v36;
                  uint64_t v38 = *(void *)v63;
                  do
                  {
                    uint64_t v39 = 0LL;
                    do
                    {
                      if (*(void *)v63 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      uint64_t v40 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)v39);
                      uint64_t v41 = objc_autoreleasePoolPush();
                      id v42 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v40]);
                      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:@"MSDManifestFileHash"]);
                      if (v43) {
                        [v2 addObject:v43];
                      }

                      objc_autoreleasePoolPop(v41);
                      uint64_t v39 = (char *)v39 + 1;
                    }

                    while (v37 != v39);
                    id v37 = [v35 countByEnumeratingWithState:&v62 objects:v82 count:16];
                  }

                  while (v37);
                }

                id v28 = v51;
                __int128 v32 = v59;
                __int128 v31 = v61;
                __int128 v33 = contexta;
              }

              objc_autoreleasePoolPop(v31);
              __int128 v29 = (char *)v29 + 1;
            }

            while (v29 != v55);
            id v55 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
          }

          while (v55);
        }

        objc_autoreleasePoolPop(v48);
        uint64_t v24 = v49 + 1;
      }

      while ((id)(v49 + 1) != v47);
      id v47 = [&off_100105FD0 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }

    while (v47);
  }

  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v2));

  return v44;
}

- (NSString)localeCodeStr
{
  return self->_localeCodeStr;
}

- (void)setLocaleCodeStr:(id)a3
{
}

- (NSSet)nonContainerizedContentRoots
{
  return self->_nonContainerizedContentRoots;
}

- (void)setNonContainerizedContentRoots:(id)a3
{
}

- (void).cxx_destruct
{
}

@end