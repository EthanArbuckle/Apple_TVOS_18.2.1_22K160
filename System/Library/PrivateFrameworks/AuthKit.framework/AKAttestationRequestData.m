@interface AKAttestationRequestData
+ (BOOL)supportsSecureCoding;
- (AKAttestationRequestData)initWithCoder:(id)a3;
- (AKAttestationRequestData)initWithRequest:(id)a3 requiredHeaders:(id)a4;
- (NSData)bodyDataHash;
- (NSDictionary)headers;
- (NSURL)requestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKAttestationRequestData

- (AKAttestationRequestData)initWithRequest:(id)a3 requiredHeaders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AKAttestationRequestData;
  v8 = -[AKAttestationRequestData init](&v18, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 URL]);
    requestURL = v8->_requestURL;
    v8->_requestURL = (NSURL *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 HTTPBody]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ak_SHA256Data"));
    bodyDataHash = v8->_bodyDataHash;
    v8->_bodyDataHash = (NSData *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 allHTTPHeaderFields]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ak_dictionaryWithKeysFromArray:", v7));
    headers = v8->_headers;
    v8->_headers = (NSDictionary *)v15;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class(self, a2));
  id v5 = -[NSData copy](self->_bodyDataHash, "copy");
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = -[NSDictionary copy](self->_headers, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationRequestData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = -[AKAttestationRequestData init](self, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v5), @"_requestURL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    requestURL = v6->_requestURL;
    v6->_requestURL = (NSURL *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v10),  @"_bodyDataHash");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    bodyDataHash = v6->_bodyDataHash;
    v6->_bodyDataHash = (NSData *)v12;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
    v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  objc_opt_class(&OBJC_CLASS___NSString, v16),  0LL);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"_headers"]);
    headers = v6->_headers;
    v6->_headers = (NSDictionary *)v19;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  requestURL = self->_requestURL;
  id v5 = a3;
  [v5 encodeObject:requestURL forKey:@"_requestURL"];
  [v5 encodeObject:self->_bodyDataHash forKey:@"_bodyDataHash"];
  [v5 encodeObject:self->_headers forKey:@"_headers"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AKAttestationRequestData: bodyHash: %@, headers: %@",  self->_bodyDataHash,  self->_headers);
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSData)bodyDataHash
{
  return self->_bodyDataHash;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
}

@end