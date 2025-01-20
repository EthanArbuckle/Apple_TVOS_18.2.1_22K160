@interface PromptLocationActionImplementation
- (_TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation PromptLocationActionImplementation

- (_TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation)init
{
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_manager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_promise));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_queue));
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_7E3C0();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_7E7CC();
}

@end