@interface MADDeferredProcessingEntry
+ (id)entryWithLocalIdentifier:(id)a3 requestDate:(id)a4;
- (MADDeferredProcessingEntry)initWithLocalIdentifier:(id)a3 requestDate:(id)a4;
- (NSDate)requestDate;
- (NSString)localIdentifier;
- (void)setLocalIdentifier:(id)a3;
- (void)setRequestDate:(id)a3;
@end

@implementation MADDeferredProcessingEntry

- (MADDeferredProcessingEntry)initWithLocalIdentifier:(id)a3 requestDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADDeferredProcessingEntry;
  v9 = -[MADDeferredProcessingEntry init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localIdentifier, a3);
    objc_storeStrong((id *)&v10->_requestDate, a4);
  }

  return v10;
}

+ (id)entryWithLocalIdentifier:(id)a3 requestDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithLocalIdentifier:v7 requestDate:v6];

  return v8;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end