@interface OS_nw_channel
- (void)dealloc;
@end

@implementation OS_nw_channel

- (void)dealloc
{
  while (1)
  {
    Class isa = self[36].super.super.isa;
    if (!isa) {
      break;
    }
    Class v4 = isa[2].isa;
    v5 = isa[3].isa;
    if (v4)
    {
      v4[3].Class isa = v5;
      v5 = isa[3].isa;
    }

    else
    {
      self[37].super.super.Class isa = v5;
    }

    v5->Class isa = v4;
    isa[2].Class isa = 0LL;
    isa[3].Class isa = 0LL;
    os_release(isa);
  }

  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[40]);
  nw_channel_release_frame_array((uint64_t)self, (uint64_t *)&self[38]);
  v7 = (os_unfair_lock_s *)self[35].super.super.isa;
  if (v7)
  {
    _nw_hash_table_release(v7, v6);
    self[35].super.super.Class isa = 0LL;
  }

  nw_channel_close((uint64_t)self, v6);
  v8 = (dispatch_object_s *)self[26].super.super.isa;
  if (v8)
  {
    dispatch_release(v8);
    self[26].super.super.Class isa = 0LL;
  }

  Class v9 = self[19].super.super.isa;
  if (v9)
  {
    os_release(v9);
    self[19].super.super.Class isa = 0LL;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OS_nw_channel;
  -[OS_nw_channel dealloc](&v10, sel_dealloc);
}

@end