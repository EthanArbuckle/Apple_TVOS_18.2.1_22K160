@interface NWConcrete_nw_ws_ping_request
- (void)dealloc;
@end

@implementation NWConcrete_nw_ws_ping_request

- (void)dealloc
{
  contents = self->contents;
  self->contents = 0LL;

  client_queue = self->client_queue;
  self->client_queue = 0LL;

  id pong_handler = self->pong_handler;
  self->id pong_handler = 0LL;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_ws_ping_request;
  -[NWConcrete_nw_ws_ping_request dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end