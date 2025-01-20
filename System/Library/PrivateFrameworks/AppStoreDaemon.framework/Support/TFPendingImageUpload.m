@interface TFPendingImageUpload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TFPendingImageUpload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TFPendingImageUpload

- (BOOL)isEqual:(id)a3
{
  v5 = (TFPendingImageUpload *)a3;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if (v6 == objc_opt_class(v5, v7)
      && (!v5 ? (data = 0LL) : (data = v5->_data),
          -[NSData isEqual:](self->_data, "isEqual:", data)
       && (!v5 ? (logKey = 0LL) : (logKey = v5->_logKey), -[LogKey isEqual:](self->_logKey, "isEqual:", logKey))))
    {
      if (v5) {
        URL = v5->_URL;
      }
      else {
        URL = 0LL;
      }
      unsigned __int8 v11 = -[NSURL isEqual:](self->_URL, "isEqual:", URL);
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = -[TFPendingImageUpload init]( +[TFPendingImageUpload allocWithZone:](&OBJC_CLASS___TFPendingImageUpload, "allocWithZone:", a3),  "init");
  objc_storeStrong((id *)&v4->_data, self->_data);
  objc_storeStrong((id *)&v4->_logKey, self->_logKey);
  objc_storeStrong((id *)&v4->_URL, self->_URL);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"A"];
  [v5 encodeObject:self->_logKey forKey:@"B"];
  [v5 encodeObject:self->_URL forKey:@"C"];
}

- (TFPendingImageUpload)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TFPendingImageUpload;
  uint64_t v6 = -[TFPendingImageUpload init](&v19, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"A");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    data = v6->_data;
    v6->_data = (NSData *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(_TtC9appstored6LogKey, v10),  @"B");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    logKey = v6->_logKey;
    v6->_logKey = (_TtC9appstored6LogKey *)v12;

    id v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v14), @"C");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    URL = v6->_URL;
    v6->_URL = (NSURL *)v16;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end