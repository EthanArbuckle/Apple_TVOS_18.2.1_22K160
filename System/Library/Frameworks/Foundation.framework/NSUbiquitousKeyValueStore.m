@interface NSUbiquitousKeyValueStore
+ (NSUbiquitousKeyValueStore)defaultStore;
+ (id)additionalStoreWithIdentifier:(id)a3;
- (BOOL)BOOLForKey:(NSString *)aKey;
- (BOOL)synchronize;
- (NSArray)arrayForKey:(NSString *)aKey;
- (NSData)dataForKey:(NSString *)aKey;
- (NSDictionary)dictionaryForKey:(NSString *)aKey;
- (NSDictionary)dictionaryRepresentation;
- (NSString)stringForKey:(NSString *)aKey;
- (NSUbiquitousKeyValueStore)init;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4;
- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4 additionalStore:(BOOL)a5;
- (NSUbiquitousKeyValueStore)initWithStoreIdentifier:(id)a3 type:(int64_t)a4;
- (double)doubleForKey:(NSString *)aKey;
- (id)_initWithStoreIdentifier:(id)a3 usingEndToEndEncryption:(BOOL)a4;
- (id)_remotePreferencesSource;
- (id)objectForKey:(NSString *)aKey;
- (uint64_t)longLongForKey:(NSString *)aKey;
- (unint64_t)maximumDataLengthPerKey;
- (unint64_t)maximumKeyCount;
- (unint64_t)maximumKeyLength;
- (unint64_t)maximumTotalDataLength;
- (void)_sourceDidChangePassthroughNotification:(id)a3;
- (void)dealloc;
- (void)removeObjectForKey:(NSString *)aKey;
- (void)setArray:(NSArray *)anArray forKey:(NSString *)aKey;
- (void)setBool:(BOOL)value forKey:(NSString *)aKey;
- (void)setData:(NSData *)aData forKey:(NSString *)aKey;
- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;
- (void)setDouble:(double)value forKey:(NSString *)aKey;
- (void)setLongLong:(uint64_t)value forKey:(NSString *)aKey;
- (void)setObject:(id)anObject forKey:(NSString *)aKey;
- (void)setString:(NSString *)aString forKey:(NSString *)aKey;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation NSUbiquitousKeyValueStore

+ (NSUbiquitousKeyValueStore)defaultStore
{
  if (_MergedGlobals_151 != -1) {
    dispatch_once(&_MergedGlobals_151, &__block_literal_global_82);
  }
  return (NSUbiquitousKeyValueStore *)qword_18C497260;
}

NSUbiquitousKeyValueStore *__41__NSUbiquitousKeyValueStore_defaultStore__block_invoke()
{
  result = objc_alloc_init(&OBJC_CLASS___NSUbiquitousKeyValueStore);
  qword_18C497260 = (uint64_t)result;
  return result;
}

- (NSUbiquitousKeyValueStore)initWithStoreIdentifier:(id)a3 type:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSUbiquitousKeyValueStore;
  v6 = -[NSUbiquitousKeyValueStore init](&v11, sel_init);
  if (!v6) {
    return v6;
  }
  if (qword_18C497270 != -1) {
    dispatch_once(&qword_18C497270, &__block_literal_global_6_0);
  }
  if (!qword_18C497268)
  {

    return 0LL;
  }

  if (![(id)qword_18C497268 instancesRespondToSelector:sel_initWithStoreIdentifier_type_])
  {
    NSLog((NSString *)@"Unable to find initializer for SYDClientToDaemonConnection");
    if (!v6->_source) {
      return v6;
    }
LABEL_15:
    v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v9,  "addObserver:selector:name:object:",  v6,  sel__sourceDidChangePassthroughNotification_,  [(id)qword_18C497268 SYDUbiquitousKeyValueStoreDidChangeExternallyNotification],  v6->_source);
    return v6;
  }

  if (a4 == 3) {
    int64_t v7 = 3LL;
  }
  else {
    int64_t v7 = 0LL;
  }
  if (a4 != 2) {
    a4 = v7;
  }
  uint64_t v8 = [objc_alloc((Class)qword_18C497268) initWithStoreIdentifier:a3 type:a4];
  v6->_source = (SYDClientToDaemonConnection *)v8;
  if (v8) {
    goto LABEL_15;
  }
  return v6;
}

void __58__NSUbiquitousKeyValueStore_initWithStoreIdentifier_type___block_invoke()
{
  if (dlopen( (const char *)[@"/System/Library/PrivateFrameworks/SyncedDefaults.framework/SyncedDefaults" fileSystemRepresentation],  256))
  {
    qword_18C497268 = (uint64_t)objc_lookUpClass("SYDClientToDaemonConnection");
  }

  else
  {
    v0 = dlerror();
    NSLog((NSString *)@"NSUbiquitousKeyValueStore is unavailable: %s.", v0);
  }

+ (id)additionalStoreWithIdentifier:(id)a3
{
  return (id)[objc_alloc((Class)a1) initWithBundleIdentifier:0 storeIdentifier:a3 additionalStore:1];
}

- (id)_initWithStoreIdentifier:(id)a3 usingEndToEndEncryption:(BOOL)a4
{
  return -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:](self, "initWithStoreIdentifier:type:", a3, 0LL);
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4 additionalStore:(BOOL)a5
{
  return -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:](self, "initWithStoreIdentifier:type:", a4, 0LL, a5);
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3 storeIdentifier:(id)a4
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:storeIdentifier:additionalStore:]( self,  "initWithBundleIdentifier:storeIdentifier:additionalStore:",  a3,  a4,  0LL);
}

- (NSUbiquitousKeyValueStore)initWithBundleIdentifier:(id)a3
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:storeIdentifier:]( self,  "initWithBundleIdentifier:storeIdentifier:",  a3,  0LL);
}

- (NSUbiquitousKeyValueStore)init
{
  return -[NSUbiquitousKeyValueStore initWithBundleIdentifier:](self, "initWithBundleIdentifier:", 0LL);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUbiquitousKeyValueStore;
  -[NSUbiquitousKeyValueStore dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(NSString *)aKey
{
  return (id)-[SYDClientToDaemonConnection objectForKey:](self->_source, "objectForKey:", aKey);
}

- (void)setObject:(id)anObject forKey:(NSString *)aKey
{
}

- (void)removeObjectForKey:(NSString *)aKey
{
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[SYDClientToDaemonConnection dictionaryRepresentation]( self->_source,  "dictionaryRepresentation");
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
}

- (BOOL)synchronize
{
  return -[SYDClientToDaemonConnection synchronize](self->_source, "synchronize") != 0;
}

- (void)_sourceDidChangePassthroughNotification:(id)a3
{
}

- (unint64_t)maximumKeyCount
{
  return -[SYDClientToDaemonConnection maximumKeyCount](self->_source, "maximumKeyCount");
}

- (unint64_t)maximumKeyLength
{
  return -[SYDClientToDaemonConnection maximumKeyLength](self->_source, "maximumKeyLength");
}

- (unint64_t)maximumDataLengthPerKey
{
  return -[SYDClientToDaemonConnection maximumDataLengthPerKey](self->_source, "maximumDataLengthPerKey");
}

- (unint64_t)maximumTotalDataLength
{
  return -[SYDClientToDaemonConnection maximumTotalDataLength](self->_source, "maximumTotalDataLength");
}

- (id)_remotePreferencesSource
{
  return self->_source;
}

- (NSString)stringForKey:(NSString *)aKey
{
  objc_super v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (v3 && (_NSIsNSString() & 1) == 0)
  {
    return 0LL;
  }

  return v3;
}

- (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
  if (aString && (-[NSString isNSString](aString, "isNSString") & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSString"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSUbiquitousKeyValueStore arrayForKey:](v9, v10, v11);
  }

  else
  {
    -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aString, aKey);
  }

- (NSArray)arrayForKey:(NSString *)aKey
{
  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    uint64_t v4 = result;
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)setArray:(NSArray *)anArray forKey:(NSString *)aKey
{
  if (anArray && (-[NSArray isNSArray](anArray, "isNSArray") & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSArray"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSUbiquitousKeyValueStore dictionaryForKey:](v9, v10, v11);
  }

  else
  {
    -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", anArray, aKey);
  }

- (NSDictionary)dictionaryForKey:(NSString *)aKey
{
  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    uint64_t v4 = result;
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey
{
  if (aDictionary && (-[NSDictionary isNSDictionary](aDictionary, "isNSDictionary") & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSDictionary"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSUbiquitousKeyValueStore dataForKey:](v9, v10, v11);
  }

  else
  {
    -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aDictionary, aKey);
  }

- (NSData)dataForKey:(NSString *)aKey
{
  result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (result)
  {
    uint64_t v4 = result;
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)setData:(NSData *)aData forKey:(NSString *)aKey
{
  if (aData && (-[NSData isNSData](aData, "isNSData") & 1) == 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: expected value should be an %s.", _NSMethodExceptionProem((objc_class *)self, a2), "NSData"), 0 reason userInfo];
    objc_exception_throw(v8);
    -[NSUbiquitousKeyValueStore longLongForKey:](v9, v10, v11);
  }

  else
  {
    -[NSUbiquitousKeyValueStore setObject:forKey:](self, "setObject:forKey:", aData, aKey);
  }

- (uint64_t)longLongForKey:(NSString *)aKey
{
  v6[1] = *MEMORY[0x1895F89C0];
  uint64_t result = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  v6[0] = 0LL;
  if (result)
  {
    uint64_t v4 = (void *)result;
    if (_NSIsNSString())
    {
      unint64_t v5 = 0LL;
      if (_NSScanLongLongFromString( v4,  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"),  v6,  &v5)) {
        return v6[0];
      }
      else {
        return 0LL;
      }
    }

    else if (_NSIsNSNumber())
    {
      return [v4 longLongValue];
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)setLongLong:(uint64_t)value forKey:(NSString *)aKey
{
}

- (double)doubleForKey:(NSString *)aKey
{
  id v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  [v4 doubleValue];
  return result;
}

- (void)setDouble:(double)value forKey:(NSString *)aKey
{
}

- (BOOL)BOOLForKey:(NSString *)aKey
{
  id v3 = -[NSUbiquitousKeyValueStore objectForKey:](self, "objectForKey:", aKey);
  if (v3)
  {
    uint64_t v4 = v3;
    if (_NSIsNSString())
    {
      if ([v4 isEqual:@"YES"]) {
        return 1;
      }
      uint64_t v7 = [v4 length];
      BOOL v5 = 1;
      if (objc_msgSend(v4, "compare:options:range:", @"YES", 1, 0, v7))
      {
        BOOL v5 = 1;
        if (objc_msgSend(v4, "compare:options:range:", @"Y", 1, 0, v7)) {
          return [v4 integerValue] != 0;
        }
      }

      return v5;
    }
  }

  return 0;
}

- (void)setBool:(BOOL)value forKey:(NSString *)aKey
{
}

@end