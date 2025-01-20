@interface ApsMessageProcessingOperation
- (_TtC7sportsd29ApsMessageProcessingOperation)init;
@end

@implementation ApsMessageProcessingOperation

- (_TtC7sportsd29ApsMessageProcessingOperation)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_message));
  sub_10003BCEC(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_dataRepository);
  sub_10003BCEC(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_playsStore);
  sub_100019034( (uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateable,  &qword_100088A38);
  sub_100019034( (uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_subscriptionOperationFactory,  &qword_100088158);
  sub_100006E64((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_performance));
  sub_10003BCEC(OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellable);
  sub_10003B180( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion),  *(uint64_t *)((char *)&self->super.super._private + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion));
  sub_100019034((uint64_t)self + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_processDate, &qword_100088BD0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellables));
  swift_bridgeObjectRelease(*(id *)((char *)&self->super.super._private
                                  + OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion));
}

@end