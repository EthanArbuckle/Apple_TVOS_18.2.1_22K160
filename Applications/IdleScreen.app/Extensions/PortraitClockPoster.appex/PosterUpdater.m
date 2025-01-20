@interface PosterUpdater
- (_TtC19PortraitClockPoster13PosterUpdater)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation PosterUpdater

- (_TtC19PortraitClockPoster13PosterUpdater)init
{
  return (_TtC19PortraitClockPoster13PosterUpdater *)sub_10000D660();
}

- (void).cxx_destruct
{
}

- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  v5 = a3;
  v6 = a4;
  v12 = _Block_copy(a5);
  v7 = self;
  v8 = (void *)swift_allocObject(&unk_100015040, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100009258((uint64_t)&unk_100019E28, (uint64_t)v8);
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  v5 = a3;
  v6 = a4;
  v12 = _Block_copy(a5);
  v7 = self;
  v8 = (void *)swift_allocObject(&unk_100015068, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100009258((uint64_t)&unk_100019E50, (uint64_t)v8);
}

@end