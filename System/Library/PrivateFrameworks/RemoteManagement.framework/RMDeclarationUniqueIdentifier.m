@interface RMDeclarationUniqueIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeclarationIdentifier:(id)a3;
- (NSString)identifier;
- (NSString)managementSourceIdentifier;
- (NSString)serverToken;
- (NSString)type;
- (RMDeclarationUniqueIdentifier)initWithCoder:(id)a3;
- (RMDeclarationUniqueIdentifier)initWithDeclarationPayload:(id)a3;
- (RMDeclarationUniqueIdentifier)initWithManagementSourceIdentifier:(id)a3 type:(id)a4 identifier:(id)a5 serverToken:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMDeclarationUniqueIdentifier

- (RMDeclarationUniqueIdentifier)initWithDeclarationPayload:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 managementSourceIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 declarationType]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serverToken]);

  v9 = -[RMDeclarationUniqueIdentifier initWithManagementSourceIdentifier:type:identifier:serverToken:]( self,  "initWithManagementSourceIdentifier:type:identifier:serverToken:",  v5,  v6,  v7,  v8);
  return v9;
}

- (RMDeclarationUniqueIdentifier)initWithManagementSourceIdentifier:(id)a3 type:(id)a4 identifier:(id)a5 serverToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RMDeclarationUniqueIdentifier;
  v14 = -[RMDeclarationUniqueIdentifier init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    managementSourceIdentifier = v14->_managementSourceIdentifier;
    v14->_managementSourceIdentifier = v15;

    v17 = (NSString *)[v11 copy];
    type = v14->_type;
    v14->_type = v17;

    v19 = (NSString *)[v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = v19;

    v21 = (NSString *)[v13 copy];
    serverToken = v14->_serverToken;
    v14->_serverToken = v21;
  }

  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier managementSourceIdentifier](self, "managementSourceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier serverToken](self, "serverToken"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p { managementSourceIdentifier = %@, type = %@, identifier = %@, serverToken = %@ }>",  v5,  self,  v6,  v7,  v8,  v9));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RMDeclarationUniqueIdentifier *)a3;
  if (self == v5)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___RMDeclarationUniqueIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      BOOL v7 = -[RMDeclarationUniqueIdentifier isEqualToDeclarationIdentifier:](self, "isEqualToDeclarationIdentifier:", v5);
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToDeclarationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[RMDeclarationUniqueIdentifier hash](self, "hash");
  if (v5 == [v4 hash])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier managementSourceIdentifier](self, "managementSourceIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managementSourceIdentifier]);
    if ([v6 isEqualToString:v7])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier type](self, "type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
      if ([v8 isEqualToString:v9])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier identifier](self, "identifier"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        if ([v10 isEqualToString:v11])
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier serverToken](self, "serverToken"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 serverToken]);
          unsigned __int8 v14 = [v12 isEqualToString:v13];
        }

        else
        {
          unsigned __int8 v14 = 0;
        }
      }

      else
      {
        unsigned __int8 v14 = 0;
      }
    }

    else
    {
      unsigned __int8 v14 = 0;
    }
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier managementSourceIdentifier](self, "managementSourceIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier type](self, "type"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier identifier](self, "identifier"));
  unint64_t v8 = (unint64_t)[v7 hash];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier serverToken](self, "serverToken"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationUniqueIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"managementSourceIdentifier");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), @"type");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v11),  @"identifier");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"serverToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v7) {
    BOOL v17 = v10 == 0LL;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17 || v13 == 0LL || v16 == 0LL)
  {
    v20 = 0LL;
  }

  else
  {
    self =  -[RMDeclarationUniqueIdentifier initWithManagementSourceIdentifier:type:identifier:serverToken:]( self,  "initWithManagementSourceIdentifier:type:identifier:serverToken:",  v7,  v10,  v13,  v16);
    v20 = self;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier managementSourceIdentifier](self, "managementSourceIdentifier"));
  [v4 encodeObject:v5 forKey:@"managementSourceIdentifier"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier type](self, "type"));
  [v4 encodeObject:v6 forKey:@"type"];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier identifier](self, "identifier"));
  [v4 encodeObject:v7 forKey:@"identifier"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier serverToken](self, "serverToken"));
  [v4 encodeObject:v8 forKey:@"serverToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___RMDeclarationUniqueIdentifier);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier managementSourceIdentifier](self, "managementSourceIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier type](self, "type"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier identifier](self, "identifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationUniqueIdentifier serverToken](self, "serverToken"));
  id v9 = -[RMDeclarationUniqueIdentifier initWithManagementSourceIdentifier:type:identifier:serverToken:]( v4,  "initWithManagementSourceIdentifier:type:identifier:serverToken:",  v5,  v6,  v7,  v8);

  return v9;
}

- (NSString)managementSourceIdentifier
{
  return self->_managementSourceIdentifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serverToken
{
  return self->_serverToken;
}

- (void).cxx_destruct
{
}

@end