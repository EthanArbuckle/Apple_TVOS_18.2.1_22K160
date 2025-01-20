@interface NSAssertionHandler
+ (NSAssertionHandler)currentHandler;
- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format;
- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format;
@end

@implementation NSAssertionHandler

+ (NSAssertionHandler)currentHandler
{
  v2 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  uint64_t v3 = -[NSMutableDictionary objectForKey:](v2, "objectForKey:", @"NSAssertionHandler");
  v4 = (NSAssertionHandler *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v4 = (NSAssertionHandler *)[objc_allocWithZone((Class)NSAssertionHandler) init];
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v4, @"NSAssertionHandler");
  }

  return v4;
}

- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v12 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v19 = 138412802;
    *(void *)&v19[4] = _NSFullMethodName((objc_class *)object, selector);
    __int16 v20 = 2112;
    v21 = fileName;
    __int16 v22 = 2048;
    NSInteger v23 = line;
    _os_log_error_impl(&dword_182EB1000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@, %@:%ld", v19, 0x20u);
  }

  va_copy(v19, va);
  v13 = objc_alloc(&OBJC_CLASS___NSString);
  if (format) {
    v14 = format;
  }
  else {
    v14 = (NSString *)@" ";
  }
  v15 =  -[NSString initWithFormat:locale:arguments:]( v13,  "initWithFormat:locale:arguments:",  v14,  0LL,  *(void *)v19);
  v16 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  v15,  _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v16);
  _userInfoForFileAndLine(v17, v18);
}

- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v10 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v15 = 138412802;
    *(void *)&v15[4] = functionName;
    __int16 v16 = 2112;
    uint64_t v17 = fileName;
    __int16 v18 = 2048;
    NSInteger v19 = line;
    _os_log_error_impl(&dword_182EB1000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@(), %@:%ld", v15, 0x20u);
  }

  va_copy(v15, va);
  v11 = objc_alloc(&OBJC_CLASS___NSString);
  if (format) {
    v12 = format;
  }
  else {
    v12 = (NSString *)@" ";
  }
  v13 =  -[NSString initWithFormat:locale:arguments:]( v11,  "initWithFormat:locale:arguments:",  v12,  0LL,  *(void *)v15);
  v14 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  v13,  _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v14);
  -[NSMutableDictionary(NSMutableDictionary) classForCoder]();
}

@end