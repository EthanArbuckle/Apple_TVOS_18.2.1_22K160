@interface SuperToMessageParserContext
- (BOOL)includeMessageParts;
- (BOOL)isAudioMessage;
- (BOOL)isSimpleString;
- (BOOL)shouldPreprocess;
- (NSString)AuxHTML;
- (NSString)outHTML;
- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4;
- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4 isAudioMessage:(BOOL)a5;
- (id)name;
- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 atCharacterIndex:(int64_t)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parser:(id)a3 foundBreadcrumbText:(id)a4 withOptions:(unsigned int)a5;
- (void)parserDidEnd:(id)a3;
- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4;
@end

@implementation SuperToMessageParserContext

- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4
{
  return -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:isAudioMessage:]( self,  "initWithAttributedString:includeMessageParts:isAudioMessage:",  a3,  a4,  0LL);
}

- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4 isAudioMessage:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SuperToMessageParserContext;
  v7 = -[SuperToMessageParserContext initWithAttributedString:](&v9, "initWithAttributedString:", a3);
  if (v7)
  {
    v7->_outHTML = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    v7->_isSimpleString = 1;
    v7->_includeMessageParts = a4;
    v7->_isAudioMessage = a5;
    v7->_AuxHTML = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SuperToMessageParserContext;
  -[SuperToMessageParserContext dealloc](&v3, "dealloc");
}

- (id)name
{
  return @"SuperToMessage";
}

- (id)resultsForLogging
{
  return +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"outHTML", 0LL);
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v7 = [a4 objectForKey:IMMessageBackgroundColorAttributeName];
  if (v7) {
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"background-color:%@;", v7);
  }
  id v8 = [a4 objectForKey:IMMessageForegroundColorAttributeName];
  if (v8) {
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"color:%@;", v8);
  }
  if (-[NSMutableString length](v6, "length"))
  {
    -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" style=\"%@\"", v6);
    -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" style=\"%@\"", v6);
  }

  id v9 = [a4 objectForKey:IMBaseWritingDirectionAttributeName];
  if (v9)
  {
    v10 = (char *)[v9 integerValue];
    if (v10 == (_BYTE *)&dword_0 + 1)
    {
      v11 = @" dir=\"rtl\"";
      goto LABEL_12;
    }

    if (!v10)
    {
      v11 = @" dir=\"ltr\"";
LABEL_12:
      -[NSMutableString appendString:](self->_outHTML, "appendString:", v11);
      -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v11);
    }
  }

  -[NSMutableString appendString:](self->_outHTML, "appendString:", @">");
  -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @">");
  id v12 = -[NSMutableString isEqualToString:](self->_AuxHTML, "isEqualToString:", self->_outHTML);
  if ((v12 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v12, v13))
    {
      v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        AuxHTML = self->_AuxHTML;
        outHTML = self->_outHTML;
        *(_DWORD *)buf = 138412546;
        v18 = AuxHTML;
        __int16 v19 = 2112;
        v20 = outHTML;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "SuperToMessageParser parseDidStart _AuxHTML != _outHML, _AuxHTML %@, _outHTML %@",  buf,  0x16u);
      }
    }
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  id v8 = [a4 _stringForKey:IMBackgroundColorAttributeName];
  id v49 = [a4 _stringForKey:IMForegroundColorAttributeName];
  id v9 = [a4 _stringForKey:IMFontFamilyAttributeName];
  id v48 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMFontSizeAttributeName), "integerValue");
  unsigned int v10 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMUnderlineAttributeName), "BOOLValue");
  unsigned int v47 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMBoldAttributeName), "BOOLValue");
  unsigned int v46 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMItalicAttributeName), "BOOLValue");
  unsigned int v45 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMStrikethroughAttributeName), "BOOLValue");
  id v11 = [a4 objectForKey:IMLinkAttributeName];
  id v12 = [a4 objectForKey:IMLinkIsRichLinkAttributeName];
  id v13 = [a4 objectForKey:IMMentionConfirmedMention];
  id v56 = [a4 objectForKey:IMTextEffectAttributeName];
  id v50 = [a4 objectForKey:IMTextBoldAttributeName];
  id v51 = [a4 objectForKey:IMTextItalicAttributeName];
  id v52 = [a4 objectForKey:IMTextUnderlineAttributeName];
  id v53 = [a4 objectForKey:IMTextStrikethroughAttributeName];
  if (self->_includeMessageParts) {
    unint64_t v14 = (unint64_t)[a4 objectForKey:IMMessagePartAttributeName];
  }
  else {
    unint64_t v14 = 0LL;
  }
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v16 = v15;
  id v55 = v11;
  if (v11)
  {
    unint64_t v44 = v14;
    v17 = v15;
    v18 = (void *)IMCreateEscapedAttributeValueFromString([v11 absoluteString]);
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<a href=\"");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<a href=\"");
    -[NSMutableString appendString:](self->_outHTML, "appendString:", v18);
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v18);
    if (v12)
    {
      unsigned int v19 = [v12 BOOLValue];
      -[NSMutableString appendString:](self->_outHTML, "appendString:", @"\" isRichLink=\"");
      if (v19) {
        v20 = @"1";
      }
      else {
        v20 = @"0";
      }
      -[NSMutableString appendString:](self->_outHTML, "appendString:", v20);
      -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"\" isRichLink=\"");
      -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v20);
    }

    -[NSMutableString appendString:](self->_outHTML, "appendString:", @">");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @">");

    v16 = v17;
    unint64_t v14 = v44;
  }

  if (v47) {
    -[NSMutableString appendString:](v16, "appendString:", @"font-weight: bold;");
  }
  v21 = v56;
  if (v46) {
    -[NSMutableString appendString:](v16, "appendString:", @"font-style: italic;");
  }
  if ((v10 | v45) == 1)
  {
    if (v10) {
      v22 = @"text-decoration: underline;";
    }
    else {
      v22 = @"text-decoration: line-through;";
    }
    -[NSMutableString appendString:](v16, "appendString:", v22);
  }

  if ([v9 length])
  {
    v23 = (void *)IMCopySafeNameOfFontFamilyName(v9);
    v24 = (void *)IMCreateEscapedAttributeValueFromString(v23);
    -[NSMutableString appendFormat:](v16, "appendFormat:", @"font-family: '%@';", v24);
  }

  if (v48) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @"font-size: %dpx;", v48);
  }
  if ([v49 length]) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @"color: %@;", v49);
  }
  if ([v8 length]) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @"background-color: %@;", v8);
  }
  unint64_t v25 = (unint64_t)-[NSMutableString length](v16, "length");
  BOOL v26 = (v25 | v14) != 0;
  if (v25 | v14)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<span");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<span");
    if (-[NSMutableString length](v16, "length")) {
      -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" style=\"%@\"", v16);
    }
    if (v14)
    {
      -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @" message-part=\"%d\",  [(id)v14 intValue]);
      -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @" message-part=\"%d\",  [(id)v14 intValue]);
    }

    -[NSMutableString appendString:](self->_outHTML, "appendString:", @">");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @">");
    v21 = v56;
  }

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v27) & 1) != 0 && [v13 length])
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<mention uri=\"");
    id v28 = objc_msgSend( v13,  "stringByAddingPercentEncodingWithAllowedCharacters:",  IMMentionHandleAllowedCharacterSet(-[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<mention uri=\"")));
    -[NSMutableString appendString:](self->_outHTML, "appendString:", v28);
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v28);
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @">");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @">");
    int v29 = 1;
  }

  else
  {
    int v29 = 0;
  }

  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v21, v30);
  if ((isKindOfClass & 1) != 0)
  {
    -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @"<texteffect type=%u>",  [v21 unsignedIntValue]);
    -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @"<texteffect type=%u>",  [v21 unsignedIntValue]);
  }

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char v33 = objc_opt_isKindOfClass(v50, v32);
  if ((v33 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<b>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<b>");
  }

  uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char v35 = objc_opt_isKindOfClass(v51, v34);
  if ((v35 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<i>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<i>");
  }

  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char v37 = objc_opt_isKindOfClass(v52, v36);
  if ((v37 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<u>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<u>");
  }

  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char v39 = objc_opt_isKindOfClass(v53, v38);
  if ((v39 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"<s>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"<s>");
  }

  v40 = (void *)IMCreateEscapedStringFromString(a6, @"&#160;", @"<br/>", 0LL, 0LL);
  if (v40)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", v40);
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v40);
  }

  if ((v39 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"</s>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"</s>");
  }

  if ((v37 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"</u>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"</u>");
  }

  if ((v35 & 1) != 0)
  {
    -[NSMutableString appendString:](self->_outHTML, "appendString:", @"</i>");
    -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"</i>");
    if ((v33 & 1) == 0)
    {
LABEL_56:
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_57;
      }
      goto LABEL_63;
    }
  }

  else if ((v33 & 1) == 0)
  {
    goto LABEL_56;
  }

  -[NSMutableString appendString:](self->_outHTML, "appendString:", @"</b>");
  -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"</b>");
  if ((isKindOfClass & 1) == 0)
  {
LABEL_57:
    if (!v29) {
      goto LABEL_58;
    }
    goto LABEL_64;
  }

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length >= 2)
  {
    id v17 = a7;
    v18 = (os_log_s *)IMLogHandleForCategory("Parser");
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    a7 = v17;
    if (v19)
    {
      *(_DWORD *)buf = 134217984;
      NSUInteger v28 = length;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Adjacent characters share the same file transfer. Length=%ld",  buf,  0xCu);
      a7 = v17;
    }
  }

  if (location < location + length)
  {
    do
    {
      id v20 = a3;
      id v21 = a4;
      id v22 = a6;
      id v23 = a3;
      id v24 = a4;
      id v25 = a6;
      id v26 = a7;
      -[SuperToMessageParserContext parser:foundAttributes:atCharacterIndex:fileTransferGUID:filename:bookmark:width:height:isAnimoji:]( self,  "parser:foundAttributes:atCharacterIndex:fileTransferGUID:filename:bookmark:width:height:isAnimoji:",  v20,  v21,  location,  v22,  a7,  a8,  a9,  a10,  a11);
      a7 = v26;
      a6 = v25;
      a4 = v24;
      a3 = v23;
      ++location;
      --length;
    }

    while (length);
  }

- (void)parser:(id)a3 foundAttributes:(id)a4 atCharacterIndex:(int64_t)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  id v12 = (_UNKNOWN **)a9;
  id v11 = (_UNKNOWN **)a10;
  if (!a9) {
    id v12 = &off_DB540;
  }
  if (!a10) {
    id v11 = &off_DB540;
  }
  v85 = v11;
  v86 = v12;
  if (a6)
  {
    id v13 = a7;
    self->_isSimpleString = 0;
    id v16 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance",  a3,  a4,  a5,  a6,  a7,  a8),  "transferForGUID:",  a6);
    if (v16)
    {
      id v17 = v16;
      if (objc_msgSend(objc_msgSend(v16, "transferredFilename"), "length"))
      {
        id v13 = objc_msgSend(objc_msgSend(v17, "transferredFilename"), "lastPathComponent");
        if (IMOSLoggingEnabled(v13, v18))
        {
          BOOL v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v13;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
          }
        }
      }

      if (![v13 length])
      {
        id v13 = objc_msgSend(objc_msgSend(v17, "localPath"), "lastPathComponent");
        if (IMOSLoggingEnabled(v13, v20))
        {
          id v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v13;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
          }
        }
      }

      if (v13)
      {
        id v22 = [v13 lastPathComponent];
        if (IMOSLoggingEnabled(v22, v23))
        {
          id v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v22;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
          }
        }

        if (v22)
        {
          id v25 = +[IMFileManager defaultHFSFileManager](&OBJC_CLASS___IMFileManager, "defaultHFSFileManager");
          v83 = (void *)IMCreateEscapedAttributeValueFromString(v22);
          v82 = (__CFString *)[v17 userInfo];
          uint64_t v92 = 0LL;
          id v26 = objc_msgSend( +[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"),  "attributesOfItemAtPath:error:",  objc_msgSend(v17, "localPath"),  &v92);
          -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\",  v83,  [v86 integerValue],  objc_msgSend(v85, "integerValue"),  objc_msgSend(v26, "fileSize""));
          -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\",  v83,  [v86 integerValue],  objc_msgSend(v85, "integerValue"),  objc_msgSend(v26, "fileSize""));
          if (a11)
          {
            uint64_t v27 = (void *)IMCreateEscapedAttributeValueFromString(@"x-apple-anim-emoji");
            uint64_t v28 = IMCreateEscapedAttributeValueFromString([a11 stringValue]);
            int v29 = (void *)v28;
            if (v27 && v28)
            {
              -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" %@=\"%@\"", v27, v28);
              -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v27, v29);
            }
          }

          id v30 = [v25 MIMETypeOfPath:v22];
          if ([v30 length])
          {
            v31 = (void *)IMCreateEscapedAttributeValueFromString(@"mime-type");
            uint64_t v32 = IMCreateEscapedAttributeValueFromString(v30);
            char v33 = (void *)v32;
            if (v31 && v32)
            {
              -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" %@=\"%@\"", v31, v32);
              -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v31, v33);
            }
          }

          id v34 = [v25 UTITypeOfPath:v22];
          if ([v34 length])
          {
            char v35 = (void *)IMCreateEscapedAttributeValueFromString(@"uti-type");
            uint64_t v36 = IMCreateEscapedAttributeValueFromString(v34);
            char v37 = (void *)v36;
            if (v35 && v36)
            {
              -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" %@=\"%@\"", v35, v36);
              -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v35, v37);
            }
          }

          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472LL;
          v91[2] = sub_35F0C;
          v91[3] = &unk_D6210;
          v91[4] = self;
          id v38 = -[__CFString enumerateKeysAndObjectsUsingBlock:](v82, "enumerateKeysAndObjectsUsingBlock:", v91);
          if (IMOSLoggingEnabled(v38, v39))
          {
            v40 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              unsigned int v41 = [v17 isSticker];
              uint64_t v42 = @"NO";
              if (v41) {
                uint64_t v42 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              id v94 = v17;
              __int16 v95 = 2112;
              v96 = v42;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "transfer %@ isSticker %@", buf, 0x16u);
            }
          }

          if ([v17 isSticker])
          {
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_35FDC;
            v88[3] = &unk_D6238;
            id v89 = [v17 stickerUserInfo];
            v90 = self;
            [v89 enumerateKeysAndObjectsUsingBlock:v88];
          }

          if ([v17 isAdaptiveImageGlyph])
          {
            id v43 = [v17 adaptiveImageGlyphContentIdentifier];
            if ([v43 length])
            {
              unint64_t v44 = (void *)IMCreateEscapedAttributeValueFromString(v43);
              -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" emoji-image-id=\"%@\"", v44);
              -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" emoji-image-id=\"%@\"", v44);
            }

            id v45 = [v17 adaptiveImageGlyphContentDescription];
            if ([v45 length])
            {
              unsigned int v46 = (void *)IMCreateEscapedAttributeValueFromString(v45);
              -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @" emoji-image-description=\"%@\"",  v46);
              -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @" emoji-image-description=\"%@\"",  v46);
            }
          }

          if (self->_includeMessageParts)
          {
            id v47 = [a4 objectForKey:IMMessagePartAttributeName];
            id v48 = v47;
            if (v47)
            {
              -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @" message-part=\"%d\",  [v47 intValue]);
              -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @" message-part=\"%d\",  [v48 intValue]);
            }
          }

          if (self->_isAudioMessage)
          {
            id v49 = [a4 objectForKey:IMAudioTranscription];
            if (v49)
            {
              -[NSMutableString appendFormat:]( self->_outHTML,  "appendFormat:",  @" audio-transcription=\"%@\"",  v49);
              -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @" audio-transcription=\"%@\"",  v49);
            }
          }

          -[NSMutableString appendString:](self->_outHTML, "appendString:", @"/>");
          -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"/>");
          uint64_t v50 = (uint64_t)[v17 isAuxImage];
          if ((_DWORD)v50)
          {
            id v52 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  +[IMFileTransfer AuxGUIDFromFileTransferGUID:]( IMFileTransfer,  "AuxGUIDFromFileTransferGUID:",  [v17 guid]));
            uint64_t v50 = IMOSLoggingEnabled(v52, v53);
            if (v52)
            {
              if ((_DWORD)v50)
              {
                v54 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  id v55 = [v17 guid];
                  *(_DWORD *)buf = 138412290;
                  id v94 = v55;
                  _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "We have an Aux transfer %@", buf, 0xCu);
                }
              }

              if (objc_msgSend(objc_msgSend(v52, "transferredFilename"), "length"))
              {
                id v56 = objc_msgSend(objc_msgSend(v52, "transferredFilename"), "lastPathComponent");
                if (IMOSLoggingEnabled(v56, v57))
                {
                  v58 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v94 = v56;
                    _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
                  }
                }
              }

              else
              {
                id v56 = 0LL;
              }

              uint64_t v50 = (uint64_t)[v56 length];
              if (!v50)
              {
                id v56 = objc_msgSend(objc_msgSend(v52, "localPath"), "lastPathComponent");
                uint64_t v50 = IMOSLoggingEnabled(v56, v61);
                if ((_DWORD)v50)
                {
                  v62 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
                  uint64_t v50 = os_log_type_enabled(v62, OS_LOG_TYPE_INFO);
                  if ((_DWORD)v50)
                  {
                    *(_DWORD *)buf = 138412290;
                    id v94 = v56;
                    _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
                  }
                }
              }

              if (v56)
              {
                id v63 = [v56 lastPathComponent];
                uint64_t v50 = IMOSLoggingEnabled(v63, v64);
                if ((_DWORD)v50)
                {
                  v65 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
                  uint64_t v50 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
                  if ((_DWORD)v50)
                  {
                    *(_DWORD *)buf = 138412290;
                    id v94 = v63;
                    _os_log_impl(&dword_0, v65, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
                  }
                }

                if (v63)
                {
                  id v66 = +[IMFileManager defaultHFSFileManager](&OBJC_CLASS___IMFileManager, "defaultHFSFileManager");
                  v84 = (void *)IMCreateEscapedAttributeValueFromString(v63);
                  v82 = (__CFString *)[v52 userInfo];
                  -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @"<FILE name=%@ width=%ld height=%ld datasize=%llu ",  v84,  [v86 integerValue],  objc_msgSend(v85, "integerValue"),  objc_msgSend( objc_msgSend( +[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"),  "attributesOfItemAtPath:error:",  objc_msgSend(v52, "localPath"),  &v92),  "fileSize"));
                  id v67 = -[NSMutableString appendFormat:]( self->_AuxHTML,  "appendFormat:",  @"iris=\"%@\",  @"yes"");
                  if (a11)
                  {
                    if (IMOSLoggingEnabled(v67, v68))
                    {
                      v69 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v94 = a11;
                        _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_INFO,  "WARNING emoji %@ not nil seems wrong for Aux transfer ",  buf,  0xCu);
                      }
                    }

                    v70 = (void *)IMCreateEscapedAttributeValueFromString(@"x-apple-anim-emoji");
                    uint64_t v71 = IMCreateEscapedAttributeValueFromString([a11 stringValue]);
                    v72 = (void *)v71;
                    if (v70 && v71) {
                      -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v70, v71);
                    }
                  }

                  id v73 = [v66 MIMETypeOfPath:v63];
                  if ([v73 length])
                  {
                    v74 = (void *)IMCreateEscapedAttributeValueFromString(@"mime-type");
                    uint64_t v75 = IMCreateEscapedAttributeValueFromString(v73);
                    v76 = (void *)v75;
                    if (v74 && v75) {
                      -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v74, v75);
                    }
                  }

                  id v77 = [v66 UTITypeOfPath:v63];
                  if ([v77 length])
                  {
                    v78 = (void *)IMCreateEscapedAttributeValueFromString(@"uti-type");
                    uint64_t v79 = IMCreateEscapedAttributeValueFromString(v77);
                    v80 = (void *)v79;
                    if (v78 && v79) {
                      -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" %@=\"%@\"", v78, v79);
                    }
                  }

                  v87[0] = _NSConcreteStackBlock;
                  v87[1] = 3221225472LL;
                  v87[2] = sub_361D0;
                  v87[3] = &unk_D6210;
                  v87[4] = self;
                  -[__CFString enumerateKeysAndObjectsUsingBlock:](v82, "enumerateKeysAndObjectsUsingBlock:", v87);
                  -[NSMutableString appendString:](self->_AuxHTML, "appendString:", @"/>");
                }
              }
            }

            else if ((_DWORD)v50)
            {
              v59 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
              uint64_t v50 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
              if ((_DWORD)v50)
              {
                id v60 = [v17 guid];
                *(_DWORD *)buf = 138412290;
                id v94 = v60;
                _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "Expected to find video transfer guid %@", buf, 0xCu);
              }
            }
          }

          if (IMOSLoggingEnabled(v50, v51))
          {
            v81 = (os_log_s *)OSLogHandleForIMFoundationCategory("Parser");
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v94 = v17;
              __int16 v95 = 2112;
              v96 = v82;
              _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "Parsed file transfer: %@    user info: %@", buf, 0x16u);
            }
          }
        }
      }
    }
  }

- (void)parser:(id)a3 foundBreadcrumbText:(id)a4 withOptions:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (id)IMCreateEscapedAttributeValueFromString(a4);
  id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<object breadcrumbText=%@ breadcrumbOptions=%u></object>",  v8,  v5);
  -[NSMutableString appendString:](self->_outHTML, "appendString:", v7);
  -[NSMutableString appendString:](self->_AuxHTML, "appendString:", v7);
}

- (void)parserDidEnd:(id)a3
{
}

- (BOOL)shouldPreprocess
{
  return 1;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  uint64_t v5 = (NSMutableDictionary *)a4;
  uint64_t v21 = IMDataDetectorResultAttributeName;
  id v22 = objc_msgSend(a4, "objectForKey:");
  uint64_t v20 = IMMyNameAttributeName;
  id v16 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v19 = IMSmileyDescriptionAttributeName;
  id v15 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v18 = IMSmileySpeechDescriptionAttributeName;
  id v14 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v17 = IMSmileyLengthAttributeName;
  id v13 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v23 = IMUniqueSmileyNumberAttributeName;
  id v12 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  v6 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  IMFontFamilyAttributeName,  IMFontSizeAttributeName,  IMItalicAttributeName,  IMBoldAttributeName,  IMUnderlineAttributeName,  IMStrikethroughAttributeName,  IMLinkAttributeName,  IMPreformattedAttributeName,  IMForegroundColorAttributeName,  IMBackgroundColorAttributeName,  IMMessageBackgroundColorAttributeName,  IMMessageForegroundColorAttributeName,  IMBaseWritingDirectionAttributeName,  v23,  v17,  v20,  v21,  v19,  v20,  IMInlineMediaHeightAttributeName,  IMInlineMediaWidthAttributeName,  IMSearchTermAttributeName,  v18,  IMReferencedHandleAttributeName,  IMFileTransferGUIDAttributeName,  IMFileBookmarkAttributeName,  IMFilenameAttributeName,  IMBreadcrumbTextMarkerAttributeName,  IMMentionConfirmedMention,  IMTextEffectAttributeName,  IMTextBoldAttributeName,  IMTextItalicAttributeName,  IMTextUnderlineAttributeName,  IMTextStrikethroughAttributeName,  0LL);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        if (-[NSMutableDictionary objectForKey:]( v5,  "objectForKey:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)i)))
        {
          self->_isSimpleString = 0;
          goto LABEL_11;
        }
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)isSimpleString
{
  return self->_isSimpleString;
}

- (BOOL)includeMessageParts
{
  return self->_includeMessageParts;
}

- (NSString)outHTML
{
  return &self->_outHTML->super;
}

- (NSString)AuxHTML
{
  return &self->_AuxHTML->super;
}

- (BOOL)isAudioMessage
{
  return self->_isAudioMessage;
}

@end