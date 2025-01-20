@interface APSDNSResponse
+ (BOOL)supportsSecureCoding;
- (APSDNSResponse)initWithCoder:(id)a3;
- (NSArray)ipv4Address;
- (NSArray)ipv6Address;
- (NSString)hostname;
- (id)initResponseForHostname:(id)a3 ipv4Address:(id)a4 ipv6Address:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APSDNSResponse

- (id)initResponseForHostname:(id)a3 ipv4Address:(id)a4 ipv6Address:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___APSDNSResponse;
  v11 = -[APSDNSResponse init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    hostname = v11->_hostname;
    v11->_hostname = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@","]);
    ipv4Address = v11->_ipv4Address;
    v11->_ipv4Address = (NSArray *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@","]);
    ipv6Address = v11->_ipv6Address;
    v11->_ipv6Address = (NSArray *)v16;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APSDNSResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___APSDNSResponse;
  v6 = -[APSDNSResponse init](&v25, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"APSDNSHostname");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    hostname = v6->_hostname;
    v6->_hostname = (NSString *)v8;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  objc_opt_class(&OBJC_CLASS___NSString, v12),  0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"APSDNSIPv4Address"]);
    ipv4Address = v6->_ipv4Address;
    v6->_ipv4Address = (NSArray *)v15;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
    v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___NSString, v19),  0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v21 forKey:@"APSDNSIPv6Address"]);
    ipv6Address = v6->_ipv6Address;
    v6->_ipv6Address = (NSArray *)v22;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  hostname = self->_hostname;
  id v5 = a3;
  [v5 encodeObject:hostname forKey:@"APSDNSHostname"];
  [v5 encodeObject:self->_ipv4Address forKey:@"APSDNSIPv4Address"];
  [v5 encodeObject:self->_ipv6Address forKey:@"APSDNSIPv6Address"];
}

- (NSString)hostname
{
  return self->_hostname;
}

- (NSArray)ipv4Address
{
  return self->_ipv4Address;
}

- (NSArray)ipv6Address
{
  return self->_ipv6Address;
}

- (void).cxx_destruct
{
}

@end