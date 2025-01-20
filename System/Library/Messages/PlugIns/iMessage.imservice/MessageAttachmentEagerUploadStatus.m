@interface MessageAttachmentEagerUploadStatus
- (BOOL)cancel;
- (BOOL)isCanceled;
- (BOOL)isComplete;
- (BOOL)isSuccess;
- (MessageAttachmentEagerUploadStatus)initWithOriginalURL:(id)a3 transferId:(id)a4 targetSize:(int64_t)a5;
- (MessageAttachmentSingleStatus)attachmentStatus;
- (NSArray)attachmentSendContexts;
- (NSString)transferId;
- (NSString)transferredName;
- (NSURL)originalURL;
- (double)expiration;
- (id)description;
- (int64_t)state;
- (int64_t)targetSize;
- (int64_t)useCount;
- (unint64_t)totalBytes;
- (void)attachToTransfer:(id)a3 message:(id)a4 commonCapabilities:(id)a5;
- (void)finish;
- (void)incrementUseCount;
- (void)setAttachmentSendContexts:(id)a3;
- (void)setAttachmentStatus:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTotalBytes:(unint64_t)a3;
- (void)setTransferredName:(id)a3;
- (void)start;
- (void)wait:(id)a3;
@end

@implementation MessageAttachmentEagerUploadStatus

- (MessageAttachmentEagerUploadStatus)initWithOriginalURL:(id)a3 transferId:(id)a4 targetSize:(int64_t)a5
{
  v8 = (NSURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MessageAttachmentEagerUploadStatus;
  id v9 = a4;
  v10 = -[MessageAttachmentEagerUploadStatus init](&v22, "init");
  v10->_state = 0LL;
  originalURL = v10->_originalURL;
  v10->_originalURL = v8;
  v12 = v8;

  v13 = (NSString *)objc_msgSend(v9, "copy", v22.receiver, v22.super_class);
  transferId = v10->_transferId;
  v10->_transferId = v13;

  v10->_targetSize = a5;
  v15 = objc_alloc_init(&OBJC_CLASS___MessageAttachmentSingleStatus);
  attachmentStatus = v10->_attachmentStatus;
  v10->_attachmentStatus = v15;

  dispatch_group_t v17 = dispatch_group_create();
  uploadGroup = v10->_uploadGroup;
  v10->_uploadGroup = (OS_dispatch_group *)v17;

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v20 = v19;

  v10->_expiration = v20 + 86400.0;
  return v10;
}

- (void)wait:(id)a3
{
  id v4 = a3;
  uploadGroup = self->_uploadGroup;
  ++self->_waitCount;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_49438;
  v7[3] = &unk_D68F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify((dispatch_group_t)uploadGroup, &_dispatch_main_q, v7);
}

- (void)start
{
  uploadGroup = self->_uploadGroup;
  if (uploadGroup) {
    dispatch_group_enter((dispatch_group_t)uploadGroup);
  }
}

- (void)finish
{
  uploadGroup = self->_uploadGroup;
  if (uploadGroup)
  {
    dispatch_group_leave((dispatch_group_t)uploadGroup);
    uploadGroup = self->_uploadGroup;
  }

  self->_uploadGroup = 0LL;
}

- (BOOL)isCanceled
{
  return self->_state == 3;
}

- (BOOL)isSuccess
{
  if (-[MessageAttachmentEagerUploadStatus isCanceled](self, "isCanceled")) {
    return 0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentSingleStatus transferError](self->_attachmentStatus, "transferError"));
  BOOL v3 = v4 == 0LL;

  return v3;
}

- (BOOL)isComplete
{
  return self->_uploadGroup == 0LL;
}

- (void)incrementUseCount
{
}

- (void)attachToTransfer:(id)a3 message:(id)a4 commonCapabilities:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentEagerUploadStatus attachmentSendContexts](self, "attachmentSendContexts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[MessageAttachmentController _combinedTransferUserInfoForAttachmentSendContexts:transfer:message:commonCapabilities:]( &OBJC_CLASS___MessageAttachmentController,  "_combinedTransferUserInfoForAttachmentSendContexts:transfer:message:commonCapabilities:",  v11,  v10,  v9,  v8));

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
  [v17 startTransfer:v13];
  [v10 setUserInfo:v12];
  [v10 setAttachmentSendContexts:v11];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);

  [v10 setMessageGUID:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageAttachmentEagerUploadStatus transferredName](self, "transferredName"));
  [v10 setTransferredFilename:v15];

  unint64_t v16 = -[MessageAttachmentEagerUploadStatus totalBytes](self, "totalBytes");
  [v17 updateTransfer:v13 currentBytes:v16 totalBytes:v16];
  [v17 endTransfer:v13];
}

- (BOOL)cancel
{
  if (-[MessageAttachmentEagerUploadStatus isCanceled](self, "isCanceled")
    || -[MessageAttachmentEagerUploadStatus isComplete](self, "isComplete")
    || self->_waitCount)
  {
    return 0;
  }

  self->_state = 3LL;
  -[MessageAttachmentEagerUploadStatus finish](self, "finish");
  return 1;
}

- (id)description
{
  unint64_t state = self->_state;
  if (state > 5) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_D70F8 + state);
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> transferId=%@ originalURL=%@ state=%@ useCount=%zd waitCount=%zd",  objc_opt_class(self),  self,  self->_transferId,  self->_originalURL,  v3,  self->_useCount,  self->_waitCount);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (MessageAttachmentSingleStatus)attachmentStatus
{
  return (MessageAttachmentSingleStatus *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAttachmentStatus:(id)a3
{
}

- (NSURL)originalURL
{
  return (NSURL *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)transferredName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTransferredName:(id)a3
{
}

- (NSString)transferId
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (int64_t)targetSize
{
  return self->_targetSize;
}

- (NSArray)attachmentSendContexts
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAttachmentSendContexts:(id)a3
{
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (int64_t)useCount
{
  return self->_useCount;
}

- (double)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
}

@end