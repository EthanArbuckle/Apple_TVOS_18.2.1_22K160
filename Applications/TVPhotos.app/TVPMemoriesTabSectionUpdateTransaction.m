@interface TVPMemoriesTabSectionUpdateTransaction
- (PXArrayChangeDetails)changeDetails;
- (TVPMemoriesTabSectionUpdateTransaction)initWithSectionIndex:(int64_t)a3 changeDetails:(id)a4 completion:(id)a5;
- (id)completion;
- (int64_t)sectionIndex;
- (void)commit;
@end

@implementation TVPMemoriesTabSectionUpdateTransaction

- (TVPMemoriesTabSectionUpdateTransaction)initWithSectionIndex:(int64_t)a3 changeDetails:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabSectionUpdateTransaction;
  v11 = -[TVPMemoriesTabSectionUpdateTransaction init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    if (!v10) {
      sub_100079B60();
    }
    v11->_sectionIndex = a3;
    objc_storeStrong((id *)&v11->_changeDetails, a4);
    id v13 = [v10 copy];
    id completion = v12->_completion;
    v12->_id completion = v13;
  }

  return v12;
}

- (void)commit
{
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSectionUpdateTransaction completion](self, "completion"));
  v2[2]();
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (PXArrayChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
}

@end