@interface MPSectionedCollection
- (void)tvm_enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)tvm_enumerateItemsUsingBlock:(id)a3;
- (void)tvm_enumerateSectionsUsingBlock:(id)a3;
@end

@implementation MPSectionedCollection

- (void)tvm_enumerateSectionsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E2138;
  v5[3] = &unk_1002443E8;
  id v6 = a3;
  id v4 = v6;
  -[MPSectionedCollection enumerateSectionsUsingBlock:](self, "enumerateSectionsUsingBlock:", v5);
}

- (void)tvm_enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E224C;
  v7[3] = &unk_1002443E8;
  id v8 = a4;
  id v6 = v8;
  -[MPSectionedCollection enumerateItemsInSectionAtIndex:usingBlock:]( self,  "enumerateItemsInSectionAtIndex:usingBlock:",  a3,  v7);
}

- (void)tvm_enumerateItemsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E2358;
  v5[3] = &unk_100244410;
  id v6 = a3;
  id v4 = v6;
  -[MPSectionedCollection enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v5);
}

@end