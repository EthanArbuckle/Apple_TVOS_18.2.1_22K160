@interface NSError
+ (id)sbSnapshotService_errorWithCode:(int64_t)a3;
+ (id)sbSnapshotService_errorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5;
+ (id)sbSnapshotService_errorWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation NSError

+ (id)sbSnapshotService_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "sbSnapshotService_errorWithCode:underlyingError:userInfo:", a3, 0, 0);
}

+ (id)sbSnapshotService_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return objc_msgSend(a1, "sbSnapshotService_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)sbSnapshotService_errorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = [a5 mutableCopy];
  v10 = v9;
  if (v9) {
    v11 = (NSMutableDictionary *)v9;
  }
  else {
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v12 = v11;

  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, NSUnderlyingErrorKey);
  }
  else {
    v13 = off_10000C530[a3 - 1];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  NSLocalizedFailureReasonErrorKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 errorWithDomain:@"com.apple.SBRendererService.snapshotService.errorDomain" code:a3 userInfo:v12]);

  return v14;
}

@end