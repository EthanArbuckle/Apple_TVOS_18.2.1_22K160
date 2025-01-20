@interface MRDMediaControlIPCServer
- (MRDMediaControlIPCServer)init;
- (void)collectDiagnostic:(id)a3;
- (void)start;
@end

@implementation MRDMediaControlIPCServer

- (void)start
{
  uint64_t v3 = type metadata accessor for Features.MediaRemote(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Features.MediaRemote.cayenne(_:), v3);
  v7 = self;
  char v8 = Features.MediaRemote.isEnabled.getter(v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ((v8 & 1) != 0)
  {
    if (qword_100403E80 != -1) {
      swift_once(&qword_100403E80, sub_10029CF40);
    }
    swift_beginAccess(&qword_100405C98, v13, 0LL, 0LL);
    uint64_t v9 = qword_100405C98;
    v10 = *(void (**)(uint64_t))(*(void *)qword_100405C98 + 192LL);
    uint64_t v11 = swift_retain(qword_100405C98);
    v10(v11);

    swift_release(v9);
  }

  else
  {
  }

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002A01E8((uint64_t)a3);
}

- (MRDMediaControlIPCServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDMediaControlIPCServer;
  return -[MRDMediaControlIPCServer init](&v3, "init");
}

@end