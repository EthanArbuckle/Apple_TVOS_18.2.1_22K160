int64_t sub_100003518(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  DEAttachmentItem *v4;
  void *v5;
  void *v6;
  id v7;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](a3, "modificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](v4, "modificationDate"));

  v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}