@interface UploadManager
- (_TtC11FlusherUtil13UploadManager)init;
- (void)dealloc;
@end

@implementation UploadManager

- (void)dealloc
{
  v2 = self;
  sub_1000AD560();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11FlusherUtil13UploadManager_fbfAssembly));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FlusherUtil13UploadManager_locker));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FlusherUtil13UploadManager__uploadSession));

  v3 = (char *)self + OBJC_IVAR____TtC11FlusherUtil13UploadManager_feedbackURL;
  uint64_t v4 = sub_100013590();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

- (_TtC11FlusherUtil13UploadManager)init
{
}

@end