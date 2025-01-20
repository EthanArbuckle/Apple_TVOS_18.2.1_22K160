@interface MANAutoAssetControlStatisticsByCommand
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetControlStatisticsByCommand)init;
- (MANAutoAssetControlStatisticsByCommand)initWithCoder:(id)a3;
- (MANAutoAssetControlStatisticsByCommand)initWithInitialValue:(int64_t)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)checkForNewer;
- (int64_t)continueLockUsage;
- (int64_t)currentStatus;
- (int64_t)determineIfAvailable;
- (int64_t)eliminateAllForAssetType;
- (int64_t)eliminateAllForSelector;
- (int64_t)eliminatePromotedNeverLockedForSelector;
- (int64_t)endAllPreviousLocks;
- (int64_t)endLockUsage;
- (int64_t)endPreviousLocks;
- (int64_t)interestInContent;
- (int64_t)lockContent;
- (int64_t)mapLockedContent;
- (int64_t)stageDetermineAllAvailable;
- (int64_t)stageDownloadAll;
- (int64_t)stageEraseAll;
- (int64_t)stagePurgeAll;
- (int64_t)total;
- (void)encodeWithCoder:(id)a3;
- (void)incrementForClientRequestMessage:(id)a3;
- (void)setCheckForNewer:(int64_t)a3;
- (void)setContinueLockUsage:(int64_t)a3;
- (void)setCurrentStatus:(int64_t)a3;
- (void)setDetermineIfAvailable:(int64_t)a3;
- (void)setEliminateAllForAssetType:(int64_t)a3;
- (void)setEliminateAllForSelector:(int64_t)a3;
- (void)setEliminatePromotedNeverLockedForSelector:(int64_t)a3;
- (void)setEndAllPreviousLocks:(int64_t)a3;
- (void)setEndLockUsage:(int64_t)a3;
- (void)setEndPreviousLocks:(int64_t)a3;
- (void)setInterestInContent:(int64_t)a3;
- (void)setLockContent:(int64_t)a3;
- (void)setMapLockedContent:(int64_t)a3;
- (void)setStageDetermineAllAvailable:(int64_t)a3;
- (void)setStageDownloadAll:(int64_t)a3;
- (void)setStageEraseAll:(int64_t)a3;
- (void)setStagePurgeAll:(int64_t)a3;
@end

@implementation MANAutoAssetControlStatisticsByCommand

- (void)incrementForClientRequestMessage:(id)a3
{
  id v4 = a3;
  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:"))
  {
    -[MANAutoAssetControlStatisticsByCommand setInterestInContent:]( self,  "setInterestInContent:",  (char *)-[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:CHECK_FOR_NEWER"))
  {
    -[MANAutoAssetControlStatisticsByCommand setCheckForNewer:]( self,  "setCheckForNewer:",  (char *)-[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:DETERMINE_IF_AVAILABLE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setDetermineIfAvailable:]( self,  "setDetermineIfAvailable:",  (char *)-[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:LOCK_CONTENT"))
  {
    -[MANAutoAssetControlStatisticsByCommand setLockContent:]( self,  "setLockContent:",  (char *)-[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setMapLockedContent:]( self,  "setMapLockedContent:",  (char *)-[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:CONTINUE_LOCK_USAGE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setContinueLockUsage:]( self,  "setContinueLockUsage:",  (char *)-[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:END_LOCK_USAGE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEndLockUsage:]( self,  "setEndLockUsage:",  (char *)-[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:END_PREVIOUS_LOCKS"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEndPreviousLocks:]( self,  "setEndPreviousLocks:",  (char *)-[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:END_ALL_PREVIOUS_LOCKS"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEndAllPreviousLocks:]( self,  "setEndAllPreviousLocks:",  (char *)-[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEliminateAllForSelector:]( self,  "setEliminateAllForSelector:",  (char *)-[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEliminateAllForAssetType:]( self,  "setEliminateAllForAssetType:",  (char *)-[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"))
  {
    -[MANAutoAssetControlStatisticsByCommand setEliminatePromotedNeverLockedForSelector:]( self,  "setEliminatePromotedNeverLockedForSelector:",  (char *)-[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector")
    + 1);
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"))
  {
    -[MANAutoAssetControlStatisticsByCommand setStageDetermineAllAvailable:]( self,  "setStageDetermineAllAvailable:",  (char *)-[MANAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable")
    + 1);
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DOWNLOAD_GROUPS") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DOWNLOAD_ALL"))
  {
    -[MANAutoAssetControlStatisticsByCommand setStageDownloadAll:]( self,  "setStageDownloadAll:",  (char *)-[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:PURGE_ALL"))
  {
    -[MANAutoAssetControlStatisticsByCommand setStagePurgeAll:]( self,  "setStagePurgeAll:",  (char *)-[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll") + 1);
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:ERASE_ALL"))
  {
    -[MANAutoAssetControlStatisticsByCommand setStageEraseAll:]( self,  "setStageEraseAll:",  (char *)-[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll") + 1);
  }
}

- (int64_t)stagePurgeAll
{
  return self->_stagePurgeAll;
}

- (void)setStagePurgeAll:(int64_t)a3
{
  self->_stagePurgeAll = a3;
}

- (MANAutoAssetControlStatisticsByCommand)init
{
  return -[MANAutoAssetControlStatisticsByCommand initWithInitialValue:](self, "initWithInitialValue:", 0LL);
}

- (MANAutoAssetControlStatisticsByCommand)initWithInitialValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand;
  result = -[MANAutoAssetControlStatisticsByCommand init](&v5, "init");
  if (result)
  {
    result->_interestInContent = a3;
    result->_checkForNewer = a3;
    result->_determineIfAvailable = a3;
    result->_currentStatus = a3;
    result->_lockContent = a3;
    result->_mapLockedContent = a3;
    result->_continueLockUsage = a3;
    result->_endLockUsage = a3;
    result->_endPreviousLocks = a3;
    result->_endAllPreviousLocks = a3;
    result->_eliminateAllForSelector = a3;
    result->_eliminateAllForAssetType = a3;
    result->_eliminatePromotedNeverLockedForSelector = a3;
    result->_stageDetermineAllAvailable = a3;
    result->_stageDownloadAll = a3;
    result->_stagePurgeAll = a3;
    result->_stageEraseAll = a3;
  }

  return result;
}

- (MANAutoAssetControlStatisticsByCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand;
  objc_super v5 = -[MANAutoAssetControlStatisticsByCommand init](&v7, "init");
  if (v5)
  {
    v5->_interestInContent = (int64_t)[v4 decodeInt64ForKey:@"interestInContent"];
    v5->_checkForNewer = (int64_t)[v4 decodeInt64ForKey:@"checkForNewer"];
    v5->_determineIfAvailable = (int64_t)[v4 decodeInt64ForKey:@"determineIfAvailable"];
    v5->_currentStatus = (int64_t)[v4 decodeInt64ForKey:@"currentStatus"];
    v5->_lockContent = (int64_t)[v4 decodeInt64ForKey:@"lockContent"];
    v5->_mapLockedContent = (int64_t)[v4 decodeInt64ForKey:@"mapLockedContent"];
    v5->_continueLockUsage = (int64_t)[v4 decodeInt64ForKey:@"continueLockUsage"];
    v5->_endLockUsage = (int64_t)[v4 decodeInt64ForKey:@"endLockUsage"];
    v5->_endPreviousLocks = (int64_t)[v4 decodeInt64ForKey:@"endPreviousLocks"];
    v5->_endAllPreviousLocks = (int64_t)[v4 decodeInt64ForKey:@"endAllPreviousLocks"];
    v5->_eliminateAllForSelector = (int64_t)[v4 decodeInt64ForKey:@"eliminateAllForSelector"];
    v5->_eliminateAllForAssetType = (int64_t)[v4 decodeInt64ForKey:@"eliminateAllForAssetType"];
    v5->_eliminatePromotedNeverLockedForSelector = (int64_t)[v4 decodeInt64ForKey:@"eliminatePromotedNeverLockedForSelector"];
    v5->_stageDetermineAllAvailable = (int64_t)[v4 decodeInt64ForKey:@"stageDetermineAllAvailable"];
    v5->_stageDownloadAll = (int64_t)[v4 decodeInt64ForKey:@"stageDownloadAll"];
    v5->_stagePurgeAll = (int64_t)[v4 decodeInt64ForKey:@"stagePurgeAll"];
    v5->_stageEraseAll = (int64_t)[v4 decodeInt64ForKey:@"stageEraseAll"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  @"interestInContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  @"checkForNewer");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  @"determineIfAvailable");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  @"currentStatus");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  @"lockContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  @"mapLockedContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  @"continueLockUsage");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  @"endLockUsage");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  @"endPreviousLocks");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  @"endAllPreviousLocks");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  @"eliminateAllForSelector");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  @"eliminateAllForAssetType");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  @"eliminatePromotedNeverLockedForSelector");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  @"stageDetermineAllAvailable");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  @"stageDownloadAll");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  @"stagePurgeAll");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"),  @"stageEraseAll");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetControlStatisticsByCommand);
  -[MANAutoAssetControlStatisticsByCommand setInterestInContent:]( v3,  "setInterestInContent:",  -[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"));
  -[MANAutoAssetControlStatisticsByCommand setCheckForNewer:]( v3,  "setCheckForNewer:",  -[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"));
  -[MANAutoAssetControlStatisticsByCommand setDetermineIfAvailable:]( v3,  "setDetermineIfAvailable:",  -[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"));
  -[MANAutoAssetControlStatisticsByCommand setCurrentStatus:]( v3,  "setCurrentStatus:",  -[MANAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"));
  -[MANAutoAssetControlStatisticsByCommand setLockContent:]( v3,  "setLockContent:",  -[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"));
  -[MANAutoAssetControlStatisticsByCommand setMapLockedContent:]( v3,  "setMapLockedContent:",  -[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"));
  -[MANAutoAssetControlStatisticsByCommand setContinueLockUsage:]( v3,  "setContinueLockUsage:",  -[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"));
  -[MANAutoAssetControlStatisticsByCommand setEndLockUsage:]( v3,  "setEndLockUsage:",  -[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"));
  -[MANAutoAssetControlStatisticsByCommand setEndPreviousLocks:]( v3,  "setEndPreviousLocks:",  -[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"));
  -[MANAutoAssetControlStatisticsByCommand setEndAllPreviousLocks:]( v3,  "setEndAllPreviousLocks:",  -[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"));
  -[MANAutoAssetControlStatisticsByCommand setEliminateAllForSelector:]( v3,  "setEliminateAllForSelector:",  -[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"));
  -[MANAutoAssetControlStatisticsByCommand setEliminateAllForAssetType:]( v3,  "setEliminateAllForAssetType:",  -[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"));
  -[MANAutoAssetControlStatisticsByCommand setEliminatePromotedNeverLockedForSelector:]( v3,  "setEliminatePromotedNeverLockedForSelector:",  -[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"));
  -[MANAutoAssetControlStatisticsByCommand setStageDetermineAllAvailable:]( v3,  "setStageDetermineAllAvailable:",  -[MANAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"));
  -[MANAutoAssetControlStatisticsByCommand setStageDownloadAll:]( v3,  "setStageDownloadAll:",  -[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"));
  -[MANAutoAssetControlStatisticsByCommand setStagePurgeAll:]( v3,  "setStagePurgeAll:",  -[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"));
  -[MANAutoAssetControlStatisticsByCommand setStageEraseAll:]( v3,  "setStageEraseAll:",  -[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
  return v3;
}

- (int64_t)total
{
  int64_t v3 = -[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent");
  id v4 = (char *)-[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer") + v3;
  int64_t v5 = -[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable");
  v6 = (char *)-[MANAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus") + v5 + (void)v4;
  int64_t v7 = -[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent");
  v8 = (char *)-[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent") + v7;
  v9 = &v6[-[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage") + (void)v8];
  int64_t v10 = -[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage");
  v11 = (char *)-[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks") + v10;
  v12 = (char *)-[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks") + (void)v11;
  v13 = &v9[-[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector")
          + (void)v12];
  int64_t v14 = -[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType");
  v15 = (char *)-[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector")
      + v14;
  v17 = (char *)-[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll") + (void)v16;
  v18 = &v13[-[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll") + (void)v17];
  return -[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll") + (void)v18;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                       interestInContent: %lld\n                           checkForNewer: %lld\n                    determineIfAvailable: %lld\n                           currentStatus: %lld\n                             lockContent: %lld\n                        mapLockedContent: %lld\n                       continueLockUsage: %lld\n                            endLockUsage: %lld\n                        endPreviousLocks: %lld\n                     endAllPreviousLocks: %lld\n                 eliminateAllForSelector: %lld\n                eliminateAllForAssetType: %lld\n eliminatePromotedNeverLockedForSelector: %lld\n              stageDetermineAllAvailable: %lld\n                        stageDownloadAll: %lld\n                           stagePurgeAll: %lld\n                           stageEraseAll: %lld\n<<<]",  -[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  -[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  -[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  -[MANAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  -[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  -[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  -[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  -[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  -[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  -[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  -[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  -[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  -[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  -[MANAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  -[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  -[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  -[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
}

- (id)summary
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[interestInContent:%lld,checkForNewer:%lld,determineIfAvailable:%lld,currentStatus:%lld,lockContent:%lld,mapLockedContent:%lld,continueLockUsage:%lld,endLockUsage:%lld,endPreviousLocks:%lld,endAllPreviousLocks:%lld|eliminateAllForSelector:%lld|eliminateAllForAssetType:%lld|eliminatePromotedNeverLockedForSelector:%lld|stageDetermineAllAvailable:%lld,stageDownloadAll:%lld,stagePurgeAll:%lld,stageEraseAll:%lld]",  -[MANAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  -[MANAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  -[MANAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  -[MANAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  -[MANAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  -[MANAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  -[MANAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  -[MANAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  -[MANAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  -[MANAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  -[MANAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  -[MANAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  -[MANAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  -[MANAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  -[MANAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  -[MANAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  -[MANAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
}

- (int64_t)interestInContent
{
  return self->_interestInContent;
}

- (void)setInterestInContent:(int64_t)a3
{
  self->_interestInContent = a3;
}

- (int64_t)checkForNewer
{
  return self->_checkForNewer;
}

- (void)setCheckForNewer:(int64_t)a3
{
  self->_checkForNewer = a3;
}

- (int64_t)determineIfAvailable
{
  return self->_determineIfAvailable;
}

- (void)setDetermineIfAvailable:(int64_t)a3
{
  self->_determineIfAvailable = a3;
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(int64_t)a3
{
  self->_currentStatus = a3;
}

- (int64_t)lockContent
{
  return self->_lockContent;
}

- (void)setLockContent:(int64_t)a3
{
  self->_lockContent = a3;
}

- (int64_t)mapLockedContent
{
  return self->_mapLockedContent;
}

- (void)setMapLockedContent:(int64_t)a3
{
  self->_mapLockedContent = a3;
}

- (int64_t)continueLockUsage
{
  return self->_continueLockUsage;
}

- (void)setContinueLockUsage:(int64_t)a3
{
  self->_continueLockUsage = a3;
}

- (int64_t)endLockUsage
{
  return self->_endLockUsage;
}

- (void)setEndLockUsage:(int64_t)a3
{
  self->_endLockUsage = a3;
}

- (int64_t)endPreviousLocks
{
  return self->_endPreviousLocks;
}

- (void)setEndPreviousLocks:(int64_t)a3
{
  self->_endPreviousLocks = a3;
}

- (int64_t)endAllPreviousLocks
{
  return self->_endAllPreviousLocks;
}

- (void)setEndAllPreviousLocks:(int64_t)a3
{
  self->_endAllPreviousLocks = a3;
}

- (int64_t)eliminateAllForSelector
{
  return self->_eliminateAllForSelector;
}

- (void)setEliminateAllForSelector:(int64_t)a3
{
  self->_eliminateAllForSelector = a3;
}

- (int64_t)eliminateAllForAssetType
{
  return self->_eliminateAllForAssetType;
}

- (void)setEliminateAllForAssetType:(int64_t)a3
{
  self->_eliminateAllForAssetType = a3;
}

- (int64_t)eliminatePromotedNeverLockedForSelector
{
  return self->_eliminatePromotedNeverLockedForSelector;
}

- (void)setEliminatePromotedNeverLockedForSelector:(int64_t)a3
{
  self->_eliminatePromotedNeverLockedForSelector = a3;
}

- (int64_t)stageDetermineAllAvailable
{
  return self->_stageDetermineAllAvailable;
}

- (void)setStageDetermineAllAvailable:(int64_t)a3
{
  self->_stageDetermineAllAvailable = a3;
}

- (int64_t)stageDownloadAll
{
  return self->_stageDownloadAll;
}

- (void)setStageDownloadAll:(int64_t)a3
{
  self->_stageDownloadAll = a3;
}

- (int64_t)stageEraseAll
{
  return self->_stageEraseAll;
}

- (void)setStageEraseAll:(int64_t)a3
{
  self->_stageEraseAll = a3;
}

@end