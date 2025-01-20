@interface PBRootWindowScenePresentationBinder
- (PBRootWindowScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 appearanceStyle:(unint64_t)a5 rootWindow:(id)a6;
@end

@implementation PBRootWindowScenePresentationBinder

- (PBRootWindowScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 appearanceStyle:(unint64_t)a5 rootWindow:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRootWindowScenePresentationBinder;
  return -[PBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]( &v7,  "initWithIdentifier:priority:appearanceStyle:rootWindow:",  a3,  a4,  a5,  a6);
}

@end