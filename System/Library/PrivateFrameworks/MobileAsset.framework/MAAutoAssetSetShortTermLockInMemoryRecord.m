@interface MAAutoAssetSetShortTermLockInMemoryRecord
- (BOOL)isCurrentlyValid;
- (MAAutoAssetSetShortTermLockInMemoryRecord)initWithPathAndSetStatus:(id)a3 setStatus:(id)a4;
- (MAAutoAssetSetStatus)setStatus;
- (NSDate)recordDate;
- (NSString)lockerFileRealPath;
- (id)summary;
- (void)isCurrentlyValid;
@end

@implementation MAAutoAssetSetShortTermLockInMemoryRecord

- (MAAutoAssetSetShortTermLockInMemoryRecord)initWithPathAndSetStatus:(id)a3 setStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetShortTermLockInMemoryRecord;
  v9 = -[MAAutoAssetSetShortTermLockInMemoryRecord init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockerFileRealPath, a3);
    objc_storeStrong((id *)&v10->_setStatus, a4);
    uint64_t v11 = [MEMORY[0x189603F50] date];
    recordDate = v10->_recordDate;
    v10->_recordDate = (NSDate *)v11;
  }

  return v10;
}

- (BOOL)isCurrentlyValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MAAutoAssetSetShortTermLockInMemoryRecord lockerFileRealPath](self, "lockerFileRealPath");
  id v15 = 0LL;
  [v3 attributesOfItemAtPath:v4 error:&v15];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v15;

  if (v5) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetShortTermLockInMemoryRecord isCurrentlyValid].cold.1(self, (uint64_t)v6, v9);
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }

  uint64_t v10 = [v5 objectForKey:*MEMORY[0x1896074E0]];
  if (!v10)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetShortTermLockInMemoryRecord isCurrentlyValid].cold.2(self, v9);
    }
    goto LABEL_11;
  }

  v9 = (os_log_s *)v10;
  -[MAAutoAssetSetShortTermLockInMemoryRecord recordDate](self, "recordDate");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = -[os_log_s compare:](v9, "compare:", v11) == -1;

LABEL_12:
  return v12;
}

- (id)summary
{
  v3 = (void *)NSString;
  v4 = -[MAAutoAssetSetShortTermLockInMemoryRecord lockerFileRealPath](self, "lockerFileRealPath");
  v5 = -[MAAutoAssetSetShortTermLockInMemoryRecord recordDate](self, "recordDate");
  [v5 description];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"LockerFilePath: %@ RecordCreatedDate: %@", v4, v6];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)lockerFileRealPath
{
  return self->_lockerFileRealPath;
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (MAAutoAssetSetStatus)setStatus
{
  return self->_setStatus;
}

- (void).cxx_destruct
{
}

- (void)isCurrentlyValid
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 summary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl( &dword_18718F000,  a2,  OS_LOG_TYPE_ERROR,  "[MAAutoAssetSetShortTermLockInMemoryRecord]: Unable to determine modification date for lock file tracked by %@",  (uint8_t *)&v4,  0xCu);
}

@end