@interface ASCJSClientObject
- (ACAccount)activeiTunesAccount;
- (ACAccountStore)accountStore;
- (ASCJSClientObject)initWithAccountStore:(id)a3;
- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3;
- (BOOL)deviceHasCapabilities:(id)a3;
- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5;
- (BOOL)isActivityAvailable;
- (BOOL)isAutomaticDownloadingEnabled;
- (BOOL)isElectrocardiogramInstallationAllowed;
- (BOOL)isSidepackingEnabled;
- (BOOL)isTinkerWatch;
- (BOOL)newPaymentMethodEnabled;
- (BOOL)supportsHEIF;
- (CGSize)screenSize;
- (NSString)activePairedWatchSystemVersion;
- (NSString)deviceType;
- (NSString)guid;
- (NSString)storefrontIdentifier;
- (NSString)thinnedApplicationVariantIdentifier;
- (double)screenCornerRadius;
- (id)buildType;
- (id)isPairedSystemVersionAtLeast:(id)a3;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setActiveiTunesAccount:(id)a3;
@end

@implementation ASCJSClientObject

- (id)buildType
{
  if (qword_1001407C0 != -1) {
    dispatch_once(&qword_1001407C0, &stru_10011EFC8);
  }
  return (id)qword_1001407C8;
}

- (ASCJSClientObject)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ASCJSClientObject;
  v6 = -[ASCJSClientObject init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));
    activeiTunesAccount = v7->_activeiTunesAccount;
    v7->_activeiTunesAccount = (ACAccount *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v7 selector:"accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ASCJSClientObject;
  -[ASCJSClientObject dealloc](&v4, "dealloc");
}

- (void)accountStoreDidChange:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCJSClientObject accountStore](self, "accountStore", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));
  -[ASCJSClientObject setActiveiTunesAccount:](self, "setActiveiTunesAccount:", v4);
}

- (NSString)thinnedApplicationVariantIdentifier
{
  return (NSString *)+[AMSDevice thinnedAppVariantId](&OBJC_CLASS___AMSDevice, "thinnedAppVariantId");
}

- (NSString)activePairedWatchSystemVersion
{
  return +[ASCMobileGestalt activePairedSystemVersion](&OBJC_CLASS___ASCMobileGestalt, "activePairedSystemVersion");
}

- (CGSize)screenSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)screenCornerRadius
{
  return result;
}

- (NSString)guid
{
  return (NSString *)+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID");
}

- (NSString)storefrontIdentifier
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCJSClientObject activeiTunesAccount](self, "activeiTunesAccount"));
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCJSClientObject accountStore](self, "accountStore"));
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_localiTunesAccount"));
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_storefront"));
  return (NSString *)v7;
}

- (BOOL)newPaymentMethodEnabled
{
  return 1;
}

- (NSString)deviceType
{
  return (NSString *)@"tv";
}

- (BOOL)isActivityAvailable
{
  return 0;
}

- (BOOL)isElectrocardiogramInstallationAllowed
{
  return 0;
}

- (BOOL)isSidepackingEnabled
{
  return 0;
}

- (BOOL)isTinkerWatch
{
  return +[ASCMobileGestalt isStandaloneWatch](&OBJC_CLASS___ASCMobileGestalt, "isStandaloneWatch");
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (BOOL)deviceHasCapabilities:(id)a3
{
  return -[ASCJSClientObject deviceHasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:]( self,  "deviceHasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:",  a3,  0LL);
}

- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  if (a3) {
    return +[ASCMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:]( &OBJC_CLASS___ASCMobileGestalt,  "hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:");
  }
  else {
    return 1;
  }
}

- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  return 0;
}

- (id)isPairedSystemVersionAtLeast:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[JSContext currentContext](&OBJC_CLASS___JSContext, "currentContext", a3));
  if (!v3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"%s called with no active JSContext",  "-[ASCJSClientObject isPairedSystemVersionAtLeast:]");
  }
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithBool:inContext:](&OBJC_CLASS___JSValue, "valueWithBool:inContext:", 0LL, v3));

  return v4;
}

- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3
{
  return 1;
}

- (BOOL)isAutomaticDownloadingEnabled
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASCJSClientObject activeiTunesAccount](self, "activeiTunesAccount"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountPropertyForKey:@"automaticDownloadKinds"]);

  LOBYTE(v2) = [v3 containsObject:@"software"];
  return (char)v2;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)activeiTunesAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setActiveiTunesAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end