@interface SMSPart
- (NSArray)attachmentParts;
- (NSArray)textParts;
- (void)addAttachmentPart:(id)a3;
- (void)addTextPart:(id)a3;
@end

@implementation SMSPart

- (void)addTextPart:(id)a3
{
  id v4 = a3;
  textParts = self->_textParts;
  id v8 = v4;
  if (!textParts)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_textParts;
    self->_textParts = v6;

    id v4 = v8;
    textParts = self->_textParts;
  }

  -[NSMutableArray addObject:](textParts, "addObject:", v4);
}

- (void)addAttachmentPart:(id)a3
{
  id v4 = a3;
  attachmentParts = self->_attachmentParts;
  id v8 = v4;
  if (!attachmentParts)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_attachmentParts;
    self->_attachmentParts = v6;

    id v4 = v8;
    attachmentParts = self->_attachmentParts;
  }

  -[NSMutableArray addObject:](attachmentParts, "addObject:", v4);
}

- (NSArray)textParts
{
  return &self->_textParts->super;
}

- (NSArray)attachmentParts
{
  return &self->_attachmentParts->super;
}

- (void).cxx_destruct
{
}

@end