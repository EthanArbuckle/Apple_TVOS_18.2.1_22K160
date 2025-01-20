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
  return (NSArray *)__NSArray0__;
}

+ (BOOL)hasEmbeddedDeviceTypeRoot
{
  id v11 = a1;
  SEL v10 = a2;
  char v9 = 0;
  v15[0] = @"IOProviderClass";
  v16[0] = @"IOBlockStorageDevice";
  v15[1] = @"IOPropertyMatch";
  v13 = @"EmbeddedDeviceTypeRoot";
  v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  v14 = v5;
  v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL);
  v16[1] = v4;
  id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL);

  id location = 0LL;
  objc_storeStrong(&location, v8);
  matching = (const __CFDictionary *)location;
  objc_storeStrong(&location, 0LL);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  if (MatchingService)
  {
    char v9 = 1;
    IOObjectRelease(MatchingService);
  }

  char v3 = v9;
  objc_storeStrong(&v8, 0LL);
  return v3 & 1;
}

+ (id)allMedia
{
  v4 = "+[LPMedia allMedia]";
  void v16[2] = a1;
  v16[1] = (id)a2;
  v16[0] = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL);
  +[LPMedia waitForBlockStorage](&OBJC_CLASS___LPMedia, "waitForBlockStorage");
  v5 = &v15;
  io_iterator_t v15 = 0;
  CFDictionaryRef v14 = IOServiceMatching("IOMedia");
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v14, &v15))
  {
    uint64_t v13 = _os_log_pack_size(12LL);
    v12 = &v3;
    uint64_t v11 = v13;
    uint64_t v10 = (uint64_t)&v3 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill(v10, v13, 0LL, &_mh_execute_header, "%s: Failed to get IOMedia objects", v3);
    __os_log_helper_1_2_1_8_32(v9, (uint64_t)v4);
    _LPLogPack(1, v10);
    v17 = (NSArray *)__NSArray0__;
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
    v17 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v16[0]);
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
  id v7 = [v13 mediaForPath:location[0] snapshotName:&obj];
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
  v56 = a4;
  v53 = "+[LPMedia mediaForPath:snapshotName:]";
  v54 = "AppleAPFSSnapshot";
  v55 = "UUID";
  id v94 = a1;
  v93[1] = (id)a2;
  v93[0] = 0LL;
  objc_storeStrong(v93, a3);
  v92 = v56;
  v91 = 0LL;
  id v90 = 0LL;
  io_object_t MatchingService = 0;
  v57 = &v104;
  bzero(&v104, 0x878uLL);
  if (statfs((const char *)[v93[0] fileSystemRepresentation], &v104))
  {
    int v88 = 0;
    int v88 = *__error();
    uint64_t v87 = _os_log_pack_size(38LL);
    uint64_t v49 = v87;
    v86 = &v19;
    unint64_t v48 = (v87 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v85 = v49;
    uint64_t v84 = (uint64_t)&v19 - v48;
    uint64_t v83 = _os_log_pack_fill((char *)&v19 - v48, v87, 0LL, &_mh_execute_header, "%s: no filesystem for %@ (%d): %s");
    uint64_t v52 = v83;
    id v50 = v93[0];
    int v51 = v88;
    id v4 = strerror(v88);
    __os_log_helper_1_2_4_8_32_8_64_4_0_8_32(v52, (uint64_t)v53, (uint64_t)v50, v51, (uint64_t)v4);
    _LPLogPack(1, v84);
  }

  else
  {
    int32_t v82 = v104.f_fsid.val[0];
    v42 = v102;
    v102[0] = @"IOProviderClass";
    v41 = v103;
    v103[0] = @"IOMedia";
    v102[1] = @"IOPropertyMatch";
    v40 = v100;
    v100[0] = @"BSD Major";
    v46 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", HIBYTE(v104.f_fsid.val[0]));
    v39 = v101;
    v101[0] = v46;
    v100[1] = @"BSD Minor";
    v45 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v82 & 0xFFFFFF);
    v101[1] = v45;
    uint64_t v43 = 2LL;
    v44 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100);
    v103[1] = v44;
    id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  2LL);
    v6 = v91;
    v91 = v5;

    mach_port_t v47 = kIOMasterPortDefault;
    id v7 = (const __CFDictionary *)CFRetain(v91);
    io_object_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
    if (MatchingService)
    {
      id v8 = [v94 mediaOfCorrectTypeGivenIOMedia:MatchingService];
      id v9 = v90;
      id v90 = v8;

      if (v90 && v92)
      {
        v76 = 0LL;
        if ((v104.f_flags & 0x40000000) != 0)
        {
          v75 = strrchr(v104.f_mntfromname, 64);
          if (v75)
          {
            v36 = &v104;
            v74[1] = (id)(v75 - v104.f_mntfromname);
            id v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v104.f_mntfromname,  v75 - v104.f_mntfromname,  4LL);
            uint64_t v11 = v76;
            v76 = v10;
          }

          else if (IOObjectConformsTo(MatchingService, "AppleAPFSSnapshot"))
          {
            v35 = v99;
            uint64_t v33 = 37LL;
            int v32 = 0;
            memset(v99, 0, sizeof(v99));
            id CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, @"UUID", 0LL, 0);
            v74[0] = CFProperty;
            [v74[0] getCString:v99 maxLength:37 encoding:4];
            v34 = &v96;
            bzero(&v96, 0x120uLL);
            uint64_t v96 = 2LL;
            if (uuid_parse(v99, v97))
            {
              uint64_t v73 = _os_log_pack_size(42LL);
              uint64_t v31 = v73;
              v72 = &v19;
              unint64_t v30 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0LL;
              __chkstk_darwin();
              uint64_t v71 = v31;
              uint64_t v70 = (uint64_t)&v19 - v30;
              uint64_t v69 = _os_log_pack_fill( (char *)&v19 - v30,  v73,  0LL,  &_mh_execute_header,  "%s: could not parse %s %{private}s: %{private}@");
              __os_log_helper_1_3_4_8_32_8_32_8_33_8_65(v69, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v74[0]);
              _LPLogPack(1, v70);
            }

            else if (fsctl(v104.f_mntonname, 0xC1204A43uLL, &v96, 0))
            {
              uint64_t v68 = _os_log_pack_size(28LL);
              uint64_t v27 = v68;
              v67 = &v19;
              unint64_t v26 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0LL;
              __chkstk_darwin();
              uint64_t v66 = v27;
              uint64_t v65 = (uint64_t)&v19 - v26;
              uint64_t v64 = _os_log_pack_fill( (char *)&v19 - v26,  v68,  0LL,  &_mh_execute_header,  "%s: could not look up snapshot by UUID: %d (%s)",  (const char *)v19,  (_DWORD)v20,  v21);
              uint64_t v29 = v64;
              int v28 = *__error();
              v12 = __error();
              id v13 = strerror(*v12);
              __os_log_helper_1_2_3_8_32_4_0_8_32(v29, (uint64_t)v53, v28, (uint64_t)v13);
              _LPLogPack(1, v65);
            }

            else
            {
              v25 = &v96;
              size_t v63 = strnlen(v98, 0xFFuLL);
              CFDictionaryRef v14 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v98,  v63,  4LL);
              io_iterator_t v15 = v76;
              v76 = v14;
            }

            objc_storeStrong(v74, 0LL);
          }

          if (!-[NSString length](v76, "length"))
          {
            uint64_t v62 = 0LL;
            uint64_t v62 = _os_log_pack_size(22LL);
            uint64_t v24 = v62;
            v61 = &v19;
            unint64_t v23 = (v62 + 15) & 0xFFFFFFFFFFFFFFF0LL;
            __chkstk_darwin();
            uint64_t v60 = v24;
            uint64_t v59 = (uint64_t)&v19 - v23;
            uint64_t v58 = _os_log_pack_fill( (char *)&v19 - v23,  v62,  0LL,  &_mh_execute_header,  "%s: path is a snapshot, but has no name: %{private}@");
            __os_log_helper_1_3_2_8_32_8_65(v58, (uint64_t)v53, (uint64_t)v93[0]);
            _LPLogPack(1, v59);
          }
        }

        v22 = (id *)&v76;
        v16 = v76;
        v17 = v22;
        id *v92 = v16;
        objc_storeStrong(v17, 0LL);
      }
    }

    else
    {
      uint64_t v81 = _os_log_pack_size(32LL);
      uint64_t v38 = v81;
      v80 = &v19;
      unint64_t v37 = (v81 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v79 = v38;
      uint64_t v78 = (uint64_t)&v19 - v37;
      uint64_t v77 = _os_log_pack_fill((char *)&v19 - v37, v81, 0LL, &_mh_execute_header, "%s: no IOMedia for %@ (device 0x%lx)");
      __os_log_helper_1_2_3_8_32_8_64_8_0(v77, (uint64_t)v53, (uint64_t)v93[0], v82);
      _LPLogPack(1, v78);
    }
  }

  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  v19 = &v90;
  id v20 = v90;
  v21 = 0LL;
  objc_storeStrong(v19, 0LL);
  objc_storeStrong((id *)&v91, v21);
  objc_storeStrong(v93, v21);
  return v20;
}

+ (id)snapshotNameForMediaForPath:(id)a3
{
  uint64_t v32 = 0LL;
  uint64_t v33 = "+[LPMedia snapshotNameForMediaForPath:]";
  id v74 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v34 = &v72;
  id v72 = 0LL;
  id v71 = 0LL;
  id v70 = 0LL;
  id v35 = [v74 mediaForPath:location[0] snapshotName:&v70];
  objc_storeStrong(&v72, v70);
  id v71 = v35;
  if (v35)
  {
    if (v72)
    {
      id v75 = v72;
      int v64 = 1;
    }

    else
    {
      id v63 = [v74 liveMediaForSnapshotAtPath:@"/"];
      uint64_t v29 = &v62;
      id v62 = 0LL;
      id v61 = 0LL;
      id v30 = [v74 mediaForPath:@"/" snapshotName:&v61];
      objc_storeStrong(&v62, v61);
      BOOL v31 = 0;
      if (v30) {
        BOOL v31 = v62 != 0LL;
      }
      BOOL v28 = v31;

      if (v31)
      {
        id v75 = v62;
        int v64 = 1;
      }

      else
      {
        int v64 = 0;
      }

      objc_storeStrong(&v62, 0LL);
      if (!v64)
      {
LABEL_13:
        id v27 = v71;
        uint64_t v3 = objc_opt_class(&OBJC_CLASS___LPAPFSVolume);
        if ((objc_opt_isKindOfClass(v27, v3) & 1) != 0)
        {
          id v55 = v71;
          unint64_t v23 = &v54;
          uint64_t v54 = 0LL;
          id v53 = 0LL;
          id v52 = 0LL;
          id v24 = [v55 snapshotInfoWithError:&v52];
          objc_storeStrong((id *)&v54, v52);
          id v53 = v24;
          if (v24)
          {
            v17 = &OBJC_CLASS___NSMutableArray;
            v46 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v53 count]);
            v18 = v44;
            memset(v44, 0, sizeof(v44));
            id v19 = v53;
            id v20 = [v19 countByEnumeratingWithState:v44 objects:v76 count:16];
            if (v20)
            {
              uint64_t v14 = *(void *)v44[2];
              uint64_t v15 = v32;
              id v16 = v20;
              while (1)
              {
                unint64_t v12 = (unint64_t)v16;
                uint64_t v13 = v15;
                if (*(void *)v44[2] != v14) {
                  objc_enumerationMutation(v19);
                }
                id v45 = 0LL;
                id v45 = *(id *)(v44[1] + 8 * v13);
                id v43 = 0LL;
                id v43 = [v45 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];
                id v42 = 0LL;
                id v42 = [v45 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
                if ([v42 BOOLValue])
                {
                  id v75 = v43;
                  int v64 = 1;
                }

                else
                {
                  int v64 = 0;
                }

                uint64_t v11 = 0LL;
                objc_storeStrong(&v42, 0LL);
                objc_storeStrong(&v43, 0LL);
                if (v64) {
                  break;
                }
                uint64_t v15 = v13 + 1;
                id v16 = (id)v12;
                if (v13 + 1 >= v12)
                {
                  uint64_t v15 = v32;
                  id v16 = [v19 countByEnumeratingWithState:v44 objects:v76 count:16];
                  if (!v16) {
                    goto LABEL_29;
                  }
                }
              }
            }

            else
            {
LABEL_29:
              int v64 = 0;
            }

            if (!v64)
            {
              if (-[NSMutableArray count](v46, "count"))
              {
                id v9 = &v36;
                uint64_t v10 = 0LL;
                id v36 = 0LL;
                id v36 =  -[NSMutableArray sortedArrayUsingComparator:]( v46,  "sortedArrayUsingComparator:",  &__block_literal_global_8);
                id v8 = [v36 lastObject];
                id v75 = [v8 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyName[0]];

                int v64 = 1;
                objc_storeStrong(&v36, 0LL);
              }

              else
              {
                uint64_t v41 = _os_log_pack_size(12LL);
                v40 = &v5;
                uint64_t v39 = v41;
                uint64_t v38 = (uint64_t)&v5 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v37 = _os_log_pack_fill( v38,  v41,  0LL,  &_mh_execute_header,  "%s: No snapshot is tagged for boot and none match the naming scheme",  v5);
                __os_log_helper_1_2_1_8_32(v37, (uint64_t)v33);
                _LPLogPack(1, v38);
                id v75 = 0LL;
                int v64 = 1;
              }
            }

            objc_storeStrong((id *)&v46, 0LL);
          }

          else
          {
            uint64_t v51 = _os_log_pack_size(32LL);
            id v50 = &v5;
            uint64_t v49 = v51;
            uint64_t v48 = (uint64_t)&v5 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v47 = _os_log_pack_fill(v48, v51, 0LL, &_mh_execute_header, "%s: Error getting snapshot info for %@: %@");
            uint64_t v21 = v47;
            id v22 = [v71 devNodePath];
            __os_log_helper_1_2_3_8_32_8_64_8_64(v21, (uint64_t)v33, (uint64_t)v22, v54);

            _LPLogPack(1, v48);
            id v75 = 0LL;
            int v64 = 1;
          }

          id v7 = 0LL;
          objc_storeStrong(&v53, 0LL);
          objc_storeStrong((id *)&v54, v7);
          objc_storeStrong(&v55, v7);
        }

        else
        {
          uint64_t v60 = _os_log_pack_size(22LL);
          uint64_t v59 = &v5;
          uint64_t v58 = v60;
          uint64_t v57 = (uint64_t)&v5 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v56 = _os_log_pack_fill(v57, v60, 0LL, &_mh_execute_header, "%s: %@ isn't an APFS volume");
          uint64_t v25 = v56;
          id v26 = [v71 devNodePath];
          __os_log_helper_1_2_2_8_32_8_64(v25, (uint64_t)v33, (uint64_t)v26);

          _LPLogPack(1, v57);
          id v75 = 0LL;
          int v64 = 1;
        }
      }

      objc_storeStrong(&v63, 0LL);
    }
  }

  else
  {
    uint64_t v69 = _os_log_pack_size(22LL);
    uint64_t v68 = &v5;
    uint64_t v67 = v69;
    uint64_t v66 = (uint64_t)&v5 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v65 = _os_log_pack_fill(v66, v69, 0LL, &_mh_execute_header, "%s: No media found for path: %{private}@");
    __os_log_helper_1_3_2_8_32_8_65(v65, (uint64_t)v33, (uint64_t)location[0]);
    _LPLogPack(1, v66);
    id v75 = 0LL;
    int v64 = 1;
  }

  id v6 = 0LL;
  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, v6);
  objc_storeStrong(location, v6);
  return v75;
}

int64_t __39__LPMedia_snapshotNameForMediaForPath___block_invoke( id a1,  NSDictionary *a2,  NSDictionary *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  v8[0] = 0LL;
  v8[0] = [location[0] objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];
  id v7 = 0LL;
  id v7 = [v9 objectForKeyedSubscript:LPAPFSSnapshotPropertyKeyXID[0]];
  id v6 = [v8[0] compare:v7];
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return (int64_t)v6;
}

+ (id)liveMediaForSnapshotAtPath:(id)a3
{
  kern_return_t ParentEntry;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  io_object_t v30;
  int v31;
  id location[2];
  id v33;
  id v34;
  id v5 = "+[LPMedia liveMediaForSnapshotAtPath:]";
  uint64_t v33 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"/"])
  {
    id v30 = +[LPMedia _copyIOMediaForDiskWithPath:](&OBJC_CLASS___LPMedia, "_copyIOMediaForDiskWithPath:", location[0]);
    if (!v30
      && ([location[0] isEqualToString:@"/"] & 1) != 0
      && (id v30 = +[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]( &OBJC_CLASS___LPMedia,  "_copyLiveFilesystemIOMediaForRootedSnapshot")) != 0)
    {
      v4[4] = &v29;
      v4[3] = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v29 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](&OBJC_CLASS___LPMedia, "mediaOfCorrectTypeGivenIOMedia:", v30);
      IOObjectRelease(v30);
      v34 = v29;
      BOOL v31 = 1;
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
            v34 = v6;
            BOOL v31 = 1;
            objc_storeStrong(&v6, 0LL);
          }

          else
          {
            uint64_t v11 = _os_log_pack_size(22LL);
            uint64_t v10 = v4;
            uint64_t v9 = v11;
            uint64_t v8 = (uint64_t)v4 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v7 = _os_log_pack_fill( v8,  v11,  0LL,  &_mh_execute_header,  "%s: Parent of disk backing %{private}@ is not an APFS volume");
            __os_log_helper_1_3_2_8_32_8_65(v7, (uint64_t)v5, (uint64_t)location[0]);
            _LPLogPack(1, v8);
            IOObjectRelease(v30);
            v34 = 0LL;
            BOOL v31 = 1;
          }
        }

        else
        {
          uint64_t v16 = _os_log_pack_size(22LL);
          uint64_t v15 = v4;
          uint64_t v14 = v16;
          uint64_t v13 = (uint64_t)v4 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v12 = _os_log_pack_fill( v13,  v16,  0LL,  &_mh_execute_header,  "%s: Failed to obtain parent IOMedia for disk at path %{private}@");
          __os_log_helper_1_3_2_8_32_8_65(v12, (uint64_t)v5, (uint64_t)location[0]);
          _LPLogPack(1, v13);
          IOObjectRelease(v30);
          v34 = 0LL;
          BOOL v31 = 1;
        }
      }

      else
      {
        unint64_t v23 = _os_log_pack_size(22LL);
        id v22 = v4;
        uint64_t v21 = v23;
        id v20 = (uint64_t)v4 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        id v19 = _os_log_pack_fill( v20,  v23,  0LL,  &_mh_execute_header,  "%s: Not on a rooted snapshot disk, will return self: %{private}@");
        __os_log_helper_1_3_2_8_32_8_65(v19, (uint64_t)v5, (uint64_t)location[0]);
        _LPLogPack(1, v20);
        IOObjectRelease(v30);
        v34 = +[LPMedia mediaForPath:](&OBJC_CLASS___LPMedia, "mediaForPath:", location[0]);
        BOOL v31 = 1;
      }
    }

    else
    {
      BOOL v28 = _os_log_pack_size(22LL);
      id v27 = v4;
      id v26 = v28;
      uint64_t v25 = (uint64_t)v4 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      id v24 = _os_log_pack_fill(v25, v28, 0LL, &_mh_execute_header, "%s: No disk for %{private}@");
      __os_log_helper_1_3_2_8_32_8_65(v24, (uint64_t)v5, (uint64_t)location[0]);
      _LPLogPack(1, v25);
      v34 = 0LL;
      BOOL v31 = 1;
    }
  }

  else
  {
    v34 = [v33 mediaForPath:location[0]];
    BOOL v31 = 1;
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
  theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(theDict, @"IOProviderClass", @"IOMedia");
  CFDictionarySetValue(theDict, @"UUID", location[0]);
  io_service_t object = IOServiceGetMatchingService(kIOMasterPortDefault, theDict);
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
  id v12 = location[0];
  id v11 = 0LL;
  if (v12 && [v12 length])
  {
    if ([v12 hasPrefix:@"/dev/"])
    {
      id v3 = [v12 substringFromIndex:5];
      id v4 = v12;
      id v12 = v3;
    }

    uint64_t v10 = IOBSDNameMatching( kIOMasterPortDefault, 0, (const char *)[v12 fileSystemRepresentation]);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
    if (MatchingService)
    {
      id v5 =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  MatchingService);
      id v6 = v11;
      id v11 = v5;

      IOObjectRelease(MatchingService);
    }
  }

  id v8 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (id)wholeMediaForMedia
{
  id v9 = "-[LPMedia wholeMediaForMedia]";
  uint64_t v21 = self;
  location[1] = (id)a2;
  if (-[LPMedia isWhole](self, "isWhole"))
  {
    id v22 = v21;
  }

  else
  {
    location[0] = 0LL;
    id v8 = &v19;
    io_iterator_t v19 = 0;
    if (IORegistryEntryCreateIterator(-[LPMedia ioMedia](v21, "ioMedia"), "IOService", 3u, &v19))
    {
      uint64_t v18 = _os_log_pack_size(12LL);
      v17 = &v5;
      uint64_t v16 = v18;
      uint64_t v15 = (uint64_t)&v5 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill(v15, v18, 0LL, &_mh_execute_header, "%s : Unable to get parent iterator", v5);
      __os_log_helper_1_2_1_8_32(v14, (uint64_t)v9);
      _LPLogPack(1, v15);
      id v22 = 0LL;
      int v13 = 1;
    }

    else
    {
      io_object_t v12 = 0;
      unsigned __int8 v11 = 0;
      while (1)
      {
        io_object_t v12 = IOIteratorNext(v19);
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
      id v22 = (LPMedia *)location[0];
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
  id v8 = -[LPMedia init](&v5, "init");
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
  -[LPMedia dealloc](&v2, "dealloc");
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
    if (IORegistryEntryGetName(-[LPMedia ioMedia](v5, "ioMedia"), __b))
    {
      io_object_t v6 = 0LL;
    }

    else
    {
      __b[127] = 0;
      io_object_t v6 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", __b, 4LL);
    }
  }

  else
  {
    io_object_t v6 =  +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (char *)v9 + v9[0],  4LL);
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (BOOL)setName:(id)a3 withError:(id *)a4
{
  v17 = a4;
  uint64_t v16 = "-[LPMedia setName:withError:]";
  uint64_t v41 = self;
  v40[1] = (id)a2;
  v40[0] = 0LL;
  objc_storeStrong(v40, a3);
  uint64_t v39 = v17;
  unsigned __int8 v38 = 1;
  bzero(v42, 0x408uLL);
  id v18 = -[LPMedia mountPoint](v41, "mountPoint");
  io_iterator_t v19 = (const char *)[v18 fileSystemRepresentation];

  uint64_t v37 = v19;
  if (v19)
  {
    uint64_t v14 = &v30;
    __int128 v30 = xmmword_100058000;
    uint64_t v31 = 0LL;
    uint64_t v15 = v42;
    int v13 = v43;
    __strlcpy_chk(v43, [v40[0] UTF8String], 1024, 1024);
    v42[0] = 8;
    v42[1] = strlen(v43) + 1;
    if (setattrlist(v37, &v30, v42, 0x408uLL, 0))
    {
      uint64_t v29 = _os_log_pack_size(22LL);
      BOOL v28 = &v9;
      uint64_t v27 = v29;
      uint64_t v26 = (uint64_t)&v9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = _os_log_pack_fill(v26, v29, 0LL, &_mh_execute_header, "%s: Failed to set name for volume: %s\n", v9, v10);
      uint64_t v12 = v25;
      objc_super v5 = __error();
      io_object_t v6 = strerror(*v5);
      __os_log_helper_1_2_2_8_32_8_32(v12, (uint64_t)v16, (uint64_t)v6);
      _LPLogPack(1, v26);
      if (v39)
      {
        unsigned __int8 v11 = &OBJC_CLASS___NSError;
        uint64_t v10 = (const char *)NSPOSIXErrorDomain;
        SEL v7 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        void *v39 = v7;
      }

      unsigned __int8 v38 = 0;
    }

    else
    {
      uint64_t v24 = _os_log_pack_size(22LL);
      unint64_t v23 = &v9;
      uint64_t v22 = v24;
      uint64_t v21 = (uint64_t)&v9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v20 = _os_log_pack_fill(v21, v24, 0LL, &_mh_execute_header, "%s: Successfully set volume name to %{private}@\n");
      __os_log_helper_1_3_2_8_32_8_65(v20, (uint64_t)v16, (uint64_t)v40[0]);
      _LPLogPack(3, v21);
    }
  }

  else
  {
    uint64_t v36 = _os_log_pack_size(12LL);
    id v35 = &v9;
    uint64_t v34 = v36;
    uint64_t v33 = (uint64_t)&v9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v32 = _os_log_pack_fill(v33, v36, 0LL, &_mh_execute_header, "%s: Volume is not mounted. Unable to set name\n", v9);
    __os_log_helper_1_2_1_8_32(v32, (uint64_t)v16);
    _LPLogPack(1, v33);
    if (v39)
    {
      id v4 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      void *v39 = v4;
    }

    unsigned __int8 v38 = 0;
  }

  HIDWORD(v9) = v38;
  objc_storeStrong(v40, 0LL);
  return BYTE4(v9) & 1;
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
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", location[0]);
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
        SEL v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8[i].f_mntonname);
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
  unsigned __int8 v11 = self;
  SEL v10 = a2;
  v14[0] = *(_OWORD *)&off_100061690;
  v14[1] = *(_OWORD *)&off_1000616A0;
  IOOptionBits options = 3;
  for (int i = 0; (unint64_t)i < 4; ++i)
  {
    id location = 0LL;
    io_registry_entry_t v2 = -[LPMedia ioMedia](v11, "ioMedia");
    id v13 = (id)IORegistryEntrySearchCFProperty(v2, "IOService", *((CFStringRef *)v14 + i), kCFAllocatorDefault, options);
    id location = v13;
    id v5 = location;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
    {
      id v12 = location;
      int v6 = 1;
    }

    else
    {
      int v6 = 0;
    }

    objc_storeStrong(&location, 0LL);
    if (v6) {
      return v12;
    }
  }

  id v12 = 0LL;
  return v12;
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
  id v5 = [v6 objectForKeyedSubscript:@"Physical Interconnect Location"];
  unsigned __int8 v4 = [v5 isEqualToString:@"Internal"];
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
  unsigned __int8 v4 = [v5 BOOLValue];
  objc_storeStrong(&v5, 0LL);
  return v4 & 1;
}

- (BOOL)isPrimaryMedia
{
  return -[LPMedia isEmbeddedDeviceTypeRoot](self, "isEmbeddedDeviceTypeRoot", a2, self);
}

- (BOOL)isReadOnly
{
  unsigned __int8 v4 = "-[LPMedia isReadOnly]";
  uint64_t v14 = self;
  SEL v13 = a2;
  BOOL v12 = 0;
  id v5 = objc_autoreleasePoolPush();
  id v11 = -[LPMedia mountPoint](v14, "mountPoint");
  if (v11)
  {
    v3[1] = &v15;
    bzero(&v15, 0x878uLL);
    if (statfs((const char *)[v11 fileSystemRepresentation], &v15))
    {
      uint64_t v10 = _os_log_pack_size(22LL);
      id v9 = v3;
      uint64_t v8 = v10;
      uint64_t v7 = (uint64_t)v3 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = _os_log_pack_fill(v7, v10, 0LL, &_mh_execute_header, "%s: failed to get read-only status for %@\n");
      __os_log_helper_1_2_2_8_32_8_64(v6, (uint64_t)v4, (uint64_t)v11);
      _LPLogPack(1, v7);
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
  unsigned __int8 v4 = "-[LPMedia isJournaled]";
  uint64_t v14 = self;
  SEL v13 = a2;
  BOOL v12 = 0;
  id v5 = objc_autoreleasePoolPush();
  id v11 = -[LPMedia mountPoint](v14, "mountPoint");
  if (v11)
  {
    v3[1] = &v15;
    bzero(&v15, 0x878uLL);
    if (statfs((const char *)[v11 fileSystemRepresentation], &v15))
    {
      uint64_t v10 = _os_log_pack_size(22LL);
      id v9 = v3;
      uint64_t v8 = v10;
      uint64_t v7 = (uint64_t)v3 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = _os_log_pack_fill(v7, v10, 0LL, &_mh_execute_header, "%s: failed to get journaled status for %@\n");
      __os_log_helper_1_2_2_8_32_8_64(v6, (uint64_t)v4, (uint64_t)v11);
      _LPLogPack(1, v7);
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
  SEL v13 = self;
  v12[1] = (id)a2;
  v12[0] = -[LPMedia mountPoint](self, "mountPoint");
  if (v12[0])
  {
    int v3 = (objc_class *)objc_opt_class(v13);
    uint64_t v6 = NSStringFromClass(v3);
    id v5 = -[LPMedia name](v13, "name");
    uint64_t v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@, Mount: %@",  v6,  v5,  v12[0]);
  }

  else
  {
    id location = -[LPMedia mediaUUID](v13, "mediaUUID");
    io_registry_entry_t v2 = (objc_class *)objc_opt_class(v13);
    if (location)
    {
      uint64_t v10 = NSStringFromClass(v2);
      id v9 = -[LPMedia name](v13, "name");
      uint64_t v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@, UUID: %@",  v10,  v9,  location);
    }

    else
    {
      uint64_t v8 = NSStringFromClass(v2);
      id v7 = -[LPMedia name](v13, "name");
      uint64_t v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v8, v7);
    }

    objc_storeStrong(&location, 0LL);
  }

  objc_storeStrong(v12, 0LL);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = location[0];
  uint64_t v3 = objc_opt_class(v10);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    id v7 = 0LL;
    id v7 = location[0];
    uint64_t object = -[LPMedia ioMedia](v10, "ioMedia");
    BOOL v11 = IOObjectIsEqualTo(object, (io_object_t)[v7 ioMedia]) == 1;
    int v8 = 1;
    objc_storeStrong(&v7, (id)HIDWORD(object));
  }

  else
  {
    BOOL v11 = 0;
    int v8 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v11;
}

- (id)_deviceCharacteristicStringForKey:(id)a3
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  int v9 = 3;
  id v13 = (id)IORegistryEntrySearchCFProperty( -[LPMedia ioMedia](v12, "ioMedia"),  "IOService",  @"Device Characteristics",  0LL,  3u);
  id v8 = v13;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v3) & 1) != 0)
  {
    id obj = [v8 objectForKeyedSubscript:location[0]];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(obj, v4) & 1) != 0) {
      objc_storeStrong(&v10, obj);
    }
    objc_storeStrong(&obj, 0LL);
  }

  id v6 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (unsigned)_copyIOMediaForDiskWithPath:(id)a3
{
  id v13 = "+[LPMedia _copyIOMediaForDiskWithPath:]";
  v24[2] = a1;
  v24[1] = (id)a2;
  v24[0] = 0LL;
  objc_storeStrong(v24, a3);
  int v23 = 0;
  uint64_t v14 = &v26;
  bzero(&v26, 0x878uLL);
  if (statfs((const char *)[v24[0] fileSystemRepresentation], &v26))
  {
    int v23 = *__error();
    uint64_t v22 = _os_log_pack_size(28LL);
    uint64_t v21 = &v7;
    uint64_t v20 = v22;
    uint64_t v19 = (uint64_t)&v7 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill(v19, v22, 0LL, &_mh_execute_header, "%s: statfs failed: %d (%s)", v7, (_DWORD)v8, v9);
    uint64_t v12 = v18;
    int v11 = v23;
    uint64_t v3 = strerror(v23);
    __os_log_helper_1_2_3_8_32_4_0_8_32(v12, (uint64_t)v13, v11, (uint64_t)v3);
    _LPLogPack(1, v19);
    io_service_t MatchingService = 0;
    int v17 = 1;
  }

  else
  {
    uint64_t v16 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26.f_mntfromname);
    if (-[NSString hasPrefix:](v16, "hasPrefix:", @"/dev/"))
    {
      uint64_t v4 = -[NSString substringFromIndex:](v16, "substringFromIndex:", 5LL);
      id v5 = v16;
      uint64_t v16 = v4;
    }

    int v9 = 0LL;
    id v8 = &kIOMasterPortDefault;
    HIDWORD(v7) = kIOMasterPortDefault;
    id v10 = &v16;
    CFDictionaryRef v15 = IOBSDNameMatching(kIOMasterPortDefault, 0, -[NSString UTF8String](v16, "UTF8String"));
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v15);
    int v17 = 1;
    objc_storeStrong((id *)&v16, 0LL);
  }

  objc_storeStrong(v24, 0LL);
  return MatchingService;
}

+ (unsigned)_copyLiveFilesystemIOMediaForRootedSnapshot
{
  uint64_t v14 = "+[LPMedia _copyLiveFilesystemIOMediaForRootedSnapshot]";
  id v29 = a1;
  SEL v28 = a2;
  int v27 = 0;
  CFDictionaryRef v15 = &v31;
  bzero(&v31, 0x878uLL);
  if (statfs("/", &v31))
  {
    int v27 = *__error();
    uint64_t v26 = _os_log_pack_size(28LL);
    uint64_t v25 = &v6;
    uint64_t v24 = v26;
    uint64_t v23 = (uint64_t)&v6 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill(v23, v26, 0LL, &_mh_execute_header, "%s: statfs failed: %d (%s)", v6, v7, v8);
    uint64_t v13 = v22;
    int v12 = v27;
    io_registry_entry_t v2 = strerror(v27);
    __os_log_helper_1_2_3_8_32_4_0_8_32(v13, (uint64_t)v14, v12, (uint64_t)v2);
    _LPLogPack(1, v23);
    return 0;
  }

  else
  {
    uint64_t v21 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31.f_mntfromname);
    uint64_t v20 = -[NSString componentsSeparatedByString:](v21, "componentsSeparatedByString:", @"@");
    char v18 = 0;
    unsigned int v11 = 0;
    if ((id)-[NSArray count](v20, "count") == (id)2)
    {
      id v19 = -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1LL);
      char v18 = 1;
      unsigned int v11 = [v19 hasPrefix:@"/dev/"];
    }

    unsigned int v10 = v11;
    if ((v18 & 1) != 0) {

    }
    if ((v10 & 1) != 0)
    {
      id v8 = (char *)-[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1LL);
      uint64_t v3 = (NSString *)[v8 substringFromIndex:5];
      uint64_t v4 = v21;
      uint64_t v21 = v3;

      mach_port_t v9 = kIOMasterPortDefault;
      CFDictionaryRef v17 = IOBSDNameMatching( kIOMasterPortDefault, 0, -[NSString UTF8String](v21, "UTF8String"));
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v17);
    }

    else
    {
      io_service_t MatchingService = 0;
    }

    int v16 = 1;
    objc_storeStrong((id *)&v20, 0LL);
    objc_storeStrong((id *)&v21, 0LL);
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
  uint64_t v4 = (dispatch_once_t *)&contentTypeToSubclassMap_once;
  id location = 0LL;
  objc_storeStrong(&location, &__block_literal_global_132);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (NSDictionary *)(id)contentTypeToSubclassMap_sharedMap;
}

void __44__LPMedia_Private__contentTypeToSubclassMap__block_invoke(id a1)
{
  v21[2] = a1;
  v21[1] = a1;
  context = objc_autoreleasePoolPush();
  v21[0] = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v24[0] = objc_opt_class(&OBJC_CLASS___LPAPFSContainer);
  v24[1] = objc_opt_class(&OBJC_CLASS___LPAPFSPhysicalStore);
  v24[2] = objc_opt_class(&OBJC_CLASS___LPAPFSVolume);
  id v24[3] = objc_opt_class(&OBJC_CLASS___LPPartitionMedia);
  id location = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL);
  memset(__b, 0, sizeof(__b));
  id obj = location;
  id v15 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v15)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    id v12 = v15;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v19 = 0LL;
      id v19 = *(id *)(__b[1] + 8 * v11);
      memset(v16, 0, sizeof(v16));
      id v7 = [v19 supportedContentTypes];
      id v8 = [v7 countByEnumeratingWithState:v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v4 = *(void *)v16[2];
        uint64_t v5 = 0LL;
        id v6 = v8;
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
          if (v3 + 1 >= (unint64_t)v6)
          {
            uint64_t v5 = 0LL;
            id v6 = [v7 countByEnumeratingWithState:v16 objects:v22 count:16];
            if (!v6) {
              break;
            }
          }
        }
      }

      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0LL;
        id v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v1 = [v21[0] copy];
  io_registry_entry_t v2 = (void *)contentTypeToSubclassMap_sharedMap;
  contentTypeToSubclassMap_sharedMap = (uint64_t)v1;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v21, 0LL);
  objc_autoreleasePoolPop(context);
}

- (id)getPropertyWithName:(id)a3
{
  uint64_t v11 = "-[LPMedia(Private) getPropertyWithName:]";
  uint64_t v20 = self;
  location[1] = (id)a2;
  uint64_t v12 = 0LL;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  io_registry_entry_t v3 = -[LPMedia ioMedia](v20, "ioMedia");
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v3, (CFStringRef)location[0], 0LL, 0);
  id v18 = CFProperty;
  if (!v18)
  {
    uint64_t v17 = _os_log_pack_size(22LL);
    uint64_t v10 = v17;
    int v16 = &v5;
    unint64_t v9 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v15 = v10;
    uint64_t v14 = (uint64_t)&v5 - v9;
    uint64_t v13 = _os_log_pack_fill( (char *)&v5 - v9,  v17,  0LL,  &_mh_execute_header,  "%s : failed to read value for property named: %@");
    __os_log_helper_1_2_2_8_32_8_64(v13, (uint64_t)v11, (uint64_t)location[0]);
    _LPLogPack(3, v14);
  }

  id v6 = &v18;
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
  unsigned __int8 v4 = [v5 BOOLValue];
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
  id v29 = a1;
  SEL v28 = a2;
  io_registry_entry_t v27 = a3;
  mach_timespec_t waitTime = (mach_timespec_t)5LL;
  if (IOServiceWaitQuiet(a3, &waitTime) == -536870186)
  {
    uint64_t v25 = _os_log_pack_size(2LL);
    uint64_t v15 = v25;
    uint64_t v24 = &v9;
    unint64_t v14 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v23 = v15;
    uint64_t v22 = (uint64_t)&v9 - v14;
    uint64_t v21 = (_BYTE *)_os_log_pack_fill( (char *)&v9 - v14,  v25,  0LL,  &_mh_execute_header,  "IOKit wait timed out, volume for media may be stale.");
    __os_log_helper_1_0_0(v21);
    _LPLogPack(2, v22);
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
    Class v19 = (Class)objc_opt_class(&OBJC_CLASS___LPMedia);
  }
  unint64_t v9 = &v16;
  id v11 = 0LL;
  id v16 = 0LL;
  id v3 = objc_alloc(v19);
  id v4 = v16;
  id v16 = v3;

  id v5 = v16;
  id v6 = [v5 initWithIOMediaObject:v27];
  id v7 = v16;
  id v16 = v6;

  id v10 = v16;
  objc_storeStrong(v9, v11);
  objc_storeStrong(&location, v11);
  return v10;
}

+ (void)waitForIOMediaWithDevNode:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = location[0];
  if ([v21 hasPrefix:@"/dev/"])
  {
    id v3 = [v21 substringFromIndex:5];
    id v4 = v21;
    id v21 = v3;
  }

  id v7 = &kIOMasterPortDefault;
  mach_port_t v6 = kIOMasterPortDefault;
  CFDictionaryRef v20 = IOBSDNameMatching( kIOMasterPortDefault, 0, (const char *)[v21 fileSystemRepresentation]);
  io_object_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v20);
  if (MatchingService)
  {
    mach_timespec_t waitTime = (mach_timespec_t)5LL;
    if (IOServiceWaitQuiet(MatchingService, &waitTime) == -536870186)
    {
      uint64_t v17 = _os_log_pack_size(12LL);
      id v16 = &v5;
      uint64_t v15 = v17;
      uint64_t v14 = (uint64_t)&v5 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill(v14, v17, 0LL, &_mh_execute_header, "Timed out waiting for: %@");
      __os_log_helper_1_2_1_8_64(v13, (uint64_t)v21);
      _LPLogPack(1, v14);
    }

    IOObjectRelease(MatchingService);
  }

  else
  {
    uint64_t v12 = _os_log_pack_size(12LL);
    id v11 = &v5;
    uint64_t v10 = v12;
    uint64_t v9 = (uint64_t)&v5 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v8 = _os_log_pack_fill(v9, v12, 0LL, &_mh_execute_header, "Failed to find media for %@");
    __os_log_helper_1_2_1_8_64(v8, (uint64_t)v21);
    _LPLogPack(1, v9);
  }

  id v5 = 0LL;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, v5);
}

+ (void)waitForBlockStorage
{
  id v17 = a1;
  SEL v16 = a2;
  id v4 = &v15;
  io_iterator_t v15 = 0;
  CFDictionaryRef v14 = IOServiceMatching("IOBlockStorageDevice");
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v14, &v15))
  {
    int v13 = 0;
    char v12 = 0;
    do
    {
      IOIteratorReset(v15);
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
      uint64_t v9 = _os_log_pack_size(2LL);
      uint64_t v8 = v2;
      uint64_t v7 = v9;
      mach_port_t v6 = &v2[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      id v5 = (_BYTE *)_os_log_pack_fill( v6,  v9,  0LL,  &_mh_execute_header,  "IOKit service wait timed out, volumes may be stale.");
      __os_log_helper_1_0_0(v5);
      _LPLogPack(2, (uint64_t)v6);
    }

    IOObjectRelease(v15);
  }

@end