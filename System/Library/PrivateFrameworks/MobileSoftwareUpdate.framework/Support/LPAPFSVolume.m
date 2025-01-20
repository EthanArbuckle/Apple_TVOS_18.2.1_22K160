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
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___LPAPFSVolume))
  {
    v37 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[0] = v37;
    v36 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    v39[0] = v36;
    v35 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[1] = v35;
    v34 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
    v39[1] = v34;
    v33 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[2] = v33;
    v32 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL);
    v39[2] = v32;
    v31 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[3] = v31;
    v30 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL);
    v39[3] = v30;
    v29 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[4] = v29;
    v28 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 5LL);
    v39[4] = v28;
    v27 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
    v38[5] = v27;
    v26 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 6LL);
    v39[5] = v26;
    v25 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 64LL);
    v38[6] = v25;
    v24 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL);
    v39[6] = v24;
    v23 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 128LL);
    v38[7] = v23;
    v22 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 8LL);
    v39[7] = v22;
    v21 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 256LL);
    v38[8] = v21;
    v20 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL);
    v39[8] = v20;
    v19 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 512LL);
    v38[9] = v19;
    v18 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL);
    v39[9] = v18;
    v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 384LL);
    v38[10] = v17;
    v16 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 11LL);
    v39[10] = v16;
    v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 192LL);
    v38[11] = v15;
    v14 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 12LL);
    v39[11] = v14;
    v13 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 320LL);
    v38[12] = v13;
    v12 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 13LL);
    v39[12] = v12;
    v11 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 448LL);
    v38[13] = v11;
    v10 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 14LL);
    v39[13] = v10;
    v9 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 576LL);
    v38[14] = v9;
    v8 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 15LL);
    v39[14] = v8;
    v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 32LL);
    v38[15] = v7;
    v6 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 7LL);
    v39[15] = v6;
    v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 640LL);
    v38[16] = v5;
    v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 16LL);
    v39[16] = v4;
    v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  17LL);
    v3 = (void *)sRoleLookupTable;
    sRoleLookupTable = (uint64_t)v2;

    +[LPAPFSVolume _loadMountPointTableForMode:]( &OBJC_CLASS___LPAPFSVolume,  "_loadMountPointTableForMode:",  (_is_running_in_ramdisk() & 1) == 0);
  }

+ (id)supportedContentTypes
{
  id v5 = a1;
  SEL v4 = a2;
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___LPAPFSVolume))
  {
    v7 = LPAPFSVolumeMediaTypeUUID;
    v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL);
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_METACLASS___LPAPFSVolume;
    v6 = (NSArray *)objc_msgSendSuper2(&v3, "supportedContentTypes");
  }

  return v6;
}

+ (void)_loadMountPointTableForMode:(int)a3
{
  id v13 = a1;
  SEL v12 = a2;
  int v11 = a3;
  __int128 v10 = 0uLL;
  __int128 v10 = *((_OWORD *)&kLPDefaultMountPointTable + a3);
  v9 =  +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  (int)v10);
  for (int i = 0; i < (int)v10; ++i)
  {
    __int128 v7 = *(_OWORD *)(*((void *)&v10 + 1) + 16LL * i);
    v6 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(*((void *)&v10 + 1) + 16LL * i + 8));
    id v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v6);
  }

  objc_super v3 = +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v9);
  SEL v4 = (void *)sMountPointLookupTable;
  sMountPointLookupTable = (uint64_t)v3;

  objc_storeStrong((id *)&v9, 0LL);
}

+ (id)defaultMountPointGivenRole:(int)a3
{
  SEL v4 = (void *)sMountPointLookupTable;
  id v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3);
  id v6 = objc_msgSend(v4, "objectForKey:");

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
  v14 = self;
  SEL v13 = a2;
  int v12 = a3;
  int v11 = a4;
  id location = -[LPMedia BSDName](self, "BSDName");
  __int16 v9 = 0;
  char v8 = 1;
  for (uint64_t i = 0LL; i < 17; ++i)
  {
    if (*((_DWORD *)&sRoleEncodingMapping + 2 * i) == v12)
    {
      __int16 v9 = *((_WORD *)&sRoleEncodingMapping + 4 * i + 2);
      break;
    }
  }

  int v6 = APFSVolumeRole([location fileSystemRepresentation], 0, &v9);
  if (v6)
  {
    if (v11)
    {
      SEL v4 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  0LL);
      id *v11 = v4;
    }

    char v8 = 0;
  }

  objc_storeStrong(&location, 0LL);
  return v8 & 1;
}

- (int)role
{
  __int128 v7 = "-[LPAPFSVolume role]";
  v21 = self;
  SEL v20 = a2;
  char v8 = &v19;
  unsigned __int16 v19 = 0;
  int v18 = 0;
  id v9 = -[LPMedia BSDName](self, "BSDName");
  int v17 = APFSVolumeRole([v9 UTF8String], &v19, 0);

  if (v17)
  {
    uint64_t v16 = _os_log_pack_size(18LL);
    v15 = &v3;
    uint64_t v14 = v16;
    uint64_t v13 = (uint64_t)&v3 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill(v13, v16, 0LL, &_mh_execute_header, "%s: failed to get role. Error: %d", v3, (_DWORD)v4);
    __os_log_helper_1_2_2_8_32_4_0(v12, (uint64_t)v7, v17);
    _LPLogPack(1, v13);
  }

  else
  {
    id v4 = (id)sRoleLookupTable;
    int v6 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19);
    id v5 = objc_msgSend(v4, "objectForKey:");
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
  if (!IORegistryEntryCreateIterator(-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3u, &v9))
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
        v2 = objc_alloc(&OBJC_CLASS___LPAPFSContainer);
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
  io_object_t v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  char v5 = 0;
  id v3 = -[LPMedia devNodePath](self, "devNodePath");
  APFSVolumeGetVEKState([v3 fileSystemRepresentation], &v6, &v5);

  char v4 = 1;
  if ((v6 & 1) == 0) {
    char v4 = v5;
  }
  return v4 & 1;
}

- (BOOL)isFilevaultEncrypted
{
  io_object_t v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  char v5 = 0;
  id v3 = -[LPMedia devNodePath](self, "devNodePath");
  APFSVolumeGetVEKState([v3 fileSystemRepresentation], &v6, &v5);

  char v4 = 0;
  if ((v6 & 1) != 0) {
    char v4 = v5 ^ 1;
  }
  return v4 & 1;
}

- (id)pairedVolume
{
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = -[LPAPFSVolume container](self, "container");
  unsigned int v20 = -[LPAPFSVolume role](v22, "role");
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
  id obj = [v21[0] volumes];
  id v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v16 = 0LL;
      id v16 = *(id *)(__b[1] + 8 * v9);
      unsigned int v3 = [v16 role];
      char v13 = 0;
      unsigned __int8 v6 = 0;
      if (v3 == v18)
      {
        id v14 = [v16 volumeGroupUUID];
        char v13 = 1;
        unsigned __int8 v6 = [v14 isEqualToString:v19];
      }

      if ((v13 & 1) != 0) {

      }
      if ((v6 & 1) != 0) {
        break;
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
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
  v31[2] = self;
  v31[1] = (id)a2;
  v31[0] = -[LPMedia devNodePath](self, "devNodePath");
  if (v31[0])
  {
    id v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"@%@", v31[0]);
    v23 = 0LL;
    int v22 = getmntinfo_r_np(&v23, 0);
    id v21 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 13LL);
    char v13 = objc_autoreleasePoolPush();
    id v20 = 0LL;
    id v19 = 0LL;
    for (int i = 0; i < v22; ++i)
    {
      id location = 0LL;
      id location =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v23[i].f_mntfromname);
      if ([location hasSuffix:v24])
      {
        id v15 = [location rangeOfString:@"@" options:4];
        uint64_t v16 = v2;
        id v3 = [location substringToIndex:v15];
        id v4 = v19;
        id v19 = v3;

        id v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v23[i].f_mntonname);
        id v6 = v20;
        id v20 = v5;

        id v11 = v21;
        v33[0] = LPAPFSVolumeSnapshotMountPointKeyName[0];
        v34[0] = v19;
        v33[1] = LPAPFSVolumeSnapshotMountPointKeyMountPoint[0];
        v34[1] = v20;
        id v12 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL);
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
    uint64_t v30 = _os_log_pack_size(12LL);
    v29 = v8;
    uint64_t v28 = v30;
    uint64_t v27 = (uint64_t)v8 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill(v27, v30, 0LL, &_mh_execute_header, "%s called on device with no dev node", v8[0]);
    __os_log_helper_1_2_1_8_32(v26, (uint64_t)v14);
    _LPLogPack(1, v27);
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
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id location = -[LPMedia mountPoint](self, "mountPoint");
  if (location)
  {
    int v12 = _lp2_delete_directory_contents((const char *)[location fileSystemRepresentation]);
    if (v12 && v14) {
      id *v14 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v12,  0LL);
    }
    BOOL v17 = *__error() == 0;
    int v11 = 1;
  }

  else
  {
    if (v14) {
      id *v14 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v10 = _os_log_pack_size(12LL);
    id v9 = &v4;
    uint64_t v8 = v10;
    uint64_t v7 = (uint64_t)&v4 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v6 = _os_log_pack_fill(v7, v10, 0LL, &_mh_execute_header, "%s : Failed because target volume is not mounted", v4);
    __os_log_helper_1_2_1_8_32(v6, (uint64_t)v5);
    _LPLogPack(1, v7);
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
  unsigned __int8 v6 = -[LPAPFSVolume mountAtPath:options:error:](v8, "mountAtPath:options:error:", location[0], 0LL, a4);
  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

- (id)_createTemporaryMountPointWithError:(id *)a3
{
  id v14 = self;
  SEL v13 = a2;
  int v12 = a3;
  char v11 = _is_running_in_ramdisk() & 1;
  bzero(v16, 0x400uLL);
  if ((v11 & 1) != 0) {
    __strlcpy_chk(v16, "/mnt5/tmp-mount-XXXXXX", 1024LL, 1024LL);
  }
  else {
    __strlcpy_chk(v16, "/tmp//tmp-mount-XXXXXX", 1024LL, 1024LL);
  }
  if (mkdtemp(v16))
  {
    SEL v15 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16);
  }

  else
  {
    uint64_t v10 = _os_log_pack_size(12LL);
    id v9 = v5;
    uint64_t v8 = v10;
    uint64_t v7 = (uint64_t)v5 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v6 = _os_log_pack_fill(v7, v10, 0LL, &_mh_execute_header, "Couldn't create a temporary mount point %s", v5[0]);
    __os_log_helper_1_2_1_8_32(v6, (uint64_t)v16);
    _LPLogPack(1, v7);
    if (*v12)
    {
      v5[4] = (const char *)&OBJC_CLASS___NSError;
      v5[3] = (const char *)NSPOSIXErrorDomain;
      id v3 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      id *v12 = v3;
    }

    SEL v15 = 0LL;
  }

  return v15;
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
  v54 = a5;
  v117 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v115 = 0LL;
  objc_storeStrong(&v115, obj);
  v114 = v54;
  id v113 = -[LPMedia devNodePath](v117, "devNodePath");
  if (v113)
  {
    id v106 = -[LPMedia mountPoint](v117, "mountPoint");
    if (([v106 isEqualToString:location[0]] & 1) == 0 || v115)
    {
      if (!v106
        || (uint64_t v100 = _os_log_pack_size(22LL),
            v99 = v24,
            uint64_t v98 = v100,
            uint64_t v97 = (uint64_t)v24 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0LL),
            uint64_t v96 = _os_log_pack_fill( v97,  v100,  0LL,  &_mh_execute_header,  "Volume is already mounted at %@, attempting to re-mount at %@"),  __os_log_helper_1_2_2_8_64_8_64(v96, (uint64_t)v106, (uint64_t)location[0]),  _LPLogPack(2, v97),  -[LPAPFSVolume unmountWithError:](v117, "unmountWithError:", v114)))
      {
        int v95 = 0;
        int v95 = mkpath_np( (const char *)[location[0] fileSystemRepresentation], 0x1FFu);
        if (!v95 || v95 == 17)
        {
          memcpy(__dst, &off_10005A2E0, sizeof(__dst));
          int v41 = 0;
          int v42 = 1;
          int v89 = 1;
          v88 = 0LL;
          v43 = (NSNumber *)[v115 objectForKeyedSubscript:LPAPFSVolumeMountOptionReadOnly[0]];
          char v86 = v41 & 1 & v42;
          if (v43)
          {
            v40 = v43;
          }

          else
          {
            int v39 = 1;
            v87 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
            char v86 = v39 & 1;
            v40 = v87;
          }

          v88 = v40;
          if ((v86 & 1) != 0) {

          }
          if (-[NSNumber BOOLValue](v88, "BOOLValue"))
          {
            uint64_t v9 = v89++;
            __dst[v9] = "-o";
            uint64_t v10 = v89++;
            __dst[v10] = "rdonly";
          }

          v85 = 0LL;
          v38 = (NSNumber *)[v115 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoBrowse[0]];
          char v83 = 0;
          if (v38)
          {
            v37 = v38;
          }

          else
          {
            int v36 = 1;
            v84 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
            char v83 = v36 & 1;
            v37 = v84;
          }

          v85 = v37;
          if ((v83 & 1) != 0) {

          }
          if (-[NSNumber BOOLValue](v85, "BOOLValue"))
          {
            uint64_t v11 = v89++;
            __dst[v11] = "-o";
            uint64_t v12 = v89++;
            __dst[v12] = "nobrowse";
          }

          v82 = 0LL;
          v35 = (NSNumber *)[v115 objectForKeyedSubscript:LPAPFSVolumeMountOptionNoFirmlinks[0]];
          char v80 = 0;
          if (v35)
          {
            v34 = v35;
          }

          else
          {
            int v33 = 1;
            v81 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
            char v80 = v33 & 1;
            v34 = v81;
          }

          v82 = v34;
          if ((v80 & 1) != 0) {

          }
          if (-[NSNumber BOOLValue](v82, "BOOLValue"))
          {
            uint64_t v13 = v89++;
            __dst[v13] = "-n";
          }

          id v79 = 0LL;
          id v79 = [v115 objectForKeyedSubscript:LPAPFSVolumeMountOptionSnapshotName[0]];
          BOOL v78 = 0;
          BOOL v78 = [v79 length] != 0;
          if (v78)
          {
            uint64_t v14 = v89++;
            id v32 = __dst;
            __dst[v14] = "-s";
            SEL v15 = (char *)[v79 fileSystemRepresentation];
            uint64_t v16 = v89++;
            v32[v16] = v15;
          }

          BOOL v17 = (char *)[v113 fileSystemRepresentation];
          uint64_t v18 = v89++;
          v31 = __dst;
          __dst[v18] = v17;
          id v19 = (char *)[location[0] fileSystemRepresentation];
          uint64_t v20 = v89++;
          v31[v20] = v19;
          unsigned int v77 = -1;
          int v76 = 0;
          while (v77)
          {
            unsigned int v77 = _execForLibpartition(__dst);
            if (v77 != 75 || v76 >= 3) {
              break;
            }
            uint64_t v75 = 0LL;
            uint64_t v75 = _os_log_pack_size(24LL);
            v74 = v24;
            uint64_t v73 = v75;
            uint64_t v72 = (uint64_t)v24 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v71 = _os_log_pack_fill(v72, v75, 0LL, &_mh_execute_header, "mount_apfs %@ returned %d, retrying (%d)");
            __os_log_helper_1_2_3_8_64_4_0_4_0(v71, (uint64_t)v113, v77, v76);
            _LPLogPack(1, v72);
            ++v76;
            sleep(3u);
          }

          if (v77)
          {
            if (v114)
            {
              v29 = &v70;
              id v30 = 0LL;
              v70 = 0LL;
              v70 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mount_apfs returned : %d",  v77);
              id v27 = &OBJC_CLASS___NSError;
              NSErrorDomain v26 = NSPOSIXErrorDomain;
              v119[0] = NSLocalizedFailureReasonErrorKey;
              v120[0] = @"Mount failed";
              v119[1] = NSLocalizedDescriptionKey;
              v120[1] = v70;
              uint64_t v28 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v120,  v119,  2LL);
              id v21 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", v26, 22);
              int v22 = v28;
              id *v114 = v21;

              objc_storeStrong((id *)v29, v30);
            }

            uint64_t v69 = 0LL;
            uint64_t v69 = _os_log_pack_size(18LL);
            v68 = v24;
            uint64_t v67 = v69;
            uint64_t v66 = (uint64_t)v24 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v65 = _os_log_pack_fill(v66, v69, 0LL, &_mh_execute_header, "Can not mount (%@) because mount returned %d.");
            __os_log_helper_1_2_2_8_64_4_0(v65, (uint64_t)v113, v77);
            _LPLogPack(1, v66);
            char v118 = 0;
            int v107 = 1;
          }

          else
          {
            if (v78)
            {
              uint64_t v64 = 0LL;
              uint64_t v64 = _os_log_pack_size(32LL);
              v63 = v24;
              uint64_t v62 = v64;
              uint64_t v61 = (uint64_t)v24 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v60 = _os_log_pack_fill( v61,  v64,  0LL,  &_mh_execute_header,  "Mounted %@, Snapshot( %{private}@) at %{private}@");
              __os_log_helper_1_3_3_8_64_8_65_8_65(v60, (uint64_t)v113, (uint64_t)v79, (uint64_t)location[0]);
              _LPLogPack(2, v61);
            }

            else
            {
              uint64_t v59 = 0LL;
              uint64_t v59 = _os_log_pack_size(22LL);
              v58 = v24;
              uint64_t v57 = v59;
              uint64_t v56 = (uint64_t)v24 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v55 = _os_log_pack_fill(v56, v59, 0LL, &_mh_execute_header, "Mounted %@ at %{private}@");
              __os_log_helper_1_3_2_8_64_8_65(v55, (uint64_t)v113, (uint64_t)location[0]);
              _LPLogPack(2, v56);
            }

            char v118 = 1;
            int v107 = 1;
          }

          id v25 = 0LL;
          objc_storeStrong(&v79, 0LL);
          objc_storeStrong((id *)&v82, v25);
          objc_storeStrong((id *)&v85, v25);
          objc_storeStrong((id *)&v88, v25);
        }

        else
        {
          if (v114)
          {
            id v49 = &OBJC_CLASS___NSError;
            NSErrorDomain v47 = NSPOSIXErrorDomain;
            uint64_t v48 = v95;
            NSErrorUserInfoKey v122 = NSFilePathErrorKey;
            id v123 = location[0];
            v50 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v123,  &v122,  1LL);
            id v6 = objc_msgSend(v49, "errorWithDomain:code:userInfo:", v47, v48);
            uint64_t v7 = v50;
            id *v114 = v6;
          }

          uint64_t v94 = 0LL;
          uint64_t v94 = _os_log_pack_size(22LL);
          v93 = v24;
          uint64_t v92 = v94;
          uint64_t v91 = (uint64_t)v24 - ((v94 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v90 = _os_log_pack_fill( v91,  v94,  0LL,  &_mh_execute_header,  "Can not mount (%{private}s) because we could not create its mount folder (%{private}s).");
          uint64_t v45 = v90;
          id v46 = -[LPMedia description](v117, "description");
          id v44 = [v46 UTF8String];
          id v8 = [location[0] fileSystemRepresentation];
          __os_log_helper_1_3_2_8_33_8_33(v45, (uint64_t)v44, (uint64_t)v8);

          _LPLogPack(1, v91);
          char v118 = 0;
          int v107 = 1;
        }
      }

      else
      {
        char v118 = 0;
        int v107 = 1;
      }
    }

    else
    {
      uint64_t v105 = _os_log_pack_size(12LL);
      v104 = v24;
      uint64_t v103 = v105;
      uint64_t v102 = (uint64_t)v24 - ((v105 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v101 = _os_log_pack_fill( v102,  v105,  0LL,  &_mh_execute_header,  "Volume is already mounted at %@, skipping re-mount");
      __os_log_helper_1_2_1_8_64(v101, (uint64_t)location[0]);
      _LPLogPack(2, v102);
      char v118 = 1;
      int v107 = 1;
    }

    objc_storeStrong(&v106, 0LL);
  }

  else
  {
    if (v114) {
      id *v114 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v112 = _os_log_pack_size(12LL);
    v111 = v24;
    uint64_t v110 = v112;
    uint64_t v109 = (uint64_t)v24 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v108 = _os_log_pack_fill( v109,  v112,  0LL,  &_mh_execute_header,  "Can not mount (%s) because it does not appear to have a device node.",  v24[0]);
    uint64_t v51 = v108;
    id v52 = -[LPMedia description](v117, "description");
    id v5 = [v52 UTF8String];
    __os_log_helper_1_2_1_8_32(v51, (uint64_t)v5);

    _LPLogPack(1, v109);
    char v118 = 0;
    int v107 = 1;
  }

  v24[0] = 0LL;
  objc_storeStrong(&v113, 0LL);
  objc_storeStrong(&v115, (id)v24[0]);
  objc_storeStrong(location, (id)v24[0]);
  return v118 & 1;
}

- (BOOL)unmountWithError:(id *)a3
{
  return -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:", 0LL, a3);
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  unsigned int v77 = a4;
  uint64_t v76 = 0LL;
  v146 = self;
  v145[1] = (id)a2;
  v145[0] = 0LL;
  objc_storeStrong(v145, a3);
  v144 = v77;
  BOOL v143 = 0;
  v142 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
  id v78 = [v145[0] objectForKey:LPAPFSVolumeUnmountOptionAll[0]];
  unsigned int v79 = [v78 BOOLValue];

  unsigned __int8 v141 = v79 & 1;
  id v80 = [v145[0] objectForKey:LPAPFSVolumeUnmountOptionSnapshotName[0]];
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
      uint64_t v72 = v137;
      memset(v137, 0, sizeof(v137));
      id v73 = v140;
      id v74 = [v73 countByEnumeratingWithState:v137 objects:v148 count:16];
      if (v74)
      {
        uint64_t v69 = *(void *)v137[2];
        uint64_t v70 = v76;
        id v71 = v74;
        while (1)
        {
          unint64_t v67 = (unint64_t)v71;
          uint64_t v68 = v70;
          if (*(void *)v137[2] != v69) {
            objc_enumerationMutation(v73);
          }
          id v138 = 0LL;
          id v138 = *(id *)(v137[1] + 8 * v68);
          char v135 = 0;
          char v133 = 0;
          char v131 = 0;
          unsigned int v66 = 1;
          if ((v141 & 1) == 0)
          {
            id v63 = v138;
            id v136 = [v145[0] objectForKey:LPAPFSVolumeSnapshotMountPointKeyName[0]];
            int v64 = 1;
            char v135 = 1;
            id v65 = objc_msgSend(v63, "objectForKey:");
            id v134 = v65;
            char v133 = 1;
            id v132 = [v145[0] objectForKey:LPAPFSVolumeUnmountOptionSnapshotName[0]];
            char v131 = 1;
            unsigned int v66 = objc_msgSend(v65, "isEqualToString:");
          }

          unsigned int v62 = v66;
          if ((v131 & 1) != 0) {

          }
          if ((v133 & 1) != 0) {
          if ((v135 & 1) != 0)
          }

          if ((v62 & 1) != 0)
          {
            uint64_t v60 = v142;
            id v61 = [v138 objectForKey:LPAPFSVolumeSnapshotMountPointKeyMountPoint[0]];
            -[NSMutableArray addObject:](v60, "addObject:");

            if ((v141 & 1) == 0) {
              break;
            }
          }

          uint64_t v70 = v68 + 1;
          id v71 = (id)v67;
          if (v68 + 1 >= v67)
          {
            uint64_t v70 = v76;
            id v71 = [v73 countByEnumeratingWithState:v137 objects:v148 count:16];
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
      -[NSMutableArray addObject:](v142, "addObject:", v139);
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
      uint64_t v56 = v142;
      id v57 = -[LPMedia mountPoint](v146, "mountPoint");
      -[NSMutableArray addObject:](v142, "addObject:");
    }
  }

  if (-[NSMutableArray count](v142, "count"))
  {
    -[NSMutableArray sortUsingComparator:](v142, "sortUsingComparator:", &__block_literal_global_13);
    v53 = v128;
    memset(v128, 0, sizeof(v128));
    v54 = v142;
    id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  v128,  v147,  16LL);
    if (v55)
    {
      uint64_t v50 = *(void *)v128[2];
      uint64_t v51 = v76;
      unint64_t v52 = (unint64_t)v55;
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
          id v47 = [v145[0] objectForKey:LPAPFSVolumeUnmountOptionForce[0]];

          if (v47) {
            int v127 = 0x80000;
          }
          id v46 = [v145[0] objectForKey:LPAPFSVolumeUnmountOptionDoNotLock[0]];

          if (v46)
          {
            uint64_t v45 = &v124;
            char v124 = 1;
            BOOL v4 = (const char *)[v129 fileSystemRepresentation];
            if (fsctl(v4, 0x80014A22uLL, v45, 0))
            {
              if (*__error() == 17)
              {
                uint64_t v123 = 0LL;
                uint64_t v123 = _os_log_pack_size(12LL);
                NSErrorUserInfoKey v122 = v16;
                uint64_t v121 = v123;
                id v44 = 0LL;
                v120 = &v16[-((v123 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
                uint64_t v119 = _os_log_pack_fill( v120,  v123,  0LL,  &_mh_execute_header,  "Call to APFS_FSCTL_UNMOUNT_CRYPTO_HINT on %@ returned EEXIST\n");
                uint64_t v41 = v119;
                id v42 = -[LPMedia devNodePath](v146, "devNodePath");
                id v5 = v42;
                v43 = &v118;
                id v118 = v5;
                __os_log_helper_1_2_1_8_64(v41, (uint64_t)v5);

                _LPLogPack(2, (uint64_t)v120);
                objc_storeStrong(v43, v44);
              }

              else
              {
                uint64_t v117 = 0LL;
                uint64_t v117 = _os_log_pack_size(18LL);
                v116 = v16;
                uint64_t v115 = v117;
                id v40 = 0LL;
                v114 = &v16[-((v117 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
                uint64_t v113 = _os_log_pack_fill( v114,  v117,  0LL,  &_mh_execute_header,  "Failed to call APFS_FSCTL_UNMOUNT_CRYPTO_HINT on %@ with errno %d\n");
                uint64_t v37 = v113;
                id v38 = -[LPMedia devNodePath](v146, "devNodePath");
                id v36 = v38;
                int v39 = &v112;
                id v112 = v36;
                id v6 = __error();
                __os_log_helper_1_2_2_8_64_4_0(v37, (uint64_t)v36, *v6);

                _LPLogPack(1, (uint64_t)v114);
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
            uint64_t v93 = _os_log_pack_size(22LL);
            uint64_t v92 = v16;
            uint64_t v91 = v93;
            id v26 = 0LL;
            uint64_t v90 = &v16[-((v93 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            uint64_t v89 = _os_log_pack_fill(v90, v93, 0LL, &_mh_execute_header, "Unmounted %@(%{private}@)");
            uint64_t v23 = v89;
            id v24 = -[LPMedia devNodePath](v146, "devNodePath");
            id v12 = v24;
            id v25 = &v88;
            id v88 = v12;
            __os_log_helper_1_3_2_8_64_8_65(v23, (uint64_t)v12, (uint64_t)v129);

            _LPLogPack(2, (uint64_t)v90);
            objc_storeStrong(v25, v26);
          }

          else
          {
            int v111 = 0;
            int v111 = *__error();
            if (v111 == 22)
            {
              uint64_t v110 = 0LL;
              uint64_t v110 = _os_log_pack_size(2LL);
              uint64_t v109 = v16;
              uint64_t v108 = v110;
              int v107 = &v16[-((v110 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
              id v106 = (_BYTE *)_os_log_pack_fill( v107,  v110,  0LL,  &_mh_execute_header,  "Unmount failed with EINVAL, will assume race. Ignoring error.");
              __os_log_helper_1_0_0(v106);
              _LPLogPack(1, (uint64_t)v107);
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
              uint64_t v105 = _os_log_pack_size(18LL);
              v104 = v16;
              uint64_t v103 = v105;
              id v35 = 0LL;
              uint64_t v102 = &v16[-((v105 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
              uint64_t v101 = _os_log_pack_fill( v102,  v105,  0LL,  &_mh_execute_header,  "Failed to unmount %@ **FORCING UNMOUNT** error: %d");
              uint64_t v32 = v101;
              id v33 = -[LPMedia devNodePath](v146, "devNodePath");
              id v8 = v33;
              v34 = &v100;
              id v100 = v8;
              __os_log_helper_1_2_2_8_64_4_0(v32, (uint64_t)v8, v111);

              _LPLogPack(1, (uint64_t)v102);
              objc_storeStrong(v34, v35);
            }

            else if (v144)
            {
              uint64_t v9 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v111,  0LL);
              void *v144 = v9;
            }

            uint64_t v99 = 0LL;
            uint64_t v99 = _os_log_pack_size(28LL);
            uint64_t v98 = v16;
            uint64_t v97 = v99;
            id v31 = 0LL;
            uint64_t v96 = &v16[-((v99 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
            uint64_t v95 = _os_log_pack_fill(v96, v99, 0LL, &_mh_execute_header, "Failed to unmount %@ retry: %s error: %d");
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

            _LPLogPack(v29, (uint64_t)v96);
            objc_storeStrong(v30, v31);
          }
        }

        while ((v125 & 1) != 0);
        uint64_t v51 = v49 + 1;
        unint64_t v52 = v48;
        if (v49 + 1 >= v48)
        {
          id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  v128,  v147,  16LL);
          uint64_t v51 = v76;
          unint64_t v52 = (unint64_t)v13;
          if (!v13) {
            break;
          }
        }
      }
    }
  }

  else
  {
    uint64_t v87 = _os_log_pack_size(12LL);
    char v86 = v16;
    uint64_t v85 = v87;
    id v22 = 0LL;
    v84 = &v16[-((v87 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v83 = _os_log_pack_fill(v84, v87, 0LL, &_mh_execute_header, "Was asked asked to unmount (%@) but is not mounted.");
    uint64_t v19 = v83;
    id v20 = -[LPMedia devNodePath](v146, "devNodePath");
    id v14 = v20;
    id v21 = &v82;
    id v82 = v14;
    __os_log_helper_1_2_1_8_64(v19, (uint64_t)v14);

    _LPLogPack(2, (uint64_t)v84);
    objc_storeStrong(v21, v22);
    BOOL v143 = 1;
  }

  BOOL v17 = v143;
  int v130 = 1;
  id v18 = 0LL;
  objc_storeStrong((id *)&v142, 0LL);
  objc_storeStrong(v145, v18);
  return v17;
}

int64_t __41__LPAPFSVolume_unmountWithOptions_error___block_invoke(id a1, id a2, id a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  int64_t v5 = -(uint64_t)[location[0] compare:v6];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)unmountAllWithError:(id *)a3
{
  id v8 = LPAPFSVolumeUnmountOptionAll[0];
  uint64_t v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  uint64_t v9 = v7;
  int64_t v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL);
  unsigned __int8 v6 = -[LPAPFSVolume unmountWithOptions:error:](self, "unmountWithOptions:error:");

  return v6 & 1;
}

- (BOOL)deleteVolumeWithError:(id *)a3
{
  uint64_t v9 = "-[LPAPFSVolume deleteVolumeWithError:]";
  id v42 = self;
  SEL v41 = a2;
  id v40 = a3;
  id location = -[LPMedia devNodePath](self, "devNodePath");
  if (location)
  {
    uint64_t v32 = _os_log_pack_size(22LL);
    id v31 = &v7;
    uint64_t v30 = v32;
    uint64_t v29 = (uint64_t)&v7 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v28 = _os_log_pack_fill(v29, v32, 0LL, &_mh_execute_header, "%s : going to delete apfs volume(%@)");
    __os_log_helper_1_2_2_8_32_8_64(v28, (uint64_t)v9, (uint64_t)location);
    _LPLogPack(2, v29);
    int v27 = 0;
    int v27 = APFSVolumeDelete([location fileSystemRepresentation]);
    if (v27)
    {
      unsigned int v26 = v27 & 0xFC000000;
      int v25 = (v27 >> 14) & 0xFFF;
      if ((v27 & 0xFC000000) == 0xE0000000)
      {
        uint64_t v24 = 0LL;
        uint64_t v24 = _os_log_pack_size(18LL);
        uint64_t v23 = &v7;
        uint64_t v22 = v24;
        uint64_t v21 = (uint64_t)&v7 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v20 = _os_log_pack_fill(v21, v24, 0LL, &_mh_execute_header, "%s : failed with iokit error: %d", v7, v8);
        __os_log_helper_1_2_2_8_32_4_0(v20, (uint64_t)v9, v27 & 0x3FFF);
        _LPLogPack(1, v21);
        if (v40)
        {
          id v3 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.IOKit",  v27 & 0x3FFF,  0LL);
          id *v40 = v3;
        }
      }

      else if (v26 || v25 != 3)
      {
        uint64_t v14 = 0LL;
        uint64_t v14 = _os_log_pack_size(18LL);
        id v13 = &v7;
        uint64_t v12 = v14;
        uint64_t v11 = (uint64_t)&v7 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v10 = _os_log_pack_fill( v11,  v14,  0LL,  &_mh_execute_header,  "%s : failed with unknown kern_return_t error: %d",  v7,  v8);
        __os_log_helper_1_2_2_8_32_4_0(v10, (uint64_t)v9, v27);
        _LPLogPack(1, v11);
        if (v40)
        {
          int64_t v5 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v27,  0LL);
          id *v40 = v5;
        }
      }

      else
      {
        uint64_t v19 = 0LL;
        uint64_t v19 = _os_log_pack_size(18LL);
        id v18 = &v7;
        uint64_t v17 = v19;
        uint64_t v16 = (uint64_t)&v7 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v15 = _os_log_pack_fill(v16, v19, 0LL, &_mh_execute_header, "%s : failed with posix error: %d", v7, v8);
        __os_log_helper_1_2_2_8_32_4_0(v15, (uint64_t)v9, v27 & 0x3FFF);
        _LPLogPack(1, v16);
        if (v40)
        {
          BOOL v4 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v27 & 0x3FFF,  0LL);
          id *v40 = v4;
        }
      }

      char v43 = 0;
      int v33 = 1;
    }

    else
    {
      char v43 = 1;
      int v33 = 1;
    }
  }

  else
  {
    if (v40) {
      id *v40 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v38 = _os_log_pack_size(12LL);
    uint64_t v37 = &v7;
    uint64_t v36 = v38;
    uint64_t v35 = (uint64_t)&v7 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v34 = _os_log_pack_fill(v35, v38, 0LL, &_mh_execute_header, "%s : volume is missing a dev node somehow", v7);
    __os_log_helper_1_2_1_8_32(v34, (uint64_t)v9);
    _LPLogPack(1, v35);
    char v43 = 0;
    int v33 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v43 & 1;
}

- (id)snapshotsWithError:(id *)a3
{
  v15[3] = self;
  v15[2] = (id)a2;
  v15[1] = a3;
  v15[0] = -[LPAPFSVolume snapshotInfoWithError:](self, "snapshotInfoWithError:", a3);
  id v14 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL);
  if (v15[0])
  {
    memset(__b, 0, sizeof(__b));
    id obj = v15[0];
    id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0LL;
      id v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v13 = 0LL;
        id v13 = *(id *)(__b[1] + 8 * v7);
        id location = 0LL;
        id location = [v13 objectForKey:LPAPFSSnapshotPropertyKeyName[0]];
        if (location) {
          [v14 addObject:location];
        }
        objc_storeStrong(&location, 0LL);
        ++v7;
        if (v5 + 1 >= (unint64_t)v8)
        {
          uint64_t v7 = 0LL;
          id v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
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
  unsigned int v26 = "-[LPAPFSVolume snapshotInfoWithError:]";
  id v82 = self;
  SEL v81 = a2;
  id v80 = a3;
  id v79 = -[LPMedia mountPoint](self, "mountPoint");
  int v78 = 0;
  int v77 = -1;
  if (v79)
  {
    int v77 = open((const char *)[v79 fileSystemRepresentation], 0x100000);
    if (v77 >= 0)
    {
      int v64 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL);
      v63.reserved = 0;
      *(void *)&v63.volattr = 0LL;
      *(void *)&v63.fileattr = 0LL;
      bzero(v84, 0x800uLL);
      v63.bitmapcount = 5;
      v63.commonattr = -1610612703;
      int v62 = 0;
      while (1)
      {
        int v62 = fs_snapshot_list(v77, &v63, v84, 0x800uLL, 0);
        if (v62 <= 0) {
          break;
        }
        id v61 = (unsigned int *)v84;
        do
        {
          int v4 = v62--;
          if (v4 <= 0) {
            break;
          }
          uint64_t v60 = v61;
          id v58 = 0LL;
          id v57 = 0LL;
          id v56 = 0LL;
          id v55 = 0LL;
          uint64_t v59 = (int *)(v61 + 6);
          id v61 = (unsigned int *)((char *)v61 + *v61);
          if ((v60[1] & 0x20000000) != 0)
          {
            int v78 = *v59++;
            uint64_t v54 = 0LL;
            uint64_t v54 = _os_log_pack_size(18LL);
            v53 = &v11;
            uint64_t v52 = v54;
            uint64_t v51 = (uint64_t)&v11 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v50 = _os_log_pack_fill( v51,  v54,  0LL,  &_mh_execute_header,  "%s : Error in reading attributes for directory entry %d",  v11,  v12);
            __os_log_helper_1_2_2_8_32_4_0(v50, (uint64_t)v26, v78);
            _LPLogPack(1, v51);
            int v70 = 9;
          }

          else
          {
            if ((v60[1] & 1) != 0)
            {
              uint64_t v49 = v59;
              uint64_t v48 = 0LL;
              uint64_t v48 = *(void *)v59;
              uint64_t v47 = (uint64_t)v59 + (int)v48;
              uint64_t v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v47);
              uint64_t v6 = v58;
              id v58 = v5;

              if (!v58)
              {
                uint64_t v46 = 0LL;
                uint64_t v46 = _os_log_pack_size(22LL);
                uint64_t v45 = &v11;
                uint64_t v44 = v46;
                uint64_t v43 = (uint64_t)&v11 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v42 = _os_log_pack_fill( v43,  v46,  0LL,  &_mh_execute_header,  "%s : Failed to encode snapshot name %{private}s for some reason.");
                __os_log_helper_1_3_2_8_32_8_33(v42, (uint64_t)v26, v47);
                _LPLogPack(2, v43);
              }

              v59 += 2;
            }

            if ((v60[1] & 0x20) != 0)
            {
              uint64_t v41 = 0LL;
              uint64_t v41 = *(void *)v59;
              uint64_t v7 =  +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v41 & 0x3FFFFFFFFFFFFFFFLL);
              id v8 = v57;
              id v57 = v7;

              char v39 = 0;
              char v37 = 0;
              if ((v41 & 0x4000000000000000LL) != 0)
              {
                int v18 = 1;
                id v40 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
                char v39 = v18 & 1;
                uint64_t v19 = v40;
              }

              else
              {
                int v17 = 1;
                uint64_t v38 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
                char v37 = v17 & 1;
                uint64_t v19 = v38;
              }

              objc_storeStrong(&v56, v19);
              if ((v37 & 1) != 0) {

              }
              if ((v39 & 1) != 0) {
              char v35 = 0;
              }
              char v33 = 0;
              if (v41 >= 0)
              {
                int v14 = 1;
                uint64_t v34 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
                char v33 = v14 & 1;
                uint64_t v16 = v34;
              }

              else
              {
                int v15 = 1;
                uint64_t v36 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
                char v35 = v15 & 1;
                uint64_t v16 = v36;
              }

              objc_storeStrong(&v55, v16);
              if ((v33 & 1) != 0) {

              }
              if ((v35 & 1) != 0) {
              v59 += 2;
              }
            }

            uint64_t v32 = 0LL;
            uint64_t v32 =  +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL);
            if (v58) {
              -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v58, LPAPFSSnapshotPropertyKeyName[0]);
            }
            if (v57) {
              -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v57, LPAPFSSnapshotPropertyKeyXID[0]);
            }
            if (v56) {
              -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  v56,  LPAPFSSnapshotPropertyKeyMarkedForRevert);
            }
            if (v55) {
              -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  v55,  LPAPFSSnapshotPropertyKeyMarkedForRoot[0]);
            }
            if (-[NSMutableDictionary count](v32, "count")) {
              -[NSMutableArray addObject:](v64, "addObject:", v32);
            }
            objc_storeStrong((id *)&v32, 0LL);
            int v70 = 0;
          }

          id v13 = 0LL;
          objc_storeStrong(&v55, 0LL);
          objc_storeStrong(&v56, v13);
          objc_storeStrong((id *)&v57, v13);
          objc_storeStrong((id *)&v58, v13);
        }

        while (!v70);
      }

      if (v62 >= 0)
      {
        close(v77);
        uint64_t v83 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v64);
        int v70 = 1;
      }

      else
      {
        uint64_t v31 = 0LL;
        uint64_t v31 = _os_log_pack_size(18LL);
        uint64_t v30 = &v11;
        uint64_t v29 = v31;
        uint64_t v28 = (uint64_t)&v11 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v27 = _os_log_pack_fill( v28,  v31,  0LL,  &_mh_execute_header,  "%s : fs_snapshot_list failed with error %d",  v11,  v12);
        __os_log_helper_1_2_2_8_32_4_0(v27, (uint64_t)v26, v62);
        _LPLogPack(1, v28);
        close(v77);
        if (v80)
        {
          uint64_t v9 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v62,  0LL);
          *id v80 = v9;
        }

        uint64_t v83 = 0LL;
        int v70 = 1;
      }

      objc_storeStrong((id *)&v64, 0LL);
    }

    else
    {
      if (v80)
      {
        uint64_t v21 = &OBJC_CLASS___NSError;
        NSErrorDomain v20 = NSPOSIXErrorDomain;
        *id v80 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      }

      uint64_t v69 = _os_log_pack_size(28LL);
      uint64_t v68 = &v11;
      uint64_t v67 = v69;
      uint64_t v66 = (uint64_t)&v11 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v65 = _os_log_pack_fill(v66, v69, 0LL, &_mh_execute_header, "%s : Unable to open mount point %{private}@: %d");
      __os_log_helper_1_3_3_8_32_8_65_4_0(v65, (uint64_t)v26, (uint64_t)v79, v78);
      _LPLogPack(1, v66);
      uint64_t v83 = 0LL;
      int v70 = 1;
    }
  }

  else
  {
    if (v80) {
      *id v80 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v76 = _os_log_pack_size(22LL);
    int v75 = &v11;
    uint64_t v74 = v76;
    id v25 = 0LL;
    uint64_t v73 = (uint64_t)&v11 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v72 = _os_log_pack_fill(v73, v76, 0LL, &_mh_execute_header, "%s called but %{private}@ is not mounted.");
    uint64_t v22 = v72;
    id v23 = -[LPMedia description](v82, "description");
    id v3 = v23;
    uint64_t v24 = &v71;
    id v71 = v3;
    __os_log_helper_1_3_2_8_32_8_65(v22, (uint64_t)v26, (uint64_t)v3);

    _LPLogPack(1, v73);
    objc_storeStrong(v24, v25);
    uint64_t v83 = 0LL;
    int v70 = 1;
  }

  objc_storeStrong(&v79, 0LL);
  return v83;
}

- (BOOL)createSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v11 = a4;
  id v10 = "-[LPAPFSVolume createSnapshot:error:]";
  char v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v37 = v11;
  id v36 = -[LPMedia mountPoint](v39, "mountPoint");
  char v35 = 0;
  int v34 = -1;
  int v33 = 0;
  if (location[0] && [location[0] length])
  {
    if (v36)
    {
      int v34 = open((const char *)[v36 fileSystemRepresentation], 0);
      if (v34 < 0)
      {
        if (v37)
        {
          v6[3] = (const char *)&OBJC_CLASS___NSError;
          v6[2] = (const char *)NSPOSIXErrorDomain;
          id *v37 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        }

        uint64_t v16 = _os_log_pack_size(22LL);
        int v15 = v6;
        uint64_t v14 = v16;
        uint64_t v13 = (uint64_t)v6 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v12 = _os_log_pack_fill(v13, v16, 0LL, &_mh_execute_header, "%s : Could not open device mount %{private}@.");
        __os_log_helper_1_3_2_8_32_8_65(v12, (uint64_t)v10, (uint64_t)v36);
        _LPLogPack(1, v13);
      }

      else
      {
        int v9 = v34;
        if (fs_snapshot_create( v34, (const char *)[location[0] fileSystemRepresentation], 0))
        {
          int v33 = *__error();
          if (v37) {
            id *v37 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v33,  0LL);
          }
          uint64_t v21 = _os_log_pack_size(18LL);
          NSErrorDomain v20 = v6;
          uint64_t v19 = v21;
          uint64_t v18 = (uint64_t)v6 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v17 = _os_log_pack_fill( v18,  v21,  0LL,  &_mh_execute_header,  "create snapshot operation failed: %d %s",  LODWORD(v6[0]),  v6[1]);
          uint64_t v8 = v17;
          int v7 = v33;
          int v4 = strerror(v33);
          __os_log_helper_1_2_2_4_0_8_32(v8, v7, (uint64_t)v4);
          _LPLogPack(1, v18);
        }

        else
        {
          char v35 = 1;
        }

        close(v34);
      }

      char v40 = v35 & 1;
      int v27 = 1;
    }

    else
    {
      if (v37) {
        id *v37 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      }
      uint64_t v26 = _os_log_pack_size(12LL);
      id v25 = v6;
      uint64_t v24 = v26;
      uint64_t v23 = (uint64_t)v6 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill(v23, v26, 0LL, &_mh_execute_header, "%s : Could not open device is not mounted.", v6[0]);
      __os_log_helper_1_2_1_8_32(v22, (uint64_t)v10);
      _LPLogPack(1, v23);
      char v40 = 0;
      int v27 = 1;
    }
  }

  else
  {
    if (v37) {
      id *v37 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v32 = _os_log_pack_size(12LL);
    uint64_t v31 = v6;
    uint64_t v30 = v32;
    uint64_t v29 = (uint64_t)v6 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v28 = _os_log_pack_fill(v29, v32, 0LL, &_mh_execute_header, "%s : Need a valid snapshot name.", v6[0]);
    __os_log_helper_1_2_1_8_32(v28, (uint64_t)v10);
    _LPLogPack(1, v29);
    char v40 = 0;
    int v27 = 1;
  }

  v6[0] = 0LL;
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, (id)v6[0]);
  return v40 & 1;
}

- (BOOL)deleteSnapshots:(id)a3 waitForDeletionFor:(double)a4 error:(id *)a5
{
  double v29 = a4;
  uint64_t v30 = a5;
  uint64_t v27 = 0LL;
  uint64_t v28 = "-[LPAPFSVolume deleteSnapshots:waitForDeletionFor:error:]";
  uint64_t v67 = self;
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
            int v15 = &OBJC_CLASS___NSError;
            NSErrorDomain v14 = NSPOSIXErrorDomain;
            *int v64 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
          }

          uint64_t v35 = _os_log_pack_size(18LL);
          int v34 = &v11;
          uint64_t v33 = v35;
          uint64_t v32 = (uint64_t)&v11 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v31 = _os_log_pack_fill( v32,  v35,  0LL,  &_mh_execute_header,  "%s : Failed to open media for snapshot delete: %d",  v11,  (_DWORD)v12);
          uint64_t v13 = v31;
          int v9 = __error();
          __os_log_helper_1_2_2_8_32_4_0(v13, (uint64_t)v28, *v9);
          _LPLogPack(1, v32);
        }

        else
        {
          uint64_t v24 = v47;
          memset(v47, 0, sizeof(v47));
          id v25 = location[0];
          id v26 = [v25 countByEnumeratingWithState:v47 objects:v69 count:16];
          if (v26)
          {
            uint64_t v21 = *(void *)v47[2];
            uint64_t v22 = v27;
            unint64_t v23 = (unint64_t)v26;
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
              uint64_t v5 = (const char *)[v48 fileSystemRepresentation];
              if (fs_snapshot_delete(v18, v5, 0))
              {
                int v49 = *__error();
                uint64_t v46 = 0LL;
                uint64_t v46 = _os_log_pack_size(28LL);
                uint64_t v45 = &v11;
                uint64_t v44 = v46;
                uint64_t v43 = (uint64_t)&v11 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                uint64_t v42 = _os_log_pack_fill( v43,  v46,  0LL,  &_mh_execute_header,  "%s : Failed to delete snapshot: %{private}@, %d");
                uint64_t v17 = v42;
                uint64_t v16 = (uint64_t)v48;
                uint64_t v6 = __error();
                __os_log_helper_1_3_3_8_32_8_65_4_0(v17, (uint64_t)v28, v16, *v6);
                _LPLogPack(1, v43);
              }

              else
              {
                char v62 = 1;
              }

              uint64_t v22 = v20 + 1;
              unint64_t v23 = v19;
              if (v20 + 1 >= v19)
              {
                id v7 = [v25 countByEnumeratingWithState:v47 objects:v69 count:16];
                uint64_t v22 = v27;
                unint64_t v23 = (unint64_t)v7;
                if (!v7) {
                  break;
                }
              }
            }
          }

          if (v49 && v64)
          {
            uint64_t v8 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v49,  0LL);
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
              uint64_t v40 = _os_log_pack_size(12LL);
              char v39 = &v11;
              uint64_t v38 = v40;
              uint64_t v37 = (uint64_t)&v11 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v36 = _os_log_pack_fill( v37,  v40,  0LL,  &_mh_execute_header,  "%s : Waiting for snapshots to delete timed out",  v11);
              __os_log_helper_1_2_1_8_32(v36, (uint64_t)v28);
              _LPLogPack(1, v37);
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
          *int v64 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
        }
        uint64_t v54 = _os_log_pack_size(12LL);
        v53 = &v11;
        uint64_t v52 = v54;
        uint64_t v51 = (uint64_t)&v11 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v50 = _os_log_pack_fill(v51, v54, 0LL, &_mh_execute_header, "%s : Could not open device is not mounted.", v11);
        __os_log_helper_1_2_1_8_32(v50, (uint64_t)v28);
        _LPLogPack(1, v51);
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
      *int v64 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v60 = _os_log_pack_size(12LL);
    uint64_t v59 = &v11;
    uint64_t v58 = v60;
    uint64_t v57 = (uint64_t)&v11 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v56 = _os_log_pack_fill(v57, v60, 0LL, &_mh_execute_header, "%s : Need a valid snapshot names.", v11);
    __os_log_helper_1_2_1_8_32(v56, (uint64_t)v28);
    _LPLogPack(1, v57);
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
  NSErrorDomain v14 = a5;
  id v12 = "-[LPAPFSVolume renameSnapshot:to:error:]";
  id v48 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v46 = 0LL;
  objc_storeStrong(&v46, obj);
  uint64_t v45 = v14;
  id v44 = -[LPMedia mountPoint](v48, "mountPoint");
  char v43 = 0;
  int v42 = -1;
  int v41 = 0;
  if (location[0] && [location[0] length])
  {
    if (v46 && [v46 length])
    {
      if (v44)
      {
        int v42 = open((const char *)[v44 fileSystemRepresentation], 0);
        if (v42 < 0)
        {
          if (v45)
          {
            v7[3] = (const char *)&OBJC_CLASS___NSError;
            v7[2] = (const char *)NSPOSIXErrorDomain;
            *uint64_t v45 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
          }

          uint64_t v19 = _os_log_pack_size(22LL);
          int v18 = v7;
          uint64_t v17 = v19;
          uint64_t v16 = (uint64_t)v7 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v15 = _os_log_pack_fill(v16, v19, 0LL, &_mh_execute_header, "%s : Could not open device mount %{private}@.");
          __os_log_helper_1_3_2_8_32_8_65(v15, (uint64_t)v12, (uint64_t)v44);
          _LPLogPack(1, v16);
        }

        else
        {
          int v11 = v42;
          id v10 = (const char *)[location[0] fileSystemRepresentation];
          if (fs_snapshot_rename( v42, v10, (const char *)[v46 fileSystemRepresentation], 0))
          {
            int v41 = *__error();
            if (v45) {
              *uint64_t v45 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v41,  0LL);
            }
            uint64_t v24 = _os_log_pack_size(18LL);
            unint64_t v23 = v7;
            uint64_t v22 = v24;
            uint64_t v21 = (uint64_t)v7 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v20 = _os_log_pack_fill( v21,  v24,  0LL,  &_mh_execute_header,  "rename snapshot operation failed: %d %s",  LODWORD(v7[0]),  v7[1]);
            uint64_t v9 = v20;
            int v8 = v41;
            uint64_t v5 = strerror(v41);
            __os_log_helper_1_2_2_4_0_8_32(v9, v8, (uint64_t)v5);
            _LPLogPack(1, v21);
          }

          else
          {
            char v43 = 1;
          }

          close(v42);
        }

        char v49 = v43 & 1;
        int v35 = 1;
      }

      else
      {
        if (v45) {
          *uint64_t v45 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
        }
        uint64_t v29 = _os_log_pack_size(12LL);
        uint64_t v28 = v7;
        uint64_t v27 = v29;
        uint64_t v26 = (uint64_t)v7 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v25 = _os_log_pack_fill(v26, v29, 0LL, &_mh_execute_header, "%s : Could not open device is not mounted.", v7[0]);
        __os_log_helper_1_2_1_8_32(v25, (uint64_t)v12);
        _LPLogPack(1, v26);
        char v49 = 0;
        int v35 = 1;
      }
    }

    else
    {
      if (v45) {
        *uint64_t v45 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      }
      uint64_t v34 = _os_log_pack_size(12LL);
      uint64_t v33 = v7;
      uint64_t v32 = v34;
      uint64_t v31 = (uint64_t)v7 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v30 = _os_log_pack_fill(v31, v34, 0LL, &_mh_execute_header, "%s : Need a valid new snapshot name.", v7[0]);
      __os_log_helper_1_2_1_8_32(v30, (uint64_t)v12);
      _LPLogPack(1, v31);
      char v49 = 0;
      int v35 = 1;
    }
  }

  else
  {
    if (v45) {
      *uint64_t v45 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v40 = _os_log_pack_size(12LL);
    char v39 = v7;
    uint64_t v38 = v40;
    uint64_t v37 = (uint64_t)v7 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v36 = _os_log_pack_fill(v37, v40, 0LL, &_mh_execute_header, "%s : Need a valid snapshot name.", v7[0]);
    __os_log_helper_1_2_1_8_32(v36, (uint64_t)v12);
    _LPLogPack(1, v37);
    char v49 = 0;
    int v35 = 1;
  }

  v7[0] = 0LL;
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v46, (id)v7[0]);
  objc_storeStrong(location, (id)v7[0]);
  return v49 & 1;
}

- (BOOL)revertToSnapshot:(id)a3 error:(id *)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v6 = -[LPAPFSVolume revertToSnapshot:options:error:](v8, "revertToSnapshot:options:error:", location[0], 0LL, a4);
  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

- (BOOL)revertToSnapshot:(id)a3 options:(id)a4 error:(id *)a5
{
  id obj = a4;
  uint64_t v20 = a5;
  int v18 = "-[LPAPFSVolume revertToSnapshot:options:error:]";
  double v65 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v63 = 0LL;
  objc_storeStrong(&v63, obj);
  char v62 = v20;
  id v61 = -[LPMedia mountPoint](v65, "mountPoint");
  char v60 = 1;
  int v59 = -1;
  int v58 = 0;
  if (location[0] && [location[0] length])
  {
    if (v61)
    {
      int v59 = open((const char *)[v61 fileSystemRepresentation], 0);
      if (v59 < 0)
      {
        if (v62)
        {
          id v12 = &OBJC_CLASS___NSError;
          NSErrorDomain v11 = NSPOSIXErrorDomain;
          *char v62 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        }

        uint64_t v25 = _os_log_pack_size(22LL);
        uint64_t v24 = &v9;
        uint64_t v23 = v25;
        uint64_t v22 = (uint64_t)&v9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v21 = _os_log_pack_fill(v22, v25, 0LL, &_mh_execute_header, "%s : Could not open device mount %{private}@.");
        __os_log_helper_1_3_2_8_32_8_65(v21, (uint64_t)v18, (uint64_t)v61);
        _LPLogPack(1, v22);
      }

      else
      {
        int v17 = v59;
        if (fs_snapshot_revert( v59, (const char *)[location[0] fileSystemRepresentation], 0))
        {
          char v60 = 0;
          int v58 = *__error();
          if (v62) {
            *char v62 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v58,  0LL);
          }
          uint64_t v46 = _os_log_pack_size(18LL);
          uint64_t v45 = &v9;
          uint64_t v44 = v46;
          uint64_t v43 = (uint64_t)&v9 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v42 = _os_log_pack_fill( v43,  v46,  0LL,  &_mh_execute_header,  "revert snapshot operation failed: %d %s",  (_DWORD)v9,  v10);
          uint64_t v16 = v42;
          int v15 = v58;
          uint64_t v5 = strerror(v58);
          __os_log_helper_1_2_2_4_0_8_32(v16, v15, (uint64_t)v5);
          _LPLogPack(1, v43);
        }

        close(v59);
        id v41 = 0LL;
        id v41 = [v63 objectForKeyedSubscript:LPAPFSVolumeRevertOptionSkipRemount[0]];
        if ([v41 BOOLValue])
        {
          uint64_t v40 = 0LL;
          uint64_t v40 = _os_log_pack_size(22LL);
          char v39 = &v9;
          uint64_t v38 = v40;
          uint64_t v37 = (uint64_t)&v9 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v36 = _os_log_pack_fill(v37, v40, 0LL, &_mh_execute_header, "%s: Skipping unmount/remount of %@");
          __os_log_helper_1_2_2_8_32_8_64(v36, (uint64_t)v18, (uint64_t)v61);
          _LPLogPack(2, v37);
        }

        else if (-[LPAPFSVolume unmountWithError:](v65, "unmountWithError:", v62))
        {
          if (-[LPAPFSVolume mountAtPath:options:error:](v65, "mountAtPath:options:error:", v61, v63, v62))
          {
            char v60 = 1;
          }

          else
          {
            uint64_t v35 = 0LL;
            uint64_t v35 = _os_log_pack_size(18LL);
            uint64_t v34 = &v9;
            uint64_t v33 = v35;
            uint64_t v32 = (uint64_t)&v9 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v31 = _os_log_pack_fill( v32,  v35,  0LL,  &_mh_execute_header,  "%s: Failed to remount volume with error: %d",  v9,  (_DWORD)v10);
            uint64_t v14 = v31;
            unsigned __int8 v6 = __error();
            __os_log_helper_1_2_2_8_32_4_0(v14, (uint64_t)v18, *v6);
            _LPLogPack(1, v32);
            char v60 = 0;
          }
        }

        else
        {
          uint64_t v30 = 0LL;
          uint64_t v30 = _os_log_pack_size(18LL);
          uint64_t v29 = &v9;
          uint64_t v28 = v30;
          uint64_t v27 = (uint64_t)&v9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v26 = _os_log_pack_fill( v27,  v30,  0LL,  &_mh_execute_header,  "%s: Failed to unmount volume with error: %d",  v9,  (_DWORD)v10);
          uint64_t v13 = v26;
          id v7 = __error();
          __os_log_helper_1_2_2_8_32_4_0(v13, (uint64_t)v18, *v7);
          _LPLogPack(1, v27);
          char v60 = 0;
        }

        objc_storeStrong(&v41, 0LL);
      }

      char v66 = v60 & 1;
      int v52 = 1;
    }

    else
    {
      if (v62) {
        *char v62 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      }
      uint64_t v51 = _os_log_pack_size(12LL);
      uint64_t v50 = &v9;
      uint64_t v49 = v51;
      uint64_t v48 = (uint64_t)&v9 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v47 = _os_log_pack_fill(v48, v51, 0LL, &_mh_execute_header, "%s : Could not open device is not mounted.", v9);
      __os_log_helper_1_2_1_8_32(v47, (uint64_t)v18);
      _LPLogPack(1, v48);
      char v66 = 0;
      int v52 = 1;
    }
  }

  else
  {
    if (v62) {
      *char v62 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
    }
    uint64_t v57 = _os_log_pack_size(12LL);
    uint64_t v56 = &v9;
    uint64_t v55 = v57;
    uint64_t v54 = (uint64_t)&v9 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v53 = _os_log_pack_fill(v54, v57, 0LL, &_mh_execute_header, "%s : Need a valid new snapshot name.", v9);
    __os_log_helper_1_2_1_8_32(v53, (uint64_t)v18);
    _LPLogPack(1, v54);
    char v66 = 0;
    int v52 = 1;
  }

  uint64_t v9 = 0LL;
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v63, v9);
  objc_storeStrong(location, v9);
  return v66 & 1;
}

- (BOOL)rootToSnapshot:(id)a3 error:(id *)a4
{
  uint64_t v13 = a4;
  id v12 = "-[LPAPFSVolume rootToSnapshot:error:]";
  uint64_t v47 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v45 = v13;
  uint64_t v44 = _os_log_pack_size(12LL);
  uint64_t v43 = &v8;
  uint64_t v42 = v44;
  uint64_t v41 = (uint64_t)&v8 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = _os_log_pack_fill(v41, v44, 0LL, &_mh_execute_header, "%s: Trying to determine mount point\n", v8);
  __os_log_helper_1_2_1_8_32(v40, (uint64_t)v12);
  _LPLogPack(3, v41);
  id v39 = 0LL;
  id v39 = -[LPMedia mountPoint](v47, "mountPoint");
  char v38 = 1;
  unsigned int v37 = -1;
  int v36 = 0;
  uint64_t v35 = 0LL;
  if (location[0] && [location[0] length]) {
    uint64_t v35 = (const char *)[location[0] fileSystemRepresentation];
  }
  else {
    uint64_t v35 = "";
  }
  if (v39)
  {
    uint64_t v28 = 0LL;
    uint64_t v28 = _os_log_pack_size(22LL);
    uint64_t v27 = &v8;
    uint64_t v26 = v28;
    uint64_t v25 = (uint64_t)&v8 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v24 = _os_log_pack_fill(v25, v28, 0LL, &_mh_execute_header, "%s: Mount point is %{private}@\n");
    __os_log_helper_1_3_2_8_32_8_65(v24, (uint64_t)v12, (uint64_t)v39);
    _LPLogPack(3, v25);
    unsigned int v37 = open((const char *)[v39 fileSystemRepresentation], 0);
    if ((v37 & 0x80000000) != 0)
    {
      char v38 = 0;
      if (v45)
      {
        NSErrorDomain v11 = &OBJC_CLASS___NSError;
        NSErrorDomain v10 = NSPOSIXErrorDomain;
        unsigned __int8 v6 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        *uint64_t v45 = v6;
      }

      uint64_t v18 = 0LL;
      uint64_t v18 = _os_log_pack_size(22LL);
      int v17 = &v8;
      uint64_t v16 = v18;
      uint64_t v15 = (uint64_t)&v8 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill(v15, v18, 0LL, &_mh_execute_header, "%s : Could not open device mount %{private}@.");
      __os_log_helper_1_3_2_8_32_8_65(v14, (uint64_t)v12, (uint64_t)v39);
      _LPLogPack(1, v15);
    }

    else
    {
      if (fs_snapshot_root(v37, v35, 0LL))
      {
        char v38 = 0;
        int v36 = *__error();
        if (v45)
        {
          uint64_t v5 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v36,  0LL);
          *uint64_t v45 = v5;
        }

        uint64_t v23 = 0LL;
        uint64_t v23 = _os_log_pack_size(18LL);
        uint64_t v22 = &v8;
        uint64_t v21 = v23;
        uint64_t v20 = (uint64_t)&v8 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v19 = _os_log_pack_fill( v20,  v23,  0LL,  &_mh_execute_header,  "%s : Could not set root from snapshot. Errno: %d",  v8,  (_DWORD)v9);
        __os_log_helper_1_2_2_8_32_4_0(v19, (uint64_t)v12, v36);
        _LPLogPack(1, v20);
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
      int v4 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL);
      *uint64_t v45 = v4;
    }

    uint64_t v34 = 0LL;
    uint64_t v34 = _os_log_pack_size(12LL);
    uint64_t v33 = &v8;
    uint64_t v32 = v34;
    uint64_t v31 = (uint64_t)&v8 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill(v31, v34, 0LL, &_mh_execute_header, "%s : Could not open device is not mounted.", v8);
    __os_log_helper_1_2_1_8_32(v30, (uint64_t)v12);
    _LPLogPack(1, v31);
    char v48 = 0;
    int v29 = 1;
  }

  id v9 = 0LL;
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, v9);
  return v48 & 1;
}

@end