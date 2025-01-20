@interface IDSPeerIDValue
+ (BOOL)supportsSecureCoding;
+ (id)peerIDValueWithEndpoints:(id)a3 keyTransparencyContext:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerIDValue:(id)a3;
- (IDSPeerIDValue)initWithCoder:(id)a3;
- (IDSPeerIDValue)initWithEndpoints:(id)a3 keyTransparencyContext:(id)a4;
- (IDSQueryKeyTransparencyContext)keyTransparencyContext;
- (NSArray)endpoints;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPeerIDValue

+ (id)peerIDValueWithEndpoints:(id)a3 keyTransparencyContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithEndpoints:v7 keyTransparencyContext:v6];

  return v8;
}

- (IDSPeerIDValue)initWithEndpoints:(id)a3 keyTransparencyContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSPeerIDValue;
  id v8 = -[IDSPeerIDValue init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    endpoints = v8->_endpoints;
    v8->_endpoints = v9;

    v11 = (IDSQueryKeyTransparencyContext *)[v7 copy];
    keyTransparencyContext = v8->_keyTransparencyContext;
    v8->_keyTransparencyContext = v11;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (IDSPeerIDValue *)a3;
  if (self == v5)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      BOOL v7 = -[IDSPeerIDValue isEqualToPeerIDValue:](self, "isEqualToPeerIDValue:", v5);
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToPeerIDValue:(id)a3
{
  uint64_t v6 = (IDSPeerIDValue *)a3;
  BOOL v7 = v6;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](self, "endpoints"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](v7, "endpoints"));
      if (v8 == v9
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](self, "endpoints")),
            uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](v7, "endpoints")),
            [v3 isEqual:v4]))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](self, "keyTransparencyContext"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](v7, "keyTransparencyContext"));
        if (v11 == v12)
        {
          unsigned __int8 v10 = 1;
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](self, "keyTransparencyContext"));
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](v7, "keyTransparencyContext"));
          unsigned __int8 v10 = [v13 isEqual:v14];
        }

        if (v8 == v9) {
          goto LABEL_13;
        }
      }

      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }

    unsigned __int8 v10 = 0;
  }

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](self, "endpoints"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](self, "endpoints"));
  id v5 = [v4 count];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](self, "keyTransparencyContext"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p endpoints.count: %lu, keyTransparencyContext: %@>",  v3,  self,  v5,  v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPeerIDValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___IDSEndpoint, v7),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"endpoints"]);

  id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(IDSQueryKeyTransparencyContext, v11),  @"keyTransparencyContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_super v14 = -[IDSPeerIDValue initWithEndpoints:keyTransparencyContext:]( self,  "initWithEndpoints:keyTransparencyContext:",  v10,  v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue endpoints](self, "endpoints"));
  [v4 encodeObject:v5 forKey:@"endpoints"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDValue keyTransparencyContext](self, "keyTransparencyContext"));
  [v4 encodeObject:v6 forKey:@"keyTransparencyContext"];
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (IDSQueryKeyTransparencyContext)keyTransparencyContext
{
  return self->_keyTransparencyContext;
}

- (void).cxx_destruct
{
}

@end