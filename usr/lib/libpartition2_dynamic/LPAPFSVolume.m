@interface LPAPFSVolume
+ (id)defaultMountPointGivenRole:(int)a3;
+ (id)defaultVolumeNameGivenRole:(int)a3;
+ (id)supportedContentTypes;
+ (void)_loadMountPointTableForMode:(int)a3;
+ (void)initialize;
- (BOOL)createSnapshot:(id)a3 error:(id *)a4;
- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5;
- (BOOL)deleteVolumeWithError:(id *)a3;
- (BOOL)eraseVolumeWithError:(id *)a3;
- (BOOL)isCaseSenstive;
- (BOOL)isEncrypted;
- (BOOL)isFilevaultEncrypted;
- (BOOL)isMounted;
- (BOOL)mountAtPath:(id)a3 error:(id *)a4;
- (BOOL)mountAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)mountWithError:(id *)a3;
- (BOOL)renameSnapshot:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4;
- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4;
- (BOOL)setRole:(int)a3 withError:(id *)a4;
- (BOOL)unmountAllWithError:(id *)a3;
- (BOOL)unmountWithError:(id *)a3;
- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4;
- (id)_createTemporaryMountPointWithError:(id *)a3;
- (id)container;
- (id)mountAtTemporaryPathWithError:(id *)a3;
- (id)mountAtTemporaryPathWithOptions:(id)a3 error:(id *)a4;
- (id)pairedVolume;
- (id)snapshotInfoWithError:(id *)a3;
- (id)snapshotMountPoints;
- (id)snapshotsWithError:(id *)a3;
- (id)volumeGroupUUID;
- (int)role;
@end

@implementation LPAPFSVolume

+ (void)initialize
{
  v22[17] = *MEMORY[0x1895F89C0];
  if (a1 == (id)objc_opt_class())
  {
    v21[0] = &unk_189E34EB0;
    id v20 = (id)[MEMORY[0x189607968] numberWithInt:0];
    v22[0] = v20;
    v21[1] = &unk_189E34EC8;
    id v19 = (id)[MEMORY[0x189607968] numberWithInt:1];
    v22[1] = v19;
    v21[2] = &unk_189E34EE0;
    id v18 = (id)[MEMORY[0x189607968] numberWithInt:2];
    v22[2] = v18;
    v21[3] = &unk_189E34EF8;
    id v17 = (id)[MEMORY[0x189607968] numberWithInt:4];
    v22[3] = v17;
    v21[4] = &unk_189E34F10;
    id v16 = (id)[MEMORY[0x189607968] numberWithInt:5];
    v22[4] = v16;
    v21[5] = &unk_189E34F28;
    id v15 = (id)[MEMORY[0x189607968] numberWithInt:6];
    v22[5] = v15;
    v21[6] = &unk_189E34F40;
    id v14 = (id)[MEMORY[0x189607968] numberWithInt:3];
    v22[6] = v14;
    v21[7] = &unk_189E34F58;
    id v13 = (id)[MEMORY[0x189607968] numberWithInt:8];
    v22[7] = v13;
    v21[8] = &unk_189E34F70;
    id v12 = (id)[MEMORY[0x189607968] numberWithInt:9];
    v22[8] = v12;
    v21[9] = &unk_189E34F88;
    id v11 = (id)[MEMORY[0x189607968] numberWithInt:10];
    v22[9] = v11;
    v21[10] = &unk_189E34FA0;
    id v10 = (id)[MEMORY[0x189607968] numberWithInt:11];
    v22[10] = v10;
    v21[11] = &unk_189E34FB8;
    id v9 = (id)[MEMORY[0x189607968] numberWithInt:12];
    v22[11] = v9;
    v21[12] = &unk_189E34FD0;
    id v8 = (id)[MEMORY[0x189607968] numberWithInt:13];
    v22[12] = v8;
    v21[13] = &unk_189E34FE8;
    id v7 = (id)[MEMORY[0x189607968] numberWithInt:14];
    v22[13] = v7;
    v21[14] = &unk_189E35000;
    id v6 = (id)[MEMORY[0x189607968] numberWithInt:15];
    v22[14] = v6;
    v21[15] = &unk_189E35018;
    id v5 = (id)[MEMORY[0x189607968] numberWithInt:7];
    v22[15] = v5;
    v21[16] = &unk_189E35030;
    id v4 = (id)[MEMORY[0x189607968] numberWithInt:16];
    v22[16] = v4;
    id v2 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:17];
    v3 = (void *)sRoleLookupTable;
    sRoleLookupTable = (uint64_t)v2;

    +[LPAPFSVolume _loadMountPointTableForMode:]( &OBJC_CLASS___LPAPFSVolume,  "_loadMountPointTableForMode:",  (_is_running_in_ramdisk() & 1) == 0);
  }

+ (id)supportedContentTypes
{
  v7[1] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  SEL v4 = a2;
  if (a1 == (id)objc_opt_class())
  {
    v7[0] = LPAPFSVolumeMediaTypeUUID;
    id v6 = (id)[MEMORY[0x189603F18] arrayWithObjects:v7 count:1];
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_METACLASS___LPAPFSVolume;
    id v6 = objc_msgSendSuper2(&v3, sel_supportedContentTypes);
  }

  return v6;
}

+ (void)_loadMountPointTableForMode:(int)a3
{
  id v13 = a1;
  SEL v12 = a2;
  int v11 = a3;
  __int128 v10 = 0uLL;
  __int128 v10 = kLPDefaultMountPointTable[a3];
  id v9 = (id)[MEMORY[0x189603FC8] dictionaryWithCapacity:(int)v10];
  for (int i = 0; i < (int)v10; ++i)
  {
    __int128 v7 = *(_OWORD *)(*((void *)&v10 + 1) + 16LL * i);
    id v6 = (id)[NSString stringWithUTF8String:*(void *)(*((void *)&v10 + 1) + 16 * i + 8)];
    id v5 = (id)[MEMORY[0x189607968] numberWithInt:v7];
    objc_msgSend(v9, "setObject:forKey:", v6);
  }

  id v3 = (id)[MEMORY[0x189603F68] dictionaryWithDictionary:v9];
  SEL v4 = (void *)sMountPointLookupTable;
  sMountPointLookupTable = (uint64_t)v3;

  objc_storeStrong(&v9, 0LL);
}

+ (id)defaultMountPointGivenRole:(int)a3
{
  SEL v4 = (void *)sMountPointLookupTable;
  id v5 = (id)[MEMORY[0x189607968] numberWithInt:a3];
  id v6 = (id)objc_msgSend(v4, "objectForKey:");

  return v6;
}

+ (id)defaultVolumeNameGivenRole:(int)a3
{
  for (int i = 0; i < 11; ++i)
  {
    if (*((_DWORD *)&sLegacyVolumeNameMapping + 4 * i) == a3) {
      return *((id *)&sLegacyVolumeNameMapping + 2 * i + 1);
    }
  }

  return 0LL;
}

- (BOOL)setRole:(int)a3 withError:(id *)a4
{
  SEL v12 = self;
  SEL v11 = a2;
  int v10 = a3;
  id v9 = a4;
  id location = -[LPMedia BSDName](self, "BSDName");
  char v7 = 1;
  for (uint64_t i = 0LL; i < 17 && sRoleEncodingMapping[2 * i] != v10; ++i)
    ;
  [location fileSystemRepresentation];
  int v5 = APFSVolumeRole();
  if (v5)
  {
    if (v9) {
      *id v9 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v5 userInfo:0];
    }
    char v7 = 0;
  }

  objc_storeStrong(&location, 0LL);
  return v7 & 1;
}

- (int)role
{
  char v7 = "-[LPAPFSVolume role]";
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v21 = self;
  SEL v20 = a2;
  id v8 = &v19;
  unsigned __int16 v19 = 0;
  int v18 = 0;
  id v9 = -[LPMedia BSDName](self, "BSDName");
  [v9 UTF8String];
  int v17 = APFSVolumeRole();

  if (v17)
  {
    uint64_t v16 = _os_log_pack_size();
    id v15 = v3;
    uint64_t v14 = v16;
    id v13 = &v3[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v12 = _os_log_pack_fill();
    __os_log_helper_1_2_2_8_32_4_0(v12, (uint64_t)v7, v17);
    _LPLogPack(1);
  }

  else
  {
    id v4 = (id)sRoleLookupTable;
    id v6 = (id)[MEMORY[0x189607968] numberWithInt:v19];
    id v5 = (id)objc_msgSend(v4, "objectForKey:");
    int v18 = [v5 intValue];
  }

  if (!v18)
  {
    id location = 0LL;
    id location = -[LPMedia name](v21, "name");
    for (int i = 0; i < 11; ++i)
    {
      if (([location isEqualToString:*((void *)&sLegacyVolumeNameMapping + 2 * i + 1)] & 1) == 1)
      {
        int v18 = *((_DWORD *)&sLegacyVolumeNameMapping + 4 * i);
        break;
      }
    }

    objc_storeStrong(&location, 0LL);
  }

  return v18;
}

- (id)volumeGroupUUID
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPMedia getStringPropertyWithName:](self, "getStringPropertyWithName:", @"VolGroupUUID");
  in = (char *)[location[0] UTF8String];
  memset(uu, 0, sizeof(uu));
  if (!in || uuid_parse(in, uu) || uuid_is_null(uu)) {
    id v5 = 0LL;
  }
  else {
    id v5 = location[0];
  }
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)container
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  io_iterator_t v9 = 0;
  if (!MEMORY[0x186E34AE0](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3LL, &v9))
  {
    io_object_t v8 = 0;
    char v7 = 0;
    while (1)
    {
      io_object_t v8 = IOIteratorNext(v9);
      char v5 = 0;
      if (v8) {
        char v5 = v7 ^ 1;
      }
      if ((v5 & 1) == 0) {
        break;
      }
      if (IOObjectConformsTo(v8, "AppleAPFSMedia"))
      {
        id obj = 0LL;
        id v2 = objc_alloc(&OBJC_CLASS___LPAPFSContainer);
        id obj = -[LPMedia initWithIOMediaObject:](v2, "initWithIOMediaObject:", v8);
        if (obj)
        {
          objc_storeStrong(location, obj);
          char v7 = 1;
        }

        objc_storeStrong(&obj, 0LL);
      }

      IOObjectRelease(v8);
    }

    IOObjectRelease(v9);
  }

  id v4 = location[0];
  objc_storeStrong(location, 0LL);
  return v4;
}

- (BOOL)isCaseSenstive
{
  return -[LPMedia getBoolPropertyWithName:](self, "getBoolPropertyWithName:", @"CaseSensitive", a2, self);
}

- (BOOL)isEncrypted
{
  id v3 = -[LPMedia devNodePath](self, "devNodePath");
  [v3 fileSystemRepresentation];
  APFSVolumeGetVEKState();

  return 0;
}

- (BOOL)isFilevaultEncrypted
{
  id v3 = -[LPMedia devNodePath](self, "devNodePath");
  [v3 fileSystemRepresentation];
  APFSVolumeGetVEKState();

  return 0;
}

- (id)pairedVolume
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v22 = self;
  v21[1] = (id)a2;
  v21[0] = -[LPAPFSVolume container](self, "container");
  int v20 = -[LPAPFSVolume role](v22, "role");
  id v19 = -[LPAPFSVolume volumeGroupUUID](v22, "volumeGroupUUID");
  int v18 = 0;
  if (v20 == 1) {
    int v2 = 3;
  }
  else {
    int v2 = 1;
  }
  int v18 = v2;
  id location = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v21[0] volumes];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v16 = 0LL;
      id v16 = *(id *)(__b[1] + 8 * v9);
      int v3 = [v16 role];
      char v13 = 0;
      char v6 = 0;
      if (v3 == v18)
      {
        id v14 = (id)[v16 volumeGroupUUID];
        char v13 = 1;
        char v6 = [v14 isEqualToString:v19];
      }

      if ((v13 & 1) != 0) {

      }
      if ((v6 & 1) != 0) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0LL;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v10) {
          goto LABEL_16;
        }
      }
    }

    objc_storeStrong(&location, v16);
  }

- (id)snapshotMountPoints
{
  id v14 = "-[LPAPFSVolume snapshotMountPoints]";
  v34[2] = *MEMORY[0x1895F89C0];
  v31[2] = self;
  v31[1] = (id)a2;
  v31[0] = -[LPMedia devNodePath](self, "devNodePath");
  if (v31[0])
  {
    id v24 = (id)[NSString stringWithFormat:@"@%@", v31[0]];
    v23 = 0LL;
    int v22 = getmntinfo_r_np(&v23, 0);
    id v21 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:13];
    char v13 = (void *)MEMORY[0x186E34CE4]();
    id v20 = 0LL;
    id v19 = 0LL;
    for (int i = 0; i < v22; ++i)
    {
      id location = 0LL;
      id location = (id)[NSString stringWithUTF8String:v23[i].f_mntfromname];
      if ([location hasSuffix:v24])
      {
        uint64_t v15 = [location rangeOfString:@"@" options:4];
        uint64_t v16 = v2;
        id v3 = (id)[location substringToIndex:v15];
        id v4 = v19;
        id v19 = v3;

        id v5 = (id)[NSString stringWithUTF8String:v23[i].f_mntonname];
        id v6 = v20;
        id v20 = v5;

        id v11 = v21;
        v33[0] = LPAPFSVolumeSnapshotMountPointKeyName;
        v34[0] = v19;
        v33[1] = LPAPFSVolumeSnapshotMountPointKeyMountPoint;
        v34[1] = v20;
        id v12 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:2];
        objc_msgSend(v11, "addObject:");
      }

      objc_storeStrong(&location, 0LL);
    }

    uint64_t v10 = 0LL;
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(&v20, 0LL);
    objc_autoreleasePoolPop(v13);
    if (v23) {
      free(v23);
    }
    if ([v21 count]) {
      id v9 = v21;
    }
    else {
      id v9 = 0LL;
    }
    id v32 = v9;
    int v25 = 1;
    v8[1] = 0LL;
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v24, 0LL);
  }

  else
  {
    uint64_t v30 = _os_log_pack_size();
    v29 = v8;
    uint64_t v28 = v30;
    v27 = (char *)v8 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v26, (uint64_t)v14);
    _LPLogPack(1);
    id v32 = 0LL;
    int v25 = 1;
  }

  objc_storeStrong(v31, 0LL);
  return v32;
}

- (BOOL)isMounted
{
  id v3 = -[LPMedia mountPoint](self, "mountPoint");
  char v5 = 0;
  BOOL v4 = 1;
  if (!v3)
  {
    id v6 = -[LPAPFSVolume snapshotMountPoints](self, "snapshotMountPoints");
    char v5 = 1;
    BOOL v4 = v6 != 0LL;
  }

  if ((v5 & 1) != 0) {

  }
  return v4;
}

- (BOOL)eraseVolumeWithError:(id *)a3
{
  char v5 = "-[LPAPFSVolume eraseVolumeWithError:]";
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id location = -[LPMedia mountPoint](self, "mountPoint");
  if (location)
  {
    int v12 = _lp2_delete_directory_contents((const char *)[location fileSystemRepresentation]);
    if (v12 && v14) {
      *id v14 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v12 userInfo:0];
    }
    BOOL v17 = *__error() == 0;
    int v11 = 1;
  }

  else
  {
    if (v14) {
      *id v14 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v10 = _os_log_pack_size();
    id v9 = v4;
    uint64_t v8 = v10;
    uint64_t v7 = &v4[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v6 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v6, (uint64_t)v5);
    _LPLogPack(1);
    BOOL v17 = 0;
    int v11 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v17;
}

- (BOOL)mountWithError:(id *)a3
{
  int v12 = self;
  SEL v11 = a2;
  uint64_t v10 = a3;
  id v6 = -[LPMedia mountPoint](self, "mountPoint");

  if (v6)
  {
    char v13 = 1;
  }

  else
  {
    id location =  +[LPAPFSVolume defaultMountPointGivenRole:]( &OBJC_CLASS___LPAPFSVolume,  "defaultMountPointGivenRole:",  -[LPAPFSVolume role](v12, "role"));
    char v7 = 0;
    BOOL v5 = 0;
    if (location)
    {
      id v8 = +[LPMedia mediaForPath:](&OBJC_CLASS___LPMedia, "mediaForPath:", location);
      char v7 = 1;
      BOOL v5 = v8 == 0LL;
    }

    if ((v7 & 1) != 0) {

    }
    if (v5)
    {
      char v13 = -[LPAPFSVolume mountAtPath:error:](v12, "mountAtPath:error:", location, v10);
    }

    else
    {
      id v3 = -[LPAPFSVolume mountAtTemporaryPathWithError:](v12, "mountAtTemporaryPathWithError:", v10);
      char v13 = v3 != 0LL;
    }

    objc_storeStrong(&location, 0LL);
  }

  return v13 & 1;
}

- (BOOL)mountAtPath:(id)a3 error:(id *)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = -[LPAPFSVolume mountAtPath:options:error:](v8, "mountAtPath:options:error:", location[0], 0LL, a4);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)_createTemporaryMountPointWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  char v13 = _is_running_in_ramdisk() & 1;
  bzero(v18, 0x400uLL);
  __strlcpy_chk();
  if (mkdtemp(v18))
  {
    id v17 = (id)[NSString stringWithUTF8String:v18];
  }

  else
  {
    uint64_t v12 = _os_log_pack_size();
    SEL v11 = v5;
    uint64_t v10 = v12;
    id v9 = &v5[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v8 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v8, (uint64_t)v18);
    _LPLogPack(1);
    if (*v14)
    {
      uint64_t v7 = MEMORY[0x189607870];
      uint64_t v6 = *MEMORY[0x189607688];
      id v3 = (id)[MEMORY[0x189607870] errorWithDomain:v6 code:*__error() userInfo:0];
      *id v14 = v3;
    }

    id v17 = 0LL;
  }

  return v17;
}

- (id)mountAtTemporaryPathWithError:(id *)a3
{
  return -[LPAPFSVolume mountAtTemporaryPathWithOptions:error:](self, "mountAtTemporaryPathWithOptions:error:", 0LL, a3);
}

- (id)mountAtTemporaryPathWithOptions:(id)a3 error:(id *)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v7 = a4;
  id v6 = -[LPAPFSVolume _createTemporaryMountPointWithError:](v9, "_createTemporaryMountPointWithError:", a4);
  if (v6)
  {
    if (-[LPAPFSVolume mountAtPath:options:error:](v9, "mountAtPath:options:error:", v6, location[0], v7)) {
      id v10 = v6;
    }
    else {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (BOOL)mountAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id obj = a4;
  v49 = a5;
  v112[1] = *MEMORY[0x1895F89C0];
  v106 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v104 = 0LL;
  objc_storeStrong(&v104, obj);
  v103 = v49;
  id v102 = -[LPMedia devNodePath](v106, "devNodePath");
  if (v102)
  {
    id v95 = -[LPMedia mountPoint](v106, "mountPoint");
    if (([v95 isEqualToString:location[0]] & 1) == 0 || v104)
    {
      if (!v95
        || (uint64_t v89 = _os_log_pack_size(),
            v88 = v24,
            uint64_t v87 = v89,
            v86 = (char *)v24 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0LL),
            uint64_t v85 = _os_log_pack_fill(),
            __os_log_helper_1_2_2_8_64_8_64(v85, (uint64_t)v95, (uint64_t)location[0]),
            _LPLogPack(2),
            -[LPAPFSVolume unmountWithError:](v106, "unmountWithError:", v103)))
      {
        int v84 = 0;
        int v84 = mkpath_np( (const char *)[location[0] fileSystemRepresentation], 0x1FFu);
        if (!v84 || v84 == 17)
        {
          memcpy(__dst, &off_189E33BC8, sizeof(__dst));
          int v78 = 1;
          id v77 = 0LL;
          id v38 = (id)[v104 objectForKeyedSubscript:LPAPFSVolumeMountOptionReadOnly];
          if (v38) {
            id v37 = v38;
          }
          else {
            id v37 = (id)MEMORY[0x189604A80];
          }
          id v77 = v37;

          if ([v77 BOOLValue])
          {
            uint64_t v9 = v78++;
            __dst[v9] = "-o";
            uint64_t v10 = v78++;
            __dst[v10] = "rdonly";
          }

          id v76 = 0LL;
          id v36 = (id)[v104 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoBrowse];
          if (v36) {
            id v35 = v36;
          }
          else {
            id v35 = (id)MEMORY[0x189604A88];
          }
          id v76 = v35;

          if ([v76 BOOLValue])
          {
            uint64_t v11 = v78++;
            __dst[v11] = "-o";
            uint64_t v12 = v78++;
            __dst[v12] = "nobrowse";
          }

          id v75 = 0LL;
          id v34 = (id)[v104 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoFirmlinks];
          if (v34) {
            id v33 = v34;
          }
          else {
            id v33 = (id)MEMORY[0x189604A80];
          }
          id v75 = v33;

          if ([v75 BOOLValue])
          {
            uint64_t v13 = v78++;
            __dst[v13] = "-n";
          }

          id v74 = 0LL;
          id v74 = (id)[v104 objectForKeyedSubscript:LPAPFSVolumeMountOptionSnapshotName];
          BOOL v73 = 0;
          BOOL v73 = [v74 length] != 0;
          if (v73)
          {
            uint64_t v14 = v78++;
            id v32 = __dst;
            __dst[v14] = "-s";
            uint64_t v15 = [v74 fileSystemRepresentation];
            uint64_t v16 = v78++;
            v32[v16] = (char *)v15;
          }

          id v17 = (char *)[v102 fileSystemRepresentation];
          uint64_t v18 = v78++;
          v31 = __dst;
          __dst[v18] = v17;
          uint64_t v19 = [location[0] fileSystemRepresentation];
          uint64_t v20 = v78++;
          v31[v20] = (char *)v19;
          unsigned int v72 = -1;
          int v71 = 0;
          while (v72)
          {
            unsigned int v72 = _execForLibpartition(__dst);
            if (v72 != 75 || v71 >= 3) {
              break;
            }
            uint64_t v70 = 0LL;
            uint64_t v70 = _os_log_pack_size();
            v69 = v24;
            uint64_t v68 = v70;
            v67 = (char *)v24 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v66 = _os_log_pack_fill();
            __os_log_helper_1_2_3_8_64_4_0_4_0(v66, (uint64_t)v102, v72, v71);
            _LPLogPack(1);
            ++v71;
            sleep(3u);
          }

          if (v72)
          {
            if (v103)
            {
              v29 = &v65;
              id v30 = 0LL;
              id v65 = 0LL;
              id v65 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"mount_apfs returned : %d",  v72);
              id v27 = (id)MEMORY[0x189607870];
              uint64_t v26 = *MEMORY[0x189607688];
              v108[0] = *MEMORY[0x1896075F0];
              v109[0] = @"Mount failed";
              v108[1] = *MEMORY[0x1896075E0];
              v109[1] = v65;
              id v28 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v109 forKeys:v108 count:2];
              id v21 = (id)objc_msgSend( v27,  "errorWithDomain:code:userInfo:",  v26,  22);
              int v22 = v28;
              id *v103 = v21;

              objc_storeStrong(v29, v30);
            }

            uint64_t v64 = 0LL;
            uint64_t v64 = _os_log_pack_size();
            v63 = v24;
            uint64_t v62 = v64;
            v61 = (char *)v24 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v60 = _os_log_pack_fill();
            __os_log_helper_1_2_2_8_64_4_0(v60, (uint64_t)v102, v72);
            _LPLogPack(1);
            char v107 = 0;
            int v96 = 1;
          }

          else
          {
            if (v73)
            {
              uint64_t v59 = 0LL;
              uint64_t v59 = _os_log_pack_size();
              v58 = v24;
              uint64_t v57 = v59;
              v56 = (char *)v24 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v55 = _os_log_pack_fill();
              __os_log_helper_1_3_3_8_64_8_65_8_65(v55, (uint64_t)v102, (uint64_t)v74, (uint64_t)location[0]);
            }

            else
            {
              uint64_t v54 = 0LL;
              uint64_t v54 = _os_log_pack_size();
              v53 = v24;
              uint64_t v52 = v54;
              v51 = (char *)v24 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v50 = _os_log_pack_fill();
              __os_log_helper_1_3_2_8_64_8_65(v50, (uint64_t)v102, (uint64_t)location[0]);
            }

            _LPLogPack(2);
            char v107 = 1;
            int v96 = 1;
          }

          id v25 = 0LL;
          objc_storeStrong(&v74, 0LL);
          objc_storeStrong(&v75, v25);
          objc_storeStrong(&v76, v25);
          objc_storeStrong(&v77, v25);
        }

        else
        {
          if (v103)
          {
            id v44 = (id)MEMORY[0x189607870];
            uint64_t v42 = *MEMORY[0x189607688];
            uint64_t v43 = v84;
            uint64_t v111 = *MEMORY[0x1896074F8];
            v112[0] = location[0];
            id v45 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v112 forKeys:&v111 count:1];
            id v6 = (id)objc_msgSend( v44,  "errorWithDomain:code:userInfo:",  v42,  v43);
            uint64_t v7 = v45;
            id *v103 = v6;
          }

          uint64_t v83 = 0LL;
          uint64_t v83 = _os_log_pack_size();
          v82 = v24;
          uint64_t v81 = v83;
          v80 = (char *)v24 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v79 = _os_log_pack_fill();
          uint64_t v40 = v79;
          id v41 = -[LPMedia description](v106, "description");
          uint64_t v39 = [v41 UTF8String];
          uint64_t v8 = [location[0] fileSystemRepresentation];
          __os_log_helper_1_3_2_8_33_8_33(v40, v39, v8);

          _LPLogPack(1);
          char v107 = 0;
          int v96 = 1;
        }
      }

      else
      {
        char v107 = 0;
        int v96 = 1;
      }
    }

    else
    {
      uint64_t v94 = _os_log_pack_size();
      v93 = v24;
      uint64_t v92 = v94;
      v91 = (char *)v24 - ((v94 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v90 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_64(v90, (uint64_t)location[0]);
      _LPLogPack(2);
      char v107 = 1;
      int v96 = 1;
    }

    objc_storeStrong(&v95, 0LL);
  }

  else
  {
    if (v103) {
      id *v103 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v101 = _os_log_pack_size();
    v100 = v24;
    uint64_t v99 = v101;
    v98 = (char *)v24 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v97 = _os_log_pack_fill();
    uint64_t v46 = v97;
    id v47 = -[LPMedia description](v106, "description");
    uint64_t v5 = [v47 UTF8String];
    __os_log_helper_1_2_1_8_32(v46, v5);

    _LPLogPack(1);
    char v107 = 0;
    int v96 = 1;
  }

  v24[0] = 0LL;
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v104, v24[0]);
  objc_storeStrong(location, v24[0]);
  return v107 & 1;
}

- (BOOL)unmountWithError:(id *)a3
{
  return -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:", 0LL, a3);
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v77 = a4;
  uint64_t v76 = 0LL;
  uint64_t v149 = *MEMORY[0x1895F89C0];
  v146 = self;
  v145[1] = (id)a2;
  v145[0] = 0LL;
  objc_storeStrong(v145, a3);
  v144 = v77;
  BOOL v143 = 0;
  id v142 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:1];
  id v78 = (id)[v145[0] objectForKey:LPAPFSVolumeUnmountOptionAll];
  int v79 = [v78 BOOLValue];

  unsigned __int8 v141 = v79 & 1;
  id v80 = (id)[v145[0] objectForKey:LPAPFSVolumeUnmountOptionSnapshotName];
  int v81 = 1;
  if (!v80) {
    int v81 = v141;
  }
  int v75 = v81;

  if ((v81 & 1) != 0)
  {
    id v140 = -[LPAPFSVolume snapshotMountPoints](v146, "snapshotMountPoints");
    id v139 = -[LPMedia mountPoint](v146, "mountPoint");
    if (v140)
    {
      unsigned int v72 = v137;
      memset(v137, 0, sizeof(v137));
      id v73 = v140;
      uint64_t v74 = [v73 countByEnumeratingWithState:v137 objects:v148 count:16];
      if (v74)
      {
        uint64_t v69 = *(void *)v137[2];
        uint64_t v70 = v76;
        uint64_t v71 = v74;
        while (1)
        {
          unint64_t v67 = v71;
          uint64_t v68 = v70;
          if (*(void *)v137[2] != v69) {
            objc_enumerationMutation(v73);
          }
          id v138 = 0LL;
          id v138 = *(id *)(v137[1] + 8 * v68);
          char v135 = 0;
          char v133 = 0;
          char v131 = 0;
          int v66 = 1;
          if ((v141 & 1) == 0)
          {
            id v63 = v138;
            id v136 = (id)[v145[0] objectForKey:LPAPFSVolumeSnapshotMountPointKeyName];
            int v64 = 1;
            char v135 = 1;
            id v65 = (id)objc_msgSend(v63, "objectForKey:");
            id v134 = v65;
            char v133 = 1;
            id v132 = (id)[v145[0] objectForKey:LPAPFSVolumeUnmountOptionSnapshotName];
            char v131 = 1;
            int v66 = objc_msgSend(v65, "isEqualToString:");
          }

          int v62 = v66;
          if ((v131 & 1) != 0) {

          }
          if ((v133 & 1) != 0) {
          if ((v135 & 1) != 0)
          }

          if ((v62 & 1) != 0)
          {
            id v60 = v142;
            id v61 = (id)[v138 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint];
            objc_msgSend(v60, "addObject:");

            if ((v141 & 1) == 0) {
              break;
            }
          }

          uint64_t v70 = v68 + 1;
          uint64_t v71 = v67;
          if (v68 + 1 >= v67)
          {
            uint64_t v70 = v76;
            uint64_t v71 = [v73 countByEnumeratingWithState:v137 objects:v148 count:16];
            if (!v71) {
              goto LABEL_22;
            }
          }
        }

        int v130 = 2;
      }

      else
      {
LABEL_22:
        int v130 = 0;
      }
    }

    if ((v141 & 1) != 0 && v139) {
      [v142 addObject:v139];
    }
    uint64_t v59 = 0LL;
    objc_storeStrong(&v139, 0LL);
    objc_storeStrong(&v140, 0LL);
  }

  else
  {
    id v58 = -[LPMedia mountPoint](v146, "mountPoint");

    if (v58)
    {
      id v56 = v142;
      id v57 = -[LPMedia mountPoint](v146, "mountPoint");
      objc_msgSend(v142, "addObject:");
    }
  }

  if ([v142 count])
  {
    [v142 sortUsingComparator:&__block_literal_global];
    v53 = v128;
    memset(v128, 0, sizeof(v128));
    id v54 = v142;
    uint64_t v55 = [v54 countByEnumeratingWithState:v128 objects:v147 count:16];
    if (v55)
    {
      uint64_t v50 = *(void *)v128[2];
      uint64_t v51 = v76;
      unint64_t v52 = v55;
      while (1)
      {
        unint64_t v48 = v52;
        uint64_t v49 = v51;
        if (*(void *)v128[2] != v50) {
          objc_enumerationMutation(v54);
        }
        id v129 = 0LL;
        id v129 = *(id *)(v128[1] + 8 * v49);
        int v127 = 0;
        int v126 = 0;
        char v125 = 0;
        if (v145[0])
        {
          id v47 = (id)[v145[0] objectForKey:LPAPFSVolumeUnmountOptionForce];

          if (v47) {
            int v127 = 0x80000;
          }
          id v46 = (id)[v145[0] objectForKey:LPAPFSVolumeUnmountOptionDoNotLock];

          if (v46)
          {
            id v45 = &v124;
            char v124 = 1;
            BOOL v4 = (const char *)[v129 fileSystemRepresentation];
            if (fsctl(v4, 0x80014A22uLL, v45, 0))
            {
              if (*__error() == 17)
              {
                uint64_t v123 = 0LL;
                uint64_t v123 = _os_log_pack_size();
                v122 = v16;
                uint64_t v121 = v123;
                id v44 = 0LL;
                v120 = &v16[-((v123 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
                uint64_t v119 = _os_log_pack_fill();
                uint64_t v41 = v119;
                id v42 = -[LPMedia devNodePath](v146, "devNodePath");
                id v5 = v42;
                uint64_t v43 = &v118;
                id v118 = v5;
                __os_log_helper_1_2_1_8_64(v41, (uint64_t)v5);

                _LPLogPack(2);
                objc_storeStrong(v43, v44);
              }

              else
              {
                uint64_t v117 = 0LL;
                uint64_t v117 = _os_log_pack_size();
                v116 = v16;
                uint64_t v115 = v117;
                id v40 = 0LL;
                v114 = &v16[-((v117 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
                uint64_t v113 = _os_log_pack_fill();
                uint64_t v37 = v113;
                id v38 = -[LPMedia devNodePath](v146, "devNodePath");
                id v36 = v38;
                uint64_t v39 = &v112;
                id v112 = v36;
                id v6 = __error();
                __os_log_helper_1_2_2_8_64_4_0(v37, (uint64_t)v36, *v6);

                _LPLogPack(1);
                objc_storeStrong(v39, v40);
              }
            }
          }
        }

        do
        {
          char v125 = 0;
          uint64_t v7 = (const char *)[v129 fileSystemRepresentation];
          BOOL v143 = unmount(v7, v127) == 0;
          if (v143)
          {
            uint64_t v93 = 0LL;
            uint64_t v93 = _os_log_pack_size();
            uint64_t v92 = v16;
            uint64_t v91 = v93;
            id v26 = 0LL;
            uint64_t v90 = &v16[-((v93 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            uint64_t v89 = _os_log_pack_fill();
            uint64_t v23 = v89;
            id v24 = -[LPMedia devNodePath](v146, "devNodePath");
            id v12 = v24;
            id v25 = &v88;
            id v88 = v12;
            __os_log_helper_1_3_2_8_64_8_65(v23, (uint64_t)v12, (uint64_t)v129);

            _LPLogPack(2);
            objc_storeStrong(v25, v26);
          }

          else
          {
            int v111 = 0;
            int v111 = *__error();
            if (v111 == 22)
            {
              uint64_t v110 = 0LL;
              uint64_t v110 = _os_log_pack_size();
              v109 = v16;
              uint64_t v108 = v110;
              char v107 = &v16[-((v110 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
              v106 = (_BYTE *)_os_log_pack_fill();
              __os_log_helper_1_0_0(v106);
              _LPLogPack(1);
              BOOL v143 = 1;
            }

            else if (v126 < 3)
            {
              if (v111 == 35 || v111 == 16)
              {
                ++v126;
                char v125 = 1;
                sleep(3u);
              }
            }

            else if (v126 == 3 && v111 == 16 && -[LPAPFSVolume role](v146, "role") != 12)
            {
              ++v126;
              v127 |= 0x80000u;
              char v125 = 1;
              sleep(3u);
              uint64_t v105 = 0LL;
              uint64_t v105 = _os_log_pack_size();
              id v104 = v16;
              uint64_t v103 = v105;
              id v35 = 0LL;
              id v102 = &v16[-((v105 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
              uint64_t v101 = _os_log_pack_fill();
              uint64_t v32 = v101;
              id v33 = -[LPMedia devNodePath](v146, "devNodePath");
              id v8 = v33;
              id v34 = &v100;
              id v100 = v8;
              __os_log_helper_1_2_2_8_64_4_0(v32, (uint64_t)v8, v111);

              _LPLogPack(1);
              objc_storeStrong(v34, v35);
            }

            else if (v144)
            {
              id v9 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v111 userInfo:0];
              id *v144 = v9;
            }

            uint64_t v99 = 0LL;
            uint64_t v99 = _os_log_pack_size();
            v98 = v16;
            uint64_t v97 = v99;
            id v31 = 0LL;
            int v96 = &v16[-((v99 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            uint64_t v95 = _os_log_pack_fill();
            uint64_t v27 = v95;
            id v28 = -[LPMedia devNodePath](v146, "devNodePath");
            id v10 = v28;
            id v30 = &v94;
            id v94 = v10;
            int v29 = 1;
            if ((v125 & 1) != 0) {
              uint64_t v11 = "yes";
            }
            else {
              uint64_t v11 = "no";
            }
            __os_log_helper_1_2_3_8_64_8_32_4_0(v27, (uint64_t)v10, (uint64_t)v11, v111);

            _LPLogPack(v29);
            objc_storeStrong(v30, v31);
          }
        }

        while ((v125 & 1) != 0);
        uint64_t v51 = v49 + 1;
        unint64_t v52 = v48;
        if (v49 + 1 >= v48)
        {
          uint64_t v13 = [v54 countByEnumeratingWithState:v128 objects:v147 count:16];
          uint64_t v51 = v76;
          unint64_t v52 = v13;
          if (!v13) {
            break;
          }
        }
      }
    }
  }

  else
  {
    uint64_t v87 = _os_log_pack_size();
    v86 = v16;
    uint64_t v85 = v87;
    id v22 = 0LL;
    int v84 = &v16[-((v87 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v83 = _os_log_pack_fill();
    uint64_t v19 = v83;
    id v20 = -[LPMedia devNodePath](v146, "devNodePath");
    id v14 = v20;
    id v21 = &v82;
    id v82 = v14;
    __os_log_helper_1_2_1_8_64(v19, (uint64_t)v14);

    _LPLogPack(2);
    objc_storeStrong(v21, v22);
    BOOL v143 = 1;
  }

  BOOL v17 = v143;
  int v130 = 1;
  id v18 = 0LL;
  objc_storeStrong(&v142, 0LL);
  objc_storeStrong(v145, v18);
  return v17;
}

uint64_t __41__LPAPFSVolume_unmountWithOptions_error___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  uint64_t v5 = -[location[0] compare:v6];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)unmountAllWithError:(id *)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = LPAPFSVolumeUnmountOptionAll;
  v8[0] = MEMORY[0x189604A88];
  id v5 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  BOOL v6 = -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:");

  return v6;
}

- (BOOL)deleteVolumeWithError:(id *)a3
{
  id v8 = "-[LPAPFSVolume deleteVolumeWithError:]";
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v41 = self;
  SEL v40 = a2;
  uint64_t v39 = a3;
  id location = -[LPMedia devNodePath](self, "devNodePath");
  if (location)
  {
    uint64_t v31 = _os_log_pack_size();
    id v30 = v7;
    uint64_t v29 = v31;
    id v28 = &v7[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v27 = _os_log_pack_fill();
    __os_log_helper_1_2_2_8_32_8_64(v27, (uint64_t)v8, (uint64_t)location);
    _LPLogPack(2);
    int v26 = 0;
    [location fileSystemRepresentation];
    int v26 = APFSVolumeDelete();
    if (v26)
    {
      unsigned int v25 = v26 & 0xFC000000;
      int v24 = (v26 >> 14) & 0xFFF;
      if ((v26 & 0xFC000000) == 0xE0000000)
      {
        uint64_t v23 = 0LL;
        uint64_t v23 = _os_log_pack_size();
        id v22 = v7;
        uint64_t v21 = v23;
        id v20 = &v7[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
        uint64_t v19 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v19, (uint64_t)v8, v26 & 0x3FFF);
        _LPLogPack(1);
        if (v39)
        {
          id v3 = (id)[MEMORY[0x189607870] errorWithDomain:@"com.apple.IOKit" code:v26 & 0x3FFF userInfo:0];
          *uint64_t v39 = v3;
        }
      }

      else if (v25 || v24 != 3)
      {
        uint64_t v13 = 0LL;
        uint64_t v13 = _os_log_pack_size();
        id v12 = v7;
        uint64_t v11 = v13;
        id v10 = &v7[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
        uint64_t v9 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v9, (uint64_t)v8, v26);
        _LPLogPack(1);
        if (v39)
        {
          id v5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v26 userInfo:0];
          *uint64_t v39 = v5;
        }
      }

      else
      {
        uint64_t v18 = 0LL;
        uint64_t v18 = _os_log_pack_size();
        BOOL v17 = v7;
        uint64_t v16 = v18;
        uint64_t v15 = &v7[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
        uint64_t v14 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v14, (uint64_t)v8, v26 & 0x3FFF);
        _LPLogPack(1);
        if (v39)
        {
          id v4 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v26 & 0x3FFF userInfo:0];
          *uint64_t v39 = v4;
        }
      }

      char v42 = 0;
      int v32 = 1;
    }

    else
    {
      char v42 = 1;
      int v32 = 1;
    }
  }

  else
  {
    if (v39) {
      *uint64_t v39 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v37 = _os_log_pack_size();
    id v36 = v7;
    uint64_t v35 = v37;
    id v34 = &v7[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v33 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v33, (uint64_t)v8);
    _LPLogPack(1);
    char v42 = 0;
    int v32 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v42 & 1;
}

- (id)snapshotsWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v15[3] = self;
  v15[2] = (id)a2;
  v15[1] = a3;
  v15[0] = -[LPAPFSVolume snapshotInfoWithError:](self, "snapshotInfoWithError:", a3);
  id v14 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:10];
  if (v15[0])
  {
    memset(__b, 0, sizeof(__b));
    id obj = v15[0];
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0LL;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v13 = 0LL;
        id v13 = *(id *)(__b[1] + 8 * v7);
        id location = 0LL;
        id location = (id)[v13 objectForKey:LPAPFSSnapshotPropertyKeyName[0]];
        if (location) {
          [v14 addObject:location];
        }
        objc_storeStrong(&location, 0LL);
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0LL;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }
  }

  id v4 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(v15, 0LL);
  return v4;
}

- (id)snapshotInfoWithError:(id *)a3
{
  uint64_t v23 = "-[LPAPFSVolume snapshotInfoWithError:]";
  v73[256] = *MEMORY[0x1895F89C0];
  uint64_t v71 = self;
  SEL v70 = a2;
  uint64_t v69 = a3;
  id v68 = -[LPMedia mountPoint](self, "mountPoint");
  int v67 = 0;
  int v66 = -1;
  if (v68)
  {
    int v66 = open((const char *)[v68 fileSystemRepresentation], 0x100000);
    if (v66 >= 0)
    {
      id v53 = (id)[MEMORY[0x189603FA8] arrayWithCapacity:10];
      v52.reserved = 0;
      *(void *)&v52.volattr = 0LL;
      *(void *)&v52.fileattr = 0LL;
      bzero(v73, 0x800uLL);
      v52.bitmapcount = 5;
      v52.commonattr = -1610612703;
      int v51 = 0;
      while (1)
      {
        int v51 = fs_snapshot_list(v66, &v52, v73, 0x800uLL, 0);
        if (v51 <= 0) {
          break;
        }
        uint64_t v50 = (unsigned int *)v73;
        do
        {
          int v4 = v51--;
          if (v4 <= 0) {
            break;
          }
          uint64_t v49 = v50;
          id v47 = 0LL;
          id v46 = 0LL;
          id v45 = 0LL;
          id v44 = 0LL;
          unint64_t v48 = (int *)(v50 + 6);
          uint64_t v50 = (unsigned int *)((char *)v50 + *v50);
          if ((v49[1] & 0x20000000) != 0)
          {
            int v67 = *v48++;
            uint64_t v43 = 0LL;
            uint64_t v43 = _os_log_pack_size();
            char v42 = v13;
            uint64_t v41 = v43;
            SEL v40 = &v13[-((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            uint64_t v39 = _os_log_pack_fill();
            __os_log_helper_1_2_2_8_32_4_0(v39, (uint64_t)v23, v67);
            _LPLogPack(1);
            int v59 = 9;
          }

          else
          {
            if ((v49[1] & 1) != 0)
            {
              id v38 = v48;
              uint64_t v37 = 0LL;
              uint64_t v37 = *(void *)v48;
              uint64_t v36 = (uint64_t)v48 + (int)v37;
              id v5 = (id)[NSString stringWithUTF8String:v36];
              id v6 = v47;
              id v47 = v5;

              if (!v47)
              {
                uint64_t v35 = 0LL;
                uint64_t v35 = _os_log_pack_size();
                id v34 = v13;
                uint64_t v33 = v35;
                int v32 = &v13[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
                uint64_t v31 = _os_log_pack_fill();
                __os_log_helper_1_3_2_8_32_8_33(v31, (uint64_t)v23, v36);
                _LPLogPack(2);
              }

              v48 += 2;
            }

            if ((v49[1] & 0x20) != 0)
            {
              uint64_t v30 = 0LL;
              uint64_t v30 = *(void *)v48;
              id v7 = (id)[MEMORY[0x189607968] numberWithUnsignedLongLong:v30 & 0x3FFFFFFFFFFFFFFFLL];
              id v8 = v46;
              id v46 = v7;

              uint64_t v15 = (void *)MEMORY[0x189604A80];
              uint64_t v16 = (void *)MEMORY[0x189604A88];
              if ((v30 & 0x4000000000000000LL) != 0) {
                uint64_t v9 = (void *)MEMORY[0x189604A88];
              }
              else {
                uint64_t v9 = (void *)MEMORY[0x189604A80];
              }
              objc_storeStrong(&v45, v9);
              if (v30 >= 0) {
                uint64_t v10 = v15;
              }
              else {
                uint64_t v10 = v16;
              }
              objc_storeStrong(&v44, v10);
              v48 += 2;
            }

            id v29 = 0LL;
            id v29 = (id)[MEMORY[0x189603FC8] dictionaryWithCapacity:4];
            if (v47) {
              [v29 setObject:v47 forKey:LPAPFSSnapshotPropertyKeyName[0]];
            }
            if (v46) {
              [v29 setObject:v46 forKey:LPAPFSSnapshotPropertyKeyXID[0]];
            }
            if (v45) {
              [v29 setObject:v45 forKey:LPAPFSSnapshotPropertyKeyMarkedForRevert];
            }
            if (v44) {
              [v29 setObject:v44 forKey:LPAPFSSnapshotPropertyKeyMarkedForRoot[0]];
            }
            if ([v29 count]) {
              [v53 addObject:v29];
            }
            objc_storeStrong(&v29, 0LL);
            int v59 = 0;
          }

          id v14 = 0LL;
          objc_storeStrong(&v44, 0LL);
          objc_storeStrong(&v45, v14);
          objc_storeStrong(&v46, v14);
          objc_storeStrong(&v47, v14);
        }

        while (!v59);
      }

      if (v51 >= 0)
      {
        close(v66);
        id v72 = (id)[MEMORY[0x189603F18] arrayWithArray:v53];
        int v59 = 1;
      }

      else
      {
        uint64_t v28 = 0LL;
        uint64_t v28 = _os_log_pack_size();
        uint64_t v27 = v13;
        uint64_t v26 = v28;
        unsigned int v25 = &v13[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
        uint64_t v24 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v24, (uint64_t)v23, v51);
        _LPLogPack(1);
        close(v66);
        if (v69)
        {
          id v11 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v51 userInfo:0];
          id *v69 = v11;
        }

        id v72 = 0LL;
        int v59 = 1;
      }

      objc_storeStrong(&v53, 0LL);
    }

    else
    {
      if (v69)
      {
        uint64_t v18 = MEMORY[0x189607870];
        uint64_t v17 = *MEMORY[0x189607688];
        id *v69 = (id)[MEMORY[0x189607870] errorWithDomain:v17 code:*__error() userInfo:0];
      }

      uint64_t v58 = _os_log_pack_size();
      id v57 = v13;
      uint64_t v56 = v58;
      uint64_t v55 = &v13[-((v58 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v54 = _os_log_pack_fill();
      __os_log_helper_1_3_3_8_32_8_65_4_0(v54, (uint64_t)v23, (uint64_t)v68, v67);
      _LPLogPack(1);
      id v72 = 0LL;
      int v59 = 1;
    }
  }

  else
  {
    if (v69) {
      id *v69 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v65 = _os_log_pack_size();
    int v64 = v13;
    uint64_t v63 = v65;
    id v22 = 0LL;
    int v62 = &v13[-((v65 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v61 = _os_log_pack_fill();
    uint64_t v19 = v61;
    id v20 = -[LPMedia description](v71, "description");
    id v3 = v20;
    uint64_t v21 = &v60;
    id v60 = v3;
    __os_log_helper_1_3_2_8_32_8_65(v19, (uint64_t)v23, (uint64_t)v3);

    _LPLogPack(1);
    objc_storeStrong(v21, v22);
    id v72 = 0LL;
    int v59 = 1;
  }

  objc_storeStrong(&v68, 0LL);
  return v72;
}

- (BOOL)createSnapshot:(id)a3 error:(id *)a4
{
  id v13 = a4;
  id v12 = "-[LPAPFSVolume createSnapshot:error:]";
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v41 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v39 = v13;
  id v38 = -[LPMedia mountPoint](v41, "mountPoint");
  char v37 = 0;
  int v36 = -1;
  int v35 = 0;
  if (location[0] && [location[0] length])
  {
    if (v38)
    {
      int v36 = open((const char *)[v38 fileSystemRepresentation], 0);
      if (v36 < 0)
      {
        if (v39)
        {
          uint64_t v8 = MEMORY[0x189607870];
          uint64_t v7 = *MEMORY[0x189607688];
          *uint64_t v39 = (id)[MEMORY[0x189607870] errorWithDomain:v7 code:*__error() userInfo:0];
        }

        uint64_t v18 = _os_log_pack_size();
        uint64_t v17 = v6;
        uint64_t v16 = v18;
        uint64_t v15 = (char *)v6 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v14 = _os_log_pack_fill();
        __os_log_helper_1_3_2_8_32_8_65(v14, (uint64_t)v12, (uint64_t)v38);
        _LPLogPack(1);
      }

      else
      {
        int v11 = v36;
        if (fs_snapshot_create( v36, (const char *)[location[0] fileSystemRepresentation], 0))
        {
          int v35 = *__error();
          if (v39) {
            *uint64_t v39 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v35 userInfo:0];
          }
          uint64_t v23 = _os_log_pack_size();
          id v22 = v6;
          uint64_t v21 = v23;
          id v20 = (char *)v6 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v19 = _os_log_pack_fill();
          uint64_t v10 = v19;
          int v9 = v35;
          int v4 = strerror(v35);
          __os_log_helper_1_2_2_4_0_8_32(v10, v9, (uint64_t)v4);
          _LPLogPack(1);
        }

        else
        {
          char v37 = 1;
        }

        close(v36);
      }

      char v42 = v37 & 1;
      int v29 = 1;
    }

    else
    {
      if (v39) {
        *uint64_t v39 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      }
      uint64_t v28 = _os_log_pack_size();
      uint64_t v27 = v6;
      uint64_t v26 = v28;
      unsigned int v25 = (char *)v6 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v24 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v24, (uint64_t)v12);
      _LPLogPack(1);
      char v42 = 0;
      int v29 = 1;
    }
  }

  else
  {
    if (v39) {
      *uint64_t v39 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v34 = _os_log_pack_size();
    uint64_t v33 = v6;
    uint64_t v32 = v34;
    uint64_t v31 = (char *)v6 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v30, (uint64_t)v12);
    _LPLogPack(1);
    char v42 = 0;
    int v29 = 1;
  }

  v6[0] = 0LL;
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(location, v6[0]);
  return v42 & 1;
}

- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5
{
  double v29 = a4;
  uint64_t v30 = a5;
  uint64_t v27 = 0LL;
  uint64_t v28 = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
  uint64_t v70 = *MEMORY[0x1895F89C0];
  int v67 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v65 = v29;
  int v64 = v30;
  id v63 = -[LPMedia mountPoint](v67, "mountPoint");
  char v62 = 0;
  int v61 = -1;
  if (location[0])
  {
    if ([location[0] count])
    {
      if (v63)
      {
        int v61 = open((const char *)[v63 fileSystemRepresentation], 0);
        int v49 = 0;
        if (v61 < 0)
        {
          if (v64)
          {
            uint64_t v15 = MEMORY[0x189607870];
            uint64_t v14 = *MEMORY[0x189607688];
            *int v64 = (id)[MEMORY[0x189607870] errorWithDomain:v14 code:*__error() userInfo:0];
          }

          uint64_t v35 = _os_log_pack_size();
          uint64_t v34 = &v11;
          uint64_t v33 = v35;
          uint64_t v32 = (char *)&v11 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v31 = _os_log_pack_fill();
          uint64_t v13 = v31;
          int v9 = __error();
          __os_log_helper_1_2_2_8_32_4_0(v13, (uint64_t)v28, *v9);
          _LPLogPack(1);
        }

        else
        {
          uint64_t v24 = v47;
          memset(v47, 0, sizeof(v47));
          id v25 = location[0];
          uint64_t v26 = [v25 countByEnumeratingWithState:v47 objects:v69 count:16];
          if (v26)
          {
            uint64_t v21 = *(void *)v47[2];
            uint64_t v22 = v27;
            unint64_t v23 = v26;
            while (1)
            {
              unint64_t v19 = v23;
              uint64_t v20 = v22;
              if (*(void *)v47[2] != v21) {
                objc_enumerationMutation(v25);
              }
              id v48 = 0LL;
              id v48 = *(id *)(v47[1] + 8 * v20);
              int v18 = v61;
              id v5 = (const char *)[v48 fileSystemRepresentation];
              if (fs_snapshot_delete(v18, v5, 0))
              {
                int v49 = *__error();
                uint64_t v46 = 0LL;
                uint64_t v46 = _os_log_pack_size();
                id v45 = &v11;
                uint64_t v44 = v46;
                uint64_t v43 = (char *)&v11 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v42 = _os_log_pack_fill();
                uint64_t v17 = v42;
                uint64_t v16 = (uint64_t)v48;
                id v6 = __error();
                __os_log_helper_1_3_3_8_32_8_65_4_0(v17, (uint64_t)v28, v16, *v6);
                _LPLogPack(1);
              }

              else
              {
                char v62 = 1;
              }

              uint64_t v22 = v20 + 1;
              unint64_t v23 = v19;
              if (v20 + 1 >= v19)
              {
                uint64_t v7 = [v25 countByEnumeratingWithState:v47 objects:v69 count:16];
                uint64_t v22 = v27;
                unint64_t v23 = v7;
                if (!v7) {
                  break;
                }
              }
            }
          }

          if (v49 && v64)
          {
            id v8 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v49 userInfo:0];
            *int v64 = v8;
          }

          if (v65 != 0.0)
          {
            v41[1] = 0LL;
            v41[2] = 0LL;
            v41[0] = 15LL;
            if (ffsctl(v61, 0x80184A24uLL, v41, 0))
            {
              uint64_t v40 = 0LL;
              uint64_t v40 = _os_log_pack_size();
              uint64_t v39 = &v11;
              uint64_t v38 = v40;
              char v37 = (char *)&v11 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v36 = _os_log_pack_fill();
              __os_log_helper_1_2_1_8_32(v36, (uint64_t)v28);
              _LPLogPack(1);
            }
          }

          close(v61);
        }

        char v68 = v62 & 1;
        int v55 = 1;
      }

      else
      {
        if (v64) {
          *int v64 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
        }
        uint64_t v54 = _os_log_pack_size();
        id v53 = &v11;
        uint64_t v52 = v54;
        int v51 = (char *)&v11 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v50 = _os_log_pack_fill();
        __os_log_helper_1_2_1_8_32(v50, (uint64_t)v28);
        _LPLogPack(1);
        char v68 = 0;
        int v55 = 1;
      }
    }

    else
    {
      char v68 = 1;
      int v55 = 1;
    }
  }

  else
  {
    if (v64) {
      *int v64 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v60 = _os_log_pack_size();
    int v59 = &v11;
    uint64_t v58 = v60;
    id v57 = (char *)&v11 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v56 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v56, (uint64_t)v28);
    _LPLogPack(1);
    char v68 = 0;
    int v55 = 1;
  }

  id v12 = 0LL;
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(location, v12);
  return v68 & 1;
}

- (BOOL)renameSnapshot:(id)a3 to:(id)a4 error:(id *)a5
{
  id obj = a4;
  uint64_t v16 = a5;
  uint64_t v14 = "-[LPAPFSVolume renameSnapshot:to:error:]";
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v50 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v48 = 0LL;
  objc_storeStrong(&v48, obj);
  id v47 = v16;
  id v46 = -[LPMedia mountPoint](v50, "mountPoint");
  char v45 = 0;
  int v44 = -1;
  int v43 = 0;
  if (location[0] && [location[0] length])
  {
    if (v48 && [v48 length])
    {
      if (v46)
      {
        int v44 = open((const char *)[v46 fileSystemRepresentation], 0);
        if (v44 < 0)
        {
          if (v47)
          {
            uint64_t v9 = MEMORY[0x189607870];
            uint64_t v8 = *MEMORY[0x189607688];
            *id v47 = (id)[MEMORY[0x189607870] errorWithDomain:v8 code:*__error() userInfo:0];
          }

          uint64_t v21 = _os_log_pack_size();
          uint64_t v20 = v7;
          uint64_t v19 = v21;
          int v18 = (char *)v7 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v17 = _os_log_pack_fill();
          __os_log_helper_1_3_2_8_32_8_65(v17, (uint64_t)v14, (uint64_t)v46);
          _LPLogPack(1);
        }

        else
        {
          int v13 = v44;
          id v12 = (const char *)[location[0] fileSystemRepresentation];
          if (fs_snapshot_rename( v44, v12, (const char *)[v48 fileSystemRepresentation], 0))
          {
            int v43 = *__error();
            if (v47) {
              *id v47 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v43 userInfo:0];
            }
            uint64_t v26 = _os_log_pack_size();
            id v25 = v7;
            uint64_t v24 = v26;
            unint64_t v23 = (char *)v7 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v22 = _os_log_pack_fill();
            uint64_t v11 = v22;
            int v10 = v43;
            id v5 = strerror(v43);
            __os_log_helper_1_2_2_4_0_8_32(v11, v10, (uint64_t)v5);
            _LPLogPack(1);
          }

          else
          {
            char v45 = 1;
          }

          close(v44);
        }

        char v51 = v45 & 1;
        int v37 = 1;
      }

      else
      {
        if (v47) {
          *id v47 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
        }
        uint64_t v31 = _os_log_pack_size();
        uint64_t v30 = v7;
        uint64_t v29 = v31;
        uint64_t v28 = (char *)v7 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v27 = _os_log_pack_fill();
        __os_log_helper_1_2_1_8_32(v27, (uint64_t)v14);
        _LPLogPack(1);
        char v51 = 0;
        int v37 = 1;
      }
    }

    else
    {
      if (v47) {
        *id v47 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      }
      uint64_t v36 = _os_log_pack_size();
      uint64_t v35 = v7;
      uint64_t v34 = v36;
      uint64_t v33 = (char *)v7 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v32 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v32, (uint64_t)v14);
      _LPLogPack(1);
      char v51 = 0;
      int v37 = 1;
    }
  }

  else
  {
    if (v47) {
      *id v47 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v42 = _os_log_pack_size();
    uint64_t v41 = v7;
    uint64_t v40 = v42;
    uint64_t v39 = (char *)v7 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v38 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v38, (uint64_t)v14);
    _LPLogPack(1);
    char v51 = 0;
    int v37 = 1;
  }

  v7[0] = 0LL;
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v48, v7[0]);
  objc_storeStrong(location, v7[0]);
  return v51 & 1;
}

- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = -[LPAPFSVolume revertToSnapshot:options:error:](v8, "revertToSnapshot:options:error:", location[0], 0LL, a4);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5
{
  id obj = a4;
  uint64_t v19 = a5;
  uint64_t v17 = "-[LPAPFSVolume revertToSnapshot:options:error:]";
  uint64_t v66 = *MEMORY[0x1895F89C0];
  int v64 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v62 = 0LL;
  objc_storeStrong(&v62, obj);
  int v61 = v19;
  id v60 = -[LPMedia mountPoint](v64, "mountPoint");
  char v59 = 1;
  int v58 = -1;
  int v57 = 0;
  if (location[0] && [location[0] length])
  {
    if (v60)
    {
      int v58 = open((const char *)[v60 fileSystemRepresentation], 0);
      if (v58 < 0)
      {
        if (v61)
        {
          uint64_t v11 = MEMORY[0x189607870];
          uint64_t v10 = *MEMORY[0x189607688];
          id *v61 = (id)[MEMORY[0x189607870] errorWithDomain:v10 code:*__error() userInfo:0];
        }

        uint64_t v24 = _os_log_pack_size();
        unint64_t v23 = v9;
        uint64_t v22 = v24;
        uint64_t v21 = (char *)v9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v20 = _os_log_pack_fill();
        __os_log_helper_1_3_2_8_32_8_65(v20, (uint64_t)v17, (uint64_t)v60);
        _LPLogPack(1);
      }

      else
      {
        int v16 = v58;
        if (fs_snapshot_revert( v58, (const char *)[location[0] fileSystemRepresentation], 0))
        {
          char v59 = 0;
          int v57 = *__error();
          if (v61) {
            id *v61 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v57 userInfo:0];
          }
          uint64_t v45 = _os_log_pack_size();
          int v44 = v9;
          uint64_t v43 = v45;
          uint64_t v42 = (char *)v9 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v41 = _os_log_pack_fill();
          uint64_t v15 = v41;
          int v14 = v57;
          id v5 = strerror(v57);
          __os_log_helper_1_2_2_4_0_8_32(v15, v14, (uint64_t)v5);
          _LPLogPack(1);
        }

        close(v58);
        id v40 = 0LL;
        id v40 = (id)[v62 objectForKeyedSubscript:LPAPFSVolumeRevertOptionSkipRemount];
        if ([v40 BOOLValue])
        {
          uint64_t v39 = 0LL;
          uint64_t v39 = _os_log_pack_size();
          uint64_t v38 = v9;
          uint64_t v37 = v39;
          uint64_t v36 = (char *)v9 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v35 = _os_log_pack_fill();
          __os_log_helper_1_2_2_8_32_8_64(v35, (uint64_t)v17, (uint64_t)v60);
          _LPLogPack(2);
        }

        else if (-[LPAPFSVolume unmountWithError:](v64, "unmountWithError:", v61))
        {
          if (-[LPAPFSVolume mountAtPath:options:error:](v64, "mountAtPath:options:error:", v60, v62, v61))
          {
            char v59 = 1;
          }

          else
          {
            uint64_t v34 = 0LL;
            uint64_t v34 = _os_log_pack_size();
            uint64_t v33 = v9;
            uint64_t v32 = v34;
            uint64_t v31 = (char *)v9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v30 = _os_log_pack_fill();
            uint64_t v13 = v30;
            BOOL v6 = __error();
            __os_log_helper_1_2_2_8_32_4_0(v13, (uint64_t)v17, *v6);
            _LPLogPack(1);
            char v59 = 0;
          }
        }

        else
        {
          uint64_t v29 = 0LL;
          uint64_t v29 = _os_log_pack_size();
          uint64_t v28 = v9;
          uint64_t v27 = v29;
          uint64_t v26 = (char *)v9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v25 = _os_log_pack_fill();
          uint64_t v12 = v25;
          uint64_t v7 = __error();
          __os_log_helper_1_2_2_8_32_4_0(v12, (uint64_t)v17, *v7);
          _LPLogPack(1);
          char v59 = 0;
        }

        objc_storeStrong(&v40, 0LL);
      }

      char v65 = v59 & 1;
      int v51 = 1;
    }

    else
    {
      if (v61) {
        id *v61 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      }
      uint64_t v50 = _os_log_pack_size();
      int v49 = v9;
      uint64_t v48 = v50;
      id v47 = (char *)v9 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v46 = _os_log_pack_fill();
      __os_log_helper_1_2_1_8_32(v46, (uint64_t)v17);
      _LPLogPack(1);
      char v65 = 0;
      int v51 = 1;
    }
  }

  else
  {
    if (v61) {
      id *v61 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
    }
    uint64_t v56 = _os_log_pack_size();
    int v55 = v9;
    uint64_t v54 = v56;
    id v53 = (char *)v9 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v52 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v52, (uint64_t)v17);
    _LPLogPack(1);
    char v65 = 0;
    int v51 = 1;
  }

  v9[0] = 0LL;
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v62, v9[0]);
  objc_storeStrong(location, v9[0]);
  return v65 & 1;
}

- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v13 = a4;
  uint64_t v12 = "-[LPAPFSVolume rootToSnapshot:error:]";
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v45 = v13;
  uint64_t v44 = _os_log_pack_size();
  uint64_t v43 = &v8;
  uint64_t v42 = v44;
  uint64_t v41 = (char *)&v8 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = _os_log_pack_fill();
  __os_log_helper_1_2_1_8_32(v40, (uint64_t)v12);
  _LPLogPack(3);
  id v39 = 0LL;
  id v39 = -[LPMedia mountPoint](v47, "mountPoint");
  char v38 = 1;
  int v37 = -1;
  int v36 = 0;
  uint64_t v35 = 0LL;
  if (location[0] && [location[0] length]) {
    uint64_t v35 = (void *)[location[0] fileSystemRepresentation];
  }
  else {
    uint64_t v35 = &unk_1862221B9;
  }
  if (v39)
  {
    uint64_t v28 = 0LL;
    uint64_t v28 = _os_log_pack_size();
    uint64_t v27 = &v8;
    uint64_t v26 = v28;
    uint64_t v25 = (char *)&v8 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v24 = _os_log_pack_fill();
    __os_log_helper_1_3_2_8_32_8_65(v24, (uint64_t)v12, (uint64_t)v39);
    _LPLogPack(3);
    int v37 = open((const char *)[v39 fileSystemRepresentation], 0);
    if (v37 < 0)
    {
      char v38 = 0;
      if (v45)
      {
        uint64_t v11 = MEMORY[0x189607870];
        uint64_t v10 = *MEMORY[0x189607688];
        id v6 = (id)[MEMORY[0x189607870] errorWithDomain:v10 code:*__error() userInfo:0];
        *uint64_t v45 = v6;
      }

      uint64_t v18 = 0LL;
      uint64_t v18 = _os_log_pack_size();
      uint64_t v17 = &v8;
      uint64_t v16 = v18;
      uint64_t v15 = (char *)&v8 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      __os_log_helper_1_3_2_8_32_8_65(v14, (uint64_t)v12, (uint64_t)v39);
      _LPLogPack(1);
    }

    else
    {
      if (fs_snapshot_root())
      {
        char v38 = 0;
        int v36 = *__error();
        if (v45)
        {
          id v5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:v36 userInfo:0];
          *uint64_t v45 = v5;
        }

        uint64_t v23 = 0LL;
        uint64_t v23 = _os_log_pack_size();
        uint64_t v22 = &v8;
        uint64_t v21 = v23;
        uint64_t v20 = (char *)&v8 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v19 = _os_log_pack_fill();
        __os_log_helper_1_2_2_8_32_4_0(v19, (uint64_t)v12, v36);
        _LPLogPack(1);
      }

      close(v37);
    }

    char v48 = v38 & 1;
    int v29 = 1;
  }

  else
  {
    if (v45)
    {
      id v4 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
      *uint64_t v45 = v4;
    }

    uint64_t v34 = 0LL;
    uint64_t v34 = _os_log_pack_size();
    uint64_t v33 = &v8;
    uint64_t v32 = v34;
    uint64_t v31 = (char *)&v8 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    __os_log_helper_1_2_1_8_32(v30, (uint64_t)v12);
    _LPLogPack(1);
    char v48 = 0;
    int v29 = 1;
  }

  id v9 = 0LL;
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, v9);
  return v48 & 1;
}

@end