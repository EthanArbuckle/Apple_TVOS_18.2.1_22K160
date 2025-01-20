@interface TVSSFaceTimeCallSummaryContent
- (TVSSFaceTimeCallSummaryContent)initWithBackingStore:(id)a3;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSFaceTimeCallSummaryContent

- (TVSSFaceTimeCallSummaryContent)initWithBackingStore:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = [location[0] joinedConversation];
  id v6 = [v15 mergedActiveRemoteParticipants];
  id v7 = [v6 count];

  v14[1] = v7;
  id v8 = TVSSLocalizablePlurals(@"FaceTimeConversationParticipantsCountFormat");
  v14[0] = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7);

  else {
    v3 = @"shareplay";
  }
  id v13 = v3;
  v9 = v17;
  id v11 = [v15 displayName];
  id v10 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v13);
  v17 = 0LL;
  v12.receiver = v9;
  v12.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeCallSummaryContent;
  v17 = -[TVSSFaceTimeCallSummaryContent initWithTitle:image:text1:](&v12, "initWithTitle:image:text1:", v11);
  objc_storeStrong((id *)&v17, v17);

  if (v17) {
    objc_storeStrong((id *)&v17->_backingStore, location[0]);
  }
  v5 = v17;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSFaceTimeCallSummaryContent initWithBackingStore:]( +[TVSSFaceTimeCallSummaryContent allocWithZone:]( &OBJC_CLASS___TVSSFaceTimeCallSummaryContent,  "allocWithZone:",  a3),  "initWithBackingStore:",  self->_backingStore);
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (void).cxx_destruct
{
}

@end