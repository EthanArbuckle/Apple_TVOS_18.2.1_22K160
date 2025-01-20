@interface JSArcadeObject
- (_TtC19appstorecomponentsd14JSArcadeObject)init;
- (id)getRecentlyPlayedGamesWithTimeout:(id)a3;
@end

@implementation JSArcadeObject

- (_TtC19appstorecomponentsd14JSArcadeObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[JSArcadeObject init](&v3, "init");
}

- (id)getRecentlyPlayedGamesWithTimeout:(id)a3
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009C564, 0LL);

  return v8;
}

@end