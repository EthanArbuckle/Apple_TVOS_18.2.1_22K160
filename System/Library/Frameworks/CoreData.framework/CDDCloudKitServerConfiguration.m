@interface CDDCloudKitServerConfiguration
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitServerConfiguration)init;
- (CDDCloudKitServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDDCloudKitServerConfiguration

- (CDDCloudKitServerConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CDDCloudKitServerConfiguration;
  v2 = -[CDDCloudKitServerConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_storeDirectoryPath = (NSString *)(id)objc_msgSend( -[NSArray lastObject]( NSSearchPathForDirectoriesInDomains( NSApplicationSupportDirectory,  1uLL,  1),  "lastObject"),  "stringByAppendingPathComponent:",  @"com.apple.coredatad");
    v2->_machServiceName =  +[NSCloudKitMirroringDelegate cloudKitMachServiceName]( &OBJC_CLASS___NSCloudKitMirroringDelegate,  "cloudKitMachServiceName");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CDDCloudKitServerConfiguration;
  -[CDDCloudKitServerConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CDDCloudKitServerConfiguration allocWithZone:]( &OBJC_CLASS___CDDCloudKitServerConfiguration,  "allocWithZone:",  a3);
  if (!v4) {
    return 0LL;
  }
  v7.receiver = v4;
  v7.super_class = (Class)&OBJC_CLASS___CDDCloudKitServerConfiguration;
  v5 = -[CDDCloudKitServerConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_storeDirectoryPath = self->_storeDirectoryPath;
    v5->_machServiceName = self->_machServiceName;
  }

  return v5;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDDCloudKitServerConfiguration;
  objc_super v3 = (void *)objc_msgSend( MEMORY[0x189607940],  "stringWithString:",  -[CDDCloudKitServerConfiguration description](&v5, sel_description));
  [v3 appendFormat:@"\nstoreDirectoryPath: %@", self->_storeDirectoryPath];
  [v3 appendFormat:@"\nmachServiceName: %@", self->_machServiceName];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitServerConfiguration)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CDDCloudKitServerConfiguration;
  objc_super v4 = -[CDDCloudKitServerConfiguration init](&v6, sel_init);
  if (v4)
  {
    v4->_storeDirectoryPath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeDirectoryPath"];
    v4->_machServiceName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"machServiceName"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

@end