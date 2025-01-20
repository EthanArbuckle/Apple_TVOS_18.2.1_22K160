@interface NSError
+ (id)_rpUserErrorForCode:(int64_t)a3 userInfo:(id)a4;
+ (id)_scUserErrorForCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation NSError

+ (id)_rpUserErrorForCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5) {
    id v7 = [v5 mutableCopy];
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v8 = v7;
  switch(a3)
  {
    case -5836LL:
      v9 = @"RECORDING_ERROR_CLIP_IN_PROGRESS";
      break;
    case -5835LL:
      v9 = @"RECORDING_ERROR_FILE_PERMISSIONS";
      break;
    case -5834LL:
      v9 = @"RECORDING_ERROR_INVALID_PARAMETER";
      break;
    case -5833LL:
      v9 = @"RECORDING_ERROR_FAILURE_IN_CAPTURE_STACK";
      break;
    case -5832LL:
      v9 = @"RECORDING_ERROR_INVALID_SESSION";
      break;
    case -5831LL:
      v9 = @"RECORDING_ERROR_FAILED_TO_SAVE_TO_PHOTOS";
      break;
    case -5830LL:
      v9 = @"RECORDING_ERROR_STARTING_IN_RECORDING_STATE";
      break;
    case -5829LL:
      v9 = @"RECORDING_ERROR_STOPING_NON_RECORDING";
      break;
    case -5828LL:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_CANCELED";
      break;
    case -5827LL:
      v9 = @"RECORDING_ERROR_FAILED_TO_REOMOVE_FILE";
      break;
    case -5826LL:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_EXPORT_FAILED";
      break;
    case -5825LL:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_IN_WRONG_STATE";
      break;
    case -5824LL:
      v9 = @"RECORDING_ERROR_NO_ASSET_WRITER";
      break;
    case -5823LL:
      v9 = @"RECORDING_ERROR_ASSET_WRITER_FAILED_TO_SAVE";
      break;
    case -5822LL:
      v9 = @"RECORDING_ERROR_FAILED_PROCESS_FIRST_SAMPLE";
      break;
    case -5821LL:
      v9 = @"RECORDING_ERROR_INCORRECT_TIME_STAMPS";
      break;
    case -5820LL:
      v9 = @"RECORDING_ERROR_FAILED_TO_OBTAIN_URL";
      break;
    case -5819LL:
      v9 = @"RECORDING_ERROR_BROADCAST_SETUP_FAILED";
      break;
    case -5818LL:
      v9 = @"RECORDING_ERROR_MIXING_FAILURE";
      break;
    case -5817LL:
      v9 = @"RECORDING_ERROR_MEDIASERVICES_FAILED";
      break;
    case -5816LL:
      v9 = @"RECORDING_ERROR_NO_CONTEXTID_MATCH";
      break;
    case -5815LL:
      v9 = @"RECORDING_ERROR_CONNECTION_INTERRUPTED";
      break;
    case -5814LL:
      v9 = @"RECORDING_ERROR_CONNECTION_INVALID";
      break;
    case -5813LL:
      v9 = @"RECORDING_ERROR_CARPLAY";
      break;
    case -5812LL:
      v9 = @"RECORDING_ERROR_FAILED_TO_SAVE";
      break;
    case -5811LL:
      v9 = @"RECORDING_ERROR_ACTIVE_PHONE_CALL";
      break;
    case -5810LL:
      v9 = @"RECORDING_ERROR_ENTITLEMENTS";
      break;
    case -5809LL:
      v9 = @"RECORDING_ERROR_SYSTEM_DORMANCY";
      break;
    case -5808LL:
      v9 = @"RECORDING_ERROR_INVALID_BROADCAST_SESSION";
      break;
    case -5807LL:
      v9 = @"RECORDING_ERROR_CONTENT_RESIZE";
      break;
    case -5806LL:
      v9 = @"RECORDING_ERROR_INTERRUPTED";
      break;
    case -5805LL:
      v9 = @"RECORDING_ERROR_INSUFFICIENT_STORAGE";
      break;
    case -5804LL:
      v9 = @"RECORDING_ERROR_FAILED";
      break;
    case -5803LL:
      v9 = @"RECORDING_ERROR_FAILED_TO_START";
      break;
    case -5802LL:
      v9 = @"RECORDING_ERROR_DISABLED";
      break;
    case -5801LL:
      v9 = @"RECORDING_ERROR_USER_DECLINED";
      break;
    default:
      if (a3) {
        v9 = @"RECORDING_ERROR_UNKNOWN";
      }
      else {
        v9 = @"RECORDING_ERROR_SUCCESSFUL";
      }
      break;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v9));
  if (v10) {
    [v8 setValue:v10 forKey:NSLocalizedDescriptionKey];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.ReplayKit.RPRecordingErrorDomain",  a3,  v8));

  return v11;
}

+ (id)_scUserErrorForCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5) {
    id v7 = [v5 mutableCopy];
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  v8 = v7;
  else {
    v9 = off_100070F78[a3 + 3821];
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v9));
  if (v10) {
    [v8 setValue:v10 forKey:NSLocalizedDescriptionKey];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.ScreenCaptureKit.SCStreamErrorDomain",  a3,  v8));

  return v11;
}

@end