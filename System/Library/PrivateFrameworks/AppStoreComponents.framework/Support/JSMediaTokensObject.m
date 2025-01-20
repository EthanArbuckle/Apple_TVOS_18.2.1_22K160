@interface JSMediaTokensObject
- (_TtC19appstorecomponentsd19JSMediaTokensObject)init;
- (id)getTokenFor:(id)a3 :(id)a4;
- (void)resetTokenFor:(id)a3 :(id)a4;
@end

@implementation JSMediaTokensObject

- (id)getTokenFor:(id)a3 :(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)static JSContext.requiredCurrent.getter();
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v11 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000ABE78, v13);

  return v11;
}

- (void)resetTokenFor:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000AB7D4(v6, v7);
}

- (_TtC19appstorecomponentsd19JSMediaTokensObject)init
{
  result = (_TtC19appstorecomponentsd19JSMediaTokensObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSMediaTokensObject",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_bag;
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_cachedServices));
}

@end