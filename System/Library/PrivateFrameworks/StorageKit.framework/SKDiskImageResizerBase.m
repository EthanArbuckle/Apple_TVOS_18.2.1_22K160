@interface SKDiskImageResizerBase
- (BOOL)checkLimitsWithError:(id *)a3;
- (BOOL)prepareRecoveryMoverWithError:(id *)a3;
- (SKDiskImage)image;
- (SKDiskImageResizeParams)resizeParams;
- (SKDiskImageResizerBase)initWithDiskImage:(id)a3 limits:(id)a4 resizeParams:(id)a5 error:(id *)a6;
- (SKDiskImageSizeLimits)limits;
- (SKRecoveryMoverInfo)recoveryMoverInfo;
- (id)attachForResizeParams;
- (id)fitToSize:(id *)a3;
- (id)imageResize:(id *)a3;
- (id)moveRecovery:(id *)a3;
- (id)volumeResize:(id *)a3;
- (unint64_t)requiredSizeForRecoveryMove;
- (void)setImage:(id)a3;
- (void)setLimits:(id)a3;
- (void)setRecoveryMoverInfo:(id)a3;
- (void)setRequestedSize:(unint64_t)a3;
- (void)setRequiredSizeForRecoveryMove:(unint64_t)a3;
- (void)setResizeParams:(id)a3;
@end

@implementation SKDiskImageResizerBase

- (SKDiskImageResizerBase)initWithDiskImage:(id)a3 limits:(id)a4 resizeParams:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  [v11 deduceDiskWithError:a6];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14) {
    goto LABEL_8;
  }
  if (![v13 size]) {
    objc_msgSend(v13, "setSize:", objc_msgSend(v12, "minBytes"));
  }
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SKDiskImageResizerBase;
  v15 = -[SKDiskResizerBase initWithDisk:requestedSize:]( &v18,  sel_initWithDisk_requestedSize_,  v14,  [v13 size]);
  self = v15;
  if (!v15
    || (objc_storeStrong((id *)&v15->_resizeParams, a5),
        objc_storeStrong((id *)&self->_image, a3),
        objc_storeStrong((id *)&self->_limits, a4),
        -[SKDiskImageResizerBase checkLimitsWithError:](self, "checkLimitsWithError:", a6))
    && -[SKDiskImageResizerBase prepareRecoveryMoverWithError:](self, "prepareRecoveryMoverWithError:", a6))
  {
    self = self;
    v16 = self;
  }

  else
  {
LABEL_8:
    v16 = 0LL;
  }

  return v16;
}

- (BOOL)prepareRecoveryMoverWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v5 = objc_alloc(&OBJC_CLASS___SKLastPartitions);
  v6 = -[SKDiskResizerBase disk](self, "disk");
  v7 = -[SKLastPartitions initWithDisk:](v5, "initWithDisk:", v6);
  v8 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  if (!v8) {
    goto LABEL_12;
  }
  v9 = -[SKDiskResizerBase disk](self, "disk");
  [v9 type];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:]( &OBJC_CLASS___SKLastPartitions,  "secondaryPartitionTableSizeWithDiskType:",  v10);

  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = [v12 unformattedSize] + v11;

  if (-[SKDiskResizerBase requestedSize](self, "requestedSize") <= v13)
  {
    SKGetOSLog();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v41 = 136315138;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      _os_log_impl( &dword_188F75000,  v31,  OS_LOG_TYPE_ERROR,  "%s: The requested size to resize is smaller than the recovery partition",  (uint8_t *)&v41,  0xCu);
    }

    BOOL v30 = +[SKError failWithSKErrorCode:error:](&OBJC_CLASS___SKError, "failWithSKErrorCode:error:", 257LL, a3);
    goto LABEL_16;
  }

  unint64_t v14 = -[SKDiskResizerBase requestedSize](self, "requestedSize") - v13;
  v15 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  uint64_t v16 = [v15 startLocation];

  uint64_t v17 = v14 - v16;
  if (v14 == v16)
  {
LABEL_12:
    BOOL v30 = 1;
    goto LABEL_16;
  }

  -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v19 = [v18 unformattedSize];
  if (v17 >= 0) {
    unint64_t v20 = v17;
  }
  else {
    unint64_t v20 = -v17;
  }

  if (v19 > v20)
  {
    SKGetOSLog();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
      uint64_t v23 = [v22 startLocation];
      v24 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
      int v41 = 136315906;
      v42 = "-[SKDiskImageResizerBase prepareRecoveryMoverWithError:]";
      __int16 v43 = 2048;
      uint64_t v44 = v23;
      __int16 v45 = 2048;
      unint64_t v46 = v14;
      __int16 v47 = 2048;
      uint64_t v48 = [v24 unformattedSize];
      _os_log_impl( &dword_188F75000,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Recovery partition current offset %lld, new offset %lld, size %lld, need to perform a 2-step move",  (uint8_t *)&v41,  0x2Au);
    }
    v25 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    uint64_t v26 = [v25 startLocation];
    v27 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    uint64_t v28 = [v27 unformattedSize];
    v29 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    -[SKDiskImageResizerBase setRequiredSizeForRecoveryMove:]( self,  "setRequiredSizeForRecoveryMove:",  v26 + v11 + v28 + [v29 unformattedSize]);

    if (v17 >= 1) {
      -[SKDiskImageResizerBase setRequiredSizeForRecoveryMove:]( self,  "setRequiredSizeForRecoveryMove:",  -[SKDiskImageResizerBase requiredSizeForRecoveryMove](self, "requiredSizeForRecoveryMove") + v17);
    }
    goto LABEL_12;
  }
  v33 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
  v34 = +[SKPartitionTable partitionIDFromDisk:](&OBJC_CLASS___SKPartitionTable, "partitionIDFromDisk:", v33);
  if (v34)
  {
    v35 = objc_alloc(&OBJC_CLASS___SKRecoveryMoverInfo);
    v36 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    uint64_t v37 = [v36 startLocation];
    v38 = -[SKLastPartitions recoveryPart](v7, "recoveryPart");
    v39 = -[SKRecoveryMoverInfo initWithSrcOffset:dstOffset:length:partitionID:]( v35,  "initWithSrcOffset:dstOffset:length:partitionID:",  v37,  v14,  [v38 unformattedSize],  v34);
    recoveryMoverInfo = self->_recoveryMoverInfo;
    self->_recoveryMoverInfo = v39;

    BOOL v30 = 1;
  }

  else
  {
    BOOL v30 = +[SKError failWithSKErrorCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:debugDescription:error:",  117LL,  @"Failed to retrieve the recovery partition ID",  a3);
  }

LABEL_16:
  return v30;
}

- (void)setRequestedSize:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setSize:a3];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKDiskImageResizerBase;
  -[SKDiskResizerBase setRequestedSize:](&v6, sel_setRequestedSize_, a3);
}

- (id)attachForResizeParams
{
  v2 = (void *)objc_opt_new();
  [v2 setIsManagedAttach:1];
  [v2 setPolicy:0];
  return v2;
}

- (BOOL)checkLimitsWithError:(id *)a3
{
  unint64_t v5 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  -[SKDiskImageResizerBase limits](self, "limits");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= [v6 minBytes])
  {
    v7 = -[SKDiskImageResizerBase limits](self, "limits");
    unint64_t v8 = [v7 maxBytes];
    unint64_t v9 = -[SKDiskResizerBase requestedSize](self, "requestedSize");

    if (v8 >= v9) {
      return 1;
    }
  }

  else
  {
  }
  v10 = -[SKDiskImageResizerBase limits](self, "limits");
  unint64_t v11 = [v10 maxBytes];
  unint64_t v12 = -[SKDiskResizerBase requestedSize](self, "requestedSize");

  if (v11 < v12) {
    uint64_t v13 = 256LL;
  }
  else {
    uint64_t v13 = 257LL;
  }
  return +[SKError failWithSKErrorCode:error:](&OBJC_CLASS___SKError, "failWithSKErrorCode:error:", v13, a3);
}

- (id)volumeResize:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0LL;
  -[SKDiskResizerBase disk](self, "disk");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v20 = 3221225472LL;
  v21 = __39__SKDiskImageResizerBase_volumeResize___block_invoke;
  v22 = &unk_18A3235E8;
  v24 = &v25;
  unint64_t v8 = v5;
  uint64_t v23 = v8;
  [v6 resizeToSize:v7 completionBlock:&v19];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SKDiskResizerBase resizeError](self, "resizeError", v19, v20, v21, v22);
  LODWORD(v6) = v10 == 0LL;

  if ((_DWORD)v6)
  {
    -[SKDiskResizerBase progress](self, "progress");
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 chainChildProgress:v9 withPendingUnitCount:70];
  }

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v26[5])
  {
    SKGetOSLog();
    unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)v26[5];
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_188F75000, v12, OS_LOG_TYPE_DEFAULT, "%s: Resize failed: %@", buf, 0x16u);
    }

    if (a3) {
      *a3 = (id) v26[5];
    }
    uint64_t v14 = -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
  }

  else
  {
    SKGetOSLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskResizerBase disk](self, "disk");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[SKDiskImageResizerBase volumeResize:]";
      __int16 v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_188F75000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ resized successfully", buf, 0x16u);
    }

    uint64_t v14 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
  }

  uint64_t v17 = (void *)v14;

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __39__SKDiskImageResizerBase_volumeResize___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)imageResize:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  SKGetOSLog();
  dispatch_semaphore_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SKDiskImageResizerBase image](self, "image");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v22 = 136315394;
    uint64_t v23 = "-[SKDiskImageResizerBase imageResize:]";
    __int16 v24 = 2112;
    uint64_t v25 = (uint64_t)v6;
    _os_log_impl(&dword_188F75000, v5, OS_LOG_TYPE_DEFAULT, "%s: Resizing disk image %@", (uint8_t *)&v22, 0x16u);
  }

  -[SKDiskResizerBase disk](self, "disk");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 ejectWithError:a3];

  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 localizedStringForKey:@"Resizing disk image..." value:&stru_18A323F58 table:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase progress](self, "progress");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setLocalizedAdditionalDescription:v10];

  -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 2);
  -[SKDiskImageResizerBase image](self, "image");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskImageResizerBase resizeParams](self, "resizeParams");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v12 diResize:v13 error:a3];

  SKGetOSLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    uint64_t v23 = "-[SKDiskImageResizerBase imageResize:]";
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_impl( &dword_188F75000,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Resized disk image to new size %lld",  (uint8_t *)&v22,  0x16u);
  }

  if (v14)
  {
    -[SKDiskImageResizerBase setRequestedSize:](self, "setRequestedSize:", v14);
    -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 6);
    -[SKDiskImageResizerBase image](self, "image");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskImageResizerBase attachForResizeParams](self, "attachForResizeParams");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 attachWithParams:v17 error:a3];
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskResizerBase setDisk:](self, "setDisk:", v18);

    -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 2);
    -[SKDiskResizerBase disk](self, "disk");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19) {
      return 0LL;
    }
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_9:
    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)moveRecovery:(id *)a3
{
  v83[2] = *MEMORY[0x1895F89C0];
  -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_22;
  }
  +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 localizedStringForKey:@"Moving recovery partition..." value:&stru_18A323F58 table:0];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase progress](self, "progress");
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setLocalizedAdditionalDescription:v7];

  -[SKDiskResizerBase disk](self, "disk");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v10 = [v9 getSectorSize];

  -[SKDiskResizerBase disk](self, "disk");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = +[SKMediaKit newMediaRefForDisk:options:error:]( &OBJC_CLASS___SKMediaKit,  "newMediaRefForDisk:options:error:",  v11,  0LL,  a3);

  if (!v12)
  {
    SKGetOSLog();
    __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v75 = "-[SKDiskImageResizerBase moveRecovery:]";
      _os_log_impl( &dword_188F75000,  v47,  OS_LOG_TYPE_ERROR,  "%s: Failed creating MediaKit reference for reading",  buf,  0xCu);
    }

    uint64_t v48 = -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    goto LABEL_23;
  }

  v82[0] = @"Shared Writer";
  v82[1] = @"Writable";
  v83[0] = MEMORY[0x189604A88];
  v83[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v83 forKeys:v82 count:2];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskResizerBase disk](self, "disk");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = +[SKMediaKit newMediaRefForDisk:options:error:]( &OBJC_CLASS___SKMediaKit,  "newMediaRefForDisk:options:error:",  v14,  v13,  a3);

  SKGetOSLog();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (v15)
  {
    v66 = v13;
    v68 = a3;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v15;
      uint64_t v20 = [v18 length];
      v21 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      uint64_t v22 = [v21 srcOffset];
      -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
      id v23 = v12;
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v75 = "-[SKDiskImageResizerBase moveRecovery:]";
      __int16 v76 = 2048;
      uint64_t v77 = v20;
      id v15 = v19;
      __int16 v78 = 2048;
      uint64_t v79 = v22;
      __int16 v80 = 2048;
      uint64_t v81 = [v24 dstOffset];
      _os_log_impl( &dword_188F75000,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Moving recovery partition of size %lld from offset %lld to %lld...",  buf,  0x2Au);

      id v12 = v23;
    }

    v72[0] = @"Instruction Code";
    [MEMORY[0x189607968] numberWithInt:1];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v25;
    v73[1] = v12;
    id v67 = v12;
    v72[1] = @"Source Device";
    v72[2] = @"Target Device";
    id v65 = v15;
    v73[2] = v15;
    v72[3] = @"Source Offset";
    uint64_t v26 = (void *)MEMORY[0x189607968];
    -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v28 = v10;
    objc_msgSend(v26, "numberWithUnsignedLongLong:", objc_msgSend(v27, "srcOffset") / (unint64_t)v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v29;
    v72[4] = @"Target Offset";
    id v30 = (void *)MEMORY[0x189607968];
    v31 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    objc_msgSend(v30, "numberWithUnsignedLongLong:", objc_msgSend(v31, "dstOffset") / (unint64_t)v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v32;
    v72[5] = @"Block Count";
    __int16 v33 = (void *)MEMORY[0x189607968];
    v34 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
    objc_msgSend(v33, "numberWithUnsignedLongLong:", objc_msgSend(v34, "length") / v28);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    v73[5] = v35;
    uint64_t v36 = [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:v72 count:6];

    uint64_t v37 = (void *)v36;
    v70[0] = @"Block Size";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v28];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v38;
    v71[1] = &unk_18A3300A8;
    v70[1] = @"Buffer Size";
    v70[2] = @"Buffer Count";
    v71[2] = &unk_18A3300C0;
    v70[3] = @"Instructions";
    uint64_t v69 = v36;
    [MEMORY[0x189603F18] arrayWithObjects:&v69 count:1];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v39;
    [MEMORY[0x189603F68] dictionaryWithObjects:v71 forKeys:v70 count:4];
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v41 = IOJobSetup();
    if ((_DWORD)v41)
    {
      uint64_t v42 = v41;
      SKGetOSLog();
      __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = v68;
      unint64_t v45 = 0x18A322000LL;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        __int16 v76 = 1024;
        LODWORD(v77) = v42;
        unint64_t v46 = "%s: IOJobSetup failed, err=%d";
LABEL_18:
        _os_log_impl(&dword_188F75000, v43, OS_LOG_TYPE_ERROR, v46, buf, 0x12u);
      }
    }

    else
    {
      uint64_t v42 = IOJobInitiate();
      IOJobDispose();
      uint64_t v44 = v68;
      unint64_t v45 = 0x18A322000uLL;
      if (!(_DWORD)v42)
      {
        v52 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        uint64_t v53 = [v52 dstOffset];
        v54 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        uint64_t v55 = [v54 srcOffset];
        v56 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        [v56 setDstOffset:v55];
        v57 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        [v57 setSrcOffset:v53];

        v58 = objc_alloc(&OBJC_CLASS___SKPartitionTable);
        v59 = -[SKDiskResizerBase disk](self, "disk");
        v60 = -[SKPartitionTable initWithDisk:error:](v58, "initWithDisk:error:", v59, v68);

        if (!v60) {
          goto LABEL_28;
        }
        v61 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        [v61 partitionID];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = -[SKDiskImageResizerBase recoveryMoverInfo](self, "recoveryMoverInfo");
        BOOL v64 = -[SKPartitionTable resizePartitionID:size:offset:error:]( v60,  "resizePartitionID:size:offset:error:",  v62,  [v63 length],  v53,  v68);

        if (v64)
        {
          int v49 = 0;
        }

        else
        {
LABEL_28:
          -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", v68);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          int v49 = 1;
        }

        goto LABEL_20;
      }

      SKGetOSLog();
      __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v75 = "-[SKDiskImageResizerBase moveRecovery:]";
        __int16 v76 = 1024;
        LODWORD(v77) = v42;
        unint64_t v46 = "%s: Recovery partition blocks copy failed, err=%d";
        goto LABEL_18;
      }
    }

    id v50 = (id)[*(id *)(v45 + 2744) errorWithPOSIXCode:v42 error:v44];
    -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", v44);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    int v49 = 1;
LABEL_20:
    uint64_t v13 = v66;
    id v12 = v67;
    id v15 = v65;

    goto LABEL_21;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v75 = "-[SKDiskImageResizerBase moveRecovery:]";
    _os_log_impl( &dword_188F75000,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed creating MediaKit reference for writing",  buf,  0xCu);
  }

  -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  int v49 = 1;
LABEL_21:

  if (!v49)
  {
LABEL_22:
    -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
    uint64_t v48 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
LABEL_23:
    uint64_t v44 = (void *)v48;
  }

  return v44;
}

- (id)fitToSize:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  -[SKDiskResizerBase disk](self, "disk");
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 type];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isEqualToString:kSKDiskTypeUninitalized[0]];

  if (v7)
  {
    -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    SKGetOSLog();
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskResizerBase disk](self, "disk");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = 136315650;
      uint64_t v20 = "-[SKDiskImageResizerBase fitToSize:]";
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      unint64_t v24 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      _os_log_impl(&dword_188F75000, v9, OS_LOG_TYPE_DEFAULT, "%s: Fitting media of %@ to %llu", (uint8_t *)&v19, 0x20u);
    }

    +[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle");
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 localizedStringForKey:@"Fitting partition table to new disk size..." value:&stru_18A323F58 table:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKDiskResizerBase progress](self, "progress");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setLocalizedAdditionalDescription:v12];

    uint64_t v14 = objc_alloc(&OBJC_CLASS___SKPartitionTable);
    -[SKDiskResizerBase disk](self, "disk");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[SKPartitionTable initWithDisk:error:](v14, "initWithDisk:error:", v15, a3);

    if (v16
      && -[SKPartitionTable fitToContainerSize:error:]( v16,  "fitToContainerSize:error:",  -[SKDiskResizerBase requestedSize](self, "requestedSize"),  a3))
    {
      -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  -[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
      uint64_t v17 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    }

    else
    {
      uint64_t v17 = -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
    }

    objc_super v18 = (void *)v17;

    return v18;
  }

- (SKDiskImageSizeLimits)limits
{
  return self->_limits;
}

- (void)setLimits:(id)a3
{
}

- (unint64_t)requiredSizeForRecoveryMove
{
  return self->_requiredSizeForRecoveryMove;
}

- (void)setRequiredSizeForRecoveryMove:(unint64_t)a3
{
  self->_requiredSizeForRecoveryMove = a3;
}

- (SKDiskImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (SKDiskImageResizeParams)resizeParams
{
  return self->_resizeParams;
}

- (void)setResizeParams:(id)a3
{
}

- (SKRecoveryMoverInfo)recoveryMoverInfo
{
  return self->_recoveryMoverInfo;
}

- (void)setRecoveryMoverInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end