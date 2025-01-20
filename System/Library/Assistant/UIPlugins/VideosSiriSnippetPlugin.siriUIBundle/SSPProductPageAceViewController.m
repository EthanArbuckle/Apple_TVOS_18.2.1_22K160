@interface SSPProductPageAceViewController
- (_TtC23VideosSiriSnippetPlugin31SSPProductPageAceViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
- (void)_exposeObjectsInJSContext:(id)a3;
@end

@implementation SSPProductPageAceViewController

- (void)_exposeObjectsInJSContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SSPProductPageAceViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  -[SSPProductPageAceViewController _exposeObjectsInJSContext:](&v6, "_exposeObjectsInJSContext:", v4);
  type metadata accessor for VideosUI(0LL);
  static VideosUI.initializeJSContext(_:)(v4);
}

- (_TtC23VideosSiriSnippetPlugin31SSPProductPageAceViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SSPProductPageAceViewController();
  return -[VSSPProductPageAceViewController initWithContentItem:userDriven:playTrailer:]( &v9,  "initWithContentItem:userDriven:playTrailer:",  a3,  v6,  v5);
}

@end