@interface IMMessageItem
+ (IMMessageItem)messageItemWithLiteIdentifier:(id)a3 liteData:(id)a4 senderID:(id)a5 date:(id)a6 error:(id *)a7;
- (id)liteAssociatedMessageSummaryInfo;
@end

@implementation IMMessageItem

+ (IMMessageItem)messageItemWithLiteIdentifier:(id)a3 liteData:(id)a4 senderID:(id)a5 date:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Messages.LiteBlastDoorErrorDomain",  1LL,  0LL,  a6);
  }
  return 0LL;
}

- (id)liteAssociatedMessageSummaryInfo
{
  v2 = self;
  v3 = (LiteMessageServiceSession *)IMMessageItem.liteAssociatedMessageSummaryInfo()();

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  return isa;
}

@end