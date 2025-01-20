@interface IMDMSAAttachment
- (BOOL)hideAttachment;
- (BOOL)isOutgoing;
- (BOOL)isSticker;
- (IMDMSAAttachment)initWithAttachment:(_IMDAttachmentRecordStruct *)a3;
- (NSString)GUID;
- (NSString)UTIType;
- (NSString)mimeType;
- (NSString)path;
- (void)dealloc;
@end

@implementation IMDMSAAttachment

- (IMDMSAAttachment)initWithAttachment:(_IMDAttachmentRecordStruct *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IMDMSAAttachment;
  v4 = -[IMDMSAAttachment init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      _IMDAttachmentRecordBulkCopy( a3,  &v4->_GUID,  0LL,  0LL,  0LL,  &v4->_path,  &v4->_UTIType,  &v4->_mimeType,  0LL,  &v4->_isOutgoing,  0LL,  0LL,  &v4->_isSticker,  0LL,  0LL,  &v4->_hideAttachment,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    }

    else
    {

      return 0LL;
    }
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IMDMSAAttachment;
  -[IMDMSAAttachment dealloc](&v3, "dealloc");
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)UTIType
{
  return self->_UTIType;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

@end