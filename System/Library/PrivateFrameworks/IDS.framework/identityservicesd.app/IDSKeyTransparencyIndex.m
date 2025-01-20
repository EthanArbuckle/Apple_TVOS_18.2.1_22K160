@interface IDSKeyTransparencyIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyTransparencyIndex:(id)a3;
- (IDSKeyTransparencyIndex)initWithServiceIdentifier:(id)a3 accountKey:(id)a4 URI:(id)a5;
- (IDSURI)URI;
- (NSData)accountKey;
- (NSString)serviceIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation IDSKeyTransparencyIndex

- (IDSKeyTransparencyIndex)initWithServiceIdentifier:(id)a3 accountKey:(id)a4 URI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSKeyTransparencyIndex;
  v11 = -[IDSKeyTransparencyIndex init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    serviceIdentifier = v11->_serviceIdentifier;
    v11->_serviceIdentifier = v12;

    v14 = (NSData *)[v9 copy];
    accountKey = v11->_accountKey;
    v11->_accountKey = v14;

    objc_storeStrong((id *)&v11->_URI, a5);
  }

  return v11;
}

- (BOOL)isEqualToKeyTransparencyIndex:(id)a3
{
  v6 = (IDSKeyTransparencyIndex *)a3;
  v7 = v6;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](self, "serviceIdentifier"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](v7, "serviceIdentifier"));
      if (v8 == v9
        || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](self, "serviceIdentifier")),
            v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](v7, "serviceIdentifier")),
            [v3 isEqual:v4]))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex accountKey](self, "accountKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex accountKey](v7, "accountKey"));
        if ([v11 isEqualToData:v12])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](self, "URI"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](v7, "URI"));
          if (v13 == v14)
          {
            unsigned __int8 v10 = 1;
          }

          else
          {
            v19 = v3;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](self, "URI"));
            v18 = v4;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](v7, "URI"));
            unsigned __int8 v10 = [v15 isEqual:v16];

            v4 = v18;
            v3 = v19;
          }
        }

        else
        {

          unsigned __int8 v10 = 0;
        }

        if (v8 == v9) {
          goto LABEL_16;
        }
      }

      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_16:
      goto LABEL_17;
    }

    unsigned __int8 v10 = 0;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSKeyTransparencyIndex isEqualToKeyTransparencyIndex:](self, "isEqualToKeyTransparencyIndex:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](self, "serviceIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex accountKey](self, "accountKey"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](self, "URI"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex serviceIdentifier](self, "serviceIdentifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex accountKey](self, "accountKey"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyIndex URI](self, "URI"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p serviceIdentifier: %@, accountKey: %@, URI: %@>",  v3,  self,  v4,  v5,  v6));

  return v7;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSData)accountKey
{
  return self->_accountKey;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (void).cxx_destruct
{
}

@end