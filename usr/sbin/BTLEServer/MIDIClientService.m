@interface MIDIClientService
+ (id)UUID;
- (MIDIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (void)start;
@end

@implementation MIDIClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDMIDIServiceString);
}

- (MIDIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MIDIClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1LL);
    -[ClientService setPriority:](v6, "setPriority:", 9LL);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
  }

  return v6;
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MIDIClientService;
  -[ClientService start](&v5, "start");
  v3 = [NSNotificationCenter defaultCenter];
  v4 = [self peripheral];
  [v3 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v4];

  -[ClientService notifyDidStart](self, "notifyDidStart");
}

@end