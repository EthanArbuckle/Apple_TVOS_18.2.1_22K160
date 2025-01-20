@interface TFImageUpload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TFImageUpload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TFImageUpload

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFImageUpload;
  id v3 = -[TFImageUpload description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFImageUpload dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  uploadUrl = self->_uploadUrl;
  if (uploadUrl) {
    [v3 setObject:uploadUrl forKey:@"uploadUrl"];
  }
  xiCloudVersionIdHeader = self->_xiCloudVersionIdHeader;
  if (xiCloudVersionIdHeader) {
    [v4 setObject:xiCloudVersionIdHeader forKey:@"xiCloudVersionIdHeader"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100191DD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uploadUrl = self->_uploadUrl;
  id v7 = v4;
  if (uploadUrl)
  {
    PBDataWriterWriteStringField(v4, uploadUrl, 1LL);
    id v4 = v7;
  }

  xiCloudVersionIdHeader = self->_xiCloudVersionIdHeader;
  if (xiCloudVersionIdHeader)
  {
    PBDataWriterWriteStringField(v7, xiCloudVersionIdHeader, 2LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_uploadUrl, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_xiCloudVersionIdHeader, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((uploadUrl = self->_uploadUrl, !((unint64_t)uploadUrl | v4[1]))
     || -[NSString isEqual:](uploadUrl, "isEqual:")))
  {
    xiCloudVersionIdHeader = self->_xiCloudVersionIdHeader;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_uploadUrl, "hash");
  return -[NSString hash](self->_xiCloudVersionIdHeader, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uploadUrl = self->_uploadUrl;
  id v5 = a3;
  [v5 encodeObject:uploadUrl forKey:@"A"];
  [v5 encodeObject:self->_xiCloudVersionIdHeader forKey:@"B"];
}

- (TFImageUpload)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TFImageUpload;
  id v6 = -[TFImageUpload init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"A");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    uploadUrl = v6->_uploadUrl;
    v6->_uploadUrl = (NSString *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), @"B");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    xiCloudVersionIdHeader = v6->_xiCloudVersionIdHeader;
    v6->_xiCloudVersionIdHeader = (NSString *)v12;
  }

  return v6;
}

@end