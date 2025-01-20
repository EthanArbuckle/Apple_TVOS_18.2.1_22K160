@interface NetworkObserver
- (_TtC14amsengagementd15NetworkObserver)init;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation NetworkObserver

- (_TtC14amsengagementd15NetworkObserver)init
{
  return (_TtC14amsengagementd15NetworkObserver *)sub_1000F546C();
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000F6310((uint64_t)v11, v9, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_1000F6E8C((uint64_t)v8, v9, (uint64_t)a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd15NetworkObserver____lazy_storage___session));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd15NetworkObserver____lazy_storage___sessionOnTimeout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd15NetworkObserver____lazy_storage___sessionPluggedIn));
}

@end