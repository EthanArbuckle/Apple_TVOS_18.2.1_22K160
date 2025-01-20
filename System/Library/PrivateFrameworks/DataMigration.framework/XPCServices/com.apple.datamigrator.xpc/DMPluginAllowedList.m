@interface DMPluginAllowedList
- (id)concurrentUserSpecificPluginSpecifiers;
- (id)orderedUserAgnosticPluginSpecifiers;
- (id)orderedUserSpecificPluginSpecifiers;
@end

@implementation DMPluginAllowedList

- (id)orderedUserAgnosticPluginSpecifiers
{
  if (qword_10002CC00 != -1) {
    dispatch_once(&qword_10002CC00, &stru_100020A58);
  }
  return (id)qword_10002CBF8;
}

- (id)orderedUserSpecificPluginSpecifiers
{
  if (qword_10002CC10 != -1) {
    dispatch_once(&qword_10002CC10, &stru_100020A78);
  }
  return (id)qword_10002CC08;
}

- (id)concurrentUserSpecificPluginSpecifiers
{
  if (qword_10002CC20 != -1) {
    dispatch_once(&qword_10002CC20, &stru_100020A98);
  }
  return (id)qword_10002CC18;
}

@end