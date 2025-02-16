@interface NSMutableDictionary(SUCoreDictionary)
- (void)setSafeObject:()SUCoreDictionary forKey:;
@end

@implementation NSMutableDictionary(SUCoreDictionary)

- (void)setSafeObject:()SUCoreDictionary forKey:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    [a1 setObject:v6 forKey:v7];
  }

  else if (!v7)
  {
    v9 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(SUCoreDictionary) setSafeObject:forKey:].cold.1(v10);
    }
  }
}

- (void)setSafeObject:()SUCoreDictionary forKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_187139000,  log,  OS_LOG_TYPE_ERROR,  "[SUCoreDictionary] set with key = nil, no change to dictionary",  v1,  2u);
}

@end