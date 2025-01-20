@interface CXLabeledHandle
- (TULabeledHandle)tuLabeledHandle;
@end

@implementation CXLabeledHandle

- (TULabeledHandle)tuLabeledHandle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXLabeledHandle handle](self, "handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tuHandle]);

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___TULabeledHandle);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXLabeledHandle label](self, "label"));
    v7 = -[TULabeledHandle initWithHandle:label:isSuggested:](v5, "initWithHandle:label:isSuggested:", v4, v6, 0LL);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end