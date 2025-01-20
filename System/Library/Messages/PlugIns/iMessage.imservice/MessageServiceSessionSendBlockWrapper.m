@interface MessageServiceSessionSendBlockWrapper
- (BOOL)isDelayedRichLinkBlock;
- (MessageServiceSessionSendBlockWrapper)init;
- (NSString)GUID;
- (id)block;
- (id)description;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsDelayedRichLinkBlock:(BOOL)a3;
@end

@implementation MessageServiceSessionSendBlockWrapper

- (MessageServiceSessionSendBlockWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessageServiceSessionSendBlockWrapper;
  result = -[MessageServiceSessionSendBlockWrapper init](&v3, "init");
  if (result)
  {
    result->_isDelayedRichLinkBlock = 0;
    result->_GUID = 0LL;
    result->_block = 0LL;
  }

  return result;
}

- (void)dealloc
{
  if (IMOSLoggingEnabled(self, a2))
  {
    objc_super v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageServiceSessionSendBlockWrapper");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      GUID = self->_GUID;
      *(_DWORD *)buf = 138412546;
      v7 = GUID;
      __int16 v8 = 2048;
      v9 = self;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "deallocing %@ %p", buf, 0x16u);
    }
  }

  _Block_release(self->_block);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MessageServiceSessionSendBlockWrapper;
  -[MessageServiceSessionSendBlockWrapper dealloc](&v5, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = -[MessageServiceSessionSendBlockWrapper GUID](self, "GUID");
  if (-[MessageServiceSessionSendBlockWrapper isDelayedRichLinkBlock](self, "isDelayedRichLinkBlock")) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p GUID %@ isDelayedRichLinkBlock %@ Block %@>",  v3,  self,  v4,  v5,  -[MessageServiceSessionSendBlockWrapper block](self, "block"));
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (BOOL)isDelayedRichLinkBlock
{
  return self->_isDelayedRichLinkBlock;
}

- (void)setIsDelayedRichLinkBlock:(BOOL)a3
{
  self->_isDelayedRichLinkBlock = a3;
}

@end