@interface ASPStorageiBootUpdater
+ (id)IOMatchingPropertyTable;
- (ASPStorageiBootUpdater)initWithIOService:(unsigned int)a3;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (DevNodeWriter)firmwareWriter;
- (DevNodeWriter)llbWriter;
- (void)dealloc;
@end

@implementation ASPStorageiBootUpdater

+ (id)IOMatchingPropertyTable
{
  v3 = @"IOProviderClass";
  v4 = @"ASPStorage";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
}

- (ASPStorageiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ASPStorageiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v8, "initWithIOService:");
  if (v4)
  {
    v4->_llbWriter = -[DevNodeWriter initWithServiceNamed:parent:]( objc_alloc(&OBJC_CLASS___DevNodeWriter),  "initWithServiceNamed:parent:",  @"EmbeddedDeviceTypeLLBFirmware",  v3);
    v5 = -[DevNodeWriter initWithServiceNamed:parent:]( objc_alloc(&OBJC_CLASS___DevNodeWriter),  "initWithServiceNamed:parent:",  @"EmbeddedDeviceTypeFirmware",  v3);
    v4->_firmwareWriter = v5;
    if (v4->_llbWriter) {
      BOOL v6 = v5 == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {

      return 0LL;
    }
  }

  return v4;
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  __int16 v157 = 0;
  int v156 = 1;
  uint64_t v155 = 0LL;
  if (!-[DevNodeWriter isAvailable](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "isAvailable"))
  {
    v37 = -[ASPStorageiBootUpdater llbWriter](self, "llbWriter");
    iBU_LOG_real( (uint64_t)@"LLB writer %@ was unavailable at write-time",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v37);
    if (a3)
    {
      v142 = -[ASPStorageiBootUpdater llbWriter](self, "llbWriter");
      v36 = @"LLB writer %@ was unavailable at write-time";
LABEL_18:
      uint64_t v51 = 6LL;
      uint64_t v35 = 0LL;
LABEL_22:
      v52 = MSUBootFirmwareError(v51, v35, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v142);
LABEL_23:
      v53 = v52;
      BOOL result = 0;
      *a3 = v53;
      return result;
    }

    return 0;
  }

  if (!-[DevNodeWriter isAvailable](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "isAvailable"))
  {
    v44 = -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter");
    iBU_LOG_real( (uint64_t)@"Firmware writer %@ was unavailable at write-time",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)v44);
    if (a3)
    {
      v142 = -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter");
      v36 = @"Firmware writer %@ was unavailable at write-time";
      goto LABEL_18;
    }

    return 0;
  }

  uint64_t v5 = -[NSArray count](-[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages"), "count");
  iBU_LOG_real( (uint64_t)@"Writing %lu firmware images to firmware dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v6,  v7,  v8,  v9,  v10,  v11,  v5);
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  v12 = -[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages");
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v151,  v159,  16LL);
  if (v13)
  {
    id v20 = v13;
    uint64_t v21 = *(void *)v152;
LABEL_5:
    uint64_t v22 = 0LL;
    while (1)
    {
      if (*(void *)v152 != v21) {
        objc_enumerationMutation(v12);
      }
      uint64_t v23 = *(void *)(*((void *)&v151 + 1) + 8 * v22);
      iBU_LOG_real( (uint64_t)@"Writing a firmware image to firmware dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v14,  v15,  v16,  v17,  v18,  v19,  v140);
      if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:]( self,  "_encodeAndWriteFirmware:toWriter:withError:",  v23,  -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"),  &v155))
      {
        break;
      }

      if (v20 == (id)++v22)
      {
        id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v151,  v159,  16LL);
        if (v20) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    iBU_LOG_real( (uint64_t)@"Failed to write FW data to firmwareWriter",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v14,  v15,  v16,  v17,  v18,  v19,  v140);
    if (!a3) {
      return 0;
    }
    uint64_t v35 = v155;
    v36 = @"Failed to write FW data to firmwareWriter";
    goto LABEL_21;
  }

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  return -[ASPStorageiBootUpdater updateBootFirmwareWithError:](self, "updateBootFirmwareWithError:", a5, a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASPStorageiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (DevNodeWriter)llbWriter
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 88LL, 1);
}

- (DevNodeWriter)firmwareWriter
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 96LL, 1);
}

@end