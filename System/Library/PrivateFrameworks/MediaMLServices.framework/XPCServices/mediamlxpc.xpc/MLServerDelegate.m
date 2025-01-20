@interface MLServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10mediamlxpc16MLServerDelegate)init;
@end

@implementation MLServerDelegate

- (_TtC10mediamlxpc16MLServerDelegate)init
{
  return (_TtC10mediamlxpc16MLServerDelegate *)MLServerDelegate.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  Swift::Bool v12 = MLServerDelegate.listener(_:shouldAcceptNewConnection:)((NSXPCListener *)a3, (NSXPCConnection *)a4);

  return _convertBoolToObjCBool(_:)(v12) & 1;
}

- (void).cxx_destruct
{
  outlined destroy of OSAllocatedUnfairLock<MediaML?>((Class *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML));
}

@end