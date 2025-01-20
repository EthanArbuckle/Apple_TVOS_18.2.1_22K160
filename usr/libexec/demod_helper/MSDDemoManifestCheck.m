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
  if (qword_10004F838 != -1) {
    dispatch_once(&qword_10004F838, &stru_100044CA8);
  }
  return (MSDDemoManifestCheck *)(id)qword_10004F830;
}

- (MSDDemoManifestCheck)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MSDDemoManifestCheck;
  v2 = -[MSDDemoManifestCheck init](&v14, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v10 = 0LL;
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
    id v11 = sub_100021D84();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000280E4();
    }

    goto LABEL_7;
  }

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  -[MSDDemoManifestCheck setBlocklistedItems:](v3, "setBlocklistedItems:", v9);

  v10 = v3;
LABEL_8:

  return v10;
}

- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MSDDemoManifestCheck;
  unsigned __int8 v8 = -[MSDDemoManifestCheck init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedSymLinks](v8, "getAllowedSymLinks"));
    -[MSDDemoManifestCheck setAllowedSymLinks:](v9, "setAllowedSymLinks:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSettingsComponentNames](v9, "getSettingsComponentNames"));
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
  unsigned __int8 v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Info"]);
  id v11 = 0LL;
  if (!v10) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKey:@"MinimumOSVersion"]);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]( self,  "verifyManifestSignature:forDataSectionKeys:withOptions:",  v6,  v7,  v8));

  return v12;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  id v140 = a3;
  id v135 = a4;
  id v8 = a5;
  v143 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = sub_100021D84();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Verifying a separate component manifest.",  buf,  0xCu);
  }

  v134 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RigorousTestingOverride"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ExcludeBlocklistItem"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v12)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v140));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v13);
  }

  objc_super v14 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v140 allKeys]);
  v16 = -[NSMutableSet initWithArray:](v14, "initWithArray:", v15);

  v17 = (const __CFBoolean *)MGCopyAnswer(@"SigningFuse", 0LL);
  cf = v17;
  if (v17) {
    BOOL v18 = CFBooleanGetValue(v17) != 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v138 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKey:@"Certificates"]);
  v130 = v19;
  if (!v19)
  {
    id v119 = sub_100021D84();
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_100028110();
    }
    v35 = 0LL;
    v22 = 0LL;
    v23 = 0LL;
    v36 = 0LL;
    v24 = 0LL;
LABEL_102:

    if (cf) {
      CFRelease(cf);
    }
    id v116 = 0LL;
    goto LABEL_112;
  }

  v148 = self;
  v131 = v16;
  id v132 = v8;
  v133 = v11;
  __int128 v163 = 0u;
  __int128 v164 = 0u;
  __int128 v161 = 0u;
  __int128 v162 = 0u;
  obj = v19;
  id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v161,  v178,  16LL);
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
  uint64_t v146 = *(void *)v162;
  while (2)
  {
    v25 = 0LL;
    v26 = v23;
    do
    {
      if (*(void *)v162 != v146) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(*((void *)&v161 + 1) + 8LL * (void)v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](obj, "objectForKey:", v27));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"TypeOfSignature"]);

      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"Certificate"]);
      if (!v23)
      {
        id v91 = sub_100021D84();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_1000282A4();
        }
        id v11 = v133;
        v16 = v131;
        v22 = v29;
        goto LABEL_96;
      }

      v22 = v29;
      if (!v29 || (uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v29, v30) & 1) == 0))
      {
        id v65 = sub_100021D84();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_100028310(v66, v67, v68, v69, v70, v71, v72, v73);
        }
LABEL_95:
        id v11 = v133;
        v16 = v131;
LABEL_96:

        v35 = 0LL;
        v36 = 0LL;
        goto LABEL_102;
      }

      if (![v29 count])
      {
        id v92 = sub_100021D84();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_100028380(v66, v93, v94, v95, v96, v97, v98, v99);
        }
        goto LABEL_95;
      }

      if ([v23 isEqualToString:@"UAT"])
      {
        v31 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigning:]( v148,  "createPublicKeyForDevelopmentSigning:",  v29);
        v24 = @"Skip";
        if (!v31) {
          goto LABEL_93;
        }
LABEL_26:
        v33 = v22;
        goto LABEL_27;
      }

      v32 = -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v148, "createPublicKeyForStrongSigning:", v29);
      if (!v32)
      {
        v31 = -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v148, "createPublicKeyAppleISTSigning:", v29);
        v24 = @"AppleISTCertCheck";
        if (!v31)
        {
LABEL_93:
          id v100 = sub_100021D84();
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_1000283F0(v66, v101, v102, v103, v104, v105, v106, v107);
          }
          goto LABEL_95;
        }

        goto LABEL_26;
      }

      v31 = v32;
      v33 = v22;
      if (-[MSDDemoManifestCheck isManualSigning:](v148, "isManualSigning:", v22)) {
        v24 = @"Skip";
      }
      else {
        v24 = @"Default";
      }
LABEL_27:
      v176[0] = @"publicKey";
      v176[1] = @"TypeOfSignature";
      v177[0] = v31;
      v177[1] = v23;
      v176[2] = @"RigorousCheckType";
      v177[2] = v24;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v177,  v176,  3LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v143, "setObject:forKeyedSubscript:", v34, v27);

      v25 = (char *)v25 + 1;
      v22 = v33;
      v26 = v23;
    }

    while (v21 != v25);
    id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v161,  v178,  16LL);
    v22 = v33;
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
  id v45 = a4;
  uint64_t v46 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck itemBeingInstalled](self, "itemBeingInstalled"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TypeOfFiles"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
    {
      id v37 = sub_100021D84();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000285B4();
      }
      goto LABEL_10;
    }

    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
    unsigned int v14 = [v9 isEqualToString:v13];

    if (v14)
    {
      v42 = v9;
      v43 = v8;
      id v44 = v6;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Identifier"]);
      unsigned int v15 = [v41 rangeValue];
      int v17 = v16;
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getInstallationOrder](self, "getInstallationOrder"));
      int v19 = v15 + v17;
      uint64_t v20 = v15 + v17 - 1;
      if ((int)(v15 + v17 - 1) >= 0)
      {
        while (1)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:v20]);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupItemName:](self, "getBackupItemName:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v22]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"Manifest"]);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v24));

          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v45]);
          if (v26) {
            break;
          }

          --v19;
          --v20;
          if (v19 < 1) {
            goto LABEL_7;
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"RigorousCheckType"]);
        unsigned __int8 v35 = [v34 isEqualToString:@"Skip"];

        id v8 = v43;
        id v6 = v44;
        id v9 = v42;
        if ((v35 & 1) != 0) {
          goto LABEL_20;
        }
LABEL_19:
        if (MISValidateSignatureAndCopyInfo(v6, 0LL, &v46))
        {
LABEL_20:
          BOOL v29 = 1;
          goto LABEL_21;
        }

        id v40 = sub_100021D84();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1000284C0(v28);
        }
LABEL_10:

        BOOL v29 = 0;
LABEL_21:

        goto LABEL_22;
      }

- (__SecKey)createPublicKeyForStrongSigning:(id)a3
{
  id v4 = a3;
  uint64_t MobileStoreSigner = SecPolicyCreateMobileStoreSigner();
  id v6 = sub_100021D84();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v18, 2u);
    }

    id v9 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]( self,  "createPublicKey:usingPolicy:anchors:",  v4,  MobileStoreSigner,  0LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100028620(v8, v11, v12, v13, v14, v15, v16, v17);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4 = a3;
  id v5 = sub_100021D84();
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
  id v5 = sub_100021D84();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  uint64_t DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    id v35 = sub_100021D84();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100028690(v29, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_24;
  }

  uint64_t v8 = DemoDigitalCatalogSigning;
  if ([v4 count] != (id)2)
  {
    id v43 = sub_100021D84();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100028900();
    }
    goto LABEL_24;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0)
  {
    BOOL v18 = 0LL;
    goto LABEL_21;
  }

  id v12 = objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v13 = (const UInt8 *)[v12 bytes];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:0]);
  uint64_t v15 = CFDataCreate(kCFAllocatorDefault, v13, (CFIndex)[v14 length]);

  if (!v15)
  {
    id v44 = sub_100021D84();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100028700();
    }
LABEL_24:
    BOOL v18 = 0LL;
LABEL_36:
    v32 = 0LL;
    unsigned __int8 v33 = 0LL;
    goto LABEL_14;
  }

  SecCertificateRef v16 = SecCertificateCreateWithData(kCFAllocatorDefault, v15);
  uint64_t v17 = SecCertificateCopyOrganizationalUnit(v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:0]);
  unsigned __int8 v20 = [v19 isEqualToString:@"1.2.840.113635.100.6.60"];

  if ((v20 & 1) == 0)
  {
    id v45 = sub_100021D84();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000288A0();
    }
    goto LABEL_36;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData);
  char v23 = objc_opt_isKindOfClass(v21, v22);

  if ((v23 & 1) == 0)
  {
LABEL_21:
    v32 = 0LL;
    unsigned __int8 v33 = 0LL;
    goto LABEL_15;
  }

  id v24 = objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  v25 = (const UInt8 *)[v24 bytes];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
  id v27 = CFDataCreate(kCFAllocatorDefault, v25, (CFIndex)[v26 length]);

  if (!v27)
  {
    id v46 = sub_100021D84();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10002872C();
    }
    goto LABEL_36;
  }

  v28 = SecCertificateCreateWithData(kCFAllocatorDefault, v27);
  SecCertificateCopyCommonName(v28, &commonName);
  BOOL v29 = (id)commonName;
  if ((-[os_log_s isEqualToString:](v29, "isEqualToString:", @"DemoUnit CA") & 1) == 0)
  {
    id v47 = sub_100021D84();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100028838((uint64_t)&commonName, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_35;
  }

  uint64_t v30 = CFDataCreate(kCFAllocatorDefault, byte_10004F478, dword_10004F800);
  if (!v30)
  {
    id v55 = sub_100021D84();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100028758(v48, v56, v57, v58, v59, v60, v61, v62);
    }
    goto LABEL_35;
  }

  SecCertificateRef v31 = SecCertificateCreateWithData(kCFAllocatorDefault, v30);
  if (!v31)
  {
    id v63 = sub_100021D84();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_1000287C8(v48, v64, v65, v66, v67, v68, v69, v70);
    }
LABEL_35:

    goto LABEL_36;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v31, 0LL));
  unsigned __int8 v33 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:]( self,  "createPublicKey:usingPolicy:anchors:",  v4,  v8,  v32);
LABEL_14:

LABEL_15:
  return v33;
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
    id v8 = sub_100021D84();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002892C(v9, v10, v11, v12, v13, v14, v15, v16);
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
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  SecCertificateRef v31 = sub_10000F988;
  v32 = sub_10000F998;
  id v33 = 0LL;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  uint64_t v10 = (void *)v29[5];
  v29[5] = v9;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000F9A0;
  v27[3] = &unk_100044CD0;
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
    id v16 = sub_100021D84();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028B5C();
    }
    goto LABEL_13;
  }

  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    id v26 = sub_100021D84();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028AEC();
    }
    goto LABEL_13;
  }

  if (SecTrustEvaluate(trust, &result))
  {
    id v17 = sub_100021D84();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028A7C();
    }
    goto LABEL_13;
  }

  if (result != kSecTrustResultProceed && result != kSecTrustResultUnspecified)
  {
    id v13 = sub_100021D84();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002899C();
    }
    goto LABEL_13;
  }

  uint64_t v12 = SecTrustCopyPublicKey(trust);
  if (!v12)
  {
    id v18 = sub_100021D84();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028A0C(v14, v19, v20, v21, v22, v23, v24, v25);
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
  id v9 = sub_100021D84();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100028CC0();
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
    id v20 = sub_100021D84();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100028C3C(v18, v21);
    }
  }

  return v18 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:0]);
  if (!v3 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    id v11 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100028CF8(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_12;
  }

  id v5 = SecCertificateCreateWithData(kCFAllocatorDefault, v3);
  if (!v5)
  {
    id v20 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100028D68(v12, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_12:

    id v7 = 0LL;
    goto LABEL_13;
  }

  id v6 = v5;
  SecCertificateCopyCommonName(v5, &commonName);
  CFRelease(v6);
  id v7 = (__CFString *)commonName;
  if (-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", @"Demo Content Signing"))
  {
    id v8 = sub_100021D84();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A certificate for manual signing is used.",  buf,  2u);
    }

    BOOL v10 = 1;
    goto LABEL_16;
  }

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:@"Apps"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Manifest"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Info"]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"AppType"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Dependencies"]);
  id v12 = v11;
  if (!v11
    || [v11 count] == (id)1
    && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"ProvisioningProfiles"]),
        v13,
        v13))
  {
    BOOL v14 = 1;
  }

  else
  {
    id v15 = sub_100021D84();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100028DD8();
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
    id v13 = sub_100021D84();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028E04(v14, v15, v16, v17, v18, v19, v20, v21);
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
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Version"]);
  -[MSDDemoManifestCheck setManifestVersion:](self, "setManifestVersion:", [v10 unsignedIntValue]);

  if (!-[MSDDemoManifestCheck runSecurityCheck:](self, "runSecurityCheck:", v7))
  {
    id v22 = sub_100021D84();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100028E74(v14, v23, v24, v25, v26, v27, v28, v29);
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
  id v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSecurityCheckSectionNames](self, "getSecurityCheckSectionNames"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getappIconLayoutBackupName](self, "getappIconLayoutBackupName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  id v8 = sub_100021D84();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100010204;
  v27[3] = &unk_100044D20;
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
    id v15 = sub_100021D84();
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
    id v19 = sub_100021D84();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100028EE4(v16, v20, v21, v22, v23, v24, v25, v26);
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
      id v16 = sub_100021D84();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002904C();
      }
      goto LABEL_17;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"region"]);

    if (!v9)
    {
      id v10 = sub_100021D84();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000290B8();
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
      id v14 = sub_100021D84();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_100029190();
      }
      goto LABEL_11;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Data"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"HDR"]);

    if (!v12)
    {
      id v17 = sub_100021D84();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100029124();
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
      id v79 = sub_100021D84();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100029250();
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
            id v70 = sub_100021D84();
            uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
              sub_1000291F0();
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

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100049B28));
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v8));

  v90 = (void *)v18;
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
      id v80 = sub_100021D84();
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_100029250();
      }

      id v35 = 0LL;
      uint64_t v69 = 0LL;
      id v44 = 0LL;
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
    id v35 = 0LL;
    uint64_t v69 = 0LL;
    id v44 = 0LL;
    int v68 = 0;
LABEL_61:
    uint64_t v38 = v90;
    goto LABEL_81;
  }

  uint64_t v82 = v19;
  id v84 = v10;
  id v35 = 0LL;
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
      id v43 = *(void **)(*((void *)&v113 + 1) + 8 * v39);
      context = objc_autoreleasePoolPush();
      uint64_t v102 = v43;
      uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:v43]);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v97 valueForKey:@"MSDManifestFileAttributes"]);

      if (!v44)
      {
        id v73 = sub_100021D84();
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_1000291F0();
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
        v48 = (void *)objc_claimAutoreleasedReturnValue([v97 valueForKey:@"MSDManifestSymbolicLinkTargetFile"]);

        __int128 v111 = 0u;
        __int128 v112 = 0u;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
        id v49 = [obja countByEnumeratingWithState:&v109 objects:v122 count:16];
        if (!v49)
        {

          id v35 = v48;
          uint64_t v38 = v90;
LABEL_77:
          id v77 = sub_100021D84();
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = v96;
            sub_100029350();
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
    -[NSMutableSet addObject:](v5, "addObject:", &off_100049D20);
    -[NSMutableSet addObject:](v6, "addObject:", @"staff");
    id v9 = &off_100049B40;
LABEL_7:
    id v14 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    goto LABEL_8;
  }

  -[NSMutableSet addObject:](v5, "addObject:", &off_100049D38);
  -[NSMutableSet addObject:](v5, "addObject:", &off_100049D50);
  -[NSMutableSet addObject:](v6, "addObject:", @"mobile");
  -[NSMutableSet addObject:](v6, "addObject:", @"wheel");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v11 = [v10 iOS];

  if (v11)
  {
    id v9 = &off_100049B58;
    goto LABEL_7;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v13 = [v12 tvOS];

  if (v13)
  {
    id v9 = &off_100049B70;
    goto LABEL_7;
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSSet);
LABEL_8:
  id v84 = v14;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v4));

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v86 = *(void *)v88;
    *(void *)&__int128 v18 = 134218242LL;
    __int128 v80 = v18;
    id v82 = v16;
    v81 = v5;
    id v85 = v6;
    do
    {
      uint64_t v21 = 0LL;
      id v83 = v19;
      do
      {
        if (*(void *)v88 != v86) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v87 + 1) + 8LL * (void)v21);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22, v80));
        if (!v23 || (uint64_t v24 = objc_opt_class(v20[97]), (objc_opt_isKindOfClass(v23, v24) & 1) == 0))
        {
          id v77 = sub_100021D84();
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_1000293C4();
          }
          goto LABEL_106;
        }

        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"MSDManifestSymbolicLinkTargetFile"]);
        if (v25)
        {
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0
            || (-[os_log_s isEqualToString:](v25, "isEqualToString:", &stru_1000457D8) & 1) == 0)
          {
            id v78 = sub_100021D84();
            id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
              sub_100029424();
            }

LABEL_106:
            int v31 = 6;
            goto LABEL_93;
          }
        }

        id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"MSDManifestFileAttributes"]);
        if (v27)
        {
          uint64_t v28 = objc_opt_class(v20[97]);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"NSFileType"]);
            if (v29 && (uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v29, v30) & 1) != 0))
            {
              if ([v29 isEqualToString:@"NSFileTypeDirectory"])
              {
                int v31 = 3;
                goto LABEL_46;
              }

              if ([v29 isEqualToString:@"NSFileTypeRegular"])
              {
                if (-[NSSet containsObject:](v84, "containsObject:", v22))
                {
                  id v32 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileOwnerAccountID]);
                  if (v32
                    && (uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v32, v33) & 1) != 0))
                  {
                    if ([v32 integerValue] == (id)501)
                    {
                      int v34 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileGroupOwnerAccountID]);

                      if (v34
                        && (uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v34, v35) & 1) != 0))
                      {
                        id v6 = v85;
                        if ((-[NSMutableSet containsObject:](v5, "containsObject:", v34) & 1) != 0)
                        {
                          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileOwnerAccountName]);
                          if (v36
                            && (uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v36, v37) & 1) != 0))
                          {
                            if ([v36 isEqualToString:@"mobile"])
                            {
                              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFileGroupOwnerAccountName]);

                              if (v38
                                && (uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString),
                                    (objc_opt_isKindOfClass(v38, v39) & 1) != 0))
                              {
                                id v5 = v81;
                                if ((-[NSMutableSet containsObject:](v85, "containsObject:", v38) & 1) != 0)
                                {
                                  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:NSFilePosixPermissions]);
                                  if (v40
                                    && (uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSNumber),
                                        (objc_opt_isKindOfClass(v40, v41) & 1) != 0))
                                  {
                                    if (((unint64_t)[v40 integerValue] & 0xC00) == 0)
                                    {
                                      int v31 = 1;
                                      goto LABEL_42;
                                    }

                                    id v72 = sub_100021D84();
                                    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v72);
                                    if (!os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      int v31 = 6;
LABEL_78:
                                      id v5 = v81;
LABEL_42:

LABEL_43:
                                      id v6 = v85;
LABEL_44:

                                      id v16 = v82;
LABEL_45:

                                      id v19 = v83;
                                      goto LABEL_46;
                                    }

                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v92 = v22;
                                    uint64_t v62 = (os_log_s *)v61;
                                    id v63 = "IS&T signed component contains setuid item: %{public}@";
                                  }

                                  else
                                  {
                                    id v60 = sub_100021D84();
                                    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
                                    if (!os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_77;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    uint64_t v92 = v22;
                                    uint64_t v62 = (os_log_s *)v61;
                                    id v63 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }

                                  _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  v63,  buf,  0xCu);
                                  goto LABEL_77;
                                }

                                id v71 = sub_100021D84();
                                uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v71);
                                if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  int v31 = 6;
                                  goto LABEL_42;
                                }

                                *(_DWORD *)buf = 138543618;
                                uint64_t v92 = (uint64_t)v85;
                                __int16 v93 = 2114;
                                uint64_t v94 = v22;
                                id v57 = (os_log_s *)v40;
                                id v58 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                uint32_t v59 = 22;
                              }

                              else
                              {
                                id v56 = sub_100021D84();
                                uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v56);
                                id v5 = v81;
                                if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_75;
                                }
                                *(_DWORD *)buf = 138543362;
                                uint64_t v92 = v22;
                                id v57 = (os_log_s *)v40;
                                id v58 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                uint32_t v59 = 12;
                              }

                              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v58, buf, v59);
                              goto LABEL_75;
                            }

                            id v70 = sub_100021D84();
                            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v70);
                            if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              int v31 = 6;
                              uint64_t v38 = v36;
                              goto LABEL_78;
                            }

                            *(_DWORD *)buf = 138543618;
                            uint64_t v92 = (uint64_t)@"mobile";
                            __int16 v93 = 2114;
                            uint64_t v94 = v22;
                            uint64_t v53 = (os_log_s *)v40;
                            uint64_t v54 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            uint32_t v55 = 22;
                          }

                          else
                          {
                            id v52 = sub_100021D84();
                            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v52);
                            if (!os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_73;
                            }
                            *(_DWORD *)buf = 138543362;
                            uint64_t v92 = v22;
                            uint64_t v53 = (os_log_s *)v40;
                            uint64_t v54 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            uint32_t v55 = 12;
                          }

                          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v54, buf, v55);
                          goto LABEL_73;
                        }

                        id v69 = sub_100021D84();
                        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v69);
                        if (!os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          int v31 = 6;
                          goto LABEL_44;
                        }

                        *(_DWORD *)buf = 138543618;
                        uint64_t v92 = (uint64_t)v5;
                        __int16 v93 = 2114;
                        uint64_t v94 = v22;
                        id v49 = (os_log_s *)v38;
                        id v50 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        uint32_t v51 = 22;
                      }

                      else
                      {
                        id v48 = sub_100021D84();
                        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v48);
                        id v6 = v85;
                        if (!os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_71;
                        }
                        *(_DWORD *)buf = 138543362;
                        uint64_t v92 = v22;
                        id v49 = (os_log_s *)v38;
                        id v50 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        uint32_t v51 = 12;
                      }

                      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v50, buf, v51);
                      goto LABEL_71;
                    }

                    id v68 = sub_100021D84();
                    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v68);
                    if (!os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      int v31 = 6;
                      int v34 = v32;
                      goto LABEL_43;
                    }

                    *(_DWORD *)buf = v80;
                    uint64_t v92 = 501LL;
                    __int16 v93 = 2114;
                    uint64_t v94 = v22;
                    unsigned int v45 = (os_log_s *)v38;
                    id v46 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    uint32_t v47 = 22;
                  }

                  else
                  {
                    id v44 = sub_100021D84();
                    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v44);
                    if (!os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_69;
                    }
                    *(_DWORD *)buf = 138543362;
                    uint64_t v92 = v22;
                    unsigned int v45 = (os_log_s *)v38;
                    id v46 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    uint32_t v47 = 12;
                  }

                  _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, v47);
                  goto LABEL_69;
                }

                id v67 = sub_100021D84();
                int v34 = (void *)objc_claimAutoreleasedReturnValue(v67);
                if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v92 = v22;
                  uint64_t v65 = (os_log_s *)v34;
                  unsigned __int8 v66 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }

              else
              {
                id v64 = sub_100021D84();
                int v34 = (void *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v92 = v22;
                  uint64_t v65 = (os_log_s *)v34;
                  unsigned __int8 v66 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }

            else
            {
              id v43 = sub_100021D84();
              int v34 = (void *)objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v92 = v22;
                uint64_t v65 = (os_log_s *)v34;
                unsigned __int8 v66 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
              }
            }

            int v31 = 6;
            goto LABEL_45;
          }
        }

        id v42 = sub_100021D84();
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v92 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_ERROR,  "IS&T signed component in wrong format (no file attributes) for %{public}@",  buf,  0xCu);
        }

        int v31 = 6;
LABEL_46:

        if (v31 != 3) {
          goto LABEL_93;
        }
        uint64_t v21 = (char *)v21 + 1;
        uint64_t v20 = &APFSContainerGetSpaceInfo_ptr;
      }

      while (v19 != v21);
      id v73 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
      id v19 = v73;
    }

    while (v73);
  }

  int v31 = 0;
LABEL_93:

  if (v31) {
    BOOL v74 = v31 == 6;
  }
  else {
    BOOL v74 = 1;
  }
  BOOL v75 = !v74;

  return v75;
}

- (void)registerEntitlementNotificationHandler
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100011D6C;
  v5[3] = &unk_100044D48;
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
      id v4 = &off_100049B88;
    }
    else {
      id v4 = &off_100049BA0;
    }
  }

  else
  {
    id v4 = &off_100049BB8;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
}

- (id)getManifestData:(id)a3
{
  id v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    id v5 = [v4 objectForKey:@"Data" ofType:objc_opt_class(NSDictionary)];
    id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = v4;
  }

  id v7 = v6;

  return v7;
}

- (id)getComponentData:(id)a3
{
  id v3 = a3;
  id v4 = @"Manifest";
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Manifest"]);

  if (v5
    || (id v4 = @"Settings",
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Settings"]),
        v6,
        v6))
  {
    id v7 = [v3 objectForKey:v4 ofType:objc_opt_class(NSDictionary)];
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return v8;
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
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"InstallationOrder"]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"CriticalComponents"]);
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
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
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
  id v6 = v5;

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
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
        unsigned int v9 = [v8 isEqualToString:@".."];

        if (v9)
        {
          if (!v7)
          {
            id v14 = sub_100021D84();
            unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              sub_1000294E4();
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
    id v17 = sub_100021D84();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100029484();
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
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100049BD0));
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.carrier");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator_1.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator_2.plist");
    -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  v6,  @"/var/mobile/Library/Preferences/com.apple.operator.merged.plist");
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"/var/db/timezone/zoneinfo"));
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v7, @"/var/db/timezone/localtime");

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100049BE8));
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
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));

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
  uint64_t v24 = v3;
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
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Manifest"]);
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
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_100049C00);
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v60;
    id v11 = &APFSContainerGetSpaceInfo_ptr;
    __int128 v38 = self;
    id v39 = v6;
    uint64_t v36 = *(void *)v60;
    id v37 = v7;
    do
    {
      id v12 = 0LL;
      id v40 = v9;
      do
      {
        if (*(void *)v60 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v44 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)v12);
        id v13 = [v6 objectForKey:v44 ofType:objc_opt_class(v11[107])];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](self, "getComponentData:", v14));
          if (v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v15));
            if (v16)
            {
              __int128 v41 = v15;
              __int128 v42 = v14;
              __int128 v43 = v12;
              id v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              __int128 v57 = 0u;
              __int128 v58 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
              id v18 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v46 = *(void *)v56;
                do
                {
                  for (i = 0LL; i != v19; i = (char *)i + 1)
                  {
                    if (*(void *)v56 != v46) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
                    __int128 v51 = 0u;
                    __int128 v52 = 0u;
                    __int128 v53 = 0u;
                    __int128 v54 = 0u;
                    id v22 = v16;
                    id v23 = [v22 countByEnumeratingWithState:&v51 objects:v70 count:16];
                    if (v23)
                    {
                      id v24 = v23;
                      uint64_t v25 = *(void *)v52;
                      do
                      {
                        for (j = 0LL; j != v24; j = (char *)j + 1)
                        {
                          if (*(void *)v52 != v25) {
                            objc_enumerationMutation(v22);
                          }
                          id v27 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
                          if ((objc_msgSend(v27, "isEqualToString:", v21, v36) & 1) != 0
                            || [v27 hasPrefix:v21])
                          {
                            -[NSMutableArray addObject:](v17, "addObject:", v27);
                          }
                        }

                        id v24 = [v22 countByEnumeratingWithState:&v51 objects:v70 count:16];
                      }

                      while (v24);
                    }
                  }

                  id v19 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
                }

                while (v19);
              }

              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              id v28 = v17;
              id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v47,  v69,  16LL);
              id v7 = v37;
              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = *(void *)v48;
                do
                {
                  for (k = 0LL; k != v30; k = (char *)k + 1)
                  {
                    if (*(void *)v48 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)k);
                    id v34 = sub_100021D84();
                    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      uint64_t v64 = v33;
                      __int16 v65 = 2114;
                      id v66 = v37;
                      __int16 v67 = 2114;
                      uint64_t v68 = v44;
                      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Excluding %{public}@ from section: %{public}@ component:%{public}@",  buf,  0x20u);
                    }

                    [v16 removeObjectForKey:v33];
                  }

                  id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v47,  v69,  16LL);
                }

                while (v30);
              }

              self = v38;
              id v6 = v39;
              uint64_t v10 = v36;
              id v11 = &APFSContainerGetSpaceInfo_ptr;
              id v9 = v40;
              unsigned int v15 = v41;
              id v14 = v42;
              id v12 = v43;
            }
          }
        }

        id v12 = (char *)v12 + 1;
      }

      while (v12 != v9);
      id v9 = [v6 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }

    while (v9);
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