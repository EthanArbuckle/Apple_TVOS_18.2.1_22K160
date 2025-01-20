@interface MCCertificateRevocationPayloadHandler
- (BOOL)_installOutError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)setAdditions:(id)a3 outError:(id *)a4;
- (id)additionsDictionary;
- (id)applicationID;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCCertificateRevocationPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCCertificateRevocationPayloadHandler _installOutError:](self, "_installOutError:", a6, a4, a5);
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCCertificateRevocationPayloadHandler _remove](self, "_remove");
  }
}

- (void)unsetAside
{
}

- (BOOL)_installOutError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCCertificateRevocationPayloadHandler additionsDictionary](self, "additionsDictionary"));
  LOBYTE(a3) = -[MCCertificateRevocationPayloadHandler setAdditions:outError:](self, "setAdditions:outError:", v5, a3);

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

- (BOOL)setAdditions:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  LOBYTE(self) = SecTrustStoreSetCARevocationAdditions( -[MCCertificateRevocationPayloadHandler applicationID](self, "applicationID"),  v5,  0LL);

  return (char)self;
}

- (id)additionsDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v7 = kSecCARevocationAdditionsKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 hashDictionaries]);
  unsigned __int8 v4 = v3;
  if (!v3) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  if (!v3) {

  }
  return v5;
}

@end