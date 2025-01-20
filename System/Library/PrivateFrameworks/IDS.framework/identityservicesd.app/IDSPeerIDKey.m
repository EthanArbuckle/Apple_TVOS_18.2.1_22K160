@interface IDSPeerIDKey
+ (BOOL)supportsSecureCoding;
+ (id)peerIDKeyWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (BOOL)hasMatchingURIs;
- (BOOL)isEqual:(id)a3;
- (IDSPeerIDKey)initWithCoder:(id)a3;
- (IDSPeerIDKey)initWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (IDSURI)fromURI;
- (IDSURI)toURI;
- (NSString)service;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasMatchingURIs:(BOOL)a3;
@end

@implementation IDSPeerIDKey

+ (id)peerIDKeyWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithService:v10 fromURI:v9 toURI:v8];

  return v11;
}

- (IDSPeerIDKey)initWithService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  v12 = 0LL;
  if (v8 && v9 && v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___IDSPeerIDKey;
    v13 = -[IDSPeerIDKey init](&v17, "init");
    if (v13)
    {
      v14 = (NSString *)[v8 copy];
      service = v13->_service;
      v13->_service = v14;

      objc_storeStrong((id *)&v13->_fromURI, a4);
      objc_storeStrong((id *)&v13->_toURI, a5);
      v13->_hasMatchingURIs = [v9 isEqualToURI:v11];
    }

    self = v13;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey service](self, "service"));
    if ([v8 isEqualToString:v9])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fromURI]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey fromURI](self, "fromURI"));
      if ([v10 isEqual:v11])
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 toURI]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey toURI](self, "toURI"));
        unsigned __int8 v14 = [v12 isEqual:v13];
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey service](self, "service"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey fromURI](self, "fromURI"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey toURI](self, "toURI"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey service](self, "service"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey fromURI](self, "fromURI"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey toURI](self, "toURI"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<service:%@,from:%@,to:%@>",  v3,  v4,  v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPeerIDKey)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"service");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(IDSURI, v8), @"fromURI");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(IDSURI, v11), @"toURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  unsigned __int8 v14 = -[IDSPeerIDKey initWithService:fromURI:toURI:](self, "initWithService:fromURI:toURI:", v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey service](self, "service"));
  [v4 encodeObject:v5 forKey:@"service"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey fromURI](self, "fromURI"));
  [v4 encodeObject:v6 forKey:@"fromURI"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDKey toURI](self, "toURI"));
  [v4 encodeObject:v7 forKey:@"toURI"];
}

- (NSString)service
{
  return self->_service;
}

- (IDSURI)fromURI
{
  return self->_fromURI;
}

- (IDSURI)toURI
{
  return self->_toURI;
}

- (BOOL)hasMatchingURIs
{
  return self->_hasMatchingURIs;
}

- (void)setHasMatchingURIs:(BOOL)a3
{
  self->_hasMatchingURIs = a3;
}

- (void).cxx_destruct
{
}

@end