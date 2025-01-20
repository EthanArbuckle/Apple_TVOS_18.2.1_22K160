@interface DDIDSIncomingMessage
- (DAIDSDestination)destination;
- (DAIDSMessageObject)data;
- (DDIDSIncomingMessage)initWithIncomingDictionary:(id)a3 destination:(id)a4;
- (NSString)description;
- (NSString)message;
@end

@implementation DDIDSIncomingMessage

- (DDIDSIncomingMessage)initWithIncomingDictionary:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DDIDSIncomingMessage;
  v8 = -[DDIDSIncomingMessage init](&v23, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"messageName"]);

    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"messageName"]);
    message = v8->_message;
    v8->_message = (NSString *)v10;

    objc_storeStrong((id *)&v8->_destination, a4);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"data"]);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](&OBJC_CLASS___DAIDSMessengerProxy, "allowedDataClasses"));
      id v22 = 0LL;
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v14,  v13,  &v22));
      id v16 = v22;
      data = v8->_data;
      v8->_data = (DAIDSMessageObject *)v15;

      if (v16)
      {
        uint64_t v18 = DiagnosticLogHandleForCategory(7LL);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10000E754(v6, v16, v19);
        }
      }

      v20 = v8->_data;

      if (!v20)
      {
LABEL_9:

        v8 = 0LL;
      }
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage message](self, "message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSIncomingMessage data](self, "data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"message: %@; data: %@",
                   v3,
                   v4));

  return (NSString *)v5;
}

- (NSString)message
{
  return self->_message;
}

- (DAIDSMessageObject)data
{
  return self->_data;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
}

@end