@interface ODRPublicErrorMapping
+ (id)publicErrorForError:(id)a3;
- (_TtC9appstored21ODRPublicErrorMapping)init;
@end

@implementation ODRPublicErrorMapping

+ (id)publicErrorForError:(id)a3
{
  id v4 = a3;
  id v5 = sub_10007B718(a3);

  return v5;
}

- (_TtC9appstored21ODRPublicErrorMapping)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ODRPublicErrorMapping();
  return -[ODRPublicErrorMapping init](&v3, "init");
}

@end