@interface PICSDiagnosticExtensionExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)gatherAttachments;
@end

@implementation PICSDiagnosticExtensionExtension

- (id)attachmentList
{
  return -[PICSDiagnosticExtensionExtension gatherAttachments](self, "gatherAttachments");
}

- (id)attachmentsForParameters:(id)a3
{
  return -[PICSDiagnosticExtensionExtension gatherAttachments](self, "gatherAttachments", a3);
}

- (id)gatherAttachments
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS____TtC23PICSDiagnosticExtension36DiagnosticExtensionFileFinderWrapper, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getFileList]);
  v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  (void)v13));
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

@end