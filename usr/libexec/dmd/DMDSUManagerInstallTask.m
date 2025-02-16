@interface DMDSUManagerInstallTask
+ (DMDSUManagerInstallTask)sharedInstallTask;
+ (NSString)defaultProductKey;
+ (id)_dmfStatusErrorFromSUStatusError:(id)a3;
+ (id)productKeyFromStatus:(id)a3;
+ (id)productKeyOrDefaultFromStatus:(id)a3;
- (BOOL)removeUpdateWithError:(id *)a3;
- (BOOL)startDownloadWithError:(id *)a3;
- (BOOL)startInstallWithError:(id *)a3;
- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5;
- (id)currentStatusWithError:(id *)a3;
@end

@implementation DMDSUManagerInstallTask

+ (DMDSUManagerInstallTask)sharedInstallTask
{
  if (qword_1000CCE58 != -1) {
    dispatch_once(&qword_1000CCE58, &stru_10009F328);
  }
  return (DMDSUManagerInstallTask *)(id)qword_1000CCE50;
}

+ (NSString)defaultProductKey
{
  return (NSString *)@"OSUpdate";
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v6 = DMFErrorWithCodeAndUserInfo(0LL, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

+ (id)productKeyFromStatus:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 productBuildVersion]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 defaultProductKey]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v4]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)productKeyOrDefaultFromStatus:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 productKeyFromStatus:a3]);
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([a1 defaultProductKey]);
  }
  v7 = v6;

  return v7;
}

- (BOOL)removeUpdateWithError:(id *)a3
{
  return 0;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  return 0LL;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  return 0;
}

- (BOOL)startInstallWithError:(id *)a3
{
  return 0;
}

- (id)currentStatusWithError:(id *)a3
{
  return 0LL;
}

@end