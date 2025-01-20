@interface DEContactsExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEContactsExtension

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBook.sqlitedb"));
  [v4 addObject:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBook.sqlitedb-wal"));
  [v4 addObject:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBook.sqlitedb-shm"));
  [v4 addObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBookImages.sqlitedb"));
  [v4 addObject:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBookImages.sqlitedb-wal"));
  [v4 addObject:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/AddressBook/AddressBookImages.sqlitedb-shm"));
  [v4 addObject:v11];

  if ([v5 fileExistsAtPath:@"/tmp/AddressBook"])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/tmp/AddressBook"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[DEContactsExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v12,  0LL,  0LL));
    [v4 addObjectsFromArray:v13];
  }

  return v4;
}

@end