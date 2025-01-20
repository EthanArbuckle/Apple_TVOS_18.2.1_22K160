@interface NSValue
+ (BOOL)supportsSecureCoding;
+ (NSValue)allocWithZone:(_NSZone *)a3;
+ (NSValue)valueWithBytes:(const void *)value objCType:(const char *)type;
+ (NSValue)valueWithEdgeInsets:(NSEdgeInsets)insets;
+ (NSValue)valueWithNonretainedObject:(id)anObject;
+ (NSValue)valueWithPoint:(NSPoint)point;
+ (NSValue)valueWithPointer:(const void *)pointer;
+ (NSValue)valueWithRange:(NSRange)range;
+ (NSValue)valueWithRect:(NSRect)rect;
+ (NSValue)valueWithSize:(NSSize)size;
+ (NSValue)valueWithWeakObject:(id)a3;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToValue:(NSValue *)value;
- (BOOL)isNSValue__;
- (Class)classForCoder;
- (NSEdgeInsets)edgeInsetsValue;
- (NSPoint)pointValue;
- (NSRange)rangeValue;
- (NSRect)rectValue;
- (NSSize)sizeValue;
- (NSValue)init;
- (NSValue)initWithBytes:(const void *)value objCType:(const char *)type;
- (NSValue)initWithCoder:(NSCoder *)aDecoder;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nonretainedObjectValue;
- (id)weakObjectValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)value;
- (void)getValue:(void *)value size:(NSUInteger)size;
- (void)pointerValue;
@end

@implementation NSValue

- (BOOL)isNSValue__
{
  return 1;
}

+ (NSValue)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSValue == a1) {
    return (NSValue *)&__placeholderValue;
  }
  else {
    return (NSValue *)NSAllocateObject((Class)a1, 0LL, a3);
  }
}

- (NSValue)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((__objc2_class *)objc_opt_class() == &OBJC_CLASS___NSValue) {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)&OBJC_CLASS___NSValue);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSValue;
  return -[NSValue init](&v5, sel_init);
}

+ (NSValue)valueWithBytes:(const void *)value objCType:(const char *)type
{
  return (NSValue *)_NSNewValue((float32x2_t *)value, (char *)type, 0LL);
}

- (void)getValue:(void *)value
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)objc_opt_class();
  uint64_t v7 = [v6 instanceMethodForSelector:sel_getValue_size_];
  if (v7 == +[NSValue instanceMethodForSelector:]( &OBJC_CLASS___NSValue,  "instanceMethodForSelector:",  sel_getValue_size_)
    || (uint64_t v8 = [v6 instanceMethodForSelector:sel_getValue_],
        v8 != +[NSValue instanceMethodForSelector:](&OBJC_CLASS___NSValue, "instanceMethodForSelector:", sel_getValue_)))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)&OBJC_CLASS___NSValue);
  }

  v9[0] = 0LL;
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), v9, 0LL);
  -[NSValue getValue:size:](self, "getValue:size:", value, v9[0]);
}

- (void)getValue:(void *)value size:(NSUInteger)size
{
  sizep[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)objc_opt_class();
  uint64_t v9 = [v8 instanceMethodForSelector:sel_getValue_];
  if (v9 == +[NSValue instanceMethodForSelector:](&OBJC_CLASS___NSValue, "instanceMethodForSelector:", sel_getValue_)
    || (uint64_t v10 = [v8 instanceMethodForSelector:sel_getValue_size_],
        v10 != +[NSValue instanceMethodForSelector:]( &OBJC_CLASS___NSValue,  "instanceMethodForSelector:",  sel_getValue_size_)))
  {
    NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)&OBJC_CLASS___NSValue);
  }

  sizep[0] = 0LL;
  v11 = -[NSValue objCType](self, "objCType");
  NSGetSizeAndAlignment(v11, sizep, 0LL);
  if (sizep[0] != size)
  {
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes",  size,  v11,  sizep[0]);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v12 userInfo:0]);
    -[NSValue objCType](v13, v14);
  }

  -[NSValue getValue:](self, "getValue:", value);
}

- (const)objCType
{
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4
{
  return -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", a3, a4, 0LL);
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = -[NSValue objCType](self, "objCType");
  NSGetSizeAndAlignment(v8, v10, 0LL);
  BOOL result = v10[0] == a4 && !a5;
  if (a5 && v10[0] == a4) {
    return matchTypeEncoding(v8, (char *)a3, a4);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  sizep[128] = *MEMORY[0x1895F89C0];
  objc_super v5 = -[NSValue objCType](self, "objCType");
  NSGetSizeAndAlignment(v5, sizep, 0LL);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    uint64_t v7 = (float32x2_t *)sizep;
  }
  else {
    uint64_t v7 = (float32x2_t *)malloc(sizep[0]);
  }
  -[NSValue getValue:](self, "getValue:", v7);
  uint64_t v8 = _NSNewValue(v7, v5, a3);
  if (v6 > 0x400) {
    free(v7);
  }
  return v8;
}

- (BOOL)isEqualToValue:(NSValue *)value
{
  sizep[128] = *MEMORY[0x1895F89C0];
  if (self == value) {
    return 1;
  }
  objc_super v5 = -[NSValue objCType](self, "objCType");
  if (strcmp(v5, -[NSValue objCType](value, "objCType"))) {
    return 0;
  }
  NSGetSizeAndAlignment(v5, sizep, 0LL);
  size_t v7 = sizep[0];
  if (sizep[0] < 0x401)
  {
    uint64_t v9 = &v11;
    uint64_t v8 = sizep;
  }

  else
  {
    uint64_t v8 = malloc(sizep[0]);
    uint64_t v9 = (char *)malloc(v7);
  }

  -[NSValue getValue:](self, "getValue:", v8);
  -[NSValue getValue:](value, "getValue:", v9);
  BOOL v6 = memcmp(v8, v9, v7) == 0;
  if (v7 > 0x400)
  {
    free(v8);
    free(v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else if (a3)
  {
    if (objc_opt_class() == __NSConcreteValueClass || (int v5 = _NSIsNSValue()) != 0) {
      LOBYTE(v5) = -[NSValue isEqualToValue:](self, "isEqualToValue:", a3);
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  sizep[128] = *MEMORY[0x1895F89C0];
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), sizep, 0LL);
  NSUInteger v3 = sizep[0];
  if (sizep[0] >= 0x401)
  {
    v4 = (uint64_t *)malloc(sizep[0]);
    -[NSValue getValue:](self, "getValue:", v4);
LABEL_5:
    unint64_t v5 = 0LL;
    uint64_t v6 = 32LL;
    if (v3 < 0x20) {
      uint64_t v6 = v3;
    }
    unint64_t v7 = v6 + 8;
    uint64_t v8 = v4;
    do
    {
      uint64_t v9 = *v8++;
      v5 ^= v9;
      v7 -= 8LL;
    }

    while (v7 > 0xF);
    goto LABEL_9;
  }

  -[NSValue getValue:](self, "getValue:", sizep);
  if (v3 > 7)
  {
    v4 = (uint64_t *)sizep;
    goto LABEL_5;
  }

  if (!v3) {
    return 0LL;
  }
  uint64_t v11 = 0LL;
  unint64_t v5 = 0LL;
  do
  {
    v4 = (uint64_t *)sizep;
    unint64_t v5 = *((unsigned __int8 *)sizep + v11++) | (v5 << 8);
  }

  while (v3 != v11);
LABEL_9:
  if (v3 >= 0x401) {
    free(v4);
  }
  return v5;
}

- (id)description
{
  v6[1] = *MEMORY[0x1895F89C0];
  NSGetSizeAndAlignment(-[NSValue objCType](self, "objCType"), v6, 0LL);
  NSUInteger v3 = (void *)[objc_allocWithZone(MEMORY[0x189603FB8]) initWithLength:v6[0]];
  -[NSValue getValue:](self, "getValue:", [v3 mutableBytes]);
  v4 = (void *)[v3 description];

  return v4;
}

+ (NSValue)valueWithNonretainedObject:(id)anObject
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = anObject;
  return +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", v4, "^v");
}

+ (NSValue)valueWithWeakObject:(id)a3
{
  return (NSValue *) -[NSWeakObjectValue initWithObject:]( objc_alloc(&OBJC_CLASS___NSWeakObjectValue),  "initWithObject:",  a3);
}

- (id)nonretainedObjectValue
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!-[NSValue _matchType:size:](self, "_matchType:size:", "^v", 8LL)) {
    return 0LL;
  }
  -[NSValue getValue:](self, "getValue:", v4);
  return (id)v4[0];
}

- (id)weakObjectValue
{
  return 0LL;
}

+ (NSValue)valueWithPointer:(const void *)pointer
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = pointer;
  return +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", v4, "^v");
}

- (void)pointerValue
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!-[NSValue _matchType:size:](self, "_matchType:size:", "^v", 8LL)) {
    return 0LL;
  }
  -[NSValue getValue:](self, "getValue:", v4);
  return (void *)v4[0];
}

+ (NSValue)valueWithPoint:(NSPoint)point
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSPoint v4 = point;
  return +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", &v4, "{CGPoint=dd}");
}

+ (NSValue)valueWithSize:(NSSize)size
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSSize v4 = size;
  return +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", &v4, "{CGSize=dd}");
}

+ (NSValue)valueWithRect:(NSRect)rect
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSRect v4 = rect;
  return +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v4,  "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

+ (NSValue)valueWithRange:(NSRange)range
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSRange v4 = range;
  return +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", &v4, "{_NSRange=QQ}");
}

+ (NSValue)valueWithEdgeInsets:(NSEdgeInsets)insets
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  NSEdgeInsets v4 = insets;
  return +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v4,  "{NSEdgeInsets=dddd}");
}

- (NSPoint)pointValue
{
  NSUInteger v6[2] = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{CGPoint=dd}", 16LL, 1LL);
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    -[NSValue getValue:](self, "getValue:", v6, 0.0, 0.0);
    double v5 = *(double *)v6;
    double v4 = *(double *)&v6[1];
  }

  result.y = v4;
  result.x = v5;
  return result;
}

- (NSSize)sizeValue
{
  NSUInteger v6[2] = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{CGSize=dd}", 16LL, 1LL);
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    -[NSValue getValue:](self, "getValue:", v6, 0.0, 0.0);
    double v5 = *(double *)v6;
    double v4 = *(double *)&v6[1];
  }

  result.height = v4;
  result.width = v5;
  return result;
}

- (NSRect)rectValue
{
  v8[4] = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSValue _matchType:size:strict:]( self,  "_matchType:size:strict:",  "{CGRect={CGPoint=dd}{CGSize=dd}}",  32LL,  1LL);
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    -[NSValue getValue:](self, "getValue:", v8, 0.0, 0.0, 0.0, 0.0);
    double v7 = *(double *)v8;
    double v6 = *(double *)&v8[1];
    double v5 = *(double *)&v8[2];
    double v4 = *(double *)&v8[3];
  }

  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (NSRange)rangeValue
{
  v5[2] = *MEMORY[0x1895F89C0];
  if (-[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{_NSRange=QQ}", 16LL, 1LL))
  {
    -[NSValue getValue:](self, "getValue:", v5);
    NSUInteger v3 = v5[0];
    NSUInteger v4 = v5[1];
  }

  else
  {
    NSUInteger v4 = 0LL;
    NSUInteger v3 = 0LL;
  }

  result.length = v4;
  result.location = v3;
  return result;
}

- (NSEdgeInsets)edgeInsetsValue
{
  v8[4] = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSValue _matchType:size:strict:](self, "_matchType:size:strict:", "{NSEdgeInsets=dddd}", 32LL, 1LL);
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    -[NSValue getValue:](self, "getValue:", v8, 0.0, 0.0, 0.0, 0.0);
    double v7 = *(double *)v8;
    double v6 = *(double *)&v8[1];
    double v5 = *(double *)&v8[2];
    double v4 = *(double *)&v8[3];
  }

  result.right = v4;
  result.bottom = v5;
  result.left = v6;
  result.top = v7;
  return result;
}

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSValue;
}

- (void)encodeWithCoder:(id)a3
{
  sizep[128] = *MEMORY[0x1895F89C0];
  double v5 = -[NSValue objCType](self, "objCType");
  uint64_t v9 = v5;
  NSGetSizeAndAlignment(v5, sizep, 0LL);
  NSUInteger v6 = sizep[0];
  if (sizep[0] < 0x401) {
    double v7 = sizep;
  }
  else {
    double v7 = malloc(sizep[0]);
  }
  if (*v5 == 94 && v5[1] == 118)
  {
    uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot encode (void *) value: %@",  self);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
    __break(1u);
  }

  else
  {
    -[NSValue getValue:](self, "getValue:", v7);
    [a3 encodeValueOfObjCType:"*" at:&v9];
    [a3 encodeValueOfObjCType:v9 at:v7];
    if (v6 > 0x400) {
      free(v7);
    }
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSValue)initWithCoder:(NSCoder *)aDecoder
{
  double v5 = (NSZone *)-[NSValue zone](self, "zone");

  return newDecodedValue(aDecoder, v5);
}

- (NSValue)initWithBytes:(const void *)value objCType:(const char *)type
{
}

@end