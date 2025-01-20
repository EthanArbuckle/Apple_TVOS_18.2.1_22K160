@interface NWConcrete_nw_ws_response
- (void)dealloc;
@end

@implementation NWConcrete_nw_ws_response

- (void)dealloc
{
  selected_subprotocol = self->selected_subprotocol;
  if (selected_subprotocol)
  {
    free(selected_subprotocol);
    self->selected_subprotocol = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_ws_response;
  -[NWConcrete_nw_ws_response dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end