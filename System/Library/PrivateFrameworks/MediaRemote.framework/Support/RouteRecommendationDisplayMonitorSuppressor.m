@interface RouteRecommendationDisplayMonitorSuppressor
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation RouteRecommendationDisplayMonitorSuppressor

- (id)suppressionPolicyWithContext:(id)a3
{
  uint64_t v5 = *(void *)&self->displayMonitor[24];
  uint64_t v6 = *(void *)&self->displayMonitor[32];
  sub_1001865C4(self->displayMonitor, v5);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  id v8 = a3;
  swift_retain(self);
  if ((v7(v5, v6) & 1) != 0)
  {
    type metadata accessor for RouteRecommendationSuppressionPolicy();
    v9 = (uint64_t *)sub_1002A30E0();
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    swift_bridgeObjectRetain();
    id v12 = sub_1002A2F68(v10, v11);

    swift_release(self);
    swift_bridgeObjectRelease();
  }

  else
  {
    id v12 = (id)*sub_1002A2F28();

    swift_release(self);
  }

  return v12;
}

@end