@interface JSUbiquitousDatabase
- (_TtC14amsengagementd20JSUbiquitousDatabase)init;
- (id)fetch:(id)a3;
- (id)fetchKeys:(id)a3;
- (id)fetchMatchingKeys:(id)a3;
- (void)removeKeys:(id)a3;
- (void)set:(id)a3 :(id)a4;
- (void)setValues:(id)a3;
@end

@implementation JSUbiquitousDatabase

- (id)fetch:(id)a3
{
  return sub_10008D464( (uint64_t)self,  (uint64_t)a2,  (uint64_t)a3,  (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_10008D3D0);
}

- (id)fetchKeys:(id)a3
{
  return sub_10008D80C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10008D544);
}

- (id)fetchMatchingKeys:(id)a3
{
  return sub_10008DC9C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_10008D888);
}

- (void)set:(id)a3 :(id)a4
{
}

- (void)setValues:(id)a3
{
}

- (void)removeKeys:(id)a3
{
}

- (_TtC14amsengagementd20JSUbiquitousDatabase)init
{
}

- (void).cxx_destruct
{
}

@end