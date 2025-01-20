@interface FAFetchFamilyPhotoOperationContext
- (id)monogrammerWithStyle:(int64_t)a3 diameter:(double)a4;
- (id)runFetchFamilyCircleOperation:(id)a3;
- (void)runAAFamilyMemberPhotoRequest:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation FAFetchFamilyPhotoOperationContext

- (void)runAAFamilyMemberPhotoRequest:(id)a3 withCompletionHandler:(id)a4
{
}

- (id)runFetchFamilyCircleOperation:(id)a3
{
  return [a3 fetchFamilyCircle];
}

- (id)monogrammerWithStyle:(int64_t)a3 diameter:(double)a4
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2050000000LL;
  v6 = (void *)qword_100052750;
  uint64_t v13 = qword_100052750;
  if (!qword_100052750)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001A5E0;
    v9[3] = &unk_100041970;
    v9[4] = &v10;
    sub_10001A5E0((uint64_t)v9);
    v6 = (void *)v11[3];
  }

  v7 = v6;
  _Block_object_dispose(&v10, 8);
  return [[v7 alloc] initWithStyle:a3 diameter:a4];
}

@end