@interface MSDDemoManifestCheck
+ (MSDDemoManifestCheck)sharedInstance;
- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4;
- (BOOL)isManualSigning:(id)a3;
- (BOOL)isValidDataContainerFile:(id)a3;
- (BOOL)runAppLayoutSecurityCheck:(id)a3;
- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4;
- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5;
- (BOOL)runSecurityCheck:(id)a3;
- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6;
- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4;
- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3;
- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4;
- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4;
- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5;
- (MSDDemoManifestCheck)init;
- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4;
- (NSDictionary)itemBeingInstalled;
- (NSDictionary)segmentedManifestWithRigorousFlag;
- (NSMutableDictionary)allowedSymLinks;
- (NSMutableSet)blocklistedItems;
- (NSSet)allowedISTSignedComponents;
- (NSSet)settingsComponentNames;
- (NSString)checkType;
- (WhitelistChecker)whitelistChecker;
- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5;
- (__SecKey)createPublicKeyAppleISTSigning:(id)a3;
- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3;
- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3;
- (__SecKey)createPublicKeyForStrongSigning:(id)a3;
- (id)getAllowedISTSignedComponents:(id)a3;
- (id)getAllowedISTSignedComponentsFromManifest:(id)a3;
- (id)getAllowedSymLinks;
- (id)getBackupItemName:(id)a3;
- (id)getBackupSectionName;
- (id)getComponentData:(id)a3;
- (id)getInstallationOrder;
- (id)getManifestData:(id)a3;
- (id)getSecurityCheckSectionNames;
- (id)getSettingsComponentNames;
- (id)getappIconLayoutBackupName;
- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4;
- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5;
- (unsigned)manifestVersion;
- (void)registerEntitlementNotificationHandler;
- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4;
- (void)setAllowedISTSignedComponents:(id)a3;
- (void)setAllowedSymLinks:(id)a3;
- (void)setBlocklistedItems:(id)a3;
- (void)setCheckType:(id)a3;
- (void)setItemBeingInstalled:(id)a3;
- (void)setManifestVersion:(unsigned int)a3;
- (void)setSegmentedManifestWithRigorousFlag:(id)a3;
- (void)setSettingsComponentNames:(id)a3;
- (void)setWhitelistChecker:(id)a3;
@end

@implementation MSDDemoManifestCheck

+ (MSDDemoManifestCheck)sharedInstance
{
  if (qword_100125558 != -1) {
    dispatch_once(&qword_100125558, &stru_1000FA7C0);
  }
  return (MSDDemoManifestCheck *)(id)qword_100125550;
}

- (MSDDemoManifestCheck)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MSDDemoManifestCheck;
  v2 = -[MSDDemoManifestCheck init](&v15, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v11 = 0LL;
    goto LABEL_8;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedSymLinks](v2, "getAllowedSymLinks"));
  -[MSDDemoManifestCheck setAllowedSymLinks:](v3, "setAllowedSymLinks:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSettingsComponentNames](v3, "getSettingsComponentNames"));
  -[MSDDemoManifestCheck setSettingsComponentNames:](v3, "setSettingsComponentNames:", v5);

  v6 = objc_alloc_init(&OBJC_CLASS___WhitelistChecker);
  -[MSDDemoManifestCheck setWhitelistChecker:](v3, "setWhitelistChecker:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](v3, "whitelistChecker"));
  unsigned __int8 v8 = [v7 load];

  if ((v8 & 1) == 0)
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009DA0C();
    }

    goto LABEL_7;
  }

  v10 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, v9);
  -[MSDDemoManifestCheck setBlocklistedItems:](v3, "setBlocklistedItems:", v10);

  v11 = v3;
LABEL_8:

  return v11;
}

- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSDDemoManifestCheck;
  unsigned __int8 v8 = -[MSDDemoManifestCheck init](&v13, "init");
  uint64_t v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedSymLinks](v8, "getAllowedSymLinks"));
    -[MSDDemoManifestCheck setAllowedSymLinks:](v9, "setAllowedSymLinks:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSettingsComponentNames](v9, "getSettingsComponentNames"));
    -[MSDDemoManifestCheck setSettingsComponentNames:](v9, "setSettingsComponentNames:", v11);

    -[MSDDemoManifestCheck setWhitelistChecker:](v9, "setWhitelistChecker:", v6);
    -[MSDDemoManifestCheck setCheckType:](v9, "setCheckType:", v7);
  }

  return v9;
}

- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
  v10 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Info"]);
  id v12 = 0LL;
  if (!v11) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKey:@"MinimumOSVersion"]);
  }
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]( self,  "verifyManifestSignature:forDataSectionKeys:withOptions:",  v6,  v7,  v9));

  return v13;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  id v142 = a3;
  id v137 = a4;
  id v8 = a5;
  v145 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = sub_10003A95C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Verifying a separate component manifest.",  buf,  0xCu);
  }

  v136 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RigorousTestingOverride"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ExcludeBlocklistItem"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v12)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v142));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v13);
  }

  v14 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v142 allKeys]);
  v16 = -[NSMutableSet initWithArray:](v14, "initWithArray:", v15);

  v17 = (const __CFBoolean *)MGCopyAnswer(@"SigningFuse", 0LL);
  cf = v17;
  if (v17) {
    BOOL v18 = CFBooleanGetValue(v17) != 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v140 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v142 objectForKey:@"Certificates"]);
  v132 = v19;
  if (!v19)
  {
    id v121 = sub_10003A95C();
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10009DA38();
    }
    v36 = 0LL;
    v22 = 0LL;
    v23 = 0LL;
    v37 = 0LL;
    v24 = 0LL;
LABEL_102:

    if (cf) {
      CFRelease(cf);
    }
    id v118 = 0LL;
    goto LABEL_112;
  }

  v150 = self;
  v133 = v16;
  id v134 = v8;
  v135 = v11;
  __int128 v165 = 0u;
  __int128 v166 = 0u;
  __int128 v163 = 0u;
  __int128 v164 = 0u;
  obj = v19;
  id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v163,  v180,  16LL);
  if (!v20)
  {
    v22 = 0LL;
    v23 = 0LL;
    v24 = 0LL;
    goto LABEL_31;
  }

  id v21 = v20;
  v22 = 0LL;
  v23 = 0LL;
  v24 = 0LL;
  uint64_t v148 = *(void *)v164;
  while (2)
  {
    v25 = 0LL;
    v26 = v23;
    do
    {
      if (*(void *)v164 != v148) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(*((void *)&v163 + 1) + 8LL * (void)v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](obj, "objectForKey:", v27));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"TypeOfSignature"]);

      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"Certificate"]);
      if (!v23)
      {
        id v93 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10009DBCC();
        }
        v11 = v135;
        v16 = v133;
        v22 = v29;
        goto LABEL_96;
      }

      v22 = v29;
      if (!v29 || (uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray, v30), (objc_opt_isKindOfClass(v29, v31) & 1) == 0))
      {
        id v66 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10009DC38(v67, v68, v69, v70, v71, v72, v73, v74);
        }
LABEL_95:
        v11 = v135;
        v16 = v133;
LABEL_96:

        v36 = 0LL;
        v37 = 0LL;
        goto LABEL_102;
      }

      if (![v29 count])
      {
        id v94 = sub_10003A95C();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_10009DCA8(v67, v95, v96, v97, v98, v99, v100, v101);
        }
        goto LABEL_95;
      }

      if ([v23 isEqualToString:@"UAT"])
      {
        v32 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigning:]( v150,  "createPublicKeyForDevelopmentSigning:",  v29);
        v24 = @"Skip";
        if (!v32) {
          goto LABEL_93;
        }
LABEL_26:
        v34 = v22;
        goto LABEL_27;
      }

      v33 = -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v150, "createPublicKeyForStrongSigning:", v29);
      if (!v33)
      {
        v32 = -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v150, "createPublicKeyAppleISTSigning:", v29);
        v24 = @"AppleISTCertCheck";
        if (!v32)
        {
LABEL_93:
          id v102 = sub_10003A95C();
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            sub_10009DD18(v67, v103, v104, v105, v106, v107, v108, v109);
          }
          goto LABEL_95;
        }

        goto LABEL_26;
      }

      v32 = v33;
      v34 = v22;
      if (-[MSDDemoManifestCheck isManualSigning:](v150, "isManualSigning:", v22)) {
        v24 = @"Skip";
      }
      else {
        v24 = @"Default";
      }
LABEL_27:
      v178[0] = @"publicKey";
      v178[1] = @"TypeOfSignature";
      v179[0] = v32;
      v179[1] = v23;
      v178[2] = @"RigorousCheckType";
      v179[2] = v24;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v179,  v178,  3LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v145, "setObject:forKeyedSubscript:", v35, v27);

      v25 = (char *)v25 + 1;
      v22 = v34;
      v26 = v23;
    }

    while (v21 != v25);
    id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v163,  v180,  16LL);
    v22 = v34;
    if (v21) {
      continue;
    }
    break;
  }

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3
{
  return -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:]( self,  "secureManifestCheckForSegmentedManifest:options:",  a3,  0LL);
}

- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4
{
  id v6 = a3;
  id v47 = a4;
  uint64_t v48 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck itemBeingInstalled](self, "itemBeingInstalled"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TypeOfFiles"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
    {
      id v39 = sub_10003A95C();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10009DEDC();
      }
      goto LABEL_10;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
    unsigned int v15 = [v9 isEqualToString:v14];

    if (v15)
    {
      v44 = v9;
      v45 = v8;
      id v46 = v6;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Identifier"]);
      unsigned int v16 = [v43 rangeValue];
      int v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getInstallationOrder](self, "getInstallationOrder"));
      int v20 = v16 + v18;
      uint64_t v21 = v16 + v18 - 1;
      if ((int)(v16 + v18 - 1) >= 0)
      {
        while (1)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:v21]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupItemName:](self, "getBackupItemName:", v22));

          v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v23]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"Manifest"]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v25));

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v47]);
          if (v27) {
            break;
          }

          --v20;
          --v21;
          if (v20 < 1) {
            goto LABEL_7;
          }
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"RigorousCheckType"]);
        unsigned __int8 v37 = [v36 isEqualToString:@"Skip"];

        id v8 = v45;
        id v6 = v46;
        id v9 = v44;
        if ((v37 & 1) != 0) {
          goto LABEL_20;
        }
LABEL_19:
        if (MISValidateSignatureAndCopyInfo(v6, 0LL, &v48))
        {
LABEL_20:
          BOOL v30 = 1;
          goto LABEL_21;
        }

        id v42 = sub_10003A95C();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10009DDE8(v29);
        }
LABEL_10:

        BOOL v30 = 0;
LABEL_21:

        goto LABEL_22;
      }

- (__SecKey)createPublicKeyForStrongSigning:(id)a3
{
  id v4 = a3;
  uint64_t MobileStoreSigner = SecPolicyCreateMobileStoreSigner();
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v18, 2u);
    }

    id v9 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]( self,  "createPublicKey:usingPolicy:anchors:",  v4,  MobileStoreSigner,  0LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009DF48(v8, v11, v12, v13, v14, v15, v16, v17);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying development signing", v9, 2u);
  }

  id v7 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigningStandard:]( self,  "createPublicKeyForDevelopmentSigningStandard:",  v4);
  return v7;
}

- (__SecKey)createPublicKeyAppleISTSigning:(id)a3
{
  id v4 = a3;
  CFStringRef commonName = 0LL;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  uint64_t DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    id v37 = sub_10003A95C();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10009DFB8(v31, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_24;
  }

  uint64_t v8 = DemoDigitalCatalogSigning;
  if ([v4 count] != (id)2)
  {
    id v45 = sub_10003A95C();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10009E228();
    }
    goto LABEL_24;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData, v10);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) == 0)
  {
    v19 = 0LL;
    goto LABEL_21;
  }

  id v13 = objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v14 = (const UInt8 *)[v13 bytes];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v16 = CFDataCreate(kCFAllocatorDefault, v14, (CFIndex)[v15 length]);

  if (!v16)
  {
    id v46 = sub_10003A95C();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10009E028();
    }
LABEL_24:
    v19 = 0LL;
LABEL_36:
    v34 = 0LL;
    unsigned __int8 v35 = 0LL;
    goto LABEL_14;
  }

  SecCertificateRef v17 = SecCertificateCreateWithData(kCFAllocatorDefault, v16);
  uint64_t v18 = SecCertificateCopyOrganizationalUnit(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:0]);
  unsigned __int8 v21 = [v20 isEqualToString:@"1.2.840.113635.100.6.60"];

  if ((v21 & 1) == 0)
  {
    id v47 = sub_10003A95C();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10009E1C8();
    }
    goto LABEL_36;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSData, v23);
  char v25 = objc_opt_isKindOfClass(v22, v24);

  if ((v25 & 1) == 0)
  {
LABEL_21:
    v34 = 0LL;
    unsigned __int8 v35 = 0LL;
    goto LABEL_15;
  }

  id v26 = objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  uint64_t v27 = (const UInt8 *)[v26 bytes];
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  v29 = CFDataCreate(kCFAllocatorDefault, v27, (CFIndex)[v28 length]);

  if (!v29)
  {
    id v48 = sub_10003A95C();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10009E054();
    }
    goto LABEL_36;
  }

  BOOL v30 = SecCertificateCreateWithData(kCFAllocatorDefault, v29);
  SecCertificateCopyCommonName(v30, &commonName);
  uint64_t v31 = (id)commonName;
  if ((-[os_log_s isEqualToString:](v31, "isEqualToString:", @"DemoUnit CA") & 1) == 0)
  {
    id v49 = sub_10003A95C();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10009E160((uint64_t)&commonName, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_35;
  }

  uint64_t v32 = CFDataCreate(kCFAllocatorDefault, byte_100124868, dword_100124BF0);
  if (!v32)
  {
    id v57 = sub_10003A95C();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10009E080(v50, v58, v59, v60, v61, v62, v63, v64);
    }
    goto LABEL_35;
  }

  SecCertificateRef v33 = SecCertificateCreateWithData(kCFAllocatorDefault, v32);
  if (!v33)
  {
    id v65 = sub_10003A95C();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10009E0F0(v50, v66, v67, v68, v69, v70, v71, v72);
    }
LABEL_35:

    goto LABEL_36;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v33, 0LL));
  unsigned __int8 v35 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]( self,  "createPublicKey:usingPolicy:anchors:",  v4,  v8,  v34);
LABEL_14:

LABEL_15:
  return v35;
}

- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3
{
  id v4 = a3;
  Testuint64_t MobileStoreSigner = SecPolicyCreateTestMobileStoreSigner();
  if (TestMobileStoreSigner)
  {
    id v6 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]( self,  "createPublicKey:usingPolicy:anchors:",  v4,  TestMobileStoreSigner,  0LL);
  }

  else
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009E254(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5
{
  id v7 = a3;
  id v8 = (const __CFArray *)a5;
  SecTrustRef trust = 0LL;
  SecTrustResultType result = kSecTrustResultInvalid;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100079604;
  uint64_t v32 = sub_100079614;
  id v33 = 0LL;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  uint64_t v10 = (void *)v29[5];
  v29[5] = v9;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10007961C;
  v27[3] = &unk_1000FA7E8;
  v27[4] = &v28;
  [v7 enumerateObjectsUsingBlock:v27];
  uint64_t v11 = (const void *)v29[5];
  if (!v11)
  {
LABEL_14:
    uint64_t v12 = 0LL;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if (SecTrustCreateWithCertificates(v11, a4, &trust))
  {
    id v16 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E484();
    }
    goto LABEL_13;
  }

  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    id v26 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E414();
    }
    goto LABEL_13;
  }

  if (SecTrustEvaluate(trust, &result))
  {
    id v17 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E3A4();
    }
    goto LABEL_13;
  }

  if (result != kSecTrustResultProceed && result != kSecTrustResultUnspecified)
  {
    id v13 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E2C4();
    }
    goto LABEL_13;
  }

  uint64_t v12 = SecTrustCopyPublicKey(trust);
  if (!v12)
  {
    id v18 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E334(v14, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_13:

    goto LABEL_14;
  }

  if (a4) {
LABEL_15:
  }
    CFRelease(a4);
LABEL_16:
  if (trust)
  {
    CFRelease(trust);
    SecTrustRef trust = 0LL;
  }

  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_10003A95C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10009E5E8();
  }

  uint64_t v11 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  id v12 = v7;
  id v13 = [v12 bytes];
  CC_LONG v14 = [v12 length];

  CC_SHA1(v13, v14, v11);
  id v15 = v8;
  id v16 = (const uint8_t *)[v15 bytes];
  id v17 = [v15 length];

  OSStatus v18 = SecKeyRawVerify(a5, 0x8002u, v11, 0x14uLL, v16, (size_t)v17);
  free(v11);
  if (v18)
  {
    id v20 = sub_10003A95C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10009E564(v18, v21);
    }
  }

  return v18 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  id v4 = (const __CFData *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:0]);
  if (!v4 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v3), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    id v12 = sub_10003A95C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009E620(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_12;
  }

  id v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v4);
  if (!v6)
  {
    id v21 = sub_10003A95C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009E690(v13, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_12:

    id v8 = 0LL;
    goto LABEL_13;
  }

  id v7 = v6;
  SecCertificateCopyCommonName(v6, &commonName);
  CFRelease(v7);
  id v8 = (__CFString *)commonName;
  if (-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", @"Demo Content Signing"))
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "A certificate for manual signing is used.",  buf,  2u);
    }

    BOOL v11 = 1;
    goto LABEL_16;
  }

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:@"Apps"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AppType"]);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Dependencies"]);
  id v12 = v11;
  if (!v11
    || [v11 count] == (id)1
    && (id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"ProvisioningProfiles"]),
        v13,
        v13))
  {
    BOOL v14 = 1;
  }

  else
  {
    id v15 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009E700();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v13 = sub_10003A95C();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E72C(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v6));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v9);
  }

  -[MSDDemoManifestCheck setSegmentedManifestWithRigorousFlag:](self, "setSegmentedManifestWithRigorousFlag:", v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Version"]);
  -[MSDDemoManifestCheck setManifestVersion:](self, "setManifestVersion:", [v10 unsignedIntValue]);

  if (!-[MSDDemoManifestCheck runSecurityCheck:](self, "runSecurityCheck:", v7))
  {
    id v22 = sub_10003A95C();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009E79C(v14, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_11:

    BOOL v11 = 0;
    goto LABEL_6;
  }

  -[MSDDemoManifestCheck registerEntitlementNotificationHandler](self, "registerEntitlementNotificationHandler");
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)runSecurityCheck:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0LL;
  unsigned __int8 v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSecurityCheckSectionNames](self, "getSecurityCheckSectionNames"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getappIconLayoutBackupName](self, "getappIconLayoutBackupName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100079E80;
  v27[3] = &unk_1000FA838;
  id v11 = v5;
  id v28 = v11;
  uint64_t v29 = self;
  id v33 = &v34;
  id v12 = v4;
  id v30 = v12;
  id v13 = v6;
  id v31 = v13;
  id v14 = v7;
  id v32 = v14;
  [v10 enumerateKeysAndObjectsUsingBlock:v27];

  if (*((_BYTE *)v35 + 24))
  {
    id v15 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = "-[MSDDemoManifestCheck runSecurityCheck:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s:Cleared all checks for manifest. Approving future installations",  buf,  0xCu);
    }
  }

  else
  {
    id v19 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009E80C(v16, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  BOOL v17 = *((_BYTE *)v35 + 24) != 0;
  _Block_object_dispose(&v34, 8);

  return v17;
}

- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck settingsComponentNames](self, "settingsComponentNames"));
  unsigned int v15 = [v14 containsObject:v11];

  if (v15) {
    unsigned __int8 v16 = -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:]( self,  "runSettingsSecurityCheckForSection:component:",  v13,  v11);
  }
  else {
    unsigned __int8 v16 = -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]( self,  "runFileSecurityChecksForSection:dataType:options:",  v13,  v10,  v12);
  }
  BOOL v17 = v16;

  return v17;
}

- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"locale"])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Data"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"language"]);

    if (!v8)
    {
      id v16 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009E974();
      }
      goto LABEL_17;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"region"]);

    if (!v9)
    {
      id v10 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009E9E0();
      }
LABEL_17:

LABEL_11:
      BOOL v13 = 0;
      goto LABEL_12;
    }
  }

  else
  {
    if (![v6 isEqualToString:@"display"])
    {
      id v14 = sub_10003A95C();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_10009EAB8();
      }
      goto LABEL_11;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Data"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"HDR"]);

    if (!v12)
    {
      id v17 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009EA4C();
      }
      goto LABEL_17;
    }
  }

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4
{
  return -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:]( self,  "runFileSecurityChecksForSection:dataType:options:",  a3,  a4,  0LL);
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ExcludeBlocklistItem"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  LODWORD(a4) = [v12 macOS];

  if ((_DWORD)a4)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Data"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 checkManifest:v13]);

    if ([v11 BOOLValue])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
      [v16 addObjectsFromArray:v15];
    }

    else if (v15)
    {
      id v79 = sub_10003A95C();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10009EB78();
      }
      int v34 = 4;
LABEL_67:

      if (v34 == 4) {
        goto LABEL_83;
      }
      BOOL v72 = 1;
      goto LABEL_85;
    }

    id v83 = v10;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    id v23 = v13;
    id v24 = [v23 countByEnumeratingWithState:&v117 objects:v124 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v99 = v15;
      uint64_t v101 = v13;
      id obj = v8;
      v86 = v11;
      id v88 = v9;
      uint64_t v26 = 0LL;
      id v27 = 0LL;
      id v28 = 0LL;
      uint64_t v29 = *(void *)v118;
      while (2)
      {
        id v30 = 0LL;
        id v31 = v26;
        id v32 = v27;
        id v33 = v28;
        do
        {
          if (*(void *)v118 != v29) {
            objc_enumerationMutation(v23);
          }
          id v27 = *(id *)(*((void *)&v117 + 1) + 8LL * (void)v30);

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v27]);
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 valueForKey:@"MSDManifestFileAttributes"]);

          if (!v28)
          {
            id v70 = sub_10003A95C();
            uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
              sub_10009EB18();
            }

            id v28 = 0LL;
            int v34 = 4;
            goto LABEL_65;
          }

          id v30 = (char *)v30 + 1;
          id v31 = v26;
          id v32 = v27;
          id v33 = v28;
        }

        while (v25 != v30);
        id v25 = [v23 countByEnumeratingWithState:&v117 objects:v124 count:16];
        if (v25) {
          continue;
        }
        break;
      }

      int v34 = 0;
LABEL_65:
      id v11 = v86;
      id v8 = obj;
      unsigned int v15 = v99;

      id v9 = v88;
      BOOL v13 = v101;
    }

    else
    {
      int v34 = 0;
      uint64_t v26 = 0LL;
      id v28 = 0LL;
    }

    id v10 = v83;
    goto LABEL_67;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001061F8));
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v8));

  id v90 = (void *)v18;
  id v85 = v11;
  if ([v9 isEqualToString:v18])
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 checkManifest:v19]);

    if ([v11 BOOLValue])
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
      [v22 addObjectsFromArray:v21];
    }

    else if (v21)
    {
      id v91 = v21;
      id v80 = sub_10003A95C();
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_10009EB78();
      }

      unsigned __int8 v35 = 0LL;
      uint64_t v69 = 0LL;
      uint64_t v44 = 0LL;
      int v68 = 4;
      goto LABEL_61;
    }
  }

  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id v91 = v19;
  id v93 = [v91 countByEnumeratingWithState:&v113 objects:v123 count:16];
  if (!v93)
  {
    unsigned __int8 v35 = 0LL;
    uint64_t v69 = 0LL;
    uint64_t v44 = 0LL;
    int v68 = 0;
LABEL_61:
    uint64_t v38 = v90;
    goto LABEL_81;
  }

  uint64_t v82 = v19;
  id v84 = v10;
  unsigned __int8 v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v98 = 0LL;
  uint64_t v92 = *(void *)v114;
  uint64_t v38 = v90;
  char v37 = v91;
  id v87 = v17;
  id v89 = v9;
  while (2)
  {
    uint64_t v39 = 0LL;
    uint64_t v40 = v36;
    uint64_t v41 = v98;
    do
    {
      if (*(void *)v114 != v92)
      {
        uint64_t v42 = v39;
        objc_enumerationMutation(v37);
        uint64_t v39 = v42;
      }

      uint64_t v94 = v39;
      uint64_t v43 = *(void **)(*((void *)&v113 + 1) + 8 * v39);
      context = objc_autoreleasePoolPush();
      id v102 = v43;
      uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:v43]);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v97 valueForKey:@"MSDManifestFileAttributes"]);

      if (!v44)
      {
        id v73 = sub_10003A95C();
        uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_10009EB18();
        }
        id v19 = v82;
        goto LABEL_80;
      }

      unsigned int v45 = [v17 containsObject:v9];
      uint64_t v98 = v44;
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v44 valueForKey:@"NSFileType"]);

      uint64_t v96 = v46;
      unsigned __int8 v47 = [v46 isEqualToString:@"NSFileTypeRegular"];
      if (v45)
      {
        if (((v47 & 1) != 0
           || ([v46 isEqualToString:@"NSFileTypeDirectory"] & 1) != 0)
          && !-[MSDDemoManifestCheck isValidDataContainerFile:](self, "isValidDataContainerFile:", v102))
        {
          goto LABEL_77;
        }
      }

      else if ((v47 & 1) == 0 {
             && ([v46 isEqualToString:@"NSFileTypeDirectory"] & 1) == 0)
      }
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v97 valueForKey:@"MSDManifestSymbolicLinkTargetFile"]);

        __int128 v111 = 0u;
        __int128 v112 = 0u;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
        id v49 = [obja countByEnumeratingWithState:&v109 objects:v122 count:16];
        if (!v49)
        {

          unsigned __int8 v35 = v48;
          uint64_t v38 = v90;
LABEL_77:
          id v77 = sub_10003A95C();
          uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = v96;
            sub_10009EC78();
            goto LABEL_79;
          }

- (BOOL)runAppLayoutSecurityCheck:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v8 = [v7 macOS];

  if (v8)
  {
    -[NSMutableSet addObject:](v5, "addObject:", &off_100106528);
    -[NSMutableSet addObject:](v6, "addObject:", @"staff");
    id v9 = &off_100106210;
LABEL_7:
    id v14 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    goto LABEL_8;
  }

  -[NSMutableSet addObject:](v5, "addObject:", &off_100106540);
  -[NSMutableSet addObject:](v5, "addObject:", &off_100106558);
  -[NSMutableSet addObject:](v6, "addObject:", @"mobile");
  -[NSMutableSet addObject:](v6, "addObject:", @"wheel");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v11 = [v10 iOS];

  if (v11)
  {
    id v9 = &off_100106228;
    goto LABEL_7;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v13 = [v12 tvOS];

  if (v13)
  {
    id v9 = &off_100106240;
    goto LABEL_7;
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSSet);
LABEL_8:
  id v93 = v14;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v4));

  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = &AATermsEntryDevice_ptr;
    uint64_t v95 = *(void *)v97;
    *(void *)&__int128 v18 = 134218242LL;
    __int128 v89 = v18;
    id v91 = v16;
    id v90 = v5;
    uint64_t v94 = v6;
    do
    {
      uint64_t v21 = 0LL;
      id v92 = v19;
      do
      {
        if (*(void *)v97 != v95) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v96 + 1) + 8LL * (void)v21);
        id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22, v89));
        if (!v24 || (uint64_t v25 = objc_opt_class(v20[195], v23), (objc_opt_isKindOfClass(v24, v25) & 1) == 0))
        {
          id v86 = sub_10003A95C();
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10009ECEC();
          }
          goto LABEL_106;
        }

        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"MSDManifestSymbolicLinkTargetFile"]);
        if (v27)
        {
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v26);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0
            || (-[os_log_s isEqualToString:](v27, "isEqualToString:", &stru_1000FB848) & 1) == 0)
          {
            id v87 = sub_10003A95C();
            id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
              sub_10009ED4C();
            }

LABEL_106:
            int v35 = 6;
            goto LABEL_93;
          }
        }

        id v30 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"MSDManifestFileAttributes"]);
        if (v30)
        {
          uint64_t v31 = objc_opt_class(v20[195], v29);
          if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"NSFileType"]);
            if (v33 && (uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString, v32), (objc_opt_isKindOfClass(v33, v34) & 1) != 0))
            {
              if ([v33 isEqualToString:@"NSFileTypeDirectory"])
              {
                int v35 = 3;
                goto LABEL_46;
              }

              if ([v33 isEqualToString:@"NSFileTypeRegular"])
              {
                if (-[NSSet containsObject:](v93, "containsObject:", v22))
                {
                  char v37 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:NSFileOwnerAccountID]);
                  if (v37
                    && (uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber, v36), (objc_opt_isKindOfClass(v37, v38) & 1) != 0))
                  {
                    if ([v37 integerValue] == (id)501)
                    {
                      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:NSFileGroupOwnerAccountID]);

                      if (v39
                        && (uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSNumber, v40),
                            (objc_opt_isKindOfClass(v39, v41) & 1) != 0))
                      {
                        id v6 = v94;
                        if ((-[NSMutableSet containsObject:](v5, "containsObject:", v39) & 1) != 0)
                        {
                          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:NSFileOwnerAccountName]);
                          if (v43
                            && (uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSString, v42),
                                (objc_opt_isKindOfClass(v43, v44) & 1) != 0))
                          {
                            if ([v43 isEqualToString:@"mobile"])
                            {
                              unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:NSFileGroupOwnerAccountName]);

                              if (v45
                                && (uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSString, v46),
                                    (objc_opt_isKindOfClass(v45, v47) & 1) != 0))
                              {
                                id v5 = v90;
                                if ((-[NSMutableSet containsObject:](v94, "containsObject:", v45) & 1) != 0)
                                {
                                  id v49 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:NSFilePosixPermissions]);
                                  if (v49
                                    && (uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNumber, v48),
                                        (objc_opt_isKindOfClass(v49, v50) & 1) != 0))
                                  {
                                    if (((unint64_t)[v49 integerValue] & 0xC00) == 0)
                                    {
                                      int v35 = 1;
                                      goto LABEL_42;
                                    }

                                    id v81 = sub_10003A95C();
                                    id v70 = (void *)objc_claimAutoreleasedReturnValue(v81);
                                    if (!os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      int v35 = 6;
LABEL_78:
                                      id v5 = v90;
LABEL_42:

LABEL_43:
                                      id v6 = v94;
LABEL_44:

                                      id v16 = v91;
LABEL_45:

                                      id v19 = v92;
                                      goto LABEL_46;
                                    }

                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v101 = v22;
                                    uint64_t v71 = (os_log_s *)v70;
                                    BOOL v72 = "IS&T signed component contains setuid item: %{public}@";
                                  }

                                  else
                                  {
                                    id v69 = sub_10003A95C();
                                    id v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
                                    if (!os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_77;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v101 = v22;
                                    uint64_t v71 = (os_log_s *)v70;
                                    BOOL v72 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }

                                  _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  v72,  buf,  0xCu);
                                  goto LABEL_77;
                                }

                                id v80 = sub_10003A95C();
                                id v49 = (void *)objc_claimAutoreleasedReturnValue(v80);
                                if (!os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  int v35 = 6;
                                  goto LABEL_42;
                                }

                                *(_DWORD *)buf = 138543618;
                                uint64_t v101 = (uint64_t)v94;
                                __int16 v102 = 2114;
                                uint64_t v103 = v22;
                                unsigned __int8 v66 = (os_log_s *)v49;
                                id v67 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                uint32_t v68 = 22;
                              }

                              else
                              {
                                id v65 = sub_10003A95C();
                                id v49 = (void *)objc_claimAutoreleasedReturnValue(v65);
                                id v5 = v90;
                                if (!os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_75;
                                }
                                *(_DWORD *)buf = 138543362;
                                uint64_t v101 = v22;
                                unsigned __int8 v66 = (os_log_s *)v49;
                                id v67 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                uint32_t v68 = 12;
                              }

                              _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, v68);
                              goto LABEL_75;
                            }

                            id v79 = sub_10003A95C();
                            id v49 = (void *)objc_claimAutoreleasedReturnValue(v79);
                            if (!os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              int v35 = 6;
                              unsigned int v45 = v43;
                              goto LABEL_78;
                            }

                            *(_DWORD *)buf = 138543618;
                            uint64_t v101 = (uint64_t)@"mobile";
                            __int16 v102 = 2114;
                            uint64_t v103 = v22;
                            uint64_t v62 = (os_log_s *)v49;
                            uint64_t v63 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            uint32_t v64 = 22;
                          }

                          else
                          {
                            id v61 = sub_10003A95C();
                            id v49 = (void *)objc_claimAutoreleasedReturnValue(v61);
                            if (!os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_73;
                            }
                            *(_DWORD *)buf = 138543362;
                            uint64_t v101 = v22;
                            uint64_t v62 = (os_log_s *)v49;
                            uint64_t v63 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            uint32_t v64 = 12;
                          }

                          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v63, buf, v64);
                          goto LABEL_73;
                        }

                        id v78 = sub_10003A95C();
                        unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(v78);
                        if (!os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          int v35 = 6;
                          goto LABEL_44;
                        }

                        *(_DWORD *)buf = 138543618;
                        uint64_t v101 = (uint64_t)v5;
                        __int16 v102 = 2114;
                        uint64_t v103 = v22;
                        id v58 = (os_log_s *)v45;
                        id v59 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        uint32_t v60 = 22;
                      }

                      else
                      {
                        id v57 = sub_10003A95C();
                        unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(v57);
                        id v6 = v94;
                        if (!os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_71;
                        }
                        *(_DWORD *)buf = 138543362;
                        uint64_t v101 = v22;
                        id v58 = (os_log_s *)v45;
                        id v59 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        uint32_t v60 = 12;
                      }

                      _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, v59, buf, v60);
                      goto LABEL_71;
                    }

                    id v77 = sub_10003A95C();
                    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(v77);
                    if (!os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      int v35 = 6;
                      uint64_t v39 = v37;
                      goto LABEL_43;
                    }

                    *(_DWORD *)buf = v89;
                    uint64_t v101 = 501LL;
                    __int16 v102 = 2114;
                    uint64_t v103 = v22;
                    uint64_t v54 = (os_log_s *)v45;
                    uint64_t v55 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    uint32_t v56 = 22;
                  }

                  else
                  {
                    id v53 = sub_10003A95C();
                    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(v53);
                    if (!os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_69;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v101 = v22;
                    uint64_t v54 = (os_log_s *)v45;
                    uint64_t v55 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    uint32_t v56 = 12;
                  }

                  _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, v56);
                  goto LABEL_69;
                }

                id v76 = sub_10003A95C();
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v101 = v22;
                  uint64_t v74 = (os_log_s *)v39;
                  id v75 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }

              else
              {
                id v73 = sub_10003A95C();
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v101 = v22;
                  uint64_t v74 = (os_log_s *)v39;
                  id v75 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }

            else
            {
              id v52 = sub_10003A95C();
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v101 = v22;
                uint64_t v74 = (os_log_s *)v39;
                id v75 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v75, buf, 0xCu);
              }
            }

            int v35 = 6;
            goto LABEL_45;
          }
        }

        id v51 = sub_10003A95C();
        id v33 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v101 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_ERROR,  "IS&T signed component in wrong format (no file attributes) for %{public}@",  buf,  0xCu);
        }

        int v35 = 6;
LABEL_46:

        if (v35 != 3) {
          goto LABEL_93;
        }
        uint64_t v21 = (char *)v21 + 1;
        uint64_t v20 = &AATermsEntryDevice_ptr;
      }

      while (v19 != v21);
      id v82 = [v16 countByEnumeratingWithState:&v96 objects:v104 count:16];
      id v19 = v82;
    }

    while (v82);
  }

  int v35 = 0;
LABEL_93:

  if (v35) {
    BOOL v83 = v35 == 6;
  }
  else {
    BOOL v83 = 1;
  }
  BOOL v84 = !v83;

  return v84;
}

- (void)registerEntitlementNotificationHandler
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B9E8;
  v5[3] = &unk_1000F9508;
  v5[4] = self;
  id v4 = [v3 addObserverForName:@"CheckEntitlementsNotify" object:0 queue:0 usingBlock:v5];
}

- (id)getSecurityCheckSectionNames
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v3 = [v2 macOS];

    if (v3) {
      id v4 = &off_100106258;
    }
    else {
      id v4 = &off_100106270;
    }
  }

  else
  {
    id v4 = &off_100106288;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
}

- (id)getManifestData:(id)a3
{
  id v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    id v6 = objc_msgSend(v4, "objectForKey:ofType:", @"Data", objc_opt_class(NSDictionary, v5));
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = v4;
  }

  unsigned int v8 = v7;

  return v8;
}

- (id)getComponentData:(id)a3
{
  id v3 = a3;
  id v4 = @"Manifest";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Manifest"]);

  if (v5
    || (id v4 = @"Settings",
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Settings"]),
        v7,
        v7))
  {
    id v8 = objc_msgSend(v3, "objectForKey:ofType:", v4, objc_opt_class(NSDictionary, v6));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)getBackupSectionName
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7) {
    return @"BackupData";
  }
  else {
    return @"Backup";
  }
}

- (id)getappIconLayoutBackupName
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") != 7) {
    return @"backup.Merge.AppIconLayout";
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v3 = [v2 macOS];

  if (v3) {
    return @"dockLayout";
  }
  else {
    return @"appIconLayout";
  }
}

- (id)getInstallationOrder
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"InstallationOrder"]);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CriticalComponents"]);
    if (v6) {
      [v3 addObjectsFromArray:v6];
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Components"]);
    if (v7) {
      [v3 addObjectsFromArray:v7];
    }
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"InstallationOrder"]);
  }

  return v3;
}

- (id)getBackupItemName:(id)a3
{
  id v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7) {
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"/BackupData/", "length")));
  }
  else {
    id v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)isValidDataContainerFile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);
  id v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      unint64_t v6 = 0LL;
      int v7 = 0;
      do
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
        unsigned int v9 = [v8 isEqualToString:@".."];

        if (v9)
        {
          if (!v7)
          {
            id v14 = sub_10003A95C();
            unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              sub_10009EE0C();
            }
            goto LABEL_12;
          }

          int v10 = -1;
        }

        else
        {
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
          unsigned int v12 = [v11 isEqualToString:@"."];

          int v10 = v12 ^ 1;
        }

        v7 += v10;
        ++v6;
      }

      while ((unint64_t)[v5 count] > v6);
    }

    BOOL v13 = 1;
  }

  else
  {
    id v17 = sub_10003A95C();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009EDAC();
    }
LABEL_12:

    BOOL v13 = 0;
  }

  return v13;
}

- (id)getAllowedSymLinks
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  if ([v3 iOS])
  {

LABEL_4:
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001062A0));
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.carrier");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator_1.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator_2.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator.merged.plist");
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"/var/db/timezone/zoneinfo"));
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v7, @"/var/db/timezone/localtime");

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001062B8));
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v8, @"/var/mobile/Media/Books");

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"/var/mobile/Library/Shortcuts/ToolKit"));
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v9,  @"/var/mobile/Library/Shortcuts/ToolKit/Tools-active");

    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"Binaries/0/Debug-xros"));
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v10,  @"/var/mobile/XcodeBuiltProducts/PressDemoScripts.xctestproducts/Tests/0/Debug-xros");

    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[NSMutableSet addObject:](v11, "addObject:", @"/var/mobile/Containers/Data/Application/");
    -[NSMutableSet addObject:](v11, "addObject:", @"/var/mobile/Containers/Shared/AppGroup/");
    -[NSMutableSet addObject:](v11, "addObject:", @"/var/mobile/Containers/Shared/Extension/");
    -[NSMutableSet addObject:](v11, "addObject:", @"/var/mobile/Library/Cookies");
    -[NSMutableSet addObject:]( v11,  "addObject:",  @"/private/var/mobile/Library/Preferences/com.apple.PeoplePicker.plist");
    -[NSMutableSet addObject:]( v11,  "addObject:",  @"/private/var/mobile/Library/Preferences/.GlobalPreferences.plist");
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v11, @"/var/mobile/Containers/");

    return v2;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v5 = [v4 rOS];

  if (v5) {
    goto LABEL_4;
  }
  return v2;
}

- (id)getAllowedISTSignedComponents:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"BackupData",  @"appIconLayout"));
  v12[0] = v6;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"BackupData",  @"dockLayout"));
  v12[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[MSDDemoManifestCheck getAllowedISTSignedComponentsFromManifest:]( self,  "getAllowedISTSignedComponentsFromManifest:",  v4));
  [v5 addObjectsFromArray:v8];
  [v5 addObjectsFromArray:v9];
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v5));

  return v10;
}

- (id)getAllowedISTSignedComponentsFromManifest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v4 addObject:@"com.retailtech.arkenstone"];
  [v4 addObject:@"com.apple.ist.DigitalCatalog"];
  [v4 addObject:@"com.apple.ist.demoloop"];
  [v4 addObject:@"com.apple.ist.windward"];
  [v4 addObject:@"com.apple.ist.DemoDiscoveryApp"];
  [v4 addObject:@"com.apple.ist.DigitalSignage.iOS"];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v24 = v3;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Apps"]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v4;
  id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        int v7 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * v6)]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Manifest"]);
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Dependencies"]);

        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v38;
          uint64_t v30 = *(void *)v38;
          id v31 = v10;
          do
          {
            id v14 = 0LL;
            id v32 = v12;
            do
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              unsigned int v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v14);
              if (([v15 isEqualToString:@"ProvisioningProfiles"] & 1) == 0)
              {
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v15]);
                __int128 v33 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                __int128 v36 = 0u;
                id v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v17)
                {
                  id v18 = v17;
                  uint64_t v19 = *(void *)v34;
                  do
                  {
                    for (i = 0LL; i != v18; i = (char *)i + 1)
                    {
                      if (*(void *)v34 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v15,  *(void *)(*((void *)&v33 + 1) + 8LL * (void)i)));
                      [v5 addObject:v21];
                    }

                    id v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }

                  while (v18);
                }

                uint64_t v13 = v30;
                id v10 = v31;
                id v12 = v32;
              }

              id v14 = (char *)v14 + 1;
            }

            while (v14 != v12);
            id v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }

          while (v12);
        }

        uint64_t v6 = v29 + 1;
      }

      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }

    while (v28);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  return v22;
}

- (id)getSettingsComponentNames
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001062D0);
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v62;
    id v12 = &AATermsEntryDevice_ptr;
    __int128 v40 = self;
    id v41 = v6;
    uint64_t v38 = *(void *)v62;
    id v39 = v7;
    do
    {
      uint64_t v13 = 0LL;
      id v42 = v10;
      do
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v46 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)v13);
        id v14 = objc_msgSend(v6, "objectForKey:ofType:", v46, objc_opt_class(v12[209], v9));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](self, "getComponentData:", v15));
          if (v16)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v16));
            if (v18)
            {
              __int128 v43 = v16;
              __int128 v44 = v15;
              unsigned int v45 = v13;
              uint64_t v19 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v17);
              __int128 v57 = 0u;
              __int128 v58 = 0u;
              __int128 v59 = 0u;
              __int128 v60 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
              id v20 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v48 = *(void *)v58;
                do
                {
                  for (i = 0LL; i != v21; i = (char *)i + 1)
                  {
                    if (*(void *)v58 != v48) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
                    __int128 v53 = 0u;
                    __int128 v54 = 0u;
                    __int128 v55 = 0u;
                    __int128 v56 = 0u;
                    id v24 = v18;
                    id v25 = [v24 countByEnumeratingWithState:&v53 objects:v72 count:16];
                    if (v25)
                    {
                      id v26 = v25;
                      uint64_t v27 = *(void *)v54;
                      do
                      {
                        for (j = 0LL; j != v26; j = (char *)j + 1)
                        {
                          if (*(void *)v54 != v27) {
                            objc_enumerationMutation(v24);
                          }
                          uint64_t v29 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
                          if ((objc_msgSend(v29, "isEqualToString:", v23, v38) & 1) != 0
                            || [v29 hasPrefix:v23])
                          {
                            [v19 addObject:v29];
                          }
                        }

                        id v26 = [v24 countByEnumeratingWithState:&v53 objects:v72 count:16];
                      }

                      while (v26);
                    }
                  }

                  id v21 = [obj countByEnumeratingWithState:&v57 objects:v73 count:16];
                }

                while (v21);
              }

              __int128 v51 = 0u;
              __int128 v52 = 0u;
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              id v30 = v19;
              id v31 = [v30 countByEnumeratingWithState:&v49 objects:v71 count:16];
              id v7 = v39;
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = *(void *)v50;
                do
                {
                  for (k = 0LL; k != v32; k = (char *)k + 1)
                  {
                    if (*(void *)v50 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v35 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)k);
                    id v36 = sub_10003A95C();
                    __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      uint64_t v66 = v35;
                      __int16 v67 = 2114;
                      id v68 = v39;
                      __int16 v69 = 2114;
                      uint64_t v70 = v46;
                      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Excluding %{public}@ from section: %{public}@ component:%{public}@",  buf,  0x20u);
                    }

                    [v18 removeObjectForKey:v35];
                  }

                  id v32 = [v30 countByEnumeratingWithState:&v49 objects:v71 count:16];
                }

                while (v32);
              }

              self = v40;
              id v6 = v41;
              uint64_t v11 = v38;
              id v12 = &AATermsEntryDevice_ptr;
              id v10 = v42;
              id v16 = v43;
              unsigned int v15 = v44;
              uint64_t v13 = v45;
            }
          }
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v10);
      id v10 = [v6 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }

    while (v10);
  }
}

- (unsigned)manifestVersion
{
  return self->_manifestVersion;
}

- (void)setManifestVersion:(unsigned int)a3
{
  self->_manifestVersion = a3;
}

- (NSDictionary)segmentedManifestWithRigorousFlag
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSegmentedManifestWithRigorousFlag:(id)a3
{
}

- (NSMutableDictionary)allowedSymLinks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAllowedSymLinks:(id)a3
{
}

- (NSSet)allowedISTSignedComponents
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAllowedISTSignedComponents:(id)a3
{
}

- (WhitelistChecker)whitelistChecker
{
  return (WhitelistChecker *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setWhitelistChecker:(id)a3
{
}

- (NSDictionary)itemBeingInstalled
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setItemBeingInstalled:(id)a3
{
}

- (NSString)checkType
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCheckType:(id)a3
{
}

- (NSSet)settingsComponentNames
{
  return (NSSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSettingsComponentNames:(id)a3
{
}

- (NSMutableSet)blocklistedItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setBlocklistedItems:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end