int main(int argc, const char **argv, const char **envp)
{
  NSXPCListener *v3;
  NSXPCListener *v4;
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.FileCoordination");
  -[NSXPCListener _setQueue:](v3, "_setQueue:", &_dispatch_main_q);
  mainArbiter = (uint64_t)[[NSFileAccessArbiter alloc] initWithQueue:&_dispatch_main_q isSubarbiter:0 listener:v3];
  -[NSXPCListener setDelegate:](v3, "setDelegate:", mainArbiter);
  -[NSXPCListener resume](v3, "resume");
  v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.ProgressReporting");
  -[NSXPCListener setDelegate:]( v4,  "setDelegate:",  objc_msgSend( objc_alloc(NSClassFromString(@"NSProgressRegistrar")),  "initWithQueue:rootFileAccessNode:",  &_dispatch_main_q,  objc_msgSend((id)mainArbiter, "rootNode")));
  -[NSXPCListener resume](v4, "resume");
  dispatch_main();
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}