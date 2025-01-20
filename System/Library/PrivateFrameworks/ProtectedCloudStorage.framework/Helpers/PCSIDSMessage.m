@interface PCSIDSMessage
- (IDSMessageContext)idsContext;
- (NSDictionary)message;
- (NSString)fromID;
- (PCSIDSMessage)initWithMessage:(id)a3 idsContext:(id)a4 fromID:(id)a5;
@end

@implementation PCSIDSMessage

- (PCSIDSMessage)initWithMessage:(id)a3 idsContext:(id)a4 fromID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PCSIDSMessage;
  v12 = -[PCSIDSMessage init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong((id *)&v13->_idsContext, a4);
    objc_storeStrong((id *)&v13->_fromID, a5);
  }

  return v13;
}

- (NSDictionary)message
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (IDSMessageContext)idsContext
{
  return (IDSMessageContext *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)fromID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end