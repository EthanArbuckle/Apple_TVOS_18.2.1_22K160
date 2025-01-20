@interface _TVSSFaceTimeIncomingCallInfo
+ (id)incomingCallInfoWithCall:(id)a3 conversation:(id)a4;
- (TUContinuityCall)call;
- (TUContinuityConversation)conversation;
@end

@implementation _TVSSFaceTimeIncomingCallInfo

+ (id)incomingCallInfoWithCall:(id)a3 conversation:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v7 = objc_alloc_init(&OBJC_CLASS____TVSSFaceTimeIncomingCallInfo);
  objc_storeStrong((id *)&v7->_call, location[0]);
  objc_storeStrong((id *)&v7->_conversation, v8);
  v6 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (TUContinuityCall)call
{
  return self->_call;
}

- (TUContinuityConversation)conversation
{
  return self->_conversation;
}

- (void).cxx_destruct
{
}

@end