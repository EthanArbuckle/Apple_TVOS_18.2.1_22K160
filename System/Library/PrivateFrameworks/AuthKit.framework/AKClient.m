@interface AKClient
+ (BOOL)isAppWithBundleIDForeground:(id)a3;
- (AKClient)initWithAuditToken:(id *)a3;
- (AKClient)initWithConnection:(id)a3;
- (BOOL)_BOOLValueForEntitlement:(id)a3;
- (BOOL)_hasApprovedSigningIdentifier;
- (BOOL)_isAppleBinary;
- (BOOL)_isOnInternalBuild;
- (BOOL)authorizationClientProvidesUI;
- (BOOL)authorizationRequiresRapport;
- (BOOL)hasBirthdayAccess;
- (BOOL)hasCompanionKeyEnvelopeAccess;
- (BOOL)hasInternalAccess;
- (BOOL)hasInternalEntitledAccess;
- (BOOL)hasInternalPrivateAccess;
- (BOOL)hasInternalPrivateEntitlementAccess;
- (BOOL)hasOwnerAccess;
- (BOOL)hasPrivateAccess;
- (BOOL)hasPrivateSignedAccess;
- (BOOL)hasPublicAccess;
- (BOOL)hasServerOnlyDeviceListAccess;
- (BOOL)hasSiwaAccountListAccess;
- (BOOL)hasSiwaDefaultEntitlementAccess;
- (BOOL)hasSiwaEntitlement;
- (BOOL)hasSiwaUnderageEntitlementAccess;
- (BOOL)hasWriteAccess;
- (BOOL)isExemptedFromMandatoryUISecurityUpgrade;
- (BOOL)isPermittedForInteractiveAuthOnLimitedContext;
- (BOOL)isPermittedToAccessBirthday;
- (BOOL)isPermittedToProxy;
- (BOOL)isPermittedToProxyAuthorizationBundleIdentifier;
- (BOOL)isPermittedToProxyInitialAuth;
- (NSData)auditTokenData;
- (NSString)appID;
- (NSString)authorizationAccessLevel;
- (NSString)bundleID;
- (NSString)fullName;
- (NSString)localizedAppName;
- (NSString)name;
- (NSString)teamID;
- (NSXPCConnection)xpcConnection;
- (id)_appIDForIOS;
- (id)_appIDForMacOS;
- (id)_approvedCodeSigningIdentifiers;
- (id)_arrayValueForEntitlement:(id)a3;
- (id)_authorizationAccessLevels;
- (id)_bundle;
- (id)_bundleNonPluginKit;
- (id)_codeSigningIdentifier;
- (id)_exemptedBundleIDsFromMandatoryUISecurityUpgrade;
- (id)_permitedProcessNamesToProxyInitialAuthWhiteList;
- (id)_permittedProcessNamesForInteractiveAuthOnLimitedContext;
- (id)_permittedProcessNamesToProxyAllowlist;
- (id)_stringValueForEntitlement:(id)a3;
- (id)description;
- (id)proxyWithErrorHandler:(id)a3;
@end

@implementation AKClient

+ (BOOL)isAppWithBundleIDForeground:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
  int v5 = [v4 applicationStateForApplication:v3];
  uint64_t v6 = _AKLogSystem([v4 invalidate]);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10012B3F0((uint64_t)v3, v5, v7);
  }

  BOOL v9 = v5 == 8 || v5 == 32;
  return v9;
}

- (AKClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKClient;
  uint64_t v6 = -[AKClient init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (AKClient)initWithAuditToken:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKClient;
  id v4 = -[AKClient init](&v11, "init");
  if (v4)
  {
    id v5 = sub_10000A484();
    __int128 v6 = *(_OWORD *)&a3->var0[4];
    v10[0] = *(_OWORD *)a3->var0;
    v10[1] = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 tokenFromAuditToken:v10]);
    auditToken = v4->_auditToken;
    v4->_auditToken = (BSAuditToken *)v7;
  }

  return v4;
}

- (NSXPCConnection)xpcConnection
{
  return self->_connection;
}

- (BOOL)hasInternalPrivateEntitlementAccess
{
  if (-[AKClient hasInternalAccess](self, "hasInternalAccess")) {
    return 1;
  }
  else {
    return -[AKClient hasPrivateAccess](self, "hasPrivateAccess");
  }
}

- (BOOL)hasInternalPrivateAccess
{
  if (-[AKClient hasInternalPrivateEntitlementAccess](self, "hasInternalPrivateEntitlementAccess")) {
    return 1;
  }
  else {
    return -[AKClient hasPrivateSignedAccess](self, "hasPrivateSignedAccess");
  }
}

- (BOOL)hasInternalEntitledAccess
{
  if (-[AKClient hasInternalPrivateEntitlementAccess](self, "hasInternalPrivateEntitlementAccess")) {
    return 1;
  }
  else {
    return -[AKClient hasOwnerAccess](self, "hasOwnerAccess");
  }
}

- (BOOL)hasSiwaEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _authorizationAccessLevels](self, "_authorizationAccessLevels"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasSiwaDefaultEntitlementAccess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _authorizationAccessLevels](self, "_authorizationAccessLevels"));
  unsigned __int8 v3 = [v2 containsObject:@"Default"];

  return v3;
}

- (BOOL)hasSiwaUnderageEntitlementAccess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _authorizationAccessLevels](self, "_authorizationAccessLevels"));
  unsigned __int8 v3 = [v2 containsObject:@"underage-users"];

  return v3;
}

- (BOOL)hasSiwaAccountListAccess
{
  return -[AKClient _BOOLValueForEntitlement:](self, "_BOOLValueForEntitlement:", @"com.apple.authkit.siwa-list");
}

- (BOOL)hasServerOnlyDeviceListAccess
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.devicelist.server-only");
}

- (BOOL)hasCompanionKeyEnvelopeAccess
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.property.companion-key-envelope");
}

- (BOOL)hasWriteAccess
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.writer.internal");
}

- (BOOL)hasInternalAccess
{
  if (-[AKClient hasOwnerAccess](self, "hasOwnerAccess")) {
    return 1;
  }
  else {
    return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.client.internal");
  }
}

- (BOOL)hasOwnerAccess
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.client.owner");
}

- (BOOL)hasPublicAccess
{
  return -[AKClient _BOOLValueForEntitlement:](self, "_BOOLValueForEntitlement:", @"com.apple.authkit.client");
}

- (BOOL)hasPrivateAccess
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.client.private");
}

- (BOOL)hasPrivateSignedAccess
{
  BOOL v3 = -[AKClient _isAppleBinary](self, "_isAppleBinary");
  if (v3) {
    LOBYTE(v3) = -[AKClient _hasApprovedSigningIdentifier](self, "_hasApprovedSigningIdentifier");
  }
  return v3;
}

- (BOOL)hasBirthdayAccess
{
  BOOL v3 = -[AKClient hasPrivateAccess](self, "hasPrivateAccess");
  if (v3) {
    LOBYTE(v3) = -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.birthday");
  }
  return v3;
}

- (BOOL)_hasApprovedSigningIdentifier
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _codeSigningIdentifier](self, "_codeSigningIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _approvedCodeSigningIdentifiers](self, "_approvedCodeSigningIdentifiers"));
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (id)_codeSigningIdentifier
{
  connection = self->_connection;
  if (connection) {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  BOOL v3 = SecTaskCreateWithAuditToken(0LL, &v7);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  unsigned __int8 v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0LL);
  CFRelease(v4);
  return v5;
}

- (id)_approvedCodeSigningIdentifiers
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.dt.Xcode",  @"com.apple.dt.xcodebuild",  @"com.apple.dt.xcscontrol",  0LL);
}

- (BOOL)_isAppleBinary
{
  connection = self->_connection;
  if (connection) {
    -[NSXPCConnection auditToken](connection, "auditToken");
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  id v4 = SecTaskCreateWithAuditToken(0LL, &v8);
  if (v4)
  {
    unsigned __int8 v5 = v4;
    uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v4);
    CFRelease(v5);
    if ((CodeSignStatus & 0xC000001) == 0x4000001) {
      LOBYTE(v4) = 1;
    }
    else {
      LOBYTE(v4) = -[AKClient _isOnInternalBuild](self, "_isOnInternalBuild");
    }
  }

  return (char)v4;
}

- (BOOL)_isOnInternalBuild
{
  return os_variant_has_internal_content("com.apple.akd", a2);
}

- (id)_permittedProcessNamesToProxyAllowlist
{
  if (qword_10020F208 != -1) {
    dispatch_once(&qword_10020F208, &stru_1001C6770);
  }
  return (id)qword_10020F200;
}

- (BOOL)isPermittedToProxy
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _permittedProcessNamesToProxyAllowlist](self, "_permittedProcessNamesToProxyAllowlist"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self, "name"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_permitedProcessNamesToProxyInitialAuthWhiteList
{
  if (qword_10020F218 != -1) {
    dispatch_once(&qword_10020F218, &stru_1001C6790);
  }
  return (id)qword_10020F210;
}

- (BOOL)isPermittedToProxyInitialAuth
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _permitedProcessNamesToProxyInitialAuthWhiteList]( self,  "_permitedProcessNamesToProxyInitialAuthWhiteList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self, "name"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_permittedProcessNamesForInteractiveAuthOnLimitedContext
{
  if (qword_10020F228 != -1) {
    dispatch_once(&qword_10020F228, &stru_1001C67B0);
  }
  return (id)qword_10020F220;
}

- (BOOL)isPermittedForInteractiveAuthOnLimitedContext
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _permittedProcessNamesForInteractiveAuthOnLimitedContext]( self,  "_permittedProcessNamesForInteractiveAuthOnLimitedContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self, "name"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_exemptedBundleIDsFromMandatoryUISecurityUpgrade
{
  if (qword_10020F238 != -1) {
    dispatch_once(&qword_10020F238, &stru_1001C67D0);
  }
  return (id)qword_10020F230;
}

- (BOOL)isExemptedFromMandatoryUISecurityUpgrade
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _exemptedBundleIDsFromMandatoryUISecurityUpgrade]( self,  "_exemptedBundleIDsFromMandatoryUISecurityUpgrade"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self, "bundleID"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)isPermittedToProxyAuthorizationBundleIdentifier
{
  return -[AKClient _BOOLValueForEntitlement:]( self,  "_BOOLValueForEntitlement:",  @"com.apple.authkit.authorization-bundle-identifier-proxy");
}

- (BOOL)isPermittedToAccessBirthday
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"com.apple.WatchFacesWallpaperSupport.SnoopyPoster",  @"com.apple.appleaccountd",  @"com.apple.AKTester",  0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self, "bundleID"));
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (NSData)auditTokenData
{
  auditToken = self->_auditToken;
  if (auditToken)
  {
    -[BSAuditToken realToken](auditToken, "realToken");
    return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v11, 32LL);
  }

  else if (self->_connection)
  {
    id v5 = [sub_10000A484() tokenFromNSXPCConnection:self->_connection];
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    audit_token_t v7 = v6;
    if (v6) {
      [v6 realToken];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    v10 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v11, 32LL);

    return v10;
  }

  else
  {
    uint64_t v8 = _AKLogSystem(0LL);
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10012B470((uint64_t)self, v9);
    }

    return (NSData *)0LL;
  }

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    int v4 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
    if (proc_name(v4, buffer, 0x20u) < 1)
    {
      *(void *)v12 = 0xE00000001LL;
      int v13 = 1;
      int v14 = v4;
      size_t v9 = 648LL;
      char v11 = 0;
      if (sysctl(v12, 4u, v10, &v9, 0LL, 0LL))
      {
        __int128 v6 = @"?";
        goto LABEL_7;
      }

      if (!v11)
      {
        __int128 v6 = @"exited?";
        goto LABEL_7;
      }

      id v5 = &v11;
    }

    else
    {
      id v5 = buffer;
    }

    __int128 v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
LABEL_7:
    audit_token_t v7 = self->_name;
    self->_name = &v6->isa;

    name = self->_name;
  }

  return name;
}

- (NSString)fullName
{
  fullName = self->_fullName;
  if (!fullName)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _bundle](self, "_bundle"));
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForInfoDictionaryKey:kCFBundleNameKey]);
    __int128 v6 = self->_fullName;
    self->_fullName = v5;

    fullName = self->_fullName;
    if (!fullName)
    {
      audit_token_t v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[AKClient name](self, "name"));
      uint64_t v8 = self->_fullName;
      self->_fullName = v7;

      fullName = self->_fullName;
    }
  }

  return fullName;
}

- (NSString)localizedAppName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self, "bundleID"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v2));

  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedNameForContext:0]);
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 localizedName]);
  }
  audit_token_t v7 = v6;

  return (NSString *)v7;
}

- (id)_bundleNonPluginKit
{
  v2 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  proc_pidpath(-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), buffer, 0x1000u),  4LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v2));

  if (v3)
  {
    int v4 = (void *)_CFBundleCopyBundleURLForExecutableURL(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_bundle
{
  uint64_t v3 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  if (!(_DWORD)v3)
  {
    id v6 = 0LL;
LABEL_6:
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _bundleNonPluginKit](self, "_bundleNonPluginKit"));
    goto LABEL_7;
  }

  uint64_t v4 = v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PKManager defaultManager](&OBJC_CLASS___PKManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containingAppForPlugInWithPid:v4]);

  if (!v6) {
    goto LABEL_6;
  }
  audit_token_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleURL]);
  size_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v8));

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (id)description
{
  description = self->_description;
  if (!description)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self, "name"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")));
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@)",  v4,  v5));
    audit_token_t v7 = self->_description;
    self->_description = v6;

    description = self->_description;
  }

  return description;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v6 = _AKLogSystem(0LL);
    audit_token_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "XPC connection is nil, couldn't create remote object.",  v10,  2u);
    }

    connection = self->_connection;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v4));

  return v8;
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKManager defaultManager](&OBJC_CLASS___PKManager, "defaultManager"));
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "containingAppForPlugInWithPid:",  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")));
    uint64_t v6 = self->_bundleID;
    self->_bundleID = v5;

    bundleID = self->_bundleID;
    if (!bundleID)
    {
      audit_token_t v7 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  proc_pidpath(-[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), buffer, 0x1000u),  4LL);
      uint64_t v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));

      if (v8)
      {
        size_t v9 = (void *)_CFBundleCopyBundleURLForExecutableURL(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v9));
        char v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
        v12 = self->_bundleID;
        self->_bundleID = v11;

        if (!self->_bundleID)
        {
          uint64_t v14 = _AKLogSystem(v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_10012B4E4((uint64_t)self, v15);
          }

          CFDictionaryRef v16 = CFBundleCopyInfoDictionaryForURL(v8);
          v17 = (NSString *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v16,  "objectForKeyedSubscript:",  kCFBundleIdentifierKey));
          v18 = self->_bundleID;
          self->_bundleID = v17;
        }
      }

      bundleID = self->_bundleID;
    }
  }

  return bundleID;
}

- (NSString)appID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient _appIDForIOS](self, "_appIDForIOS"));
  if (![v3 length])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AKClient _appIDForMacOS](self, "_appIDForMacOS"));

    uint64_t v3 = (void *)v4;
  }

  id v5 = v3;

  return (NSString *)v5;
}

- (id)_appIDForMacOS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _stringValueForEntitlement:]( self,  "_stringValueForEntitlement:",  @"com.apple.application-identifier"));
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (id)_appIDForIOS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _stringValueForEntitlement:]( self,  "_stringValueForEntitlement:",  @"application-identifier"));
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (NSString)teamID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _stringValueForEntitlement:]( self,  "_stringValueForEntitlement:",  @"com.apple.developer.team-identifier"));
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return (NSString *)v3;
}

- (id)_authorizationAccessLevels
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[AKClient _arrayValueForEntitlement:]( self,  "_arrayValueForEntitlement:",  @"com.apple.developer.applesignin"));
  if ([v2 count]) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (BOOL)authorizationRequiresRapport
{
  return 1;
}

- (BOOL)authorizationClientProvidesUI
{
  return 0;
}

- (id)_arrayValueForEntitlement:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", a3));
  objc_opt_class(&OBJC_CLASS___NSArray, v4, v5, v6);
  id v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)_BOOLValueForEntitlement:(id)a3
{
  id v4 = a3;
  auditToken = self->_auditToken;
  if (!auditToken) {
    auditToken = self->_connection;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([auditToken valueForEntitlement:v4]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v7, v8, v9);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0) {
    unsigned __int8 v11 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_stringValueForEntitlement:(id)a3
{
  id v4 = a3;
  auditToken = self->_auditToken;
  if (!auditToken) {
    auditToken = self->_connection;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([auditToken valueForEntitlement:v4]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v7, v8, v9);
  id v11 = v6;
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (NSString)authorizationAccessLevel
{
  return self->_authorizationAccessLevel;
}

- (void).cxx_destruct
{
}

@end