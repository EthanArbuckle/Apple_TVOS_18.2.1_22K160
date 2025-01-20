@interface UASharedPasteboardInfoWrapper
+ (BOOL)supportsSecureCoding;
- (NSData)extraData;
- (NSError)error;
- (UASharedPasteboardInfo)pbinfo;
- (UASharedPasteboardInfoWrapper)initWithCoder:(id)a3;
- (id)description;
- (int64_t)extraDataType;
- (int64_t)protocolVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setExtraData:(id)a3;
- (void)setExtraDataType:(int64_t)a3;
- (void)setPbinfo:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
@end

@implementation UASharedPasteboardInfoWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardInfoWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[UASharedPasteboardInfoWrapper init](self, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(UASharedPasteboardInfo) forKey:@"UASharedPasteboardInfoWrapperPBInfoKey"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UASharedPasteboardInfoWrapper setPbinfo:](v5, "setPbinfo:", v7);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"UASharedPasteboardInfoWrapperExtraDataKey"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UASharedPasteboardInfoWrapper setExtraData:](v5, "setExtraData:", v9);

    -[UASharedPasteboardInfoWrapper setExtraDataType:]( v5,  "setExtraDataType:",  [v4 decodeIntegerForKey:@"UASharedPasteboardInfoWrapperExtraTypeKey"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"UASharedPasteboardInfoWrapperErrorKey"];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[UASharedPasteboardInfoWrapper setError:](v5, "setError:", v11);

    -[UASharedPasteboardInfoWrapper setProtocolVersion:]( v5,  "setProtocolVersion:",  [v4 decodeIntegerForKey:@"UASharedPasteboardInfoWrapperProtocolVersionKey"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper pbinfo](self, "pbinfo"));
  [v7 encodeObject:v4 forKey:@"UASharedPasteboardInfoWrapperPBInfoKey"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper extraData](self, "extraData"));
  [v7 encodeObject:v5 forKey:@"UASharedPasteboardInfoWrapperExtraDataKey"];

  objc_msgSend( v7,  "encodeInteger:forKey:",  -[UASharedPasteboardInfoWrapper extraDataType](self, "extraDataType"),  @"UASharedPasteboardInfoWrapperExtraTypeKey");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper error](self, "error"));
  [v7 encodeObject:v6 forKey:@"UASharedPasteboardInfoWrapperErrorKey"];

  objc_msgSend( v7,  "encodeInteger:forKey:",  -[UASharedPasteboardInfoWrapper protocolVersion](self, "protocolVersion"),  @"UASharedPasteboardInfoWrapperProtocolVersionKey");
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UASharedPasteboardInfoWrapper;
  id v4 = -[UASharedPasteboardInfoWrapper description](&v10, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int64_t v6 = -[UASharedPasteboardInfoWrapper extraDataType](self, "extraDataType");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper error](self, "error"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardInfoWrapper pbinfo](self, "pbinfo"));
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@: Extra Data Type: %ld, Error: %@, PBInfo: %@",  v5,  v6,  v7,  v8);

  return v3;
}

- (UASharedPasteboardInfo)pbinfo
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPbinfo:(id)a3
{
}

- (NSData)extraData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setExtraData:(id)a3
{
}

- (int64_t)extraDataType
{
  return self->_extraDataType;
}

- (void)setExtraDataType:(int64_t)a3
{
  self->_extraDataType = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setError:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (void).cxx_destruct
{
}

@end