@interface UIAlertController
+ (id)controllerForDeletingStation:(id)a3 fromLibrary:(id)a4 deletionCompletion:(id)a5;
@end

@implementation UIAlertController

+ (id)controllerForDeletingStation:(id)a3 fromLibrary:(id)a4 deletionCompletion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject(&unk_100246300, 24LL, 7LL);
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  id v11 = sub_1001278C4(v9, v10, (uint64_t)sub_1001278BC, v8);

  swift_release(v8);
  return v11;
}

@end