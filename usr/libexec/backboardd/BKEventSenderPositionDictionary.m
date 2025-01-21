@interface BKEventSenderPositionDictionary
- (id)description;
@end

@implementation BKEventSenderPositionDictionary

- (id)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void).cxx_destruct
{
}

@end