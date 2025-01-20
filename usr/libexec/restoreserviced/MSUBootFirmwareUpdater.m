@interface MSUBootFirmwareUpdater
+ (BOOL)isSingleStageBoot;
+ (BOOL)requiresSEPInFW;
+ (BOOL)supportsAFUH;
+ (BOOL)supportsDualSPINAND;
+ (BOOL)supportsDualiBoot;
+ (BOOL)supportsPCIeNANDBoot;
+ (id)IOMatchingPropertyTable;
+ (id)_updaterClasses;
+ (id)updater;
+ (id)updaterForDevice;
+ (id)updaterWithIOService:(unsigned int)a3;
+ (id)updaterWithTimeout:(double)a3;
- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4;
- (BOOL)isErase;
- (BOOL)shouldCommit;
- (BOOL)supportsSlotIDs;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (MSUBootFirmwareUpdater)init;
- (MSUBootFirmwareUpdater)initWithIOService:(unsigned int)a3;
- (MSUBootFirmwareUpdater)initWithIOServiceMatching:(id)a3;
- (NSArray)bootBlockImages;
- (NSArray)firmwareImages;
- (NSData)ans2Data;
- (NSData)apNonce;
- (NSData)daliData;
- (NSData)ibootData;
- (NSData)llbData;
- (NSData)logoData;
- (id)_encodeFirmware:(id)a3 withRestoreInfo:(id)a4;
- (id)_restoreInfoDictionary;
- (id)copyFirmwareWithRestoreInfo:(id)a3;
- (int)_encodeAndWriteFirmware:(id)a3 toWriter:(id)a4 withError:(id *)a5;
- (unsigned)apNonceSlotID;
- (unsigned)matchedService;
- (void)dealloc;
- (void)setAns2Data:(id)a3;
- (void)setApNonce:(id)a3;
- (void)setApNonceSlotID:(unsigned int)a3;
- (void)setBootBlockImages:(id)a3;
- (void)setDaliData:(id)a3;
- (void)setFirmwareImages:(id)a3;
- (void)setIbootData:(id)a3;
- (void)setIsErase:(BOOL)a3;
- (void)setLlbData:(id)a3;
- (void)setLogoData:(id)a3;
- (void)setShouldCommit:(BOOL)a3;
@end

@implementation MSUBootFirmwareUpdater

+ (id)_updaterClasses
{
  if ((id)objc_opt_class(&OBJC_CLASS___MSUBootFirmwareUpdater) == a1)
  {
    v7[0] = objc_opt_class(&OBJC_CLASS___SPIiBootUpdater);
    v7[1] = objc_opt_class(&OBJC_CLASS___PCIeNANDiBootUpdater);
    v7[2] = objc_opt_class(&OBJC_CLASS___ASPStorageiBootUpdater);
    v7[3] = objc_opt_class(&OBJC_CLASS___NVMEiBootUpdater);
    v7[4] = objc_opt_class(&OBJC_CLASS___IMG3NorUpdater);
    v3 = (id *)v7;
    uint64_t v4 = 5LL;
  }

  else
  {
    id v6 = a1;
    v3 = &v6;
    uint64_t v4 = 1LL;
  }

  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, v4);
}

+ (id)updater
{
  if ((id)objc_opt_class(&OBJC_CLASS___MSUBootFirmwareUpdater) != a1) {
    return objc_alloc_init((Class)a1);
  }
  if ([a1 supportsPCIeNANDBoot])
  {
    uint64_t v4 = &OBJC_CLASS___PCIeNANDiBootUpdater;
    return -[__objc2_class updater](v4, "updater");
  }

  if ([a1 supportsDualiBoot])
  {
    uint64_t v4 = &OBJC_CLASS___SPIiBootUpdater;
    return -[__objc2_class updater](v4, "updater");
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = objc_msgSend(a1, "_updaterClasses", 0);
  id result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_10:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v5);
      }
      id result = [*(id *)(*((void *)&v9 + 1) + 8 * v8) updater];
      if (result) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        id v6 = result;
        if (result) {
          goto LABEL_10;
        }
        return result;
      }
    }
  }

  return result;
}

+ (id)updaterWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((id)objc_opt_class(&OBJC_CLASS___MSUBootFirmwareUpdater) != a1) {
    return [objc_alloc((Class)a1) initWithIOService:v3];
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = objc_msgSend(a1, "_updaterClasses", 0);
  id result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
LABEL_5:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v6);
      }
      id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) updaterWithIOService:v3];
      if (result) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id result = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v7 = result;
        if (result) {
          goto LABEL_5;
        }
        return result;
      }
    }
  }

  return result;
}

+ (id)updaterWithTimeout:(double)a3
{
  id v5 = +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo");
  -[NSProcessInfo systemUptime](v5, "systemUptime");
  double v7 = v6 + a3;
  NSStringFromClass((Class)a1);
  iBU_LOG_real( (uint64_t)@"Waiting %ld seconds for %@\n",  "+[MSUBootFirmwareUpdater updaterWithTimeout:]",  v8,  v9,  v10,  v11,  v12,  v13,  llround(a3));
  while (1)
  {
    id v14 = [a1 updater];
    v15 = v14;
    if (v14) {
      break;
    }
    -[NSProcessInfo systemUptime](v5, "systemUptime");
    uint64_t v17 = llround(v7 - v16);
    sleep(v17 > 0);
    if (v17 <= 0)
    {
      v24 = @"Found no matching service.";
      goto LABEL_6;
    }
  }

  v25 = (objc_class *)objc_opt_class(v14);
  v27 = NSStringFromClass(v25);
  v24 = @"Created an instance of %@ to update this device's firmware and boot images";
LABEL_6:
  iBU_LOG_real( (uint64_t)v24,  "+[MSUBootFirmwareUpdater updaterWithTimeout:]",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v27);
  return v15;
}

+ (id)updaterForDevice
{
  return [a1 updaterWithTimeout:60.0];
}

+ (id)IOMatchingPropertyTable
{
  return 0LL;
}

- (MSUBootFirmwareUpdater)init
{
  id v3 = [(id)objc_opt_class(self) IOMatchingPropertyTable];
  return -[MSUBootFirmwareUpdater initWithIOServiceMatching:](self, "initWithIOServiceMatching:", v3);
}

- (MSUBootFirmwareUpdater)initWithIOService:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSUBootFirmwareUpdater;
  uint64_t v4 = -[MSUBootFirmwareUpdater init](&v11, "init");
  id v5 = v4;
  if (v4)
  {
    BOOLean_t matches = 0;
    double v6 = (const __CFDictionary *)[(id)objc_opt_class(v4) IOMatchingPropertyTable];
    if (a3
      && (double v7 = v6, -[__CFDictionary count](v6, "count"))
      && (!IOServiceMatchPropertyTable(a3, v7, &matches) ? (BOOL v8 = matches == 0) : (BOOL v8 = 1), !v8))
    {
      IOServiceWaitQuiet(a3, 0LL);
      IOObjectRetain(a3);
      v5->_matchedService = a3;
    }

    else
    {

      return 0LL;
    }
  }

  return v5;
}

- (MSUBootFirmwareUpdater)initWithIOServiceMatching:(id)a3
{
  if ([a3 count])
  {
    if (a3) {
      id v5 = (const __CFDictionary *)CFRetain(a3);
    }
    else {
      id v5 = 0LL;
    }
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  }

  else
  {
    uint64_t MatchingService = 0LL;
  }

  double v7 = -[MSUBootFirmwareUpdater initWithIOService:](self, "initWithIOService:", MatchingService);
  if ((_DWORD)MatchingService && IOObjectRelease(MatchingService)) {
    sub_1000167E0(&v9, v10);
  }
  return v7;
}

- (void)setApNonce:(id)a3
{
  uint64_t v4 = (NSData *)[a3 copy];

  self->_apNonce = v4;
  self->_apNonceSlotID = 0;
  self->_supportsSlotIDs = 0;
}

- (void)setApNonceSlotID:(unsigned int)a3
{
  self->_apNonce = 0LL;
  self->_apNonceSlotID = a3;
  self->_supportsSlotIDs = 1;
}

- (void)dealloc
{
  io_object_t matchedService = self->_matchedService;
  if (matchedService) {
    IOObjectRelease(matchedService);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSUBootFirmwareUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v4, "dealloc");
}

+ (BOOL)supportsAFUH
{
  return sub_1000062B4("IODeviceTree:/product", @"atomic-firmware-update-support");
}

+ (BOOL)supportsPCIeNANDBoot
{
  return sub_1000062B4("IODeviceTree:/defaults", @"pcie-nand-boot-supported");
}

+ (BOOL)supportsDualiBoot
{
  int v3 = sub_1000062B4("IODeviceTree:/product", @"dual-iboot-support");
  if (v3) {
    LOBYTE(v3) = [a1 supportsPCIeNANDBoot] ^ 1;
  }
  return v3;
}

+ (BOOL)supportsDualSPINAND
{
  return sub_1000063FC(@"dual-spi-nand");
}

+ (BOOL)requiresSEPInFW
{
  return sub_1000063FC(@"sep-is-firmware-payload");
}

+ (BOOL)isSingleStageBoot
{
  return sub_1000062B4("IODeviceTree:/product", @"single-stage-boot");
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  return 0;
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  return -[MSUBootFirmwareUpdater updateBootFirmwareWithError:](self, "updateBootFirmwareWithError:", a5, a4);
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  double v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  id v80 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
  v91[0] = @"iBoot";
  v91[1] = @"ANS";
  v91[2] = @"iBootData";
  v91[3] = @"DCP";
  v91[4] = @"AppleLogo";
  obj = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 5LL);
  uint64_t v86 = 0LL;
  v87 = &v86;
  uint64_t v88 = 0x2020000000LL;
  char v89 = 1;
  uint64_t v9 = (void *)((uint64_t (*)(firmware_update_context *))a3->var2)(a4);
  [v7 addObject:v9];
  uint64_t v10 = (void *)((uint64_t (*)(firmware_update_context *))a3->var3)(a4);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    id v12 = [v10 mutableCopy];
    if ([(id)objc_opt_class(self) isSingleStageBoot])
    {
      iBU_LOG_real( (uint64_t)@"iBoot data provided in firmware images yet this is single-stage-boot device - removing from firmware images being updated.",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v13,  v14,  v15,  v16,  v17,  v18,  v73);
      [v12 removeObjectForKey:@"iBoot"];
      id v19 = 0LL;
    }

    else
    {
      id v19 = [v12 objectForKey:@"iBoot"];
    }

    id v78 = [v12 objectForKey:@"Dali"];
    iBU_LOG_real( (uint64_t)@"Ordered firmware image names: %@.",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)obj);
    v77 = a3;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v36 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v90,  16LL);
    id v74 = v19;
    v75 = a4;
    v76 = v10;
    id v28 = 0LL;
    id v29 = 0LL;
    if (v36)
    {
      uint64_t v37 = *(void *)v83;
      do
      {
        for (i = 0LL; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v83 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
          if ([v12 objectForKeyedSubscript:v39])
          {
            if ([v39 isEqualToString:@"ANS"])
            {
              iBU_LOG_real( (uint64_t)@"Pulling ANS out of the list of firmwares.",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v40,  v41,  v42,  v43,  v44,  v45,  v73);
              id v28 = [v12 objectForKeyedSubscript:v39];
            }

            if ([v39 isEqualToString:@"AppleLogo"])
            {
              iBU_LOG_real( (uint64_t)@"Pulling Logo out of the list of firmwares.",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v46,  v47,  v48,  v49,  v50,  v51,  v73);
              id v29 = [v12 objectForKeyedSubscript:v39];
            }

            objc_msgSend(v80, "addObject:", objc_msgSend(v12, "objectForKeyedSubscript:", v39));
            [v12 removeObjectForKey:v39];
          }
        }

        id v36 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v90,  16LL);
      }

      while (v36);
    }

    uint64_t v10 = v76;
    id v27 = v74;
    a4 = v75;
    a3 = v77;
    objc_msgSend(v80, "addObjectsFromArray:", objc_msgSend(v12, "allValues"));
  }

  else
  {
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v10, v20) & 1) == 0)
    {
      iBU_LOG_real( (uint64_t)@"request for images data returned non-Array and non-Dictionary. Type returned was: %@",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v10);
LABEL_29:
      BOOL v71 = 0;
      goto LABEL_30;
    }

    [v80 addObjectsFromArray:v10];
    id v78 = 0LL;
    id v27 = 0LL;
    id v28 = 0LL;
    id v29 = 0LL;
  }

  if ([(id)objc_opt_class(self) requiresSEPInFW])
  {
    v52 = (void *)((uint64_t (*)(firmware_update_context *))a3->var6)(a4);
    iBU_LOG_real( (uint64_t)@"Appending SEP to firmwareImages",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v53,  v54,  v55,  v56,  v57,  v58,  v73);
    if (!v52)
    {
      iBU_LOG_real( (uint64_t)@"NULL returned from copy_sep()!",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v59,  v60,  v61,  v62,  v63,  v64,  v73);
      goto LABEL_29;
    }

    [v80 addObject:v52];
  }

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3254779904LL;
  v81[2] = sub_1000069DC;
  v81[3] = &unk_1000249C0;
  v81[4] = &v86;
  [v80 enumerateObjectsUsingBlock:v81];
  if (!*((_BYTE *)v87 + 24))
  {
    iBU_LOG_real( (uint64_t)@"Firmware images array contains non-CFDataRef/non-NSArray.",  "-[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]",  v65,  v66,  v67,  v68,  v69,  v70,  v73);
    goto LABEL_29;
  }

  ((void (*)(void, void, firmware_update_context *))a3->var1)(0LL, 0LL, a4);
  -[MSUBootFirmwareUpdater setBootBlockImages:](self, "setBootBlockImages:", v7);
  -[MSUBootFirmwareUpdater setFirmwareImages:](self, "setFirmwareImages:", v80);
  -[MSUBootFirmwareUpdater setDaliData:](self, "setDaliData:", v78);
  -[MSUBootFirmwareUpdater setIbootData:](self, "setIbootData:", v27);
  -[MSUBootFirmwareUpdater setLlbData:](self, "setLlbData:", v9);
  -[MSUBootFirmwareUpdater setAns2Data:](self, "setAns2Data:", v28);
  -[MSUBootFirmwareUpdater setLogoData:](self, "setLogoData:", v29);
  BOOL v71 = 1;
LABEL_30:

  _Block_object_dispose(&v86, 8);
  return v71;
}

- (id)copyFirmwareWithRestoreInfo:(id)a3
{
  return -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]( self,  "_encodeFirmware:withRestoreInfo:",  a3,  -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary"));
}

- (id)_restoreInfoDictionary
{
  if (-[MSUBootFirmwareUpdater supportsSlotIDs](self, "supportsSlotIDs"))
  {
    uint64_t v10 = @"anid";
    uint64_t v11 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[MSUBootFirmwareUpdater apNonceSlotID](self, "apNonceSlotID"));
    int v3 = &v11;
    objc_super v4 = &v10;
  }

  else
  {
    id v5 = -[MSUBootFirmwareUpdater apNonce](self, "apNonce");
    if (!v5)
    {
      CFTypeRef v6 = sub_100006B7C("IODeviceTree:/chosen", @"boot-nonce");
      id v5 = (id)CFMakeCollectable(v6);
      if (!v5) {
        return (id)__NSDictionary0__;
      }
    }

    uint64_t v8 = @"BNCN";
    uint64_t v9 = v5;
    int v3 = (NSNumber **)&v9;
    objc_super v4 = &v8;
  }

  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v4,  1LL);
}

- (int)_encodeAndWriteFirmware:(id)a3 toWriter:(id)a4 withError:(id *)a5
{
  id v9 = -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary");
  if (!a3)
  {
    if (!a5) {
      return -536870212;
    }
    id v19 = @"_encodeAndWriteFirmware called with NULL data?";
LABEL_9:
    uint64_t v20 = 7LL;
LABEL_12:
    *a5 = MSUBootFirmwareError(v20, 0LL, (uint64_t)v19, v10, v11, v12, v13, v14, v21);
    return -536870212;
  }

  uint64_t v10 = (uint64_t)v9;
  if (!v9)
  {
    if (!a5) {
      return -536870212;
    }
    id v19 = @"_encodeAndWriteFirmware retrieved a null restoreInfo dictionary?";
    goto LABEL_9;
  }

  id v15 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", a3, v9);
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = [a4 writeData:v15 withError:a5];

    return v17;
  }

  if (a5)
  {
    id v19 = @"_encodeAndWriteFirmware failed to encode Img4 data.";
    uint64_t v20 = 9LL;
    goto LABEL_12;
  }

  return -536870212;
}

- (id)_encodeFirmware:(id)a3 withRestoreInfo:(id)a4
{
  id v21 = 0LL;
  id result = [a3 length];
  if (result)
  {
    uint64_t v7 = AMAuthInstallApImg4EncodeRestoreInfo(a3, a4, &v21);
    if ((_DWORD)v7)
    {
      iBU_LOG_real( (uint64_t)@"AMAuthInstallApImg4EncodeRestoreInfo returned %d during Img4 encoding?",  "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
    }

    else
    {
      id v14 = [a3 length];
      [v21 length];
      iBU_LOG_real( (uint64_t)@"original data length: %lu. img4_restore_data length: %lu",  "-[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v14);
    }

    return v21;
  }

  return result;
}

- (unsigned)matchedService
{
  return self->_matchedService;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

- (NSArray)bootBlockImages
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBootBlockImages:(id)a3
{
}

- (NSArray)firmwareImages
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFirmwareImages:(id)a3
{
}

- (NSData)llbData
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLlbData:(id)a3
{
}

- (NSData)ans2Data
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAns2Data:(id)a3
{
}

- (NSData)daliData
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDaliData:(id)a3
{
}

- (NSData)ibootData
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setIbootData:(id)a3
{
}

- (NSData)logoData
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLogoData:(id)a3
{
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (unsigned)apNonceSlotID
{
  return self->_apNonceSlotID;
}

- (BOOL)supportsSlotIDs
{
  return self->_supportsSlotIDs;
}

@end