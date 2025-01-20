@interface misCTClientDelegates
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)subscriptionInfoDidChange;
- (void)tetheringStatus:(id)a3 connectionType:(int)a4;
@end

@implementation misCTClientDelegates

- (void)tetheringStatus:(id)a3 connectionType:(int)a4
{
  if (a4 == 4)
  {
    -[misCTClientSharedInstance processCTTetheringStatusChangeNotification:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "processCTTetheringStatusChangeNotification:",  a3);
  }

  else
  {
    v11 = -[NSString UTF8String](NSStringFromSelector(a2), "UTF8String");
    sub_1000036BC(1u, (uint64_t)"%s: ignoring unknown connection type %d", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
  }

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v9 = *(void *)&a4;
  sub_1000036BC( 1u,  (uint64_t)"connectionStateChanged notification, connection type: %d",  (uint64_t)a3,  *(uint64_t *)&a4,  (uint64_t)a5,  v5,  v6,  v7,  *(uint64_t *)&a4);
  -[misCTClientSharedInstance processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:]( +[misCTClientSharedInstance sharedInstance](&OBJC_CLASS___misCTClientSharedInstance, "sharedInstance"),  "processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:",  a3,  v9,  a5,  v11);
}

- (void)subscriptionInfoDidChange
{
}

@end