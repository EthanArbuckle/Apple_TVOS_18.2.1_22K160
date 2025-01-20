@interface AppleDeviceQueryKeysActionArmory
+ (NSString)key;
+ (id)ZhuGeToDo:(id)a3 withError:(id *)a4;
+ (id)getReportFDRDiagnosticFromOption:(id)a3 withError:(id *)a4;
+ (id)queryDisplayUniqueChipIDWithError:(id *)a3;
+ (id)queryFDRDeviceAsidMetadataIsVerified:(id)a3 withError:(id *)a4;
+ (id)queryFDRSealingStatusWithManifestOverride:(id)a3 WithError:(id *)a4;
+ (id)queryFactoryShippingSettingTimeWithError:(id *)a3;
+ (id)queryIOCameraByProperty:(id)a3 withError:(id *)a4;
+ (id)queryIOProperty:(id)a3 fromCriteria:(id)a4 withError:(id *)a5;
+ (id)queryIOPropertyFromPath:(id)a3 andCriteria:(id)a4 withError:(id *)a5;
+ (id)queryMogulIDSN:(id)a3 withError:(id *)a4;
+ (id)queryMogulTouchScreenCertDecoded:(BOOL)a3 withError:(id *)a4;
+ (id)querySPUProperty:(id)a3 withError:(id *)a4;
+ (id)queryScreenSerialNumberByProperty:(id)a3 withError:(id *)a4;
+ (id)querySysCfgKey:(id)a3 withError:(id *)a4;
+ (id)querySysctlVariableName:(id)a3 dataType:(id)a4 withError:(id *)a5;
+ (id)queryThreadRadioMacAddress64BitWithError:(id *)a3;
+ (id)queryThreadRadioMacAddressForProvisioningWithError:(id *)a3;
+ (id)queryTouchScreenCert:(id *)a3;
+ (id)queryWLHWIdentifierInfoByProperty:(id)a3 withError:(id *)a4;
+ (id)queryWLModuleSerialNumberWithError:(id *)a3;
+ (void)setKey:(id)a3;
@end

@implementation AppleDeviceQueryKeysActionArmory

+ (void)setKey:(id)a3
{
}

+ (NSString)key
{
  return (NSString *)(id)_key;
}

+ (id)getReportFDRDiagnosticFromOption:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  v33 = 0LL;
  v34 = 0LL;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]",  159LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v32);
    v27 = 0LL;
    v26 = 0LL;
    goto LABEL_18;
  }

  *a4 = 0LL;
  [v5 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = isObjectNilOrZhuGeNull(v10);

  v12 = 0LL;
  if ((v11 & 1) == 0)
  {
    [v9 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    [v9 objectForKeyedSubscript:@"ReportFDRDiagnostic_Options"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if ((isKindOfClass & 1) == 0)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]",  167LL,  @"FDR options is not a dictionary %@!",  v16,  v17,  v18,  (uint64_t)v15);

      v28 = (void *)MEMORY[0x189607870];
      uint64_t v29 = 9LL;
      goto LABEL_16;
    }
  }

  if (!libFDRLibraryCore_0()
    || !libFDRLibraryCore_0()
    || !getAMFDRDiagnosticGenerateReportSymbolLoc()
    || !libFDRLibraryCore_0()
    || !getAMFDRLogSetHandlerSymbolLoc())
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]",  178LL,  @"Failed to load libFDR.dylib!",  v19,  v20,  v21,  v32);
    v28 = (void *)MEMORY[0x189607870];
    uint64_t v29 = 13LL;
LABEL_16:
    [v28 errorWithZhuGeErrorCode:v29 underlyingError:0];
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0LL;
    v26 = 0LL;
LABEL_17:
    *a4 = v30;
    goto LABEL_18;
  }

  pAMFDRLogSetHandler((uint64_t)fdrDiagnosticLogCallback);
  ReportSymbolLoc = (uint64_t (*)(void *, void **, void **))getAMFDRDiagnosticGenerateReportSymbolLoc();
  if (!ReportSymbolLoc) {
    getFDRDataByFDRClassWithError_cold_1();
  }
  if ((ReportSymbolLoc(v12, &v34, &v33) & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory getReportFDRDiagnosticFromOption:withError:]",  186LL,  @"AMFDRDiagnosticGenerateReport failed!",  v23,  v24,  v25,  v32);
    v26 = v33;
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:15 underlyingError:v33];
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0LL;
    goto LABEL_17;
  }

  v26 = 0LL;
  v27 = v34;
LABEL_18:

  return v27;
}

+ (id)queryFDRSealingStatusWithManifestOverride:(id)a3 WithError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  v41 = 0LL;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  212LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v39);
    v34 = 0LL;
    goto LABEL_20;
  }

  *a4 = 0LL;
  if (!v5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  218LL,  @"needOverride pointer is nil!",  v6,  v7,  v8,  v39);
    v35 = (void *)MEMORY[0x189607870];
    uint64_t v36 = 45LL;
    goto LABEL_19;
  }

  if (!libFDRLibraryCore_0()
    || !libFDRLibraryCore_0()
    || !getAMFDRCreateWithOptionsSymbolLoc()
    || !libFDRLibraryCore_0()
    || !getAMFDRSealingMapVerifySealingSymbolLoc())
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  226LL,  @"Failed to load libFDR.dylib!",  v10,  v11,  v12,  v39);
    v35 = (void *)MEMORY[0x189607870];
    uint64_t v36 = 13LL;
LABEL_19:
    [v35 errorWithZhuGeErrorCode:v36 underlyingError:0];
    v34 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }

  uint64_t v13 = *MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  236LL,  @"CFDictionaryCreateMutable failed!",  v15,  v16,  v17,  v39);
    v35 = (void *)MEMORY[0x189607870];
    uint64_t v36 = 32LL;
    goto LABEL_19;
  }

  uint64_t v18 = Mutable;
  CFDictionarySetValue(Mutable, @"DataStore", @"Local");
  [v9 lowercaseString];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = [v19 isEqualToString:@"yes"];

  if (v20) {
    CFDictionarySetValue(v18, @"SealingManifestOverride", (const void *)*MEMORY[0x189604DE8]);
  }
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  245LL,  @"FDR options is %@",  v21,  v22,  v23,  (uint64_t)v18);
  AMFDRCreateWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, __CFDictionary *))getAMFDRCreateWithOptionsSymbolLoc();
  if (!AMFDRCreateWithOptionsSymbolLoc) {
    getFDRDataByFDRClassWithError_cold_1();
  }
  uint64_t v25 = AMFDRCreateWithOptionsSymbolLoc(v13, v18);
  if (v25)
  {
    uint64_t v29 = (const void *)v25;
    AMFDRSealingMapVerifySealingSymbolLoc = (uint64_t (*)(const void *, void **))getAMFDRSealingMapVerifySealingSymbolLoc();
    if (!AMFDRSealingMapVerifySealingSymbolLoc) {
      getFDRDataByFDRClassWithError_cold_1();
    }
    if ((AMFDRSealingMapVerifySealingSymbolLoc(v29, &v41) & 1) != 0)
    {
      v34 = (void *)MEMORY[0x189604A88];
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  257LL,  @"Didn't successfully verify fdr data sealing status, error %@!",  v31,  v32,  v33,  (uint64_t)v41);
      v38 = v41;
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:15 underlyingError:v41];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v34 = 0LL;
    }

    CFRelease(v29);
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]",  249LL,  @"AMFDRCreateWithOptions failed!",  v26,  v27,  v28,  v40);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:15 underlyingError:0];
    v34 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  CFRelease(v18);
LABEL_20:

  return v34;
}

+ (id)queryFDRDeviceAsidMetadataIsVerified:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v9 = v5;
  id v30 = 0LL;
  if (a4)
  {
    *a4 = 0LL;
    if (isObjectNilOrZhuGeNull(v5))
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]",  286LL,  @"option is nil",  v10,  v11,  v12,  v29);
      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = 45LL;
LABEL_17:
      [v13 errorWithZhuGeErrorCode:v14 underlyingError:0];
      uint64_t v15 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]",  291LL,  @"option is not a dictionary",  v16,  v17,  v18,  v29);
      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = 9LL;
      goto LABEL_17;
    }

    [v9 objectForKeyedSubscript:@"FDRDeviceAsidMetadataIsVerified_Options"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!libFDRLibraryCore_0()
      || !libFDRLibraryCore_0()
      || !getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc()
      || !libFDRLibraryCore_0()
      || !getAMFDRLogSetHandlerSymbolLoc())
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]",  301LL,  @"Failed to load libFDR.dylib!",  v20,  v21,  v22,  v29);
      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = 13LL;
      goto LABEL_17;
    }

    pAMFDRLogSetHandler((uint64_t)fdrLogCallback);
    AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc = (uint64_t (*)(void *, void **))getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc();
    if (!AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc) {
      getFDRDataByFDRClassWithError_cold_1();
    }
    if ((AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc(v19, &v30) & 1) != 0)
    {
      uint64_t v15 = (void *)MEMORY[0x189604A88];
      goto LABEL_18;
    }

    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]",  309LL,  @"AMFDRSealingMapVerifyAsidMetadataForDevice failed!",  v24,  v25,  v26,  v29);
    uint64_t v28 = v30;
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:15 underlyingError:v30];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]",  280LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v29);
  }

  uint64_t v15 = 0LL;
LABEL_18:

  return v15;
}

+ (id)queryIOPropertyFromPath:(id)a3 andCriteria:(id)a4 withError:(id *)a5
{
  kern_return_t v85;
  mach_error_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CFMutableDictionaryRef v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  void *v98;
  __CFString *v99;
  __CFDictionary *v100;
  __CFString *v101;
  void *v102;
  char v103;
  void *v104;
  int v105;
  __CFString *v106;
  uint64_t v107;
  int v108;
  __CFString *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  uint64_t v143;
  CFAllocatorRef allocator;
  id v145;
  id v146;
  CFStringRef key;
  void *v148;
  int v149;
  id v150;
  id CFProperty;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  CFMutableDictionaryRef properties;
  id v157;
  io_object_t object;
  _BYTE v159[128];
  uint64_t v160;
  v160 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v11 = a4;
  object = 0;
  if (!a5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  343LL,  @"error p-pointer is nil!",  v8,  v9,  v10,  v136);
    uint64_t v12 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v27 = 0LL;
    v34 = 0LL;
    v55 = 0LL;
    id v16 = 0LL;
    CFProperty = 0LL;
    goto LABEL_19;
  }

  *a5 = 0LL;
  if (!v7)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  350LL,  @"path pointer is nil!",  v8,  v9,  v10,  v136);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v27 = 0LL;
    v34 = 0LL;
    v55 = 0LL;
    id v16 = 0LL;
LABEL_18:
    CFProperty = 0LL;
    *a5 = v56;
    goto LABEL_19;
  }

  v157 = 0LL;
  [MEMORY[0x189607A00] regularExpressionWithPattern:@"(IO[a-z]+)://(.+)/(.+)" options:1 error:&v157];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v157;
  if (!v12)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  358LL,  @"Creating regEx failed for IO query!",  v13,  v14,  v15,  v136);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:4 underlyingError:v16];
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0LL;
LABEL_16:
    uint64_t v24 = 0LL;
    uint64_t v27 = 0LL;
    v34 = 0LL;
LABEL_17:
    v55 = 0LL;
    goto LABEL_18;
  }

  objc_msgSend(v12, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v17;
  if (!v17)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  364LL,  @"Matching regEx failed for IO path %@!",  v18,  v19,  v20,  (uint64_t)v7);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:47 underlyingError:0];
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  uint64_t v22 = [v17 rangeAtIndex:1];
  objc_msgSend(v7, "substringWithRange:", v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v21 rangeAtIndex:2];
  objc_msgSend(v7, "substringWithRange:", v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v21 rangeAtIndex:3];
  uint64_t v30 = objc_msgSend(v7, "substringWithRange:", v28, v29);
  v34 = (void *)v30;
  if (!v11)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  374LL,  @"criteria pointer is nil!",  v31,  v32,  v33,  v136);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }

  key = (const __CFString *)v30;
  [v11 objectForKeyedSubscript:@"fullPath"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  379LL,  @"Lacking of criteria fullPath service or not!",  v36,  v37,  v38,  v136);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:29 underlyingError:0];
    v55 = 0LL;
    CFProperty = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:
    v34 = (void *)key;
    goto LABEL_19;
  }

  v145 = v27;
  [v11 objectForKeyedSubscript:@"fullPath"];
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  [v148 lowercaseString];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  char v40 = [v39 isEqualToString:@"yes"];

  if ((v40 & 1) == 0)
  {
    properties = 0LL;
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  395LL,  @"Searching from non-fullPath services.",  v41,  v42,  v43,  v136);
    id v58 = v145;
    v59 = IOServiceMatching((const char *)[v58 UTF8String]);
    v142 = v12;
    v143 = (uint64_t)v7;
    if (v59)
    {
      v146 = v58;
      v137 = a5;
      mach_port_t v63 = *MEMORY[0x1896086A8];
      mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1896086A8], v59, &object);
      if (!MatchingServices && object)
      {
        ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  408LL,  @"Find service class: \"%@\"",  v65,  v66,  v67,  (uint64_t)v58);
LABEL_35:
        CFProperty = objc_alloc_init(MEMORY[0x189603FA8]);
        MEMORY[0x1895E011C](object);
        uint64_t v83 = IOIteratorNext(object);
        v55 = v148;
        if ((_DWORD)v83)
        {
          uint64_t v84 = v83;
          v70 = 0LL;
          v69 = 0LL;
          CFMutableDictionaryRef v68 = 0LL;
          allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
          v140 = v16;
          v141 = v11;
          v138 = v24;
          v139 = v21;
          while (1)
          {
            v149 = v84;
            v85 = IORegistryEntryCreateCFProperties(v84, &properties, allocator, 0);
            if (!v85) {
              break;
            }
            v86 = v85;
            if (v85 != 53)
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:v84];
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              mach_error_string(v86);
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  453LL,  @"Failed to get IO properties from service entry %@! %s!",  v111,  v112,  v113,  (uint64_t)v110);

              goto LABEL_68;
            }

            [MEMORY[0x189607968] numberWithUnsignedInt:v84];
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            mach_error_string(53);
            ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  449LL,  @"Failed to get IO properties from service entry %@! %s, a potential issue!",  v88,  v89,  v90,  (uint64_t)v87);

LABEL_77:
            IOObjectRelease(v84);
            uint64_t v84 = IOIteratorNext(object);
            if (!(_DWORD)v84) {
              goto LABEL_81;
            }
          }

          v91 = properties;

          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v92 = v11;
          v93 = [v92 countByEnumeratingWithState:&v152 objects:v159 count:16];
          if (!v93)
          {
            v96 = 1;
            goto LABEL_72;
          }

          v94 = v93;
          v95 = *(void *)v153;
          v96 = 1;
          v150 = v92;
LABEL_43:
          v97 = 0LL;
          while (1)
          {
            if (*(void *)v153 != v95) {
              objc_enumerationMutation(v92);
            }
            v98 = *(void **)(*((void *)&v152 + 1) + 8 * v97);
            if (([v98 isEqualToString:@"fullPath"] & 1) == 0) {
              break;
            }
LABEL_64:
            if (v94 == ++v97)
            {
              v94 = [v92 countByEnumeratingWithState:&v152 objects:v159 count:16];
              if (v94) {
                goto LABEL_43;
              }
LABEL_72:

              id v11 = v141;
              if ([v92 count] == v96)
              {
                v118 = -[__CFDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", key);
                CFMutableDictionaryRef v68 = v91;
                uint64_t v21 = v139;
                id v16 = v140;
                uint64_t v24 = v138;
                if (v118)
                {
                  v122 = -[__CFDictionary objectForKeyedSubscript:](v68, "objectForKeyedSubscript:", key);
                  [CFProperty addObject:v122];

                  goto LABEL_76;
                }

                LODWORD(v84) = v149;
                ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  499LL,  @"No property \"%@\" in entry \"%u\"",  v119,  v120,  v121,  (uint64_t)key);
LABEL_68:
                v55 = v148;
              }

              else
              {
                CFMutableDictionaryRef v68 = v91;
                uint64_t v21 = v139;
                id v16 = v140;
                uint64_t v24 = v138;
LABEL_76:
                v55 = v148;
                LODWORD(v84) = v149;
              }

              goto LABEL_77;
            }
          }

          [v92 objectForKeyedSubscript:v98];
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v100 = v91;
          -[__CFDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", v98);
          v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v102 = -[__CFString lowercaseString](v99, "lowercaseString");
          v103 = [v102 isEqualToString:@"yes"];

          v69 = @"Yes";
          if ((v103 & 1) != 0
            || (-[__CFString lowercaseString](v99, "lowercaseString"),
                v104 = (void *)objc_claimAutoreleasedReturnValue(),
                v105 = [v104 isEqualToString:@"no"],
                v104,
                v69 = @"No",
                v105))
          {
          }

          else
          {
            v69 = v99;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [NSString stringFromData:v101];
            v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v114 = objc_opt_class();
                ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  485LL,  @"Unsupported type \"%@\" for criterion \"%@\"",  v115,  v116,  v117,  v114);
                v70 = v101;
                v91 = v100;
LABEL_71:
                v92 = v150;
                goto LABEL_72;
              }

              v70 = v101;
              goto LABEL_62;
            }

            v107 = objc_opt_class();
            if (v107 == objc_opt_class())
            {
              v108 = -[__CFString BOOLValue](v101, "BOOLValue");
              v109 = @"Yes";
              if (!v108) {
                v109 = @"No";
              }
              v106 = v109;
            }

            else
            {
              -[__CFString stringValue](v101, "stringValue");
              v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }

          v70 = v106;

LABEL_62:
          v91 = v100;
          ++v96;
          v92 = v150;
          goto LABEL_64;
        }

        CFMutableDictionaryRef v68 = 0LL;
        v69 = 0LL;
        v70 = 0LL;
LABEL_81:
        v123 = [CFProperty count];
        if (v123 == 1)
        {
          v127 = [CFProperty objectAtIndexedSubscript:0];

          CFProperty = (id)v127;
        }

        else if (!v123)
        {

          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  509LL,  @"Failed to find a non-fullPath service for path \"%@\"",  v124,  v125,  v126,  v143);
          [MEMORY[0x189607870] errorWithZhuGeErrorCode:21 underlyingError:0];
          CFProperty = 0LL;
          *v137 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v27 = v146;
        goto LABEL_90;
      }

      mach_error_string(MatchingServices);
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  411LL,  @"Cannot find service class: %@, %s",  v71,  v72,  v73,  (uint64_t)v58);
      id v74 = v58;
      v75 = IOServiceNameMatching((const char *)[v74 UTF8String]);
      if (v75)
      {
        mach_error_t v79 = IOServiceGetMatchingServices(v63, v75, &object);
        if (!v79 && object)
        {
          ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  422LL,  @"Find service name: \"%@\"",  v80,  v81,  v82,  (uint64_t)v74);
          goto LABEL_35;
        }

        mach_error_string(v79);
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  425LL,  @"Cannot find service name: %@, %s",  v130,  v131,  v132,  (uint64_t)v74);
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  428LL,  @"Failed to find IO entry for %@!",  v133,  v134,  v135,  (uint64_t)v74);
        v128 = (void *)MEMORY[0x189607870];
        v129 = 20LL;
      }

      else
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  416LL,  @"Failed to match the service name %@!",  v76,  v77,  v78,  (uint64_t)v74);
        v128 = (void *)MEMORY[0x189607870];
        v129 = 24LL;
      }

      [v128 errorWithZhuGeErrorCode:v129 underlyingError:0];
      CFProperty = 0LL;
      CFMutableDictionaryRef v68 = 0LL;
      v69 = 0LL;
      v70 = 0LL;
      *v137 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v146;
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  402LL,  @"Failed to match the service class %@!",  v60,  v61,  v62,  (uint64_t)v58);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:24 underlyingError:0];
      CFProperty = 0LL;
      CFMutableDictionaryRef v68 = 0LL;
      v69 = 0LL;
      v70 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v58;
    }

    v55 = v148;
LABEL_90:

    uint64_t v12 = v142;
    id v7 = (id)v143;
    goto LABEL_91;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  524LL,  @"Searching from fullPath service.",  v41,  v42,  v43,  v136);
  [NSString stringWithFormat:@"%@:/%@", v24, v145];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  mach_port_t v45 = *MEMORY[0x1896086A8];
  id v46 = v44;
  io_registry_entry_t v47 = IORegistryEntryFromPath(v45, (const char *)[v46 UTF8String]);
  if (v47)
  {
    io_object_t v51 = v47;
    v34 = (void *)key;
    CFProperty = (id)IORegistryEntryCreateCFProperty(v47, key, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
    if (!CFProperty)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  537LL,  @"Cannot create CF property for property %@!",  v52,  v53,  v54,  (uint64_t)key);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:21 underlyingError:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    IOObjectRelease(v51);
    uint64_t v27 = v145;
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]",  530LL,  @"Cannot find IO entry from path %@!",  v48,  v49,  v50,  (uint64_t)v46);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:20 underlyingError:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    CFProperty = 0LL;
    uint64_t v27 = v145;
    v34 = (void *)key;
  }

  v55 = v148;
LABEL_19:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return CFProperty;
}

+ (id)queryIOProperty:(id)a3 fromCriteria:(id)a4 withError:(id *)a5
{
  kern_return_t CFProperties;
  mach_error_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  int v162;
  uint64_t v163;
  int v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  char v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  char v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  char v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  char v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  void *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  int v280;
  int v281;
  int v282;
  CFAllocatorRef allocator;
  IOOptionBits options;
  IOOptionBits optionsa;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  io_registry_entry_t entry;
  void *v298;
  void *v299;
  int v300;
  void *v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  io_registry_entry_t parent;
  io_object_t object;
  char v308[128];
  io_name_t name;
  io_name_t className;
  uint64_t v311;
  v311 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  uint64_t v13 = v9;
  object = 0;
  if (!a5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  573LL,  @"error p-pointer is nil!",  v10,  v11,  v12,  v266);
    uint64_t v15 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    goto LABEL_17;
  }

  *a5 = 0LL;
  if (!v8)
  {
    uint64_t v24 = @"property pointer is nil!";
    uint64_t v25 = 579LL;
LABEL_13:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  v25,  v24,  v10,  v11,  v12,  v266);
    uint64_t v26 = (void *)MEMORY[0x189607870];
    uint64_t v27 = 45LL;
LABEL_14:
    [v26 errorWithZhuGeErrorCode:v27 underlyingError:0];
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0LL;
LABEL_15:
    uint64_t v20 = 0LL;
LABEL_16:
    uint64_t v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    *a5 = v28;
    goto LABEL_17;
  }

  if (!v9)
  {
    uint64_t v24 = @"criteria pointer is nil!";
    uint64_t v25 = 585LL;
    goto LABEL_13;
  }

  [v9 objectForKeyedSubscript:@"basic"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    [a1 key];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  591LL,  @"Missing basic criteria for key %@!",  v31,  v32,  v33,  (uint64_t)v30);

    uint64_t v26 = (void *)MEMORY[0x189607870];
    uint64_t v27 = 29LL;
    goto LABEL_14;
  }

  [v13 objectForKeyedSubscript:@"basic"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a1 key];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  598LL,  @"Invalid basic criteria type for key %@!",  v35,  v36,  v37,  (uint64_t)v34);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:38 underlyingError:0];
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  [v13 objectForKeyedSubscript:@"extra"];
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isObjectNilOrZhuGeNull(v301) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [a1 key];
      char v40 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  605LL,  @"Invalid extra criteria type for key %@!",  v41,  v42,  v43,  (uint64_t)v40);

      [MEMORY[0x189607870] errorWithZhuGeErrorCode:38 underlyingError:0];
      uint64_t v21 = 0LL;
      id v22 = 0LL;
      id v23 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = v301;
      goto LABEL_17;
    }
  }

  [v15 objectForKeyedSubscript:@"direction"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = isObjectNilOrZhuGeNull(v16);

  if ((v17 & 1) != 0)
  {
    int v18 = 0;
    int v19 = 1;
  }

  else
  {
    [v15 objectForKeyedSubscript:@"direction"];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    char v39 = [v38 isEqualToString:@"child"];

    if ((v39 & 1) != 0)
    {
      int v19 = 0;
      int v18 = 1;
    }

    else
    {
      [v15 objectForKeyedSubscript:@"direction"];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      int v45 = [v44 isEqualToString:@"parent"];

      int v19 = v45 ^ 1;
      if (v45) {
        int v18 = 2;
      }
      else {
        int v18 = 0;
      }
    }
  }

  [a1 key];
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  620LL,  @"Searching property %@ for key %@ with criteria %@",  v46,  v47,  v48,  (uint64_t)v8);

  [v15 objectForKeyedSubscript:@"path"];
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    [v15 objectForKeyedSubscript:@"path"];
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v50 componentsSeparatedByString:@":"];
    io_object_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = v301;
    if ((unint64_t)[v51 count] > 1)
    {
      options = v18;
      v292 = a1;
      [v51 objectAtIndexedSubscript:0];
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
      mach_port_t v72 = *MEMORY[0x1896086A8];
      id v73 = v50;
      io_registry_entry_t v74 = IORegistryEntryFromPath(v72, (const char *)[v73 UTF8String]);
      if (v74)
      {
        io_registry_entry_t v75 = v74;
        v290 = v71;
        uint64_t v76 = (const char *)[v290 UTF8String];
        id v23 = (id)IORegistryEntrySearchCFProperty(v75, v76, v8, (CFAllocatorRef)*MEMORY[0x189604DB0], options);
        [v292 key];
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  652LL,  @"Found property %@ for key %@ with fullPath",  v77,  v78,  v79,  (uint64_t)v8);
        }

        else
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  647LL,  @"Failed to search property %@ for key %@!",  v77,  v78,  v79,  (uint64_t)v8);

          [MEMORY[0x189607870] errorWithZhuGeErrorCode:21 underlyingError:0];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        IOObjectRelease(v75);
        id v22 = 0LL;
        goto LABEL_175;
      }

      v290 = v71;
      [v292 key];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  637LL,  @"Cannot find IO service entry from path %@ for key %@!",  v86,  v87,  v88,  (uint64_t)v73);
      uint64_t v56 = 20LL;
    }

    else
    {
      [a1 key];
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  629LL,  @"Invalid full path to search property %@ for key %@!",  v53,  v54,  v55,  (uint64_t)v8);
      v290 = 0LL;
      uint64_t v56 = 41LL;
    }

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:v56 underlyingError:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    id v22 = 0LL;
LABEL_46:
    id v23 = 0LL;
    goto LABEL_175;
  }

  uint64_t v57 = [v15 objectForKeyedSubscript:@"servicePlane"];
  uint64_t v20 = v301;
  if (!v57)
  {
    [a1 key];
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  661LL,  @"Failed to search property %@ for key %@ due to a nil service plane!",  v83,  v84,  v85,  (uint64_t)v8);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:26 underlyingError:0];
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  id v58 = (void *)v57;
  v282 = v19;
  [v15 objectForKeyedSubscript:@"parentPlane"];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22) {
    id v22 = v58;
  }
  v290 = v58;
  uint64_t v59 = [v15 objectForKeyedSubscript:@"serviceClass"];
  v296 = v22;
  if (v59
    && (uint64_t v60 = (void *)v59,
        [v15 objectForKeyedSubscript:@"serviceName"],
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(),
        v61,
        v60,
        v61))
  {
    id v62 = [v15 objectForKeyedSubscript:@"serviceClass"];
    mach_port_t v63 = IOServiceMatching((const char *)[v62 UTF8String]);

    if (!v63)
    {
      [v15 objectForKeyedSubscript:@"serviceClass"];
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 key];
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  676LL,  @"Failed step1 of matching %@ for key %@!",  v92,  v93,  v94,  (uint64_t)v91);

      v95 = (void *)MEMORY[0x189607870];
      uint64_t v96 = 24LL;
      goto LABEL_171;
    }

    [v15 objectForKeyedSubscript:@"serviceName"];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v63, @"IONameMatch", v64);

    Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v63);
    CFRelease(v63);
    CFMutableDictionaryRef v69 = 0LL;
    v70 = @"service class and name";
  }

  else
  {
    [v15 objectForKeyedSubscript:@"serviceClass"];
    uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      id v82 = [v15 objectForKeyedSubscript:@"serviceClass"];
      Copy = IOServiceMatching((const char *)[v82 UTF8String]);

      CFMutableDictionaryRef v69 = 0LL;
      v70 = @"service class";
    }

    else
    {
      [v15 objectForKeyedSubscript:@"serviceName"];
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        id v90 = [v15 objectForKeyedSubscript:@"serviceName"];
        CFMutableDictionaryRef v69 = IOServiceNameMatching((const char *)[v90 UTF8String]);

        Copy = 0LL;
        v70 = @"service name";
      }

      else
      {
        [v15 objectForKeyedSubscript:@"service"];
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (v97)
        {
          id v98 = [v15 objectForKeyedSubscript:@"service"];
          Copy = IOServiceMatching((const char *)[v98 UTF8String]);

          id v99 = [v15 objectForKeyedSubscript:@"service"];
          CFMutableDictionaryRef v69 = IOServiceNameMatching((const char *)[v99 UTF8String]);

          v70 = @"service class or name";
        }

        else
        {
          CFMutableDictionaryRef v69 = 0LL;
          Copy = 0LL;
          v70 = @"service plane";
        }
      }
    }
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  710LL,  @"Trying to get IO iterator with condition of \"%@\"",  v66,  v67,  v68,  (uint64_t)v70);
  if ((-[__CFString isEqualToString:](v70, "isEqualToString:", @"service plane") & 1) != 0)
  {
    *(_DWORD *)className = *MEMORY[0x1896086A8];
    mach_error_t v100 = MEMORY[0x1895E0128](*MEMORY[0x1895F9630], className);
    if (v100)
    {
      mach_error_t v101 = v100;
      [a1 key];
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  736LL,  @"Failed to get bootstrap main port for key %@!",  v103,  v104,  v105,  (uint64_t)v102);

      v106 = (void *)MEMORY[0x189607870];
      [NSString stringWithUTF8String:mach_error_string(v101)];
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      [v106 errorWithZhuGeErrorCode:19 underlyingError:v107];
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_58:
      id v22 = v296;
      goto LABEL_46;
    }

    v293 = a1;
    mach_port_t v109 = *(_DWORD *)className;
    id v110 = [NSString stringWithFormat:@"%@:/", v290, v267, v13];
    uint64_t v111 = IORegistryEntryFromPath(v109, (const char *)[v110 UTF8String]);

    if (!(_DWORD)v111)
    {
      [v293 key];
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  744LL,  @"Failed to get plane entry for key %@!",  v263,  v264,  v265,  (uint64_t)v262);

      [MEMORY[0x189607870] errorWithZhuGeErrorCode:20 underlyingError:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = v301;
      goto LABEL_58;
    }

    mach_error_t v112 = MEMORY[0x1895E0164](v111, [v290 UTF8String], 1, &object);
    id v22 = v296;
    if (v112)
    {
      mach_error_t v113 = v112;
      [v293 key];
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  751LL,  @"Failed to get io service iterator from %@ for key %@!",  v114,  v115,  v116,  (uint64_t)v70);

      v117 = (void *)MEMORY[0x189607870];
      [NSString stringWithUTF8String:mach_error_string(v113)];
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      [v117 errorWithZhuGeErrorCode:20 underlyingError:v118];
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v20 = v301;
      goto LABEL_46;
    }

    IOObjectRelease(v111);
    mach_port_deallocate(*MEMORY[0x1895FBBE0], *(mach_port_name_t *)className);
    uint64_t v20 = v301;
    a1 = v293;
    goto LABEL_73;
  }

  if (Copy)
  {
    mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1896086A8], Copy, &object);
    if (!MatchingServices && object)
    {
      if (v69) {
        CFRelease(v69);
      }
      mach_error_t MatchingServices = 0;
      goto LABEL_71;
    }
  }

  else
  {
    mach_error_t MatchingServices = -536870212;
  }

  if (v69) {
    mach_error_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1896086A8], v69, &object);
  }
LABEL_71:
  if (MatchingServices || !object)
  {
    [a1 key];
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOProperty:fromCriteria:withError:]",  728LL,  @"Failed to get io service iterator by %@ for key %@!",  v249,  v250,  v251,  (uint64_t)v70);

    v252 = (void *)MEMORY[0x189607870];
    [NSString stringWithUTF8String:mach_error_string(MatchingServices)];
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    [v252 errorWithZhuGeErrorCode:20 underlyingError:v253];
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    id v23 = 0LL;
    uint64_t v21 = v290;
    id v22 = v296;
    goto LABEL_17;
  }

+ (id)querySysctlVariableName:(id)a3 dataType:(id)a4 withError:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v11 = a4;
  memset(v25, 0, sizeof(v25));
  size_t v24 = 128LL;
  if (!a5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]",  993LL,  @"error p-pointer is nil!",  v8,  v9,  v10,  v23);
    uint64_t v15 = 0LL;
    goto LABEL_12;
  }

  *a5 = 0LL;
  if (!v7)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]",  999LL,  @"name pointer is nil!",  v8,  v9,  v10,  v23);
    id v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = 45LL;
LABEL_9:
    [v16 errorWithZhuGeErrorCode:v17 underlyingError:0];
    uint64_t v15 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  id v12 = v7;
  if (sysctlbyname((const char *)[v12 UTF8String], v25, &v24, 0, 0) == -1)
  {
    __error();
    int v18 = __error();
    strerror(*v18);
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysctlVariableName:dataType:withError:]",  1007LL,  @"Cannot look up %@. System errno=%d errstr=%s",  v19,  v20,  v21,  (uint64_t)v12);
    id v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = 61LL;
    goto LABEL_9;
  }

  [v11 lowercaseString];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 isEqualToString:@"number"];

  if (v14) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)&v25[0]);
  }
  else {
    [NSString stringWithUTF8String:v25];
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

+ (id)ZhuGeToDo:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (a4)
  {
    *a4 = 0LL;
    if (!v5)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]",  1039LL,  @"name pointer is nil!",  v6,  v7,  v8,  v17);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = 0LL;
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }

    id v18 = 0LL;
    MGQuery(v5, &v18);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v18;
    if (!v10)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]",  1047LL,  @"Failed to retrive value for %@ from MobileGestalt!",  v11,  v12,  v13,  (uint64_t)v9);
      id v15 = v14;
      id v14 = v15;
LABEL_7:
      *a4 = v15;
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory ZhuGeToDo:withError:]",  1033LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v17);
    id v14 = 0LL;
    uint64_t v10 = 0LL;
  }

  return v10;
}

+ (id)queryIOCameraByProperty:(id)a3 withError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v10 = v6;
  v31[2] = xmmword_18A34F608;
  v31[3] = *(_OWORD *)&off_18A34F618;
  uint64_t v32 = @"AppleH16CamIn";
  v31[0] = xmmword_18A34F5E8;
  v31[1] = *(_OWORD *)&off_18A34F5F8;
  if (a4)
  {
    *a4 = 0LL;
    if (v6)
    {
      uint64_t v29 = a4;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 64LL;
      while (1)
      {
        id v14 = v12;

        uint64_t v15 = *(void *)((char *)v31 + v13);
        [NSString stringWithFormat:@"%s://%@/%@", "IOService", v15, v10];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        id v30 = 0LL;
        [a1 queryIOPropertyFromPath:v12 andCriteria:&unk_18A3578A0 withError:&v30];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = v30;
        uint64_t v11 = v17;
        if (v16) {
          break;
        }
        [v17 ZhuGeDescription];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]",  1665LL,  @"Failed to query property for %@, error %@",  v18,  v19,  v20,  v15);

        v13 -= 8LL;
        if (v13 == -8)
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]",  1669LL,  @"Failed to query property %@! after trying all methods",  v21,  v22,  v23,  (uint64_t)v10);
          [MEMORY[0x189607870] errorWithZhuGeErrorCode:63 underlyingError:0];
          id v16 = 0LL;
          *uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
          break;
        }
      }
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]",  1648LL,  @"property pointer is nil!",  v7,  v8,  v9,  v27);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v16 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v11 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryIOCameraByProperty:withError:]",  1642LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v27);
    id v16 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
  }

  id v24 = v16;
  for (uint64_t i = 64LL; i != -8; i -= 8LL)

  return v24;
}

+ (id)queryScreenSerialNumberByProperty:(id)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v10 = v6;
  v37[0] = 0LL;
  v37[1] = 0LL;
  __int16 v38 = 0;
  if (a4)
  {
    *a4 = 0LL;
    if (v6)
    {
      uint64_t v35 = @"basic";
      uint64_t v33 = @"path";
      [NSString stringWithFormat:@"%s:/%@"];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      id v32 = 0LL;
      [a1 queryIOProperty:@"panel-serial-number" fromCriteria:v13 withError:&v32];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = v32;
      id v16 = v15;
      if (!v14)
      {
        id v31 = v15;
        [a1 queryIOProperty:v10 fromCriteria:v13 withError:&v31];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = v31;

        if (!v14)
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]",  1717LL,  @"Failed to query property %@! after trying all methods",  v18,  v19,  v20,  (uint64_t)v10);
          id v24 = v17;
          id v16 = v24;
          goto LABEL_10;
        }

        id v16 = v17;
      }

      if ((unint64_t)[v14 length] > 0x11)
      {
        [v14 getBytes:v37 length:18];
        uint64_t v25 = (void *)[objc_alloc(NSString) initWithBytes:v37 length:18 encoding:4];
        if (v25) {
          goto LABEL_12;
        }
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]",  1732LL,  @"Failed to get ScreenSerialNumber",  v27,  v28,  v29,  (uint64_t)"IODeviceTree");
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:10 underlyingError:0];
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }

      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]",  1723LL,  @"The size of %@(less than %d) isn't correct: %@!",  v21,  v22,  v23,  (uint64_t)v10);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:37 underlyingError:0];
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryScreenSerialNumberByProperty:withError:]",  1699LL,  @"property pointer is nil!",  v7,  v8,  v9,  v30);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = 0LL;
      id v16 = 0LL;
      uint64_t v13 = 0LL;
    }

+ (id)queryWLHWIdentifierInfoByProperty:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x189603F68] dictionaryWithObjectsAndKeys:@"C"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1770LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  (uint64_t)@"ChipNumber");
    uint64_t v20 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v19 = 0LL;
    id v15 = 0LL;
    goto LABEL_14;
  }

  *a4 = 0LL;
  if (!v6)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1776LL,  @"property pointer is nil!",  v7,  v8,  v9,  (uint64_t)@"ChipNumber");
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v19 = 0LL;
    id v15 = 0LL;
LABEL_13:
    *a4 = v31;
    goto LABEL_14;
  }

  id v34 = 0LL;
  [a1 queryIOProperty:@"HWIdentifiers" fromCriteria:&unk_18A3578F0 withError:&v34];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v34;
  if (!v11)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1790LL,  @"Failed to query WLHWIdentifier for property %@, no matching key found in %s",  v12,  v13,  v14,  (uint64_t)v6);
    id v31 = v15;
    id v15 = v31;
LABEL_12:
    uint64_t v20 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_13;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1796LL,  @"Failed to query WLHWIdentifier due to mismatch data type, data read %@",  v16,  v17,  v18,  (uint64_t)v11);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:38 underlyingError:0];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  [v10 objectForKey:v6];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1804LL,  @"No data for property %@, field %@",  v21,  v22,  v23,  (uint64_t)v6);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:29 underlyingError:0];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  [v11 objectForKey:v19];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v26 = (void *)NSString;
    [v11 objectForKey:v19];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", @"%d", objc_msgSend(v27, "intValue"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v11 objectForKey:v19];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]",  1815LL,  @"Read %@, field %@, output %@",  v28,  v29,  v30,  (uint64_t)v6);
LABEL_14:
  id v32 = v20;

  return v32;
}

+ (id)queryWLModuleSerialNumberWithError:(id *)a3
{
  id v22 = 0LL;
  [a1 queryIOProperty:@"wifi-module-sn" fromCriteria:&unk_18A357940 withError:&v22];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v22;
  if (!v4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]",  1842LL,  @"Failed to query wifi-module-sn from ioreg path %@!",  v5,  v6,  v7,  0LL);
    id v14 = v8;
LABEL_9:
    uint64_t v10 = 0LL;
    *a3 = v14;
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]",  1848LL,  @"Query wifi-module-sn fail, type %@, data %@",  v16,  v17,  v18,  v15);
    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = 38LL;
LABEL_8:
    [v19 errorWithZhuGeErrorCode:v20 underlyingError:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  [NSString hexStringFromData:v4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 uppercaseString];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v10 length] != 12)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]",  1855LL,  @"Unexpected length of wifi-module-sn: %@, expecting length %d",  v11,  v12,  v13,  (uint64_t)v10);

    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = 37LL;
    goto LABEL_8;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryWLModuleSerialNumberWithError:]",  1861LL,  @"Read WLModuleSerialNumber, output %@",  v11,  v12,  v13,  (uint64_t)v10);
LABEL_10:

  return v10;
}

+ (id)queryDisplayUniqueChipIDWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0LL;
    id v15 = 0LL;
    [a1 queryIOProperty:@"ecid" fromCriteria:&unk_18A3579B8 withError:&v15];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v15;
    if (v7)
    {
      [MEMORY[0x189607968] integerFromData:v7 size:8 truncate:1 isSigned:0 needSwap:0];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryDisplayUniqueChipIDWithError:]",  2501LL,  @"Failed to query IO property ecid for TCON!",  v8,  v9,  v10,  v14);
      id v11 = v11;
      uint64_t v12 = 0LL;
      *a3 = v11;
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryDisplayUniqueChipIDWithError:]",  2483LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v14);
    uint64_t v7 = 0LL;
    id v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)querySysCfgKey:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]",  2528LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v25);
    id v10 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    goto LABEL_15;
  }

  *a4 = 0LL;
  if (!v5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]",  2534LL,  @"key pointer is nil!",  v6,  v7,  v8,  v25);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0LL;
    id v14 = 0LL;
    goto LABEL_13;
  }

  id v26 = 0LL;
  MGQuery(@"SysCfgDict", &v26);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v26;
  if (!v10)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]",  2542LL,  @"Failed to get sysconfig dictionary!",  v11,  v12,  v13,  v25);
    id v16 = v14;
    id v14 = v16;
    goto LABEL_13;
  }

  if (![v9 isEqualToString:@"all"])
  {
    if ([v9 length] == 4)
    {
      [v10 objectForKeyedSubscript:v9];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        goto LABEL_15;
      }
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]",  2561LL,  @"Failed to read %@ from sysconfig dictionary",  v17,  v18,  v19,  (uint64_t)v9);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:60 underlyingError:0];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      *a4 = v16;
      goto LABEL_15;
    }

    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySysCfgKey:withError:]",  2554LL,  @"Length of sysconfig key %@ is wrong, expecting 4!",  v21,  v22,  v23,  (uint64_t)v20);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:37 underlyingError:0];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v15 = 0LL;
    goto LABEL_14;
  }

  id v10 = v10;
  id v15 = v10;
LABEL_15:

  return v15;
}

+ (id)queryThreadRadioMacAddressForProvisioningWithError:(id *)a3
{
  v32[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v6 = a3;
    *a3 = 0LL;
    if ([&unk_18A357EE0 count])
    {
      uint64_t v26 = (uint64_t)v6;
      uint64_t v8 = 0LL;
      id v9 = 0LL;
      id v10 = 0LL;
      while (1)
      {
        uint64_t v11 = v10;
        id v31 = @"basic";
        uint64_t v12 = v9;
        v29[0] = @"servicePlane";
        v29[1] = @"serviceName";
        v30[0] = @"IODeviceTree";
        objc_msgSend(&unk_18A357EE0, "objectAtIndexedSubscript:", v8, v26);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v13;
        [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:2];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v14;
        [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        id v28 = v12;
        [a1 queryIOProperty:@"local-mac-address" fromCriteria:v10 withError:&v28];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = v28;

        if (v15) {
          break;
        }
        if ([&unk_18A357EE0 count] <= (unint64_t)++v8)
        {
          id v15 = 0LL;
          uint64_t v6 = (id *)v26;
          goto LABEL_9;
        }
      }

      if ([v15 length]) {
        uint64_t v19 = [v15 length];
      }
      else {
        uint64_t v19 = 8LL;
      }
      uint64_t v6 = (id *)v26;
    }

    else
    {
      id v9 = 0LL;
      id v10 = 0LL;
      id v15 = 0LL;
LABEL_9:
      uint64_t v19 = 8LL;
    }

    id v27 = v9;
    [a1 querySysCfgKey:@"TMac" withError:&v27];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v27;

    if (v20)
    {
      id v24 = objc_alloc(MEMORY[0x189603F48]);
      id v16 = v20;
      uint64_t v17 = (void *)objc_msgSend(v24, "initWithBytes:length:", objc_msgSend(v16, "bytes"), v19);
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]",  2610LL,  @"Failed to get TMac from sysconfig dictionary!",  v21,  v22,  v23,  v26);
      id v18 = v18;
      id v16 = 0LL;
      uint64_t v17 = 0LL;
      *uint64_t v6 = v18;
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]",  2585LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v26);
    id v15 = 0LL;
    id v16 = 0LL;
    uint64_t v17 = 0LL;
    id v10 = 0LL;
    id v18 = 0LL;
  }

  return v17;
}

+ (id)queryThreadRadioMacAddress64BitWithError:(id *)a3
{
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]",  2632LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v18);
    id v12 = 0LL;
    id v11 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  *a3 = 0LL;
  id v19 = 0LL;
  [a1 queryThreadRadioMacAddressForProvisioningWithError:&v19];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v19;
  if (!v7)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]",  2640LL,  @"Failed to get TMac from sysconfig dictionary!",  v8,  v9,  v10,  v18);
    id v13 = v11;
    id v11 = v13;
    goto LABEL_10;
  }

  if ([v7 length] != 6)
  {
    if ([v7 length] == 8)
    {
      id v12 = v7;
      uint64_t v7 = v12;
      goto LABEL_11;
    }

    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryThreadRadioMacAddress64BitWithError:]",  2668LL,  @"TMac in sysconfig dictionary is with invalid length.",  v14,  v15,  v16,  v18);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:60 underlyingError:0];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v12 = 0LL;
    *a3 = v13;
    goto LABEL_11;
  }

  HIWORD(v18) = -257;
  BYTE4(v18) = 0;
  WORD1(v18) = 0;
  id v12 = (id)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:8];
  [v7 getBytes:(char *)&v18 + 2 length:3];
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 0, 3, (char *)&v18 + 2);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 3, 2, (char *)&v18 + 6);
  objc_msgSend(v7, "getBytes:range:", (char *)&v18 + 2, 3, 3);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 5, 3, (char *)&v18 + 2);
LABEL_11:

  return v12;
}

+ (id)queryMogulIDSN:(id)a3 withError:(id *)a4
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v9 = v5;
  int v70 = 2;
  uint64_t v68 = 0LL;
  CFMutableDictionaryRef v69 = 0LL;
  CFTypeRef cf = 0LL;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3044LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  (uint64_t)outputStruct);
    id v11 = 0LL;
    id v12 = 0LL;
    goto LABEL_21;
  }

  if (!v5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3049LL,  @"key pointer is nil",  v6,  v7,  v8,  (uint64_t)outputStruct);
    id v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = 45LL;
LABEL_16:
    [v13 errorWithZhuGeErrorCode:v14 underlyingError:0];
    id v11 = 0LL;
    id v12 = 0LL;
    id v28 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }

  if ([v5 isEqualToString:@"mogulAce3"])
  {
    int v10 = 0;
    goto LABEL_9;
  }

  if (([v9 isEqualToString:@"mogulTopModule"] & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3061LL,  @"Unknown Mogul Type",  v15,  v16,  v17,  (uint64_t)outputStruct);
    id v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = 38LL;
    goto LABEL_16;
  }

  int v10 = 1;
LABEL_9:
  int v70 = v10;
  if (!readPropertyFromMogulService(v10, "AppleAuthCPAID", @"IDSN", &cf))
  {
    if (readPropertyFromMogulService(v10, "AppleAuthCP", @"IDSN", &cf))
    {
      uint64_t v21 = @"Successfully read IDSN from AppleAuthCP I2C service.";
      uint64_t v22 = 2933LL;
      goto LABEL_13;
    }

    uint64_t v68 = isMogulService;
    CFMutableDictionaryRef v69 = &v70;
    mach_port_t IOConnection = getIOConnection(MEMORY[0x189608580], @"IOPortTransportAIDBus", &v68, 1LL, a4);
    if (!IOConnection)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3078LL,  @"Failed to get a connection for AID Bus!",  v31,  v32,  v33,  (uint64_t)outputStruct);
      id v11 = 0LL;
      goto LABEL_14;
    }

    io_connect_t v34 = IOConnection;
    __int16 v75 = 0;
    size_t v74 = 2LL;
    *(_DWORD *)&v73[3] = 0;
    *(_DWORD *)id v73 = 0;
    size_t v72 = 7LL;
    uint64_t input = 5000LL;
    uint64_t v77 = 0x60100000102E2LL;
    char v78 = 6;
    char inputStruct = -102;
    mach_error_t v35 = IOConnectCallMethod(IOConnection, 4u, &input, 1u, &inputStruct, 1uLL, 0LL, 0LL, &v75, &v74);
    if (v35)
    {
      uint64_t v39 = mach_error_string(v35);
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  2978LL,  @"Mogul is not ready via AID, result: %s",  v40,  v41,  v42,  (uint64_t)v39);
LABEL_31:
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3083LL,  @"Failed to read IDSN via AID",  v43,  v44,  v45,  (uint64_t)outputStructa);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:4 underlyingError:0];
      id v28 = 0LL;
      id v12 = 0LL;
      id v11 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
      IOServiceClose(v34);
      goto LABEL_17;
    }

    if (v75 == 155)
    {
      mach_error_t v46 = IOConnectCallMethod(v34, 4u, &input, 1u, &v77, 9uLL, 0LL, 0LL, v73, &v72);
      if (v46)
      {
        uint64_t v47 = mach_error_string(v46);
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  2989LL,  @"failed to read IDSN data via AID, result: %s",  v48,  v49,  v50,  (uint64_t)v47);
        goto LABEL_31;
      }

      if (v73[0] == 227)
      {
        mach_error_t v53 = IOConnectCallMethod(v34, 4u, &input, 1u, &inputStruct, 1uLL, 0LL, 0LL, &v75, &v74);
        if (v53)
        {
          uint64_t v57 = mach_error_string(v53);
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  2999LL,  @"cannot get error code, result: %s",  v58,  v59,  v60,  (uint64_t)v57);
          goto LABEL_31;
        }

        if (v75 != 155)
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  3003LL,  @"failed to get errorcode response: %x",  v54,  v55,  v56,  v75);
          goto LABEL_31;
        }

        if (HIBYTE(v75))
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  3007LL,  @"read IDSN failed, errorcode: %x",  v54,  v55,  v56,  HIBYTE(v75));
          goto LABEL_31;
        }

        uint64_t v61 = calloc(1uLL, 6uLL);
        if (v61)
        {
          id v28 = v61;
          int v62 = *(_DWORD *)&v73[1];
          *((_WORD *)v61 + 2) = *(_WORD *)&v73[5];
          *uint64_t v61 = v62;
          ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  3018LL,  @"success read idsnData, first byte: %x",  v36,  v37,  v38,  v62);
          [MEMORY[0x189603F48] dataWithBytes:v28 length:6];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString hexStringFromData:v12];
          mach_port_t v63 = (void *)objc_claimAutoreleasedReturnValue();
          [v63 uppercaseString];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }

        io_object_t v51 = @"cannot allocate space for idsn data";
        uint64_t v52 = 3013LL;
      }

      else
      {
        io_object_t v51 = @"failed to get read memory response";
        uint64_t v52 = 2993LL;
      }
    }

    else
    {
      io_object_t v51 = @"failed to get errorcode response: %x";
      uint64_t outputStructb = v75;
      uint64_t v52 = 2982LL;
    }

    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "AIDReadIDSN",  v52,  v51,  v36,  v37,  v38,  outputStructb);
    goto LABEL_31;
  }

  uint64_t v21 = @"Successfully read IDSN from AppleAuthCP AID service.";
  uint64_t v22 = 2929LL;
LABEL_13:
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "readIDSNAuthCP",  v22,  v21,  v18,  v19,  v20,  (uint64_t)outputStruct);
  CFTypeRef v23 = cf;
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulIDSN:withError:]",  3068LL,  @"Get IDSN from AuthCP: %@",  v24,  v25,  v26,  (uint64_t)cf);
  [NSString hexStringFromData:v23];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 uppercaseString];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  id v12 = 0LL;
  id v28 = 0LL;
LABEL_17:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v28) {
    free(v28);
  }
LABEL_21:

  return v11;
}

+ (id)queryTouchScreenCert:(id *)a3
{
  v31[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    *a3 = 0LL;
    if ([&unk_18A357EF8 count])
    {
      uint64_t v9 = 0LL;
      id v10 = 0LL;
      id v11 = 0LL;
      while (1)
      {
        id v12 = v11;
        uint64_t v30 = @"basic";
        id v13 = v10;
        v29[0] = @"IODeviceTree";
        v28[0] = @"servicePlane";
        v28[1] = @"serviceClass";
        [&unk_18A357EF8 objectAtIndexedSubscript:v9];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v14;
        void v29[2] = @"IOService";
        v28[2] = @"parentPlane";
        v28[3] = @"parentClass";
        [&unk_18A357F10 objectAtIndexedSubscript:v9];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28[4] = @"direction";
        v29[3] = v15;
        v29[4] = @"child";
        [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:5];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v16;
        [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        id v27 = v13;
        [a1 queryIOProperty:@"AccessoryCertificate" fromCriteria:v11 withError:&v27];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = v27;

        [&unk_18A357F10 objectAtIndexedSubscript:v9];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [&unk_18A357EF8 objectAtIndexedSubscript:v9];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]",  3131LL,  @"querying %@/%@ returned %s and %@",  v20,  v21,  v22,  (uint64_t)v18);

        if (v17) {
          break;
        }
      }
    }

    else
    {
      id v11 = 0LL;
      id v10 = 0LL;
LABEL_9:
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]",  3138LL,  @"Failed to get touch screen cert from ioreg",  v6,  v7,  v8,  v24);
      id v10 = v10;
      uint64_t v17 = 0LL;
      *a3 = v10;
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryTouchScreenCert:]",  3112LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v24);
    id v11 = 0LL;
    uint64_t v17 = 0LL;
    id v10 = 0LL;
  }

  return v17;
}

+ (id)queryMogulTouchScreenCertDecoded:(BOOL)a3 withError:(id *)a4
{
  CFDataRef theData = 0LL;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]",  3247LL,  @"error p-pointer is nil!",  v4,  v5,  v6,  (uint64_t)v30);
    CFDataRef v13 = 0LL;
    return v13;
  }

  BOOL v8 = a3;
  *a4 = 0LL;
  if ((readPropertyFromMogulService(1, "AppleAuthCPAID", @"AccessoryCertificate", &theData) & 1) != 0)
  {
    uint64_t v12 = 2941LL;
  }

  else
  {
    if ((readPropertyFromMogulService(1, "AppleAuthCP", @"AccessoryCertificate", &theData) & 1) == 0)
    {
      CFDataRef v13 = theData;
      goto LABEL_15;
    }

    uint64_t v12 = 2945LL;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "readAccessoryCertificateAuthCP",  v12,  @"Successfully read AccessoryCertificate from AppleAuthCP AID service.",  v9,  v10,  v11,  (uint64_t)v30);
  CFDataRef v13 = theData;
  if (!theData)
  {
LABEL_15:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]",  3254LL,  @"Failed to read AccessoryCertificate of mogul based top module",  v9,  v10,  v11,  (uint64_t)v30);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:21 underlyingError:0];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    *a4 = v21;
    return v13;
  }

  if (v8)
  {
    BytePtr = CFDataGetBytePtr(theData);
    v37[0] = (unint64_t)BytePtr;
    CFIndex Length = CFDataGetLength(v13);
    v37[1] = Length;
    if (BytePtr && Length)
    {
      if (DERDecodeSeqContentInit(v37, v36) || DERDecodeSeqNext(v36, &v32))
      {
        uint64_t v19 = @"fail to strip root sequence";
        uint64_t v20 = 3171LL;
      }

      else
      {
        if (!DERDecodeSeqContentInit((unint64_t *)&v33, v36))
        {
          if (!DERDecodeSeqNext(v36, &v32))
          {
            uint64_t v26 = 0LL;
            id v27 = (const __CFAllocator *)*MEMORY[0x189604DB0];
            while (v32 != 0xA000000000000000LL)
            {
LABEL_38:
            }

            if (DERDecodeSeqContentInit((unint64_t *)&v33, v35)
              || DERDecodeSeqNext(v35, &v32))
            {
              id v28 = @"fail to decode content";
              uint64_t v29 = 3191LL;
            }

            else
            {
              if (!DERDecodeSeqContentInit((unint64_t *)&v33, v35))
              {
                do
                {
                  if (DERDecodeSeqNext(v35, &v32))
                  {
                    if (v26) {
                      goto LABEL_38;
                    }
                    uint64_t v19 = @"did not find plain cert";
                    uint64_t v20 = 3228LL;
                    goto LABEL_17;
                  }
                }

                while (v32 != 0xA000000000000000LL);
                if (!v33 || !v34 || v34 >= 0x7D1)
                {
                  id v28 = @"invalid decoded plain cert: [%p:%zu]";
                  uint64_t v30 = v33;
                  uint64_t v29 = 3216LL;
                  goto LABEL_43;
                }

                uint64_t v26 = CFDataCreate(v27, v33, v34);
                if (v26) {
                  goto LABEL_38;
                }
                uint64_t v19 = @"fail to create plain cert";
                uint64_t v20 = 3221LL;
                goto LABEL_17;
              }

              id v28 = @"fail to decode SignedData";
              uint64_t v29 = 3207LL;
            }

+ (id)querySPUProperty:(id)a3 withError:(id *)a4
{
  input[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  input[0] = 0LL;
  bzero(v36, 0x2000uLL);
  size_t v35 = 0x2000LL;
  if (!a4)
  {
    uint64_t v10 = @"error p-pointer is nil!";
    uint64_t v11 = 3413LL;
LABEL_13:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]",  v11,  v10,  v6,  v7,  v8,  (uint64_t)outputStruct);
    id v27 = 0LL;
    goto LABEL_20;
  }

  *a4 = 0LL;
  if (!v5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]",  3419LL,  @"property pointer is nil!",  v6,  v7,  v8,  (uint64_t)outputStruct);
    uint64_t v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = 45LL;
LABEL_15:
    [v12 errorWithZhuGeErrorCode:v13 underlyingError:0];
    id v27 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }

  if ([v5 isEqualToString:@"SNRaw"])
  {
    uint64_t v9 = 228LL;
    goto LABEL_9;
  }

  if (([v5 isEqualToString:@"PFSN"] & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]",  3429LL,  @"Unsupported SPU property %@!",  v14,  v15,  v16,  (uint64_t)v5);
    uint64_t v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = 75LL;
    goto LABEL_15;
  }

  uint64_t v9 = 218LL;
LABEL_9:
  input[0] = v9;
  mach_port_t IOConnection = getIOConnection(MEMORY[0x189608590], @"pressure", 0LL, 0LL, a4);
  if (!IOConnection)
  {
    uint64_t v10 = @"Failed to get a connection for pressure!";
    uint64_t v11 = 3437LL;
    goto LABEL_13;
  }

  io_connect_t v18 = IOConnection;
  uint64_t v19 = IOConnectCallMethod(IOConnection, 2u, input, 1u, 0LL, 0LL, 0LL, 0LL, v36, &v35);
  if ((_DWORD)v19)
  {
    mach_error_t v20 = v19;
    [MEMORY[0x189607968] numberWithInt:v19];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:mach_error_string(v20)];
    unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]",  3445LL,  @"Failed to get value of property %@ due to %@(%@)!",  v22,  v23,  v24,  (uint64_t)v5);

    uint64_t v25 = (void *)MEMORY[0x189607870];
    [NSString stringWithUTF8String:mach_error_string(v20)];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 errorWithZhuGeErrorCode:21 underlyingError:v26];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v27 = 0LL;
  }

  else if (v35 <= 0x2000)
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v36);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedLong:v35];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory querySPUProperty:withError:]",  3451LL,  @"Output is too long (%@ > %@) for SPU property %@!",  v29,  v30,  v31,  (uint64_t)v28);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:37 underlyingError:0];
    id v27 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  IOServiceClose(v18);
LABEL_20:

  return v27;
}

+ (id)queryFactoryShippingSettingTimeWithError:(id *)a3
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  uint64_t v72 = 0LL;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  memset(v61, 0, sizeof(v61));
  CFTypeRef cf = 0LL;
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3484LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v49);
    mach_error_t v20 = 0LL;
    id v10 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_21;
  }

  *a3 = 0LL;
  v59[0] = @"CopyAllowUnsealed";
  v59[1] = @"StripImg4";
  v60[0] = MEMORY[0x189604A88];
  v60[1] = MEMORY[0x189604A80];
  v59[2] = @"VerifyData";
  v60[2] = MEMORY[0x189604A80];
  [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v50 = 0LL;
  getFDRDataByFDRClassWithError(@"pcrt", v8, &v50);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v50;
  if (!v9)
  {
    [a1 key];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3496LL,  @"Failed to get pinecrest cert from libFDR for key %@!",  v22,  v23,  v24,  (uint64_t)v21);

    id v25 = v10;
LABEL_18:
    mach_error_t v20 = 0LL;
    *a3 = v25;
    goto LABEL_19;
  }

  id v11 = v9;
  double v13 = Img4DecodeInit([v11 bytes], objc_msgSend(v11, "length"), (uint64_t)v61);
  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3504LL,  @"Img4DecodeInit failed to decode fdrData with der state %@!",  v15,  v16,  v17,  (uint64_t)v14);

    io_connect_t v18 = (void *)MEMORY[0x189607870];
    uint64_t v19 = 77LL;
LABEL_17:
    [v18 errorWithZhuGeErrorCode:v19 underlyingError:0];
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }

  v55[0] = *((void *)&v62 + 1);
  v55[1] = v63;
  uint64_t v26 = DERParseSequence( (uint64_t)v55,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  (unint64_t)v58,  0x30uLL);
  if ((_DWORD)v26)
  {
    [MEMORY[0x189607968] numberWithInt:v26];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3512LL,  @"DERParseSequence failed to decode cert chain with der state %@!",  v28,  v29,  v30,  (uint64_t)v27);
LABEL_16:

    io_connect_t v18 = (void *)MEMORY[0x189607870];
    uint64_t v19 = 12LL;
    goto LABEL_17;
  }

  uint64_t v31 = DERParseSequence( (uint64_t)v58,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  (unint64_t)v56,  0xA0uLL);
  if ((_DWORD)v31)
  {
    [MEMORY[0x189607968] numberWithInt:v31];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3518LL,  @"DERParseSequence failed to decode into TBS Cert with der state %@!",  v32,  v33,  v34,  (uint64_t)v27);
    goto LABEL_16;
  }

  size_t v35 = DERParseSequenceContent( v57,  (unsigned __int16)DERNumValidityItemSpecs,  (uint64_t)&DERValidityItemSpecs,  (unint64_t)v53,  0x20uLL);
  if ((_DWORD)v35 || !v54)
  {
    [MEMORY[0x189607968] numberWithInt:v35];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3524LL,  @"DERParseSequenceContent failed to decode into validity with der state %@!",  v40,  v41,  v42,  (uint64_t)v27);
    goto LABEL_16;
  }

  uint64_t v36 = DERDecodeItem((uint64_t)v53, &v52);
  if ((_DWORD)v36)
  {
    [MEMORY[0x189607968] numberWithInt:v36];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3530LL,  @"DERDecodeItem failed to decode validity notBefore time with der state %@!",  v37,  v38,  v39,  (uint64_t)v27);
    goto LABEL_16;
  }

  SecAbsoluteTimeFromDateContentWithError();
  if (cf)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[AppleDeviceQueryKeysActionArmory queryFactoryShippingSettingTimeWithError:]",  3536LL,  @"SecAbsoluteTimeFromDateContentWithError failed, error = %@",  v45,  v46,  v47,  (uint64_t)cf);
    io_connect_t v18 = (void *)MEMORY[0x189607870];
    uint64_t v19 = 79LL;
    goto LABEL_17;
  }

  CFDateCreate(0LL, v48);
  mach_error_t v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

@end