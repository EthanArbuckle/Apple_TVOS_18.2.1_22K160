@interface ADAcePassthroughSiriResponse
+ (BOOL)supportsSecureCoding;
- (ADAcePassthroughSiriResponse)initWithCoder:(id)a3;
- (ADAcePassthroughSiriResponse)initWithRequest:(id)a3 replyCommand:(id)a4;
- (id)replyCommand;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAcePassthroughSiriResponse

- (ADAcePassthroughSiriResponse)initWithRequest:(id)a3 replyCommand:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriResponse;
  v8 = (ADAcePassthroughSiriResponse *)-[ADAcePassthroughSiriResponse _initWithRequest:](&v11, "_initWithRequest:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_replyCommand, a4);
  }

  return v9;
}

- (id)replyCommand
{
  return self->_replyCommand;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriResponse;
  id v4 = a3;
  -[ADAcePassthroughSiriResponse encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_replyCommand,  @"AcePassthroughSiriResponseReplyCommand",  v5.receiver,  v5.super_class);
}

- (ADAcePassthroughSiriResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriResponse;
  objc_super v5 = -[ADAcePassthroughSiriResponse initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(AceObject) forKey:@"AcePassthroughSiriResponseReplyCommand"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    replyCommand = v5->_replyCommand;
    v5->_replyCommand = (SAAceCommand *)v7;
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end