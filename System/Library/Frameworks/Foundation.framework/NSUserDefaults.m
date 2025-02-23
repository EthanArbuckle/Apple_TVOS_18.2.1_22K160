@interface NSUserDefaults
@end

@implementation NSUserDefaults

void ___NSUserDefaults_Log_Nonsensical_Suites_block_invoke(uint64_t a1)
{
  else {
    NSLog((NSString *)@"Using your own bundle identifier as an NSUserDefaults suite name does not make sense and will not work. Break on _NSUserDefaults_Log_Nonsensical_Suites to find this");
  }
}

uint64_t __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke( uint64_t a1,  uint64_t a2,  NSData *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (!v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) mutableCopy];
      v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    }

    return [v7 setObject:encodeURLForDefaults(a3) forKey:a2];
  }

  return result;
}

uint64_t __41__NSUserDefaults_NSUserDefaults__release__block_invoke()
{
  uint64_t result = _CFAppVersionCheckLessThan();
  _MergedGlobals_126 = result;
  return result;
}

uint64_t __76__NSUserDefaults_NSUserDefaults_NSURLExtras___web_addDefaultsChangeObserver__block_invoke()
{
  v0 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  return -[NSNotificationCenter addObserver:selector:name:object:]( v0,  "addObserver:selector:name:object:",  objc_opt_self(),  sel__web_defaultsDidChange,  @"NSUserDefaultsDidChangeNotification",  [MEMORY[0x189604038] standardUserDefaults]);
}

@end