@interface CSDVoIPApplicationMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (CSDVoIPApplicationMessage)initWithTransportType:(int64_t)a3 payload:(id)a4;
- (NSDictionary)payload;
- (NSUUID)uuid;
- (id)description;
- (int64_t)transportType;
- (unint64_t)hash;
@end

@implementation CSDVoIPApplicationMessage

- (CSDVoIPApplicationMessage)initWithTransportType:(int64_t)a3 payload:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDVoIPApplicationMessage;
  v7 = -[CSDVoIPApplicationMessage init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_transportType = a3;
    v9 = (NSDictionary *)[v6 copy];
    payload = v8->_payload;
    v8->_payload = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uuid = v8->_uuid;
    v8->_uuid = v11;
  }

  return v8;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@ %p ", objc_opt_class(self, v4), self);
  v5 = NSStringFromSelector("transportType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString csd_stringWithCSDVoIPApplicationMessageTransportType:]( &OBJC_CLASS___NSString,  "csd_stringWithCSDVoIPApplicationMessageTransportType:",  -[CSDVoIPApplicationMessage transportType](self, "transportType")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v6, v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v8 = NSStringFromSelector("payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMessage payload](self, "payload"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v9, v10);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v11 = NSStringFromSelector("uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMessage uuid](self, "uuid"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v12, v14);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  id v15 = -[NSMutableString copy](v3, "copy");

  return v15;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMessage uuid](self, "uuid"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CSDVoIPApplicationMessage *)a3;
  if (self == v5)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___CSDVoIPApplicationMessage, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      BOOL v7 = -[CSDVoIPApplicationMessage isEqualToMessage:](self, "isEqualToMessage:", v5);
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMessage uuid](self, "uuid"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end