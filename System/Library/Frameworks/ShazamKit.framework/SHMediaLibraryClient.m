@interface SHMediaLibraryClient
- (BOOL)isBundleIdentifierValid;
- (BOOL)isEntitledForSPI;
- (BOOL)isTeamIdentifierValid;
- (SHClientCredentials)credentials;
- (SHMediaLibraryClient)initWithCredentials:(id)a3;
- (int64_t)type;
@end

@implementation SHMediaLibraryClient

- (SHMediaLibraryClient)initWithCredentials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMediaLibraryClient;
  v6 = -[SHMediaLibraryClient init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentials, a3);
  }

  return v7;
}

- (int64_t)type
{
  BOOL v3 = -[SHMediaLibraryClient isBundleIdentifierValid](self, "isBundleIdentifierValid");
  if (!v3)
  {
    uint64_t v8 = sh_log_object(v3);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      objc_super v9 = "Invalid Media Library client, bundle id is not valid";
      v10 = (uint8_t *)&v19;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }

- (BOOL)isEntitledForSPI
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryClient credentials](self, "credentials"));
  id v4 = [v3 clientType];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryClient credentials](self, "credentials"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attribution]);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 containingAppBundleIdentifier]);
  unsigned __int8 v8 = +[SHAttribution requiresMediaLibraryAttributionForBundleIdentifier:]( &OBJC_CLASS___SHAttribution,  "requiresMediaLibraryAttributionForBundleIdentifier:",  v7);

  if (v4 == (id)1) {
    return 1;
  }
  else {
    return v8 ^ 1;
  }
}

- (BOOL)isBundleIdentifierValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryClient credentials](self, "credentials"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attribution]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containingAppBundleIdentifier]);
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)isTeamIdentifierValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryClient credentials](self, "credentials"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attribution]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 teamIdentifier]);
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (SHClientCredentials)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
}

@end