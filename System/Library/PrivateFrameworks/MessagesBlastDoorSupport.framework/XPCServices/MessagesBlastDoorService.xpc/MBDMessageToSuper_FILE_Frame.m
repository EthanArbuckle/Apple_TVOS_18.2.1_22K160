@interface MBDMessageToSuper_FILE_Frame
+ (BOOL)isLivePhotoAttribute:(id)a3;
+ (id)emojiImageInfoExtractedFrom:(id)a3;
+ (id)fileAttachmentsExtractedFrom:(id)a3;
+ (id)imageInfoExtractedFrom:(id)a3;
+ (id)stickerInfoExtractedFrom:(id)a3;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MBDMessageToSuper_FILE_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v28,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _stringForKey:](v16, "_stringForKey:", @"name"));
  if (v17)
  {
    unsigned __int8 v18 = [(id)objc_opt_class(self) isLivePhotoAttribute:v16];
    id v19 = -[NSMutableDictionary mutableCopy](v16, "mutableCopy");
    id v20 = [(id)objc_opt_class(self) imageInfoExtractedFrom:v19];
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = [(id)objc_opt_class(self) fileAttachmentsExtractedFrom:v19];
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    id v24 = [(id)objc_opt_class(self) stickerInfoExtractedFrom:v19];
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = [(id)objc_opt_class(self) emojiImageInfoExtractedFrom:v19];
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ((v18 & 1) != 0) {
      [v14 appendLivePhotoAttribute:v17 attachments:v23 imageInfo:v21 stickerInfo:v25];
    }
    else {
      [v14 appendFileTransferAttribute:v17 attachments:v23 imageInfo:v21 stickerInfo:v25 emojiImageInfo:v27];
    }
  }
}

+ (BOOL)isLivePhotoAttribute:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 _stringForKey:MBDIMFileTransferIrisKey]);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

+ (id)imageInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _stringForKey:@"width"]);
  uint64_t v5 = (uint64_t)[v4 integerValue];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 _stringForKey:@"height"]);
  uint64_t v7 = (uint64_t)[v6 integerValue];

  [v3 removeObjectsForKeys:&off_1000A96D8];
  v8 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  if (v5 >= 1 && v7 >= 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, MBDIMInlineMediaWidthAttributeName);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, MBDIMInlineMediaHeightAttributeName);
  }

  if (-[NSMutableDictionary count](v8, "count")) {
    id v11 = -[NSMutableDictionary copy](v8, "copy");
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)fileAttachmentsExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
  uint64_t v5 = MBDIMFileTransferUTITypeKey;
  v66[0] = MBDIMFileTransferMimeTypeKey;
  v66[1] = MBDIMFileTransferUTITypeKey;
  uint64_t v6 = MBDIMFileTransferDatasizeKey;
  v66[2] = MBDIMFileTransferDatasizeKey;
  v66[3] = MBDIMFileTransferIrisKey;
  v66[4] = MBDIMAnimatedEmojiAttributeName;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 5LL));
  v65[0] = MBDIMFileTransferDecryptionKeyKey;
  v65[1] = MBDIMFileTransferMMCSOwnerKey;
  v65[2] = MBDIMFileTransferSignatureHexKey;
  v65[3] = MBDIMFileTransferSizeKey;
  uint64_t v7 = MBDIMFileTransferURLKey;
  uint64_t v8 = MBDIMFileTransferAudioTranscriptionKey;
  v65[4] = MBDIMFileTransferURLKey;
  v65[5] = MBDIMFileTransferAudioTranscriptionKey;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 6LL));
  uint64_t v9 = MBDIMFileTransferInlineAttachmentKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MBDIMFileTransferInlineAttachmentKey]);

  if (v10)
  {
    v64[0] = v9;
    v64[1] = v5;
    v64[2] = v6;
    v64[3] = v8;
    v64[4] = @"name";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 5LL));
    v12 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v60 objects:v59 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v61;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v18]);
          if (v19) {
            -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v19, v18);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v60 objects:v59 count:16];
      }

      while (v15);
    }

    id v20 = -[NSMutableDictionary copy](v12, "copy");
    [v4 addObject:v20];

    id v21 = v4;
  }

  else
  {
    uint64_t v22 = 0LL;
    uint64_t v45 = v7;
    v46 = v4;
    do
    {
      uint64_t v23 = MBDIMFileTransferKeyForSizeIndex(v7, v22);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v24]);

      if (!v25) {
        break;
      }
      id v26 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  8LL);
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v27 = v48;
      id v28 = [v27 countByEnumeratingWithState:&v55 objects:v54 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v56;
        do
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v56 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)j);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v32, v45));
            if (v33) {
              -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v33, v32);
            }
          }

          id v29 = [v27 countByEnumeratingWithState:&v55 objects:v54 count:16];
        }

        while (v29);
      }

      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v34 = v47;
      id v35 = [v34 countByEnumeratingWithState:&v50 objects:v49 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v51;
        do
        {
          for (k = 0LL; k != v36; k = (char *)k + 1)
          {
            if (*(void *)v51 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)k);
            uint64_t v40 = MBDIMFileTransferKeyForSizeIndex(v39, v22);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v41]);
            if (v42)
            {
              -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v42, v39);
              [v3 removeObjectForKey:v41];
            }
          }

          id v36 = [v34 countByEnumeratingWithState:&v50 objects:v49 count:16];
        }

        while (v36);
      }

      id v43 = -[NSMutableDictionary copy](v26, "copy");
      BOOL v4 = v46;
      [v46 addObject:v43];

      ++v22;
      uint64_t v7 = v45;
    }

    while (v22 != 11);
    objc_msgSend(v3, "removeObjectsForKeys:", v48, v45);
    if ([v4 count]) {
      id v21 = [v4 copy];
    }
    else {
      id v21 = 0LL;
    }
  }

  return v21;
}

+ (id)stickerInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  15LL);
  sub_100009D20(@"sid", v3, v4);
  sub_100009D20(@"pid", v3, v4);
  sub_100009D20(@"shash", v3, v4);
  sub_100009D20(@"sli", v3, v4);
  sub_100009D20(@"sai", v3, v4);
  sub_100009D20(@"spw", v3, v4);
  sub_100009D20(@"sxs", v3, v4);
  sub_100009D20(@"sys", v3, v4);
  sub_100009D20(@"ssa", v3, v4);
  sub_100009D20(@"sro", v3, v4);
  sub_100009D20(@"srecipe", v3, v4);
  sub_100009D20(@"sbid", v3, v4);
  sub_100009D20(@"sir", v3, v4);
  sub_100009D20(@"spv", v3, v4);
  sub_100009D20(@"suri", v3, v4);

  if (-[NSMutableDictionary count](v4, "count")) {
    id v5 = -[NSMutableDictionary copy](v4, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)emojiImageInfoExtractedFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  sub_100009D20(MBDIMFileTransferEmojiImageContentIdentifierKey, v3, v4);
  sub_100009D20(MBDIMFileTransferEmojiImageShortDescriptionKey, v3, v4);

  if (-[NSMutableDictionary count](v4, "count")) {
    id v5 = -[NSMutableDictionary copy](v4, "copy");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

@end