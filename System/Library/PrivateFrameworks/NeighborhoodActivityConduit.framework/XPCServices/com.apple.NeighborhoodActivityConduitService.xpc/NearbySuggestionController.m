@interface NearbySuggestionController
- (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController)init;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)dealloc;
@end

@implementation NearbySuggestionController

- (void)dealloc
{
  uint64_t v3 = sub_10000360C((uint64_t *)&unk_1000CF840);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  v7 = (void *)swift_allocObject(&unk_1000C34F0, 40LL, 7LL);
  v7[2] = 0LL;
  v7[3] = 0LL;
  v7[4] = self;
  v8 = self;
  uint64_t v9 = sub_10004EC20((uint64_t)v5, (uint64_t)&unk_1000CE7D0, (uint64_t)v7);
  swift_release(v9);
  v10 = (objc_class *)type metadata accessor for NearbySuggestionController();
  v11.receiver = v8;
  v11.super_class = v10;
  -[NearbySuggestionController dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_conversationManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_featureFlags));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_publisherService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionResultSubject));
  sub_10001D180( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionState),  *(void **)&self->suggestionXPCDelegate[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suggestionState]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_conduitDeviceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController_suppressSuggestionTimer));
}

- (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController)init
{
  result = (_TtC44com_apple_NeighborhoodActivityConduitService26NearbySuggestionController *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_NeighborhoodAct ivityConduitService.Nearb ySuggestionController",  71LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = self;
  sub_10001C358(v9);
}

- (void)conversationManager:(id)a3 presentationContextChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10001C7C0(v7);
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10001CBB4(v7);
}

@end