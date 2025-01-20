@interface NSError
+ (id)mrap_errorWithCode:(int64_t)a3;
+ (id)mrap_errorWithCode:(int64_t)a3 description:(id)a4;
@end

@implementation NSError

+ (id)mrap_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "mrap_errorWithCode:description:", a3, 0);
}

+ (id)mrap_errorWithCode:(int64_t)a3 description:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = @"An unknown error has occurred.";
    if (a3 == 1) {
      v7 = @"The requested input device is not available.";
    }
    if (a3 == 2) {
      v7 = @"An error occurred while using the MediaRemote service.";
    }
    v8 = v7;
    v9 = v8;
    if (v6) {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v8,  v6));
    }
    else {
      v10 = v8;
    }
    v11 = v10;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v15 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    a3 = objc_claimAutoreleasedReturnValue([a1 errorWithDomain:@"MediaRemoteAudioInputPluginErrorDomain" code:a3 userInfo:v12]);
  }

  return (id)a3;
}

@end