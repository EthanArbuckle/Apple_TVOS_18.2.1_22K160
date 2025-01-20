@interface MessageAttachmentController
+ (id)_capabilitiesForTransfers:(id)a3 supportsASTC:(BOOL)a4;
+ (id)_combinedTransferUserInfoForAttachmentSendContexts:(id)a3 transfer:(id)a4 message:(id)a5 commonCapabilities:(id)a6;
- (BOOL)_previewAttachmentEnabledForStickers;
- (BOOL)_shouldAutoAccept:(id)a3 transfer:(id)a4 isAltAccountDevice:(BOOL)a5 shouldDownloadFromPeer:(BOOL)a6;
- (BOOL)_shouldDisableFasterDownload:(id)a3 message:(id)a4;
- (BOOL)_shouldUploadPayloadDataOverMMCS:(id)a3;
- (BOOL)hasLocalDevice;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4;
- (BOOL)shouldSendLowResolutionOnly;
- (MessageAttachmentController)initWithSession:(id)a3;
- (NSMutableDictionary)eagerUploadStatuses;
- (NSMutableDictionary)localPayloadDataRequestGUIDToCompletionBlockMap;
- (NSMutableSet)pendingRemoteFileRequests;
- (double)_stickerUploadTTL;
- (id)_createPayloadRequestDictionaryForMessageGUID:(id)a3 requestKey:(id)a4;
- (id)_createPayloadResponseDictionaryWithDictionary:(id)a3 payloadData:(id)a4 attachments:(id)a5;
- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 forceAutoDownloadIfPossible:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 lqmEnabled:(BOOL)a7;
- (id)_fileHash:(id)a3;
- (id)_transferInfoFileForKey:(id)a3;
- (id)_transferInfoForKey:(id)a3;
- (id)attachmentRefreshDeliveryController;
- (id)deliveryController;
- (id)eagerUploadKeyForURL:(id)a3 sizes:(id)a4 transcodeDictionary:(id)a5 capabilities:(id)a6;
- (id)eagerUploadStatusForKey:(id)a3;
- (id)localDeviceProductVersion;
- (unint64_t)_maxCompressedPayloadDataLength;
- (void)_deleteTransferInfoForKey:(id)a3;
- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8;
- (void)_sendURL:(id)a3 urlToRemove:(id)a4 topic:(id)a5 sessionInfo:(id)a6 messageGUID:(id)a7 transferID:(id)a8 fileTransferGUID:(id)a9 attachmentSendContexts:(id)a10 failIfError:(BOOL)a11 sendStatus:(id)a12 attachmentStatus:(id)a13 group:(id)a14;
- (void)_setTransferInfo:(id)a3 key:(id)a4;
- (void)_transcodeURL:(id)a3 reason:(unint64_t)a4 transfer:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 sendStatus:(id)a8 urlGroup:(id)a9 didTranscode:(id)a10 handleURL:(id)a11;
- (void)downloadPayloadDataForMessageGUID:(id)a3 payLoadDictionary:(id)a4 topic:(id)a5 completionBlock:(id)a6;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)fetchPayloadDataFromCompanionForGUID:(id)a3 completionBlock:(id)a4;
- (void)findTranscoderCapabilitiesAcrossRecipients:(id)a3 forTransfers:(id)a4 completion:(id)a5;
- (void)handlePayloadDataRequest:(id)a3 attempts:(unint64_t)a4;
- (void)handlePayloadDataResponse:(id)a3;
- (void)handleTranscodeCompletionBlockForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 attemptedTranscode:(BOOL)a6 transcodedTransferGUIDs:(id)a7 containsAutoLoopVideo:(BOOL)a8 outputURLs:(id)a9 text:(id)a10 success:(BOOL)a11 error:(id)a12 completionBlock:(id)a13;
- (void)processDownloadedPayloadData:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8;
- (void)processMessageAttachmentDictionary:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8;
- (void)remoteFileResponse:(id)a3;
- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5;
- (void)retrieveAttachmentsForMessage:(id)a3 inlineAttachments:(id)a4 displayID:(id)a5 topic:(id)a6 comingFromStorage:(BOOL)a7 shouldForceAutoDownload:(BOOL)a8 senderContext:(id)a9 completionBlock:(id)a10;
- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 commonCapabilities:(id)a7 mode:(unint64_t)a8 sessionInfo:(id)a9 topic:(id)a10 completionBlock:(id)a11 uploadFailureBlock:(id)a12;
- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 mode:(unint64_t)a7 fromID:(id)a8 recipients:(id)a9 completionBlock:(id)a10 uploadFailureBlock:(id)a11;
- (void)sendFallbackAttachmentsForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 completionBlock:(id)a6;
- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 fromID:(id)a5 recipients:(id)a6 completionBlock:(id)a7;
- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 sessionInfo:(id)a5 topic:(id)a6 completionBlock:(id)a7;
- (void)sessionInfoForBusinessReceipients:(id)a3 fromID:(id)a4 completion:(id)a5;
- (void)setEagerUploadStatuses:(id)a3;
- (void)setLocalPayloadDataRequestGUIDToCompletionBlockMap:(id)a3;
- (void)setPendingRemoteFileRequests:(id)a3;
- (void)transcribeMessageIfNeeded:(id)a3 forTransfer:(id)a4 completion:(id)a5;
- (void)updateGroupPhoto:(id)a3 forChat:(id)a4 messageGuid:(id)a5;
@end

@implementation MessageAttachmentController

- (MessageAttachmentController)initWithSession:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MessageAttachmentController;
  v3 = -[MessageAttachmentController initWithSession:](&v10, "initWithSession:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v4 setWatchesScreenLightState:1];

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    localPayloadDataRequestGUIDToCompletionBlockMap = v3->_localPayloadDataRequestGUIDToCompletionBlockMap;
    v3->_localPayloadDataRequestGUIDToCompletionBlockMap = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    eagerUploadStatuses = v3->_eagerUploadStatuses;
    v3->_eagerUploadStatuses = v7;
  }

  return v3;
}

- (id)deliveryController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController msgSession](self, "msgSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deliveryController]);

  return v3;
}

- (id)attachmentRefreshDeliveryController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController msgSession](self, "msgSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attachmentRefreshDeliveryController]);

  return v3;
}

- (BOOL)hasLocalDevice
{
  return 0;
}

- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 lqmEnabled:(BOOL)a7
{
  return -[MessageAttachmentController _downloadRestrictionForUTIType:fileSize:qualityType:isSticker:forceAutoDownloadIfPossible:lqmEnabled:]( self,  "_downloadRestrictionForUTIType:fileSize:qualityType:isSticker:forceAutoDownloadIfPossible:lqmEnabled:",  a3,  a4,  a5,  a6,  0LL,  a7);
}

- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 forceAutoDownloadIfPossible:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v68 = a7;
  BOOL v9 = a6;
  id v12 = a3;
  v14 = v12;
  char v69 = 0;
  if (a5 == 1
    && !v8
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags")),
        unsigned int v16 = [v15 isHighQualityPhotosEnabled],
        v15,
        v16))
  {
    if (IMOSLoggingEnabled(v12, v13))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("Attachments");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Using high quality photo size limit for download.", buf, 2u);
      }
    }

    id v19 = +[IMDAttachmentUtilities modernHighQualityPhotoSizeLimit]( &OBJC_CLASS___IMDAttachmentUtilities,  "modernHighQualityPhotoSizeLimit");
  }

  else
  {
    if (IMOSLoggingEnabled(v12, v13))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("Attachments");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "*Not* using high quality photo size limit for download", buf, 2u);
      }
    }

    id v19 = +[IMDAttachmentUtilities largeFileSizeFor:allowedLargerRepresentation:]( &OBJC_CLASS___IMDAttachmentUtilities,  "largeFileSizeFor:allowedLargerRepresentation:",  v14,  &v69);
  }

  unint64_t v22 = (unint64_t)v19;
  unint64_t v23 = (unint64_t)+[IMDAttachmentUtilities freeSpaceInHomeDirectory]( &OBJC_CLASS___IMDAttachmentUtilities,  "freeSpaceInHomeDirectory");
  id v24 = +[IMDAttachmentUtilities minimumFreeSpace](&OBJC_CLASS___IMDAttachmentUtilities, "minimumFreeSpace");
  if (v23 < (unint64_t)v24 || (double)a4 + (double)a4 > (double)v23)
  {
    if (IMOSLoggingEnabled(v24, v25))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("Attachments");
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v71 = v23;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Not enough free space to download: %llu", buf, 0xCu);
      }
    }

    if (v69) {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction noSpaceForHighQualityLimit:qualityType:isSticker:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "noSpaceForHighQualityLimit:qualityType:isSticker:lqmEnabled:",  v22,  a5,  v9,  v8));
    }
    else {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction noSpaceForLowQualityLimit:qualityType:isSticker:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "noSpaceForLowQualityLimit:qualityType:isSticker:lqmEnabled:",  v22,  a5,  v9,  v8));
    }
    goto LABEL_23;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  if ([v31 isInternalInstall])
  {
    int v32 = IMGetCachedDomainBoolForKey(@"com.apple.imessage", @"AlwaysAutoDownloadAttachments");

    if (v32)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction restrictionAllowedBySettingWithQualityType:isSticker:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "restrictionAllowedBySettingWithQualityType:isSticker:lqmEnabled:",  a5,  v9,  v8));
LABEL_23:
      v29 = (void *)v28;
      goto LABEL_24;
    }
  }

  else
  {
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  if ([v33 isInternalInstall])
  {
    int v34 = IMGetCachedDomainBoolForKey(@"com.apple.imessage", @"NeverAutoDownloadAttachments");

    if (v34)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction restrictionDisallowedBySettingWithQualityType:isSticker:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "restrictionDisallowedBySettingWithQualityType:isSticker:lqmEnabled:",  a5,  v9,  v8));
      goto LABEL_23;
    }
  }

  else
  {
  }

  if (v69) {
    uint64_t v37 = 1LL;
  }
  else {
    uint64_t v37 = 2LL;
  }
  uint64_t v38 = IMOSLoggingEnabled(v35, v36);
  if ((_DWORD)v38)
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory("Attachments");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Should auto download:", buf, 2u);
    }
  }

  uint64_t v42 = IMOSLoggingEnabled(v38, v39);
  if ((_DWORD)v42)
  {
    uint64_t v44 = OSLogHandleForIMFoundationCategory("Attachments");
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v71 = a4 >> 10;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "           File Size: %lld kb", buf, 0xCu);
    }
  }

  uint64_t v46 = IMOSLoggingEnabled(v42, v43);
  if ((_DWORD)v46)
  {
    uint64_t v48 = OSLogHandleForIMFoundationCategory("Attachments");
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v71 = v23 >> 10;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "          Free Space: %lld kb", buf, 0xCu);
    }
  }

  uint64_t v50 = IMOSLoggingEnabled(v46, v47);
  if ((_DWORD)v50)
  {
    uint64_t v52 = OSLogHandleForIMFoundationCategory("Attachments");
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v71 = v22 >> 10;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "    Max Size Allowed: %lld kb", buf, 0xCu);
    }
  }

  uint64_t v54 = IMOSLoggingEnabled(v50, v51);
  if ((_DWORD)v54)
  {
    uint64_t v56 = OSLogHandleForIMFoundationCategory("Attachments");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      if (v69) {
        v58 = @"YES";
      }
      else {
        v58 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v71 = (unint64_t)v58;
      _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "        Was HQ limit: %@", buf, 0xCu);
    }
  }

  if (IMOSLoggingEnabled(v54, v55))
  {
    uint64_t v59 = OSLogHandleForIMFoundationCategory("Attachments");
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      v61 = @"NO";
      if (v68) {
        v61 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v71 = (unint64_t)v61;
      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "Should Force Auto Download: %@", buf, 0xCu);
    }
  }

  if (v68) {
    uint64_t v62 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction restrictionForceAllowedWithQualityType:isSticker:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "restrictionForceAllowedWithQualityType:isSticker:lqmEnabled:",  a5,  v9,  v8));
  }
  else {
    uint64_t v62 = objc_claimAutoreleasedReturnValue( +[AttachmentDownloadRestriction restrictionWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( &OBJC_CLASS___AttachmentDownloadRestriction,  "restrictionWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  v37,  v22,  a5,  v9,  v22 > a4,  v8));
  }
  v29 = (void *)v62;
  if (IMOSLoggingEnabled(v62, v63))
  {
    uint64_t v64 = OSLogHandleForIMFoundationCategory("Attachments");
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      unsigned int v66 = [v29 allowDownload];
      v67 = @"NO";
      if (v66) {
        v67 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v71 = (unint64_t)v67;
      _os_log_impl(&dword_0, v65, OS_LOG_TYPE_INFO, "  Download Restriction Result: %@", buf, 0xCu);
    }
  }

- (BOOL)_previewAttachmentEnabledForStickers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"disableStickerPreviewSize"]);
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled]( &OBJC_CLASS___IMDAttachmentUtilities,  "isPreviewAttachmentSizeEnabled");
  }
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("_previewAttachmentEnabledForStickers");
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Not enabling preview size for sticker", v10, 2u);
    }
  }

  return 0;
}

- (double)_stickerUploadTTL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"fast-transfer-ttl"]);
  int v5 = IMOSLoggingEnabled(v3, v4);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        [v3 doubleValue];
        int v14 = 134217984;
        uint64_t v15 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Server bag MMCS parameter TTL %f", (uint8_t *)&v14, 0xCu);
      }
    }

    [v3 doubleValue];
    double v10 = v9;
  }

  else
  {
    double v10 = 2160000.0;
    if (v5)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Attachments");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        uint64_t v15 = 0x41407AC000000000LL;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "No server bag MMCS parameter TTL set. Using default value %f",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  return v10;
}

- (id)_transferInfoFileForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IMStickerTransferInfoDirectoryURL();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByExpandingTildeInPath]);

  IMSharedHelperEnsureDirectoryExistsAtPath(v8);
  if (-[MessageAttachmentController _previewAttachmentEnabledForStickers](self, "_previewAttachmentEnabledForStickers"))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@"-preview"]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);

    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("AttachmentRefresh");
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v10;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "_transferInfoFileForKey _previewAttachmentEnabled computed file name %@ ",  (uint8_t *)&v18,  0xCu);
      }
    }
  }

  else
  {
    double v10 = v4;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v10]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathExtension:@"plist"]);

  return v16;
}

- (void)_setTransferInfo:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v9 = v7;
  if (v6 && v7)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController _transferInfoFileForKey:](self, "_transferInfoFileForKey:", v7));
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v10;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_setTransferInfo plistFilePath %@", buf, 0xCu);
      }
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v15 = [v14 fileExistsAtPath:v10 isDirectory:0];

    if (v15)
    {
      if (IMOSLoggingEnabled(v16, v17))
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory("Attachments");
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v10;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "transferUserInfo plist already present at path %@", buf, 0xCu);
        }
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v38 = 0LL;
      [v20 removeItemAtPath:v10 error:&v38];
      id v21 = v38;

      if (v21 && IMOSLoggingEnabled(v22, v23))
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v10;
          __int16 v41 = 2112;
          id v42 = v21;
          _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Attachments could not delete file at path %@, error %@",  buf,  0x16u);
        }
      }
    }

    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("Attachments");
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "_setTransferInfo key:%@ transferInfo:%@", buf, 0x16u);
      }
    }

    [v6 writeToFile:v10 atomically:1];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  NSFileProtectionCompleteUntilFirstUserAuthentication,  NSFileProtectionKey,  0LL));
    id v37 = 0LL;
    [v28 setAttributes:v29 ofItemAtPath:v10 error:&v37];
    id v30 = v37;

    if (v30 && IMOSLoggingEnabled(v31, v32))
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory("Warning");
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v10;
        __int16 v41 = 2112;
        id v42 = v30;
        _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Attachments could not make class C for file at path %@ error %@",  buf,  0x16u);
      }
    }
  }

  else if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v35 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v9;
      _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "_setTransferInfo invalid parameters. transferUserInfo %@, userInfoKey %@",  buf,  0x16u);
    }
  }
}

- (id)_transferInfoForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController _transferInfoFileForKey:](self, "_transferInfoFileForKey:", v5));
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory("Attachments");
      double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "_transferInfoForKey plistFilePath %@", (uint8_t *)&v17, 0xCu);
      }
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412546;
        id v18 = v5;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_transferInfoForKey key:%@ object:%@", (uint8_t *)&v17, 0x16u);
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(0LL, v4))
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Attachments nil key passed to _transferInfoForKey ",  (uint8_t *)&v17,  2u);
      }
    }

    double v10 = 0LL;
  }

  return v10;
}

- (void)_deleteTransferInfoForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController _transferInfoFileForKey:](self, "_transferInfoFileForKey:", v5));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v17 = 0LL;
    [v7 removeItemAtPath:v6 error:&v17];
    id v8 = v17;

    int v11 = IMOSLoggingEnabled(v9, v10);
    if (v8)
    {
      if (v11)
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v19 = v6;
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "_deleteTransferInfoForKey failed to delete file at path %@ error %@",  buf,  0x16u);
        }

- (id)_fileHash:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = IMSharedHelperMD5HashOfFileAtPath(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (IMOSLoggingEnabled(v7, v8))
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412546;
        unsigned int v15 = v5;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "filePath %@ fileHash %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(0LL, v4))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "nil filePath to _fileHash", (uint8_t *)&v14, 2u);
      }
    }

    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)updateGroupPhoto:(id)a3 forChat:(id)a4 messageGuid:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 groupPhotoGuid]);
  if (IMOSLoggingEnabled(v10, v11))
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("Attachments_GroupPhoto");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v40 = v10;
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 2112;
      id v44 = v8;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Updating group photo from %@ to %@ for chat %@", buf, 0x20u);
    }
  }

  uint64_t v14 = IMSharedHelperAreObjectsLogicallySame(v7, v10);
  if ((v14 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v14, v15))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("Attachments");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => Failed to update", buf, 2u);
      }
    }
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 transferForGUID:v7]);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);
    [v20 storeAttachment:v19 associateWithMessageWithGUID:v9 chatGUID:v21 storeAtExternalLocation:1];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 chatIdentifier]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allExistingChatsWithIdentifier:style:", v23, objc_msgSend(v8, "style")));

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
    [v25 deleteAttachmentWithGUID:v10];

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v26 = v24;
    id v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v35;
      do
      {
        v29 = 0LL;
        do
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)v29), "updateGroupPhotoGuid:", v7, (void)v34);
          v29 = (char *)v29 + 1;
        }

        while (v27 != v29);
        id v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v27);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v30 removeTransferForGUID:v10];

    [v8 updateGroupPhotoUploadFailureCount:0];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    [v31 updateFaceTimeGroupPhoto:v8];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IMSafetyMonitorCoordinator sharedCoordinator]( &OBJC_CLASS___IMSafetyMonitorCoordinator,  "sharedCoordinator"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
    [v32 informOfChangedGroupPhoto:v33];
  }
}

+ (id)_combinedTransferUserInfoForAttachmentSendContexts:(id)a3 transfer:(id)a4 message:(id)a5 commonCapabilities:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
  if ([v13 length])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
    char IsBusinessID = IMStringIsBusinessID(v14);
  }

  else
  {
    char IsBusinessID = 0;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingComparator:&stru_D6930]);
  id v17 = v16;
  id v18 = v17;
  if ((unint64_t)[v17 count] >= 2)
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 lastObject]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, (char *)objc_msgSend(v17, "count") - 1));
    __int128 v36 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v21 arrayByAddingObjectsFromArray:v20]);
  }

  unsigned __int8 v22 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:]( &OBJC_CLASS___IMDAttachmentUtilities,  "shouldEnablePreviewTranscodingQualityForTransfer:isSending:",  v11,  1LL);
  uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 type]);

  BOOL v24 = UTTypeConformsTo(v23, kUTTypeImage) != 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_4B77C;
  v30[3] = &unk_D6958;
  unsigned __int8 v33 = v22;
  BOOL v34 = v24;
  char v35 = IsBusinessID;
  id v31 = v10;
  uint64_t v25 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  5 * (void)[v18 count]);
  uint64_t v32 = v25;
  id v26 = v10;
  [v18 enumerateObjectsUsingBlock:v30];
  id v27 = v32;
  uint64_t v28 = v25;

  return v28;
}

- (id)eagerUploadKeyForURL:(id)a3 sizes:(id)a4 transcodeDictionary:(id)a5 capabilities:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a3 path]);
  uint64_t v13 = IMSharedHelperMD5HashOfFileAtPath(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v10 && [v10 count])
  {
    uint64_t v15 = IMSharedHelperMD5HashPlist(v10);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v16]);

    uint64_t v14 = (void *)v17;
  }

  if (v11 && [v11 count])
  {
    uint64_t v18 = IMSharedHelperMD5HashPlist(v11);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v19]);

    uint64_t v14 = (void *)v20;
  }

  if ([v9 count])
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v29 = v9;
    id v21 = v9;
    id v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        uint64_t v25 = 0LL;
        id v26 = v14;
        do
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v30 + 1) + 8 * (void)v25) stringValue]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingFormat:@"-%@", v27]);

          uint64_t v25 = (char *)v25 + 1;
          id v26 = v14;
        }

        while (v23 != v25);
        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v23);
    }

    id v9 = v29;
  }

  return v14;
}

- (id)eagerUploadStatusForKey:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v6 = v5;
  if (v5 > *(double *)&qword_E4510)
  {
    *(double *)&qword_E4510 = v5 + 3600.0;
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    eagerUploadStatuses = self->_eagerUploadStatuses;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = sub_4BD10;
    uint64_t v15 = &unk_D6980;
    double v17 = v6;
    uint64_t v16 = v7;
    id v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( eagerUploadStatuses,  "enumerateKeysAndObjectsUsingBlock:",  &v12);
    -[NSMutableDictionary removeObjectsForKeys:]( self->_eagerUploadStatuses,  "removeObjectsForKeys:",  v9,  v12,  v13,  v14,  v15);
  }

  if (v4) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_eagerUploadStatuses,  "objectForKeyedSubscript:",  v4));
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (void)eagerUploadCancel:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  eagerUploadStatuses = self->_eagerUploadStatuses;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_4BEC8;
  v9[3] = &unk_D69A8;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( eagerUploadStatuses,  "enumerateKeysAndObjectsUsingBlock:",  v9);
  -[NSMutableDictionary removeObjectsForKeys:](self->_eagerUploadStatuses, "removeObjectsForKeys:", v7);
}

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[IMCTSMSUtilities IMIsEagerUploadEnabledForPhoneNumber:simID:]( &OBJC_CLASS___IMCTSMSUtilities,  "IMIsEagerUploadEnabledForPhoneNumber:simID:",  0LL,  0LL))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___IMFileTransfer);
    -[IMFileTransfer _updateWithDictionaryRepresentation:](v8, "_updateWithDictionaryRepresentation:", v6);
    -[IMFileTransfer _setNeedsWrapper:](v8, "_setNeedsWrapper:", 0LL);
    if ((-[IMFileTransfer appMessageFallbackImage](v8, "appMessageFallbackImage") & 1) != 0
      || (-[IMFileTransfer isRecipeBasedSticker](v8, "isRecipeBasedSticker") & 1) != 0
      || -[IMFileTransfer shouldFastSend](v8, "shouldFastSend")
      || (-[IMFileTransfer isDirectory](v8, "isDirectory") & 1) != 0)
    {
      unsigned int v9 = 1;
    }

    else if (-[IMFileTransfer isAuxVideo](v8, "isAuxVideo"))
    {
      unsigned int v9 = +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled]( &OBJC_CLASS___IMDAttachmentUtilities,  "isPreviewAttachmentSizeEnabled");
    }

    else
    {
      unsigned int v9 = 0;
    }

    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IMFileTransfer type](v8, "type"));
    unint64_t v11 = UTTypeConformsTo(v10, kUTTypeImage);
    if ((_DWORD)v11 || (unint64_t v11 = UTTypeConformsTo(v10, kUTTypeMovie), (_DWORD)v11))
    {
      if (v9) {
        goto LABEL_10;
      }
    }

    else
    {
      unint64_t v11 = (unint64_t)-[IMFileTransfer totalBytes](v8, "totalBytes");
      if (v11 > 0x1E00000) {
        char v15 = 1;
      }
      else {
        char v15 = v9;
      }
      if ((v15 & 1) != 0)
      {
LABEL_10:
        if (IMOSLoggingEnabled(v11, v12))
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory("Attachments");
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "EAGER skip: policy", buf, 2u);
          }
        }

        goto LABEL_19;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAttachmentUtilities fetchSizeLimitsForTransfer:mode:]( &OBJC_CLASS___IMDAttachmentUtilities,  "fetchSizeLimitsForTransfer:mode:",  v8,  0LL));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    id v18 = [v17 integerValue];

    *(void *)buf = 0LL;
    __int128 v37 = buf;
    uint64_t v38 = 0x3032000000LL;
    uint64_t v39 = sub_4C558;
    id v40 = sub_4C568;
    id v41 = 0LL;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_4C570;
    v29[3] = &unk_D6A20;
    v29[4] = self;
    id v19 = v16;
    id v30 = v19;
    uint64_t v20 = v8;
    BOOL v34 = buf;
    id v35 = v18;
    __int128 v31 = v20;
    __int128 v32 = @"com.apple.madrid";
    __int128 v33 = @"EAGER";
    id v21 = objc_retainBlock(v29);
    id v42 = v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_4D280;
    v24[3] = &unk_D6A48;
    id v25 = v7;
    uint64_t v28 = buf;
    id v26 = v20;
    id v23 = v21;
    id v27 = v23;
    -[MessageAttachmentController findTranscoderCapabilitiesAcrossRecipients:forTransfers:completion:]( self,  "findTranscoderCapabilitiesAcrossRecipients:forTransfers:completion:",  v25,  v22,  v24);

    _Block_object_dispose(buf, 8);
LABEL_19:
  }
}

- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 mode:(unint64_t)a7 fromID:(id)a8 recipients:(id)a9 completionBlock:(id)a10 uploadFailureBlock:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v42 = a6;
  id v43 = a8;
  id v18 = a9;
  id v19 = a10;
  id v45 = a11;
  uint64_t v20 = IMGetCachedDomainIntForKeyWithDefaultValue(@"com.apple.madrid", @"failUploadAfterTime", 0LL);
  id v40 = v16;
  id v41 = v17;
  id v44 = v18;
  if (v20 < 1)
  {
    BOOL v38 = a4;
    uint64_t v63 = 0LL;
    uint64_t v64 = (os_activity_scope_state_s *)&v63;
    uint64_t v65 = 0x3010000000LL;
    uint64_t v67 = 0LL;
    uint64_t v68 = 0LL;
    unsigned int v66 = &unk_BF2CB;
    id v22 = _os_activity_create( &dword_0,  "com.apple.messages.MessageAttachmentUploads",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v22, v64 + 2);
    id v35 = v22;
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "__im_canonicalIDSIDsFromAddresses"));
    uint64_t v23 = IMServiceNameForCanonicalIDSAddresses();
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v37 = self;
    id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v16 fileTransferGUIDs]);
    id v27 = [v26 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v60 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 transferForGUID:v30]);

          if (v32) {
            BOOL v33 = v25 != 0LL;
          }
          else {
            BOOL v33 = 0;
          }
          if (v33) {
            CFArrayAppendValue((CFMutableArrayRef)v25, v32);
          }
        }

        id v27 = [v26 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }

      while (v27);
    }

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_4D908;
    v46[3] = &unk_D6AE8;
    uint64_t v56 = &v63;
    id v54 = v19;
    id v34 = v24;
    id v47 = v34;
    uint64_t v48 = v37;
    id v49 = v44;
    id v50 = v43;
    id v51 = v40;
    BOOL v58 = v38;
    id v52 = v41;
    id v53 = v42;
    unint64_t v57 = a7;
    id v55 = v45;
    -[MessageAttachmentController findTranscoderCapabilitiesAcrossRecipients:forTransfers:completion:]( v37,  "findTranscoderCapabilitiesAcrossRecipients:forTransfers:completion:",  v49,  v25,  v46);

    _Block_object_dispose(&v63, 8);
  }

  else
  {
    double v21 = (double)v20;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_4D8E8;
    v69[3] = &unk_D6A70;
    id v72 = v19;
    id v70 = v16;
    id v71 = v17;
    im_dispatch_after(v69, v21);
  }
}

- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 commonCapabilities:(id)a7 mode:(unint64_t)a8 sessionInfo:(id)a9 topic:(id)a10 completionBlock:(id)a11 uploadFailureBlock:(id)a12
{
  BOOL v147 = a4;
  id v15 = a3;
  v129 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v128 = a6;
  id v140 = a7;
  id v139 = a9;
  id v138 = a10;
  v130 = (void (**)(id, id, id, id, uint64_t, void))a11;
  id v141 = a12;
  v153 = v15;
  v146 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
  id v16 = v15;
  id v17 = [v15 isTypingMessage];
  if ((v17 & 1) == 0 && IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Attachments");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v15 fileTransferGUIDs]);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v213 = v129;
      LOWORD(v214) = 2048;
      *(void *)((char *)&v214 + 2) = a8;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Processing file transfers: %@ (Message: %@   to: %@) mode=%llu",  buf,  0x2Au);
    }

    id v16 = v15;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 fileTransferGUIDs]);
  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v210 = 0u;
  __int128 v211 = 0u;
  __int128 v208 = 0u;
  __int128 v209 = 0u;
  id obj = v22;
  id v24 = [obj countByEnumeratingWithState:&v208 objects:v220 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v209;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v209 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v208 + 1) + 8LL * (void)i);
        if (v23 && v27) {
          CFArrayAppendValue((CFMutableArrayRef)v23, *(const void **)(*((void *)&v208 + 1) + 8LL * (void)i));
        }
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 transferForGUID:v27]);

        id v30 = [v29 isAuxImage];
        if ((_DWORD)v30
          && (id v30 = +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled]( &OBJC_CLASS___IMDAttachmentUtilities,  "isPreviewAttachmentSizeEnabled"),  (v30 & 1) == 0))
        {
          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[IMFileTransfer AuxGUIDFromFileTransferGUID:]( &OBJC_CLASS___IMFileTransfer,  "AuxGUIDFromFileTransferGUID:",  v27));
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
          BOOL v38 = (void *)objc_claimAutoreleasedReturnValue([v37 transferForGUID:v36]);

          int v41 = IMOSLoggingEnabled(v39, v40);
          if (v38)
          {
            if (v41)
            {
              uint64_t v42 = OSLogHandleForIMFoundationCategory("Attachments");
              id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v36;
                _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Adding Aux video to list of transfer %@", buf, 0xCu);
              }
            }

            if (v23 && v36) {
              CFArrayAppendValue((CFMutableArrayRef)v23, v36);
            }
          }

          else if (v41)
          {
            uint64_t v44 = OSLogHandleForIMFoundationCategory("Warning");
            id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v36;
              _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "Attachment expected to find transfer for Aux video %@ . But we did not find transfer",  buf,  0xCu);
            }
          }
        }

        else
        {
          if (IMOSLoggingEnabled(v30, v31))
          {
            uint64_t v32 = OSLogHandleForIMFoundationCategory("Attachments");
            BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              unsigned int v34 = +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled]( &OBJC_CLASS___IMDAttachmentUtilities,  "isPreviewAttachmentSizeEnabled");
              id v35 = @"NO";
              if (v34) {
                id v35 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v35;
              _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "Not an Aux image or low quality image on %@. Moving on",  buf,  0xCu);
            }
          }

          [v29 setIsAuxImage:0];
          [v29 setAuxStateWasDowngraded:1];
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v208 objects:v220 count:16];
    }

    while (v24);
  }

  id v46 = [v15 isTypingMessage];
  if ((v46 & 1) == 0 && IMOSLoggingEnabled(v46, v47))
  {
    uint64_t v48 = OSLogHandleForIMFoundationCategory("Attachments");
    id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "File transfer guids to process %@", buf, 0xCu);
    }
  }

  id v50 = (void *)objc_claimAutoreleasedReturnValue([v15 balloonBundleID]);
  unsigned int v51 = [v50 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  if (-[NSMutableArray count](v23, "count")) {
    int v52 = v51;
  }
  else {
    int v52 = 1;
  }
  if (v52 == 1)
  {
    if (v51 && (id v53 = -[NSMutableArray count](v23, "count")) != 0LL)
    {
      uint64_t v55 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        id v57 = -[NSMutableArray count](v23, "count");
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v57;
        _os_log_impl( &dword_0,  v56,  OS_LOG_TYPE_INFO,  "Skipping %tu file transfers due to payload attachments.",  buf,  0xCu);
      }
    }

    else
    {
      id v92 = [v15 isTypingMessage];
      if ((v92 & 1) != 0 || !IMOSLoggingEnabled(v92, v93))
      {
LABEL_99:
        if (v130) {
          v130[2](v130, v15, v129, v128, 1LL, 0LL);
        }
        goto LABEL_147;
      }

      uint64_t v94 = OSLogHandleForIMFoundationCategory("Attachments");
      uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "No file transfers, just continuing", buf, 2u);
      }
    }

    goto LABEL_99;
  }

  __int128 v206 = 0u;
  __int128 v207 = 0u;
  __int128 v204 = 0u;
  __int128 v205 = 0u;
  BOOL v58 = (void *)objc_claimAutoreleasedReturnValue([v15 fileTransferGUIDs]);
  id v59 = [v58 countByEnumeratingWithState:&v204 objects:v219 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v205;
    char v61 = 1;
    do
    {
      for (j = 0LL; j != v59; j = (char *)j + 1)
      {
        if (*(void *)v205 != v60) {
          objc_enumerationMutation(v58);
        }
        uint64_t v63 = *(void *)(*((void *)&v204 + 1) + 8LL * (void)j);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v64 transferForGUID:v63]);

        else {
          [v65 setAppMessageFallbackImage:0];
        }
      }

      id v59 = [v58 countByEnumeratingWithState:&v204 objects:v219 count:16];
    }

    while (v59);

    if ((v61 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v66, v67))
      {
        uint64_t v68 = OSLogHandleForIMFoundationCategory("Attachments");
        char v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v146;
          _os_log_impl(&dword_0, v69, OS_LOG_TYPE_INFO, "Uploading attachments for app msg %@", buf, 0xCu);
        }
      }

      v152 = objc_alloc_init(&OBJC_CLASS___MessageAttachmentOverallStatus);
      -[MessageAttachmentOverallStatus setError:](v152, "setError:", 0LL);
      -[MessageAttachmentOverallStatus setFailed:](v152, "setFailed:", 0LL);
      v154 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      group = dispatch_group_create();
      if (v147)
      {
        CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v128 mutableCopy];
        CFMutableDictionaryRef v142 = Mutable;
        if (!Mutable)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFMutableDictionaryRef v142 = Mutable;
        }

        if (IMOSLoggingEnabled(Mutable, v71))
        {
          uint64_t v72 = OSLogHandleForIMFoundationCategory("Attachments");
          v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            id v74 = -[NSMutableArray count](v23, "count");
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v74;
            _os_log_impl( &dword_0,  v73,  OS_LOG_TYPE_INFO,  "We can send inline. Trying to inline %lu transfers.",  buf,  0xCu);
          }
        }

        __int128 v202 = 0u;
        __int128 v203 = 0u;
        __int128 v200 = 0u;
        __int128 v201 = 0u;
        v137 = v23;
        id v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v137,  "countByEnumeratingWithState:objects:count:",  &v200,  v218,  16LL);
        if (v75)
        {
          dispatch_group_t v144 = 0LL;
          uint64_t v148 = *(void *)v201;
          do
          {
            for (k = 0LL; k != v75; k = (char *)k + 1)
            {
              if (*(void *)v201 != v148) {
                objc_enumerationMutation(v137);
              }
              uint64_t v77 = *(void *)(*((void *)&v200 + 1) + 8LL * (void)k);
              v79 = (void *)objc_claimAutoreleasedReturnValue([v154 transferForGUID:v77]);
              if (v79)
              {
                dispatch_group_enter(group);
                v80 = (void *)objc_claimAutoreleasedReturnValue([v79 localURL]);
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v80));

                [v79 _setNeedsWrapper:0];
                [v154 startTransfer:v77];
                v82 = (void *)objc_claimAutoreleasedReturnValue([v153 accountID]);
                v83 = (void *)objc_claimAutoreleasedReturnValue([v153 handle]);
                if (v83)
                {
                  v84 = (void *)objc_claimAutoreleasedReturnValue([v153 handle]);
                  [v154 assignTransfer:v77 toAccount:v82 otherPerson:v84];
                }

                else
                {
                  [v154 assignTransfer:v77 toAccount:v82 otherPerson:0];
                }

                v190[0] = _NSConcreteStackBlock;
                v190[1] = 3221225472LL;
                v190[2] = sub_4F098;
                v190[3] = &unk_D6B10;
                id v191 = v81;
                id v87 = v79;
                id v192 = v87;
                v199 = (char *)k + (void)v144;
                id v193 = v146;
                id v194 = v154;
                uint64_t v195 = v77;
                v196 = v142;
                v197 = v152;
                v198 = group;
                id v88 = v81;
                -[MessageAttachmentController transcribeMessageIfNeeded:forTransfer:completion:]( self,  "transcribeMessageIfNeeded:forTransfer:completion:",  v153,  v87,  v190);
              }

              else
              {
                if (IMOSLoggingEnabled(0LL, v78))
                {
                  uint64_t v85 = OSLogHandleForIMFoundationCategory("Warning");
                  v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v77;
                    _os_log_impl(&dword_0, v86, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
                  }
                }

                -[MessageAttachmentOverallStatus setFailed:](v152, "setFailed:", 1LL);
                -[MessageAttachmentOverallStatus setError:](v152, "setError:", 34LL);
              }
            }

            id v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v137,  "countByEnumeratingWithState:objects:count:",  &v200,  v218,  16LL);
            dispatch_group_t v144 = (dispatch_group_t)((char *)k + (void)v144);
          }

          while (v75);
        }

        uint64_t v89 = im_primary_queue();
        v90 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v89);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_4F298;
        block[3] = &unk_D6B38;
        v184 = v137;
        v185 = v152;
        v189 = v130;
        id v186 = v153;
        v187 = v129;
        CFMutableDictionaryRef v188 = v142;
        v91 = v142;
        dispatch_group_notify(group, v90, block);
      }

      else
      {
        v135 = objc_alloc_init(&OBJC_CLASS___NSFileCoordinator);
        uint64_t v97 = kAttachmentsAutomationMilestoneBeginSendingMessage;
        v216[0] = kAttachmentsAutomationTransferGUIDsKey;
        v216[1] = kAttachmentsAutomationMessageGUIDKey;
        v98 = (NSMutableArray *)&__NSArray0__struct;
        if (v23) {
          v98 = v23;
        }
        v217[0] = v98;
        v217[1] = v146;
        v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v217,  v216,  2LL));
        AttachmentsAutomationLogMilestoneWithOptionFlags(v146, v97, v99, 1LL);

        __int128 v181 = 0u;
        __int128 v182 = 0u;
        __int128 v179 = 0u;
        __int128 v180 = 0u;
        v132 = v23;
        id v143 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v132,  "countByEnumeratingWithState:objects:count:",  &v179,  v215,  16LL);
        if (v143)
        {
          char v100 = 0;
          uint64_t v134 = *(void *)v180;
          do
          {
            for (m = 0LL; m != v143; m = (char *)m + 1)
            {
              if (*(void *)v180 != v134) {
                objc_enumerationMutation(v132);
              }
              uint64_t v102 = *(void *)(*((void *)&v179 + 1) + 8LL * (void)m);
              v103 = (void *)objc_claimAutoreleasedReturnValue([v154 transferForGUID:v102]);
              v164[0] = _NSConcreteStackBlock;
              v164[1] = 3221225472LL;
              v164[2] = sub_4F3E4;
              v164[3] = &unk_D6C78;
              id v104 = v103;
              id v165 = v104;
              id v166 = v146;
              id v105 = v154;
              id v167 = v105;
              uint64_t v168 = v102;
              dispatch_group_t v145 = group;
              dispatch_group_t v169 = v145;
              v170 = self;
              v149 = v152;
              v171 = v149;
              unint64_t v178 = a8;
              id v172 = v140;
              id v106 = v153;
              id v173 = v106;
              id v177 = v141;
              id v174 = v138;
              id v175 = v139;
              v133 = v135;
              v176 = v133;
              v107 = objc_retainBlock(v164);
              int v109 = IMOSLoggingEnabled(v107, v108);
              if (v104)
              {
                if (v109)
                {
                  uint64_t v110 = OSLogHandleForIMFoundationCategory("Attachments");
                  v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                  {
                    id v112 = (id)objc_claimAutoreleasedReturnValue([v104 guid]);
                    unsigned int v113 = [v104 isAuxImage];
                    v114 = @"NO";
                    if (v113) {
                      v114 = @"YES";
                    }
                    v131 = v114;
                    unsigned int v115 = [v104 isSticker];
                    unsigned int v116 = [v104 isAnimojiV2];
                    *(_DWORD *)buf = 138413058;
                    v117 = @"NO";
                    if (v115) {
                      v118 = @"YES";
                    }
                    else {
                      v118 = @"NO";
                    }
                    *(void *)&uint8_t buf[4] = v112;
                    if (v116) {
                      v117 = @"YES";
                    }
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v131;
                    *(_WORD *)&buf[22] = 2112;
                    v213 = (uint64_t (*)(uint64_t, uint64_t))v118;
                    LOWORD(v214) = 2112;
                    *(void *)((char *)&v214 + 2) = v117;
                    _os_log_impl( &dword_0,  v111,  OS_LOG_TYPE_INFO,  "Transfer %@ Is Aux image %@, is Sticker %@, is Animoji %@",  buf,  0x2Au);
                  }
                }

                dispatch_group_enter(v145);
                [v104 _setNeedsWrapper:0];
                [v105 startTransfer:v102];
                id v119 = [v105 endTransfer:v102];
                if (IMOSLoggingEnabled(v119, v120))
                {
                  uint64_t v121 = OSLogHandleForIMFoundationCategory("Attachments");
                  v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_0, v122, OS_LOG_TYPE_INFO, "Overriding transfer to end", buf, 2u);
                  }
                }

                v123 = (void *)objc_claimAutoreleasedReturnValue([v106 accountID]);
                v124 = (void *)objc_claimAutoreleasedReturnValue([v106 handle]);
                if (v124)
                {
                  v125 = (void *)objc_claimAutoreleasedReturnValue([v106 handle]);
                  [v105 assignTransfer:v102 toAccount:v123 otherPerson:v125];
                }

                else
                {
                  [v105 assignTransfer:v102 toAccount:v123 otherPerson:0];
                }

                -[MessageAttachmentController transcribeMessageIfNeeded:forTransfer:completion:]( self,  "transcribeMessageIfNeeded:forTransfer:completion:",  v106,  v104,  v107);
                char v100 = 1;
              }

              else
              {
                if (v109)
                {
                  uint64_t v126 = OSLogHandleForIMFoundationCategory("Warning");
                  v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v102;
                    _os_log_impl(&dword_0, v127, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
                  }
                }

                -[MessageAttachmentOverallStatus setFailed:](v149, "setFailed:", 1LL);
                -[MessageAttachmentOverallStatus setError:](v149, "setError:", 34LL);
              }
            }

            id v143 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v132,  "countByEnumeratingWithState:objects:count:",  &v179,  v215,  16LL);
          }

          while (v143);

          if ((v100 & 1) != 0)
          {
            *(void *)buf = 0LL;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000LL;
            v213 = sub_4C558;
            *(void *)&__int128 v214 = sub_4C568;
            *((void *)&v214 + 1) = 0LL;
            *((void *)&v214 + 1) = [[IMPowerAssertion alloc] initWithIdentifier:@"OutgoingMessagesPowerAssertion" timeout:120.0];
            v156[0] = _NSConcreteStackBlock;
            v156[1] = 3221225472LL;
            v156[2] = sub_524C4;
            v156[3] = &unk_D6CA0;
            v157 = v132;
            v158 = v149;
            v162 = v130;
            id v159 = v106;
            v160 = v129;
            id v161 = v128;
            v163 = buf;
            dispatch_group_notify(v145, &_dispatch_main_q, v156);

            _Block_object_dispose(buf, 8);
          }

          v91 = v133;
        }

        else
        {

          v91 = v135;
        }
      }

      goto LABEL_147;
    }
  }

  else
  {
  }

  if (IMOSLoggingEnabled(v66, v67))
  {
    uint64_t v95 = OSLogHandleForIMFoundationCategory("Attachments");
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v153;
      _os_log_impl( &dword_0,  v96,  OS_LOG_TYPE_INFO,  "All attachments for msg guid %@ already uploaded. Not re-uploading",  buf,  0xCu);
    }
  }

  if (v130) {
    v130[2](v130, v153, v129, v128, 1LL, 0LL);
  }
LABEL_147:
}

- (void)transcribeMessageIfNeeded:(id)a3 forTransfer:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(void))a5;
  if ([v7 isAudioMessage])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MessageTranscodeController sharedInstance]( &OBJC_CLASS___MessageTranscodeController,  "sharedInstance"));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localURL]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_52844;
    v12[3] = &unk_D6CC8;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    [v10 transcribeAudioForAudioTransferURL:v11 withCompletion:v12];
  }

  else
  {
    v9[2](v9);
  }
}

- (void)_transcodeURL:(id)a3 reason:(unint64_t)a4 transfer:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 sendStatus:(id)a8 urlGroup:(id)a9 didTranscode:(id)a10 handleURL:(id)a11
{
  id v36 = a3;
  id v15 = a5;
  id v16 = a6;
  id v37 = a7;
  id v32 = a8;
  id v17 = (dispatch_group_s *)a9;
  id v18 = a10;
  id v19 = a11;
  dispatch_group_enter(v17);
  unsigned __int8 v20 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:]( &OBJC_CLASS___IMDAttachmentUtilities,  "shouldEnablePreviewTranscodingQualityForTransfer:isSending:",  v15,  1LL);
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue( +[MessageTranscodeController sharedInstance]( &OBJC_CLASS___MessageTranscodeController,  "sharedInstance"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v15 type]);
  unsigned int v30 = [v15 isSticker];
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v15 transcoderUserInfo]);
  BOOL v22 = (+[IMDAttachmentUtilities shouldSendLowResolutionOnly]( IMDAttachmentUtilities,  "shouldSendLowResolutionOnly") & 1) == 0 && (unint64_t)[v16 count] > 1;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_52BB4;
  v38[3] = &unk_D6D18;
  id v39 = v15;
  id v40 = v36;
  unsigned __int8 v47 = v20;
  id v41 = v16;
  id v42 = v32;
  id v43 = v17;
  id v44 = v18;
  id v45 = v19;
  unint64_t v46 = a4;
  id v35 = v19;
  id v29 = v17;
  id v23 = v18;
  id v24 = v32;
  id v25 = v16;
  id v26 = v36;
  id v27 = v15;
  LOBYTE(v28) = v20;
  [v33 transcodeFileTransferContents:v26 utiType:v31 isSticker:v30 transcoderUserInfo:v21 sizes:v25 commonCapabilities:v37 representations:v22 isLQMEna bled:v28 completionBlock:v38];
}

- (void)_sendURL:(id)a3 urlToRemove:(id)a4 topic:(id)a5 sessionInfo:(id)a6 messageGUID:(id)a7 transferID:(id)a8 fileTransferGUID:(id)a9 attachmentSendContexts:(id)a10 failIfError:(BOOL)a11 sendStatus:(id)a12 attachmentStatus:(id)a13 group:(id)a14
{
  id v35 = a3;
  id v44 = a4;
  id v19 = a7;
  id v38 = a9;
  id v42 = a10;
  id v40 = a12;
  id v39 = a13;
  unsigned __int8 v20 = (dispatch_group_s *)a14;
  id v49 = a8;
  id v48 = a6;
  id v47 = a5;
  dispatch_group_enter(v20);
  double v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v23 = v22;
  uint64_t v24 = kAttachmentsAutomationMilestoneBeginSendingURL;
  uint64_t v64 = kAttachmentsAutomationURLKey;
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v35 path]);
  id v26 = (void *)v25;
  id v27 = &stru_D8640;
  if (v25) {
    id v27 = (const __CFString *)v25;
  }
  uint64_t v65 = v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
  AttachmentsAutomationLogMilestone(v19, v24, v28);

  id v36 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferServicesController sharedInstance]( &OBJC_CLASS___IMTransferServicesController,  "sharedInstance"));
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v37 stringByResolvingAndStandardizingPath]);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_53B7C;
  v62[3] = &unk_D6D40;
  id v63 = v38;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_53C9C;
  v50[3] = &unk_D6D68;
  id v51 = v19;
  id v52 = v35;
  id v53 = v63;
  id v54 = v21;
  uint64_t v60 = v23;
  BOOL v61 = a11;
  id v55 = v40;
  id v56 = v39;
  id v57 = v42;
  id v58 = v44;
  id v59 = v20;
  unint64_t v46 = v20;
  id v45 = v44;
  id v43 = v42;
  id v30 = v39;
  id v41 = v40;
  id v31 = v21;
  id v32 = v63;
  id v33 = v35;
  id v34 = v19;
  [v36 sendFilePath:v29 topic:v47 userInfo:v48 transferID:v49 encryptFile:1 progressBlock:v62 completionBlock:v50];
}

+ (id)_capabilitiesForTransfers:(id)a3 supportsASTC:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12[0] = IDSRegistrationPropertySupportsHDRVideo;
  v12[1] = IDSRegistrationPropertyPrefersSDRVideo;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  if (v4)
  {
    uint64_t v11 = IDSRegistrationPropertySupportsHEIFEncoding;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    -[NSMutableArray addObject:](v5, "addObject:", v7);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v9 = [v8 isHighQualityPhotosEnabled];

  if (v9) {
    -[NSMutableArray addObject:](v5, "addObject:", &off_DB7E0);
  }
  return v5;
}

- (void)findTranscoderCapabilitiesAcrossRecipients:(id)a3 forTransfers:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__im_canonicalIDSIDsFromAddresses"));
  uint64_t v10 = IMServiceNameForCanonicalIDSAddresses();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = +[MessageAttachmentController _capabilitiesForTransfers:supportsASTC:]( &OBJC_CLASS___MessageAttachmentController,  "_capabilitiesForTransfers:supportsASTC:",  v8,  IMSupportsASTC());
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  +[IMIDSUtilities findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:]( &OBJC_CLASS___IMIDSUtilities,  "findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:",  v9,  v11,  v13,  v7);
}

- (void)sessionInfoForBusinessReceipients:(id)a3 fromID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__im_canonicalIDSIDsFromAddresses"));
  uint64_t v11 = IMServiceNameForCanonicalIDSAddresses();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v9)
  {
    uint64_t v14 = IDSServiceNameiMessageForBusiness;
    if ([v12 isEqualToString:IDSServiceNameiMessageForBusiness])
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_54A28;
      v21[3] = &unk_D6DE0;
      id v15 = v9;
      id v23 = v15;
      id v22 = v8;
      id v16 = +[IMIDSIDQueryController currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:]( &OBJC_CLASS___IMIDSIDQueryController,  "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:",  v7,  v14,  @"MessageAttachmentController",  &_dispatch_main_q,  v21);
      if ((v16 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v16, v17))
        {
          uint64_t v18 = OSLogHandleForIMFoundationCategory("Attachments");
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)unsigned __int8 v20 = 0;
            _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "-sessionInfoForBusinessReceipients:completion: success == NO when querying for business session info",  v20,  2u);
          }
        }

        (*((void (**)(id, void))v15 + 2))(v15, 0LL);
      }
    }
  }
}

- (void)sendFallbackAttachmentsForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 completionBlock:(id)a6
{
  id v50 = a3;
  id v49 = a4;
  id v48 = a5;
  id v46 = a6;
  id v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  id v56 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v50 fileTransferGUIDs]);
  id v10 = [v9 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v10)
  {
    char v51 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v81;
    uint64_t v13 = IMStickerUserInfoStickerRecipeKey;
    uint64_t v14 = IMStickerUserInfoStickerPackGUIDKey;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(v9);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v54 transferForGUID:*(void *)(*((void *)&v80 + 1) + 8 * (void)i)]);
        id v17 = [v16 isRecipeBasedSticker];
        if ((_DWORD)v17)
        {
          if (IMOSLoggingEnabled(v17, v18))
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
            unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "sendFallbackAttachmentsForMessage sending recipe based sticker",  buf,  2u);
            }
          }

          double v21 = (void *)objc_claimAutoreleasedReturnValue([v16 stickerUserInfo]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v13]);
          id v53 = (void *)objc_claimAutoreleasedReturnValue([v22 _FTDataFromHexString]);

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 stickerUserInfo]);
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v14]);

          if (v53)
          {

            goto LABEL_26;
          }

          if (IMOSLoggingEnabled(v24, v25))
          {
            uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = (id)objc_claimAutoreleasedReturnValue([v50 guid]);
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v16 stickerUserInfo]);
              *(_DWORD *)buf = 138412546;
              id v86 = v28;
              __int16 v87 = 2112;
              id v88 = v29;
              _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "sendFallbackAttachmentsForMessage found recipe based transfer but no recipe in it for msg guid %@ %@",  buf,  0x16u);
            }
          }

          uint64_t v11 = v52;
        }

        else if ([v16 isAutoloopVideo])
        {
          -[NSMutableArray addObject:](v56, "addObject:", v16);
          char v51 = 1;
        }

        else if ([v16 isOpusAudioMessage])
        {
          -[NSMutableArray addObject:](v56, "addObject:", v16);
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v80 objects:v89 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    id v52 = v11;
    id v53 = 0LL;
  }

  else
  {
    char v51 = 0;
    id v52 = 0LL;
    id v53 = 0LL;
  }

- (void)handleTranscodeCompletionBlockForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 attemptedTranscode:(BOOL)a6 transcodedTransferGUIDs:(id)a7 containsAutoLoopVideo:(BOOL)a8 outputURLs:(id)a9 text:(id)a10 success:(BOOL)a11 error:(id)a12 completionBlock:(id)a13
{
  BOOL v13 = a8;
  BOOL v91 = a6;
  id v98 = a3;
  id v94 = a4;
  id v95 = a5;
  id v93 = a7;
  id obj = a9;
  id v96 = a10;
  id v92 = a12;
  uint64_t v97 = (void (**)(id, id, id, id, BOOL, void))a13;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = (id)objc_claimAutoreleasedReturnValue([v98 guid]);
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v98 balloonBundleID]);
      id v23 = (void *)v22;
      uint64_t v24 = @"NO";
      *(_DWORD *)buf = 138413826;
      id v122 = v21;
      if (a11) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      if (v91) {
        uint64_t v24 = @"YES";
      }
      __int16 v123 = 2112;
      uint64_t v124 = v22;
      __int16 v125 = 2112;
      id v126 = obj;
      __int16 v127 = 2112;
      id v128 = v96;
      __int16 v129 = 2112;
      id v130 = v92;
      __int16 v131 = 2112;
      v132 = v25;
      __int16 v133 = 2112;
      uint64_t v134 = v24;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Fallback transcoded version msg %@ bid %@ outputURLs %@ text %@ error %@ success %@ attemptedTranscode %@",  buf,  0x48u);
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v98 balloonBundleID]);
  uint64_t v27 = IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierPhotosExtension);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  unsigned int v29 = [v26 isEqualToString:v28];

  if (v97) {
    unsigned int v30 = v29;
  }
  else {
    unsigned int v30 = 0;
  }
  if (v30 == 1)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([obj lastObject]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v31));

    id v116 = 0LL;
    uint64_t v33 = IMSharedHelperPayloadFromCombinedPluginPayloadData(v32, &v116);
    unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v35 = v116;

    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v98 guid]);
    id v38 = (id)objc_claimAutoreleasedReturnValue([v36 guidsForStoredAttachmentPayloadData:v35 messageGUID:v37]);

    id v39 = [v98 copyForBackwardsCompatibility];
    id v40 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v96);

    [v39 setBody:v40];
    [v39 setPayloadData:v34];
    [v39 setFileTransferGUIDs:v38];
    [v39 setBalloonBundleID:IMBalloonPluginIdentifierRichLinks];
    v97[2](v97, v39, v94, v95, a11, 0LL);
    goto LABEL_83;
  }

  if (v97)
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v98 balloonBundleID]);
    uint64_t v90 = IMBalloonPluginIdentifierMessageExtension;
    unsigned int v42 = objc_msgSend(v41, "containsString:");

    if (v42)
    {
      if (IMOSLoggingEnabled(v43, v44))
      {
        uint64_t v45 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v98 guid]);
          *(_DWORD *)buf = 138412290;
          id v122 = v47;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Ignoring returned URLs for app message %@", buf, 0xCu);
        }
      }

      id obj = 0LL;
    }

    unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    id obj = obj;
    id v48 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v113;
      do
      {
        for (i = 0LL; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v113 != v49) {
            objc_enumerationMutation(obj);
          }
          char v51 = (void *)objc_claimAutoreleasedReturnValue( [v17 createNewOutgoingTransferWithLocalFileURL:*(void *)(*((void *)&v112 + 1) + 8 * (void)i)]);
          [v34 addObject:v51];
        }

        id v48 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
      }

      while (v48);
    }

    if (v13)
    {
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      id v54 = (void *)objc_claimAutoreleasedReturnValue([v98 fileTransferGUIDs]);
      id v55 = [v54 countByEnumeratingWithState:&v108 objects:v119 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v109;
        do
        {
          for (j = 0LL; j != v55; j = (char *)j + 1)
          {
            if (*(void *)v109 != v56) {
              objc_enumerationMutation(v54);
            }
            uint64_t v58 = *(void *)(*((void *)&v108 + 1) + 8LL * (void)j);
            id v59 = (void *)objc_claimAutoreleasedReturnValue([v17 transferForGUID:v58]);
          }

          id v55 = [v54 countByEnumeratingWithState:&v108 objects:v119 count:16];
        }

        while (v55);
      }
    }

    if (IMOSLoggingEnabled(v52, v53))
    {
      uint64_t v60 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      BOOL v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v122 = v93;
        _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, "Got transcoded strings: %@", buf, 0xCu);
      }
    }

    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    id v62 = v93;
    id v63 = [v62 countByEnumeratingWithState:&v104 objects:v118 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v105;
      do
      {
        for (k = 0LL; k != v63; k = (char *)k + 1)
        {
          if (*(void *)v105 != v64) {
            objc_enumerationMutation(v62);
          }
          uint64_t v66 = *(void *)(*((void *)&v104 + 1) + 8LL * (void)k);
          id v67 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:v66]);
          id v68 = (void *)objc_claimAutoreleasedReturnValue([v17 createNewOutgoingTransferWithLocalFileURL:v67]);

          id v69 = [v34 indexOfObject:v66];
          if (v69 == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v34 addObject:v68];
          }
          else {
            [v34 replaceObjectAtIndex:v69 withObject:v68];
          }
        }

        id v63 = [v62 countByEnumeratingWithState:&v104 objects:v118 count:16];
      }

      while (v63);
    }

    if (IMOSLoggingEnabled(v70, v71))
    {
      uint64_t v72 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        id v74 = (void *)objc_claimAutoreleasedReturnValue([v98 guid]);
        *(_DWORD *)buf = 138412546;
        id v122 = v74;
        __int16 v123 = 2112;
        uint64_t v124 = (uint64_t)v34;
        _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "Msg guid %@, FallBack GUIDs attempted to upload %@", buf, 0x16u);
      }
    }

    if (!v91 && ![v62 count]) {
      goto LABEL_84;
    }
    id v75 = (void *)objc_claimAutoreleasedReturnValue([v98 balloonBundleID]);
    unsigned int v76 = [v75 containsString:v90];

    if (v76)
    {
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v77 = (void *)objc_claimAutoreleasedReturnValue([v98 fileTransferGUIDs]);
      id v78 = [v77 countByEnumeratingWithState:&v100 objects:v117 count:16];
      if (v78)
      {
        uint64_t v79 = *(void *)v101;
        do
        {
          for (m = 0LL; m != v78; m = (char *)m + 1)
          {
            if (*(void *)v101 != v79) {
              objc_enumerationMutation(v77);
            }
            uint64_t v81 = *(void *)(*((void *)&v100 + 1) + 8LL * (void)m);
            __int128 v82 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
            __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v82 transferForGUID:v81]);

            [v83 setAppMessageFallbackImage:1];
          }

          id v78 = [v77 countByEnumeratingWithState:&v100 objects:v117 count:16];
        }

        while (v78);
      }
    }

    id v38 = [v98 copyForBackwardsCompatibility];
    if ([v34 count]) {
      [v38 setFileTransferGUIDs:v34];
    }
    id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSAttributedString __im_attributedStringWithFileTransfers:]( &OBJC_CLASS___NSAttributedString,  "__im_attributedStringWithFileTransfers:",  v34));
    id v40 = (NSAttributedString *)[v39 mutableCopy];
    if (v96)
    {
      v84 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v96);
      -[NSAttributedString appendAttributedString:](v40, "appendAttributedString:", v84);
    }

    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue( -[NSAttributedString __im_attributedStringByAssigningMessagePartNumbers]( v40,  "__im_attributedStringByAssigningMessagePartNumbers"));
    id v86 = [v85 length];
    if (v86) {
      id v86 = [v38 setBody:v85];
    }
    if (IMOSLoggingEnabled(v86, v87))
    {
      uint64_t v88 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v122 = v38;
        _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "New Message %@", buf, 0xCu);
      }
    }

    if (!v91 && !a11) {
      [v62 count];
    }
    ((void (*)(void (**)(id, id, id, id, BOOL, void), id, id, id))v97[2])(v97, v38, v94, v95);

LABEL_83:
LABEL_84:
  }
}

- (BOOL)_shouldAutoAccept:(id)a3 transfer:(id)a4 isAltAccountDevice:(BOOL)a5 shouldDownloadFromPeer:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = IMGetCachedDomainBoolForKey(@"com.apple.imessage", @"DownloadAttachmentInDemoMode");
  if ((_DWORD)v11)
  {
    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "DownloadAttachmentInDemoMode ", (uint8_t *)&v44, 2u);
      }
    }

    LOBYTE(v15) = 1;
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
    unsigned int v17 = [v16 isWiFiUsable];

    if (IMOSLoggingEnabled(v18, v19))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = @"NO";
        if (v17) {
          uint64_t v22 = @"YES";
        }
        int v44 = 138412290;
        uint64_t v45 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "isWifiUsable %@", (uint8_t *)&v44, 0xCu);
      }
    }

    if (v7)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
      unsigned int v24 = [v23 hasLTEDataConnection];

      uint64_t v27 = IMOSLoggingEnabled(v25, v26);
      if ((_DWORD)v27)
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
        unsigned int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = @"NO";
          if (v24) {
            id v31 = @"YES";
          }
          int v44 = 138412290;
          uint64_t v45 = v31;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "isOnHighCellularBandwidth %@", (uint8_t *)&v44, 0xCu);
        }
      }

      int v15 = v24 | v17;
    }

    else
    {
      id v32 = [v10 isLocation];
      if ((_DWORD)v32)
      {
        id v32 = [v9 isFromMe];
        unsigned int v34 = v32 ^ 1;
      }

      else
      {
        unsigned int v34 = 0;
      }

      uint64_t v27 = IMOSLoggingEnabled(v32, v33);
      int v15 = v34 | v6 | v17;
      if ((_DWORD)v27)
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v37 = @"NO";
          if (v17) {
            id v38 = @"YES";
          }
          else {
            id v38 = @"NO";
          }
          if (v6) {
            id v39 = @"YES";
          }
          else {
            id v39 = @"NO";
          }
          int v44 = 138412802;
          uint64_t v45 = v38;
          __int16 v46 = 2112;
          id v47 = v39;
          if (v34) {
            id v37 = @"YES";
          }
          __int16 v48 = 2112;
          uint64_t v49 = v37;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "isWifiUsable %@, shouldDownloadFromPeer %@, autoDownloadLocationFile %@",  (uint8_t *)&v44,  0x20u);
        }
      }
    }

    if (IMOSLoggingEnabled(v27, v28))
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        unsigned int v42 = @"NO";
        if (v15) {
          unsigned int v42 = @"YES";
        }
        int v44 = 138412290;
        uint64_t v45 = v42;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "shouldAutoAcceptFile %@,", (uint8_t *)&v44, 0xCu);
      }
    }
  }

  return v15;
}

- (BOOL)_shouldDisableFasterDownload:(id)a3 message:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"should-disable-faster-download"]);
  if ([v6 BOOLValue])
  {
    char v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 balloonBundleID]);
    char v7 = [v8 length] != 0;
  }

  return v7;
}

- (void)retrieveAttachmentsForMessage:(id)a3 inlineAttachments:(id)a4 displayID:(id)a5 topic:(id)a6 comingFromStorage:(BOOL)a7 shouldForceAutoDownload:(BOOL)a8 senderContext:(id)a9 completionBlock:(id)a10
{
  id v177 = a3;
  id v171 = a4;
  id v169 = a5;
  id v166 = a6;
  id v168 = a9;
  id v167 = a10;
  kdebug_trace(733872152LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMUnlockMonitor sharedInstance](&OBJC_CLASS___IMUnlockMonitor, "sharedInstance"));
  unsigned int v14 = [v13 isUnderFirstDataProtectionLock];

  if (v14 && IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMEventCategory("Attachments");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v177;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Not downloading attachments for message %@ as we are under first unlock",  (uint8_t *)&buf,  0xCu);
    }
  }

  uint64_t v215 = 0LL;
  v216 = &v215;
  uint64_t v217 = 0x2020000000LL;
  uint64_t v218 = 0LL;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v230 = 0x3032000000LL;
  v231 = sub_4C558;
  v232 = sub_4C568;
  id v233 = 0LL;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v177 balloonBundleID]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v177 fileTransferGUIDs]);
  if (![v20 count])
  {

LABEL_127:
    goto LABEL_128;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v177 balloonBundleID]);
  unsigned int v22 = [v21 containsString:IMBalloonPluginIdentifierSurf];

  if (((v22 | v14) & 1) == 0)
  {
    *(void *)v225 = 0LL;
    *(void *)&v225[8] = v225;
    *(void *)&v225[16] = 0x3010000000LL;
    uint64_t v227 = 0LL;
    uint64_t v228 = 0LL;
    v226 = (const __CFString *)&unk_BF2CB;
    id v161 = _os_activity_create( &dword_0,  "com.apple.messages.MessageAttachmentDownloads",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v161, (os_activity_scope_state_t)(*(void *)&v225[8] + 32LL));
    __int128 v181 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    uint64_t v211 = 0LL;
    v212 = &v211;
    uint64_t v213 = 0x2020000000LL;
    char v214 = 1;
    uint64_t v207 = 0LL;
    __int128 v208 = &v207;
    uint64_t v209 = 0x2020000000LL;
    int v210 = 0;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v177 guid]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 messageWithGUID:v26]);

    if (IMOSLoggingEnabled(v28, v29))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("Attachments");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v219 = 138412290;
        uint64_t v220 = (uint64_t)v27;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Found already stored message? %@", v219, 0xCu);
      }
    }

    id v32 = v177;
    if (v27) {
      id v32 = v27;
    }
    id v164 = v32;

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController msgSession](self, "msgSession"));
    if ([v33 isReplicating])
    {
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v177 guid]);
      unsigned __int8 v36 = [v34 wasMessageDeduplicatedWithGUID:v35];

      if ((v36 & 1) != 0) {
        goto LABEL_23;
      }
      if (IMOSLoggingEnabled(v37, v38))
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory("Attachments");
        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v219 = 0;
          _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "Session is replicating and stored message was not deduplicated, using passed-in message instead",  v219,  2u);
        }
      }

      uint64_t v33 = v164;
      id v164 = v177;
    }

LABEL_23:
    if ([v164 scheduleType] == (char *)&dword_0 + 2
      && ([v164 scheduleState] == (char *)&dword_0 + 1
       || [v164 scheduleState] == (char *)&dword_0 + 2
       || [v164 scheduleState] == (char *)&dword_0 + 3))
    {
      id v41 = [v177 isFromMe];
      if ((_DWORD)v41)
      {
        if (IMOSLoggingEnabled(v41, v42))
        {
          uint64_t v43 = OSLogHandleForIMFoundationCategory("Attachments");
          int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v219 = 0;
            _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_INFO,  "Using passed-in message instead of stored message as it might be an edited scheduled message",  v219,  2u);
          }
        }

        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v164 fileTransferGUIDs]);
        id v46 = [v45 count];
        if (v46 && IMOSLoggingEnabled(v46, v47))
        {
          uint64_t v48 = OSLogHandleForIMFoundationCategory("Attachments");
          uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v219 = 138412290;
            uint64_t v220 = (uint64_t)v45;
            _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_INFO,  "Deleteing old stored attachments %@, since we've now received the self-delivered message",  v219,  0xCu);
          }
        }

        __int128 v205 = 0u;
        __int128 v206 = 0u;
        __int128 v203 = 0u;
        __int128 v204 = 0u;
        id v50 = v45;
        id v51 = [v50 countByEnumeratingWithState:&v203 objects:v224 count:16];
        if (v51)
        {
          uint64_t v52 = *(void *)v204;
          do
          {
            for (i = 0LL; i != v51; i = (char *)i + 1)
            {
              if (*(void *)v204 != v52) {
                objc_enumerationMutation(v50);
              }
              uint64_t v54 = *(void *)(*((void *)&v203 + 1) + 8LL * (void)i);
              id v55 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
              [v55 deleteAttachmentWithGUID:v54];
            }

            id v51 = [v50 countByEnumeratingWithState:&v203 objects:v224 count:16];
          }

          while (v51);
        }

        id v56 = v177;
        id v164 = v56;
      }
    }

    if (v164)
    {
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v164 fileTransferGUIDs]);
      id v58 = [v57 count];
      BOOL v175 = v58 != 0LL;

      if (IMOSLoggingEnabled(v59, v60))
      {
        uint64_t v61 = OSLogHandleForIMFoundationCategory("Attachments");
        id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          id v63 = @"NO";
          if (v58) {
            id v63 = @"YES";
          }
          *(_DWORD *)v219 = 138412290;
          uint64_t v220 = (uint64_t)v63;
          _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "   Has attachments present: %@", v219, 0xCu);
        }
      }

      __int128 v201 = 0u;
      __int128 v202 = 0u;
      __int128 v199 = 0u;
      __int128 v200 = 0u;
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v164 fileTransferGUIDs]);
      id v65 = [v64 countByEnumeratingWithState:&v199 objects:v223 count:16];
      if (v65)
      {
        v170 = 0LL;
        uint64_t v179 = *(void *)v200;
        id obj = v64;
        do
        {
          id v180 = v65;
          for (j = 0LL; j != v180; j = (char *)j + 1)
          {
            if (*(void *)v200 != v179) {
              objc_enumerationMutation(obj);
            }
            id v67 = *(void **)(*((void *)&v199 + 1) + 8LL * (void)j);
            id v69 = (void *)objc_claimAutoreleasedReturnValue([v181 transferForGUID:v67]);
            if (v69)
            {
              uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v177 guid]);
              [v69 setMessageGUID:v70];

              uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v69 localURL]);
              if (UTTypeConformsTo((CFStringRef)[v69 type], kUTTypeImage))
              {
                uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue( +[IMTipKitEventReporter sharedInstance]( &OBJC_CLASS___IMTipKitEventReporter,  "sharedInstance"));
                [v72 sendReceivedPhotoEvent];
              }

              if (!v71
                || (v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                    id v74 = (void *)objc_claimAutoreleasedReturnValue([v71 path]),
                    unsigned __int8 v75 = [v73 fileExistsAtPath:v74],
                    v74,
                    v73,
                    (v75 & 1) == 0))
              {
                unint64_t v178 = (void *)objc_claimAutoreleasedReturnValue([v69 userInfo]);
                unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue([v178 _stringForKey:@"inline-attachment"]);
                uint64_t v78 = IMOSLoggingEnabled(v76, v77);
                if ((_DWORD)v78)
                {
                  uint64_t v80 = OSLogHandleForIMFoundationCategory("Attachments");
                  uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v219 = 138412290;
                    uint64_t v220 = (uint64_t)v76;
                    _os_log_impl( &dword_0,  v81,  OS_LOG_TYPE_INFO,  "   Checking for inline attachment. Inline file? %@",  v219,  0xCu);
                  }
                }

                if (v76)
                {
                  __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([v171 _dataForKey:v76]);
                  id v83 = [v82 length];
                  uint64_t v85 = IMOSLoggingEnabled(v83, v84);
                  if ((_DWORD)v85)
                  {
                    uint64_t v87 = OSLogHandleForIMFoundationCategory("Attachments");
                    uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
                    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v219 = 138412290;
                      uint64_t v220 = (uint64_t)v69;
                      _os_log_impl(&dword_0, v88, OS_LOG_TYPE_INFO, " inline transfer: %@", v219, 0xCu);
                    }
                  }

                  uint64_t v89 = IMOSLoggingEnabled(v85, v86);
                  if ((_DWORD)v89)
                  {
                    uint64_t v91 = OSLogHandleForIMFoundationCategory("Attachments");
                    id v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v219 = 138412290;
                      uint64_t v220 = (uint64_t)v178;
                      _os_log_impl(&dword_0, v92, OS_LOG_TYPE_INFO, "       user info: %@", v219, 0xCu);
                    }
                  }

                  if (IMOSLoggingEnabled(v89, v90))
                  {
                    uint64_t v93 = OSLogHandleForIMFoundationCategory("Attachments");
                    id v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                    {
                      if (v82) {
                        uint64_t v95 = (uint64_t)v83;
                      }
                      else {
                        uint64_t v95 = -1LL;
                      }
                      *(_DWORD *)v219 = 134217984;
                      uint64_t v220 = v95;
                      _os_log_impl(&dword_0, v94, OS_LOG_TYPE_INFO, " Found data size: %ld", v219, 0xCu);
                    }
                  }

                  if (v82)
                  {
                    id v96 = (void *)objc_claimAutoreleasedReturnValue([v177 accountID]);
                    [v181 assignTransfer:v67 toAccount:v96 otherPerson:v169];

                    uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue([v69 filename]);
                    id v172 = (void *)objc_claimAutoreleasedReturnValue([v97 lastPathComponent]);

                    id v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "im_randomTemporaryFileURLWithFileName:", v172));
                    __int128 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 path]);

                    [v181 acceptTransfer:v67 path:v100];
                    id v173 = (void *)objc_claimAutoreleasedReturnValue([v100 stringByResolvingAndStandardizingPath]);

                    v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v173));
                    __int128 v101 = objc_autoreleasePoolPush();
                    LODWORD(v98) = [v82 writeToURL:v176 atomically:1];
                    objc_autoreleasePoolPop(v101);
                    if ((_DWORD)v98)
                    {
                      __int128 v102 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
                      [v102 updateTransfer:v67 currentBytes:v83 totalBytes:v83];

                      id v103 = [v69 setUserInfo:0];
                      if (v176
                        && (__int128 v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager defaultManager]( NSFileManager,  "defaultManager")),  v106 = (void *)objc_claimAutoreleasedReturnValue([v176 path]),  v107 = objc_msgSend(v105, "fileExistsAtPath:", v106),  v106,  v105,  v107))
                      {
                        if (IMOSLoggingEnabled(v103, v104))
                        {
                          uint64_t v108 = OSLogHandleForIMFoundationCategory("Attachments");
                          __int128 v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
                          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v219 = 138412290;
                            uint64_t v220 = (uint64_t)v176;
                            _os_log_impl( &dword_0,  v109,  OS_LOG_TYPE_INFO,  "Adding gatekeeper properties to: %@",  v219,  0xCu);
                          }
                        }

                        __int128 v110 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
                        [v110 addDefaultGatekeeperPropertiesToDirectory:v173];

                        id v111 = [v69 _setLocalURL:v176];
                        if (IMOSLoggingEnabled(v111, v112))
                        {
                          uint64_t v113 = OSLogHandleForIMFoundationCategory("Attachments");
                          __int128 v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
                          if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v219 = 138412290;
                            uint64_t v220 = (uint64_t)v176;
                            _os_log_impl(&dword_0, v114, OS_LOG_TYPE_INFO, "Set transfer local url to: %@", v219, 0xCu);
                          }
                        }

                        __int128 v115 = (void *)objc_claimAutoreleasedReturnValue([v69 guid]);
                        [v181 startFinalizingTransfer:v115];

                        if (IMOSLoggingEnabled(v116, v117))
                        {
                          uint64_t v118 = OSLogHandleForIMFoundationCategory("Attachments");
                          id v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v219 = 0;
                            _os_log_impl( &dword_0,  v119,  OS_LOG_TYPE_INFO,  "Generating preview for in-line attachment",  v219,  2u);
                          }
                        }

                        uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
                        [v120 generatePreviewForTransfer:v69 messageItem:v177 senderContext:v168];
                      }

                      else
                      {
                        if (IMOSLoggingEnabled(v103, v104))
                        {
                          uint64_t v131 = OSLogHandleForIMFoundationCategory("Warning");
                          v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
                          if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v219 = 138412290;
                            uint64_t v220 = (uint64_t)v69;
                            _os_log_impl( &dword_0,  v132,  OS_LOG_TYPE_INFO,  "Could not locate file for transfer: %@",  v219,  0xCu);
                          }
                        }

                        __int16 v133 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.MessageAttachmentControllerErrorDomain",  41LL,  0LL);

                        *((_BYTE *)v212 + 24) = 0;
                        *((_DWORD *)v208 + 6) = 35;
                        v216[3] = (uint64_t)v83;
                        v170 = v133;
                      }
                    }

                    else
                    {
                      __int16 v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MessageAttachmentControllerErrorDomain",  35LL,  0LL));
                      id v126 = (NSError *)[v125 copy];

                      if (IMOSLoggingEnabled(v127, v128))
                      {
                        uint64_t v129 = OSLogHandleForIMFoundationCategory("Warning");
                        id v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
                        if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v219 = 138412546;
                          uint64_t v220 = (uint64_t)v69;
                          __int16 v221 = 2112;
                          v222 = v125;
                          _os_log_impl( &dword_0,  v130,  OS_LOG_TYPE_INFO,  "Failed retreiving file transfer: %@   error: %@",  v219,  0x16u);
                        }
                      }

                      [v181 failTransfer:v67 error:v125];
                      *((_BYTE *)v212 + 24) = 0;
                      *((_DWORD *)v208 + 6) = 35;
                      v216[3] = (uint64_t)v83;

                      v170 = v126;
                    }
                  }
                }

                else
                {
                  if (IMOSLoggingEnabled(v78, v79))
                  {
                    uint64_t v123 = OSLogHandleForIMFoundationCategory("Attachments");
                    uint64_t v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v219 = 138412290;
                      uint64_t v220 = (uint64_t)v71;
                      _os_log_impl( &dword_0,  v124,  OS_LOG_TYPE_INFO,  "   We're missing an attachment at path: %@",  v219,  0xCu);
                    }
                  }

                  BOOL v175 = 0;
                }
              }
            }

            else
            {
              if (IMOSLoggingEnabled(0LL, v68))
              {
                uint64_t v121 = OSLogHandleForIMFoundationCategory("Attachments");
                id v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
                if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v219 = 138412290;
                  uint64_t v220 = (uint64_t)v67;
                  _os_log_impl(&dword_0, v122, OS_LOG_TYPE_INFO, "   We're missing a transfer for guid: %@", v219, 0xCu);
                }
              }

              BOOL v175 = 0;
            }
          }

          uint64_t v64 = obj;
          id v65 = [obj countByEnumeratingWithState:&v199 objects:v223 count:16];
        }

        while (v65);
      }

      else
      {
        v170 = 0LL;
      }

      if (v175)
      {
        if (IMOSLoggingEnabled(v141, v142))
        {
          uint64_t v143 = OSLogHandleForIMFoundationCategory("Attachments");
          dispatch_group_t v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
          if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v219 = 0;
            _os_log_impl( &dword_0,  v144,  OS_LOG_TYPE_INFO,  "   We already have all these transfers, just moving along as a success!",  v219,  2u);
          }
        }

        os_activity_scope_leave((os_activity_scope_state_t)(*(void *)&v225[8] + 32LL));
        if (v167)
        {
          kdebug_trace(733872156LL, 0LL, 0LL, 0LL, 0LL);
          (*((void (**)(id, id, id, void, void, NSError *, uint64_t, void, void))v167 + 2))( v167,  v164,  v169,  *((unsigned __int8 *)v212 + 24),  *((unsigned int *)v208 + 6),  v170,  v216[3],  *(void *)(*((void *)&buf + 1) + 40LL),  0LL);
        }

- (BOOL)sendToLocalPeers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
  unsigned __int8 v6 = [v5 sendToLocalPeers:v4];

  return v6;
}

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
  unsigned __int8 v9 = [v8 sendToLocalPeersFile:v7 dictionary:v6];

  return v9;
}

- (id)localDeviceProductVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);

  return v4;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v18 = a3;
  id v44 = a5;
  id v45 = a6;
  id v46 = a7;
  id v47 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  uint64_t v24 = (void (**)(void, void, void, void, void, void, void))v22;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (id v22 = [v18 length]) == 0)
  {
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)uint64_t v57 = a4;
        *(_WORD *)&v57[4] = 2112;
        *(void *)&v57[6] = v18;
        _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_INFO,  "Trying to retrieve attachment at index: %u for transfer ID: %@, failing",  buf,  0x12u);
      }
    }

    ((void (**)(void, id, unint64_t, void, void, void, void))v24)[2]( v24,  v18,  a4,  0LL,  0LL,  0LL,  0LL);
  }

  else
  {
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)uint64_t v57 = v18;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
      }
    }

    v55[0] = v18;
    v54[0] = IMDRelayLocalMessageDictionaryGUIDKey;
    v54[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v55[1] = v27;
    v54[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
    v55[2] = &__kCFBooleanTrue;
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  3LL));

    v52[0] = IMDRelayLocalMessageDictionaryTypeKey;
    v52[1] = IMDRelayLocalMessageDictionaryDictKey;
    v53[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
    v53[1] = v42;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  2LL));
    BOOL v29 = -[MessageAttachmentController sendToLocalPeers:](self, "sendToLocalPeers:", v28);
    if (v29)
    {
      if (!qword_E32B8)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v32 = (void *)qword_E32B8;
        qword_E32B8 = (uint64_t)Mutable;
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingFormat:", @"_%lu", a4));
      unsigned int v34 = (void *)qword_E32B8;
      id v35 = objc_retainBlock(v24);
      [v34 setObject:v35 forKey:v33];

      dispatch_time_t v36 = dispatch_time(0LL, 600000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_5CF14;
      block[3] = &unk_D6FC0;
      id v49 = v33;
      id v50 = v18;
      unint64_t v51 = a4;
      id v37 = v33;
      dispatch_after(v36, &_dispatch_main_q, block);
    }

    else
    {
      if (IMOSLoggingEnabled(v29, v30))
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)uint64_t v57 = v18;
          _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_INFO,  " Failed to send message to local device for Transfer %@, Failing",  buf,  0xCu);
        }
      }

      ((void (**)(void, id, unint64_t, void, void, void, void))v24)[2]( v24,  v18,  a4,  0LL,  0LL,  0LL,  0LL);
    }
  }
}

- (void)remoteFileResponse:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v35 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, " Incomming response for file attachment %@ ", buf, 0xCu);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey]);
  id v9 = [v8 unsignedIntegerValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryFileDataKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:iMessageLocalFileErrorCodeKey]);
  uint64_t v12 = (char *)[v11 integerValue];

  uint64_t v13 = 0LL;
  if (v12) {
    BOOL v14 = v12 == (_BYTE *)&dword_4 + 1;
  }
  else {
    BOOL v14 = 1;
  }
  uint64_t v15 = v14;
  if (v12 && v12 != (_BYTE *)&dword_4 + 1) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IMPeerAttachmentMessageErrorDomain,  v12,  0LL));
  }
  id v16 = [v7 length];
  if (v16)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v10 length];
        *(_DWORD *)__int128 buf = 138413058;
        id v35 = v7;
        __int16 v36 = 2048;
        id v37 = v9;
        __int16 v38 = 2048;
        id v39 = v20;
        __int16 v40 = 2048;
        id v41 = v12;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  " Incomming response for message %@ attachmentIndex %lu data of length %lu errorCode %lu",  buf,  0x2Au);
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", @"_%lu", v9));
    id v22 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( [(id)qword_E32B8 objectForKey:v21]);
    uint64_t v24 = IMOSLoggingEnabled(v22, v23);
    if (v22)
    {
      if ((_DWORD)v24)
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }
      }

      ((void (**)(void, void *, id, void, void *, uint64_t, void *))v22)[2]( v22,  v7,  v9,  0LL,  v10,  v15,  v13);
      [(id)qword_E32B8 removeObjectForKey:v21];
    }

    else
    {
      if ((_DWORD)v24)
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v21;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }
      }

      if (IMOSLoggingEnabled(v24, v25))
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_E32B8 allKeys]);
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v32;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);
        }
      }
    }

    if (![(id)qword_E32B8 count])
    {
      uint64_t v33 = (void *)qword_E32B8;
      qword_E32B8 = 0LL;
    }
  }
}

- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8
{
  BOOL v9 = a7;
  id v42 = a4;
  id v44 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412802;
      id v50 = v42;
      __int16 v51 = 2048;
      int64_t v52 = a8;
      __int16 v53 = 2112;
      id v54 = v13;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Forwarding Attachment with guid %@ to local peer. Error: %lu. fileURL %@",  buf,  0x20u);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 attributesOfItemAtPath:v18 error:0]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSFileSize]);
  uint64_t v21 = (uint64_t)[v20 longValue];

  int v22 = v21 > 0x100000 || v9;
  if ((v22 & 1) != 0) {
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  else {
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v13));
  }
  uint64_t v24 = (void *)v23;
  v48[0] = v44;
  v47[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v47[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v48[1] = v25;
  v47[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  uint64_t v26 = v24;
  if (!v24) {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v48[2] = v26;
  v47[3] = iMessageLocalFileErrorCodeKey;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a8));
  v48[3] = v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  4LL));

  if (!v24) {
  v45[0] = IMDRelayLocalMessageDictionaryDictKey;
  }
  v45[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v46[0] = v28;
  v46[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
  id v31 = (void *)v29;
  if (v22)
  {
    if (IMOSLoggingEnabled(v29, v30))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }
    }

    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
    [v34 sendToLocalPeersFile:v13 dictionary:v31];
  }

  else
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localDevice]);
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v36 productVersion]);

    if (IMOSLoggingEnabled(v37, v38))
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v50 = v34;
        _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "Using legacy api to send attachment running on product version: %@",  buf,  0xCu);
      }
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
    [v41 sendToLocalPeers:v31];
  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey]);
  id v131 = [v10 unsignedIntegerValue];

  uint64_t v156 = 0LL;
  unsigned int v157 = &v156;
  uint64_t v158 = 0x2020000000LL;
  unsigned __int8 v159 = 0;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:iMessageLocalFileUseFileURLAPI]);
  unsigned __int8 v12 = [v11 BOOLValue];

  unsigned __int8 v159 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey]);
  unsigned int v14 = [v13 BOOLValue];

  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = @"NO";
      if (v5) {
        id v19 = @"YES";
      }
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Attempting to locate message with Message Guid %@ shouldRetry %@",  buf,  0x16u);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 itemWithGUID:v9]);

  if (!v21)
  {
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "Unable To locate Message with GUID %@, adding to pending requests to retry later",  buf,  0xCu);
      }
    }

    id v29 = (id)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests"));
    if (!v29)
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      -[MessageAttachmentController setPendingRemoteFileRequests:](self, "setPendingRemoteFileRequests:", v29);
    }

    id v32 = [v29 addObject:v8];
    if (v5)
    {
      if (a4 <= 39)
      {
        if (IMOSLoggingEnabled(v32, v33))
        {
          uint64_t v34 = OSLogHandleForIMFoundationCategory("LocalAttachments");
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "Message with Guid  is not found %@, Retrying it a bit ",  buf,  0xCu);
          }
        }

        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472LL;
        v132[2] = sub_5F430;
        v132[3] = &unk_D6FC0;
        v132[4] = self;
        id v133 = v8;
        int64_t v134 = a4;
        im_dispatch_after(v132, 1.0);

        goto LABEL_88;
      }

      if (IMOSLoggingEnabled(v32, v33))
      {
        uint64_t v98 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl( &dword_0,  v99,  OS_LOG_TYPE_INFO,  "Message with Guid is not found %@, No retried remain ",  buf,  0xCu);
        }
      }
    }

    uint64_t v92 = 1LL;
    goto LABEL_134;
  }

  if (IMOSLoggingEnabled(v22, v23))
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests"));
  [v26 removeObject:v8];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController pendingRemoteFileRequests](self, "pendingRemoteFileRequests"));
  BOOL v28 = [v27 count] == 0;

  if (v28) {
    -[MessageAttachmentController setPendingRemoteFileRequests:](self, "setPendingRemoteFileRequests:", 0LL);
  }
  if (![v21 type])
  {
    id v29 = v21;
    id v36 = [v29 isFinished];
    if (a4 > 39)
    {
      if (IMOSLoggingEnabled(v36, v37))
      {
        uint64_t v102 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        id v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl( &dword_0,  v103,  OS_LOG_TYPE_INFO,  "Message with Guid is unfinished %@, No retried remain ",  buf,  0xCu);
        }
      }

      uint64_t v92 = 2LL;
      goto LABEL_134;
    }

    if (IMOSLoggingEnabled(v36, v37))
    {
      uint64_t v96 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl( &dword_0,  v97,  OS_LOG_TYPE_INFO,  "Message with Guid  is unfinished %@, Retrying it a bit ",  buf,  0xCu);
      }
    }

    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472LL;
    v153[2] = sub_5ED28;
    v153[3] = &unk_D6FC0;
    v153[4] = self;
    id v154 = v8;
    int64_t v155 = a4;
    im_dispatch_after(v153, 1.0);

LABEL_88:
    uint64_t v92 = 0LL;
    goto LABEL_134;
  }

  id v29 = 0LL;
LABEL_30:
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v21 fileTransferGUIDs]);

  if (!v38)
  {
    uint64_t v92 = 3LL;
    goto LABEL_134;
  }

  if (IMOSLoggingEnabled(v39, v40))
  {
    uint64_t v41 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
    }
  }

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v21 fileTransferGUIDs]);
  BOOL v44 = v131 < [v43 count];

  if (v44)
  {
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v21 fileTransferGUIDs]);
    uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndex:v131]);

    if (IMOSLoggingEnabled(v48, v49))
    {
      uint64_t v50 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      __int16 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v129;
        _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
      }
    }

    int64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    id v130 = (void *)objc_claimAutoreleasedReturnValue([v52 transferForGUID:v129]);

    if (!v130)
    {
      if (IMOSLoggingEnabled(v53, v54))
      {
        uint64_t v55 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( &dword_0,  v56,  OS_LOG_TYPE_INFO,  "Transfer not found in transfer center, checking attachment store",  buf,  2u);
        }
      }

      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
      id v130 = (void *)objc_claimAutoreleasedReturnValue([v57 attachmentWithGUID:v129]);

      if (!v130)
      {
        if (IMOSLoggingEnabled(v53, v54))
        {
          uint64_t v116 = OSLogHandleForIMFoundationCategory("LocalAttachments");
          uint64_t v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
          if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v129;
            _os_log_impl( &dword_0,  v117,  OS_LOG_TYPE_INFO,  "Did not find file transfer for message GUID %@ transfer guid %@",  buf,  0x16u);
          }
        }

        uint64_t v118 = 0LL;
        uint64_t v92 = 3LL;
        goto LABEL_133;
      }
    }

    if (IMOSLoggingEnabled(v53, v54))
    {
      uint64_t v58 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v129;
        _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
      }
    }

    id v60 = [v130 isFinished];
    if (!(_DWORD)v60)
    {
      if (a4 > 39)
      {
        if (IMOSLoggingEnabled(v60, v61))
        {
          uint64_t v104 = OSLogHandleForIMEventCategory("LocalAttachments");
          __int128 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v129;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl( &dword_0,  v105,  OS_LOG_TYPE_INFO,  "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ",  buf,  0x16u);
          }
        }

        uint64_t v92 = 4LL;
        goto LABEL_132;
      }

      if (IMOSLoggingEnabled(v60, v61))
      {
        uint64_t v100 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        __int128 v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = v129;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl( &dword_0,  v101,  OS_LOG_TYPE_INFO,  "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ",  buf,  0x16u);
        }
      }

      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472LL;
      v135[2] = sub_5F418;
      v135[3] = &unk_D6FC0;
      v135[4] = self;
      id v136 = v8;
      int64_t v137 = a4;
      im_dispatch_after(v135, 1.0);

LABEL_131:
      uint64_t v92 = 0LL;
LABEL_132:
      uint64_t v118 = v130;
LABEL_133:

      goto LABEL_134;
    }

    uint64_t v62 = IMOSLoggingEnabled(v60, v61);
    if ((_DWORD)v62)
    {
      uint64_t v64 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v129;
        _os_log_impl(&dword_0, v65, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
      }
    }

    if (IMOSLoggingEnabled(v62, v63))
    {
      uint64_t v66 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay", buf, 2u);
      }
    }

    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
    id v69 = (void *)objc_claimAutoreleasedReturnValue([v68 chatsGUIDsForMessageWithGUID:v9]);
    uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v69 lastObject]);

    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
    id v126 = (void *)objc_claimAutoreleasedReturnValue([v70 chatWithGUID:v127]);

    id v71 = [v126 isFiltered];
    id v73 = v71;
    uint64_t v74 = v14 ^ 1;
    if (v71) {
      int v75 = v14 ^ 1;
    }
    else {
      int v75 = 1;
    }
    if (v75 == 1)
    {
      if (IMOSLoggingEnabled(v71, v72))
      {
        uint64_t v76 = OSLogHandleForIMFoundationCategory("LocalAttachments");
        uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v73 == 0LL));
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v74));
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v79;
          _os_log_impl( &dword_0,  v77,  OS_LOG_TYPE_INFO,  "Attempting to transcode attachment for peer relay, this is a known sender (%@) or old watch (%@)",  buf,  0x16u);
        }
      }

      inUTI = (__CFString *)objc_claimAutoreleasedReturnValue([v130 type]);
      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v130 transcoderUserInfo]);
      id v125 = [v80 mutableCopy];

      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)UTTypeConformsTo(inUTI, kUTTypeAudiovisualContent);
      id v83 = v130;
      if ((_DWORD)Mutable)
      {
        if (!v125)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          id v125 = Mutable;
        }

        if (IMOSLoggingEnabled(Mutable, v82))
        {
          uint64_t v84 = OSLogHandleForIMFoundationCategory("LocalAttachments");
          uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( &dword_0,  v85,  OS_LOG_TYPE_INFO,  "Found an a/v type, adding transcoder options to remove alpha and check for hevc+alpha",  buf,  2u);
          }
        }

        uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v125 setObject:v86 forKey:IMFileTransferAVTranscodeOptionRemoveAlpha];

        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v125 setObject:v87 forKey:IMFileTransferAVTranscodeOptionCheckForAnimojiV2];

        id v83 = v130;
      }

      unsigned __int8 v88 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:]( &OBJC_CLASS___IMDAttachmentUtilities,  "shouldEnablePreviewTranscodingQualityForTransfer:isSending:",  v83,  1LL);
      uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue( +[MessageTranscodeController sharedInstance]( &OBJC_CLASS___MessageTranscodeController,  "sharedInstance"));
      uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue([v83 localURL]);
      id v91 = [v83 isSticker];
      v146[0] = _NSConcreteStackBlock;
      v146[1] = 3221225472LL;
      v146[2] = sub_5ED40;
      v146[3] = &unk_D6FE8;
      id v147 = v83;
      uint64_t v148 = self;
      unsigned __int8 v151 = &v156;
      id v152 = v131;
      id v149 = v129;
      id v150 = v9;
      LOBYTE(v124) = v88;
      [v89 transcodeFileTransferContents:v90 utiType:inUTI isSticker:v91 transcoderUserInfo:v125 sizes:&off_DB7F8 commonCapabilities:0 representations:0 isLQ MEnabled:v124 completionBlock:v146];

      goto LABEL_130;
    }

    __int128 v106 = (void *)objc_claimAutoreleasedReturnValue([v130 type]);
    BOOL v107 = v106 == 0LL;

    __int128 v110 = v130;
    if (v107) {
      goto LABEL_123;
    }
    id v111 = (void *)objc_claimAutoreleasedReturnValue([v130 type]);
    inUTI = (__CFString *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:", v111));

    id v108 = -[__CFString conformsToType:](inUTI, "conformsToType:", UTTypeImage);
    __int128 v110 = v130;
    if ((_DWORD)v108)
    {
      uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v130 localURL]);
      char v113 = IMFileURLIsActuallyAnimated();

      __int128 v110 = v130;
      if ((v113 & 1) == 0)
      {
        uint64_t v161 = 0LL;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero(buf);
        *(_OWORD *)__int128 buf = xmmword_9E170;
        *(_OWORD *)&buf[16] = xmmword_9E180;
        LOBYTE(v161) = [v130 isSticker];
        BYTE2(v161) = [v130 isAdaptiveImageGlyph];
        BYTE1(v161) = 0;
        id v122 = (void *)objc_claimAutoreleasedReturnValue(+[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"));
        uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue([v130 localURL]);
        v140[0] = _NSConcreteStackBlock;
        v140[1] = 3221225472LL;
        v140[2] = sub_5F248;
        v140[3] = &unk_D7010;
        v140[4] = self;
        id v145 = v131;
        id v141 = v129;
        id v142 = v9;
        dispatch_group_t v144 = &v156;
        id v143 = v130;
        v138[0] = *(_OWORD *)buf;
        v138[1] = *(_OWORD *)&buf[16];
        uint64_t v139 = v161;
        [v122 generateSafeRender:v123 constraints:v138 completionBlock:v140];

        goto LABEL_130;
      }
    }

    if (!inUTI)
    {
LABEL_123:
      if (!IMOSLoggingEnabled(v108, v109))
      {
        inUTI = 0LL;
        goto LABEL_129;
      }

      uint64_t v119 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      uint64_t v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_0,  v120,  OS_LOG_TYPE_INFO,  "File safe render failed for Peer Relay because the filetype was not found",  buf,  2u);
      }

      inUTI = 0LL;
    }

    else
    {
      if (!IMOSLoggingEnabled(v108, v109))
      {
LABEL_129:
        uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue([v110 localURL]);
        -[MessageAttachmentController _sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:]( self,  "_sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:",  v131,  v129,  v9,  v121,  *((unsigned __int8 *)v157 + 24),  5LL);

LABEL_130:
        goto LABEL_131;
      }

      uint64_t v114 = OSLogHandleForIMFoundationCategory("LocalAttachments");
      __int128 v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = inUTI;
        _os_log_impl( &dword_0,  v115,  OS_LOG_TYPE_INFO,  "File safe render failed for Peer Relay because the filetype was not supported: %@",  buf,  0xCu);
      }
    }

    __int128 v110 = v130;
    goto LABEL_129;
  }

  if (IMOSLoggingEnabled(v45, v46))
  {
    uint64_t v93 = OSLogHandleForIMFoundationCategory("LocalAttachments");
    id v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
      uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([v21 fileTransferGUIDs]);
      *(_DWORD *)__int128 buf = 134218242;
      *(void *)&uint8_t buf[4] = v131;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v95;
      _os_log_impl( &dword_0,  v94,  OS_LOG_TYPE_INFO,  "Attachment index out of bounds. attachment index: %lu file transfer guids: %@",  buf,  0x16u);
    }
  }

  uint64_t v92 = 6LL;
LABEL_134:

  if (v92) {
    -[MessageAttachmentController _sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:]( self,  "_sendAttachmentToPeerDevice:fileTransferGUID:messageGuid:fileURL:useLocalPeersFileAPI:error:",  v131,  0LL,  v9,  0LL,  *((unsigned __int8 *)v157 + 24),  v92);
  }

  _Block_object_dispose(&v156, 8);
}

- (id)_createPayloadRequestDictionaryForMessageGUID:(id)a3 requestKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = v6;
  if (v5 && v6)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"guid", v5);
    CFDictionarySetValue(Mutable, @"request-key", v8);
  }

  else
  {
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "PayoadAttachments _createPayloadRequestDictionaryForMessageGUID invalid parameters guid %@ key %@",  (uint8_t *)&v13,  0x16u);
      }
    }

    CFMutableDictionaryRef Mutable = 0LL;
  }

  return Mutable;
}

- (void)fetchPayloadDataFromCompanionForGUID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 length];
  if (v7 && v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v11 = -[MessageAttachmentController _createPayloadRequestDictionaryForMessageGUID:requestKey:]( self,  "_createPayloadRequestDictionaryForMessageGUID:requestKey:",  v6,  v10);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryTypeKey, @"payload-data-request");
    id v13 = v11;
    if (v13)
    {
      CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryDictKey, v13);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_8FF48();
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
    unsigned int v18 = [v17 sendToLocalPeers:Mutable];

    int v21 = IMOSLoggingEnabled(v19, v20);
    if (v18)
    {
      if (v21)
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v13;
          _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Sent payload-data-request to companion successfully with dict %@",  buf,  0xCu);
        }
      }

      if (!self->_localPayloadDataRequestGUIDToCompletionBlockMap)
      {
        uint64_t v24 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        localPayloadDataRequestGUIDToCompletionBlockMap = self->_localPayloadDataRequestGUIDToCompletionBlockMap;
        self->_localPayloadDataRequestGUIDToCompletionBlockMap = v24;
      }

      uint64_t v26 = _Block_copy(v7);
      uint64_t v27 = self->_localPayloadDataRequestGUIDToCompletionBlockMap;
      id v28 = objc_retainBlock(v26);
      -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, v10);

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_5F968;
      v31[3] = &unk_D7038;
      v31[4] = self;
      id v32 = v10;
      id v33 = v6;
      im_dispatch_after(v31, 60.0);
    }

    else
    {
      if (v21)
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v6;
          _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "PayloadAttachments failed to send payload-data-request for message guid %@",  buf,  0xCu);
        }
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }

  else if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = objc_retainBlock(v7);
      *(_DWORD *)__int128 buf = 138412546;
      id v35 = v6;
      __int16 v36 = 2112;
      id v37 = v16;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "PayloadAttachments Invalid parameters to fetchPayloadDataFromCompanionForGUID %@ %@",  buf,  0x16u);
    }
  }
}

- (void)handlePayloadDataResponse:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "HandlePayloadDataresponse", buf, 2u);
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"request-key"]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"payload-data"]);
  id v11 = (void *)v9;
  if (v8)
  {
    id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_localPayloadDataRequestGUIDToCompletionBlockMap,  "objectForKey:",  v8));
    if (v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathExtension:IMFileTransferCombinedPluginPayloadExtension]);

      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "im_randomTemporaryFileURLWithFileName:", v34));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);

      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByResolvingAndStandardizingPath]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v18,  0LL));
      id v35 = 0LL;
      unsigned __int8 v20 = [v11 writeToURL:v19 options:1 error:&v35];
      id v21 = v35;
      if ((v20 & 1) == 0)
      {

        if (IMOSLoggingEnabled(v22, v23))
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v37 = v21;
            _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "IMiMessageAppPayloadDecoder Failed writing attachment to disk on incoming: %@",  buf,  0xCu);
          }
        }

        uint64_t v19 = 0LL;
      }

      ((void (**)(void, void *))v13)[2](v13, v19);
      id v26 = -[NSMutableDictionary removeObjectForKey:]( self->_localPayloadDataRequestGUIDToCompletionBlockMap,  "removeObjectForKey:",  v8);
      if (IMOSLoggingEnabled(v26, v27))
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v37 = v8;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Dequeue completion block for key %@", buf, 0xCu);
        }
      }
    }

    else if (IMOSLoggingEnabled(0LL, v12))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("Warning");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v37 = v8;
        _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "PayloadAttachments no completion block found for key %@",  buf,  0xCu);
      }
    }
  }

  else if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory("Warning");
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "PayloadAttachments handlePayloadDataResponse. No request key present. No completion block to call",  buf,  2u);
    }
  }
}

- (id)_createPayloadResponseDictionaryWithDictionary:(id)a3 payloadData:(id)a4 attachments:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (__CFDictionary *)[v7 mutableCopy];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v12 = Mutable;
  if (v8) {
    CFDictionarySetValue(Mutable, IMCombinedPayloadDictionaryPayloadKey, v8);
  }
  if (v9) {
    CFDictionarySetValue(v12, IMCombinedPayloadDictionaryAttachmentsKey, v9);
  }
  uint64_t v13 = JWEncodeDictionary(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v14 _FTCopyGzippedData];

  id v16 = v15;
  if (v16)
  {
    CFDictionarySetValue(v10, @"payload-data", v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_8FFCC();
  }

  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageAttachmentController");
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Created response dictionary", v22, 2u);
    }
  }

  return v10;
}

- (void)handlePayloadDataRequest:(id)a3 attempts:(unint64_t)a4
{
  id v64 = a3;
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:@"guid"]);
  if (IMOSLoggingEnabled(v65, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v77 = v65;
      __int16 v78 = 2048;
      unint64_t v79 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "handlePayloadDataRequest for guid %@ attempts %lu", buf, 0x16u);
    }
  }

  id v8 = [v65 length];
  if (a4 > 2 || !v8)
  {
    if (IMOSLoggingEnabled(v8, v9))
    {
      uint64_t v44 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v77 = v65;
        __int16 v78 = 2048;
        unint64_t v79 = a4;
        _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "PayloadAttachments did not find data for messageGUID %@ in attempts %lu",  buf,  0x16u);
      }
    }

    uint64_t v43 = 0LL;
    id v42 = 0LL;
LABEL_48:
    uint64_t v46 = v42;
    id v47 = v43;
    id v48 = -[MessageAttachmentController _createPayloadResponseDictionaryWithDictionary:payloadData:attachments:]( self,  "_createPayloadResponseDictionaryWithDictionary:payloadData:attachments:",  v64);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryTypeKey, @"payload-data-response");
    id v50 = v48;
    if (v50)
    {
      CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryDictKey, v50);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_8FF48();
    }

    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentController deliveryController](self, "deliveryController"));
    unsigned int v52 = [v51 sendToLocalPeers:Mutable];

    int v55 = IMOSLoggingEnabled(v53, v54);
    if (v52)
    {
      if (v55)
      {
        uint64_t v56 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
        uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v77 = v65;
          _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Sent message payload successfully for guid %@", buf, 0xCu);
        }

- (unint64_t)_maxCompressedPayloadDataLength
{
  return 9216LL;
}

- (BOOL)_shouldUploadPayloadDataOverMMCS:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _FTCopyGzippedData];
  unint64_t v6 = -[MessageAttachmentController _maxCompressedPayloadDataLength](self, "_maxCompressedPayloadDataLength");
  if (IMGetCachedDomainBoolForKey(@"com.apple.madrid", @"AlwaysUploadBubblePayloadData"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v8 = [v7 isInternalInstall];

    if (v8) {
      unint64_t v6 = 0LL;
    }
  }

  id v9 = [v5 length];
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v5 length];
      id v14 = [v4 length];
      id v15 = @"NO";
      int v17 = 134218754;
      id v18 = v13;
      __int16 v19 = 2048;
      id v20 = v14;
      __int16 v21 = 2048;
      unint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Should upload compressed payload data length %lu, uncompressed data length %lu, maxLenght %lu  result %@",  (uint8_t *)&v17,  0x2Au);
    }
  }

  return (unint64_t)v9 > v6;
}

- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 fromID:(id)a5 recipients:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "__im_canonicalIDSIDsFromAddresses"));
  uint64_t v18 = IMServiceNameForCanonicalIDSAddresses();
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v19 isEqualToString:IDSServiceNameiMessageForBusiness])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_60BB4;
    v20[3] = &unk_D7060;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    id v23 = v19;
    id v24 = v16;
    -[MessageAttachmentController sessionInfoForBusinessReceipients:fromID:completion:]( self,  "sessionInfoForBusinessReceipients:fromID:completion:",  v15,  v14,  v20);
  }

  else
  {
    -[MessageAttachmentController sendPayloadData:messageGUID:sessionInfo:topic:completionBlock:]( self,  "sendPayloadData:messageGUID:sessionInfo:topic:completionBlock:",  v12,  v13,  0LL,  v19,  v16);
  }
}

- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 sessionInfo:(id)a5 topic:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  id v40 = a6;
  id v14 = a7;
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v49 = v13;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Request to upload payload data for message guid %@", buf, 0xCu);
    }
  }

  BOOL v18 = -[MessageAttachmentController _shouldUploadPayloadDataOverMMCS:](self, "_shouldUploadPayloadDataOverMMCS:", v12);
  if (v18)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathExtension:@"txt"]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "im_randomTemporaryFileURLWithFileName:", v22));
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 path]);

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v24 stringByResolvingAndStandardizingPath]);
    [v12 writeToFile:v25 atomically:1];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    LOBYTE(v24) = [v26 fileExistsAtPath:v25];

    if ((v24 & 1) != 0)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      if (IMOSLoggingEnabled(v29, v30))
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412802;
          id v49 = v13;
          __int16 v50 = 2112;
          __int16 v51 = v25;
          __int16 v52 = 2112;
          uint64_t v53 = v29;
          _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Wrote payload data for message %@ to file %@ transferID %@",  buf,  0x20u);
        }
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferServicesController sharedInstance]( &OBJC_CLASS___IMTransferServicesController,  "sharedInstance"));
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      void v46[2] = sub_61090;
      v46[3] = &unk_D6D40;
      id v47 = v29;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_611BC;
      v41[3] = &unk_D7088;
      id v42 = v25;
      id v43 = v47;
      id v44 = v13;
      id v45 = v14;
      id v34 = v47;
      [v33 sendFilePath:v42 topic:v40 userInfo:v39 transferID:v34 encryptFile:1 progressBlock:v46 completionBlock:v41];
    }

    else
    {
      if (IMOSLoggingEnabled(v27, v28))
      {
        uint64_t v37 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v49 = v13;
          __int16 v50 = 2112;
          __int16 v51 = v25;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Could not write payload data for msg guid %@ to filepath %@",  buf,  0x16u);
        }
      }

      if (v14) {
        (*((void (**)(id, void, void))v14 + 2))(v14, 0LL, 0LL);
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v18, v19))
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
      __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Not uploading payload data to MMCS", buf, 2u);
      }
    }

    if (v14) {
      (*((void (**)(id, void, uint64_t))v14 + 2))(v14, 0LL, 1LL);
    }
  }
}

- (void)downloadPayloadDataForMessageGUID:(id)a3 payLoadDictionary:(id)a4 topic:(id)a5 completionBlock:(id)a6
{
  id v41 = a3;
  id v9 = a4;
  id v40 = a5;
  id v10 = a6;
  uint64_t v12 = IMOSLoggingEnabled(v10, v11);
  if ((_DWORD)v12)
  {
    uint64_t v14 = OSLogHandleForIMEventCategory("PayloadAttachments");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v48 = v41;
      __int16 v49 = 2112;
      id v50 = v9;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Request to download payload data for message %@ payload dictionary %@",  buf,  0x16u);
    }
  }

  if (v9)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"o"]);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"s"]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"r"]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"e"]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"f"]);
    uint64_t v19 = (void *)v17;
    if (v39 && v38 && v37 && v16 && v17)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathExtension:@"txt"]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "im_randomTemporaryFileURLWithFileName:", v22));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      if (IMOSLoggingEnabled(v24, v25))
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412802;
          id v48 = v36;
          __int16 v49 = 2112;
          id v50 = v24;
          __int16 v51 = 2112;
          id v52 = v41;
          _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "About to start download payload to file %@ with fileTransferID %@ message GUID %@",  buf,  0x20u);
        }
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferServicesController sharedInstance]( &OBJC_CLASS___IMTransferServicesController,  "sharedInstance"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByResolvingAndStandardizingPath]);
      id v30 = [v19 unsignedIntegerValue];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      void v45[2] = sub_61B34;
      v45[3] = &unk_D6D40;
      id v46 = v24;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_61C60;
      v42[3] = &unk_D70B0;
      id v43 = v41;
      id v44 = v10;
      id v31 = v24;
      [v28 receiveFileTransfer:v31 topic:v40 path:v29 requestURLString:v37 ownerID:v39 signature:v38 decryptionKey:v16 fileSize:v30 progressBlock:v45 completionBlock:v42];
    }

    else
    {
      if (IMOSLoggingEnabled(v17, v18))
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138413314;
          id v48 = v39;
          __int16 v49 = 2112;
          id v50 = v38;
          __int16 v51 = 2112;
          id v52 = v37;
          __int16 v53 = 2112;
          uint64_t v54 = v16;
          __int16 v55 = 2112;
          uint64_t v56 = v19;
          _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "PayloadAttachments. Payload data dictionary is incomplete. Cannot download file ownerID %@ signature %@ requ estURLString %@ decryptionKey %@ fileSize %@",  buf,  0x34u);
        }
      }

      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v12, v13))
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("PayloadAttachments");
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "No payload data to download from MMCS", buf, 2u);
      }
    }

    if (v10) {
      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, 1LL);
    }
  }
}

- (void)processDownloadedPayloadData:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8
{
  id v14 = a3;
  id v28 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathComponent:IMFileTransferPluginPayloadAttachmentExtension]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "im_randomTemporaryFileURLWithFileName:", v20));

  id v29 = 0LL;
  LOBYTE(a8) = [v14 writeToURL:v22 options:1 error:&v29];
  id v23 = v29;
  uint64_t v25 = v23;
  if ((a8 & 1) != 0)
  {
    -[MessageAttachmentController _processDownloadedPayload:forMessageGUID:balloonBundleID:fromIdentifier:senderToken:withCompletionBlock:]( self,  "_processDownloadedPayload:forMessageGUID:balloonBundleID:fromIdentifier:senderToken:withCompletionBlock:",  v22,  v28,  v15,  v16,  v17,  v18);
  }

  else
  {
    if (IMOSLoggingEnabled(v23, v24))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v25;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "PayloadAttachments. Failed writing payload data to path %@ error %@",  buf,  0x16u);
      }
    }

    (*((void (**)(id, void, void, void))v18 + 2))(v18, 0LL, 0LL, 0LL);
  }
}

- (void)processMessageAttachmentDictionary:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v34 = v16;
  id v19 = a3;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  uint64_t v21 = IMServiceNameForCanonicalIDSAddresses();
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_622C0;
  v28[3] = &unk_D70D8;
  v28[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  -[MessageAttachmentController downloadPayloadDataForMessageGUID:payLoadDictionary:topic:completionBlock:]( self,  "downloadPayloadDataForMessageGUID:payLoadDictionary:topic:completionBlock:",  v27,  v19,  v22,  v28);
}

- (NSMutableSet)pendingRemoteFileRequests
{
  return self->_pendingRemoteFileRequests;
}

- (void)setPendingRemoteFileRequests:(id)a3
{
}

- (BOOL)shouldSendLowResolutionOnly
{
  return self->_shouldSendLowResolutionOnly;
}

- (NSMutableDictionary)localPayloadDataRequestGUIDToCompletionBlockMap
{
  return self->_localPayloadDataRequestGUIDToCompletionBlockMap;
}

- (void)setLocalPayloadDataRequestGUIDToCompletionBlockMap:(id)a3
{
}

- (NSMutableDictionary)eagerUploadStatuses
{
  return self->_eagerUploadStatuses;
}

- (void)setEagerUploadStatuses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end