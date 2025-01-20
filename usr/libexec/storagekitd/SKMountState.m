@interface SKMountState
- (NSMutableArray)mountFlags;
- (NSString)mountPoint;
- (SKMountState)initWithMountPoint:(id)a3;
@end

@implementation SKMountState

- (SKMountState)initWithMountPoint:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SKMountState;
  v6 = -[SKMountState init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mountPoint, a3);
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
    mountFlags = v7->_mountFlags;
    v7->_mountFlags = (NSMutableArray *)v9;

    bzero(&v17, 0x878uLL);
    if (!statfs((const char *)[v5 UTF8String], &v17))
    {
      int v11 = 16;
      v12 = &dword_1000451B8;
      do
      {
        if ((v17.f_flags & v11) != 0) {
          -[NSMutableArray addObject:](v7->_mountFlags, "addObject:", *((void *)v12 - 1));
        }
        int v13 = *v12;
        v12 += 4;
        int v11 = v13;
      }

      while (v13);
      if ((v17.f_flags & 0x200000) != 0) {
        v14 = @"noowners";
      }
      else {
        v14 = @"owners";
      }
      -[NSMutableArray addObject:](v7->_mountFlags, "addObject:", v14);
    }
  }

  return v7;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (NSMutableArray)mountFlags
{
  return self->_mountFlags;
}

- (void).cxx_destruct
{
}

@end