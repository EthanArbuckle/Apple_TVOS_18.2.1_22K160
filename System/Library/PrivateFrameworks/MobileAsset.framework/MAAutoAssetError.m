@interface MAAutoAssetError
+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6;
+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4;
@end

@implementation MAAutoAssetError

+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4
{
  v4 = @"MAAutoAssetError";
  if (a3 <= 6530)
  {
    if (a3 <= 6200)
    {
      switch(a3)
      {
        case 6101LL:
          v4 = @"ResourceUnavailable";
          break;
        case 6102LL:
          v4 = @"MissingParameter";
          break;
        case 6103LL:
          v4 = @"InvalidInstance";
          break;
        case 6104LL:
          v4 = @"CommunicationFailure";
          break;
        case 6105LL:
          v4 = @"OperationTimedOut";
          break;
        case 6106LL:
          v4 = @"UnknownOperation";
          break;
        case 6107LL:
          v4 = @"UnderlyingError";
          break;
        case 6108LL:
          v4 = @"InvalidValue";
          break;
        case 6109LL:
          v4 = @"TooManyEntries";
          break;
        case 6110LL:
          v4 = @"NoValidEntries";
          break;
        case 6111LL:
          v4 = @"MissingReference";
          break;
        case 6112LL:
          v4 = @"NotSupportedForSimulator";
          break;
        case 6113LL:
          v4 = @"BusyPerformingOperation";
          break;
        case 6114LL:
          v4 = @"EliminationInProgress";
          break;
        case 6115LL:
          v4 = @"OperationCanceled";
          break;
        default:
          v7 = @"SUCCESS";
          BOOL v8 = a3 == 0;
LABEL_64:
          if (v8) {
            v4 = v7;
          }
          break;
      }
    }

    else if (a3 > 6300)
    {
      switch(a3)
      {
        case 6501LL:
          v4 = @"NotCurrentlyLocked";
          break;
        case 6502LL:
          v4 = @"LockInitiatedNoWait";
          break;
        case 6503LL:
          v4 = @"LockNoWaitNoDownloadedAsset";
          break;
        case 6504LL:
          v4 = @"LockAttemptedNoDownloadedAsset";
          break;
        case 6505LL:
          v4 = @"LockTimeoutNoDownloadedAsset";
          break;
        default:
          uint64_t v5 = 6301LL;
          v6 = @"NotAwareOfAsset";
          if (a3 == 6401) {
            v4 = @"DownloadPostponed";
          }
          goto LABEL_20;
      }
    }

    else
    {
      switch(a3)
      {
        case 6201LL:
          v4 = @"NoVersionFound";
          break;
        case 6202LL:
          v4 = @"NewerVersionRevoked";
          break;
        case 6203LL:
          v4 = @"AvailableVersionRevoked";
          break;
        case 6204LL:
          v4 = @"CheckInitiatedNoWait";
          break;
        case 6205LL:
          v4 = @"SameVersionFound";
          break;
        case 6206LL:
          v4 = @"CheckNoWaitNoDownloadedAsset";
          break;
        case 6207LL:
          v4 = @"CheckAttemptedNoDownloadedAsset";
          break;
        case 6208LL:
          v4 = @"CheckTimeoutNoDownloadedAsset";
          break;
        case 6209LL:
          v4 = @"NotEnoughSpaceForSetDownload";
          break;
        case 6210LL:
          v4 = @"SomeContentNotAvailable";
          break;
        default:
          BOOL v8 = a3 == 6251;
          v7 = @"CheckNoWaitNoDownloadedInstance";
          goto LABEL_64;
      }
    }
  }

  else if (a3 > 6700)
  {
    uint64_t v5 = 6701LL;
    v6 = @"BlockedNoNetwork";
    if (a3 == 6801) {
      v4 = @"NotImplemented";
    }
    if (a3 == 6702) {
      v4 = @"BlockedRecentUserActivity";
    }
LABEL_20:
    if (a3 == v5) {
      v4 = v6;
    }
  }

  else
  {
    switch(a3)
    {
      case 6531LL:
        v4 = @"NotSecureAssetFormat";
        break;
      case 6532LL:
        v4 = @"SecureOperationInProgress";
        break;
      case 6533LL:
        v4 = @"WouldRequireNetwork";
        break;
      case 6534LL:
        v4 = @"SecureOperationFailure";
        break;
      case 6535LL:
        v4 = @"SecureUnableToPersonalize";
        break;
      case 6536LL:
        v4 = @"SecureUnableToBeginAccess";
        break;
      case 6537LL:
        v4 = @"SecureUnableToMapToExclave";
        break;
      case 6551LL:
        v4 = @"SetAtomicInstanceUnknown";
        break;
      case 6552LL:
        v4 = @"SetSubAtomicInstanceUnavailable";
        break;
      case 6553LL:
        v4 = @"SetSubAtomicInstanceReference";
        break;
      case 6554LL:
        v4 = @"SetConfigurationInvalid";
        break;
      case 6555LL:
        v4 = @"SetEmptyEntriesNotValid";
        break;
      case 6556LL:
        v4 = @"SetNoneFoundServerSide";
        break;
      case 6557LL:
        v4 = @"SetAtomicInstanceOrphaned";
        break;
      case 6558LL:
        v4 = @"SetIdentifierNotFound";
        break;
      case 6570LL:
        v4 = @"PolicyInvalidClientRequest";
        break;
      case 6571LL:
        v4 = @"PolicyInvalidUserInitiated";
        break;
      case 6572LL:
        v4 = @"PolicyInvalidLockInhibits";
        break;
      case 6573LL:
        v4 = @"PolicyInvalidBlockCheck";
        break;
      case 6580LL:
        v4 = @"InvalidForLockerMode";
        break;
      case 6581LL:
        v4 = @"RestrictedToLockerMode";
        break;
      case 6582LL:
        v4 = @"NoSharedLock";
        break;
      case 6583LL:
        v4 = @"FailedSharedLockPreparation";
        break;
      case 6584LL:
        v4 = @"ShortTermLocked";
        break;
      case 6601LL:
        v4 = @"StagingOperationReplaced";
        break;
      case 6602LL:
        v4 = @"StagingDetermineUnableWhenRequired";
        break;
      case 6603LL:
        v4 = @"StagingDetermineUnableNoRequired";
        break;
      case 6604LL:
        v4 = @"StagingDetermineAlreadyDownloading";
        break;
      case 6605LL:
        v4 = @"StagingDetermineAlreadyDownloaded";
        break;
      case 6606LL:
        v4 = @"StagingWrongMode";
        break;
      case 6607LL:
        v4 = @"StagingAlreadyDetermining";
        break;
      case 6608LL:
        v4 = @"StagingNoGroupsStaged";
        break;
      case 6609LL:
        v4 = @"StagingOperationCanceled";
        break;
      case 6611LL:
        v4 = @"StagingDownloadUnableWhenRequired";
        break;
      case 6612LL:
        v4 = @"StagingDifferentClientThanLatched";
        break;
      case 6613LL:
        v4 = @"StagingSpecifierNotInLookupResults";
        break;
      default:
        return (id)[NSString stringWithFormat:@"%@:%@(%lld)", a4, v4, a3];
    }
  }

  return (id)[NSString stringWithFormat:@"%@:%@(%lld)", a4, v4, a3];
}

+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = (void *)objc_opt_new();
  v13 = +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  v11);
  id v14 = objc_alloc(NSString);
  if (v10) {
    uint64_t v15 = [v14 initWithFormat:@"[%@] %@", v13, v10];
  }
  else {
    uint64_t v15 = [v14 initWithFormat:@"[%@]", v13, v19];
  }
  v16 = (void *)v15;
  if (v15) {
    [v12 setObject:v15 forKey:*MEMORY[0x1896075E0]];
  }
  if (v9) {
    [v12 setObject:v9 forKey:*MEMORY[0x189607798]];
  }
  [MEMORY[0x189607870] errorWithDomain:@"com.apple.MobileAssetError.AutoAsset" code:a3 userInfo:v12];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end