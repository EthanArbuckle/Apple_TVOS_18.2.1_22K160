@interface NRDDeviceIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDDeviceIdentity)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDDeviceIdentity

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[NRDDeviceIdentity init]( +[NRDDeviceIdentity allocWithZone:](&OBJC_CLASS___NRDDeviceIdentity, "allocWithZone:"),  "init");
  if (self) {
    identity = self->_identity;
  }
  else {
    identity = 0LL;
  }
  v7 = identity;
  id v8 = -[NSUUID copyWithZone:](v7, "copyWithZone:", a3);
  if (v5) {
    objc_storeStrong((id *)&v5->_identity, v8);
  }

  if (self) {
    publicKey = self->_publicKey;
  }
  else {
    publicKey = 0LL;
  }
  v10 = publicKey;
  id v11 = -[NSData copyWithZone:](v10, "copyWithZone:", a3);
  if (v5) {
    objc_storeStrong((id *)&v5->_publicKey, v11);
  }

  return v5;
}

- (NRDDeviceIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NRDDeviceIdentity;
  v5 = -[NRDDeviceIdentity init](&v27, "init");
  if (!v5)
  {
    id v15 = sub_100121F34();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 16LL);

    if (IsLevelEnabled)
    {
      id v17 = sub_100121F34();
      _NRLogWithArgs( v17,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRDDeviceIdentity initWithCoder:]"",  729);
    }

    id v4 = (id)_os_log_pack_size(12LL);
    v6 = (NRDDeviceIdentity *)((char *)&v26 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v18 = __error();
    uint64_t v19 = _os_log_pack_fill(v6, v4, *v18, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v19 = 136446210;
    *(void *)(v19 + 4) = "-[NRDDeviceIdentity initWithCoder:]";
    id v20 = sub_100121F34();
    _NRLogAbortWithPack(v20, v6);
LABEL_9:
    id v21 = sub_100121F34();
    int v22 = _NRLogIsLevelEnabled(v21, 17LL);

    if (v22)
    {
      id v23 = sub_100121F34();
      _NRLogWithArgs(v23, 17LL, "%s called with null self.identity");
LABEL_13:
    }

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_identity forKey:@"identity"];
    publicKey = self->_publicKey;
  }

  else
  {
    [a3 encodeObject:0 forKey:@"identity"];
    publicKey = 0LL;
  }

  [a3 encodeObject:publicKey forKey:@"publicKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NRDDeviceIdentity), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (id *)v4;
    if (self) {
      identity = self->_identity;
    }
    else {
      identity = 0LL;
    }
    uint64_t v8 = identity;
    id v9 = v6[1];
    if (-[NSUUID isEqual:](v8, "isEqual:", v9))
    {
      if (self) {
        publicKey = self->_publicKey;
      }
      else {
        publicKey = 0LL;
      }
      id v11 = v6[2];
      v12 = publicKey;
      unsigned __int8 v13 = -[NSData isEqualToData:](v12, "isEqualToData:", v11);
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end