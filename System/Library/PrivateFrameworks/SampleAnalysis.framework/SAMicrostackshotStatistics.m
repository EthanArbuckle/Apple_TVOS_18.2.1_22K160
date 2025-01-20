@interface SAMicrostackshotStatistics
- (SAMSTypeStats)interrupt;
- (SAMSTypeStats)io;
- (SAMSTypeStats)macf;
- (SAMSTypeStats)pmi;
- (SAMSTypeStats)timer;
- (SAMSTypeStats)total;
- (SAMSTypeStats)unknown_type;
- (SAMicrostackshotStatistics)init;
- (id)debugDescription;
- (unint64_t)bytes_microstackshots_filtered_out;
- (unint64_t)bytes_not_microstackshots;
- (unint64_t)num_microstackshots_filtered_out;
- (void)addMicro:(uint64_t)a3 task:(uint64_t)a4 thread:(uint64_t)a5 size:(uint64_t)a6 errors:;
- (void)setBytes_microstackshots_filtered_out:(unint64_t)a3;
- (void)setBytes_not_microstackshots:(unint64_t)a3;
- (void)setNum_microstackshots_filtered_out:(unint64_t)a3;
@end

@implementation SAMicrostackshotStatistics

- (SAMicrostackshotStatistics)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SAMicrostackshotStatistics;
  v2 = -[SAMicrostackshotStatistics init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    total = v2->_total;
    v2->_total = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    interrupt = v2->_interrupt;
    v2->_interrupt = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    timer = v2->_timer;
    v2->_timer = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    io = v2->_io;
    v2->_io = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    pmi = v2->_pmi;
    v2->_pmi = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    macf = v2->_macf;
    v2->_macf = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___SAMSTypeStats);
    unknown_type = v2->_unknown_type;
    v2->_unknown_type = v15;
  }

  return v2;
}

- (void)addMicro:(uint64_t)a3 task:(uint64_t)a4 thread:(uint64_t)a5 size:(uint64_t)a6 errors:
{
  if (result)
  {
    v11 = (void **)result;
    result = -[SAMSTypeStats addTask:thread:size:errors:]((void *)result[1], a3, a4, a5, a6);
    char v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 1) != 0)
    {
      result = -[SAMSTypeStats addTask:thread:size:errors:](v11[2], a3, a4, a5, a6);
      char v12 = *(_BYTE *)(a2 + 24);
      if ((v12 & 2) == 0)
      {
LABEL_4:
        if ((v12 & 8) == 0) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }

    else if ((*(_BYTE *)(a2 + 24) & 2) == 0)
    {
      goto LABEL_4;
    }

    result = -[SAMSTypeStats addTask:thread:size:errors:](v11[3], a3, a4, a5, a6);
    char v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 8) == 0)
    {
LABEL_5:
      if ((v12 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }

- (id)debugDescription
{
  v68 = (void *)NSString;
  unint64_t v3 = -[SAMSTypeStats bytes](self->_total, "bytes");
  unint64_t v4 = -[SAMSTypeStats bytes_duplicate](self->_total, "bytes_duplicate") + v3;
  unint64_t v5 = -[SAMSTypeStats bytes_out_of_order](self->_total, "bytes_out_of_order");
  unint64_t v6 = -[SAMSTypeStats bytes_missing_load_info](self->_total, "bytes_missing_load_info");
  unint64_t num_microstackshots_filtered_out = self->_num_microstackshots_filtered_out;
  unint64_t bytes_not_microstackshots = self->_bytes_not_microstackshots;
  unint64_t v67 = v4 + v5 + v6 + bytes_not_microstackshots;
  unint64_t v64 = -[SAMSTypeStats count](self->_total, "count");
  unint64_t v63 = -[SAMSTypeStats bytes](self->_total, "bytes");
  unint64_t v62 = -[SAMSTypeStats num_load_infos](self->_total, "num_load_infos");
  unint64_t v61 = -[SAMSTypeStats num_frames](self->_total, "num_frames");
  unint64_t v60 = -[SAMSTypeStats num_duplicate](self->_total, "num_duplicate");
  unint64_t v59 = -[SAMSTypeStats bytes_duplicate](self->_total, "bytes_duplicate");
  unint64_t v58 = -[SAMSTypeStats num_out_of_order](self->_total, "num_out_of_order");
  unint64_t v57 = -[SAMSTypeStats bytes_out_of_order](self->_total, "bytes_out_of_order");
  unint64_t v56 = -[SAMSTypeStats num_missing_load_info](self->_total, "num_missing_load_info");
  unint64_t v55 = -[SAMSTypeStats bytes_missing_load_info](self->_total, "bytes_missing_load_info");
  unint64_t v54 = -[SAMSTypeStats count](self->_interrupt, "count");
  unint64_t v53 = -[SAMSTypeStats bytes](self->_interrupt, "bytes");
  unint64_t v52 = -[SAMSTypeStats num_load_infos](self->_interrupt, "num_load_infos");
  unint64_t v51 = -[SAMSTypeStats num_frames](self->_interrupt, "num_frames");
  unint64_t v50 = -[SAMSTypeStats num_duplicate](self->_interrupt, "num_duplicate");
  unint64_t v49 = -[SAMSTypeStats bytes_duplicate](self->_interrupt, "bytes_duplicate");
  unint64_t v48 = -[SAMSTypeStats num_out_of_order](self->_interrupt, "num_out_of_order");
  unint64_t v47 = -[SAMSTypeStats bytes_out_of_order](self->_interrupt, "bytes_out_of_order");
  unint64_t v46 = -[SAMSTypeStats num_missing_load_info](self->_interrupt, "num_missing_load_info");
  unint64_t v45 = -[SAMSTypeStats bytes_missing_load_info](self->_interrupt, "bytes_missing_load_info");
  unint64_t v44 = -[SAMSTypeStats count](self->_timer, "count");
  unint64_t v43 = -[SAMSTypeStats bytes](self->_timer, "bytes");
  unint64_t v42 = -[SAMSTypeStats num_load_infos](self->_timer, "num_load_infos");
  unint64_t v41 = -[SAMSTypeStats num_frames](self->_timer, "num_frames");
  unint64_t v40 = -[SAMSTypeStats num_duplicate](self->_timer, "num_duplicate");
  unint64_t v39 = -[SAMSTypeStats bytes_duplicate](self->_timer, "bytes_duplicate");
  unint64_t v38 = -[SAMSTypeStats num_out_of_order](self->_timer, "num_out_of_order");
  unint64_t v37 = -[SAMSTypeStats bytes_out_of_order](self->_timer, "bytes_out_of_order");
  unint64_t v36 = -[SAMSTypeStats num_missing_load_info](self->_timer, "num_missing_load_info");
  unint64_t v35 = -[SAMSTypeStats bytes_missing_load_info](self->_timer, "bytes_missing_load_info");
  unint64_t v34 = -[SAMSTypeStats count](self->_io, "count");
  unint64_t v33 = -[SAMSTypeStats bytes](self->_io, "bytes");
  unint64_t v32 = -[SAMSTypeStats num_load_infos](self->_io, "num_load_infos");
  unint64_t v31 = -[SAMSTypeStats num_frames](self->_io, "num_frames");
  unint64_t v30 = -[SAMSTypeStats num_duplicate](self->_io, "num_duplicate");
  unint64_t v29 = -[SAMSTypeStats bytes_duplicate](self->_io, "bytes_duplicate");
  unint64_t v28 = -[SAMSTypeStats num_out_of_order](self->_io, "num_out_of_order");
  unint64_t v27 = -[SAMSTypeStats bytes_out_of_order](self->_io, "bytes_out_of_order");
  unint64_t v26 = -[SAMSTypeStats num_missing_load_info](self->_io, "num_missing_load_info");
  unint64_t v25 = -[SAMSTypeStats bytes_missing_load_info](self->_io, "bytes_missing_load_info");
  unint64_t v24 = -[SAMSTypeStats count](self->_pmi, "count");
  unint64_t v23 = -[SAMSTypeStats bytes](self->_pmi, "bytes");
  unint64_t v22 = -[SAMSTypeStats num_load_infos](self->_pmi, "num_load_infos");
  unint64_t v21 = -[SAMSTypeStats num_frames](self->_pmi, "num_frames");
  unint64_t v20 = -[SAMSTypeStats num_duplicate](self->_pmi, "num_duplicate");
  unint64_t v19 = -[SAMSTypeStats bytes_duplicate](self->_pmi, "bytes_duplicate");
  unint64_t v18 = -[SAMSTypeStats num_out_of_order](self->_pmi, "num_out_of_order");
  unint64_t v17 = -[SAMSTypeStats bytes_out_of_order](self->_pmi, "bytes_out_of_order");
  unint64_t v16 = -[SAMSTypeStats num_missing_load_info](self->_pmi, "num_missing_load_info");
  unint64_t v15 = -[SAMSTypeStats bytes_missing_load_info](self->_pmi, "bytes_missing_load_info");
  unint64_t v14 = -[SAMSTypeStats count](self->_macf, "count");
  unint64_t v13 = -[SAMSTypeStats bytes](self->_macf, "bytes");
  unint64_t v12 = -[SAMSTypeStats num_load_infos](self->_macf, "num_load_infos");
  unint64_t v11 = -[SAMSTypeStats num_frames](self->_macf, "num_frames");
  unint64_t v10 = -[SAMSTypeStats num_duplicate](self->_macf, "num_duplicate");
  unint64_t v9 = -[SAMSTypeStats bytes_duplicate](self->_macf, "bytes_duplicate");
  unint64_t v8 = -[SAMSTypeStats num_out_of_order](self->_macf, "num_out_of_order");
  -[SAMSTypeStats bytes_out_of_order](self->_macf, "bytes_out_of_order");
  -[SAMSTypeStats num_missing_load_info](self->_macf, "num_missing_load_info");
  -[SAMSTypeStats bytes_missing_load_info](self->_macf, "bytes_missing_load_info");
  -[SAMSTypeStats count](self->_unknown_type, "count");
  -[SAMSTypeStats bytes](self->_unknown_type, "bytes");
  -[SAMSTypeStats num_load_infos](self->_unknown_type, "num_load_infos");
  -[SAMSTypeStats num_frames](self->_unknown_type, "num_frames");
  -[SAMSTypeStats num_duplicate](self->_unknown_type, "num_duplicate");
  -[SAMSTypeStats bytes_duplicate](self->_unknown_type, "bytes_duplicate");
  -[SAMSTypeStats num_out_of_order](self->_unknown_type, "num_out_of_order");
  -[SAMSTypeStats bytes_out_of_order](self->_unknown_type, "bytes_out_of_order");
  -[SAMSTypeStats num_missing_load_info](self->_unknown_type, "num_missing_load_info");
  -[SAMSTypeStats bytes_missing_load_info](self->_unknown_type, "bytes_missing_load_info");
  return (id)objc_msgSend( v68,  "stringWithFormat:",  @"Microstackshot statistics:\n%llu bytes parsed (%llu bytes invalid)\n%llu filtered out\n\ntotal     count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\ninterrupt count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\ntimer     count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nio        count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\npmi       count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nmacf      count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nunknown   count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)",  v67,  bytes_not_microstackshots,  num_microstackshots_filtered_out,  v64,  v63,  v62,  v61,  v60,  v59,  v58,  v57,  v56,  v55,  v54,  v53,  v52,  v51,  v50,  v49,  v48,  v47,  v46,  v45,  v44,  v43,  v42,  v41,  v40,  v39,  v38,  v37,  v36,  v35,  v34,  v33,  v32,  v31,  v30,  v29,  v28,  v27,  v26,  v25,  v24,  v23,  v22,
               v21,
               v20,
               v19,
               v18,
               v17,
               v16,
               v15,
               v14,
               v13,
               v12,
               v11,
               v10,
               v9,
               v8);
}

- (SAMSTypeStats)total
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 8LL, 1);
}

- (SAMSTypeStats)interrupt
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 16LL, 1);
}

- (SAMSTypeStats)timer
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 24LL, 1);
}

- (SAMSTypeStats)io
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 32LL, 1);
}

- (SAMSTypeStats)pmi
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 40LL, 1);
}

- (SAMSTypeStats)macf
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 48LL, 1);
}

- (SAMSTypeStats)unknown_type
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 56LL, 1);
}

- (unint64_t)bytes_not_microstackshots
{
  return self->_bytes_not_microstackshots;
}

- (void)setBytes_not_microstackshots:(unint64_t)a3
{
  self->_unint64_t bytes_not_microstackshots = a3;
}

- (unint64_t)num_microstackshots_filtered_out
{
  return self->_num_microstackshots_filtered_out;
}

- (void)setNum_microstackshots_filtered_out:(unint64_t)a3
{
  self->_unint64_t num_microstackshots_filtered_out = a3;
}

- (unint64_t)bytes_microstackshots_filtered_out
{
  return self->_bytes_microstackshots_filtered_out;
}

- (void)setBytes_microstackshots_filtered_out:(unint64_t)a3
{
  self->_bytes_microstackshots_filtered_out = a3;
}

- (void).cxx_destruct
{
}

@end