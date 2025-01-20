@interface DEBackgroundAppRefreshExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEBackgroundAppRefreshExtension

- (id)attachmentsForParameters:(id)a3
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/DuetLoggingSimple.SpringBoard"));
  [v3 addObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/DuetLoggingDetailed.SpringBoard"));
  [v3 addObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/DuetLST.log"));
  [v3 addObject:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Duet/DuetLST.duetlog"));
  [v3 addObject:v7];

  return v3;
}

@end