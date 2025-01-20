@interface NSError
+ (BOOL)supportsSecureCoding;
+ (NSError)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict;
+ (id)_cocoaErrorWithCode:(int64_t)a3 path:(id)a4 url:(id)a5 underlying:(id)a6 variant:(id)a7 source:(id)a8 destination:(id)a9;
+ (id)_readCorruptErrorWithFormat:(id)a3;
+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5;
+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5;
+ (void)_registerBuiltInFormatters;
+ (void)_registerFormatter:(void *)a3 forErrorKey:(id)a4 parameters:(const char *)a5;
+ (void)_setFileNameLocalizationEnabled:(BOOL)a3;
+ (void)_web_addErrorsWithCodesAndDescriptions:(id)a3 inDomain:(id)a4;
+ (void)setUserInfoValueProviderForDomain:(NSErrorDomain)errorDomain provider:(void *)provider;
+ (void)userInfoValueProviderForDomain:(NSErrorDomain)errorDomain;
- (BOOL)_web_errorIsInDomain:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)localizedRecoveryOptions;
- (NSArray)underlyingErrors;
- (NSDictionary)userInfo;
- (NSError)init;
- (NSError)initWithCoder:(id)a3;
- (NSError)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict;
- (NSErrorDomain)domain;
- (NSInteger)code;
- (NSString)helpAnchor;
- (NSString)localizedDescription;
- (NSString)localizedFailureReason;
- (NSString)localizedRecoverySuggestion;
- (__CFString)_retainedUserInfoCallBackForKey:(id)a3;
- (id)_cocoaErrorString:(id)a3;
- (id)_cocoaErrorString:(id)a3 fromBundle:(id)a4 tableName:(id)a5;
- (id)_cocoaErrorStringWithKind:(id)a3;
- (id)_cocoaErrorStringWithKind:(id)a3 variant:(id)a4;
- (id)_formatCocoaErrorString:(id)a3 parameters:(const char *)a4 applicableFormatters:(id *)a5 count:(int64_t)a6;
- (id)_web_failingURL;
- (id)_web_initWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5;
- (id)_web_initWithDomain_nowarn:(id)a3 code:(int64_t)a4 URL:(id)a5;
- (id)_web_localizedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)recoveryAttempter;
- (id)redactedDescription;
- (id)replacementObjectForPortCoder:(id)a3;
- (int64_t)_collectApplicableUserInfoFormatters:(id *)a3 max:(int64_t)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSError

+ (NSError)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  return (NSError *)(id)[objc_alloc((Class)a1) initWithDomain:domain code:code userInfo:dict];
}

- (NSError)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!domain)
  {
    uint64_t v17 = objc_opt_class();
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid domain=nil in -[%@ %s]",  v17,  sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v18 userInfo:0]);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSError;
  v9 = -[NSError init](&v19, sel_init);
  if (v9)
  {
    uint64_t v10 = -[NSString copy](domain, "copy");
    v9->_code = code;
    v9->_domain = (NSString *)v10;
    uint64_t v11 = _CFErrorCreateCallStackReturnAddresses();
    if (v11)
    {
      v12 = (const void *)v11;
      if (dict) {
        v13 = (NSDictionary *)-[NSDictionary mutableCopy](dict, "mutableCopy");
      }
      else {
        v13 = (NSDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
      }
      v14 = v13;
      if (v13)
      {
        -[NSDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v12,  @"NSCallStackReturnAddresses");
        dict = v14;
      }

      CFRelease(v12);
    }

    else
    {
      v14 = 0LL;
    }

    v9->_userInfo = (NSDictionary *)-[NSDictionary copy](dict, "copy");
  }

  return v9;
}

- (id)description
{
  return (id)_CFErrorCreateDebugDescription();
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return self->_userInfo;
  }
  return 0LL;
}

- (NSErrorDomain)domain
{
  return self->_domain;
}

- (NSInteger)code
{
  return self->_code;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSError;
  -[NSError dealloc](&v3, sel_dealloc);
}

- (NSError)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ((init_warned & 1) == 0)
  {
    init_warned = 1;
    objc_super v3 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_ERROR,  "-[NSError init] called; this results in an invalid NSError instance. It will raise an exception in a future rele"
        "ase. Please call errorWithDomain:code:userInfo: or initWithDomain:code:userInfo:. This message shown only once.",
        buf,
        2u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSError;
  return -[NSError init](&v5, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_9;
  }
  if (!a3
    || (objc_opt_isKindOfClass() & 1) == 0
    || (NSInteger v5 = -[NSError code](self, "code"), v5 != [a3 code]))
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  int v6 = -[NSString isEqual:](-[NSError domain](self, "domain"), "isEqual:", [a3 domain]);
  if (v6)
  {
    uint64_t v7 = -[NSError userInfo](self, "userInfo");
    uint64_t v8 = [a3 userInfo];
    if (v7 != (NSDictionary *)v8)
    {
      LOBYTE(v6) = -[NSDictionary isEqual:](v7, "isEqual:", v8);
      return v6;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](-[NSError domain](self, "domain"), "hash");
  return -[NSError code](self, "code") + v3;
}

- (id)_cocoaErrorStringWithKind:(id)a3 variant:(id)a4
{
  uint64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"Err%ld",  -[NSError code](self, "code"));
  uint64_t v8 = v7;
  if (a3) {
    -[NSMutableString appendFormat:](v7, "appendFormat:", @"-%@", a3);
  }
  if (a4) {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @"(%@)", a4);
  }
  id v9 = -[NSError _cocoaErrorString:](self, "_cocoaErrorString:", v8);

  return v9;
}

- (id)_cocoaErrorStringWithKind:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSUserStringVariant");
  if (!v5) {
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0LL);
  }
  int v6 = v5;
  if (!_NSIsNSArray())
  {
    id result = -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, v6);
    if (result) {
      return result;
    }
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0LL);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v7) {
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0LL);
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_8:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v6);
    }
    id result = -[NSError _cocoaErrorStringWithKind:variant:]( self,  "_cocoaErrorStringWithKind:variant:",  a3,  *(void *)(*((void *)&v13 + 1) + 8 * v10));
    if (result) {
      return result;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8) {
        goto LABEL_8;
      }
      return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0LL);
    }
  }

- (__CFString)_retainedUserInfoCallBackForKey:(id)a3
{
  if ([a3 isEqual:@"NSLocalizedDescription"])
  {
    id v5 = -[NSError _cocoaErrorStringWithKind:](self, "_cocoaErrorStringWithKind:", 0LL);
    if (v5)
    {
LABEL_9:
      CFRetain(v5);
      goto LABEL_10;
    }

    goto LABEL_5;
  }

  if ([a3 isEqual:@"NSLocalizedFailureReason"])
  {
LABEL_5:
    int v6 = @"C";
    goto LABEL_8;
  }

  if (![a3 isEqual:@"NSLocalizedRecoverySuggestion"])
  {
    id v5 = 0LL;
    goto LABEL_10;
  }

  int v6 = @"R";
LABEL_8:
  id v5 = -[NSError _cocoaErrorStringWithKind:](self, "_cocoaErrorStringWithKind:", v6);
  if (v5) {
    goto LABEL_9;
  }
LABEL_10:
  _CFAutoreleasePoolPop();
  return v5;
}

- (NSString)localizedDescription
{
  id v3 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSLocalizedDescription");
  if (v3)
  {
    LocalizedDescription = (void *)[v3 copy];
    return (NSString *)LocalizedDescription;
  }

  LocalizedDescription = (void *)_CFErrorCreateLocalizedDescription();
  if (LocalizedDescription) {
    return (NSString *)LocalizedDescription;
  }
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"The operation couldn\\U2019t be completed. (%1$@ error %2$ld.)" value:&stru_189CA6A28 table:@"FoundationErrors"],  -[NSError domain](self, "domain"),  -[NSError code](self, "code"));
}

- (NSString)localizedFailureReason
{
  id v2 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSLocalizedFailureReason");
  if (v2) {
    return (NSString *)(id)[v2 copy];
  }
  id result = (NSString *)_CFErrorCreateLocalizedFailureReason();
  if (result) {
    return result;
  }
  return result;
}

- (NSString)localizedRecoverySuggestion
{
  id v2 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSLocalizedRecoverySuggestion");
  if (v2) {
    return (NSString *)(id)[v2 copy];
  }
  id result = (NSString *)_CFErrorCreateLocalizedRecoverySuggestion();
  if (result) {
    return result;
  }
  return result;
}

- (NSArray)localizedRecoveryOptions
{
  id v3 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSLocalizedRecoveryOptions");
  if (v3) {
    return (NSArray *)v3;
  }
  -[NSError domain](self, "domain");
  uint64_t v5 = CFErrorCopyCallBackBlockForDomain();
  if (!v5) {
    return 0LL;
  }
  int v6 = (const void *)v5;
  uint64_t v7 = (NSArray *)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v5 + 16))( v5,  self,  @"NSLocalizedRecoveryOptions");
  CFRelease(v6);
  if (!v7) {
    return 0LL;
  }
  return v7;
}

- (id)recoveryAttempter
{
  id v3 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSRecoveryAttempter");
  if (!v3)
  {
    -[NSError domain](self, "domain");
    uint64_t v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4) {
      return 0LL;
    }
    uint64_t v5 = (const void *)v4;
    id v3 = (id)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v4 + 16))( v4,  self,  @"NSRecoveryAttempter");
    CFRelease(v5);
    if (!v3) {
      return 0LL;
    }
  }

  return v3;
}

- (NSString)helpAnchor
{
  id v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", @"NSHelpAnchor");
  if (!v3)
  {
    -[NSError domain](self, "domain");
    uint64_t v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4) {
      return 0LL;
    }
    uint64_t v5 = (const void *)v4;
    id v3 = (NSString *)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v4 + 16))( v4,  self,  @"NSHelpAnchor");
    CFRelease(v5);
    if (!v3) {
      return 0LL;
    }
  }

  return v3;
}

- (NSArray)underlyingErrors
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", @"NSUnderlyingError");
  id v4 = -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSMultipleUnderlyingErrorsKey");
  id v5 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", @"NSDetailedErrors");
  int v6 = (NSArray *)[MEMORY[0x189603FA8] array];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    -[NSArray addObject:](v6, "addObject:", v3);
  }
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          -[NSArray addObject:](v6, "addObject:", v11);
        }
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }

    while (v8);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          -[NSArray addObject:](v6, "addObject:", v16);
        }
        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }

    while (v13);
  }

  return v6;
}

- (id)redactedDescription
{
  return (id)_CFErrorCreateRedactedDescription();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[NSError userInfo](self, "userInfo");
  if (!-[NSDictionary count](v5, "count")) {
    id v5 = 0LL;
  }
  int v6 = (__objc2_class *)objc_opt_class();
  if (v6 == &OBJC_CLASS___NSCFError) {
    return -[NSError initWithDomain:code:userInfo:]( +[NSError allocWithZone:](&OBJC_CLASS___NSError, "allocWithZone:", a3),  "initWithDomain:code:userInfo:",  -[NSError domain](self, "domain"),  -[NSError code](self, "code"),  v5);
  }
  uint64_t v7 = -[__objc2_class allocWithZone:](v6, "allocWithZone:", a3);
  v7->vtable = (void *)-[NSString copy](-[NSError domain](self, "domain"), "copy");
  v7->cache = (void *)-[NSError code](self, "code");
  v7->info = (__objc2_class_ro *)-[NSDictionary copy](v5, "copy");
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v5 = -[NSError userInfo](self, "userInfo");
  v8[0] = v5;
  if (!-[NSDictionary count](v5, "count"))
  {
    id v5 = 0LL;
    v8[0] = 0LL;
  }

  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSError code](self, "code"), @"NSCode");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSError domain](self, "domain"), @"NSDomain");
    [a3 encodeObject:v5 forKey:@"NSUserInfo"];
  }

  else
  {
    int v7 = -[NSError code](self, "code");
    int v6 = -[NSError domain](self, "domain");
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "i@@", &v7, &v6, v8);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSError;
  id v5 = -[NSError init](&v17, sel_init);
  uint64_t v6 = objc_msgSend( (id)objc_msgSend(a3, "allowedClasses"),  "setByAddingObjectsFromSet:",  __NSPropertyListClasses_ForArchival_ErrorAndException());
  if (![a3 allowsKeyedCoding])
  {
    p_userInfo = (void **)&v5->_userInfo;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "i@@", &v16, &v5->_domain, &v5->_userInfo);
    v5->_code = v16;
    if (!v5->_userInfo) {
      return v5;
    }
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      userInfo = *p_userInfo;
      if (!*p_userInfo) {
        return v5;
      }
      goto LABEL_9;
    }

    goto LABEL_18;
  }

  if (([a3 containsValueForKey:@"NSCode"] & 1) == 0)
  {
    uint64_t v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    uint64_t v11 = @"%@: missing error code";
LABEL_19:
    id v10 = +[NSError _readCorruptErrorWithFormat:](&OBJC_CLASS___NSError, "_readCorruptErrorWithFormat:", v11, v14, v15);
    goto LABEL_20;
  }

  v5->_code = [a3 decodeIntegerForKey:@"NSCode"];
  if ([a3 error]) {
    goto LABEL_5;
  }
  v5->_domain = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDomain"];
  if ([a3 error]) {
    goto LABEL_5;
  }
  if (!v5->_domain)
  {
    uint64_t v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    uint64_t v11 = @"%@: missing domain string";
    goto LABEL_19;
  }

  v5->_userInfo = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"NSUserInfo"];
  if ([a3 error])
  {
LABEL_5:

    return 0LL;
  }

  if (!v5->_userInfo) {
    return v5;
  }
  if ((_NSIsNSDictionary() & 1) == 0)
  {
LABEL_18:
    uint64_t v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    uint64_t v11 = @"%@: userInfo dictionary found in archive was not a dictionary";
    goto LABEL_19;
  }

  userInfo = v5->_userInfo;
  if (!userInfo) {
    return v5;
  }
LABEL_9:
  uint64_t v9 = _validateKnownUserInfoKeyTypes(userInfo);
  if (v9)
  {
    id v10 = +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"%@: userInfo dictionary found in archive contained an invalid value type for key %@",  _NSMethodExceptionProem((objc_class *)v5, a2),  v9);
LABEL_20:
    id v12 = v10;

    [a3 failWithError:v12];
    return 0LL;
  }

  return v5;
}

+ (void)setUserInfoValueProviderForDomain:(NSErrorDomain)errorDomain provider:(void *)provider
{
  if (errorDomain)
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:", @"NSCocoaErrorDomain"))
    {
      CFErrorSetCallBackBlockForDomain();
      return;
    }

    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Cannot replace provider for NSCocoaErrorDomain",  _NSMethodExceptionProem((objc_class *)a1, a2));
  }

  else
  {
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil domain argument",  _NSMethodExceptionProem((objc_class *)a1, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
  +[NSError userInfoValueProviderForDomain:](v7, v8, v9);
}

+ (void)userInfoValueProviderForDomain:(NSErrorDomain)errorDomain
{
  return (id)CFErrorCopyCallBackBlockForDomain();
}

+ (id)_cocoaErrorWithCode:(int64_t)a3 path:(id)a4 url:(id)a5 underlying:(id)a6 variant:(id)a7 source:(id)a8 destination:(id)a9
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  int v16 = v15;
  if (a4) {
    [v15 setObject:a4 forKeyedSubscript:@"NSFilePath"];
  }
  if (a5) {
    [v16 setObject:a5 forKeyedSubscript:@"NSURL"];
  }
  if (a6) {
    [v16 setObject:a6 forKeyedSubscript:@"NSUnderlyingError"];
  }
  if (a7)
  {
    v19[0] = a7;
    objc_msgSend( v16,  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v19, 1),  @"NSUserStringVariant");
  }

  if (a8) {
    [v16 setObject:a8 forKeyedSubscript:@"NSSourceFilePathErrorKey"];
  }
  if (a9) {
    [v16 setObject:a9 forKeyedSubscript:@"NSDestinationFilePath"];
  }
  objc_super v17 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  a3,  v16);

  return v17;
}

+ (void)_web_addErrorsWithCodesAndDescriptions:(id)a3 inDomain:(id)a4
{
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain:code:failingURL:", a3, a4, a5);
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain_nowarn:code:URL:", a3, a4, a5);
}

- (id)_web_initWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v10 = v9;
  if (a5)
  {
    [v9 setObject:a5 forKey:@"NSErrorFailingURLStringKey"];
    a5 = (id)[MEMORY[0x189604030] URLWithString:a5];
    if (a5) {
      [v10 setObject:a5 forKey:@"NSErrorFailingURLKey"];
    }
  }

  [a5 host];
  id v11 = localizedDescriptionForError(a3, a4);
  if (v11) {
    [v10 setObject:v11 forKey:@"NSLocalizedDescription"];
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason) {
      [v10 setObject:LocalizedFailureReason forKey:@"NSLocalizedFailureReason"];
    }
  }

  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion) {
      [v10 setObject:LocalizedRecoverySuggestion forKey:@"NSLocalizedRecoverySuggestion"];
    }
  }

  if ([v10 count]) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0LL;
  }
  return -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", a3, a4, v14);
}

- (BOOL)_web_errorIsInDomain:(id)a3
{
  return -[NSString isEqualToString:](-[NSError domain](self, "domain"), "isEqualToString:", a3);
}

- (id)_web_localizedDescription
{
  id v3 = -[NSError _web_failingURL](self, "_web_failingURL");
  if (v3) {
    id v4 = (void *)[MEMORY[0x189604030] URLWithString:v3];
  }
  else {
    id v4 = 0LL;
  }
  id v5 = -[NSError domain](self, "domain");
  uint64_t v6 = -[NSError code](self, "code");
  [v4 host];
  id result = localizedDescriptionForError(v5, v6);
  if (!result) {
    return -[NSError localizedDescription](self, "localizedDescription");
  }
  return result;
}

- (id)_web_failingURL
{
  return (id)objc_msgSend( -[NSDictionary objectForKey:]( -[NSError userInfo](self, "userInfo"),  "objectForKey:",  @"NSErrorFailingURLStringKey"),  "copy");
}

- (id)_web_initWithDomain_nowarn:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v10 = v9;
  if (a5)
  {
    [v9 setObject:a5 forKey:@"NSErrorFailingURLKey"];
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a5, "absoluteString"), @"NSErrorFailingURLStringKey");
  }

  [a5 host];
  id v11 = localizedDescriptionForError(a3, a4);
  if (v11) {
    [v10 setObject:v11 forKey:@"NSLocalizedDescription"];
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason) {
      [v10 setObject:LocalizedFailureReason forKey:@"NSLocalizedFailureReason"];
    }
  }

  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion) {
      [v10 setObject:LocalizedRecoverySuggestion forKey:@"NSLocalizedRecoverySuggestion"];
    }
  }

  if ([v10 count]) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0LL;
  }
  return -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", a3, a4, v14);
}

+ (void)_setFileNameLocalizationEnabled:(BOOL)a3
{
  fileNameLocalizationDisabled = !a3;
}

+ (void)_registerBuiltInFormatters
{
  if (_registerBuiltInFormatters_builtInsRegistered != -1) {
    dispatch_once(&_registerBuiltInFormatters_builtInsRegistered, &__block_literal_global_8);
  }
}

uint64_t __53__NSError_NSErrorPrivate___registerBuiltInFormatters__block_invoke()
{
  return +[NSError _registerFormatter:forErrorKey:parameters:]( &OBJC_CLASS___NSError,  "_registerFormatter:forErrorKey:parameters:",  validationValue,  @"NSMaximumValidValue",  "x");
}

+ (void)_registerFormatter:(void *)a3 forErrorKey:(id)a4 parameters:(const char *)a5
{
  if (!qword_18C4965E0)
  {
    SEL v8 = NSCreateMapTableWithZone( (NSMapTableKeyCallBacks *)&NSObjectMapKeyCallBacks,  (NSMapTableValueCallBacks *)&NSOwnedPointerMapValueCallBacks,  (NSUInteger)a3,  (NSZone *)a4);
    while (!__ldaxr((unint64_t *)&qword_18C4965E0))
    {
    }

    __clrex();
    NSFreeMapTable(v8);
  }

- (int64_t)_collectApplicableUserInfoFormatters:(id *)a3 max:(int64_t)a4
{
  if (qword_18C4965E0)
  {
    id v7 = -[NSDictionary keyEnumerator](-[NSError userInfo](self, "userInfo"), "keyEnumerator");
    uint64_t v8 = -[NSEnumerator nextObject](v7, "nextObject");
    if (v8)
    {
      id v9 = (id)v8;
      int64_t v10 = 0LL;
      while (1)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_94);
        char v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)NSMapGet((NSMapTable *)qword_18C4965E0, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_94);
        if (v11)
        {
          if (v10 == a4) {
            return -1LL;
          }
          a3[v10++] = v11;
        }

        id v9 = -[NSEnumerator nextObject](v7, "nextObject");
        if (!v9) {
          return v10;
        }
      }
    }
  }

  return 0LL;
}

- (id)_formatCocoaErrorString:(id)a3 parameters:(const char *)a4 applicableFormatters:(id *)a5 count:(int64_t)a6
{
  id v6 = a3;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      int64_t v10 = strlen(a4);
      if (v10 >= 1)
      {
        int64_t v11 = v10;
        id v21 = v6;
        __int128 v22 = a4;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v24 = 0u;
        int v12 = -[NSError userInfo](self, "userInfo");
        uint64_t v13 = 0LL;
        while (1)
        {
          if (a6 >= 1)
          {
            int v14 = a5;
            uint64_t v15 = v22[v13];
            int v16 = 1 << (v22[v13] - 97);
            int64_t v17 = a6;
            do
            {
              if ((*((_DWORD *)*v14 + 4) & v16) != 0)
              {
                uint64_t v18 = -[NSDictionary objectForKey:](v12, "objectForKey:", *((void *)*v14 + 1));
                if (v18)
                {
                  uint64_t v19 = (*(uint64_t (**)(uint64_t, NSError *, uint64_t))*v14)(v18, self, v15);
                  if (v19) {
                    *((void *)&v24 + v13) = v19;
                  }
                }
              }

              ++v14;
              --v17;
            }

            while (v17);
          }

          if (!*((void *)&v24 + v13)) {
            break;
          }
          if (++v13 == v11) {
            return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v21,  @"%@%@%@%@%@%@",  0LL,  v24,  v25,  v26);
          }
        }

        return 0LL;
      }
    }
  }

  return v6;
}

- (id)_cocoaErrorString:(id)a3 fromBundle:(id)a4 tableName:(id)a5
{
  id v37 = a5;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v36 = a4;
  if (!a4) {
    return 0LL;
  }
  id v6 = self;
  uint64_t v7 = -[NSError _collectApplicableUserInfoFormatters:max:]( self,  "_collectApplicableUserInfoFormatters:max:",  v39,  12LL);
  if (v7)
  {
    uint64_t v33 = v7;
    unsigned int v8 = 0;
    if (v7 >= 1)
    {
      id v9 = (uint64_t *)v39;
      uint64_t v10 = v7;
      do
      {
        uint64_t v11 = *v9++;
        v8 |= *(_DWORD *)(v11 + 16);
        --v10;
      }

      while (v10);
    }

    unint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    do
    {
      if (((v8 >> v12) & 1) != 0) {
        v38[v13++] = v12 + 97;
      }
      if (v12 > 0x18) {
        break;
      }
      ++v12;
    }

    while (v13 < 6);
    v34 = v6;
    v32[1] = v32;
    uint64_t v14 = 1 << v13;
    uint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    *uint64_t v15 = 0;
    if (1 << v13 >= 2)
    {
      uint64_t v16 = 1LL;
      do
      {
        if (v16 < 2 * v16)
        {
          uint64_t v17 = 0LL;
          do
          {
            v15[v16 + v17] = v15[v17] + 1;
            ++v17;
          }

          while (v16 != v17);
          v16 *= 2LL;
        }
      }

      while (v16 < v14);
    }

    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v18 = 1LL;
      }
      else {
        uint64_t v18 = 1 << v13;
      }
      unint64_t v35 = (v13 + 16) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v19 = v13;
      do
      {
        if ((_DWORD)v13 != 31)
        {
          for (unint64_t i = 0LL; i != v18; ++i)
          {
            if (v19 == v15[i])
            {
              id v21 = (char *)v32 - v35;
              __int128 v22 = (char *)v32 - v35;
              if (i)
              {
                v23 = v38;
                unint64_t v24 = i;
                __int128 v22 = (char *)v32 - v35;
                do
                {
                  if ((v24 & 1) != 0) {
                    *v22++ = *v23;
                  }
                  ++v23;
                  BOOL v25 = v24 > 1;
                  v24 >>= 1;
                }

                while (v25);
              }

              *__int128 v22 = 0;
              id v26 = a3;
              uint64_t v27 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%s", a3, v21);
              uint64_t v28 = (void *)[v36 localizedStringForKey:v27 value:0 table:v37];
              if (v28)
              {
                v29 = v28;
                if (([v28 isEqual:v27] & 1) == 0)
                {
                  id result = -[NSError _formatCocoaErrorString:parameters:applicableFormatters:count:]( v34,  "_formatCocoaErrorString:parameters:applicableFormatters:count:",  v29,  v21,  v39,  v33);
                  if (result) {
                    return result;
                  }
                }
              }

              a3 = v26;
            }
          }
        }

        BOOL v25 = v19-- < 2;
      }

      while (!v25);
    }

    id v6 = v34;
  }

  id result = (id)[v36 localizedStringForKey:a3 value:0 table:v37];
  if (result)
  {
    id v31 = result;
    if ([result isEqual:a3]) {
      return 0LL;
    }
    return -[NSError _formatCocoaErrorString:parameters:applicableFormatters:count:]( v6,  "_formatCocoaErrorString:parameters:applicableFormatters:count:",  v31,  0LL,  0LL,  0LL);
  }

  return result;
}

- (id)_cocoaErrorString:(id)a3
{
  uint64_t v5 = -[NSError code](self, "code");
  if (v5 >= 0x10000
    || (id result = -[NSError _cocoaErrorString:fromBundle:tableName:]( self,  "_cocoaErrorString:fromBundle:tableName:",  a3,  _NSFoundationBundle(),  @"FoundationErrors")) == 0LL)
  {
    id result = -[NSError _cocoaErrorString:fromBundle:tableName:]( self,  "_cocoaErrorString:fromBundle:tableName:",  a3,  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.CoreData"),  @"CoreDataErrors");
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

+ (id)_readCorruptErrorWithFormat:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v3 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a3, &v9);
  if (v3)
  {
    id v4 = v3;
    uint64_t v7 = @"NSDebugDescription";
    v8[0] = v3;
    uint64_t v5 = [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864LL,  v5,  &v9);
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSError;
    return -[NSError replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

@end