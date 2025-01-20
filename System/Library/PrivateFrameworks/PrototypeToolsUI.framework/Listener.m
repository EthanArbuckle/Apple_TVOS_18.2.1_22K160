@interface Listener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener)init;
@end

@implementation Listener

- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener)init
{
  return (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener *)sub_100009E28();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_10000BB9C(v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer));
}

@end