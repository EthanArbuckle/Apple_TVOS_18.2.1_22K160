@interface PBSDisplayMode
- (id)tvda_localizedStringForChange:(int64_t)a3 detailedFormat:(BOOL)a4;
@end

@implementation PBSDisplayMode

- (id)tvda_localizedStringForChange:(int64_t)a3 detailedFormat:(BOOL)a4
{
  v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  BOOL v15 = a4;
  id v14 = objc_retainBlock(&stru_100028F60);
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_1000117F8;
  v11 = &unk_100028F88;
  v12 = v18;
  id v13 = objc_retainBlock(&v7);
  id v6 = 0LL;
  if (v16 <= 3) {
    __asm { BR              X8 }
  }

  id v5 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v14, 0LL);
  return v5;
}

@end