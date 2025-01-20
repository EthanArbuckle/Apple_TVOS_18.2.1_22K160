@interface NSExtensionItem
+ (BOOL)supportsSecureCoding;
- (NSArray)attachments;
- (NSAttributedString)attributedContentText;
- (NSAttributedString)attributedTitle;
- (NSDictionary)userInfo;
- (NSExtensionItem)init;
- (NSExtensionItem)initWithCoder:(id)a3;
- (id)_matchingDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(NSArray *)attachments;
- (void)setAttributedContentText:(NSAttributedString *)attributedContentText;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)setUserInfo:(NSDictionary *)userInfo;
@end

@implementation NSExtensionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExtensionItem)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSExtensionItem;
  v2 = -[NSExtensionItem init](&v4, sel_init);
  if (v2) {
    v2->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  return v2;
}

- (NSExtensionItem)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSExtensionItem;
  objc_super v4 = -[NSExtensionItem init](&v6, sel_init);
  if (v4) {
    v4->_userInfo = (NSMutableDictionary *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(a3, "allowedClasses"),  @"NSExtensionItemUserInfoKey"),  "mutableCopy");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtensionItem;
  -[NSExtensionItem dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  uint64_t v5 = (NSMutableDictionary *)-[NSDictionary mutableCopy](-[NSExtensionItem userInfo](self, "userInfo"), "mutableCopy");
  objc_super v6 = (void *)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"NSExtensionItemAttachmentsKey");
  uint64_t v7 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v15 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v12 = (id)[v12 copy];
        }
        [v7 addObject:v12];
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v9);
  }

  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"NSExtensionItemAttachmentsKey");

  v4->_userInfo = v5;
  return v4;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (attributedTitle)
  {
    id v11 = 0LL;
    NSUInteger v5 = -[NSAttributedString length](attributedTitle, "length");
    uint64_t v16 = _MergedGlobals_83[0]();
    v17[0] = off_18C491788[0]();
    objc_super v6 = -[NSAttributedString dataFromRange:documentAttributes:error:]( attributedTitle,  "dataFromRange:documentAttributes:error:",  0,  v5,  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1],  &v11);
    if (v6)
    {
      -[NSMutableDictionary setValue:forKey:]( self->_userInfo,  "setValue:forKey:",  v6,  @"NSExtensionItemAttributedTitleKey");
      if (-[NSAttributedString prefersRTFDInRange:]( attributedTitle,  "prefersRTFDInRange:",  0LL,  -[NSAttributedString length](attributedTitle, "length")))
      {
        NSUInteger v7 = -[NSAttributedString length](attributedTitle, "length");
        uint64_t v14 = _MergedGlobals_83[0]();
        uint64_t v15 = off_18C491790[0]();
        uint64_t v8 = -[NSAttributedString dataFromRange:documentAttributes:error:]( attributedTitle,  "dataFromRange:documentAttributes:error:",  0,  v7,  [MEMORY[0x189603F68] dictionaryWithObjects:&v15 forKeys:&v14 count:1],  &v11);
        if (v8) {
          -[NSMutableDictionary setValue:forKey:]( self->_userInfo,  "setValue:forKey:",  v8,  @"_NSExtensionItemRTFDAttributedTitleKey");
        }
        else {
          NSLog( (NSString *)@"unable to create RTFD representation of attributed string! error - %@",  [v11 description]);
        }
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v11 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v10;
        _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "unable to create RTF representation of attributed string! error - %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_userInfo,  "removeObjectForKey:",  @"NSExtensionItemAttributedTitleKey");
    -[NSMutableDictionary removeObjectForKey:]( self->_userInfo,  "removeObjectForKey:",  @"_NSExtensionItemRTFDAttributedTitleKey");
  }

- (NSAttributedString)attributedTitle
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSMutableDictionary objectForKey:]( self->_userInfo,  "objectForKey:",  @"_NSExtensionItemRTFDAttributedTitleKey");
  if (!v3
    || (uint64_t v4 = v3,
        *(void *)buf = 0LL,
        UIFoundationLibrary(),
        NSUInteger v5 = objc_alloc(&OBJC_CLASS___NSAttributedString),
        uint64_t v17 = _MergedGlobals_83[0](),
        v18[0] = off_18C491790[0](),
        (objc_super v6 = -[NSAttributedString initWithData:options:documentAttributes:error:]( v5,  "initWithData:options:documentAttributes:error:",  v4,  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1],  0,  buf)) == 0))
  {
    result = (NSAttributedString *)-[NSMutableDictionary objectForKey:]( self->_userInfo,  "objectForKey:",  @"NSExtensionItemAttributedTitleKey");
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    id v13 = 0LL;
    UIFoundationLibrary();
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v15 = _MergedGlobals_83[0]();
    uint64_t v16 = off_18C491788[0]();
    uint64_t v10 = -[NSAttributedString initWithData:options:documentAttributes:error:]( v9,  "initWithData:options:documentAttributes:error:",  v8,  [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1],  0,  &v13);
    if (!v10)
    {
      id v11 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v13 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "unable to create attributed string representation from RTF data! error - %@",  buf,  0xCu);
      }
    }

    objc_super v6 = (NSAttributedString *)v10;
  }

  return v6;
}

- (void)setAttributedContentText:(NSAttributedString *)attributedContentText
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (attributedContentText)
  {
    NSUInteger v5 = -[NSAttributedString length](attributedContentText, "length", 0LL);
    uint64_t v10 = _MergedGlobals_83[0]();
    v11[0] = off_18C491788[0]();
    -[NSMutableDictionary setValue:forKey:]( self->_userInfo,  "setValue:forKey:",  -[NSAttributedString dataFromRange:documentAttributes:error:]( attributedContentText,  "dataFromRange:documentAttributes:error:",  0,  v5,  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1],  &v7),  @"NSExtensionItemAttributedContentTextKey");
    if (-[NSAttributedString prefersRTFDInRange:]( attributedContentText,  "prefersRTFDInRange:",  0LL,  -[NSAttributedString length](attributedContentText, "length")))
    {
      NSUInteger v6 = -[NSAttributedString length](attributedContentText, "length");
      uint64_t v8 = _MergedGlobals_83[0]();
      uint64_t v9 = off_18C491790[0]();
      -[NSMutableDictionary setValue:forKey:]( self->_userInfo,  "setValue:forKey:",  -[NSAttributedString dataFromRange:documentAttributes:error:]( attributedContentText,  "dataFromRange:documentAttributes:error:",  0,  v6,  [MEMORY[0x189603F68] dictionaryWithObjects:&v9 forKeys:&v8 count:1],  &v7),  @"_NSExtensionItemRTFDAttributedContentTextKey");
    }
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_userInfo,  "removeObjectForKey:",  @"NSExtensionItemAttributedContentTextKey");
    -[NSMutableDictionary removeObjectForKey:]( self->_userInfo,  "removeObjectForKey:",  @"_NSExtensionItemRTFDAttributedContentTextKey");
  }

- (NSAttributedString)attributedContentText
{
  v14[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSMutableDictionary objectForKey:]( self->_userInfo,  "objectForKey:",  @"_NSExtensionItemRTFDAttributedContentTextKey");
  if (!v3
    || (uint64_t v4 = v3,
        uint64_t v10 = 0LL,
        UIFoundationLibrary(),
        NSUInteger v5 = objc_alloc(&OBJC_CLASS___NSAttributedString),
        uint64_t v13 = _MergedGlobals_83[0](),
        v14[0] = off_18C491790[0](),
        (NSUInteger v6 = -[NSAttributedString initWithData:options:documentAttributes:error:]( v5,  "initWithData:options:documentAttributes:error:",  v4,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, 0),  0,  &v10)) == 0))
  {
    result = (NSAttributedString *)-[NSMutableDictionary objectForKey:]( self->_userInfo,  "objectForKey:",  @"NSExtensionItemAttributedContentTextKey");
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    uint64_t v10 = 0LL;
    UIFoundationLibrary();
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v11 = _MergedGlobals_83[0]();
    uint64_t v12 = off_18C491788[0]();
    NSUInteger v6 = -[NSAttributedString initWithData:options:documentAttributes:error:]( v9,  "initWithData:options:documentAttributes:error:",  v8,  [MEMORY[0x189603F68] dictionaryWithObjects:&v12 forKeys:&v11 count:1],  0,  &v10);
  }

  return v6;
}

- (void)setAttachments:(NSArray *)attachments
{
}

- (NSArray)attachments
{
  return (NSArray *)-[NSMutableDictionary objectForKey:]( self->_userInfo,  "objectForKey:",  @"NSExtensionItemAttachmentsKey");
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  self->_userInfo = (NSMutableDictionary *)-[NSDictionary mutableCopy](userInfo, "mutableCopy");
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_userInfo, "copy");
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtensionItem;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - userInfo: %@",  -[NSExtensionItem description](&v3, sel_description),  self->_userInfo);
}

- (id)_matchingDictionaryRepresentation
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  uint64_t v37 = [MEMORY[0x189603FC8] dictionary];
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  objc_super v3 = -[NSExtensionItem userInfo](self, "userInfo");
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke;
  v27[3] = &unk_189C9ADE0;
  v27[4] = &v28;
  v27[5] = &v32;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (-[NSArray count](-[NSExtensionItem attachments](self, "attachments"), "count"))
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    NSUInteger v5 = -[NSExtensionItem attachments](self, "attachments");
    uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v43,  v42,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v44;
      v23 = @"NSItemProviderOptionsDispatchModeAsynchronous";
      v24 = @"NSItemProviderOptionsDispatchMode";
      obj = v5;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v10 = off_18C491798[0]();
          uint64_t v11 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithArray:",  objc_msgSend(v9, "registeredTypeIdentifiers"));
          uint64_t v12 = v11;
          if (!*((_BYTE *)v29 + 24)) {
            goto LABEL_23;
          }
          char v13 = [v11 containsObject:v10];
          char v14 = v10 ? v13 : 0;
          if ((v14 & 1) == 0) {
            goto LABEL_23;
          }
          uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSExtensionURLResult);
          v40 = v24;
          v41 = v23;
          uint64_t v16 = [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          v26[0] = MEMORY[0x1895F87A8];
          v26[1] = 3221225472LL;
          v26[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_50;
          v26[3] = &unk_189C9AE08;
          v26[4] = v15;
          [v9 loadItemForTypeIdentifier:v10 options:v16 completionHandler:v26];
          char v17 = -[NSExtensionURLResult wait:](v15, "wait:", 2.0);
          id v18 = -[NSExtensionURLResult copiedURL](v15, "copiedURL");

          char v19 = v18 ? v17 : 1;
          BOOL v20 = (v19 & 1) == 0
             && (!objc_msgSend((id)objc_msgSend(v18, "scheme"), "caseInsensitiveCompare:", @"http")
              || !objc_msgSend((id)objc_msgSend(v18, "scheme"), "caseInsensitiveCompare:", @"https"));

          if (v20)
          {
            [v12 addObject:@"com.apple.active-webpage"];
          }

          else
          {
LABEL_23:
            if ((unint64_t)objc_msgSend(v12, "count", v23, v24) >= 2
              && ([v12 containsObject:@"com.apple.active-webpage"] & 1) == 0)
            {
              [v12 removeObject:v10];
            }
          }

          v38 = @"registeredTypeIdentifiers";
          uint64_t v39 = [v12 allObjects];
          objc_msgSend( v4,  "addObject:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
        }

        uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v42,  16LL);
      }

      while (v6);
    }

    [(id)v33[5] setObject:v4 forKey:@"attachments"];
  }

  v21 = (void *)v33[5];
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v21;
}

void __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke( uint64_t a1,  __CFString *a2,  void *a3)
{
  id v4 = a2;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (-[__CFString isEqualToString:]( v4,  "isEqualToString:",  @"NSExtensionItemAttributedContentTextKey")) {
    id v4 = @"contentText";
  }
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", @"NSExtensionItemAttachmentsKey") & 1) == 0)
  {
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", @"supportsJavaScript")
      && (objc_getClass("NSNumber"), (objc_opt_isKindOfClass() & 1) != 0)
      && [a3 BOOLValue])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }

    else if ((-[__CFString hasPrefix:](v4, "hasPrefix:", @"com.apple.UIKit") & 1) == 0)
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000LL;
      char v14 = 0;
      uint64_t v6 = objc_opt_class();
      id v7 = +[NSExtensionContext _extensionContextHostProtocolAllowedClassesForItems]( &OBJC_CLASS___NSExtensionContext,  "_extensionContextHostProtocolAllowedClassesForItems");
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2;
      v10[3] = &unk_189C99B20;
      v10[4] = v6;
      v10[5] = &v11;
      [v7 enumerateObjectsUsingBlock:v10];
      if (*((_BYTE *)v12 + 24))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:a3 forKey:v4];
      }

      else
      {
        uint64_t v8 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          uint64_t v16 = v4;
          __int16 v17 = 2112;
          uint64_t v18 = v9;
          _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "Unable to encode value for key %@ because it is of unsupported type %@",  buf,  0x16u);
        }
      }

      _Block_object_dispose(&v11, 8);
    }
  }

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  uint64_t result = [*(id *)(a1 + 32) isSubclassOfClass:a2];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_50( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (!a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      [*(id *)(a1 + 32) setURL:a2];
    }
  }

  return [*(id *)(a1 + 32) signal];
}

@end