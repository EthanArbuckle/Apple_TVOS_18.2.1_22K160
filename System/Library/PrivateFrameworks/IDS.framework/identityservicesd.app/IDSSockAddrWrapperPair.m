@interface IDSSockAddrWrapperPair
+ (id)shortDescriptionForLocalAddress:(id)a3 remoteAddress:(id)a4;
+ (id)wrapperPairWithLocalAddress:(id)a3 remoteAddress:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSockAddrWrapperPair:(id)a3;
- (IDSSockAddrWrapper)localAddress;
- (IDSSockAddrWrapper)remoteAddress;
- (IDSSockAddrWrapperPair)initWithLocalAddress:(id)a3 remoteAddress:(id)a4;
- (id)description;
- (id)shortDescription;
- (unint64_t)hash;
@end

@implementation IDSSockAddrWrapperPair

+ (id)wrapperPairWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[IDSSockAddrWrapperPair initWithLocalAddress:remoteAddress:]( objc_alloc(&OBJC_CLASS___IDSSockAddrWrapperPair),  "initWithLocalAddress:remoteAddress:",  v6,  v5);

  return v7;
}

- (IDSSockAddrWrapperPair)initWithLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSSockAddrWrapperPair;
  v8 = -[IDSSockAddrWrapperPair init](&v14, "init");
  if (v8)
  {
    v9 = (IDSSockAddrWrapper *)[v6 copy];
    localAddress = v8->_localAddress;
    v8->_localAddress = v9;

    v11 = (IDSSockAddrWrapper *)[v7 copy];
    remoteAddress = v8->_remoteAddress;
    v8->_remoteAddress = v11;
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"local[%@] remote[%@]",  self->_localAddress,  self->_remoteAddress);
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u:::%u",  -[IDSSockAddrWrapper saPortHostOrder](self->_localAddress, "saPortHostOrder"),  -[IDSSockAddrWrapper saPortHostOrder](self->_remoteAddress, "saPortHostOrder"));
}

+ (id)shortDescriptionForLocalAddress:(id)a3 remoteAddress:(id)a4
{
  id v5 = a4;
  LODWORD(a3) = [a3 saPortHostOrder];
  unsigned int v6 = [v5 saPortHostOrder];

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u:::%u",  a3,  v6);
}

- (BOOL)isEqualToSockAddrWrapperPair:(id)a3
{
  id v4 = a3;
  localAddress = self->_localAddress;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localAddress]);
  if (-[IDSSockAddrWrapper isEqualToWrapper:](localAddress, "isEqualToWrapper:", v6))
  {
    remoteAddress = self->_remoteAddress;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteAddress]);
    unsigned __int8 v9 = -[IDSSockAddrWrapper isEqualToWrapper:](remoteAddress, "isEqualToWrapper:", v8);
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(&OBJC_CLASS___IDSSockAddrWrapperPair, v7)) {
    BOOL v8 = -[IDSSockAddrWrapperPair isEqualToSockAddrWrapperPair:](self, "isEqualToSockAddrWrapperPair:", v4);
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[IDSSockAddrWrapper hash](self->_localAddress, "hash");
  return (unint64_t)-[IDSSockAddrWrapper hash](self->_remoteAddress, "hash") ^ v3;
}

- (IDSSockAddrWrapper)localAddress
{
  return self->_localAddress;
}

- (IDSSockAddrWrapper)remoteAddress
{
  return self->_remoteAddress;
}

- (void).cxx_destruct
{
}

@end