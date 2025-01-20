@interface EscrowCertificateRequest
- (Class)responseClass;
- (NSDictionary)requestDictionary;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
@end

@implementation EscrowCertificateRequest

- (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___EscrowCertificateResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"/escrowproxy/api/get_club_cert"]);

  return v3;
}

- (id)command
{
  return @"GETCLUB";
}

- (id)bodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___EscrowCertificateRequest;
  id v3 = -[EscrowGenericRequest bodyDictionary](&v7, "bodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowCertificateRequest requestDictionary](self, "requestDictionary"));
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

- (NSDictionary)requestDictionary
{
  id v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 3LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordLabel](self, "recordLabel"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"label");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseRootCertVersions](self, "baseRootCertVersions"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseRootCertVersions](self, "baseRootCertVersions"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"baseRootCertVersions");
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest trustedRootCertVersions](self, "trustedRootCertVersions"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest trustedRootCertVersions](self, "trustedRootCertVersions"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"trustedRootCertVersions");
  }

  return (NSDictionary *)v3;
}

@end