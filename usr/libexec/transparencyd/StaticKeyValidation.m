@interface StaticKeyValidation
- (KTAccountPublicID)publicID;
- (NSString)idsURI;
- (id)description;
- (unint64_t)ktResult;
- (void)setIdsURI:(id)a3;
- (void)setKtResult:(unint64_t)a3;
- (void)setPublicID:(id)a3;
@end

@implementation StaticKeyValidation

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyValidation publicID](self, "publicID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyValidation idsURI](self, "idsURI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<StaticKeyValidation: %@ ids: %@ result: %d>",  v3,  v4,  -[StaticKeyValidation ktResult](self, "ktResult")));

  return v5;
}

- (KTAccountPublicID)publicID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPublicID:(id)a3
{
}

- (NSString)idsURI
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdsURI:(id)a3
{
}

- (unint64_t)ktResult
{
  return self->_ktResult;
}

- (void)setKtResult:(unint64_t)a3
{
  self->_ktResult = a3;
}

- (void).cxx_destruct
{
}

@end