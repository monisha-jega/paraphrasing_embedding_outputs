######################################################################################
 ######################################################################################
 ######################################################################################
 # BILINGUAL PIVOTING - VMF
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 # ENGLISH to FRENCH
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -decode_loss cosine\
             -model ../../dump/enfrvmf/vmf_step_50000.pt\
             -src ../../data/kumarvon2018-data/fren/tst201516.tok.true.en\
             -output ../../dump/enfrvmf/bp/iwslt/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 
 # FRENCH TO ENGLISH
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -decode_loss cosine\
             -model ../../dump/frenvmf/vmf_step_50000.pt\
             -src ../../dump/enfrvmf/predictions\
             -output ../../dump/frenvmf/bp/iwslt/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 
 
 ######################################################################################
 ######################################################################################
 ######################################################################################
 # BILINGUAL PIVOTING - CE
 ######################################################################################
 ######################################################################################
 ######################################################################################
 
 # ENGLISH to FRENCH
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -model ../../dump/enfrce/vmf_step_50000.pt\
             -src ../../data/kumarvon2018-data/fren/tst201516.tok.true.en\
             -output ../../dump/enfrce/bp/iwslt/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0
 
 # FRENCH TO ENGLISH
 
 cd orig_seq2seq-con-trans/OpenNMT-py
 
 python -u translate.py\
             -model ../../dump/frence/vmf_step_50000.pt\
             -src ../../dump/enfrce/predictions\
             -output ../../dump/frence/bp/iwslt/predictions\
             -batch_size 4000\
             -batch_type tokens\
             -beam_size 1\
             -replace_unk\
             -gpu 0