@interface MessageToSuper_FILE_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v8 = (void *)IMCopyNormalizedAttributes(a8, 1LL, 0LL, a4, a5, a6, a7);
  id v66 = [v8 _stringForKey:@"name"];
  if (v66)
  {
    id v9 = [v8 _stringForKey:@"width"];
    id v10 = [v8 _stringForKey:@"height"];
    id v11 = [v8 _stringForKey:@"datasize"];
    id v12 = [v8 _stringForKey:@"x-apple-anim-emoji"];
    id v63 = [v8 _stringForKey:@"emoji-image-id"];
    id v51 = [v8 _stringForKey:@"emoji-image-description"];
    id v13 = objc_msgSend(objc_msgSend(v8, "_stringForKey:", @"iris"), "length");
    id v67 = [v8 mutableCopy];
    objc_msgSend( v67,  "removeObjectsForKeys:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  @"width",  @"height",  @"inline-file",  @"datasize",  0));
    id v50 = [v9 integerValue];
    id v49 = [v10 integerValue];
    id v48 = [v12 integerValue];
    id v62 = v13;
    if (!v13)
    {
      id v24 = -[IMDFileTransferCenter guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:]( +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"),  "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:",  [v66 lastPathComponent],  0,  objc_msgSend(v11, "longLongValue"),  0,  0,  0);
      if (v24)
      {
        id v41 = v24;
        id v64 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  v24);
      }

      else
      {
        id v41 = 0LL;
        id v64 = 0LL;
      }

@end