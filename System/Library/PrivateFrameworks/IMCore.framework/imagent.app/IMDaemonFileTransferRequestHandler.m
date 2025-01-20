@interface IMDaemonFileTransferRequestHandler
- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5;
- (void)deleteFileTransferWithGUID:(id)a3;
- (void)downloadHighQualityVariantOfFileTransferWithGUID:(id)a3;
- (void)failTransferPreviewGeneration:(id)a3;
- (void)fileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7;
- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4;
- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)fileTransferRemoved:(id)a3;
- (void)fileTransferStopped:(id)a3;
- (void)fileTransfersRecoverablyDeleted:(id)a3;
- (void)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3;
- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4;
@end

@implementation IMDaemonFileTransferRequestHandler

- (void)deleteFileTransferWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfer");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Deleting attachment with guid %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  if ([v3 length])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
    uint64_t v8 = IMSingleObjectArray(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 deleteAttachmentsWithGUIDs:v9];
  }
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Transfers");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "File transfer: %@   created with properties: %@",  buf,  0x16u);
    }
  }

  if ([v5 length])
  {
    memset(buf, 0, 32);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
    v12 = v11;
    if (v11) {
      [v11 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    v16[0] = *(_OWORD *)buf;
    v16[1] = *(_OWORD *)&buf[16];
    [v15 _handleFileTransfer:v5 createdWithProperties:v6 withAuditToken:v16];
  }

  else if (IMOSLoggingEnabled(0LL, v10))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Empty guid passed to: fileTransfer:createdWithProperties:",  buf,  2u);
    }
  }
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v8 _handleFileTransfer:v5 updatedWithProperties:v6];
  }

  else
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_INFO,  "Empty guid passed to: fileTransfer:updatedWithProperties:",  v10,  2u);
    }
  }

LABEL_4:
}

- (void)fileTransfer:(id)a3 acceptedWithPath:(id)a4 autoRename:(BOOL)a5 overwrite:(BOOL)a6 options:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  if ([v11 length])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v14 _handleFileTransfer:v11 acceptedWithPath:v12 autoRename:v9 overwrite:v8 options:a7 postNotification:1];
  }

  else if (IMOSLoggingEnabled(0LL, v13))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("Warning");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Empty guid passed to: acceptedWithPath:",  v17,  2u);
    }
  }
}

- (void)fileTransferStopped:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v5 _handleFileTransferStopped:v3];
  }

  else
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("Warning");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "Empty guid passed to: fileTransferStopped:",  v7,  2u);
    }
  }

LABEL_4:
}

- (void)fileTransferRemoved:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v5 _handleFileTransferRemoved:v3];
  }

  else
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("Warning");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "Empty guid passed to: fileTransferRemoved:",  v7,  2u);
    }
  }

LABEL_4:
}

- (void)fileTransfersRecoverablyDeleted:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase database](&OBJC_CLASS___IMDDatabase, "database"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
    [v5 coreSpotlightDeleteAttachmentGUIDs:v6 reason:1005];
  }

  else
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("Warning");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_INFO,  "Empty guid passed to: fileTransfersRecoverabyDeleted:",  v8,  2u);
    }
  }

LABEL_4:
}

- (void)markAttachment:(id)a3 sender:(id)a4 recipients:(id)a5 isIncoming:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  LOBYTE(v6) = [v12 markAttachment:v9 sender:v10 recipients:v11 isIncoming:v6];

  if ((v6 & 1) == 0 && IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("Warning");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Failed to mark attachment %@",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)createItemForPHAssetWithUUID:(id)a3 parentChatItemGUID:(id)a4 chatGUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 chatWithGUID:v9]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageWithGUID:v8 registerAttachments:0]);

  if (v11 && v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMomentShareManager sharedInstance](&OBJC_CLASS___IMDMomentShareManager, "sharedInstance"));
    [v16 regenerateTransfersForMessage:v13 inChat:v11 addingAssetWithUUID:v7];
  }

  else
  {
    uint64_t v17 = IMOSLoggingEnabled(v14, v15);
    if ((_DWORD)v17)
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        v24 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Failure to regenerate transfers for chat: %@",  (uint8_t *)&v23,  0xCu);
      }
    }

    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory("Warning");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        v24 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Failure to regenerate transfers for message: %@",  (uint8_t *)&v23,  0xCu);
      }
    }
  }
}

- (void)downloadHighQualityVariantOfFileTransferWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "This feature is unimplemented", v6, 2u);
    }
  }
}

- (void)failTransferPreviewGeneration:(id)a3
{
}

- (void)successfullyGeneratedPreviewForTransfer:(id)a3 withPreviewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v8 = v7;
  id v9 = (void *)objc_opt_self(&OBJC_CLASS___IMDFileTransferCenter);
  id v10 = self;
  id v11 = [v9 sharedInstance];
  if (v11)
  {
    id v12 = v11;
    id v14 = String._bridgeToObjectiveC()();
    objc_msgSend(v12, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v14, width, height);

    swift_bridgeObjectRelease(v8, v13);
  }

  else
  {
    __break(1u);
  }

- (void)successfullyGeneratedPreviewForTransfer:(id)a3
{
}

@end