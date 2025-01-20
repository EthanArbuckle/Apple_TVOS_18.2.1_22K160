@interface LPAPFSContainer
+ (id)allAPFSContainers;
+ (id)diagsContainer;
+ (id)supportedContentTypes;
- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9;
- (id)physicalStores;
- (id)prebootVolume;
- (id)recoveryVolume;
- (id)updateVolume;
- (id)volumes;
- (id)volumesWithRole:(int)a3;
@end

@implementation LPAPFSContainer

+ (id)supportedContentTypes
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = LPAPFSContainerMediaTypeUUID[0];
  return (id)[MEMORY[0x189603F18] arrayWithObjects:v3 count:1];
}

+ (id)allAPFSContainers
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v13[2] = a1;
  v13[1] = (id)a2;
  v13[0] = +[LPMedia allMedia](&OBJC_CLASS___LPMedia, "allMedia");
  id v12 = (id)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  objc_msgSend(v13[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = v13[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = 0LL;
      uint64_t v11 = *(void *)(__b[1] + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        [v12 addObject:v11];
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0LL;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = (id)[MEMORY[0x189603F18] arrayWithArray:v12];
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(v13, 0LL);
  return v3;
}

+ (id)diagsContainer
{
  uint64_t v14 = 0LL;
  uint64_t v15 = "+[LPAPFSContainer diagsContainer]";
  uint64_t v29 = *MEMORY[0x1895F89C0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = +[LPPartitionMedia primaryMedia](&OBJC_CLASS___LPPartitionMedia, "primaryMedia");
  if (location[0])
  {
    id v19 = 0LL;
    id v18 = (id)[location[0] children];
    uint64_t v11 = v16;
    memset(v16, 0, sizeof(v16));
    id v12 = v18;
    uint64_t v13 = [v12 countByEnumeratingWithState:v16 objects:v28 count:16];
    if (v13)
    {
      uint64_t v8 = *(void *)v16[2];
      uint64_t v9 = v14;
      uint64_t v10 = v13;
      while (1)
      {
        unint64_t v6 = v10;
        uint64_t v7 = v9;
        if (*(void *)v16[2] != v8) {
          objc_enumerationMutation(v12);
        }
        id v17 = 0LL;
        id v17 = *(id *)(v16[1] + 8 * v7);
        v5[4] = v17;
        objc_opt_class();
        uint64_t v9 = v7 + 1;
        uint64_t v10 = v6;
        if (v7 + 1 >= v6)
        {
          uint64_t v9 = v14;
          uint64_t v10 = [v12 countByEnumeratingWithState:v16 objects:v28 count:16];
          if (!v10) {
            goto LABEL_12;
          }
        }
      }

      id v2 = (id)[v17 container];
      id v3 = v19;
      id v19 = v2;

      int v20 = 4;
    }

    else
    {
LABEL_12:
      int v20 = 0;
    }

    v5[2] = &v19;
    id v27 = v19;
    int v20 = 1;
    v5[3] = 0LL;
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    uint64_t v25 = _os_log_pack_size();
    v24 = v5;
    uint64_t v23 = v25;
    v22 = (char *)v5 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v21, (uint64_t)v15);
    _LPLogPack(1);
    id v27 = 0LL;
    int v20 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v27;
}

- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9
{
  int v43 = a4;
  BOOL v44 = a5;
  int64_t v45 = a6;
  int64_t v46 = a7;
  id obj = a8;
  v48 = a9;
  v39 = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
  BOOL v40 = MEMORY[0x18960CD20] == 0LL;
  BOOL v41 = MEMORY[0x18960CD10] == 0LL;
  BOOL v42 = MEMORY[0x18960CC68] == 0LL;
  uint64_t v119 = *MEMORY[0x1895F89C0];
  v117 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v115 = v43;
  BOOL v114 = v44;
  int64_t v113 = v45;
  int64_t v112 = v46;
  id v111 = 0LL;
  objc_storeStrong(&v111, obj);
  v110 = a9;
  id v109 = -[LPMedia BSDName](v117, "BSDName");
  id v108 = (id)[MEMORY[0x189603FC8] dictionaryWithCapacity:5];
  int v107 = 0;
  __int16 v106 = 0;
  id v105 = 0LL;
  if (!v109)
  {
    if (v110) {
      id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v104 = _os_log_pack_size();
    v103 = v15;
    uint64_t v102 = v104;
    v101 = (char *)v15 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v100 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v100, (uint64_t)v39);
    _LPLogPack(1);
    id v118 = 0LL;
    int v99 = 1;
    goto LABEL_52;
  }

  if (!location[0])
  {
    if (v110) {
      id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v98 = _os_log_pack_size();
    v97 = v15;
    uint64_t v96 = v98;
    v95 = (char *)v15 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v94 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v94, (uint64_t)v39);
    _LPLogPack(1);
    id v118 = 0LL;
    int v99 = 1;
    goto LABEL_52;
  }

  if ((unint64_t)[location[0] length] >= 0x80)
  {
    if (v110) {
      id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v93 = _os_log_pack_size();
    v92 = v15;
    uint64_t v91 = v93;
    v90 = (char *)v15 - ((v93 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v89 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v89, (uint64_t)v39);
    _LPLogPack(1);
    id v118 = 0LL;
    int v99 = 1;
    goto LABEL_52;
  }

  if (!v111) {
    goto LABEL_23;
  }
  id v9 = (id)[v111 BSDName];
  id v10 = v105;
  id v105 = v9;

  if (v115 != 1 && v111)
  {
    if (v110) {
      id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v88 = _os_log_pack_size();
    v87 = v15;
    uint64_t v86 = v88;
    v85 = (char *)v15 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v84 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v84, (uint64_t)v39);
    _LPLogPack(1);
    id v118 = 0LL;
    int v99 = 1;
    goto LABEL_52;
  }

  if ([v105 hasPrefix:v109])
  {
LABEL_23:
    uint64_t v38 = v115;
    if (v115 <= 0x10uLL) {
      __asm { BR              X8 }
    }

    __int16 v106 = 0;
    [v108 setObject:location[0] forKey:*MEMORY[0x18960CD18]];
    id v36 = v108;
    id v37 = (id)[MEMORY[0x189607968] numberWithUnsignedShort:0];
    objc_msgSend(v108, "setObject:forKey:");

    if (!v40) {
      [v108 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960CD20]];
    }
    if (v114) {
      [v108 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960CD00]];
    }
    if (v113)
    {
      id v34 = v108;
      id v35 = (id)[MEMORY[0x189607968] numberWithLongLong:v113];
      objc_msgSend(v108, "setObject:forKey:");
    }

    if (v112)
    {
      id v32 = v108;
      id v33 = (id)[MEMORY[0x189607968] numberWithLongLong:v112];
      objc_msgSend(v108, "setObject:forKey:");
    }

    if (!v105) {
      goto LABEL_43;
    }
    if (v41)
    {
      uint64_t v70 = _os_log_pack_size();
      v69 = v15;
      uint64_t v68 = v70;
      v67 = (char *)v15 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v66 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v66, (uint64_t)v39);
      _LPLogPack(1);
      id v118 = 0LL;
      int v99 = 1;
      goto LABEL_52;
    }

    id v78 = (id)[v105 substringFromIndex:4];
    id v77 = (id)[v78 componentsSeparatedByString:@"s"];
    if ((unint64_t)[v77 count] >= 2)
    {
      id v27 = v77;
      id v28 = (id)objc_msgSend(v77, "objectAtIndex:", objc_msgSend(v77, "count") - 1);
      unsigned int v29 = [v28 intValue];

      unsigned int v71 = v29;
      id v30 = v108;
      id v31 = (id)[MEMORY[0x189607968] numberWithInt:v29];
      objc_msgSend(v108, "setObject:forKey:");

      int v99 = 0;
    }

    else
    {
      if (v110) {
        id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      }
      uint64_t v76 = _os_log_pack_size();
      v75 = v15;
      uint64_t v74 = v76;
      v73 = (char *)v15 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v72 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v72, (uint64_t)v39);
      _LPLogPack(1);
      id v118 = 0LL;
      int v99 = 1;
    }

    id v26 = 0LL;
    objc_storeStrong(&v77, 0LL);
    objc_storeStrong(&v78, v26);
    if (!v99)
    {
LABEL_43:
      uint64_t v65 = 0LL;
      uint64_t v65 = _os_log_pack_size();
      v64 = v15;
      uint64_t v63 = v65;
      v62 = (char *)v15 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v61 = _os_log_pack_fill();
      uint64_t v25 = v61;
      uint64_t v11 = [v109 fileSystemRepresentation];
      __os_log_helper_1_2_3_8_32_8_32_8_64(v25, (uint64_t)v39, v11, (uint64_t)v108);
      _LPLogPack(1);
      if (v42 || v115 != 1)
      {
        [v109 fileSystemRepresentation];
        int v107 = APFSVolumeCreate();
      }

      else
      {
        uint64_t v60 = 0LL;
        uint64_t v60 = _os_log_pack_size();
        v59 = v15;
        uint64_t v58 = v60;
        v57 = (char *)v15 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v56 = _os_log_pack_fill();
        __os_log_helper_1_2_1_8_32(v56, (uint64_t)v39);
        _LPLogPack(1);
        [v109 fileSystemRepresentation];
        int v107 = APFSVolumeCreateForMSU();
      }

      if (v107)
      {
        if (v110)
        {
          id v12 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v107 userInfo:0];
          id *v110 = v12;
        }

        uint64_t v55 = 0LL;
        uint64_t v55 = _os_log_pack_size();
        v54 = v15;
        uint64_t v53 = v55;
        v52 = (char *)v15 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v51 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v51, (uint64_t)v39, v107);
        _LPLogPack(1);
        id v118 = 0LL;
        int v99 = 1;
      }

      else
      {
        uint64_t v23 = &v50;
        id v24 = 0LL;
        id v50 = 0LL;
        id v50 = (id)[v108 objectForKey:*MEMORY[0x18960CD08]];
        v22 = &v49;
        id v49 = 0LL;
        id v17 = (id)NSString;
        id v16 = v109;
        int v13 = [v50 intValue];
        int v21 = 1;
        id v49 = (id)[v17 stringWithFormat:@"%@s%d", v16, (v13 + 1)];
        unint64_t v20 = 0x189E33000uLL;
        id v18 = &OBJC_CLASS___LPMedia;
        id v19 = -[LPMedia BSDName](v117, "BSDName");
        -[__objc2_class waitForIOMediaWithDevNode:](v18, "waitForIOMediaWithDevNode:");

        id v118 = (id)[*(id *)(v20 + 1704) mediaForBSDNameOrDeviceNode:v49];
        int v99 = v21;
        objc_storeStrong(v22, v24);
        objc_storeStrong(v23, v24);
      }
    }
  }

  else
  {
    if (v110) {
      id *v110 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v83 = _os_log_pack_size();
    v82 = v15;
    uint64_t v81 = v83;
    v80 = (char *)v15 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v79 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v79, (uint64_t)v39);
    _LPLogPack(1);
    id v118 = 0LL;
    int v99 = 1;
  }

- (id)volumes
{
  id v17 = &v33;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  BOOL v41 = self;
  SEL v40 = a2;
  id v18 = &OBJC_CLASS___LPMedia;
  id v19 = -[LPMedia BSDName](self, "BSDName");
  id v16 = v19;
  +[LPMedia waitForIOMediaWithDevNode:](&OBJC_CLASS___LPMedia, "waitForIOMediaWithDevNode:");

  io_iterator_t v39 = 0;
  unsigned int v15 = -[LPMedia ioMedia](v41, "ioMedia");
  if (MEMORY[0x186E34AE0](v15, "IOService", 1LL, &v39))
  {
    v17[10] = 0LL;
    uint64_t v2 = _os_log_pack_size();
    id v3 = v17;
    v17[10] = v2;
    uint64_t v4 = v3[10];
    v3[9] = (uint64_t)v10;
    v3[8] = v4;
    v3[7] = 0LL;
    v3[7] = (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v5 = _os_log_pack_fill();
    unint64_t v6 = v17;
    v17[6] = v5;
    __os_log_helper_1_0_0((_BYTE *)v6[6]);
    _LPLogPack(1);
    id v7 = MEMORY[0x189604A58];
    v17[14] = (uint64_t)v7;
  }

  else
  {
    uint64_t v8 = v17;
    uint64_t v33 = 0LL;
    id v34 = &v33;
    int v35 = 838860800;
    int v36 = 48;
    id v37 = __Block_byref_object_copy_;
    v17[4] = (uint64_t)__Block_byref_object_dispose_;
    v8[5] = 0LL;
    id v13 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:8];
    v17[5] = (uint64_t)v13;
    id v12 = (id *)&v38;
    uint64_t obj = MEMORY[0x1895F87A8];
    int v27 = -1040187392;
    int v28 = 0;
    unsigned int v29 = __26__LPAPFSContainer_volumes__block_invoke;
    id v30 = &__block_descriptor_44_e8_32r_e8_v12__0I8l;
    io_iterator_t v32 = v39;
    id v31 = &v33;
    uint64_t v20 = MEMORY[0x1895F87A8];
    int v21 = -1040187392;
    int v22 = 0;
    uint64_t v23 = __26__LPAPFSContainer_volumes__block_invoke_18;
    id v24 = &__block_descriptor_40_e8_32r_e5_v8__0l;
    uint64_t v25 = &v33;
    iterateSafely(v39, 3, &obj, &v20);
    IOObjectRelease(v39);
    id v11 = (id)[MEMORY[0x189603F18] arrayWithArray:v34[5]];
    v17[14] = (uint64_t)v11;
    _Block_object_dispose(&v33, 8);
    objc_storeStrong(v12, 0LL);
  }

  return (id)v17[14];
}

void __26__LPAPFSContainer_volumes__block_invoke(uint64_t a1, io_object_t a2)
{
  uint64_t v8 = a1;
  io_registry_entry_t v7 = a2;
  uint64_t v6 = a1;
  if (IOObjectConformsTo(a2, "IOMedia"))
  {
    MEMORY[0x186E34B10](*(unsigned int *)(a1 + 40));
    CFTypeRef cf = IORegistryEntryCreateCFProperty(v7, @"Content", 0LL, 0);
    if (cf)
    {
      CFTypeID v2 = CFGetTypeID(cf);
      if (v2 == CFStringGetTypeID()
        && CFStringCompare((CFStringRef)cf, LPAPFSVolumeMediaTypeUUID, 0LL) == kCFCompareEqualTo)
      {
        id location = -[LPMedia initWithIOMediaObject:]( objc_alloc(&OBJC_CLASS___LPAPFSVolume),  "initWithIOMediaObject:",  v7);
        if (location) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:location];
        }
        objc_storeStrong(&location, 0LL);
      }

      CFRelease(cf);
    }
  }

uint64_t __26__LPAPFSContainer_volumes__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "removeAllObjects", a1, a1);
}

- (id)physicalStores
{
  id v17 = "-[LPAPFSContainer physicalStores]";
  v46[1] = *MEMORY[0x1895F89C0];
  uint64_t v42 = self;
  v41[1] = (id)a2;
  id v18 = &OBJC_CLASS___LPMedia;
  id v19 = -[LPMedia BSDName](self, "BSDName");
  +[LPMedia waitForIOMediaWithDevNode:](&OBJC_CLASS___LPMedia, "waitForIOMediaWithDevNode:");

  v41[0] = (id)[MEMORY[0x189603FA8] arrayWithCapacity:2];
  id v40 = -[LPMedia mediaUUID](v42, "mediaUUID");
  if (v40)
  {
    uint64_t v14 = &v33;
    io_iterator_t v33 = 0;
    uint64_t v11 = 0LL;
    id v32 = (id)[MEMORY[0x189603FC8] dictionaryWithCapacity:5];
    id v9 = v32;
    int64_t v45 = @"Content";
    v46[0] = LPAPFSPhysicalStoreMediaUUID[0];
    id v10 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    objc_msgSend(v32, "setObject:forKey:");

    p_id location = &location;
    id location = 0LL;
    objc_storeStrong(&location, v32);
    CFDictionaryRef v13 = (CFDictionaryRef)location;
    objc_storeStrong(&location, 0LL);
    CFDictionaryRef v31 = v13;
    if (IOServiceGetMatchingServices(*MEMORY[0x1896086B0], v13, &v33))
    {
      uint64_t v30 = _os_log_pack_size();
      uint64_t v8 = v30;
      unsigned int v29 = v4;
      unint64_t v7 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      MEMORY[0x1895F8858]();
      uint64_t v28 = v8;
      int v27 = (char *)v4 - v7;
      uint64_t v26 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v26, (uint64_t)v17);
      _LPLogPack(1);
      id v43 = 0LL;
      int v34 = 1;
    }

    else
    {
      for (io_object_t i = 0; ; IOObjectRelease(i))
      {
        io_object_t i = IOIteratorNext(v33);
        if (!i) {
          break;
        }
        io_iterator_t v24 = 0;
        if (!MEMORY[0x186E34AE0](i, "IOService", 1LL, &v24))
        {
          io_registry_entry_t v23 = 0;
          unsigned __int8 v22 = 0;
          while (1)
          {
            io_registry_entry_t v23 = IOIteratorNext(v24);
            int v6 = 0;
            if (v23) {
              int v6 = v22 ^ 1;
            }
            if ((v6 & 1) == 0) {
              break;
            }
            if (IOObjectConformsTo(v23, "IOMedia"))
            {
              CFTypeRef CFProperty = 0LL;
              CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v23, @"UUID", 0LL, 0);
              if (CFProperty)
              {
                CFTypeID v5 = CFGetTypeID(CFProperty);
                if (v5 == CFStringGetTypeID() && CFEqual(CFProperty, v40))
                {
                  id v20 = 0LL;
                  CFTypeID v2 = objc_alloc(&OBJC_CLASS___LPAPFSPhysicalStore);
                  id v20 = -[LPMedia initWithIOMediaObject:](v2, "initWithIOMediaObject:", i);
                  if (v20) {
                    [v41[0] addObject:v20];
                  }
                  objc_storeStrong(&v20, 0LL);
                }

                CFRelease(CFProperty);
              }

              unsigned __int8 v22 = 1;
            }

            IOObjectRelease(v23);
          }

          IOObjectRelease(v24);
        }
      }

      if (v33) {
        IOObjectRelease(v33);
      }
      id v43 = (id)[MEMORY[0x189603F18] arrayWithArray:v41[0]];
      int v34 = 1;
    }

    objc_storeStrong(&v32, 0LL);
  }

  else
  {
    uint64_t v39 = _os_log_pack_size();
    uint64_t v16 = v39;
    uint64_t v38 = v4;
    unint64_t v15 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    MEMORY[0x1895F8858]();
    uint64_t v37 = v16;
    int v36 = (char *)v4 - v15;
    uint64_t v35 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v35, (uint64_t)v17);
    _LPLogPack(1);
    id v43 = 0LL;
    int v34 = 1;
  }

  v4[0] = 0LL;
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(v41, v4[0]);
  return v43;
}

- (id)volumesWithRole:(int)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v18 = self;
  SEL v17 = a2;
  int v16 = a3;
  id v15 = -[LPAPFSContainer volumes](self, "volumes");
  id v14 = (id)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  objc_msgSend(v15, "count"));
  memset(__b, 0, sizeof(__b));
  id obj = v15;
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = 0LL;
      id v13 = *(id *)(__b[1] + 8 * v8);
      int v3 = [v13 role];
      if (v3 == v16) {
        [v14 addObject:v13];
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v5 = (id)[MEMORY[0x189603F18] arrayWithArray:v14];
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  return v5;
}

- (id)prebootVolume
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 6LL);
  if ([location[0] count] == 1)
  {
    id v17 = (id)[location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size();
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (char *)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v5 = v10;
      id v6 = (id)[location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1);
      objc_storeStrong(v7, v8);
    }

    id v17 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v17;
}

- (id)recoveryVolume
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 4LL);
  if ([location[0] count] == 1)
  {
    id v17 = (id)[location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size();
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (char *)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v5 = v10;
      id v6 = (id)[location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1);
      objc_storeStrong(v7, v8);
    }

    id v17 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v17;
}

- (id)updateVolume
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 12LL);
  if ([location[0] count] == 1)
  {
    id v17 = (id)[location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size();
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (char *)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v5 = v10;
      id v6 = (id)[location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1);
      objc_storeStrong(v7, v8);
    }

    id v17 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v17;
}

@end