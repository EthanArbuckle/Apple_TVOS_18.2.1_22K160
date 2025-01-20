@interface NVMEiBootUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)_copyIBICFromPath:(char *)a3 withOptions:(__CFDictionary *)a4 intoArray:(const __CFArray *)a5 withError:(__CFError *)a6;
- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (DevNodeWriter)writer;
- (NVMEiBootUpdater)initWithIOService:(unsigned int)a3;
- (void)dealloc;
@end

@implementation NVMEiBootUpdater

+ (id)IOMatchingPropertyTable
{
  v3 = @"IOProviderClass";
  v4 = @"AppleEmbeddedNVMeController";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
}

- (NVMEiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NVMEiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = -[DevNodeWriter initWithServiceNamed:parent:]( objc_alloc(&OBJC_CLASS___DevNodeWriter),  "initWithServiceNamed:parent:",  @"EmbeddedDeviceTypeFirmware",  v3);
    v4->_writer = v5;
    if (!v5)
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NVMEiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NVMEiBootUpdater;
  return -[MSUBootFirmwareUpdater generateFirmwareImagesWithCallback:context:]( &v5,  "generateFirmwareImagesWithCallback:context:",  a3,  a4);
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  v8 = -[MSUBootFirmwareUpdater llbData](self, "llbData", a3);
  id v115 = (id)__NSArray0__;
  __int16 v114 = 0;
  uint64_t v113 = 0LL;
  if (ramrod_hardware_partition_supports_bics()
    && !-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]( self,  "_copyIBICFromPath:withOptions:intoArray:withError:",  -[NSString UTF8String]( -[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath"),  "UTF8String"),  a4->var1,  &v115,  &v113))
  {
    iBU_LOG_real( (uint64_t)@"Copy iBIC failed.",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v9,  v10,  v11,  v12,  v13,  v14,  v101);
    if (!a5) {
      return 0;
    }
    v42 = MSUBootFirmwareError(1LL, v113, (uint64_t)@"Copy iBIC failed.", v43, v44, v45, v46, v47, v104);
    goto LABEL_10;
  }

  unsigned __int8 v15 = -[DevNodeWriter isAvailable](-[NVMEiBootUpdater writer](self, "writer"), "isAvailable");
  v16 = -[NVMEiBootUpdater writer](self, "writer");
  if ((v15 & 1) == 0)
  {
    iBU_LOG_real( (uint64_t)@"Writer %@ was unavailable at write-time",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v16);
    if (!a5) {
      return 0;
    }
    v103 = -[NVMEiBootUpdater writer](self, "writer");
    v42 = MSUBootFirmwareError( 6LL,  0LL,  (uint64_t)@"Writer %@ was unavailable at write-time",  v37,  v38,  v39,  v40,  v41,  (uint64_t)v103);
LABEL_10:
    v48 = v42;
    BOOL result = 0;
    *a5 = v48;
    return result;
  }

  v23 = -[DevNodeWriter devicePath](v16, "devicePath");
  iBU_LOG_real( (uint64_t)@"Writing lldb data to dev node %@",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)v23);
  if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:]( self,  "_encodeAndWriteFirmware:toWriter:withError:",  v8,  -[NVMEiBootUpdater writer](self, "writer"),  a5))
  {
    v36 = @"Failed to write lldb data to dev node.";
LABEL_31:
    iBU_LOG_real( (uint64_t)v36,  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v30,  v31,  v32,  v33,  v34,  v35,  v102);
    return 0;
  }

  uint64_t v50 = -[NSArray count](-[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages"), "count");
  -[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath");
  iBU_LOG_real( (uint64_t)@"Writing %lu firmware images to dev node %@",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v51,  v52,  v53,  v54,  v55,  v56,  v50);
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  v57 = -[MSUBootFirmwareUpdater firmwareImages](self, "firmwareImages");
  id v58 = -[NSArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v109,  v117,  16LL);
  if (v58)
  {
    id v65 = v58;
    uint64_t v66 = *(void *)v110;
    while (2)
    {
      for (i = 0LL; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v110 != v66) {
          objc_enumerationMutation(v57);
        }
        if (-[MSUBootFirmwareUpdater _encodeAndWriteFirmware:toWriter:withError:]( self,  "_encodeAndWriteFirmware:toWriter:withError:",  *(void *)(*((void *)&v109 + 1) + 8LL * (void)i),  -[NVMEiBootUpdater writer](self, "writer"),  a5))
        {
          v36 = @"Failed to write firmware data to dev node.";
          goto LABEL_31;
        }
      }

      id v65 = -[NSArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v109,  v117,  16LL);
      if (v65) {
        continue;
      }
      break;
    }
  }

  if (v115)
  {
    id v68 = [v115 count];
    -[DevNodeWriter devicePath](-[NVMEiBootUpdater writer](self, "writer"), "devicePath");
    iBU_LOG_real( (uint64_t)@"Writing %d iBIC firmware image segments to dev node %@",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)v68);
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    id v75 = v115;
    id v76 = [v115 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v106;
      while (2)
      {
        for (j = 0LL; j != v77; j = (char *)j + 1)
        {
          if (*(void *)v106 != v78) {
            objc_enumerationMutation(v75);
          }
          if (-[DevNodeWriter writeData:withError:]( -[NVMEiBootUpdater writer](self, "writer"),  "writeData:withError:",  *(void *)(*((void *)&v105 + 1) + 8LL * (void)j),  a5))
          {
            v36 = @"Failed to write ibic data to dev node.";
            goto LABEL_31;
          }
        }

        id v77 = [v75 countByEnumeratingWithState:&v105 objects:v116 count:16];
        if (v77) {
          continue;
        }
        break;
      }
    }
  }

  iBU_LOG_real( (uint64_t)@"Writing end_of_contents_bytes to dev node.",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v59,  v60,  v61,  v62,  v63,  v64,  v102);
  if (-[DevNodeWriter writeData:withError:]( -[NVMEiBootUpdater writer](self, "writer"),  "writeData:withError:",  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v114, 2LL),  a5))
  {
    v36 = @"Failed to write end_of_contents bytes.";
    goto LABEL_31;
  }

  uint64_t v80 = -[DevNodeWriter numberOfBytesRemainingInBlock]( -[NVMEiBootUpdater writer](self, "writer"),  "numberOfBytesRemainingInBlock");
  if (v80)
  {
    uint64_t v87 = v80;
    iBU_LOG_real( (uint64_t)@"There are %lu bytes remaining in the boot block. Padding with zeroes.",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v81,  v82,  v83,  v84,  v85,  v86,  v80);
    if (-[DevNodeWriter writeData:withError:]( -[NVMEiBootUpdater writer](self, "writer"),  "writeData:withError:",  +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v87),  a5))
    {
      v36 = @"Failed to pad zeroes to the end of the block.";
      goto LABEL_31;
    }
  }

  if (!-[DevNodeWriter finished](-[NVMEiBootUpdater writer](self, "writer"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up writer.",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v88,  v89,  v90,  v91,  v92,  v93,  v102);
  }
  uint64_t v94 = IORegistryEntrySetCFProperty( -[MSUBootFirmwareUpdater matchedService](self, "matchedService"),  @"fw-write-done",  kCFBooleanTrue);
  if (!(_DWORD)v94)
  {
    iBU_LOG_real( (uint64_t)@"Successfully updated iBoot firmware images",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v95,  v96,  v97,  v98,  v99,  v100,  v102);
    return 1;
  }

  iBU_LOG_real( (uint64_t)@"Failed to set 'fw-write-done' property on dev node. Kernel error: %d",  "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]",  v95,  v96,  v97,  v98,  v99,  v100,  v94);
  return 0;
}

- (BOOL)_copyIBICFromPath:(char *)a3 withOptions:(__CFDictionary *)a4 intoArray:(const __CFArray *)a5 withError:(__CFError *)a6
{
  off_t v59 = -1LL;
  CFDataRef theData = 0LL;
  off_t v58 = -1LL;
  if (!a6)
  {
    iBU_LOG_real( (uint64_t)@"error parameter is NULL",  "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]",  (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  0LL,  v6,  v7,  v55);
LABEL_33:
    BOOL v53 = 0;
    uint64_t v20 = 0LL;
    CFMutableArrayRef Mutable = 0LL;
LABEL_42:
    URLFromString = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_29;
  }

  if (!a5)
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  2LL,  0LL,  @"%s: outDataArray is NULL",  (uint64_t)a6,  v6,  v7,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_33;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  2LL,  0LL,  @"%s: path parameter is NULL",  (uint64_t)a6,  v6,  v7,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
    uint64_t v20 = 0LL;
    CFMutableArrayRef Mutable = 0LL;
LABEL_38:
    URLFromString = 0LL;
    goto LABEL_29;
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: segment_data_array failed to allocate",  v12,  v13,  v14,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
    uint64_t v20 = 0LL;
    goto LABEL_42;
  }

  v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v20 = v16;
  if (!v16)
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: segment_keys_array failed to allocate",  v17,  v18,  v19,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
LABEL_41:
    BOOL v53 = 0;
    goto LABEL_42;
  }

  CFArrayAppendValue(v16, @"ibic");
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, @"iBICRequired");
    uint64_t v22 = CFDictionaryGetValue(a4, @"iBICAdditionalTag");
    if (!v22) {
      goto LABEL_11;
    }
    v23 = v22;
    CFTypeID v24 = CFGetTypeID(v22);
    if (v24 == CFStringGetTypeID())
    {
      CFArrayAppendValue(v20, v23);
      goto LABEL_11;
    }

    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  2LL,  0LL,  @"%s: kAMRestoreOptionsiBICAdditionalTag is not a CFStringRef",  v25,  v26,  v27,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_41;
  }

  Value = 0LL;
LABEL_11:
  uint64_t v10 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v10)
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: _copy_ibic unable to create fw_path",  v28,  v29,  v30,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
    goto LABEL_38;
  }

  URLFromString = (const __CFURL *)AMSupportCreateURLFromString(kCFAllocatorDefault, v10);
  if (URLFromString)
  {
    uint64_t v56 = a5;
    v57 = v10;
    uint64_t v35 = Mutable;
    if (CFArrayGetCount(v20) < 1)
    {
LABEL_27:
      CFMutableArrayRef Mutable = v35;
      *uint64_t v56 = (const __CFArray *)CFRetain(v35);
      BOOL v53 = 1;
    }

    else
    {
      CFIndex v36 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v20, v36);
        CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
        uint64_t v45 = AMRestorePartitionFWCopyTagData(URLFromString, ValueAtIndex, 0LL, &v59, (CFTypeRef *)&theData, &v58);
        if (Value)
        {
          CFTypeID v46 = CFGetTypeID(Value);
          if (v46 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)Value) == 1 && (_DWORD)v45) {
            break;
          }
        }

        if ((_DWORD)v45 == 8)
        {
          iBU_LOG_real( (uint64_t)@"FW tag %s missing, but this is not fatal.\n",  "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]",  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)CStringPtr);
        }

        else if ((_DWORD)v45)
        {
          iBU_LOG_real( (uint64_t)@"Unexpected error %d scanning for FW tag %s - corrupt FW partition?\n",  "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]",  v39,  v40,  v41,  v42,  v43,  v44,  v45);
        }

        else
        {
          CFDataGetLength(theData);
          iBU_LOG_real( (uint64_t)@"Found FW tag %s of %lu length.\n",  "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]",  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)CStringPtr);
          CFArrayAppendValue(v35, theData);
        }

        if (theData)
        {
          CFRelease(theData);
          CFDataRef theData = 0LL;
        }

        if (CFArrayGetCount(v20) <= ++v36) {
          goto LABEL_27;
        }
      }

      ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  3LL,  0LL,  @"%s: AMRestorePartitionFWCopyTagData returned %d",  v42,  v43,  v44,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
      BOOL v53 = 0;
      CFMutableArrayRef Mutable = v35;
    }

    uint64_t v10 = v57;
  }

  else
  {
    ramrod_create_error_cf( a6,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: _copy_ibic unable to create url",  v31,  v32,  v33,  (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
  }

- (DevNodeWriter)writer
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 88LL, 1);
}

@end