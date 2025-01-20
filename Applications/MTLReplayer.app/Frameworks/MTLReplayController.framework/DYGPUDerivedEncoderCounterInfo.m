@interface DYGPUDerivedEncoderCounterInfo
+ (BOOL)supportsSecureCoding;
- (DYGPUDerivedEncoderCounterInfo)init;
- (DYGPUDerivedEncoderCounterInfo)initWithCoder:(id)a3;
- (NSArray)derivedCounterNames;
- (NSData)derivedCounters;
- (NSData)encoderInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateEncoderDerivedData:(id)a3;
- (void)_enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDerivedCounterNames:(id)a3;
- (void)setDerivedCounters:(id)a3;
- (void)setEncoderInfos:(id)a3;
@end

@implementation DYGPUDerivedEncoderCounterInfo

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo derivedCounterNames](self, "derivedCounterNames"));
  id v6 = [v5 copy];
  [v4 setDerivedCounterNames:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo derivedCounters](self, "derivedCounters"));
  id v8 = [v7 copy];
  [v4 setDerivedCounters:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGPUDerivedEncoderCounterInfo encoderInfos](self, "encoderInfos"));
  id v10 = [v9 copy];
  [v4 setEncoderInfos:v10];

  return v4;
}

- (DYGPUDerivedEncoderCounterInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___DYGPUDerivedEncoderCounterInfo;
  id v6 = -[DYGPUDerivedEncoderCounterInfo init](&v31, "init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v8);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  objc_opt_class(&OBJC_CLASS___NSString, v10),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"derivedCounterNames"]);
    derivedCounterNames = v6->_derivedCounterNames;
    v6->_derivedCounterNames = (NSArray *)v13;

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v15);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v16,  objc_opt_class(&OBJC_CLASS___NSMutableData, v17),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"derivedCounters"]);
    derivedCounters = v6->_derivedCounters;
    v6->_derivedCounters = (NSData *)v20;

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSData, v22);
    v25 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  objc_opt_class(&OBJC_CLASS___NSMutableData, v24),  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v26 forKey:@"encoderInfos"]);
    encoderInfos = v6->_encoderInfos;
    v6->_encoderInfos = (NSData *)v27;

    v29 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_derivedCounterNames forKey:@"derivedCounterNames"];
  [v4 encodeObject:self->_derivedCounters forKey:@"derivedCounters"];
  [v4 encodeObject:self->_encoderInfos forKey:@"encoderInfos"];
}

- (DYGPUDerivedEncoderCounterInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYGPUDerivedEncoderCounterInfo;
  v2 = -[DYGPUDerivedEncoderCounterInfo init](&v6, "init");
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (void)_enumerateEncoderDerivedData:(id)a3
{
  v12 = (void (**)(id, void, char *, char *, NSUInteger))a3;
  id v4 = -[NSData bytes](self->_encoderInfos, "bytes");
  uint64_t v5 = -[NSData bytes](self->_derivedCounters, "bytes");
  unsigned int v6 = -[NSData length](self->_encoderInfos, "length");
  NSUInteger v7 = -[NSArray count](self->_derivedCounterNames, "count");
  if (v6 >= 0x30)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = 0LL;
    if (v6 / 0x30 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v6 / 0x30;
    }
    uint64_t v11 = 8 * v7;
    do
    {
      v12[2](v12, v9++, v4, v5, v8);
      v5 += v11;
      v4 += 48;
    }

    while (v10 != v9);
  }
}

- (void)_enumerateEncoderDerivedDataAtIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v9 = (void (**)(id, uint64_t, void, NSUInteger))a4;
  unsigned int v6 = -[NSData bytes](self->_encoderInfos, "bytes");
  NSUInteger v7 = -[NSData bytes](self->_derivedCounters, "bytes");
  NSUInteger v8 = -[NSArray count](self->_derivedCounterNames, "count");
  ((void (**)(id, uint64_t, char *, NSUInteger))v9)[2](v9, (uint64_t)v6 + 48 * a3, &v7[8 * v8 * a3], v8);
}

- (NSArray)derivedCounterNames
{
  return self->_derivedCounterNames;
}

- (void)setDerivedCounterNames:(id)a3
{
}

- (NSData)derivedCounters
{
  return self->_derivedCounters;
}

- (void)setDerivedCounters:(id)a3
{
}

- (NSData)encoderInfos
{
  return self->_encoderInfos;
}

- (void)setEncoderInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end