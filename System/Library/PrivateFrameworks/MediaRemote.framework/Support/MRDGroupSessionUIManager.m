@interface MRDGroupSessionUIManager
+ (id)create;
- (MRDGroupSessionUIManager)init;
@end

@implementation MRDGroupSessionUIManager

+ (id)create
{
  return  [objc_allocWithZone((Class)type metadata accessor for GroupSessionUIManagerImplementation()) init];
}

- (MRDGroupSessionUIManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroupSessionUIManager();
  return -[MRDGroupSessionUIManager init](&v3, "init");
}

@end