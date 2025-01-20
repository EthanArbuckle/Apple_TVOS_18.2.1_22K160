@interface RPDeviceKeyValueStore_Internal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RPDeviceKeyValueStore_Internal)init;
- (id)getKeyValuePairsWithDomain:(id)a3;
- (id)getValueWithDomain:(id)a3 key:(id)a4;
- (id)isValueSensitiveWithDomain:(id)a3 key:(id)a4;
@end

@implementation RPDeviceKeyValueStore_Internal

- (RPDeviceKeyValueStore_Internal)init
{
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_188433A04();

  v3 = (void *)sub_1884CA040();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)getValueWithDomain:(id)a3 key:(id)a4
{
  return sub_188434504(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_188433ED8);
}

- (id)getKeyValuePairsWithDomain:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1884CA064();
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  uint64_t v8 = sub_188433FA4(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_1884C9FA4();
    swift_bridgeObjectRelease();
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)isValueSensitiveWithDomain:(id)a3 key:(id)a4
{
  return sub_188434504(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_188434428);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1884CA46C();
    swift_unknownObjectRelease();
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }

  char v6 = sub_1884351F0((uint64_t)v8);

  sub_188437B70((uint64_t)v8, &qword_18C4DDE00);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end