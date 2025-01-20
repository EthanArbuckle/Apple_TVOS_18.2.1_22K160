@interface MessageTranscodeController
+ (id)sharedInstance;
- (void)generateSnapshotForMessageGUID:(id)a3 payloadData:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7;
- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 representations:(int64_t)a8 isLQMEnabled:(BOOL)a9 completionBlock:(id)a10;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 transcoderUserInfo:(id)a6 sizes:(id)a7 commonCapabilities:(id)a8 representations:(int64_t)a9 isLQMEnabled:(BOOL)a10 completionBlock:(id)a11;
- (void)transcodePayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6;
- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4;
@end

@implementation MessageTranscodeController

+ (id)sharedInstance
{
  if (qword_E4548 != -1) {
    dispatch_once(&qword_E4548, &stru_D7968);
  }
  return (id)qword_E4550;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 transcoderUserInfo:(id)a6 sizes:(id)a7 commonCapabilities:(id)a8 representations:(int64_t)a9 isLQMEnabled:(BOOL)a10 completionBlock:(id)a11
{
  if (a11)
  {
    BOOL v14 = a5;
    if (IMOSLoggingEnabled(self, a2))
    {
      v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = a3;
        __int16 v27 = 2112;
        id v28 = a6;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Transcoder received request to transcode: %@  transcodeInfo: %@",  buf,  0x16u);
      }
    }

    char v24 = 0;
    BOOL v18 = -[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  [a3 path],  &v24);
    if (v18)
    {
      if (v24)
      {
        if (IMOSLoggingEnabled(v18, v19))
        {
          v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Input URL is a directory, not transcoding", buf, 2u);
          }
        }

        uint64_t v21 = IMSingleObjectArray(a3);
        (*((void (**)(id, id, uint64_t, void, void, uint64_t, void, void))a11 + 2))( a11,  a3,  v21,  0LL,  0LL,  1LL,  0LL,  0LL);
      }

      else
      {
        LOBYTE(v23) = a10;
        -[IMTranscodeController transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:]( +[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"),  "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimensi on:transcoderUserInfo:representations:isLQMEnabled:completionBlock:",  a3,  a4,  v14,  +[IMDAttachmentUtilities messageAttachmentSendableUTIs]( &OBJC_CLASS___IMDAttachmentUtilities,  "messageAttachmentSendableUTIs"),  0LL,  a7,  a8,  -1LL,  a6,  a9,  v23,  a11);
      }
    }

    else
    {
      if (IMOSLoggingEnabled(v18, v19))
      {
        v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = a3;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "File doesn't exist at source path (%@), failing transcoding",  buf,  0xCu);
        }
      }

      (*((void (**)(id, id, void, void, void, void, void, void))a11 + 2))( a11,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    }
  }

- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 representations:(int64_t)a8 isLQMEnabled:(BOOL)a9 completionBlock:(id)a10
{
  LOBYTE(v10) = a9;
  -[IMTranscodeController transcodeFallbackFileTransferContents:utiType:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:]( +[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"),  "transcodeFallbackFileTransferContents:utiType:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:trans coderUserInfo:representations:isLQMEnabled:completionBlock:",  a3,  a4,  0LL,  0LL,  a6,  a7,  -1LL,  a5,  a8,  v10,  a10);
}

- (void)transcodePayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6
{
  if (a6)
  {
    if (IMOSLoggingEnabled(self, a2))
    {
      uint64_t v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218242;
        id v12 = [a3 length];
        __int16 v13 = 2112;
        id v14 = a4;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Transcoder received request to fallback data : %lu  balloonBundleID: %@",  (uint8_t *)&v11,  0x16u);
      }
    }

    -[IMTranscodeController transcodeFallbackFileTransferPayloadData:balloonBundleID:attachments:completionBlock:]( +[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"),  "transcodeFallbackFileTransferPayloadData:balloonBundleID:attachments:completionBlock:",  a3,  a4,  a5,  a6);
  }

- (void)generateSnapshotForMessageGUID:(id)a3 payloadData:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  uint64_t PayloadURL = IMSharedHelperExtractPayloadURL(a4, a2);
  int v14 = IMOSLoggingEnabled(PayloadURL, v13);
  if (PayloadURL)
  {
    if (v14)
    {
      v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 134218242;
        id v18 = [a4 length];
        __int16 v19 = 2112;
        id v20 = a5;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Transcoder received request to snapshot data: %lu  balloonBundleID: %@",  (uint8_t *)&v17,  0x16u);
      }
    }

    -[IMTranscodeController generateSnapshotForMessageGUID:payloadURL:balloonBundleID:senderContext:completionBlock:]( +[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"),  "generateSnapshotForMessageGUID:payloadURL:balloonBundleID:senderContext:completionBlock:",  a3,  PayloadURL,  a5,  a6,  a7);
  }

  else
  {
    if (v14)
    {
      v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Failed to extract URL from payload data!", (uint8_t *)&v17, 2u);
      }
    }

    (*((void (**)(id, void, NSError *))a7 + 2))( a7,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IMTranscodeErrorDomain,  -3LL,  0LL));
  }

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
}

@end