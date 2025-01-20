@interface NSException
+ (BOOL)supportsSecureCoding;
+ (NSException)exceptionWithName:(NSExceptionName)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo;
+ (NSException)exceptionWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7;
+ (void)raise:(NSExceptionName)name format:(NSString *)format;
+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList;
- (BOOL)_installStackTraceKeyIfNeeded;
- (BOOL)_isUnarchived;
- (BOOL)isEqual:(id)a3;
- (NSArray)callStackReturnAddresses;
- (NSArray)callStackSymbols;
- (NSDictionary)userInfo;
- (NSException)init;
- (NSException)initWithCoder:(id)a3;
- (NSException)initWithName:(NSExceptionName)aName reason:(NSString *)aReason userInfo:(NSDictionary *)aUserInfo;
- (NSException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7;
- (NSExceptionName)name;
- (NSString)reason;
- (id)description;
- (unint64_t)hash;
- (void)_markAsUnarchived;
- (void)dealloc;
- (void)raise;
@end

@implementation NSException

- (NSExceptionName)name
{
  return self->name;
}

- (NSString)reason
{
  return self->reason;
}

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (NSArray)callStackReturnAddresses
{
  return (NSArray *)[self->reserved objectForKey:@"callStackReturnAddresses"];
}

- (NSArray)callStackSymbols
{
  return (NSArray *)[self->reserved objectForKey:@"callStackSymbols"];
}

- (BOOL)_isUnarchived
{
  return [self->reserved objectForKey:@"_NSExceptionWasUnarchived"] != 0;
}

- (void)_markAsUnarchived
{
  if (!self->reserved)
  {
    __CFLookUpClass("NSMutableDictionary");
    v3 = (void *)objc_opt_new();
    self->reserved = v3;
    [v3 setObject:@"SENTINEL" forKey:@"_NSExceptionWasUnarchived"];
  }

- (BOOL)_installStackTraceKeyIfNeeded
{
  userInfo = self->userInfo;
  if (!userInfo) {
    goto LABEL_6;
  }
  if (-[NSDictionary objectForKey:](userInfo, "objectForKey:", @"NSStackTraceKey"))
  {
    LOBYTE(v4) = 0;
    return v4;
  }

  v5 = self->userInfo;
  if (v5)
  {
    v6 = (NSDictionary *)-[NSDictionary mutableCopy](v5, "mutableCopy");
  }

  else
  {
LABEL_6:
    __CFLookUpClass("NSMutableDictionary");
    v6 = (NSDictionary *)objc_opt_new();
  }

  self->userInfo = v6;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(self->reserved, "objectForKey:", @"callStackReturnAddresses"), "description");
  if (v4)
  {
    -[NSDictionary setObject:forKey:](self->userInfo, "setObject:forKey:", v4, @"NSStackTraceKey");
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())) {
    return -[NSString isEqual:](self->name, "isEqual:", *((void *)a3 + 1));
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->name, "hash");
}

- (id)description
{
  id result = self->reason;
  if (!result) {
    return self->name;
  }
  return result;
}

- (void)raise
{
}

- (NSException)init
{
  return 0LL;
}

- (NSException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  v19[1] = *MEMORY[0x1895F89C0];
  self->name = (NSString *)[a3 copy];
  self->reason = (NSString *)[a4 copy];
  self->userInfo = (NSDictionary *)a5;
  v12 = (char *)v19 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a6) {
    goto LABEL_4;
  }
  if (_NSIsNSCFConstantString((uint64_t)self->reason))
  {
    reason = (const __CFString *)self->reason;
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(reason, SystemEncoding);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = CStringPtr;
    a6 = v12;
LABEL_4:
    __CFLookUpClass("NSMutableDictionary");
    self->reserved = (id)objc_opt_new();
    CFDataRef v17 = CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)a6, a7);
    [self->reserved setObject:v17 forKey:@"osLogPack"];
  }

  return self;
}

- (NSException)initWithName:(NSExceptionName)aName reason:(NSString *)aReason userInfo:(NSDictionary *)aUserInfo
{
  return -[NSException initWithName:reason:userInfo:osLogPack:size:]( self,  "initWithName:reason:userInfo:osLogPack:size:",  aName,  aReason,  aUserInfo,  0LL,  0LL);
}

+ (NSException)exceptionWithName:(NSExceptionName)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo
{
  return (NSException *)(id)[objc_alloc((Class)a1) initWithName:name reason:reason userInfo:userInfo];
}

+ (NSException)exceptionWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  return (NSException *)(id)[objc_alloc((Class)a1) initWithName:a3 reason:a4 userInfo:a5 osLogPack:a6 size:a7];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSException;
  -[NSException dealloc](&v3, sel_dealloc);
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList
{
  if (format) {
    v7 = (id)CFStringCreateWithFormatAndArguments( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  (CFStringRef)format,  argList);
  }
  else {
    v7 = &stru_1899EF170;
  }
  objc_exception_throw((id)[a1 exceptionWithName:name reason:v7 userInfo:0]);
  +[NSException raise:format:](v8, v9, v10, v11);
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (format)
  {
    va_copy(v10, va);
    v6 = (id)CFStringCreateWithFormatAndArguments( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  (CFStringRef)format,  va);
  }

  else
  {
    v6 = &stru_1899EF170;
  }

  objc_exception_throw((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", name, v6, 0, v10, v11));
  -[NSException initWithCoder:](v7, v8, v9);
}

- (NSException)initWithCoder:(id)a3
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end