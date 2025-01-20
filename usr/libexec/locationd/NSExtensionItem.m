@interface NSExtensionItem
+ (id)extensionItemForDict:(id)a3 withName:(id)a4 withPayload:(id)a5;
@end

@implementation NSExtensionItem

+ (id)extensionItemForDict:(id)a3 withName:(id)a4 withPayload:(id)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", a3, @"clientDictionary");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", a4, @"clientName");
  if (a5) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a5,  1LL,  0LL),  @"archivedPayload");
  }
  v9 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  -[NSExtensionItem setUserInfo:](v9, "setUserInfo:", v8);
  return v9;
}

@end