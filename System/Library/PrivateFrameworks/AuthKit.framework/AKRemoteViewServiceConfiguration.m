@interface AKRemoteViewServiceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationForHostWithBundleID:(id)a3 sceneID:(id)a4;
+ (id)defaultConfiguration;
- (AKRemoteViewServiceConfiguration)initWithCoder:(id)a3;
- (NSString)hostBundleID;
- (NSString)hostSceneID;
- (void)encodeWithCoder:(id)a3;
- (void)setHostBundleID:(id)a3;
- (void)setHostSceneID:(id)a3;
@end

@implementation AKRemoteViewServiceConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  hostBundleID = self->_hostBundleID;
  id v7 = v4;
  if (hostBundleID)
  {
    [v4 encodeObject:hostBundleID forKey:@"_hostBundleID"];
    id v4 = v7;
  }

  hostSceneID = self->_hostSceneID;
  if (hostSceneID)
  {
    [v7 encodeObject:hostSceneID forKey:@"_hostSceneID"];
    id v4 = v7;
  }
}

- (AKRemoteViewServiceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AKRemoteViewServiceConfiguration;
  v6 = -[AKRemoteViewServiceConfiguration init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"_hostBundleID");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    hostBundleID = v6->_hostBundleID;
    v6->_hostBundleID = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"_hostSceneID");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    hostSceneID = v6->_hostSceneID;
    v6->_hostSceneID = (NSString *)v12;
  }

  return v6;
}

+ (id)configurationForHostWithBundleID:(id)a3 sceneID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKRemoteViewServiceConfiguration defaultConfiguration]( &OBJC_CLASS___AKRemoteViewServiceConfiguration,  "defaultConfiguration"));
  [v7 setHostBundleID:v6];

  [v7 setHostSceneID:v5];
  return v7;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(&OBJC_CLASS___AKRemoteViewServiceConfiguration);
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void)setHostBundleID:(id)a3
{
}

- (NSString)hostSceneID
{
  return self->_hostSceneID;
}

- (void)setHostSceneID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end