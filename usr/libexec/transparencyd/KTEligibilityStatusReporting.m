@interface KTEligibilityStatusReporting
- (_TtC13transparencyd28KTEligibilityStatusReporting)init;
- (_TtC13transparencyd28KTEligibilityStatusReporting)initWithPath:(id)a3 idsReporting:(id)a4 eligibilitySupport:(id)a5 error:(id *)a6;
- (void)aggregateResultWithSamples:(int64_t)a3 element:(NSString *)a4 completionHandler:(id)a5;
- (void)cachedLastRecommendationWithCompletionHandler:(id)a3;
- (void)cachedOSVersionWithCompletionHandler:(id)a3;
- (void)cachedTimeOfLastReportWithCompletionHandler:(id)a3;
- (void)clearEligibilityOverridesWithCompletionHandler:(id)a3;
- (void)clearReportOverridesWithCompletionHandler:(id)a3;
- (void)closeDatabaseWithCompletionHandler:(id)a3;
- (void)getLatestResultForElementWithElement:(NSString *)a3 completionHandler:(id)a4;
- (void)iCloudAnalyticsEnabledWithCompletionHandler:(id)a3;
- (void)insertOSVersionWithOsVersion:(NSString *)a3 completionHandler:(id)a4;
- (void)insertResultWithElement:(NSString *)a3 samplesAgo:(int64_t)a4 success:(BOOL)a5 completionHandler:(id)a6;
- (void)reportWithCompletionHandler:(id)a3;
- (void)setHasDoneOSUpdateWithValue:(BOOL)a3 completionHandler:(id)a4;
- (void)setLastIDSRecWithRecommendation:(BOOL)a3 completionHandler:(id)a4;
- (void)setOverrideReportValueWithReportValue:(BOOL)a3 completionHandler:(id)a4;
- (void)setOverrideTimeBetweenReportsWithValue:(double)a3 completionHandler:(id)a4;
- (void)storeWithStatus:(_TtC13transparencyd25KTEligibilityStatusResult *)a3 completionHandler:(id)a4;
@end

@implementation KTEligibilityStatusReporting

- (_TtC13transparencyd28KTEligibilityStatusReporting)initWithPath:(id)a3 idsReporting:(id)a4 eligibilitySupport:(id)a5 error:(id *)a6
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)sub_1000CEBDC(v11, (uint64_t)a4, (uint64_t)a5);
}

- (void)reportWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002809A8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1002809D0, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1FE0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_1002809F8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1FE8;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1FF0, (uint64_t)v12);
  swift_release(v13);
}

- (void)storeWithStatus:(_TtC13transparencyd25KTEligibilityStatusResult *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100280930, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280958, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1FC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100280980, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1FC8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1FD0, (uint64_t)v14);
  swift_release(v16);
}

- (void)iCloudAnalyticsEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002808A0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1002808C8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1FA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1002808F0, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1FA8;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1FB0, (uint64_t)v12);
  swift_release(v13);
}

- (void)getLatestResultForElementWithElement:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100280828, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280850, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1F80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100280878, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1F88;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1F90, (uint64_t)v14);
  swift_release(v16);
}

- (void)aggregateResultWithSamples:(int64_t)a3 element:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject(&unk_1002807B0, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_1002807D8, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_1002E1F60;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject(&unk_100280800, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_1002E1F68;
  v16[5] = v15;
  uint64_t v17 = a4;
  swift_retain(self);
  uint64_t v18 = sub_10007A798((uint64_t)v11, (uint64_t)&unk_1002E1F70, (uint64_t)v16);
  swift_release(v18);
}

- (void)insertOSVersionWithOsVersion:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100280738, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280760, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1F40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100280788, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1F48;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  uint64_t v16 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1F50, (uint64_t)v14);
  swift_release(v16);
}

- (void)cachedOSVersionWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002806C0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1002806E8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1F20;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100280710, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1F28;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1F30, (uint64_t)v12);
  swift_release(v13);
}

- (void)cachedTimeOfLastReportWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100280648, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100280670, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1F00;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100280698, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1F08;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1F10, (uint64_t)v12);
  swift_release(v13);
}

- (void)cachedLastRecommendationWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002805D0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1002805F8, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1EE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100280620, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1EE8;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1EF0, (uint64_t)v12);
  swift_release(v13);
}

- (void)clearEligibilityOverridesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100280558, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100280580, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1EC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1002805A8, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1EC8;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1ED0, (uint64_t)v12);
  swift_release(v13);
}

- (void)clearReportOverridesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002804E0, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100280508, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1EA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100280530, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1EA8;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1EB0, (uint64_t)v12);
  swift_release(v13);
}

- (void)setOverrideReportValueWithReportValue:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100280468, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280490, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1E80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1002804B8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1E88;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1E90, (uint64_t)v14);
  swift_release(v15);
}

- (void)setLastIDSRecWithRecommendation:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1002803F0, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280418, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1E60;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100280440, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1E68;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1E70, (uint64_t)v14);
  swift_release(v15);
}

- (void)setHasDoneOSUpdateWithValue:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100280378, 40LL, 7LL);
  *(_BYTE *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_1002803A0, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1E40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_1002803C8, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1E48;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1E50, (uint64_t)v14);
  swift_release(v15);
}

- (void)setOverrideTimeBetweenReportsWithValue:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_100280300, 40LL, 7LL);
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100280328, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_1002E1E20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100280350, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_1002E1E28;
  v14[5] = v13;
  swift_retain(self);
  uint64_t v15 = sub_10007A798((uint64_t)v9, (uint64_t)&unk_1002E1E30, (uint64_t)v14);
  swift_release(v15);
}

- (void)insertResultWithElement:(NSString *)a3 samplesAgo:(int64_t)a4 success:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject(&unk_100280288, 56LL, 7LL);
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
  uint64_t v17 = (void *)swift_allocObject(&unk_1002802B0, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_1002E1E00;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject(&unk_1002802D8, 48LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_1002E1E08;
  v18[5] = v17;
  uint64_t v19 = a3;
  swift_retain(self);
  uint64_t v20 = sub_10007A798((uint64_t)v13, (uint64_t)&unk_1002E1E10, (uint64_t)v18);
  swift_release(v20);
}

- (void)closeDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100072CC4(&qword_1002DF5F0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1002801E8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_100280210, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1002E1DD8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_100280238, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_1002E1DE0;
  v12[5] = v11;
  swift_retain(self);
  uint64_t v13 = sub_10007A798((uint64_t)v7, (uint64_t)&unk_1002E1DE8, (uint64_t)v12);
  swift_release(v13);
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)init
{
  result = (_TtC13transparencyd28KTEligibilityStatusReporting *)_swift_stdlib_reportUnimplementedInitializer( "transparencyd.KTEligibilityStatusReporting",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end