@interface MAAutoAssetControlStatisticsByCommand
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetControlStatisticsByCommand)init;
- (MAAutoAssetControlStatisticsByCommand)initWithCoder:(id)a3;
- (MAAutoAssetControlStatisticsByCommand)initWithInitialValue:(int64_t)a3;
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

@implementation MAAutoAssetControlStatisticsByCommand

- (MAAutoAssetControlStatisticsByCommand)init
{
  return -[MAAutoAssetControlStatisticsByCommand initWithInitialValue:](self, "initWithInitialValue:", 0LL);
}

- (MAAutoAssetControlStatisticsByCommand)initWithInitialValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand;
  result = -[MAAutoAssetControlStatisticsByCommand init](&v5, sel_init);
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

- (MAAutoAssetControlStatisticsByCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand;
  objc_super v5 = -[MAAutoAssetControlStatisticsByCommand init](&v7, sel_init);
  if (v5)
  {
    v5->_interestInContent = [v4 decodeInt64ForKey:@"interestInContent"];
    v5->_checkForNewer = [v4 decodeInt64ForKey:@"checkForNewer"];
    v5->_determineIfAvailable = [v4 decodeInt64ForKey:@"determineIfAvailable"];
    v5->_currentStatus = [v4 decodeInt64ForKey:@"currentStatus"];
    v5->_lockContent = [v4 decodeInt64ForKey:@"lockContent"];
    v5->_mapLockedContent = [v4 decodeInt64ForKey:@"mapLockedContent"];
    v5->_continueLockUsage = [v4 decodeInt64ForKey:@"continueLockUsage"];
    v5->_endLockUsage = [v4 decodeInt64ForKey:@"endLockUsage"];
    v5->_endPreviousLocks = [v4 decodeInt64ForKey:@"endPreviousLocks"];
    v5->_endAllPreviousLocks = [v4 decodeInt64ForKey:@"endAllPreviousLocks"];
    v5->_eliminateAllForSelector = [v4 decodeInt64ForKey:@"eliminateAllForSelector"];
    v5->_eliminateAllForAssetType = [v4 decodeInt64ForKey:@"eliminateAllForAssetType"];
    v5->_eliminatePromotedNeverLockedForSelector = [v4 decodeInt64ForKey:@"eliminatePromotedNeverLockedForSelector"];
    v5->_stageDetermineAllAvailable = [v4 decodeInt64ForKey:@"stageDetermineAllAvailable"];
    v5->_stageDownloadAll = [v4 decodeInt64ForKey:@"stageDownloadAll"];
    v5->_stagePurgeAll = [v4 decodeInt64ForKey:@"stagePurgeAll"];
    v5->_stageEraseAll = [v4 decodeInt64ForKey:@"stageEraseAll"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  @"interestInContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  @"checkForNewer");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  @"determineIfAvailable");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  @"currentStatus");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  @"lockContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  @"mapLockedContent");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  @"continueLockUsage");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  @"endLockUsage");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  @"endPreviousLocks");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  @"endAllPreviousLocks");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  @"eliminateAllForSelector");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  @"eliminateAllForAssetType");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  @"eliminatePromotedNeverLockedForSelector");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  @"stageDetermineAllAvailable");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  @"stageDownloadAll");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  @"stagePurgeAll");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"),  @"stageEraseAll");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)incrementForClientRequestMessage:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(MEMORY[0x189612760], "stringIsEqual:to:"))
  {
    -[MAAutoAssetControlStatisticsByCommand setInterestInContent:]( self,  "setInterestInContent:",  -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:CHECK_FOR_NEWER"])
  {
    -[MAAutoAssetControlStatisticsByCommand setCheckForNewer:]( self,  "setCheckForNewer:",  -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:DETERMINE_IF_AVAILABLE"])
  {
    -[MAAutoAssetControlStatisticsByCommand setDetermineIfAvailable:]( self,  "setDetermineIfAvailable:",  -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:LOCK_CONTENT"])
  {
    -[MAAutoAssetControlStatisticsByCommand setLockContent:]( self,  "setLockContent:",  -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"])
  {
    -[MAAutoAssetControlStatisticsByCommand setMapLockedContent:]( self,  "setMapLockedContent:",  -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:CONTINUE_LOCK_USAGE"])
  {
    -[MAAutoAssetControlStatisticsByCommand setContinueLockUsage:]( self,  "setContinueLockUsage:",  -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:END_LOCK_USAGE"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEndLockUsage:]( self,  "setEndLockUsage:",  -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:END_PREVIOUS_LOCKS"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEndPreviousLocks:]( self,  "setEndPreviousLocks:",  -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:END_ALL_PREVIOUS_LOCKS"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEndAllPreviousLocks:]( self,  "setEndAllPreviousLocks:",  -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEliminateAllForSelector:]( self,  "setEliminateAllForSelector:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEliminateAllForAssetType:]( self,  "setEliminateAllForAssetType:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"])
  {
    -[MAAutoAssetControlStatisticsByCommand setEliminatePromotedNeverLockedForSelector:]( self,  "setEliminatePromotedNeverLockedForSelector:",  -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector")
    + 1);
  }

  else if (([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"] & 1) != 0 || (objc_msgSend( MEMORY[0x189612760],  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE") & 1) != 0 || objc_msgSend( MEMORY[0x189612760],  "stringIsEqual:to:",  v4,  @"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"))
  {
    -[MAAutoAssetControlStatisticsByCommand setStageDetermineAllAvailable:]( self,  "setStageDetermineAllAvailable:",  -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable") + 1);
  }

  else if (([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS"] & 1) != 0 {
         || [MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO-STAGE:DOWNLOAD_ALL"])
  }
  {
    -[MAAutoAssetControlStatisticsByCommand setStageDownloadAll:]( self,  "setStageDownloadAll:",  -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO-STAGE:PURGE_ALL"])
  {
    -[MAAutoAssetControlStatisticsByCommand setStagePurgeAll:]( self,  "setStagePurgeAll:",  -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll") + 1);
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v4 to:@"MA-AUTO-STAGE:ERASE_ALL"])
  {
    -[MAAutoAssetControlStatisticsByCommand setStageEraseAll:]( self,  "setStageEraseAll:",  -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll") + 1);
  }
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControlStatisticsByCommand);
  -[MAAutoAssetControlStatisticsByCommand setInterestInContent:]( v3,  "setInterestInContent:",  -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"));
  -[MAAutoAssetControlStatisticsByCommand setCheckForNewer:]( v3,  "setCheckForNewer:",  -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"));
  -[MAAutoAssetControlStatisticsByCommand setDetermineIfAvailable:]( v3,  "setDetermineIfAvailable:",  -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"));
  -[MAAutoAssetControlStatisticsByCommand setCurrentStatus:]( v3,  "setCurrentStatus:",  -[MAAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"));
  -[MAAutoAssetControlStatisticsByCommand setLockContent:]( v3,  "setLockContent:",  -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"));
  -[MAAutoAssetControlStatisticsByCommand setMapLockedContent:]( v3,  "setMapLockedContent:",  -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"));
  -[MAAutoAssetControlStatisticsByCommand setContinueLockUsage:]( v3,  "setContinueLockUsage:",  -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"));
  -[MAAutoAssetControlStatisticsByCommand setEndLockUsage:]( v3,  "setEndLockUsage:",  -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"));
  -[MAAutoAssetControlStatisticsByCommand setEndPreviousLocks:]( v3,  "setEndPreviousLocks:",  -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"));
  -[MAAutoAssetControlStatisticsByCommand setEndAllPreviousLocks:]( v3,  "setEndAllPreviousLocks:",  -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"));
  -[MAAutoAssetControlStatisticsByCommand setEliminateAllForSelector:]( v3,  "setEliminateAllForSelector:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"));
  -[MAAutoAssetControlStatisticsByCommand setEliminateAllForAssetType:]( v3,  "setEliminateAllForAssetType:",  -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"));
  -[MAAutoAssetControlStatisticsByCommand setEliminatePromotedNeverLockedForSelector:]( v3,  "setEliminatePromotedNeverLockedForSelector:",  -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"));
  -[MAAutoAssetControlStatisticsByCommand setStageDetermineAllAvailable:]( v3,  "setStageDetermineAllAvailable:",  -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"));
  -[MAAutoAssetControlStatisticsByCommand setStageDownloadAll:]( v3,  "setStageDownloadAll:",  -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"));
  -[MAAutoAssetControlStatisticsByCommand setStagePurgeAll:]( v3,  "setStagePurgeAll:",  -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"));
  -[MAAutoAssetControlStatisticsByCommand setStageEraseAll:]( v3,  "setStageEraseAll:",  -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
  return v3;
}

- (int64_t)total
{
  int64_t v3 = -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent");
  int64_t v4 = -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer") + v3;
  int64_t v5 = -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable");
  int64_t v6 = v4 + v5 + -[MAAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus");
  int64_t v7 = -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent");
  int64_t v8 = v7 + -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent");
  int64_t v9 = v6 + v8 + -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage");
  int64_t v10 = -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage");
  int64_t v11 = v10 + -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks");
  int64_t v12 = v11 + -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks");
  uint64_t v13 = v9 + v12 + -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector");
  int64_t v14 = -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType");
  int64_t v15 = v14
      + -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector");
  int64_t v16 = v15 + -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable");
  int64_t v17 = v16 + -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll");
  uint64_t v18 = v13 + v17 + -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll");
  return v18 + -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll");
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @">>>\n                       interestInContent: %lld\n                           checkForNewer: %lld\n                    determineIfAvailable: %lld\n                           currentStatus: %lld\n                             lockContent: %lld\n                        mapLockedContent: %lld\n                       continueLockUsage: %lld\n                            endLockUsage: %lld\n                        endPreviousLocks: %lld\n                     endAllPreviousLocks: %lld\n                 eliminateAllForSelector: %lld\n                eliminateAllForAssetType: %lld\n eliminatePromotedNeverLockedForSelector: %lld\n              stageDetermineAllAvailable: %lld\n                        stageDownloadAll: %lld\n                           stagePurgeAll: %lld\n                           stageEraseAll: %lld\n<<<]",  -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  -[MAAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
}

- (id)summary
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"[interestInContent:%lld,checkForNewer:%lld,determineIfAvailable:%lld,currentStatus:%lld,lockContent:%lld,mapLockedContent:%lld,continueLockUsage:%lld,endLockUsage:%lld,endPreviousLocks:%lld,endAllPreviousLocks:%lld|eliminateAllForSelector:%lld|eliminateAllForAssetType:%lld|eliminatePromotedNeverLockedForSelector:%lld|stageDetermineAllAvailable:%lld,stageDownloadAll:%lld,stagePurgeAll:%lld,stageEraseAll:%lld]",  -[MAAutoAssetControlStatisticsByCommand interestInContent](self, "interestInContent"),  -[MAAutoAssetControlStatisticsByCommand checkForNewer](self, "checkForNewer"),  -[MAAutoAssetControlStatisticsByCommand determineIfAvailable](self, "determineIfAvailable"),  -[MAAutoAssetControlStatisticsByCommand currentStatus](self, "currentStatus"),  -[MAAutoAssetControlStatisticsByCommand lockContent](self, "lockContent"),  -[MAAutoAssetControlStatisticsByCommand mapLockedContent](self, "mapLockedContent"),  -[MAAutoAssetControlStatisticsByCommand continueLockUsage](self, "continueLockUsage"),  -[MAAutoAssetControlStatisticsByCommand endLockUsage](self, "endLockUsage"),  -[MAAutoAssetControlStatisticsByCommand endPreviousLocks](self, "endPreviousLocks"),  -[MAAutoAssetControlStatisticsByCommand endAllPreviousLocks](self, "endAllPreviousLocks"),  -[MAAutoAssetControlStatisticsByCommand eliminateAllForSelector](self, "eliminateAllForSelector"),  -[MAAutoAssetControlStatisticsByCommand eliminateAllForAssetType](self, "eliminateAllForAssetType"),  -[MAAutoAssetControlStatisticsByCommand eliminatePromotedNeverLockedForSelector]( self,  "eliminatePromotedNeverLockedForSelector"),  -[MAAutoAssetControlStatisticsByCommand stageDetermineAllAvailable](self, "stageDetermineAllAvailable"),  -[MAAutoAssetControlStatisticsByCommand stageDownloadAll](self, "stageDownloadAll"),  -[MAAutoAssetControlStatisticsByCommand stagePurgeAll](self, "stagePurgeAll"),  -[MAAutoAssetControlStatisticsByCommand stageEraseAll](self, "stageEraseAll"));
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

- (int64_t)stagePurgeAll
{
  return self->_stagePurgeAll;
}

- (void)setStagePurgeAll:(int64_t)a3
{
  self->_stagePurgeAll = a3;
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