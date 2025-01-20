@interface GTTransportMessage_replayer
+ (id)messageWithKind:(int)a3;
+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
+ (id)messageWithKind:(int)a3 objectPayload:(id)a4;
+ (id)messageWithKind:(int)a3 payload:(id)a4;
+ (id)messageWithKind:(int)a3 plistPayload:(id)a4;
+ (id)messageWithKind:(int)a3 stringPayload:(id)a4;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLPayload;
- (BOOL)hasBeenSent;
- (GTTransportMessage_replayer)init;
- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5;
- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5;
- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5;
- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5;
- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5;
- (GTTransport_replayer)transport;
- (NSData)encodedAttributes;
- (NSData)payload;
- (NSDictionary)attributes;
- (double)doubleForKey:(id)a3;
- (id)attributeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectPayload;
- (id)plistPayload;
- (id)stringPayload;
- (int)kind;
- (unint64_t)uint64ForKey:(id)a3;
- (unsigned)replySerial;
- (unsigned)serial;
- (unsigned)transportSize;
- (unsigned)uint32ForKey:(id)a3;
- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5;
- (void)_setTransportSize:(unsigned int)a3;
- (void)dealloc;
- (void)setEncodedAttributes:(id)a3;
@end

@implementation GTTransportMessage_replayer

- (GTTransportMessage_replayer)init
{
  return 0LL;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTTransportMessage_replayer;
  v8 = -[GTTransportMessage_replayer init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    *(void *)&v8->_serial = -1LL;
    v8->_attributes = (NSDictionary *)a4;
    v9->_payload = (NSData *)a5;
  }

  return v9;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  BOOL v12 = a5;
  v8 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v12, 1LL);
  if (v8)
  {
    v9 = v8;
    v10 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]( self,  "initWithKind:attributes:payload:",  v6,  a4,  v8);
  }

  else
  {

    return 0LL;
  }

  return v10;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a5)
  {
    CFDataRef v8 = CFPropertyListCreateData(kCFAllocatorDefault, a5, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
    if (!v8)
    {

      return 0LL;
    }

    CFDataRef v9 = v8;
  }

  else
  {
    CFDataRef v9 = 0LL;
  }

  v10 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]( self,  "initWithKind:attributes:payload:",  v6,  a4,  v9);

  return v10;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (!a5)
  {
    ExternalRepresentation = 0LL;
    goto LABEL_5;
  }

  ExternalRepresentation = (GTTransportMessage_replayer *)CFStringCreateExternalRepresentation( kCFAllocatorDefault,  (CFStringRef)a5,  0x8000100u,  0);
  if (ExternalRepresentation)
  {
LABEL_5:
    CFDataRef v9 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]( self,  "initWithKind:attributes:payload:",  v6,  a4,  ExternalRepresentation);
    self = ExternalRepresentation;
    goto LABEL_6;
  }

  CFDataRef v9 = 0LL;
LABEL_6:

  return v9;
}

- (GTTransportMessage_replayer)initWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  v5 = (NSData *)a5;
  uint64_t v7 = *(void *)&a3;
  if (a5)
  {
    CFDataRef v9 = objc_autoreleasePoolPush();
    v10 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v10, "encodeObject:forKey:", v5, @"root");
    v5 = -[NSKeyedArchiver encodedData](v10, "encodedData");

    objc_autoreleasePoolPop(v9);
  }

  objc_super v11 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]( self,  "initWithKind:attributes:payload:",  v7,  a4,  v5);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3),  "initWithKind:attributes:payload:",  self->_kind,  self->_attributes,  self->_payload);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTTransportMessage_replayer;
  -[GTTransportMessage_replayer dealloc](&v3, "dealloc");
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTTransportMessage_replayer;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ kind=0x%x serial=%u, reply serial=%u",  -[GTTransportMessage_replayer description](&v3, "description"),  self->_kind,  self->_serial,  self->_replySerial);
}

- (BOOL)hasBeenSent
{
  return -[GTTransportMessage_replayer serial](self, "serial") != -1;
}

- (void)_setSerial:(unsigned int)a3 replySerial:(unsigned int)a4 transport:(id)a5
{
  self->_serial = a3;
  self->_replySerial = a4;
  self->_transport = (GTTransport_replayer *)a5;
}

- (void)_setTransportSize:(unsigned int)a3
{
  self->_transportSize = a3;
}

- (id)attributeForKey:(id)a3
{
  return -[NSDictionary objectForKey:]( -[GTTransportMessage_replayer attributes](self, "attributes"),  "objectForKey:",  a3);
}

- (unsigned)uint32ForKey:(id)a3
{
  return objc_msgSend( -[NSDictionary objectForKey:]( -[GTTransportMessage_replayer attributes](self, "attributes"),  "objectForKey:",  a3),  "unsignedIntValue");
}

- (unint64_t)uint64ForKey:(id)a3
{
  return (unint64_t)objc_msgSend( -[NSDictionary objectForKey:]( -[GTTransportMessage_replayer attributes](self, "attributes"),  "objectForKey:",  a3),  "unsignedLongLongValue");
}

- (double)doubleForKey:(id)a3
{
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return objc_msgSend( -[NSDictionary objectForKey:]( -[GTTransportMessage_replayer attributes](self, "attributes"),  "objectForKey:",  a3),  "BOOLValue");
}

- (BOOL)BOOLPayload
{
  payload = self->_payload;
  if (payload)
  {
    unsigned int decodedPayloadType = self->_decodedPayloadType;
    switch(decodedPayloadType)
    {
      case 5u:
        goto LABEL_10;
      case 4u:
LABEL_7:
        -[NSData getBytes:length:](payload, "getBytes:length:", &v8, 1LL);
        self->_unsigned int decodedPayloadType = 4;
        LOBYTE(payload) = v8 != 0;
        return (char)payload;
      case 0u:
        if ((char *)-[NSData length](payload, "length") == (char *)&dword_0 + 1)
        {
          payload = self->_payload;
          goto LABEL_7;
        }

        unsigned int v5 = self->_decodedPayloadType;
        if (!v5)
        {
          id decodedPayload = -[GTTransportMessage_replayer objectPayload](self, "objectPayload");
          if (decodedPayload) {
            self->_unsigned int decodedPayloadType = 5;
          }
          goto LABEL_11;
        }

        if (v5 == 5)
        {
LABEL_10:
          id decodedPayload = self->_decodedPayload;
LABEL_11:
          LOBYTE(payload) = [decodedPayload BOOLValue];
          return (char)payload;
        }

        break;
    }

    LOBYTE(payload) = 0;
  }

  return (char)payload;
}

- (id)plistPayload
{
  payload = self->_payload;
  if (!payload || (self->_decodedPayloadType | 2) != 2) {
    return 0LL;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)payload, 0LL, 0LL, 0LL);
    self->_id decodedPayload = result;
    if (result)
    {
      self->_unsigned int decodedPayloadType = 2;
      char v5 = objc_opt_respondsToSelector(result, "objectForKey:");
      id result = self->_decodedPayload;
      if ((v5 & 1) != 0)
      {
        unsigned int v6 = objc_msgSend( objc_msgSend(result, "objectForKey:", @"$archiver"),  "isEqual:",  @"NSKeyedArchiver");
        id result = self->_decodedPayload;
        if (v6)
        {
          char v7 = objc_opt_respondsToSelector([result objectForKey:@"$top"], "objectForKey:");
          id result = self->_decodedPayload;
          if ((v7 & 1) != 0)
          {
            id v8 = objc_msgSend(objc_msgSend(result, "objectForKey:", @"$top"), "objectForKey:", @"root");
            id result = self->_decodedPayload;
            if (v8)
            {
              id v9 = [result objectForKey:@"$version"];
              id result = self->_decodedPayload;
              if (v9)
              {
                id v10 = [result objectForKey:@"$objects"];
                id result = self->_decodedPayload;
                if (v10)
                {

                  id result = 0LL;
                  self->_id decodedPayload = 0LL;
                  self->_unsigned int decodedPayloadType = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

- (id)stringPayload
{
  payload = self->_payload;
  if (!payload) {
    return 0LL;
  }
  unsigned int decodedPayloadType = self->_decodedPayloadType;
  if (decodedPayloadType != 3 && decodedPayloadType != 0) {
    return 0LL;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    id result = (id)CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)payload, 0x8000100u);
    self->_id decodedPayload = result;
    if (result) {
      self->_unsigned int decodedPayloadType = 3;
    }
  }

  return result;
}

- (id)objectPayload
{
  if (!self->_payload || self->_decodedPayloadType > 1) {
    return 0LL;
  }
  id result = self->_decodedPayload;
  if (!result)
  {
    v4 = objc_autoreleasePoolPush();
    char v5 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  self->_payload,  0LL);
    -[NSKeyedUnarchiver setDecodingFailurePolicy:](v5, "setDecodingFailurePolicy:", 0LL);
    id v6 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    v17[0] = objc_opt_class(&OBJC_CLASS___NSArray, v7);
    v17[1] = objc_opt_class(&OBJC_CLASS___NSComparisonPredicate, v8);
    v17[2] = objc_opt_class(&OBJC_CLASS___NSData, v9);
    v17[3] = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
    v17[4] = objc_opt_class(&OBJC_CLASS___NSError, v11);
    v17[5] = objc_opt_class(&OBJC_CLASS___NSMapTable, v12);
    v17[6] = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
    v17[7] = objc_opt_class(&OBJC_CLASS___NSSet, v14);
    v17[8] = objc_opt_class(&OBJC_CLASS___NSString, v15);
    v17[9] = objc_opt_class(&OBJC_CLASS___NSURL, v16);
    objc_msgSend( v6,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 10));
    self->_id decodedPayload =  -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v5,  "decodeObjectOfClasses:forKey:",  v6,  @"root");
    -[NSKeyedUnarchiver finishDecoding](v5, "finishDecoding");

    objc_autoreleasePoolPop(v4);
    id result = self->_decodedPayload;
    if (result) {
      self->_unsigned int decodedPayloadType = 1;
    }
  }

  return result;
}

- (int)kind
{
  return self->_kind;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSData)encodedAttributes
{
  return self->_encodedAttributes;
}

- (void)setEncodedAttributes:(id)a3
{
}

- (unsigned)serial
{
  return self->_serial;
}

- (unsigned)replySerial
{
  return self->_replySerial;
}

- (GTTransport_replayer)transport
{
  return self->_transport;
}

- (unsigned)transportSize
{
  return self->_transportSize;
}

+ (id)messageWithKind:(int)a3
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:0];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:0];
}

+ (id)messageWithKind:(int)a3 payload:(id)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 payload:a4];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 payload:(id)a5
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 payload:a5];
}

+ (id)messageWithKind:(int)a3 BOOLPayload:(BOOL)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 BOOLPayload:a4];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 BOOLPayload:(BOOL)a5
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 BOOLPayload:a5];
}

+ (id)messageWithKind:(int)a3 plistPayload:(id)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 plistPayload:a4];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 plistPayload:(id)a5
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 plistPayload:a5];
}

+ (id)messageWithKind:(int)a3 stringPayload:(id)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 stringPayload:a4];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 stringPayload:(id)a5
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 stringPayload:a5];
}

+ (id)messageWithKind:(int)a3 objectPayload:(id)a4
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:0 objectPayload:a4];
}

+ (id)messageWithKind:(int)a3 attributes:(id)a4 objectPayload:(id)a5
{
  return [objc_alloc((Class)a1) initWithKind:*(void *)&a3 attributes:a4 objectPayload:a5];
}

@end