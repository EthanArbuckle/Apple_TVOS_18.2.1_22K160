@interface NSConcreteValue
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5;
- (BOOL)isEqualToValue:(id)a3;
- (const)objCType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSConcreteValue

+ (void)initialize
{
  v2[1] = *MEMORY[0x1895F89C0];
  if ((id)objc_opt_class() == a1)
  {
    NSGetSizeAndAlignment("{CGRect={CGPoint=dd}{CGSize=dd}}", v2, 0LL);
    if (v2[0] != 32) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSRect types!");
    }
    NSGetSizeAndAlignment("{CGPoint=dd}", v2, 0LL);
    if (v2[0] != 16) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSPoint types!");
    }
    NSGetSizeAndAlignment("{CGSize=dd}", v2, 0LL);
    if (v2[0] != 16) {
      NSLog((NSString *)@"*** Inconsistency in NSValue type strings for NSSize types!");
    }
  }

- (void)getValue:(void *)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  memmove(a3, IndexedIvars, *(void *)self->typeInfo);
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (*(void *)self->typeInfo == a4)
  {
    IndexedIvars = object_getIndexedIvars(self);
    memmove(a3, IndexedIvars, a4);
  }

  else
  {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes",  a4,  -[NSConcreteValue objCType](self, "objCType", a3),  *(void *)self->typeInfo);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
    -[NSConcreteValue objCType](v8, v9);
  }

- (const)objCType
{
  return (const char *)*((void *)self->typeInfo + 1);
}

- (BOOL)_matchType:(const char *)a3 size:(unint64_t)a4 strict:(BOOL)a5
{
  typeInfo = (char **)self->typeInfo;
  BOOL result = *typeInfo == (char *)a4 && !a5;
  return result;
}

- (BOOL)isEqualToValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 1;
  }
  size_t v6 = *(void *)self->typeInfo;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class() || (objc_opt_isKindOfClass() & 1) != 0)
  {
    IndexedIvars = object_getIndexedIvars(self);
    int v9 = memcmp(IndexedIvars, (const void *)[a3 _value], v6);
  }

  else
  {
    if (v6 < 0x401) {
      v10 = &v12;
    }
    else {
      v10 = (char *)malloc(v6);
    }
    [a3 getValue:v10];
    v11 = object_getIndexedIvars(self);
    int v9 = memcmp(v11, v10, v6);
    if (v6 >= 0x401) {
      free(v10);
    }
  }

  return v9 == 0;
}

- (unint64_t)hash
{
  IndexedIvars = (uint64_t *)object_getIndexedIvars(self);
  unint64_t v4 = *(void *)self->typeInfo;
  if (v4 <= 7)
  {
    unint64_t v5 = 0LL;
    if (v4)
    {
      unint64_t v8 = v4 + 1;
      do
      {
        unsigned int v9 = *(unsigned __int8 *)IndexedIvars;
        IndexedIvars = (uint64_t *)((char *)IndexedIvars + 1);
        unint64_t v5 = v9 | (v5 << 8);
        --v8;
      }

      while (v8 > 1);
    }
  }

  else
  {
    unint64_t v5 = 0LL;
    if (v4 >= 0x20) {
      unint64_t v4 = 32LL;
    }
    unint64_t v6 = v4 + 8;
    do
    {
      uint64_t v7 = *IndexedIvars++;
      v5 ^= v7;
      v6 -= 8LL;
    }

    while (v6 > 0xF);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3)) {
    return self;
  }
  IndexedIvars = (float32x2_t *)object_getIndexedIvars(self);
  return _NSNewValue(IndexedIvars, *((char **)self->typeInfo + 1), a3);
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  switch(self->_specialFlags)
  {
    case 0uLL:
      v3 = -[NSConcreteValue objCType](self, "objCType");
      if (!strcmp(v3, "{CGSize=dd}")) {
        goto LABEL_19;
      }
      if (!strcmp(v3, "{_NSRange=QQ}")) {
        goto LABEL_21;
      }
      if (!strcmp(v3, "{CGAffineTransform=ffffff}") || !strcmp(v3, "{CGAffineTransform=dddddd}")) {
        goto LABEL_20;
      }
      if (!strcmp(v3, "{UIEdgeInsets=ffff}") || !strcmp(v3, "{UIEdgeInsets=dddd}")) {
        goto LABEL_22;
      }
      if (!strcmp(v3, "{NSEdgeInsets=ffff}") || !strcmp(v3, "{NSEdgeInsets=dddd}")) {
        goto LABEL_23;
      }
      if (!strcmp(v3, "{NSDirectionalEdgeInsets=ffff}") || !strcmp(v3, "{NSDirectionalEdgeInsets=dddd}")) {
        goto LABEL_24;
      }
      if (!strcmp(v3, "{UIOffset=ff}") || !strcmp(v3, "{UIOffset=dd}")) {
        goto LABEL_25;
      }
      goto LABEL_16;
    case 1uLL:
LABEL_18:
      -[NSValue pointValue](self, "pointValue");
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSPoint: %@",  NSStringFromPoint(v14));
      break;
    case 2uLL:
LABEL_19:
      -[NSValue sizeValue](self, "sizeValue");
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSSize: %@",  NSStringFromSize(v15));
      break;
    case 3uLL:
LABEL_17:
      -[NSValue rectValue](self, "rectValue");
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSRect: %@",  NSStringFromRect(v16));
      break;
    case 4uLL:
LABEL_21:
      v13.location = -[NSValue rangeValue](self, "rangeValue");
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSRange: %@",  NSStringFromRange(v13));
      break;
    case 0xAuLL:
LABEL_20:
      -[NSConcreteValue getValue:](self, "getValue:", &v6);
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CGAffineTransform: %@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{{%.*g, %.*g, %.*g, %.*g}, {%.*g, %.*g}}",  17LL,  v6,  17LL,  v7,  17LL,  v8,  17LL,  v9,  17LL,  v10,  17LL,  v11));
      break;
    case 0xBuLL:
LABEL_22:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UIEdgeInsets: %@",  _stringFromEdgeInsets(self));
      break;
    case 0xCuLL:
LABEL_23:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSEdgeInsets: %@",  _stringFromEdgeInsets(self));
      break;
    case 0xDuLL:
LABEL_25:
      -[NSConcreteValue getValue:](self, "getValue:", &v6);
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UIOffset: %@",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{%.*g, %.*g}",  17LL,  v6,  17LL,  v7));
      break;
    case 0xEuLL:
LABEL_24:
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSDirectionalEdgeInsets: %@",  _stringFromEdgeInsets(self));
      break;
    default:
LABEL_16:
      v5.receiver = self;
      v5.super_class = (Class)&OBJC_CLASS___NSConcreteValue;
      id result = -[NSValue description](&v5, sel_description);
      break;
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_specialFlags && [a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_specialFlags forKey:@"NS.special"];
    switch(self->_specialFlags)
    {
      case 1uLL:
        -[NSValue pointValue](self, "pointValue");
        objc_msgSend(a3, "encodePoint:forKey:", @"NS.pointval");
        return;
      case 2uLL:
        -[NSValue sizeValue](self, "sizeValue");
        objc_msgSend(a3, "encodeSize:forKey:", @"NS.sizeval");
        return;
      case 3uLL:
        -[NSValue rectValue](self, "rectValue");
        objc_msgSend(a3, "encodeRect:forKey:", @"NS.rectval");
        return;
      case 4uLL:
        uint64_t v7 = -[NSValue rangeValue](self, "rangeValue");
        objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8),  @"NS.rangeval.length");
        objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7),  @"NS.rangeval.location");
        return;
      case 0xAuLL:
        -[NSConcreteValue getValue:](self, "getValue:", &v14);
        [a3 encodeDouble:@"NS.atval.a" forKey:v14];
        [a3 encodeDouble:@"NS.atval.b" forKey:v15];
        [a3 encodeDouble:@"NS.atval.c" forKey:v16];
        [a3 encodeDouble:@"NS.atval.d" forKey:v17];
        [a3 encodeDouble:@"NS.atval.tx" forKey:v18];
        double v5 = v19;
        uint64_t v6 = @"NS.atval.ty";
        goto LABEL_13;
      case 0xBuLL:
      case 0xCuLL:
        -[NSConcreteValue getValue:](self, "getValue:", &v14);
        [a3 encodeDouble:@"NS.edgeval.top" forKey:v14];
        [a3 encodeDouble:@"NS.edgeval.left" forKey:v15];
        [a3 encodeDouble:@"NS.edgeval.bottom" forKey:v16];
        double v5 = v17;
        uint64_t v6 = @"NS.edgeval.right";
        goto LABEL_13;
      case 0xDuLL:
        -[NSConcreteValue getValue:](self, "getValue:", &v14);
        [a3 encodeDouble:@"NS.offset.h" forKey:v14];
        double v5 = v15;
        uint64_t v6 = @"NS.offset.v";
        goto LABEL_13;
      case 0xEuLL:
        -[NSConcreteValue getValue:](self, "getValue:", &v14);
        [a3 encodeDouble:@"NS.dirEdgeVal.top" forKey:v14];
        [a3 encodeDouble:@"NS.dirEdgeVal.leading" forKey:v15];
        [a3 encodeDouble:@"NS.dirEdgeVal.bottom" forKey:v16];
        double v5 = v17;
        uint64_t v6 = @"NS.dirEdgeVal.trailing";
LABEL_13:
        [a3 encodeDouble:v6 forKey:v5];
        break;
      default:
        uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot encode special type '%ld'",  self->_specialFlags);
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v9 userInfo:0]);
        -[NSWeakObjectValue initWithObject:](v10, v11, v12);
        break;
    }
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NSConcreteValue;
    -[NSValue encodeWithCoder:](&v13, sel_encodeWithCoder_, a3);
  }

@end