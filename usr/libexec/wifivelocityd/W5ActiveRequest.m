@interface W5ActiveRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)wantsUpdates;
- (NSString)destinationPeerID;
- (NSString)peerID;
- (NSString)sourcePeerID;
- (NSUUID)uuid;
- (W5ActiveRequest)initWithCoder:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWantsUpdates:(BOOL)a3;
@end

@implementation W5ActiveRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___W5ActiveRequest;
  -[W5ActiveRequest dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"UUID: %@\n",  -[NSString substringToIndex:](-[NSUUID UUIDString](self->_uuid, "UUIDString"), "substringToIndex:", 5LL));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"PeerID: %@\n", self->_peerID);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Type: %@\n", sub_10001BCD0(self->_type));
  if (self->_wantsUpdates) {
    v4 = "Yes";
  }
  else {
    v4 = "No";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Wants Updates: %s\n", v4);
  v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 0LL);
  -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 2LL);
  -[NSDateFormatter setLocale:](v5, "setLocale:", +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Timestamp: %@\n",  -[NSDateFormatter stringFromDate:]( v5,  "stringFromDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_timestamp)));
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5ActiveRequest;
  if (-[W5ActiveRequest conformsToProtocol:](&v5, "conformsToProtocol:")
    || ([a3 isEqual:&OBJC_PROTOCOL___NSSecureCoding] & 1) != 0)
  {
    return 1;
  }

  else
  {
    return [a3 isEqual:&OBJC_PROTOCOL___NSCopying];
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[W5ActiveRequest init]( +[W5ActiveRequest allocWithZone:](&OBJC_CLASS___W5ActiveRequest, "allocWithZone:", a3),  "init");
  -[W5ActiveRequest setUuid:](v4, "setUuid:", self->_uuid);
  -[W5ActiveRequest setPeerID:](v4, "setPeerID:", self->_peerID);
  -[W5ActiveRequest setType:](v4, "setType:", self->_type);
  -[W5ActiveRequest setTimestamp:](v4, "setTimestamp:", self->_timestamp);
  -[W5ActiveRequest setWantsUpdates:](v4, "setWantsUpdates:", self->_wantsUpdates);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (W5ActiveRequest)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___W5ActiveRequest;
  objc_super v5 = -[W5ActiveRequest init](&v9, "init");
  if (v5)
  {
    v5->_uuid = (NSUUID *)objc_msgSend( objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v4),  @"_uuid"),  "copy");
    v5->_peerID = (NSString *)objc_msgSend( objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"_peerID"),  "copy");
    v5->_type = (int64_t)[a3 decodeIntegerForKey:@"_type"];
    [a3 decodeDoubleForKey:@"_timestamp"];
    v5->_timestamp = v7;
    v5->_wantsUpdates = [a3 decodeBoolForKey:@"_wantsUpdates"];
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)sourcePeerID
{
  return self->_sourcePeerID;
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSString)destinationPeerID
{
  return self->_destinationPeerID;
}

- (void)setDestinationPeerID:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)wantsUpdates
{
  return self->_wantsUpdates;
}

- (void)setWantsUpdates:(BOOL)a3
{
  self->_wantsUpdates = a3;
}

@end