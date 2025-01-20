@interface MCCertificateTransparencyPayloadHandler
- (BOOL)_installOutError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)setExceptions:(id)a3 outError:(id *)a4;
- (id)applicationID;
- (id)exceptionsDictionary;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCCertificateTransparencyPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCCertificateTransparencyPayloadHandler _installOutError:](self, "_installOutError:", a6, a4, a5);
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCCertificateTransparencyPayloadHandler _remove](self, "_remove");
  }
}

- (void)unsetAside
{
}

- (BOOL)_installOutError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCCertificateTransparencyPayloadHandler exceptionsDictionary](self, "exceptionsDictionary"));
  LOBYTE(a3) = -[MCCertificateTransparencyPayloadHandler setExceptions:outError:]( self,  "setExceptions:outError:",  v5,  a3);

  return (char)a3;
}

- (void)_remove
{
}

- (id)applicationID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.configurationprofiles.%@.%@",  v10,  v11));

  return v12;
}

- (BOOL)setExceptions:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  LOBYTE(self) = SecTrustStoreSetCTExceptions( -[MCCertificateTransparencyPayloadHandler applicationID](self, "applicationID"),  v5,  0LL);

  return (char)self;
}

- (id)exceptionsDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v9[0] = kSecCTExceptionsDomainsKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 domainRules]);
  unsigned __int8 v4 = v3;
  if (!v3) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v10[0] = v4;
  v9[1] = kSecCTExceptionsCAsKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 hashDictionaries]);
  v6 = v5;
  if (!v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  if (!v5) {

  }
  if (!v3) {
  return v7;
  }
}

@end