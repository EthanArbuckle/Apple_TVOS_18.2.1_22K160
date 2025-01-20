@interface NSPlaceholderString
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderString)init;
- (NSPlaceholderString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6;
- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6;
- (NSPlaceholderString)initWithCString:(const char *)a3;
- (NSPlaceholderString)initWithCString:(const char *)a3 encoding:(unint64_t)a4;
- (NSPlaceholderString)initWithCString:(const char *)a3 length:(unint64_t)a4;
- (NSPlaceholderString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderString)initWithData:(id)a3 encoding:(unint64_t)a4;
- (NSPlaceholderString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
- (NSPlaceholderString)initWithString:(id)a3;
- (NSPlaceholderString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
@end

@implementation NSPlaceholderString

- (NSPlaceholderString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v9 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a5);
      }
      CFStringEncoding v9 = 1536;
    }
  }

  return (NSPlaceholderString *)CFStringCreateWithBytes(v8, (const UInt8 *)a3, a4, v9, 1u);
}

- (NSPlaceholderString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  if (a3)
  {
    uint64_t v7 = objc_msgSend(a3, "__baseAttributedString");
    if (v7)
    {
      id v8 = -[NSAttributedString _initWithFormat:options:locale:arguments:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "_initWithFormat:options:locale:arguments:",  v7,  0LL,  a4,  a5);
      CFStringEncoding v9 = (NSPlaceholderString *)objc_msgSend((id)objc_msgSend(v8, "string"), "copy");

      return v9;
    }

    else
    {
      return (NSPlaceholderString *)_CFStringCreateWithFormatAndArgumentsAux2();
    }
  }

  else
  {
    v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
    return (NSPlaceholderString *)-[NSString __baseAttributedString](v12, v13);
  }

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v11 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a5);
      }
      CFStringEncoding v11 = 1536;
    }
  }

  v12 = (CFAllocatorRef *)MEMORY[0x189604DB8];
  if (!v6) {
    v12 = (CFAllocatorRef *)MEMORY[0x189604DC8];
  }
  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, *v12);
}

- (NSPlaceholderString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  BOOL v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
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

  return (NSPlaceholderString *)CFStringCreateWithCString(v6, a3, v7);
}

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  v5 = (CFAllocatorRef *)MEMORY[0x189604DB8];
  if (!a5) {
    v5 = (CFAllocatorRef *)MEMORY[0x189604DC8];
  }
  return (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3, a4, *v5);
}

- (NSPlaceholderString)initWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }

  v3 = (NSPlaceholderString *)a3;
  v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)__NSCFStringClass || class_getSuperclass(v5) == (Class)__NSCFStringClass) {
    return (NSPlaceholderString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFStringRef)v3);
  }
  unint64_t v6 = -[NSString fastestEncoding](v3, "fastestEncoding");
  CFStringEncoding v7 = -[NSString _fastCStringContents:](v3, "_fastCStringContents:", 0LL);
  unint64_t v8 = -[NSString lengthOfBytesUsingEncoding:](v3, "lengthOfBytesUsingEncoding:", v6);
  if (v7)
  {
    CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(v6);
    if (v9 == -1)
    {
      if (v6 != 134217984 && v6)
      {
        CFStringEncoding v9 = -1;
      }

      else
      {
        if (_CFExecutableLinkedOnOrAfter()) {
          NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  v6);
        }
        CFStringEncoding v9 = 1536;
      }
    }

    return (NSPlaceholderString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x189604DB0], v7, v8, v9, 0);
  }

  else
  {
    v10 = -[NSString _fastCharacterContents](v3, "_fastCharacterContents");
    if (!v10)
    {
      size_t v11 = v8 + 1;
      CFIndex v19 = 0LL;
      MEMORY[0x1895F8858](0LL);
      SEL v13 = (const UInt8 *)&v19 - v12;
      if (v11 >= 0x101) {
        SEL v13 = (const UInt8 *)malloc(v11);
      }
      -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( v3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v13,  v11,  &v19,  v6,  0LL,  0LL,  -[NSPlaceholderString length](v3, "length", v19, v20),  0LL);
      v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFIndex v15 = v19;
      CFStringEncoding v16 = CFStringConvertNSStringEncodingToEncoding(v6);
      if (v16 == -1)
      {
        if (v6 != 134217984 && v6)
        {
          CFStringEncoding v16 = -1;
        }

        else
        {
          if (_CFExecutableLinkedOnOrAfter()) {
            NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  v6);
          }
          CFStringEncoding v16 = 1536;
        }
      }

      if (v11 > 0x100) {
        return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy( v14,  v13,  v15,  v16,  0,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
      }
      else {
        return (NSPlaceholderString *)CFStringCreateWithBytes(v14, v13, v15, v16, 0);
      }
    }

    return (NSPlaceholderString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x189604DB0], v10, v8 >> 1);
  }

- (NSPlaceholderString)init
{
  return (NSPlaceholderString *)&stru_189CA6A28;
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

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke;
    v10[3] = &unk_189CA0FB0;
    v10[4] = a5;
    v10[5] = a3;
    v10[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)[v10 copy];
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    CFStringEncoding v7 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x189604DD0], &context);
  }

  else
  {
    CFStringEncoding v7 = (const __CFAllocator *)*MEMORY[0x189604DC8];
  }

  unint64_t v8 = (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3, a4, v7);
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

uint64_t __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16LL))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  return (NSPlaceholderString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x189604DB0], a3, a4);
}

- (NSPlaceholderString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  v10 = (CFAllocatorRef *)MEMORY[0x189604DB8];
  if (!v5) {
    v10 = (CFAllocatorRef *)MEMORY[0x189604DC8];
  }
  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v8, (const UInt8 *)a3, a4, SystemEncoding, 0, *v10);
}

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a6)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke;
    v14[3] = &unk_189CA0FB0;
    v14[4] = a6;
    v14[5] = a3;
    v14[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)[v14 copy];
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    CFStringEncoding v9 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x189604DD0], &context);
  }

  else
  {
    CFStringEncoding v9 = (const __CFAllocator *)*MEMORY[0x189604DC8];
  }

  v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v11 = -1;
    }

    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog( (NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.",  a5);
      }
      CFStringEncoding v11 = 1536;
    }
  }

  uint64_t v12 = (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, v9);
  if (v9) {
    CFRelease(v9);
  }
  return v12;
}

uint64_t __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16LL))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithCString:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  return (NSPlaceholderString *)CFStringCreateWithBytes(v6, (const UInt8 *)a3, a4, SystemEncoding, 0);
}

- (NSPlaceholderString)initWithCString:(const char *)a3
{
  v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  return (NSPlaceholderString *)CFStringCreateWithCString(v4, a3, SystemEncoding);
}

- (NSPlaceholderString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  if (a3 && a4)
  {
    StringWithValidatedFormatAndArguments = (NSPlaceholderString *)CFStringCreateStringWithValidatedFormatAndArguments( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFDictionaryRef)a5,  (CFStringRef)a4,  (CFStringRef)a3,  a6,  (CFErrorRef *)a7);
    if (a7)
    {
      if (*a7) {
        id v9 = *a7;
      }
    }

    return StringWithValidatedFormatAndArguments;
  }

  else
  {
    CFStringEncoding v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
    return (NSPlaceholderString *)-[NSPlaceholderString _initWithFormat:locale:options:arguments:]( v12,  v13,  v14,  v15,  v16,  v17);
  }

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  if (a3)
  {
    [a5 pluralizationNumber];
    return (id)_CFStringCreateWithFormatAndArgumentsAux2();
  }

  else
  {
    CFStringEncoding v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    return -[NSPlaceholderString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:]( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
  }

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  if (a3 && a4)
  {
    [a6 pluralizationNumber];
    StringWithValidatedFormatAux = (void *)_CFStringCreateStringWithValidatedFormatAux();
    if (a7)
    {
      if (*a7) {
        id v10 = *a7;
      }
    }

    return StringWithValidatedFormatAux;
  }

  else
  {
    id v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v12);
    return -[NSPlaceholderString initWithData:encoding:](v13, v14, v15, v16);
  }

- (NSPlaceholderString)initWithData:(id)a3 encoding:(unint64_t)a4
{
  if (!a3) {
    return (NSPlaceholderString *)&stru_189CA6A28;
  }
  unint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
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

  return (NSPlaceholderString *)CFStringCreateFromExternalRepresentation(v6, (CFDataRef)a3, v7);
}

- (unint64_t)length
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
}

@end