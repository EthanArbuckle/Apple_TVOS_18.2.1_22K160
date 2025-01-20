@interface NSURL(NSURL)
+ (id)URLByResolvingAliasFileAtURL:()NSURL options:error:;
+ (id)URLByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:;
+ (id)URLWithDataRepresentation:()NSURL relativeToURL:;
+ (id)URLWithString:()NSURL encodingInvalidCharacters:;
+ (id)URLWithString:()NSURL relativeToURL:;
+ (id)absoluteURLWithDataRepresentation:()NSURL relativeToURL:;
+ (id)allocWithZone:()NSURL;
+ (id)fileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:;
+ (id)fileURLWithPath:()NSURL;
+ (id)fileURLWithPath:()NSURL isDirectory:;
+ (id)fileURLWithPath:()NSURL isDirectory:relativeToURL:;
+ (id)fileURLWithPath:()NSURL relativeToURL:;
+ (uint64_t)URLWithString:()NSURL;
- (BOOL)_isAbsolute;
- (CFIndex)retainCount;
- (CFStringRef)fragment;
- (CFStringRef)host;
- (CFStringRef)parameterString;
- (CFStringRef)query;
- (CFStringRef)relativePath;
- (CFStringRef)relativeString;
- (CFStringRef)scheme;
- (CFStringRef)user;
- (CFURLRef)absoluteURL;
- (CFURLRef)baseURL;
- (CFURLRef)initFileURLWithPath:()NSURL;
- (CFURLRef)initFileURLWithPath:()NSURL isDirectory:;
- (CFURLRef)initWithCoder:()NSURL;
- (NSBundle)path;
- (NSNumber)port;
- (NSString)description;
- (NSString)resourceSpecifier;
- (NSURLComponents)initWithString:()NSURL relativeToURL:encodingInvalidCharacters:;
- (__CFString)fileSystemRepresentation;
- (char)_cfurl;
- (char)initFileURLWithPath:()NSURL relativeToURL:;
- (id)_tryRetain;
- (id)dealloc;
- (id)hasDirectoryPath;
- (id)retain;
- (id)standardizedURL;
- (objc_class)password;
- (uint64_t)_clientsCreatingIfNecessary:()NSURL;
- (uint64_t)_securePath;
- (uint64_t)absoluteString;
- (uint64_t)dataRepresentation;
- (uint64_t)encodeWithCoder:()NSURL;
- (uint64_t)getFileSystemRepresentation:()NSURL maxLength:;
- (uint64_t)hash;
- (uint64_t)init;
- (uint64_t)initAbsoluteURLWithDataRepresentation:()NSURL relativeToURL:;
- (uint64_t)initByResolvingAliasFileAtURL:()NSURL options:error:;
- (uint64_t)initByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:;
- (uint64_t)initFileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:;
- (uint64_t)initFileURLWithPath:()NSURL isDirectory:relativeToURL:;
- (uint64_t)initWithDataRepresentation:()NSURL relativeToURL:;
- (uint64_t)initWithScheme:()NSURL host:path:;
- (uint64_t)initWithString:()NSURL;
- (uint64_t)initWithString:()NSURL encodingInvalidCharacters:;
- (uint64_t)initWithString:()NSURL relativeToURL:;
- (uint64_t)isEqual:()NSURL;
- (uint64_t)isKindOfClass:()NSURL;
- (uint64_t)isMemberOfClass:()NSURL;
- (unint64_t)_isDeallocating;
- (void)_freeClients;
- (void)isFileURL;
- (void)release;
@end

@implementation NSURL(NSURL)

+ (uint64_t)URLWithString:()NSURL
{
  return [a1 URLWithString:a3 relativeToURL:0];
}

+ (id)URLWithString:()NSURL relativeToURL:
{
  if (a3) {
    return (id)[objc_allocWithZone(a1) initWithString:a3 relativeToURL:a4];
  }
  else {
    return 0LL;
  }
}

+ (id)allocWithZone:()NSURL
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if ((void *)qword_18C496C50 == a1)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    return (id)qword_18C496C40;
  }

  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)off_18C687778;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }

- (uint64_t)initWithString:()NSURL relativeToURL:
{
  return [a1 initWithString:a3 relativeToURL:a4 encodingInvalidCharacters:1];
}

- (NSURLComponents)initWithString:()NSURL relativeToURL:encodingInvalidCharacters:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil string parameter",  _NSMethodExceptionProem(a1, a2));

    v18 = (void *)MEMORY[0x189603F70];
    v19 = (void *)MEMORY[0x189603A60];
    goto LABEL_19;
  }

  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    if ((objc_class *)qword_18C496C40 == a1)
    {
      v13 = -[NSURLComponents initWithString:encodingInvalidCharacters:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithString:encodingInvalidCharacters:",  a3,  a5);
      v14 = (void *)MEMORY[0x186E1FF60]();
      CFURLRef v15 = CFURLCreateWithString(0LL, (CFStringRef)-[NSURLComponents string](v13, "string"), a4);
      objc_autoreleasePoolPop(v14);

      return (NSURLComponents *)v15;
    }

    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(a1, a2));

    v18 = (void *)MEMORY[0x189603F70];
    v19 = (void *)MEMORY[0x189603A48];
LABEL_19:
    objc_exception_throw((id)[v18 exceptionWithName:*v19 reason:v17 userInfo:0]);
    return +[NSURLComponents allocWithZone:](v20, v21, v22);
  }

  v23.receiver = a1;
  v23.super_class = (Class)&off_18C688198;
  v11 = -[objc_class init](&v23, sel_init);
  if (v11)
  {
    CFURLRef v12 = CFURLCreateWithString(0LL, a3, a4);
    if (v12)
    {
      *(void *)&v11[*MEMORY[0x189604068]] = v12;
    }

    else
    {

      return 0LL;
    }
  }

  return (NSURLComponents *)v11;
}

- (id)retain
{
  v1 = a1;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v4.receiver = v1;
    v4.super_class = (Class)&off_18C688198;
    return objc_msgSendSuper2(&v4, sel_retain);
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  return (id)_CFNonObjCRetain();
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
  }

  else
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_18C688198;
    objc_msgSendSuper2(&v3, sel_release);
  }

- (CFStringRef)scheme
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) _cfurl]();
  }

  else if (v3)
  {
    return (id)CFURLCopyScheme((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (char)_cfurl
{
  v1 = a1;
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50) {
    return *(char **)&v1[*MEMORY[0x189604068]];
  }
  return v1;
}

- (NSBundle)path
{
  objc_super v3 = a1;
  uint64_t v4 = (objc_class *)[v3 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_18C496C40)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return +[NSBundle bundleWithPath:](v10, v11, v12);
  }

  else if (v4 && (uint64_t v5 = CFURLCopyAbsoluteURL((CFURLRef)v4)) != 0LL)
  {
    objc_super v6 = v5;
    uint64_t v7 = (__CFString *)CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
    CFRelease(v6);
    return (NSBundle *)v7;
  }

  else
  {
    return 0LL;
  }

- (void)isFileURL
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
    -[NSConcreteMapTable removeObjectForKey:](v5, v6, v7);
  }

  else if (v3)
  {
    _CFURLIsFileURL();
  }

- (CFIndex)retainCount
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    else {
      return CFGetRetainCount(a1);
    }
  }

  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_18C688198;
    return (CFIndex)objc_msgSendSuper2(&v4, sel_retainCount);
  }

- (id)_tryRetain
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    else {
      return (id)(_CFTryRetain() != 0);
    }
  }

  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_18C688198;
    return objc_msgSendSuper2(&v4, sel__tryRetain);
  }

- (unint64_t)_isDeallocating
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    return (void *)qword_18C496C40 == a1 || _CFIsDeallocating() != 0;
  }

  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_18C688198;
    return (unint64_t)objc_msgSendSuper2(&v4, sel__isDeallocating);
  }

- (uint64_t)isKindOfClass:()NSURL
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50 && qword_18C496C50 == a3) {
    return 1LL;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&off_18C688198;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isKindOfClass_, a3);
}

- (uint64_t)isMemberOfClass:()NSURL
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50 && qword_18C496C50 == a3) {
    return 1LL;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&off_18C688198;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isMemberOfClass_, a3);
}

- (uint64_t)_clientsCreatingIfNecessary:()NSURL
{
  uint64_t v5 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v5 == (objc_class *)qword_18C496C40)
  {
    uint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v5, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    return -[NSURL(NSURL) _freeClients]();
  }

  else
  {
    if (!v5) {
      return 0LL;
    }
    uint64_t Mutable = __CFURLReservedPtr();
    if (!Mutable)
    {
      if (a3)
      {
        uint64_t Mutable = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
        __CFURLSetReservedPtr();
      }
    }

    return Mutable;
  }

- (void)_freeClients
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    -[NSURL(NSURL) dealloc]();
  }

  else if (v3)
  {
    objc_super v4 = (void *)__CFURLReservedPtr();
    if (v4)
    {

      __CFURLSetReservedPtr();
    }
  }

- (id)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 _freeClients];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50) {

  }
  v4.receiver = a1;
  v4.super_class = (Class)&off_18C688198;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

- (CFStringRef)relativeString
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) baseURL]();
  }

  else if (v3)
  {
    return (id)(id)CFURLGetString((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (CFURLRef)baseURL
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFURLRef)-[NSURL(NSURL) _isAbsolute]();
  }

  else if (v3)
  {
    return CFURLGetBaseURL((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (BOOL)_isAbsolute
{
  return ![a1 baseURL] && objc_msgSend(a1, "scheme") != 0;
}

- (NSString)resourceSpecifier
{
  if (([a1 _isAbsolute] & 1) == 0) {
    return (NSString *)[a1 relativeString];
  }
  objc_super v4 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_18C496C40)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return (NSString *)-[NSURL(NSURL) init]();
  }

  else
  {
    if (!v4) {
      return 0LL;
    }
    if (!CFURLCanBeDecomposed((CFURLRef)v4))
    {
      uint64_t v5 = (__CFString *)CFURLCopyResourceSpecifier((CFURLRef)v4);
      return (NSString *)v5;
    }

    if (CFURLGetBaseURL((CFURLRef)v4))
    {
      uint64_t v5 = (id)CFURLGetString((CFURLRef)v4);
      return (NSString *)v5;
    }

    objc_super v7 = (id)CFURLCopyNetLocation((CFURLRef)v4);
    uint64_t v8 = (id)CFURLCopyPath((CFURLRef)v4);
    result = (id)CFURLCopyResourceSpecifier((CFURLRef)v4);
    if (v7)
    {
      if (v8)
      {
        if (result) {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"//%@%@%@",  v7,  v8,  result);
        }
        else {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"//%@%@",  v7,  v8,  v11);
        }
      }

      else if (result)
      {
        return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"//%@", v7, v10, v11);
      }

      else
      {
        return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"//%@%@", v7, 0LL, v11);
      }
    }

    else if (v8)
    {
      if (result) {
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v8,  result,  v11);
      }
      else {
        return (NSString *)v8;
      }
    }
  }

  return result;
}

- (uint64_t)init
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (dyld_program_sdk_at_least())
  {
    uint64_t v2 = [a1 initWithString:&stru_189CA6A28];
    objc_super v3 = @"this results in an NSURL instance with an empty URL string.";
  }

  else
  {

    uint64_t v2 = 0LL;
    objc_super v3 = @"the NSURL object has been released and nil returned.";
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __20__NSURL_NSURL__init__block_invoke;
  v5[3] = &unk_189C9A030;
  v5[4] = v3;
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, v5);
  }
  return v2;
}

- (uint64_t)initWithString:()NSURL
{
  return [a1 initWithString:a3 relativeToURL:0];
}

- (uint64_t)initWithString:()NSURL encodingInvalidCharacters:
{
  return [a1 initWithString:a3 relativeToURL:0 encodingInvalidCharacters:a4];
}

+ (id)URLWithString:()NSURL encodingInvalidCharacters:
{
  if (a3) {
    return (id)[objc_allocWithZone(a1) initWithString:a3 relativeToURL:0 encodingInvalidCharacters:a4];
  }
  else {
    return 0LL;
  }
}

- (uint64_t)initWithScheme:()NSURL host:path:
{
  if ([a5 isAbsolutePath])
  {
    if (a4) {
      uint64_t v10 = (const __CFString *)[a4 stringByAddingPercentEscapes];
    }
    else {
      uint64_t v10 = &stru_189CA6A28;
    }
    uint64_t v11 = [a5 standardizedURLPath];
    if (!a3) {
      goto LABEL_20;
    }
    uint64_t v12 = v11;
    uint64_t v13 = [a3 length];
    if (v13 >= 1)
    {
      unint64_t v14 = v13;
      uint64_t v15 = MEMORY[0x1895F8770];
      do
      {
        unint64_t v16 = v14 - 1;
        unsigned int v17 = [a3 characterAtIndex:v14 - 1];
        unsigned int v18 = v17;
        if (v17 > 0x7F)
        {
          if (__maskrune(v17, 0x100uLL)) {
            goto LABEL_16;
          }
        }

        else if ((*(_DWORD *)(v15 + 4LL * v17 + 60) & 0x100) != 0)
        {
          goto LABEL_16;
        }

        if (v14 < 2 || v18 - 48 >= 0xA && (v18 > 0x2E || ((1LL << v18) & 0x680000000000LL) == 0)) {
          goto LABEL_20;
        }
LABEL_16:
        --v14;
      }

      while (v16 + 1 > 1);
    }

    if (v10 && v12)
    {
      return (uint64_t)-[objc_class initWithString:]( a1,  "initWithString:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@%@",  a3,  v10,  v12));
    }

    else
    {
LABEL_20:

      return 0LL;
    }
  }

  else
  {
    id v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: path %@ is not absolute.",  _NSMethodExceptionProem(a1, a2),  a5);

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v20 userInfo:0]);
    return -[NSURL(NSURL) initWithDataRepresentation:relativeToURL:]();
  }

- (uint64_t)initWithDataRepresentation:()NSURL relativeToURL:
{
  objc_super v7 = a1;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_18C688198;
    objc_super v7 = (objc_class *)-[objc_class init](&v15, sel_init);
    if (v7)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFURLRef v10 = CFURLCreateWithBytes( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x8000100u,  a4);
      if (!v10) {
        CFURLRef v10 = CFURLCreateWithBytes(v9, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4);
      }
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604070]) = 0LL;
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604058]) = 0LL;
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604060]) = 0LL;
      if (v10)
      {
        *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604068]) = (Class)v10;
      }

      else
      {

        return 0LL;
      }
    }

    return (uint64_t)v7;
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if ((objc_class *)qword_18C496C40 == v7)
  {
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFURLRef v12 = CFURLCreateWithBytes( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x8000100u,  a4);
    if (!v12) {
      CFURLRef v12 = CFURLCreateWithBytes(v11, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4);
    }
    if (v12) {
      return (uint64_t)v12;
    }
    return (uint64_t)v7;
  }

  unint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(v7, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v14 userInfo:0]);
  return +[NSURL(NSURL) URLWithDataRepresentation:relativeToURL:]();
}

+ (id)URLWithDataRepresentation:()NSURL relativeToURL:
{
  return (id)[objc_allocWithZone(a1) initWithDataRepresentation:a3 relativeToURL:a4];
}

- (uint64_t)initAbsoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  objc_super v7 = a1;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_18C688198;
    objc_super v7 = (objc_class *)-[objc_class init](&v15, sel_init);
    if (v7)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x8000100u,  a4,  1u);
      if (!v10) {
        CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes( v9,  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x201u,  a4,  1u);
      }
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604070]) = 0LL;
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604058]) = 0LL;
      *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604060]) = 0LL;
      if (v10)
      {
        *(Class *)((char *)&v7->isa + (int)*MEMORY[0x189604068]) = (Class)v10;
      }

      else
      {

        return 0LL;
      }
    }

    return (uint64_t)v7;
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if ((objc_class *)qword_18C496C40 == v7)
  {
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFURLRef v12 = CFURLCreateAbsoluteURLWithBytes( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x8000100u,  a4,  1u);
    if (!v12) {
      CFURLRef v12 = CFURLCreateAbsoluteURLWithBytes( v11,  (const UInt8 *)[a3 bytes],  objc_msgSend(a3, "length"),  0x201u,  a4,  1u);
    }
    if (v12) {
      return (uint64_t)v12;
    }
    return (uint64_t)v7;
  }

  unint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(v7, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v14 userInfo:0]);
  return +[NSURL(NSURL) absoluteURLWithDataRepresentation:relativeToURL:]();
}

+ (id)absoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  return (id)[objc_allocWithZone(a1) initAbsoluteURLWithDataRepresentation:a3 relativeToURL:a4];
}

- (uint64_t)dataRepresentation
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSURL(NSURL) initFileURLWithPath:]();
  }

  else
  {
    if (v3)
    {
      size_t v4 = CFURLGetBytes((CFURLRef)v3, 0LL, 0LL);
      if (v4 != -1LL)
      {
        CFIndex v5 = v4;
        SEL v6 = (UInt8 *)malloc(v4);
        if (v6)
        {
          objc_super v7 = v6;
          if (CFURLGetBytes((CFURLRef)v3, v6, v5) == v5) {
            return [MEMORY[0x189603F48] dataWithBytesNoCopy:v7 length:v5 freeWhenDone:1];
          }
          free(v7);
        }
      }
    }

    return 0LL;
  }

- (CFURLRef)initFileURLWithPath:()NSURL
{
  size_t v4 = a1;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    CFIndex v5 = a3;
    if (!-[__CFString length](a3, "length")) {
      goto LABEL_15;
    }
    if ((-[__CFString isAbsolutePath](v5, "isAbsolutePath") & 1) == 0) {
      CFIndex v5 = (__CFString *)-[__CFString stringByStandardizingPath](v5, "stringByStandardizingPath");
    }
    if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", -[__CFString length](v5, "length") - 1) == 47)
    {
      Boolean isDirectory = 1;
    }

    else if ((_NSFileExists((uint64_t)v5, (BOOL *)&isDirectory) & 1) == 0)
    {
      Boolean isDirectory = 0;
    }

    Class Class = object_getClass(v4);
    if (qword_18C496C58 != -1) {
      dispatch_once(&qword_18C496C58, &__block_literal_global_410);
    }
    if (Class != (Class)qword_18C496C50)
    {
      v12.receiver = v4;
      v12.super_class = (Class)&off_18C688198;
      size_t v4 = (objc_class *)-[objc_class init](&v12, sel_init);
      if (!v4) {
        return (CFURLRef)v4;
      }
      CFURLRef v7 = CFURLCreateWithFileSystemPath(0LL, v5, kCFURLPOSIXPathStyle, isDirectory);
      if (v7)
      {
        *(Class *)((char *)&v4->isa + (int)*MEMORY[0x189604068]) = (Class)v7;
        return (CFURLRef)v4;
      }

- (CFURLRef)initFileURLWithPath:()NSURL isDirectory:
{
  CFIndex v5 = a1;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    CFURLRef v7 = a3;
    if (!-[__CFString length](a3, "length")) {
      goto LABEL_11;
    }
    if ((-[__CFString isAbsolutePath](v7, "isAbsolutePath") & 1) == 0) {
      CFURLRef v7 = (__CFString *)-[__CFString stringByStandardizingPath](v7, "stringByStandardizingPath");
    }
    Class Class = object_getClass(v5);
    if (qword_18C496C58 != -1) {
      dispatch_once(&qword_18C496C58, &__block_literal_global_410);
    }
    if (Class != (Class)qword_18C496C50)
    {
      v14.receiver = v5;
      v14.super_class = (Class)&off_18C688198;
      CFIndex v5 = (objc_class *)-[objc_class init](&v14, sel_init);
      if (!v5) {
        return (CFURLRef)v5;
      }
      CFURLRef v9 = CFURLCreateWithFileSystemPath(0LL, v7, kCFURLPOSIXPathStyle, a4);
      if (v9)
      {
        *(Class *)((char *)&v5->isa + (int)*MEMORY[0x189604068]) = (Class)v9;
        return (CFURLRef)v5;
      }

- (uint64_t)initFileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  SEL v6 = a1;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    CFURLRef v9 = a3;
    if (![a3 length]) {
      goto LABEL_11;
    }
    if (([v9 isAbsolutePath] & 1) == 0) {
      CFURLRef v9 = (void *)[v9 stringByStandardizingPath];
    }
    Class Class = object_getClass(v6);
    if (qword_18C496C58 != -1) {
      dispatch_once(&qword_18C496C58, &__block_literal_global_410);
    }
    if (Class != (Class)qword_18C496C50)
    {
      v16.receiver = v6;
      v16.super_class = (Class)&off_18C688198;
      SEL v6 = (objc_class *)-[objc_class init](&v16, sel_init);
      if (!v6) {
        return (uint64_t)v6;
      }
      uint64_t v11 = MEMORY[0x186E1E340](0LL, v9, 0LL, a4, a5);
      if (v11)
      {
        *(Class *)((char *)&v6->isa + (int)*MEMORY[0x189604068]) = (Class)v11;
        return (uint64_t)v6;
      }

- (char)initFileURLWithPath:()NSURL relativeToURL:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v20 = 0LL;
  SEL v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  if (!a3)
  {
    uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil string parameter",  _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:0]);
    goto LABEL_24;
  }

  CFURLRef v7 = a3;
  if (![a3 length])
  {
LABEL_15:

LABEL_16:
    uint64_t v13 = 0LL;
    goto LABEL_17;
  }

  if (([v7 isAbsolutePath] & 1) == 0) {
    CFURLRef v7 = (void *)[v7 stringByStandardizingPath];
  }
  int v8 = objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1);
  uint64_t v9 = *MEMORY[0x189604DB0];
  if (v8 == 47)
  {
    uint64_t v10 = MEMORY[0x186E1E340](v9, v7, 0LL, 1LL, a4);
    v21[3] = v10;
    if (!v10) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v11 = MEMORY[0x186E1E340](v9, v7, 0LL, 0LL, a4);
    v21[3] = v11;
    if (!v11) {
      goto LABEL_15;
    }
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke;
    v19[3] = &unk_189CA1128;
    v19[5] = a4;
    v19[6] = &v20;
    v19[4] = v7;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x189604030], (uint64_t)v19);
    if (!v21[3]) {
      goto LABEL_15;
    }
  }

  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    uint64_t v13 = (char *)v21[3];
    if ((objc_class *)qword_18C496C40 == a1) {
      goto LABEL_17;
    }
    CFRelease((CFTypeRef)v21[3]);
    objc_super v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v16 userInfo:0]);
LABEL_24:
    __break(1u);
  }

  v18.receiver = a1;
  v18.super_class = (Class)&off_18C688198;
  uint64_t v13 = (char *)-[objc_class init](&v18, sel_init);
  objc_super v14 = (const void *)v21[3];
  if (!v13)
  {
    CFRelease(v14);
    goto LABEL_16;
  }

  *(void *)&v13[*MEMORY[0x189604068]] = v14;
LABEL_17:
  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)fileURLWithPath:()NSURL
{
  return (id)[objc_allocWithZone(a1) initFileURLWithPath:a3];
}

+ (id)fileURLWithPath:()NSURL isDirectory:
{
  return (id)[objc_allocWithZone(a1) initFileURLWithPath:a3 isDirectory:a4];
}

+ (id)fileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  return (id)[objc_allocWithZone(a1) initFileURLWithPath:a3 isDirectory:a4 relativeToURL:a5];
}

+ (id)fileURLWithPath:()NSURL relativeToURL:
{
  return (id)[objc_allocWithZone(a1) initFileURLWithPath:a3 relativeToURL:a4];
}

- (uint64_t)initFileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class == (Class)qword_18C496C50)
  {
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    if ((objc_class *)qword_18C496C40 == a1)
    {
      strlen(a3);
      JUMPOUT(0x186E1E2F8LL);
    }

    uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v15 userInfo:0]);
    return +[NSURL(NSURL) fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]();
  }

  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_18C688198;
    uint64_t v11 = (char *)-[objc_class init](&v16, sel_init);
    if (v11)
    {
      size_t v12 = strlen(a3);
      uint64_t v13 = MEMORY[0x186E1E2F8](*MEMORY[0x189604DB0], a3, v12, a4, a5);
      *(void *)&v11[*MEMORY[0x189604070]] = 0LL;
      *(void *)&v11[*MEMORY[0x189604058]] = 0LL;
      *(void *)&v11[*MEMORY[0x189604060]] = 0LL;
      if (v13)
      {
        *(void *)&v11[*MEMORY[0x189604068]] = v13;
      }

      else
      {

        return 0LL;
      }
    }

    return (uint64_t)v11;
  }

+ (id)fileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  return (id)[objc_allocWithZone(a1) initFileURLWithFileSystemRepresentation:a3 isDirectory:a4 relativeToURL:a5];
}

- (uint64_t)getFileSystemRepresentation:()NSURL maxLength:
{
  CFURLRef v7 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v7 == (objc_class *)qword_18C496C40)
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v7, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSURL(NSURL) fileSystemRepresentation]();
  }

  else if (v7)
  {
    return CFURLGetFileSystemRepresentation((CFURLRef)v7, 1u, a3, a4) != 0;
  }

  else
  {
    uint64_t result = 0LL;
    *a3 = 0;
  }

  return result;
}

- (__CFString)fileSystemRepresentation
{
  size_t v4 = a1;
  CFIndex v5 = (objc_class *)-[objc_class _cfurl](a1, "_cfurl");
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v5 == (objc_class *)qword_18C496C40)
  {
    size_t v4 = (objc_class *)&OBJC_CLASS___NSString;
    objc_super v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object was not initialized",  _NSMethodExceptionProem(v5, a2));
    uint64_t v15 = (void *)MEMORY[0x189603F70];
    for (i = (void *)MEMORY[0x189603A48]; ; i = (void *)MEMORY[0x189603B38])
    {
LABEL_22:
      objc_exception_throw((id)[v15 exceptionWithName:*i reason:v14 userInfo:0]);
LABEL_23:
      uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unable to allocate memory for length (%ld)",  _NSMethodExceptionProem(v4, a2),  MaximumSizeOfFileSystemRepresentation);
LABEL_21:
      objc_super v14 = v17;
      uint64_t v15 = (void *)MEMORY[0x189603F70];
    }
  }

  if (!v5)
  {
    size_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ was not initialized",  _NSMethodExceptionProem(v4, a2),  v4);
    goto LABEL_19;
  }

  SEL v6 = malloc(0x400uLL);
  if (!v6)
  {
    uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unable to allocate memory for length (%ld)",  _NSMethodExceptionProem(v4, a2),  1024LL);
    goto LABEL_21;
  }

  CFURLRef v7 = (__CFString *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F48], "dataWithBytesNoCopy:length:", v6, 1024),  "bytes");
  if (!CFURLGetFileSystemRepresentation((CFURLRef)v5, 1u, (UInt8 *)v7, 1024LL))
  {
    int v8 = CFURLCopyAbsoluteURL((CFURLRef)v5);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
      CFURLRef v7 = (__CFString *)v10;
      if (v10)
      {
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v10);
        CFRelease(v7);
        if (MaximumSizeOfFileSystemRepresentation == -1)
        {
          CFURLRef v7 = 0LL;
        }

        else
        {
          uint64_t v11 = malloc(MaximumSizeOfFileSystemRepresentation);
          if (!v11) {
            goto LABEL_23;
          }
          CFURLRef v7 = (__CFString *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F48],  "dataWithBytesNoCopy:length:",  v11,  MaximumSizeOfFileSystemRepresentation),  "bytes");
          if (!CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)v7, MaximumSizeOfFileSystemRepresentation))
          {
            size_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: conversion failed for %@",  _NSMethodExceptionProem(v4, a2),  v4);
LABEL_19:
            objc_super v14 = v12;
            uint64_t v15 = (void *)MEMORY[0x189603F70];
            i = (void *)MEMORY[0x189603A60];
            goto LABEL_22;
          }
        }
      }

      CFRelease(v9);
    }

    else
    {
      return 0LL;
    }
  }

  return v7;
}

- (uint64_t)initByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v26.receiver = a1;
    v26.super_class = (Class)&off_18C688198;
    uint64_t v15 = (char *)-[objc_class init](&v26, sel_init);
    if (!v15) {
      return (uint64_t)v15;
    }
    uint64_t v16 = [a5 _cfurl];
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    if (v16 != qword_18C496C40)
    {
      uint64_t v17 = MEMORY[0x186E1E2BC](*MEMORY[0x189604DB0], a3, a4, v16, 0LL, a6, a7);
      *(void *)&v15[*MEMORY[0x189604070]] = 0LL;
      *(void *)&v15[*MEMORY[0x189604058]] = 0LL;
      *(void *)&v15[*MEMORY[0x189604060]] = 0LL;
      uint64_t v18 = (int)*MEMORY[0x189604068];
      if (v17)
      {
        *(void *)&v15[v18] = v17;
        return (uint64_t)v15;
      }

      *(void *)&v15[v18] = 0LL;
      if (a7)
      {
        if (*a7) {
          *a7 = *a7;
        }
      }

      return 0LL;
    }

    SEL v21 = (objc_class *)v16;
LABEL_29:
    v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object was not initialized",  _NSMethodExceptionProem(v21, a2));
    uint64_t v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A48];
    goto LABEL_30;
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if ((objc_class *)qword_18C496C40 == a1)
  {
    uint64_t v19 = [a5 _cfurl];
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    if (v19 != qword_18C496C40)
    {
      uint64_t v15 = (char *)MEMORY[0x186E1E2BC](*MEMORY[0x189604DB0], a3, a4, v19, 0LL, a6, a7);
      if (v15) {
        return (uint64_t)v15;
      }
      if (a7 && *a7)
      {
        uint64_t v15 = 0LL;
        *a7 = *a7;
        return (uint64_t)v15;
      }

      return 0LL;
    }

    SEL v21 = (objc_class *)v19;
    goto LABEL_29;
  }

  uint64_t v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(a1, a2));

  uint64_t v23 = (void *)MEMORY[0x189603F70];
  uint64_t v24 = *MEMORY[0x189603A48];
  v25 = v22;
LABEL_30:
  objc_exception_throw((id)[v23 exceptionWithName:v24 reason:v25 userInfo:0]);
  return +[NSURL(NSURL) URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:]();
}

+ (id)URLByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  return (id)[objc_allocWithZone(a1) initByResolvingBookmarkData:a3 options:a4 relativeToURL:a5 bookmarkDataIsStale:a6 error:a7];
}

- (uint64_t)initByResolvingAliasFileAtURL:()NSURL options:error:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a1);
  if (qword_18C496C58 != -1) {
    dispatch_once(&qword_18C496C58, &__block_literal_global_410);
  }
  if (Class != (Class)qword_18C496C50)
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_18C688198;
    uint64_t v11 = (char *)-[objc_class init](&v16, sel_init);
    if (!v11) {
      return (uint64_t)v11;
    }
    uint64_t v12 = MEMORY[0x186E1ED84](*MEMORY[0x189604DB0], a3, a4, 0LL, a5);
    *(void *)&v11[*MEMORY[0x189604070]] = 0LL;
    *(void *)&v11[*MEMORY[0x189604058]] = 0LL;
    *(void *)&v11[*MEMORY[0x189604060]] = 0LL;
    uint64_t v13 = (int)*MEMORY[0x189604068];
    if (v12)
    {
      *(void *)&v11[v13] = v12;
      return (uint64_t)v11;
    }

    *(void *)&v11[v13] = 0LL;
    if (a5)
    {
      if (*a5) {
        *a5 = *a5;
      }
    }

    return 0LL;
  }

  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if ((objc_class *)qword_18C496C40 == a1)
  {
    uint64_t v11 = (char *)MEMORY[0x186E1ED84](*MEMORY[0x189604DB0], a3, a4, 0LL, a5);
    if (v11) {
      return (uint64_t)v11;
    }
    if (a5 && *a5)
    {
      uint64_t v11 = 0LL;
      *a5 = *a5;
      return (uint64_t)v11;
    }

    return 0LL;
  }

  uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object already initialized",  _NSMethodExceptionProem(a1, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v15 userInfo:0]);
  return +[NSURL(NSURL) URLByResolvingAliasFileAtURL:options:error:]();
}

+ (id)URLByResolvingAliasFileAtURL:()NSURL options:error:
{
  return (id)[objc_allocWithZone(a1) initByResolvingAliasFileAtURL:a3 options:a4 error:a5];
}

- (uint64_t)isEqual:()NSURL
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  SEL v6 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v6 == (objc_class *)qword_18C496C40)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object was not initialized",  _NSMethodExceptionProem(v6, a2));
  }

  else
  {
    CFURLRef v7 = (objc_class *)[a3 _cfurl];
    if (qword_18C496C48 != -1) {
      dispatch_once(&qword_18C496C48, &__block_literal_global_51);
    }
    if (v7 != (objc_class *)qword_18C496C40) {
      return _CFNonObjCEqual() != 0;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: object was not initialized",  _NSMethodExceptionProem(v7, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v9 userInfo:0]);
  return -[NSURL(NSURL) hash]();
}

- (uint64_t)hash
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    CFIndex v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return -[NSURL(NSURL) encodeWithCoder:]();
  }

  else if (v3)
  {
    return _CFNonObjCHash();
  }

  else
  {
    return 0LL;
  }

- (uint64_t)encodeWithCoder:()NSURL
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  char v5 = [a3 allowsKeyedCoding];
  int v6 = [a1 isFileReferenceURL];
  if ((v5 & 1) != 0)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "baseURL"), @"NS.base");
      uint64_t v7 = [a1 relativeString];
      int v8 = @"NS.relative";
      uint64_t v9 = a3;
      return [v9 encodeObject:v7 forKey:v8];
    }

    uint64_t v12 = (void *)[a1 filePathURL];
    uint64_t v13 = [a1 bookmarkDataWithOptions:512 includingResourceValuesForKeys:0 relativeToURL:0 error:0];
    if (v12
      || (result = [MEMORY[0x189604030] URLWithString:@"com-apple-unresolvable-file-reference-url:"],  (uint64_t v12 = (void *)result) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "baseURL"), @"NS.base");
      uint64_t result = objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "relativeString"), @"NS.relative");
    }

    if (v13)
    {
      int v8 = @"NS.minimalBookmarkData";
      uint64_t v9 = a3;
      uint64_t v7 = v13;
      return [v9 encodeObject:v7 forKey:v8];
    }
  }

  else
  {
    if (v6)
    {
      a1 = (void *)[a1 filePathURL];
      if (!a1) {
        a1 = (void *)[MEMORY[0x189604030] URLWithString:@"com-apple-unresolvable-file-reference-url:"];
      }
    }

    uint64_t v11 = [a1 baseURL];
    BOOL v14 = v11 != 0;
    [a3 encodeValueOfObjCType:"c" at:&v14];
    if (v11) {
      [a3 encodeObject:v11];
    }
    return objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "relativeString"));
  }

  return result;
}

- (CFURLRef)initWithCoder:()NSURL
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    [a3 decodeValueOfObjCType:"c" at:buf size:1];
    if (buf[0])
    {
      uint64_t v7 = [a3 decodeObject];
      if (!v7) {
        goto LABEL_30;
      }
      int v8 = (const __CFURL *)v7;
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
    }

    else
    {
      int v8 = 0LL;
    }

    uint64_t v20 = [a3 decodeObject];
    if (v20)
    {
      SEL v21 = (const __CFString *)v20;
      if (_NSIsNSString())
      {
        CFURLRef result = -[objc_class initWithString:relativeToURL:](a1, "initWithString:relativeToURL:", v21, v8);
        if (!result)
        {
          CFURLRef result = CFURLCreateWithString(0LL, v21, v8);
          if (result) {
            goto LABEL_23;
          }
        }

        goto LABEL_33;
      }
    }

- (NSString)description
{
  if (objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", @"data"))
  {
    if ([a1 baseURL]) {
      return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ -- %@",  [a1 relativeString],  objc_msgSend(a1, "baseURL"));
    }
    else {
      return (NSString *)[a1 relativeString];
    }
  }

  else
  {
    unint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "relativeString"), "length");
    if (v3 > 0x80) {
      size_t v4 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ... %@",  objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringToIndex:", 120),  objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringFromIndex:", v3 - 8));
    }
    else {
      size_t v4 = (NSString *)[a1 relativeString];
    }
    char v5 = v4;
    if ([a1 baseURL]) {
      return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ -- %@",  v5,  [a1 baseURL]);
    }
    else {
      return v5;
    }
  }

- (uint64_t)absoluteString
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    int v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    return -[NSURL(NSURL) absoluteURL]();
  }

  else if (v3 && (size_t v4 = CFURLCopyAbsoluteURL((CFURLRef)v3)) != 0LL)
  {
    char v5 = v4;
    int v6 = (id)(id)CFURLGetString(v4);
    CFRelease(v5);
    return (uint64_t)v6;
  }

  else
  {
    return 0LL;
  }

- (CFURLRef)absoluteURL
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFURLRef)-[NSURL(NSURL) standardizedURL]();
  }

  else if (v3)
  {
    return CFURLCopyAbsoluteURL((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (id)standardizedURL
{
  unint64_t v3 = a1;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  size_t v4 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_18C496C40)
  {
    objc_super v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
  }

  if (!v4) {
    return 0LL;
  }
  if (_CFURLCopyComponents())
  {
    if (theArray)
    {
      v32.length = CFArrayGetCount(theArray);
      v32.location = 0LL;
      if (CFArrayContainsValue(theArray, v32, @".")
        || (v33.length = CFArrayGetCount(theArray), v33.location = 0LL, CFArrayContainsValue(theArray, v33, @"..")))
      {
        char v5 = (void *)objc_opt_new();
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        uint64_t v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( theArray,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v28;
          do
          {
            uint64_t v9 = 0LL;
            do
            {
              if (*(void *)v28 != v8) {
                objc_enumerationMutation(theArray);
              }
              uint64_t v10 = *(const void **)(*((void *)&v27 + 1) + 8 * v9);
              int v11 = CFEqual(v10, @".");
              if (!v11)
              {
                if (CFEqual(v10, @".."))
                {
                  if ([v5 count]) {
                    [v5 removeLastObject];
                  }
                }

                else
                {
                  [v5 addObject:v10];
                }
              }

              ++v9;
            }

            while (v7 != v9);
            uint64_t v12 = -[__CFArray countByEnumeratingWithState:objects:count:]( theArray,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
            uint64_t v7 = v12;
          }

          while (v12);
          if (v11) {
            [v5 addObject:&stru_189CA6A28];
          }
        }

        if ([v5 count])
        {
          uint64_t v13 = (void *)CFRetain((CFTypeRef)[v5 copy]);
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        CFRelease(theArray);
        theArray = (const __CFArray *)v13;
      }
    }

    BOOL v14 = (void *)_CFURLCreateFromComponents();
    if (cf) {
      CFRelease(cf);
    }
    if (v18) {
      CFRelease(v18);
    }
    if (v19) {
      CFRelease(v19);
    }
    if (v20) {
      CFRelease(v20);
    }
    if (theArray) {
      CFRelease(theArray);
    }
    if (v22) {
      CFRelease(v22);
    }
    if (v23) {
      CFRelease(v23);
    }
    if (v24) {
      CFRelease(v24);
    }
    if (v25) {
      CFRelease(v25);
    }
    return v14;
  }

  return v3;
}

- (CFStringRef)host
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) port]();
  }

  else if (v3)
  {
    return (id)CFURLCopyHostName((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (NSNumber)port
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
    return (NSNumber *)-[NSURL(NSURL) user]();
  }

  else
  {
    if (!v3) {
      return 0LL;
    }
    SInt32 v4 = CFURLGetPortNumber((CFURLRef)v3);
    if (v4 == -1) {
      return 0LL;
    }
    else {
      return +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4);
    }
  }

- (CFStringRef)user
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) password]();
  }

  else if (v3)
  {
    return (id)CFURLCopyUserName((CFURLRef)v3);
  }

  else
  {
    return 0LL;
  }

- (objc_class)password
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  if (v3)
  {
    SInt32 v4 = CFURLCopyNetLocation((CFURLRef)v3);
    if (v4)
    {
      char v5 = v4;
      CFIndex location = CFStringFind(v4, @"@", 4uLL).location;
      if (location == -1
        || (uint64_t v7 = location,
            v12.CFIndex location = 0LL,
            v12.length = location,
            !CFStringFindWithOptions(v5, @":", v12, 0LL, &result)))
      {
        unint64_t v3 = 0LL;
      }

      else
      {
        v13.CFIndex location = result.location + 1;
        v13.length = v7 + ~result.location;
        unint64_t v3 = (id)CFStringCreateWithSubstring(0LL, v5, v13);
      }

      CFRelease(v5);
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

- (CFStringRef)relativePath
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) _securePath]();
  }

  else if (v3)
  {
    return (id)CFURLCopyFileSystemPath((CFURLRef)v3, kCFURLPOSIXPathStyle);
  }

  else
  {
    return 0LL;
  }

- (uint64_t)_securePath
{
  v1 = a1;
  return [v1 path];
}

- (CFStringRef)parameterString
{
  block[5] = *MEMORY[0x1895F89C0];
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__NSURL_NSURL__parameterString__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (_MergedGlobals_123 == -1)
  {
    if (v3) {
      return (id)CFURLCopyParameterString((CFURLRef)v3, 0LL);
    }
  }

  else
  {
    dispatch_once(&_MergedGlobals_123, block);
    if (v3) {
      return (id)CFURLCopyParameterString((CFURLRef)v3, 0LL);
    }
  }

  return 0LL;
}

- (CFStringRef)query
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) fragment]();
  }

  else if (v3)
  {
    return (id)CFURLCopyQueryString((CFURLRef)v3, 0LL);
  }

  else
  {
    return 0LL;
  }

- (CFStringRef)fragment
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return (CFStringRef)-[NSURL(NSURL) hasDirectoryPath]();
  }

  else if (v3)
  {
    return (id)CFURLCopyFragment((CFURLRef)v3, 0LL);
  }

  else
  {
    return 0LL;
  }

- (id)hasDirectoryPath
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_18C496C48 != -1) {
    dispatch_once(&qword_18C496C48, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_18C496C40)
  {
    char v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
    return -[NSString standardizedURLPath](v6, v7);
  }

  else if (v3)
  {
    return (id)(CFURLHasDirectoryPath((CFURLRef)v3) != 0);
  }

  else
  {
    return 0LL;
  }

@end