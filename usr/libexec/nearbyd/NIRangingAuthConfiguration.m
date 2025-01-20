@interface NIRangingAuthConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponder;
- (NIDiscoveryToken)peerToken;
- (NIRangingAuthConfiguration)initWithCoder:(id)a3;
- (NSData)macAddress;
- (NSData)secureKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIRangingAuthConfiguration

- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NIRangingAuthConfiguration;
  v11 = -[NIConfiguration initInternal](&v19, "initInternal");
  v12 = v11;
  if (v11)
  {
    *((_BYTE *)v11 + 32) = a3;
    objc_storeStrong(v11 + 6, a4);
    objc_storeStrong(v12 + 7, a5);
    v20[0] = &off_1007D2790;
    id v13 = v12[6];
    v20[1] = &off_1007D27A8;
    v21[0] = v13;
    v21[1] = v12[7];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    Data = (void *)OPACKEncoderCreateData(v14, 8LL, 0LL);
    v16 = -[NIDiscoveryToken initWithBytes:](objc_alloc(&OBJC_CLASS___NIDiscoveryToken), "initWithBytes:", Data);
    id v17 = v12[5];
    v12[5] = v16;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIRangingAuthConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v12, "copyWithZone:", a3);
  v4[32] = self->_isResponder;
  id v5 = -[NIDiscoveryToken copy](self->_peerToken, "copy");
  v6 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v5;

  id v7 = -[NSData copy](self->_macAddress, "copy");
  v8 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v7;

  id v9 = -[NSData copy](self->_secureKey, "copy");
  id v10 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIRangingAuthConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeBool:self->_isResponder forKey:@"isResponder"];
  [v4 encodeObject:self->_macAddress forKey:@"macAddress"];
  [v4 encodeObject:self->_secureKey forKey:@"secureKey"];
  [v4 encodeObject:self->_peerToken forKey:@"peerToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NIRangingAuthConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NIRangingAuthConfiguration;
  objc_super v5 = -[NIConfiguration initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    v5->_isResponder = [v4 decodeBoolForKey:@"isResponder"];
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v6), @"macAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v9), @"secureKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v13 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v12),  @"peerToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NIDiscoveryToken, v14), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
    {
      id v17 = 0LL;
    }

    else
    {
      objc_storeStrong((id *)&v5->_macAddress, v8);
      objc_storeStrong((id *)&v5->_secureKey, v11);
      objc_storeStrong((id *)&v5->_peerToken, v15);
      id v17 = v5;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (NIRangingAuthConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      char v19 = 1;
    }

    else
    {
      int isResponder = self->_isResponder;
      unsigned int v10 = -[NIRangingAuthConfiguration isResponder](v7, "isResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration macAddress](v8, "macAddress"));
      unsigned int v12 = [v11 isEqualToData:self->_macAddress];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration secureKey](v8, "secureKey"));
      unsigned __int8 v14 = [v13 isEqualToData:self->_secureKey];

      unint64_t peerToken = (unint64_t)v8->_peerToken;
      BOOL v16 = (peerToken | (unint64_t)self->_peerToken) == 0;
      unsigned __int8 v17 = objc_msgSend((id)peerToken, "isEqual:");
      if (isResponder == v10) {
        unsigned int v18 = v12;
      }
      else {
        unsigned int v18 = 0;
      }
      if (v18 == 1) {
        char v19 = v14 & (v16 | v17);
      }
      else {
        char v19 = 0;
      }
    }
  }

  else
  {
    char v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  BOOL isResponder = self->_isResponder;
  unint64_t v4 = (unint64_t)-[NSData hash](self->_macAddress, "hash") ^ isResponder;
  unint64_t v5 = (unint64_t)-[NSData hash](self->_secureKey, "hash");
  return v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_peerToken, "hash");
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration descriptionInternal](self, "descriptionInternal"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@>", v5, v6));

  return v7;
}

- (id)descriptionInternal
{
  if (self->_isResponder) {
    v2 = @"Yes";
  }
  else {
    v2 = @"No";
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_peerToken, "descriptionInternal"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", isResponder: %@, peerToken: %@",  v2,  v3));

  return v4;
}

- (BOOL)isResponder
{
  return self->_isResponder;
}

- (NIDiscoveryToken)peerToken
{
  return self->_peerToken;
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (NSData)secureKey
{
  return self->_secureKey;
}

- (void).cxx_destruct
{
}

@end