@interface CLWPZone
- (BOOL)isEqual:(id)a3;
- (CLWPZone)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 identifier:(id)a6;
- (NSData)advertisementData;
- (NSNumber)major;
- (NSNumber)minor;
- (NSString)identifier;
- (NSUUID)proximityUUID;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CLWPZone

- (CLWPZone)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 identifier:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLWPZone;
  v10 = -[CLWPZone init](&v17, "init");
  if (v10)
  {
    v10->_identifier = (NSString *)[a6 copy];
    v10->_proximityUUID = (NSUUID *)[a3 copy];
    v10->_major = (NSNumber *)[a4 copy];
    v10->_minor = (NSNumber *)[a5 copy];
    if (v10->_proximityUUID)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      -[NSUUID getUUIDBytes:](v10->_proximityUUID, "getUUIDBytes:", v18);
      -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", v18, 16LL);
      major = v10->_major;
      if (major)
      {
        __int16 v16 = __rev16(-[NSNumber unsignedShortValue](major, "unsignedShortValue"));
        -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", &v16, 2LL);
        minor = v10->_minor;
        if (minor)
        {
          __int16 v15 = __rev16(-[NSNumber unsignedShortValue](minor, "unsignedShortValue"));
          -[NSMutableData appendBytes:length:](v11, "appendBytes:length:", &v15, 2LL);
        }
      }
    }

    else
    {
      v11 = 0LL;
    }

    v10->_advertisementData = &v11->super;
  }

  return v10;
}

- (void)dealloc
{
  self->_advertisementData = 0LL;
  self->_minor = 0LL;

  self->_major = 0LL;
  self->_proximityUUID = 0LL;

  self->_identifier = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWPZone;
  -[CLWPZone dealloc](&v3, "dealloc");
}

- (id)description
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0) {
    return -[NSString isEqual:]( -[CLWPZone identifier](self, "identifier"),  "isEqual:",  [a3 identifier]);
  }
  else {
    return 0;
  }
}

- (NSUUID)proximityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSNumber)major
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSNumber)minor
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSData)advertisementData
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

@end