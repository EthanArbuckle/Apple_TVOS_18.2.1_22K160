@interface ASPCarryLog_ExtractUpload
- (ASPCarryLog_ExtractUpload)initWithNandDriver:(id)a3 UploadDriver:(id)a4 StateManager:(id)a5 workDirectory:(id)a6 internalBuild:(BOOL)a7;
- (BOOL)_getDiskSpaceFlag;
- (BOOL)_internalCheckNextSpdExtract;
- (BOOL)_isIOLogFromHwLogger;
- (BOOL)_isLastExtractionTooLongAgo;
- (BOOL)_isPendingSpdHandling;
- (BOOL)_isXpcActivityDeferred;
- (BOOL)_tryDeferXpcActivity;
- (BOOL)isEnoughDiskSpace;
- (BOOL)isIOLogEnableNeeded;
- (BOOL)isInternalBuild;
- (BOOL)isPeriodicSpd;
- (CarryLog_NANDDriver)nandDriver;
- (CarryLog_UploadDriver)uploadDriver;
- (NSDate)nextSpdExtractTime;
- (NSDictionary)uploadInfo;
- (NSFileManager)fileManager;
- (NSString)convertedIologPath;
- (NSString)deviceId;
- (NSString)endTimeStr;
- (NSString)iologPath;
- (NSString)nandcounterPath;
- (NSString)nandstatsPath;
- (NSString)pendingUploadFile;
- (NSString)spdFilePath;
- (NSString)tarInProgressDir;
- (NSString)taskingId;
- (NSString)uploadInfoKey;
- (NSString)workDir;
- (StateMgr)stateMgr;
- (XpcActivityManager)xpcActivityMgr;
- (id)_checkAndCompressFiles;
- (id)_compressFilesForSpd:(BOOL)a3;
- (id)_getNextSpdExtractTime;
- (id)_getPendingUploadFile;
- (id)_getUploadContentPath;
- (id)_prepareContentsToUpload;
- (int)_checkAndConvertIOLog;
- (int)_checkAndExtractFiles;
- (int)_extractFiles;
- (int)_getNumB2BZipErrors;
- (int)_getSpdState;
- (int)_getStage;
- (int)_getUploadIdx;
- (int)_tryCreateWorkDirectories;
- (int)numB2BZipErrors;
- (int)spdState;
- (int)uploadIdx;
- (unint64_t)_getlastTotalUploadSize;
- (unint64_t)_iologLba_current;
- (unint64_t)_iologLba_prevSubmission;
- (unint64_t)lastTotalUploadSize;
- (unint64_t)uploadSizeLimit;
- (unsigned)_tryExtractSpdToNextState;
- (void)_checkAndHandleExcessiveCompressionErrors;
- (void)_cleanUpinProgressFiles;
- (void)_forceDeferXpcActivity;
- (void)_incrementCntForKey:(id)a3;
- (void)_internalSetNextSpdExtractionTime;
- (void)_iologLba_updateNewValue:(unint64_t)a3;
- (void)_jetSamStatsCollect_end;
- (void)_jetSamStatsCollect_start;
- (void)_removeConvertedIOLog;
- (void)_removeExtractedFiles;
- (void)_removePendingUploadFilePath;
- (void)_saveLastUploadFilePath:(id)a3;
- (void)_savePendingUploadFilePath:(id)a3;
- (void)_setStage:(int)a3;
- (void)_setUploadInfoWithSpdState:(unsigned int)a3;
- (void)_tryExtractUploadSpd;
- (void)_updateLastExtractTime;
- (void)_updateUploadInfoWithContentPath:(id)a3 contentSize:(unint64_t)a4;
- (void)setConvertedIologPath:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setEndTimeStr:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setIologPath:(id)a3;
- (void)setIsEnoughDiskSpace:(BOOL)a3;
- (void)setIsIOLogEnableNeeded:(BOOL)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setIsPeriodicSpd:(BOOL)a3;
- (void)setLastTotalUploadSize:(unint64_t)a3;
- (void)setNandDriver:(id)a3;
- (void)setNandcounterPath:(id)a3;
- (void)setNandstatsPath:(id)a3;
- (void)setNextSpdExtractTime:(id)a3;
- (void)setNumB2BZipErrors:(int)a3;
- (void)setPendingUploadFile:(id)a3;
- (void)setSpdFilePath:(id)a3;
- (void)setSpdState:(int)a3;
- (void)setStateMgr:(id)a3;
- (void)setTarInProgressDir:(id)a3;
- (void)setTaskingId:(id)a3;
- (void)setUploadDriver:(id)a3;
- (void)setUploadIdx:(int)a3;
- (void)setUploadInfo:(id)a3;
- (void)setUploadInfoKey:(id)a3;
- (void)setUploadSizeLimit:(unint64_t)a3;
- (void)setWorkDir:(id)a3;
- (void)setXpcActivityMgr:(id)a3;
- (void)tryExtractUpload:(id)a3;
@end

@implementation ASPCarryLog_ExtractUpload

- (ASPCarryLog_ExtractUpload)initWithNandDriver:(id)a3 UploadDriver:(id)a4 StateManager:(id)a5 workDirectory:(id)a6 internalBuild:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___ASPCarryLog_ExtractUpload;
  v17 = -[ASPCarryLog_ExtractUpload init](&v58, "init");
  if (v17)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    fileManager = v17->_fileManager;
    v17->_fileManager = (NSFileManager *)v18;

    objc_storeStrong((id *)&v17->_nandDriver, a3);
    objc_storeStrong((id *)&v17->_uploadDriver, a4);
    objc_storeStrong((id *)&v17->_stateMgr, a5);
    objc_storeStrong((id *)&v17->_workDir, a6);
    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"iolog_spd.iolog"));
    spdFilePath = v17->_spdFilePath;
    v17->_spdFilePath = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"tar_in_process"));
    tarInProgressDir = v17->_tarInProgressDir;
    v17->_tarInProgressDir = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"iolog.iolog"));
    iologPath = v17->_iologPath;
    v17->_iologPath = (NSString *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"nandcounters.plist"));
    nandcounterPath = v17->_nandcounterPath;
    v17->_nandcounterPath = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"nandstats.txt"));
    nandstatsPath = v17->_nandstatsPath;
    v17->_nandstatsPath = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v17->_workDir,  "stringByAppendingPathComponent:",  @"iolog_converted.iolog"));
    convertedIologPath = v17->_convertedIologPath;
    v17->_convertedIologPath = (NSString *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getPendingUploadFile](v17, "_getPendingUploadFile"));
    pendingUploadFile = v17->_pendingUploadFile;
    v17->_pendingUploadFile = (NSString *)v32;

    v17->_isInternalBuild = a7;
    xpcActivityMgr = v17->_xpcActivityMgr;
    v17->_xpcActivityMgr = 0LL;

    v17->_isIOLogEnableNeeded = 0;
    v17->_isPeriodicSpd = 0;
    v35 = (void *)objc_claimAutoreleasedReturnValue( -[StateMgr getValueForKey:expectedType:]( v17->_stateMgr,  "getValueForKey:expectedType:",  @"current_tasking_info",  2LL));
    v36 = v35;
    uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"id"]);
    taskingId = v17->_taskingId;
    v17->_taskingId = (NSString *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"device_id"]);
    deviceId = v17->_deviceId;
    v17->_deviceId = (NSString *)v39;

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"endtime"]);
    endTimeStr = v17->_endTimeStr;
    v17->_endTimeStr = (NSString *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"upload_size_limit_bytes"]);
    v17->_uploadSizeLimit = (unint64_t)[v43 unsignedLongValue];

    uint64_t v44 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"aspcarry_uploadinfo",  v17->_taskingId));
    uploadInfoKey = v17->_uploadInfoKey;
    v17->_uploadInfoKey = (NSString *)v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](v17, "stateMgr"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfoKey](v17, "uploadInfoKey"));
    uint64_t v48 = objc_claimAutoreleasedReturnValue([v46 getValueForKey:v47 expectedType:2]);
    uploadInfo = v17->_uploadInfo;
    v17->_uploadInfo = (NSDictionary *)v48;

    v17->_spdState = -[ASPCarryLog_ExtractUpload _getSpdState](v17, "_getSpdState");
    v17->_uploadIdx = -[ASPCarryLog_ExtractUpload _getUploadIdx](v17, "_getUploadIdx");
    v17->_lastTotalUploadSize = -[ASPCarryLog_ExtractUpload _getlastTotalUploadSize](v17, "_getlastTotalUploadSize");
    if (-[ASPCarryLog_ExtractUpload _getDiskSpaceFlag](v17, "_getDiskSpaceFlag")) {
      BOOL v50 = !diskFreeSpaceBelowLimit(0x40000000uLL);
    }
    else {
      LOBYTE(v50) = 0;
    }
    v17->_isEnoughDiskSpace = v50;
    v17->_numB2BZipErrors = -[ASPCarryLog_ExtractUpload _getNumB2BZipErrors](v17, "_getNumB2BZipErrors");
    uint64_t v51 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getNextSpdExtractTime](v17, "_getNextSpdExtractTime"));
    nextSpdExtractTime = v17->_nextSpdExtractTime;
    v17->_nextSpdExtractTime = (NSDate *)v51;

    if (v17->_uploadIdx < 0 || v17->_lastTotalUploadSize == -1LL)
    {
LABEL_9:
      v53 = v17->_taskingId;
      v17->_taskingId = 0LL;

      v54 = v17->_deviceId;
      v17->_deviceId = 0LL;

      v17->_lastTotalUploadSize = -1LL;
      v17->_uploadSizeLimit = -1LL;
      v17->_isEnoughDiskSpace = 1;
      *(void *)&v17->_spdState = 0xFFFFFFFF00000000LL;
      v55 = v17->_nextSpdExtractTime;
      v17->_nextSpdExtractTime = 0LL;
    }

    v56 = v17;
  }

  return v17;
}

- (unint64_t)_iologLba_current
{
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nandStats_get_hoursAgo:", 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:&off_1000AC1C0]);
  id v7 = [v6 unsignedLongLongValue];

  objc_autoreleasePoolPop(v3);
  return (unint64_t)v7;
}

- (unint64_t)_iologLba_prevSubmission
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getValueForKey:@"iolog_lbas" expectedType:1]);

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (BOOL)_isLastExtractionTooLongAgo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getValueForKey:@"last_extract_time" expectedType:0]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (id v5 = StringToDateTime(v3), (v6 = (void *)objc_claimAutoreleasedReturnValue(v5)) != 0LL))
  {
    id v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:86400.0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v10 = [v8 compare:v9] == (id)-1;
  }

  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_updateLastExtractTime
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  id v2 = currentDateTimeStr();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v4 setValue:v3 forKey:@"last_extract_time"];
}

- (unint64_t)_getlastTotalUploadSize
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"total_upload_size"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unint64_t v5 = (unint64_t)[v3 unsignedLongLongValue];
  }
  else {
    unint64_t v5 = -1LL;
  }

  return v5;
}

- (int)_getUploadIdx
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"fileidx"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (BOOL)_getDiskSpaceFlag
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"enough_disk_space"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_getNextSpdExtractTime
{
  if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"next_spd_extraction_time"]);

    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = StringToDateTime(v4);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)_isPendingSpdHandling
{
  return -[ASPCarryLog_ExtractUpload spdState](self, "spdState") != 0;
}

- (int)_getNumB2BZipErrors
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"num_b2b_zip_errors"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (void)_iologLba_updateNewValue:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v5 setValue:v4 forKey:@"iolog_lbas"];
}

- (id)_getPendingUploadFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"extractupload_pendingfile" expectedType:0]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) == 0)
    {

      -[ASPCarryLog_ExtractUpload _removePendingUploadFilePath](self, "_removePendingUploadFilePath");
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

- (void)_setUploadInfoWithSpdState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v19[0] = @"fileidx";
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx")));
  v20[0] = v6;
  v19[1] = @"total_upload_size";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize")));
  v20[1] = v7;
  v19[2] = @"enough_disk_space";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ASPCarryLog_ExtractUpload isEnoughDiskSpace](self, "isEnoughDiskSpace")));
  v20[2] = v8;
  v19[3] = @"num_b2b_zip_errors";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[ASPCarryLog_ExtractUpload numB2BZipErrors](self, "numB2BZipErrors")));
  v20[3] = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  v11 = -[NSMutableDictionary initWithDictionary:](v5, "initWithDictionary:", v10);

  if ((_DWORD)v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"spd_state");
  }

  if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
      id v15 = DateTimeToStr(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v16,  @"next_spd_extraction_time");
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfoKey](self, "uploadInfoKey"));
  [v17 setValue:v11 forKey:v18];
}

- (void)_internalSetNextSpdExtractionTime
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1209600.0));
  -[ASPCarryLog_ExtractUpload setNextSpdExtractTime:](self, "setNextSpdExtractTime:", v3);
}

- (void)_updateUploadInfoWithContentPath:(id)a3 contentSize:(unint64_t)a4
{
  id v10 = a3;
  if (v10)
  {
    -[ASPCarryLog_ExtractUpload setUploadIdx:]( self,  "setUploadIdx:",  -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx") + 1);
    -[ASPCarryLog_ExtractUpload setLastTotalUploadSize:]( self,  "setLastTotalUploadSize:",  (char *)-[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize") + a4);
    -[ASPCarryLog_ExtractUpload _saveLastUploadFilePath:](self, "_saveLastUploadFilePath:", v10);
    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0LL);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload endTimeStr](self, "endTimeStr"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload endTimeStr](self, "endTimeStr"));
      setTaskingInfoToLegacyUIDomain( v7,  v8,  v9,  -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize"),  v10,  -[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"));
    }
  }

  else
  {
    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0LL);
  }
}

- (void)_savePendingUploadFilePath:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v5 setValue:v4 forKey:@"extractupload_pendingfile"];
}

- (void)_saveLastUploadFilePath:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v5 setValue:v4 forKey:@"extractupload_lastupload"];
}

- (void)_removePendingUploadFilePath
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v2 deleteKey:@"extractupload_pendingfile"];
}

- (int)_tryCreateWorkDirectories
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
    id v27 = 0LL;
    unsigned __int8 v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:&v27];
    id v6 = v27;

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100041DB4();
      }
      goto LABEL_12;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  NSFileAttributeKey v30 = NSFilePosixPermissions;
  v31 = &off_1000AC1D8;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
  id v26 = v6;
  [v10 setAttributes:v11 ofItemAtPath:v12 error:&v26];
  id v13 = v26;

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  LOBYTE(v11) = [v14 fileExistsAtPath:v15];

  if ((v11 & 1) == 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
    id v25 = v13;
    unsigned __int8 v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:0 attributes:0 error:&v25];
    id v6 = v25;

    if ((v18 & 1) != 0)
    {
      id v13 = v6;
      goto LABEL_7;
    }

    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100041D88();
    }
LABEL_12:
    int v20 = 0;
    goto LABEL_13;
  }

- (void)_cleanUpinProgressFiles
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contentsOfDirectoryAtPath:v4 error:0]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v10]);
        [v11 removeItemAtPath:v13 error:0];

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (int)_extractFiles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    [v6 removeItemAtPath:v7 error:0];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
    [v11 removeItemAtPath:v12 error:0];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  unsigned int v14 = objc_msgSend(v13, "iolog_disable");

  if (v14)
  {
    -[ASPCarryLog_ExtractUpload setIsIOLogEnableNeeded:](self, "setIsIOLogEnableNeeded:", 1LL);
    do
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
      unint64_t v17 = (unint64_t)objc_msgSend(v15, "iolog_export:max_export_size:", v16, 25165824);
    }

    while (v17 >> 23 >= 3 && !-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"));
    if (-[ASPCarryLog_ExtractUpload isIOLogEnableNeeded](self, "isIOLogEnableNeeded"))
    {
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      objc_msgSend(v18, "iolog_enable");
    }
  }

  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_100041E38();
  }

  if (-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred")) {
    return 0;
  }
  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  unsigned int v22 = objc_msgSend(v20, "nandCounters_save:", v21);

  if (!v22)
  {
    int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100041DE0();
    return 0;
  }

  if (!-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild")) {
    return 1;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  unsigned int v25 = objc_msgSend(v23, "nandStats_save:", v24);

  if (v25) {
    return 1;
  }
  int result = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100041E0C();
    return 0;
  }

  return result;
}

- (int)_checkAndExtractFiles
{
  unint64_t v3 = -[ASPCarryLog_ExtractUpload _iologLba_current](self, "_iologLba_current");
  unint64_t v4 = -[ASPCarryLog_ExtractUpload _iologLba_prevSubmission](self, "_iologLba_prevSubmission");
  if (v3 > v4 && (v3 - v4) >> 13
    || (int result = -[ASPCarryLog_ExtractUpload _isLastExtractionTooLongAgo](self, "_isLastExtractionTooLongAgo")) != 0)
  {
    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 1LL);
    int result = -[ASPCarryLog_ExtractUpload _extractFiles](self, "_extractFiles");
    if (result)
    {
      if (-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
      {
        return 0;
      }

      else
      {
        -[ASPCarryLog_ExtractUpload _iologLba_updateNewValue:](self, "_iologLba_updateNewValue:", v3);
        -[ASPCarryLog_ExtractUpload _updateLastExtractTime](self, "_updateLastExtractTime");
        return 1;
      }
    }
  }

  return result;
}

- (void)_removeExtractedFiles
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
    [v6 removeItemAtPath:v7 error:0];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    [v11 removeItemAtPath:v12 error:0];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  if (v15)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
    [v16 removeItemAtPath:v17 error:0];
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  unsigned int v20 = [v18 fileExistsAtPath:v19];

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
    [v21 removeItemAtPath:v22 error:0];
  }

  -[ASPCarryLog_ExtractUpload _removeConvertedIOLog](self, "_removeConvertedIOLog");
}

- (void)_removeConvertedIOLog
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
    [v7 removeItemAtPath:v6 error:0];
  }

- (int)_checkAndConvertIOLog
{
  if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity")) {
    return 0;
  }
  -[ASPCarryLog_ExtractUpload _removeConvertedIOLog](self, "_removeConvertedIOLog");
  unsigned int v4 = -[ASPCarryLog_ExtractUpload _isIOLogFromHwLogger](self, "_isIOLogFromHwLogger");
  gIsIOLogFromHwLogger = v4;
  if (!v4) {
    return 1;
  }
  id v5 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  id v6 = fopen((const char *)[v5 UTF8String], "r");

  id v7 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
  uint64_t v8 = fopen((const char *)[v7 UTF8String], "w");

  if (v6 && v8)
  {
    int v9 = iolog_hwlogger_to_legacy_format_conversion(v8, v6, 1);
LABEL_9:
    fclose(v6);
    int v3 = v9;
    goto LABEL_10;
  }

  int v9 = 0;
  int v3 = 0;
  if (v6) {
    goto LABEL_9;
  }
LABEL_10:
  if (v8) {
    fclose(v8);
  }
  if (!v3)
  {
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 0LL);
  }

  return v3;
}

- (id)_compressFilesForSpd:(BOOL)a3
{
  BOOL v3 = a3;
  if (gIsIOLogFromHwLogger) {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload convertedIologPath](self, "convertedIologPath"));
  }
  else {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  }
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload tarInProgressDir](self, "tarInProgressDir"));
  id v6 = currentDateTimeStr();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)v7;
  if (v3)
  {
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/iologSpd_%@.tar",  v5,  v7));

    v45 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v44, 0LL);
  }

  else
  {
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/iolog_%@_%d.tar",  v5,  v7,  -[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx")));

    int v9 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandcounterPath](self, "nandcounterPath"));
    v45 = -[NSMutableArray initWithObjects:](v9, "initWithObjects:", v43, v10, 0LL);

    if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
      unsigned int v13 = [v11 fileExistsAtPath:v12];

      if (v13)
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandstatsPath](self, "nandstatsPath"));
        -[NSMutableArray addObject:](v45, "addObject:", v14);
      }
    }
  }

  -[ASPCarryLog_ExtractUpload _cleanUpinProgressFiles](self, "_cleanUpinProgressFiles");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v15 = archive_write_new();
  if (archive_write_add_filter_gzip()
    || archive_write_set_options(v15, "compression-level=1")
    || archive_write_set_format_pax(v15))
  {
    v40 = @"SetZipError";
LABEL_49:
    id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  v40,  0LL,  0LL));
    objc_exception_throw(v41);
    goto LABEL_50;
  }

  if (archive_write_open_filename( v15, [v46 fileSystemRepresentation]))
  {
    v40 = @"OpenDestFileError";
    goto LABEL_49;
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  obj = v45;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v49,  v55,  16LL);
  if (!v16) {
    goto LABEL_35;
  }
  id v17 = 0LL;
  uint64_t v48 = *(void *)v50;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v50 != v48) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(*((void *)&v49 + 1) + 8LL * (void)i);

      id v20 = v19;
      if (stat((const char *)[v20 fileSystemRepresentation], &v53))
      {
        id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"InputFileStatError",  0LL,  0LL));
        objc_exception_throw(v39);
        goto LABEL_50;
      }

      uint64_t v21 = archive_entry_new();
      archive_entry_copy_stat(v21, &v53);
      id v22 = objc_claimAutoreleasedReturnValue([v20 lastPathComponent]);
      archive_entry_set_pathname(v21, [v22 UTF8String]);

      archive_entry_set_filetype(v21, 0x8000LL);
      archive_entry_set_perm(v21, 420LL);
      if (archive_write_header(v15, v21))
      {
        id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ArchiveWriteHeaderError",  0LL,  0LL));
        objc_exception_throw(v38);
        goto LABEL_50;
      }

      id v17 = v20;
      int v23 = open((const char *)[v17 fileSystemRepresentation], 0);
      int v24 = v23;
      if (v23 < 0)
      {
        v36 = @"InpputFileError";
LABEL_43:
        id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  v36,  0LL,  0LL));
        objc_exception_throw(v37);
LABEL_50:
        __break(1u);
      }

      int v25 = read(v23, v56, 0x2000uLL);
      int v26 = 0x4000000;
      while (1)
      {
        if (v25 < 1) {
          goto LABEL_31;
        }
        if (v25 != archive_write_data(v15, v56, v25))
        {
          v36 = @"ArchiveWriteError";
          goto LABEL_43;
        }

        BOOL v27 = __OFSUB__(v26, v25);
        v26 -= v25;
        if ((v26 < 0) ^ v27 | (v26 == 0)) {
          break;
        }
LABEL_28:
        int v25 = read(v24, v56, 0x2000uLL);
      }

      if (!-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
      {
        int v26 = 0x4000000;
        goto LABEL_28;
      }

      NSFileAttributeKey v28 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Asked to defer activity during compression. Aborting...\n",  buf,  2u);
      }

- (id)_checkAndCompressFiles
{
  if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
  {
    id v3 = 0LL;
LABEL_11:
    id v3 = v3;
    unsigned int v4 = v3;
    goto LABEL_12;
  }

  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _compressFilesForSpd:](self, "_compressFilesForSpd:", 0LL));
  if (!-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred"))
  {
    if (!v3
      || (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager")),
          unsigned __int8 v6 = [v5 fileExistsAtPath:v3],
          v5,
          (v6 & 1) == 0))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100041E64();
      }
      -[ASPCarryLog_ExtractUpload _checkAndHandleExcessiveCompressionErrors]( self,  "_checkAndHandleExcessiveCompressionErrors");

      id v3 = 0LL;
    }

    -[ASPCarryLog_ExtractUpload _setStage:](self, "_setStage:", 0LL);
    goto LABEL_11;
  }

  unsigned int v4 = 0LL;
LABEL_12:

  return v4;
}

- (void)_checkAndHandleExcessiveCompressionErrors
{
  if (-[ASPCarryLog_ExtractUpload numB2BZipErrors](self, "numB2BZipErrors") >= 4)
  {
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    -[ASPCarryLog_ExtractUpload setNumB2BZipErrors:](self, "setNumB2BZipErrors:", 0LL);
  }

  -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0LL);
}

- (id)_prepareContentsToUpload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100041E90();
    }
  }

  else if (-[ASPCarryLog_ExtractUpload _tryCreateWorkDirectories](self, "_tryCreateWorkDirectories") {
         && (-[ASPCarryLog_ExtractUpload _getStage](self, "_getStage") > 1
  }
          || -[ASPCarryLog_ExtractUpload _checkAndExtractFiles](self, "_checkAndExtractFiles"))
         && (-[ASPCarryLog_ExtractUpload _getStage](self, "_getStage") > 2
          || -[ASPCarryLog_ExtractUpload _checkAndConvertIOLog](self, "_checkAndConvertIOLog")))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _checkAndCompressFiles](self, "_checkAndCompressFiles"));
    return v4;
  }

  unsigned int v4 = 0LL;
  return v4;
}

- (id)_getUploadContentPath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

  if (!v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _prepareContentsToUpload](self, "_prepareContentsToUpload"));
    if (!-[ASPCarryLog_ExtractUpload _isXpcActivityDeferred](self, "_isXpcActivityDeferred") && v5)
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload workDir](self, "workDir"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

      -[ASPCarryLog_ExtractUpload _savePendingUploadFilePath:](self, "_savePendingUploadFilePath:", v4);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      [v8 moveItemAtPath:v5 toPath:v4 error:0];

      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      LODWORD(v7) = [v9 fileExistsAtPath:v4];

      if ((_DWORD)v7)
      {
        -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
        goto LABEL_9;
      }
    }

    unsigned int v4 = 0LL;
    goto LABEL_9;
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));
  id v5 = 0LL;
LABEL_9:

  return v4;
}

- (void)tryExtractUpload:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  -[ASPCarryLog_ExtractUpload _jetSamStatsCollect_start](self, "_jetSamStatsCollect_start");
  -[ASPCarryLog_ExtractUpload setXpcActivityMgr:](self, "setXpcActivityMgr:", v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
  if (v6
    && (uint64_t v7 = (void *)v6,
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId")),
        v8,
        v7,
        v8))
  {
    if (-[ASPCarryLog_ExtractUpload _isPendingSpdHandling](self, "_isPendingSpdHandling"))
    {
      -[ASPCarryLog_ExtractUpload _tryExtractUploadSpd](self, "_tryExtractUploadSpd");
    }

    else if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
    {
      v12 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Deferring before IOLog extraction",  (uint8_t *)&v34,  2u);
      }
    }

    else if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild") {
           || -[ASPCarryLog_ExtractUpload isEnoughDiskSpace](self, "isEnoughDiskSpace"))
    }
    {
      unint64_t v13 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
      if (v13 >= -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit"))
      {
        int v25 = (void *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = v25;
          unint64_t v27 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
          unint64_t v28 = -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit");
          id v29 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
          int v34 = 134218498;
          id v35 = (id)v27;
          __int16 v36 = 2048;
          unint64_t v37 = v28;
          __int16 v38 = 2080;
          id v39 = [v29 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Total upload size bytes %llu exceeding limit %llu, for tasking %s",  (uint8_t *)&v34,  0x20u);
        }
      }

      else
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _getUploadContentPath](self, "_getUploadContentPath"));
        if (v14)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 attributesOfItemAtPath:v14 error:0]);
          id v17 = [v16 fileSize];

          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadDriver](self, "uploadDriver"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId"));
          unsigned int v21 = [v18 uploadFile:v14 TaskingId:v19 DeviceId:v20 LogType:@"com.apple.nand.iolog"];

          id v22 = (void *)oslog;
          if (v21)
          {
            if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = v14;
              int v24 = v22;
              int v34 = 136315138;
              id v35 = [v23 UTF8String];
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Content %s passed to uploader.\n",  (uint8_t *)&v34,  0xCu);
            }
          }

          else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          {
            sub_100041EE8();
          }

          -[ASPCarryLog_ExtractUpload _removePendingUploadFilePath](self, "_removePendingUploadFilePath");
          -[ASPCarryLog_ExtractUpload _updateUploadInfoWithContentPath:contentSize:]( self,  "_updateUploadInfoWithContentPath:contentSize:",  v14,  v17);
          unint64_t v32 = -[ASPCarryLog_ExtractUpload lastTotalUploadSize](self, "lastTotalUploadSize");
          if (v32 >= -[ASPCarryLog_ExtractUpload uploadSizeLimit](self, "uploadSizeLimit"))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
            objc_msgSend(v33, "iolog_disable");
          }

          else if (-[ASPCarryLog_ExtractUpload _internalCheckNextSpdExtract](self, "_internalCheckNextSpdExtract"))
          {
            -[ASPCarryLog_ExtractUpload _tryExtractUploadSpd](self, "_tryExtractUploadSpd");
          }
        }

        else
        {
          v31 = (os_log_s *)oslog;
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v34) = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No upload.\n", (uint8_t *)&v34, 2u);
          }
        }
      }
    }

    else
    {
      unsigned int v30 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Low disk space, do not perform extract upload.",  (uint8_t *)&v34,  2u);
      }

      if (-[ASPCarryLog_ExtractUpload _getDiskSpaceFlag](self, "_getDiskSpaceFlag")) {
        -[ASPCarryLog_ExtractUpload _updateUploadInfoWithContentPath:contentSize:]( self,  "_updateUploadInfoWithContentPath:contentSize:",  0LL,  0LL);
      }
    }
  }

  else
  {
    -[ASPCarryLog_ExtractUpload _cleanUpinProgressFiles](self, "_cleanUpinProgressFiles");
    -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));

    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload pendingUploadFile](self, "pendingUploadFile"));
      [v10 removeItemAtPath:v11 error:0];
    }

    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100041EBC();
    }
  }

  -[ASPCarryLog_ExtractUpload _jetSamStatsCollect_end](self, "_jetSamStatsCollect_end");
  objc_autoreleasePoolPop(v5);
}

- (void)_jetSamStatsCollect_start
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"extractupload_running" expectedType:0]);

  if (v4) {
    -[ASPCarryLog_ExtractUpload _incrementCntForKey:](self, "_incrementCntForKey:", @"extractupload_jetsam_count");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v5 setValue:@"YES" forKey:@"extractupload_running"];
}

- (void)_jetSamStatsCollect_end
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v2 deleteKey:@"extractupload_running"];
}

- (void)_incrementCntForKey:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getValueForKey:v8 expectedType:1]);

  if (v5) {
    uint64_t v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 intValue] + 1));
  }
  else {
    uint64_t v6 = &off_1000AC1F0;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload stateMgr](self, "stateMgr"));
  [v7 setValue:v6 forKey:v8];
}

- (BOOL)_tryDeferXpcActivity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));

  if (v3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    unsigned __int8 v4 = [v3 isXpcActivityDeferred];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    LODWORD(v3) = [v5 tryDeferXpcActivity];

    if ((v4 & 1) == 0)
    {
      if ((_DWORD)v3)
      {
        -[ASPCarryLog_ExtractUpload _incrementCntForKey:]( self,  "_incrementCntForKey:",  @"extractupload_defer_count");
        if (-[ASPCarryLog_ExtractUpload isIOLogEnableNeeded](self, "isIOLogEnableNeeded"))
        {
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
          unsigned int v7 = objc_msgSend(v6, "iolog_enable");

          if (v7) {
            -[ASPCarryLog_ExtractUpload setIsIOLogEnableNeeded:](self, "setIsIOLogEnableNeeded:", 0LL);
          }
        }
      }
    }
  }

  return (char)v3;
}

- (BOOL)_isXpcActivityDeferred
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
  if (v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
    unsigned __int8 v5 = [v4 isXpcActivityDeferred];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_setStage:(int)a3
{
  gCurrentExtractUploadStage = a3;
}

- (int)_getStage
{
  return gCurrentExtractUploadStage;
}

- (BOOL)_isIOLogFromHwLogger
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (!v5) {
    return 0;
  }
  id v6 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload iologPath](self, "iologPath"));
  unsigned int v7 = fopen((const char *)[v6 UTF8String], "r");

  if (!v7) {
    return 0;
  }
  BOOL v8 = iolog_is_from_hwlogger(v7);
  fclose(v7);
  return v8;
}

- (void)_forceDeferXpcActivity
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload xpcActivityMgr](self, "xpcActivityMgr"));
  [v2 forceDeferXpcActivity];
}

- (int)_getSpdState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadInfo](self, "uploadInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"spd_state"]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    unsigned int v5 = [v3 unsignedIntValue];
    if (v5 <= 2) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
  }

  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)_internalCheckNextSpdExtract
{
  if (!-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild")) {
    return 0;
  }
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nextSpdExtractTime](self, "nextSpdExtractTime"));
    id v7 = [v5 compare:v6];

    if (v7 != (id)1) {
      return 0;
    }
  }

  BOOL v8 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Time to periodically extract SPD for internal build.",  v11,  2u);
  }

  BOOL v9 = 1;
  -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 1LL);
  -[ASPCarryLog_ExtractUpload setIsPeriodicSpd:](self, "setIsPeriodicSpd:", 1LL);
  return v9;
}

- (void)_tryExtractUploadSpd
{
  uint64_t v3 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Extract and upload SPD start.", buf, 2u);
  }

  if (!-[ASPCarryLog_ExtractUpload spdState](self, "spdState")
    || -[ASPCarryLog_ExtractUpload spdState](self, "spdState") >= 3)
  {
    uint64_t v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100041F14(v4, self);
    }
    -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0LL);
  }

  if (!-[ASPCarryLog_ExtractUpload _tryCreateWorkDirectories](self, "_tryCreateWorkDirectories")) {
    -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0LL);
  }
  if (-[ASPCarryLog_ExtractUpload spdState](self, "spdState") == 1) {
    -[ASPCarryLog_ExtractUpload setSpdState:]( self,  "setSpdState:",  -[ASPCarryLog_ExtractUpload _tryExtractSpdToNextState](self, "_tryExtractSpdToNextState"));
  }
  if (-[ASPCarryLog_ExtractUpload spdState](self, "spdState") == 2)
  {
    if (-[ASPCarryLog_ExtractUpload isPeriodicSpd](self, "isPeriodicSpd"))
    {
      unsigned int v5 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "End this run after periodic spd extraction. Wait for next activity trigger to upload",  v15,  2u);
      }

      goto LABEL_25;
    }

    if (-[ASPCarryLog_ExtractUpload _tryDeferXpcActivity](self, "_tryDeferXpcActivity"))
    {
LABEL_25:
      int v6 = 0LL;
      goto LABEL_26;
    }

    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload _compressFilesForSpd:](self, "_compressFilesForSpd:", 1LL));
    if (v6)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload fileManager](self, "fileManager"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 attributesOfItemAtPath:v6 error:0]);
      -[ASPCarryLog_ExtractUpload setLastTotalUploadSize:]( self,  "setLastTotalUploadSize:",  [v10 fileSize]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload uploadDriver](self, "uploadDriver"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload taskingId](self, "taskingId"));
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload deviceId](self, "deviceId"));
      [v11 uploadFile:v6 TaskingId:v12 DeviceId:v13 LogType:@"com.apple.nand.iolog.spd"];

      -[ASPCarryLog_ExtractUpload _removeExtractedFiles](self, "_removeExtractedFiles");
      -[ASPCarryLog_ExtractUpload setSpdState:](self, "setSpdState:", 0LL);
    }
  }

  else
  {
    int v6 = 0LL;
  }

  if (!-[ASPCarryLog_ExtractUpload spdState](self, "spdState"))
  {
    if (-[ASPCarryLog_ExtractUpload isInternalBuild](self, "isInternalBuild"))
    {
      id v7 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting next SPD extraction time", v14, 2u);
      }

      -[ASPCarryLog_ExtractUpload _internalSetNextSpdExtractionTime](self, "_internalSetNextSpdExtractionTime");
    }

    -[ASPCarryLog_ExtractUpload _setUploadInfoWithSpdState:](self, "_setUploadInfoWithSpdState:", 0LL);
    if (-[ASPCarryLog_ExtractUpload uploadIdx](self, "uploadIdx") <= 0)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
      objc_msgSend(v8, "iolog_enable");
    }
  }

- (unsigned)_tryExtractSpdToNextState
{
  char v27 = 0;
  uint64_t v25 = 0LL;
  size_t __size = 0LL;
  unsigned int v24 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
  id v4 = [v3 getSpdHdrWithSize:&__size gcIdle:&v27 totalLbaCnt:&v25 estSpdSize:&v24];

  if (!v4 || !__size || !v25)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100041FD8();
    }
    size_t __size = 0LL;
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (!v27)
  {
    -[ASPCarryLog_ExtractUpload _forceDeferXpcActivity](self, "_forceDeferXpcActivity");
    free(v4);
    return 1;
  }

  id v5 = objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload spdFilePath](self, "spdFilePath"));
  int v6 = fopen((const char *)[v5 UTF8String], "w");

  if (!v6)
  {
    v12 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042004(v12, self);
    }
LABEL_17:
    free(v4);
LABEL_18:
    unsigned int v11 = 0;
    int v8 = 0;
    goto LABEL_19;
  }

  id v7 = (os_log_s *)oslog;
  if (v24 < 0xC800001)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start extracting full SPD data", v23, 2u);
    }

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
    unsigned int v19 = [v18 writeFullSpdToFileWithHdrBuf:v4 hdrSize:__size totalLbaCnt:v25 filePtr:v6 spdSizeLimit:209715200];

    id v20 = (os_log_s *)oslog;
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v23 = 0;
        unsigned int v11 = 2;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "SPD data successfully written to file.",  v23,  2u);
        char v10 = 0;
      }

      else
      {
        char v10 = 0;
        unsigned int v11 = 2;
      }

      int v8 = 1;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100042138();
      }
      int v8 = 0;
      unsigned int v11 = 0;
      char v10 = 1;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000420B0((int *)&v24, v7);
    }
    int v8 = 1;
    fwrite(v4, __size, 1uLL, v6);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASPCarryLog_ExtractUpload nandDriver](self, "nandDriver"));
    [v9 addSpdEstSizeExceedLimitToFile:v6 limit:209715200];

    char v10 = 0;
    unsigned int v11 = 2;
  }

  free(v4);
  fclose(v6);
  if ((v10 & 1) == 0)
  {
LABEL_36:
    if ((v8 & 1) == 0) {
      return v11;
    }
    goto LABEL_37;
  }

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (CarryLog_UploadDriver)uploadDriver
{
  return self->_uploadDriver;
}

- (void)setUploadDriver:(id)a3
{
}

- (StateMgr)stateMgr
{
  return self->_stateMgr;
}

- (void)setStateMgr:(id)a3
{
}

- (NSString)workDir
{
  return self->_workDir;
}

- (void)setWorkDir:(id)a3
{
}

- (NSString)taskingId
{
  return self->_taskingId;
}

- (void)setTaskingId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)endTimeStr
{
  return self->_endTimeStr;
}

- (void)setEndTimeStr:(id)a3
{
}

- (NSString)spdFilePath
{
  return self->_spdFilePath;
}

- (void)setSpdFilePath:(id)a3
{
}

- (NSString)tarInProgressDir
{
  return self->_tarInProgressDir;
}

- (void)setTarInProgressDir:(id)a3
{
}

- (NSString)iologPath
{
  return self->_iologPath;
}

- (void)setIologPath:(id)a3
{
}

- (NSString)nandcounterPath
{
  return self->_nandcounterPath;
}

- (void)setNandcounterPath:(id)a3
{
}

- (NSString)nandstatsPath
{
  return self->_nandstatsPath;
}

- (void)setNandstatsPath:(id)a3
{
}

- (NSString)convertedIologPath
{
  return self->_convertedIologPath;
}

- (void)setConvertedIologPath:(id)a3
{
}

- (NSString)pendingUploadFile
{
  return self->_pendingUploadFile;
}

- (void)setPendingUploadFile:(id)a3
{
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSString)uploadInfoKey
{
  return self->_uploadInfoKey;
}

- (void)setUploadInfoKey:(id)a3
{
}

- (NSDictionary)uploadInfo
{
  return self->_uploadInfo;
}

- (void)setUploadInfo:(id)a3
{
}

- (int)spdState
{
  return self->_spdState;
}

- (void)setSpdState:(int)a3
{
  self->_spdState = a3;
}

- (BOOL)isPeriodicSpd
{
  return self->_isPeriodicSpd;
}

- (void)setIsPeriodicSpd:(BOOL)a3
{
  self->_isPeriodicSpd = a3;
}

- (NSDate)nextSpdExtractTime
{
  return self->_nextSpdExtractTime;
}

- (void)setNextSpdExtractTime:(id)a3
{
}

- (int)uploadIdx
{
  return self->_uploadIdx;
}

- (void)setUploadIdx:(int)a3
{
  self->_uploadIdx = a3;
}

- (unint64_t)lastTotalUploadSize
{
  return self->_lastTotalUploadSize;
}

- (void)setLastTotalUploadSize:(unint64_t)a3
{
  self->_lastTotalUploadSize = a3;
}

- (unint64_t)uploadSizeLimit
{
  return self->_uploadSizeLimit;
}

- (void)setUploadSizeLimit:(unint64_t)a3
{
  self->_uploadSizeLimit = a3;
}

- (BOOL)isEnoughDiskSpace
{
  return self->_isEnoughDiskSpace;
}

- (void)setIsEnoughDiskSpace:(BOOL)a3
{
  self->_isEnoughDiskSpace = a3;
}

- (int)numB2BZipErrors
{
  return self->_numB2BZipErrors;
}

- (void)setNumB2BZipErrors:(int)a3
{
  self->_numB2BZipErrors = a3;
}

- (XpcActivityManager)xpcActivityMgr
{
  return self->_xpcActivityMgr;
}

- (void)setXpcActivityMgr:(id)a3
{
}

- (BOOL)isIOLogEnableNeeded
{
  return self->_isIOLogEnableNeeded;
}

- (void)setIsIOLogEnableNeeded:(BOOL)a3
{
  self->_isIOLogEnableNeeded = a3;
}

- (void).cxx_destruct
{
}

@end