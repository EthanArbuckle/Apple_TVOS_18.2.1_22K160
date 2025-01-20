@interface _NIRangingPeerDistance
+ (BOOL)supportsSecureCoding;
- (BOOL)initiator;
- (BOOL)isInitiator;
- (BOOL)shouldUnlock;
- (NSNumber)distanceMeters;
- (_NIRangingPeer)peer;
- (_NIRangingPeerDistance)init;
- (_NIRangingPeerDistance)initWithCoder:(id)a3;
- (_NIRangingPeerDistance)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NIRangingPeerDistance

- (_NIRangingPeerDistance)init
{
  return 0LL;
}

- (_NIRangingPeerDistance)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____NIRangingPeerDistance;
  v12 = -[_NIRangingPeerDistance init](&v17, "init");
  if (v12)
  {
    v13 = -[_NIRangingPeerDistanceInternal initWithPeer:distanceMeters:initiator:shouldUnlock:]( objc_alloc(&OBJC_CLASS____NIRangingPeerDistanceInternal),  "initWithPeer:distanceMeters:initiator:shouldUnlock:",  v10,  v11,  v7,  v6);
    id internal = v12->_internal;
    v12->_id internal = v13;

    v15 = v12;
  }

  return v12;
}

- (_NIRangingPeer)peer
{
  return (_NIRangingPeer *)*((id *)self->_internal + 1);
}

- (NSNumber)distanceMeters
{
  return (NSNumber *)*((id *)self->_internal + 2);
}

- (BOOL)shouldUnlock
{
  return *((_BYTE *)self->_internal + 25);
}

- (BOOL)initiator
{
  return *((_BYTE *)self->_internal + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithPeer:distanceMeters:initiator:shouldUnlock:",  *((void *)self->_internal + 1),  *((void *)self->_internal + 2),  *((unsigned __int8 *)self->_internal + 24),  *((unsigned __int8 *)self->_internal + 25));
}

- (_NIRangingPeerDistance)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 286, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]" object file lineNumber description];
  }

  id v6 = [v5 decodeObjectOfClass:objc_opt_class(_NIRangingPeer) forKey:@"kNICodingKeyRangingPeerDistancePeer"];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v5 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"kNICodingKeyRangingPeerDistanceDistance"];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v5 decodeBoolForKey:@"kNICodingKeyRangingPeerDistanceInitiator"];
  id v11 = [v5 decodeBoolForKey:@"kNICodingKeyRangingPeerDistanceUnlock"];

  v12 = -[_NIRangingPeerDistance initWithPeer:distanceMeters:initiator:shouldUnlock:]( self,  "initWithPeer:distanceMeters:initiator:shouldUnlock:",  v7,  v9,  v10,  v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  if (([v10 allowsKeyedCoding] & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 298, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]" object file lineNumber description];
  }

  id internal = self->_internal;
  uint64_t v6 = internal[1];
  BOOL v7 = internal;
  [v10 encodeObject:v6 forKey:@"kNICodingKeyRangingPeerDistancePeer"];
  [v10 encodeObject:v7[2] forKey:@"kNICodingKeyRangingPeerDistanceDistance"];
  [v10 encodeBool:*((unsigned __int8 *)v7 + 24) forKey:@"kNICodingKeyRangingPeerDistanceInitiator"];
  uint64_t v8 = *((unsigned __int8 *)v7 + 25);

  [v10 encodeBool:v8 forKey:@"kNICodingKeyRangingPeerDistanceUnlock"];
}

- (id)description
{
  id internal = (id *)self->_internal;
  id v3 = internal[1];
  v4 = internal;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 getMacAddressAsString]);
  [v4[2] floatValue];
  double v7 = v6;
  if (*((_BYTE *)v4 + 25)) {
    uint64_t v8 = "Yes";
  }
  else {
    uint64_t v8 = "No";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([internal[1] secureRangingKeyID]);
  if (v9) {
    id v10 = "Yes";
  }
  else {
    id v10 = "No";
  }
  int v11 = *((unsigned __int8 *)v4 + 24);

  if (v11) {
    v12 = "Yes";
  }
  else {
    v12 = "No";
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Peer: %@ distance[m]:%.02f unlock:%s secure:%s initiator:%s",  v5,  *(void *)&v7,  v8,  v10,  v12));

  return v13;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (void).cxx_destruct
{
}

@end