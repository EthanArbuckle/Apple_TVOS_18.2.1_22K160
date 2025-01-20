@interface NSExtensionItem
+ (NSExtensionItem)itemWithTitle:(id)a3 attachmentItem:(id)a4;
@end

@implementation NSExtensionItem

+ (NSExtensionItem)itemWithTitle:(id)a3 attachmentItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  v8 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v6,  0LL);

  -[NSExtensionItem setAttributedTitle:](v7, "setAttributedTitle:", v8);
  v9 = -[NSItemProvider initWithItem:typeIdentifier:]( objc_alloc(&OBJC_CLASS___NSItemProvider),  "initWithItem:typeIdentifier:",  v5,  kUTTypeData);

  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  -[NSExtensionItem setAttachments:](v7, "setAttachments:", v10);

  return v7;
}

@end