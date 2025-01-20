@interface SAStructuredDictationAddressResult
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
@end

@implementation SAStructuredDictationAddressResult

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  v3 = self;
  id v4 = objc_alloc_init(&OBJC_CLASS___STSiriLocation);
  [v4 setResultType:3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationAddressResult forwardGeoProtobuf](v3, "forwardGeoProtobuf"));
  [v4 setGeoResult:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationAddressResult contactId](v3, "contactId"));
  [v4 setAddressBookID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationAddressResult addressLabel](v3, "addressLabel"));
  [v4 setAddressLabel:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationAddressResult contactName](v3, "contactName"));
  [v4 setContactName:v8];

  return v4;
}

@end