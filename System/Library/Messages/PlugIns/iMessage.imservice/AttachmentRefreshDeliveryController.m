@interface AttachmentRefreshDeliveryController
- (AttachmentRefreshDeliveryController)initWithSession:(id)a3;
- (FTMessageDelivery)messageDelivery;
- (MessageServiceSession)session;
- (void)_sendFTMessage:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)sendFTMessage:(id)a3 attempts:(unint64_t)a4 withCompletionBlock:(id)a5;
- (void)setMessageDelivery:(id)a3;
@end

@implementation AttachmentRefreshDeliveryController

- (AttachmentRefreshDeliveryController)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AttachmentRefreshDeliveryController;
  v4 = -[AttachmentRefreshDeliveryController init](&v7, "init");
  if (v4)
  {
    v5 = (FTMessageDelivery *)objc_alloc_init((Class)+[FTMessageDelivery APNSMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "APNSMessageDeliveryClass"));
    v4->_messageDelivery = v5;
    -[FTMessageDelivery setMaxConcurrentMessages:](v5, "setMaxConcurrentMessages:", 2LL);
    objc_storeWeak((id *)&v4->_session, a3);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AttachmentRefreshDeliveryController;
  -[AttachmentRefreshDeliveryController dealloc](&v3, "dealloc");
}

- (void)_sendFTMessage:(id)a3 withCompletionBlock:(id)a4
{
  if (IMOSLoggingEnabled(self, a2))
  {
    objc_super v7 = (os_log_s *)OSLogHandleForIMEventCategory("AttachmentRefreshDelivery");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = [a3 messageBody];
      __int16 v11 = 2112;
      v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 command]);
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Sending FTMessage: %@ command %@ ", buf, 0x16u);
    }
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_829D0;
  v8[3] = &unk_D7DB0;
  v8[4] = a4;
  [a3 setCompletionBlock:v8];
  -[FTMessageDelivery sendMessage:](self->_messageDelivery, "sendMessage:", a3);
}

- (void)sendFTMessage:(id)a3 attempts:(unint64_t)a4 withCompletionBlock:(id)a5
{
  uint64_t v9 = IMOSLoggingEnabled(self, a2);
  if ((_DWORD)v9)
  {
    __int16 v11 = (os_log_s *)OSLogHandleForIMEventCategory("AttachmentRefreshDelivery");
    uint64_t v9 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if ((_DWORD)v9)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "sendFTMessage %@ attempts %lu ", buf, 0x16u);
    }
  }

  if (a5)
  {
    if (a3)
    {
      id v12 = -[IMLockdownManager isInternalInstall]( +[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"),  "isInternalInstall");
      if ((_DWORD)v12
        && (id v12 = (id)IMGetCachedDomainBoolForKey(@"com.apple.madrid", @"FailSendingFileRefreshMessage"),
            (_DWORD)v12))
      {
        if (IMOSLoggingEnabled(v12, v13))
        {
          v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "************* failed sending sticker refresh due to defaults being set. Please do defaults delete com.appl e.madrid FailSendingFileRefreshMessage to fix yourself",  buf,  2u);
          }
        }

        (*((void (**)(id, id, void, void))a5 + 2))(a5, a3, 0LL, 0LL);
      }

      else if (a4 > 1)
      {
        if (IMOSLoggingEnabled(v12, v13))
        {
          v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "AttachmentRefreshDeliveryController failed to refresh. Ran out of attempts",  buf,  2u);
          }
        }

        (*((void (**)(id, id, void, uint64_t))a5 + 2))(a5, a3, 0LL, 4LL);
      }

      else
      {
        *(void *)buf = 0LL;
        objc_initWeak((id *)buf, a3);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_83104;
        v18[3] = &unk_D7E00;
        v19[1] = (id)a4;
        v18[4] = self;
        objc_copyWeak(v19, (id *)buf);
        v18[5] = a5;
        -[AttachmentRefreshDeliveryController _sendFTMessage:withCompletionBlock:]( self,  "_sendFTMessage:withCompletionBlock:",  a3,  v18);
        objc_destroyWeak(v19);
        objc_destroyWeak((id *)buf);
      }
    }

    else
    {
      if (IMOSLoggingEnabled(v9, v10))
      {
        v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[AttachmentRefreshDeliveryController sendFTMessage:attempts:withCompletionBlock:]";
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "nil message sent to %s", buf, 0xCu);
        }
      }

      (*((void (**)(id, void, void, uint64_t))a5 + 2))(a5, 0LL, 0LL, 5LL);
    }
  }

  else if (IMOSLoggingEnabled(v9, v10))
  {
    v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "AttachmentRefreshDelivery invalid parameters passed to sendFTMessage. No completion block",  buf,  2u);
    }
  }

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end