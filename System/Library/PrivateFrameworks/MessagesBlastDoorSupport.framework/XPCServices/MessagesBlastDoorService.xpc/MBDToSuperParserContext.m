@interface MBDToSuperParserContext
+ (id)fileTransferInfoWithName:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7;
- (BOOL)_lastCharacterInCurrentBodyIsAttachment;
- (BOOL)appendLivePhotoAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6;
- (BOOL)supportsMessagePartNumbersInAttributes;
- (NSAttributedString)body;
- (NSString)backgroundColor;
- (NSString)foregroundColor;
- (id)attachmentCharacterString;
- (id)name;
- (id)resultsForLogging;
- (int64_t)baseWritingDirection;
- (unint64_t)_currentMessagePart;
- (unint64_t)_inferredMessagePartForNewFile;
- (unint64_t)_inferredMessagePartForNewText;
- (unint64_t)_messagePartForLastCharacterInCurrentBody;
- (unint64_t)_nextAvailableMessagePart;
- (void)_clearIvars;
- (void)_initIvars;
- (void)_popValueFromStack:(id)a3 attributeName:(id)a4;
- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5;
- (void)_updateCurrentAttributesWithMessagePartNumber;
- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4;
- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)popIsRichLink;
- (void)popLink;
- (void)popMentionAttribute;
- (void)popMessagePartNumber;
- (void)popTextBoldAttribute;
- (void)popTextEffectAttribute;
- (void)popTextItalicAttribute;
- (void)popTextStrikethroughAttribute;
- (void)popTextUnderlineAttribute;
- (void)pushIsRichLink:(id)a3;
- (void)pushLink:(id)a3;
- (void)pushMentionAttributeWithURI:(id)a3;
- (void)pushMessagePartNumber:(unint64_t)a3;
- (void)pushTextBoldAttribute;
- (void)pushTextEffectAttributeWithType:(unint64_t)a3;
- (void)pushTextItalicAttribute;
- (void)pushTextStrikethroughAttribute;
- (void)pushTextUnderlineAttribute;
- (void)reset;
- (void)setBackgroundColor:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation MBDToSuperParserContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MBDToSuperParserContext;
  -[MBDToSuperParserContext dealloc](&v3, "dealloc");
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MBDToSuperParserContext;
  -[MBDXMLParserContext reset](&v3, "reset");
}

- (id)name
{
  return @"MBDToSuperParser";
}

- (id)resultsForLogging
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"backgroundColor",  @"foregroundColor",  @"body",  @"fileTransferAttributes",  0LL);
}

- (void)_initIvars
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  messagePartNumberStack = self->_messagePartNumberStack;
  self->_messagePartNumberStack = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  allUsedMessagePartNumbers = self->_allUsedMessagePartNumbers;
  self->_allUsedMessagePartNumbers = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  linkStack = self->_linkStack;
  self->_linkStack = v7;

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = v9;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0LL;

  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = 0LL;

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  body = self->_body;
  self->_body = v13;

  self->_baseWritingDirection = -1LL;
}

- (void)_clearIvars
{
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = 0LL;

  messagePartNumberStack = self->_messagePartNumberStack;
  self->_messagePartNumberStack = 0LL;

  allUsedMessagePartNumbers = self->_allUsedMessagePartNumbers;
  self->_allUsedMessagePartNumbers = 0LL;

  linkStack = self->_linkStack;
  self->_linkStack = 0LL;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0LL;

  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = 0LL;

  body = self->_body;
  self->_body = 0LL;
}

- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    [a4 addObject:v9];
    -[NSMutableDictionary setObject:forKey:](self->_currentAttributes, "setObject:forKey:", v9, v8);
  }

- (void)_popValueFromStack:(id)a3 attributeName:(id)a4
{
  id v6 = a4;
  [a3 removeLastObject];
  -[NSMutableDictionary removeObjectForKey:](self->_currentAttributes, "removeObjectForKey:", v6);
}

- (void)pushLink:(id)a3
{
}

- (void)popLink
{
}

- (void)pushIsRichLink:(id)a3
{
}

- (void)popIsRichLink
{
}

- (void)_updateCurrentAttributesWithMessagePartNumber
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_messagePartNumberStack, "lastObject"));
  currentAttributes = self->_currentAttributes;
  id v5 = (id)v3;
  if (v3) {
    -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v3, MBDIMMessagePartAttributeName);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", MBDIMMessagePartAttributeName);
  }
}

- (void)pushMessagePartNumber:(unint64_t)a3
{
  if (-[NSMutableIndexSet containsIndex:](self->_allUsedMessagePartNumbers, "containsIndex:")
    && -[MBDToSuperParserContext _messagePartForLastCharacterInCurrentBody]( self,  "_messagePartForLastCharacterInCurrentBody") != a3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Message parser found non-contigous message part numbers",  0LL));
    objc_exception_throw(v7);
    -[MBDToSuperParserContext popMessagePartNumber](v8, v9);
  }

  else
  {
    messagePartNumberStack = self->_messagePartNumberStack;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableArray addObject:](messagePartNumberStack, "addObject:", v6);

    -[NSMutableIndexSet addIndex:](self->_allUsedMessagePartNumbers, "addIndex:", a3);
    -[MBDToSuperParserContext _updateCurrentAttributesWithMessagePartNumber]( self,  "_updateCurrentAttributesWithMessagePartNumber");
  }

- (void)popMessagePartNumber
{
}

- (BOOL)_lastCharacterInCurrentBodyIsAttachment
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBDToSuperParserContext attachmentCharacterString](self, "attachmentCharacterString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString string](self->_body, "string"));
  if ([v4 hasSuffix:v3])
  {
    id v5 = (char *)-[NSMutableAttributedString length](self->_body, "length");
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableAttributedString attribute:atIndex:effectiveRange:]( self->_body,  "attribute:atIndex:effectiveRange:",  MBDIMFileTransferAttributeName,  v5 - 1,  0LL));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _stringForKey:MBDIMFileTransferEmojiImageContentIdentifierKey]);
      BOOL v9 = [v8 length] == 0;
    }

    else
    {
      BOOL v9 = 1;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)_messagePartForLastCharacterInCurrentBody
{
  if (!-[NSMutableAttributedString length](self->_body, "length")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = (char *)-[NSMutableAttributedString length](self->_body, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableAttributedString attribute:atIndex:effectiveRange:]( self->_body,  "attribute:atIndex:effectiveRange:",  MBDIMMessagePartAttributeName,  v3 - 1,  0LL));
  id v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (unint64_t)_nextAvailableMessagePart
{
  unint64_t result = (unint64_t)-[NSMutableIndexSet count](self->_allUsedMessagePartNumbers, "count");
  if (result) {
    return (unint64_t)-[NSMutableIndexSet lastIndex](self->_allUsedMessagePartNumbers, "lastIndex") + 1;
  }
  return result;
}

- (unint64_t)_currentMessagePart
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_messagePartNumberStack, "lastObject"));
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (unint64_t)_inferredMessagePartForNewText
{
  if (-[MBDToSuperParserContext _lastCharacterInCurrentBodyIsAttachment]( self,  "_lastCharacterInCurrentBodyIsAttachment"))
  {
    return -[MBDToSuperParserContext _nextAvailableMessagePart](self, "_nextAvailableMessagePart");
  }

  unint64_t result = -[MBDToSuperParserContext _messagePartForLastCharacterInCurrentBody]( self,  "_messagePartForLastCharacterInCurrentBody");
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return -[MBDToSuperParserContext _nextAvailableMessagePart](self, "_nextAvailableMessagePart");
  }
  return result;
}

- (unint64_t)_inferredMessagePartForNewFile
{
  return -[MBDToSuperParserContext _nextAvailableMessagePart](self, "_nextAvailableMessagePart");
}

- (void)pushMentionAttributeWithURI:(id)a3
{
}

- (void)popMentionAttribute
{
}

- (void)pushTextEffectAttributeWithType:(unint64_t)a3
{
  currentAttributes = self->_currentAttributes;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:", v4, MBDIMTextEffectAttributeName);
}

- (void)popTextEffectAttribute
{
}

- (void)pushTextBoldAttribute
{
}

- (void)popTextBoldAttribute
{
}

- (void)pushTextItalicAttribute
{
}

- (void)popTextItalicAttribute
{
}

- (void)pushTextUnderlineAttribute
{
}

- (void)popTextUnderlineAttribute
{
}

- (void)pushTextStrikethroughAttribute
{
}

- (void)popTextStrikethroughAttribute
{
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = -[NSMutableArray count](self->_messagePartNumberStack, "count");
    if (!v4) {
      -[MBDToSuperParserContext pushMessagePartNumber:]( self,  "pushMessagePartNumber:",  -[MBDToSuperParserContext _inferredMessagePartForNewText](self, "_inferredMessagePartForNewText"));
    }
    id v5 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v6,  self->_currentAttributes);
    -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v5);
    if (!v4) {
      -[MBDToSuperParserContext popMessagePartNumber](self, "popMessagePartNumber");
    }
  }
}

+ (id)fileTransferInfoWithName:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (__CFString *)a3;
  v16 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
  v17 = v16;
  if (v15) {
    v18 = v15;
  }
  else {
    v18 = &stru_1000A8D68;
  }
  -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v18, MBDIMFileTransferNameKey);

  if ([v11 count])
  {
    id v19 = [v11 copy];
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v19, MBDIMFileTransferAttachmentsKey);
  }

  if ([v12 count])
  {
    id v20 = [v12 copy];
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v20, MBDIMFileTransferImageInfoKey);
  }

  if ([v13 count])
  {
    id v21 = [v13 copy];
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v21, MBDIMFileTransferStickerInfoKey);
  }

  if ([v14 count]) {
    -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v14);
  }
  if (-[NSMutableDictionary count](v17, "count")) {
    id v22 = -[NSMutableDictionary copy](v17, "copy");
  }
  else {
    id v22 = 0LL;
  }

  return v22;
}

- (id)attachmentCharacterString
{
  __int16 v3 = -4;
  return  -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  &v3,  1LL);
}

- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7
{
  uint64_t v12 = MBDIMFileTransferEmojiImageContentIdentifierKey;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 _stringForKey:v12]);
  id v19 = [v18 length];

  id v20 = -[NSMutableArray count](self->_messagePartNumberStack, "count");
  if (!v20)
  {
    if (v19) {
      unint64_t v21 = -[MBDToSuperParserContext _inferredMessagePartForNewText](self, "_inferredMessagePartForNewText");
    }
    else {
      unint64_t v21 = -[MBDToSuperParserContext _inferredMessagePartForNewFile](self, "_inferredMessagePartForNewFile");
    }
    -[MBDToSuperParserContext pushMessagePartNumber:](self, "pushMessagePartNumber:", v21);
  }

  id v22 = [(id)objc_opt_class(self) fileTransferInfoWithName:v17 attachments:v16 imageInfo:v15 stickerInfo:v14 emojiImageInfo:v13];
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MBDToSuperParserContext attachmentCharacterString](self, "attachmentCharacterString"));
  unint64_t v25 = -[MBDToSuperParserContext _currentMessagePart](self, "_currentMessagePart");
  v30[0] = MBDIMFileTransferAttributeName;
  id v26 = [v23 copy];
  v31[0] = v26;
  v30[1] = MBDIMMessagePartAttributeName;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v25));
  v31[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));

  v29 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v24,  v28);
  -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v29);
  if (!v20) {
    -[MBDToSuperParserContext popMessagePartNumber](self, "popMessagePartNumber");
  }
}

- (BOOL)appendLivePhotoAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MBDToSuperParserContext attachmentCharacterString](self, "attachmentCharacterString"));
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3010000000LL;
  v29 = "";
  __int128 v30 = xmmword_10008D0F0;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString string](self->_body, "string"));
  id v16 = [v15 length];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString string](self->_body, "string"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008678;
  v23[3] = &unk_1000A2D50;
  id v18 = v14;
  id v24 = v18;
  unint64_t v25 = &v26;
  objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v16, 258, v23);

  uint64_t v19 = v27[4];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v20 = [(id)objc_opt_class(self) fileTransferInfoWithName:v10 attachments:v11 imageInfo:v12 stickerInfo:v13 emojiImageInfo:0];
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSMutableAttributedString addAttribute:value:range:]( self->_body,  "addAttribute:value:range:",  MBDIMLivePhotoAttributeName,  v21,  v27[4],  v27[5]);
  }

  _Block_object_dispose(&v26, 8);
  return v19 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[0] = MBDIMBreadcrumbTextMarkerAttributeName;
  v11[1] = MBDIMBreadcrumbTextOptionFlags;
  v12[0] = a3;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  v12[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));

  BOOL v9 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  id v10 = -[NSAttributedString initWithString:attributes:]( v9,  "initWithString:attributes:",  MBDIMBreadcrumbCharacterString,  v8);
  -[NSMutableAttributedString appendAttributedString:](self->_body, "appendAttributedString:", v10);
}

- (NSAttributedString)body
{
  id v3 = -[NSMutableAttributedString length](self->_body, "length");
  if (!self->_didAddBodyAttributes && v3 != 0LL)
  {
    id v5 = v3;
    id v6 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  self->_baseWritingDirection);
    -[NSMutableAttributedString addAttribute:value:range:]( self->_body,  "addAttribute:value:range:",  MBDIMBaseWritingDirectionAttributeName,  v6,  0LL,  v5);
    self->_didAddBodyAttributes = 1;
  }

  return (NSAttributedString *)self->_body;
}

- (BOOL)supportsMessagePartNumbersInAttributes
{
  return 0;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (int64_t)baseWritingDirection
{
  return self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_baseWritingDirection = a3;
}

- (void).cxx_destruct
{
}

@end