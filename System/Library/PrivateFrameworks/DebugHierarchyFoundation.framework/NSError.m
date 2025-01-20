@interface NSError
+ (id)debugHierarchyErrorFromException:(id)a3 caughtDuringRequest:(id)a4 forMethodSignature:(const char *)a5;
- (id)debugHierarchyResponseDataForRequest:(id)a3;
@end

@implementation NSError

+ (id)debugHierarchyErrorFromException:(id)a3 caughtDuringRequest:(id)a4 forMethodSignature:(const char *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a4 identifier]);
  v9 = (void *)v8;
  v10 = @"<nil>";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v18[0] = @"errorDescription";
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  v19[0] = v12;
  v18[1] = @"methodSignature";
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a5,  4LL));
  v19[1] = v13;
  v19[2] = v11;
  v18[2] = @"DebugHierarchyRequestIdentifier";
  v18[3] = @"backtrace";
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 callStackSymbols]);

  v19[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  1LL,  v15));
  return v16;
}

- (id)debugHierarchyResponseDataForRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);

  id v7 = DebugHierarchyResponseDataForGenericError(@"Debug Hierarchy Error", v6, v4, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

@end