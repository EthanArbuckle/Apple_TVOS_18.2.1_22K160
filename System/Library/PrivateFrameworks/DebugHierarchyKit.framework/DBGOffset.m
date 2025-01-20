@interface DBGOffset
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withOffset:(CGPoint)a3;
- (CGPoint)offset;
- (DBGOffset)initWithOffset:(CGPoint)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setOffset:(CGPoint)a3;
@end

@implementation DBGOffset

+ (id)withOffset:(CGPoint)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithOffset:", a3.x, a3.y);
}

- (DBGOffset)initWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGOffset;
  result = -[DBGOffset init](&v6, "init");
  if (result)
  {
    result->_offset.CGFloat x = x;
    result->_offset.CGFloat y = y;
  }

  return result;
}

- (id)objectValue
{
  return 0LL;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGOffset objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGOffset description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (CGPoint)offset
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16LL, 1, 0);
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
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    if (a5) {
      *a5 = v9;
    }
  }

  else
  {
    v13 = v8;
    v14 = v13;
    CGPoint valuePtr = CGPointZero;
    if (v13)
    {
      ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(v13, 0LL);
      v16 = (const __CFNumber *)CFArrayGetValueAtIndex(v14, 1LL);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v16, kCFNumberCGFloatType, &valuePtr.y);
    }

    double y = valuePtr.y;
    double x = valuePtr.x;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withOffset:", x, y));

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