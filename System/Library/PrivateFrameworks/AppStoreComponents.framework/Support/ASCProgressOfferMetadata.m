@interface ASCProgressOfferMetadata
+ (BOOL)supportsSecureCoding;
- (ASCProgressOfferMetadata)initWithCoder:(id)a3;
- (ASCProgressOfferMetadata)initWithPercent:(double)a3 cancellable:(BOOL)a4;
- (BOOL)cancellable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndeterminate;
- (BOOL)isProgress;
- (double)percent;
- (id)description;
- (id)initIndeterminate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIndeterminate:(BOOL)a3;
@end

@implementation ASCProgressOfferMetadata

- (ASCProgressOfferMetadata)initWithPercent:(double)a3 cancellable:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASCProgressOfferMetadata;
  result = -[ASCOfferMetadata _init](&v7, "_init");
  if (result)
  {
    result->_percent = a3;
    result->_cancellable = a4;
  }

  return result;
}

- (id)initIndeterminate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASCProgressOfferMetadata;
  id result = -[ASCOfferMetadata _init](&v3, "_init");
  if (result) {
    *((void *)result + 2) = 0x7FF0000000000000LL;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCProgressOfferMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ASCProgressOfferMetadata;
  v5 = -[ASCOfferMetadata initWithCoder:](&v8, "initWithCoder:", v4);
  if (v5)
  {
    [v4 decodeDoubleForKey:@"percent"];
    v5->_percent = v6;
    v5->_cancellable = [v4 decodeBoolForKey:@"cancellable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ASCProgressOfferMetadata;
  id v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  -[ASCProgressOfferMetadata percent](self, "percent", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", @"percent");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCProgressOfferMetadata cancellable](self, "cancellable"),  @"cancellable");
}

- (unint64_t)hash
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  -[ASCProgressOfferMetadata percent](self, "percent");
  -[ASCHasher combineInteger:](v3, "combineInteger:", (uint64_t)v4);
  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCProgressOfferMetadata);
  id v6 = v4;
  objc_super v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      objc_super v8 = v7;
    }
    else {
      objc_super v8 = 0LL;
    }
  }

  else
  {
    objc_super v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    -[ASCProgressOfferMetadata percent](self, "percent");
    double v11 = v10;
    [v9 percent];
    BOOL v13 = v11 == v12;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  objc_super v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  -[ASCProgressOfferMetadata percent](self, "percent");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"percent");
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCProgressOfferMetadata cancellable](self, "cancellable"),  @"cancellable");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return v4;
}

- (BOOL)isProgress
{
  return 1;
}

- (BOOL)isIndeterminate
{
  return fabs(v2) == INFINITY;
}

- (double)percent
{
  return self->_percent;
}

- (BOOL)cancellable
{
  return self->_cancellable;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

@end