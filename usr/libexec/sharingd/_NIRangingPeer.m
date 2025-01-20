@interface _NIRangingPeer
+ (BOOL)supportsSecureCoding;
+ (id)hexStringMacAddressFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeer:(id)a3;
- (NSData)macAddress;
- (NSData)secureRangingKeyID;
- (_NIRangingPeer)init;
- (_NIRangingPeer)initWithCoder:(id)a3;
- (_NIRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getMacAddressAsString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NIRangingPeer

- (_NIRangingPeer)init
{
  return 0LL;
}

- (_NIRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    uint64_t v11 = auto_unlock_log(v7);
    internal = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    goto LABEL_6;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____NIRangingPeer;
  self = -[_NIRangingPeer init](&v13, "init");
  if (self)
  {
    v9 = -[_NIRangingPeerInternal initWithMacAddressAsData:secureRangingKeyID:]( objc_alloc(&OBJC_CLASS____NIRangingPeerInternal),  "initWithMacAddressAsData:secureRangingKeyID:",  v6,  v8);
    internal = (os_log_s *)self->_internal;
    self->_internal = v9;
LABEL_6:
  }

  return self;
}

- (NSData)macAddress
{
  return (NSData *)*((id *)self->_internal + 1);
}

- (NSData)secureRangingKeyID
{
  return (NSData *)*((id *)self->_internal + 2);
}

- (id)getMacAddressAsString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_NIRangingPeer hexStringMacAddressFromData:]( &OBJC_CLASS____NIRangingPeer,  "hexStringMacAddressFromData:",  v2));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithMacAddressAsData:secureRangingKeyID:",  *((void *)self->_internal + 1),  *((void *)self->_internal + 2));
}

- (_NIRangingPeer)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 157, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]" object file lineNumber description];
  }

  id v6 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"kNICodingKeyRangingPeerMacAddress"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v5 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"kNICodingKeyRangingPeerSecureRangingKeyID"];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = -[_NIRangingPeer initWithMacAddressAsData:secureRangingKeyID:]( self,  "initWithMacAddressAsData:secureRangingKeyID:",  v7,  v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 167, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]" object file lineNumber description];
  }

  internal = self->_internal;
  uint64_t v6 = internal[1];
  id v7 = internal;
  [v9 encodeObject:v6 forKey:@"kNICodingKeyRangingPeerMacAddress"];
  [v9 encodeObject:v7[2] forKey:@"kNICodingKeyRangingPeerSecureRangingKeyID"];
}

- (id)description
{
  v3 = self->_internal;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer getMacAddressAsString](self, "getMacAddressAsString"));
  uint64_t v5 = v3[2];

  uint64_t v6 = "Yes";
  if (!v5) {
    uint64_t v6 = "No";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Peer:%@ hasKey:%s",  v4,  v6));

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqualToPeer:(id)a3
{
  id v8 = (_NIRangingPeer *)a3;
  id v9 = v8;
  if (self == v8)
  {
    BOOL v12 = 1;
    goto LABEL_25;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v8, "macAddress"));
  if (v10
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress")),
        unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v9, "macAddress")),
        ([v3 isEqualToData:v4] & 1) != 0))
  {
    int v11 = 0;
  }

  else
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](v9, "macAddress"));
    if (v13)
    {
      BOOL v12 = 0;
LABEL_21:

      goto LABEL_22;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer macAddress](self, "macAddress"));
    if (v14)
    {

      BOOL v12 = 0;
      goto LABEL_22;
    }

    int v11 = 1;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
  if (v15)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
    if ([v5 isEqualToData:v6])
    {
      BOOL v12 = 1;
      goto LABEL_16;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](v9, "secureRangingKeyID"));
  if (v16)
  {

    BOOL v12 = 0;
    if (v15) {
      goto LABEL_16;
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NIRangingPeer secureRangingKeyID](self, "secureRangingKeyID"));
    BOOL v12 = v17 == 0LL;

    if (v15)
    {
LABEL_16:

      if ((v11 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }

  if (v11)
  {
LABEL_20:
    objc_super v13 = 0LL;
    goto LABEL_21;
  }

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_NIRangingPeer *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    BOOL v7 = -[_NIRangingPeer isEqualToPeer:](self, "isEqualToPeer:", v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)hexStringMacAddressFromData:(id)a3
{
  *(_WORD *)&v5.octet[4] = 0;
  *(_DWORD *)v5.octet = 0;
  [a3 getBytes:&v5 length:6];
  v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", ether_ntoa(&v5));
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void).cxx_destruct
{
}

@end