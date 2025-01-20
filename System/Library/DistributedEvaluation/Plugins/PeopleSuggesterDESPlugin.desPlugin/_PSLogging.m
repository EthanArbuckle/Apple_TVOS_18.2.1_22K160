@interface _PSLogging
+ (id)contactEmbeddingChannel;
+ (id)coreBehaviorChannel;
+ (id)familyRecommenderChannel;
+ (id)featureGenerationChannel;
+ (id)feedbackChannel;
+ (id)generalChannel;
+ (id)heuristicsChannel;
+ (id)knnChannel;
+ (id)mediaAnalysisChannel;
+ (id)messagePinningChannel;
+ (id)rewriteChannel;
+ (id)shareExtensionChannel;
+ (id)suggestionSignpost;
@end

@implementation _PSLogging

+ (id)generalChannel
{
  if (qword_19B70 != -1) {
    dispatch_once(&qword_19B70, &stru_14378);
  }
  return (id)qword_19B78;
}

+ (id)messagePinningChannel
{
  if (qword_19B80 != -1) {
    dispatch_once(&qword_19B80, &stru_14398);
  }
  return (id)qword_19B88;
}

+ (id)familyRecommenderChannel
{
  if (qword_19B90 != -1) {
    dispatch_once(&qword_19B90, &stru_143B8);
  }
  return (id)qword_19B98;
}

+ (id)heuristicsChannel
{
  if (qword_19BA0 != -1) {
    dispatch_once(&qword_19BA0, &stru_143D8);
  }
  return (id)qword_19BA8;
}

+ (id)coreBehaviorChannel
{
  if (qword_19BB0 != -1) {
    dispatch_once(&qword_19BB0, &stru_143F8);
  }
  return (id)qword_19BB8;
}

+ (id)knnChannel
{
  if (qword_19BC0 != -1) {
    dispatch_once(&qword_19BC0, &stru_14418);
  }
  return (id)qword_19BC8;
}

+ (id)feedbackChannel
{
  if (qword_19BD0 != -1) {
    dispatch_once(&qword_19BD0, &stru_14438);
  }
  return (id)qword_19BD8;
}

+ (id)shareExtensionChannel
{
  if (qword_19BE0 != -1) {
    dispatch_once(&qword_19BE0, &stru_14458);
  }
  return (id)qword_19BE8;
}

+ (id)mediaAnalysisChannel
{
  if (qword_19BF8 != -1) {
    dispatch_once(&qword_19BF8, &stru_14478);
  }
  return (id)qword_19BF0;
}

+ (id)contactEmbeddingChannel
{
  if (qword_19C00 != -1) {
    dispatch_once(&qword_19C00, &stru_14498);
  }
  return (id)qword_19C08;
}

+ (id)featureGenerationChannel
{
  if (qword_19C10 != -1) {
    dispatch_once(&qword_19C10, &stru_144B8);
  }
  return (id)qword_19C18;
}

+ (id)rewriteChannel
{
  if (qword_19C20 != -1) {
    dispatch_once(&qword_19C20, &stru_144D8);
  }
  return (id)qword_19C28;
}

+ (id)suggestionSignpost
{
  if (qword_19C30 != -1) {
    dispatch_once(&qword_19C30, &stru_144F8);
  }
  return (id)qword_19C38;
}

@end