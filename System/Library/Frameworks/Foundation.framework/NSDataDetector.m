@interface NSDataDetector
+ (BOOL)supportsSecureCoding;
+ (NSDataDetector)dataDetectorWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDataDetector)initWithCoder:(id)a3;
- (NSDataDetector)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSDataDetector)initWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error;
- (NSTextCheckingTypes)checkingTypes;
- (id)description;
- (id)pattern;
- (unint64_t)numberOfCaptureGroups;
- (unint64_t)options;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateMatchesInString:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 usingBlock:(id)a6;
@end

@implementation NSDataDetector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

+ (NSDataDetector)dataDetectorWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  return (NSDataDetector *)(id)[objc_alloc((Class)a1) initWithTypes:checkingTypes error:error];
}

- (NSDataDetector)initWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ((checkingTypes & 0x1838) == 0)
  {
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: no data detector types specified",  _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NSDataDetector;
  v7 = -[NSDataDetector init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_types = checkingTypes;
    qword_18C4970C8 = (uint64_t)_NSFaultInObject( (unint64_t *)&qword_18C4970C8,  0LL,  (uint64_t)&__block_literal_global_72);
    [(id)qword_18C4970C8 lock];
    if ((_MergedGlobals_146 & 1) == 0)
    {
      v9 = dlopen( (const char *)[@"/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore" fileSystemRepresentation],  256);
      qword_18C4970C0 = (uint64_t)v9;
      if (v9)
      {
        off_18C497088 = (uint64_t (*)(void, void, void))dlsym(v9, "DDScannerCreate");
        off_18C4970D0 = dlsym((void *)qword_18C4970C0, "DDScannerReset");
        off_18C497098 = dlsym((void *)qword_18C4970C0, "DDScannerScanStringWithRange");
        off_18C497090 = dlsym((void *)qword_18C4970C0, "DDScannerSetProgressReportingBlock");
        off_18C4970B0 = dlsym((void *)qword_18C4970C0, "DDScannerCopyResults");
        off_18C4970A8 = dlsym((void *)qword_18C4970C0, "DDScannerCopyResultsCheckOverlap");
        off_18C4970A0 = dlsym((void *)qword_18C4970C0, "DDScannerCopyResultsWithOptions");
        off_18C4970D8 = dlsym((void *)qword_18C4970C0, "DDResultGetType");
        off_18C4970B8 = dlsym((void *)qword_18C4970C0, "DDResultGetRange");
        off_18C4970E0 = dlsym((void *)qword_18C4970C0, "DDResultGetRangeForURLification");
        off_18C4970E8 = dlsym((void *)qword_18C4970C0, "DDResultGetSubResults");
        off_18C4970F0 = dlsym((void *)qword_18C4970C0, "DDResultGetValue");
        *(void *)&xmmword_18C4970F8 = dlsym((void *)qword_18C4970C0, "DDResultCopyExtractedURL");
        *((void *)&xmmword_18C4970F8 + 1) = dlsym((void *)qword_18C4970C0, "DDResultCopyExtractedURLWithOptions");
        off_18C497108 = dlsym((void *)qword_18C4970C0, "DDResultCopyExtractedDateFromReferenceDate");
        off_18C497110 = dlsym((void *)qword_18C4970C0, "DDResultCopyExtractedStartDateEndDate");
        off_18C497118 = dlsym((void *)qword_18C4970C0, "DDResultCopyPhoneValue");
      }

      BOOL v10 = 0;
      _MergedGlobals_146 = 1;
      if (off_18C497088)
      {
        if (off_18C4970D0)
        {
          if (off_18C497098)
          {
            if (off_18C497090)
            {
              BOOL v10 = 0;
              if ((unint64_t)off_18C4970B0 | (unint64_t)off_18C4970A8 | (unint64_t)off_18C4970A0)
              {
                if (off_18C4970D8)
                {
                  if (off_18C4970B8)
                  {
                    if (off_18C4970E0)
                    {
                      if (off_18C4970E8)
                      {
                        if (off_18C4970F0)
                        {
                          BOOL v10 = 0;
                          if (xmmword_18C4970F8 != 0)
                          {
                            if (off_18C497108) {
                              BOOL v10 = off_18C497110 != 0LL;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      byte_18C497081 = v10;
    }

    [(id)qword_18C4970C8 unlock];
    int v11 = byte_18C497081;
    if (byte_18C497081)
    {
      uint64_t v12 = off_18C497088((checkingTypes & 0x1818) == 0, 1LL, error);
      v8->super._internal = (void *)v12;
      if (v12) {
        return v8;
      }
    }

    else if (v8->super._internal)
    {
      return v8;
    }

    if (error && !v11) {
      *error = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256LL,  0LL);
    }
    -[NSDataDetector dealloc](v8, "dealloc");
    return 0LL;
  }

  return v8;
}

- (NSDataDetector)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Not valid for NSDataDetector",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
  -[NSDataDetector encodeWithCoder:](v7, v8, v9);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5[1] = *MEMORY[0x1895F89C0];
  NSTextCheckingTypes v4 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt64:v4 forKey:@"NSCheckingTypes"];
  }

  else
  {
    v5[0] = v4;
    [a3 encodeValueOfObjCType:"Q" at:v5];
  }

- (NSDataDetector)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeInt64ForKey:@"NSCheckingTypes"];
    return -[NSDataDetector initWithTypes:error:](self, "initWithTypes:error:", v6, 0LL);
  }

  v11[0] = 0LL;
  uint64_t v7 = [a3 versionForClassName:@"NSDataDetector"];
  if (v7 == 1)
  {
    [a3 decodeValueOfObjCType:"Q" at:v11 size:8];
    uint64_t v6 = v11[0];
    return -[NSDataDetector initWithTypes:error:](self, "initWithTypes:error:", v6, 0LL);
  }

  uint64_t v9 = v7;
  BOOL v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v10, 1LL, v9);
  -[NSDataDetector dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSTextCheckingTypes v5 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  return v5 == [a3 checkingTypes];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  internal = self->super._internal;
  if (internal)
  {
    CFRelease(internal);
    self->super._internal = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSDataDetector;
  -[NSRegularExpression dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDataDetector;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%llx",  -[NSRegularExpression description](&v3, sel_description),  self->_types);
}

- (NSTextCheckingTypes)checkingTypes
{
  return self->_types;
}

- (id)pattern
{
  return 0LL;
}

- (unint64_t)options
{
  return 0LL;
}

- (unint64_t)numberOfCaptureGroups
{
  return 1LL;
}

- (void)enumerateMatchesInString:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 usingBlock:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  __int16 v9 = a4;
  v83[1] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  unint64_t v13 = [a3 length];
  __int16 v63 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  char v78 = 0;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x2020000000LL;
  char v77 = 0;
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  NSUInteger v64 = location;
  NSUInteger v73 = location;
  v67[0] = MEMORY[0x1895F87A8];
  v67[1] = 3221225472LL;
  v67[2] = __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke;
  v67[3] = &unk_189CA2AA0;
  BOOL v68 = (v9 & 4) != 0LL;
  char v69 = v9 & 1;
  v67[4] = a6;
  v67[5] = &v70;
  v58 = (void (**)(id, NSLinkCheckingResult *, void, char *))a6;
  v67[6] = &v74;
  id v62 = a3;
  if (!a3)
  {
    v52 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v52);
    goto LABEL_138;
  }

  uint64_t v59 = v9 & 1;
  if (v13 < length || location > v13 - length)
  {
    v53 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v53);
LABEL_138:
    __break(1u);
  }

  uint64_t v61 = v9 & 4;
  internal = self->super._internal;
  p_checkout = &self->super._checkout;
  do
  {
    if (__ldaxr((unsigned int *)p_checkout))
    {
      int v17 = 0;
      __clrex();
      internal = (void *)off_18C497088((v63 & 0x1818) == 0LL, 1LL, 0LL);
LABEL_8:
      if ((v9 & 5) != 0) {
        off_18C497090(internal, v67);
      }
      int v18 = 0;
      if (off_18C497098(internal, a3, v64, length))
      {
        LOBYTE(v66) = 0;
        if (!v78)
        {
          int v66 = 0;
          unint64_t v65 = v64 + length;
          __int16 v60 = v9;
          while (1)
          {
            if (*((_BYTE *)v75 + 24))
            {
              int v18 = 0;
              goto LABEL_117;
            }

            if (off_18C4970A0)
            {
              v19 = (const __CFArray *)off_18C4970A0(internal, 3LL);
            }

            else if (off_18C4970A8)
            {
              v19 = (const __CFArray *)off_18C4970A8(internal, 1LL);
            }

            else
            {
              if (!off_18C4970B0) {
                goto LABEL_116;
              }
              v19 = (const __CFArray *)off_18C4970B0(internal);
            }

            v20 = v19;
            if (!v19)
            {
LABEL_116:
              int v18 = 1;
              goto LABEL_117;
            }

            if (CFArrayGetCount(v19) < 1)
            {
              CFRelease(v20);
              goto LABEL_116;
            }

            ValueAtIndex = CFArrayGetValueAtIndex(v20, 0LL);
            uint64_t v22 = off_18C4970B8(ValueAtIndex);
            unint64_t v24 = v22 + v23;
            int v25 = v66;
            if (v65 == v22 + v23) {
              int v25 = 1;
            }
            int v66 = v25;
            if (!v61 || v22 <= v71[3])
            {
              uint64_t v26 = off_18C4970B8(ValueAtIndex);
              uint64_t v28 = v27;
              uint64_t v29 = off_18C4970E0(ValueAtIndex);
              if (v29 != -1 && v30 >= 1 && v29 >= v26 && v29 + v30 <= v26 + v28)
              {
                uint64_t v26 = v29;
                uint64_t v28 = v30;
              }

              if (v26 >= v64 && v28 + v26 <= v65) {
                break;
              }
            }

uint64_t __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (*(_BYTE *)(a1 + 56) && *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) < a2 >> 32) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  if (*(_BYTE *)(a1 + 57)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return v2;
}

@end