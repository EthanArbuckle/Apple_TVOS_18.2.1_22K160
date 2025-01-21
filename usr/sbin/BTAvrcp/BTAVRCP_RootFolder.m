@interface BTAVRCP_RootFolder
- (BTAVRCP_RootFolder)init;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_RootFolder

- (BTAVRCP_RootFolder)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BTAVRCP_RootFolder;
  v2 = -[BTAVRCP_VFSFolder initWithName:uid:](&v5, "initWithName:uid:", 0LL, 0LL);
  if (v2)
  {
    v3 = [MPMediaPropertyPredicate predicateWithValue:forProperty:MPMediaItemPropertyMediaType];
    -[BTAVRCP_VFSFolder storePredicate:](v2, "storePredicate:", v3);
  }

  return v2;
}

- (id)baseQuery
{
  return objc_alloc_init(&OBJC_CLASS___MPMediaQuery);
}

- (unint64_t)childrenCount
{
  return 1LL;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (a3 != 1) {
    return 9;
  }
  objc_super v5 = objc_alloc(&OBJC_CLASS___BTAVRCP_CategoriesFolder);
  v6 = [+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary") autorelease];
  v7 = [v6 name];
  *a4 = -[BTAVRCP_CategoriesFolder initWithName:uid:](v5, "initWithName:uid:", v7, 1LL);

  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  if (a3)
  {
    v4 = 0LL;
  }

  else
  {
    v6 = [MPMediaLibrary defaultMediaLibrary];
    v7 = [v6 name];
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  0LL,  &off_100019B38,  v7));
  }

  return v4;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  if (a3 == 1) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0LL;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  if (a3 == 1) {
    return 12;
  }
  else {
    return 9;
  }
}

@end