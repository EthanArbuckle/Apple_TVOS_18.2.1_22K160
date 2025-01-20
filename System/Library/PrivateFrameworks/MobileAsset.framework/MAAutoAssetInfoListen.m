@interface MAAutoAssetInfoListen
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoListen)initWithCoder:(id)a3;
- (MAAutoAssetInfoListen)initWithNotifications:(id)a3;
- (MAAutoAssetNotifications)activeNotifications;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoListen

- (MAAutoAssetInfoListen)initWithNotifications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoListen;
  v6 = -[MAAutoAssetInfoListen init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_activeNotifications, a3);
  }

  return v7;
}

- (MAAutoAssetInfoListen)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoListen;
  id v5 = -[MAAutoAssetInfoListen init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeNotifications"];
    activeNotifications = v5->_activeNotifications;
    v5->_activeNotifications = (MAAutoAssetNotifications *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[MAAutoAssetInfoListen activeNotifications](self, "activeNotifications");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"activeNotifications"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 summary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MAAutoAssetNotifications)activeNotifications
{
  return self->_activeNotifications;
}

- (void).cxx_destruct
{
}

@end