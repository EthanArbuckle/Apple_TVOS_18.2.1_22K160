@interface CEMImageAssetInstallMetadata
+ (BOOL)supportsSecureCoding;
- (CEMImageAssetInstallMetadata)initWithCoder:(id)a3;
- (NSURL)imageURL;
- (id)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation CEMImageAssetInstallMetadata

- (id)dataRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMImageAssetInstallMetadata imageURL](self, "imageURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v2));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CEMImageAssetInstallMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CEMImageAssetInstallMetadata init](self, "init");
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSURL), 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"imageURL"]);
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CEMImageAssetInstallMetadata imageURL](self, "imageURL"));
  [v4 encodeObject:v5 forKey:@"imageURL"];
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end