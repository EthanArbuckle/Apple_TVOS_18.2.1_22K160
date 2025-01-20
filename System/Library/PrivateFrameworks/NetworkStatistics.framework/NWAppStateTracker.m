@interface NWAppStateTracker
- (NSString)identifier;
- (NSUUID)uuid;
- (id)description;
- (int)pid;
- (void)setIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setUuid:(id)a3;
@end

@implementation NWAppStateTracker

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"NWAppStateTracker, pid %d, uuid %@ display identifier %@", self->_pid, self->_uuid, self->_identifier];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end