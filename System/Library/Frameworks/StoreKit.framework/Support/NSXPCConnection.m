@interface NSXPCConnection
- (BOOL)sk_allowArcade;
- (BOOL)sk_allowClientOverride;
- (BOOL)sk_allowPaymentRequestData;
- (BOOL)sk_connectionIsOctaneService;
- (BOOL)sk_getTaskAllowed;
- (BOOL)sk_isOctanePrivileged;
- (NSData)sk_auditTokenData;
- (NSString)sk_clientID;
- (NSString)sk_executablePath;
- (NSString)sk_processName;
@end

@implementation NSXPCConnection

- (BOOL)sk_allowArcade
{
  v2 = self;
  char v3 = sub_1000E9C24();

  return v3 & 1;
}

- (BOOL)sk_allowClientOverride
{
  v2 = self;
  char v3 = sub_1000E9D48();

  return v3 & 1;
}

- (BOOL)sk_allowPaymentRequestData
{
  v2 = self;
  char v3 = sub_1000E9E18();

  return v3 & 1;
}

- (BOOL)sk_isOctanePrivileged
{
  v2 = self;
  char v3 = sub_1000EA6D8();

  return v3 & 1;
}

- (BOOL)sk_getTaskAllowed
{
  v2 = self;
  char v3 = sub_1000EA774();

  return v3 & 1;
}

- (NSString)sk_clientID
{
  return (NSString *)sub_1000EAD70(self, (uint64_t)a2, sub_1000EA7DC);
}

- (NSString)sk_executablePath
{
  return (NSString *)sub_1000EAD70(self, (uint64_t)a2, (void (*)(void))sub_1000EAC1C);
}

- (NSString)sk_processName
{
  return (NSString *)sub_1000EAD70(self, (uint64_t)a2, (void (*)(void))sub_1000EADD4);
}

- (NSData)sk_auditTokenData
{
  v2 = self;
  uint64_t v3 = sub_1000EAE50();
  unint64_t v5 = v4;

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10007F054(v3, v5);
  return (NSData *)isa;
}

- (BOOL)sk_connectionIsOctaneService
{
  v2 = self;
  char v3 = sub_1000EAF04();

  return v3 & 1;
}

@end