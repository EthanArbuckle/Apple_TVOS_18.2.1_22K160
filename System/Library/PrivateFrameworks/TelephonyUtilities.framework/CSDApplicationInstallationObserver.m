@interface CSDApplicationInstallationObserver
- (BOOL)isApplicationInstalledWithBundleID:(id)a3;
- (CSDApplicationInstallationObserver)init;
- (CSDApplicationInstallationObserver)initWithQueue:(id)a3;
- (id)applicationRecordWithBundleID:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
@end

@implementation CSDApplicationInstallationObserver

- (CSDApplicationInstallationObserver)initWithQueue:(id)a3
{
  return (CSDApplicationInstallationObserver *)sub_1002392F0(a3);
}

- (id)applicationRecordWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_100239430(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (BOOL)isApplicationInstalledWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_100239698(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (CSDApplicationInstallationObserver)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDApplicationInstallationObserver_applicationRecordCache));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDApplicationInstallationObserver_uninstalledApplicationCache));
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
}

@end