@interface SSPProductPageApplicationViewController
- (_TtC23VideosSiriSnippetPlugin39SSPProductPageApplicationViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
@end

@implementation SSPProductPageApplicationViewController

- (_TtC23VideosSiriSnippetPlugin39SSPProductPageApplicationViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SSPProductPageApplicationViewController();
  return -[VSSPProductPageApplicationViewController initWithContentItem:userDriven:playTrailer:]( &v9,  "initWithContentItem:userDriven:playTrailer:",  a3,  v6,  v5);
}

@end