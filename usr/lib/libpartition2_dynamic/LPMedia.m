@interface LPMedia
+ (BOOL)hasEmbeddedDeviceTypeRoot;
+ (NSArray)supportedContentTypes;
+ (NSDictionary)contentTypeToSubclassMap;
+ (id)allMedia;
+ (id)liveMediaForSnapshotAtPath:(id)a3;
+ (id)mediaForBSDNameOrDeviceNode:(id)a3;
+ (id)mediaForPath:(id)a3;
+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4;
+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4;
+ (id)mediaForUUID:(id)a3;
+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3;
+ (id)snapshotNameForMediaForPath:(id)a3;
+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3;
+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot;
+ (void)waitForBlockStorage;
+ (void)waitForIOMediaWithDevNode:(id)a3;
- (BOOL)getBoolPropertyWithName:(id)a3;
- (BOOL)isEmbeddedDeviceTypeRoot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isJournaled;
- (BOOL)isPrimaryMedia;
- (BOOL)isReadOnly;
- (BOOL)isWhole;
- (BOOL)setName:(id)a3 withError:(id *)a4;
- (LPMedia)initWithIOMediaObject:(unsigned int)a3;
- (id)BSDName;
- (id)_deviceCharacteristicStringForKey:(id)a3;
- (id)content;
- (id)description;
- (id)devNodePath;
- (id)deviceModel;
- (id)getPropertyWithName:(id)a3;
- (id)getStringPropertyWithName:(id)a3;
- (id)mediaUUID;
- (id)mountPoint;
- (id)name;
- (id)vendorName;
- (id)wholeMediaForMedia;
- (int)storageMedium;
- (unsigned)ioMedia;
- (void)dealloc;
- (void)setIoMedia:(unsigned int)a3;
@end

@implementation LPMedia

+ (NSArray)supportedContentTypes
{
  return (NSArray *)MEMORY[0x189604A58];
}

+ (BOOL)hasEmbeddedDeviceTypeRoot
{
  id v10 = a1;
  SEL v9 = a2;
  char v8 = 0;
  id v7 = &unk_189E350B8;
  mach_port_t mainPort = *MEMORY[0x1896086B0];
  id location = 0LL;
  objc_storeStrong(&location, v7);
  matching = (const __CFDictionary *)location;
  objc_storeStrong(&location, 0LL);
  io_service_t MatchingService = IOServiceGetMatchingService(mainPort, matching);
  if (MatchingService)
  {
    char v8 = 1;
    IOObjectRelease(MatchingService);
  }

  char v3 = v8;
  objc_storeStrong(&v7, 0LL);
  return v3 & 1;
}

+ (id)allMedia
{
  v4 = "+[LPMedia allMedia]";
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16[2] = a1;
  v16[1] = (id)a2;
  v16[0] = (id)[MEMORY[0x189603FA8] arrayWithCapacity:10];
  +[LPMedia waitForBlockStorage](&OBJC_CLASS___LPMedia, "waitForBlockStorage");
  v5 = &v15;
  io_iterator_t v15 = 0;
  CFDictionaryRef v14 = IOServiceMatching("IOMedia");
  if (IOServiceGetMatchingServices(*MEMORY[0x1896086B0], v14, &v15))
  {
    uint64_t v13 = _os_log_pack_size();
    v12 = &v3;
    uint64_t v11 = v13;
    id v10 = (char *)&v3 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v9, (uint64_t)v4);
    _LPLogPack(1);
    id v17 = MEMORY[0x189604A58];
    int v8 = 1;
  }

  else
  {
    io_object_t v7 = 0;
    while (1)
    {
      io_object_t v7 = IOIteratorNext(v15);
      if (!v7) {
        break;
      }
      id location = 0LL;
      id location =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  v7);
      if (location) {
        [v16[0] addObject:location];
      }
      IOObjectRelease(v7);
      objc_storeStrong(&location, 0LL);
    }

    if (v15) {
      IOObjectRelease(v15);
    }
    id v17 = (id)[MEMORY[0x189603F18] arrayWithArray:v16[0]];
    int v8 = 1;
  }

  objc_storeStrong(v16, 0LL);
  return v17;
}

+ (id)mediaForPath:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = +[LPMedia mediaForPath:snapshotName:](&OBJC_CLASS___LPMedia, "mediaForPath:snapshotName:", location[0], 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)mediaForPath:(id)a3 isSnapshot:(BOOL *)a4
{
  id v13 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v11 = a4;
  id v10 = 0LL;
  id v9 = 0LL;
  id obj = 0LL;
  id v7 = (id)[v13 mediaForPath:location[0] snapshotName:&obj];
  objc_storeStrong(&v10, obj);
  id v9 = v7;
  if (v7 && v11) {
    *uint64_t v11 = v10 != 0LL;
  }
  id v5 = v9;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)mediaForPath:(id)a3 snapshotName:(id *)a4
{
  v58 = a4;
  v55 = "+[LPMedia mediaForPath:snapshotName:]";
  v56 = "AppleAPFSSnapshot";
  v57 = "UUID";
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v96 = a1;
  v95[1] = (id)a2;
  v95[0] = 0LL;
  objc_storeStrong(v95, a3);
  v94 = v58;
  id v93 = 0LL;
  id v92 = 0LL;
  io_registry_entry_t MatchingService = 0;
  v59 = &v106;
  bzero(&v106, 0x878uLL);
  if (statfs((const char *)[v95[0] fileSystemRepresentation], &v106))
  {
    int v90 = 0;
    int v90 = *__error();
    uint64_t v89 = _os_log_pack_size();
    uint64_t v51 = v89;
    v88 = &v19;
    unint64_t v50 = (v89 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    MEMORY[0x1895F8858]();
    uint64_t v87 = v51;
    v86 = (char *)&v19 - v50;
    uint64_t v85 = _os_log_pack_fill();
    uint64_t v54 = v85;
    id v52 = v95[0];
    int v53 = v90;
    id v4 = strerror(v90);
    __os_log_helper_1_2_4_8_32_8_64_4_0_8_32(v54, (uint64_t)v55, (uint64_t)v52, v53, (uint64_t)v4);
    _LPLogPack(1);
  }

  else
  {
    int32_t v84 = v106.f_fsid.val[0];
    v44 = v104;
    v104[0] = @"IOProviderClass";
    v43 = v105;
    v105[0] = @"IOMedia";
    v104[1] = @"IOPropertyMatch";
    v41 = v102;
    v102[0] = @"BSD Major";
    unint64_t v39 = 0x189607000uLL;
    id v48 = (id)[MEMORY[0x189607968] numberWithInt:HIBYTE(v106.f_fsid.val[0])];
    v40 = v103;
    v103[0] = v48;
    v102[1] = @"BSD Minor";
    id v47 = (id)[MEMORY[0x189607968] numberWithInt:v84 & 0xFFFFFF];
    v103[1] = v47;
    unint64_t v42 = 0x189603000uLL;
    uint64_t v45 = 2LL;
    id v46 = (id)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v103,  v102);
    v105[1] = v46;
    id v5 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v105 forKeys:v104 count:2];
    id v6 = v93;
    id v93 = v5;

    mach_port_t v49 = *MEMORY[0x1896086B0];
    id v7 = (const __CFDictionary *)CFRetain(v93);
    io_registry_entry_t MatchingService = IOServiceGetMatchingService(v49, v7);
    if (MatchingService)
    {
      id v8 = (id)[v96 mediaOfCorrectTypeGivenIOMedia:MatchingService];
      id v9 = v92;
      id v92 = v8;

      if (v92 && v94)
      {
        id v78 = 0LL;
        if ((v106.f_flags & 0x40000000) != 0)
        {
          v77 = strrchr(v106.f_mntfromname, 64);
          if (v77)
          {
            v36 = &v106;
            v76[1] = (id)(v77 - v106.f_mntfromname);
            id v10 = (void *)[objc_alloc(NSString) initWithBytes:v106.f_mntfromname length:v77 - v106.f_mntfromname encoding:4];
            id v11 = v78;
            id v78 = v10;
          }

          else if (IOObjectConformsTo(MatchingService, "AppleAPFSSnapshot"))
          {
            v35 = v101;
            uint64_t v33 = 37LL;
            int v32 = 0;
            memset(v101, 0, sizeof(v101));
            id CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, @"UUID", 0LL, 0);
            v76[0] = CFProperty;
            [v76[0] getCString:v101 maxLength:37 encoding:4];
            v34 = &v98;
            bzero(&v98, 0x120uLL);
            uint64_t v98 = 2LL;
            if (uuid_parse(v101, v99))
            {
              uint64_t v75 = _os_log_pack_size();
              uint64_t v31 = v75;
              v74 = &v19;
              unint64_t v30 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0LL;
              MEMORY[0x1895F8858]();
              uint64_t v73 = v31;
              v72 = (char *)&v19 - v30;
              uint64_t v71 = _os_log_pack_fill();
              __os_log_helper_1_3_4_8_32_8_32_8_33_8_65(v71, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v76[0]);
              _LPLogPack(1);
            }

            else if (fsctl(v106.f_mntonname, 0xC1204A43uLL, &v98, 0))
            {
              uint64_t v70 = _os_log_pack_size();
              uint64_t v27 = v70;
              v69 = &v19;
              unint64_t v26 = (v70 + 15) & 0xFFFFFFFFFFFFFFF0LL;
              MEMORY[0x1895F8858]();
              uint64_t v68 = v27;
              v67 = (char *)&v19 - v26;
              uint64_t v66 = _os_log_pack_fill();
              uint64_t v29 = v66;
              int v28 = *__error();
              v12 = __error();
              id v13 = strerror(*v12);
              __os_log_helper_1_2_3_8_32_4_0_8_32(v29, (uint64_t)v55, v28, (uint64_t)v13);
              _LPLogPack(1);
            }

            else
            {
              v25 = &v98;
              size_t v65 = strnlen(v100, 0xFFuLL);
              CFDictionaryRef v14 = (void *)[objc_alloc(NSString) initWithBytes:v100 length:v65 encoding:4];
              id v15 = v78;
              id v78 = v14;
            }

            objc_storeStrong(v76, 0LL);
          }

          if (![v78 length])
          {
            uint64_t v64 = 0LL;
            uint64_t v64 = _os_log_pack_size();
            uint64_t v24 = v64;
            v63 = &v19;
            unint64_t v23 = (v64 + 15) & 0xFFFFFFFFFFFFFFF0LL;
            MEMORY[0x1895F8858]();
            uint64_t v62 = v24;
            v61 = (char *)&v19 - v23;
            uint64_t v60 = _os_log_pack_fill();
            __os_log_helper_1_3_2_8_32_8_65(v60, (uint64_t)v55, (uint64_t)v95[0]);
            _LPLogPack(1);
          }
        }

        v22 = &v78;
        id v16 = v78;
        id v17 = v22;
        id *v94 = v16;
        objc_storeStrong(v17, 0LL);
      }
    }

    else
    {
      uint64_t v83 = _os_log_pack_size();
      uint64_t v38 = v83;
      v82 = &v19;
      unint64_t v37 = (v83 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      MEMORY[0x1895F8858]();
      uint64_t v81 = v38;
      v80 = (char *)&v19 - v37;
      uint64_t v79 = _os_log_pack_fill();
      __os_log_helper_1_2_3_8_32_8_64_8_0(v79, (uint64_t)v55, (uint64_t)v95[0], v84);
      _LPLogPack(1);
    }
  }

  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  v19 = &v92;
  id v20 = v92;
  id v21 = 0LL;
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(&v93, v21);
  objc_storeStrong(v95, v21);
  return v20;
}

+ (id)snapshotNameForMediaForPath:(id)a3
{
  uint64_t v31 = 0LL;
  int v32 = "+[LPMedia snapshotNameForMediaForPath:]";
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v73 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v33 = &v71;
  id v71 = 0LL;
  id v70 = 0LL;
  id v69 = 0LL;
  id v34 = (id)[v73 mediaForPath:location[0] snapshotName:&v69];
  objc_storeStrong(&v71, v69);
  id v70 = v34;
  if (v34)
  {
    if (v71)
    {
      id v74 = v71;
      int v63 = 1;
    }

    else
    {
      id v62 = (id)[v73 liveMediaForSnapshotAtPath:@"/"];
      if (!v62 || ([v70 isEqual:v62] & 1) == 0) {
        goto LABEL_13;
      }
      int v28 = &v61;
      id v61 = 0LL;
      id v60 = 0LL;
      id v29 = (id)[v73 mediaForPath:@"/" snapshotName:&v60];
      objc_storeStrong(&v61, v60);
      BOOL v30 = 0;
      if (v29) {
        BOOL v30 = v61 != 0LL;
      }
      BOOL v27 = v30;

      if (v30)
      {
        id v74 = v61;
        int v63 = 1;
      }

      else
      {
        int v63 = 0;
      }

      objc_storeStrong(&v61, 0LL);
      if (!v63)
      {
LABEL_13:
        id v26 = v70;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v54 = v70;
          v22 = &v53;
          uint64_t v53 = 0LL;
          id v52 = 0LL;
          id v51 = 0LL;
          id v23 = (id)[v54 snapshotInfoWithError:&v51];
          objc_storeStrong((id *)&v53, v51);
          id v52 = v23;
          if (v23)
          {
            uint64_t v16 = MEMORY[0x189603FA8];
            id v45 = (id)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  objc_msgSend(v52, "count"));
            id v17 = v43;
            memset(v43, 0, sizeof(v43));
            id v18 = v52;
            uint64_t v19 = [v18 countByEnumeratingWithState:v43 objects:v75 count:16];
            if (v19)
            {
              uint64_t v13 = *(void *)v43[2];
              uint64_t v14 = v31;
              uint64_t v15 = v19;
              while (1)
              {
                unint64_t v11 = v15;
                uint64_t v12 = v14;
                if (*(void *)v43[2] != v13) {
                  objc_enumerationMutation(v18);
                }
                id v44 = 0LL;
                id v44 = *(id *)(v43[1] + 8 * v12);
                id v42 = 0LL;
                id v42 = (id)[v44 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
                id v41 = 0LL;
                id v41 = (id)[v44 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
                if ([v41 BOOLValue])
                {
                  id v74 = v42;
                  int v63 = 1;
                }

                else
                {
                  if ([v42 hasPrefix:@"com.apple.os.update-"]) {
                    [v45 addObject:v44];
                  }
                  int v63 = 0;
                }

                uint64_t v10 = 0LL;
                objc_storeStrong(&v41, 0LL);
                objc_storeStrong(&v42, 0LL);
                if (v63) {
                  break;
                }
                uint64_t v14 = v12 + 1;
                uint64_t v15 = v11;
                if (v12 + 1 >= v11)
                {
                  uint64_t v14 = v31;
                  uint64_t v15 = [v18 countByEnumeratingWithState:v43 objects:v75 count:16];
                  if (!v15) {
                    goto LABEL_29;
                  }
                }
              }
            }

            else
            {
LABEL_29:
              int v63 = 0;
            }

            if (!v63)
            {
              if ([v45 count])
              {
                id v8 = &v35;
                uint64_t v9 = 0LL;
                id v35 = 0LL;
                id v35 = (id)[v45 sortedArrayUsingComparator:&__block_literal_global_1];
                id v7 = (id)[v35 lastObject];
                id v74 = (id)[v7 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];

                int v63 = 1;
                objc_storeStrong(&v35, 0LL);
              }

              else
              {
                uint64_t v40 = _os_log_pack_size();
                unint64_t v39 = &v4;
                uint64_t v38 = v40;
                unint64_t v37 = (char *)&v4 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v36 = _os_log_pack_fill();
                __os_log_helper_1_2_1_8_32(v36, (uint64_t)v32);
                _LPLogPack(1);
                id v74 = 0LL;
                int v63 = 1;
              }
            }

            objc_storeStrong(&v45, 0LL);
          }

          else
          {
            uint64_t v50 = _os_log_pack_size();
            mach_port_t v49 = &v4;
            uint64_t v48 = v50;
            id v47 = (char *)&v4 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v46 = _os_log_pack_fill();
            uint64_t v20 = v46;
            id v21 = (id)[v70 devNodePath];
            __os_log_helper_1_2_3_8_32_8_64_8_64(v20, (uint64_t)v32, (uint64_t)v21, v53);

            _LPLogPack(1);
            id v74 = 0LL;
            int v63 = 1;
          }

          id v6 = 0LL;
          objc_storeStrong(&v52, 0LL);
          objc_storeStrong((id *)&v53, v6);
          objc_storeStrong(&v54, v6);
        }

        else
        {
          uint64_t v59 = _os_log_pack_size();
          v58 = &v4;
          uint64_t v57 = v59;
          v56 = (char *)&v4 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v55 = _os_log_pack_fill();
          uint64_t v24 = v55;
          id v25 = (id)[v70 devNodePath];
          __os_log_helper_1_2_2_8_32_8_64(v24, (uint64_t)v32, (uint64_t)v25);

          _LPLogPack(1);
          id v74 = 0LL;
          int v63 = 1;
        }
      }

      objc_storeStrong(&v62, 0LL);
    }
  }

  else
  {
    uint64_t v68 = _os_log_pack_size();
    v67 = &v4;
    uint64_t v66 = v68;
    size_t v65 = (char *)&v4 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v64 = _os_log_pack_fill();
    __os_log_helper_1_3_2_8_32_8_65(v64, (uint64_t)v32, (uint64_t)location[0]);
    _LPLogPack(1);
    id v74 = 0LL;
    int v63 = 1;
  }

  id v5 = 0LL;
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(&v71, v5);
  objc_storeStrong(location, v5);
  return v74;
}

uint64_t __39__LPMedia_snapshotNameForMediaForPath___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  v8[0] = 0LL;
  v8[0] = (id)[location[0] objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];
  id v7 = 0LL;
  id v7 = (id)[v9 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];
  uint64_t v6 = [v8[0] compare:v7];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)liveMediaForSnapshotAtPath:(id)a3
{
  kern_return_t ParentEntry;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  io_registry_entry_t v30;
  int v31;
  id location[2];
  id v33;
  id v34;
  uint64_t v35;
  id v5 = "+[LPMedia liveMediaForSnapshotAtPath:]";
  id v35 = *MEMORY[0x1895F89C0];
  uint64_t v33 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"/"])
  {
    BOOL v30 = +[LPMedia _copyIOMediaForDiskWithPath:](&OBJC_CLASS___LPMedia, "_copyIOMediaForDiskWithPath:", location[0]);
    if (!v30
      && ([location[0] isEqualToString:@"/"] & 1) != 0
      && (BOOL v30 = +[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]( &OBJC_CLASS___LPMedia,  "_copyLiveFilesystemIOMediaForRootedSnapshot")) != 0)
    {
      v4[4] = &v29;
      v4[3] = 0LL;
      id v29 = 0LL;
      id v29 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](&OBJC_CLASS___LPMedia, "mediaOfCorrectTypeGivenIOMedia:", v30);
      IOObjectRelease(v30);
      id v34 = v29;
      uint64_t v31 = 1;
      objc_storeStrong(&v29, 0LL);
    }

    else if (v30)
    {
      if (IOObjectConformsTo(v30, "AppleAPFSSnapshot"))
      {
        ParentEntry = 0;
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(v30, "IOService", &parent);
        if (!ParentEntry && parent)
        {
          if (IOObjectConformsTo(parent, "AppleAPFSVolume"))
          {
            v4[2] = &v6;
            v4[1] = 0LL;
            id v6 = 0LL;
            id v6 =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  parent);
            IOObjectRelease(v30);
            id v34 = v6;
            uint64_t v31 = 1;
            objc_storeStrong(&v6, 0LL);
          }

          else
          {
            uint64_t v11 = _os_log_pack_size();
            uint64_t v10 = v4;
            uint64_t v9 = v11;
            id v8 = (char *)v4 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v7 = _os_log_pack_fill();
            __os_log_helper_1_3_2_8_32_8_65(v7, (uint64_t)v5, (uint64_t)location[0]);
            _LPLogPack(1);
            IOObjectRelease(v30);
            id v34 = 0LL;
            uint64_t v31 = 1;
          }
        }

        else
        {
          uint64_t v16 = _os_log_pack_size();
          uint64_t v15 = v4;
          uint64_t v14 = v16;
          uint64_t v13 = (char *)v4 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v12 = _os_log_pack_fill();
          __os_log_helper_1_3_2_8_32_8_65(v12, (uint64_t)v5, (uint64_t)location[0]);
          _LPLogPack(1);
          IOObjectRelease(v30);
          id v34 = 0LL;
          uint64_t v31 = 1;
        }
      }

      else
      {
        id v23 = _os_log_pack_size();
        v22 = v4;
        id v21 = v23;
        uint64_t v20 = (char *)v4 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v19 = _os_log_pack_fill();
        __os_log_helper_1_3_2_8_32_8_65(v19, (uint64_t)v5, (uint64_t)location[0]);
        _LPLogPack(1);
        IOObjectRelease(v30);
        id v34 = +[LPMedia mediaForPath:](&OBJC_CLASS___LPMedia, "mediaForPath:", location[0]);
        uint64_t v31 = 1;
      }
    }

    else
    {
      int v28 = _os_log_pack_size();
      BOOL v27 = v4;
      id v26 = v28;
      id v25 = (char *)v4 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v24 = _os_log_pack_fill();
      __os_log_helper_1_3_2_8_32_8_65(v24, (uint64_t)v5, (uint64_t)location[0]);
      _LPLogPack(1);
      id v34 = 0LL;
      uint64_t v31 = 1;
    }
  }

  else
  {
    id v34 = (id)[v33 mediaForPath:location[0]];
    uint64_t v31 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v34;
}

+ (id)mediaForUUID:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  theDict = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(theDict, @"IOProviderClass", @"IOMedia");
  CFDictionarySetValue(theDict, @"UUID", location[0]);
  io_service_t object = IOServiceGetMatchingService(*MEMORY[0x1896086B0], theDict);
  if (object)
  {
    id v3 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](&OBJC_CLASS___LPMedia, "mediaOfCorrectTypeGivenIOMedia:", object);
    id v4 = v9;
    id v9 = v3;

    IOObjectRelease(object);
  }

  id v6 = v9;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)mediaForBSDNameOrDeviceNode:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = location[0];
  id v12 = 0LL;
  if (v13 && [v13 length])
  {
    if ([v13 hasPrefix:@"/dev/"])
    {
      id v3 = (id)[v13 substringFromIndex:5];
      id v4 = v13;
      id v13 = v3;
    }

    id v9 = (mach_port_t *)MEMORY[0x1896086B0];
    uint64_t v11 = IOBSDNameMatching( *MEMORY[0x1896086B0], 0, (const char *)[v13 fileSystemRepresentation]);
    io_service_t MatchingService = IOServiceGetMatchingService(*v9, v11);
    if (MatchingService)
    {
      id v5 =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  MatchingService);
      id v6 = v12;
      id v12 = v5;

      IOObjectRelease(MatchingService);
    }
  }

  id v8 = v12;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (id)wholeMediaForMedia
{
  id v9 = "-[LPMedia wholeMediaForMedia]";
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v21 = self;
  location[1] = (id)a2;
  if (-[LPMedia isWhole](self, "isWhole"))
  {
    v22 = v21;
  }

  else
  {
    location[0] = 0LL;
    id v8 = &v19;
    io_iterator_t v19 = 0;
    if (MEMORY[0x186E34AE0](-[LPMedia ioMedia](v21, "ioMedia"), "IOService", 3LL, &v19))
    {
      uint64_t v18 = _os_log_pack_size();
      id v17 = &v5;
      uint64_t v16 = v18;
      uint64_t v15 = (char *)&v5 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v14, (uint64_t)v9);
      _LPLogPack(1);
      v22 = 0LL;
      int v13 = 1;
    }

    else
    {
      io_registry_entry_t v12 = 0;
      unsigned __int8 v11 = 0;
      while (1)
      {
        io_registry_entry_t v12 = IOIteratorNext(v19);
        int v7 = 0;
        if (v12) {
          int v7 = v11 ^ 1;
        }
        if ((v7 & 1) == 0) {
          break;
        }
        if (IOObjectConformsTo(v12, "IOMedia"))
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v12, @"Whole", 0LL, 0);
          if (CFProperty)
          {
            CFTypeID v6 = CFGetTypeID(CFProperty);
            if (v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)CFProperty))
            {
              id v2 =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  v12);
              id v3 = location[0];
              location[0] = v2;

              unsigned __int8 v11 = 1;
            }

            CFRelease(CFProperty);
          }
        }

        IOObjectRelease(v12);
      }

      IOObjectRelease(v19);
      v22 = (LPMedia *)location[0];
      int v13 = 1;
    }

    objc_storeStrong(location, 0LL);
  }

  return v22;
}

- (LPMedia)initWithIOMediaObject:(unsigned int)a3
{
  SEL v7 = a2;
  io_object_t v6 = a3;
  id v8 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LPMedia;
  id v8 = -[LPMedia init](&v5, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    IOObjectRetain(v6);
    -[LPMedia setIoMedia:](v8, "setIoMedia:", v6);
  }

  id v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  if (-[LPMedia ioMedia](self, "ioMedia")) {
    IOObjectRelease(-[LPMedia ioMedia](v4, "ioMedia"));
  }
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___LPMedia;
  -[LPMedia dealloc](&v2, sel_dealloc);
}

- (id)content
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", @"Content", a2, self);
}

- (id)mediaUUID
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", @"UUID", a2, self);
}

- (id)name
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = -[LPMedia mountPoint](self, "mountPoint");
  if (!location[0]
    || (bzero(v8, 0x40CuLL),
        v3[2] = 0LL,
        v3[0] = 5LL,
        v3[1] = 2147491840LL,
        getattrlist( (const char *)[location[0] fileSystemRepresentation], v3, v8, 0x40CuLL, 0) == -1))
  {
    memset(__b, 0, sizeof(__b));
    if (MEMORY[0x186E34AEC](-[LPMedia ioMedia](v5, "ioMedia"), __b))
    {
      id v6 = 0LL;
    }

    else
    {
      __b[127] = 0;
      id v6 = (id)[NSString stringWithCString:__b encoding:4];
    }
  }

  else
  {
    id v6 = (id)[NSString stringWithCString:(char *)v9 + v9[0] encoding:4];
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (BOOL)setName:(id)a3 withError:(id *)a4
{
  uint64_t v18 = a4;
  id v17 = "-[LPMedia setName:withError:]";
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v42 = self;
  v41[1] = (id)a2;
  v41[0] = 0LL;
  objc_storeStrong(v41, a3);
  uint64_t v40 = v18;
  unsigned __int8 v39 = 1;
  bzero(v43, 0x408uLL);
  id v19 = -[LPMedia mountPoint](v42, "mountPoint");
  uint64_t v20 = (const char *)[v19 fileSystemRepresentation];

  uint64_t v38 = v20;
  if (v20)
  {
    uint64_t v15 = &v31;
    __int128 v31 = xmmword_186222628;
    uint64_t v32 = 0LL;
    uint64_t v16 = v43;
    uint64_t v14 = v44;
    [v41[0] UTF8String];
    __strlcpy_chk();
    v43[0] = 8;
    v43[1] = strlen(v44) + 1;
    if (setattrlist(v38, &v31, v43, 0x408uLL, 0))
    {
      uint64_t v30 = _os_log_pack_size();
      id v29 = v9;
      uint64_t v28 = v30;
      BOOL v27 = &v9[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v26 = _os_log_pack_fill();
      uint64_t v13 = v26;
      objc_super v5 = __error();
      id v6 = strerror(*v5);
      __os_log_helper_1_2_2_8_32_8_32(v13, (uint64_t)v17, (uint64_t)v6);
      _LPLogPack(1);
      if (v40)
      {
        uint64_t v12 = MEMORY[0x189607870];
        uint64_t v11 = *MEMORY[0x189607688];
        id v7 = (id)[MEMORY[0x189607870] errorWithDomain:v11 code:*__error() userInfo:0];
        id *v40 = v7;
      }

      unsigned __int8 v39 = 0;
    }

    else
    {
      uint64_t v25 = _os_log_pack_size();
      uint64_t v24 = v9;
      uint64_t v23 = v25;
      v22 = &v9[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v21 = _os_log_pack_fill();
      __os_log_helper_1_3_2_8_32_8_65(v21, (uint64_t)v17, (uint64_t)v41[0]);
      _LPLogPack(3);
    }
  }

  else
  {
    uint64_t v37 = _os_log_pack_size();
    uint64_t v36 = v9;
    uint64_t v35 = v37;
    id v34 = &v9[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v33 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v33, (uint64_t)v17);
    _LPLogPack(1);
    if (v40)
    {
      id v4 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      id *v40 = v4;
    }

    unsigned __int8 v39 = 0;
  }

  int v10 = v39;
  objc_storeStrong(v41, 0LL);
  return v10 & 1;
}

- (id)BSDName
{
  return -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", @"BSD Name", a2, self);
}

- (id)devNodePath
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPMedia BSDName](self, "BSDName");
  if (location[0]) {
    id v4 = (id)[NSString stringWithFormat:@"/dev/%@", location[0]];
  }
  else {
    id v4 = 0LL;
  }
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)mountPoint
{
  v11[2] = self;
  v11[1] = (id)a2;
  v11[0] = -[LPMedia devNodePath](self, "devNodePath");
  if (v11[0])
  {
    id v9 = 0LL;
    id v8 = 0LL;
    int v7 = getmntinfo_r_np(&v8, 2);
    for (int i = 0; i < v7; ++i)
    {
      objc_super v2 = (const char *)[v11[0] fileSystemRepresentation];
      if (!strcmp(v2, v8[i].f_mntfromname))
      {
        id v3 = (id)[NSString stringWithUTF8String:v8[i].f_mntonname];
        id v4 = v9;
        id v9 = v3;

        break;
      }
    }

    if (v8) {
      free(v8);
    }
    id v12 = v9;
    int v10 = 1;
    objc_storeStrong(&v9, 0LL);
  }

  else
  {
    id v12 = 0LL;
    int v10 = 1;
  }

  objc_storeStrong(v11, 0LL);
  return v12;
}

- (id)vendorName
{
  return -[LPMedia _deviceCharacteristicStringForKey:]( self,  "_deviceCharacteristicStringForKey:",  @"Vendor Name",  a2,  self);
}

- (id)deviceModel
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v9 = self;
  SEL v8 = a2;
  v12[0] = xmmword_189E33D00;
  v12[1] = xmmword_189E33D10;
  IOOptionBits options = 3;
  for (int i = 0; (unint64_t)i < 4; ++i)
  {
    id location = 0LL;
    io_registry_entry_t v2 = -[LPMedia ioMedia](v9, "ioMedia");
    id v11 = (id)IORegistryEntrySearchCFProperty( v2,  "IOService",  *((CFStringRef *)v12 + i),  (CFAllocatorRef)*MEMORY[0x189604DB0],  options);
    id location = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v10 = location;
      int v4 = 1;
    }

    else
    {
      int v4 = 0;
    }

    objc_storeStrong(&location, 0LL);
    if (v4) {
      return v10;
    }
  }

  id v10 = 0LL;
  return v10;
}

- (int)storageMedium
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] =  -[LPMedia _deviceCharacteristicStringForKey:]( self,  "_deviceCharacteristicStringForKey:",  @"Medium Type");
  int v3 = 0;
  if ([location[0] isEqualToString:@"Rotational"])
  {
    int v3 = 1;
  }

  else if ([location[0] isEqualToString:@"Solid State"])
  {
    int v3 = 2;
  }

  objc_storeStrong(location, 0LL);
  return v3;
}

- (BOOL)isWhole
{
  return -[LPMedia getBoolPropertyWithName:](self, "getBoolPropertyWithName:", @"Whole", a2, self);
}

- (BOOL)isInternal
{
  id v9 = self;
  SEL v8 = a2;
  IOOptionBits v7 = 3;
  id v6 = 0LL;
  io_registry_entry_t v2 = -[LPMedia ioMedia](self, "ioMedia");
  id v10 = (id)IORegistryEntrySearchCFProperty(v2, "IOService", @"Protocol Characteristics", 0LL, v7);
  id v6 = v10;
  id v5 = 0LL;
  id v5 = (id)[v6 objectForKeyedSubscript:@"Physical Interconnect Location"];
  char v4 = [v5 isEqualToString:@"Internal"];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  return v4 & 1;
}

- (BOOL)isEmbeddedDeviceTypeRoot
{
  SEL v8 = self;
  SEL v7 = a2;
  IOOptionBits v6 = 3;
  id v5 = 0LL;
  io_registry_entry_t v2 = -[LPMedia ioMedia](self, "ioMedia");
  id v9 = (id)IORegistryEntrySearchCFProperty(v2, "IOService", @"EmbeddedDeviceTypeRoot", 0LL, v6);
  id v5 = v9;
  char v4 = [v5 BOOLValue];
  objc_storeStrong(&v5, 0LL);
  return v4 & 1;
}

- (BOOL)isPrimaryMedia
{
  return -[LPMedia isEmbeddedDeviceTypeRoot](self, "isEmbeddedDeviceTypeRoot", a2, self);
}

- (BOOL)isReadOnly
{
  char v4 = "-[LPMedia isReadOnly]";
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v14 = self;
  SEL v13 = a2;
  BOOL v12 = 0;
  id v5 = (void *)MEMORY[0x186E34CE4]();
  id v11 = -[LPMedia mountPoint](v14, "mountPoint");
  if (v11)
  {
    v3[1] = &v15;
    bzero(&v15, 0x878uLL);
    if (statfs((const char *)[v11 fileSystemRepresentation], &v15))
    {
      uint64_t v10 = _os_log_pack_size();
      id v9 = v3;
      uint64_t v8 = v10;
      SEL v7 = (char *)v3 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = _os_log_pack_fill();
      __os_log_helper_1_2_2_8_32_8_64(v6, (uint64_t)v4, (uint64_t)v11);
      _LPLogPack(1);
    }

    else
    {
      BOOL v12 = (v15.f_flags & 1) != 0;
    }
  }

  objc_storeStrong(&v11, 0LL);
  objc_autoreleasePoolPop(v5);
  return v12;
}

- (BOOL)isJournaled
{
  char v4 = "-[LPMedia isJournaled]";
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v14 = self;
  SEL v13 = a2;
  BOOL v12 = 0;
  id v5 = (void *)MEMORY[0x186E34CE4]();
  id v11 = -[LPMedia mountPoint](v14, "mountPoint");
  if (v11)
  {
    v3[1] = &v15;
    bzero(&v15, 0x878uLL);
    if (statfs((const char *)[v11 fileSystemRepresentation], &v15))
    {
      uint64_t v10 = _os_log_pack_size();
      id v9 = v3;
      uint64_t v8 = v10;
      SEL v7 = (char *)v3 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = _os_log_pack_fill();
      __os_log_helper_1_2_2_8_32_8_64(v6, (uint64_t)v4, (uint64_t)v11);
      _LPLogPack(1);
    }

    else
    {
      BOOL v12 = (v15.f_flags & 0x800000) != 0;
    }
  }

  objc_storeStrong(&v11, 0LL);
  objc_autoreleasePoolPop(v5);
  return v12;
}

- (id)description
{
  id v17 = self;
  v16[1] = (id)a2;
  v16[0] = -[LPMedia mountPoint](self, "mountPoint");
  if (v16[0])
  {
    uint64_t v6 = (void *)NSString;
    char v4 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v4);
    id v7 = -[LPMedia name](v17, "name");
    id v18 = (id)[v6 stringWithFormat:@"%@: %@, Mount: %@", v8, v7, v16[0]];
  }

  else
  {
    id location = -[LPMedia mediaUUID](v17, "mediaUUID");
    if (location)
    {
      BOOL v12 = (void *)NSString;
      io_registry_entry_t v2 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v2);
      id v13 = -[LPMedia name](v17, "name");
      id v18 = (id)[v12 stringWithFormat:@"%@: %@, UUID: %@", v14, v13, location];
    }

    else
    {
      id v9 = (void *)NSString;
      int v3 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v3);
      id v10 = -[LPMedia name](v17, "name");
      id v18 = (id)[v9 stringWithFormat:@"%@: %@", v11, v10];
    }

    objc_storeStrong(&location, 0LL);
  }

  objc_storeStrong(v16, 0LL);
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = 0LL;
    id v5 = location[0];
    uint64_t object = -[LPMedia ioMedia](v8, "ioMedia");
    BOOL v9 = IOObjectIsEqualTo(object, [v5 ioMedia]) == 1;
    int v6 = 1;
    objc_storeStrong(&v5, (id)HIDWORD(object));
  }

  else
  {
    BOOL v9 = 0;
    int v6 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v9;
}

- (id)_deviceCharacteristicStringForKey:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  int v7 = 3;
  id v11 = (id)IORegistryEntrySearchCFProperty( -[LPMedia ioMedia](v10, "ioMedia"),  "IOService",  @"Device Characteristics",  0LL,  3u);
  id v6 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id obj = (id)[v6 objectForKeyedSubscript:location[0]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      objc_storeStrong(&v8, obj);
    }
    objc_storeStrong(&obj, 0LL);
  }

  id v4 = v8;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3
{
  uint64_t v14 = "+[LPMedia _copyIOMediaForDiskWithPath:]";
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v25[2] = a1;
  v25[1] = (id)a2;
  v25[0] = 0LL;
  objc_storeStrong(v25, a3);
  int v24 = 0;
  statfs v15 = &v27;
  bzero(&v27, 0x878uLL);
  if (statfs((const char *)[v25[0] fileSystemRepresentation], &v27))
  {
    int v24 = *__error();
    uint64_t v23 = _os_log_pack_size();
    v22 = v7;
    uint64_t v21 = v23;
    uint64_t v20 = &v7[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v19 = _os_log_pack_fill();
    uint64_t v13 = v19;
    int v12 = v24;
    int v3 = strerror(v24);
    __os_log_helper_1_2_3_8_32_4_0_8_32(v13, (uint64_t)v14, v12, (uint64_t)v3);
    _LPLogPack(1);
    io_service_t MatchingService = 0;
    int v18 = 1;
  }

  else
  {
    id v17 = (id)[NSString stringWithUTF8String:v27.f_mntfromname];
    if ([v17 hasPrefix:@"/dev/"])
    {
      id v4 = (id)[v17 substringFromIndex:5];
      id v5 = v17;
      id v17 = v4;
    }

    uint64_t v10 = 0LL;
    CFDictionaryRef v16 = 0LL;
    BOOL v9 = (mach_port_t *)MEMORY[0x1896086B0];
    mach_port_t v8 = *MEMORY[0x1896086B0];
    id v11 = &v17;
    CFDictionaryRef v16 = IOBSDNameMatching(v8, 0, (const char *)[v17 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(*v9, v16);
    int v18 = 1;
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(v25, 0LL);
  return MatchingService;
}

+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot
{
  uint64_t v14 = "+[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]";
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v29 = a1;
  SEL v28 = a2;
  int v27 = 0;
  statfs v15 = &v31;
  bzero(&v31, 0x878uLL);
  if (statfs("/", &v31))
  {
    int v27 = *__error();
    uint64_t v26 = _os_log_pack_size();
    uint64_t v25 = v6;
    uint64_t v24 = v26;
    uint64_t v23 = (char *)v6 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    uint64_t v13 = v22;
    int v12 = v27;
    io_registry_entry_t v2 = strerror(v27);
    __os_log_helper_1_2_3_8_32_4_0_8_32(v13, (uint64_t)v14, v12, (uint64_t)v2);
    _LPLogPack(1);
    return 0;
  }

  else
  {
    id v21 = (id)[NSString stringWithUTF8String:v31.f_mntfromname];
    id v20 = (id)[v21 componentsSeparatedByString:@"@"];
    char v18 = 0;
    int v11 = 0;
    if ([v20 count] == 2)
    {
      id v19 = (id)[v20 objectAtIndexedSubscript:1];
      char v18 = 1;
      int v11 = [v19 hasPrefix:@"/dev/"];
    }

    int v10 = v11;
    if ((v18 & 1) != 0) {

    }
    if ((v10 & 1) != 0)
    {
      id v7 = (id)[v20 objectAtIndexedSubscript:1];
      id v3 = (id)[v7 substringFromIndex:5];
      id v4 = v21;
      id v21 = v3;

      CFDictionaryRef v17 = 0LL;
      BOOL v9 = (mach_port_t *)MEMORY[0x1896086B0];
      mach_port_t v8 = *MEMORY[0x1896086B0];
      CFDictionaryRef v17 = IOBSDNameMatching(v8, 0, (const char *)[v21 UTF8String]);
      io_service_t MatchingService = IOServiceGetMatchingService(*v9, v17);
    }

    else
    {
      io_service_t MatchingService = 0;
    }

    int v16 = 1;
    v6[1] = 0LL;
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v21, 0LL);
  }

  return MatchingService;
}

- (unsigned)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(unsigned int)a3
{
  self->_ioMedia = a3;
}

+ (NSDictionary)contentTypeToSubclassMap
{
  id v4 = (dispatch_once_t *)&contentTypeToSubclassMap_once;
  id location = 0LL;
  objc_storeStrong(&location, &__block_literal_global_136);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (NSDictionary *)(id)contentTypeToSubclassMap_sharedMap;
}

void __44__LPMedia_Private__contentTypeToSubclassMap__block_invoke(void *a1)
{
  v24[4] = *MEMORY[0x1895F89C0];
  v21[2] = a1;
  v21[1] = a1;
  context = (void *)MEMORY[0x186E34CE4]();
  v21[0] = (id)[MEMORY[0x189603FC8] dictionary];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  id location = (id)[MEMORY[0x189603F18] arrayWithObjects:v24 count:4];
  memset(__b, 0, sizeof(__b));
  id obj = location;
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v15)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    unint64_t v12 = v15;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v19 = 0LL;
      id v19 = *(id *)(__b[1] + 8 * v11);
      memset(v16, 0, sizeof(v16));
      id v7 = (id)[v19 supportedContentTypes];
      uint64_t v8 = [v7 countByEnumeratingWithState:v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v4 = *(void *)v16[2];
        uint64_t v5 = 0LL;
        unint64_t v6 = v8;
        while (1)
        {
          uint64_t v3 = v5;
          if (*(void *)v16[2] != v4) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = 0LL;
          uint64_t v17 = *(void *)(v16[1] + 8 * v5);
          [v21[0] setObject:v19 forKeyedSubscript:v17];
          ++v5;
          if (v3 + 1 >= v6)
          {
            uint64_t v5 = 0LL;
            unint64_t v6 = [v7 countByEnumeratingWithState:v16 objects:v22 count:16];
            if (!v6) {
              break;
            }
          }
        }
      }

      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0LL;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  uint64_t v1 = [v21[0] copy];
  io_registry_entry_t v2 = (void *)contentTypeToSubclassMap_sharedMap;
  contentTypeToSubclassMap_sharedMap = v1;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v21, 0LL);
  objc_autoreleasePoolPop(context);
}

- (id)getPropertyWithName:(id)a3
{
  uint64_t v11 = "-[LPMedia(Private) getPropertyWithName:]";
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v20 = self;
  location[1] = (id)a2;
  uint64_t v12 = 0LL;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  io_registry_entry_t v3 = -[LPMedia ioMedia](v20, "ioMedia");
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v3, (CFStringRef)location[0], 0LL, 0);
  id v18 = CFProperty;
  if (!v18)
  {
    uint64_t v17 = _os_log_pack_size();
    uint64_t v10 = v17;
    int v16 = &v5;
    unint64_t v9 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    MEMORY[0x1895F8858]();
    uint64_t v15 = v10;
    uint64_t v14 = (char *)&v5 - v9;
    uint64_t v13 = _os_log_pack_fill();
    __os_log_helper_1_2_2_8_32_8_64(v13, (uint64_t)v11, (uint64_t)location[0]);
    _LPLogPack(3);
  }

  unint64_t v6 = &v18;
  id v7 = v18;
  id v8 = 0LL;
  objc_storeStrong(v6, 0LL);
  objc_storeStrong(location, v8);
  return v7;
}

- (BOOL)getBoolPropertyWithName:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  id v5 = -[LPMedia getPropertyWithName:](v7, "getPropertyWithName:", location[0]);
  char v4 = [v5 BOOLValue];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (id)getStringPropertyWithName:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  id v5 = -[LPMedia getPropertyWithName:](v7, "getPropertyWithName:", location[0]);
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)mediaOfCorrectTypeGivenIOMedia:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v29 = a1;
  SEL v28 = a2;
  io_registry_entry_t v27 = a3;
  mach_timespec_t waitTime = (mach_timespec_t)5LL;
  if (IOServiceWaitQuiet(a3, &waitTime) == -536870186)
  {
    uint64_t v25 = _os_log_pack_size();
    uint64_t v15 = v25;
    uint64_t v24 = &v9;
    unint64_t v14 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    MEMORY[0x1895F8858]();
    uint64_t v23 = v15;
    uint64_t v22 = (char *)&v9 - v14;
    id v21 = (_BYTE *)_os_log_pack_fill();
    __os_log_helper_1_0_0(v21);
    _LPLogPack(2);
  }

  id location = 0LL;
  int v13 = 0;
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v27, @"Content", 0LL, 0);
  id location = CFProperty;
  Class v19 = 0LL;
  char v17 = v13 & 1;
  if (location)
  {
    id v18 = +[LPMedia contentTypeToSubclassMap](&OBJC_CLASS___LPMedia, "contentTypeToSubclassMap");
    char v17 = 1;
    uint64_t v12 = -[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", location);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  Class v19 = v12;
  if ((v17 & 1) != 0) {

  }
  if (!v19) {
    Class v19 = (Class)objc_opt_class();
  }
  unint64_t v9 = &v16;
  id v11 = 0LL;
  id v16 = 0LL;
  id v3 = objc_alloc(v19);
  id v4 = v16;
  id v16 = v3;

  id v5 = v16;
  unint64_t v6 = (void *)[v5 initWithIOMediaObject:v27];
  id v7 = v16;
  id v16 = v6;

  id v10 = v16;
  objc_storeStrong(v9, v11);
  objc_storeStrong(&location, v11);
  return v10;
}

+ (void)waitForIOMediaWithDevNode:(id)a3
{
  id location[3] = *(id *)MEMORY[0x1895F89C0];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = location[0];
  if ([v21 hasPrefix:@"/dev/"])
  {
    id v3 = (id)[v21 substringFromIndex:5];
    id v4 = v21;
    id v21 = v3;
  }

  CFDictionaryRef v20 = 0LL;
  id v7 = (mach_port_t *)MEMORY[0x1896086B0];
  mach_port_t v6 = *MEMORY[0x1896086B0];
  CFDictionaryRef v20 = IOBSDNameMatching(v6, 0, (const char *)[v21 fileSystemRepresentation]);
  io_object_t MatchingService = 0;
  io_object_t MatchingService = IOServiceGetMatchingService(*v7, v20);
  if (MatchingService)
  {
    mach_timespec_t waitTime = (mach_timespec_t)5LL;
    if (IOServiceWaitQuiet(MatchingService, &waitTime) == -536870186)
    {
      uint64_t v17 = _os_log_pack_size();
      id v16 = &v5;
      uint64_t v15 = v17;
      unint64_t v14 = (char *)&v5 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_64(v13, (uint64_t)v21);
      _LPLogPack(1);
    }

    IOObjectRelease(MatchingService);
  }

  else
  {
    uint64_t v12 = _os_log_pack_size();
    id v11 = &v5;
    uint64_t v10 = v12;
    unint64_t v9 = (char *)&v5 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v8 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_64(v8, (uint64_t)v21);
    _LPLogPack(1);
  }

  id v5 = 0LL;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, v5);
}

+ (void)waitForBlockStorage
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v17 = a1;
  SEL v16 = a2;
  id v4 = &v15;
  io_iterator_t v15 = 0;
  CFDictionaryRef v14 = IOServiceMatching("IOBlockStorageDevice");
  if (!IOServiceGetMatchingServices(*MEMORY[0x1896086B0], v14, &v15))
  {
    int v13 = 0;
    char v12 = 0;
    do
    {
      MEMORY[0x186E34A98](v15);
      char v12 = 0;
      io_object_t v11 = 0;
      mach_timespec_t waitTime = (mach_timespec_t)5LL;
      while (1)
      {
        io_object_t v11 = IOIteratorNext(v15);
        if (!v11) {
          break;
        }
        if (IOServiceWaitQuiet(v11, &waitTime) == -536870186) {
          char v12 = 1;
        }
        IOObjectRelease(v11);
      }

      ++v13;
      BOOL v3 = 0;
      if (!IOIteratorIsValid(v15)) {
        BOOL v3 = v13 < 5;
      }
    }

    while (v3);
    if ((v12 & 1) != 0)
    {
      uint64_t v9 = _os_log_pack_size();
      uint64_t v8 = v2;
      uint64_t v7 = v9;
      mach_port_t v6 = &v2[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      id v5 = (_BYTE *)_os_log_pack_fill();
      __os_log_helper_1_0_0(v5);
      _LPLogPack(2);
    }

    IOObjectRelease(v15);
  }

@end