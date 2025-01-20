uint64_t _ioSurfaceConnectInternal(char a1)
{
  void v2[4];
  char v3;
  uint64_t v4;
  v4 = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = ___ioSurfaceConnectInternal_block_invoke;
  v2[3] = &__block_descriptor_33_e5_v8__0l;
  v3 = a1;
  if (_ioSurfaceConnectInternal_once != -1) {
    dispatch_once(&_ioSurfaceConnectInternal_once, v2);
  }
  return _iosConnect;
}

void ___ioSurfaceConnectInternal_block_invoke(uint64_t a1)
{
  kern_return_t MatchingServices;
  io_service_t v5;
  kern_return_t v7;
  kern_return_t v8;
  void *v9;
  id v10;
  int v11;
  io_object_t v12;
  io_registry_entry_t v13;
  CFStringRef v14;
  void *v15;
  void *CFProperty;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  CFStringRef v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  io_iterator_t iterator;
  io_iterator_t existing;
  uint8_t buf[8];
  uint64_t v42;
  v42 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "IOSurface.framework API explicitly disallowed.",  buf,  2u);
    }
  }

  else
  {
    _creationPropertiesDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceClass",  @"IOSurfaceClass");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceIsGlobal",  @"IOSurfaceIsGlobal");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceBytesPerRow",  @"IOSurfaceBytesPerRow");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceBytesPerElement",  @"IOSurfaceBytesPerElement");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceElementWidth",  @"IOSurfaceElementWidth");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceElementHeight",  @"IOSurfaceElementHeight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceWidth",  @"IOSurfaceWidth");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceHeight",  @"IOSurfaceHeight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceOffset",  @"IOSurfaceOffset");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePixelFormat",  @"IOSurfacePixelFormat");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceMemoryRegion",  @"IOSurfaceMemoryRegion");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAllocSize",  @"IOSurfaceAllocSize");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneInfo",  @"IOSurfacePlaneInfo");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBase",  @"IOSurfacePlaneBase");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneOffset",  @"IOSurfacePlaneOffset");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneWidth",  @"IOSurfacePlaneWidth");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHeight",  @"IOSurfacePlaneHeight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerRow",  @"IOSurfacePlaneBytesPerRow");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBitsPerElement",  @"IOSurfacePlaneBitsPerElement");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerElement",  @"IOSurfacePlaneBytesPerElement");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneElementWidth",  @"IOSurfacePlaneElementWidth");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneElementHeight",  @"IOSurfacePlaneElementHeight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneSize",  @"IOSurfacePlaneSize");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAddress",  @"IOSurfaceAddress");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAddressRanges",  @"IOSurfaceAddressRanges");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAddressOffset",  @"IOSurfaceAddressOffset");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceDirection",  @"IOSurfaceDirection");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceType",  @"IOSurfaceType");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceCacheMode",  @"IOSurfaceCacheMode");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOFenceAllowTearing",  @"IOFenceAllowTearing");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePrefetchPages",  @"IOSurfacePrefetchPages");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePurgeWhenNotInUse",  @"IOSurfacePurgeWhenNotInUse");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceResetDefaultAttachmentsWhenNotInUse",  @"IOSurfaceResetDefaultAttachmentsWhenNotInUse");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceDefaultAttachments",  @"IOSurfaceDefaultAttachments");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceDefaultBulkAttachments",  @"IOSurfaceDefaultBulkAttachments");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"CreationProperties",  @"CreationProperties");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IsDisplayable",  @"IsDisplayable");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceNonPurgeable",  @"IOSurfaceNonPurgeable");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceEDRFactor",  @"IOSurfaceEDRFactor");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePixelSizeCastingAllowed",  @"IOSurfacePixelSizeCastingAllowed");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePixelSizeCastingAllowed",  @"IOSurfacePixelSizeCastingAllowed");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceUseReserve",  @"IOSurfaceUseReserve");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneComponentBitDepths",  @"IOSurfacePlaneComponentBitDepths");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneComponentBitOffsets",  @"IOSurfacePlaneComponentBitOffsets");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneComponentNames",  @"IOSurfacePlaneComponentNames");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneComponentTypes",  @"IOSurfacePlaneComponentTypes");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneComponentRanges",  @"IOSurfacePlaneComponentRanges");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceSubsampling",  @"IOSurfaceSubsampling");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAllocateFromSuperbuffer",  @"IOSurfaceAllocateFromSuperbuffer");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceSuperbuffer",  @"IOSurfaceSuperbuffer");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceMemoryPoolSize",  @"IOSurfaceMemoryPoolSize");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceMemoryPoolZerofillEnabled",  @"IOSurfaceMemoryPoolZerofillEnabled");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceMemoryPoolCacheModeSwitchEnabled",  @"IOSurfaceMemoryPoolCacheModeSwitchEnabled");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressedTileWidth",  @"IOSurfacePlaneCompressedTileWidth");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressedTileHeight",  @"IOSurfacePlaneCompressedTileHeight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressedTileHeaderRegionOffset",  @"IOSurfacePlaneCompressedTileHeaderRegionOffset");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressedTileDataRegionOffset",  @"IOSurfacePlaneCompressedTileDataRegionOffset");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressionType",  @"IOSurfacePlaneCompressionType");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneCompressionFootprint",  @"IOSurfacePlaneCompressionFootprint");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerCompressedTileHeader",  @"IOSurfacePlaneBytesPerCompressedTileHeader");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneWidthInCompressedTiles",  @"IOSurfacePlaneWidthInCompressedTiles");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHeightInCompressedTiles",  @"IOSurfacePlaneHeightInCompressedTiles");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups",  @"IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHTPCPredictionSelector",  @"IOSurfacePlaneHTPCPredictionSelector");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHTPCVerticalHeaderGroupingMode",  @"IOSurfacePlaneHTPCVerticalHeaderGroupingMode");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray",  @"IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray",  @"IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceAddressFormat",  @"IOSurfaceAddressFormat");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerTileData",  @"IOSurfacePlaneBytesPerTileData");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneBytesPerRowOfTileData",  @"IOSurfacePlaneBytesPerRowOfTileData");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceSliceCount",  @"IOSurfaceSliceCount");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneDataRegionBytesPerSlice",  @"IOSurfacePlaneDataRegionBytesPerSlice");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneHeaderRegionBytesPerSlice",  @"IOSurfacePlaneHeaderRegionBytesPerSlice");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneExtendedPixelsOnLeft",  @"IOSurfacePlaneExtendedPixelsOnLeft");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneExtendedPixelsOnRight",  @"IOSurfacePlaneExtendedPixelsOnRight");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneExtendedPixelsOnTop",  @"IOSurfacePlaneExtendedPixelsOnTop");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfacePlaneExtendedPixelsOnBottom",  @"IOSurfacePlaneExtendedPixelsOnBottom");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceProhibitUseCount",  @"IOSurfaceProhibitUseCount");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceMemoryPoolInfo",  @"IOSurfaceMemoryPoolInfo");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"IOSurfaceEnableStatistics",  @"IOSurfaceEnableStatistics");
    CFDictionarySetValue( (CFMutableDictionaryRef)_creationPropertiesDict,  @"DolbyVisionRPUData",  @"DolbyVisionRPUData");
    mach_port_t v1 = *MEMORY[0x1896086A8];
    int v2 = -241;
    while (1)
    {
      existing = 0;
      v3 = IOServiceNameMatching("IOCoreSurfaceRoot");
      MatchingServices = IOServiceGetMatchingServices(v1, v3, &existing);
      _iosServiceReturn = MatchingServices;
      if (MatchingServices) {
        break;
      }
      v5 = IOIteratorNext(existing);
      _iosService = v5;
      if (v5)
      {
        v8 = IOServiceOpen(v5, *MEMORY[0x1895FBBE0], 0, (io_connect_t *)&_iosConnect);
        _iosConnectReturn = v8;
        if (v8)
        {
          if (v8 != -536870174)
          {
            if (v8 == -536870201)
            {
              v9 = (void *)MEMORY[0x186E08328]();
              v10 = objc_alloc_init(MEMORY[0x189603FC8]);
              iterator = 0;
              v11 = 0;
              if (!MEMORY[0x186E080B8](_iosService, "IOService", 0LL, &iterator))
              {
                v38 = v9;
                v12 = IOIteratorNext(iterator);
                if (v12)
                {
                  v13 = v12;
                  v11 = 0;
                  v14 = @"IOUserClientCreator";
                  do
                  {
                    v15 = (void *)MEMORY[0x186E08328]();
                    CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, v14, 0LL, 0);
                    if (CFProperty)
                    {
                      v17 = CFProperty;
                      v18 = objc_msgSend(CFProperty, "rangeOfString:", @", ");
                      if (v19)
                      {
                        v20 = [v17 substringFromIndex:v18 + 2];
                        v21 = (void *)[v10 objectForKeyedSubscript:v20];
                        if (v21)
                        {
                          v22 = v10;
                          v23 = v14;
                          v24 = (void *)MEMORY[0x189607968];
                          v25 = [v21 intValue] + 1;
                          v26 = v24;
                          v14 = v23;
                          v10 = v22;
                          v27 = (void *)[v26 numberWithInt:v25];
                          v28 = v22;
                        }

                        else
                        {
                          v28 = v10;
                          v27 = &unk_189B60D28;
                        }

                        [v28 setObject:v27 forKeyedSubscript:v20];
                      }
                    }

                    objc_autoreleasePoolPop(v15);
                    ++v11;
                    IOObjectRelease(v13);
                    v13 = IOIteratorNext(iterator);
                  }

                  while (v13);
                }

                else
                {
                  v11 = 0;
                }

                IOObjectRelease(iterator);
                v9 = v38;
              }

              v29 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "cStringUsingEncoding:", 4);
              *(void *)buf = 0LL;
              asprintf( (char **)buf,  "_iosConnectInitalize() unable to open IOSurface kernel service: %08x\n%d existing clients:\n%s\n",  -536870201,  v11,  v29);
              if (*(void *)buf) {
                ___ioSurfaceConnectInternal_block_invoke_cold_4(*(char **)buf);
              }

              objc_autoreleasePoolPop(v9);
            }

            else
            {
              *(void *)buf = 0LL;
              asprintf((char **)buf, "_iosConnectInitalize() unable to open IOSurface kernel service: %08x", v8);
              if (*(void *)buf) {
                ___ioSurfaceConnectInternal_block_invoke_cold_3(*(char **)buf);
              }
            }
          }
        }

        else
        {
          *(void *)buf = 40LL;
          if (IOConnectCallMethod(_iosConnect, 0xDu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, &ioSurfaceLimits, (size_t *)buf)
            || word_18C44A042 != 1)
          {
            v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v30) {
              ___ioSurfaceConnectInternal_block_invoke_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
            }
            IOServiceClose(_iosConnect);
            _iosConnect = 0;
          }
        }

        goto LABEL_39;
      }

      IOObjectRelease(existing);
      sleep(1u);
      if (__CFADD__(v2++, 1)) {
        goto LABEL_39;
      }
    }

    v7 = MatchingServices;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "IOSurface.framework not allowed to iterate kernel services (%08x).  API disallowed.",  buf,  8u);
    }

LABEL_39:
    if (!(_iosService | _iosServiceReturn)) {
      ___ioSurfaceConnectInternal_block_invoke_cold_1();
    }
  }

  _ensureKeySniffDictionaries();
}

uint64_t _ioSurfaceConnect()
{
  return _ioSurfaceConnectInternal(0);
}

void IOSurfaceLog(char *a1, ...)
{
  __s[2] = *(char **)MEMORY[0x1895F89C0];
  __s[0] = 0LL;
  va_copy((va_list)&__s[1], va);
  vasprintf(__s, a1, va);
  if (__s[0])
  {
    size_t v1 = strlen(__s[0]) + 1;
    mach_port_t v2 = _ioSurfaceConnectInternal(0);
    IOConnectCallMethod(v2, 0x13u, 0LL, 0, __s[0], v1, 0LL, 0LL, 0LL, 0LL);
    free(__s[0]);
  }
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  mach_port_t v0 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v0, 0x20u, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return output;
  }
}

uint64_t IOSurfaceClientDisallowForever()
{
  uint64_t result = _ioSurfaceConnectInternal(1);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      IOSurfaceClientDisallowForever_cold_1();
    }
    abort();
  }

  return result;
}

void _ioSurfaceAddClientRef(unsigned int *value)
{
  Mutable = (__CFDictionary *)_iosCacheDict;
  if (!_iosCacheDict)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
    _iosCacheDict = (uint64_t)Mutable;
  }

  CFDictionaryAddValue(Mutable, (const void *)value[34], value);
}

unsigned int *IOSurfaceClientCreate(void *object)
{
  return IOSurfaceClientCreateChild(0LL, object);
}

unsigned int *IOSurfaceClientCreateChild(uint64_t a1, void *object)
{
  kern_return_t v9;
  unsigned int *v10;
  const void *Value;
  void (*v12)(uint64_t, void, uint64_t, void, void, void);
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_s *v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uintptr_t v30;
  io_connect_t v31;
  size_t v32;
  uint64_t input;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned int outputStruct[6];
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  v46 = *MEMORY[0x1895F89C0];
  if (a1) {
    uint64_t v3 = *(unsigned int *)(a1 + 136);
  }
  else {
    uint64_t v3 = 0LL;
  }
  v32 = 3176LL;
  input = v3;
  CFDataRef v4 = IOCFSerialize(object, 1uLL);
  if (v4)
  {
    v5 = v4;
    mach_port_t v6 = _ioSurfaceConnectInternal(0);
    BytePtr = CFDataGetBytePtr(v5);
    size_t Length = CFDataGetLength(v5);
    v9 = IOConnectCallMethod(v6, 0, &input, 1u, BytePtr, Length, 0LL, 0LL, outputStruct, &v32);
    CFRelease(v5);
    if (!v9)
    {
      v10 = (unsigned int *)_ioSurfaceClientCreateWithLockResult(outputStruct);
      if (v10)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)object, @"IOSurfacePrefetchPages");
        if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE8])) {
          IOSurfaceClientPrefetchPages((uint64_t)v10);
        }
        pthread_mutex_lock(&_iosCacheMutex);
        _ioSurfaceAddClientRef(v10);
        v12 = (void (*)(uint64_t, void, uint64_t, void, void, void))*MEMORY[0x1895F8A20];
        if (*MEMORY[0x1895F8A20])
        {
          if (!_iosClientAddressesSet) {
            _iosClientAddressesSet = (uint64_t)CFSetCreateMutable(0LL, 0LL, MEMORY[0x189605258]);
          }
          v13 = CFDictionaryGetValue((CFDictionaryRef)object, @"IOSurfaceAddress");
          if (v13)
          {
            CFSetAddValue((CFMutableSetRef)_iosClientAddressesSet, v13);
          }

          else if (!v3)
          {
            v12(1476395024LL, *MEMORY[0x1895FBBE0], v45, 0LL, *(void *)outputStruct, 0LL);
          }
        }

        pthread_mutex_unlock(&_iosCacheMutex);
      }

      else
      {
        v30 = v44;
        v31 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v31, 5u, v30);
      }

      return v10;
    }
  }

  else
  {
    v9 = -1;
  }

  if (_ioSurfaceConnectInternal(0))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      IOSurfaceClientCreateChild_cold_3(v9, v3, (uint64_t)object);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = [object countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v14)
    {
      v15 = v14;
      v16 = *(void *)v40;
      v17 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        for (i = 0LL; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(object);
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v19 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            LODWORD(input) = 67109634;
            HIDWORD(input) = v9;
            v34 = 1024;
            v35 = v3;
            v36 = 2112;
            v37 = v19;
            _os_log_error_impl( &dword_1811BB000,  v17,  OS_LOG_TYPE_ERROR,  "IOSurface creation failed: %08x parentID: %08x property: %@",  (uint8_t *)&input,  0x18u);
          }
        }

        v15 = [object countByEnumeratingWithState:&v39 objects:v38 count:16];
      }

      while (v15);
    }
  }

  else
  {
    v20 = _iosService;
    v21 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v21) {
        IOSurfaceClientCreateChild_cold_2();
      }
    }

    else if (v21)
    {
      IOSurfaceClientCreateChild_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }

  return 0LL;
}

char *_ioSurfaceClientCreateWithLockResult(unsigned int *a1)
{
  uint64_t v2 = a1[22];
  if ((_DWORD)v2) {
    uint64_t v3 = 152 * (20 - v2);
  }
  else {
    uint64_t v3 = 2888LL;
  }
  CFDataRef v4 = (char *)malloc(3288 - v3);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)CFDataRef v4 = 1;
    *((void *)v4 + 13) = 0LL;
    *((void *)v4 + 2) = 0LL;
    *((void *)v4 + 3) = 0LL;
    *((void *)v4 + 1) = 0LL;
    *((_DWORD *)v4 + 8) = 0;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 40), 0LL);
    memcpy(v5 + 112, a1, 3176 - v3);
  }

  return v5;
}

uint64_t IOSurfaceClientPrefetchPages(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  uint64_t v3 = *(IOSurfaceWiringAssertion **)(a1 + 104);
  if (!v3)
  {
    uint64_t v3 = -[IOSurfaceWiringAssertion initWithIOSurfaceClient:]( objc_alloc(&OBJC_CLASS___IOSurfaceWiringAssertion),  "initWithIOSurfaceClient:",  a1);
    *(void *)(a1 + 104) = v3;
  }

  if (v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 3758097084LL;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

_DWORD *IOSurfaceClientRetain(_DWORD *a1)
{
  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    ++*a1;
    pthread_mutex_unlock(&_iosCacheMutex);
  }

  return a1;
}

void IOSurfaceClientRelease(_DWORD *a1)
{
  kern_return_t v5;
  int v6;
  uintptr_t v7;
  io_connect_t v8;
  const void *v9;
  const void *v10;
  const void *v11;
  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    if ((*a1)-- == 1)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_iosCacheDict, (const void *)a1[34]);
      uintptr_t v3 = a1[34];
      io_connect_t v4 = _ioSurfaceConnectInternal(0);
      v5 = IOConnectTrap1(v4, 4u, v3);
      if (v5)
      {
        mach_port_t v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          IOSurfaceClientRelease_cold_1(v6);
        }
      }

      pthread_mutex_unlock(&_iosCacheMutex);

      *((void *)a1 + 13) = 0LL;
      v7 = a1[34];
      v8 = _ioSurfaceConnectInternal(0);
      if (!IOConnectTrap1(v8, 5u, v7) && _iosClientAddressesSet)
      {
        v9 = (const void *)[MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)a1 + 14)];
        if (CFSetGetValue((CFSetRef)_iosClientAddressesSet, v9))
        {
          CFSetRemoveValue((CFMutableSetRef)_iosClientAddressesSet, v9);
        }

        else if (*MEMORY[0x1895F8A20] && !a1[56])
        {
          ((void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x1895F8A20])( 32LL,  *MEMORY[0x1895FBBE0],  *((void *)a1 + 14),  *((void *)a1 + 18),  0LL,  0LL);
        }
      }

      v10 = (const void *)*((void *)a1 + 2);
      if (v10) {
        CFRelease(v10);
      }
      v11 = (const void *)*((void *)a1 + 3);
      if (v11) {
        CFRelease(v11);
      }
      pthread_mutex_destroy((pthread_mutex_t *)(a1 + 10));
      free(a1);
    }

    else
    {
      pthread_mutex_unlock(&_iosCacheMutex);
    }
  }

uint64_t IOSurfaceClientGetID(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 136);
  }
  return result;
}

uint64_t IOSurfaceClientGetParentID(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 224);
  }
  return result;
}

unsigned int *IOSurfaceClientLookup(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&_iosCacheMutex);
  if (_iosCacheDict
    && (Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)a1)) != 0LL)
  {
    uintptr_t v3 = Value;
    ++*Value;
  }

  else
  {
    size_t v9 = 3176LL;
    uint64_t input = a1;
    mach_port_t v4 = _ioSurfaceConnectInternal(0);
    uintptr_t v3 = 0LL;
    if (!IOConnectCallMethod(v4, 4u, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v9))
    {
      v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult(outputStruct);
      uintptr_t v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }

      else
      {
        uintptr_t v6 = v12;
        io_connect_t v7 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v7, 5u, v6);
      }

      if (*MEMORY[0x1895F8A20]) {
        ((void (*)(uint64_t, void, uint64_t, void, void, void))*MEMORY[0x1895F8A20])( 1476395024LL,  *MEMORY[0x1895FBBE0],  v13,  0LL,  *(void *)outputStruct,  0LL);
      }
    }
  }

  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

uint64_t IOSurfaceClientLock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v9 = 0;
  io_connect_t v6 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectTrap3(v6, 2u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!(_DWORD)result)
  {
    int v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3) {
      *a3 = v8;
    }
  }

  return result;
}

uint64_t IOSurfaceClientUnlock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v9 = 0;
  io_connect_t v6 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectTrap3(v6, 3u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!(_DWORD)result)
  {
    int v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3) {
      *a3 = v8;
    }
  }

  return result;
}

uint64_t IOSurfaceClientGetAllocSize(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

uint64_t IOSurfaceClientGetWidth(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t IOSurfaceClientGetHeight(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t IOSurfaceClientGetBytesPerRow(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 200);
  if (!(_DWORD)v1) {
    return *(void *)(a1 + 168);
  }
  char v2 = 0;
  uintptr_t v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    int v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }

  while (v1);
  if ((v2 & 1) != 0) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 168);
  }
}

uint64_t IOSurfaceClientGetBytesPerElement(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 208);
}

uint64_t IOSurfaceClientGetElementWidth(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 210);
}

uint64_t IOSurfaceClientGetElementHeight(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 211);
}

uint64_t IOSurfaceClientGetPixelFormat(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t IOSurfaceClientGetBaseAddress(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 200);
  if (!(_DWORD)v1) {
    return *(void *)(a1 + 176) + *(void *)(a1 + 112);
  }
  char v2 = 0;
  uintptr_t v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    int v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }

  while (v1);
  if ((v2 & 1) != 0) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 176) + *(void *)(a1 + 112);
  }
}

uint64_t _IOSurfaceClientGetUnadjustedBaseAddress(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t _IOSurfaceClientGetBufferOffset(uint64_t a1)
{
  return *(void *)(a1 + 176);
}

uint64_t IOSurfaceClientGetSeed(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 120) + 12LL);
}

uint64_t IOSurfaceClientGetPlaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

uint64_t IOSurfaceClientGetWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = a1 + 152;
  }

  else
  {
    uint64_t v2 = a1 + 152LL * a2 + 248;
  }

  return *(void *)v2;
}

uint64_t IOSurfaceClientGetHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = a1 + 160;
  }

  else
  {
    uint64_t v2 = a1 + 152LL * a2 + 256;
  }

  return *(void *)v2;
}

uint64_t IOSurfaceClientGetBytesPerRowOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      uint64_t v2 = a1 + 168;
      return *(void *)v2;
    }

    return 0LL;
  }

  if (*(_BYTE *)(a1 + 152LL * a2 + 356) == 1) {
    return 0LL;
  }
  uint64_t v2 = a1 + 152LL * a2 + 280;
  return *(void *)v2;
}

uint64_t IOSurfaceClientGetBytesPerElementOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = (unsigned __int16 *)(a1 + 208);
  }

  else
  {
    uint64_t v2 = (unsigned __int16 *)(a1 + 152LL * a2 + 296);
  }

  return *v2;
}

uint64_t IOSurfaceClientGetElementWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = (unsigned __int8 *)(a1 + 210);
  }

  else
  {
    uint64_t v2 = (unsigned __int8 *)(a1 + 152LL * a2 + 298);
  }

  return *v2;
}

uint64_t IOSurfaceClientGetElementHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = (unsigned __int8 *)(a1 + 211);
  }

  else
  {
    uint64_t v2 = (unsigned __int8 *)(a1 + 152LL * a2 + 299);
  }

  return *v2;
}

uint64_t IOSurfaceClientGetBaseAddressOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      uint64_t v2 = (void *)(a1 + 176);
      return *v2 + *(void *)(a1 + 112);
    }

    return 0LL;
  }

  if (*(_BYTE *)(a1 + 152LL * a2 + 356) == 1) {
    return 0LL;
  }
  uint64_t v2 = (void *)(a1 + 152LL * a2 + 272);
  return *v2 + *(void *)(a1 + 112);
}

uint64_t IOSurfaceClientGetOffsetOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = a1 + 176;
  }

  else
  {
    uint64_t v2 = a1 + 152LL * a2 + 272;
  }

  return *(void *)v2;
}

uint64_t IOSurfaceClientGetSizeOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0LL;
    }
    uint64_t v2 = a1 + 144;
  }

  else
  {
    uint64_t v2 = a1 + 152LL * a2 + 288;
  }

  return *(void *)v2;
}

uint64_t IOSurfaceClientFlushProcessorCaches(uint64_t a1)
{
  uint64_t result = IOSurfaceClientLock(a1, 1u, 0LL);
  if (!(_DWORD)result)
  {
    sys_dcache_flush(*(void **)(a1 + 112), *(void *)(a1 + 192));
    return IOSurfaceClientUnlock(a1, 1u, 0LL);
  }

  return result;
}

uint64_t IOSurfaceClientGetCacheMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 212);
}

uint64_t IOSurfaceClientBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  input[3] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  mach_port_t v5 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v5, 0xCu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

BOOL IOSurfaceClientNeedsBindAccel(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 120);
  return *(_WORD *)(v3 + 8) && (*(unsigned __int16 *)(v3 + 8) != a2 || *(unsigned __int16 *)(v3 + 10) != a3);
}

void IOSurfaceClientSetValue(uint64_t a1, void *key, CFDictionaryRef theDict)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  int outputStruct = 0;
  size_t v29 = 4LL;
  if (theDict)
  {
    __int128 v27 = 0u;
    *(_OWORD *)theDicta = 0u;
    memset(context, 0, sizeof(context));
    if (key) {
      _sniffKeysToStruct(key, theDict, (uint64_t)context);
    }
    else {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_sniffKeysToStruct, context);
    }
    if (*((void *)&v27 + 1)) {
      IOSurfaceClientSetBulkAttachments(a1, (uint64_t)context, 0x74uLL, SDWORD2(v27));
    }
    if (LOBYTE(theDicta[0]))
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      io_connect_t v6 = *(const __CFDictionary **)(a1 + 16);
      if (key)
      {
        if (!v6
          || (Value = CFDictionaryGetValue(v6, key)) == 0LL
          || !CFEqual(Value, theDict)
          || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(void *)(a1 + 120) + 32LL))
        {
          CFMutableDictionaryRef v8 = serializeReplacementIOKitTypeRef(theDict);
          values = v8;
          v32 = key;
          CFIndex v9 = 2LL;
LABEL_18:
          CFArrayRef v10 = CFArrayCreate(0LL, (const void **)&values, v9, MEMORY[0x189605228]);
          if (v10)
          {
            CFArrayRef v11 = v10;
            CFRelease(v8);
            unsigned int v12 = IOCFSerialize(v11, 1uLL);
            CFRelease(v11);
            if (v12)
            {
              unint64_t Length = CFDataGetLength(v12);
              if (Length >= 0xFFFFFFFFFFFFFFF4LL) {
                abort();
              }
              size_t v14 = Length;
              size_t v15 = (Length + 12);
              v16 = malloc(v15);
              _DWORD *v16 = *(_DWORD *)(a1 + 136);
              BytePtr = CFDataGetBytePtr(v12);
              memcpy(v16 + 3, BytePtr, v14);
              mach_port_t v18 = _ioSurfaceConnectInternal(0);
              IOConnectCallMethod(v18, 9u, 0LL, 0, v16, v15, 0LL, 0LL, &outputStruct, &v29);
              int v19 = *(_DWORD *)(a1 + 32);
              if (v19)
              {
                int v20 = (v19 | 1) + 2;
                if (outputStruct == v20)
                {
                  *(_DWORD *)(a1 + 32) = v20;
                  v21 = *(const __CFDictionary **)(a1 + 16);
                  v22 = (const __CFAllocator *)*MEMORY[0x189604DB0];
                  if (v21) {
                    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v21);
                  }
                  else {
                    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
                  }
                  v24 = MutableCopy;
                  if (key)
                  {
                    if (!CFEqual(@"CreationProperties", key)) {
                      CFDictionarySetValue(v24, key, theDict);
                    }
                  }

                  else
                  {
                    CFDictionaryApplyFunction( theDicta[1],  (CFDictionaryApplierFunction)setEachValueInDictionary,  MutableCopy);
                  }

                  v25 = *(const void **)(a1 + 16);
                  if (v25) {
                    CFRelease(v25);
                  }
                  *(void *)(a1 + 16) = CFDictionaryCreateCopy(v22, v24);
                  CFRelease(v24);
                }
              }

              free(v16);
              CFRelease(v12);
            }
          }
        }
      }

      else if (!v6 {
             || (values = *(void **)(a1 + 16),
      }
                 LOBYTE(v32) = 1,
                 CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)compareKeys, &values),
                 !(_BYTE)v32)
             || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(void *)(a1 + 120) + 32LL))
      {
        CFMutableDictionaryRef v8 = serializeReplacementIOKitTypeRef(theDicta[1]);
        values = v8;
        CFIndex v9 = 1LL;
        goto LABEL_18;
      }

      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      if (theDicta[1]) {
        CFRelease(theDicta[1]);
      }
    }
  }

uint64_t IOSurfaceClientSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a3 > 0x74) {
    return 3758097084LL;
  }
  uint64_t result = getDirtyMask(*(void *)(a1 + 120) + 48LL, a2, a4);
  if (result)
  {
    uint64_t v7 = result;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    memset(inputStruct, 0, sizeof(inputStruct));
    DWORD2(v11) = *(_DWORD *)(a1 + 136);
    __memcpy_chk();
    *((void *)&v10 + 1) = a3;
    *(void *)&__int128 v11 = v7;
    mach_port_t v8 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v8, 0x1Bu, 0LL, 0, inputStruct, 0x90uLL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t compareKeys(void *key, const void *a2, uint64_t a3)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)a3, key);
  if (!result || (uint64_t result = CFEqual((CFTypeRef)result, a2), !(_DWORD)result)) {
    *(_BYTE *)(a3 + 8) = 0;
  }
  return result;
}

CFMutableDictionaryRef serializeReplacementIOKitTypeRef(const void *a1)
{
  values[1] = *(void **)MEMORY[0x1895F89C0];
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 == CFDictionaryGetTypeID())
    {
      uint64_t v7 = CFGetAllocator(a1);
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, Count, MEMORY[0x189605240], MEMORY[0x189605250]);
      CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)serializeReplacementDictionaryKeysAndValues,  Mutable);
    }

    else
    {
      CFTypeID v10 = CFGetTypeID(a1);
      if (v10 == CFArrayGetTypeID())
      {
        __int128 v11 = CFGetAllocator(a1);
        CFIndex v12 = CFArrayGetCount((CFArrayRef)a1);
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v11, v12, MEMORY[0x189605228]);
        v21.length = CFArrayGetCount((CFArrayRef)a1);
        v21.location = 0LL;
        CFArrayApplyFunction((CFArrayRef)a1, v21, (CFArrayApplierFunction)serializeReplacementArrayValues, Mutable);
      }

      else
      {
        CFTypeID v14 = CFGetTypeID(a1);
        if (v14 != CFSetGetTypeID()) {
          return (CFMutableDictionaryRef)CFRetain(a1);
        }
        size_t v15 = CFGetAllocator(a1);
        CFIndex v16 = CFSetGetCount((CFSetRef)a1);
        CFMutableDictionaryRef Mutable = CFSetCreateMutable(v15, v16, MEMORY[0x189605258]);
        CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)serializeReplacementSetValues, Mutable);
      }
    }

    return Mutable;
  }

  if (CFNumberIsFloatType((CFNumberRef)a1))
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)a1);
    keys = @"iokit-float";
    values[0] = 0LL;
    if (((1LL << Type) & 0x12040) != 0)
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, v18);
      int v4 = CFGetAllocator(a1);
      CFIndex v5 = 8LL;
    }

    else
    {
      if (((1LL << Type) & 0x1020) == 0) {
        goto LABEL_13;
      }
      CFNumberGetValue((CFNumberRef)a1, kCFNumberFloatType, v18);
      int v4 = CFGetAllocator(a1);
      CFIndex v5 = 4LL;
    }

    values[0] = CFDataCreate(v4, v18, v5);
LABEL_13:
    uint64_t v13 = CFGetAllocator(a1);
    CFMutableDictionaryRef Mutable = CFDictionaryCreate( v13,  (const void **)&keys,  (const void **)values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    if (values[0]) {
      CFRelease(values[0]);
    }
    return Mutable;
  }

  return (CFMutableDictionaryRef)CFRetain(a1);
}

void setEachValueInDictionary(CFTypeRef cf2, const void *a2, __CFDictionary *a3)
{
  if (!CFEqual(@"CreationProperties", cf2)) {
    CFDictionarySetValue(a3, cf2, a2);
  }
}

const void *IOSurfaceClientCopyValue(uint64_t a1, void *key)
{
  CFTypeID v2 = key;
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = 0LL;
  if (key)
  {
    if (_copySniffKeyFromStruct(key, *(void *)(a1 + 120) + 48LL, v7))
    {
      return (const void *)v7[0];
    }

    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      IOSurfaceClientUpdateNonBulkValueCache(a1);
      int v4 = *(const __CFDictionary **)(a1 + 16);
      if (v4)
      {
        Value = CFDictionaryGetValue(v4, v2);
        CFTypeID v2 = Value;
        if (Value) {
          CFRetain(Value);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      }

      else
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
        return 0LL;
      }
    }
  }

  return v2;
}

void IOSurfaceClientUpdateNonBulkValueCache(uint64_t a1)
{
  v22[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 120);
  unsigned int v2 = *(_DWORD *)(v1 + 40);
  if (!v2 || *(_DWORD *)(a1 + 32) == *(_DWORD *)(v1 + 32)) {
    return;
  }
  int v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0LL;
    unsigned int v2 = *(_DWORD *)(v1 + 40);
  }

  unint64_t v5 = (*MEMORY[0x1895FD590] + v2 + 11LL) & -*MEMORY[0x1895FD590];
  if (v5 <= 0x4000) {
    size_t v6 = 0x4000LL;
  }
  else {
    size_t v6 = v5;
  }
  v22[0] = v6;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  while (1)
  {
    if (v6 > 0x4000)
    {
      mach_port_t v8 = (char *)valloc(v6);
    }

    else
    {
      MEMORY[0x1895F8858](v7);
      mach_port_t v8 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    }

    v8[12] = 0;
    v19[0] = *(_DWORD *)(a1 + 136);
    v19[2] = *(void *)(a1 + 24) != 0LL;
    char v20 = 0;
    mach_port_t v9 = _ioSurfaceConnectInternal(0);
    uint64_t v7 = IOConnectCallMethod(v9, 0xAu, 0LL, 0, v19, 0xDuLL, 0LL, 0LL, v8, v22);
    if ((_DWORD)v7 != -536870181) {
      break;
    }
    size_t v10 = v22[0];
    size_t v11 = 16 * v22[0];
    v22[0] = v11;
    if (v11 > 0x1000000) {
      goto LABEL_30;
    }
    BOOL v12 = v6 > 0x4000;
    size_t v6 = 16 * v10;
    if (v12)
    {
      free(v8);
      size_t v6 = v11;
    }
  }

  if (!(_DWORD)v7)
  {
    CFStringRef errorString = 0LL;
    if (v22[0])
    {
      CFTypeRef v13 = IOCFUnserializeWithSize(v8 + 12, v22[0] - 12, 0LL, 0LL, &errorString);
      if (v13 || !errorString)
      {
        if (v13)
        {
          size_t v15 = unserializeReplacementIOKitTypeRef(v13, *(const void **)(a1 + 24));
          CFRelease(v13);
          goto LABEL_28;
        }
      }

      else
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        if (CStringPtr) {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", CStringPtr);
        }
        CFRelease(errorString);
      }
    }

    size_t v15 = 0LL;
LABEL_28:
    *(void *)(a1 + 16) = v15;
    if (!*(void *)(a1 + 24))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v15, @"CreationProperties");
      if (Value)
      {
        v17 = Value;
        CFTypeID v18 = CFGetTypeID(Value);
        if (v18 == CFDictionaryGetTypeID()) {
          *(void *)(a1 + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v17);
        }
      }
    }

    *(_DWORD *)(a1 + 32) = *((_DWORD *)v8 + 1);
    goto LABEL_30;
  }

  fprintf((FILE *)*MEMORY[0x1895F89D0], "IOSurfaceClientCopyValue getValueMethod kernel call failed %08x\n", v7);
LABEL_30:
  if (v6 > 0x4000) {
    free(v8);
  }
}

__CFDictionary *IOSurfaceClientCopyAllValues(uint64_t a1)
{
  v5[1] = *(__CFDictionary **)MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  uint64_t v1 = *(void *)(a1 + 120);
  if (!*(_DWORD *)(v1 + 40)) {
    return 0LL;
  }
  uint64_t v3 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  IOSurfaceClientUpdateNonBulkValueCache(a1);
  _insertAllKeysFromStruct(*(const __CFDictionary **)(a1 + 16), v1 + 48, v5);
  pthread_mutex_unlock(v3);
  return v5[0];
}

uint64_t IOSurfaceClientCopyDataValueBytes(uint64_t a1, const __CFString *a2, _BYTE *a3, size_t *a4)
{
  v16[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097090LL;
  if (a2 && a3 && a4)
  {
    if (*a4)
    {
      if (*(_DWORD *)(*(void *)(a1 + 120) + 40LL))
      {
        v16[0] = *a4;
        ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, a2, 0x8000100u, 0);
        uint64_t v4 = 3758097136LL;
        if (ExternalRepresentation)
        {
          mach_port_t v9 = ExternalRepresentation;
          size_t Length = CFDataGetLength(ExternalRepresentation);
          size_t v11 = malloc(Length + 13);
          *a3 = 0;
          *size_t v11 = *(_DWORD *)(a1 + 136);
          BytePtr = CFDataGetBytePtr(v9);
          memcpy(v11 + 3, BytePtr, Length);
          *((_BYTE *)v11 + Length + 12) = 0;
          mach_port_t v13 = _ioSurfaceConnectInternal(0);
          uint64_t v14 = IOConnectCallMethod(v13, 0x1Au, 0LL, 0, v11, Length + 13, 0LL, 0LL, a3, v16);
          uint64_t v4 = v14;
          if ((_DWORD)v14 && (_DWORD)v14 != -536870181) {
            fprintf( (FILE *)*MEMORY[0x1895F89D0],  "IOSurfaceClientGetValue getValueMethod kernel call failed %08x\n",  v14);
          }
          else {
            *a4 = v16[0];
          }
          free(v11);
          CFRelease(v9);
        }
      }

      else
      {
        return 3758097136LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

uint64_t IOSurfaceClientSetCoreVideoBridgedKeys(const __CFArray *a1)
{
  kern_return_t v10;
  CFRange v12;
  pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
  if (_iosBridgedCoreVideoKeys) {
    CFRelease((CFTypeRef)_iosBridgedCoreVideoKeys);
  }
  _iosBridgedCoreVideoKeys = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605258]);
  v12.length = CFArrayGetCount(a1);
  v12.location = 0LL;
  CFArrayApplyFunction(a1, v12, (CFArrayApplierFunction)addValueToSet, (void *)_iosBridgedCoreVideoKeys);
  unsigned int v2 = IOCFSerialize(a1, 1uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t Length = CFDataGetLength(v2);
    if (Length >= 0xFFFFFFFFFFFFFFF4LL) {
      abort();
    }
    size_t v5 = Length;
    size_t v6 = (Length + 12);
    uint64_t v7 = (char *)malloc(v6);
    BytePtr = CFDataGetBytePtr(v3);
    memcpy(v7 + 12, BytePtr, v5);
    mach_port_t v9 = _ioSurfaceConnectInternal(0);
    size_t v10 = IOConnectCallMethod(v9, 0x36u, 0LL, 0, v7, v6, 0LL, 0LL, 0LL, 0LL);
    if (v10) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "kIOSurfaceMethodSetCoreVideoBridgedKeys failed: %08x\n", v10);
    }
    CFRelease(v3);
    free(v7);
  }

  return pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
}

void addValueToSet(void *value, CFMutableSetRef theSet)
{
}

uint64_t IOSurfaceClientRemoveCoreVideoBridgedValues(uint64_t a1)
{
  kern_return_t v5;
  uint64_t context;
  CFTypeRef cf;
  uint64_t v9;
  int v10;
  uint64_t v11;
  size_t v11 = *MEMORY[0x1895F89C0];
  size_t v10 = 0;
  cf = 0LL;
  mach_port_t v9 = 0LL;
  if (*(void *)(a1 + 16)) {
    BOOL v2 = *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(void *)(a1 + 120) + 32LL);
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
  context = _iosBridgedCoreVideoKeys;
  LOBYTE(v9) = 0;
  if (v2)
  {
    cf = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFDictionaryApplyFunction( *(CFDictionaryRef *)(a1 + 16),  (CFDictionaryApplierFunction)insertKeyIfNotListedForRemoval,  &context);
    if ((_BYTE)v9)
    {
      CFRelease(*(CFTypeRef *)(a1 + 16));
      *(void *)(a1 + 16) = cf;
      cf = 0LL;
      *(_DWORD *)(a1 + 32) = (*(_DWORD *)(a1 + 32) | 1) + 2;
    }
  }

  pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
  if ((_BYTE)v9) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = v2;
  }
  if (v3)
  {
    IOSurfaceClientRemoveBulkAttachments(a1, 0x3FFFF);
  }

  else
  {
    io_connect_t v4 = _ioSurfaceConnectInternal(0);
    size_t v5 = IOConnectTrap2(v4, 8u, *(unsigned int *)(a1 + 136), (uintptr_t)&v10);
    if (v5) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "kIOSurfaceTrapRemoveCoreVideoBridgedValues failed: %08x\n", v5);
    }
  }

  if (cf) {
    CFRelease(cf);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
}

void insertKeyIfNotListedForRemoval(void *value, const void *a2, uint64_t a3)
{
  size_t v6 = *(__CFDictionary **)(a3 + 8);
  if (CFSetContainsValue(*(CFSetRef *)a3, value)) {
    *(_BYTE *)(a3 + 16) = 1;
  }
  else {
    CFDictionarySetValue(v6, value, a2);
  }
}

uint64_t IOSurfaceClientRemoveBulkAttachments(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 120);
  int v9 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t result = getDirtyMask(v4 + 48, (uint64_t)v8, a2);
  if (result)
  {
    if ((~a2 & 0x3FFFF) != 0) {
      uintptr_t v6 = result;
    }
    else {
      uintptr_t v6 = 0x3FFFFLL;
    }
    io_connect_t v7 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectTrap2(v7, 9u, *(unsigned int *)(a1 + 136), v6);
    if ((_DWORD)result) {
      return fprintf((FILE *)*MEMORY[0x1895F89D0], "kIOSurfaceTrapRemoveBulkAttachments failed: %08x\n", result);
    }
  }

  return result;
}

uint64_t IOSurfaceClientRemoveValue(uint64_t a1, __CFString *key)
{
  kern_return_t v16;
  int v17;
  int v18;
  CFDictionaryRef v19;
  CFAllocatorRef v20;
  CFMutableDictionaryRef MutableCopy;
  CFDictionaryRef v22;
  CFAllocatorRef v23;
  __CFDictionary *v24;
  const void *v25;
  CFAllocatorRef v26;
  const void *v27;
  size_t v28;
  int outputStruct;
  uint64_t v30;
  v30 = *MEMORY[0x1895F89C0];
  v28 = 4LL;
  if (key)
  {
    uint64_t v4 = _sniffKeysToMask(key);
    if (v4) {
      return IOSurfaceClientRemoveBulkAttachments(a1, (int)v4);
    }
    uintptr_t v6 = (pthread_mutex_t *)(a1 + 40);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
    uint64_t v10 = *(const __CFDictionary **)(a1 + 16);
    if ((!v10 || !CFDictionaryGetValue(v10, key)) && *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(void *)(a1 + 120) + 32LL)) {
      return pthread_mutex_unlock(v6);
    }
    ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, key, 0x8000100u, 0);
    if (!ExternalRepresentation)
    {
      int v9 = 0LL;
      goto LABEL_35;
    }

    BOOL v12 = ExternalRepresentation;
    size_t Length = CFDataGetLength(ExternalRepresentation);
    size_t v8 = (Length + 13);
    int v9 = malloc(v8);
    *(_DWORD *)int v9 = *(_DWORD *)(a1 + 136);
    BytePtr = CFDataGetBytePtr(v12);
    memcpy(v9 + 12, BytePtr, Length);
    v9[Length + 12] = 0;
    CFRelease(v12);
  }

  else
  {
    IOSurfaceClientRemoveBulkAttachments(a1, 0x3FFFF);
    uintptr_t v6 = (pthread_mutex_t *)(a1 + 40);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
    io_connect_t v7 = *(const __CFDictionary **)(a1 + 16);
    if ((!v7 || !CFDictionaryGetCount(v7)) && *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(void *)(a1 + 120) + 32LL)) {
      return pthread_mutex_unlock(v6);
    }
    size_t v8 = 13LL;
    int v9 = malloc(0xDuLL);
    *(_DWORD *)int v9 = *(_DWORD *)(a1 + 136);
    v9[12] = 0;
  }

  mach_port_t v15 = _ioSurfaceConnectInternal(0);
  CFIndex v16 = IOConnectCallMethod(v15, 0xBu, 0LL, 0, v9, v8, 0LL, 0LL, &outputStruct, &v28);
  if (v16) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "kIOSurfaceMethodRemoveValue failed: %08x\n", v16);
  }
  v17 = *(_DWORD *)(a1 + 32);
  if (!v17) {
    goto LABEL_35;
  }
  CFTypeID v18 = (v17 | 1) + 2;
  if (outputStruct != v18) {
    goto LABEL_35;
  }
  *(_DWORD *)(a1 + 32) = v18;
  if (key)
  {
    if (!CFEqual(@"CreationProperties", key))
    {
      int v19 = *(const __CFDictionary **)(a1 + 16);
      char v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      if (v19) {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v19);
      }
      else {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      }
      v24 = MutableCopy;
      if (!CFEqual(key, @"IOSurfaceName") && !CFEqual(key, @"CreationProperties")) {
        CFDictionaryRemoveValue(v24, key);
      }
      __int128 v27 = *(const void **)(a1 + 16);
      if (v27) {
        CFRelease(v27);
      }
      v26 = v20;
LABEL_34:
      *(void *)(a1 + 16) = CFDictionaryCreateCopy(v26, v24);
      CFRelease(v24);
    }
  }

  else
  {
    v22 = *(const __CFDictionary **)(a1 + 16);
    if (v22)
    {
      v23 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      v24 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v22);
      CFDictionaryApplyFunction( *(CFDictionaryRef *)(a1 + 16),  (CFDictionaryApplierFunction)removeAllButNameAndCreation,  v24);
      v25 = *(const void **)(a1 + 16);
      if (v25) {
        CFRelease(v25);
      }
      v26 = v23;
      goto LABEL_34;
    }
  }

LABEL_35:
  free(v9);
  return pthread_mutex_unlock(v6);
}
}

void removeAllButNameAndCreation(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  if (a1 && !CFEqual(a1, @"IOSurfaceName") && !CFEqual(a1, @"CreationProperties")) {
    CFDictionaryRemoveValue(a3, a1);
  }
}

uint64_t IOSurfaceClientGetPropertyMaximum(const void *a1)
{
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow")) {
    return qword_18C44A028;
  }
  if (CFEqual(a1, @"IOSurfaceWidth") || CFEqual(a1, @"IOSurfacePlaneWidth")) {
    return qword_18C44A030;
  }
  if (CFEqual(a1, @"IOSurfaceHeight") || CFEqual(a1, @"IOSurfacePlaneHeight")) {
    return qword_18C44A038;
  }
  return 0LL;
}

uint64_t IOSurfaceClientGetPropertyAlignment(const void *a1)
{
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow"))
  {
    int v2 = HIDWORD(ioSurfaceLimits);
  }

  else
  {
    if (!CFEqual(a1, @"IOSurfaceOffset")
      && !CFEqual(a1, @"IOSurfacePlaneOffset")
      && !CFEqual(a1, @"IOSurfacePlaneBase"))
    {
      return 1;
    }

    int v2 = ioSurfaceLimits;
  }

  return (v2 + 1);
}

uint64_t IOSurfaceClientAlignProperty(const void *a1, uint64_t a2)
{
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow"))
  {
    int v4 = HIDWORD(ioSurfaceLimits);
    return (v4 + (_DWORD)a2) & ~v4;
  }

  if (CFEqual(a1, @"IOSurfaceOffset")
    || CFEqual(a1, @"IOSurfacePlaneOffset")
    || CFEqual(a1, @"IOSurfacePlaneBase"))
  {
    int v4 = ioSurfaceLimits;
    return (v4 + (_DWORD)a2) & ~v4;
  }

  return a2;
}

uint64_t IOSurfaceClientSetPurgeable(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  uint64_t v4 = *(unsigned int *)(a1 + 136);
  uint64_t output = 0LL;
  input[0] = v4;
  input[1] = a2;
  mach_port_t v5 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectCallMethod(v5, 0x14u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (a3) {
    *a3 = output;
  }
  return result;
}

uint64_t IOSurfaceClientSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  uint64_t input[3] = a4;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x15u, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  uint64_t input[3] = a4;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Cu, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 5u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  *a2 = *(unsigned __int8 *)(*(void *)(a1 + 120) + 106LL);
  return 0LL;
}

uint64_t IOSurfaceClientSetTiled(uint64_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 0x16u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientIsTiled(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 120) + 20LL);
}

uint64_t IOSurfaceClientGetTileFormat(uint64_t a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  uint32_t outputCnt = 1;
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v1, 0x19u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return output;
  }
}

unsigned int *IOSurfaceClientWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  size_t v14 = 3176LL;
  if (a3 > 1380401728)
  {
    if (a3 <= 1395864161)
    {
      if (a3 != 1380401729)
      {
        if (a3 == 1380410945)
        {
          int v7 = 16;
          goto LABEL_25;
        }

        if (a3 == 1380411457)
        {
          int v7 = 8;
          goto LABEL_25;
        }

        goto LABEL_31;
      }
    }

    else
    {
      if (a3 > 1395996212)
      {
        if (a3 == 1395996213) {
          goto LABEL_24;
        }
        int v6 = 1932866865;
        goto LABEL_23;
      }

      if (a3 != 1395864162)
      {
        int v6 = 1395995957;
        goto LABEL_23;
      }
    }

LABEL_18:
    int v7 = 4;
    goto LABEL_25;
  }

  if (a3 > 1278555444)
  {
    if (a3 <= 1279340599)
    {
      if (a3 != 1278555445)
      {
        int v6 = 1278555701;
        goto LABEL_23;
      }

LABEL_24:
      int v7 = 2;
      goto LABEL_25;
    }

    if (a3 == 1279340600) {
      goto LABEL_24;
    }
    int v6 = 1279342648;
LABEL_23:
    if (a3 == v6) {
      goto LABEL_24;
    }
    goto LABEL_31;
  }

  if (a3 == 875836468 || a3 == 892679473) {
    goto LABEL_24;
  }
  if (a3 == 1111970369) {
    goto LABEL_18;
  }
LABEL_31:
  int v7 = 1;
LABEL_25:
  uint64_t inputStruct = a6;
  int v17 = a1;
  int v18 = a2;
  int v19 = a3;
  int v20 = v7;
  int v21 = a4;
  int v22 = a5;
  mach_port_t v8 = _ioSurfaceConnectInternal(0);
  int v9 = 0LL;
  if (!IOConnectCallMethod(v8, 6u, 0LL, 0, &inputStruct, 0x20uLL, 0LL, 0LL, outputStruct, &v14))
  {
    uint64_t v10 = _ioSurfaceClientCreateWithLockResult(outputStruct);
    if (v10)
    {
      int v9 = (unsigned int *)v10;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v9);
      pthread_mutex_unlock(&_iosCacheMutex);
    }

    else
    {
      uintptr_t v11 = outputStruct[6];
      io_connect_t v12 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v12, 5u, v11);
      return 0LL;
    }
  }

  return v9;
}

  uint64_t v10 = 0LL;
  HIDWORD(v10) = *(_DWORD *)(a2 + 88);
  xpc_dictionary_set_data(v6, "ContentLightLevelInfo", &v10, 8uLL);
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((a3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }

unsigned int *IOSurfaceClientWrapClientMemory(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  size_t v8 = 3176LL;
  input[0] = a1;
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  BOOL v3 = 0LL;
  if (!IOConnectCallMethod(v2, 7u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v8))
  {
    mach_port_t v4 = _ioSurfaceClientCreateWithLockResult(outputStruct);
    if (v4)
    {
      BOOL v3 = (unsigned int *)v4;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v3);
      pthread_mutex_unlock(&_iosCacheMutex);
    }

    else
    {
      uintptr_t v5 = outputStruct[6];
      io_connect_t v6 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v6, 5u, v5);
      return 0LL;
    }
  }

  return v3;
}

uint64_t IOSurfaceClientCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v2, 0x23u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return output;
  }
}

uint64_t IOSurfaceClientCreateMachPort(uint64_t a1)
{
  return IOSurfaceClientCreateMachPortWithOptions(a1, 0LL);
}

unsigned int *IOSurfaceClientLookupFromMachPort(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  _ioSurfaceConnectInternal(0);
  pthread_mutex_lock(&_iosCacheMutex);
  size_t v9 = 3176LL;
  uint64_t input = a1;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  BOOL v3 = 0LL;
  if (!IOConnectCallMethod(v2, 0x22u, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v9))
  {
    if (*(void *)outputStruct == -1LL)
    {
      if (_iosCacheDict)
      {
        Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)key);
        BOOL v3 = Value;
        if (Value) {
          ++*Value;
        }
      }

      else
      {
        BOOL v3 = 0LL;
      }
    }

    else
    {
      uintptr_t v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult(outputStruct);
      BOOL v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }

      else
      {
        uintptr_t v7 = key;
        io_connect_t v8 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v8, 5u, v7);
      }

      if (*MEMORY[0x1895F8A20]) {
        ((void (*)(uint64_t, void, uint64_t, void, void, void))*MEMORY[0x1895F8A20])( 1476395024LL,  *MEMORY[0x1895FBBE0],  v13,  0LL,  *(void *)outputStruct,  0LL);
      }
    }
  }

  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

uint64_t IOSurfaceClientSetSurfaceNotify(mach_port_t a1, uint64_t a2, uint64_t a3)
{
  reference[8] = *MEMORY[0x1895F89C0];
  inputStruct[0] = a2;
  inputStruct[1] = a3;
  reference[1] = a2;
  reference[2] = a3;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallAsyncMethod(v4, 0x11u, a1, reference, 3u, 0LL, 0, inputStruct, 0x18uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientRemoveSurfaceNotify(uint64_t a1)
{
  void inputStruct[3] = *MEMORY[0x1895F89C0];
  inputStruct[0] = 0LL;
  inputStruct[1] = a1;
  inputStruct[2] = 0LL;
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x12u, 0LL, 0, inputStruct, 0x18uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientIncrementUseCount(uint64_t a1)
{
  return IOSurfaceClientIncrementUseCountForCategory(a1, 0);
}

uint64_t IOSurfaceClientIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  if (a2 >= 2) {
    uint64_t result = [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"category out of range"];
  }
  if (*(_BYTE *)(v3 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceIncrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSur faceProhibitUseCount.",  (const void *)v3);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v14) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    abort();
  }

  mach_port_t v4 = (unint64_t *)(v3 + 8);
  do
  {
    while (1)
    {
      unint64_t v5 = *v4;
      unint64_t v6 = HIDWORD(*v4);
      unint64_t v7 = *v4 & 0xFFFFFFFF00000000LL;
      unint64_t v8 = v7 + 0x100000000LL;
      if ((_DWORD)v6 == -1) {
        unint64_t v8 = 0xFFFFFFFF00000000LL;
      }
      unint64_t v9 = v8 & 0xFFFFFFFF00000000LL | *v4;
      uint64_t v10 = (v5 + 1);
      if ((_DWORD)v5 == -1) {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      unint64_t v11 = v10 | v7;
      if (a2) {
        unint64_t v11 = v9;
      }
      else {
        LODWORD(v6) = *v4;
      }
      unint64_t v12 = __ldxr(v4);
      if (v12 == v5) {
        break;
      }
      __clrex();
    }
  }

  while (__stxr(v11, v4));
  if (!(_DWORD)v6)
  {
    io_connect_t v13 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectTrap2(v13, 0, *(unsigned int *)(v3 + 136), a2);
    if ((_DWORD)result) {
      return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "kIOSurfaceMethodIncrementUseCountForCategory failed: %08x\n",  result);
    }
  }

  return result;
}

uint64_t IOSurfaceClientDecrementUseCount(uint64_t a1)
{
  return IOSurfaceClientDecrementUseCountForCategory(a1, 0);
}

uint64_t IOSurfaceClientDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  if (a2 >= 2) {
    uint64_t result = [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"category out of range"];
  }
  if (*(_BYTE *)(v3 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceDecrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSur faceProhibitUseCount.",  (const void *)v3);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v10) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    abort();
  }

  mach_port_t v4 = (unint64_t *)(v3 + 8);
  do
  {
    while (1)
    {
      unint64_t v5 = *v4;
      unint64_t v6 = HIDWORD(*v4);
      unint64_t v7 = (v5 - (*v4 != 0)) | v5 & 0xFFFFFFFF00000000LL;
      if (a2) {
        unint64_t v7 = *v4 | ((unint64_t)(v6 - ((_DWORD)v6 != 0)) << 32);
      }
      else {
        LODWORD(v6) = *v4;
      }
      unint64_t v8 = __ldxr(v4);
      if (v8 == v5) {
        break;
      }
      __clrex();
    }
  }

  while (__stxr(v7, v4));
  if ((_DWORD)v6 == 1)
  {
    io_connect_t v9 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectTrap2(v9, 1u, *(unsigned int *)(v3 + 136), a2);
    if ((_DWORD)result) {
      return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "kIOSurfaceMethodDecrementUseCountForCategory failed: %08x\n",  result);
    }
  }

  return result;
}

uint64_t IOSurfaceClientGetUseCount(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceGetUseCount: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.",  (const void *)a1);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v2) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    abort();
  }

  return (HIDWORD(*(void *)(a1 + 8)) + *(void *)(a1 + 8));
}

BOOL IOSurfaceClientIsInUse(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceIsInUse: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.",  (const void *)a1);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v2) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    abort();
  }

  return *(void *)(*(void *)(a1 + 120) + 24LL) != 0LL;
}

BOOL IOSurfaceClientIsInUseForCategory(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"category out of range"];
  }
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceIsInUseForCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.",  (const void *)a1);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v6) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    abort();
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 120) + 24LL);
  if (a2) {
    LODWORD(v4) = HIDWORD(*(void *)(*(void *)(a1 + 120) + 24LL));
  }
  return (_DWORD)v4 != 0;
}

BOOL IOSurfaceClientIsInUseForAnyOtherCategory(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"category out of range"];
  }
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf( crashMessage,  0x100uLL,  "IOSurfaceIsInUseForAnyOtherCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfac eProhibitUseCount.",  (const void *)a1);
    qword_18C54F4D0 = (uint64_t)crashMessage;
    BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v6) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    abort();
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 120) + 24LL);
  if (a2 != 1) {
    LODWORD(v4) = HIDWORD(*(void *)(*(void *)(a1 + 120) + 24LL));
  }
  return (_DWORD)v4 != 0;
}

uint64_t IOSurfaceClientGetProhibitUseCount(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 221);
}

uint64_t IOSurfaceClientAllowsPixelSizeCasting(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 120) + 44LL);
}

uint64_t IOSurfaceClientSignalEvent(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Au, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceClientSetTimestamp(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  values[2] = *(void **)MEMORY[0x1895F89C0];
  uint64_t result = 3758097090LL;
  if (a2 && a3)
  {
    values[0] = a2;
    values[1] = a3;
    CFArrayRef v7 = CFArrayCreate(0LL, (const void **)values, 2LL, MEMORY[0x189605228]);
    if (v7)
    {
      CFArrayRef v8 = v7;
      uint64_t v9 = IOCFSerialize(v7, 1uLL);
      CFRelease(v8);
      if (v9)
      {
        size_t Length = CFDataGetLength(v9);
        uint64_t v11 = malloc(Length + 16);
        *(_DWORD *)uint64_t v11 = *(_DWORD *)(a1 + 136);
        v11[1] = a4;
        BytePtr = CFDataGetBytePtr(v9);
        memcpy(v11 + 2, BytePtr, Length);
        mach_port_t v13 = _ioSurfaceConnectInternal(0);
        IOConnectCallMethod(v13, 0x18u, 0LL, 0, v11, Length + 16, 0LL, 0LL, 0LL, 0LL);
        free(v11);
        CFRelease(v9);
      }

      return 0LL;
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t getDirtyMask(uint64_t a1, uint64_t a2, int a3)
{
  if ((a3 & 1) != 0)
  {
    uint64_t v3 = *(void *)a2 != *(void *)a1
      || *(void *)(a2 + 8) != *(void *)(a1 + 8)
      || *(void *)(a2 + 16) != *(void *)(a1 + 16)
      || *(void *)(a2 + 24) != *(void *)(a1 + 24);
    if ((a3 & 2) == 0) {
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    if ((a3 & 2) == 0) {
      goto LABEL_19;
    }
  }

  if (*(_OWORD *)(a2 + 32) != *(_OWORD *)(a1 + 32)) {
    v3 |= 2uLL;
  }
LABEL_19:
  if ((a3 & 4) != 0)
  {
    if (*(void *)(a2 + 48) != *(void *)(a1 + 48)) {
      v3 |= 4uLL;
    }
    if ((a3 & 8) == 0)
    {
LABEL_21:
      if ((a3 & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_44;
    }
  }

  else if ((a3 & 8) == 0)
  {
    goto LABEL_21;
  }

  if ((a3 & 0x10) == 0)
  {
LABEL_22:
    if ((a3 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }

LABEL_44:
  if ((a3 & 0x20) == 0)
  {
LABEL_23:
    if ((a3 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }

LABEL_47:
  if ((a3 & 0x40) == 0)
  {
LABEL_24:
    if ((a3 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }

LABEL_50:
  if ((a3 & 0x80) == 0)
  {
LABEL_25:
    if ((a3 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }

LABEL_53:
  if ((a3 & 0x100) == 0)
  {
LABEL_26:
    if ((a3 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }

LABEL_56:
  if ((a3 & 0x200) == 0)
  {
LABEL_27:
    if ((a3 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }

LABEL_59:
  if ((a3 & 0x400) == 0)
  {
LABEL_28:
    if ((a3 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }

LABEL_62:
  if ((a3 & 0x800) == 0)
  {
LABEL_29:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }

LABEL_65:
  if (*(void *)(a2 + 64) ^ *(void *)(a1 + 64) | *(void *)(a2 + 72) ^ *(void *)(a1 + 72) | *(void *)(a2 + 80) ^ *(void *)(a1 + 80)) {
    v3 |= 0x800uLL;
  }
  if ((a3 & 0x1000) == 0)
  {
LABEL_30:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_71;
  }

LABEL_68:
  if (*(_DWORD *)(a2 + 88) != *(_DWORD *)(a1 + 88)) {
    v3 |= 0x1000uLL;
  }
  if ((a3 & 0x2000) == 0)
  {
LABEL_31:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_74;
  }

LABEL_71:
  if (*(void *)(a2 + 92) != *(void *)(a1 + 92)) {
    v3 |= 0x2000uLL;
  }
  if ((a3 & 0x4000) == 0)
  {
LABEL_32:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }

LABEL_74:
  if ((a3 & 0x8000) == 0)
  {
LABEL_33:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_80;
  }

LABEL_77:
  if (*(void *)(a2 + 104) != *(void *)(a1 + 104)) {
    v3 |= 0x8000uLL;
  }
  if ((a3 & 0x10000) == 0)
  {
LABEL_34:
    if ((a3 & 0x20000) == 0) {
      return v3;
    }
    goto LABEL_35;
  }

LABEL_80:
  if (*(_DWORD *)(a2 + 112) != *(_DWORD *)(a1 + 112)) {
    v3 |= 0x10000uLL;
  }
  if ((a3 & 0x20000) != 0)
  {
LABEL_35:
  }

  return v3;
}

uint64_t IOSurfaceClientGetBulkAttachments(uint64_t a1, void *__dst, size_t *a3)
{
  uint64_t v3 = 3758097090LL;
  if (__dst)
  {
    if (a3)
    {
      size_t v4 = *a3;
      uint64_t v3 = 3758097084LL;
      if (v4 <= 0x74)
      {
        memcpy(__dst, (const void *)(*(void *)(a1 + 120) + 48LL), v4);
        return 0LL;
      }
    }
  }

  return v3;
}

uint64_t IOSurfaceClientGetProtectionOptions(uint64_t a1)
{
  return *(void *)(a1 + 240);
}

BOOL IOSurfaceClientSupportsProtectionOptions(uint64_t a1, uint64_t a2)
{
  return (a2 & ~*(void *)(a1 + 240)) == 0;
}

BOOL IOSurfaceClientIsDisplayable(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 120) + 45LL) != 0;
}

BOOL IOSurfaceClientIsSysMemOnly(uint64_t a1)
{
  return *(_BYTE *)(*(void *)(a1 + 120) + 46LL) != 0;
}

uint64_t IOSurfaceClientGetNumberOfComponentsOfPlane(uint64_t a1, unint64_t a2)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 300);
  }
}

uint64_t IOSurfaceClientGetNameOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 312);
  }
}

uint64_t IOSurfaceClientGetTypeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 316);
  }
}

uint64_t IOSurfaceClientGetRangeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 320);
  }
}

uint64_t IOSurfaceClientGetBitDepthOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 304);
  }
}

uint64_t IOSurfaceClientGetBitOffsetOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 308);
  }
}

uint64_t IOSurfaceClientGetSubsampling(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 220);
}

uint64_t IOSurfaceClientGetCompressionTypeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152LL * a2 + 356);
  }
}

uint64_t IOSurfaceClientGetCompressionFootprintOfPlane(uint64_t a1, unint64_t a2)
{
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 364);
  }
}

uint64_t IOSurfaceClientGetCompressedTileWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 324);
  }
}

uint64_t IOSurfaceClientGetCompressedTileHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 328);
  }
}

uint64_t IOSurfaceClientGetBytesPerTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 368);
  }
}

uint64_t IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 340);
  }
}

uint64_t IOSurfaceClientGetWidthInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 344);
  }
}

uint64_t IOSurfaceClientGetHeightInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 348);
  }
}

uint64_t IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int16 *)(a1 + 152LL * a2 + 360);
  }
}

uint64_t IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int16 *)(a1 + 152LL * a2 + 362);
  }
}

uint64_t IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 372);
  }
}

uint64_t IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(a1 + 152LL * a2 + 352);
  }
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152LL * a2 + 220);
  }
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152LL * a2 + 224);
  }
}

uint64_t IOSurfaceClientGetHTPCPredictionSelectorOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152LL * a2 + 357);
  }
}

uint64_t IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152LL * a2 + 358);
  }
}

uint64_t IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane( uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t result = 3758097090LL;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    input[0] = *(unsigned int *)(a1 + 136);
    input[1] = a2;
    uint64_t input[2] = a3;
    mach_port_t v5 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v5, 0x1Fu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 3758097090LL;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    uint64_t result = 0LL;
    *a3 = *(unsigned int *)(*(void *)(a1 + 120) + 4LL * a2 + 164);
  }

  return result;
}

uint64_t IOSurfaceClientGetAddressFormatOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152LL * a2 + 301);
  }
}

uint64_t IOSurfaceClientGetSliceCount(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 228);
  if (v1 <= 1) {
    return 1LL;
  }
  else {
    return v1;
  }
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane( uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 112)
  }
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane( uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 112)
  }
}

uint64_t IOSurfaceClientGetExtendedPixelsOfPlane( uint64_t result, unsigned int a2, void *a3, void *a4, void *a5, void *a6)
{
  if (!a2 || *(_DWORD *)(result + 200) > a2)
  {
    BOOL v6 = (unsigned int *)(result + 152LL * a2);
    *a3 = v6[98];
    *a4 = v6[96];
    *a5 = v6[99];
    *a6 = v6[97];
  }

  return result;
}

uint64_t IOSurfaceClientSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  if (a2 <= 4)
  {
    if (byte_18C44A040)
    {
      *(void *)(*(void *)(result + 128) + 8 * a2) = a3;
    }

    else
    {
      input[0] = *(unsigned int *)(result + 136);
      input[1] = a2;
      uint64_t input[2] = a3;
      mach_port_t v3 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v3, 0x21u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  return result;
}

uint64_t IOSurfaceClientGetIndexedTimestamp(uint64_t a1, unint64_t a2)
{
  if (a2 > 4) {
    return 0LL;
  }
  else {
    return *(void *)(*(void *)(a1 + 128) + 8 * a2);
  }
}

uint64_t IOSurfaceClientInitDetachModeCode(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (byte_18C44A040)
  {
    uint64_t v1 = *(void *)(a1 + 128);
    *(void *)(v1 + 40) = 0xFFFFFFFFFFFFLL;
    uint64_t result = mach_absolute_time();
    *(void *)(v1 + 16) = result;
  }

  else
  {
    uint64_t input = *(unsigned int *)(a1 + 136);
    __int128 v5 = xmmword_1811D0410;
    uint64_t v6 = mach_absolute_time();
    mach_port_t v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, &input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t IOSurfaceClientSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  if (byte_18C44A040)
  {
    *(void *)(*(void *)(result + 128) + 40LL) = *(void *)(*(void *)(result + 128) + 40LL) & ~a2 | a3 & a2;
  }

  else
  {
    input[0] = *(unsigned int *)(result + 136);
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = 0LL;
    mach_port_t v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t IOSurfaceClientGetDetachModeCode(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 128) + 40LL);
}

uint64_t IOSurfaceClientGetRegistryID(uint64_t a1)
{
  return **(void **)(a1 + 120);
}

uint64_t IOSurfaceClientGetTraceID(uint64_t a1)
{
  return *(void *)(a1 + 232);
}

uint64_t IOSurfaceClientSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t result = 3758097090LL;
  uint64_t v8 = *(void *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  if ((!a3 || a4) && a2 <= 4 && a3 <= 0x400)
  {
    if (a3 || a4 || ((*(unsigned __int8 *)(v8 + 47) >> a2) & 1) != 0)
    {
      mach_port_t v9 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v9, 0x32u, input, 2u, a4, a3, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t IOSurfaceClientGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, void *a4, void *a5)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  size_t v14 = a3;
  uint64_t output = 0LL;
  uint64_t v16 = 0LL;
  uint32_t outputCnt = 2;
  if (a3) {
    BOOL v6 = a5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  char v7 = v6;
  uint64_t result = 3758097090LL;
  if (a2 <= 4 && (v7 & 1) == 0)
  {
    if (((*(unsigned __int8 *)(v5 + 47) >> a2) & 1) == 0)
    {
      uint64_t v12 = 0LL;
      uint64_t result = 0LL;
      goto LABEL_14;
    }

    mach_port_t v11 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectCallMethod(v11, 0x33u, input, 2u, 0LL, 0LL, &output, &outputCnt, a5, &v14);
    if (!(_DWORD)result)
    {
      uint64_t result = output;
      if (a4)
      {
        uint64_t v12 = v16;
LABEL_14:
        *a4 = v12;
      }
    }
  }

  return result;
}

uint64_t IOSurfaceClientHasDataProperty(uint64_t a1, unsigned int a2)
{
  if (a2 <= 4) {
    return (*(unsigned __int8 *)(*(void *)(a1 + 120) + 47LL) >> a2) & 1;
  }
  else {
    return 0LL;
  }
}

uint64_t IOSurfaceClientClearDataProperties(uint64_t a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(*(void *)(a1 + 120) + 47LL)) {
    return 0LL;
  }
  input[0] = *(unsigned int *)(a1 + 136);
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x34u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

BOOL IOSurfaceClientIsMetalSharedTexture(uint64_t a1)
{
  return *(_BYTE *)(a1 + 222) != 0;
}

uint64_t IOSurfaceClientGetWiringAssertionCount(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 120) + 36LL);
}

void serializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v5 = (const void *)serializeReplacementIOKitTypeRef(a2);
  CFDictionarySetValue(a3, a1, v5);
  CFRelease(v5);
}

void serializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  mach_port_t v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFArrayAppendValue(a2, v3);
  CFRelease(v3);
}

void serializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  mach_port_t v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFSetAddValue(a2, v3);
  CFRelease(v3);
}

CFNumberRef unserializeReplacementIOKitTypeRef(const void *a1, const void *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID())
  {
    CFTypeID v13 = CFGetTypeID(a1);
    if (v13 == CFArrayGetTypeID())
    {
      size_t v14 = CFGetAllocator(a1);
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(v14, Count, MEMORY[0x189605228]);
      v31.length = CFArrayGetCount((CFArrayRef)a1);
      v31.location = 0LL;
      CFArrayApplyFunction((CFArrayRef)a1, v31, (CFArrayApplierFunction)unserializeReplacementArrayValues, Mutable);
      uint64_t v17 = CFGetAllocator(a1);
      CFArrayRef Copy = CFArrayCreateCopy(v17, Mutable);
    }

    else
    {
      CFTypeID v25 = CFGetTypeID(a1);
      if (v25 != CFSetGetTypeID()) {
        return (CFNumberRef)CFRetain(a1);
      }
      v26 = CFGetAllocator(a1);
      CFIndex v27 = CFSetGetCount((CFSetRef)a1);
      CFMutableArrayRef Mutable = CFSetCreateMutable(v26, v27, MEMORY[0x189605258]);
      CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)unserializeReplacementSetValues, Mutable);
      v28 = CFGetAllocator(a1);
      CFArrayRef Copy = CFSetCreateCopy(v28, Mutable);
    }

    CFDictionaryRef v23 = Copy;
    CFMutableArrayRef v24 = Mutable;
LABEL_15:
    CFRelease(v24);
    return v23;
  }

  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"iokit-float");
  if (!Value) {
    goto LABEL_9;
  }
  BOOL v6 = Value;
  CFIndex Length = CFDataGetLength(Value);
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 != CFDataGetTypeID()) {
    goto LABEL_9;
  }
  if (Length == 8)
  {
    CFAllocatorRef v30 = CFGetAllocator(a1);
    BytePtr = CFDataGetBytePtr(v6);
    mach_port_t v11 = v30;
    CFNumberType v12 = kCFNumberDoubleType;
    return CFNumberCreate(v11, v12, BytePtr);
  }

  if (Length != 4)
  {
LABEL_9:
    uint64_t v19 = CFGetAllocator(a1);
    CFIndex v20 = CFDictionaryGetCount((CFDictionaryRef)a1);
    CFMutableDictionaryRef v21 = CFDictionaryCreateMutable(v19, v20, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)unserializeReplacementDictionaryKeysAndValues,  v21);
    if (a2) {
      CFDictionarySetValue(v21, @"CreationProperties", a2);
    }
    int v22 = CFGetAllocator(a1);
    CFDictionaryRef v23 = CFDictionaryCreateCopy(v22, v21);
    CFMutableArrayRef v24 = v21;
    goto LABEL_15;
  }

  CFAllocatorRef v9 = CFGetAllocator(a1);
  BytePtr = CFDataGetBytePtr(v6);
  mach_port_t v11 = v9;
  CFNumberType v12 = kCFNumberFloatType;
  return CFNumberCreate(v11, v12, BytePtr);
}

void unserializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v5 = (const void *)unserializeReplacementIOKitTypeRef(a2, 0LL);
  Value = CFDictionaryGetValue((CFDictionaryRef)_creationPropertiesDict, a1);
  if (Value) {
    char v7 = Value;
  }
  else {
    char v7 = a1;
  }
  CFDictionarySetValue(a3, v7, v5);
  CFRelease(v5);
}

void unserializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  mach_port_t v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0LL);
  CFArrayAppendValue(a2, v3);
  CFRelease(v3);
}

void unserializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  mach_port_t v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0LL);
  CFSetAddValue(a2, v3);
  CFRelease(v3);
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t IOSurfaceAcceleratorGetTypeID()
{
  mach_port_t v0 = (uint64_t (*)(void))off_18C449E48;
  if (!off_18C449E48)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    mach_port_t v0 = (uint64_t (*)(void))off_18C449E48;
    if (!off_18C449E48) {
      abort();
    }
  }

  return v0();
}

uint64_t IOSurfaceAcceleratorGetServiceObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_18C449E58;
  if (!off_18C449E58)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_18C449E58;
    if (!off_18C449E58) {
      abort();
    }
  }

  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_18C449E68;
  if (!off_18C449E68)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_18C449E68;
    if (!off_18C449E68) {
      abort();
    }
  }

  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorGetID(uint64_t a1, uint64_t a2)
{
  CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449E78;
  if (!off_18C449E78)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449E78;
    if (!off_18C449E78) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_18C449E88;
  if (!off_18C449E88)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_18C449E88;
    if (!off_18C449E88) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorConfigurePerformanceStats(uint64_t a1, uint64_t a2)
{
  CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449E98;
  if (!off_18C449E98)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449E98;
    if (!off_18C449E98) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetStatistics(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_18C449EA8;
  if (!off_18C449EA8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_18C449EA8;
    if (!off_18C449EA8) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransformSurface( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EB8;
  if (!off_18C449EB8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EB8;
    if (!off_18C449EB8) {
      abort();
    }
  }

  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOSurfaceAcceleratorTransferSurface( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  size_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EC8;
  if (!off_18C449EC8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    size_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EC8;
    if (!off_18C449EC8) {
      abort();
    }
  }

  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorAbortTransfers(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_18C449ED8;
  if (!off_18C449ED8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_18C449ED8;
    if (!off_18C449ED8) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransferSurfaceWithSwap( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F08;
  if (!off_18C449F08)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F08;
    if (!off_18C449F08) {
      abort();
    }
  }

  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorConditionalTransferSurfaceWithSwap( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  size_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F18;
  if (!off_18C449F18)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    size_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F18;
    if (!off_18C449F18) {
      abort();
    }
  }

  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorBlitSurface( uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F28;
  if (!off_18C449F28)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F28;
    if (!off_18C449F28) {
      abort();
    }
  }

  __int128 v21 = *a3;
  uint64_t v22 = *((void *)a3 + 2);
  __int128 v19 = *a5;
  uint64_t v20 = *((void *)a5 + 2);
  return v17(a1, a2, &v21, a4, &v19, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorBlitSurfaceWithSwap( uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v19 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_18C449F38;
  if (!off_18C449F38)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    __int128 v19 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_18C449F38;
    if (!off_18C449F38) {
      abort();
    }
  }

  __int128 v23 = *a3;
  uint64_t v24 = *((void *)a3 + 2);
  __int128 v21 = *a5;
  uint64_t v22 = *((void *)a5 + 2);
  return v19(a1, a2, &v23, a4, &v21, a6, a7, a8, a9, a10, a11);
}

uint64_t IOSurfaceAcceleratorAbortCaptures(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_18C449F48;
  if (!off_18C449F48)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_18C449F48;
    if (!off_18C449F48) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorCaptureSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F58;
  if (!off_18C449F58)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449F58;
    if (!off_18C449F58) {
      abort();
    }
  }

  return v10(a1, a2, a3, a4, a5);
}

uint64_t IOSurfaceAcceleratorSetFilterCoefficients(uint64_t a1, uint64_t a2)
{
  CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449EE8;
  if (!off_18C449EE8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    CFTypeID v4 = (uint64_t (*)(uint64_t, uint64_t))off_18C449EE8;
    if (!off_18C449EE8) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorSetCustomFilter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EF8;
  if (!off_18C449EF8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_18C449EF8;
    if (!off_18C449EF8) {
      abort();
    }
  }

  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

char *_iosaLookupStubs()
{
  mach_port_t v0 = dlopen("/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/IOSurfaceAccelerator", 1);
  if (v0)
  {
    mach_port_t v1 = v0;
    uint64_t v2 = 0LL;
    mach_port_t v3 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      uint64_t result = (char *)dlsym(v1, (&iosa_Stubs)[v2]);
      (&iosa_Stubs)[v2 + 1] = result;
      if (!result)
      {
        uint64_t v5 = *v3;
        BOOL v6 = dlerror();
        uint64_t result = (char *)fprintf(v5, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 174, v6);
      }

      v2 += 2LL;
    }

    while (v2 != 36);
  }

  else
  {
    char v7 = (FILE *)*MEMORY[0x1895F89D0];
    CFTypeID v8 = dlerror();
    return (char *)fprintf(v7, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 160, v8);
  }

  return result;
}

uint64_t IOSurfaceSharedEventGetTypeID()
{
  return objc_opt_self();
}

IOSurfaceSharedEvent *IOSurfaceSharedEventCreate()
{
  return objc_alloc_init(&OBJC_CLASS___IOSurfaceSharedEvent);
}

IOSurfaceSharedEvent *IOSurfaceSharedEventCreateWithMachPort(uint64_t a1)
{
  return -[IOSurfaceSharedEvent initWithMachPort:]( objc_alloc(&OBJC_CLASS___IOSurfaceSharedEvent),  "initWithMachPort:",  a1);
}

uint64_t IOSurfaceSharedEventNotifyEventListener( void *a1, void *a2, unsigned int a3, uint64_t a4, void *aBlock)
{
  uint64_t input[5] = *MEMORY[0x1895F89C0];
  CFAllocatorRef v9 = _Block_copy(aBlock);
  input[0] = a3;
  input[1] = (uint64_t)a1;
  uint64_t input[2] = (uint64_t)a2;
  uint64_t input[3] = (uint64_t)v9;
  uint64_t input[4] = a4;
  id v10 = a1;
  id v11 = a2;
  if (_iosEventBlockOnce != -1) {
    dispatch_once(&_iosEventBlockOnce, &__block_literal_global);
  }
  pthread_mutex_lock(&_iosEventBlockMutex);
  CFArrayAppendValue((CFMutableArrayRef)_iosEventBlockArray, v9);
  pthread_mutex_unlock(&_iosEventBlockMutex);
  mach_port_t v12 = _ioSurfaceConnect();
  uint64_t v13 = IOConnectCallMethod(v12, 0x27u, input, 5u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v13)
  {

    _iosRemoveEventBlock(v9);
  }

  return v13;
}

uint64_t IOSurfaceSharedEventAddEventListener(uint64_t a1, IONotificationPortRef notify)
{
  reference[8] = *MEMORY[0x1895F89C0];
  reference[1] = (uint64_t)_ioSurfaceEventNotificationCallback2;
  reference[2] = a1;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  if (!MachPort) {
    IOSurfaceSharedEventAddEventListener_cold_1();
  }
  mach_port_t v3 = MachPort;
  mach_port_t v4 = _ioSurfaceConnect();
  return IOConnectCallAsyncMethod(v4, 0x28u, v3, reference, 3u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOSurfaceSharedEventRemoveEventListener(uint64_t a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = _ioSurfaceConnect();
  return IOConnectCallMethod(v1, 0x29u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void _ioSurfaceEventNotificationCallback2(void *a1, int a2, void *a3)
{
  if (a2) {
    _ioSurfaceEventNotificationCallback2_cold_2();
  }
  mach_port_t v3 = (void (**)(void, void, void))*a3;
  if (!*a3) {
    _ioSurfaceEventNotificationCallback2_cold_1();
  }
  uint64_t v5 = (void *)a3[1];
  ((void (**)(void, void *, void))v3)[2](*a3, v5, a3[2]);

  _iosRemoveEventBlock(v3);
  _Block_release(v3);
}

uint64_t _iosRemoveEventBlock(const void *a1)
{
  uint64_t v2 = (const __CFArray *)_iosEventBlockArray;
  v5.length = CFArrayGetCount((CFArrayRef)_iosEventBlockArray);
  v5.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v5, a1);
  if (FirstIndexOfValue != -1) {
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)_iosEventBlockArray, FirstIndexOfValue);
  }
  return pthread_mutex_unlock(&_iosEventBlockMutex);
}

uint64_t IOSurfaceSignalEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return IOSurfaceClientSignalEvent(*(void *)(a1 + 8), [a2 eventPort], a3, a4);
}

CFMutableArrayRef ___iosAddEventBlock_block_invoke()
{
  CFMutableArrayRef result = CFArrayCreateMutable(0LL, 0LL, 0LL);
  _iosEventBlockArray = (uint64_t)result;
  return result;
}

void _ensureKeySniffDictionaries()
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
}

CFMutableDictionaryRef ___ensureKeySniffDictionaries_block_invoke()
{
  mach_port_t v0 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  _sniffKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceCleanAperture",  sniffCleanApertureKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfacePixelAspectRatio",  sniffPixelAspectRatioKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceGammaLevel",  sniffGammaLevelKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceFieldCount",  sniffFieldCountKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceFieldDetail",  sniffFieldDetailKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceYCbCrMatrix",  sniffYCbCrMatrixKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceColorPrimaries",  sniffColorPrimariesKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceTransferFunction",  sniffTransferFunctionKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceChromaLocationTopField",  sniffChromaLocationTopKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceChromaLocationBottomField",  sniffChromaLocationBottomKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceChromaSubsampling",  sniffChromaSubsamplingKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceEDRFactor",  sniffEDRFactorKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"MasteringDisplayColorVolume",  sniffMasteringDisplayColorVolumeKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"ContentLightLevelInfo",  sniffContentLightLevelInfoKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"AlphaChannelMode",  sniffAlphaChannelModeKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"SceneIllumination",  sniffSceneIlluminationKeyToStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysToStructDict,  @"IOSurfaceColorSpaceID",  sniffColorSpaceIDKeyToStruct);
  _sniffKeysMaskDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v0, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceCleanAperture", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfacePixelAspectRatio", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceGammaLevel", (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceFieldCount", (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceFieldDetail", (const void *)0x10);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceYCbCrMatrix", (const void *)0x20);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceColorPrimaries", (const void *)0x40);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"IOSurfaceTransferFunction",  (const void *)0x80);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"IOSurfaceChromaLocationTopField",  (const void *)0x100);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"IOSurfaceChromaLocationBottomField",  (const void *)0x200);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"IOSurfaceChromaSubsampling",  (const void *)0x400);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceEDRFactor", (const void *)0x2000);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"MasteringDisplayColorVolume",  (const void *)0x800);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"ContentLightLevelInfo", (const void *)0x1000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"AlphaChannelMode", (const void *)0x4000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"SceneIllumination", (const void *)0x10000);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffKeysMaskDict,  @"IOSurfaceColorSpaceID",  (const void *)0x20000);
  _sniffStructToKeysDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceCleanAperture",  createCleanApertureFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfacePixelAspectRatio",  createPixelAspectRatioFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceGammaLevel",  createGammaLevelFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceFieldCount",  createFieldCountFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceFieldDetail",  createFieldDetailFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceYCbCrMatrix",  createYCbCrMatrixFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceColorPrimaries",  createColorPrimariesFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceTransferFunction",  createTransferFunctionFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceChromaLocationTopField",  createChromaLocationTopFieldFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceChromaLocationBottomField",  createChromaLocationBottomFieldFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceChromaSubsampling",  createChromaSubsamplingFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceEDRFactor",  createEDRFactorFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"MasteringDisplayColorVolume",  createMasteringDisplayColorVolumeFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"ContentLightLevelInfo",  createContentLightLevelInfoFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"AlphaChannelMode",  createAlphaChannelModeFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"SceneIllumination",  createSceneIlluminationFromStruct);
  CFDictionarySetValue( (CFMutableDictionaryRef)_sniffStructToKeysDict,  @"IOSurfaceColorSpaceID",  createColorSpaceIDFromStruct);
  mach_port_t v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  _fieldDetailKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, @"TemporalTopFirst", (const void *)1);
  CFDictionarySetValue( (CFMutableDictionaryRef)_fieldDetailKeysToStructDict,  @"TemporalBottomFirst",  (const void *)6);
  CFDictionarySetValue( (CFMutableDictionaryRef)_fieldDetailKeysToStructDict,  @"SpatialFirstLineEarly",  (const void *)9);
  CFDictionarySetValue( (CFMutableDictionaryRef)_fieldDetailKeysToStructDict,  @"SpatialFirstLineLate",  (const void *)0xE);
  _yCbCrMatrixKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_601_4", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"SMPTE_240M_1995", (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"DCI_P3", (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"P3_D65", (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_2020", (const void *)9);
  CFDictionarySetValue( (CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict,  @"ITU_R_2100_ICtCp",  (const void *)0xE);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"IPT", (const void *)0xF8);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"Identity", (const void *)0xC8);
  _colorPrimariesKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"EBU_3213", (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"SMPTE_C", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"DCI_P3", (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"P3_D65", (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"JEDEC_P22", (const void *)0x16);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"ITU_R_2020", (const void *)9);
  _transferFunctionKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"ITU_R_2020", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"UseGamma", (const void *)2);
  CFDictionarySetValue( (CFMutableDictionaryRef)_transferFunctionKeysToStructDict,  @"SMPTE_240M_1995",  (const void *)7);
  CFDictionarySetValue( (CFMutableDictionaryRef)_transferFunctionKeysToStructDict,  @"SMPTE_ST_2084_PQ",  (const void *)0x10);
  CFDictionarySetValue( (CFMutableDictionaryRef)_transferFunctionKeysToStructDict,  @"SMPTE_ST_428_1",  (const void *)0x11);
  CFDictionarySetValue( (CFMutableDictionaryRef)_transferFunctionKeysToStructDict,  @"ITU_R_2100_HLG",  (const void *)0x12);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"IEC_sRGB", (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"sRGB", (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"Linear", (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"aYCC", (const void *)0xFF);
  _chromaLocationKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Left", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Center", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"TopLeft", (const void *)3);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Top", (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"BottomLeft", (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Bottom", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"DV 4:2:0", (const void *)7);
  _chromaSubsamplingKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:2:0", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:2:2", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:1:1", (const void *)3);
  _premultipliedAlphaKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, v1, 0LL);
  CFDictionarySetValue( (CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict,  @"PremultipliedAlpha",  (const void *)2);
  CFDictionarySetValue( (CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict,  @"StraightAlpha",  (const void *)1);
  _unrecognizedCodePointDispatchQueue = (uint64_t)dispatch_queue_create( "com.apple.iosurface.unrecognized-code-points",  0LL);
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  mach_port_t v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
  _stringsForUnrecognizedYCbCrMatrixCodePointsDict = (uint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL,  MEMORY[0x189605250]);
  _stringsForUnrecognizedColorPrimariesCodePointsDict = (uint64_t)CFDictionaryCreateMutable(v2, 0LL, 0LL, v3);
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(v2, 0LL, 0LL, v3);
  _stringsForUnrecognizedTransferFunctionCodePointsDict = (uint64_t)result;
  return result;
}

const void *_sniffKeysToMask(void *key)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  return CFDictionaryGetValue((CFDictionaryRef)_sniffKeysMaskDict, key);
}

void _sniffKeysToStruct(void *key, const void *a2, uint64_t a3)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  Value = (void (*)(const void *, uint64_t))CFDictionaryGetValue((CFDictionaryRef)_sniffKeysToStructDict, key);
  if (Value)
  {
    Value(a2, a3);
  }

  else
  {
    *(_BYTE *)(a3 + 128) = 1;
    if (a2)
    {
      CFMutableArrayRef Mutable = *(__CFDictionary **)(a3 + 136);
      if (!Mutable)
      {
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        *(void *)(a3 + 136) = Mutable;
      }

      CFDictionarySetValue(Mutable, key, a2);
    }
  }

uint64_t _copySniffKeyFromStruct(void *key, uint64_t a2, void *a3)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)_sniffStructToKeysDict, key);
  if (result)
  {
    *a3 = ((uint64_t (*)(uint64_t))result)(a2);
    return 1LL;
  }

  return result;
}

void _insertAllKeysFromStruct(const __CFDictionary *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  CFDictionaryRef CleanApertureFromStruct = createCleanApertureFromStruct((int *)a2);
  CFDictionaryRef PixelAspectRatioFromStruct = createPixelAspectRatioFromStruct((int *)a2);
  CFDictionaryRef value = CleanApertureFromStruct;
  CFDictionaryRef v41 = PixelAspectRatioFromStruct;
  uint64_t v7 = 1LL;
  if (CleanApertureFromStruct) {
    uint64_t v7 = 2LL;
  }
  if (PixelAspectRatioFromStruct) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = CleanApertureFromStruct != 0LL;
  }
  CFNumberRef GammaLevelFromStruct = createGammaLevelFromStruct(a2);
  if (GammaLevelFromStruct) {
    BOOL v9 = v8 + 1;
  }
  else {
    BOOL v9 = v8;
  }
  id v10 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (*(_BYTE *)(a2 + 56)) {
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt8Type, (const void *)(a2 + 56));
  }
  else {
    CFNumberRef v11 = 0LL;
  }
  mach_port_t v12 = 0LL;
  if (v11) {
    BOOL v13 = v9 + 1;
  }
  else {
    BOOL v13 = v9;
  }
  unsigned int v14 = *(unsigned __int8 *)(a2 + 57);
  if (v14 > 8)
  {
    if (v14 == 9)
    {
      uint64_t v15 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }

    else
    {
      if (v14 != 14) {
        goto LABEL_25;
      }
      uint64_t v15 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }

  else if (v14 == 1)
  {
    uint64_t v15 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }

  else
  {
    if (v14 != 6) {
      goto LABEL_25;
    }
    uint64_t v15 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }

  mach_port_t v12 = *v15;
LABEL_25:
  if (v12) {
    CFIndex v16 = v13 + 1;
  }
  else {
    CFIndex v16 = v13;
  }
  YCbCrMatrixFromStruct = createYCbCrMatrixFromStruct(a2);
  if (YCbCrMatrixFromStruct) {
    ++v16;
  }
  ColorPrimariesFromStruct = createColorPrimariesFromStruct(a2);
  if (ColorPrimariesFromStruct) {
    ++v16;
  }
  TransferFunctionFromStruct = createTransferFunctionFromStruct(a2);
  if (TransferFunctionFromStruct) {
    ++v16;
  }
  ChromaLocationTopFieldFromStruct = createChromaLocationTopFieldFromStruct(a2);
  if (ChromaLocationTopFieldFromStruct) {
    ++v16;
  }
  ChromaLocationBottomFieldFromStruct = createChromaLocationBottomFieldFromStruct(a2);
  if (ChromaLocationBottomFieldFromStruct) {
    CFIndex v21 = v16 + 1;
  }
  else {
    CFIndex v21 = v16;
  }
  int v22 = *(unsigned __int8 *)(a2 + 63);
  v50 = a3;
  switch(v22)
  {
    case 3:
      __int128 v23 = kIOSurfaceChromaSubsampling_411;
      goto LABEL_45;
    case 2:
      __int128 v23 = kIOSurfaceChromaSubsampling_422;
      goto LABEL_45;
    case 1:
      __int128 v23 = kIOSurfaceChromaSubsampling_420;
LABEL_45:
      uint64_t v24 = *v23;
      goto LABEL_47;
  }

  uint64_t v24 = 0LL;
LABEL_47:
  v42 = v24;
  if (v24) {
    CFIndex v25 = v21 + 1;
  }
  else {
    CFIndex v25 = v21;
  }
  CFNumberRef EDRFactorFromStruct = createEDRFactorFromStruct(a2);
  if (EDRFactorFromStruct) {
    ++v25;
  }
  CFDataRef MasteringDisplayColorVolumeFromStruct = createMasteringDisplayColorVolumeFromStruct(a2);
  if (MasteringDisplayColorVolumeFromStruct) {
    ++v25;
  }
  CFDataRef ContentLightLevelInfoFromStruct = createContentLightLevelInfoFromStruct(a2);
  if (ContentLightLevelInfoFromStruct) {
    CFIndex v27 = v25 + 1;
  }
  else {
    CFIndex v27 = v25;
  }
  int v28 = *(unsigned __int8 *)(a2 + 100);
  if (v28 == 1)
  {
    size_t v29 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    goto LABEL_61;
  }

  if (v28 == 2)
  {
    size_t v29 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
LABEL_61:
    CFAllocatorRef v30 = *v29;
    goto LABEL_63;
  }

  CFAllocatorRef v30 = 0LL;
LABEL_63:
  v47 = v30;
  if (v30) {
    CFIndex v31 = v27 + 1;
  }
  else {
    CFIndex v31 = v27;
  }
  CFNumberRef SceneIlluminationFromStruct = createSceneIlluminationFromStruct(a2);
  if (SceneIlluminationFromStruct) {
    ++v31;
  }
  int valuePtr = *(unsigned __int8 *)(a2 + 101);
  if (valuePtr) {
    CFNumberRef v32 = CFNumberCreate(*v10, kCFNumberSInt32Type, &valuePtr);
  }
  else {
    CFNumberRef v32 = 0LL;
  }
  if (v32) {
    CFIndex v33 = v31 + 1;
  }
  else {
    CFIndex v33 = v31;
  }
  if (v33)
  {
    CFNumberRef v39 = v32;
    v34 = *v10;
    if (a1)
    {
      CFIndex Count = CFDictionaryGetCount(a1);
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v34, Count + v33, a1);
    }

    else
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v34, v33, MEMORY[0x189605240], MEMORY[0x189605250]);
    }

    v37 = MutableCopy;
    if (value)
    {
      CFDictionarySetValue(MutableCopy, @"IOSurfaceCleanAperture", value);
      CFRelease(value);
    }

    if (v41)
    {
      CFDictionarySetValue(v37, @"IOSurfacePixelAspectRatio", v41);
      CFRelease(v41);
    }

    if (GammaLevelFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceGammaLevel", GammaLevelFromStruct);
      CFRelease(GammaLevelFromStruct);
    }

    if (v11)
    {
      CFDictionarySetValue(v37, @"IOSurfaceFieldCount", v11);
      CFRelease(v11);
    }

    if (v12)
    {
      CFDictionarySetValue(v37, @"IOSurfaceFieldDetail", v12);
      CFRelease(v12);
    }

    if (YCbCrMatrixFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceYCbCrMatrix", YCbCrMatrixFromStruct);
      CFRelease(YCbCrMatrixFromStruct);
    }

    if (ColorPrimariesFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceColorPrimaries", ColorPrimariesFromStruct);
      CFRelease(ColorPrimariesFromStruct);
    }

    if (TransferFunctionFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceTransferFunction", TransferFunctionFromStruct);
      CFRelease(TransferFunctionFromStruct);
    }

    if (ChromaLocationTopFieldFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaLocationTopField", ChromaLocationTopFieldFromStruct);
      CFRelease(ChromaLocationTopFieldFromStruct);
    }

    if (ChromaLocationBottomFieldFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaLocationBottomField", ChromaLocationBottomFieldFromStruct);
      CFRelease(ChromaLocationBottomFieldFromStruct);
    }

    if (v42)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaSubsampling", v42);
      CFRelease(v42);
    }

    if (EDRFactorFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceEDRFactor", EDRFactorFromStruct);
      CFRelease(EDRFactorFromStruct);
    }

    if (MasteringDisplayColorVolumeFromStruct)
    {
      CFDictionarySetValue(v37, @"MasteringDisplayColorVolume", MasteringDisplayColorVolumeFromStruct);
      CFRelease(MasteringDisplayColorVolumeFromStruct);
    }

    v38 = v50;
    if (ContentLightLevelInfoFromStruct)
    {
      CFDictionarySetValue(v37, @"ContentLightLevelInfo", ContentLightLevelInfoFromStruct);
      CFRelease(ContentLightLevelInfoFromStruct);
    }

    if (v47)
    {
      CFDictionarySetValue(v37, @"AlphaChannelMode", v47);
      CFRelease(v47);
    }

    if (SceneIlluminationFromStruct)
    {
      CFDictionarySetValue(v37, @"SceneIllumination", SceneIlluminationFromStruct);
      CFRelease(SceneIlluminationFromStruct);
    }

    if (v39)
    {
      CFDictionarySetValue(v37, @"IOSurfaceColorSpaceID", v39);
      CFRelease(v39);
    }
  }

  else
  {
    if (a1) {
      v37 = (__CFDictionary *)CFRetain(a1);
    }
    else {
      v37 = 0LL;
    }
    v38 = v50;
  }

  *v38 = v37;
}

CFDictionaryRef createCleanApertureFromStruct(int *a1)
{
  values[4] = *(void **)MEMORY[0x1895F89C0];
  int v1 = a1[1];
  if (!v1) {
    return 0LL;
  }
  int v2 = a1[3];
  if (!v2) {
    return 0LL;
  }
  int v3 = a1[5];
  if (!v3) {
    return 0LL;
  }
  int v4 = a1[7];
  if (!v4) {
    return 0LL;
  }
  keys[0] = @"Width";
  keys[1] = @"Height";
  double v5 = (double)*a1 / (double)v1;
  double v14 = (double)a1[2] / (double)v2;
  double valuePtr = v5;
  double v6 = (double)a1[4] / (double)v3;
  int v7 = a1[6];
  keys[2] = @"HorizontalOffset";
  keys[3] = @"VerticalOffset";
  double v12 = (double)v7 / (double)v4;
  double v13 = v6;
  BOOL v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, &valuePtr);
  values[1] = CFNumberCreate(v8, kCFNumberDoubleType, &v14);
  values[2] = CFNumberCreate(v8, kCFNumberDoubleType, &v13);
  values[3] = CFNumberCreate(v8, kCFNumberDoubleType, &v12);
  CFDictionaryRef v9 = CFDictionaryCreate(v8, (const void **)keys, (const void **)values, 4LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  for (uint64_t i = 0LL; i != 4; ++i)
    CFRelease(values[i]);
  return v9;
}

CFDictionaryRef createPixelAspectRatioFromStruct(int *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v1 = a1[9];
  if (!v1) {
    return 0LL;
  }
  int v2 = a1[11];
  if (!v2) {
    return 0LL;
  }
  double v3 = (double)a1[8] / (double)v1;
  int v4 = a1[10];
  keys[0] = @"HorizontalSpacing";
  keys[1] = @"VerticalSpacing";
  double v8 = (double)v4 / (double)v2;
  double valuePtr = v3;
  double v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, &valuePtr);
  CFTypeRef cf = CFNumberCreate(v5, kCFNumberDoubleType, &v8);
  CFDictionaryRef v6 = CFDictionaryCreate( v5,  (const void **)keys,  (const void **)&values,  2LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFRelease(values);
  CFRelease(cf);
  return v6;
}

CFNumberRef createGammaLevelFromStruct(uint64_t a1)
{
  v3[1] = *(double *)MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 52);
  if (!v1) {
    return 0LL;
  }
  v3[0] = (double)*(int *)(a1 + 48) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, v3);
}

CFNumberRef createFieldCountFromStruct(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56)) {
    return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt8Type, (const void *)(a1 + 56));
  }
  else {
    return 0LL;
  }
}

__CFString *createFieldDetailFromStruct(uint64_t a1)
{
  uint64_t result = 0LL;
  int v3 = *(unsigned __int8 *)(a1 + 57);
  if (v3 > 8)
  {
    if (v3 == 9)
    {
      int v4 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }

    else
    {
      if (v3 != 14) {
        return result;
      }
      int v4 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }

  else if (v3 == 1)
  {
    int v4 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }

  else
  {
    if (v3 != 6) {
      return result;
    }
    int v4 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }

  return *v4;
}

__CFString *createYCbCrMatrixFromStruct(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v1 = *(unsigned __int8 *)(a1 + 58);
  CFTypeRef v2 = 0LL;
  switch(*(_BYTE *)(a1 + 58))
  {
    case 0:
    case 2:
      return (__CFString *)v2;
    case 1:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_709_2_String;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 8:
    case 0xA:
    case 0xD:
      goto LABEL_6;
    case 6:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_601_4_String;
      return *v3;
    case 7:
      int v3 = kIOSurfaceYCbCrMatrix_SMPTE_240M_1995_String;
      return *v3;
    case 9:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_2020_String;
      return *v3;
    case 0xB:
      int v3 = kIOSurfaceYCbCrMatrix_DCI_P3_String;
      return *v3;
    case 0xC:
      int v3 = kIOSurfaceYCbCrMatrix_P3_D65_String;
      return *v3;
    case 0xE:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_2100_ICtCp_String;
      return *v3;
    default:
      if (v1 == 200)
      {
        int v3 = kIOSurfaceYCbCrMatrix_Identity_String;
        return *v3;
      }

      if (v1 == 248)
      {
        int v3 = kIOSurfaceYCbCrMatrix_IPT_String;
        return *v3;
      }

LABEL_6:
      context = @"YCbCrMatrix#";
      int v6 = v1;
      uint64_t v7 = _stringsForUnrecognizedYCbCrMatrixCodePointsDict;
      CFTypeRef cf = 0LL;
      dispatch_sync_f( (dispatch_queue_t)_unrecognizedCodePointDispatchQueue,  &context,  (dispatch_function_t)_dispatchUnrecognizedCodePointString);
      CFTypeRef v2 = cf;
      if (cf) {
        CFRetain(cf);
      }
      return (__CFString *)v2;
  }

__CFString *createColorPrimariesFromStruct(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v1 = *(unsigned __int8 *)(a1 + 59);
  CFTypeRef v2 = 0LL;
  switch(*(_BYTE *)(a1 + 59))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
      int v3 = kIOSurfaceColorPrimaries_ITU_R_709_2;
      return *v3;
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 0xA:
      goto LABEL_5;
    case 5:
      int v3 = kIOSurfaceColorPrimaries_EBU_3213;
      return *v3;
    case 6:
      int v3 = kIOSurfaceColorPrimaries_SMPTE_C;
      return *v3;
    case 9:
      int v3 = kIOSurfaceColorPrimaries_ITU_R_2020;
      return *v3;
    case 0xB:
      int v3 = kIOSurfaceColorPrimaries_DCI_P3;
      return *v3;
    case 0xC:
      int v3 = kIOSurfaceColorPrimaries_P3_D65;
      return *v3;
    default:
      if (v1 == 22)
      {
        int v3 = kIOSurfaceColorPrimaries_JEDEC_P22;
        return *v3;
      }

      else
      {
LABEL_5:
        context = @"ColorPrimaries#";
        int v6 = v1;
        uint64_t v7 = _stringsForUnrecognizedColorPrimariesCodePointsDict;
        CFTypeRef cf = 0LL;
        dispatch_sync_f( (dispatch_queue_t)_unrecognizedCodePointDispatchQueue,  &context,  (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        CFTypeRef v2 = cf;
        if (cf) {
          CFRetain(cf);
        }
      }

      return (__CFString *)v2;
  }

__CFString *createTransferFunctionFromStruct(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v1 = *(unsigned __int8 *)(a1 + 60);
  CFTypeRef v2 = 0LL;
  switch(*(_BYTE *)(a1 + 60))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
    case 6:
    case 0xE:
    case 0xF:
      int v3 = kIOSurfaceTransferFunction_ITU_R_709_2;
      return *v3;
    case 2:
      int v3 = kIOSurfaceTransferFunction_UseGamma;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
      goto LABEL_5;
    case 7:
      int v3 = kIOSurfaceTransferFunction_SMPTE_240M_1995;
      return *v3;
    case 8:
      int v3 = kIOSurfaceTransferFunction_Linear;
      return *v3;
    case 0xD:
      int v3 = kIOSurfaceTransferFunction_sRGB;
      return *v3;
    case 0x10:
      int v3 = kIOSurfaceTransferFunction_SMPTE_ST_2084_PQ;
      return *v3;
    case 0x11:
      int v3 = kIOSurfaceTransferFunction_SMPTE_ST_428_1;
      return *v3;
    case 0x12:
      int v3 = kIOSurfaceTransferFunction_ITU_R_2100_HLG;
      return *v3;
    default:
      if (v1 == 255)
      {
        int v3 = kIOSurfaceTransferFunction_aYCC;
        return *v3;
      }

      else
      {
LABEL_5:
        context = @"TransferFunction#";
        int v6 = v1;
        uint64_t v7 = _stringsForUnrecognizedTransferFunctionCodePointsDict;
        CFTypeRef cf = 0LL;
        dispatch_sync_f( (dispatch_queue_t)_unrecognizedCodePointDispatchQueue,  &context,  (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        CFTypeRef v2 = cf;
        if (cf) {
          CFRetain(cf);
        }
      }

      return (__CFString *)v2;
  }

__CFString *createChromaLocationTopFieldFromStruct(uint64_t a1)
{
  switch(*(_BYTE *)(a1 + 61))
  {
    case 1:
      int v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      int v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      int v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      int v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      int v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      int v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      int v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      uint64_t result = *v1;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

__CFString *createChromaLocationBottomFieldFromStruct(uint64_t a1)
{
  switch(*(_BYTE *)(a1 + 62))
  {
    case 1:
      int v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      int v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      int v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      int v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      int v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      int v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      int v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      uint64_t result = *v1;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

__CFString *createChromaSubsamplingFromStruct(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 63);
  switch(v1)
  {
    case 3:
      CFTypeRef v2 = kIOSurfaceChromaSubsampling_411;
      return *v2;
    case 2:
      CFTypeRef v2 = kIOSurfaceChromaSubsampling_422;
      return *v2;
    case 1:
      CFTypeRef v2 = kIOSurfaceChromaSubsampling_420;
      return *v2;
  }

  return 0LL;
}

CFNumberRef createEDRFactorFromStruct(uint64_t a1)
{
  v3[1] = *(double *)MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 96);
  if (!v1) {
    return 0LL;
  }
  v3[0] = (double)*(int *)(a1 + 92) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, v3);
}

CFDataRef createMasteringDisplayColorVolumeFromStruct(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int16 v1 = *(_WORD *)(a1 + 64);
  if (v1 || *(_WORD *)(a1 + 66))
  {
    UInt8 v2 = *(_WORD *)(a1 + 66);
    int v3 = HIBYTE(*(unsigned __int16 *)(a1 + 66));
  }

  else
  {
    if (!*(_WORD *)(a1 + 68)
      && !*(_WORD *)(a1 + 70)
      && !*(_WORD *)(a1 + 72)
      && !*(_WORD *)(a1 + 74)
      && !*(_WORD *)(a1 + 76)
      && !*(_WORD *)(a1 + 78)
      && !*(_DWORD *)(a1 + 80))
    {
      return 0LL;
    }

    UInt8 v2 = 0;
    LOBYTE(v3) = 0;
  }

  v6[0] = HIBYTE(v1);
  v6[1] = v1;
  v6[2] = v3;
  v6[3] = v2;
  __int16 v7 = bswap32(*(unsigned __int16 *)(a1 + 68)) >> 16;
  __int16 v8 = bswap32(*(unsigned __int16 *)(a1 + 70)) >> 16;
  __int16 v9 = bswap32(*(unsigned __int16 *)(a1 + 72)) >> 16;
  __int16 v10 = bswap32(*(unsigned __int16 *)(a1 + 74)) >> 16;
  __int16 v11 = bswap32(*(unsigned __int16 *)(a1 + 76)) >> 16;
  __int16 v12 = bswap32(*(unsigned __int16 *)(a1 + 78)) >> 16;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 84));
  unsigned int v13 = bswap32(*(_DWORD *)(a1 + 80));
  unsigned int v14 = v4;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v6, 24LL);
}

CFDataRef createContentLightLevelInfoFromStruct(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  __int16 v1 = *(_WORD *)(a1 + 88);
  __int16 v2 = *(_WORD *)(a1 + 90);
  if (!v1 && !*(_WORD *)(a1 + 90)) {
    return 0LL;
  }
  bytes[0] = HIBYTE(v1);
  bytes[1] = v1;
  bytes[2] = HIBYTE(v2);
  bytes[3] = v2;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 4LL);
}

__CFString *createAlphaChannelModeFromStruct(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 100);
  if (v1 == 1)
  {
    __int16 v2 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    return *v2;
  }

  if (v1 == 2)
  {
    __int16 v2 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
    return *v2;
  }

  return 0LL;
}

CFNumberRef createSceneIlluminationFromStruct(uint64_t a1)
{
  v3[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(unsigned int *)(a1 + 112);
  v3[0] = v1;
  if (!(_DWORD)v1) {
    return 0LL;
  }
  if ((_DWORD)v1 == 1) {
    v3[0] = 0LL;
  }
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, v3);
}

CFNumberRef createColorSpaceIDFromStruct(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int valuePtr = *(unsigned __int8 *)(a1 + 101);
  if (valuePtr) {
    return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  }
  else {
    return 0LL;
  }
}

CFDictionaryRef sniffCleanApertureKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  v11[1] = *(double *)MEMORY[0x1895F89C0];
  if (!result)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    goto LABEL_9;
  }

  uint64_t v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  uint64_t result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    uint64_t result = getDoubleFromDict(v3, @"Width", v11);
    if ((_DWORD)result)
    {
      uint64_t result = getDoubleFromDict(v3, @"Height", &v10);
      if ((_DWORD)result)
      {
        uint64_t result = getDoubleFromDict(v3, @"HorizontalOffset", &v9);
        if ((_DWORD)result)
        {
          uint64_t result = getDoubleFromDict(v3, @"VerticalOffset", &v8);
          if ((_DWORD)result)
          {
            unsigned int v5 = llround(v10 * 16.0);
            *(_DWORD *)a2 = llround(v11[0] * 16.0);
            *(_DWORD *)(a2 + 4) = 16;
            unsigned int v6 = llround(v9 * 16.0);
            *(_DWORD *)(a2 + 8) = v5;
            *(_DWORD *)(a2 + 12) = 16;
            unsigned int v7 = llround(v8 * 16.0);
            *(_DWORD *)(a2 + 16) = v6;
            *(_DWORD *)(a2 + 20) = 16;
            *(_DWORD *)(a2 + 24) = v7;
            *(_DWORD *)(a2 + 28) = 16;
LABEL_9:
            *(void *)(a2 + 120) |= 1uLL;
          }
        }
      }
    }
  }

  return result;
}

CFDictionaryRef sniffPixelAspectRatioKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  v7[1] = *(double *)MEMORY[0x1895F89C0];
  if (!result)
  {
    *(void *)(a2 + 32) = 0LL;
    *(void *)(a2 + 40) = 0LL;
    goto LABEL_7;
  }

  uint64_t v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  uint64_t result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    uint64_t result = getDoubleFromDict(v3, @"HorizontalSpacing", v7);
    if ((_DWORD)result)
    {
      uint64_t result = getDoubleFromDict(v3, @"VerticalSpacing", &v6);
      if ((_DWORD)result)
      {
        unsigned int v5 = llround(v6 * 16.0);
        *(_DWORD *)(a2 + 32) = llround(v7[0] * 16.0);
        *(_DWORD *)(a2 + 36) = 16;
        *(_DWORD *)(a2 + 40) = v5;
        *(_DWORD *)(a2 + 44) = 16;
LABEL_7:
        *(void *)(a2 + 120) |= 2uLL;
      }
    }
  }

  return result;
}

CFTypeID sniffGammaLevelKeyToStruct(CFTypeID result, uint64_t a2)
{
  v5[1] = *(double *)MEMORY[0x1895F89C0];
  if (!result)
  {
    *(void *)(a2 + 48) = 0LL;
    goto LABEL_6;
  }

  uint64_t v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a2 + 48) = llround(v5[0] * 268435456.0);
      *(_DWORD *)(a2 + 52) = 0x10000000;
LABEL_6:
      *(void *)(a2 + 120) |= 4uLL;
    }
  }

  return result;
}

CFTypeID sniffFieldCountKeyToStruct(CFTypeID result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  char valuePtr = 0;
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberSInt8Type, &valuePtr);
    if ((_DWORD)result)
    {
      char v5 = valuePtr;
LABEL_6:
      *(_BYTE *)(a2 + 56) = v5;
      *(void *)(a2 + 120) |= 8uLL;
    }
  }

  return result;
}

CFTypeID sniffFieldDetailKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_fieldDetailKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 57) = v5;
      *(void *)(a2 + 120) |= 0x10uLL;
    }
  }

  return result;
}

void sniffYCbCrMatrixKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v9[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!a1)
  {
    *(_BYTE *)(a2 + 58) = 0;
    goto LABEL_10;
  }

  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID() && CFDictionaryGetValueIfPresent((CFDictionaryRef)_yCbCrMatrixKeysToStructDict, a1, v9))
  {
    *(_BYTE *)(a2 + 58) = v9[0];
LABEL_10:
    *(void *)(a2 + 120) |= 0x20uLL;
    return;
  }

  CFTypeID v5 = CFGetTypeID(a1);
  if (v5 == CFStringGetTypeID() && CFStringHasPrefix(a1, @"YCbCrMatrix#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v10.location = CFStringGetLength(@"YCbCrMatrix#");
    v10.length = Length - v10.location;
    uint64_t v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], a1, v10);
    if (v7)
    {
      double v8 = v7;
      *(_BYTE *)(a2 + 58) = CFStringGetIntValue(v7);
      *(void *)(a2 + 120) |= 0x20uLL;
      CFRelease(v8);
    }
  }

void sniffColorPrimariesKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v8[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!a1)
  {
    *(_BYTE *)(a2 + 59) = 0;
    goto LABEL_9;
  }

  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_colorPrimariesKeysToStructDict, a1, v8))
  {
    *(_BYTE *)(a2 + 59) = v8[0];
LABEL_9:
    *(void *)(a2 + 120) |= 0x40uLL;
    return;
  }

  if (CFStringHasPrefix(a1, @"ColorPrimaries#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(@"ColorPrimaries#");
    v9.length = Length - v9.location;
    double v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], a1, v9);
    if (v6)
    {
      uint64_t v7 = v6;
      *(_BYTE *)(a2 + 59) = CFStringGetIntValue(v6);
      *(void *)(a2 + 120) |= 0x40uLL;
      CFRelease(v7);
    }
  }

void sniffTransferFunctionKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v8[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!a1)
  {
    *(_BYTE *)(a2 + 60) = 0;
    goto LABEL_9;
  }

  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_transferFunctionKeysToStructDict, a1, v8))
  {
    *(_BYTE *)(a2 + 60) = v8[0];
LABEL_9:
    *(void *)(a2 + 120) |= 0x80uLL;
    return;
  }

  if (CFStringHasPrefix(a1, @"TransferFunction#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(@"TransferFunction#");
    v9.length = Length - v9.location;
    double v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], a1, v9);
    if (v6)
    {
      uint64_t v7 = v6;
      *(_BYTE *)(a2 + 60) = CFStringGetIntValue(v6);
      *(void *)(a2 + 120) |= 0x80uLL;
      CFRelease(v7);
    }
  }

CFTypeID sniffChromaLocationTopKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 61) = v5;
      *(void *)(a2 + 120) |= 0x100uLL;
    }
  }

  return result;
}

CFTypeID sniffChromaLocationBottomKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 62) = v5;
      *(void *)(a2 + 120) |= 0x200uLL;
    }
  }

  return result;
}

CFTypeID sniffChromaSubsamplingKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaSubsamplingKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 63) = v5;
      *(void *)(a2 + 120) |= 0x400uLL;
    }
  }

  return result;
}

CFTypeID sniffEDRFactorKeyToStruct(CFTypeID result, uint64_t a2)
{
  v5[1] = *(double *)MEMORY[0x1895F89C0];
  if (!result)
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a2 + 92) = llround(v5[0] * 1048576.0);
      *(_DWORD *)(a2 + 96) = 0x100000;
LABEL_6:
      *(void *)(a2 + 120) |= 0x2000uLL;
    }
  }

  return result;
}

uint64_t sniffMasteringDisplayColorVolumeKeyToStruct(const void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  if (!a1)
  {
    int v22 = 0;
    int v21 = 0;
    int v20 = 0;
    int v19 = 0;
    __int16 v18 = 0;
    __int16 v17 = 0;
    __int16 v16 = 0;
    __int16 v15 = 0;
    __int16 v14 = 0;
    __int16 v13 = 0;
    int v12 = 0;
    __int16 v11 = 0;
    __int16 v10 = 0;
    __int16 v9 = 0;
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    goto LABEL_7;
  }

  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v3) || CFDataGetLength((CFDataRef)v3) != 24)
  {
    int v22 = 0;
    int v21 = 0;
    int v20 = 0;
    int v19 = 0;
    __int16 v18 = 0;
    __int16 v17 = 0;
    __int16 v16 = 0;
    __int16 v15 = 0;
    __int16 v14 = 0;
    __int16 v13 = 0;
    LODWORD(a1) = 0;
    int v12 = 0;
    __int16 v11 = 0;
    __int16 v10 = 0;
    __int16 v9 = 0;
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    LOWORD(v3) = 0;
LABEL_7:
    __int16 v5 = 0;
    goto LABEL_8;
  }

  v30.location = 0LL;
  v30.length = 24LL;
  CFDataGetBytes((CFDataRef)v3, v30, (UInt8 *)&v26);
  __int16 v5 = v26;
  LOWORD(v3) = BYTE1(v26);
  __int16 v6 = BYTE2(v26);
  __int16 v7 = BYTE3(v26);
  __int16 v8 = BYTE4(v26);
  __int16 v9 = BYTE5(v26);
  __int16 v10 = BYTE6(v26);
  __int16 v11 = HIBYTE(v26);
  int v12 = v27;
  LODWORD(a1) = BYTE1(v27);
  __int16 v13 = BYTE2(v27);
  __int16 v14 = BYTE3(v27);
  __int16 v15 = BYTE4(v27);
  __int16 v16 = BYTE5(v27);
  __int16 v17 = BYTE6(v27);
  __int16 v18 = HIBYTE(v27);
  int v19 = v28 << 24;
  int v20 = BYTE1(v28) << 16;
  int v21 = BYTE2(v28) << 8;
  int v22 = BYTE3(v28);
LABEL_8:
  *(_WORD *)(a2 + 64) = (unsigned __int16)v3 | (v5 << 8);
  *(_WORD *)(a2 + 66) = v7 | (v6 << 8);
  *(_WORD *)(a2 + 68) = v9 | (v8 << 8);
  *(_WORD *)(a2 + 70) = v11 | (v10 << 8);
  uint64_t result = a1 | (v12 << 8);
  *(_WORD *)(a2 + 72) = result;
  *(_WORD *)(a2 + 74) = v14 | (v13 << 8);
  *(_WORD *)(a2 + 76) = v16 | (v15 << 8);
  *(_WORD *)(a2 + 78) = v18 | (v17 << 8);
  int v24 = v20 | v19 | v21 | v22;
  unsigned int v25 = bswap32(HIDWORD(v28));
  *(_DWORD *)(a2 + 80) = v24;
  *(_DWORD *)(a2 + 84) = v25;
  *(void *)(a2 + 120) |= 0x800uLL;
  return result;
}

void sniffContentLightLevelInfoKeyToStruct(const __CFData *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  *(_DWORD *)buffer = 0;
  if (a1 && (CFTypeID TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1)) && CFDataGetLength(a1) == 4)
  {
    v11.location = 0LL;
    v11.length = 4LL;
    CFDataGetBytes(a1, v11, buffer);
    __int16 v5 = buffer[0];
    __int16 v6 = buffer[1];
    __int16 v7 = buffer[2];
    __int16 v8 = buffer[3];
  }

  else
  {
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    __int16 v5 = 0;
  }

  *(_WORD *)(a2 + 88) = v6 | (v5 << 8);
  *(_WORD *)(a2 + 90) = v8 | (v7 << 8);
  *(void *)(a2 + 120) |= 0x1000uLL;
}

CFTypeID sniffAlphaChannelModeKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }

  uint64_t v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_premultipliedAlphaKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 100) = v5;
      *(void *)(a2 + 120) |= 0x4000uLL;
    }
  }

  return result;
}

CFTypeID sniffSceneIlluminationKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  if (!result)
  {
    int v5 = 0;
LABEL_9:
    *(_DWORD *)(a2 + 112) = v5;
    *(void *)(a2 + 120) |= 0x10000uLL;
    return result;
  }

  uint64_t v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberSInt64Type, v6);
    if ((_DWORD)result)
    {
      int v5 = v6[0];
      if (!HIDWORD(v6[0]))
      {
        if (v6[0] <= 1uLL) {
          int v5 = 1;
        }
        goto LABEL_9;
      }
    }
  }

  return result;
}

CFTypeID sniffColorSpaceIDKeyToStruct(CFTypeID result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int valuePtr = 0;
  if (result
    && (v3 = (const __CFNumber *)result, TypeID = CFNumberGetTypeID(), uint64_t result = CFGetTypeID(v3), TypeID == result))
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr);
    char v5 = valuePtr;
    if (valuePtr > 0xFF) {
      char v5 = 0;
    }
  }

  else
  {
    char v5 = 0;
  }

  *(_BYTE *)(a2 + 101) = v5;
  *(void *)(a2 + 120) |= 0x20000uLL;
  return result;
}

CFNumberRef getDoubleFromDict(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    char v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID()) {
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberDoubleType, a3) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void _dispatchUnrecognizedCodePointString(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (const void *)*((int *)a1 + 2);
  CFTypeID v4 = (const __CFDictionary *)a1[2];
  Value = CFDictionaryGetValue(v4, v3);
  if (!Value)
  {
    Value = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%@%d", v2, v3);
    if (Value)
    {
      CFDictionarySetValue(v4, v3, Value);
      CFRelease(Value);
    }
  }

  a1[3] = (uint64_t)Value;
}

IOSurfaceWiringAssertion *IOSurfaceCreateWiringAssertion(uint64_t a1)
{
  return -[IOSurfaceWiringAssertion initWithIOSurface:]( objc_alloc(&OBJC_CLASS___IOSurfaceWiringAssertion),  "initWithIOSurface:",  a1);
}

uint64_t IOSurfaceWiringAssertionGetTypeID()
{
  return objc_opt_self();
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return objc_opt_self();
}

id _iosCreateDictionaryAddingMissingProperties(void *a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v2 = [a1 objectForKey:@"IOSurfaceName"];
  uint64_t v3 = (const __CFDictionary *)[a1 objectForKey:@"IOSurfaceDefaultAttachments"];
  uint64_t v4 = [a1 objectForKey:@"IOSurfaceDefaultBulkAttachments"];
  char v5 = (void *)MEMORY[0x186E08328]();
  __int128 v20 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  if (v4) {
    [(id)v4 getBytes:&v13 length:116];
  }
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)_sniffKeysToStruct, &v13);
    if (cf[1]) {
      CFRelease(cf[1]);
    }
  }

  if (!*((void *)&v20 + 1))
  {
LABEL_12:
    uint64_t v7 = 0LL;
    goto LABEL_13;
  }

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_13:
    __int16 v8 = 0LL;
    goto LABEL_14;
  }

  if (v3) {
    objc_msgSend(v6, "addEntriesFromDictionary:", v3, v13, v14, v15, v16, v17, v18, v19, (void)v20);
  }
  __int16 v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v13 length:116];
  [v7 removeObjectForKey:@"IOSurfaceCleanAperture"];
  [v7 removeObjectForKey:@"IOSurfacePixelAspectRatio"];
  [v7 removeObjectForKey:@"IOSurfaceGammaLevel"];
  [v7 removeObjectForKey:@"IOSurfaceFieldCount"];
  [v7 removeObjectForKey:@"IOSurfaceFieldDetail"];
  [v7 removeObjectForKey:@"IOSurfaceYCbCrMatrix"];
  [v7 removeObjectForKey:@"IOSurfaceColorPrimaries"];
  [v7 removeObjectForKey:@"IOSurfaceTransferFunction"];
  [v7 removeObjectForKey:@"IOSurfaceChromaLocationTopField"];
  [v7 removeObjectForKey:@"IOSurfaceChromaLocationBottomField"];
  [v7 removeObjectForKey:@"IOSurfaceChromaSubsampling"];
  [v7 removeObjectForKey:@"IOSurfaceEDRFactor"];
LABEL_14:
  if (v2) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = a1;
  }

  else
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v10 addEntriesFromDictionary:a1];
    if (!v2)
    {
      CFRange v11 = (const char *)dyld_image_path_containing_address();
      if (v11) {
        objc_msgSend( v10,  "setObject:forKey:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "stringWithFileSystemRepresentation:length:",  v11,  strlen(v11)),  "lastPathComponent"),  @"IOSurfaceName");
      }
    }

    if (v7)
    {
      [v10 setValue:v7 forKey:@"IOSurfaceDefaultAttachments"];
    }

    if (v8)
    {
      [v10 setValue:v8 forKey:@"IOSurfaceDefaultBulkAttachments"];
    }
  }

  objc_autoreleasePoolPop(v5);
  return v10;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  id DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(properties);
  uint64_t v2 = -[IOSurface initWithProperties:]( objc_alloc(&OBJC_CLASS___IOSurface),  "initWithProperties:",  DictionaryAddingMissingProperties);

  return (IOSurfaceRef)v2;
}

uint64_t IOSurfaceCreateChildSurface(void *a1, void *a2)
{
  id DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(a2);
  uint64_t v4 = [a1 newChildSurfaceWithProperties:DictionaryAddingMissingProperties];

  return v4;
}

uint64_t IOSurfaceGetParentID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetParentID(*(void *)(result + 8));
  }
  return result;
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetID(*((void *)buffer + 1));
  }
  return buffer;
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientCreateMachPort(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  if (!a1 || (a2 & 1) != 0) {
    return 0LL;
  }
  else {
    return IOSurfaceClientCreateMachPortWithOptions(*(void *)(a1 + 8), a2);
  }
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)-[IOSurface initWithSurfaceID:]( objc_alloc(&OBJC_CLASS___IOSurface),  "initWithSurfaceID:",  *(void *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)-[IOSurface initWithMachPort:]( objc_alloc(&OBJC_CLASS___IOSurface),  "initWithMachPort:",  *(void *)&port);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  if (!aSurface) {
    return 0LL;
  }
  mach_port_name_t MachPort = IOSurfaceClientCreateMachPort(*((void *)aSurface + 1));
  if (!MachPort) {
    return 0LL;
  }
  mach_port_name_t v2 = MachPort;
  uint64_t v3 = (void *)xpc_mach_send_create();
  mach_port_deallocate(*MEMORY[0x1895FBBE0], v2);
  return v3;
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  if (xobj && MEMORY[0x186E086B8]() == MEMORY[0x1895F9290] && (uint64_t right = xpc_mach_send_get_right(), (_DWORD)right)) {
    return (IOSurfaceRef)-[IOSurface initWithMachPort:](objc_alloc(&OBJC_CLASS___IOSurface), "initWithMachPort:", right);
  }
  else {
    return 0LL;
  }
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer) {
    return IOSurfaceClientLock(*((void *)buffer + 1), options, seed);
  }
  else {
    return -536870206;
  }
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer) {
    return IOSurfaceClientUnlock(*((void *)buffer + 1), options, seed);
  }
  else {
    return -536870206;
  }
}

size_t IOSurfaceGetAllocSize(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetAllocSize(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetWidth(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetWidth(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetHeight(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetHeight(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerRow(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerRow(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerElement(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerElement(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetElementWidth(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetElementWidth(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetElementHeight(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetElementHeight(*(void *)(buffer + 8));
  }
  return buffer;
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetPixelFormat(*((void *)buffer + 1));
  }
  return buffer;
}

void *__cdecl IOSurfaceGetBaseAddress(void *buffer)
{
  if (buffer) {
    return (void *)IOSurfaceClientGetBaseAddress(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceIsTiled(uint64_t result)
{
  if (result) {
    return IOSurfaceClientIsTiled(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetTileFormat(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetTileFormat(*(void *)(result + 8));
  }
  return result;
}

uint32_t IOSurfaceGetSeed(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetSeed(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceLockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1) {
    return IOSurfaceClientLock(*(void *)(a1 + 8), a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceUnlockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1) {
    return IOSurfaceClientUnlock(*(void *)(a1 + 8), a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

size_t IOSurfaceGetPlaneCount(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetPlaneCount(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetWidthOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetHeightOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerRowOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerRowOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerElementOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerElementOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetElementWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetElementWidthOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetElementHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetElementHeightOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(void *buffer, size_t planeIndex)
{
  if (buffer) {
    return (void *)IOSurfaceClientGetBaseAddressOfPlane(*((void *)buffer + 1), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceGetOffsetOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetOffsetOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetSizeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetSizeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetSeedOfPlane(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetSeed(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceFlushProcessorCaches(uint64_t result)
{
  if (result) {
    return IOSurfaceClientFlushProcessorCaches(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetCacheMode(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetCacheMode(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1) {
    return IOSurfaceClientBindAccel(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceBindAccelOnPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1) {
    return IOSurfaceClientBindAccel(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090LL;
  }
}

BOOL IOSurfaceNeedsBindAccel(BOOL result, int a2, int a3)
{
  if (result) {
    return IOSurfaceClientNeedsBindAccel(*(void *)(result + 8), a2, a3);
  }
  return result;
}

BOOL IOSurfaceNeedsBindAccelOnPlane(BOOL result, int a2, int a3)
{
  if (result) {
    return IOSurfaceClientNeedsBindAccel(*(void *)(result + 8), a2, a3);
  }
  return result;
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  if (buffer)
  {
    if (key) {
      IOSurfaceClientSetValue(*((void *)buffer + 1), (void *)key, (CFDictionaryRef)value);
    }
  }

void IOSurfaceSetValues(IOSurfaceRef buffer, CFDictionaryRef keysAndValues)
{
  if (buffer && keysAndValues)
  {
    CFTypeID v4 = CFGetTypeID(keysAndValues);
    if (v4 == CFDictionaryGetTypeID()) {
      IOSurfaceClientSetValue(*((void *)buffer + 1), 0LL, keysAndValues);
    }
  }

CFTypeRef IOSurfaceCopyValue(CFTypeRef buffer, CFStringRef key)
{
  if (buffer) {
    return IOSurfaceClientCopyValue(*((void *)buffer + 1), (void *)key);
  }
  return buffer;
}

CFDictionaryRef IOSurfaceCopyAllValues(CFDictionaryRef buffer)
{
  if (buffer) {
    return IOSurfaceClientCopyAllValues(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceCopyDataValueBytes(uint64_t result, const __CFString *a2, _BYTE *a3, size_t *a4)
{
  if (result) {
    return IOSurfaceClientCopyDataValueBytes(*(void *)(result + 8), a2, a3, a4);
  }
  return result;
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  if (buffer)
  {
    if (key) {
      IOSurfaceClientRemoveValue(*((void *)buffer + 1), (__CFString *)key);
    }
  }

void IOSurfaceRemoveAllValues(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientRemoveValue(*((void *)buffer + 1), 0LL);
  }
}

CFArrayRef IOSurfaceSetCoreVideoBridgedKeys(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    uint64_t result = (const __CFArray *)CFArrayGetTypeID();
    if ((const __CFArray *)v2 == result) {
      return (const __CFArray *)IOSurfaceClientSetCoreVideoBridgedKeys(v1);
    }
  }

  return result;
}

uint64_t IOSurfaceRemoveCoreVideoBridgedValues(uint64_t result)
{
  if (result) {
    return IOSurfaceClientRemoveCoreVideoBridgedValues(*(void *)(result + 8));
  }
  return result;
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientIncrementUseCount(*((void *)buffer + 1));
  }
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientDecrementUseCount(*((void *)buffer + 1));
  }
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetUseCount(*((void *)buffer + 1));
  }
  return (int)buffer;
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  if (buffer) {
    LOBYTE(buffer) = IOSurfaceClientIsInUse(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceGetNumberOfUseCountCategories()
{
  return 2LL;
}

uint64_t IOSurfaceIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIncrementUseCountForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientDecrementUseCountForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsInUseForCategory(BOOL result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIsInUseForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsInUseForAnyOtherCategory(BOOL result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIsInUseForAnyOtherCategory(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetProhibitUseCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetProhibitUseCount(*(void *)(result + 8));
  }
  return result;
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  if (buffer) {
    LOBYTE(buffer) = IOSurfaceClientAllowsPixelSizeCasting(*((void *)buffer + 1));
  }
  return buffer;
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  if (buffer) {
    return IOSurfaceClientSetPurgeable(*((void *)buffer + 1), newState, oldState);
  }
  else {
    return -536870206;
  }
}

uint64_t IOSurfaceSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1) {
    return IOSurfaceClientSetOwnership(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1) {
    return IOSurfaceClientSetOwnershipIdentity(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  if (a1) {
    return IOSurfaceClientSetYCbCrMatrix(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  if (a1) {
    return IOSurfaceClientGetYCbCrMatrix(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090LL;
  }
}

IOSurface *IOSurfaceWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t result = (IOSurface *)IOSurfaceClientWrapClientImage(a1, a2, a3, a4, a5, a6);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t result = -[IOSurface initWithClientBuffer:](objc_alloc(&OBJC_CLASS___IOSurface), "initWithClientBuffer:", result);
    if (!result)
    {
      IOSurfaceClientRelease(v7);
      return 0LL;
    }
  }

  return result;
}

IOSurface *IOSurfaceWrapClientMemory(uint64_t a1, uint64_t a2)
{
  uint64_t result = (IOSurface *)IOSurfaceClientWrapClientMemory(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = -[IOSurface initWithClientBuffer:](objc_alloc(&OBJC_CLASS___IOSurface), "initWithClientBuffer:", result);
    if (!result)
    {
      IOSurfaceClientRelease(v3);
      return 0LL;
    }
  }

  return result;
}

uint64_t IOSurfaceSetTiled(uint64_t a1, unsigned int a2)
{
  if (a1) {
    return IOSurfaceClientSetTiled(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceGetBitsPerBlock(uint64_t result)
{
  if (result) {
    return 8 * IOSurfaceClientGetBytesPerElement(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetBitsPerBlockOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return 8 * IOSurfaceClientGetBytesPerElementOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBlockWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetElementWidthOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBlockHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetElementHeightOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceSetTimestamp(uint64_t result, void *a2, void *a3, uint64_t a4)
{
  if (result) {
    return IOSurfaceClientSetTimestamp(*(void *)(result + 8), a2, a3, a4);
  }
  return result;
}

uint64_t IOSurfaceSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1) {
    return IOSurfaceClientSetBulkAttachments(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceSetBulkAttachments2(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1) {
    return IOSurfaceClientSetBulkAttachments(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceGetBulkAttachments(uint64_t a1, void *a2, size_t *a3)
{
  if (a1) {
    return IOSurfaceClientGetBulkAttachments(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfacePrefetchPages(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientPrefetchPages(*(void *)(a1 + 8));
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceGetProtectionOptions(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetProtectionOptions(*(void *)(result + 8));
  }
  return result;
}

BOOL IOSurfaceSupportsProtectionOptions(BOOL result, uint64_t a2)
{
  if (result) {
    return IOSurfaceClientSupportsProtectionOptions(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsDisplayable(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsDisplayable(*(void *)(result + 8));
  }
  return result;
}

BOOL IOSurfaceIsSysMemOnly(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsSysMemOnly(*(void *)(result + 8));
  }
  return result;
}

size_t IOSurfaceGetNumberOfComponentsOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetNumberOfComponentsOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

IOSurfaceComponentName IOSurfaceGetNameOfComponentOfPlane( IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetNameOfComponentOfPlane( *((void *)buffer + 1),  planeIndex,  componentIndex);
  }
  return (int)buffer;
}

IOSurfaceComponentType IOSurfaceGetTypeOfComponentOfPlane( IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetTypeOfComponentOfPlane( *((void *)buffer + 1),  planeIndex,  componentIndex);
  }
  return (int)buffer;
}

IOSurfaceComponentRange IOSurfaceGetRangeOfComponentOfPlane( IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetRangeOfComponentOfPlane( *((void *)buffer + 1),  planeIndex,  componentIndex);
  }
  return (int)buffer;
}

size_t IOSurfaceGetBitDepthOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBitDepthOfComponentOfPlane( *(void *)(buffer + 8),  planeIndex,  componentIndex);
  }
  return buffer;
}

size_t IOSurfaceGetBitOffsetOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBitOffsetOfComponentOfPlane( *(void *)(buffer + 8),  planeIndex,  componentIndex);
  }
  return buffer;
}

IOSurfaceSubsampling IOSurfaceGetSubsampling(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetSubsampling(*((void *)buffer + 1));
  }
  return (int)buffer;
}

uint64_t IOSurfaceGetCompressionTypeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressionTypeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressionFootprintOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressedTileWidthOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressedTileHeightOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerTileDataOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerCompressedTileHeaderOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetWidthInCompressedTilesOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHeightInCompressedTilesOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerRowOfTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHTPCPredictionSelectorOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHTPCPredictionSelectorOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceSetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2)
{
  v2[1] = *MEMORY[0x1895F89C0];
  v2[0] = 0LL;
  if (result)
  {
    IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(*(void *)(result + 8), a2, v2);
    return v2[0];
  }

  return result;
}

uint64_t IOSurfaceGetAddressFormatOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetAddressFormatOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetSliceCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetSliceCount(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane( uint64_t result, unsigned int a2, void *a3, void *a4, void *a5, void *a6)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  v13[0] = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  if (result) {
    uint64_t result = IOSurfaceClientGetExtendedPixelsOfPlane(*(void *)(result + 8), a2, v13, &v12, &v11, &v10);
  }
  if (a3) {
    *a3 = v13[0];
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v11;
  }
  if (a6) {
    *a6 = v10;
  }
  return result;
}

uint64_t IOSurfaceSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetIndexedTimestamp(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetIndexedTimestamp(uint64_t result, unint64_t a2)
{
  if (result) {
    return IOSurfaceClientGetIndexedTimestamp(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceInitDetachModeCode(uint64_t result)
{
  if (result) {
    return IOSurfaceClientInitDetachModeCode(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetDetachModeCode(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetDetachModeCode(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientGetDetachModeCode(*(void *)(a1 + 8));
  }
  else {
    return 0xFFFFFFFFFFFFLL;
  }
}

uint64_t IOSurfaceGetRegistryID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetRegistryID(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetTraceID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetTraceID(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  if (a1) {
    return IOSurfaceClientSetDataProperty(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, void *a4, void *a5)
{
  if (a1) {
    return IOSurfaceClientGetDataProperty(*(void *)(a1 + 8), a2, a3, a4, a5);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOSurfaceHasDataProperty(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientHasDataProperty(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClearDataProperties(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientClearDataProperties(*(void *)(a1 + 8));
  }
  else {
    return 3758097090LL;
  }
}

BOOL IOSurfaceIsMetalSharedTexture(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsMetalSharedTexture(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetWiringAssertionCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetWiringAssertionCount(*(void *)(result + 8));
  }
  return result;
}

void sub_1811C7D78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1811C8040( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1811C898C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t _IOSurfaceRemoteMethodInitialize(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _ioSurfaceConnect();
  CFTypeID v4 = (char *)calloc(1uLL, 0x28uLL);
  *(_DWORD *)CFTypeID v4 = 1;
  *(void *)(v4 + 4) = ioSurfaceLimits;
  int v5 = qword_18C44A038;
  *(int32x2_t *)(v4 + 12) = vmovn_s64(*(int64x2_t *)&qword_18C44A028);
  *((_DWORD *)v4 + 5) = v5;
  *((_DWORD *)v4 + 6) = 1;
  *((void *)v4 + 4) = 1LL;
  id v6 = dispatch_data_create(v4, 0x28uLL, 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
  xpc_object_t v7 = xpc_data_create_with_dispatch_data(v6);
  xpc_dictionary_set_value(v3, "Limits", v7);
  xpc_dictionary_set_uint64(v3, "ProtocolVersion", 1uLL);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodGetDebugInfo(void *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  xpc_object_t xdict = a3;
  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  [v4 surfaceStates];
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        [v4 surfaceStates];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectForKeyedSubscript:v12];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

        xpc_object_t v15 = xpc_uint64_create([v12 unsignedIntegerValue]);
        xpc_array_append_value(v5, v15);

        xpc_object_t v16 = xpc_uint64_create([v14 debugRefCount]);
        xpc_array_append_value(v6, v16);

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
    }

    while (v9);
  }

  xpc_dictionary_set_value(xdict, "DebugSurfaceIDList", v5);
  xpc_dictionary_set_value(xdict, "DebugSurfaceRefCount", v6);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientCreate(void *a1, void *a2, void *a3)
{
  v27[1] = *(void **)MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v27[0] = 0LL;
  unsigned int uint64 = xpc_dictionary_get_uint64(v6, "LookupID");
  if (uint64)
  {
    uint64_t v9 = IOSurfaceClientLookup(uint64);
  }

  else
  {
    unsigned int v10 = xpc_dictionary_copy_mach_send();
    if (v10 - 1 > 0xFFFFFFFD)
    {
      uint64_t v13 = 3758097090LL;
      CFTypeRef v20 = _ioSurfaceDeserializedFromXPCDictionaryWithKey(v6, "PropertiesDictionary");
      if (!v20) {
        goto LABEL_8;
      }
      __int128 v21 = (void *)v20;
      xpc_dictionary_get_value(v6, "ClientProvidedShmem");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          _IOSurfaceRemoteMethodClientCreate_cold_3(v5);
        }
        size_t v22 = xpc_shmem_map(v14, v27);
        if (!v22)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
            _IOSurfaceRemoteMethodClientCreate_cold_1(v5);
          }
          CFRelease(v21);
          uint64_t v13 = 3758097085LL;
          goto LABEL_7;
        }

        unint64_t v12 = v22;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFDictionaryRef)v21);
        CFDictionarySetValue( MutableCopy,  @"IOSurfaceAddress",  (const void *)[MEMORY[0x189607968] numberWithUnsignedLong:v27[0]]);
        CFRelease(v21);
        Value = (void *)CFDictionaryGetValue(MutableCopy, @"IOSurfaceAllocSize");
        if (Value)
        {
          unint64_t v25 = [Value unsignedIntegerValue];
          if (v25 > v12)
          {
            uint64_t v26 = v25;
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
              _IOSurfaceRemoteMethodClientCreate_cold_2(v12, v26);
            }
          }
        }
      }

      else if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v21, @"IOSurfaceAddress", 0LL))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFDictionaryRef)v21);
        CFDictionaryRemoveValue(MutableCopy, @"IOSurfaceAddress");
        CFRelease(v21);
        unint64_t v12 = 0LL;
      }

      else
      {
        unint64_t v12 = 0LL;
        CFMutableDictionaryRef MutableCopy = (__CFDictionary *)v21;
      }

      uint64_t v9 = IOSurfaceClientCreate(MutableCopy);
      CFRelease(MutableCopy);

      if (!v9) {
        goto LABEL_8;
      }
LABEL_6:
      xpc_dictionary_get_value(v6, "ExtraData");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 _addSurface:v9 mappedAddress:v27[0] mappedSize:v12 extraData:v14];
      UnadjustedBaseAddress = (void *)_IOSurfaceClientGetUnadjustedBaseAddress((uint64_t)v9);
      size_t AllocSize = IOSurfaceClientGetAllocSize((uint64_t)v9);
      xpc_object_t v17 = xpc_shmem_create(UnadjustedBaseAddress, AllocSize);
      xpc_dictionary_set_value(v7, "MemoryObject", v17);
      int ID = IOSurfaceClientGetID((uint64_t)v9);
      _ioSurfaceAddClientState((uint64_t)v9, ID, v7);

      uint64_t v13 = 0LL;
LABEL_7:

      goto LABEL_8;
    }

    mach_port_name_t v11 = v10;
    uint64_t v9 = IOSurfaceClientLookupFromMachPort(v10);
    mach_port_deallocate(*MEMORY[0x1895FBBE0], v11);
  }

  unint64_t v12 = 0LL;
  uint64_t v13 = 3758097136LL;
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:

  return v13;
}

uint64_t _IOSurfaceRemoteMethodClientLock(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  int v6 = 0;
  return IOSurfaceClientLock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientUnlock(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  int v6 = 0;
  return IOSurfaceClientUnlock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientGetPlaneState(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 3758097085LL;
  id v7 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "PlaneIndex");
  if (IOSurfaceClientGetPlaneCount(a2) >= uint64)
  {
    uint64_t v9 = calloc(1uLL, 0x48uLL);
    if (v9)
    {
      unsigned int v10 = v9;
      *uint64_t v9 = 0;
      v9[1] = uint64;
      *((_DWORD *)v9 + 1) = IOSurfaceClientGetWidthOfPlane(a2, uint64);
      *((_DWORD *)v10 + 2) = IOSurfaceClientGetHeightOfPlane(a2, uint64);
      *((_DWORD *)v10 + 3) = IOSurfaceClientGetOffsetOfPlane(a2, uint64);
      *((_DWORD *)v10 + 4) = IOSurfaceClientGetBytesPerRowOfPlane(a2, uint64);
      *((_DWORD *)v10 + 5) = IOSurfaceClientGetSizeOfPlane(a2, uint64);
      v10[20] = IOSurfaceClientGetBytesPerElementOfPlane(a2, uint64);
      *((_BYTE *)v10 + 42) = IOSurfaceClientGetElementWidthOfPlane(a2, uint64);
      *((_BYTE *)v10 + 43) = IOSurfaceClientGetElementHeightOfPlane(a2, uint64);
      IOSurfaceClientGetExtendedPixelsOfPlane(a2, uint64, v24, &v23, &v22, &v21);
      int v11 = v23;
      int v12 = v22;
      *((_DWORD *)v10 + 8) = v24[0];
      *((_DWORD *)v10 + 9) = v12;
      int v13 = v21;
      *((_DWORD *)v10 + 6) = v11;
      *((_DWORD *)v10 + 7) = v13;
      unsigned __int8 NumberOfComponentsOfPlane = IOSurfaceClientGetNumberOfComponentsOfPlane(a2, uint64);
      *((_BYTE *)v10 + 44) = NumberOfComponentsOfPlane;
      uint64_t v15 = NumberOfComponentsOfPlane;
      if (NumberOfComponentsOfPlane)
      {
        unint64_t v16 = 0LL;
        do
        {
          xpc_object_t v17 = (char *)v10 + v16;
          *((_BYTE *)v10 + v16 + 45) = IOSurfaceClientGetBitDepthOfComponentOfPlane(a2, uint64, v16);
          v17[49] = IOSurfaceClientGetBitOffsetOfComponentOfPlane(a2, uint64, v16);
          v17[53] = IOSurfaceClientGetNameOfComponentOfPlane(a2, uint64, v16);
          v17[57] = IOSurfaceClientGetTypeOfComponentOfPlane(a2, uint64, v16);
          v17[61] = IOSurfaceClientGetRangeOfComponentOfPlane(a2, uint64, v16++);
        }

        while (v15 != v16);
      }

      __int128 v18 = dispatch_data_create(v10, 0x48uLL, 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
      xpc_object_t v19 = xpc_data_create_with_dispatch_data(v18);
      xpc_dictionary_set_value(v7, "PlaneState", v19);

      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 3758097090LL;
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientBindAccel(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unsigned int uint64 = xpc_dictionary_get_uint64(v4, "AcceleratorID");
  unsigned int v6 = xpc_dictionary_get_uint64(v4, "AcceleratorField");

  return IOSurfaceClientBindAccel(a2, uint64, v6);
}

uint64_t _IOSurfaceRemoteMethodClientNeedsBindAccel(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  int uint64 = xpc_dictionary_get_uint64(v7, "AcceleratorID");
  int v9 = xpc_dictionary_get_uint64(v7, "AcceleratorField");

  BOOL v10 = IOSurfaceClientNeedsBindAccel(a2, uint64, v9);
  xpc_dictionary_set_BOOL(v6, "NeedsBindAccelerator", v10);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientSetValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = 3758097090LL;
  id v5 = (const __CFDictionary *)_ioSurfaceDeserializedFromXPCDictionaryWithKey(a3, "PropertiesDictionary");
  if (v5)
  {
    id v6 = v5;
    if (CFDictionaryGetValue(v5, @"isSetValues"))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v6, @"value");
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v8 = (void *)CFDictionaryGetValue(v6, @"key");
      int v9 = (const __CFDictionary *)CFDictionaryGetValue(v6, @"value");
      if (!v8)
      {
LABEL_7:
        CFRelease(v6);
        return v4;
      }

      Value = v9;
    }

    IOSurfaceClientSetValue(a2, v8, Value);
    uint64_t v4 = 0LL;
    goto LABEL_7;
  }

  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientCopyAllValues(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = IOSurfaceClientCopyAllValues(a2);
  if (!v6) {
    id v6 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL,  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  _ioSurfaceSerializeToXPCDictionaryWithKey(v5, "PropertiesDictionary", v6);
  CFRelease(v6);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveValue(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v4 = 3758097090LL;
  string = xpc_dictionary_get_string(xdict, "PropertyKey");
  if (string)
  {
    id v6 = (__CFString *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  string,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
    if (v6)
    {
      id v7 = v6;
      IOSurfaceClientRemoveValue(a2, v6);
      CFRelease(v7);
      return 0LL;
    }
  }

  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveAllValues(int a1, uint64_t a2)
{
  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientSetPurgeable(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *(void *)&value[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "NewState");
  value[0] = 0;
  uint64_t v8 = IOSurfaceClientSetPurgeable(a2, uint64, value);
  xpc_dictionary_set_uint64(v6, "OldState", value[0]);

  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientCreateMachPort(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  mach_port_name_t MachPort = IOSurfaceClientCreateMachPort(a2);
  if (MachPort - 1 <= 0xFFFFFFFD)
  {
    mach_port_name_t v7 = MachPort;
    xpc_dictionary_set_mach_send();
    mach_port_mod_refs(*MEMORY[0x1895FBBE0], v7, 0, -1);
  }

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCount(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCount(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUse(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  BOOL v6 = IOSurfaceClientIsInUse(a2);
  xpc_dictionary_set_BOOL(v5, "IsInUse", v6);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientCopyDataValueBytes(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  size[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 3758097085LL;
  id v7 = a3;
  id v8 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "BufferSize");
  if (uint64 <= 0xA00000)
  {
    size_t v10 = uint64;
    string = xpc_dictionary_get_string(v7, "PropertyKey");
    if (string
      && (CFStringRef v12 = CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  string,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DC8])) != 0LL)
    {
      int v13 = v12;
      __int128 v14 = calloc(1uLL, v10);
      if (v14)
      {
        uint64_t v15 = v14;
        size[0] = v10;
        uint64_t v6 = IOSurfaceClientCopyDataValueBytes(a2, v13, v14, size);
        CFRelease(v13);
        if ((_DWORD)v6 == -536870181)
        {
          xpc_dictionary_set_uint64(v8, "BufferSize", size[0]);
          goto LABEL_11;
        }

        if (!(_DWORD)v6)
        {
          unint64_t v16 = dispatch_data_create(v15, size[0], 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
          xpc_object_t v17 = xpc_data_create_with_dispatch_data(v16);
          xpc_dictionary_set_value(v8, "Buffer", v17);

LABEL_11:
          uint64_t v6 = 0LL;
        }
      }

      else
      {
        CFRelease(v13);
      }
    }

    else
    {
      uint64_t v6 = 3758097090LL;
    }
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientSignalEvent(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "EventValue");
  uint64_t v6 = xpc_dictionary_get_uint64(v4, "EventOperation");
  unsigned int v7 = xpc_dictionary_copy_mach_send();

  uint64_t v8 = IOSurfaceClientSignalEvent(a2, v7, uint64, v6);
  mach_port_mod_refs(*MEMORY[0x1895FBBE0], v7, 0, -1);
  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientSetBulkAttachments(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(a3, (uint64_t)v6, &v5);
  return IOSurfaceClientSetBulkAttachments(a2, (uint64_t)v6, 0x74uLL, v5);
}

uint64_t _IOSurfaceRemoteMethodClientGetBulkAttachments(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  size_t v8 = 116LL;
  id v5 = a4;
  uint64_t BulkAttachments = IOSurfaceClientGetBulkAttachments(a2, __dst, &v8);
  _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(v5, (uint64_t)__dst, -1);

  return BulkAttachments;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientIncrementUseCountForCategory(a2, uint64);
  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientDecrementUseCountForCategory(a2, uint64);
  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "Category");
  BOOL v8 = IOSurfaceClientIsInUseForCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForAnyOtherCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "Category");
  BOOL v8 = IOSurfaceClientIsInUseForAnyOtherCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0LL;
}

uint64_t _IOSurfaceRemoteMethodClientGetYCbCrMatrix(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&value[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  IOSurfaceClientGetYCbCrMatrix(a2, value);
  xpc_dictionary_set_uint64(v5, "YCbCrMatrixIndex", value[0]);

  return 0LL;
}

void _ioSurfaceAddClientState(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (char *)calloc(1uLL, 0x48uLL);
  *(_DWORD *)id v6 = 0;
  *((_DWORD *)v6 + 1) = a2;
  *((_DWORD *)v6 + 2) = IOSurfaceClientGetAllocSize(a1);
  *((_DWORD *)v6 + 6) = _IOSurfaceClientGetBufferOffset(a1);
  *((_DWORD *)v6 + 3) = IOSurfaceClientGetWidth(a1);
  *((_DWORD *)v6 + 4) = IOSurfaceClientGetHeight(a1);
  *((_DWORD *)v6 + 5) = IOSurfaceClientGetBytesPerRow(a1);
  *((_DWORD *)v6 + 7) = IOSurfaceClientGetPixelFormat(a1);
  *((_DWORD *)v6 + 8) = IOSurfaceClientGetCacheMode(a1);
  *((_DWORD *)v6 + 9) = IOSurfaceClientGetPlaneCount(a1);
  *((_DWORD *)v6 + 10) = IOSurfaceClientGetBytesPerElement(a1);
  *((_DWORD *)v6 + 11) = IOSurfaceClientGetElementWidth(a1);
  *((_DWORD *)v6 + 12) = IOSurfaceClientGetElementHeight(a1);
  *((_DWORD *)v6 + 13) = IOSurfaceClientGetSeed(a1);
  *((_DWORD *)v6 + 14) = IOSurfaceClientGetSubsampling(a1);
  v6[60] = v6[60] & 0xFE | (IOSurfaceClientAllowsPixelSizeCasting(a1) != 0);
  if (IOSurfaceClientIsSysMemOnly(a1)) {
    char v7 = 2;
  }
  else {
    char v7 = 0;
  }
  v6[60] = v6[60] & 0xFD | v7;
  if (IOSurfaceClientIsDisplayable(a1)) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  v6[60] = v6[60] & 0xFB | v8;
  *(void *)(v6 + 61) = IOSurfaceClientGetTraceID(a1);
  v6[60] = v6[60] & 0xF7 | (8 * (IOSurfaceClientGetProhibitUseCount(a1) != 0));
  uint64_t v10 = dispatch_data_create(v6, 0x48uLL, 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
  xpc_object_t v9 = xpc_data_create_with_dispatch_data(v10);
  xpc_dictionary_set_value(v5, "SurfaceState", v9);
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_6(void *a1, const char *a2)
{
  return [a1 pid];
}

id _copyDescriptions(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v3 = [a1 count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      id v6 = (void *)objc_msgSend(a1, "objectAtIndex:", i, 0, v16);
      char v7 = (void *)IOCFUnserializeWithSize( (const char *)[v6 bytes],  objc_msgSend(v6, "length"),  0,  0,  &v15);
      char v8 = (void *)[v7 objectForKey:@"BasicInfo"];
      uint64_t v9 = 0LL;
      if ([v8 length] == 120) {
        uint64_t v9 = [v8 bytes];
      }
      uint64_t v10 = (void *)[v7 objectForKey:@"Layout"];
      if ([v10 length] == 48) {
        uint64_t v11 = [v10 bytes];
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = [v7 objectForKey:@"IOSurfaceName"];
      if (v9 && v11)
      {
        int v13 = -[_IOSurfaceDebugDescription initWithBasicInfo:layoutInfo:name:]( objc_alloc(&OBJC_CLASS____IOSurfaceDebugDescription),  "initWithBasicInfo:layoutInfo:name:",  v9,  v11,  v12);
        [v2 addObject:v13];
      }
    }
  }

  return v2;
}

uint64_t IOSurfaceNotifierGetTypeID()
{
  uint64_t result = kIOSurfaceNotifierID;
  if (!kIOSurfaceNotifierID)
  {
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
    return kIOSurfaceNotifierID;
  }

  return result;
}

uint64_t ioSurfaceNotifierClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOSurfaceNotifierint ID = result;
  return result;
}

void IOSurfaceNotifierSetDispatchQueue(uint64_t a1, dispatch_queue_s *a2)
{
  if (a2)
  {
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), a2);
    *(void *)(a1 + 32) = a2;
  }

  else
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
    dispatch_queue_t current_queue = dispatch_get_current_queue();
    if (current_queue && current_queue == v4) {
      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), 0LL);
    }
    else {
      dispatch_sync_f(v4, (void *)a1, (dispatch_function_t)tearDownCallback);
    }
    *(void *)(a1 + 32) = 0LL;
  }

void tearDownCallback(uint64_t a1)
{
}

uint64_t IOSurfaceNotifierCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!kIOSurfaceNotifierID) {
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 24) = a1;
  *(void *)(Instance + 40) = a3;
  id v6 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
  *(void *)(Instance + 16) = v6;
  if (v6)
  {
    mach_port_t MachPort = IONotificationPortGetMachPort(v6);
    int v8 = IOSurfaceClientSetSurfaceNotify(MachPort, (uint64_t)IOSurfaceNotifierNotifyFunc, Instance);
    if (!v8)
    {
      *(_BYTE *)(Instance + 48) = 1;
      return Instance;
    }

    fprintf((FILE *)*MEMORY[0x1895F89D0], "IOSurfaceClientSetSurfaceNotify failed %08x\n", v8);
  }

  CFRelease((CFTypeRef)Instance);
  return 0LL;
}

uint64_t IOSurfaceNotifierNotifyFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1 + 24))(*(void *)(a1 + 40), a4, 0LL, 0LL);
}

uint64_t IOSurfaceNotifierInvalidate(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
  {
    uint64_t v1 = result;
    uint64_t result = IOSurfaceClientRemoveSurfaceNotify(result);
    *(_BYTE *)(v1 + 48) = 0;
  }

  return result;
}

void ioSurfaceNotifierFinalize(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48)) {
    IOSurfaceClientRemoveSurfaceNotify(a1);
  }
  id v2 = *(IONotificationPort **)(a1 + 16);
  if (v2)
  {
    if (!*(void *)(a1 + 32)
      || (IONotificationPortSetDispatchQueue(v2, 0LL), (id v2 = *(IONotificationPort **)(a1 + 16)) != 0LL))
    {
      IONotificationPortDestroy(v2);
    }
  }

CFStringRef ioSurfaceNotifierCopyFormatDescription(void *a1, const __CFDictionary *a2)
{
  CFIndex v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat( 0LL,  a2,  @"<IOSurfaceNotifier %p refcnt=%d notificationPort=%p callback=%p, refcon=%p>",  a1,  v4,  a1[2],  a1[3],  a1[5]);
}

uint64_t ioSurfaceNotifierCopyDebugDescription()
{
  return 0LL;
}

void _ioSurfaceSerializeToXPCDictionaryWithKey(void *a1, const char *a2, const void *a3)
{
  destructor[5] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  if (v5)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1896077D8] currentHandler];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInFunction:v14, @"IOSurfaceRemoteProtocol.m", 82, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    CFStringRef v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInFunction:v16, @"IOSurfaceRemoteProtocol.m", 83, @"Invalid parameter not satisfying: %@", @"object" file lineNumber description];

    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 handleFailureInFunction:v12, @"IOSurfaceRemoteProtocol.m", 81, @"Invalid parameter not satisfying: %@", @"dict" file lineNumber description];

  if (!a2) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  id v6 = IOCFSerialize(a3, 1uLL);
  BytePtr = CFDataGetBytePtr(v6);
  size_t Length = CFDataGetLength(v6);
  destructor[0] = MEMORY[0x1895F87A8];
  destructor[1] = 3221225472LL;
  destructor[2] = ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke;
  destructor[3] = &__block_descriptor_40_e5_v8__0l;
  destructor[4] = v6;
  uint64_t v9 = dispatch_data_create(BytePtr, Length, 0LL, destructor);
  xpc_object_t v10 = xpc_data_create_with_dispatch_data(v9);
  xpc_dictionary_set_value(v5, a2, v10);
}

void ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke(uint64_t a1)
{
}

CFTypeRef _ioSurfaceDeserializedFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  length[1] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  if (v3)
  {
    if (a2) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInFunction:v8, @"IOSurfaceRemoteProtocol.m", 96, @"Invalid parameter not satisfying: %@", @"dict" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 handleFailureInFunction:v10, @"IOSurfaceRemoteProtocol.m", 97, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];

LABEL_3:
  data = (const char *)xpc_dictionary_get_data(v3, a2, length);
  if (data)
  {
    CFTypeRef v5 = IOCFUnserializeBinary(data, length[0], (CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &errorString);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1((uint64_t)a2, (uint64_t *)&errorString);
      }
      CFRelease(errorString);
    }
  }

  else
  {
    CFTypeRef v5 = 0LL;
  }

  return v5;
}

void _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(void *a1, uint64_t a2, __int16 a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = v5;
  if ((a3 & 1) != 0)
  {
    uint64_t v10 = 0LL;
    __int128 v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
    *(_OWORD *)&v11[16] = v9;
    xpc_dictionary_set_data(v5, "CleanAperture", &v10, 0x28uLL);
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }

  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }

  uint64_t v10 = 0LL;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)(a2 + 32);
  xpc_dictionary_set_data(v6, "PixelAspectRatio", &v10, 0x18uLL);
  if ((a3 & 0x800) == 0)
  {
LABEL_4:
    if ((a3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }

LABEL_21:
  uint64_t v10 = 0LL;
  *(void *)uint64_t v11 = *(void *)(a2 + 80);
  *(_OWORD *)&v11[8] = *(_OWORD *)(a2 + 64);
  xpc_dictionary_set_data(v6, "MasteringDisplayColorVolume", &v10, 0x20uLL);
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }

LABEL_22:
  uint64_t v10 = *(void *)(a2 + 48);
  xpc_dictionary_set_data(v6, "GammaLevel", &v10, 8uLL);
  if ((a3 & 0x2000) == 0)
  {
LABEL_6:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }

LABEL_23:
  uint64_t v10 = *(void *)(a2 + 92);
  xpc_dictionary_set_data(v6, "EDRFactor", &v10, 8uLL);
  if ((a3 & 0x1000) == 0)
  {
LABEL_7:
    if ((a3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }

LABEL_25:
  xpc_dictionary_set_uint64(v6, "FieldCount", *(unsigned __int8 *)(a2 + 56));
  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }

LABEL_26:
  xpc_dictionary_set_uint64(v6, "FieldDetail", *(unsigned __int8 *)(a2 + 57));
  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }

LABEL_27:
  xpc_dictionary_set_uint64(v6, "YCbCrMatrixIndex", *(unsigned __int8 *)(a2 + 58));
  if ((a3 & 0x40) == 0)
  {
LABEL_11:
    if ((a3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }

LABEL_28:
  xpc_dictionary_set_uint64(v6, "ColorPrimariesIndex", *(unsigned __int8 *)(a2 + 59));
  if ((a3 & 0x80) == 0)
  {
LABEL_12:
    if ((a3 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }

LABEL_29:
  xpc_dictionary_set_uint64(v6, "TransferFunctionIndex", *(unsigned __int8 *)(a2 + 60));
  if ((a3 & 0x100) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

LABEL_30:
  xpc_dictionary_set_uint64(v6, "ChromaLocationTopField", *(unsigned __int8 *)(a2 + 61));
  if ((a3 & 0x200) != 0) {
LABEL_14:
  }
    xpc_dictionary_set_uint64(v6, "ChromaLocationBottomField", *(unsigned __int8 *)(a2 + 62));
LABEL_15:
  if ((a3 & 0x4400) != 0)
  {
    if ((a3 & 0x400) != 0)
    {
      uint64_t v7 = *(_BYTE *)(a2 + 63) & 0xF;
      if ((a3 & 0x4000) != 0) {
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
      if ((a3 & 0x4000) != 0)
      {
LABEL_18:
        xpc_dictionary_set_uint64(v6, "ChromaSubsampling", v7 | (16LL * *(unsigned __int8 *)(a2 + 100)) | 0x80);
        uint64_t v7 = *(unsigned __int8 *)(a2 + 100);
        int v8 = "PremultipliedAlpha";
LABEL_34:
        xpc_dictionary_set_uint64(v6, v8, v7);
        goto LABEL_35;
      }
    }

    int v8 = "ChromaSubsampling";
    goto LABEL_34;
  }

void _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  if (_ioSurfaceCopyStructFromKey(v4, "CleanAperture", v36, 0x28uLL))
  {
    __int128 v5 = v38;
    *(_OWORD *)a2 = v37;
    *(_OWORD *)(a2 + 16) = v5;
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if (_ioSurfaceCopyStructFromKey(v4, "PixelAspectRatio", v34, 0x18uLL))
  {
    v6 |= 2uLL;
    *(_OWORD *)(a2 + 32) = v35;
  }

  if (_ioSurfaceCopyStructFromKey(v4, "MasteringDisplayColorVolume", v31, 0x20uLL))
  {
    v6 |= 0x800uLL;
    *(void *)(a2 + 80) = v32;
    *(_OWORD *)(a2 + 64) = v33;
  }

  if (_ioSurfaceCopyStructFromKey(v4, "GammaLevel", &v30, 8uLL))
  {
    v6 |= 4uLL;
    *(void *)(a2 + 48) = v30;
  }

  if (_ioSurfaceCopyStructFromKey(v4, "EDRFactor", &v29, 8uLL))
  {
    v6 |= 0x2000uLL;
    *(void *)(a2 + 92) = v29;
  }

  if (_ioSurfaceCopyStructFromKey(v4, "ContentLightLevelInfo", v27, 8uLL))
  {
    v6 |= 0x1000uLL;
    *(_DWORD *)(a2 + 88) = v28;
  }

  xpc_dictionary_get_value(v4, "FieldCount");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v25 = v7;
  if (v7)
  {
    v6 |= 8uLL;
    *(_BYTE *)(a2 + 56) = xpc_uint64_get_value(v7);
  }

  xpc_dictionary_get_value(v4, "FieldDetail");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v8;
  if (v8)
  {
    v6 |= 0x10uLL;
    *(_BYTE *)(a2 + 57) = xpc_uint64_get_value(v8);
  }

  xpc_dictionary_get_value(v4, "YCbCrMatrixIndex");
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (v9)
  {
    v6 |= 0x20uLL;
    *(_BYTE *)(a2 + 58) = xpc_uint64_get_value(v9);
  }

  xpc_dictionary_get_value(v4, "ColorPrimariesIndex");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    v6 |= 0x40uLL;
    *(_BYTE *)(a2 + 59) = xpc_uint64_get_value(v11);
  }

  xpc_dictionary_get_value(v4, "TransferFunctionIndex");
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = v13;
  if (v13)
  {
    v6 |= 0x80uLL;
    *(_BYTE *)(a2 + 60) = xpc_uint64_get_value(v13);
  }

  xpc_dictionary_get_value(v4, "ChromaLocationTopField");
  CFStringRef v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (v15)
  {
    v6 |= 0x100uLL;
    *(_BYTE *)(a2 + 61) = xpc_uint64_get_value(v15);
  }

  xpc_dictionary_get_value(v4, "ChromaLocationBottomField");
  xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v18 = v17;
  if (v17)
  {
    v6 |= 0x200uLL;
    *(_BYTE *)(a2 + 62) = xpc_uint64_get_value(v17);
  }

  xpc_dictionary_get_value(v4, "ChromaSubsampling");
  xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  CFTypeRef v20 = v19;
  if (v19)
  {
    unsigned int value = xpc_uint64_get_value(v19);
    if ((value & 0xF) != 0)
    {
      v6 |= 0x400uLL;
      *(_BYTE *)(a2 + 63) = value & 0xF;
    }

    if ((value & 0x80) != 0)
    {
      v6 |= 0x4000uLL;
      *(_BYTE *)(a2 + 100) = (value >> 4) & 0xF7;
    }
  }

  xpc_dictionary_get_value(v4, "PremultipliedAlpha");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v22;
  if (v22)
  {
    v6 |= 0x4000uLL;
    *(_BYTE *)(a2 + 100) = xpc_uint64_get_value(v22);
  }

  if (a3) {
    *a3 = v6;
  }
}

BOOL _ioSurfaceCopyStructFromKey(void *a1, const char *a2, void *a3, size_t a4)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    bzero(a3, a4);
    BOOL v7 = xpc_data_get_bytes(v6, a3, 0LL, a4) == a4;
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

void ___ioSurfaceConnectInternal_block_invoke_cold_1()
{
}

void ___ioSurfaceConnectInternal_block_invoke_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ioSurfaceConnectInternal_block_invoke_cold_3(char *a1)
{
}

void ___ioSurfaceConnectInternal_block_invoke_cold_4(char *a1)
{
}

void IOSurfaceClientDisallowForever_cold_1()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  *(_WORD *)mach_port_t v0 = 0;
  _os_log_fault_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "IOSurfaceDisallowForever() invoked too late, connection to IOSurface.kext already established",  v0,  2u);
  OUTLINED_FUNCTION_3();
}

void IOSurfaceClientCreateChild_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOSurfaceClientCreateChild_cold_2()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  mach_port_t v0 = "";
  if (_iosConnectReturn == -536870174) {
    mach_port_t v0 = " (likely sandbox violation)";
  }
  v1[0] = 67109378;
  v1[1] = _iosConnectReturn;
  __int16 v2 = 2080;
  id v3 = v0;
  _os_log_error_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "IOSurface creation failed. IOSurface open failed: %08x %s",  (uint8_t *)v1,  0x12u);
  OUTLINED_FUNCTION_1();
}

void IOSurfaceClientCreateChild_cold_3(int a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = "";
  v4[0] = 67109890;
  __int16 v5 = 1024;
  v4[1] = a1;
  int v6 = a2;
  if (a1 == -536870210) {
    id v3 = " (likely per client IOSurface limit of 16384 reached)";
  }
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  __int16 v9 = 2080;
  uint64_t v10 = v3;
  _os_log_error_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "IOSurface creation failed: %08x parentID: %08x properties: %@%s",  (uint8_t *)v4,  0x22u);
}

void IOSurfaceClientRelease_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "IOSurfaceClientInvalidate failed: %08x",  (uint8_t *)v1,  8u);
  OUTLINED_FUNCTION_3();
}

void IOSurfaceClientIncrementUseCountForCategory_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOSurfaceSharedEventAddEventListener_cold_1()
{
}

void _ioSurfaceEventNotificationCallback2_cold_1()
{
}

void _ioSurfaceEventNotificationCallback2_cold_2()
{
  __assert_rtn("_ioSurfaceEventNotificationCallback2", "IOSurfaceSharedEvent.m", 315, "result == kIOReturnSuccess");
}

void _IOSurfaceRemoteMethodClientCreate_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  [a1 pid];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Failed to map client shared memory object from pid %d",  v1,  8u);
  OUTLINED_FUNCTION_3();
}

void _IOSurfaceRemoteMethodClientCreate_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_fault_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "IOSurface client memory mapping is %lu bytes but client claims allocation size of %lu bytes",  (uint8_t *)&v2,  0x16u);
}

void _IOSurfaceRemoteMethodClientCreate_cold_3(void *a1)
{
}

void _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a2;
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "IOSurface Deserialization failure for key %{public}s: %@",  (uint8_t *)&v3,  0x16u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x189602EF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x189602F20](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x189603258](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x189603278]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x189603280](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x189607C88](object, options);
}

CFTypeRef IOCFUnserializeBinary( const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x189607C98](buffer, bufferSize, allocator, options, errorString);
}

CFTypeRef IOCFUnserializeWithSize( const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x189607CA0](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CA8]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  inputStruct);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x189607D00](*(void *)&connect, *(void *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x189607D08](*(void *)&connect, *(void *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x189607D10](*(void *)&connect, *(void *)&index, p1, p2, p3);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x189608340](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator( io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x189608480](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x189607600]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x189607BB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1895FAC38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1895FB030]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

void sys_dcache_flush(void *start, size_t len)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x1895FD508](a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1895FDB88]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1895FDCF8]();
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1895FDF18]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1895FDF28]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FE020](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1895FE030](xshmem, region);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FE0D0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}