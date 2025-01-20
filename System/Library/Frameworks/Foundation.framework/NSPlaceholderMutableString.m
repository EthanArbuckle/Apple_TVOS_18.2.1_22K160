@interface NSPlaceholderMutableString
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderMutableString)init;
- (NSPlaceholderMutableString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6;
- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6;
- (NSPlaceholderMutableString)initWithCString:(const char *)a3 encoding:(unint64_t)a4;
- (NSPlaceholderMutableString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderMutableString)initWithCapacity:(unint64_t)a3;
- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderMutableString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
- (NSPlaceholderMutableString)initWithString:(id)a3;
- (NSPlaceholderMutableString)initWithUTF8String:(const char *)a3;
- (NSPlaceholderMutableString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSPlaceholderMutableString

- (NSPlaceholderMutableString)initWithCapacity:(unint64_t)a3
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
}

- (NSPlaceholderMutableString)init
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
}

- (NSPlaceholderMutableString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  if (a3)
  {
    Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    _CFStringAppendFormatAndArgumentsAux2();
    return Mutable;
  }

  else
  {
    v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    return (NSPlaceholderMutableString *)_NS_os_log_callback();
  }

- (NSPlaceholderMutableString)initWithString:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)objc_opt_class();
    if (v4 == (objc_class *)__NSCFStringClass || class_getSuperclass(v4) == (Class)__NSCFStringClass)
    {
      return (NSPlaceholderMutableString *)CFStringCreateMutableCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  (CFStringRef)a3);
    }

    else
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      CFStringAppend(Mutable, (CFStringRef)a3);
      return (NSPlaceholderMutableString *)Mutable;
    }
  }

  else
  {
    v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    return (NSPlaceholderMutableString *)-[NSString integerValue](v8, v9);
  }

- (unint64_t)retainCount
{
  return -1LL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderMutableString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v8 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v8 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a5);
      }
      CFStringEncoding v8 = 1536;
    }
  }

  result = (NSPlaceholderMutableString *)CFStringCreateWithBytes(0LL, (const UInt8 *)a3, a4, v8, 1u);
  if (result)
  {
    v10 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  (CFStringRef)result);
    CFRelease(v10);
    return MutableCopy;
  }

  return result;
}

- (NSPlaceholderMutableString)initWithUTF8String:(const char *)a3
{
  if (a3)
  {
    if (self == (NSPlaceholderMutableString *)&__mutablePlaceholder || _CFExecutableLinkedOnOrAfter())
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      v6 = (NSPlaceholderMutableString *)Mutable;
      if (Mutable) {
        CFStringAppendCString(Mutable, a3, 0x8000100u);
      }
      return v6;
    }

    else
    {
      return -[NSPlaceholderMutableString initWithBytes:length:encoding:]( self,  "initWithBytes:length:encoding:",  a3,  strlen(a3),  4LL);
    }
  }

  else
  {
    CFStringEncoding v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
    return -[NSPlaceholderMutableString initWithBytesNoCopy:length:encoding:freeWhenDone:](v9, v10, v11, v12, v13, v14);
  }

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  BOOL v6 = a6;
  CFStringEncoding v10 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v10 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v10 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a5);
      }
      CFStringEncoding v10 = 1536;
    }
  }

  v11 = (CFAllocatorRef *)MEMORY[0x189604DB8];
  if (!v6) {
    v11 = (CFAllocatorRef *)MEMORY[0x189604DC8];
  }
  result = (NSPlaceholderMutableString *)CFStringCreateWithBytesNoCopy(0LL, (const UInt8 *)a3, a4, v10, 1u, *v11);
  if (result)
  {
    unint64_t v13 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  (CFStringRef)result);
    CFRelease(v13);
    return MutableCopy;
  }

  return result;
}

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  result = -[NSString initWithBytesNoCopy:length:encoding:deallocator:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:deallocator:",  a3,  a4,  a5,  a6);
  if (result)
  {
    v7 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  (CFStringRef)result);

    return MutableCopy;
  }

  return result;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (v5) {
    free(a3);
  }
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (a5) {
    (*((void (**)(id, unsigned __int16 *, unint64_t))a5 + 2))(a5, a3, a4);
  }
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  if (a3)
  {
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    CFStringEncoding v7 = CFStringConvertNSStringEncodingToEncoding(a4);
    if (v7 == -1)
    {
      if (a4 != 134217984 && a4)
      {
        CFStringEncoding v7 = -1;
      }

      else
      {
        if (_CFExecutableLinkedOnOrAfter()) {
          NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a4);
        }
        CFStringEncoding v7 = 1536;
      }
    }

    CFStringAppendCString(Mutable, a3, v7);
    return (NSPlaceholderMutableString *)Mutable;
  }

  else
  {
    SEL v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSPlaceholderMutableString initWithCStringNoCopy:length:freeWhenDone:](v10, v11, v12, v13, v14);
  }

- (NSPlaceholderMutableString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  SEL v9 = CFStringCreateWithBytes(0LL, (const UInt8 *)a3, a4, SystemEncoding, 0);
  if (v5) {
    free(a3);
  }
  if (!v9) {
    return 0LL;
  }
  MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v9);
  CFRelease(v9);
  return MutableCopy;
}

- (NSPlaceholderMutableString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  if (a3 && a4)
  {
    Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    if (!_CFStringAppendValidatedFormatAndArguments())
    {
      CFRelease(Mutable);
      if (a7)
      {
        if (*a7) {
          id v9 = *a7;
        }
      }

      return 0LL;
    }

    return Mutable;
  }

  else
  {
    SEL v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
    return (NSPlaceholderMutableString *)-[NSPlaceholderMutableString _initWithFormat:locale:options:arguments:]( v12,  v13,  v14,  v15,  v16,  v17);
  }

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  if (a3)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    [a5 pluralizationNumber];
    _CFStringAppendFormatAndArgumentsAux2();
    return Mutable;
  }

  else
  {
    id v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSPlaceholderMutableString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:]( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17);
  }

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  if (!a3 || !a4)
  {
    id v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
    -[NSPlaceholderMutableString length](v14, v15);
  }

  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  [a6 pluralizationNumber];
  if (!_CFStringAppendValidatedFormatAndArguments())
  {
    CFRelease(Mutable);
    if (a7 && *a7) {
      id v11 = *a7;
    }
    return 0LL;
  }

  return Mutable;
}

- (unint64_t)length
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

@end