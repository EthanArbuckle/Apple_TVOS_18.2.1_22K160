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
  v3 = LPAPFSContainerMediaTypeUUID[0];
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v3, 1LL);
}

+ (id)allAPFSContainers
{
  v15[2] = a1;
  v15[1] = (id)a2;
  v15[0] = +[LPMedia allMedia](&OBJC_CLASS___LPMedia, "allMedia");
  v14 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15[0] count]);
  memset(__b, 0, sizeof(__b));
  id obj = v15[0];
  id v11 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = 0LL;
      uint64_t v13 = *(void *)(__b[1] + 8 * v8);
      uint64_t v5 = v13;
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___LPAPFSContainer);
      if ((objc_opt_isKindOfClass(v5, v2) & 1) != 0) {
        -[NSMutableArray addObject:](v14, "addObject:", v13);
      }
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  v4 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v14);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  return v4;
}

+ (id)diagsContainer
{
  uint64_t v16 = 0LL;
  v17 = "+[LPAPFSContainer diagsContainer]";
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = +[LPPartitionMedia primaryMedia](&OBJC_CLASS___LPPartitionMedia, "primaryMedia");
  if (location[0])
  {
    id v21 = 0LL;
    id v20 = [location[0] children];
    uint64_t v13 = v18;
    memset(v18, 0, sizeof(v18));
    id v14 = v20;
    id v15 = [v14 countByEnumeratingWithState:v18 objects:v30 count:16];
    if (v15)
    {
      uint64_t v10 = *(void *)v18[2];
      uint64_t v11 = v16;
      id v12 = v15;
      while (1)
      {
        unint64_t v8 = (unint64_t)v12;
        uint64_t v9 = v11;
        if (*(void *)v18[2] != v10) {
          objc_enumerationMutation(v14);
        }
        id v19 = 0LL;
        id v19 = *(id *)(v18[1] + 8 * v9);
        id v7 = v19;
        uint64_t v2 = objc_opt_class(&OBJC_CLASS___LPAPFSPhysicalStore);
        uint64_t v11 = v9 + 1;
        id v12 = (id)v8;
        if (v9 + 1 >= v8)
        {
          uint64_t v11 = v16;
          id v12 = [v14 countByEnumeratingWithState:v18 objects:v30 count:16];
          if (!v12) {
            goto LABEL_12;
          }
        }
      }

      id v3 = [v19 container];
      id v4 = v21;
      id v21 = v3;

      int v22 = 4;
    }

    else
    {
LABEL_12:
      int v22 = 0;
    }

    v6[2] = (const char *)&v21;
    id v29 = v21;
    int v22 = 1;
    v6[3] = 0LL;
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v21, 0LL);
  }

  else
  {
    uint64_t v27 = _os_log_pack_size(12LL);
    v26 = v6;
    uint64_t v25 = v27;
    uint64_t v24 = (uint64_t)v6 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill(v24, v27, 0LL, &_mh_execute_header, "%s: Failed to find primary media", v6[0]);
    __os_log_helper_1_2_1_8_32(v23, (uint64_t)v17);
    _LPLogPack(1, v24);
    id v29 = 0LL;
    int v22 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v29;
}

- (id)addVolumeWithName:(id)a3 role:(int)a4 caseSensitive:(BOOL)a5 reserveSize:(int64_t)a6 quotaSize:(int64_t)a7 pairedVolume:(id)a8 error:(id *)a9
{
  int v50 = a4;
  BOOL v51 = a5;
  int64_t v52 = a6;
  int64_t v53 = a7;
  id obj = a8;
  v55 = a9;
  v46 = "-[LPAPFSContainer addVolumeWithName:role:caseSensitive:reserveSize:quotaSize:pairedVolume:error:]";
  BOOL v47 = &kAPFSVolumeNoAutomountAtCreateKey == 0LL;
  BOOL v48 = &kAPFSVolumeGroupSiblingFSIndexKey == 0LL;
  BOOL v49 = &_APFSVolumeCreateForMSU == 0LL;
  v124 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v122 = v50;
  BOOL v121 = v51;
  int64_t v120 = v52;
  int64_t v119 = v53;
  id v118 = 0LL;
  objc_storeStrong(&v118, obj);
  v117 = a9;
  id v116 = -[LPMedia BSDName](v124, "BSDName");
  id v115 =  +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL);
  int v114 = 0;
  __int16 v113 = 0;
  id v112 = 0LL;
  if (!v116)
  {
    if (v117) {
      id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v111 = _os_log_pack_size(12LL);
    v110 = &v17;
    uint64_t v109 = v111;
    uint64_t v108 = (uint64_t)&v17 - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v107 = _os_log_pack_fill(v108, v111, 0LL, &_mh_execute_header, "%s : Container is somehow missing a BSD name.", v17);
    __os_log_helper_1_2_1_8_32(v107, (uint64_t)v46);
    _LPLogPack(1, v108);
    id v125 = 0LL;
    int v106 = 1;
    goto LABEL_52;
  }

  if (!location[0])
  {
    if (v117) {
      id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v105 = _os_log_pack_size(12LL);
    v104 = &v17;
    uint64_t v103 = v105;
    uint64_t v102 = (uint64_t)&v17 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v101 = _os_log_pack_fill(v102, v105, 0LL, &_mh_execute_header, "%s : You need to specify a volume name.", v17);
    __os_log_helper_1_2_1_8_32(v101, (uint64_t)v46);
    _LPLogPack(1, v102);
    id v125 = 0LL;
    int v106 = 1;
    goto LABEL_52;
  }

  if ((unint64_t)[location[0] length] >= 0x80)
  {
    if (v117) {
      id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v100 = _os_log_pack_size(12LL);
    v99 = &v17;
    uint64_t v98 = v100;
    uint64_t v97 = (uint64_t)&v17 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v96 = _os_log_pack_fill(v97, v100, 0LL, &_mh_execute_header, "%s : Volume name is invalid", v17);
    __os_log_helper_1_2_1_8_32(v96, (uint64_t)v46);
    _LPLogPack(1, v97);
    id v125 = 0LL;
    int v106 = 1;
    goto LABEL_52;
  }

  if (!v118) {
    goto LABEL_23;
  }
  id v9 = [v118 BSDName];
  id v10 = v112;
  id v112 = v9;

  if (v122 != 1 && v118)
  {
    if (v117) {
      id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v95 = _os_log_pack_size(12LL);
    v94 = &v17;
    uint64_t v93 = v95;
    uint64_t v92 = (uint64_t)&v17 - ((v95 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v91 = _os_log_pack_fill( v92,  v95,  0LL,  &_mh_execute_header,  "%s : Paired volume is not valid if role is not system.",  v17);
    __os_log_helper_1_2_1_8_32(v91, (uint64_t)v46);
    _LPLogPack(1, v92);
    id v125 = 0LL;
    int v106 = 1;
    goto LABEL_52;
  }

  if ([v112 hasPrefix:v116])
  {
LABEL_23:
    uint64_t v45 = v122;
    if (v122 <= 0x10uLL) {
      __asm { BR              X8 }
    }

    __int16 v113 = 0;
    [v115 setObject:location[0] forKey:kAPFSVolumeNameKey];
    id v43 = v115;
    v44 = +[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", 0LL);
    objc_msgSend(v115, "setObject:forKey:");

    if (!v47)
    {
      id v41 = v115;
      v42 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
      objc_msgSend(v115, "setObject:forKey:");
    }

    if (v121)
    {
      id v39 = v115;
      v40 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
      objc_msgSend(v115, "setObject:forKey:");
    }

    if (v120)
    {
      id v37 = v115;
      v38 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v120);
      objc_msgSend(v115, "setObject:forKey:");
    }

    if (v119)
    {
      id v35 = v115;
      v36 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v119);
      objc_msgSend(v115, "setObject:forKey:");
    }

    if (!v112) {
      goto LABEL_43;
    }
    if (v48)
    {
      uint64_t v77 = _os_log_pack_size(12LL);
      v76 = &v17;
      uint64_t v75 = v77;
      uint64_t v74 = (uint64_t)&v17 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v73 = _os_log_pack_fill( v74,  v77,  0LL,  &_mh_execute_header,  "%s : Requested system volume with sibling but the key is not supported.",  v17);
      __os_log_helper_1_2_1_8_32(v73, (uint64_t)v46);
      _LPLogPack(1, v74);
      id v125 = 0LL;
      int v106 = 1;
      goto LABEL_52;
    }

    id v85 = [v112 substringFromIndex:4];
    id v84 = [v85 componentsSeparatedByString:@"s"];
    if ((unint64_t)[v84 count] >= 2)
    {
      id v30 = v84;
      id v31 = objc_msgSend(v84, "objectAtIndex:", (char *)objc_msgSend(v84, "count") - 1);
      unsigned int v32 = [v31 intValue];

      unsigned int v78 = v32;
      id v33 = v115;
      v34 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v32);
      objc_msgSend(v115, "setObject:forKey:");

      int v106 = 0;
    }

    else
    {
      if (v117) {
        id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      }
      uint64_t v83 = _os_log_pack_size(12LL);
      v82 = &v17;
      uint64_t v81 = v83;
      uint64_t v80 = (uint64_t)&v17 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v79 = _os_log_pack_fill(v80, v83, 0LL, &_mh_execute_header, "%s : Container isn't a container?!", v17);
      __os_log_helper_1_2_1_8_32(v79, (uint64_t)v46);
      _LPLogPack(1, v80);
      id v125 = 0LL;
      int v106 = 1;
    }

    id v29 = 0LL;
    objc_storeStrong(&v84, 0LL);
    objc_storeStrong(&v85, v29);
    if (!v106)
    {
LABEL_43:
      uint64_t v72 = 0LL;
      uint64_t v72 = _os_log_pack_size(32LL);
      v71 = &v17;
      uint64_t v70 = v72;
      uint64_t v69 = (uint64_t)&v17 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v68 = _os_log_pack_fill(v69, v72, 0LL, &_mh_execute_header, "%s : Creating APFS volume %s with options: %@");
      uint64_t v28 = v68;
      id v11 = [v116 fileSystemRepresentation];
      __os_log_helper_1_2_3_8_32_8_32_8_64(v28, (uint64_t)v46, (uint64_t)v11, (uint64_t)v115);
      _LPLogPack(1, v69);
      if (v49 || v122 != 1)
      {
        id v13 = [v116 fileSystemRepresentation];
        int v114 = APFSVolumeCreate(v13, v115);
      }

      else
      {
        uint64_t v67 = 0LL;
        uint64_t v67 = _os_log_pack_size(12LL);
        v66 = &v17;
        uint64_t v65 = v67;
        uint64_t v64 = (uint64_t)&v17 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v63 = _os_log_pack_fill( v64,  v67,  0LL,  &_mh_execute_header,  "%s : APFSVolumeCreateForMSU exists and we're creating a System volume. Preferring it to APFSVolumeCreate.",  v17);
        __os_log_helper_1_2_1_8_32(v63, (uint64_t)v46);
        _LPLogPack(1, v64);
        id v12 = [v116 fileSystemRepresentation];
        int v114 = APFSVolumeCreateForMSU(v12, v115);
      }

      if (v114)
      {
        if (v117)
        {
          id v14 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v114,  0LL);
          id *v117 = v14;
        }

        uint64_t v62 = 0LL;
        uint64_t v62 = _os_log_pack_size(18LL);
        v61 = &v17;
        uint64_t v60 = v62;
        uint64_t v59 = (uint64_t)&v17 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v58 = _os_log_pack_fill(v59, v62, 0LL, &_mh_execute_header, "%s : Add volume failed with error: %d.", v17, v18);
        __os_log_helper_1_2_2_8_32_4_0(v58, (uint64_t)v46, v114);
        _LPLogPack(1, v59);
        id v125 = 0LL;
        int v106 = 1;
      }

      else
      {
        v26 = &v57;
        id v27 = 0LL;
        id v57 = 0LL;
        id v57 = [v115 objectForKey:kAPFSVolumeFSIndexKey];
        uint64_t v25 = &v56;
        id v56 = 0LL;
        id v20 = &OBJC_CLASS___NSString;
        id v19 = v116;
        unsigned int v15 = [v57 intValue];
        int v24 = 1;
        id v56 = -[objc_class stringWithFormat:](v20, "stringWithFormat:", @"%@s%d", v19, v15 + 1);
        p_cache = &OBJC_CLASS___MSULogAnnotatedSum.cache;
        id v21 = &OBJC_CLASS___LPMedia;
        id v22 = -[LPMedia BSDName](v124, "BSDName");
        -[__objc2_class waitForIOMediaWithDevNode:](v21, "waitForIOMediaWithDevNode:");

        id v125 = [p_cache + 68 mediaForBSDNameOrDeviceNode:v56];
        int v106 = v24;
        objc_storeStrong(v25, v27);
        objc_storeStrong(v26, v27);
      }
    }
  }

  else
  {
    if (v117) {
      id *v117 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v90 = _os_log_pack_size(12LL);
    v89 = &v17;
    uint64_t v88 = v90;
    uint64_t v87 = (uint64_t)&v17 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v86 = _os_log_pack_fill(v87, v90, 0LL, &_mh_execute_header, "%s : Paired volume must be in the same container", v17);
    __os_log_helper_1_2_1_8_32(v86, (uint64_t)v46);
    _LPLogPack(1, v87);
    id v125 = 0LL;
    int v106 = 1;
  }

- (id)volumes
{
  v17 = &v33;
  id v41 = self;
  SEL v40 = a2;
  int v18 = &OBJC_CLASS___LPMedia;
  id v19 = -[LPMedia BSDName](self, "BSDName");
  id v16 = v19;
  +[LPMedia waitForIOMediaWithDevNode:](&OBJC_CLASS___LPMedia, "waitForIOMediaWithDevNode:");

  io_iterator_t iterator = 0;
  io_registry_entry_t v15 = -[LPMedia ioMedia](v41, "ioMedia");
  if (IORegistryEntryCreateIterator(v15, "IOService", 1u, &iterator))
  {
    v17[10] = 0LL;
    uint64_t v2 = _os_log_pack_size(2LL);
    id v3 = v17;
    v17[10] = v2;
    uint64_t v4 = v3[10];
    v3[9] = (uint64_t)v10;
    v3[8] = v4;
    v3[7] = 0LL;
    v3[7] = (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v5 = _os_log_pack_fill(v3[7], v3[10], 0LL, &_mh_execute_header, "Failed to create container volumes iterator");
    uint64_t v6 = v17;
    v17[6] = v5;
    __os_log_helper_1_0_0((_BYTE *)v6[6]);
    _LPLogPack(1, v17[7]);
    id v7 = __NSArray0__;
    v17[14] = (uint64_t)v7;
  }

  else
  {
    unint64_t v8 = v17;
    uint64_t v33 = 0LL;
    v34 = &v33;
    int v35 = 838860800;
    int v36 = 48;
    id v37 = __Block_byref_object_copy__7;
    v17[4] = (uint64_t)__Block_byref_object_dispose__7;
    v8[5] = 0LL;
    id v13 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL);
    v17[5] = (uint64_t)v13;
    id v12 = (id *)&v38;
    id obj = _NSConcreteStackBlock;
    int v27 = -1040187392;
    int v28 = 0;
    id v29 = __26__LPAPFSContainer_volumes__block_invoke;
    id v30 = &__block_descriptor_44_e8_32r_e8_v12__0I8l;
    io_iterator_t v32 = iterator;
    id v31 = &v33;
    id v20 = _NSConcreteStackBlock;
    int v21 = -1040187392;
    int v22 = 0;
    uint64_t v23 = __26__LPAPFSContainer_volumes__block_invoke_18;
    int v24 = &__block_descriptor_40_e8_32r_e5_v8__0l;
    uint64_t v25 = &v33;
    iterateSafely(iterator, 3, &obj, &v20);
    IOObjectRelease(iterator);
    id v11 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v34[5]);
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
    IORegistryIteratorExitEntry(*(_DWORD *)(a1 + 40));
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

id __26__LPAPFSContainer_volumes__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "removeAllObjects", a1, a1);
}

- (id)physicalStores
{
  v17 = "-[LPAPFSContainer physicalStores]";
  v42 = self;
  v41[1] = (id)a2;
  int v18 = &OBJC_CLASS___LPMedia;
  id v19 = -[LPMedia BSDName](self, "BSDName");
  +[LPMedia waitForIOMediaWithDevNode:](&OBJC_CLASS___LPMedia, "waitForIOMediaWithDevNode:");

  v41[0] = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL);
  id v40 = -[LPMedia mediaUUID](v42, "mediaUUID");
  if (v40)
  {
    id v14 = &v33;
    io_iterator_t v33 = 0;
    uint64_t v11 = 0LL;
    id v32 =  +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL);
    id v9 = v32;
    uint64_t v45 = @"Content";
    v46 = LPAPFSPhysicalStoreMediaUUID[0];
    id v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL);
    objc_msgSend(v32, "setObject:forKey:");

    p_id location = &location;
    id location = 0LL;
    objc_storeStrong(&location, v32);
    CFDictionaryRef v13 = (CFDictionaryRef)location;
    objc_storeStrong(&location, 0LL);
    CFDictionaryRef v31 = v13;
    if (IOServiceGetMatchingServices(kIOMasterPortDefault, v13, &v33))
    {
      uint64_t v30 = _os_log_pack_size(12LL);
      uint64_t v8 = v30;
      id v29 = v4;
      unint64_t v7 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v28 = v8;
      uint64_t v27 = (uint64_t)v4 - v7;
      uint64_t v26 = _os_log_pack_fill( (char *)v4 - v7,  v30,  0LL,  &_mh_execute_header,  "%s : Can not iterate over physical store services.",  v4[0]);
      __os_log_helper_1_2_1_8_32(v26, (uint64_t)v17);
      _LPLogPack(1, v27);
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
        io_iterator_t iterator = 0;
        if (!IORegistryEntryCreateIterator(i, "IOService", 1u, &iterator))
        {
          io_object_t v23 = 0;
          unsigned __int8 v22 = 0;
          while (1)
          {
            io_object_t v23 = IOIteratorNext(iterator);
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

          IOObjectRelease(iterator);
        }
      }

      if (v33) {
        IOObjectRelease(v33);
      }
      id v43 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v41[0]);
      int v34 = 1;
    }

    objc_storeStrong(&v32, 0LL);
  }

  else
  {
    uint64_t v39 = _os_log_pack_size(12LL);
    uint64_t v16 = v39;
    uint64_t v38 = v4;
    unint64_t v15 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v37 = v16;
    uint64_t v36 = (uint64_t)v4 - v15;
    uint64_t v35 = _os_log_pack_fill((char *)v4 - v15, v39, 0LL, &_mh_execute_header, "%s : Container is missing UUID?", v4[0]);
    __os_log_helper_1_2_1_8_32(v35, (uint64_t)v17);
    _LPLogPack(1, v36);
    id v43 = 0LL;
    int v34 = 1;
  }

  v4[0] = 0LL;
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(v41, (id)v4[0]);
  return v43;
}

- (id)volumesWithRole:(int)a3
{
  int v18 = self;
  SEL v17 = a2;
  int v16 = a3;
  id v15 = -[LPAPFSContainer volumes](self, "volumes");
  id v14 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15 count]);
  memset(__b, 0, sizeof(__b));
  id obj = v15;
  id v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = 0LL;
      id v13 = *(id *)(__b[1] + 8 * v8);
      unsigned int v3 = [v13 role];
      if (v3 == v16) {
        -[NSMutableArray addObject:](v14, "addObject:", v13);
      }
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  CFTypeID v5 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v14);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  return v5;
}

- (id)prebootVolume
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 6LL);
  if ([location[0] count] == (id)1)
  {
    id v17 = [location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size(12LL);
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (uint64_t)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill( v11,  v14,  0LL,  &_mh_execute_header,  "Error: More than one preboot volume found: %{private}@");
      uint64_t v5 = v10;
      id v6 = [location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1, v11);
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
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 4LL);
  if ([location[0] count] == (id)1)
  {
    id v17 = [location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size(12LL);
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (uint64_t)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill( v11,  v14,  0LL,  &_mh_execute_header,  "Error: More than one recovery volume found: %{private}@");
      uint64_t v5 = v10;
      id v6 = [location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1, v11);
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
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPAPFSContainer volumesWithRole:](self, "volumesWithRole:", 12LL);
  if ([location[0] count] == (id)1)
  {
    id v17 = [location[0] objectAtIndex:0];
    int v15 = 1;
  }

  else
  {
    if ((unint64_t)[location[0] count] > 1)
    {
      uint64_t v14 = _os_log_pack_size(12LL);
      id v13 = &v4;
      uint64_t v12 = v14;
      id v8 = 0LL;
      uint64_t v11 = (uint64_t)&v4 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill( v11,  v14,  0LL,  &_mh_execute_header,  "Error: More than one update volume found: %{private}@");
      uint64_t v5 = v10;
      id v6 = [location[0] description];
      id v2 = v6;
      uint64_t v7 = &v9;
      id v9 = v2;
      __os_log_helper_1_3_1_8_65(v5, (uint64_t)v2);

      _LPLogPack(1, v11);
      objc_storeStrong(v7, v8);
    }

    id v17 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v17;
}

@end