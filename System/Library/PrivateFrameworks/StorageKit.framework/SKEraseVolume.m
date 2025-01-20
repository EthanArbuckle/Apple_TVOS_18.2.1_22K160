@interface SKEraseVolume
+ (BOOL)supportsSecureCoding;
+ (id)eraseVolumeWithAPFSContainerDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithAPFSStoreDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithChildDisk:(id)a3 error:(id *)a4;
- (BOOL)forceUnmount;
- (NSDictionary)diskRepresentation;
- (NSString)description;
- (SKDisk)disk;
- (SKEraseVolume)initWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
- (SKEraseVolume)initWithCoder:(id)a3;
- (SKProgress)progress;
- (SKVolumeDescriptor)descriptor;
- (id)eraseProgressReportingWithCompletionBlock:(id)a3;
- (id)formattableFilesystems;
- (id)validateWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseWithCompletionBlock:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDisk:(id)a3;
- (void)setDiskRepresentation:(id)a3;
- (void)setForceUnmount:(BOOL)a3;
- (void)setProgress:(id)a3;
@end

@implementation SKEraseVolume

- (SKEraseVolume)initWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SKEraseVolume;
  v11 = -[SKEraseVolume init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      v13 = -[SKEraseVolume formattableFilesystems](v12, "formattableFilesystems");
      v14 = -[SKEraseVolume formattableFilesystems](v12, "formattableFilesystems");
      [v14 firstObject];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [v9 filesystem];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x1896079C8];
        v28[0] = MEMORY[0x1895F87A8];
        v28[1] = 3221225472LL;
        v28[2] = __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke;
        v28[3] = &unk_18A323808;
        id v29 = v9;
        [v17 predicateWithBlock:v28];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 filteredArrayUsingPredicate:v18];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v19 count])
        {
          uint64_t v20 = [v19 firstObject];

          v15 = (void *)v20;
        }
      }

      [v9 volumeName];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKVolumeDescriptor descriptorWithName:filesystem:]( &OBJC_CLASS___SKVolumeDescriptor,  "descriptorWithName:filesystem:",  v21,  v15);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_storeStrong((id *)&v12->_descriptor, v10);
    uint64_t v22 = [v9 minimalDictionaryRepresentation];
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v22;

    uint64_t v24 = +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v24;
  }

  -[SKEraseVolume validateWithError:](v12, "validateWithError:", a5);
  v26 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 majorType];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) filesystem];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 majorType];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:v6])
  {
    int v7 = [v3 isCaseSensitive];
    [*(id *)(a1 + 32) filesystem];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == [v8 isCaseSensitive])
    {
      int v10 = [v3 isEncrypted];
      [*(id *)(a1 + 32) filesystem];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v10 ^ [v11 isEncrypted] ^ 1;
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v9 = v7;
  [v9 container];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || ([v10 volumes],
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        unint64_t v13 = [v12 count],
        v12,
        v13 < 2))
  {

LABEL_8:
    v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v7 descriptor:v8 error:a5];
    goto LABEL_9;
  }

  SKGetOSLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    uint64_t v20 = "+[SKEraseVolume eraseVolumeWithChildDisk:descriptor:error:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( &dword_188F75000,  v14,  OS_LOG_TYPE_ERROR,  "%s: More than 1 volume on %@ physical store",  (uint8_t *)&v19,  0x16u);
  }

  [v11 volumes];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  301LL,  v15,  MEMORY[0x189604A60]);
  v17 = +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v16, a5);
LABEL_9:
  return v17;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v5 descriptor:0 error:a4];

  return v6;
}

+ (id)eraseVolumeWithAPFSStoreDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v8 descriptor:v7 error:a5];

  return v9;
}

+ (id)eraseVolumeWithAPFSContainerDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 designatedPhysicalStore];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    int v10 = (void *)objc_opt_class();
    [v7 designatedPhysicalStore];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 eraseVolumeWithAPFSStoreDisk:v11 descriptor:v8 error:a5];
  }

  else
  {
    v11 = +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 117LL, 0LL);
    +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v11, a5);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setDisk:(id)a3
{
  id v7 = a3;
  [v7 minimalDictionaryRepresentation];
  id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  diskRepresentation = self->_diskRepresentation;
  self->_diskRepresentation = v5;
}

- (void)eraseWithCompletionBlock:(id)a3
{
}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setCancellable:0];
  v6 = -[SKEraseVolume descriptor](self, "descriptor");
  char v7 = [v6 validateForErase];

  if ((v7 & 1) != 0)
  {
    v19[0] = kSKAPFSDiskUnmountIgnoreGroup;
    v19[1] = @"kSKDiskMountOptionRecursive";
    v20[0] = MEMORY[0x189604A88];
    v20[1] = MEMORY[0x189604A88];
    v19[2] = @"kSKDiskMountOptionForce";
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKEraseVolume forceUnmount](self, "forceUnmount"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKEraseVolume disk](self, "disk");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke;
    v16[3] = &unk_18A323858;
    id v18 = v4;
    v16[4] = self;
    id v11 = v5;
    id v17 = v11;
    [v10 unmountWithOptions:v9 completionBlock:v16];

    v12 = v17;
    id v13 = v11;
  }

  else
  {
    v14 = +[SKError errorWithPOSIXCode:error:](&OBJC_CLASS___SKError, "errorWithPOSIXCode:error:", 22LL, 0LL);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v14);
  }

  return v5;
}

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    id v9 = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2;
    int v10 = &unk_18A323830;
    id v5 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    [v3 eraseWithEraser:v4 completionBlock:&v7];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 10, v7, v8, v9, v10);
    [*(id *)(a1 + 40) chainChildProgress:v6 withPendingUnitCount:90];
  }

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (!v5)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  MEMORY[0x189604A58],  0LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0LL, v13);

      goto LABEL_13;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v5 container];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 volumes];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 count])
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];

        SKGetOSLog();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315394;
          uint64_t v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke";
          __int16 v21 = 2112;
          uint64_t v22 = v10;
          _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: The new APFS volume is: %@",  (uint8_t *)&v19,  0x16u);
        }

        id v5 = (id)v10;
      }

      else
      {
        if (![v8 isLiveFSAPFSDisk]
          || ([*(id *)(a1 + 32) descriptor],
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              [v14 filesystem],
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isEncrypted],
              v15,
              v14,
              !v16))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          +[SKError errorWithCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithCode:debugDescription:error:",  117LL,  @"No APFS volumes found after erase",  0LL);
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0LL, v18);

          goto LABEL_12;
        }

        SKGetOSLog();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315394;
          uint64_t v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke_2";
          __int16 v21 = 2112;
          uint64_t v22 = (uint64_t)v5;
          _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Volume was formatted to encrypted APFS, returning %@",  (uint8_t *)&v19,  0x16u);
        }
      }
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v7();
LABEL_12:

LABEL_13:
}

- (NSString)description
{
  id v3 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume disk](self, "disk");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume descriptor](self, "descriptor");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { disk: %@, descriptor: %@}>", v5, v6, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SKEraseVolume descriptor](self, "descriptor");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"descriptor"];

  -[SKEraseVolume diskRepresentation](self, "diskRepresentation");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"diskRepresentation"];
}

- (id)formattableFilesystems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  -[SKEraseVolume disk](self, "disk");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isLiveFSAPFSDisk];

  if (!v5)
  {
LABEL_6:
    -[SKEraseVolume disk](self, "disk");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 formattableFilesystems];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  -[SKEraseVolume disk](self, "disk");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v3 hasVolumeSiblings])
  {
LABEL_5:

    goto LABEL_6;
  }

  +[SKFilesystem extensionFilesystems](&OBJC_CLASS___SKFilesystem, "extensionFilesystems");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_115];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 filteredArrayUsingPredicate:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

uint64_t __39__SKEraseVolume_formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isEqualToString:@"apfs"];

  return v3;
}

- (SKEraseVolume)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SKEraseVolume;
  int v5 = -[SKEraseVolume init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x189604010], "setWithObjects:", objc_opt_class(), 0);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SKVolumeDescriptor *)v7;

    v26 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"diskRepresentation"];
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v18;

    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 knownDiskForDictionary:v5->_diskRepresentation];
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v21;

    uint64_t v23 = +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v23;
  }

  return v5;
}

- (id)validateWithError:(id *)a3
{
  v66[3] = *MEMORY[0x1895F89C0];
  -[SKEraseVolume disk](self, "disk");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[SKError nilWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "nilWithPOSIXCode:debugDescription:error:",  22LL,  @"No disk specified",  a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }

  v66[0] = kSKDiskTypeGPTWholeDisk[0];
  v66[1] = kSKDiskTypeMBRWholeDisk[0];
  v66[2] = kSKDiskTypeAPMWholeDisk[0];
  [MEMORY[0x189603F18] arrayWithObjects:v66 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume disk](self, "disk");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = [v9 isMemberOfClass:objc_opt_class()];
  v59 = v8;
  if ((v10 & 1) != 0)
  {
    int v11 = 0;
  }

  else
  {
    -[SKEraseVolume disk](self, "disk");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v3 isMemberOfClass:objc_opt_class()])
    {
      int v11 = 0;
    }

    else
    {
      -[SKEraseVolume disk](self, "disk");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v4 isMemberOfClass:objc_opt_class()] & 1) == 0)
      {

        goto LABEL_36;
      }

      int v11 = 1;
    }
  }

  -[SKEraseVolume disk](self, "disk");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 type];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v8 containsObject:v14];

  if (v11) {
  if ((v10 & 1) == 0)
  }
  {

    if ((v15 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_36:
    v47 = (void *)NSString;
    -[SKEraseVolume disk](self, "disk");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 stringWithFormat:@"Volume %@ not valid for erase", v16];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKError nilWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "nilWithPOSIXCode:debugDescription:error:",  45LL,  v48,  a3);
    objc_super v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

LABEL_50:
    uint64_t v21 = v59;
    goto LABEL_51;
  }

  if (v15) {
    goto LABEL_36;
  }
LABEL_15:
  -[SKEraseVolume disk](self, "disk");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKEraseVolume descriptor](self, "descriptor");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 filesystem];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 majorType];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    char v20 = [v19 isEqualToString:@"apfs"];

    if ((v20 & 1) != 0) {
      goto LABEL_22;
    }
    -[SKEraseVolume disk](self, "disk");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v59;
    if ([v16 hasVolumeSiblings])
    {
      SKGetOSLog();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        [v16 container];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v61 = "-[SKEraseVolume validateWithError:]";
        __int16 v62 = 2112;
        v63 = v23;
        _os_log_impl(&dword_188F75000, v22, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ container", buf, 0x16u);
      }

      [v16 container];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 volumes];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  301LL,  v25,  MEMORY[0x189604A60]);
      +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v26, a3);
      objc_super v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

      goto LABEL_51;
    }
  }

LABEL_22:
  -[SKEraseVolume disk](self, "disk");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = v59;
    goto LABEL_29;
  }
  v28 = -[SKEraseVolume disk](self, "disk");
  int v29 = [v28 isLiveFSAPFSDisk];

  uint64_t v21 = v59;
  if (!v29) {
    goto LABEL_30;
  }
  -[SKEraseVolume disk](self, "disk");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v16 hasVolumeSiblings])
  {
    SKGetOSLog();
    objc_super v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      [v16 container];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v61 = "-[SKEraseVolume validateWithError:]";
      __int16 v62 = 2112;
      v63 = v31;
      _os_log_impl( &dword_188F75000,  v30,  OS_LOG_TYPE_ERROR,  "%s: More than 1 volume on %@ container, erase will be destructive",  buf,  0x16u);
    }
    v32 = +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 301LL, 0LL);
    uint64_t v33 = +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v32, a3);
    goto LABEL_46;
  }

  [v16 container];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v56 designatedPhysicalStore];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKEraseVolume setDisk:](self, "setDisk:", v57);
  v58 = -[SKEraseVolume disk](self, "disk");
  if (v58)
  {
LABEL_29:

LABEL_30:
    v34 = -[SKEraseVolume disk](self, "disk");
    v35 = -[SKEraseVolume descriptor](self, "descriptor");
    [v35 filesystem];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 formattableFilesystemWithFilesystem:v36];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      SKGetOSLog();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = -[SKEraseVolume descriptor](self, "descriptor");
        [v50 filesystem];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[SKEraseVolume formattableFilesystems](self, "formattableFilesystems");
        *(_DWORD *)buf = 136315650;
        v61 = "-[SKEraseVolume validateWithError:]";
        __int16 v62 = 2112;
        v63 = v51;
        __int16 v64 = 2112;
        v65 = v52;
        _os_log_impl( &dword_188F75000,  v49,  OS_LOG_TYPE_ERROR,  "%s: FS to format %@ not found in supported filesystems %@",  buf,  0x20u);
      }

      +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a3);
      objc_super v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    v37 = -[SKEraseVolume descriptor](self, "descriptor");
    [v37 setFilesystem:v16];
    v38 = -[SKEraseVolume descriptor](self, "descriptor");
    [v38 filesystem];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 majorType];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    int v41 = [v40 isEqualToString:@"apfs"];

    if (v41)
    {
      v42 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
      v43 = -[SKEraseVolume disk](self, "disk");
      [v42 wholeDiskForDisk:v43];
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      [v44 type];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v45 isEqualToString:kSKDiskTypeMBRWholeDisk[0]])
      {
        unint64_t v46 = [v44 childCount];

        if (v46 >= 2) {
          goto LABEL_43;
        }
      }

      else
      {
      }

      [v44 type];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v53 isEqualToString:kSKDiskTypeAPMWholeDisk[0]])
      {
        unint64_t v54 = [v44 childCount];

        if (v54 >= 3)
        {
LABEL_43:
          v55 = +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 301LL, 0LL);
          +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v55, a3);
          objc_super v27 = (SKEraseVolume *)objc_claimAutoreleasedReturnValue();

          goto LABEL_50;
        }
      }

      else
      {
      }
    }

    objc_super v27 = self;
    goto LABEL_50;
  }

  [NSString stringWithFormat:@"Cannot find physical store for %@", v16];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = +[SKError nilWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "nilWithSKErrorCode:debugDescription:error:",  117LL,  v32,  a3);
LABEL_46:
  objc_super v27 = (SKEraseVolume *)v33;

LABEL_51:
  return v27;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKVolumeDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)forceUnmount
{
  return self->_forceUnmount;
}

- (void)setForceUnmount:(BOOL)a3
{
  self->_forceUnmount = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSDictionary)diskRepresentation
{
  return self->_diskRepresentation;
}

- (void)setDiskRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end