@interface NSUserDefaults(NSUserDefaults)
+ (id)_copyStandardUserDefaultsIfPresent;
+ (id)standardUserDefaults;
+ (void)setStandardUserDefaults:()NSUserDefaults;
- (BOOL)objectIsForcedForKey:()NSUserDefaults;
- (BOOL)objectIsForcedForKey:()NSUserDefaults inDomain:;
- (BOOL)synchronize;
- (CFArrayRef)persistentDomainNames;
- (CFPropertyListRef)objectForKey:()NSUserDefaults inDomain:;
- (double)doubleForKey:()NSUserDefaults;
- (float)floatForKey:()NSUserDefaults;
- (id)URLForKey:()NSUserDefaults;
- (id)dealloc;
- (id)dictionaryRepresentation;
- (id)finalize;
- (id)objectForKey:()NSUserDefaults;
- (id)persistentDomainForName:()NSUserDefaults;
- (id)volatileDomainForName:()NSUserDefaults;
- (id)volatileDomainNames;
- (uint64_t)BOOLForKey:()NSUserDefaults;
- (uint64_t)_didEndKeyValueObserving;
- (uint64_t)_willBeginKeyValueObserving;
- (uint64_t)arrayForKey:()NSUserDefaults;
- (uint64_t)dataForKey:()NSUserDefaults;
- (uint64_t)dictionaryForKey:()NSUserDefaults;
- (uint64_t)init;
- (uint64_t)initWithSuiteName:()NSUserDefaults;
- (uint64_t)initWithUser:()NSUserDefaults;
- (uint64_t)integerForKey:()NSUserDefaults;
- (uint64_t)longForKey:()NSUserDefaults;
- (uint64_t)removeObjectForKey:()NSUserDefaults;
- (uint64_t)removeObjectForKey:()NSUserDefaults inDomain:;
- (uint64_t)removePersistentDomainForName:()NSUserDefaults;
- (uint64_t)removeSuiteNamed:()NSUserDefaults;
- (uint64_t)removeVolatileDomainForName:()NSUserDefaults;
- (uint64_t)searchList;
- (uint64_t)setBool:()NSUserDefaults forKey:;
- (uint64_t)setDouble:()NSUserDefaults forKey:;
- (uint64_t)setFloat:()NSUserDefaults forKey:;
- (uint64_t)setInteger:()NSUserDefaults forKey:;
- (uint64_t)setLong:()NSUserDefaults forKey:;
- (uint64_t)setObject:()NSUserDefaults forKey:;
- (uint64_t)setObject:()NSUserDefaults forKey:inDomain:;
- (uint64_t)setPersistentDomain:()NSUserDefaults forName:;
- (uint64_t)setVolatileDomain:()NSUserDefaults forName:;
- (uint64_t)stringForKey:()NSUserDefaults;
- (void)_initWithSuiteName:()NSUserDefaults container:;
- (void)addSuiteNamed:()NSUserDefaults;
- (void)registerDefaults:()NSUserDefaults;
- (void)release;
- (void)setSearchList:()NSUserDefaults;
- (void)setURL:()NSUserDefaults forKey:;
- (void)stringArrayForKey:()NSUserDefaults;
@end

@implementation NSUserDefaults(NSUserDefaults)

- (double)doubleForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0.0;
  }
  v2 = (void *)v1;
  [v2 doubleValue];
  return result;
}

- (id)objectForKey:()NSUserDefaults
{
  return (id)_CFPreferencesCopyAppValueWithContainer();
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (qword_18C496C90 != -1) {
    dispatch_once(&qword_18C496C90, &__block_literal_global_53);
  }
  if (_MergedGlobals_126) {
    BOOL v2 = qword_18C496C88 == (void)a1;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_18C688CE0;
    objc_msgSendSuper2(&v3, sel_release);
  }

- (uint64_t)BOOLForKey:()NSUserDefaults
{
  if ([a1 isMemberOfClass:MEMORY[0x189604038]])
  {
    [a1 _identifier];
    [a1 _container];
    BOOL v5 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;
    return !v5;
  }

  v8 = (void *)[a1 objectForKey:a3];
  if (_NSIsNSString())
  {
    if (([v8 isEqualToString:@"YES"] & 1) == 0)
    {
      uint64_t v9 = [v8 length];
      uint64_t v6 = 1LL;
      if (!objc_msgSend(v8, "compare:options:range:", @"YES", 1, 0, v9)) {
        return v6;
      }
      uint64_t v6 = 1LL;
      if (!objc_msgSend(v8, "compare:options:range:", @"Y", 1, 0, v9)) {
        return v6;
      }
      BOOL v5 = [v8 integerValue] == 0;
      return !v5;
    }

    return 1LL;
  }

  return [v8 BOOLValue];
}

- (uint64_t)integerForKey:()NSUserDefaults
{
  if ([a1 isMemberOfClass:MEMORY[0x189604038]])
  {
    [a1 _identifier];
    [a1 _container];
    return _CFPreferencesGetAppIntegerValueWithContainer();
  }

  else
  {
    uint64_t v6 = [a1 objectForKey:a3];
    else {
      return 0LL;
    }
  }

- (uint64_t)setObject:()NSUserDefaults forKey:
{
  return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
}

- (uint64_t)removeObjectForKey:()NSUserDefaults
{
  return [a1 setObject:0 forKey:a3];
}

- (CFPropertyListRef)objectForKey:()NSUserDefaults inDomain:
{
  if (!a4 || -[__CFString isEqualToString:](a4, "isEqualToString:", &stru_189CA6A28))
  {
    v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: domain name cannot be nil or empty", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    return (CFPropertyListRef)-[NSUserDefaults(NSUserDefaults) setObject:forKey:inDomain:]();
  }

  else
  {
    else {
      v8 = a4;
    }
    return (id)CFPreferencesCopyAppValue(a3, v8);
  }

- (uint64_t)setObject:()NSUserDefaults forKey:inDomain:
{
  if (!a5 || -[__CFString isEqualToString:](a5, "isEqualToString:", &stru_189CA6A28))
  {
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: domain name cannot be nil or empty",  _NSMethodExceptionProem(a1, a2));
    goto LABEL_12;
  }

  if (-[__CFString isEqualToString:](a5, "isEqualToString:", @"NSGlobalDomain"))
  {
    v10 = (const __CFString *)*MEMORY[0x189605170];
    v11 = (const __CFString *)*MEMORY[0x189605198];
    v12 = (const __CFString *)*MEMORY[0x189605178];
    CFPreferencesSetValue( a4,  a3,  (CFStringRef)*MEMORY[0x189605170],  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
    CFPreferencesSynchronize(v10, v11, v12);
  }

  else if ((-[__CFString isEqualToString:](a5, "isEqualToString:", @"NSRegistrationDomain") & 1) != 0 {
         || -[__CFString isEqualToString:](a5, "isEqualToString:", @"NSArgumentDomain"))
  }
  {
    if (!a3)
    {
      while (1)
      {
        v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: value name cannot be nil for registration or argument domain",  _NSMethodExceptionProem(a1, a2));
LABEL_12:
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
      }
    }

    [MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:a4];
    _CFXPreferencesReplaceValuesInNamedVolatileSource();
  }

  else
  {
    CFPreferencesSetAppValue(a4, a3, a5);
    CFPreferencesAppSynchronize(a5);
  }

  return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
}

- (uint64_t)removeObjectForKey:()NSUserDefaults inDomain:
{
  return [a1 setObject:0 forKey:a3 inDomain:a4];
}

- (uint64_t)stringForKey:()NSUserDefaults
{
  uint64_t v1 = (void *)objc_msgSend(a1, "objectForKey:");
  if ((_NSIsNSString() & 1) == 0)
  {
    return 0LL;
  }

  return (uint64_t)v1;
}

- (uint64_t)arrayForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  else {
    return 0LL;
  }
}

- (uint64_t)dictionaryForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  else {
    return 0LL;
  }
}

- (uint64_t)dataForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  else {
    return 0LL;
  }
}

- (void)stringArrayForKey:()NSUserDefaults
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (void *)objc_msgSend(a1, "objectForKey:");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
LABEL_4:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v1);
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
        if (v3) {
          goto LABEL_4;
        }
        return v1;
      }
    }
  }

  return v1;
}

- (uint64_t)longForKey:()NSUserDefaults
{
  v4[1] = *MEMORY[0x1895F89C0];
  uint64_t result = objc_msgSend(a1, "objectForKey:");
  v4[0] = 0LL;
  if (result)
  {
    uint64_t v2 = (void *)result;
    if (_NSIsNSNumber())
    {
      return [v2 longLongValue];
    }

    else if (_NSIsNSString())
    {
      unint64_t v3 = 0LL;
      if (_NSScanLongLongFromString( v2,  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"),  v4,  &v3)) {
        return v4[0];
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (float)floatForKey:()NSUserDefaults
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = (void *)v1;
  [v2 floatValue];
  return result;
}

- (id)URLForKey:()NSUserDefaults
{
  uint64_t v1 = (void *)objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData()) {
    return   +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  [MEMORY[0x189604010] setWithObject:objc_opt_class()],  v1,  0);
  }
  return 0LL;
}

- (uint64_t)setInteger:()NSUserDefaults forKey:
{
  return objc_msgSend( a1,  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"),  a4);
}

- (uint64_t)setLong:()NSUserDefaults forKey:
{
  return objc_msgSend( a1,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:"),  a4);
}

- (uint64_t)setFloat:()NSUserDefaults forKey:
{
  return objc_msgSend( a1,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"),  a3);
}

- (uint64_t)setDouble:()NSUserDefaults forKey:
{
  return objc_msgSend( a1,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  a3);
}

- (uint64_t)setBool:()NSUserDefaults forKey:
{
  return objc_msgSend( a1,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:"),  a4);
}

- (void)setURL:()NSUserDefaults forKey:
{
  v7 = (void *)MEMORY[0x186E1FF60]();
  [a1 setObject:encodeURLForDefaults(a3) forKey:a4];
  objc_autoreleasePoolPop(v7);
}

- (id)dictionaryRepresentation
{
  return (id)_CFPrefsCopyAppDictionaryWithContainer();
}

- (uint64_t)searchList
{
  if ((searchList_warnonce & 1) == 0)
  {
    searchList_warnonce = 1;
    NSLog((NSString *)@"-[NSUserDefaults searchList] is obsolete and returns nil; convert off of it.");
  }

  return 0LL;
}

- (void)setSearchList:()NSUserDefaults
{
  if ((setSearchList__warnonce & 1) == 0)
  {
    setSearchList__warnonce = 1;
    NSLog((NSString *)@"-[NSUserDefaults setSearchList:] is obsolete and has no effect; convert off of it.");
  }

- (void)addSuiteNamed:()NSUserDefaults
{
  if (([a3 isEqualToString:@"NSGlobalDomain"] & 1) != 0
    || (MainBundle = CFBundleGetMainBundle(),
        [a3 isEqualToString:CFBundleGetIdentifier(MainBundle)]))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);
  }

  else
  {
    [a1 _identifier];
    [a1 _container];
    _CFPreferencesAddSuitePreferencesToAppWithContainer();
  }

- (uint64_t)removeSuiteNamed:()NSUserDefaults
{
  return _CFPreferencesRemoveSuitePreferencesFromAppWithContainer();
}

- (void)registerDefaults:()NSUserDefaults
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 && [a3 count])
  {
    uint64_t v9 = 0LL;
    __int128 v10 = &v9;
    uint64_t v11 = 0x3052000000LL;
    uint64_t v12 = __Block_byref_object_copy__17;
    v13 = __Block_byref_object_dispose__17;
    uint64_t v14 = 0LL;
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = (void *)MEMORY[0x186E1FF60]();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke;
    v8[3] = &unk_189CA12A8;
    v8[5] = a3;
    v8[6] = &v9;
    v8[4] = v5;
    [a3 enumerateKeysAndObjectsUsingBlock:v8];
    objc_autoreleasePoolPop(v6);
    _CFXPreferencesRegisterDefaultValues();
    v7 = (void *)v10[5];
    if (v7) {

    }
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
    _Block_object_dispose(&v9, 8);
  }

- (uint64_t)initWithUser:()NSUserDefaults
{
  return [a1 initWithSuiteName:0];
}

- (void)_initWithSuiteName:()NSUserDefaults container:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a3
    && (([a3 isEqualToString:@"NSGlobalDomain"] & 1) != 0
     || (MainBundle = CFBundleGetMainBundle(),
         [a3 isEqualToString:CFBundleGetIdentifier(MainBundle)])))
  {
    _NSUserDefaults_Log_Nonsensical_Suites((uint64_t)a3);

    return 0LL;
  }

  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_18C688CE0;
    id v9 = objc_msgSendSuper2(&v11, sel_init);
    __int128 v8 = v9;
    if (v9)
    {
      [v9 _setContainer:a4];
      [v8 _setIdentifier:a3];
    }
  }

  return v8;
}

- (uint64_t)_willBeginKeyValueObserving
{
  uint64_t result = [a1 _kvo];
  if (!result)
  {
    [a1 _setKVO:&off_189D0E240];
    return _CFPrefsRegisterUserDefaultsInstance();
  }

  return result;
}

- (uint64_t)_didEndKeyValueObserving
{
  uint64_t result = [a1 _kvo];
  if (result)
  {
    _CFPrefsUnregisterUserDefaultsInstance();
    return [a1 _setKVO:0];
  }

  return result;
}

- (uint64_t)initWithSuiteName:()NSUserDefaults
{
  return [a1 _initWithSuiteName:a3 container:0];
}

- (uint64_t)init
{
  return [a1 initWithUser:0];
}

- (id)finalize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ([a1 _kvo]) {
    _CFPrefsUnregisterUserDefaultsInstance();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&off_18C688CE0;
  return objc_msgSendSuper2(&v3, sel_finalize);
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ([a1 _kvo]) {
    _CFPrefsUnregisterUserDefaultsInstance();
  }
  [a1 _setIdentifier:0];
  [a1 _setContainer:0];
  v3.receiver = a1;
  v3.super_class = (Class)&off_18C688CE0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

+ (void)setStandardUserDefaults:()NSUserDefaults
{
  id v4 = a3;

  qword_18C496C88 = (uint64_t)a3;
  os_unfair_lock_unlock(&stru_18C496C84);
}

+ (id)_copyStandardUserDefaultsIfPresent
{
  id v0 = (id)qword_18C496C88;
  os_unfair_lock_unlock(&stru_18C496C84);
  return v0;
}

+ (id)standardUserDefaults
{
  id v0 = (void *)qword_18C496C88;
  if (!qword_18C496C88)
  {
    _CFAutoreleasePoolPush();
    qword_18C496C88 = [objc_allocWithZone(MEMORY[0x189604038]) init];
    _CFPreferencesRegisterStandardUserDefaultsExists();
    _CFAutoreleasePoolPop();
    id v0 = (void *)qword_18C496C88;
  }

  id v1 = v0;
  os_unfair_lock_unlock(&stru_18C496C84);
  return v1;
}

- (id)volatileDomainNames
{
  return (id)_CFXPreferencesCopyVolatileSourceNames();
}

- (id)volatileDomainForName:()NSUserDefaults
{
  return (id)_CFXPreferencesCopyDictionaryForNamedVolatileSource();
}

- (uint64_t)setVolatileDomain:()NSUserDefaults forName:
{
  return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
}

- (uint64_t)removeVolatileDomainForName:()NSUserDefaults
{
  return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
}

- (CFArrayRef)persistentDomainNames
{
  CFArrayRef v0 = CFPreferencesCopyApplicationList((CFStringRef)*MEMORY[0x189605198], (CFStringRef)*MEMORY[0x189605178]);
  uint64_t v1 = -[__CFArray indexOfObject:](v0, "indexOfObject:", *MEMORY[0x189605170]);
  if (v1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = v1;
    objc_super v3 = (void *)-[__CFArray mutableCopyWithZone:](v0, "mutableCopyWithZone:", 0LL);
    [v3 replaceObjectAtIndex:v2 withObject:@"NSGlobalDomain"];

    CFArrayRef v0 = (CFArrayRef)[v3 copyWithZone:0];
  }

  return v0;
}

- (id)persistentDomainForName:()NSUserDefaults
{
  return (id)_CFXPreferencesCopyDictionaryForSourceWithBundleID();
}

- (uint64_t)setPersistentDomain:()NSUserDefaults forName:
{
  if (a3
    && [a3 count]
    && (([a4 isEqual:@"NSArgumentDomain"] & 1) != 0
     || [a4 isEqual:@"NSRegistrationDomain"]))
  {
    __int128 v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: cannot create persistent domain %@. Volatile domain %@ already exists.", _NSMethodExceptionProem(a1, a2), a4, a4), 0 reason userInfo];
    objc_exception_throw(v8);
    return -[NSUserDefaults(NSUserDefaults) removePersistentDomainForName:]();
  }

  else
  {
    [a4 isEqual:@"NSGlobalDomain"];
    -[objc_class _container](a1, "_container");
    _CFXPreferencesReplaceValuesInSourceWithBundleIDWithContainer();
    -[objc_class _container](a1, "_container");
    _CFPreferencesSynchronizeWithContainer();
    return -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUserDefaultsDidChangeNotification",  a1,  0LL);
  }

- (uint64_t)removePersistentDomainForName:()NSUserDefaults
{
  return [a1 setPersistentDomain:0 forName:a3];
}

- (BOOL)synchronize
{
  BOOL v2 = _CFPreferencesAppSynchronizeWithContainer() != 0;
  _CFPrefsSynchronizeForProcessTermination();
  return v2;
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults
{
  return CFPreferencesAppValueIsForced(a3, (CFStringRef)[a1 _identifier]) != 0;
}

- (BOOL)objectIsForcedForKey:()NSUserDefaults inDomain:
{
  return CFPreferencesAppValueIsForced(key, applicationID) != 0;
}

@end