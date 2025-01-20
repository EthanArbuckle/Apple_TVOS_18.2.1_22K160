@interface GKExtensionClientProxy
- (BOOL)isExtension;
- (BOOL)isUIService;
- (void)dealloc;
- (void)handleNewHostClient:(id)a3;
- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4;
@end

@implementation GKExtensionClientProxy

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKUIServiceClientProxy hostClient](self, "hostClient"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  [v3 setExtensionProxy:0 forBundleID:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GKExtensionClientProxy;
  -[GKUIServiceClientProxy dealloc](&v5, "dealloc");
}

- (BOOL)isExtension
{
  return 1;
}

- (BOOL)isUIService
{
  return 0;
}

- (void)setExtensionProxy:(id)a3 forBundleID:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid attempt to set extension proxy(%@) on extension(%@)",  a4,  a3,  self));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKExtensionClientProxy.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "-[GKExtensionClientProxy setExtensionProxy:forBundleID:]",  [v6 UTF8String],  30));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
}

- (void)handleNewHostClient:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GKClientProxy bundleIdentifier](self, "bundleIdentifier"));
  [v4 setExtensionProxy:self forBundleID:v5];
}

@end