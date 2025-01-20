@interface SKPartitionTable
+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6;
+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4;
+ (id)partitionIDFromDisk:(id)a3;
- (BOOL)allocateMediaRef:(id *)a3;
- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6;
- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5;
- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4;
- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4;
- (NSMutableArray)partitions;
- (SKDisk)disk;
- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4;
- (__MKMedia)mediaRef;
- (unsigned)sectorSize;
- (void)dealloc;
- (void)flushMediaRef;
- (void)setDisk:(id)a3;
- (void)setMediaRef:(__MKMedia *)a3;
- (void)setPartitions:(id)a3;
- (void)setSectorSize:(unsigned int)a3;
@end

@implementation SKPartitionTable

+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diskIdentifier]);
  id v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/r%@", v6));
  id v8 = [v7 fileSystemRepresentation];

  v23[0] = @"Writable";
  v23[1] = @"Shared Writer";
  v24[0] = &__kCFBooleanTrue;
  v24[1] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  v10 = (__MKMedia *)MKMediaCreateWithPath(kCFAllocatorDefault, v8, v9, &v16);
  if (v10) {
    BOOL v11 = v16 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    id v12 = sub_10000E2BC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 1024;
      unsigned int v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Failed to create media ref with disk %@, MK err %d",  buf,  0x1Cu);
    }

    id v14 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", v16, a4);
    v10 = 0LL;
  }

  return v10;
}

- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SKPartitionTable;
  id v7 = -[SKPartitionTable init](&v25, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 wholeDiskForDisk:v6]);

    if (!v11)
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
      if ((objc_opt_isKindOfClass(v6, v20) & 1) == 0) {
        goto LABEL_11;
      }
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 container]);
      if (!v11) {
        goto LABEL_11;
      }
    }

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 designatedPhysicalStore]);
      if (!v13)
      {
        v29 = v11;
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v21,  0LL));
        __int16 v19 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue( +[SKError nilWithError:error:]( &OBJC_CLASS___SKError,  "nilWithError:error:",  v23,  a4));

        goto LABEL_16;
      }

      id v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 wholeDiskForDisk:v14]);

      id v6 = v14;
      BOOL v11 = (void *)v16;
      if (!v16)
      {
LABEL_11:
        id v28 = v6;
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v11,  0LL));
        __int16 v19 = (SKPartitionTable *)objc_claimAutoreleasedReturnValue( +[SKError nilWithError:error:]( &OBJC_CLASS___SKError,  "nilWithError:error:",  v21,  a4));
LABEL_16:

        goto LABEL_17;
      }
    }

    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = [v11 getSectorSize];
    v17 = (void *)objc_opt_class(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](v7, "disk"));
    v7->_mediaRef = (__MKMedia *)[v17 createMediaRefWithDisk:v18 error:a4];

    if (!v7->_mediaRef)
    {
      id v22 = sub_10000E2BC();
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "%s: Failed to create media ref",  buf,  0xCu);
      }

      __int16 v19 = 0LL;
      goto LABEL_16;
    }
  }

  __int16 v19 = v7;
LABEL_17:

  return v19;
}

- (void)dealloc
{
  mediaRef = self->_mediaRef;
  if (mediaRef) {
    CFRelease(mediaRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKPartitionTable;
  -[SKPartitionTable dealloc](&v4, "dealloc");
}

- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4
{
  id v6 = a3;
  int v22 = 0;
  uint64_t v21 = 0LL;
  uint64_t v7 = MKCFCreateMedia(&v21, &v22);
  if (!v7 || v22)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v14 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000455B0];

    id v15 = sub_10000E2BC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v25 = 1024;
      int v26 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "%s: Failed to create media, MK err %d",  buf,  0x12u);
    }

    goto LABEL_16;
  }

  uint64_t v8 = v7;
  if (a4) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = 16;
  }
  if (a4 == 1) {
    uint64_t v10 = 8LL;
  }
  else {
    uint64_t v10 = v9;
  }
  MKCFCreateMap( v10,  v21,  v6,  0LL,  0x1000 / -[SKPartitionTable sectorSize](self, "sectorSize"),  -[SKPartitionTable sectorSize](self, "sectorSize"),  0LL,  &off_100047AB0,  -[SKPartitionTable mediaRef](self, "mediaRef"),  &v22);
  if (v22)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000455D0];

    id v12 = sub_10000E2BC();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v25 = 1024;
      int v26 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "%s: Failed to create partition map, MK err %d",  buf,  0x12u);
    }

    MKCFDisposeMedia(v8);
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }

  int v22 = MKCFWriteMedia(v8, v6, 0LL, 0LL, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v22)
  {
    id v19 = sub_10000E2BC();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v25 = 1024;
      int v26 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to write scheme, MK err %d",  buf,  0x12u);
    }
  }

  MKCFDisposeMedia(v8);
  BOOL v17 = v22 == 0;
LABEL_17:

  return v17;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:size:",  a3,  a4,  *(void *)&a5,  0LL);
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  unsigned __int16 v7 = a5;
  id v10 = a3;
  int v27 = 0;
  BOOL v11 = (const __CFDictionary *)MKCFReadMedia(&off_100047AD8, -[SKPartitionTable mediaRef](self, "mediaRef"), &v27);
  if (!v11 || v27)
  {
    id v18 = sub_10000E2BC();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v30 = 1024;
      int v31 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to read media, MK err %d",  buf,  0x12u);
    }

    goto LABEL_14;
  }

  id v12 = v11;
  Value = (const __CFArray *)CFDictionaryGetValue(v11, @"Schemes");
  MKCFCreateMap( v7,  Value,  v10,  0LL,  1LL,  -[SKPartitionTable sectorSize](self, "sectorSize"),  a6,  a4,  -[SKPartitionTable mediaRef](self, "mediaRef"),  &v27);
  if (v27)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v14 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000455F0];

    id v15 = sub_10000E2BC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v30 = 1024;
      int v31 = v27;
      BOOL v17 = "%s: Failed to create partition map, MK err %d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, buf, 0x12u);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  ValueAtIndex = CFArrayGetValueAtIndex(Value, 1LL);
  int v27 = MKCFUpdateScheme(ValueAtIndex, 0LL, 1LL, 0LL, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v27)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v21 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100045610];

    id v22 = sub_10000E2BC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v30 = 1024;
      int v31 = v27;
      BOOL v17 = "%s: Failed to update scheme, MK err %d";
      goto LABEL_12;
    }

- (void)flushMediaRef
{
  if (-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    CFRelease(-[SKPartitionTable mediaRef](self, "mediaRef"));
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", 0LL);
  }

- (BOOL)allocateMediaRef:(id *)a3
{
  if (!-[SKPartitionTable mediaRef](self, "mediaRef"))
  {
    id v5 = (void *)objc_opt_class(self);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", [v5 createMediaRefWithDisk:v6 error:a3]);
  }

  return -[SKPartitionTable mediaRef](self, "mediaRef") != 0LL;
}

- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4
{
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4)) {
    return 0;
  }
  unsigned __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
  unsigned int v8 = [v7 wipeDiskWithError:a4];

  if (!v8) {
    return 0;
  }
  id v10 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v9);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable partitions](self, "partitions", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    if (a3) {
      unsigned int v15 = 1;
    }
    else {
      unsigned int v15 = 16;
    }
    if (a3 == 1) {
      uint64_t v16 = 8LL;
    }
    else {
      uint64_t v16 = v15;
    }
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v28 + 1) + 8 * (void)i),  "buildWithScheme:sectorSize:",  v16,  -[SKPartitionTable sectorSize](self, "sectorSize")));
        if (!v18)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
          v37 = v21;
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v37,  1LL));
          uint64_t v23 = 300LL;
          goto LABEL_23;
        }

        id v19 = (void *)v18;
        [v10 addObject:v18];
      }

      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v35 = @"Partitions";
  v36 = v10;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  if (-[SKPartitionTable writeNewMediaLayout:partitionScheme:](self, "writeNewMediaLayout:partitionScheme:", v11, a3))
  {
    -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
    unsigned __int8 v20 = 1;
  }

  else
  {
    id v24 = sub_10000E2BC();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    v32 = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    uint64_t v23 = 114LL;
LABEL_23:
    int v26 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  v23,  v22,  0LL));
    unsigned __int8 v20 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v26, a4);
  }

  return v20;
}

+ (id)partitionIDFromDisk:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_alloc(&OBJC_CLASS___SKIOMedia);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 diskIdentifier]);

  id v6 = -[SKIOMedia initWithDevName:](v4, "initWithDevName:", v5);
  id v7 = -[SKIOObject copyPropertyWithClass:key:]( v6,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSNumber),  @"Partition ID");

  return v7;
}

+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Partition ID"]);
        unsigned int v18 = [v17 isEqual:v9];

        if (v18)
        {
          [v16 setObject:v10 forKeyedSubscript:@"Type"];
          unsigned __int8 v20 = 1;
          id v19 = v11;
          goto LABEL_11;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't find partition with ID %@",  v9));
  unsigned __int8 v20 = +[SKError failWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:debugDescription:error:",  117LL,  v19,  a6);
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a5))
  {
    int v33 = 0;
    uint64_t v10 = MKCFReadMedia(&off_100047B00, -[SKPartitionTable mediaRef](self, "mediaRef"), &v33);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (!v11 || v33)
    {
      id v22 = sub_10000E2BC();
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        __int16 v37 = 1024;
        int v38 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s: Failed to read media, MK err %d",  buf,  0x12u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v33,  0LL));
      unsigned __int8 v21 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v13, a5);
      goto LABEL_18;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Schemes"]);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"Sections"]);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndexedSubscript:0]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"Partitions"]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 type]);
    int v17 = sub_100022E9C(v16);

    if (v17 == 512)
    {
      MKCFDisposeMedia(v12);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      v34 = v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v19,  0LL));
      unsigned __int8 v21 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v20, a5);
    }

    else
    {
      __int128 v24 = (void *)objc_opt_class(self);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 contentMask]);
      LODWORD(v24) = [v24 updatePartitionTypeWithPartitions:v14 partID:v8 newType:v25 error:a5];

      if ((_DWORD)v24)
      {
        int v33 = MKCFWriteMedia(v12, 0LL, 0LL, &off_100047B28, -[SKPartitionTable mediaRef](self, "mediaRef"));
        MKCFDisposeMedia(v12);
        int v27 = v31;
        __int128 v26 = v32;
        if (v33)
        {
          unsigned __int8 v21 = +[SKError failWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:debugDescription:error:",  114LL,  @"Failed to overwrite existing partition",  a5);
        }

        else
        {
          -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
          unsigned __int8 v21 = 1;
        }

        __int128 v28 = v30;
        goto LABEL_17;
      }

      unsigned __int8 v21 = 0;
    }

    __int128 v28 = v30;
    int v27 = v31;
    __int128 v26 = v32;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }

  unsigned __int8 v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  if (!-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a4)) {
    return 0;
  }
  int v28 = 0;
  uint64_t v7 = MKCFReadMedia(&off_100047B50, -[SKPartitionTable mediaRef](self, "mediaRef"), &v28);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8 || v28)
  {
    id v16 = sub_10000E2BC();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKPartitionTable fitToContainerSize:error:]";
      __int16 v33 = 1024;
      int v34 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed to read media, MK err %d",  buf,  0x12u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v28,  0LL));
    unsigned __int8 v15 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v12, a4);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 type]);
    uint64_t v11 = sub_100022E9C(v10);

    if ((_DWORD)v11 == 512)
    {
      MKCFDisposeMedia(v8);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      __int128 v30 = v12;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v13,  0LL));
      unsigned __int8 v15 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v14, a4);
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Schemes"]);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Sections"]);
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
      unsigned __int8 v21 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:size:",  v20,  &off_100047B78,  v11,  a3 / -[SKPartitionTable sectorSize](self, "sectorSize"));
      MKCFDisposeMedia(v8);
      if ((v21 & 1) != 0)
      {
        -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
        unsigned __int8 v15 = 1;
      }

      else
      {
        id v22 = sub_10000E2BC();
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s: Failed to fit existing partition",  buf,  0xCu);
        }

        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
        __int128 v29 = v24;
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  114LL,  v25,  0LL));
        unsigned __int8 v15 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v26, a4);
      }
    }
  }

  return v15;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v54 = a3;
  if (-[SKPartitionTable allocateMediaRef:](self, "allocateMediaRef:", a6))
  {
    int v59 = 0;
    uint64_t v8 = MKCFReadMedia(&off_100047BA0, -[SKPartitionTable mediaRef](self, "mediaRef"), &v59);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = v9;
    if (!v9 || v59)
    {
      id v23 = sub_10000E2BC();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        __int16 v67 = 1024;
        int v68 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to read media, MK err %d",  buf,  0x12u);
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v59,  0LL));
      unsigned __int8 v22 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v11, a6);
      goto LABEL_27;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Schemes"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Sections"]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"Partitions"]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 type]);
    unsigned int v17 = sub_100022E9C(v16);

    v51 = v14;
    if (v17 == 512)
    {
      MKCFDisposeMedia(v10);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
      v64 = v19;
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v20,  0LL));
      unsigned __int8 v22 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v21, a6);
    }

    else
    {
      unsigned int v48 = v17;
      v45 = v13;
      v46 = v12;
      v47 = v11;
      v44 = a6;
      v49 = v10;
      id v19 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v18);
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v25 = v14;
      id v26 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v56;
        do
        {
          for (i = 0LL; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v56 != v28) {
              objc_enumerationMutation(v25);
            }
            __int128 v30 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
            id v31 = [v30 mutableCopy];
            v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"Partition ID"]);
            unsigned int v33 = [v32 isEqualToNumber:v54];

            if (v33)
            {
              int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4 / -[SKPartitionTable sectorSize](self, "sectorSize")));
              [v31 setObject:v34 forKeyedSubscript:@"Size"];

              if (a5)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a5 / -[SKPartitionTable sectorSize](self, "sectorSize")));
                [v31 setObject:v35 forKeyedSubscript:@"Offset"];
              }
            }

            [v19 addObject:v31];
          }

          id v27 = [v25 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }

        while (v27);
      }

      v61 = @"Partitions";
      v62 = v19;
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      unsigned __int8 v36 = -[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:]( self,  "overwriteExistingMediaLayout:opts:partitionScheme:",  v20,  &off_100047BC8,  v48);
      uint64_t v10 = v49;
      MKCFDisposeMedia(v49);
      if ((v36 & 1) == 0)
      {
        id v38 = sub_10000E2BC();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        id v13 = v45;
        __int16 v37 = v50;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v66 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s: Failed to overwrite existing partition",  buf,  0xCu);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionTable disk](self, "disk"));
        v60 = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  114LL,  v41,  0LL));
        unsigned __int8 v22 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v42, v44);

        id v12 = v46;
        uint64_t v11 = v47;
        goto LABEL_26;
      }

      -[SKPartitionTable flushMediaRef](self, "flushMediaRef");
      unsigned __int8 v22 = 1;
      uint64_t v11 = v47;
      id v13 = v45;
    }

    __int16 v37 = v50;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }

  unsigned __int8 v22 = 0;
LABEL_28:

  return v22;
}

- (NSMutableArray)partitions
{
  return self->_partitions;
}

- (void)setPartitions:(id)a3
{
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDisk:(id)a3
{
}

- (unsigned)sectorSize
{
  return self->_sectorSize;
}

- (void)setSectorSize:(unsigned int)a3
{
  self->_sectorSize = a3;
}

- (__MKMedia)mediaRef
{
  return self->_mediaRef;
}

- (void)setMediaRef:(__MKMedia *)a3
{
  self->_mediaRef = a3;
}

- (void).cxx_destruct
{
}

@end