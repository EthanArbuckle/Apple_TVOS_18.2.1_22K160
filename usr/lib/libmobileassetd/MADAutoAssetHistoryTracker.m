@interface MADAutoAssetHistoryTracker
+ (BOOL)supportsSecureCoding;
+ (id)currentTime;
+ (id)nameForHistoryType:(int64_t)a3;
+ (id)newBucketFilename:(int64_t)a3 forBucketIndex:(int64_t)a4;
+ (id)operationName:(int64_t)a3;
+ (id)paddedNameForClient:(id)a3;
+ (id)paddedNameForErrorCode:(id)a3;
+ (id)paddedNameForErrorDomain:(id)a3;
+ (id)paddedNameForHistoryLayer:(int64_t)a3;
+ (id)selectorNameForSelector:(id)a3;
- (BOOL)loadedFromPersistedState;
- (BOOL)makeSureHistoryDirectoryExists;
- (MADAutoAssetHistoryTracker)initWithCoder:(id)a3;
- (OS_dispatch_queue)protectionQueue;
- (id)historyTypeName;
- (id)initForHistoryType:(int64_t)a3 withMaximumFilesystemBytes:(int64_t)a4 usingProtectionQueue:(id)a5;
- (id)newBucketIndexFilename;
- (id)summary;
- (int64_t)currentBucketFileIndex;
- (int64_t)currentBucketFilesystemBytes;
- (int64_t)historyType;
- (int64_t)maximumBucketFilesystemBytes;
- (int64_t)recordFormattedHistoryEntry:(id)a3 toBucketFilename:(id)a4 settingCurrentBucketBytes:(BOOL)a5;
- (void)createBucketIndexFile;
- (void)createEmptyBucketFileForIndex:(int64_t)a3 settingCurrentBucketBytes:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)loadBucketIndex;
- (void)loadPersistedState;
- (void)makeSureHistoryDirectoryExists;
- (void)recordHistoryEntry:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 fromLayer:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8 usageCount:(int64_t)a9 configuredCount:(int64_t)a10 requestedCount:(int64_t)a11 fromPallasCount:(int64_t)a12 vendingCount:(int64_t)a13 forClientDomainName:(id)a14 forAssetSetIdentifier:(id)a15 forAtomicInstance:(id)a16 withAddendumMessage:(id)a17 failingWithError:(id)a18;
- (void)setCurrentBucketFileIndex:(int64_t)a3;
- (void)setCurrentBucketFilesystemBytes:(int64_t)a3;
- (void)setLoadedFromPersistedState:(BOOL)a3;
- (void)setMaximumBucketFilesystemBytes:(int64_t)a3;
- (void)verifyAllOtherBucketFilesExist;
@end

@implementation MADAutoAssetHistoryTracker

+ (id)operationName:(int64_t)a3
{
  id result = @"UNKNOWN";
  if (a3 <= 499)
  {
    if (a3 > 249)
    {
      switch(a3)
      {
        case 300LL:
          id result = @"DEL_CLIENT_ELIMINATE       ";
          break;
        case 301LL:
          id result = @"DEL_CLIENT_ELIM_NEVER_LOCK ";
          break;
        case 302LL:
          id result = @"DEL_CLIENT_UNLOCK          ";
          break;
        case 303LL:
          id result = @"DEL_CLIENT_UNLOCK_INHIBITED";
          break;
        case 304LL:
        case 305LL:
        case 306LL:
        case 307LL:
        case 308LL:
        case 309LL:
        case 310LL:
        case 311LL:
        case 312LL:
        case 313LL:
        case 314LL:
        case 315LL:
        case 316LL:
        case 317LL:
        case 318LL:
        case 319LL:
        case 339LL:
        case 340LL:
        case 341LL:
        case 342LL:
        case 343LL:
        case 344LL:
        case 345LL:
        case 346LL:
        case 347LL:
        case 348LL:
        case 349LL:
        case 358LL:
        case 359LL:
        case 360LL:
        case 361LL:
        case 362LL:
        case 363LL:
        case 364LL:
        case 365LL:
        case 366LL:
        case 367LL:
        case 368LL:
        case 369LL:
        case 383LL:
        case 384LL:
        case 385LL:
        case 386LL:
        case 387LL:
        case 388LL:
        case 389LL:
        case 390LL:
        case 391LL:
        case 392LL:
        case 393LL:
        case 394LL:
        case 395LL:
        case 396LL:
        case 397LL:
        case 398LL:
        case 399LL:
        case 409LL:
        case 410LL:
        case 411LL:
        case 412LL:
        case 413LL:
        case 414LL:
        case 415LL:
        case 416LL:
        case 417LL:
        case 418LL:
        case 419LL:
        case 421LL:
        case 422LL:
        case 423LL:
        case 424LL:
        case 425LL:
        case 426LL:
        case 427LL:
        case 428LL:
        case 429LL:
        case 430LL:
        case 431LL:
        case 432LL:
        case 433LL:
        case 434LL:
        case 435LL:
        case 436LL:
        case 437LL:
        case 438LL:
        case 439LL:
          return result;
        case 320LL:
          id result = @"DEL_AI_DROP_LOAD_PERSISTED ";
          break;
        case 321LL:
          id result = @"DEL_AI_DISCOVERED_NOT_DWNLD";
          break;
        case 322LL:
          id result = @"DEL_AI_NO_CONTENT_FILESYSTM";
          break;
        case 323LL:
          id result = @"DEL_AI_FAILED_ALLOCATION   ";
          break;
        case 324LL:
          id result = @"DEL_AI_DROP_CROSS_CHK_TRIM ";
          break;
        case 325LL:
          id result = @"DEL_AI_DROP_UNLOCKED_OTHER ";
          break;
        case 326LL:
          id result = @"DEL_AI_ELIMINATE_LOAD_PERSD";
          break;
        case 327LL:
          id result = @"DEL_AI_ELIMINATE_MATCH_SID ";
          break;
        case 328LL:
          id result = @"DEL_AI_ELIMINATE_RMV_CONTNT";
          break;
        case 329LL:
          id result = @"DEL_AI_DROP_LOAD_SET_DESCRS";
          break;
        case 330LL:
          id result = @"DEL_AI_DROP_CRSS_CHK_DESCRS";
          break;
        case 331LL:
          id result = @"DEL_AI_RMV_PREVIOUS_STAGED ";
          break;
        case 332LL:
          id result = @"DEL_AI_RMV_CURRENT_SET_JOB ";
          break;
        case 333LL:
          id result = @"DEL_AI_RMV_CURR_SET_JOB_2ND";
          break;
        case 334LL:
          id result = @"DEL_AI_CROSS_CHECK_TRIM    ";
          break;
        case 335LL:
          id result = @"DEL_AI_OVERFLOW_TRIM       ";
          break;
        case 336LL:
          id result = @"DEL_AI_DROP_OVERFLOW_TRIM_D";
          break;
        case 337LL:
          id result = @"DEL_AI_DROP_FAIL_ALLOC     ";
          break;
        case 338LL:
          id result = @"DEL_AI_DROP_INCOMPLETE     ";
          break;
        case 350LL:
          id result = @"ADD_SD_PROMOTED_STARTUP    ";
          break;
        case 351LL:
          id result = @"ADD_SD_FROM_STAGED_DESCR   ";
          break;
        case 352LL:
          id result = @"ADD_SD_PRE_INSTALLED       ";
          break;
        case 353LL:
          id result = @"ADD_SD_ROUTING_NEW_SET_JOB ";
          break;
        case 354LL:
          id result = @"ADD_SD_FROM_OTHR_SATISFYING";
          break;
        case 355LL:
          id result = @"ADD_SD_FROM_ALREADY_DWNLDED";
          break;
        case 356LL:
          id result = @"ADD_SD_DOWNLOADED_OR_SAME  ";
          break;
        case 357LL:
          id result = @"ADD_SD_SAME_VERSION_FOUND  ";
          break;
        case 370LL:
          id result = @"DEL_SD_ELIMINATE_LOAD_PERSD";
          break;
        case 371LL:
          id result = @"DEL_SD_ELIMINATE_MATCH_SID ";
          break;
        case 372LL:
          id result = @"DEL_SD_ELIMINATE_RMV_CONTNT";
          break;
        case 373LL:
          id result = @"DEL_SD_DROP_LOAD_SET_DESCRS";
          break;
        case 374LL:
          id result = @"DEL_SD_DROP_CRSS_CHK_DESCRS";
          break;
        case 375LL:
          id result = @"DEL_SD_RMV_PREVIOUS_STAGED ";
          break;
        case 376LL:
          id result = @"DEL_SD_NO_CONTENT_FILESYSTM";
          break;
        case 377LL:
          id result = @"DEL_SD_ELIMINATE_DROP_MATCH";
          break;
        case 378LL:
          id result = @"DEL_SD_DROP_UNLOCKED_OTHER ";
          break;
        case 379LL:
          id result = @"DEL_SD_DROP_NO_LATEST_AI   ";
          break;
        case 380LL:
          id result = @"DEL_SD_DROP_OVERFLOW_TRIM_D";
          break;
        case 381LL:
          id result = @"DEL_SD_DROP_INCOMPLETE     ";
          break;
        case 382LL:
          id result = @"DEL_SD_DROP_CROSSCHECK_TRIM";
          break;
        case 400LL:
          id result = @"DEL_NO_DESCRIPTOR          ";
          break;
        case 401LL:
          id result = @"DEL_NO_ASSET_CONTENT       ";
          break;
        case 402LL:
          id result = @"DEL_OLDER_WHEN_NEWER_FOUND ";
          break;
        case 403LL:
          id result = @"DEL_OLDER_WHEN_UNLOCKED    ";
          break;
        case 404LL:
          id result = @"DEL_CACHE_DELETE_STAGED    ";
          break;
        case 405LL:
          id result = @"DEL_CACHE_DELETE_UNLOCKED  ";
          break;
        case 406LL:
          id result = @"DEL_CACHE_DELETE_LOCKED    ";
          break;
        case 407LL:
          id result = @"DEL_PRE_SU_PURGED          ";
          break;
        case 408LL:
          id result = @"DEL_CHANGE_STAGED_TARGET   ";
          break;
        case 420LL:
          id result = @"VLD_LOAD_LOCAL_URL_PRESENT ";
          break;
        case 440LL:
          id result = @"SET_CONFIG_SPECIFIERS      ";
          break;
        case 441LL:
          id result = @"SET_CONFIG_LATEST_VEND_SET ";
          break;
        case 442LL:
          id result = @"SET_CONFIG_LATEST_VEND_CLR ";
          break;
        case 443LL:
          id result = @"SET_CONFIG_NEED_FOR_ATOMIC ";
          break;
        case 444LL:
          id result = @"SET_CONFIG_LOAD_PERSISTED  ";
          break;
        case 445LL:
          id result = @"SET_CONFIG_IMPLIED_REQUEST ";
          break;
        case 446LL:
          id result = @"SET_CONFIG_CHANGED         ";
          break;
        case 447LL:
          id result = @"SET_CONFIG_LOAD_SET_TARGET ";
          break;
        case 448LL:
          id result = @"SET_CONFIG_LOOKUP_RESPONSE ";
          break;
        case 449LL:
          id result = @"SET_CONFIG_ALTER_ENTRIES   ";
          break;
        case 450LL:
          id result = @"SET_CONFIG_REFRESH_STALE   ";
          break;
        case 451LL:
          id result = @"SET_CONFIG_NEW_SET_CONFIG  ";
          break;
        case 452LL:
          id result = @"SET_CONFIG_FORCE_UNLOCKED  ";
          break;
        default:
          v4 = @"MOD_CLIENT_LOCK            ";
          v5 = @"MOD_CLIENT_LOCK_INHIBITED  ";
          if (a3 != 251) {
            v5 = @"UNKNOWN";
          }
          BOOL v7 = a3 == 250;
          goto LABEL_40;
      }

      return result;
    }

    if (a3 > 101)
    {
      switch(a3)
      {
        case 200LL:
          id result = @"ADD_PRE_INSTALL_DISCOVERED ";
          break;
        case 201LL:
          id result = @"ADD_SCHEDULER_DOWNLOADED   ";
          break;
        case 202LL:
          id result = @"ADD_CONNECTOR_DOWNLOADED   ";
          break;
        case 203LL:
          id result = @"ADD_PRE_SU_STAGED          ";
          break;
        case 204LL:
          id result = @"ADD_PRE_SU_IMMED_PROMOTED  ";
          break;
        case 205LL:
          id result = @"ADD_PRE_SU_NEW_OS_PROMOTED ";
          break;
        case 206LL:
          id result = @"ADD_FEWEER_CONFIG_ENTRIES  ";
          break;
        case 207LL:
        case 208LL:
        case 209LL:
        case 210LL:
        case 211LL:
        case 212LL:
        case 213LL:
        case 214LL:
        case 215LL:
        case 216LL:
        case 217LL:
        case 218LL:
        case 219LL:
          return result;
        case 220LL:
          id result = @"ADD_AI_PROMOTED_STARTUP    ";
          break;
        case 221LL:
          id result = @"ADD_AI_SCHEDULER_TRIGGERED ";
          break;
        case 222LL:
          id result = @"ADD_AI_FROM_SATISFYING     ";
          break;
        case 223LL:
          id result = @"ADD_AI_FROM_STAGED_DESCR   ";
          break;
        case 224LL:
          id result = @"ADD_AI_FROM_PRE_INSTALLED  ";
          break;
        case 225LL:
          id result = @"ADD_AI_ROUTING_NEW_SET_JOB ";
          break;
        case 226LL:
          id result = @"ADD_AI_SUB_ATOMIC_0_ENTRIES";
          break;
        case 227LL:
          id result = @"ADD_AI_SUB_ATOMIC_W_ENTRIES";
          break;
        case 228LL:
          id result = @"ADD_AI_RECOVER_LOST        ";
          break;
        default:
          BOOL v9 = a3 == 102;
          v10 = @"ADD_CLIENT_INHIBITED       ";
          goto LABEL_64;
      }

      return result;
    }

    v4 = @"NEW                        ";
    v5 = @"ADD_CLIENT_DOWNLOAD        ";
    v6 = @"ADD_CLIENT_LOCK            ";
    if (a3 != 101) {
      v6 = @"UNKNOWN";
    }
    if (a3 != 100) {
      v5 = v6;
    }
    BOOL v7 = a3 == 0;
LABEL_40:
    if (v7) {
      return (id)v4;
    }
    else {
      return (id)v5;
    }
  }

  if (a3 > 899)
  {
    if (a3 > 1100)
    {
      switch(a3)
      {
        case 1200LL:
          id result = @"PERSONALIZE                ";
          break;
        case 1201LL:
          id result = @"DEPERSONALIZE              ";
          break;
        case 1202LL:
          id result = @"BEGIN_ACCESS               ";
          break;
        case 1203LL:
          id result = @"END_ACCESS                 ";
          break;
        case 1204LL:
          id result = @"BEGIN_MAP_TO_EXCLAVES      ";
          break;
        case 1205LL:
          id result = @"END_MAP_TO_EXCLAVES        ";
          break;
        case 1206LL:
          id result = @"PRE-PERSONALIZE            ";
          break;
        case 1207LL:
          id result = @"COMMIT_PRE_PERSONALIZED    ";
          break;
        default:
          v4 = @"DETERMINE_ASSET_TYPE_DONE  ";
          v5 = @"QUIET_OPERATION            ";
          if (a3 != 9999) {
            v5 = @"UNKNOWN";
          }
          BOOL v7 = a3 == 1101;
          goto LABEL_40;
      }
    }

    else
    {
      if (a3 > 999)
      {
        v4 = @"SUCESS_DECIDE_MORE_CONTENT ";
        v5 = @"FAILED_DECIDE_MORE_CONTENT ";
        v8 = @"DETERMINE_ASSET_TYPE_START ";
        if (a3 != 1100) {
          v8 = @"UNKNOWN";
        }
        if (a3 != 1001) {
          v5 = v8;
        }
        BOOL v7 = a3 == 1000;
        goto LABEL_40;
      }

      switch(a3)
      {
        case 900LL:
          id result = @"STAGED_NO_CANDIDATES       ";
          break;
        case 901LL:
          id result = @"STAGED_HAVE_CANDIDATES     ";
          break;
        case 902LL:
          id result = @"STAGED_NO_DOWNLOADED       ";
          break;
        case 903LL:
          id result = @"STAGED_REQUIRED_DOWNLOADED ";
          break;
        case 904LL:
          id result = @"STAGED_DONE_DOWNLOADED     ";
          break;
        default:
          return result;
      }
    }
  }

  else if (a3 > 699)
  {
    switch(a3)
    {
      case 800LL:
        id result = @"STORE_STAGE_REQUEST        ";
        break;
      case 801LL:
        id result = @"INVALID_STAGE_REQUEST      ";
        break;
      case 802LL:
        id result = @"PURGE_STAGING_CLIENT_REQ   ";
        break;
      case 803LL:
        id result = @"PURGED_STAGED_CONTENT      ";
        break;
      case 804LL:
        id result = @"CANCEL_ACTIVE_JOB          ";
        break;
      case 805LL:
        id result = @"ERASE_STAGING_CLIENT_REQ   ";
        break;
      case 806LL:
        id result = @"ERASED_STAGED_CONTENT      ";
        break;
      default:
        switch(a3)
        {
          case 700LL:
            id result = @"DETERMINE_CONTENT_AVAILABLE";
            break;
          case 701LL:
            id result = @"STARTING_DOWNLOAD_ALL      ";
            break;
          case 702LL:
            id result = @"DETERMINE_GROUPS_AVAILABLE ";
            break;
          case 703LL:
            id result = @"STARTING_DOWNLOAD_GROUPS   ";
            break;
          default:
            return result;
        }

        break;
    }
  }

  else
  {
    switch(a3)
    {
      case 500LL:
        id result = @"TRY_CLIENT_LOCK            ";
        break;
      case 501LL:
      case 502LL:
        id result = @"TRY_CLIENT_LOCK_CONTINUE   ";
        break;
      case 503LL:
        id result = @"JOB_FAILED_TO_START        ";
        break;
      case 504LL:
        id result = @"JOB_FAILED                 ";
        break;
      case 505LL:
        id result = @"JOB_FAILED_TO_PATCH        ";
        break;
      case 506LL:
        id result = @"JOB_FAILED_REVOKED         ";
        break;
      default:
        switch(a3)
        {
          case 620LL:
            id result = @"STA_STARTUP_ACTIVATED      ";
            break;
          case 621LL:
            id result = @"STA_STARTUP_BEGINNING      ";
            break;
          case 622LL:
            id result = @"STA_STARTUP_COOKIE_SUCCESS ";
            break;
          case 623LL:
            id result = @"STA_STARTUP_COOKIE_FAILURE ";
            break;
          case 624LL:
            id result = @"STA_STARTUP_COOKIE_EXISTS  ";
            break;
          default:
            BOOL v9 = a3 == 600;
            v10 = @"PRG_ENTRY_DOWNLOADED       ";
LABEL_64:
            if (v9) {
              id result = v10;
            }
            break;
        }

        break;
    }
  }

  return result;
}

+ (id)paddedNameForClient:(id)a3
{
  id v3 = a3;
  v4 = (int *)[v3 length];
  if ((uint64_t)v4 < 25)
  {
    if (v4 != &dword_18)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"                        ", "substringWithRange:", 0, 24 - (void)v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v3, v7));

      goto LABEL_7;
    }

    id v5 = v3;
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 0, 24));
  }

  v6 = v5;
LABEL_7:

  return v6;
}

+ (id)selectorNameForSelector:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
  id v5 = [v4 length];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
  BOOL v7 = [@"com.apple.MobileAsset." length];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
  unsigned int v9 = [v8 hasPrefix:@"com.apple.MobileAsset."];

  if (v9)
  {
    BOOL v10 = (uint64_t)v5 <= (uint64_t)v7;
    int64_t v11 = v5 - v7;
    if (!v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 assetType]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", v7, v11));

      v6 = (void *)v13;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 assetSpecifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 assetVersion]);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v3 assetVersion]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@",  v6,  v14,  v16));
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%@",  v6,  v14,  @"ALL"));
  }

  return v17;
}

- (OS_dispatch_queue)protectionQueue
{
  return self->_protectionQueue;
}

+ (id)currentTime
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v3 = objc_alloc_init(&OBJC_CLASS___NSDate);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v3));

  return v4;
}

- (int64_t)currentBucketFilesystemBytes
{
  return self->_currentBucketFilesystemBytes;
}

- (int64_t)maximumBucketFilesystemBytes
{
  return self->_maximumBucketFilesystemBytes;
}

- (int64_t)historyType
{
  return self->_historyType;
}

- (int64_t)currentBucketFileIndex
{
  return self->_currentBucketFileIndex;
}

+ (id)newBucketFilename:(int64_t)a3 forBucketIndex:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker nameForHistoryType:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "nameForHistoryType:",  a3));
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSString);
    id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/history");
    v8 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
    unsigned int v9 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"%@/%@_%@_%@_%02ld.log",  v8,  @"MAAutoAsset",  v5,  @"History",  a4);
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  return v9;
}

- (int64_t)recordFormattedHistoryEntry:(id)a3 toBucketFilename:(id)a4 settingCurrentBucketBytes:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v10);

  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v9));
  if (v11)
  {
    id v12 = [v8 length];
    id v46 = 0LL;
    int64_t v47 = 0LL;
    unsigned int v13 = [v11 seekToEndReturningOffset:&v47 error:&v46];
    id v14 = v46;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
      id v45 = 0LL;
      unsigned int v16 = [v11 writeData:v15 error:&v45];
      id v17 = v45;

      if (!v16)
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v17));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
          v39 = @"NO_ERROR";
          *(_DWORD *)buf = 138543874;
          v49 = v38;
          if (v24) {
            v39 = v24;
          }
          __int16 v50 = 2114;
          id v51 = v9;
          __int16 v52 = 2114;
          v53 = v39;
          _os_log_error_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to write latest entry to bucket file :%{public}@ | error:%{public}@",  buf,  0x20u);
        }

        int64_t v19 = 0LL;
        goto LABEL_24;
      }

      id v44 = 0LL;
      unsigned int v18 = [v11 seekToEndReturningOffset:&v47 error:&v44];
      id v14 = v44;

      if (v18)
      {
        int64_t v19 = v47;
        if (v47 < (uint64_t)v12)
        {
          int64_t v20 = -[MADAutoAssetHistoryTracker currentBucketFilesystemBytes](self, "currentBucketFilesystemBytes");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[MADAutoAssetHistoryTracker recordFormattedHistoryEntry:toBucketFilename:settingCurrentBucketBytes:].cold.2(self);
          }

          int64_t v19 = (int64_t)v12 + v20;
        }

        id v43 = 0LL;
        unsigned __int8 v23 = [v11 closeAndReturnError:&v43];
        id v17 = v43;

        v24 = 0LL;
        if ((v23 & 1) == 0)
        {
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v17));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
            v42 = @"NO_ERROR";
            *(_DWORD *)buf = 138543874;
            v49 = v41;
            if (v24) {
              v42 = v24;
            }
            __int16 v50 = 2114;
            id v51 = v9;
            __int16 v52 = 2114;
            v53 = v42;
            _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to seek to end of bucket file:%{pu blic}@ (after writing) | error:%{public}@",  buf,  0x20u);
          }
        }

        if (v5) {
          -[MADAutoAssetHistoryTracker setCurrentBucketFilesystemBytes:](self, "setCurrentBucketFilesystemBytes:", v19);
        }
LABEL_24:
        id v14 = v17;
LABEL_27:

        goto LABEL_28;
      }

      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v14));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v36 oslog]);

      if (!os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        int64_t v19 = 0LL;
        goto LABEL_27;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
      v40 = @"NO_ERROR";
      *(_DWORD *)buf = 138543874;
      v49 = v31;
      if (v24) {
        v40 = v24;
      }
      __int16 v50 = 2114;
      id v51 = v9;
      __int16 v52 = 2114;
      v53 = v40;
      v33 = "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to write latest entry to bucket file"
            ":%{public}@ | error:%{public}@";
    }

    else
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v14));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 oslog]);

      if (!os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
      v32 = @"NO_ERROR";
      *(_DWORD *)buf = 138543874;
      v49 = v31;
      if (v24) {
        v32 = v24;
      }
      __int16 v50 = 2114;
      id v51 = v9;
      __int16 v52 = 2114;
      v53 = v32;
      v33 = "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to seek to end of bucket file:%{publ"
            "ic}@ | error:%{public}@";
    }

    _os_log_error_impl(&dword_0, (os_log_t)v30, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);

    goto LABEL_26;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetHistoryTracker recordFormattedHistoryEntry:toBucketFilename:settingCurrentBucketBytes:].cold.1(self);
  }

  int64_t v19 = 0LL;
LABEL_28:

  return v19;
}

- (void)setCurrentBucketFilesystemBytes:(int64_t)a3
{
  self->_currentBucketFilesystemBytes = a3;
}

- (void)setCurrentBucketFileIndex:(int64_t)a3
{
  self->_currentBucketFileIndex = a3;
}

- (void)createBucketIndexFile
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = -[MADAutoAssetHistoryTracker newBucketIndexFilename](self, "newBucketIndexFilename");
  BOOL v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%d",  -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex"));
  id v11 = 0LL;
  -[NSString writeToFile:atomically:encoding:error:](v5, "writeToFile:atomically:encoding:error:", v4, 1LL, 4LL, &v11);
  id v6 = v11;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
      BOOL v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v6));
      *(_DWORD *)buf = 138543874;
      unsigned int v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_error_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:createBucketIndexFile} | unable to write bucket index to bucket file:%{public} @ | error:%{public}@",  buf,  0x20u);

LABEL_6:
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
    *(_DWORD *)buf = 138543874;
    unsigned int v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "{AUTO-HISTORY-TRACKER[%{public}@]:createBucketIndexFile} | set bucket file:%{public}@ | currentBucketFileIndex:%{public}@",  buf,  0x20u);
    goto LABEL_6;
  }
}

- (id)newBucketIndexFilename
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
  if (v4)
  {
    BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
    id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/history");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
    id v8 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"%@/%@_%@_%@.txt",  v7,  @"MAAutoAsset",  v4,  @"History");
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)historyTypeName
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  return +[MADAutoAssetHistoryTracker nameForHistoryType:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "nameForHistoryType:",  -[MADAutoAssetHistoryTracker historyType](self, "historyType"));
}

- (void)createEmptyBucketFileForIndex:(int64_t)a3 settingCurrentBucketBytes:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v7);

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = +[MADAutoAssetHistoryTracker newBucketFilename:forBucketIndex:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "newBucketFilename:forBucketIndex:",  -[MADAutoAssetHistoryTracker historyType](self, "historyType"),  a3);
  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetHistoryTracker currentTime](&OBJC_CLASS___MADAutoAssetHistoryTracker, "currentTime"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker operationName:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "operationName:",  0LL));
  id v12 = -[NSString initWithFormat:](v9, "initWithFormat:", @"time=%@ op=%@\n", v10, v11);

  [v13 createFileAtPath:v8 contents:0 attributes:0];
  -[MADAutoAssetHistoryTracker recordFormattedHistoryEntry:toBucketFilename:settingCurrentBucketBytes:]( self,  "recordFormattedHistoryEntry:toBucketFilename:settingCurrentBucketBytes:",  v12,  v8,  v4);
}

- (id)initForHistoryType:(int64_t)a3 withMaximumFilesystemBytes:(int64_t)a4 usingProtectionQueue:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MADAutoAssetHistoryTracker;
  BOOL v10 = -[MADAutoAssetHistoryTracker init](&v13, "init");
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_protectionQueue, a5);
    v11->_loadedFromPersistedState = 0;
    v11->_historyType = a3;
    v11->_currentBucketFileIndex = 0LL;
    v11->_currentBucketFilesystemBytes = 0LL;
    v11->_maximumBucketFilesystemBytes = a4 / 10;
  }

  return v11;
}

- (MADAutoAssetHistoryTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MADAutoAssetHistoryTracker;
  BOOL v5 = -[MADAutoAssetHistoryTracker init](&v8, "init");
  if (v5)
  {
    v5->_historyType = (int64_t)[v4 decodeInt64ForKey:@"historyType"];
    v5->_loadedFromPersistedState = [v4 decodeBoolForKey:@"loadedFromPersistedState"];
    v5->_currentBucketFileIndex = (int64_t)[v4 decodeInt64ForKey:@"currentBucketFileIndex"];
    v5->_currentBucketFilesystemBytes = (int64_t)[v4 decodeInt64ForKey:@"currentBucketFilesystemBytes"];
    v5->_maximumBucketFilesystemBytes = (int64_t)[v4 decodeInt64ForKey:@"maximumBucketFilesystemBytes"];
    protectionQueue = v5->_protectionQueue;
    v5->_protectionQueue = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetHistoryTracker historyType](self, "historyType"),  @"historyType");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetHistoryTracker loadedFromPersistedState](self, "loadedFromPersistedState"),  @"loadedFromPersistedState");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex"),  @"currentBucketFileIndex");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetHistoryTracker currentBucketFilesystemBytes](self, "currentBucketFilesystemBytes"),  @"currentBucketFilesystemBytes");
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetHistoryTracker maximumBucketFilesystemBytes](self, "maximumBucketFilesystemBytes"),  @"maximumBucketFilesystemBytes");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)loadPersistedState
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 historyTypeName]);
  int v5 = 138544130;
  id v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 currentBucketFileIndex];
  __int16 v9 = 2048;
  id v10 = [a1 currentBucketFilesystemBytes];
  __int16 v11 = 2048;
  id v12 = [a1 maximumBucketFilesystemBytes];
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadPersistedState} | unable to determine current bucket filename | currentBucketF ileIndex:%ld | currentBucketFilesystemBytes:%ld | maximumBucketFilesystemBytes:%ld",  (uint8_t *)&v5,  0x2Au);
}

- (void)recordHistoryEntry:(int64_t)a3 toHistoryType:(int64_t)a4 fromClient:(id)a5 fromLayer:(int64_t)a6 forAssetID:(id)a7 withSelector:(id)a8 usageCount:(int64_t)a9 configuredCount:(int64_t)a10 requestedCount:(int64_t)a11 fromPallasCount:(int64_t)a12 vendingCount:(int64_t)a13 forClientDomainName:(id)a14 forAssetSetIdentifier:(id)a15 forAtomicInstance:(id)a16 withAddendumMessage:(id)a17 failingWithError:(id)a18
{
  id v136 = a5;
  id v23 = a7;
  id v135 = a8;
  v134 = (__CFString *)a14;
  *((void *)&v133 + 1) = a15;
  *(void *)&__int128 v133 = a16;
  id v24 = a17;
  id v128 = a18;
  context = objc_autoreleasePoolPush();
  uint64_t v25 = objc_claimAutoreleasedReturnValue(+[MADAutoAssetHistoryTracker currentTime](&OBJC_CLASS___MADAutoAssetHistoryTracker, "currentTime"));
  uint64_t v132 = objc_claimAutoreleasedReturnValue(+[MADAutoAssetHistoryTracker operationName:](&OBJC_CLASS___MADAutoAssetHistoryTracker, "operationName:", a3));
  v127 = v24;
  v131 = (void *)v25;
  if (v24) {
    v26 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @" | %@\n", v24);
  }
  else {
    v26 = @"\n";
  }
  if (v136)
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForClient:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForClient:",  v136));
    v28 = @"client";
    if (v23)
    {
LABEL_6:
      if ([v23 hasSuffix:@".asset"]
        && (uint64_t v29 = v27,
            id v30 = [v23 length],
            BOOL v31 = v30 > [@".asset" length],
            uint64_t v27 = v29,
            v31))
      {
        v32 = [v23 length];
        int64_t v33 = v32 - (_BYTE *)[@".asset" length];
        uint64_t v27 = v29;
        id v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", 0, v33));
      }

      else
      {
        id v34 = v23;
      }

      int64_t v35 = (int64_t)v34;
      if (v135) {
        goto LABEL_12;
      }
LABEL_15:
      uint64_t v36 = 0LL;
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForHistoryLayer:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForHistoryLayer:",  a6));
    v28 = @"layer";
    if (v23) {
      goto LABEL_6;
    }
  }

  int64_t v35 = 0LL;
  if (!v135) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v36 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker selectorNameForSelector:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "selectorNameForSelector:",  v135));
LABEL_16:
  v125 = v23;
  v129 = (void *)v27;
  v130 = (__CFString *)v26;
  switch(a4)
  {
    case 0LL:
      v37 = (__CFString *)v36;
      unint64_t v46 = v35 | v36;
      int64_t v47 = objc_alloc(&OBJC_CLASS___NSString);
      if (!v46)
      {
        v97 = v26;
        v38 = (void *)v132;
        v39 = v131;
        v40 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"time=%@ op=%@ %@=%@%@",  v131,  v132,  v28,  v27,  v97,  v101,  v107);
        goto LABEL_18;
      }

      if (!v35)
      {
        v112 = v26;
        v38 = (void *)v132;
        v39 = v131;
        v41 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"time=%@ op=%@ %@=%@ asset=%@ selector=%@%@",  v131,  v132,  v28,  v27,  @"UNKNOWN                                 ",  v37,  v112);
        v42 = (void *)*((void *)&v133 + 1);
        goto LABEL_74;
      }

      v42 = (void *)*((void *)&v133 + 1);
      id v43 = (void *)v133;
      v38 = (void *)v132;
      if (v37)
      {
        v103 = v37;
        v110 = v26;
        uint64_t v94 = v27;
        int64_t v98 = v35;
        v90 = v28;
        v67 = @"time=%@ op=%@ %@=%@ asset=%@ selector=%@%@";
        goto LABEL_80;
      }

      v106 = v26;
      v39 = v131;
      v83 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"time=%@ op=%@ %@=%@ asset=%@%@",  v131,  v132,  v28,  v27,  v35,  v106,  v107,  v113,  v116);
      goto LABEL_81;
    case 1LL:
      v37 = (__CFString *)v36;
      unint64_t v48 = v35 | v36;
      int64_t v47 = objc_alloc(&OBJC_CLASS___NSString);
      if (!v48)
      {
        v102 = v26;
        v38 = (void *)v132;
        v39 = v131;
        v40 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"time=%@ op=%@ %@=%@ count=%004ld%@",  v131,  v132,  v28,  v27,  a9,  v102,  v107);
LABEL_18:
        v41 = (__CFString *)v40;
        v42 = (void *)*((void *)&v133 + 1);
        goto LABEL_19;
      }

      if (!v35)
      {
        v114 = v26;
        v38 = (void *)v132;
        v39 = v131;
        v41 = -[NSString initWithFormat:]( v47,  "initWithFormat:",  @"time=%@ op=%@ %@=%@ count=%004ld asset=%@ selector=%@%@",  v131,  v132,  v28,  v27,  a9,  @"UNKNOWN                                 ",  v37,  v114);
        v42 = (void *)*((void *)&v133 + 1);
        id v43 = (void *)v133;
        id v44 = v128;
        id v45 = self;
        int64_t v35 = 0LL;
        goto LABEL_84;
      }

      v42 = (void *)*((void *)&v133 + 1);
      id v43 = (void *)v133;
      v38 = (void *)v132;
      if (v37)
      {
        v110 = v37;
        v113 = v26;
        int64_t v98 = a9;
        v103 = (void *)v35;
        v90 = v28;
        uint64_t v94 = v27;
        v67 = @"time=%@ op=%@ %@=%@ count=%004ld asset=%@ selector=%@%@";
      }

      else
      {
        v103 = (void *)v35;
        v110 = v26;
        uint64_t v94 = v27;
        int64_t v98 = a9;
        v90 = v28;
        v67 = @"time=%@ op=%@ %@=%@ count=%004ld asset=%@%@";
      }

      goto LABEL_80;
    case 2LL:
      v123 = (__CFString *)v36;
      v49 = objc_alloc(&OBJC_CLASS___NSString);
      if ((a11 & a10 & a12 & a13) < 0 != v50) {
        id v51 = -[NSString initWithFormat:](v49, "initWithFormat:", @"count=%004ld", a9, v87, v89, v93);
      }
      else {
        id v51 = -[NSString initWithFormat:]( v49,  "initWithFormat:",  @"configured=%004ld requested:%004ld fromPallas:%004ld vending:%004ld",  a10,  a11,  a12,  a13);
      }
      v72 = v51;
      v73 = objc_alloc(&OBJC_CLASS___NSString);
      if (v134 || v133 != 0)
      {
        if (v133 == 0)
        {
          *(void *)&__int128 v104 = v134;
          *((void *)&v104 + 1) = v26;
          uint64_t v95 = v27;
          v99 = v72;
          v91 = v28;
          v75 = @"time=%@ op=%@ %@=%@ %@ domain=%@%@";
          uint64_t v88 = v132;
        }

        else
        {
          if ((void)v133)
          {
            if (*((void *)&v133 + 1))
            {
              v113 = v134;
              v116 = v26;
              __int128 v104 = v133;
              uint64_t v95 = v27;
              v99 = v72;
              v91 = v28;
              v75 = @"time=%@ op=%@ %@=%@ %@ id=%@ set=%@ domain=%@%@";
            }

            else
            {
              *((void *)&v104 + 1) = v134;
              v113 = v26;
              v99 = v72;
              *(void *)&__int128 v104 = v133;
              v91 = v28;
              uint64_t v95 = v27;
              v75 = @"time=%@ op=%@ %@=%@ %@ id=%@ domain=%@%@";
            }
          }

          else
          {
            v113 = v134;
            v116 = v26;
            *(void *)&__int128 v104 = @"UNKNOWN                                 ";
            *((void *)&v104 + 1) = *((void *)&v133 + 1);
            uint64_t v95 = v27;
            v99 = v72;
            v91 = v28;
            v75 = @"time=%@ op=%@ %@=%@ %@ id-%@ set=%@ domain=%@%@";
          }

          uint64_t v88 = v132;
        }

        v74 = -[NSString initWithFormat:](v73, "initWithFormat:", v75, v25, v88, v91, v95, v99, v104, v113, v116);
      }

      else
      {
        v74 = -[NSString initWithFormat:]( v73,  "initWithFormat:",  @"time=%@ op=%@ %@=%@ %@%@",  v25,  v132,  v28,  v27,  v72,  v26,  v107,  v113,  v116);
      }

      v41 = v74;
      id v44 = v128;

      v39 = (void *)v25;
      v38 = (void *)v132;
      id v43 = (void *)v133;
      v37 = v123;
      v42 = (void *)*((void *)&v133 + 1);
      goto LABEL_83;
    case 3LL:
      v118 = v28;
      *((void *)&v122 + 1) = v36;
      __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v128));
      v121 = v52;
      *(void *)&__int128 v122 = v35;
      if (v52)
      {
        v53 = v52;
        id v54 = [v52 checkedDepthCount];
        uint64_t v55 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForErrorDomain:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForErrorDomain:",  v53));
        uint64_t v56 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForErrorCode:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForErrorCode:",  v53));
        v57 = v53;
        if ((uint64_t)v54 >= 1
          && (uint64_t v58 = objc_claimAutoreleasedReturnValue([v53 checkedForDepthIndex:v54])) != 0)
        {
          v59 = (void *)v58;
          v60 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForErrorDomain:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForErrorDomain:",  v58));
          v61 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker paddedNameForErrorCode:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "paddedNameForErrorCode:",  v59));
          v62 = (void *)v55;
          v120 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"error_domain=%@ error_code=%@ top_domain=%@ top_code=%@",  v60,  v61,  v55,  v56);
          v63 = objc_alloc(&OBJC_CLASS___NSString);
          v64 = (void *)v56;
          v65 = (void *)objc_claimAutoreleasedReturnValue([v59 localizedDescription]);
          v119 = -[NSString initWithFormat:](v63, "initWithFormat:", @" error_desc=\"%@\"", v65);
        }

        else
        {
          v62 = (void *)v55;
          v120 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"error_domain=%@ error_code=%@            %@          %@",  v55,  v56,  @"                                    ",  @"            ");
          v64 = (void *)v56;
          v68 = objc_alloc(&OBJC_CLASS___NSString);
          v59 = (void *)objc_claimAutoreleasedReturnValue([v57 localizedDescription]);
          v119 = -[NSString initWithFormat:](v68, "initWithFormat:", @" error_desc=\"%@\"", v59);
        }

        v69 = (const __CFString *)*((void *)&v133 + 1);
        v70 = v134;
        v71 = (const __CFString *)v133;

        goto LABEL_52;
      }

      if (v128)
      {
        v76 = objc_alloc(&OBJC_CLASS___NSString);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v128 domain]);
        v119 = &stru_355768;
        v120 = -[NSString initWithFormat:]( v76,  "initWithFormat:",  @"bad_error_domain=%@ bad_error_code=%ld",  v62,  [v128 code]);
        v69 = (const __CFString *)*((void *)&v133 + 1);
        v70 = v134;
        v71 = (const __CFString *)v133;
LABEL_52:

        goto LABEL_53;
      }

      v119 = &stru_355768;
      v120 = @"NO_ERROR_PROVIDED";
      v69 = (const __CFString *)*((void *)&v133 + 1);
      v70 = v134;
      v71 = (const __CFString *)v133;
LABEL_53:
      if (!v69 && !v71 && v122 == 0)
      {
        v77 = objc_alloc(&OBJC_CLASS___NSString);
        v79 = (__CFString *)v119;
        v78 = (__CFString *)v120;
        v105 = v119;
        v111 = v26;
        uint64_t v96 = v27;
        v100 = v120;
        v92 = v118;
        v80 = @"time=%@ op=%@ %@=%@ %@%@%@";
        goto LABEL_57;
      }

      if (v122 == 0)
      {
        v77 = objc_alloc(&OBJC_CLASS___NSString);
        if (v70)
        {
          if (v71)
          {
            if (!v69)
            {
              v79 = (__CFString *)v119;
              v78 = (__CFString *)v120;
              v113 = v119;
              v116 = v26;
              v105 = v71;
              v111 = v70;
              uint64_t v96 = v27;
              v100 = v120;
              v92 = v118;
              v80 = @"time=%@ op=%@ %@=%@ %@ id=%@ domain=%@%@%@";
              goto LABEL_57;
            }

            v79 = (__CFString *)v119;
            v116 = v119;
            v117 = v26;
            v111 = v69;
            v113 = v70;
            v105 = v71;
          }

          else
          {
            v79 = (__CFString *)v119;
            v116 = v119;
            v117 = v26;
            v111 = v69;
            v113 = v70;
            v105 = @"UNKNOWN                                 ";
          }

          v78 = (__CFString *)v120;
          uint64_t v96 = v27;
          v100 = v120;
          v92 = v118;
          v80 = @"time=%@ op=%@ %@=%@ %@ id=%@ set=%@ domain=%@%@%@";
        }

        else
        {
          v79 = (__CFString *)v119;
          v113 = v119;
          v116 = v26;
          v105 = @"UNKNOWN                                 ";
          v111 = v69;
          v78 = (__CFString *)v120;
          uint64_t v96 = v27;
          v100 = v120;
          v92 = v118;
          v80 = @"time=%@ op=%@ %@=%@ %@ id=%@ set=%@%@%@";
        }

void __276__MADAutoAssetHistoryTracker_recordHistoryEntry_toHistoryType_fromClient_fromLayer_forAssetID_withSelector_usageCount_configuredCount_requestedCount_fromPallasCount_vendingCount_forClientDomainName_forAssetSetIdentifier_forAtomicInstance_withAddendumMessage_failingWithError___block_invoke( uint64_t a1)
{
  v2 = (char *)[*(id *)(a1 + 32) length];
  id v3 = &v2[(void)[*(id *)(a1 + 40) currentBucketFilesystemBytes]];
  if ((uint64_t)v3 > (uint64_t)[*(id *)(a1 + 40) maximumBucketFilesystemBytes])
  {
    id v4 = [*(id *)(a1 + 40) currentBucketFilesystemBytes];
    id v5 = [*(id *)(a1 + 40) currentBucketFileIndex];
    id v6 = [*(id *)(a1 + 40) currentBucketFileIndex];
    __int16 v7 = *(void **)(a1 + 40);
    else {
      id v8 = (char *)[*(id *)(a1 + 40) currentBucketFileIndex] + 1;
    }
    [v7 setCurrentBucketFileIndex:v8];
    [*(id *)(a1 + 40) createBucketIndexFile];
    objc_msgSend( *(id *)(a1 + 40),  "createEmptyBucketFileForIndex:settingCurrentBucketBytes:",  objc_msgSend(*(id *)(a1 + 40), "currentBucketFileIndex"),  1);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) historyTypeName]);
      id v12 = [*(id *)(a1 + 40) currentBucketFileIndex];
      id v13 = [*(id *)(a1 + 40) currentBucketFilesystemBytes];
      id v14 = [*(id *)(a1 + 40) maximumBucketFilesystemBytes];
      int v16 = 138544642;
      id v17 = v11;
      __int16 v18 = 2048;
      id v19 = v5;
      __int16 v20 = 2048;
      id v21 = v12;
      __int16 v22 = 2048;
      id v23 = v4;
      __int16 v24 = 2048;
      id v25 = v13;
      __int16 v26 = 2048;
      id v27 = v14;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "{AUTO-HISTORY-TRACKER[%{public}@]:recordHistoryEntry} | bucket index change %ld=>%ld | previousBucketFilesystemB ytes:%ld currentBucketFilesystemBytes:%ld | maximumBucketFilesystemBytes:%ld",  (uint8_t *)&v16,  0x3Eu);
    }
  }

  id v15 = +[MADAutoAssetHistoryTracker newBucketFilename:forBucketIndex:]( MADAutoAssetHistoryTracker,  "newBucketFilename:forBucketIndex:",  [*(id *)(a1 + 40) historyType],  objc_msgSend(*(id *)(a1 + 40), "currentBucketFileIndex"));
  objc_msgSend( *(id *)(a1 + 40),  "setCurrentBucketFilesystemBytes:",  objc_msgSend( *(id *)(a1 + 40),  "recordFormattedHistoryEntry:toBucketFilename:settingCurrentBucketBytes:",  *(void *)(a1 + 32),  v15,  1));
}

- (BOOL)makeSureHistoryDirectoryExists
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/history");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  unsigned __int8 v7 = [v4 fileExistsAtPath:v6];

  if ((v7 & 1) != 0)
  {
    id v8 = 0LL;
    BOOL v9 = 1;
  }

  else
  {
    id v10 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/history");
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v16 = 0LL;
    BOOL v9 = 1;
    unsigned __int8 v12 = [v4 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v8 = v16;

    if ((v12 & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetHistoryTracker makeSureHistoryDirectoryExists].cold.1(self, (uint64_t)v8);
      }

      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)loadBucketIndex
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = -[MADAutoAssetHistoryTracker newBucketIndexFilename](self, "newBucketIndexFilename");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v5 fileExistsAtPath:v4])
  {
    id v21 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v4,  4LL,  &v21));
    unsigned __int8 v7 = (os_log_s *)v21;
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v7));
        *(_DWORD *)buf = 138543874;
        id v23 = v10;
        __int16 v24 = 2114;
        id v25 = v4;
        __int16 v26 = 2114;
        int64_t v27 = (int64_t)v11;
        _os_log_error_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadBucketIndex} | unable to read bucket index from bucket file:%{public}@ | error:%{public}@",  buf,  0x20u);
      }
    }

    else
    {
      signed int v13 = [v6 intValue];
      id v14 = (void *)v13;
      if (v13 < 0xB)
      {
        -[MADAutoAssetHistoryTracker setCurrentBucketFileIndex:](self, "setCurrentBucketFileIndex:", v13);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
          int64_t v19 = -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex");
          *(_DWORD *)buf = 138543874;
          id v23 = v18;
          __int16 v24 = 2114;
          id v25 = v4;
          __int16 v26 = 2048;
          int64_t v27 = v19;
          _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadBucketIndex} | valid bucket index file:%{public}@ | currentBucketFileIndex:%ld",  buf,  0x20u);
        }

        goto LABEL_11;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
        *(_DWORD *)buf = 138543874;
        id v23 = v20;
        __int16 v24 = 2048;
        id v25 = v14;
        __int16 v26 = 2114;
        int64_t v27 = (int64_t)v4;
        _os_log_error_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadBucketIndex} | invalid bucket index(%ld) in bucket file:%{public}@",  buf,  0x20u);
      }
    }

    -[MADAutoAssetHistoryTracker setCurrentBucketFileIndex:](self, "setCurrentBucketFileIndex:", 0LL);
    -[MADAutoAssetHistoryTracker createBucketIndexFile](self, "createBucketIndexFile");
LABEL_11:

    goto LABEL_12;
  }

  -[MADAutoAssetHistoryTracker setCurrentBucketFileIndex:](self, "setCurrentBucketFileIndex:", 0LL);
  -[MADAutoAssetHistoryTracker createBucketIndexFile](self, "createBucketIndexFile");
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
    *(_DWORD *)buf = 138543874;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v4;
    __int16 v26 = 2048;
    int64_t v27 = -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex");
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadBucketIndex} | created bucket index file:%{public}@ | currentBucketFileIndex:%ld",  buf,  0x20u);
    goto LABEL_11;
  }

- (void)verifyAllOtherBucketFilesExist
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = 0LL;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  unsigned __int8 v7 = &MobileAssetKeyManager__metaData.ivars;
  *(void *)&__int128 v8 = 138543874LL;
  __int128 v26 = v8;
  do
  {
    if (v5 != (char *)-[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex", v26))
    {
      id v9 = -[__objc2_ivar_list newBucketFilename:forBucketIndex:]( p_ivars[241],  "newBucketFilename:forBucketIndex:",  -[MADAutoAssetHistoryTracker historyType](self, "historyType"),  v5);
      if (v9)
      {
        if ([v4 fileExistsAtPath:v9])
        {
          id v27 = 0LL;
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v9 error:&v27]);
          id v11 = v27;
          unsigned __int8 v12 = v11;
          if (!v10 || v11)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list sharedLogger](v7[175], "sharedLogger"));
            __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
              id v23 = v7;
              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v12));
              *(_DWORD *)buf = v26;
              uint64_t v29 = v22;
              __int16 v30 = 2114;
              uint64_t v31 = (uint64_t)v9;
              __int16 v32 = 2114;
              uint64_t v33 = (uint64_t)v24;
              _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadPersistedState} | unable to determine size of bucket file:%{public }@ | error:%{public}@",  buf,  0x20u);

              unsigned __int8 v7 = v23;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            }

            -[MADAutoAssetHistoryTracker createEmptyBucketFileForIndex:settingCurrentBucketBytes:]( self,  "createEmptyBucketFileForIndex:settingCurrentBucketBytes:",  -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex"),  0LL);
          }

          else
          {
            uint64_t v13 = (uint64_t)[v10 fileSize];
            if (v13 < 0
              || v13 > -[MADAutoAssetHistoryTracker maximumBucketFilesystemBytes](self, "maximumBucketFilesystemBytes"))
            {
              id v14 = v7;
              id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list sharedLogger](v7[175], "sharedLogger"));
              id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
                *(_DWORD *)buf = v26;
                uint64_t v29 = v25;
                __int16 v30 = 2048;
                uint64_t v31 = v13;
                __int16 v32 = 2114;
                uint64_t v33 = (uint64_t)v9;
                _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadPersistedState} | out-of-range size(%ld bytes) of bucket file:%{public}@",  buf,  0x20u);
              }

              [v4 createFileAtPath:v9 contents:0 attributes:0];
            }

            else
            {
              id v14 = v7;
              int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list sharedLogger](v7[175], "sharedLogger"));
              __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker historyTypeName](self, "historyTypeName"));
                *(_DWORD *)buf = v26;
                uint64_t v29 = v21;
                __int16 v30 = 2114;
                uint64_t v31 = (uint64_t)v9;
                __int16 v32 = 2048;
                uint64_t v33 = v13;
                _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "{AUTO-HISTORY-TRACKER[%{public}@]:loadPersistedState} | verified other bucket file:%{public}@ | curren tBucketFilesystemBytes:%ld",  buf,  0x20u);
              }
            }

            unsigned __int8 v7 = v14;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          }
        }

        else
        {
          -[MADAutoAssetHistoryTracker createEmptyBucketFileForIndex:settingCurrentBucketBytes:]( self,  "createEmptyBucketFileForIndex:settingCurrentBucketBytes:",  v5,  0LL);
        }
      }
    }

    ++v5;
  }

  while (v5 != (_BYTE *)&dword_8 + 2);
}

+ (id)paddedNameForHistoryLayer:(int64_t)a3
{
  else {
    id v3 = off_34EA00[a3];
  }
  id v4 = (char *)-[__CFString length](v3, "length");
  if ((uint64_t)v4 < 26)
  {
    if (v4 != (_BYTE *)&dword_18 + 1)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"                         ", "substringWithRange:", 0, 25 - (void)v4));
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v3,  v5));
    }
  }

  else
  {
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", 0LL, 25LL));
  }

  return v3;
}

+ (id)paddedNameForErrorDomain:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  id v5 = (uint32_t *)[v4 length];

  if ((uint64_t)v5 < 37)
  {
    if (v5 == &stru_20.cmdsize)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    }

    else
    {
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( @"                                    ",  "substringWithRange:",  0,  36 - (void)v5));
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v8, v9));
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 0, 36));
  }

  return v7;
}

+ (id)paddedNameForErrorCode:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [a3 code]));
  id v4 = (int *)[v3 length];
  if ((uint64_t)v4 < 13)
  {
    if (v4 != &dword_C)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"            ", "substringWithRange:", 0, 12 - (void)v4));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v3, v7));

      goto LABEL_7;
    }

    id v5 = v3;
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 0, 12));
  }

  id v6 = v5;
LABEL_7:

  return v6;
}

+ (id)nameForHistoryType:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[MADAutoAssetHistoryTracker nameForHistoryType:].cold.1(a3, v6);
  }

  return @"HISTORY_TYPE_UNKNOWN";
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetHistoryTracker nameForHistoryType:]( &OBJC_CLASS___MADAutoAssetHistoryTracker,  "nameForHistoryType:",  -[MADAutoAssetHistoryTracker historyType](self, "historyType")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetHistoryTracker protectionQueue](self, "protectionQueue"));
  if (v4) {
    id v5 = @"Y";
  }
  else {
    id v5 = @"N";
  }
  if (-[MADAutoAssetHistoryTracker loadedFromPersistedState](self, "loadedFromPersistedState")) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"protectionQueue:%@|historyType:%@|loadedFromPersistedState:%@|currentBucketFileIndex:%ld|currentBucketFilesystemBytes:%ld|maximumBucketFilesystemBytes:%ld",  v5,  v3,  v6,  -[MADAutoAssetHistoryTracker currentBucketFileIndex](self, "currentBucketFileIndex"),  -[MADAutoAssetHistoryTracker currentBucketFilesystemBytes](self, "currentBucketFilesystemBytes"),  -[MADAutoAssetHistoryTracker maximumBucketFilesystemBytes](self, "maximumBucketFilesystemBytes")));

  return v7;
}

- (BOOL)loadedFromPersistedState
{
  return self->_loadedFromPersistedState;
}

- (void)setLoadedFromPersistedState:(BOOL)a3
{
  self->_loadedFromPersistedState = a3;
}

- (void)setMaximumBucketFilesystemBytes:(int64_t)a3
{
  self->_maximumBucketFilesystemBytes = a3;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)makeSureHistoryDirectoryExists
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 historyTypeName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", a2));
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "{AUTO-HISTORY-TRACKER[%{public}@]:makeSureHistoryDirectoryExists} | unable to create base history directory | error:%{public}@",  v6,  v7,  v8,  v9,  2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)recordFormattedHistoryEntry:(void *)a1 toBucketFilename:settingCurrentBucketBytes:.cold.1( void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 historyTypeName]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to get handle to bucket file:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)recordFormattedHistoryEntry:(void *)a1 toBucketFilename:settingCurrentBucketBytes:.cold.2( void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 historyTypeName]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "{AUTO-HISTORY-TRACKER[%{public}@]:recordFormattedHistoryEntry} | unable to get accurate filesystem size after writin g entry to bucket file:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)nameForHistoryType:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "{AUTO-HISTORY-TRACKER:nameForHistoryType} | invalid history-type:%ld",  (uint8_t *)&v2,  0xCu);
}

@end