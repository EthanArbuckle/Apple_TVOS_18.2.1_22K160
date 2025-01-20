@interface IDSKeyTransparencyEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyTransparencyEntry:(id)a3;
- (BOOL)ktCapable;
- (IDSKeyTransparencyEntry)initWithPushToken:(id)a3 loggableData:(id)a4 signedData:(id)a5;
- (NSData)loggableData;
- (NSData)pushToken;
- (NSData)signedData;
- (NSString)buildVersion;
- (NSString)productName;
- (id)description;
- (int64_t)transparencyVersion;
- (unint64_t)hash;
- (void)setBuildVersion:(id)a3;
- (void)setKtCapable:(BOOL)a3;
- (void)setProductName:(id)a3;
- (void)setTransparencyVersion:(int64_t)a3;
@end

@implementation IDSKeyTransparencyEntry

- (IDSKeyTransparencyEntry)initWithPushToken:(id)a3 loggableData:(id)a4 signedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSKeyTransparencyEntry;
  v12 = -[IDSKeyTransparencyEntry init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushToken, a3);
    objc_storeStrong((id *)&v13->_loggableData, a4);
    objc_storeStrong((id *)&v13->_signedData, a5);
  }

  return v13;
}

- (BOOL)isEqualToKeyTransparencyEntry:(id)a3
{
  v5 = (IDSKeyTransparencyEntry *)a3;
  v6 = v5;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }

  else
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](self, "pushToken"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](v6, "pushToken"));
      if (v7 != v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](self, "pushToken"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](v6, "pushToken"));
        if (![v9 isEqual:v10])
        {
          LOBYTE(v11) = 0;
          goto LABEL_22;
        }

        v27 = v10;
        v28 = v9;
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](self, "loggableData"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](v6, "loggableData"));
      if (v12 != v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](self, "loggableData"));
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](v6, "loggableData"));
        if (![v14 isEqual:v15])
        {
          LOBYTE(v11) = 0;
LABEL_20:

LABEL_21:
          id v10 = v27;
          id v9 = v28;
          if (v7 == v8)
          {
LABEL_23:

            goto LABEL_24;
          }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSKeyTransparencyEntry isEqualToKeyTransparencyEntry:](self, "isEqualToKeyTransparencyEntry:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](self, "pushToken"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](self, "loggableData"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry signedData](self, "signedData"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  uint64_t v14 = objc_opt_class(self, a2);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry pushToken](self, "pushToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v15 debugDescription]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry loggableData](self, "loggableData"));
  id v5 = [v4 length];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry signedData](self, "signedData"));
  id v7 = [v6 length];
  if (-[IDSKeyTransparencyEntry ktCapable](self, "ktCapable")) {
    unint64_t v8 = @"YES";
  }
  else {
    unint64_t v8 = @"NO";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry productName](self, "productName"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyEntry buildVersion](self, "buildVersion"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[IDSKeyTransparencyEntry transparencyVersion](self, "transparencyVersion")));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p pushToken: %@, loggableData.length: %lu, signedData.length:%lu, ktCapable: %@, productName: %@, buildVersion: %@, transparencyVersion: %@>",  v14,  self,  v3,  v5,  v7,  v8,  v9,  v10,  v11));

  return v12;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSData)loggableData
{
  return self->_loggableData;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (BOOL)ktCapable
{
  return self->_ktCapable;
}

- (void)setKtCapable:(BOOL)a3
{
  self->_ktCapable = a3;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  self->_productName = (NSString *)a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  self->_buildVersion = (NSString *)a3;
}

- (int64_t)transparencyVersion
{
  return self->_transparencyVersion;
}

- (void)setTransparencyVersion:(int64_t)a3
{
  self->_transparencyVersion = a3;
}

- (void).cxx_destruct
{
}

@end