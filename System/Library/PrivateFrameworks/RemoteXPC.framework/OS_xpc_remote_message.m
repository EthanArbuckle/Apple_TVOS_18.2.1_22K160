@interface OS_xpc_remote_message
@end

@implementation OS_xpc_remote_message

- (void).cxx_destruct
{
  for (uint64_t i = 20LL; i != 4; --i)
    objc_storeStrong((id *)&(&self->super.isa)[i], 0LL);
  objc_storeStrong((id *)&self->body, 0LL);
  objc_storeStrong(&self->barrier, 0LL);
}

@end