@interface WFToolKitTypedValueContent
- (void)resolveWithVariableSource:(WFVariableDataSource *)a3 completionHandler:(id)a4;
@end

@implementation WFToolKitTypedValueContent

- (void)resolveWithVariableSource:(WFVariableDataSource *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_100066E60, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_100047AE8();
}

@end