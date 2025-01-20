@interface _PBUserPresentationMessagePair
- (NSDictionary)message;
- (_PBUserPresentationMessagePair)initWithMessage:(id)a3 reply:(id)a4;
- (id)reply;
@end

@implementation _PBUserPresentationMessagePair

- (_PBUserPresentationMessagePair)initWithMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBUserPresentationMessagePair;
  v8 = -[_PBUserPresentationMessagePair init](&v14, "init");
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    message = v8->_message;
    v8->_message = v9;

    id v11 = [v7 copy];
    id reply = v8->_reply;
    v8->_id reply = v11;
  }

  return v8;
}

- (NSDictionary)message
{
  return self->_message;
}

- (id)reply
{
  return self->_reply;
}

- (void).cxx_destruct
{
}

@end