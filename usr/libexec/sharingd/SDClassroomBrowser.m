@interface SDClassroomBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (NSString)clientBundleID;
- (SDClassroomBrowser)init;
- (void)setClientBundleID:(id)a3;
@end

@implementation SDClassroomBrowser

+ (id)sharedBrowser
{
  if (qword_100656CF0 != -1) {
    dispatch_once(&qword_100656CF0, &stru_1005CB588);
  }
  return (id)qword_100656CF8;
}

- (SDClassroomBrowser)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDClassroomBrowser;
  return -[SDClassroomBrowser init](&v3, "init");
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end