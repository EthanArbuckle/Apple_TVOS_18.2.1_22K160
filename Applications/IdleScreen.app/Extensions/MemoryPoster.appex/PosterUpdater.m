@interface PosterUpdater
- (_TtC12MemoryPoster13PosterUpdater)init;
- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
- (void)updateDescriptors:(NSDictionary *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5;
@end

@implementation PosterUpdater

- (_TtC12MemoryPoster13PosterUpdater)init
{
  return (_TtC12MemoryPoster13PosterUpdater *)sub_1000042B0();
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
  v8 = (void *)swift_allocObject(&unk_100020850, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100004D14((uint64_t)&unk_100025B98, (uint64_t)v8);
}

- (void)updateConfiguration:(PRPosterConfiguration *)a3 withSessionInfo:(PRUpdatingSessionInfo *)a4 completion:(id)a5
{
  v5 = a3;
  v6 = a4;
  v12 = _Block_copy(a5);
  v7 = self;
  v8 = (void *)swift_allocObject(&unk_100020878, 48LL, 7LL);
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = v12;
  v8[5] = self;
  sub_100004D14((uint64_t)&unk_100025BC0, (uint64_t)v8);
}

@end