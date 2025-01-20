@interface VisualResponseNavigationDelegate
- (_TtC6SiriTV32VisualResponseNavigationDelegate)init;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
@end

@implementation VisualResponseNavigationDelegate

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  v14 = sub_4277C((uint64_t)v13, a4, v11, v12);

  return v14;
}

- (_TtC6SiriTV32VisualResponseNavigationDelegate)init
{
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6SiriTV32VisualResponseNavigationDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end