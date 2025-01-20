@interface ApplicationWorkspaceObserver
- (_TtC7imagent28ApplicationWorkspaceObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation ApplicationWorkspaceObserver

- (_TtC7imagent28ApplicationWorkspaceObserver)init
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didPerformStartupTasks) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ApplicationWorkspaceObserver();
  return -[ApplicationWorkspaceObserver init](&v3, "init");
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_opt_self(&OBJC_CLASS___LSApplicationWorkspace);
  v4 = self;
  id v5 = [v3 defaultWorkspace];
  if (v5)
  {
    v6 = v5;
    [v5 removeObserver:v4];

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for ApplicationWorkspaceObserver();
    -[ApplicationWorkspaceObserver dealloc](&v7, "dealloc");
  }

  else
  {
    __break(1u);
  }

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  v4 = self;
  if ((v2() & 1) != 0
    || [(id)objc_opt_self(IMDeviceUtilities) completedSystemAppMigration])
  {
    char v3 = 1;
  }

  else
  {
    char v3 = sub_100033F54();
  }

  sub_100034CC0(v3 & 1);
}

@end