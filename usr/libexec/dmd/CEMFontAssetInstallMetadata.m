@interface CEMFontAssetInstallMetadata
+ (BOOL)supportsSecureCoding;
- (CEMFontAssetInstallMetadata)initWithCoder:(id)a3;
- (NSURL)fontURL;
- (id)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setFontURL:(id)a3;
@end

@implementation CEMFontAssetInstallMetadata

- (id)dataRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontAssetInstallMetadata fontURL](self, "fontURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v2));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CEMFontAssetInstallMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[CEMFontAssetInstallMetadata init](self, "init");
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSURL), 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"fontURL"]);
    fontURL = v5->_fontURL;
    v5->_fontURL = (NSURL *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CEMFontAssetInstallMetadata fontURL](self, "fontURL"));
  [v4 encodeObject:v5 forKey:@"fontURL"];
}

- (NSURL)fontURL
{
  return self->_fontURL;
}

- (void)setFontURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end