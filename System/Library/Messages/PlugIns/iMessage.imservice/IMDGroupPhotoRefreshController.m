@interface IMDGroupPhotoRefreshController
- (BOOL)shouldRefreshTTLForGroupPhoto:(id)a3 chatGUID:(id)a4;
- (IMDGroupPhotoRefreshController)initWithSession:(id)a3;
- (MessageServiceSession)session;
- (NSMutableSet)refreshRequests;
- (double)maxRefreshTime;
- (double)minRefreshTime;
- (id)attachmentRefreshDeliveryController;
- (void)dealloc;
- (void)refreshTTLForGroupPhoto:(id)a3 chat:(id)a4;
- (void)setRefreshRequests:(id)a3;
@end

@implementation IMDGroupPhotoRefreshController

- (IMDGroupPhotoRefreshController)initWithSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IMDGroupPhotoRefreshController;
  v5 = -[IMDGroupPhotoRefreshController init](&v9, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    refreshRequests = v5->_refreshRequests;
    v5->_refreshRequests = v6;

    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v5;
}

- (void)dealloc
{
  refreshRequests = self->_refreshRequests;
  self->_refreshRequests = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IMDGroupPhotoRefreshController;
  -[IMDGroupPhotoRefreshController dealloc](&v4, "dealloc");
}

- (id)attachmentRefreshDeliveryController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMDGroupPhotoRefreshController session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attachmentRefreshDeliveryController]);

  return v3;
}

- (BOOL)shouldRefreshTTLForGroupPhoto:(id)a3 chatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v9 = v7;
  if (!v6)
  {
    if (IMOSLoggingEnabled(v7, v8))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("IMDGroupPhotoRefreshController");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "not requesting group photo - no transfer", (uint8_t *)&v33, 2u);
      }

      goto LABEL_20;
    }

- (void)refreshTTLForGroupPhoto:(id)a3 chat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
  unsigned int v9 = -[IMDGroupPhotoRefreshController shouldRefreshTTLForGroupPhoto:chatGUID:]( self,  "shouldRefreshTTLForGroupPhoto:chatGUID:",  v6,  v8);

  if (v9)
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("IMDGroupPhotoRefreshController");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v45 = *(double *)&v6;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "requesting to refresh tll for group photo %@", buf, 0xCu);
      }
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"decryption-key"]);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"file-size"]);
      if (v16)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mmcs-owner"]);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mmcs-signature-hex"]);
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"mmcs-url"]);
            BOOL v20 = v19 != 0LL;
          }

          else
          {
            BOOL v20 = 0;
          }
        }

        else
        {
          BOOL v20 = 0;
        }
      }

      else
      {
        BOOL v20 = 0;
      }
    }

    else
    {
      BOOL v20 = 0;
    }

    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v6 refreshDate]);
    [v21 timeIntervalSinceDate:v22];
    double v24 = v23;

    id v25 = -[IMDGroupPhotoRefreshController maxRefreshTime](self, "maxRefreshTime");
    if (v24 <= v27 && v20)
    {
      double v29 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      BOOL v30 = objc_alloc_init(&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken);
      AttachmentRefreshUtilConfigureStickerToken(v30, v29);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMDGroupPhotoRefreshController refreshRequests](self, "refreshRequests"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
      [v31 addObject:v32];

      int v33 = (void *)objc_claimAutoreleasedReturnValue( -[IMDGroupPhotoRefreshController attachmentRefreshDeliveryController]( self,  "attachmentRefreshDeliveryController"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_66C64;
      v41[3] = &unk_D7498;
      v41[4] = self;
      id v42 = v7;
      id v43 = v6;
      [v33 sendFTMessage:v30 attempts:0 withCompletionBlock:v41];
    }

    else
    {
      if (IMOSLoggingEnabled(v25, v26))
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory("IMDGroupPhotoRefreshController");
        __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = @"NO";
          if (v20) {
            v36 = @"YES";
          }
          *(_DWORD *)buf = 134218242;
          double v45 = v24;
          __int16 v46 = 2112;
          v47 = v36;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "It's been a long time since a refresh has occurred, just re-send the transfer to everyone. timeSinceLastRefr esh: %f, canRefreshAsset: %@",  buf,  0x16u);
        }
      }

      double v29 = (void *)objc_claimAutoreleasedReturnValue(-[IMDGroupPhotoRefreshController session](self, "session"));
      BOOL v30 = (FTiMessageRequestMMCSFileRefreshToken *)objc_claimAutoreleasedReturnValue([v6 guid]);
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 chatIdentifier]);
      id v39 = [v7 style];
      v40 = (void *)objc_claimAutoreleasedReturnValue([v7 accountID]);
      [v29 sendGroupPhotoUpdate:v30 toChatID:v37 identifier:v38 style:v39 account:v40 isPhotoRefresh:1];
    }
  }
}

- (double)minRefreshTime
{
  uint64_t v2 = IMGetDomainIntForKey(@"com.apple.messages", @"GroupPhotoMinRefreshTime");
  double result = (double)v2;
  if (v2 <= 0) {
    return 864000.0;
  }
  return result;
}

- (double)maxRefreshTime
{
  uint64_t v2 = IMGetDomainIntForKey(@"com.apple.messages", @"GroupPhotoMaxRefreshTime");
  double result = (double)v2;
  if (v2 <= 0) {
    return 2160000.0;
  }
  return result;
}

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (NSMutableSet)refreshRequests
{
  return self->_refreshRequests;
}

- (void)setRefreshRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end