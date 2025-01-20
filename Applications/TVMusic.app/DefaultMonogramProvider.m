@interface DefaultMonogramProvider
- (_TtC7TVMusic23DefaultMonogramProvider)init;
@end

@implementation DefaultMonogramProvider

- (_TtC7TVMusic23DefaultMonogramProvider)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7TVMusic23DefaultMonogramProvider____lazy_storage___monogramRenderer) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DefaultMonogramProvider();
  return -[DefaultMonogramProvider init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7TVMusic23DefaultMonogramProvider____lazy_storage___monogramRenderer));
}

@end