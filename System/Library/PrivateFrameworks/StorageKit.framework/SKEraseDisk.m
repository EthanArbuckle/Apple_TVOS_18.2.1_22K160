@interface SKEraseDisk
+ (BOOL)supportsSecureCoding;
+ (id)eraseDiskWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5;
+ (id)eraseDiskWithRootDisk:(id)a3 error:(id *)a4;
- (BOOL)forceUnmount;
- (NSArray)descriptors;
- (NSDictionary)diskRepresentation;
- (NSString)description;
- (SKDisk)disk;
- (SKEraseDisk)initWithCoder:(id)a3;
- (SKEraseDisk)initWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5;
- (SKProgress)progress;
- (id)eraseProgressReportingWithCompletionBlock:(id)a3;
- (id)formattableFilesystems;
- (id)validateWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseWithCompletionBlock:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setDisk:(id)a3;
- (void)setDiskRepresentation:(id)a3;
- (void)setForceUnmount:(BOOL)a3;
- (void)setProgress:(id)a3;
@end

@implementation SKEraseDisk

- (SKEraseDisk)initWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SKEraseDisk;
  v11 = -[SKEraseDisk init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      v13 = -[SKEraseDisk formattableFilesystems](v12, "formattableFilesystems");
      [v13 firstObject];
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 majorType];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 isEqualToString:@"msdos"];

      if (v16) {
        v17 = @"NO NAME";
      }
      else {
        v17 = @"Untitled";
      }
      v18 = +[SKVolumeDescriptor descriptorWithName:filesystem:]( &OBJC_CLASS___SKVolumeDescriptor,  "descriptorWithName:filesystem:",  v17,  v14);
      v19 = +[SKPartitionDescriptor descriptorWithVolume:](&OBJC_CLASS___SKPartitionDescriptor, "descriptorWithVolume:", v18);
      v27[0] = v19;
      [MEMORY[0x189603F18] arrayWithObjects:v27 count:1];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_storeStrong((id *)&v12->_descriptors, v10);
    uint64_t v20 = [v9 minimalDictionaryRepresentation];
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v20;

    uint64_t v22 = +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v22;
  }

  -[SKEraseDisk validateWithError:](v12, "validateWithError:", a5);
  v24 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)eraseDiskWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRootDisk:v8 descriptors:v7 error:a5];

  return v9;
}

+ (id)eraseDiskWithRootDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRootDisk:v5 descriptors:0 error:a4];

  return v6;
}

- (void)eraseWithCompletionBlock:(id)a3
{
}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setCancellable:0];
  v17 = @"kSKDiskMountOptionForce";
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[SKEraseDisk forceUnmount](self, "forceUnmount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKEraseDisk disk](self, "disk");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke;
  v14[3] = &unk_18A323858;
  id v16 = v4;
  v14[4] = self;
  id v9 = v5;
  id v15 = v9;
  id v10 = v4;
  [v8 unmountWithOptions:v7 completionBlock:v14];

  v11 = v15;
  id v12 = v9;

  return v12;
}

void __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    v3 = +[SKHelperClient sharedClient](&OBJC_CLASS___SKHelperClient, "sharedClient");
    [v3 eraseWithEraser:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 48)];
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) setCompletedUnitCount:10];
    [*(id *)(a1 + 40) chainChildProgress:v4 withPendingUnitCount:90];
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKEraseDisk disk](self, "disk");
  -[SKEraseDisk descriptors](self, "descriptors");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { disk: %@, descriptors: %@}>", v5, v6, v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)formattableFilesystems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 formattableFilesystems];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SKEraseDisk diskRepresentation](self, "diskRepresentation");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"diskRepresentation"];

  -[SKEraseDisk descriptors](self, "descriptors");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"descriptors"];
}

- (SKEraseDisk)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SKEraseDisk;
  id v5 = -[SKEraseDisk init](&v29, sel_init);
  if (v5)
  {
    v28 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"diskRepresentation"];
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v15;

    v17 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"descriptors"];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v20;

    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 knownDiskForDictionary:v5->_diskRepresentation];
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v23;

    uint64_t v25 = +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v25;
  }

  return v5;
}

- (id)validateWithError:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  -[SKEraseDisk disk](self, "disk");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SKGetOSLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[SKEraseDisk disk](self, "disk");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 136315394;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(void *)&v61[14] = v20;
      _os_log_impl(&dword_188F75000, v19, OS_LOG_TYPE_ERROR, "%s: Disk %@ not valid for erase", v61, 0x16u);
    }

    uint64_t v21 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 22LL, a3);
    goto LABEL_18;
  }

  -[SKEraseDisk disk](self, "disk");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 canPartitionDisk];

  if ((v7 & 1) == 0)
  {
    SKGetOSLog();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[SKEraseDisk disk](self, "disk");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v61 = 136315394;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(void *)&v61[14] = v23;
      _os_log_impl( &dword_188F75000,  v22,  OS_LOG_TYPE_ERROR,  "%s: Disk %@ not valid for erase, should be whole disk not APFSContainer",  v61,  0x16u);
    }

    uint64_t v21 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a3);
    goto LABEL_18;
  }

  -[SKEraseDisk descriptors](self, "descriptors");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[SKEraseDisk descriptors](self, "descriptors"),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        !v10))
  {
    SKGetOSLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v61 = 136315138;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      _os_log_impl( &dword_188F75000,  v24,  OS_LOG_TYPE_ERROR,  "%s: Missing partition descriptors for erase disk",  v61,  0xCu);
    }

    uint64_t v21 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 22LL, a3);
LABEL_18:
    uint64_t v25 = (void *)v21;
    return v25;
  }

  *(void *)v61 = 0LL;
  *(void *)&v61[8] = v61;
  *(void *)&v61[16] = 0x2020000000LL;
  uint64_t v62 = 0LL;
  -[SKEraseDisk descriptors](self, "descriptors");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1895F87A8];
  v53[1] = 3221225472LL;
  v53[2] = __33__SKEraseDisk_validateWithError___block_invoke;
  v53[3] = &unk_18A3238A0;
  v53[4] = v61;
  [v11 enumerateObjectsUsingBlock:v53];

  unint64_t v12 = *(void *)(*(void *)&v61[8] + 24LL);
  -[SKEraseDisk disk](self, "disk");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v12 > [v13 unformattedSize];

  if ((v12 & 1) != 0)
  {
    SKGetOSLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void **)(*(void *)&v61[8] + 24LL);
      -[SKEraseDisk disk](self, "disk");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 unformattedSize];
      *(_DWORD *)buf = 136315650;
      v56 = "-[SKEraseDisk validateWithError:]";
      __int16 v57 = 2048;
      v58 = v15;
      __int16 v59 = 2048;
      uint64_t v60 = v17;
      _os_log_impl(&dword_188F75000, v14, OS_LOG_TYPE_ERROR, "%s: New size %lu exceeds %llu", buf, 0x20u);
    }

    +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 28LL, a3);
    uint64_t v18 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }

  for (unint64_t i = 0LL; ; ++i)
  {
    v28 = -[SKEraseDisk descriptors](self, "descriptors");
    BOOL v29 = [v28 count] - 1 > i;

    if (!v29) {
      break;
    }
    v30 = -[SKEraseDisk descriptors](self, "descriptors");
    [v30 objectAtIndexedSubscript:i];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v32 = [v31 size] == 0;

    if (v32)
    {
      SKGetOSLog();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[SKEraseDisk validateWithError:]";
        __int16 v57 = 1024;
        LODWORD(v58) = i;
        _os_log_impl(&dword_188F75000, v43, OS_LOG_TYPE_ERROR, "%s: Non last descriptor %d zero size", buf, 0x12u);
      }

      +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 22LL, a3);
      uint64_t v18 = (SKEraseDisk *)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  v33 = -[SKEraseDisk descriptors](self, "descriptors");
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v54 count:16];
  id obj = v33;
  if (!v34) {
    goto LABEL_33;
  }
  uint64_t v35 = *(void *)v50;
  while (2)
  {
    uint64_t v36 = 0LL;
    do
    {
      if (*(void *)v50 != v35) {
        objc_enumerationMutation(obj);
      }
      v37 = *(void **)(*((void *)&v49 + 1) + 8 * v36);
      v38 = -[SKEraseDisk disk](self, "disk");
      [v37 filesystem];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 formattableFilesystemWithFilesystem:v39];
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        SKGetOSLog();
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          [v37 filesystem];
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[SKEraseDisk formattableFilesystems](self, "formattableFilesystems");
          *(_DWORD *)buf = 136315650;
          v56 = "-[SKEraseDisk validateWithError:]";
          __int16 v57 = 2112;
          v58 = v45;
          __int16 v59 = 2112;
          uint64_t v60 = (uint64_t)v46;
          _os_log_impl( &dword_188F75000,  v44,  OS_LOG_TYPE_ERROR,  "%s: FS to format %@ not found in supported filesystems %@",  buf,  0x20u);
        }

        uint64_t v47 = 45LL;
        goto LABEL_43;
      }

      [v37 innerDescriptor];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 setFilesystem:v40];

      [v37 innerDescriptor];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = [v42 validateForErase];

      if (!(_DWORD)v41)
      {
        uint64_t v47 = 22LL;
LABEL_43:
        +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", v47, a3);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }

      ++v36;
    }

    while (v34 != v36);
    uint64_t v34 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v34) {
      continue;
    }
    break;
  }

uint64_t __33__SKEraseDisk_validateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += result;
  return result;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
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