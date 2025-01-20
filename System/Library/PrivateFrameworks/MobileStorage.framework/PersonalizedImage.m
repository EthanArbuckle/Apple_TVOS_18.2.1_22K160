@interface PersonalizedImage
- (BOOL)initializeDeviceAttributes:(id *)a3;
- (BOOL)initializeImageProperties:(id *)a3;
- (BOOL)mountImage:(id *)a3;
- (BOOL)mountImage:(id)a3 serverTicket:(id)a4 imageDigest:(id)a5 trustCacheURL:(id)a6 error:(id *)a7;
- (BOOL)skipLoadingLaunchDaemons;
- (BOOL)useCredentials;
- (NSData)apNonce;
- (NSData)sepNonce;
- (NSDictionary)mountedVolumeEntry;
- (NSNumber)boardID;
- (NSNumber)certificateProductionStatus;
- (NSNumber)certificateSecurityMode;
- (NSNumber)chipID;
- (NSNumber)ecid;
- (NSNumber)effectiveProductionStatus;
- (NSNumber)effectiveSecurityMode;
- (NSNumber)image4Supported;
- (NSNumber)securityDomain;
- (NSNumber)sikaFuse;
- (NSString)deviceClass;
- (NSString)hardwareModel;
- (NSString)imageType;
- (NSString)imageVariant;
- (NSURL)bundlePathURL;
- (NSURL)imagePathURL;
- (NSURL)signingServerURL;
- (NSURL)trustCacheURL;
- (NSURL)userProvidedBundleMountPathURL;
- (NSURL)userProvidedImagePathURL;
- (OS_remote_device)remoteDevice;
- (PersonalizedImage)initWithBundleURL:(id)a3 imageVariant:(id)a4 remoteDevice:(id)a5 options:(id)a6;
- (id)digestFile:(id)a3 digestLength:(unsigned int)a4 error:(id *)a5;
- (id)digestFileSha1:(id)a3 error:(id *)a4;
- (id)digestFileSha384:(id)a3 error:(id *)a4;
- (unsigned)digestLength;
- (void)dealloc;
- (void)setApNonce:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setBundlePathURL:(id)a3;
- (void)setCertificateProductionStatus:(id)a3;
- (void)setCertificateSecurityMode:(id)a3;
- (void)setChipID:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDigestLength:(unsigned int)a3;
- (void)setEcid:(id)a3;
- (void)setEffectiveProductionStatus:(id)a3;
- (void)setEffectiveSecurityMode:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setImage4Supported:(id)a3;
- (void)setImagePathURL:(id)a3;
- (void)setImageType:(id)a3;
- (void)setImageVariant:(id)a3;
- (void)setMountedVolumeEntry:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSepNonce:(id)a3;
- (void)setSigningServerURL:(id)a3;
- (void)setSikaFuse:(id)a3;
- (void)setSkipLoadingLaunchDaemons:(BOOL)a3;
- (void)setTrustCacheURL:(id)a3;
- (void)setUseCredentials:(BOOL)a3;
- (void)setUserProvidedBundleMountPathURL:(id)a3;
- (void)setUserProvidedImagePathURL:(id)a3;
@end

@implementation PersonalizedImage

- (PersonalizedImage)initWithBundleURL:(id)a3 imageVariant:(id)a4 remoteDevice:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
LABEL_26:
    v41 = 0LL;
    goto LABEL_27;
  }

  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PersonalizedImage;
  self = -[PersonalizedImage init](&v45, sel_init);
  if (self)
  {
    v14 = (NSURL *)[v10 copy];
    bundlePathURL = self->_bundlePathURL;
    self->_bundlePathURL = v14;

    v16 = (NSString *)[v11 copy];
    imageVariant = self->_imageVariant;
    self->_imageVariant = v16;

    objc_storeStrong((id *)&self->_remoteDevice, a5);
    self->_digestLength = 48;
    self->_useCredentials = 1;
    v18 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initWithString:@"https://gs.apple.com:443"];
    signingServerURL = self->_signingServerURL;
    self->_signingServerURL = v18;

    objc_storeStrong((id *)&self->_imageType, @"Personalized");
    if (v13)
    {
      [v13 objectForKeyedSubscript:@"UseCredentials"];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        isNSNumber(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22) {
          self->_useCredentials = [v21 BOOLValue];
        }
      }

      [v13 objectForKeyedSubscript:@"SigningServerURL"];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        isNSURL(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (NSURL *)[v24 copy];
          v27 = self->_signingServerURL;
          self->_signingServerURL = v26;
        }
      }

      v43 = v21;
      [v13 objectForKeyedSubscript:@"MountedBundlePath"];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        isNSURL(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = (NSURL *)[v29 copy];
          userProvidedBundleMountPathURL = self->_userProvidedBundleMountPathURL;
          self->_userProvidedBundleMountPathURL = v31;
        }
      }

      [v13 objectForKeyedSubscript:@"ImagePath"];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        isNSURL(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = (NSURL *)[v34 copy];
          userProvidedImagePathURL = self->_userProvidedImagePathURL;
          self->_userProvidedImagePathURL = v36;
        }
      }

      [v13 objectForKeyedSubscript:@"UseCryptexFlow"];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        isNSNumber(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40) {
          objc_storeStrong((id *)&self->_imageType, @"Cryptex");
        }
      }
    }

    if (!v10 && !self->_userProvidedBundleMountPathURL && !self->_userProvidedImagePathURL)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
      }

      goto LABEL_26;
    }
  }

  self = self;
  v41 = self;
LABEL_27:

  return v41;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PersonalizedImage;
  -[PersonalizedImage dealloc](&v2, sel_dealloc);
}

- (id)digestFileSha1:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha1:error:]",  377LL,  -2,  0LL,  @"Invalid inputs.",  v6,  v7,  v8,  v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = 0LL;
LABEL_9:
    v19 = 0LL;
    goto LABEL_11;
  }

  id v10 = (void *)MEMORY[0x189607898];
  [v5 path];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 fileHandleForReadingAtPath:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha1:error:]",  383LL,  -2,  0LL,  @"Failed to create file handle for %@.",  v13,  v14,  v15,  (uint64_t)v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  CC_SHA1_Init(&c);
  v19 = (unsigned __int8 *)malloc(0x14uLL);
  if (!v19)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha1:error:]",  391LL,  -2,  0LL,  @"Failed to allocate digest memory.",  v16,  v17,  v18,  v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v23 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  do
  {
    v20 = (void *)MEMORY[0x1895C0110]();
    id v21 = [v12 readDataOfLength:1024];
    CC_SHA1_Update(&c, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
    uint64_t v22 = [v21 length];

    objc_autoreleasePoolPop(v20);
  }

  while (v22);
  CC_SHA1_Final(v19, &c);
  v23 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v19 length:20];
  v24 = 0LL;
  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v23) {
    *a4 = v24;
  }
LABEL_14:
  if (v19) {
    free(v19);
  }

  return v23;
}

- (id)digestFileSha384:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha384:error:]",  428LL,  -2,  0LL,  @"Invalid inputs.",  v6,  v7,  v8,  v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = 0LL;
LABEL_9:
    v19 = 0LL;
    goto LABEL_11;
  }

  id v10 = (void *)MEMORY[0x189607898];
  [v5 path];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 fileHandleForReadingAtPath:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha384:error:]",  434LL,  -2,  0LL,  @"Failed to create file handle for %@.",  v13,  v14,  v15,  (uint64_t)v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  CC_SHA384_Init(&c);
  v19 = (unsigned __int8 *)malloc(0x30uLL);
  if (!v19)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFileSha384:error:]",  442LL,  -2,  0LL,  @"Failed to allocate digest memory.",  v16,  v17,  v18,  v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v23 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  do
  {
    v20 = (void *)MEMORY[0x1895C0110]();
    id v21 = [v12 readDataOfLength:1024];
    CC_SHA384_Update(&c, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
    uint64_t v22 = [v21 length];

    objc_autoreleasePoolPop(v20);
  }

  while (v22);
  CC_SHA384_Final(v19, &c);
  v23 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v19 length:48];
  v24 = 0LL;
  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v23) {
    *a4 = v24;
  }
LABEL_14:
  if (v19) {
    free(v19);
  }
  id v25 = v23;

  return v25;
}

- (id)digestFile:(id)a3 digestLength:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  if ((_DWORD)v6 == 48)
  {
    uint64_t v12 = -[PersonalizedImage digestFileSha384:error:](self, "digestFileSha384:error:", v11, a5);
    goto LABEL_5;
  }

  if ((_DWORD)v6 == 20)
  {
    uint64_t v12 = -[PersonalizedImage digestFileSha1:error:](self, "digestFileSha1:error:", v11, a5);
LABEL_5:
    uint64_t v13 = (void *)v12;
    goto LABEL_9;
  }

  if (a5)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage digestFile:digestLength:error:]",  481LL,  -3,  0LL,  @"Unsupported digest length: %d",  v8,  v9,  v10,  v6);
    uint64_t v13 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

- (BOOL)initializeImageProperties:(id *)a3
{
  v3 = self;
  uint64_t v193 = *MEMORY[0x1895F89C0];
  v4 = -[PersonalizedImage userProvidedImagePathURL](self, "userProvidedImagePathURL");
  if (v4)
  {
    -[PersonalizedImage userProvidedImagePathURL](v3, "userProvidedImagePathURL");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [MEMORY[0x189604030] fileURLWithPath:v6];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PersonalizedImage setImagePathURL:](v3, "setImagePathURL:", v7);

      uint64_t v8 = 0LL;
      id v9 = 0LL;
      v172 = 0LL;
      v174 = 0LL;
      id v10 = 0LL;
      v177 = 0LL;
      goto LABEL_4;
    }
  }

  else
  {
    -[PersonalizedImage userProvidedBundleMountPathURL](v3, "userProvidedBundleMountPathURL");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v175 = v3;
      -[PersonalizedImage userProvidedBundleMountPathURL](v3, "userProvidedBundleMountPathURL");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 path];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)[v18 copy];

      goto LABEL_20;
    }

    -[PersonalizedImage mountedVolumeEntry](v3, "mountedVolumeEntry");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  532LL,  -2,  0LL,  @"Bundle mounting not support on this platform.",  v50,  v51,  v52,  v167);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
      v173 = 0LL;
      goto LABEL_96;
    }
  }

  v175 = v3;
  v19 = 0LL;
LABEL_20:
  v53 = (void *)MEMORY[0x189603F68];
  v173 = v19;
  [v19 stringByAppendingPathComponent:@"Restore/BuildManifest.plist"];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 dictionaryWithContentsOfFile:v54];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  544LL,  -2,  0LL,  @"Failed to load build manifest.",  v55,  v56,  v57,  v167);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
LABEL_96:
    v172 = 0LL;
    v174 = 0LL;
    v177 = 0LL;
    id obj = 0LL;
    goto LABEL_100;
  }

  v177 = v6;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [v6 objectForKeyedSubscript:@"ManifestVersion"];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v58;
    _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Manifest Version: %@", buf, 0xCu);

    uint64_t v6 = v177;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [v6 objectForKeyedSubscript:@"ProductVersion"];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v59;
    _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Product Version: %@", buf, 0xCu);

    uint64_t v6 = v177;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    [v6 objectForKeyedSubscript:@"ProductBuildVersion"];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v60;
    _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Product Build Version: %@", buf, 0xCu);

    uint64_t v6 = v177;
  }

  [v6 objectForKeyedSubscript:@"BuildIdentities"];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  isNSArray(v61);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    id obj = v61;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  556LL,  -2,  0LL,  @"Missing key 'BuildIdentities'.",  v62,  v63,  v64,  v167);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    v172 = 0LL;
    v174 = 0LL;
    goto LABEL_100;
  }

  __int128 v189 = 0u;
  __int128 v190 = 0u;
  __int128 v187 = 0u;
  __int128 v188 = 0u;
  id v65 = v61;
  id obj = v65;
  uint64_t v180 = [v65 countByEnumeratingWithState:&v187 objects:v191 count:16];
  if (!v180)
  {

    v174 = 0LL;
    v172 = 0LL;
    id v9 = 0LL;
    goto LABEL_93;
  }

  id v9 = 0LL;
  v172 = 0LL;
  v174 = 0LL;
  v170 = 0LL;
  uint64_t v179 = *(void *)v188;
  do
  {
    uint64_t v66 = 0LL;
    do
    {
      if (*(void *)v188 != v179) {
        objc_enumerationMutation(obj);
      }
      v67 = *(void **)(*((void *)&v187 + 1) + 8 * v66);
      *(void *)buf = 0LL;
      [v67 objectForKeyedSubscript:@"ApBoardID"];
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = v68;
      if (!v69)
      {
        v181 = v9;
        createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  577LL,  -3,  0LL,  @"Missing expected key 'ApBoardID'",  v70,  v71,  v72,  v167);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v115 = 0LL;
        v116 = 0LL;
        v183 = 0LL;
        goto LABEL_51;
      }

      [v67 objectForKeyedSubscript:@"ApChipID"];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v73);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v183 = v73;
      if (!v69)
      {
        v181 = v9;
        createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  583LL,  -3,  0LL,  @"Missing expected key 'ApChipID'",  v74,  v75,  v76,  v167);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v115 = 0LL;
        v116 = 0LL;
LABEL_51:
        v184 = 0LL;
LABEL_52:
        v98 = 0LL;
LABEL_53:
        v103 = 0LL;
LABEL_54:
        v117 = 0LL;
        v107 = 0LL;
LABEL_55:

        int v118 = 3;
        goto LABEL_56;
      }

      [v67 objectForKeyedSubscript:@"ApSecurityDomain"];
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v77);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v184 = v77;
      if (!v69)
      {
        v181 = v9;
        createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  589LL,  -3,  0LL,  @"Missing expected key 'ApSecurityDomain'",  v78,  v79,  v80,  v167);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v115 = 0LL;
        v116 = 0LL;
        goto LABEL_52;
      }

      [MEMORY[0x189607A08] scannerWithString:v68];
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v81 scanHexLongLong:buf]
        || (uint64_t v82 = *(void *)buf,
            -[PersonalizedImage boardID](v175, "boardID"),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            uint64_t v84 = [v83 unsignedLongLongValue],
            v83,
            v82 != v84))
      {
LABEL_59:
        v116 = v81;
        v115 = 0LL;
        v69 = 0LL;
        v98 = 0LL;
        v103 = 0LL;
        v117 = 0LL;
        v107 = 0LL;
        int v118 = 4;
        goto LABEL_56;
      }

      v181 = v9;
      [MEMORY[0x189607A08] scannerWithString:v73];
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v85 scanHexLongLong:buf]
        && (uint64_t v86 = *(void *)buf,
        v81 = -[PersonalizedImage chipID](v175, "chipID"),
            v87 = (void *)objc_claimAutoreleasedReturnValue(),
            uint64_t v88 = [v87 unsignedLongLongValue],
            v87,
            v86 == v88))
      {
        [MEMORY[0x189607A08] scannerWithString:v77];
        if ([v81 scanHexLongLong:buf])
        {
          uint64_t v89 = *(void *)buf;
          v90 = -[PersonalizedImage securityDomain](v175, "securityDomain");
          uint64_t v91 = [v90 unsignedLongLongValue];

          id v9 = v181;
          if (v89 != v91) {
            goto LABEL_59;
          }
          [v67 objectForKeyedSubscript:@"Info"];
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          isNSDictionary(v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v93)
          {
            v116 = v81;
            v115 = v92;
            createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  613LL,  -3,  0LL,  @"Missing expected key 'Info'",  v94,  v95,  v96,  v167);
            id v9 = (id)objc_claimAutoreleasedReturnValue();
            v69 = 0LL;
            goto LABEL_52;
          }

          [v67 objectForKeyedSubscript:@"Manifest"];
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          isNSDictionary(v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v98)
          {
            v116 = v81;
            v69 = v97;
            v115 = v92;
            createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  619LL,  -3,  0LL,  @"Missing expected key 'Manifest'",  v99,  v100,  v101,  v167);
            id v9 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_53;
          }

          [v97 objectForKeyedSubscript:@"LoadableTrustCache"];
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v102;
          if (v102)
          {
            isNSDictionary(v102);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v98)
            {
              v116 = v81;
              v69 = v97;
              v115 = v92;
              createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  625LL,  -3,  0LL,  @"Invalid value for key 'LoadableTrustCache'",  v104,  v105,  v106,  v167);
              id v9 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_54;
            }

            [v103 objectForKeyedSubscript:@"Info"];
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            isNSDictionary(v107);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v98)
            {
              v116 = v81;
              v69 = v97;
              v115 = v92;
              createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  632LL,  -3,  0LL,  @"Missing expected key 'Info'",  v108,  v109,  v110,  v167);
              id v9 = (id)objc_claimAutoreleasedReturnValue();
              v117 = 0LL;
              goto LABEL_55;
            }

            [v107 objectForKeyedSubscript:@"Path"];
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            isNSString(v111);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v98)
            {
              v116 = v81;
              v69 = v97;
              v115 = v92;
              uint64_t v141 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  638LL,  -3,  0LL,  @"Missing expected key 'Path'",  v112,  v113,  v114,  v167);
              v142 = v111;
              id v9 = (id)v141;
              v117 = 0LL;
              v174 = v142;
              goto LABEL_55;
            }

            v115 = v92;
            v174 = v111;
          }

          else
          {
            v115 = v92;
            v107 = 0LL;
          }

          [v97 objectForKeyedSubscript:@"PersonalizedDMG"];
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          isNSDictionary(v98);
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v117)
          {
            v116 = v81;
            v69 = v97;
            uint64_t v138 = 645LL;
            v139 = @"Missing expected key 'PersonalizedDMG'";
            goto LABEL_80;
          }

          [v98 objectForKeyedSubscript:@"Name"];
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          isNSString(v117);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v122)
          {
            v116 = v81;
            v69 = v97;
            uint64_t v138 = 651LL;
            v139 = @"Missing expected key 'Name'";
LABEL_80:
            uint64_t v140 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  v138,  -3,  0LL,  v139,  v119,  v120,  v121,  v167);
LABEL_81:
            id v9 = (id)v140;
            goto LABEL_55;
          }
          v123 = -[PersonalizedImage imageVariant](v175, "imageVariant");
          int v168 = [v117 isEqualToString:v123];

          if (v168)
          {
            [v98 objectForKeyedSubscript:@"Info"];
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            isNSDictionary(v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();

            v116 = v81;
            if (!v125)
            {
              v69 = v97;
              uint64_t v140 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  658LL,  -3,  0LL,  @"Missing expected key 'Info'",  v126,  v127,  v128,  v167);
              v107 = v124;
              goto LABEL_81;
            }

            v169 = v124;
            [v124 objectForKeyedSubscript:@"HashMethod"];
            v129 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v130 = isNSString(v129);
            if (v130)
            {
              v131 = (void *)v130;
              int v132 = [v129 isEqualToString:@"sha1"];

              if (v132) {
                -[PersonalizedImage setDigestLength:](v175, "setDigestLength:", 20LL);
              }
            }

            v172 = v129;
            v69 = v97;
            [v169 objectForKeyedSubscript:@"Path"];
            v133 = (void *)objc_claimAutoreleasedReturnValue();

            isNSString(v133);
            v134 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v134)
            {
              createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  669LL,  -3,  0LL,  @"Missing expected key 'Path'",  v135,  v136,  v137,  v167);
              id v9 = (id)objc_claimAutoreleasedReturnValue();
              v170 = v133;
              v107 = v169;
              goto LABEL_55;
            }

            int v118 = 3;
            v170 = v133;
            v107 = v169;
          }

          else
          {
            v116 = v81;
            v69 = v97;
            int v118 = 0;
          }
        }

        else
        {
          v116 = v81;
          v115 = 0LL;
          v69 = 0LL;
          v98 = 0LL;
          v103 = 0LL;
          v117 = 0LL;
          v107 = 0LL;
          int v118 = 4;
        }
      }

      else
      {
        v115 = 0LL;
        v69 = 0LL;
        v98 = 0LL;
        v103 = 0LL;
        v117 = 0LL;
        v107 = 0LL;
        int v118 = 4;
        v116 = v85;
      }

      id v9 = v181;
LABEL_56:

      if ((v118 | 4) != 4) {
        goto LABEL_87;
      }
      ++v66;
    }

    while (v180 != v66);
    uint64_t v143 = [obj countByEnumeratingWithState:&v187 objects:v191 count:16];
    uint64_t v180 = v143;
  }

  while (v143);
LABEL_87:

  if (!v170)
  {
LABEL_93:
    v151 = -[PersonalizedImage imageVariant](v175, "imageVariant");
    uint64_t v155 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  678LL,  -2,  v9,  @"Failed to find image for variant %@.",  v152,  v153,  v154,  (uint64_t)v151);

    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v6 = 0LL;
LABEL_99:
    id v9 = (id)v155;
    goto LABEL_100;
  }

  [@"Restore" stringByAppendingPathComponent:v170];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = (void *)MEMORY[0x189604030];
  uint64_t v8 = v173;
  [v173 stringByAppendingPathComponent:v6];
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  [v144 fileURLWithPath:v145];
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v175;
  -[PersonalizedImage setImagePathURL:](v175, "setImagePathURL:", v146);

  if (v174)
  {
    uint64_t v147 = [@"Restore" stringByAppendingPathComponent:v174];

    v148 = (void *)MEMORY[0x189604030];
    [v173 stringByAppendingPathComponent:v147];
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    [v148 fileURLWithPath:v149];
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage setTrustCacheURL:](v175, "setTrustCacheURL:", v150);

    v174 = (void *)v147;
  }

  else
  {
    v174 = 0LL;
  }

  id v10 = obj;
LABEL_4:
  -[PersonalizedImage remoteDevice](v3, "remoteDevice");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  v173 = v8;
  id obj = v10;
  if (v11)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_6;
  }

  v176 = v3;
  copyWorkingDirectory();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    uint64_t v155 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  719LL,  -2,  0LL,  @"Failed to query working directory path.",  v20,  v21,  v22,  v167);

    uint64_t v14 = 0LL;
LABEL_98:
    uint64_t v12 = 0LL;
    goto LABEL_99;
  }

  [MEMORY[0x189607AB8] UUID];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 UUIDString];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringByAppendingPathComponent:v24];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v155 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  725LL,  -2,  0LL,  @"Failed to create path.",  v25,  v26,  v27,  v167);

    goto LABEL_98;
  }

  [MEMORY[0x189604030] fileURLWithPath:v14];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    uint64_t v155 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  731LL,  -2,  0LL,  @"Failed to create URL.",  v28,  v29,  v30,  v167);

    goto LABEL_99;
  }

  [MEMORY[0x1896078A8] defaultManager];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PersonalizedImage imagePathURL](v176, "imagePathURL");
  v33 = v9;
  id v186 = v9;
  char v34 = [v31 copyItemAtURL:v32 toURL:v12 error:&v186];
  id v9 = v186;

  if ((v34 & 1) == 0)
  {
    v157 = -[PersonalizedImage imagePathURL](v176, "imagePathURL");
    v158 = v9;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  736LL,  -2,  v9,  @"Failed to copy %@ to %@.",  v159,  v160,  v161,  (uint64_t)v157);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_100;
  }

  -[PersonalizedImage setImagePathURL:](v176, "setImagePathURL:", v12);
  v35 = -[PersonalizedImage trustCacheURL](v176, "trustCacheURL");
  if (v35)
  {
    [MEMORY[0x189607AB8] UUID];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 UUIDString];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v13 stringByAppendingPathComponent:v37];

    v42 = v9;
    if (v38)
    {
      uint64_t v43 = [MEMORY[0x189604030] fileURLWithPath:v38];

      if (v43)
      {
        [MEMORY[0x1896078A8] defaultManager];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[PersonalizedImage trustCacheURL](v176, "trustCacheURL");
        id v185 = v9;
        char v49 = [v47 copyItemAtURL:v48 toURL:v43 error:&v185];
        id v9 = v185;

        if ((v49 & 1) != 0)
        {
          -[PersonalizedImage setTrustCacheURL:](v176, "setTrustCacheURL:", v43);
          BOOL v15 = 1;
          uint64_t v12 = (void *)v43;
          uint64_t v14 = (void *)v38;
          goto LABEL_103;
        }
        v162 = -[PersonalizedImage trustCacheURL](v176, "trustCacheURL");
        uint64_t v166 = createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  756LL,  -2,  v9,  @"Failed to copy %@ to %@.",  v163,  v164,  v165,  (uint64_t)v162);

        id v9 = (id)v166;
        uint64_t v14 = (void *)v38;
        uint64_t v12 = (void *)v43;
      }

      else
      {
        createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  751LL,  -2,  0LL,  @"Failed to create URL.",  v44,  v45,  v46,  v167);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v12 = 0LL;
        uint64_t v14 = (void *)v38;
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeImageProperties:]",  745LL,  -2,  0LL,  @"Failed to create path.",  v39,  v40,  v41,  v167);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = 0LL;
    }

- (BOOL)initializeDeviceAttributes:(id *)a3
{
  uint64_t v125 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  memset(v124, 0, sizeof(v124));
  v122 = @"PersonalizedImageType";
  -[PersonalizedImage imageVariant](self, "imageVariant");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
  uint64_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = MobileStorageRemoteCopyPersonalizationIdentifiersWithError(v8, v6, &cf);
  }

  else
  {
    id v9 = MobileStorageCopyPersonalizationIdentifiersWithError(v6, &cf);
  }

  v115 = v9;
  if (!v9
    && (mobileStorageErrorHasDomainAndErrorCode((void *)cf, @"com.apple.MobileStorage.ErrorDomain", -5LL) & 1) == 0)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  816LL,  -2,  (void *)cf,  @"Failed to query personalization identifiers.",  v10,  v11,  v12,  v111);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    int v118 = 0LL;
    uint64_t v119 = 0LL;
    v24 = 0LL;
    v116 = 0LL;
    uint64_t v120 = 0LL;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v16 = 0LL;
LABEL_19:
    char v34 = 0LL;
    v35 = 0LL;
    v117 = 0LL;
    if (!a3) {
      goto LABEL_40;
    }
LABEL_39:
    id v23 = v23;
    v53 = a3;
    LOBYTE(a3) = 0;
    id *v53 = v23;
    goto LABEL_40;
  }

  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = (void *)copy_remote_device_property();
  }

  else
  {
    BOOL v15 = (void *)MGCopyAnswer();
  }

  isNSString(v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v119 = v15;
  if (!v16)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  828LL,  -2,  0LL,  @"Failed to copy value: %@",  v17,  v18,  v19,  (uint64_t)@"HWModelStr");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    int v118 = 0LL;
    v24 = 0LL;
    v116 = 0LL;
    uint64_t v120 = 0LL;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_19;
  }

  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20) {
    uint64_t v21 = @"Bridge";
  }
  else {
    uint64_t v21 = (__CFString *)MGCopyAnswer();
  }
  v117 = v21;
  isNSString(v21);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  838LL,  -2,  0LL,  @"Failed to copy value: %@",  v28,  v29,  v30,  (uint64_t)@"DeviceClass");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    int v118 = 0LL;
    v24 = 0LL;
    v116 = 0LL;
    uint64_t v120 = 0LL;
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_38;
  }

  [v9 objectForKeyedSubscript:@"UniqueChipID"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = isNSNumber(v31);
  if (v32)
  {
    v33 = (void *)v32;
  }

  else
  {
    v36 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    if (!v36) {
      goto LABEL_24;
    }
    v33 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v37 = a3;
    uint64_t v38 = copy_remote_device_property();

    v31 = (void *)v38;
    a3 = v37;
  }

LABEL_24:
  isNSNumber(v31);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  int v118 = v31;
  if (!v26)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  849LL,  -2,  0LL,  @"Failed to copy value: %@",  v39,  v40,  v41,  (uint64_t)@"UniqueChipID");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0LL;
LABEL_35:
    v116 = 0LL;
LABEL_36:
    uint64_t v120 = 0LL;
LABEL_37:
    uint64_t v25 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v16 = 0LL;
LABEL_38:
    char v34 = 0LL;
    v35 = 0LL;
    if (!a3) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  [v9 objectForKeyedSubscript:@"ChipID"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = isNSNumber(v24);
  if (v42)
  {
    uint64_t v43 = (void *)v42;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44) {
      goto LABEL_31;
    }
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = a3;
    uint64_t v46 = copy_remote_device_property();

    v24 = (void *)v46;
    a3 = v45;
  }

LABEL_31:
  isNSNumber(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  858LL,  -2,  0LL,  @"Failed to copy value: %@",  v47,  v48,  v49,  (uint64_t)@"ChipID");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }

  [v9 objectForKeyedSubscript:@"BoardId"];
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = isNSNumber(v50);
  if (v51)
  {
    uint64_t v52 = (void *)v51;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55) {
      goto LABEL_46;
    }
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v56 = a3;
    uint64_t v57 = copy_remote_device_property();

    uint64_t v50 = (void *)v57;
    a3 = v56;
  }

LABEL_46:
  isNSNumber(v50);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  v116 = v50;
  if (!v26)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  867LL,  -2,  0LL,  @"Failed to copy value: %@",  v58,  v59,  v60,  (uint64_t)@"BoardId");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }

  [v9 objectForKeyedSubscript:@"SecurityDomain"];
  uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = isNSNumber(v120);
  if (v61)
  {
    uint64_t v62 = (void *)v61;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63) {
      goto LABEL_53;
    }
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = a3;
    uint64_t v65 = copy_remote_device_property();

    uint64_t v120 = (void *)v65;
    a3 = v64;
  }

LABEL_53:
  isNSNumber(v120);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  876LL,  -2,  0LL,  @"Failed to copy value: %@",  v66,  v67,  v68,  (uint64_t)@"SecurityDomain");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }

  [v9 objectForKeyedSubscript:@"EffectiveSecurityModeAp"];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = isNSNumber(v27);
  uint64_t v112 = a3;
  if (v69)
  {
    uint64_t v70 = (void *)v69;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v71) {
      goto LABEL_60;
    }
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v72 = copy_remote_device_property();

    uint64_t v27 = (void *)v72;
  }

LABEL_60:
  isNSNumber(v27);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  885LL,  -2,  0LL,  @"Failed to copy value: %@",  v73,  v74,  v75,  (uint64_t)@"EffectiveSecurityModeAp");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    uint64_t v16 = 0LL;
LABEL_79:
    char v34 = 0LL;
    v35 = 0LL;
    goto LABEL_80;
  }

  [v9 objectForKeyedSubscript:@"EffectiveProductionStatusAp"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = isNSNumber(v16);
  if (v76)
  {
    v77 = (void *)v76;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v78) {
      goto LABEL_67;
    }
    v77 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v79 = copy_remote_device_property();

    uint64_t v16 = (void *)v79;
  }

LABEL_67:
  isNSNumber(v16);
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v80)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  894LL,  -2,  0LL,  @"Failed to copy value: %@",  v81,  v82,  v83,  (uint64_t)@"EffectiveProductionStatusAp");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
LABEL_78:
    uint64_t v26 = 0LL;
    goto LABEL_79;
  }

  [v9 objectForKeyedSubscript:@"CertificateSecurityMode"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = isNSNumber(v25);
  if (v84)
  {
    v85 = (void *)v84;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v86) {
      goto LABEL_74;
    }
    v85 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v87 = copy_remote_device_property();

    uint64_t v25 = (void *)v87;
  }

LABEL_74:
  isNSNumber(v25);
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v88)
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  903LL,  -2,  0LL,  @"Failed to copy value: %@",  v89,  v90,  v91,  (uint64_t)@"CertificateSecurityMode");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_78;
  }

  [v9 objectForKeyedSubscript:@"CertificateProductionStatus"];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = isNSNumber(v26);
  if (v92)
  {
    v93 = (void *)v92;
  }

  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v94) {
      goto LABEL_85;
    }
    v93 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    id v95 = v9;
    uint64_t v96 = v6;
    uint64_t v97 = copy_remote_device_property();

    uint64_t v26 = (void *)v97;
    uint64_t v6 = v96;
    id v9 = v95;
  }

LABEL_85:
  isNSNumber(v26);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    [v9 objectForKeyedSubscript:@"Ap,SikaFuse"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      v102 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
      uint64_t v22 = v6;
      char v34 = MobileStorageRemoteCopyPersonalizationNonceWithError(v102, v6, &cf);
    }

    else
    {
      uint64_t v22 = v6;
      char v34 = (void *)MobileStorageCopyPersonalizationNonceWithError(v6, &cf);
    }

    isNSData(v34);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      v107 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
      if (v107)
      {
        -[PersonalizedImage remoteDevice](self, "remoteDevice");
        uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v113 = copy_remote_device_property();

        uint64_t v109 = (id *)v113;
      }

      else
      {
        uint64_t v109 = (id *)MGCopyAnswer();
      }

      uint64_t v114 = v109;
      isNSData(v109);
      uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();

      if (v110)
      {
        a3 = v114;
      }

      else
      {
        a3 = (id *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v124 length:160];
      }

      -[PersonalizedImage setDeviceClass:](self, "setDeviceClass:", v117);
      -[PersonalizedImage setHardwareModel:](self, "setHardwareModel:", v119);
      -[PersonalizedImage setEcid:](self, "setEcid:", v118);
      -[PersonalizedImage setChipID:](self, "setChipID:", v24);
      -[PersonalizedImage setBoardID:](self, "setBoardID:", v116);
      -[PersonalizedImage setSecurityDomain:](self, "setSecurityDomain:", v120);
      -[PersonalizedImage setEffectiveSecurityMode:](self, "setEffectiveSecurityMode:", v27);
      -[PersonalizedImage setEffectiveProductionStatus:](self, "setEffectiveProductionStatus:", v16);
      -[PersonalizedImage setCertificateSecurityMode:](self, "setCertificateSecurityMode:", v25);
      -[PersonalizedImage setCertificateProductionStatus:](self, "setCertificateProductionStatus:", v26);
      -[PersonalizedImage setImage4Supported:](self, "setImage4Supported:", MEMORY[0x189604A88]);
      -[PersonalizedImage setApNonce:](self, "setApNonce:", v34);
      -[PersonalizedImage setSepNonce:](self, "setSepNonce:", a3);
      -[PersonalizedImage setSikaFuse:](self, "setSikaFuse:", v35);

      id v23 = 0LL;
      LOBYTE(a3) = 1;
      goto LABEL_40;
    }

    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  924LL,  -2,  (void *)cf,  @"Failed to copy personalization nonce.",  v104,  v105,  v106,  v111);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v22 = v6;
    createMobileStorageError( (uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]",  912LL,  -2,  0LL,  @"Failed to copy value: %@",  v98,  v99,  v100,  (uint64_t)@"CertificateProductionStatus");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    char v34 = 0LL;
  }

- (BOOL)mountImage:(id)a3 serverTicket:(id)a4 imageDigest:(id)a5 trustCacheURL:(id)a6 error:(id *)a7
{
  v94[3] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v85 = v13;
  CFTypeRef cf = 0LL;
  uint64_t v81 = v12;
  uint64_t v83 = v14;
  if (!v11 || !v12 || !v13)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]",  981LL,  -2,  0LL,  @"Invalid input(s).",  v15,  v16,  v17,  v77);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v82 = 0LL;
    uint64_t v84 = 0LL;
    goto LABEL_42;
  }

  uint64_t v18 = (uint64_t)v14;
  id v19 = objc_alloc(MEMORY[0x189603FC8]);
  v93[0] = @"DeviceType";
  v93[1] = @"DiskImageType";
  v94[0] = @"DiskImage";
  v94[1] = @"Personalized";
  v93[2] = @"ImageSignature";
  v94[2] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v94 forKeys:v93 count:3];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = (void *)[v19 initWithDictionary:v20];

  if (v18)
  {
    uint64_t v21 = [objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v18];
    if (!v21)
    {
      createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]",  993LL,  -2,  0LL,  @"Failed to load %@.",  v22,  v23,  v24,  v18);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v30 = 0LL;
      uint64_t v82 = 0LL;
      goto LABEL_42;
    }

    uint64_t v25 = (void *)v21;
    [v84 setObject:v21 forKeyedSubscript:@"ImageTrustCache"];
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v31 = -[PersonalizedImage hardwareModel](self, "hardwareModel");
    -[PersonalizedImage deviceClass](self, "deviceClass");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage ecid](self, "ecid");
    v33 = self;
    char v34 = v25;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(void *)uint64_t v88 = v11;
    *(_WORD *)&v88[8] = 2112;
    *(void *)uint64_t v89 = v31;
    *(_WORD *)&v89[8] = 2112;
    uint64_t v90 = v32;
    __int16 v91 = 2112;
    uint64_t v92 = v35;
    _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Preparing to mount %@ on %@ (deviceClass: %@ ecid: %@)",  buf,  0x2Au);

    uint64_t v25 = v34;
    self = v33;
  }
  v36 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
  if (v36)
  {
    v37 = -[PersonalizedImage remoteDevice](self, "remoteDevice");
    uint64_t v30 = (void *)MobileStorageRemoteCopyDevicesWithError(v37, 0LL, &cf);
  }

  else
  {
    uint64_t v30 = MobileStorageCopyDevicesWithError(0LL, &cf);
  }

  isNSArray(v30);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v82 = v25;
  if (!v38)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]",  1010LL,  -2,  (void *)cf,  @"Failed to copy device list.",  v39,  v40,  v41,  v77);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    goto LABEL_42;
  }

  uint64_t v78 = self;
  uint64_t v79 = v11;
  if (![v30 count])
  {
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
LABEL_36:
    v53 = -[PersonalizedImage remoteDevice](v78, "remoteDevice");
    if (v53)
    {
      v54 = -[PersonalizedImage remoteDevice](v78, "remoteDevice");
      id v11 = v79;
      [v79 path];
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      int v56 = MobileStorageRemoteMountWithError(v54, v55, v84, &cf);

      if (v56)
      {
        uint64_t v57 = (void *)cf;
        [v79 path];
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]",  1049LL,  -2,  v57,  @"Failed to mount %@.",  v59,  v60,  v61,  (uint64_t)v58);
LABEL_41:
        id v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_42:
        if (a7)
        {
          id v26 = v26;
          BOOL v72 = 0;
          uint64_t v75 = 0LL;
          *a7 = v26;
        }

        else
        {
          BOOL v72 = 0;
          uint64_t v75 = 0LL;
        }

- (BOOL)mountImage:(id *)a3
{
  v101[5] = *MEMORY[0x1895F89C0];
  id v94 = 0LL;
  CFTypeRef cf = 0LL;
  BOOL v4 = -[PersonalizedImage initializeDeviceAttributes:](self, "initializeDeviceAttributes:", &v94);
  id v5 = v94;
  uint64_t v6 = v5;
  if (!v4)
  {
    id v12 = 0LL;
    uint64_t v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v90 = 0LL;
    uint64_t v23 = 0LL;
    id v8 = v5;
    goto LABEL_14;
  }

  id v93 = v5;
  BOOL v7 = -[PersonalizedImage initializeImageProperties:](self, "initializeImageProperties:", &v93);
  id v8 = v93;

  if (!v7)
  {
    id v12 = 0LL;
    uint64_t v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v90 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_14;
  }

  if (mountImage__onceToken != -1) {
    dispatch_once(&mountImage__onceToken, &__block_literal_global_0);
  }
  id v12 = (const void *)AMAuthInstallCreate();
  if (!v12)
  {
    createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1115LL,  -2,  0LL,  @"AMAuthInstallCreate failed.",  v9,  v10,  v11,  v79);
    goto LABEL_11;
  }

  -[PersonalizedImage signingServerURL](self, "signingServerURL");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = AMAuthInstallSetSigningServerURL();

  if ((_DWORD)v14)
  {
    convertLibAuthInstallError(v14);
    createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1123LL,  -2,  0LL,  @"AMAuthInstallSetSigningServerURL failed: %d (%s)",  v15,  v16,  v17,  v14);
    uint64_t v24 = LABEL_11:;
    uint64_t v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
LABEL_12:
    uint64_t v22 = 0LL;
    uint64_t v90 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_13;
  }

  if (-[PersonalizedImage useCredentials](self, "useCredentials"))
  {
    uint64_t v28 = AMAuthInstallSsoEnable();
    if ((_DWORD)v28)
    {
      uint64_t v29 = v28;
      convertLibAuthInstallError(v28);
      createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1132LL,  -2,  0LL,  @"AMAuthInstallSsoEnable failed: %d (%s)",  v30,  v31,  v32,  v29);
      goto LABEL_11;
    }
  }
  v33 = -[PersonalizedImage imagePathURL](self, "imagePathURL");
  id v92 = v8;
  -[PersonalizedImage digestFile:digestLength:error:]( self,  "digestFile:digestLength:error:",  v33,  -[PersonalizedImage digestLength](self, "digestLength"),  &v92);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v34 = v92;

  if (!v21)
  {
    -[PersonalizedImage imagePathURL](self, "imagePathURL");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1141LL,  -2,  v34,  @"Failed to digest %@.",  v38,  v39,  v40,  (uint64_t)v8);

    uint64_t v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_12;
  }
  v35 = -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
  uint64_t v90 = v21;
  if (v35)
  {
    v36 = -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
    id v91 = v34;
    -[PersonalizedImage digestFile:digestLength:error:]( self,  "digestFile:digestLength:error:",  v36,  -[PersonalizedImage digestLength](self, "digestLength"),  &v91);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v37 = v91;

    if (!v23)
    {
      -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1150LL,  -2,  v37,  @"Failed to digest %@",  v76,  v77,  v78,  (uint64_t)v8);

      uint64_t v18 = 0LL;
      id v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_13;
    }

    uint64_t v80 = v37;
  }

  else
  {
    uint64_t v80 = v34;
    uint64_t v23 = 0LL;
  }

  uint64_t v41 = *MEMORY[0x189614098];
  uint64_t v42 = *MEMORY[0x1896140B8];
  v100[0] = *MEMORY[0x189614098];
  v100[1] = v42;
  uint64_t v86 = v42;
  v101[0] = v21;
  v101[1] = MEMORY[0x189604A88];
  uint64_t v43 = *MEMORY[0x1896140A0];
  v100[2] = *MEMORY[0x1896140A0];
  -[PersonalizedImage effectiveProductionStatus](self, "effectiveProductionStatus");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v44;
  uint64_t v45 = *MEMORY[0x1896140A8];
  v100[3] = *MEMORY[0x1896140A8];
  -[PersonalizedImage effectiveSecurityMode](self, "effectiveSecurityMode");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v46;
  v100[4] = *MEMORY[0x1896140B0];
  -[PersonalizedImage imageVariant](self, "imageVariant");
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v47;
  [MEMORY[0x189603F68] dictionaryWithObjects:v101 forKeys:v100 count:5];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v98[0] = v41;
    v98[1] = v86;
    v99[0] = v23;
    v99[1] = MEMORY[0x189604A88];
    v98[2] = v43;
    -[PersonalizedImage effectiveProductionStatus](self, "effectiveProductionStatus");
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v48;
    v98[3] = v45;
    -[PersonalizedImage effectiveSecurityMode](self, "effectiveSecurityMode");
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v49;
    [MEMORY[0x189603F68] dictionaryWithObjects:v99 forKeys:v98 count:4];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  int v50 = (void *)MEMORY[0x189603FC8];
  v96[0] = *MEMORY[0x189614018];
  -[PersonalizedImage certificateSecurityMode](self, "certificateSecurityMode");
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v87;
  v96[1] = *MEMORY[0x189614000];
  -[PersonalizedImage certificateProductionStatus](self, "certificateProductionStatus");
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v84;
  v96[2] = *MEMORY[0x189614010];
  -[PersonalizedImage securityDomain](self, "securityDomain");
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v83;
  v96[3] = *MEMORY[0x189613FD8];
  -[PersonalizedImage boardID](self, "boardID");
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v82;
  v96[4] = *MEMORY[0x189613FE0];
  -[PersonalizedImage chipID](self, "chipID");
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v81;
  v96[5] = *MEMORY[0x189613FE8];
  -[PersonalizedImage ecid](self, "ecid");
  int v51 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v51;
  v96[6] = *MEMORY[0x189614008];
  -[PersonalizedImage image4Supported](self, "image4Supported");
  int v52 = (void *)objc_claimAutoreleasedReturnValue();
  v97[6] = v52;
  v96[7] = *MEMORY[0x189613FF8];
  v53 = -[PersonalizedImage apNonce](self, "apNonce");
  uint64_t v54 = *MEMORY[0x1896140C0];
  v97[7] = v53;
  v97[8] = MEMORY[0x189604A80];
  uint64_t v55 = *MEMORY[0x189613FD0];
  v96[8] = v54;
  v96[9] = v55;
  v97[9] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v97 forKeys:v96 count:10];
  int v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 dictionaryWithDictionary:v56];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PersonalizedImage sepNonce](self, "sepNonce");
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[PersonalizedImage sepNonce](self, "sepNonce");
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v58 forKeyedSubscript:*MEMORY[0x189614020]];
  }

  -[PersonalizedImage sikaFuse](self, "sikaFuse");
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[PersonalizedImage sikaFuse](self, "sikaFuse");
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v60 forKeyedSubscript:*MEMORY[0x189614028]];
  }

  if (v21) {
    [v18 setObject:v21 forKeyedSubscript:@"LoadableTrustCache"];
  }
  uint64_t v61 = AMAuthInstallRequestSendSync();
  if ((_DWORD)v61)
  {
    uint64_t v62 = v61;
    convertLibAuthInstallError(v61);
    uint64_t v24 = createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1204LL,  -2,  0LL,  @"AMAuthInstallRequestSendSync failed: %d (%s)",  v63,  v64,  v65,  v62);
    id v19 = 0LL;
    uint64_t v22 = 0LL;
  }

  else
  {
    id v19 = (id)cf;
    [v19 objectForKeyedSubscript:*MEMORY[0x189613FF0]];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v22);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      -[PersonalizedImage imagePathURL](self, "imagePathURL");
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v70 = -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
      uint64_t v71 = self;
      BOOL v72 = (void *)v70;
      BOOL v85 = -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]( v71,  "mountImage:serverTicket:imageDigest:trustCacheURL:error:",  v88,  v22,  v90);
      id v8 = v80;

      if (v85)
      {
        char v25 = 1;
LABEL_17:
        CFRelease(v12);
        BOOL v26 = v25;
        goto LABEL_18;
      }

      uint64_t v24 = createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1221LL,  -2,  v8,  @"Failed to mount image.",  v73,  v74,  v75,  v79);
      goto LABEL_13;
    }

    uint64_t v24 = createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:]",  1214LL,  -2,  0LL,  @"Invalid server ticket in response: %@",  v67,  v68,  v69,  (uint64_t)v19);
  }

  id v8 = v80;
LABEL_13:

  id v8 = (id)v24;
LABEL_14:
  if (a3) {
    *a3 = v8;
  }
  char v25 = 0;
  BOOL v26 = 0;
  if (v12) {
    goto LABEL_17;
  }
LABEL_18:
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v26;
}

uint64_t __32__PersonalizedImage_mountImage___block_invoke()
{
  return AMAuthInstallSsoInitialize();
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSURL)bundlePathURL
{
  return self->_bundlePathURL;
}

- (void)setBundlePathURL:(id)a3
{
}

- (NSDictionary)mountedVolumeEntry
{
  return self->_mountedVolumeEntry;
}

- (void)setMountedVolumeEntry:(id)a3
{
}

- (NSURL)imagePathURL
{
  return self->_imagePathURL;
}

- (void)setImagePathURL:(id)a3
{
}

- (NSString)imageVariant
{
  return self->_imageVariant;
}

- (void)setImageVariant:(id)a3
{
}

- (NSURL)trustCacheURL
{
  return self->_trustCacheURL;
}

- (void)setTrustCacheURL:(id)a3
{
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSNumber)certificateSecurityMode
{
  return self->_certificateSecurityMode;
}

- (void)setCertificateSecurityMode:(id)a3
{
}

- (NSNumber)certificateProductionStatus
{
  return self->_certificateProductionStatus;
}

- (void)setCertificateProductionStatus:(id)a3
{
}

- (NSNumber)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(id)a3
{
}

- (NSNumber)effectiveProductionStatus
{
  return self->_effectiveProductionStatus;
}

- (void)setEffectiveProductionStatus:(id)a3
{
}

- (NSNumber)image4Supported
{
  return self->_image4Supported;
}

- (void)setImage4Supported:(id)a3
{
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (unsigned)digestLength
{
  return self->_digestLength;
}

- (void)setDigestLength:(unsigned int)a3
{
  self->_digestLength = a3;
}

- (BOOL)useCredentials
{
  return self->_useCredentials;
}

- (void)setUseCredentials:(BOOL)a3
{
  self->_useCredentials = a3;
}

- (NSURL)signingServerURL
{
  return self->_signingServerURL;
}

- (void)setSigningServerURL:(id)a3
{
}

- (NSURL)userProvidedBundleMountPathURL
{
  return self->_userProvidedBundleMountPathURL;
}

- (void)setUserProvidedBundleMountPathURL:(id)a3
{
}

- (NSURL)userProvidedImagePathURL
{
  return self->_userProvidedImagePathURL;
}

- (void)setUserProvidedImagePathURL:(id)a3
{
}

- (BOOL)skipLoadingLaunchDaemons
{
  return self->_skipLoadingLaunchDaemons;
}

- (void)setSkipLoadingLaunchDaemons:(BOOL)a3
{
  self->_skipLoadingLaunchDaemons = a3;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)mountImage:(void *)a1 serverTicket:(uint64_t)a2 imageDigest:trustCacheURL:error:.cold.1( void *a1,  uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a1 path];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "%@ already mounted at %@.",  (uint8_t *)&v4,  0x16u);
}

@end