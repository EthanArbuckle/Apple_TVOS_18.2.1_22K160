@interface DBGRect
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withRect:(CGRect)a3;
- (CGRect)rect;
- (DBGRect)initWithCGRect:(CGRect)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setRect:(CGRect)a3;
@end

@implementation DBGRect

+ (id)withRect:(CGRect)a3
{
  return  objc_msgSend( objc_alloc((Class)a1),  "initWithCGRect:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (DBGRect)initWithCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DBGRect;
  result = -[DBGRect init](&v8, "init");
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }

  return result;
}

- (id)objectValue
{
  return 0LL;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGRect objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGRect description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (CGRect)rect
{
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v24 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v24);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v24;
  v10 = v9;
  if (v9)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    if (a5) {
      *a5 = v9;
    }
  }

  else
  {
    v15 = v8;
    v16 = v15;
    CGSize size = CGRectZero.size;
    CGPoint valuePtr = CGRectZero.origin;
    CGSize v26 = size;
    if (v15)
    {
      ValueAtIndedouble x = (const __CFNumber *)CFArrayGetValueAtIndex(v15, 0LL);
      v19 = (const __CFNumber *)CFArrayGetValueAtIndex(v16, 1LL);
      v20 = (const __CFNumber *)CFArrayGetValueAtIndex(v16, 2LL);
      v21 = (const __CFNumber *)CFArrayGetValueAtIndex(v16, 3LL);
      CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
      CFNumberGetValue(v19, kCFNumberCGFloatType, &valuePtr.y);
      CFNumberGetValue(v20, kCFNumberCGFloatType, &v26);
      CFNumberGetValue(v21, kCFNumberCGFloatType, &v26.height);
    }

    double y = valuePtr.y;
    double x = valuePtr.x;
    double height = v26.height;
    double width = v26.width;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withRect:", x, y, width, height));

  return v22;
}

- (id)JSONCompatibleRepresentation
{
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v6 = (const void **)malloc(0x20uLL);
  for (uint64_t i = 0LL; i != 4; ++i)
    v6[i] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v11[i]);
  CFArrayRef v8 = CFArrayCreate(0LL, v6, 4LL, &kCFTypeArrayCallBacks);
  for (uint64_t j = 0LL; j != 4; ++j)
    CFRelease(v6[j]);
  free(v6);
  return v8;
}

@end