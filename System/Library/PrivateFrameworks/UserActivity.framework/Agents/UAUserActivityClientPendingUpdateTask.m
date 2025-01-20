@interface UAUserActivityClientPendingUpdateTask
- (NSUUID)uuid;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAUserActivityClientPendingUpdateTask

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end