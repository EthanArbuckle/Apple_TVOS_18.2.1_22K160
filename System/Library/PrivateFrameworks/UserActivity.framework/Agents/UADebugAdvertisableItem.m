@interface UADebugAdvertisableItem
- (UADebugAdvertisableItem)initWithType:(unint64_t)a3 manager:(id)a4;
- (id)advertisingBytes;
- (unint64_t)debugType;
- (void)setDebugType:(unint64_t)a3;
@end

@implementation UADebugAdvertisableItem

- (UADebugAdvertisableItem)initWithType:(unint64_t)a3 manager:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    v7 = @"AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE";
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    v7 = @"EEEEEEEE-DDDD-CCCC-BBBB-AAAAAAAAAAAA";
LABEL_5:
    v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);
    goto LABEL_7;
  }

  v8 = 0LL;
LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UADebugAdvertisableItem;
  v9 = -[UADebugAdvertisableItem initWithUUID:type:options:](&v12, "initWithUUID:type:options:", v8, 1LL, 0LL);
  v10 = v9;
  if (v9)
  {
    -[UADebugAdvertisableItem setType:](v9, "setType:", 5LL);
    -[UADebugAdvertisableItem setDebugType:](v10, "setDebugType:", a3);
  }

  return v10;
}

- (id)advertisingBytes
{
  unint64_t v3 = -[UADebugAdvertisableItem debugType](self, "debugType");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0LL;
      return v5;
    }

    v4 = @"com.apple.private.handoff.pong";
  }

  else
  {
    v4 = @"com.apple.private.handoff.ping";
  }

  v5 = (void *)_LSCreateHashedBytesForAdvertisingFromString(-[UADebugAdvertisableItem type](self, "type"), v4);
  return v5;
}

- (unint64_t)debugType
{
  return self->_debugType;
}

- (void)setDebugType:(unint64_t)a3
{
  self->_debugType = a3;
}

@end