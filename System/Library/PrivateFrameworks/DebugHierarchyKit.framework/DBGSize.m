@interface DBGSize
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withSize:(CGSize)a3;
- (CGSize)size;
- (DBGSize)initWithCGSize:(CGSize)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setSize:(CGSize)a3;
@end

@implementation DBGSize

+ (id)withSize:(CGSize)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCGSize:", a3.width, a3.height);
}

- (DBGSize)initWithCGSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGSize;
  result = -[DBGSize init](&v6, "init");
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }

  return result;
}

- (id)objectValue
{
  return 0LL;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSize objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSize description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (CGSize)size
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v19 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v19;
  v10 = v9;
  if (v9)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    if (a5) {
      *a5 = v9;
    }
  }

  else
  {
    v13 = v8;
    v14 = v13;
    CGSize valuePtr = CGSizeZero;
    if (v13)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v13, 0LL);
      v16 = (const __CFNumber *)CFArrayGetValueAtIndex(v14, 1LL);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v16, kCFNumberCGFloatType, &valuePtr.height);
    }

    double height = valuePtr.height;
    double width = valuePtr.width;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withSize:", width, height));

  return v17;
}

- (id)JSONCompatibleRepresentation
{
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  v4 = (const void **)malloc(0x10uLL);
  NSString *v4 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0LL, v4, 2LL, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

@end