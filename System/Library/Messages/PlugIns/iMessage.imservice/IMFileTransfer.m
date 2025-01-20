@interface IMFileTransfer
- (BOOL)shouldFastSend;
@end

@implementation IMFileTransfer

- (BOOL)shouldFastSend
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"should-not-fast-send"]);
  v6 = v4;
  if (v4 && (v4 = (__CFString *)-[__CFString BOOLValue](v4, "BOOLValue"), (_DWORD)v4))
  {
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("Attachments");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IMFileTransfer guid](self, "guid"));
        int v16 = 138412546;
        v17 = v9;
        __int16 v18 = 2112;
        v19 = v6;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Not fast sending transfer %@ due to server override %@",  (uint8_t *)&v16,  0x16u);
      }
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Attachments");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unsigned int v13 = -[IMFileTransfer isSticker](self, "isSticker");
        v14 = @"NO";
        if (v13) {
          v14 = @"YES";
        }
        int v16 = 138412546;
        v17 = v6;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "shouldFastSend serverbag %@,  isSticker %@",  (uint8_t *)&v16,  0x16u);
      }
    }

    unsigned __int8 v10 = -[IMFileTransfer isSticker](self, "isSticker");
  }

  return v10;
}

@end