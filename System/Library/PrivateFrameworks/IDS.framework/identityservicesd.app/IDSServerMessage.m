@interface IDSServerMessage
- (BOOL)wantsBinaryPush;
- (IDSServerMessage)initWithPayload:(id)a3 command:(id)a4;
- (NSDictionary)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (int64_t)command;
- (void)setCommand:(int64_t)a3;
- (void)setPayload:(id)a3;
@end

@implementation IDSServerMessage

- (IDSServerMessage)initWithPayload:(id)a3 command:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSServerMessage;
  v8 = -[IDSServerMessage init](&v12, "init");
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    payload = v8->_payload;
    v8->_payload = v9;

    v8->_command = (int64_t)[v7 integerValue];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSServerMessage;
  id v4 = -[IDSServerMessage copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setPayload:self->_payload];
  [v4 setCommand:self->_command];
  return v4;
}

- (id)messageBody
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSServerMessage;
  id v3 = -[IDSServerMessage messageBody](&v11, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v4 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  payload = self->_payload;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100271778;
  v9[3] = &unk_1008F8418;
  id v7 = Mutable;
  v10 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](payload, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end