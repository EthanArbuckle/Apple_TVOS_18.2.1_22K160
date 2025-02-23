@interface SKMediaKitFSInfo
- (NSDictionary)fsInfo;
- (NSString)fsType;
- (NSString)volumeName;
- (SKMediaKitFSInfo)initWithFSInfo:(id)a3;
@end

@implementation SKMediaKitFSInfo

- (SKMediaKitFSInfo)initWithFSInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SKMediaKitFSInfo;
  v6 = -[SKMediaKitFSInfo init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fsInfo, a3);
  }

  return v7;
}

- (NSString)volumeName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKMediaKitFSInfo fsInfo](self, "fsInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Volume name"]);

  return (NSString *)v3;
}

- (NSString)fsType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKMediaKitFSInfo fsInfo](self, "fsInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Filesystem"]);

  return (NSString *)v3;
}

- (NSDictionary)fsInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end